--- ============================ HEADER ============================
--- ======= LOCALIZE =======
-- Addon
local addonName, addonTable = ...
-- HeroDBC
local DBC = HeroDBC.DBC
-- HeroLib
local HL         = HeroLib
local Cache      = HeroCache
local Unit       = HL.Unit
local Player     = Unit.Player
local Target     = Unit.Target
local Pet        = Unit.Pet
local Spell      = HL.Spell
local MultiSpell = HL.MultiSpell
local Item       = HL.Item
-- HeroRotation
local HR            = HeroRotation
local AoEON         = HR.AoEON
local CDsON         = HR.CDsON
local Cast          = HR.Cast
local CastSuggested = HR.CastSuggested
local CovenantsON = HeroRotationCharDB.Toggles[4]
local SmallCDsOn = HeroRotationCharDB.Toggles[5]
local Opener1 = HeroRotationCharDB.Toggles[6]
local UsePots = not HeroRotationCharDB.Toggles[15]
local StopAutoSwap = HeroRotationCharDB.Toggles[12]
local ForceAoE = HeroRotationCharDB.Toggles[60]
local FBCast
-- lua
local max        = math.max
local ceil       = math.ceil
-- Commons
local Mage       = HR.Commons.Mage

--- ============================ CONTENT ===========================
--- ======= APL LOCALS =======
-- luacheck: max_line_length 9999


HR.SetAPL(63, APL, Init)
