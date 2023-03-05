local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = d.Spell;
local j = d.MultiSpell;
local k = d.Item;
local l = HeroRotation;
local m = l.AoEON;
local n = l.CDsON;
local o = HeroRotationCharDB.Toggles[4]
local p = HeroRotationCharDB.Toggles[5]
local q = HeroRotationCharDB.Toggles[12]
local r = not HeroRotationCharDB.Toggles[15]
local s = HeroRotationCharDB.Toggles[21]
local t = HeroRotationCharDB.Toggles[52]
local u = HeroRotationCharDB.Toggles[22]
local v = HeroRotationCharDB.Toggles[23]
local w = HeroRotationCharDB.Toggles[24]
local x = HeroRotationCharDB.Toggles[25]
local y = HeroRotationCharDB.Toggles[27]
local z = HeroRotationCharDB.Toggles[50]
local A = HeroRotationCharDB.Toggles[51]
local B = HeroRotationCharDB.Toggles[53]
local C = HeroRotationCharDB.Toggles[30]
local D = HeroRotationCharDB.Toggles[54]
local E = 0;
Enemies8y = g:GetEnemiesInMeleeRange(8)
local F = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241,
  331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 158337 }
local G = math.min;
local H = math.abs;
local I = math.max;
local J = nil;
local K = nil;
local L = GetInventoryItemID("player", 13)
local M = GetInventoryItemID("player", 14)
local N = l.Commons.Everyone;
local O = l.Commons.Rogue;
local P = { General = l.GUISettings.General, Commons = l.GUISettings.APL.Rogue.Commons,
  Commons2 = l.GUISettings.APL.Rogue.Commons2, Outlaw = l.GUISettings.APL.Rogue.Outlaw }
local Q = i.Rogue.Outlaw;
local R = k.Rogue.Outlaw;
local S = { R.ManicGrieftorch:ID(), R.AlgetharPuzzleBox:ID() }
Q.Dispatch:RegisterDamageFormula(function() return g:AttackPowerDamageMod() * O.CPSpend() * 0.3 * 1.0 *
  (1 + g:VersatilityDmgPct() / 100) * (h:DebuffUp(Q.GhostlyStrike) and 1.1 or 1) end)
local T, U, V;
local W;
local X = 6;
local Y;
local Z, _, a0;
local a1, a2, a3, a4, a5;
local a6 = { { Q.Blind, "Cast Blind (Interrupt)", function() return true end } }
local a7 = O.ReturnSpell()
local a8 = O.ReturnSpellMO()
local a9 = 0;
local function aa(ab) if ab then return 1 else return 0 end end
;
local ac, ad = 0, 0;
local function ae(af)
  local ag = g:EnergyTimeToMaxPredicted(nil, af)
  if ag < ac or ag - ac > 0.5 then ac = ag end
  ;
  return ac
end
;
local function ah()
  local ai = g:EnergyPredicted()
  if ai > ad or ai - ad > 9 then ad = ai end
  ;
  return ad
end
;
local aj = { Q.Broadside, Q.BuriedTreasure, Q.GrandMelee, Q.RuthlessPrecision, Q.SkullandCrossbones, Q.TrueBearing }
local function ak(al, am)
  if not e.APLVar.RtB_List then e.APLVar.RtB_List = {} end
  ;
  if not e.APLVar.RtB_List[al] then e.APLVar.RtB_List[al] = {} end
  ;
  local an = table.concat(am)
  if al == "All" then if not e.APLVar.RtB_List[al][an] then
      local ao = 0;
      for ap = 1, #am do if g:BuffUp(aj[am[ap]]) then ao = ao + 1 end end
      ;
      e.APLVar.RtB_List[al][an] = ao == #am and true or false
    end else if not e.APLVar.RtB_List[al][an] then
      e.APLVar.RtB_List[al][an] = false;
      for ap = 1, #am do if g:BuffUp(aj[am[ap]]) then
          e.APLVar.RtB_List[al][an] = true;
          break
        end end
    end end
  ;
  return e.APLVar.RtB_List[al][an]
end
;
local function aq()
  if not e.APLVar.RtB_Buffs then
    e.APLVar.RtB_Buffs = {}
    e.APLVar.RtB_Buffs.Total = 0;
    e.APLVar.RtB_Buffs.Normal = 0;
    e.APLVar.RtB_Buffs.Shorter = 0;
    e.APLVar.RtB_Buffs.Longer = 0;
    local ar = O.RtBRemains()
    for ap = 1, #aj do
      local as = g:BuffRemains(aj[ap])
      if as > 0 then
        e.APLVar.RtB_Buffs.Total = e.APLVar.RtB_Buffs.Total + 1;
        if as == ar then e.APLVar.RtB_Buffs.Normal = e.APLVar.RtB_Buffs.Normal + 1 elseif as > ar then e.APLVar.RtB_Buffs.Longer =
          e.APLVar.RtB_Buffs.Longer + 1 else e.APLVar.RtB_Buffs.Shorter = e.APLVar.RtB_Buffs.Shorter + 1 end
      end
    end
  end
  ;
  return e.APLVar.RtB_Buffs.Total
