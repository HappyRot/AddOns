local e, e = ...
local t = HeroLib
local e, e = HeroCache, t.Utils
local e = t.Unit
local a, o, o = e.Player, e.Pet, e.Target
local o, o = e.Focus, e.MouseOver
local o, o, o = e.Arena, e.Boss, e.Nameplate
local e, e = e.Party, e.Raid
local i = t.Spell
local e = t.Item
local e = HeroRotation
local e = e.Commons.Monk
local s = C_Timer
local e = math.max
local e = math.min
local e = pairs
local e = table.insert
local e = UnitAttackSpeed
local e = GetTime
local o = 115069
local n = i(280515)
local e = 0
local function i(t)
    local a = 10 + (n:IsAvailable() and 3 or 0)
    e = e + t
    s.After(a, function()
        e = e - t
    end)
end

function a:StaggerFull()
    return e
end

t:RegisterForCombatEvent(function(...)
    local e = { ... }
    if #e == 23 then
        local s, s, s, s, s, s, s, n, s, s, s, s, s, s, s, s, s, s, t, s, s, e = ...
        if n == a:GUID() and t == o then
            i(e)
        end

    else
        local s, s, s, s, s, s, s, t, s, s, s, s, s, s, s, n, s, s, e = ...
        if t == a:GUID() and n == o then
            i(e)
        end

    end

end, "SPELL_ABSORBED")

