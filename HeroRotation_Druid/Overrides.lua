local o = HeroLib
local e = HeroCache
local t = o.Unit
local e = t.Player
local a = t.Pet
local i = t.Target
local a = o.Spell
local t = o.Item
local t = HeroRotation
local s = a.Druid.Guardian
local t = a.Druid.Balance
local n = a.Druid.Feral
o.AddCoreOverride("Player.AstralPowerP", function()
    local a = e:AstralPower()
    if not e:IsCasting() then
        return a
    else
                                        if e:IsCasting(t.Wrath) then
            return a + 6
        elseif e:IsCasting(t.Starfire) or e:IsCasting(t.StellarFlare) then
            return a + 8
        elseif e:IsCasting(t.NewMoon) then
            return a + 10
        elseif e:IsCasting(t.HalfMoon) then
            return a + 20
        elseif e:IsCasting(t.FullMoon) then
            return a + 40
        else
            return a
        end

    end

end, 102)
local h
h = o.AddCoreOverride("Spell.IsCastable", function(a, o, s, n, r, l)
    local d = true
    if o then
        local e = n or i
        d = e:IsInRange(o, s)
    end

    local o = h(a, o, s, n, r, l)
            if a == t.MoonkinForm then
        return o and e:BuffDown(a)
    elseif a == t.StellarFlare then
        return o and not e:IsCasting(a)
    elseif a == t.Wrath or a == t.Starfire then
        return o and not (e:IsCasting(a) and a:Count() == 1)
    else
        return o
    end

end, 102)
local a
a = o.AddCoreOverride("Spell.IsCastable", function(t, r, s, h, i, o)
    local a = a(t, r, s, h, i, o)
        if t == n.CatForm or t == n.MoonkinForm then
        return a and e:BuffDown(t)
    elseif t == n.Prowl then
        return a and t:IsUsable()
    else
        return a
    end

end, 103)
local t
t = o.AddCoreOverride("Spell.IsCastable", function(a, n, o, d, r, h)
    local t = t(a, n, o, d, r, h)
    if a == s.Thrash then
        return t and (e:Rage() <= 95 and i:DebuffRemains(s.ThrashDebuff) > e:GCD() * 2 or i:DebuffStack(s.ThrashDebuff) < 3)
    else
        return t
    end

end, 104)