end
;
local function at()
  if not e.APLVar.RtB_Reroll then
    if P.Outlaw.RolltheBonesLogic == "1+ Buff" then e.APLVar.RtB_Reroll = aq() <= 0 and true or false elseif P.Outlaw.RolltheBonesLogic == "Broadside" then e.APLVar.RtB_Reroll = not
      g:BuffUp(Q.Broadside) and true or false elseif P.Outlaw.RolltheBonesLogic == "Buried Treasure" then e.APLVar.RtB_Reroll = not
      g:BuffUp(Q.BuriedTreasure) and true or false elseif P.Outlaw.RolltheBonesLogic == "Grand Melee" then e.APLVar.RtB_Reroll = not
      g:BuffUp(Q.GrandMelee) and true or false elseif P.Outlaw.RolltheBonesLogic == "Skull and Crossbones" then e.APLVar.RtB_Reroll = not
      g:BuffUp(Q.SkullandCrossbones) and true or false elseif P.Outlaw.RolltheBonesLogic == "Ruthless Precision" then e.APLVar.RtB_Reroll = not
      g:BuffUp(Q.RuthlessPrecision) and true or false elseif P.Outlaw.RolltheBonesLogic == "True Bearing" then e.APLVar.RtB_Reroll = not
      g:BuffUp(Q.TrueBearing) and true or false else if Q.HiddenOpportunity:IsAvailable() then
        aq()
        if (g:BuffDown(Q.SkullandCrossbones) or g:BuffRemains(Q.SkullandCrossbones) > O.RtBRemains()) and g:BuffDown(Q.SubterfugeBuff) and g:BuffDown(Q.ShadowDanceBuff) and e.APLVar.RtB_Buffs.Normal + e.APLVar.RtB_Buffs.Shorter - aa(g:BuffUp(Q.GrandMelee) and g:BuffRemains(Q.GrandMelee) <= O.RtBRemains()) < 2 then e.APLVar.RtB_Reroll = true else e.APLVar.RtB_Reroll = false end
      else
        if aq() == 2 then if g:BuffUp(Q.BuriedTreasure) and g:BuffUp(Q.GrandMelee) then e.APLVar.RtB_Reroll = true elseif g:BuffUp(Q.LoadedDiceBuff) and not g:BuffUp(Q.Broadside) and not g:BuffUp(Q.TrueBearing) then e.APLVar.RtB_Reroll = true end elseif aq() < 2 and (not g:BuffUp(Q.Broadside) and (not Q.FanTheHammer:IsAvailable() or not g:BuffUp(Q.SkullandCrossbones)) and not g:BuffUp(Q.TrueBearing) or g:BuffUp(Q.LoadedDiceBuff)) then e.APLVar.RtB_Reroll = true else e.APLVar.RtB_Reroll = false end
        ;
        if e.APLVar.RtB_Reroll == false and (Q.KeepItRolling:IsAvailable() or Q.CountTheOdds:IsAvailable()) then if e.APLVar.RtB_Buffs.Normal == 0 and e.APLVar.RtB_Buffs.Longer > 0 and not (g:BuffUp(Q.Broadside) and g:BuffUp(Q.TrueBearing) and g:BuffUp(Q.SkullandCrossbones)) and not (g:BuffRemains(Q.Broadside) > 39 or g:BuffRemains(Q.TrueBearing) > 39 or g:BuffRemains(Q.RuthlessPrecision) > 39 or g:BuffRemains(Q.SkullandCrossbones) > 39) then e.APLVar.RtB_Reroll = true end end
      end end
    ;
    if N.IsSoloMode() then if g:BuffUp(Q.GrandMelee) then if g:IsTanking(h) or g:HealthPercentage() < G(P.Outlaw.RolltheBonesLeechKeepHP, P.Outlaw.RolltheBonesLeechRerollHP) then e.APLVar.RtB_Reroll = false end elseif g:HealthPercentage() < P.Outlaw.RolltheBonesLeechRerollHP then e.APLVar.RtB_Reroll = true end end
  end
  ;
  return e.APLVar.RtB_Reroll
end
;
local function au(BypassRecovery) return Q.CountTheOdds:IsAvailable() and
  (g:StealthUp(false, false, BypassRecovery) or g:BuffUp(Q.Shadowmeld, nil, BypassRecovery) or g:BuffUp(Q.ShadowDanceBuff, nil, BypassRecovery)) end
;
local function av() return _ >= I(O.CPMaxSpend() - 1, 6 - aa(Q.SummarilyDispatched:IsAvailable())) or Z >= O.CPMaxSpend() end
;
local function aw() return a1 >= 50 and
  (Q.HiddenOpportunity:IsAvailable() or g:BuffUp(Q.ViciousFollowup) or a0 >= 2 + aa(Q.ImprovedAmbush:IsAvailable()) + aa(g:BuffUp(Q.Broadside))) end
;
local function ax() return not m() or V < 2 or g:BuffRemains(Q.BladeFlurry) > 1 + aa(Q.KillingSpree:IsAvailable()) end
;
local function ay() return P.Commons.VanishOffensive and n() and not (N.IsSoloMode() and g:IsTanking(h)) end
;
local function az(aA) return aA:TimeToDie() end
;
local function aB(aA) return (aA:FilteredTimeToDie("<", a0 * 1.5) or not g:StealthUp(true, false) and a0 >= O.CPMaxSpend() - 1) and
  not g:DebuffUp(Q.Dreadblades) end
;
local function aC()
  if not s and P.Commons.VanishOffensive and Q.Vanish:IsCastable() and ay() then if Q.HiddenOpportunity:IsAvailable() or not Q.ShadowDance:IsAvailable() or not Q.ShadowDance:IsCastable() then
      if Q.FindWeakness:IsAvailable() and not Q.Audacity:IsAvailable() and h:DebuffDown(Q.FindWeaknessDebuff) and aw() then
        if l.Cast(Q.Vanish, nil) then
          a7 = 1856;
          return "Cast Vanish (FW)"
        end
        ;
        return
      end
      ;
      if Q.HiddenOpportunity:IsAvailable() then
        local aD = not Q.ShadowDanceTalent:IsAvailable() and
        Q.FanTheHammer:TalentRank() + aa(Q.QuickDraw:IsAvailable()) + aa(Q.Audacity:IsAvailable()) <
        aa(Q.CountTheOdds:IsAvailable()) + aa(Q.KeepItRolling:IsAvailable())
        if g:BuffDown(Q.AudacityBuff) and (aD or g:BuffStack(Q.Opportunity) < (Q.FanTheHammer:IsAvailable() and 6 or 1)) and aw() and aa(Q.HiddenOpportunity:IsAvailable()) + aa(av()) == 1 then
          if l.Cast(Q.Vanish, nil) then
            a7 = 1856;
            return "Cast Vanish (HO)"
          end
          ;
          return
        end
      end
      ;
      if (not Q.FindWeakness:IsAvailable() or not Q.Audacity:IsAvailable()) and not Q.HiddenOpportunity:IsAvailable() and av() then
        if l.Cast(Q.Vanish, nil) then
          a7 = 1856;
          return "Cast Vanish (Finish)"
        end
        ;
        return
      end
    end end
  ;
  if Q.ShadowDance:IsCastable() and o then if h:DebuffUp(Q.BetweentheEyes) and (not Q.GhostlyStrike:IsAvailable() or h:DebuffUp(Q.GhostlyStrike)) and (not Q.Dreadblades:IsAvailable() or not Q.Dreadblades:IsCastable()) and (not Q.HiddenOpportunity:IsAvailable() or g:BuffDown(Q.AudacityBuff) and (Q.FanTheHammer:TalentRank() < 2 or g:BuffDown(Q.Opportunity))) then if Q.KeepItRolling:IsAvailable() then if Q.KeepItRolling:CooldownRemains() <= 30 or Q.KeepItRolling:CooldownRemains() > 120 and (av() or Q.HiddenOpportunity:IsAvailable()) then
          if l.Cast(Q.ShadowDance, nil) then
            a7 = 185313;
            return "Cast Shadow Dance (KiR)"
          end
          ;
          return
        end else if g:BuffUp(Q.SliceandDice) and aa(Q.HiddenOpportunity:IsAvailable()) + aa(av()) == 1 and (not Q.HiddenOpportunity:IsAvailable() or not Q.Vanish:CooldownUp() or not ay()) then
          if l.Cast(Q.ShadowDance, nil) then
            a7 = 185313;
            return "Cast Shadow Dance"
          end
          ;
          return
        end end end end
