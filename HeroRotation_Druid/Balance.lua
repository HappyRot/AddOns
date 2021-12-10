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
local GetCombatRating = GetCombatRating
local floor = math.floor
local ceil = math.ceil
local max = math.max



local function OnInit()
  HR.Print("Balance Druid rotation is currently a work in progress, but has been updated for patch 9.1.")
end

HR.SetAPL(102, APL, OnInit)
