local e, a = ...
local e = HeroLib
local t = HeroCache
local t = e.Unit
local o = t.Player
local t = t.Target
local t = e.Spell
local t = e.Item
local t = 0
e:RegisterForEvent(function(o)
    if not e.PulseInitialized then
        return 
    end

    if GetTime() > t then
        if a.PulseInit() ~= "Invalid SpecID" then
            t = GetTime() + 3
        end

    end

end, "PLAYER_SPECIALIZATION_CHANGED")