end
;
local function aE()
  if n() and Q.AdrenalineRush:IsCastable() and not g:BuffUp(Q.AdrenalineRush) and (not Q.ImprovedAdrenalineRush:IsAvailable() or _ <= 2) then if l.Cast(Q.AdrenalineRush, nil) then
      a7 = 13750;
      return "Cast Adrenaline Rush"
    end end
  ;
  if Q.BladeFlurry:IsReady() and m() and V >= 2 and g:BuffRemains(Q.BladeFlurry) < (g:BuffUp(Q.AdrenalineRush) and 0.8 or 1) then if P.Outlaw.GCDasOffGCD.BladeFlurry then
      l.CastSuggested(Q.BladeFlurry) else if l.Cast(Q.BladeFlurry) then
        a7 = 13877;
        return "Cast Blade Flurry"
      end end end
  ;
  if Q.RolltheBones:IsReady() and not g:DebuffUp(Q.Dreadblades) and (aq() == 0 or at()) then if l.Cast(Q.RolltheBones) then
      a7 = 315508;
      return "Cast Roll the Bones"
    end end
  ;
  if n() and Q.KeepItRolling:IsReady() and not at() and aa(g:BuffUp(Q.Broadside)) + aa(g:BuffUp(Q.TrueBearing)) + aa(g:BuffUp(Q.SkullandCrossbones)) + aa(g:BuffUp(Q.RuthlessPrecision)) > 2 and (g:BuffDown(Q.ShadowDanceBuff) or aq() >= 6) then if l.Cast(Q.KeepItRolling) then
      a7 = 381989;
      return "Cast KeepItRolling"
    end end
  ;
  if Q.BladeRush:IsCastable() and h:IsSpellInRange(Q.SinisterStrike) and ax() and not g:DebuffUp(Q.Dreadblades) and d.FilteredFightRemains(U, ">", 4) then if l.Cast(Q.BladeRush, nil) then
      a7 = 271877;
      return "Cast Blade Rush"
    end end
  ;
  if h:IsSpellInRange(Q.SinisterStrike) then
    if not g:StealthUp(true, true, true) or Q.CountTheOdds:IsAvailable() and not Q.HiddenOpportunity:IsAvailable() and not au(true) then
      W = aC()
      if W then return W end
    end
    ;
    if Q.Dreadblades:IsCastable() and h:IsSpellInRange(Q.Dreadblades) and _ <= 2 and not (au() or g:StealthUp(false, false) or Q.HiddenOpportunity:IsAvailable() and g:StealthUp(true, false)) and (not Q.MarkedforDeath:IsAvailable() or not Q.MarkedforDeath:CooldownUp()) and h:FilteredTimeToDie(">=", 10) then if l.Cast(Q.Dreadblades, nil) then
        a7 = 343142;
        return "Cast Dreadblades"
      end end
  end
  ;
  if n() and Q.ThistleTea:IsCastable() and not g:BuffUp(Q.ThistleTea) and (a3 >= 100 or d.BossFilteredFightRemains("<", Q.ThistleTea:Charges() * 6)) then if l.Cast(Q.ThistleTea, nil) then
      a7 = 381623;
      return "Cast Thistle Tea"
    end end
  ;
  if n() and Q.KillingSpree:IsCastable() and h:IsSpellInRange(Q.KillingSpree) and ax() and not g:StealthUp(true, false) and h:DebuffUp(Q.BetweentheEyes) and a4 > 4 then if l.Cast(Q.KillingSpree, nil) then
      a7 = 51690;
      return "Cast Killing Spree"
    end end
  ;
  if h:IsSpellInRange(Q.SinisterStrike) and n() then
    if P.Commons.VanishOffensive and Q.Shadowmeld:IsCastable() and (Q.CountTheOdds:IsAvailable() and av() or not Q.Weaponmaster:IsAvailable() and aw()) then if l.Cast(Q.Shadowmeld, nil) then
        a7 = 58984;
        return "Cast Shadowmeld"
      end end
    ;
    if P.Commons.Enabled.Potions then
      local aF = N.PotionSelected()
      if aF then if aF:IsReady() and n() and r and (g:BloodlustUp() and l.GUISettings.General.HoldPotforBL or (g:BloodlustUp() or d.BossFightRemains() <= 60 or g:BuffUp(Q.AdrenalineRush)) and not l.GUISettings.General.HoldPotforBL) then if l.Cast(aF, nil) then
            a7 = 50;
            return "potion cooldowns 2"
          end end end
    end
    ;
    if Q.BloodFury:IsCastable() and P.Commons.Enabled.Racials and n() then if l.Cast(Q.BloodFury, nil) then
        a7 = 20572;
        return "Cast Blood Fury"
      end end
    ;
    if Q.Berserking:IsCastable() and P.Commons.Enabled.Racials and n() then if l.Cast(Q.Berserking, nil) then
        a7 = 26297;
        return "Cast Berserking"
      end end
    ;
    if Q.Fireblood:IsCastable() and P.Commons.Enabled.Racials and n() then if l.Cast(Q.Fireblood, nil) then
        a7 = 265221;
        return "Cast Fireblood"
      end end
    ;
    if Q.AncestralCall:IsCastable() and P.Commons.Enabled.Racials and n() then if l.Cast(Q.AncestralCall, nil) then
        a7 = 274738;
        return "Cast Ancestral Call"
      end end
    ;
    local aG = g:GetUseableTrinkets(S)
    if aG and n() and (h:DebuffUp(Q.BetweentheEyes) or d.BossFilteredFightRemains("<", 20) or aG:TrinketHasStatAnyDps()) then if aG then if l.Cast(aG, nil, nil) then if aG:ID() == GetInventoryItemID("player", 13) and P.Commons.Enabled.TopTrinket then
            a7 = 24;
            return "Generic use_items for " .. aG:Name()
          elseif aG:ID() == GetInventoryItemID("player", 14) and P.Commons.Enabled.BottomTrinket then
            a7 = 25;
            return "Generic use_items for " .. aG:Name()
          end end end end
  end
