local e = HeroLib
local t = HeroCache
local t = e.Unit
local i = t.Player
local a = t.Pet
local t = t.Target
local t = e.Spell
local a = e.Item
local n = HeroRotation
local o = t.DemonHunter.Havoc
local a = t.DemonHunter.Vengeance
local t
t = e.AddCoreOverride("Spell.IsCastable", function(e, a, d, h, r, s)
    local t = t(e, a, d, h, r, s)
    if e == o.Metamorphosis then
        local e = n.GUISettings.APL.DemonHunter.Havoc.HideMetaIfActive
        return t and ((e and i:BuffDown(o.MetamorphosisBuff)) or not e)
    else
        return t
    end

end, 577)
local t
t = e.AddCoreOverride("Spell.IsCastable", function(e, s, r, n, o, h)
    local t = t(e, s, r, n, o, h)
    if e == a.ImmolationAura and IsInJailersTower() then
        return t and i:BuffDown(a.ImmolationAuraBuff)
    else
        return t
    end

end, 581)

