--- ============================ HEADER ============================
-- HeroLib
local HL      = HeroLib;
local Cache   = HeroCache;
local Unit    = HL.Unit;
local Player  = Unit.Player;
local Pet     = Unit.Pet;
local Target  = Unit.Target;
local Spell   = HL.Spell;
local Item    = HL.Item;
-- HeroRotation
local HR      = HeroRotation;
-- Spells
local SpellFrost   = Spell.DeathKnight.Frost;
local SpellUnholy  = Spell.DeathKnight.Unholy;
-- Lua

--- ============================ CONTENT ============================
-- Generic

-- Blood, ID: 250

-- Frost, ID: 251
local OldFrostIsCastable
OldFrostIsCastable = HL.AddCoreOverride("Spell.IsCastable",
  function (self, Range, AoESpell, ThisUnit, BypassRecovery, Offset)
    local BaseCheck = OldFrostIsCastable(self, Range, AoESpell, ThisUnit, BypassRecovery, Offset)
    if self == SpellFrost.RaiseDead then
      return (not Pet:IsActive()) and BaseCheck
    else
      return BaseCheck
    end
  end
, 251);

-- Unholy, ID: 252
local OldUHIsCastable
OldUHIsCastable = HL.AddCoreOverride("Spell.IsCastable",
  function (self, Range, AoESpell, ThisUnit, BypassRecovery, Offset)
    local BaseCheck = OldUHIsCastable(self, Range, AoESpell, ThisUnit, BypassRecovery, Offset)
    if self == SpellUnholy.RaiseDead then
      return (not Pet:IsActive()) and BaseCheck
    elseif self == SpellUnholy.DarkTransformation then
      return (Pet:IsActive() and Pet:NPCID() == 26125) and BaseCheck
    else
      return BaseCheck
    end
  end
, 252);

local OldUHIsReady
OldUHIsReady = HL.AddCoreOverride("Spell.IsReady",
  function (self, Range, AoESpell, ThisUnit, BypassRecovery, Offset)
    local BaseCheck = OldUHIsReady(self, Range, AoESpell, ThisUnit, BypassRecovery, Offset)
    if self == SpellUnholy.Epidemic then
      return (SpellUnholy.VirulentPlagueDebuff:AuraActiveCount() > 1) and BaseCheck
    else
      return BaseCheck
    end
  end
, 252);

-- Example (Arcane Mage)
-- HL.AddCoreOverride ("Spell.IsCastableP",
-- function (self, Range, AoESpell, ThisUnit, BypassRecovery, Offset)
--   if Range then
--     local RangeUnit = ThisUnit or Target;
--     return self:IsLearned() and self:CooldownRemainsP( BypassRecovery, Offset or "Auto") == 0 and RangeUnit:IsInRange( Range, AoESpell );
--   elseif self == SpellArcane.MarkofAluneth then
--     return self:IsLearned() and self:CooldownRemainsP( BypassRecovery, Offset or "Auto") == 0 and not Player:IsCasting(self);
--   else
--     return self:IsLearned() and self:CooldownRemainsP( BypassRecovery, Offset or "Auto") == 0;
--   end;
-- end
-- , 62);