end
;
local function aH()
  if Q.Ambush:IsCastable() and h:IsSpellInRange(Q.Ambush) and (au() or Q.HiddenOpportunity:IsAvailable() or g:StealthUp(false, false) and Q.FindWeakness:IsAvailable() and not h:DebuffUp(Q.FindWeaknessDebuff)) and p then if l.Cast(Q.Ambush) then
      a7 = 8676;
      return "Cast Ambush"
    end end
  ;
  if Q.BladeFlurry:IsReady() and m() and V >= 2 and Q.Subterfuge:IsAvailable() and Q.HiddenOpportunity:IsAvailable() and not g:BuffUp(Q.BladeFlurry) then if P.Outlaw.GCDasOffGCD.BladeFlurry then
      l.CastSuggested(Q.BladeFlurry) else if l.Cast(Q.BladeFlurry) then
        a7 = 13877;
        return "Cast Blade Flurry"
      end end end
  ;
  if Q.ColdBlood:IsReady() and h:IsSpellInRange(Q.Dispatch) and av() then if l.Cast(Q.ColdBlood) then
      a7 = 382245;
      return "Cast Cold Blood"
    end end
  ;
  if Q.Dispatch:IsCastable() and h:IsSpellInRange(Q.Dispatch) and av() then if l.CastPooling(Q.Dispatch) then
      a7 = 2098;
      return "Cast Dispatch"
    end end
  ;
  if Q.Ambush:IsCastable() and h:IsSpellInRange(Q.Ambush) and (au() or Q.HiddenOpportunity:IsAvailable() or g:StealthUp(false, false) and Q.FindWeakness:IsAvailable() and not h:DebuffUp(Q.FindWeaknessDebuff)) then if l.CastPooling(Q.Ambush) then
      a7 = 8676;
      return "Cast Ambush"
    end end
end
;
local function aI()
  if Q.BetweentheEyes:IsCastable() and h:IsSpellInRange(Q.BetweentheEyes) and (h:FilteredTimeToDie(">", 4) or h:TimeToDieIsNotValid()) and O.CanDoTUnit(h, Y) and (h:DebuffRemains(Q.BetweentheEyes) < 4 or Q.GreenskinsWickers:IsAvailable() and not g:BuffUp(Q.GreenskinsWickersBuff) or not Q.GreenskinsWickers:IsAvailable() and Q.ImprovedBetweenTheEyes:IsAvailable() and g:BuffUp(Q.RuthlessPrecision)) then if l.CastPooling(Q.BetweentheEyes) then
      a7 = 315341;
      return "Cast Between the Eyes"
    end end
  ;
  if Q.SliceandDice:IsCastable() and (d.FilteredFightRemains(U, ">", g:BuffRemains(Q.SliceandDice), true) or g:BuffRemains(Q.SliceandDice) == 0) and g:BuffRemains(Q.SliceandDice) < (1 + _) * 1.8 and (not Q.SwiftSlasher:IsAvailable() or a0 == 0) and g:BuffDown(Q.GrandMelee) then if l.CastPooling(Q.SliceandDice) then
      a7 = 315496;
      return "Cast Slice and Dice"
    end end
  ;
  if Q.ColdBlood:IsCastable() and g:BuffDown(Q.ColdBlood) and h:IsSpellInRange(Q.Dispatch) then if l.Cast(Q.ColdBlood, P.Commons.OffGCDasOffGCD.ColdBlood) then
      a7 = 382245;
      return "Cast Cold Blood"
    end end
  ;
  if Q.Dispatch:IsCastable() and h:IsSpellInRange(Q.Dispatch) then if l.CastPooling(Q.Dispatch) then
      a7 = 2098;
      return "Cast Dispatch"
    end end
