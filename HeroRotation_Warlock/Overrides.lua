local o = HeroLib
local e = HeroCache
local t = o.Unit
local e = t.Player
local s = t.Pet
local n = t.Target
local a = o.Spell
local t = o.Item
local t = HeroRotation
local i = a.Warlock.Affliction
local t = a.Warlock.Demonology
local a = a.Warlock.Destruction
local r = math.min
local u = math.max
local c = math.floor
o.AddCoreOverride("Player.SoulShardsP", function()
    local t = e:SoulShards()
    if not e:IsCasting() then
        return t
    else
        if e:IsCasting(i.MaleficRapture) or e:IsCasting(i.SeedofCorruption) or e:IsCasting(i.VileTaint) or e:IsCasting(i.SummonPet) then
            return t - 1
        else
            return t
        end

    end

end, 265)
local h
h = o.AddCoreOverride("Spell.IsCastable", function(a, t, o, r, l, u)
    local d = true
    if t then
        local e = r or n
        d = e:IsInRange(t, o)
    end

    local t = h(a, t, o, r, l, u)
    if a == i.SummonPet then
        return t and e:SoulShardsP() > 0 and not (s:IsActive() or e:BuffUp(i.GrimoireofSacrificeBuff))
    else
        return t
    end

end, 265)
local h
h = o.AddCoreOverride("Spell.IsReady", function(t, a, o, s, d, r)
    local l = true
    if a then
        local e = s or n
        l = e:IsInRange(a, o)
    end

    local a = h(t, a, o, s, d, r)
        if t == i.VileTaint or t == i.ScouringTithe or t == i.UnstableAffliction or t == i.SoulRot then
        return a and not e:IsCasting(t)
    elseif t == i.SeedofCorruption or t == i.Haunt then
        return a and not e:IsCasting(t) and not t:InFlight()
    else
        return a
    end

end, 265)
o.AddCoreOverride("Player.SoulShardsP", function()
    local a = e:SoulShards()
    a = c(a)
    if not e:IsCasting() then
        return a
    else
                                                if e:IsCasting(t.SummonDemonicTyrant) and e:Level() >= 58 then
            return 5
        elseif e:IsCasting(t.Demonbolt) then
            return r(a + 2, 5)
        elseif e:IsCasting(t.ShadowBolt) or e:IsCasting(t.SoulStrike) then
            return r(a + 1, 5)
        elseif e:IsCasting(t.HandofGuldan) then
            return u(a - 3, 0)
        elseif e:IsCasting(t.CallDreadstalkers) or e:IsCasting(t.BilescourgeBombers) then
            return a - 2
        elseif e:IsCasting(t.SummonVilefiend) or e:IsCasting(t.SummonPet) or e:IsCasting(t.NetherPortal) then
            return a - 1
        else
            return a
        end

    end

end, 266)
local i
i = o.AddCoreOverride("Spell.IsCastable", function(a, o, r, h, u, l)
    local d = true
    if o then
        local e = h or n
        d = e:IsInRange(o, r)
    end

    local o = i(a, o, r, h, u, l)
        if a == t.SummonPet then
        return o and not s:IsActive() and e:SoulShardsP() > 0
    elseif a == t.SummonDemonicTyrant then
        return o and not e:IsCasting(a)
    else
        return o
    end

end, 266)
local i
i = o.AddCoreOverride("Spell.IsReady", function(a, o, h, s, r, l)
    local d = true
    if o then
        local e = s or n
        d = e:IsInRange(o, h)
    end

    local o = i(a, o, h, s, r, l)
    if a == t.SummonVilefiend or a == t.CallDreadstalkers or a == t.NetherPortal or a == t.DecimatingBolt or a == t.ScouringTithe then
        return o and not e:IsCasting(a)
    else
        return o
    end

end, 266)
o.AddCoreOverride("Player.SoulShardsP", function()
    local t = e:SoulShards()
    if not e:IsCasting() then
        return t
    else
        if e:IsCasting(a.ChaosBolt) then
            return t - 2
        else
            return t
        end

    end

end, 267)
local i
i = o.AddCoreOverride("Spell.IsCastable", function(t, o, r, h, u, l)
    local d = true
    if o then
        local e = h or n
        d = e:IsInRange(o, r)
    end

    local o = i(t, o, r, h, u, l)
                            if t == a.SummonPet then
        return o and not s:IsActive()
    elseif t == a.Cataclysm then
        return o and not e:IsCasting(a.Cataclysm)
    elseif t == a.ChannelDemonfire then
        return o and not e:IsCasting(a.ChannelDemonfire)
    elseif t == a.ScourgeStrike then
        return o and not e:IsCasting(a.ScourgeStrike)
    elseif t == a.DecimatingBolt then
        return o and not e:IsCasting(a.DecimatingBolt)
    elseif t == a.SoulRot then
        return o and not e:IsCasting(a.SoulRot)
    elseif t == a.ImpendingCatastrophe then
        return o and not e:IsCasting(a.ImpendingCatastrophe)
    else
        return o
    end

end, 267)
local e
e = o.AddCoreOverride("Player.AffectingCombat", function(t)
    return a.Incinerate:InFlight() or e(t)
end, 267)

