local e = HeroLib
local t = HeroCache
local t = e.Unit
local a = t.Player
local a = t.Pet
local t = t.Target
local a = e.Spell
local o = e.Item
local o = HeroRotation
local o = a.Warrior.Fury
local i = a.Warrior.Arms
local a
a = e.AddCoreOverride("Spell.IsCastable", function(e, n, s, h, r, o)
    local a = a(e, n, s, h, r, o)
    if e == i.Charge then
        return a and e:Charges() >= 1 and (not t:IsInRange(8) and t:IsInRange(25))
    else
        return a
    end

end, 71)
local a
a = e.AddCoreOverride("Spell.IsCastable", function(e, n, i, s, h, r)
    local a = a(e, n, i, s, h, r)
    if e == o.Charge then
        return a and (o.Charge:Charges() >= 1 and (not t:IsInRange(8)) and t:IsInRange(25))
    else
        return a
    end

end, 72)