end
;
local function aJ()
  if n() and Q.Sepsis:IsReady() and h:IsSpellInRange(Q.Sepsis) and (h:FilteredTimeToDie(">", 11) and h:DebuffUp(Q.BetweentheEyes) or d.BossFilteredFightRemains("<", 11)) then if l.Cast(Q.Sepsis, nil, nil) then
      a7 = 328305;
      return "Cast Sepsis"
    end end
  ;
  if Q.GhostlyStrike:IsReady() and h:IsSpellInRange(Q.GhostlyStrike) and h:DebuffRemains(Q.GhostlyStrike) <= 3 and (V <= 2 or g:BuffUp(Q.Dreadblades)) and g:BuffDown(Q.SubterfugeBuff) and h:FilteredTimeToDie(">=", 5) then if l.Cast(Q.GhostlyStrike, nil) then
      a7 = 196937;
      return "Cast Ghostly Strike"
    end end
  ;
  if Q.Ambush:IsReady() then
    if Q.FindWeakness:IsAvailable() and not h:DebuffUp(Q.FindWeaknessDebuff) then if l.Cast(Q.Ambush) then
        a7 = 8676;
        return "Cast Ambush (High-Prio FW)"
      end end
    ;
    if (Q.HiddenOpportunity:IsAvailable() or Q.KeepItRolling:IsAvailable()) and (g:BuffUp(Q.AudacityBuff) or g:BuffUp(Q.SepsisBuff) or g:BuffUp(Q.SubterfugeBuff) and Q.KeepItRolling:IsReady()) then if l.Cast(Q.Ambush) then
        a7 = 8676;
        return "Cast Ambush (High-Prio Buffed)"
      end end
  end
  ;
  if Q.PistolShot:IsCastable() and h:IsSpellInRange(Q.PistolShot) then
    if g:BuffUp(Q.GreenskinsWickersBuff) and (not Q.FanTheHammer:IsAvailable() and g:BuffUp(Q.Opportunity)) then if l.CastPooling(Q.PistolShot) then
        a7 = 185763;
        return "Cast Pistol Shot (Buffed)"
      end elseif g:BuffUp(Q.GreenskinsWickersBuff) and g:BuffRemains(Q.GreenskinsWickersBuff) < 1.5 then if l.CastPooling(Q.PistolShot) then
        a7 = 185763;
        return "Cast Pistol Shot (GSW Dump)"
      end end
    ;
    if Q.FanTheHammer:IsAvailable() and g:BuffUp(Q.Opportunity) then if Q.Audacity:IsAvailable() and Q.HiddenOpportunity:IsAvailable() and g:BuffDown(Q.AudacityBuff) and g:BuffDown(Q.SubterfugeBuff) and g:BuffDown(Q.ShadowDanceBuff) then if l.CastPooling(Q.PistolShot) then
          a7 = 185763;
          return "Cast Pistol Shot (Audacity)"
        end elseif g:BuffStack(Q.Opportunity) >= 6 or g:BuffRemains(Q.Opportunity) < 2 then if l.CastPooling(Q.PistolShot) then
          a7 = 185763;
          return "Cast Pistol Shot (FtH Dump)"
        end elseif a0 > 1 + aa(Q.QuickDraw:IsAvailable()) * Q.FanTheHammer:TalentRank() and not g:DebuffUp(Q.Dreadblades) and (not Q.HiddenOpportunity:IsAvailable() or not g:BuffUp(Q.SubterfugeBuff) and not g:BuffUp(Q.ShadowDanceBuff)) then if l.CastPooling(Q.PistolShot) then
          a7 = 185763;
          return "Cast Pistol Shot (FtH)"
        end end end
  end
  ;
  if n() and Q.EchoingReprimand:IsReady() and not g:DebuffUp(Q.Dreadblades) then if l.Cast(Q.EchoingReprimand, nil, nil) then
      a7 = 323547;
      return "Cast Echoing Reprimand"
    end end
  ;
  if Q.Ambush:IsCastable() and (g:BuffUp(Q.AudacityBuff) or g:StealthUp(true, true)) and (Q.HiddenOpportunity:IsAvailable() or Q.FindWeakness:IsAvailable() and not h:DebuffUp(Q.FindWeaknessDebuff)) then if l.CastPooling(Q.Ambush) then
      a7 = 8676;
      return "Cast Ambush (Pooling)"
    end end
  ;
  if not Q.FanTheHammer:IsAvailable() and Q.PistolShot:IsCastable() and h:IsSpellInRange(Q.PistolShot) and g:BuffUp(Q.Opportunity) then if a4 > 1.5 or Q.QuickDraw:IsAvailable() or Q.Audacity:IsAvailable() and not g:BuffUp(Q.AudacityBuff) or not Q.Weaponmaster:IsAvailable() and a0 <= 1 + aa(g:BuffUp(Q.Broadside)) then if l.CastPooling(Q.PistolShot) then
        a7 = 185763;
        return "Cast Pistol Shot"
      end end end
  ;
  if Q.SinisterStrike:IsCastable() and h:IsSpellInRange(Q.SinisterStrike) then if l.CastPooling(Q.SinisterStrike) then
      a7 = 193315;
      return "Cast Sinister Strike"
    end end
end
;
local function aK()
  p = HeroRotationCharDB.Toggles[5]
  o = HeroRotationCharDB.Toggles[4]
  q = HeroRotationCharDB.Toggles[12]
  r = not HeroRotationCharDB.Toggles[15]
  s = HeroRotationCharDB.Toggles[21]
  u = HeroRotationCharDB.Toggles[22]
  v = HeroRotationCharDB.Toggles[23]
  w = HeroRotationCharDB.Toggles[24]
  x = HeroRotationCharDB.Toggles[25]
  y = HeroRotationCharDB.Toggles[27]
  z = HeroRotationCharDB.Toggles[50]
  A = HeroRotationCharDB.Toggles[51]
  t = HeroRotationCharDB.Toggles[52]
  B = HeroRotationCharDB.Toggles[53]
  C = HeroRotationCharDB.Toggles[30]
  D = HeroRotationCharDB.Toggles[54]
  L = GetInventoryItemID("player", 13)
  M = GetInventoryItemID("player", 14)
  if not P.Commons.Enabled.TopTrinket and not P.Commons.Enabled.BottomTrinket then S = { L, M } elseif not P.Commons.Enabled.TopTrinket and P.Commons.Enabled.BottomTrinket then S = {
      L } elseif not P.Commons.Enabled.BottomTrinket and P.Commons.Enabled.TopTrinket then S = { M } end
  ;
  E = 0;
  for ap = 1, 20 do if select(10, UnitDebuff("player", ap)) == 240447 then if select(6, UnitDebuff("player", ap)) ~= nil then E =
        select(6, UnitDebuff("player", ap)) - GetTime() end end end
