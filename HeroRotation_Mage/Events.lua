local e, e = ...
local e = HeroLib
local t = HeroCache
local i = HeroRotation
local a = e.Unit
local t = a.Player
local a = a.Target
local o = e.Spell
local a = e.Item
local a = i.Commons.Mage
local a = select
local s = GetTime
local h = C_Timer
e.RoPTime = 0
e:RegisterForSelfCombatEvent(function(...)
    DateEvent, _, _, _, _, _, _, DestGUID, _, _, _, SpellID = a(1, ...)
    if SpellID == 116014 and t:GUID() == DestGUID then
        e.RoPTime = s()
    end

end, "SPELL_AURA_APPLIED")
e:RegisterForSelfCombatEvent(function(...)
    DateEvent, _, _, _, _, _, _, DestGUID, _, _, _, SpellID = a(1, ...)
    if SpellID == 116014 and t:GUID() == DestGUID then
        e.RoPTime = 0
    end

end, "SPELL_AURA_REMOVED")
local i = true
local n = 0
e:RegisterForSelfCombatEvent(function(...)
    local e = a(12, ...)
    if e == 84721 and i then
        i = false
        n = s()
        h.After(10, function()
            i = true
            n = 0
        end)
    end

end, "SPELL_DAMAGE")
function t:FrozenOrbGroundAoeRemains()
    return math.max((n - (s() - 10) - e.RecoveryTimer()), 0)
end

local i = false
e:RegisterForSelfCombatEvent(function(...)
    local e = a(12, ...)
    if e == o.Mage.Frost.Flurry:ID() then
        i = t:BuffUp(o.Mage.Frost.BrainFreezeBuff) or o.Mage.Frost.BrainFreezeBuff:TimeSinceLastRemovedOnPlayer() < .1
    end

end, "SPELL_CAST_SUCCESS")
function t:BrainFreezeActive()
    if self:IsCasting(o.Mage.Frost.Flurry) then
        return false
    else
        return i
    end

end


