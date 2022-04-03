--- ============================ HEADER ============================
--- ======= LOCALIZE =======
-- Addon
local addonName, addonTable = ...
-- HeroDBC
local DBC = HeroDBC.DBC
-- HeroLib
local HL = HeroLib
local Cache = HeroCache
local Unit = HL.Unit
local Player = Unit.Player
local Target = Unit.Target
local Spell = HL.Spell
local MultiSpell = HL.MultiSpell
local Item = HL.Item
-- HeroRotation
local HR = HeroRotation
local AoEON = HR.AoEON
local CDsON = HR.CDsON
local CovenantsON = HeroRotationCharDB.Toggles[4]
local SmallCDsOn = HeroRotationCharDB.Toggles[5]
local Opener = HeroRotationCharDB.Toggles[6]
local StopAutoSwap = HeroRotationCharDB.Toggles[12]
local UsePots = HeroRotationCharDB.Toggles[15]
local HoldVanish = HeroRotationCharDB.Toggles[21]
local HoldKillingSpree = HeroRotationCharDB.Toggles[52]
local QCheapShot = HeroRotationCharDB.Toggles[22]
local QKidneyShot = HeroRotationCharDB.Toggles[23]
local QBlind = HeroRotationCharDB.Toggles[24]
local QSap = HeroRotationCharDB.Toggles[25]
local QFeint = HeroRotationCharDB.Toggles[27]
local QGouge = HeroRotationCharDB.Toggles[50]
local BRmeleeOnly = HeroRotationCharDB.Toggles[51]
local QGraplingHook = HeroRotationCharDB.Toggles[53]
local QRacial = HeroRotationCharDB.Toggles[30]
local HoldShiv = HeroRotationCharDB.Toggles[54]
local QuakingR = 0

-- Lua
local mathmin = math.min
local mathabs = math.abs

--Resets
local starttime = nil
local endtime = nil

local TopTrinketID = GetInventoryItemID("player", 13)
local BotTrinketID = GetInventoryItemID("player", 14)
--- ============================ CONTENT ============================
--- ======= APL LOCALS =======
-- Commons
local Everyone = HR.Commons.Everyone
local Rogue = HR.Commons.Rogue

-- GUI Settings
local Settings = {
  General = HR.GUISettings.General,
  Commons = HR.GUISettings.APL.Rogue.Commons,
  Commons2 = HR.GUISettings.APL.Rogue.Commons2,
  Outlaw = HR.GUISettings.APL.Rogue.Outlaw,
}

-- Define S/I for spell and item arrays
local S = Spell.Rogue.Outlaw
local I = Item.Rogue.Outlaw

-- Create table to exclude above trinkets from On Use function
local OnUseExcludes = {
  I.ComputationDevice:ID(),
  I.VigorTrinket:ID(),
  I.FontOfPower:ID(),
  I.RazorCoral:ID(),
  I.CacheOfAcquiredTreasures:ID(),
  I.MistcallerOcarina:ID()
}

S.Dispatch:RegisterDamageFormula(
  -- Dispatch DMG Formula (Pre-Mitigation):
  --- Player Modifier
    -- AP * CP * EviscR1_APCoef * Aura_M * NS_M * DS_M * DSh_M * SoD_M * Finality_M * Mastery_M * Versa_M
  --- Target Modifier
    -- Ghostly_M * Sinful_M
  function ()
    return
      --- Player Modifier
        -- Attack Power
        Player:AttackPowerDamageMod() *
        -- Combo Points
        Rogue.CPSpend() *
        -- Eviscerate R1 AP Coef
        0.35 *
        -- Aura Multiplier (SpellID: 137036)
        1.13 *
        -- Versatility Damage Multiplier
        (1 + Player:VersatilityDmgPct() / 100) *
      --- Target Modifier
        -- Ghostly Strike Multiplier
        (Target:DebuffUp(S.GhostlyStrike) and 1.1 or 1) *
        -- Sinful Revelation Enchant
        (Target:DebuffUp(S.SinfulRevelationDebuff) and 1.06 or 1)
  end
)

-- Rotation Var
local Enemies30y, EnemiesBF, EnemiesBFCount
local ShouldReturn; -- Used to get the return string
local shouldcast = Rogue.ReturnSpell()
local MOshouldcast = Rogue.ReturnSpellMO()
local BladeFlurryRange = 6
local BetweenTheEyesDMGThreshold
local EffectiveComboPoints, ComboPoints, ComboPointsDeficit
local Interrupts = {
  { S.Blind, "Cast Blind (Interrupt)", function () return true end },
}

-- Legendaries
local TinyToxicBladeEquipped = Player:HasLegendaryEquipped(116)
local MarkoftheMasterAssassinEquipped = Player:HasLegendaryEquipped(117)
local DeathlyShadowsEquipped = Player:HasLegendaryEquipped(129)
local InvigoratingShdowdustEquipped = Player:HasLegendaryEquipped(114)

HL:RegisterForEvent(function()
  DeathlyShadowsEquipped = Player:HasLegendaryEquipped(129)
  TinyToxicBladeEquipped = Player:HasLegendaryEquipped(116)
  MarkoftheMasterAssassinEquipped = Player:HasLegendaryEquipped(117)
  InvigoratingShdowdustEquipped = Player:HasLegendaryEquipped(114)
end, "PLAYER_EQUIPMENT_CHANGED")

-- Covenant
local Covenant = Player:Covenant()
HL:RegisterForEvent(function()
  Covenant = Player:Covenant()
end, "COVENANT_CHOSEN")

-- Utils
local function num(val)
  if val then return 1 else return 0 end
end

-- Stable Energy Prediction
local PrevEnergyTimeToMaxPredicted, PrevEnergyPredicted = 0, 0
local function EnergyTimeToMaxStable ()
  local EnergyTimeToMaxPredicted = Player:EnergyTimeToMaxPredicted()
  if mathabs(PrevEnergyTimeToMaxPredicted - EnergyTimeToMaxPredicted) > 1 then
    PrevEnergyTimeToMaxPredicted = EnergyTimeToMaxPredicted
  end
  return PrevEnergyTimeToMaxPredicted
end
local function EnergyPredictedStable ()
  local EnergyPredicted = Player:EnergyPredicted()
  if mathabs(PrevEnergyPredicted - EnergyPredicted) > 9 then
    PrevEnergyPredicted = EnergyPredicted
  end
  return PrevEnergyPredicted
end

local function EffectiveComboPointsCalc(ComboPoints)
    EffectiveComboPoints = ComboPoints
	if ((ComboPoints == 2 and Player:BuffUp(S.EchoingReprimand2))
    or (ComboPoints == 3 and Player:BuffUp(S.EchoingReprimand3))
    or (ComboPoints == 4 and Player:BuffUp(S.EchoingReprimand4))
    or (ComboPoints == 5 and Player:BuffUp(S.EchoingReprimand5))) then
      EffectiveComboPoints = 7
	  return 7
	else
		EffectiveComboPoints = ComboPoints
		return ComboPoints
    end
	
  local MHAttkspeed, OFAttkSpeed = UnitAttackSpeed("unit");
  local AvrgAttkspeed = (MHAttkspeed + OFAttkSpeed) / 2
  local estTTNA = AvrgAttkspeed / 2
  local TimeToSht4 = (4 - meleeswings) * estTTNA
  local TimeToSht5 = (5 - meleeswings) * estTTNA

  -- Adjust Animacharged CP Prediction for Shadow Techniques
  -- If we are on a non-optimal Animacharged CP, ignore it if the time to ShT is less than GCD + 500ms, unless the ER buff will expire soon
  -- Reduces the risk of queued finishers into ShT procs for non-optimal CP amounts
  -- This is an adaptation of the following APL lines:
  -- actions+=/variable,name=is_next_cp_animacharged,if=covenant.kyrian,value=combo_points=1&buff.echoing_reprimand_2.up|combo_points=2&buff.echoing_reprimand_3.up|combo_points=3&buff.echoing_reprimand_4.up|combo_points=4&buff.echoing_reprimand_5.up
  -- actions+=/variable,name=effective_combo_points,value=effective_combo_points
  -- actions+=/variable,name=effective_combo_points,if=covenant.kyrian&effective_combo_points>combo_points&combo_points.deficit>2&time_to_sht.4.plus<0.5&!variable.is_next_cp_animacharged,value=combo_points
  if EffectiveComboPoints > ComboPoints and ComboPointsDeficit > 2 and Player:AffectingCombat() then    
	if ComboPoints == 2 and not Player:BuffUp(S.EchoingReprimand3)
    or ComboPoints == 3 and not Player:BuffUp(S.EchoingReprimand4)
    or ComboPoints == 4 and not Player:BuffUp(S.EchoingReprimand5) then
      local TimeToSht = TimeToSht4
      if TimeToSht == 0 then TimeToSht = TimeToSht5 end
      if TimeToSht < (mathmax(Player:EnergyTimeToX(35), Player:GCDRemains()) + 0.5) then
        EffectiveComboPoints = ComboPoints
      end
    end
  end  
  end
  
