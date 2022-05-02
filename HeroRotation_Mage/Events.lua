--- ============================ HEADER ============================
--- ======= LOCALIZE =======
-- Addon
local addonName, addonTable = ...
-- HeroLib
local HL = HeroLib
local Cache = HeroCache
local HR = HeroRotation
local Unit = HL.Unit
local Player = Unit.Player
local Target = Unit.Target
local Spell = HL.Spell
local Item = HL.Item
local Mage = HR.Commons.Mage
-- Lua
local select = select
-- WoW API
local GetTime = GetTime
local C_Timer = C_Timer

--- ============================ CONTENT ============================
--- ======= NON-COMBATLOG =======


--- ======= COMBATLOG =======
  --- Combat Log Arguments
    ------- Base -------
      --     1        2         3           4           5           6              7             8         9        10           11
      -- TimeStamp, Event, HideCaster, SourceGUID, SourceName, SourceFlags, SourceRaidFlags, DestGUID, DestName, DestFlags, DestRaidFlags

    ------- Prefixes -------
      --- SWING
      -- N/A

      --- SPELL & SPELL_PACIODIC
      --    12        13          14
      -- SpellID, SpellName, SpellSchool

    ------- Suffixes -------
      --- _CAST_START & _CAST_SUCCESS & _SUMMON & _RESURRECT
      -- N/A

      --- _CAST_FAILED
      --     15
      -- FailedType

      --- _AURA_APPLIED & _AURA_REMOVED & _AURA_REFRESH
      --    15
      -- AuraType

      --- _AURA_APPLIED_DOSE
      --    15       16
      -- AuraType, Charges

      --- _INTERRUPT
      --      15            16             17
      -- ExtraSpellID, ExtraSpellName, ExtraSchool

      --- _HEAL
      --   15         16         17        18
      -- Amount, Overhealing, Absorbed, Critical

      --- _DAMAGE
      --   15       16       17       18        19       20        21        22        23
      -- Amount, Overkill, School, Resisted, Blocked, Absorbed, Critical, Glancing, Crushing

      --- _MISSED
      --    15        16           17
      -- MissType, IsOffHand, AmountMissed

    ------- Special -------
      --- UNIT_DIED, UNIT_DESTROYED
      -- N/A

  --- End Combat Log Arguments

  -- Arguments Variables
  HL.RoPTime = 0

  --------------------------
  -------- Arcane ----------
  --------------------------

  HL:RegisterForSelfCombatEvent(
    function (...)
      DateEvent,_,_,_,_,_,_,DestGUID,_,_,_, SpellID = select(1,...);
      if SpellID == 116014 and Player:GUID() == DestGUID then --void RuneofPower
        HL.RoPTime = GetTime()
      end

    end
    , "SPELL_AURA_APPLIED"
  )

  HL:RegisterForSelfCombatEvent(
    function (...)
      DateEvent,_,_,_,_,_,_,DestGUID,_,_,_, SpellID = select(1,...);
      if SpellID == 116014 and Player:GUID() == DestGUID then --void erruption
        HL.RoPTime = 0
      end
    end
    , "SPELL_AURA_REMOVED"
  )

  --------------------------
  -------- Frost -----------
  --------------------------

  local FrozenOrbFirstHit = true
  local FrozenOrbHitTime = 0

  HL:RegisterForSelfCombatEvent(function(...)
    local spellID = select(12, ...)
    if spellID == 84721 and FrozenOrbFirstHit then
      FrozenOrbFirstHit = false
      FrozenOrbHitTime = GetTime()
      C_Timer.After(10, function()
        FrozenOrbFirstHit = true
        FrozenOrbHitTime = 0
      end)
    end
  end, "SPELL_DAMAGE")

  function Player:FrozenOrbGroundAoeRemains()
    return math.max((FrozenOrbHitTime - (GetTime() - 10) - HL.RecoveryTimer()), 0)
  end

  local brain_freeze_active = false

  HL:RegisterForSelfCombatEvent(function(...)
    local spellID = select(12, ...)
    if spellID == Spell.Mage.Frost.Flurry:ID() then
      brain_freeze_active =     Player:BuffUp(Spell.Mage.Frost.BrainFreezeBuff)
                            or  Spell.Mage.Frost.BrainFreezeBuff:TimeSinceLastRemovedOnPlayer() < 0.1
    end
  end, "SPELL_CAST_SUCCESS")

  function Player:BrainFreezeActive()
    if self:IsCasting(Spell.Mage.Frost.Flurry) then
      return false
    else
      return brain_freeze_active
    end
  end
