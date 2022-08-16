local e = HeroLib
local t = HeroCache
local t = e.Unit
local a = t.Player
local a = t.Pet
local t = t.Target
local t = e.Spell
local o = e.Item
local o = HeroRotation
local i = t.DeathKnight.Frost
local t = t.DeathKnight.Unholy
local o
o = e.AddCoreOverride("Spell.IsCastable", function(e, t, r, h, s, n)
    local t = o(e, t, r, h, s, n)
    if e == i.RaiseDead then
        return (not a:IsActive()) and t
    else
        return t
    end

end, 251)
local o
o = e.AddCoreOverride("Spell.IsCastable", function(e, r, s, h, n, i)
    local o = o(e, r, s, h, n, i)
        if e == t.RaiseDead then
        return (not a:IsActive()) and o
    elseif e == t.DarkTransformation then
        return (a:IsActive() and a:NPCID() == 26125) and o
    else
        return o
    end

end, 252)
local a
a = e.AddCoreOverride("Spell.IsReady", function(e, o, n, i, s, h)
    local a = a(e, o, n, i, s, h)
    if e == t.Epidemic then
        return (t.VirulentPlagueDebuff:AuraActiveCount() > 1) and a
    else
        return a
    end

end, 252)

