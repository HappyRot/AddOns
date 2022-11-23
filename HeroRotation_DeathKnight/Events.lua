local e, e = ...
local e = HeroLib
local t = HeroCache
local t = e.Unit
local a = t.Player
local t = t.Target
local t = e.Spell
local t = e.Item
local t = GetTime
e:RegisterForSelfCombatEvent(function(i, i, i, i, i, i, i, o, i, i, i, a)
    if a == 46585 then
        e.GhoulTable.SummonedGhoul = o
        e.GhoulTable.SummonExpiration = t() + 60
    end

    if a == 49206 then
        e.GhoulTable.SummonedGargoyle = o
        e.GhoulTable.GargoyleExpiration = t() + 25
    end

end, "SPELL_SUMMON")
e:RegisterForSelfCombatEvent(function(a, a, a, a, a, a, a, a, a, a, a, t)
    if t ~= 327574 then
        return 
    end

    e.GhoulTable.SummonedGhoul = nil
    e.GhoulTable.SummonExpiration = nil
end, "SPELL_CAST_SUCCESS")
e:RegisterForCombatEvent(function(a, a, a, a, a, a, a, t)
    if t == e.GhoulTable.SummonedGhoul then
        e.GhoulTable.SummonedGhoul = nil
        e.GhoulTable.SummonExpiration = nil
    end

    if t == e.GhoulTable.SummonedGargoyle then
        e.GhoulTable.SummonedGargoyle = nil
        e.GhoulTable.GargoyleExpiration = nil
    end

end, "UNIT_DESTROYED")
e.GhoulTable = { SummonedGhoul = nil, SummonExpiration = nil, SummonedGargoyle = nil, GargoyleExpiration = nil }
function e.GhoulTable:remains()
    if e.GhoulTable.SummonExpiration == nil then
        return 0
    end

    return e.GhoulTable.SummonExpiration - t()
end

function e.GhoulTable:active()
    return e.GhoulTable.SummonedGhoul ~= nil and e.GhoulTable:remains() > 0
end

function e.GhoulTable:gargremains()
    if e.GhoulTable.GargoyleExpiration == nil then
        return 0
    end

    return e.GhoulTable.GargoyleExpiration - t()
end

function e.GhoulTable:gargactive()
    return e.GhoulTable.SummonedGargoyle ~= nil and e.GhoulTable:gargremains() > 0
end


