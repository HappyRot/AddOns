local e, e = ...
local e = HeroLib
local t = HeroCache
local t = e.Unit
local a = t.Player
local t = t.Target
local t = e.Spell
local t = e.Item
e:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, a, o, o, o, t)
    if t ~= 46585 then
        return 
    end

    e.GhoulTable.SummonedGhoul = a
    e.GhoulTable.SummonExpiration = time() + 60
end, "SPELL_SUMMON")
e:RegisterForSelfCombatEvent(function(a, a, a, a, a, a, a, a, a, a, a, t)
    if t ~= 327574 then
        return 
    end

    e.GhoulTable.SummonedGhoul = nil
    e.GhoulTable.SummonExpiration = nil
end, "SPELL_CAST_SUCCESS")
e:RegisterForCombatEvent(function(a, a, a, a, a, a, a, t)
    if t ~= e.GhoulTable.SummonedGhoul then
        return 
    end

    e.GhoulTable.SummonedGhoul = nil
    e.GhoulTable.SummonExpiration = nil
end, "UNIT_DESTROYED")
e.GhoulTable = { SummonedGhoul = nil, SummonExpiration = nil }
function e.GhoulTable:remains()
    if e.GhoulTable.SummonExpiration == nil then
        return 0
    end

    return e.GhoulTable.SummonExpiration - time()
end

function e.GhoulTable:active()
    return e.GhoulTable.SummonedGhoul ~= nil and e.GhoulTable:remains() > 0
end


