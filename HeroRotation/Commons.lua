--- ============================ HEADER ============================
--- ======= LOCALIZE =======
  -- Addon
  local addonName, HR = ...;
  -- HeroLib
  local HL = HeroLib;
  local Cache, Utils = HeroCache, HL.Utils;
  local Unit = HL.Unit;
  local Player = Unit.Player;
  local Target = Unit.Target;
  local Spell = HL.Spell;
  local Item = HL.Item;
  -- Lua
  local pairs = pairs;
  -- File Locals
  HR.Commons = {};
  local Commons = {};
  HR.Commons.Everyone = Commons;
  local Settings = HR.GUISettings.General;
  local AbilitySettings = HR.GUISettings.Abilities;

--- ============================ CONTENT ============================
-- Is the current target valid?
function Commons.TargetIsValid()
  return Target:Exists() and Player:CanAttack(Target) and not Target:IsDeadOrGhost();
end

-- Is the current unit valid during cycle?
function Commons.UnitIsCycleValid(Unit, BestUnitTTD, TimeToDieOffset)
  return not Unit:IsFacingBlacklisted() and not Unit:IsUserCycleBlacklisted() and (not BestUnitTTD or Unit:FilteredTimeToDie(">", BestUnitTTD, TimeToDieOffset));
end

-- Is it worth to DoT the unit?
function Commons.CanDoTUnit(Unit, HealthThreshold)
  return Unit:Health() >= HealthThreshold or Unit:IsDummy();