-- Marked for Death Cycle Targets
-- actions.cds+=/marked_for_death,target_if=min:target.time_to_die,if=raid_event.adds.up&(target.time_to_die<combo_points.deficit|!stealthed.rogue&combo_points.deficit>=cp_max_spend-1)
local function EvaluateMfDTargetIfConditionCondition(TargetUnit)
  return TargetUnit:TimeToDie()
end
local function EvaluateMfDCondition(TargetUnit)
  -- Note: Increased the SimC condition by 50% since we are slower.
     if ((TargetUnit:FilteredTimeToDie("<", Player:ComboPointsDeficit()*1.5) or (not Player:StealthUp(true, false) and Player:ComboPointsDeficit() >= Rogue.CPMaxSpend() - 1)) and TargetUnit:GUID() == Unit("mouseover"):GUID() and Settings.Outlaw.TargetSwap == "Mouseover") then
		MOshouldcast = 1376195
		return true
	elseif ((TargetUnit:FilteredTimeToDie("<", Player:ComboPointsDeficit()*1.5) or (not Player:StealthUp(true, false) and Player:ComboPointsDeficit() >= Rogue.CPMaxSpend() - 1)) and Settings.Outlaw.TargetSwap == "AutoSwap" and TargetUnit:GUID() ~= Target:GUID() and not StopAutoSwap) then
		MOshouldcast = 999
		return true
	elseif ((TargetUnit:FilteredTimeToDie("<", Player:ComboPointsDeficit()*1.5) or (not Player:StealthUp(true, false) and Player:ComboPointsDeficit() >= Rogue.CPMaxSpend() - 1)) and TargetUnit:GUID() == Target:GUID()) then
		shouldcast = 137619
		return true
	elseif TargetUnit:FilteredTimeToDie("<", Player:ComboPointsDeficit()*1.5) or (not Player:StealthUp(true, false) and Player:ComboPointsDeficit() >= Rogue.CPMaxSpend() - 1) then
		return true
	end
end

--- ======= ACTION LISTS =======
local RtB_BuffsList = {
  S.Broadside,
  S.BuriedTreasure,
  S.GrandMelee,
  S.RuthlessPrecision,
  S.SkullandCrossbones,
  S.TrueBearing
}
local function RtB_List (Type, List)
  if not Cache.APLVar.RtB_List then Cache.APLVar.RtB_List = {} end
  if not Cache.APLVar.RtB_List[Type] then Cache.APLVar.RtB_List[Type] = {} end
  local Sequence = table.concat(List)
  -- All
  if Type == "All" then
    if not Cache.APLVar.RtB_List[Type][Sequence] then
      local Count = 0
      for i = 1, #List do
        if Player:BuffUp(RtB_BuffsList[List[i]]) then
          Count = Count + 1
        end
      end
      Cache.APLVar.RtB_List[Type][Sequence] = Count == #List and true or false
    end
  -- Any
  else
    if not Cache.APLVar.RtB_List[Type][Sequence] then
      Cache.APLVar.RtB_List[Type][Sequence] = false
      for i = 1, #List do
        if Player:BuffUp(RtB_BuffsList[List[i]]) then
          Cache.APLVar.RtB_List[Type][Sequence] = true
          break
        end
      end
    end
  end
  return Cache.APLVar.RtB_List[Type][Sequence]
end
-- Get the number of Roll the Bones buffs currently on
local function RtB_Buffs ()
  if not Cache.APLVar.RtB_Buffs then
    Cache.APLVar.RtB_Buffs = 0
    for i = 1, #RtB_BuffsList do
      if Player:BuffUp(RtB_BuffsList[i]) then
        Cache.APLVar.RtB_Buffs = Cache.APLVar.RtB_Buffs + 1
      end
    end
  end
  return Cache.APLVar.RtB_Buffs
end
-- RtB rerolling strategy, return true if we should reroll
local function RtB_Reroll ()
  if not Cache.APLVar.RtB_Reroll then
    -- 1+ Buff
    if Settings.Outlaw.RolltheBonesLogic == "1+ Buff" then
      Cache.APLVar.RtB_Reroll = (RtB_Buffs() <= 0) and true or false
    -- Broadside
    elseif Settings.Outlaw.RolltheBonesLogic == "Broadside" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.Broadside)) and true or false
    -- Buried Treasure
    elseif Settings.Outlaw.RolltheBonesLogic == "Buried Treasure" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.BuriedTreasure)) and true or false
    -- Grand Melee
    elseif Settings.Outlaw.RolltheBonesLogic == "Grand Melee" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.GrandMelee)) and true or false
    -- Skull and Crossbones
    elseif Settings.Outlaw.RolltheBonesLogic == "Skull and Crossbones" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.SkullandCrossbones)) and true or false
    -- Ruthless Precision
    elseif Settings.Outlaw.RolltheBonesLogic == "Ruthless Precision" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.RuthlessPrecision)) and true or false
    -- True Bearing
    elseif Settings.Outlaw.RolltheBonesLogic == "True Bearing" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.TrueBearing)) and true or false
    -- SimC Default
    else
      -- # Reroll single buffs early other than True Bearing and Broadside
      -- actions+=/variable,name=rtb_reroll,value=rtb_buffs<2&(!buff.true_bearing.up&!buff.broadside.up)
      Cache.APLVar.RtB_Reroll = (RtB_Buffs() < 2 and (not Player:BuffUp(S.TrueBearing) and not Player:BuffUp(S.Broadside))) and true or false
    end

    -- Defensive Override : Grand Melee if HP < 60
    if Everyone.IsSoloMode() then
      if Player:BuffUp(S.GrandMelee) then
        if Player:IsTanking(Target) or Player:HealthPercentage() < mathmin(Settings.Outlaw.RolltheBonesLeechKeepHP, Settings.Outlaw.RolltheBonesLeechRerollHP) then
          Cache.APLVar.RtB_Reroll = false
        end
      elseif Player:HealthPercentage() < Settings.Outlaw.RolltheBonesLeechRerollHP then
        Cache.APLVar.RtB_Reroll = true
      end
    end
  end

  return Cache.APLVar.RtB_Reroll
end

-- # Finish at maximum CP but avoid wasting Broadside and Quick Draw bonus combo points
local function Finish_Condition ()
  -- actions+=/variable,name=finish_condition,value=combo_points>=cp_max_spend-buff.broadside.up-(buff.opportunity.up*talent.quick_draw.enabled)|effective_combo_points>=cp_max_spend
  -- actions+=/variable,name=finish_condition,op=reset,if=cooldown.between_the_eyes.ready&effective_combo_points<5
  if S.BetweentheEyes:CooldownUp() and EffectiveComboPoints < 5 then
    return false
  end
  
  return ComboPoints >= (Rogue.CPMaxSpend() - num(Player:BuffUp(S.Broadside)) - (num(Player:BuffUp(S.Opportunity)) * num(S.QuickDraw:IsAvailable())))
    or EffectiveComboPoints >= Rogue.CPMaxSpend()
end

-- # Ensure we get full Ambush CP gains and aren't rerolling Count the Odds buffs away
local function Ambush_Condition ()
  -- actions+=/variable,name=ambush_condition,value=combo_points.deficit>=2+buff.broadside.up&energy>=50&(!conduit.count_the_odds|buff.roll_the_bones.remains>=10)
  return ComboPointsDeficit >= 2 + num(Player:BuffUp(S.Broadside)) and EffectiveComboPoints < Rogue.CPMaxSpend()
    and EnergyPredictedStable() > 50 and (not S.CountTheOdds:ConduitEnabled() or Rogue.RtBRemains() > 10)
end
-- # With multiple targets, this variable is checked to decide whether some CDs should be synced with Blade Flurry
-- actions+=/variable,name=blade_flurry_sync,value=spell_targets.blade_flurry<2&raid_event.adds.in>20|buff.blade_flurry.remains>1+talent.killing_spree.enabled
local function Blade_Flurry_Sync ()
  return not AoEON() or EnemiesBFCount < 2 or (Player:BuffRemains(S.BladeFlurry) > 1 + num(S.KillingSpree:IsAvailable()))
end

local function Vanish_DPS_Condition()
  return Settings.Commons.VanishOffensive and CDsON() and not (Everyone.IsSoloMode() and Player:IsTanking(Target))
end