end
;
local function aL()
  X = Q.AcrobaticStrikes:IsAvailable() and 9 or 6;
  Y = Q.Dispatch:Damage() * 1.25;
  _ = g:ComboPoints()
  Z = O.EffectiveComboPoints(_)
  a0 = g:ComboPointsDeficit()
  a5 = g:BuffUp(Q.AdrenalineRush, nil, true) and -50 or 0;
  a1 = ah()
  a2 = g:EnergyRegen()
  a4 = ae(a5)
  a3 = g:EnergyDeficitPredicted(nil, a5)
  if m() then
    T = g:GetEnemiesInRange(30)
    U = g:GetEnemiesInRange(X)
    V = #U
  else V = 1 end
  ;
  W = aK()
  if l.QueuedCast() then
    a7 = l.QueuedCast()
    return "Custom Queue " .. i(a7):ID()
  end
  ;
  if W then return W end
  ;
  if a8 > 0 then a8 = 0 end
  ;
  if a7 > 0 then a7 = 0 end
  ;
  a7 = O.ReturnSpell()
  a8 = O.ReturnSpellMO()
  if l.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
    J = GetTime()
    K = J + l.GUISettings.General.OpenerReset
  elseif l.GUISettings.General.OpenerReset > 0 and K ~= nil and GetTime() > K and HeroRotationCharDB.Toggles[6] then
    HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
    l.ToggleIconFrame:UpdateButtonText(6)
    l.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
  end
  ;
  if B and Q.GrapplingHook:IsUsableP() and Q.GrapplingHook:CooldownRemains(BypassRecovery) <= 0 then if l.Cast(Q.GrapplingHook, nil, nil, nil) then
      a7 = 195457;
      return "queue Grappling Hook"
    end elseif (not Q.GrapplingHook:IsUsableP() or Q.GrapplingHook:CooldownRemains() > 0) and B then
    HeroRotationCharDB.Toggles[53] = not HeroRotationCharDB.Toggles[53]
    l.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[53] and "|cff00ff00on|r." or "|cffff0000off|r."))
  end
  ;
  if u and Q.CheapShot:IsUsableP() and Q.CheapShot:CooldownRemains(BypassRecovery) <= 0 and (g:StealthUp(true, true) or g:BuffUp(Q.VanishBuff)) and (h:IsInRange(8) or f("mouseover"):IsInRange(8)) then if l.Cast(Q.CheapShot, nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.CheapShot) then
        a8 = 18335;
        return "queue Cheap Shot MO"
      else
        a7 = 1833;
        return "queue Cheap Shot"
      end end elseif (not Q.CheapShot:IsUsableP() or Q.CheapShot:CooldownRemains() > 0) and u then
    HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
    l.Print("Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."))
  end
  ;
  if v and Q.KidneyShot:IsUsableP() and Q.KidneyShot:CooldownRemains(BypassRecovery) <= 0 and (h:IsInRange(8) or f("mouseover"):IsInRange(8)) then if l.Cast(Q.KidneyShot, nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.KidneyShot) then
        a8 = 4085;
        return "queue Kidney Shot MO"
      else
        a7 = 408;
        return "queue Kidney Shot"
      end end elseif (not Q.KidneyShot:IsUsableP() or Q.KidneyShot:CooldownRemains() > 0) and v then
    HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
    l.Print("Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."))
  end
  ;
  if w and Q.Blind:IsUsableP() and Q.Blind:CooldownRemains(BypassRecovery) <= 0 and (h:IsInRange(15) or f("mouseover"):IsInRange(15)) then if l.Cast(Q.Blind, nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.Blind) then
        a8 = 20945;
        return "queue Blind MO"
      end end elseif (not Q.Blind:IsUsableP() or Q.Blind:CooldownRemains() > 0) and w then
    HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
    l.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
  end
  ;
  if x and Q.Sap:IsUsableP() and Q.Sap:CooldownRemains(BypassRecovery) <= 0 and g:StealthUp(true, true) and (h:IsInRange(10) or f("mouseover"):IsInRange(10)) then if l.Cast(Q.Sap, nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.Sap) then
        a8 = 67705;
        return "queue Sap MO"
      else
        a7 = 6770;
        return "queue Sap"
      end end elseif (not Q.Sap:IsUsableP() or Q.Sap:CooldownRemains() > 0 or not g:StealthUp(true, true)) and x then
    HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
    l.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
  end
  ;
  if y and Q.Feint:IsUsableP() and Q.Feint:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(Q.Feint, nil, nil, nil) then
      a7 = 202;
      return "queue Feint"
    end elseif (not Q.Feint:IsUsableP() or Q.Feint:CooldownRemains() > 0 or not g:AffectingCombat()) and y then
    HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27]
    l.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."))
  end
  ;
  if A and Q.BladeRush:IsUsableP() and Q.BladeRush:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(Q.BladeRush, nil, nil, nil) then
      a7 = 271877;
      return "queue BladeRush"
    end elseif (not Q.BladeRush:IsUsableP() or Q.BladeRush:CooldownRemains() > 0 or not g:AffectingCombat()) and A then
    HeroRotationCharDB.Toggles[51] = not HeroRotationCharDB.Toggles[51]
    l.Print("BladeRush que is now " .. (HeroRotationCharDB.Toggles[51] and "|cff00ff00on|r." or "|cffff0000off|r."))
  end
  ;
  if z and Q.Gouge:IsUsableP() and Q.Gouge:CooldownRemains(BypassRecovery) <= 0 then if l.Cast(Q.Gouge, nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.Gouge) then
        a8 = 17765;
        return "queue Gouge MO"
      elseif f("target"):IsSpellInRange(Q.Gouge) then
        a7 = 1776;
        return "queue Gouge"
      end end elseif (not Q.Gouge:IsUsableP() or Q.Gouge:CooldownRemains() > 0 or not g:AffectingCombat()) and z then
    HeroRotationCharDB.Toggles[50] = not HeroRotationCharDB.Toggles[50]
    l.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[50] and "|cff00ff00on|r." or "|cffff0000off|r."))
  end
  ;
  if C then if Q.ArcaneTorrent:IsAvailable() and Q.ArcaneTorrent:IsUsableP() and Q.ArcaneTorrent:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(Q.ArcaneTorrent, nil, nil, nil) then
        a7 = 155145;
        return "queue ArcaneTorrent Queue"
      end elseif Q.LightsJudgment:IsAvailable() and Q.LightsJudgment:IsUsableP() and Q.LightsJudgment:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(Q.LightsJudgment, nil, nil, nil) then
        a7 = 255647;
        return "queue LightsJudgment Queue"
      end elseif Q.BagofTricks:IsAvailable() and Q.BagofTricks:IsUsableP() and Q.BagofTricks:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(Q.BagofTricks, nil, nil, nil) then
        a7 = 312411;
        return "queue BagofTricks Queue"
      end elseif Q.BloodFury:IsAvailable() and Q.BloodFury:IsUsableP() and Q.BloodFury:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(Q.BloodFury, nil, nil, nil) then
        a7 = 20572;
        return "queue BloodFury Queue"
      end elseif Q.Berserking:IsAvailable() and Q.Berserking:IsUsableP() and Q.Berserking:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(Q.Berserking, nil, nil, nil) then
        a7 = 26297;
        return "queue Berserking Queue"
      end elseif Q.Fireblood:IsAvailable() and Q.Fireblood:IsUsableP() and Q.Fireblood:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(Q.Fireblood, nil, nil, nil) then
        a7 = 265221;
        return "queue Fireblood Queue"
      end elseif Q.AncestralCall:IsAvailable() and Q.AncestralCall:IsUsableP() and Q.AncestralCall:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(Q.AncestralCall, nil, nil, nil) then
        a7 = 274738;
        return "queue AncestralCall Queue"
      end elseif (Q.ArcaneTorrent:IsAvailable() and (not Q.ArcaneTorrent:IsUsableP() or Q.ArcaneTorrent:CooldownRemains() > 0 or not g:AffectingCombat()) or Q.LightsJudgment:IsAvailable() and (not Q.LightsJudgment:IsUsableP() or Q.LightsJudgment:CooldownRemains() > 0 or not g:AffectingCombat()) or Q.BagofTricks:IsAvailable() and (not Q.BagofTricks:IsUsableP() or Q.BagofTricks:CooldownRemains() > 0 or not g:AffectingCombat()) or Q.BloodFury:IsAvailable() and (not Q.BloodFury:IsUsableP() or Q.BloodFury:CooldownRemains() > 0 or not g:AffectingCombat()) or Q.Berserking:IsAvailable() and (not Q.Berserking:IsUsableP() or Q.Berserking:CooldownRemains() > 0 or not g:AffectingCombat()) or Q.Fireblood:IsAvailable() and (not Q.Fireblood:IsUsableP() or Q.Fireblood:CooldownRemains() > 0 or not g:AffectingCombat()) or Q.AncestralCall:IsAvailable() and (not Q.AncestralCall:IsUsableP() or Q.AncestralCall:CooldownRemains() > 0 or not g:AffectingCombat())) and C then
      HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30]
      l.Print("Arcane Torrent Queue is now " .. (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end end
  ;
  if g:IsChanneling(i(324631)) then if l.Cast(Q.PoolEnergy, nil, nil, nil) then
      a7 = 99999;
      return "channeling Fleashcraft"
    end end
  ;
  W = O.CrimsonVial()
  if W then return W end
  ;
  W = O.Feint()
  if W then return W end
  ;
  W = O.Evasion()
  if W then return W end
  ;
  if g:HealthPercentage() < P.Commons.PhialHP and R.PhialofSerenity:IsReady() and R.PhialofSerenity:CooldownRemains() <= 0 then if l.Cast(R.PhialofSerenity, nil) then
      a7 = 55;
      return "PhialofSerenity HP"
    end end
  ;
  if g:HealthPercentage() < P.Commons.HealthstoneHP and R.Healthstone:IsReady() and R.Healthstone:CooldownRemains() <= 0 then if l.Cast(R.Healthstone, nil) then
      a7 = 40;
      return "Healthstone HP"
    end end
  ;
  if g:HealthPercentage() < P.Commons.HealPotHP and R.CosmicHealPot:IsReady() and R.CosmicHealPot:CooldownRemains() <= 0 then if l.Cast(R.CosmicHealPot, nil) then
      a7 = 45;
      return "CosmicHealPot HP"
    end end
  ;
  if g:HealthPercentage() < P.Commons.HealPotHP and R.HealPotL:IsReady() and R.HealPotL:CooldownRemains() <= 0 then if l.Cast(R.HealPotL, nil) then
      a7 = 41;
      return "HealPot LOW HP"
    end end
  ;
  if g:HealthPercentage() < P.Commons.HealPotHP and R.HealPotM:IsReady() and R.HealPotM:CooldownRemains() <= 0 then if l.Cast(R.HealPotM, nil) then
      a7 = 41;
      return "HealPot MEDIUM HP"
    end end
  ;
  if g:HealthPercentage() < P.Commons.HealPotHP and R.HealPotH:IsReady() and R.HealPotH:CooldownRemains() <= 0 then if l.Cast(R.HealPotH, nil) then
      a7 = 41;
      return "HealPot HIGH HP"
    end end
  ;
  if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then if Q.PistolShot:IsCastable() and f("mouseover"):IsInMeleeRange(20) then if l.Cast(Q.PistolShot, nil) then
        a8 = 1185763;
        return "explosive MO Pistol"
      end end end
  ;
  if Q.PistolShot:IsCastable() and f("target"):IsInMeleeRange(40) and string.find(UnitGUID("target"), 120651) then if l.Cast(Q.PistolShot, nil) then
      a7 = 185763;
      return "explosive Tar Pistol"
    end end
  ;
  F = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510,
    344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 158337 }
  if UnitExists("target") and Q.Shiv:IsReady() and not D then if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then for ap = 0, 10 do
        local aM, aM, aN, aO, aP, aQ, aM, aM, aM, aR = UnitBuff("target", ap)
        for aM, aS in pairs(F) do if aS == aR and aQ - aP + 500 / 1000 <= GetTime() then if l.Cast(Q.Shiv, nil) then
              a7 = 5938;
              return "Shiv Enrage"
            end end end
      end end end
  ;
  local aT = g:AffectingCombat() and 180 or 900;
  local aU;
  if i(8679):IsAvailable() and P.Commons.LethalPoison == "Wound Poison" then
    aU = g:BuffRemains(i(8679))
    if aU < aT and not g:IsCasting(i(8679)) then if l.Cast(i(8679)) then
        a7 = 203;
        return "Wound Poison Refresh"
      end end
  elseif i(2823):IsAvailable() and P.Commons.LethalPoison == "Deadly Poison" then
    aU = g:BuffRemains(i(2823))
    if aU < aT and not g:IsCasting(i(2823)) then if l.Cast(i(2823)) then
        a7 = 208;
        return "Deadly Poison Refresh"
      end end
  elseif i(315584):IsAvailable() and P.Commons.LethalPoison == "Instant Poison" then
    aU = g:BuffRemains(i(315584))
    if aU < aT and not g:IsCasting(i(315584)) then if l.Cast(i(315584)) then
        a7 = 205;
        return "Instant Poison Refresh"
      end end
  end
  ;
  aU = g:BuffRemains(i(381637))
  if i(381637):IsAvailable() and P.Commons.NonLethalPoison == "Atrophic Poison" then if aU < aT and not g:IsCasting(i(381637)) then if l.Cast(i(381637)) then
        a7 = 381637;
        return "Antropic Poison Refresh"
      end end elseif i(5761):IsAvailable() and P.Commons.NonLethalPoison == "Numbing Poison" then
    aU = g:BuffRemains(i(5761))
    if aU < aT and not g:IsCasting(NumbingPoison) then if l.Cast(i(5761)) then
        a7 = 204;
        return "Numbing Poison Refresh"
      end end
  elseif i(3408):IsAvailable() and P.Commons.NonLethalPoison == "Crippling Poison" then
    aU = g:BuffRemains(i(3408))
    if aU < aT and not g:IsCasting(NumbingPoison) then if l.Cast(i(3408)) then
        a7 = 206;
        return "Crippling Poison Refresh"
      end end
  end
  ;
  if not g:BuffUp(Q.VanishBuff) and not g:AffectingCombat() and not g:StealthUp(true, true) then
    W = O.Stealth(Q.Stealth)
    if W then return W end
  end
  ;
  if not g:AffectingCombat() and Q.Vanish:TimeSinceLastCast() > 1 then
    if not g:StealthUp(true, false) then
      W = O.Stealth(O.StealthSpell())
      if W then return W end
    end
    ;
    if N.TargetIsValid() and (not g:AffectingCombat() and p) then
      if n() and Q.MarkedforDeath:IsCastable() and a0 >= O.CPMaxSpend() - 1 and h:NPCID() ~= 170234 then if P.Commons.STMfDAsDPSCD then if l.Cast(Q.MarkedforDeath, nil) then
            a7 = 137619;
            return "Cast Marked for Death (OOC)"
          end else if l.Cast(Q.MarkedforDeath, nil) then
            a7 = 137619;
            return "Cast Marked for Death (OOC)"
          end end end
      ;
      if Q.AdrenalineRush:IsReady() and Q.ImprovedAdrenalineRush:IsAvailable() and _ <= 2 then if l.Cast(Q.AdrenalineRush) then
          a7 = 13750;
          return "Cast Adrenaline Rush (Opener)"
        end end
      ;
      if Q.RolltheBones:IsReady() and not g:DebuffUp(Q.Dreadblades) and (aq() == 0 or at()) and g:BuffUp(Q.AdrenalineRush) and Q.LoadedDice:IsAvailable() then if l.Cast(Q.RolltheBones) then
          a7 = 315508;
          return "Cast Roll the Bones (Opener)"
        end end
      ;
      if Q.SliceandDice:IsReady() and g:BuffRemains(Q.SliceandDice) < (1 + _) * 1.8 then if l.CastPooling(Q.SliceandDice) then
          a7 = 315496;
          return "Cast Slice and Dice (Opener)"
        end end
      ;
      if g:StealthUp(true, false) or g:BuffUp(Q.VanishBuff) then
        W = aH()
        if W then return "Stealth (Opener): " .. W end
        ;
        if Q.Ambush:IsCastable() then if l.Cast(Q.Ambush) then
            a7 = 8676;
            return "Cast Ambush (Opener)"
          end end
      elseif av() then
        W = aI()
        if W then return "Finish (Opener): " .. W end
      end
      ;
      if Q.SinisterStrike:IsCastable() then if l.Cast(Q.SinisterStrike) then
          a7 = 193315;
          return "Cast Sinister Strike (Opener)"
        end end
    end
    ;
    return
  end
  ;
  if Q.FanTheHammer:IsAvailable() and Q.PistolShot:TimeSinceLastCast() < g:GCDRemains() then _ = I(_, O.FanTheHammerCP()) end
  ;
  if Q.MarkedforDeath:IsCastable() and (g:AffectingCombat() or p or g:BuffUp(Q.VanishBuff)) then if V > 1 and N.CastTargetIf(Q.MarkedforDeath, T, "min", az, aB, nil, P.Commons.OffGCDasOffGCD.MarkedforDeath) then return
      "Cast Marked for Death (Cycle)" elseif V == 1 and a0 >= O.CPMaxSpend() - 1 and not g:DebuffUp(Q.Dreadblades) then if P.Commons.STMfDAsDPSCD then if l.Cast(Q.MarkedforDeath, P.Commons.OffGCDasOffGCD.MarkedforDeath) then
          a7 = 137619;
          return "Cast Marked for Death (ST)"
        end else l.CastSuggested(Q.MarkedforDeath) end end end
  ;
  if N.TargetIsValid() and (g:AffectingCombat() or p or g:BuffUp(Q.VanishBuff)) and not h:DebuffUp(i(1776)) and not h:DebuffUp(i(6770)) then
    if g:BuffUp(Q.Stealth) or g:BuffUp(Q.VanishBuff) or g:BuffUp(Q.Shadowmeld) then
      W = aH()
      if W then return "Stealth: " .. W end
    end
    ;
    local aV, aW, aM = GetSpellCooldown(57934)
    if P.Commons.AutoToT then if aV + aW - GetTime() <= 0 and Q.TricksoftheTrade:IsAvailable() and Q.TricksoftheTrade:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus")) and IsItemInRange(32698, "focus") then if l.Cast(Q.TricksoftheTrade) then
          a7 = 207;
          return "ToT Focus"
        end end end
    ;
    W = aE()
    if W then return "CDs: " .. W end
    ;
    if au() then
      W = aH()
      if W then return "Stealth CtO: " .. W end
    end
    ;
    if av() then
      W = aI()
      if W then return "Finish: " .. W end
      ;
      l.Cast(Q.PoolEnergy)
      return "Finish Pooling"
    end
    ;
    W = aJ()
    if W then return "Build: " .. W end
    ;
    if Q.ArcaneTorrent:IsCastable() and P.Commons.Enabled.Racials and n() and h:IsSpellInRange(Q.SinisterStrike) and a3 > 15 + a2 then if l.Cast(Q.ArcaneTorrent, nil) then
        a7 = 155145;
        return "Cast Arcane Torrent"
      end end
    ;
    if Q.ArcanePulse:IsCastable() and P.Commons.Enabled.Racials and n() and h:IsSpellInRange(Q.SinisterStrike) then if l.Cast(Q.ArcanePulse) then
        a7 = 260364;
        return "Cast Arcane Pulse"
      end end
    ;
    if Q.LightsJudgment:IsCastable() and P.Commons.Enabled.Racials and n() and h:IsInMeleeRange(5) then if l.Cast(Q.LightsJudgment, nil) then
        a7 = 255647;
        return "Cast Lights Judgment"
      end end
    ;
    if Q.BagofTricks:IsCastable() and P.Commons.Enabled.Racials and n() and h:IsInMeleeRange(5) then if l.Cast(Q.BagofTricks, nil) then
        a7 = 312411;
        return "Cast Bag of Tricks"
      end end
    ;
    if Q.PistolShot:IsCastable() and h:IsSpellInRange(Q.PistolShot) and not h:IsInRange(X) and not g:StealthUp(true, true) and a3 < 25 and (a0 >= 1 or a4 <= 1.2) then if l.Cast(Q.PistolShot) then
        a7 = 185763;
        return "Cast Pistol Shot (OOR)"
      end end
  end
end
;
local function aX()
end
;
function ReturnSpellOut() if a7 == 0 then return 0 else return a7 end end

;
function ReturnSpellMOOut() if a8 == 0 then return 0 else return a8 end end

;
l.SetAPL(260, aL, aX)
