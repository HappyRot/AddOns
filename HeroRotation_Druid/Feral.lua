local e, e = ...
local e = HeroDBC.DBC
local e = HeroLib
local t = HeroCache
local t = e.Unit
local a = t.Player
local a = t.Pet
local t = t.Target
local t = e.Spell
local t = e.MultiSpell
local e = e.Item
local e = HeroRotation
local t = e.AoEON
local t = e.CDsON
local t = e.Cast
local t = e.CastPooling
local function t()
    S.RipDebuff:RegisterAuraTracking()
    e.Print("Feral Druid rotation is currently a work in progress, but has been updated for patch 9.1.")
end

e.SetAPL(103, APL, t)