end

  local ActiveMitigationSpells = {
    Buff = {
      -- PR Legion
      Spell(191941), -- Darkstrikes (VotW - 1st)
      Spell(204151), -- Darkstrikes (VotW - 1st)
      -- T20 ToS
      Spell(239932) -- Felclaws (KJ)
    },
    Debuff = {
	  --T27 SoD
	  348074, -- Assailing Lance (Eye)
	  358988, -- Blackened Armor (Painsmith)
	  347607, -- Banshee's Mark (Sylvanas)
	  351180, -- Lashing Wound (Sylvanas)
	  353929 -- Banshee's Bane (Sylvanas)
	}, -- TODO ?
    Cast = {
      -- PR Legion
      197810, -- Wicked Slam (ARC - 3rd)
      197418, -- Vengeful Shear (BRH - 2nd)
      198079, -- Hateful Gaze (BRH - 3rd)
      214003, -- Coup de Grace (BRH - Trash)
      235751, -- Timber Smash (CotEN - 1st)
      193668, -- Savage Blade (HoV - 4th)
      227493, -- Mortal Strike (LOWR - 4th)
      228852, -- Shared Suffering (LOWR - 4th)
      193211, -- Dark Slash (MoS - 1st)
      200732, -- Molten Crash (NL - 4th)
      -- T20 ToS
      241635, -- Hammer of Creation (Maiden)
      241636, -- Hammer of Obliteration (Maiden)
      236494, -- Desolate (Avatar)
      239932, -- Felclaws (KJ)
      -- T21 Antorus
      254919, -- Forging Strike (Kin'garoth)
      244899, -- Fiery Strike (Coven)
      245458, -- Foe Breaker (Aggramar)
      248499, -- Sweeping Scythe (Argus)
      258039, -- Deadly Scythe (Argus)
	  --T27 SoD
	  346985, -- OverPower (Terra)
      350828, -- Deathlink (Eye)
      350202, -- Unending Strike (Nine)
      350475, -- Pierce Soul (Nine)
      351066, -- Shatter (Remnant)
	  350422, -- RuinBlade (Soulrender)
      352538, -- Purging Protocal (Guardian)
      350732, -- Sunder (Guardian)
      348071 -- Soul Fracture (Kel,Thuzad)
    },
    Channel = {} -- TODO ?
  }
  
local BigActiveMitigationSpells = {
    Buff = {
    },
    Debuff = {

	}, -- TODO ?
    Cast = {
	  --T27 SoD
      350732, -- Sunder (Guardian)
      355352, -- Obliterate (Guardian)
      353603, -- Diviner's Probe (Fatescribe)
    },
    Channel = {} -- TODO ?
  }
  
  function Commons.ActiveMitigationNeeded()
    if not Player:IsTanking(Target) then return false end

    -- Check casts
    if ActiveMitigationSpells.Cast[Target:CastSpellID()] then
      return true
    end

    -- Check buffs
    for _, Buff in pairs(ActiveMitigationSpells.Buff) do
      if Target:BuffUp(Buff, true) then
        return true
      end
    end

    -- Check Debuffs
    for _, Debuff in pairs(ActiveMitigationSpells.Debuff) do
	  local _, _, count1, _, _, _, _, _, _, spellId1, _, _, _, _, _, _ = UnitDebuff("player", Debuff)
	  if spellId1 ~= nil then
		if Debuff == spellId1 then
			return true
		end
      end
    end
	
    return false
  end

  function Commons.BigActiveMitigationNeeded()
    if not Player:IsTanking(Target) then return false end

    -- Check casts
    if BigActiveMitigationSpells.Cast[Target:CastSpellID()] then
      return true
    end

    -- Check buffs
    for _, Buff in pairs(BigActiveMitigationSpells.Buff) do
      if Target:BuffUp(Buff, true) then
        return true
      end
    end

    -- Check Debuffs
    for _, Debuff in pairs(BigActiveMitigationSpells.Debuff) do
	  local _, _, count1, _, _, _, _, _, _, spellId1, _, _, _, _, _, _ = UnitDebuff("player", i)
	  if spellId1 ~= nil then
		if Debuff == spellId1 then
			return true
		end
      end
    end
	
    return false
  end
  

do
  local HealingAbsorbedSpells = {
    Debuff = {
      -- T21 Antorus
      Spell(243961) -- Misery (Varimathras)
    }
  }
  function Player:HealingAbsorbed()
    for _, Debuff in pairs(HealingAbsorbedSpells.Debuff) do
      if Player:DebuffUp(Debuff, true) then
        return true
      end
    end

    return false
  end
end

-- Interrupt
function Commons.Interrupt(Range, Spell, Setting, StunSpells)
  if Settings.InterruptEnabled and Target:IsInterruptible() and Target:IsInRange(Range) then
    if Spell:IsCastable() then
      if HR.Cast(Spell, Setting) then return "Cast " .. Spell:Name() .. " (Interrupt)"; end
    elseif Settings.InterruptWithStun and Target:CanBeStunned() then
      if StunSpells then
        for i = 1, #StunSpells do
          if StunSpells[i][1]:IsCastable() and StunSpells[i][3]() then
            if HR.Cast(StunSpells[i][1]) then return StunSpells[i][2]; end
          end
        end
      end
    end
  end
end

-- Is in Solo Mode?
function Commons.IsSoloMode()
  return Settings.SoloMode and not Player:IsInRaidArea() and not Player:IsInDungeonArea();
end

-- Cycle Unit Helper
function Commons.CastCycle(Object, Enemies, Condition, OutofRange, OffGCD, DisplayStyle)
  if Condition(Target) then
    return HR.Cast(Object, OffGCD, DisplayStyle, OutofRange)
  end
  if HR.AoEON() then
    local TargetGUID = Target:GUID()
    for _, CycleUnit in pairs(Enemies) do
      if CycleUnit:GUID() ~= TargetGUID and not CycleUnit:IsFacingBlacklisted() and not CycleUnit:IsUserCycleBlacklisted() and Condition(CycleUnit) then
        HR.CastLeftNameplate(CycleUnit, Object)
        break
      end
    end
  end
end

  -- Target If Helper
function Commons.CastTargetIf(Object, Enemies, TargetIfMode, TargetIfCondition, Condition, OutofRange, OffGCD, DisplayStyle)
  local TargetCondition = (not Condition or (Condition and Condition(Target)))
  if not HR.AoEON() and TargetCondition then
    return HR.Cast(Object, OffGCD, DisplayStyle, OutofRange)
  end
  if HR.AoEON() then
    local BestUnit, BestConditionValue = nil, nil
    for _, CycleUnit in pairs(Enemies) do
      if not CycleUnit:IsFacingBlacklisted() and not CycleUnit:IsUserCycleBlacklisted() and (CycleUnit:AffectingCombat() or CycleUnit:IsDummy())
        and (not BestConditionValue or Utils.CompareThis(TargetIfMode, TargetIfCondition(CycleUnit), BestConditionValue)) then
        BestUnit, BestConditionValue = CycleUnit, TargetIfCondition(CycleUnit)
      end
    end
    if BestUnit then
      if TargetCondition and (BestUnit:GUID() == Target:GUID() or BestConditionValue == TargetIfCondition(Target)) then
        return HR.Cast(Object, OffGCD, DisplayStyle, OutofRange)
      elseif ((Condition and Condition(BestUnit)) or not Condition) then
        HR.CastLeftNameplate(BestUnit, Object)
      end
    end
  end
end

local CombatTracker 							= {
	Data			 						= {},
	Doubles 								= {
		[3]  								= "Holy + Physical",
		[5]  								= "Fire + Physical",
		[9]  								= "Nature + Physical",
		[17] 								= "Frost + Physical",
		[33] 								= "Shadow + Physical",
		[65] 								= "Arcane + Physical",
		[127]								= "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical",
	},
	SchoolDoubles							= {
		Holy								= {
			[2]								= "Holy",
			[3]								= "Holy + Physical",
			[6]								= "Fire + Holy",
			[10]							= "Nature + Holy",
			[18]							= "Frost + Holy",
			[34]							= "Shadow + Holy",
			[66]							= "Arcane + Holy",
			[126]							= "Arcane + Shadow + Frost + Nature + Fire + Holy",
			[127]							= "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical",
		},
		Fire								= {
			[4]								= "Fire",
			[5]								= "Fire + Physical",
			[6]								= "Fire + Holy",
			[12]							= "Nature + Fire",
			[20]							= "Frost + Fire",
			[28]							= "Frost + Nature + Fire",
			[36]							= "Shadow + Fire",
			[68]							= "Arcane + Fire",
			[124]							= "Arcane + Shadow + Frost + Nature + Fire",
			[126]							= "Arcane + Shadow + Frost + Nature + Fire + Holy",
			[127]							= "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical",			
		},
		Nature								= {
			[8]								= "Nature",
			[9]								= "Nature + Physical",
			[10]							= "Nature + Holy",
			[12]							= "Nature + Fire",
			[24]							= "Frost + Nature",
			[28]							= "Frost + Nature + Fire",
			[40]							= "Shadow + Nature",
			[72]							= "Arcane + Nature",
			[124]							= "Arcane + Shadow + Frost + Nature + Fire",
			[126]							= "Arcane + Shadow + Frost + Nature + Fire + Holy",
			[127]							= "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical",
		},
		Frost								= {
			[16]							= "Frost",			
			[17]							= "Frost + Physical",			
			[18]							= "Frost + Holy",			
			[20]							= "Frost + Fire",			
			[24]							= "Frost + Nature",
			[28]							= "Frost + Nature + Fire",			
			[48]							= "Shadow + Frost",			
			[80]							= "Arcane + Frost",									
			[124]							= "Arcane + Shadow + Frost + Nature + Fire",									
			[126]							= "Arcane + Shadow + Frost + Nature + Fire + Holy",									
			[127]							= "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical",									
		},
		Shadow								= {
			[32]							= "Shadow",
			[33]							= "Shadow + Physical",
			[34]							= "Shadow + Holy",
			[36]							= "Shadow + Fire",
			[40]							= "Shadow + Nature",
			[48]							= "Shadow + Frost",
			[96]							= "Arcane + Shadow",
			[124]							= "Arcane + Shadow + Frost + Nature + Fire",
			[126]							= "Arcane + Shadow + Frost + Nature + Fire + Holy",
			[127]							= "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical",
		},
		Arcane								= {
			[64]							= "Arcane",
			[65]							= "Arcane + Physical",
			[66]							= "Arcane + Holy",
			[68]							= "Arcane + Fire",
			[72]							= "Arcane + Nature",
			[80]							= "Arcane + Frost",
			[96]							= "Arcane + Shadow",
			[124]							= "Arcane + Shadow + Frost + Nature + Fire",
			[126]							= "Arcane + Shadow + Frost + Nature + Fire + Holy",
			[127]							= "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical",
		},
	},
}
--Magic Damage Listener
local LastTimeMagic = 99999

