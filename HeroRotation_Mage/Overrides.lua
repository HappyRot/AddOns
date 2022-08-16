local o = HeroLib
local e = HeroCache
local t = o.Unit
local e = t.Player
local u = t.Pet
local s = t.Target
local t = o.Spell
local l = o.Item
local n = HeroRotation
local i = t.Mage.Arcane
local a = t.Mage.Fire
local t = t.Mage.Frost
local r = { General = n.GUISettings.General, Commons = n.GUISettings.APL.Mage.Commons, Frost = n.GUISettings.APL.Mage.Frost, Fire = n.GUISettings.APL.Mage.Fire, Arcane = n.GUISettings.APL.Mage.Arcane }
local function n(e)
    if e then
        return 1
    else
        return 0
    end

end

local function n(e)
    return e ~= 0
end

local n = i.RuneofPower:BaseDuration()
local function h(t)
    return math.max(n - t:TimeSinceLastAppliedOnPlayer() - e:GCD(), 0)
end

local d
d = o.AddCoreOverride("Player.AffectingCombat", function(e)
    return i.Frostbolt:InFlight() or i.ArcaneBlast:InFlight() or d(e)
end, 64)
local d
d = o.AddCoreOverride("Spell.CooldownRemains", function(t, a, o)
    if t == i.RuneofPower and e:IsCasting(t) then
        return n
    else
        return d(t, a, o)
    end

end, 62)
local d
d = o.AddCoreOverride("Player.BuffRemains", function(t, e, a, o)
    if e == i.RuneofPowerBuff then
        return t:IsCasting(i.RuneofPower) and n or h(e)
    else
        return d(t, e, a, o)
    end

end, 62)
local d
d = o.AddCoreOverride("Player.BuffUp", function(e, t, a, o)
    local a = d(e, t, a, o)
        if t == i.RuneofPowerBuff then
        return e:IsCasting(i.RuneofPower) or (h(t) > 0)
    elseif t == i.RuleofThreesBuff then
        if e:IsCasting(i.ArcaneBlast) then
            return e:ArcaneCharges() == 2
        else
            return a
        end

    else
        return a
    end

end, 62)
o.AddCoreOverride("Spell.IsCastable", function(t, o, u, d, n, h)
    if t:CastTime() > 0 and e:IsMoving() and r.Arcane.MovingRotation then
        return false
    end

    local a = true
    if o then
        local e = d or s
        a = e:IsInRange(o, u)
    end

    local a = t:IsLearned() and t:CooldownRemains(n, h or "Auto") == 0 and a and e:Mana() >= t:Cost()
                                if t == i.PresenceofMind then
        return a and e:BuffDown(i.PresenceofMind)
    elseif t == i.MirrorsofTorment then
        return a and not e:IsCasting(t)
    elseif t == i.RadiantSpark then
        return a and not e:IsCasting(t)
    elseif t == i.ShiftingPower then
        return a and not e:IsCasting(t)
    elseif t == i.Deathborne then
        return a and not e:IsCasting(t)
    elseif t == i.TouchoftheMagi then
        return a and not e:IsCasting(t)
    elseif t == i.Frostbolt then
        return a and not e:IsCasting(t)
    elseif t == i.ConjureManaGem then
        local o = l.Mage.Arcane.ManaGem
        local i = o:CooldownRemains()
        return a and (not e:IsCasting(t)) and not (o:IsReady() or i > 0)
    else
        return a
    end

end, 62)
local i
i = o.AddCoreOverride("Player.BuffStack", function(e, t, o, n)
    local o = i(e, t, o, n)
    if t == a.PyroclasmBuff and e:IsCasting(a.Pyroblast) then
        return 0
    else
        return o
    end

end, 63)
local i
i = o.AddCoreOverride("Player.BuffRemains", function(t, e, o, s)
    local o = i(t, e, o, s)
        if e == a.RuneofPowerBuff then
        return t:IsCasting(a.RuneofPower) and n or h(e)
    elseif e == a.PyroclasmBuff and t:IsCasting(a.Pyroblast) then
        return 0
    end

    return o
end, 63)
o.AddCoreOverride("Player.BuffUp", function(t, e, i, o)
    if e == a.RuneofPowerBuff then
        return t:IsCasting(a.RuneofPower) or (h(e) > 0)
    end

    return t:BuffRemains(e, i, o or "Auto") > 0
end, 63)
o.AddCoreOverride("Spell.IsReady", function(t, n, d, h, l, u)
    local o = true
    if t:CastTime() > 0 and e:IsMoving() and r.Fire.MovingRotation then
        if t == a.Scorch or (t == a.Pyroblast and e:BuffUp(a.HotStreakBuff)) or (t == a.Flamestrike and e:BuffUp(a.HotStreakBuff)) then
            o = true
        else
            return false
        end

    end

    local i = true
    if n then
        local e = h or s
        i = e:IsInRange(n, d)
    end

    local o = t:IsLearned() and t:CooldownRemains(l, u or "Auto") == 0 and i and o
    if t == a.RuneofPower then
        return o and not e:IsCasting(a.RuneofPower)
    else
        return o
    end

end, 63)
o.AddCoreOverride("Spell.IsCastable", function(t, o, l, d, n, h)
    if t:CastTime() > 0 and e:IsMoving() and r.Arcane.MovingRotation then
        return false
    end

    local i = true
    if o then
        local e = d or s
        i = e:IsInRange(o, l)
    end

    local o = t:IsLearned() and t:CooldownRemains(n, h or "Auto") == 0 and i
                    if t == a.MirrorsofTorment then
        return o and not e:IsCasting(t)
    elseif t == a.RadiantSpark then
        return o and not e:IsCasting(t)
    elseif t == a.ShiftingPower then
        return o and not e:IsCasting(t)
    elseif t == a.Deathborne then
        return o and not e:IsCasting(t)
    elseif t == a.Frostbolt then
        return o and not e:IsCasting(t)
    else
        return o
    end

end, 63)
local i
i = o.AddCoreOverride("Player.AffectingCombat", function(e)
    return i(e) or a.Pyroblast:InFlight() or a.Fireball:InFlight() or a.PhoenixFlames:InFlight()
end, 63)
local i
i = o.AddCoreOverride("Spell.IsCastable", function(a, o, l, d, m, c)
    local n = true
    if a:CastTime() > 0 and e:IsMoving() and r.Frost.MovingRotation then
        if a == t.Blizzard and e:BuffUp(t.FreezingRain) then
            n = true
        else
            return false
        end

    end

    local h = true
    if o then
        local e = d or s
        h = e:IsInRange(o, l)
    end

    if a == t.GlacialSpike then
        return a:IsLearned() and h and n and not e:IsCasting(a) and (e:BuffUp(t.GlacialSpikeBuff) or (e:BuffStack(t.IciclesBuff) == 5))
    else
        local o = i(a, o, l, d, m, c)
                                                if a == t.SummonWaterElemental then
            return o and not u:IsActive()
        elseif a == t.RuneofPower then
            return o and not e:IsCasting(a) and e:BuffDown(t.RuneofPowerBuff)
        elseif a == t.MirrorsofTorment then
            return o and not e:IsCasting(a)
        elseif a == t.RadiantSpark then
            return o and not e:IsCasting(a)
        elseif a == t.ShiftingPower then
            return o and not e:IsCasting(a)
        elseif a == t.Deathborne then
            return o and not e:IsCasting(a)
        else
            return o
        end

    end

end, 64)
local i
i = o.AddCoreOverride("Spell.CooldownRemains", function(a, o, n)
        if a == t.Blizzard and e:IsCasting(a) then
        return 8
    elseif a == t.Ebonbolt and e:IsCasting(a) then
        return 45
    else
        return i(a, o, n)
    end

end, 64)
local a
a = o.AddCoreOverride("Player.BuffStackP", function(o, a, i, i)
    local e = e:BuffStack(a)
                if a == t.IciclesBuff then
        return o:IsCasting(t.GlacialSpike) and 0 or math.min(e + (o:IsCasting(t.Frostbolt) and 1 or 0), 5)
    elseif a == t.GlacialSpikeBuff then
        return o:IsCasting(t.GlacialSpike) and 0 or e
    elseif a == t.WintersReachBuff then
        return o:IsCasting(t.Flurry) and 0 or e
    elseif a == t.FingersofFrostBuff then
        if t.IceLance:InFlight() then
            if e == 0 then
                return 0
            else
                return e - 1
            end

        else
            return e
        end

    else
        return e
    end

end, 64)
local a
a = o.AddCoreOverride("Player.BuffUpP", function(o, a, o, o)
    local o = e:BuffUp(a)
    if a == t.FingersofFrostBuff then
        if t.IceLance:InFlight() then
            return e:BuffStack(a) >= 1
        else
            return o
        end

    else
        return o
    end

end, 64)
local a
a = o.AddCoreOverride("Player.BuffDownP", function(o, a, o, o)
    local o = e:BuffDown(a)
    if a == t.FingersofFrostBuff then
        if t.IceLance:InFlight() then
            return e:BuffStack(a) == 0
        else
            return o
        end

    else
        return o
    end

end, 64)
local e
e = o.AddCoreOverride("Target.DebuffStack", function(n, a, i, o)
    local e = e(n, a, i, o)
    if a == t.WintersChillDebuff then
                if t.Flurry:InFlight() then
            return 2
        elseif t.IceLance:InFlight() then
            if e == 0 then
                return 0
            else
                return e - 1
            end

        else
            return e
        end

    else
        return e
    end

end, 64)
local a
a = o.AddCoreOverride("Target.DebuffRemains", function(o, e, n, i)
    local a = a(o, e, n, i)
    if e == t.WintersChillDebuff then
        return t.Flurry:InFlight() and 6 or a
    else
        return a
    end

end, 64)
local e
e = o.AddCoreOverride("Player.AffectingCombat", function(a)
    return t.Frostbolt:InFlight() or e(a)
end, 64)