local function CDs ()
  -- actions.cds+=/blade_flurry,if=spell_targets>=2&!buff.blade_flurry.up
  if S.BladeFlurry:IsReady() and AoEON() and EnemiesBFCount >= 2 and not Player:BuffUp(S.BladeFlurry) then
      if HR.Cast(S.BladeFlurry) then shouldcast = 13877 return "Cast Blade Flurry" end
  end
  
  if Target:IsSpellInRange(S.SinisterStrike) then
    -- # Using Ambush is a 2% increase, so Vanish can be sometimes be used as a utility spell unless using Master Assassin or Deathly Shadows
    if S.Vanish:IsCastable() and Vanish_DPS_Condition() and not Player:StealthUp(true, true) then
      if not MarkoftheMasterAssassinEquipped then
        -- actions.cds+=/vanish,if=!runeforge.mark_of_the_master_assassin&!stealthed.all&variable.ambush_condition&(!runeforge.deathly_shadows|buff.deathly_shadows.down&combo_points<=2)
		-- actions.cds+=/vanish,if=!runeforge.mark_of_the_master_assassin&!runeforge.invigorating_shadowdust&!stealthed.all&variable.ambush_condition&(!runeforge.deathly_shadows|buff.deathly_shadows.down&combo_points<=2)
        if Ambush_Condition() and not HoldVanish and not MarkoftheMasterAssassinEquipped and not InvigoratingShdowdustEquipped and Ambush_Condition()  and not Player:StealthUp(true, true)
		and (not DeathlyShadowsEquipped or (Player:BuffDown(S.DeathlyShadowsBuff) and ComboPoints <= 2)) then
            if HR.Cast(S.Vanish, nil) then shouldcast = 1856 return "Cast Vanish" end
        end
      else
        -- actions.cds+=/variable,name=vanish_ma_condition,if=runeforge.mark_of_the_master_assassin&!talent.marked_for_death.enabled,value=(!cooldown.between_the_eyes.ready&variable.finish_condition)|(cooldown.between_the_eyes.ready&variable.ambush_condition)
        -- actions.cds+=/variable,name=vanish_ma_condition,if=runeforge.mark_of_the_master_assassin&talent.marked_for_death.enabled,value=variable.finish_condition
        -- actions.cds+=/vanish,if=variable.vanish_ma_condition&master_assassin_remains=0&variable.blade_flurry_sync
        if Rogue.MasterAssassinsMarkRemains() <= 0 and MarkoftheMasterAssassinEquipped and not HoldVanish and Settings.Commons.VanishOffensive and Blade_Flurry_Sync() then
          if S.MarkedforDeath:IsAvailable() then
            if Finish_Condition() then
              if HR.Cast(S.Vanish, nil) then shouldcast = 1856 return "Cast Vanish (MA+MfD)" end
            end
          else
            if not HoldVanish  and MarkoftheMasterAssassinEquipped and Settings.Commons.VanishOffensive (not S.BetweentheEyes:CooldownUp() and Finish_Condition() or S.BetweentheEyes:CooldownUp() and Ambush_Condition()) then
              if HR.Cast(S.Vanish, nil) then shouldcast = 1856 return "Cast Vanish (MA)" end
            end
          end
        end
      end
    end
    -- actions.cds+=/adrenaline_rush,if=!buff.adrenaline_rush.up
    if CDsON() and S.AdrenalineRush:IsCastable() and not Player:BuffUp(S.AdrenalineRush) then
      if HR.Cast(S.AdrenalineRush, nil) then  shouldcast = 13750 return "Cast Adrenaline Rush" end
    end
    -- actions.cds+=/fleshcraft,if=(soulbind.pustule_eruption|soulbind.volatile_solvent)&!stealthed.all&(!buff.blade_flurry.up|spell_targets.blade_flurry<2)&(!buff.adrenaline_rush.up|energy.time_to_max>2)
    if S.Fleshcraft:IsCastable() and (QuakingR == 0 or QuakingR > S.Fleshcraft:ExecuteTime()) and CovenantsON and Settings.Outlaw.CastCancelFC   and not Player:StealthUp(true, true) and (S.PustuleEruption:SoulbindEnabled() or S.VolatileSolvent:SoulbindEnabled())
      and (not Player:BuffUp(S.BladeFlurry) or EnemiesBFCount < 2) and (not Player:BuffUp(S.AdrenalineRush) or EnergyTimeToMaxStable() > 2) then
		if HR.Cast(S.Fleshcraft, nil) then  shouldcast = 324631 return "Cast Fleashcraft" end
    end
    -- actions.cds+=/flagellation,if=!stealthed.all&(variable.finish_condition|target.time_to_die<13)
    if CDsON() and S.Flagellation:IsReady() and CovenantsON  and not Player:StealthUp(true, true) and not Target:DebuffUp(S.Flagellation) and (Finish_Condition() or(Target:FilteredTimeToDie(">", 12) or Target:IsInBossList())) then
      if HR.Cast(S.Flagellation, nil, nil) then shouldcast = 323654 return "Cast Flagellation" end
    end
    -- actions.cds+=/dreadblades,if=!stealthed.all&combo_points<=2&(!covenant.venthyr|debuff.flagellation.up)&(!talent.marked_for_death|!cooldown.marked_for_death.ready)
    if S.Dreadblades:IsReady() and Target:IsSpellInRange(S.Dreadblades) and not Player:StealthUp(true, true) and ComboPoints <= 2 
      and (Covenant ~= "Venthyr" or S.Flagellation:AnyDebuffUp()) and (not S.MarkedforDeath:IsAvailable() or S.MarkedforDeath:CooldownRemains() > 0) then
		if HR.Cast(S.Dreadblades, nil) then shouldcast = 343142 return "Cast Dreadblades" end
    end
    -- actions.cds+=/roll_the_bones,if=master_assassin_remains=0&buff.dreadblades.down&(buff.roll_the_bones.remains<=3|variable.rtb_reroll)
    if S.RolltheBones:IsReady() and Rogue.MasterAssassinsMarkRemains() <= 0 and not Player:BuffUp(S.Dreadblades) and (Rogue.RtBRemains() <= 3 or RtB_Reroll()) then
      if HR.Cast(S.RolltheBones) then  shouldcast = 315508 return "Cast Roll the Bones" end
    end
  end
  if Blade_Flurry_Sync() then
    -- # Attempt to sync Killing Spree with Vanish for Master Assassin
    -- actions.cds+=/variable,name=killing_spree_vanish_sync,value=!runeforge.mark_of_the_master_assassin|cooldown.vanish.remains>10|master_assassin_remains>2
    -- # Use in 1-2T if BtE is up and won't cap Energy, or at 3T+ (2T+ with Deathly Shadows) or when Master Assassin is up.
	-- actions.cds+=/killing_spree,if=variable.blade_flurry_sync&variable.killing_spree_vanish_sync&!stealthed.rogue&(debuff.between_the_eyes.up&buff.dreadblades.down&energy.deficit>(energy.regen*2+15)|spell_targets.blade_flurry>(2-buff.deathly_shadows.up)|master_assassin_remains>0)

    if CDsON() and not HoldKillingSpree and S.KillingSpree:IsCastable() and Target:IsSpellInRange(S.KillingSpree) and not Player:StealthUp(true, false)
        and (not MarkoftheMasterAssassinEquipped or S.Vanish:CooldownRemains() > 10 or Rogue.MasterAssassinsMarkRemains() > 2)
        and (Target:DebuffUp(S.BetweentheEyes) and not Player:BuffUp(S.Dreadblades) and Player:EnergyDeficitPredicted() > (Player:EnergyRegen() * 2 + 10)
          or EnemiesBFCount > (2 - num(Player:BuffUp(S.DeathlyShadowsBuff))) or Rogue.MasterAssassinsMarkRemains() > 0) then
      if HR.Cast(S.KillingSpree, nil, nil) then shouldcast = 51690 return "Cast Killing Spree" end
    end
      -- actions.cds+=/blade_rush,if=variable.blade_flurry_sync&(energy.time_to_max>2&buff.dreadblades.down|energy<=30|spell_targets>2)
      if S.BladeRush:IsCastable() and Target:IsSpellInRange(S.BladeRush) and (Target:IsInRange(5) or not BRmeleeOnly) and (EnergyTimeToMaxStable() > 2 and not Player:BuffUp(S.Dreadblades)
		or EnergyPredictedStable() <= 30 or EnemiesBFCount > 2) then
		  if HR.Cast(S.BladeRush, nil) then  shouldcast = 271877 return "Cast Blade Rush" end
    end
  end
  if Target:IsSpellInRange(S.SinisterStrike) then
    if CDsON() then

	--actions.cds+=/vanish,if=runeforge.invigorating_shadowdust&covenant.venthyr&!stealthed.all&variable.ambush_condition&(!cooldown.flagellation.ready&(!talent.dreadblades|!cooldown.dreadblades.ready|!debuff.flagellation.up))
    if S.Vanish:IsCastable() and Settings.Commons.VanishOffensive and InvigoratingShdowdustEquipped and S.Flagellation:IsAvailable() and not Player:StealthUp(true, true) and (S.Flagellation:CooldownRemains() > 0 and (not S.Dreadblades:IsAvailable() or S.Dreadblades:CooldownRemains() > 0 or not S.Flagellation:AnyDebuffUp())) then
	  if HR.Cast(S.Vanish, nil) then shouldcast = 1856 return "Cast w/ InvigoratingShdowdustEquipped - Venth" end
	end
	--actions.cds+=/vanish,if=runeforge.invigorating_shadowdust&!covenant.venthyr&!stealthed.all&(cooldown.echoing_reprimand.remains>6|!cooldown.sepsis.ready|cooldown.serrated_bone_spike.full_recharge_time>20)
	if S.Vanish:IsCastable() and Settings.Commons.VanishOffensive and InvigoratingShdowdustEquipped and not S.Flagellation:IsAvailable() and not Player:StealthUp(true, true) and (S.EchoingReprimand:CooldownRemains() > 6 or not S.Sepsis:CooldownUp() or S.SerratedBoneSpike:FullRechargeTime() > 20) then
	  if HR.Cast(S.Vanish, nil) then shouldcast = 1856 return "Cast w/ InvigoratingShdowdustEquipped- non venth" end
	end
		
      -- actions.cds+=/shadowmeld,if=!stealthed.all&variable.ambush_condition
      if Settings.Commons.VanishOffensive and S.Shadowmeld:IsCastable() and Ambush_Condition() then
        if HR.Cast(S.Shadowmeld, nil) then  shouldcast = 58984 return "Cast Shadowmeld" end
      end

      -- actions.cds=potion,if=buff.bloodlust.react|target.time_to_die<=60|buff.adrenaline_rush.up
	-- if I.PotionofSpectralAgility:IsReady() and CDsON() and Settings.Commons.Enabled.Potions and UsePots and (Player:BloodlustUp() or Target:TimeToDie() <= 60 or Player:BuffUp(S.AdrenalineRush)) then
        -- if HR.Cast(S.PotionofSpectralAgility, nil) then  shouldcast = 500 return "Cast Pot" end
      -- end		

    -- Racials
      -- actions.cds+=/blood_fury
      if S.BloodFury:IsCastable() and Settings.Commons.Enabled.Racials then
        if HR.Cast(S.BloodFury, nil) then shouldcast = 20572 return "Cast Blood Fury" end
      end
      -- actions.cds+=/berserking
      if S.Berserking:IsCastable() and Settings.Commons.Enabled.Racials then
        if HR.Cast(S.Berserking, nil) then shouldcast = 26297 return "Cast Berserking" end
      end
      -- actions.cds+=/fireblood
      if S.Fireblood:IsCastable() and Settings.Commons.Enabled.Racials then
        if HR.Cast(S.Fireblood, nil) then shouldcast = 265221 return "Cast Fireblood" end
      end
      -- actions.cds+=/ancestral_call
      if S.AncestralCall:IsCastable() and Settings.Commons.Enabled.Racials then
        if HR.Cast(S.AncestralCall, nil) then shouldcast = 274738 return "Cast Ancestral Call" end
      end
	  
      -- Trinkets
      if Settings.Commons.Enabled.TopTrinket or Settings.Commons.Enabled.BottomTrinket then
			if I.CacheOfAcquiredTreasures:IsEquippedAndReady() then
				if Player:BuffUp(S.AcquiredAxe) then
					if I.CacheOfAcquiredTreasures:ID() == TopTrinketID and Settings.Commons.Enabled.TopTrinket then
						shouldcast = 24 
						return "top trinket Cache Axe for AoE";
					elseif I.CacheOfAcquiredTreasures:ID() == BotTrinketID and Settings.Commons.Enabled.BottomTrinket then
						shouldcast = 30 
						return "bot trinket Cache Axe for AoE";
					end
				end
			end
	  
        -- actions.cds+=/use_items,slots=trinket1,if=!runeforge.mark_of_the_master_assassin&debuff.between_the_eyes.up&(!talent.ghostly_strike.enabled|debuff.ghostly_strike.up)|master_assassin_remains>0|trinket.1.has_stat.any_dps|fight_remains<=20
        -- actions.cds+=/use_items,slots=trinket2,if=!runeforge.mark_of_the_master_assassin&debuff.between_the_eyes.up&(!talent.ghostly_strike.enabled|debuff.ghostly_strike.up)|master_assassin_remains>0|trinket.2.has_stat.any_dps|fight_remains<=20
        -- TODO: Need trinket.X.has_stat.any_dps DBC support
        local TrinketToUse = Player:GetUseableTrinkets(OnUseExcludes)
        if TrinketToUse and (Target:DebuffUp(S.BetweentheEyes) or HL.BossFilteredFightRemains("<", 20) or TrinketToUse:TrinketHasStatAnyDps()) then
			if TrinketToUse then
				if HR.Cast(TrinketToUse, nil, nil) then
					if TrinketToUse:ID() == GetInventoryItemID("player", 13) and Settings.Commons.Enabled.TopTrinket then
						shouldcast = 24
						return "Generic use_items for " .. TrinketToUse:Name();
					elseif TrinketToUse:ID() == GetInventoryItemID("player", 14) and Settings.Commons.Enabled.BottomTrinket then
						shouldcast = 25
						return "Generic use_items for " .. TrinketToUse:Name();
					end
				end
			end
		end
	  end

    end
  end
