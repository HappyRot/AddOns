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
local function t()
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

e.SetAPL(265, APL, t)

