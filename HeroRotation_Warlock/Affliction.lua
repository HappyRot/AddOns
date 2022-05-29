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
local Pet = Unit.Pet
local Target = Unit.Target
local Spell = HL.Spell
local MultiSpell = HL.MultiSpell
local Item = HL.Item
-- HeroRotation
local HR = HeroRotation
local AoEON = HR.AoEON
local CDsON = HR.CDsON
local Cast  = HR.Cast
-- Lua


local function OnInit()

end

function ReturnSpell()
	if shouldcast == 0 then
		return 0
	else
		return shouldcast
	end
end
	
function ReturnSpellMO()
	if MOshouldcast == 0 then
		return 0
	else
		return MOshouldcast
	end
end

HR.SetAPL(265, APL, OnInit)