end

local function Stealth ()
  -- ER FW Bug
  if false and CDsON() and CovenantsON and S.EchoingReprimand:IsReady() and Target:IsSpellInRange(S.EchoingReprimand) then
    if HR.Cast(S.EchoingReprimand, nil, nil) then shouldcast = 323547 return "Cast Echoing Reprimand" end
  end
  -- actions.stealth=dispatch,if=variable.finish_condition
  if S.Dispatch:IsCastable() and Target:IsSpellInRange(S.Dispatch) and Finish_Condition() then
    if HR.CastPooling(S.Dispatch) then shouldcast = 2098 return "Cast Dispatch" end
  end
    -- actions.stealth=ambush
  if S.Ambush:IsCastable() and Target:IsSpellInRange(S.Ambush) then
    if HR.CastPooling(S.Ambush) then shouldcast = 8676 return "Cast Ambush" end
  end
end

local function Finish ()
  -- # BtE on cooldown to keep the Crit debuff up, unless the target is about to die
  -- actions.finish+=/between_the_eyes,if=target.time_to_die>3
  -- Note: Increased threshold to 4s to account for player reaction time
  if S.BetweentheEyes:IsCastable() and Target:IsSpellInRange(S.BetweentheEyes)
    and (Target:FilteredTimeToDie(">", 4) or Target:TimeToDieIsNotValid()) and Rogue.CanDoTUnit(Target, BetweenTheEyesDMGThreshold) then
    if HR.CastPooling(S.BetweentheEyes) then shouldcast = 315341 return "Cast Between the Eyes" end
  end
  -- actions.finish=slice_and_dice,if=buff.slice_and_dice.remains<fight_remains&refreshable
  -- Note: Added Player:BuffRemains(S.SliceandDice) == 0 to maintain the buff while TTD is invalid (it's mainly for Solo, not an issue in raids)
  if S.SliceandDice:IsCastable() and (HL.FilteredFightRemains(EnemiesBF, ">", Player:BuffRemains(S.SliceandDice), true) or Player:BuffRemains(S.SliceandDice) == 0)
    and Player:BuffRemains(S.SliceandDice) < (1 + ComboPoints) * 1.8 then
    if HR.CastPooling(S.SliceandDice) then shouldcast = 315496 return "Cast Slice and Dice" end
  end
  -- actions.finish+=/dispatch
  if S.Dispatch:IsCastable() and Target:IsSpellInRange(S.Dispatch) then
    if HR.CastPooling(S.Dispatch) then shouldcast = 2098 return "Cast Dispatch" end
  end
end

local function Build ()
  -- actions.build=sepsis
  if S.Sepsis:IsReady() and CovenantsON and Target:IsSpellInRange(S.Sepsis) and Rogue.MasterAssassinsMarkRemains() <= 0 then
    if HR.Cast(S.Sepsis, nil, nil) then shouldcast = 328305 return "Cast Sepsis" end
  end
  -- actions.build+=/ghostly_strike
  if S.GhostlyStrike:IsReady() and Target:IsSpellInRange(S.GhostlyStrike) then
    if HR.Cast(S.GhostlyStrike, nil) then shouldcast = 196937 return "Cast Ghostly Strike" end
  end
  -- actions.build=shiv,if=runeforge.tiny_toxic_blade.equipped
  if S.Shiv:IsReady() and TinyToxicBladeEquipped then
    if HR.Cast(S.Shiv) then shouldcast = 5938 return "Cast Shiv (TTB)" end
  end
  -- actions.build+=/echoing_reprimand,if=!soulbind.effusive_anima_accelerator|variable.blade_flurry_sync
  if S.EchoingReprimand:IsReady() and CovenantsON and Target:IsSpellInRange(S.EchoingReprimand) and (not S.EffusiveAnimaAccelerator:SoulbindEnabled() or Blade_Flurry_Sync()) then
    if HR.Cast(S.EchoingReprimand, nil, nil) then shouldcast = 323547 return "Cast Echoing Reprimand" end
  end
  -- actions.build+=/serrated_bone_spike,cycle_targets=1,if=buff.slice_and_dice.up&!dot.serrated_bone_spike_dot.ticking|fight_remains<=5|cooldown.serrated_bone_spike.charges_fractional>=2.75
  if S.SerratedBoneSpike:IsReady() and CovenantsON then
    if (Player:BuffUp(S.SliceandDice) and not Target:DebuffUp(S.SerratedBoneSpikeDebuff)) or (Settings.Outlaw.DumpSpikes and HL.BossFilteredFightRemains("<", 5)) then
      if HR.Cast(S.SerratedBoneSpike, nil, nil) then shouldcast = 328547 return "Cast Serrated Bone Spike" end
    end
    if AoEON() then
      -- Prefer melee cycle units
      local BestUnit, BestUnitTTD = nil, 4
      local TargetGUID = Target:GUID()
      for _, CycleUnit in pairs(Enemies30y) do
        if CycleUnit:GUID() ~= TargetGUID and Everyone.UnitIsCycleValid(CycleUnit, BestUnitTTD, -CycleUnit:DebuffRemains(S.SerratedBoneSpike))
        and not CycleUnit:DebuffUp(S.SerratedBoneSpikeDebuff) then
          BestUnit, BestUnitTTD = CycleUnit, CycleUnit:TimeToDie()
        end
      end
      if BestUnit and CovenantsON then
        HR.CastLeftNameplate(BestUnit, S.SerratedBoneSpike)
		if BestUnit:GUID() == Unit("mouseover"):GUID() and Settings.Outlaw.TargetSwap == "Mouseover" then
			MOshouldcast = 3285415
		elseif Settings.Outlaw.TargetSwap == "AutoSwap" and BestUnit:GUID() ~= Target:GUID() and not StopAutoSwap then
			MOshouldcast = 999
		end
      end
    end
    if S.SerratedBoneSpike:ChargesFractional() > 2.75 and CovenantsON then
      if HR.Cast(S.SerratedBoneSpike, nil, nil) then shouldcast = 328547 return "Cast Serrated Bone Spike Filler" end
    end
  end
  if S.PistolShot:IsCastable() and Target:IsSpellInRange(S.PistolShot) and Player:BuffUp(S.Opportunity) then
    -- actions.build+=/pistol_shot,if=buff.opportunity.up&(energy.deficit>(energy.regen+10)|combo_points.deficit<=1+buff.broadside.up|talent.quick_draw.enabled)
    if Player:EnergyDeficitPredicted() > (Player:EnergyRegen() + 10) or ComboPointsDeficit  <= 1 + num(Player:BuffUp(S.Broadside)) or S.QuickDraw:IsAvailable() then
      if HR.CastPooling(S.PistolShot) then shouldcast = 185763 return "Cast Pistol Shot" end
    end
    -- actions.build+=/pistol_shot,if=buff.opportunity.up&(buff.greenskins_wickers.up|buff.concealed_blunderbuss.up)
    if Player:BuffUp(S.GreenskinsWickers) or Player:BuffUp(S.ConcealedBlunderbuss) or Player:BuffUp(S.TornadoTriggerBuff) then
      if HR.CastPooling(S.PistolShot) then shouldcast = 185763 return "Cast Pistol Shot (Buffed)" end
    end
  end
  -- actions.build+=/sinister_strike
  if S.SinisterStrike:IsCastable() and Target:IsSpellInRange(S.SinisterStrike) then
    if HR.CastPooling(S.SinisterStrike) then shouldcast = 193315 return "Cast Sinister Strike" end
  end
  -- actions.build+=/gouge,if=talent.dirty_tricks.enabled&combo_points.deficit>=1+buff.broadside.up
  -- TODO
end

local function Reset()
  Opener = HeroRotationCharDB.Toggles[6]
  CovenantsON = HeroRotationCharDB.Toggles[4]
  SmallCDsOn = HeroRotationCharDB.Toggles[5]
  StopAutoSwap = HeroRotationCharDB.Toggles[12]
  UsePots = HeroRotationCharDB.Toggles[15]
  HoldVanish = HeroRotationCharDB.Toggles[21]
  QCheapShot = HeroRotationCharDB.Toggles[22]
  QKidneyShot = HeroRotationCharDB.Toggles[23]
  QBlind = HeroRotationCharDB.Toggles[24]
  QSap = HeroRotationCharDB.Toggles[25]
  QFeint = HeroRotationCharDB.Toggles[27]
  QGouge = HeroRotationCharDB.Toggles[50]
  BRmeleeOnly = HeroRotationCharDB.Toggles[51]
  HoldKillingSpree = HeroRotationCharDB.Toggles[52]
  QGraplingHook = HeroRotationCharDB.Toggles[53]
  QRacial = HeroRotationCharDB.Toggles[30]
  HoldShiv = HeroRotationCharDB.Toggles[54]

  	if Settings.Commons.Enabled.TopTrinket then
		TopTrinketID = GetInventoryItemID("player", 13)
	else
		TopTrinketID = 1
	end
	if Settings.Commons.Enabled.BottomTrinket then
		BotTrinketID = GetInventoryItemID("player", 14)
	else
		BotTrinketID = 1
	end

	QuakingR = 0
	--Quaking
	for i=1,20 do
		if select(10, UnitDebuff("player", i)) == 240447 then
			if select(6, UnitDebuff("player", i)) ~= nil then
				QuakingR = (select(6, UnitDebuff("player", i)) - (GetTime()))
			end
		end
	end
	
end
 
--- ======= MAIN =======
local function APL ()
  -- Local Update
  BladeFlurryRange = S.AcrobaticStrikes:IsAvailable() and 9 or 6
  BetweenTheEyesDMGThreshold = S.Dispatch:Damage() * 1.25
  ComboPoints = Player:ComboPoints()
  EffectiveComboPoints = EffectiveComboPointsCalc(ComboPoints)
  ComboPointsDeficit = Player:ComboPointsDeficit()
  
  -- Unit Update
  if AoEON() then
    Enemies30y = Player:GetEnemiesInRange(30) -- Serrated Bone Spike cycle
    EnemiesBF = Player:GetEnemiesInRange(BladeFlurryRange)
    EnemiesBFCount = #EnemiesBF
  else
    EnemiesBFCount = 1
  end

  ShouldReturn = Reset()
  
  if ShouldReturn then
	return ShouldReturn
  end
  
	if MOshouldcast > 0 then
		MOshouldcast = 0
	end
	
	if shouldcast > 0 then
		shouldcast = 0
	end

  shouldcast = Rogue.ReturnSpell()
  MOshouldcast = Rogue.ReturnSpellMO()
--Resets
	if HR.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
		starttime = GetTime()
		endtime = starttime + (HR.GUISettings.General.OpenerReset)
	elseif HR.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
		HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6];
		HR.ToggleIconFrame:UpdateButtonText(6);
		HR.Print("Opener is now "..(HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."));
	end

--Queues 
  if (QGraplingHook and S.GrapplingHook:IsUsableP() and S.GrapplingHook:CooldownRemains(BypassRecovery) <= 0) then
  	if HR.Cast(S.GrapplingHook, nil, nil, nil) then 		
			shouldcast = 195457 return "queue Grappling Hook"; end
  elseif ((not S.GrapplingHook:IsUsableP() or S.GrapplingHook:CooldownRemains() > 0) and QGraplingHook) then
	  HeroRotationCharDB.Toggles[53] = not HeroRotationCharDB.Toggles[53];
      HR.Print("Gouge Queue is now "..(HeroRotationCharDB.Toggles[53] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end  
  
  if (QCheapShot and S.CheapShot:IsUsableP() and S.CheapShot:CooldownRemains(BypassRecovery) <= 0 and (Player:StealthUp(true, true) or Player:BuffUp(S.VanishBuff)) and (Target:IsInRange(8) or Unit("mouseover"):IsInRange(8))) then
	if HR.Cast(S.CheapShot, nil, nil, nil) then 
		if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.CheapShot) then
			MOshouldcast = 18335 return "queue Cheap Shot MO"; 
		else 			
			shouldcast = 1833 return "queue Cheap Shot"; end
	end
  elseif ((not S.CheapShot:IsUsableP() or S.CheapShot:CooldownRemains() > 0) and QCheapShot) then
	  HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22];
      HR.Print("Cheap Shot Queue is now "..(HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (QKidneyShot and S.KidneyShot:IsUsableP() and S.KidneyShot:CooldownRemains(BypassRecovery) <= 0 and (Target:IsInRange(8) or Unit("mouseover"):IsInRange(8))) then
	if HR.Cast(S.KidneyShot, nil, nil, nil) then 
		if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.KidneyShot) then
			MOshouldcast = 4085 return "queue Kidney Shot MO"; 
		else 			
			shouldcast = 408 return "queue Kidney Shot"; end
	end
  elseif ((not S.KidneyShot:IsUsableP() or S.KidneyShot:CooldownRemains() > 0) and QKidneyShot) then
	  HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23];
      HR.Print("Kidney Shot Queue is now "..(HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end  

  if (QBlind and S.Blind:IsUsableP() and S.Blind:CooldownRemains(BypassRecovery) <= 0 and (Target:IsInRange(15) or Unit("mouseover"):IsInRange(15))) then
	if HR.Cast(S.Blind, nil, nil, nil) then 
		if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.Blind) then
			MOshouldcast = 20945 return "queue Blind MO"; end
	end
  elseif ((not S.Blind:IsUsableP() or S.Blind:CooldownRemains() > 0) and QBlind) then
	  HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24];
      HR.Print("Blind Queue is now "..(HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (QSap and S.Sap:IsUsableP() and S.Sap:CooldownRemains(BypassRecovery) <= 0 and Player:StealthUp(true,true) and (Target:IsInRange(10) or Unit("mouseover"):IsInRange(10))) then
	if HR.Cast(S.Sap, nil, nil, nil) then 
		if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.Sap) then
			MOshouldcast = 67705 return "queue Sap MO"; 
		else 			
			shouldcast = 6770 return "queue Sap"; end
	end
  elseif ((not S.Sap:IsUsableP() or S.Sap:CooldownRemains() > 0 or not Player:StealthUp(true, true)) and QSap) then
	  HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25];
      HR.Print("Sap Queue is now "..(HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (QFeint and S.Feint:IsUsableP() and S.Feint:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
	if HR.Cast(S.Feint, nil, nil, nil) then 		
		shouldcast = 202 return "queue Shuriken Tornado";
	end
  elseif ((not S.Feint:IsUsableP() or S.Feint:CooldownRemains() > 0 or not Player:AffectingCombat()) and QFeint) then
	  HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27];
      HR.Print("Feint Queue is now "..(HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end  
  
  if (QGouge and S.Gouge:IsUsableP() and S.Gouge:CooldownRemains(BypassRecovery) <= 0 and (Target:IsInRange(8) or Unit("mouseover"):IsInRange(8))) then
  	if HR.Cast(S.Gouge, nil, nil, nil) then 
		if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.Gouge) then
			MOshouldcast = 17765 return "queue Gouge MO"; 
		else 			
			shouldcast = 1776 return "queue Gouge"; end
	end
  elseif ((not S.Gouge:IsUsableP() or S.Gouge:CooldownRemains() > 0 or not Player:AffectingCombat()) and QGouge) then
	  HeroRotationCharDB.Toggles[50] = not HeroRotationCharDB.Toggles[50];
      HR.Print("Gouge Queue is now "..(HeroRotationCharDB.Toggles[50] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end  
  
  if (QRacial) then  
	if (S.ArcaneTorrent:IsAvailable() and S.ArcaneTorrent:IsUsableP() and S.ArcaneTorrent:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
		if HR.Cast(S.ArcaneTorrent, nil, nil, nil) then 		
			shouldcast = 155145 return "queue ArcaneTorrent Queue";
		end
	elseif (S.LightsJudgment:IsAvailable() and S.LightsJudgment:IsUsableP() and S.LightsJudgment:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
		if HR.Cast(S.LightsJudgment, nil, nil, nil) then 		
			shouldcast = 255647 return "queue ArcaneTorrent Queue";
		end
	elseif (S.BagofTricks:IsAvailable() and S.BagofTricks:IsUsableP() and S.BagofTricks:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
		if HR.Cast(S.BagofTricks, nil, nil, nil) then 		
			shouldcast = 312411 return "queue ArcaneTorrent Queue";
		end		
	elseif (S.BloodFury:IsAvailable() and S.BloodFury:IsUsableP() and S.BloodFury:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
		if HR.Cast(S.BloodFury, nil, nil, nil) then 		
			shouldcast = 20572 return "queue ArcaneTorrent Queue";
		end	
	elseif (S.Berserking:IsAvailable() and S.Berserking:IsUsableP() and S.Berserking:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
		if HR.Cast(S.Berserking, nil, nil, nil) then 		
			shouldcast = 26297 return "queue ArcaneTorrent Queue";
		end		
	elseif (S.Fireblood:IsAvailable() and S.Fireblood:IsUsableP() and S.Fireblood:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
		if HR.Cast(S.Fireblood, nil, nil, nil) then 		
			shouldcast = 265221 return "queue ArcaneTorrent Queue";
		end		
	elseif (S.AncestralCall:IsAvailable() and S.AncestralCall:IsUsableP() and S.AncestralCall:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
		if HR.Cast(S.AncestralCall, nil, nil, nil) then 		
			shouldcast = 274738 return "queue ArcaneTorrent Queue";
		end	
	elseif (((S.ArcaneTorrent:IsAvailable() and (not S.ArcaneTorrent:IsUsableP() or S.ArcaneTorrent:CooldownRemains() > 0 or not Player:AffectingCombat())) or
	(S.LightsJudgment:IsAvailable() and (not S.LightsJudgment:IsUsableP() or S.LightsJudgment:CooldownRemains() > 0 or not Player:AffectingCombat())) or
	(S.BagofTricks:IsAvailable() and (not S.BagofTricks:IsUsableP() or S.BagofTricks:CooldownRemains() > 0 or not Player:AffectingCombat())) or
	(S.BloodFury:IsAvailable() and (not S.BloodFury:IsUsableP() or S.BloodFury:CooldownRemains() > 0 or not Player:AffectingCombat())) or
	(S.Berserking:IsAvailable() and (not S.Berserking:IsUsableP() or S.Berserking:CooldownRemains() > 0 or not Player:AffectingCombat())) or
	(S.Fireblood:IsAvailable() and (not S.Fireblood:IsUsableP() or S.Fireblood:CooldownRemains() > 0 or not Player:AffectingCombat())) or
	(S.AncestralCall:IsAvailable() and (not S.AncestralCall:IsUsableP() or S.AncestralCall:CooldownRemains() > 0 or not Player:AffectingCombat())))
	and QRacial) then
	  HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30];
	  HR.Print("Arcane Torrent Queue is now "..(HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r."));
	end  
  end  

    --Don't cancel Channels  
	if Player:IsChanneling(Spell(324631)) then
	  if Player:AffectingCombat() and Settings.Shadow.CastCancelFC then
		shouldcast = 1999
      elseif HR.CastAnnotated(S.PoolEnergy, false, "WAIT") then shouldcast = 99999 return "Pool During Fleshcraft"; end
	end
	
  if Player:IsChanneling(Spell(324631)) then
  	if HR.Cast(S.PoolEnergy, nil, nil, nil) then shouldcast = 99999 return "channeling Fleashcraft"; end
  end
  
  -- Defensives
  -- Crimson Vial
  ShouldReturn = Rogue.CrimsonVial()
  if ShouldReturn then return ShouldReturn end
  -- Feint
  ShouldReturn = Rogue.Feint()
  if ShouldReturn then return ShouldReturn end
  --Evasion
  ShouldReturn = Rogue.Evasion()
  if ShouldReturn then return ShouldReturn end
  
	if Player:HealthPercentage() < Settings.Commons.PhialHP and I.PhialofSerenity:IsReady() and I.PhialofSerenity:CooldownRemains() <= 0 then
		if HR.Cast(I.PhialofSerenity, nil) then shouldcast = 55 return "PhialofSerenity HP"; end
	end
	if Player:HealthPercentage() < Settings.Commons.HealthstoneHP  and I.Healthstone:IsReady() and I.Healthstone:CooldownRemains() <= 0 then
		if HR.Cast(I.Healthstone, nil) then shouldcast = 40 return "Healthstone HP"; end
	end
	if Player:HealthPercentage() < Settings.Commons.HealPotHP and I.HealPot:IsReady() and I.HealPot:CooldownRemains() <= 0 then
		if HR.Cast(I.HealPot, nil) then shouldcast = 41 return "HealPot HP"; end
	end
	if Player:HealthPercentage() < Settings.Commons.HealPotHP and I.CosmicHealPot:IsReady() and I.CosmicHealPot:CooldownRemains() <= 0 then
		if HR.Cast(I.CosmicHealPot, nil) then shouldcast = 45 return "CosmicHealPot HP"; end
	end  
  --explosives
  if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
	if S.PistolShot:IsCastable() and Unit("mouseover"):IsInMeleeRange(20) then
	      if HR.Cast(S.PistolShot, nil) then MOshouldcast = 1185763 return "explosive MO Pistol"; end
	end
  end
  
  if S.PistolShot:IsCastable() and Unit("target"):IsInMeleeRange(40) and string.find(UnitGUID("target"), 120651) then
	if HR.Cast(S.PistolShot, nil) then shouldcast = 185763 return "explosive Tar Pistol"; end
  end
  
  -- enrage dispel
    WhiteList = {228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 326450, 320703, 320012, 324085, 333241, 331510, 368477, 368396, 355057, 356133}
	
  if UnitExists("target") and S.Shiv:IsReady() and not HoldShiv then
	if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
		for i=0,40 do
			local _, _, stacks, type, _, _, _, _, _, id = UnitBuff("target",i);
			for _, j in pairs(WhiteList) do
				if j==id then
					if HR.Cast(S.Shiv, nil) then shouldcast = 5938 return "Shiv Enrage"; end
				end
			end
		end
	end
  end
  
  -- Poisons
    local PoisonRefreshTime = Player:AffectingCombat() and 180 or 900
    local PoisonRemains
    -- Lethal Poison
    if Spell(8679):IsAvailable() and Settings.Commons.LethalPoison == "Wound Poison" then
	  PoisonRemains = Player:BuffRemains(Spell(8679))
      if PoisonRemains < PoisonRefreshTime and not Player:IsCasting(Spell(8679)) then
        if HR.Cast(Spell(8679)) then shouldcast = 203 return "Wound Poison Refresh" end
	  end
    elseif Spell(2823):IsAvailable() and Settings.Commons.LethalPoison == "Deadly Poison" then
        PoisonRemains = Player:BuffRemains(Spell(2823))
        if PoisonRemains < PoisonRefreshTime and not Player:IsCasting(Spell(2823)) then
          if HR.Cast(Spell(2823)) then shouldcast = 208 return "Deadly Poison Refresh" end
        end
	elseif Spell(315584):IsAvailable() and Settings.Commons.LethalPoison == "Instant Poison" then
        PoisonRemains = Player:BuffRemains(Spell(315584))
        if PoisonRemains < PoisonRefreshTime and not Player:IsCasting(Spell(315584)) then
          if HR.Cast(Spell(315584)) then shouldcast = 205 return "Instant Poison Refresh" end
        end
	end

    -- Non-Lethal Poisons
    PoisonRemains = Player:BuffRemains(Spell(3408))
    if Spell(3408):IsAvailable() and Settings.Commons.NonLethalPoison == "Crippling Poison" then
      if PoisonRemains < PoisonRefreshTime and not Player:IsCasting(Spell(3408)) then
         if HR.Cast(Spell(3408)) then shouldcast = 206 return "Crippling Poison Refresh" end
      end
    elseif Spell(5761):IsAvailable() and Settings.Commons.NonLethalPoison == "Numbing Poison" then
      PoisonRemains = Player:BuffRemains(Spell(5761))
      if PoisonRemains < PoisonRefreshTime and not Player:IsCasting(NumbingPoison) then
        if HR.Cast(Spell(5761)) then shouldcast = 204 return "Numbing Poison Refresh" end
      end
    end

    -- Stealth
    if not Player:BuffUp(S.VanishBuff) and not Player:AffectingCombat() and not Player:StealthUp(true, true) then
      ShouldReturn = Rogue.Stealth(S.Stealth)
      if ShouldReturn then return ShouldReturn end
    end
	
  -- Out of Combat
  if not Player:AffectingCombat() and Opener then
    -- Flask
    -- Food
    -- Rune
    -- PrePot w/ Bossmod Countdown
    -- Opener
    if Everyone.TargetIsValid() and (not Player:AffectingCombat() and Opener) then
      -- Precombat CDs
      -- actions.precombat+=/marked_for_death,precombat_seconds=10,if=raid_event.adds.in>25
      if CDsON() and S.MarkedforDeath:IsCastable() and ComboPointsDeficit >= Rogue.CPMaxSpend() - 1 then
        if Settings.Commons.STMfDAsDPSCD then
          if HR.Cast(S.MarkedforDeath, nil) then shouldcast = 137619 return "Cast Marked for Death (OOC)" end
        else
          if HR.Cast(S.MarkedforDeath, nil) then shouldcast = 137619 return "Cast Marked for Death (OOC)" end
        end
      end
      -- actions.precombat+=/roll_the_bones,precombat_seconds=2
      if S.RolltheBones:IsReady() and (Rogue.RtBRemains() <= 3 or RtB_Reroll()) then
        if HR.Cast(S.RolltheBones) then shouldcast = 315508 return "Cast Roll the Bones (Opener)" end
      end
      -- actions.precombat+=/slice_and_dice,precombat_seconds=1
      if S.SliceandDice:IsReady() and Player:BuffRemains(S.SliceandDice) < (1 + ComboPoints) * 1.8 then
        if HR.CastPooling(S.SliceandDice) then shouldcast = 315496 return "Cast Slice and Dice (Opener)" end
      end
      if (Player:StealthUp(true, true) or Player:BuffUp(S.VanishBuff)) then
        ShouldReturn = Stealth()
        if ShouldReturn then return "Stealth (Opener): " .. ShouldReturn end
      elseif Finish_Condition() then
        ShouldReturn = Finish()
        if ShouldReturn then return "Finish (Opener): " .. ShouldReturn end
      elseif S.SinisterStrike:IsCastable() then
        if HR.Cast(S.SinisterStrike) then shouldcast = 193315 return "Cast Sinister Strike (Opener)" end
      end
    end
    return
  end

  -- In Combat
  -- MfD Sniping (Higher Priority than APL)
  -- actions.cds+=/marked_for_death,target_if=min:target.time_to_die,if=target.time_to_die<combo_points.deficit|((raid_event.adds.in>40|buff.true_bearing.remains>15-buff.adrenaline_rush.up*5)&!stealthed.rogue&combo_points.deficit>=cp_max_spend-1)
  -- actions.cds+=/marked_for_death,if=raid_event.adds.in>30-raid_event.adds.duration&!stealthed.rogue&combo_points.deficit>=cp_max_spend-1
  if S.MarkedforDeath:IsCastable() and (Player:AffectingCombat() or Opener or Player:BuffUp(S.VanishBuff)) then
    if EnemiesBFCount > 1 and Everyone.CastTargetIf(S.MarkedforDeath, Enemies30y, "min", EvaluateMfDTargetIfConditionCondition, EvaluateMfDCondition, nil, nil) then
      return "Cast Marked for Death (Cycle)"
    elseif EnemiesBFCount == 1 and not Player:StealthUp(true, false) and ComboPointsDeficit >= Rogue.CPMaxSpend() - 1 then
      if Settings.Commons.STMfDAsDPSCD then
        if HR.Cast(S.MarkedforDeath, nil) then shouldcast = 137619 return "Cast Marked for Death (ST)" end
      else
        if HR.Cast(S.MarkedforDeath, nil) then shouldcast = 137619 return "Cast Marked for Death (ST)" end

      end
    end
  end

  if Everyone.TargetIsValid() and (Player:AffectingCombat() or Opener or Player:BuffUp(S.VanishBuff)) then
    -- Interrupts
    -- ShouldReturn = Everyone.Interrupt(5, S.Kick, Settings.Commons2.OffGCDasOffGCD.Kick, Interrupts)
    -- if ShouldReturn then return ShouldReturn end

    -- actions+=/call_action_list,name=stealth,if=stealthed.all
    if (Player:StealthUp(true, true) or Player:BuffUp(S.VanishBuff)) then
      ShouldReturn = Stealth()
      if ShouldReturn then return "Stealth: " .. ShouldReturn end
    end
	
	--ToT logic
	local start1,duration1,_= GetSpellCooldown(57934)
	if Settings.Commons.AutoToT then
		if (start1 + duration1 - GetTime()) <= 0 and S.TricksoftheTrade:IsAvailable() and S.TricksoftheTrade:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus")) and IsItemInRange(32698, "focus") then
			if HR.Cast(S.TricksoftheTrade) then shouldcast = 207 return "ToT Focus" end
		end
	end
	
    -- actions+=/call_action_list,name=cds
    ShouldReturn = CDs()
    if ShouldReturn then return "CDs: " .. ShouldReturn end
    -- actions+=/run_action_list,name=finish,if=variable.finish_condition
    if Finish_Condition() then
      ShouldReturn = Finish()
      if ShouldReturn then return "Finish: " .. ShouldReturn end
      -- run_action_list forces the return
      HR.Cast(S.PoolEnergy)
      return "Finish Pooling"
    end
    -- actions+=/call_action_list,name=build
    ShouldReturn = Build()
    if ShouldReturn then return "Build: " .. ShouldReturn end
    -- actions+=/arcane_torrent,if=energy.deficit>=15+energy.regen
    if S.ArcaneTorrent:IsCastable() and Settings.Commons.Enabled.Racials and Target:IsSpellInRange(S.SinisterStrike) and Player:EnergyDeficitPredicted() > 15 + Player:EnergyRegen() then
      if HR.Cast(S.ArcaneTorrent, nil) then shouldcast = 155145 return "Cast Arcane Torrent" end
    end
    -- actions+=/arcane_pulse
    if S.ArcanePulse:IsCastable() and Settings.Commons.Enabled.Racials and Target:IsSpellInRange(S.SinisterStrike) then
      if HR.Cast(S.ArcanePulse) then shouldcast = 260364 return "Cast Arcane Pulse" end
    end
    -- actions+=/lights_judgment
    if S.LightsJudgment:IsCastable() and Settings.Commons.Enabled.Racials and Target:IsInMeleeRange(5) then
      if HR.Cast(S.LightsJudgment, nil) then shouldcast = 255647 return "Cast Lights Judgment" end
    end
    -- actions+=/bag_of_tricks
    if S.BagofTricks:IsCastable() and Settings.Commons.Enabled.Racials and Target:IsInMeleeRange(5) then
      if HR.Cast(S.BagofTricks, nil) then shouldcast = 312411 return "Cast Bag of Tricks" end
    end
    -- OutofRange Pistol Shot
    if S.PistolShot:IsCastable() and Target:IsSpellInRange(S.PistolShot) and not Target:IsInRange(BladeFlurryRange) and not Player:StealthUp(true, true)
      and Player:EnergyDeficitPredicted() < 25 and (ComboPointsDeficit >= 1 or EnergyTimeToMaxStable() <= 1.2) then
      if HR.Cast(S.PistolShot) then shouldcast = 185763 return "Cast Pistol Shot (OOR)" end
    end
  end
end

local function Init ()
  S.Flagellation:RegisterAuraTracking()

end

function ReturnSpellOut()
	if shouldcast == 0 then
		return 0
	else
		return shouldcast
	end
end
	
function ReturnSpellMOOut()
	if MOshouldcast == 0 then
		return 0
	else
		return MOshouldcast
	end
end

HR.SetAPL(260, APL, Init)

--- ======= SIMC =======
-- Last Update: 2021-02-15

-- # Executed before combat begins. Accepts non-harmful actions only.
-- actions.precombat=apply_poison
-- actions.precombat+=/flask
-- actions.precombat+=/augmentation
-- actions.precombat+=/food
-- # Snapshot raid buffed stats before combat begins and pre-potting is done.
-- actions.precombat+=/snapshot_stats
-- actions.precombat+=/marked_for_death,precombat_seconds=10,if=raid_event.adds.in>25
-- actions.precombat+=/roll_the_bones,precombat_seconds=2
-- actions.precombat+=/slice_and_dice,precombat_seconds=1
-- actions.precombat+=/stealth

-- # Executed every time the actor is available.
-- # Restealth if possible (no vulnerable enemies in combat)
-- actions=stealth
-- # Interrupt on cooldown to allow simming interactions with that
-- actions+=/kick
-- # Reroll single buffs early other than True Bearing and Broadside
-- actions+=/variable,name=rtb_reroll,value=rtb_buffs<2&(!buff.true_bearing.up&!buff.broadside.up)
-- # Ensure we get full Ambush CP gains and aren't rerolling Count the Odds buffs away
-- actions+=/variable,name=ambush_condition,value=combo_points.deficit>=2+buff.broadside.up&energy>=50&(!conduit.count_the_odds|buff.roll_the_bones.remains>=10)
-- # Finish at maximum CP but avoid wasting Broadside and Quick Draw bonus combo points
-- actions+=/variable,name=finish_condition,value=combo_points>=cp_max_spend-buff.broadside.up-(buff.opportunity.up*talent.quick_draw.enabled)|combo_points=animacharged_cp
-- # With multiple targets, this variable is checked to decide whether some CDs should be synced with Blade Flurry
-- actions+=/variable,name=blade_flurry_sync,value=spell_targets.blade_flurry<2&raid_event.adds.in>20|buff.blade_flurry.remains>1+talent.killing_spree.enabled
-- actions+=/run_action_list,name=stealth,if=stealthed.all
-- actions+=/call_action_list,name=cds
-- actions+=/run_action_list,name=finish,if=variable.finish_condition
-- actions+=/call_action_list,name=build
-- actions+=/arcane_torrent,if=energy.deficit>=15+energy.regen
-- actions+=/arcane_pulse
-- actions+=/lights_judgment
-- actions+=/bag_of_tricks

-- # Builders
-- actions.build=sepsis
-- actions.build+=/ghostly_strike
-- actions.build+=/shiv,if=runeforge.tiny_toxic_blade
-- actions.build+=/echoing_reprimand
-- actions.build+=/serrated_bone_spike,cycle_targets=1,if=buff.slice_and_dice.up&!dot.serrated_bone_spike_dot.ticking|fight_remains<=5|cooldown.serrated_bone_spike.charges_fractional>=2.75
-- # Use Pistol Shot with Opportunity if Combat Potency won't overcap energy, when it will exactly cap CP, or when using Quick Draw
-- actions.build+=/pistol_shot,if=buff.opportunity.up&(energy.deficit>(energy.regen+10)|combo_points.deficit<=1+buff.broadside.up|talent.quick_draw.enabled)
-- actions.build+=/pistol_shot,if=buff.opportunity.up&(buff.greenskins_wickers.up|buff.concealed_blunderbuss.up)
-- actions.build+=/sinister_strike
-- actions.build+=/gouge,if=talent.dirty_tricks.enabled&combo_points.deficit>=1+buff.broadside.up

-- # Cooldowns
-- # Blade Flurry on 2+ enemies
-- actions.cds=blade_flurry,if=spell_targets>=2&!buff.blade_flurry.up
-- # Using Ambush is a 2% increase, so Vanish can be sometimes be used as a utility spell unless using Master Assassin or Deathly Shadows
-- actions.cds+=/vanish,if=!runeforge.mark_of_the_master_assassin&!stealthed.all&variable.ambush_condition&(!runeforge.deathly_shadows|buff.deathly_shadows.down&combo_points<=2)
-- # With Master Asssassin, sync Vanish with a finisher or Ambush depending on BtE cooldown, or always a finisher with MfD
-- actions.cds+=/variable,name=vanish_ma_condition,if=runeforge.mark_of_the_master_assassin&!talent.marked_for_death.enabled,value=(!cooldown.between_the_eyes.ready&variable.finish_condition)|(cooldown.between_the_eyes.ready&variable.ambush_condition)
-- actions.cds+=/variable,name=vanish_ma_condition,if=runeforge.mark_of_the_master_assassin&talent.marked_for_death.enabled,value=variable.finish_condition
-- actions.cds+=/vanish,if=variable.vanish_ma_condition&master_assassin_remains=0&variable.blade_flurry_sync
-- actions.cds+=/flagellation
-- actions.cds+=/flagellation_cleanse,if=debuff.flagellation.remains<2
-- actions.cds+=/adrenaline_rush,if=!buff.adrenaline_rush.up
-- actions.cds+=/roll_the_bones,if=master_assassin_remains=0&(buff.roll_the_bones.remains<=3|variable.rtb_reroll)
-- # If adds are up, snipe the one with lowest TTD. Use when dying faster than CP deficit or without any CP.
-- actions.cds+=/marked_for_death,target_if=min:target.time_to_die,if=raid_event.adds.up&(target.time_to_die<combo_points.deficit|!stealthed.rogue&combo_points.deficit>=cp_max_spend-1)
-- # If no adds will die within the next 30s, use MfD on boss without any CP.
-- actions.cds+=/marked_for_death,if=raid_event.adds.in>30-raid_event.adds.duration&!stealthed.rogue&combo_points.deficit>=cp_max_spend-1
-- # Attempt to sync Killing Spree with Vanish for Master Assassin
-- actions.cds+=/variable,name=killing_spree_vanish_sync,value=!runeforge.mark_of_the_master_assassin|cooldown.vanish.remains>10|master_assassin_remains>2
-- # Use in 1-2T if BtE is up and won't cap Energy, or at 3T+ (2T+ with Deathly Shadows) or when Master Assassin is up.
-- actions.cds+=/killing_spree,if=variable.blade_flurry_sync&variable.killing_spree_vanish_sync&!stealthed.rogue&(debuff.between_the_eyes.up&energy.deficit>(energy.regen*2+15)|spell_targets.blade_flurry>(2-buff.deathly_shadows.up)|master_assassin_remains>0)
-- actions.cds+=/blade_rush,if=variable.blade_flurry_sync&(energy.time_to_max>2|spell_targets>2)
-- actions.cds+=/dreadblades,if=!stealthed.all&combo_points<=1
-- actions.cds+=/shadowmeld,if=!stealthed.all&variable.ambush_condition
-- actions.cds+=/potion,if=buff.bloodlust.react|fight_remains<30|buff.adrenaline_rush.up
-- actions.cds+=/blood_fury
-- actions.cds+=/berserking
-- actions.cds+=/fireblood
-- actions.cds+=/ancestral_call
-- # Default conditions for usable items.
-- actions.cds+=/use_items,slots=trinket1,if=!runeforge.mark_of_the_master_assassin&debuff.between_the_eyes.up&(!talent.ghostly_strike.enabled|debuff.ghostly_strike.up)|master_assassin_remains>0|trinket.1.has_stat.any_dps|fight_remains<=20
-- actions.cds+=/use_items,slots=trinket2,if=!runeforge.mark_of_the_master_assassin&debuff.between_the_eyes.up&(!talent.ghostly_strike.enabled|debuff.ghostly_strike.up)|master_assassin_remains>0|trinket.2.has_stat.any_dps|fight_remains<=20

-- # Finishers
-- actions.finish=slice_and_dice,if=buff.slice_and_dice.remains<fight_remains&refreshable
-- # BtE on cooldown to keep the Crit debuff up, unless the target is about to die
-- actions.finish+=/between_the_eyes,if=target.time_to_die>3
-- actions.finish+=/dispatch

-- # Stealth
-- actions.stealth=dispatch,if=variable.finish_condition
-- actions.stealth+=/ambush
