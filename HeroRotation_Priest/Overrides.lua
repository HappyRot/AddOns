local o = HeroLib
local e = HeroCache
local e = o.Unit
local t = e.Player
local a = e.Pet
local r = e.Target
local e = o.Spell
local a = o.Item
local d = HeroRotation
local a = e.Priest.Discipline
local e = e.Priest.Shadow
local i
i = o.AddCoreOverride("Spell.IsCastable", function(e, n, h, s, o, r)
    local o = i(e, n, h, s, o, r)
        if e == a.MindBlast or e == a.Schism then
        return o and (not t:IsCasting(e))
    elseif e == a.Smite or e == a.DivineStar or e == a.Halo or e == a.Penance or e == a.PowerWordSolace then
        return o and (not t:BuffUp(a.ShadowCovenantBuff))
    else
        return o
    end

end, 256)
o.AddCoreOverride("Player.Insanity", function()
    local a = UnitPower("Player", InsanityPowerType)
    if not t:IsCasting() then
        return a
    else
        local i = e.FortressOfTheMind:IsAvailable() and 1.2 or 1.
        local o = t:BuffUp(e.SurrenderToMadness) and 2. or 1.
                                        if t:IsCasting(e.MindBlast) then
            return a + (8 * i * o)
        elseif t:IsCasting(e.VampiricTouch) then
            return a + (5 * o)
        elseif t:IsCasting(e.MindFlay) then
            return a + ((18 * i * o) / e.MindFlay:BaseDuration())
        elseif t:IsCasting(e.MindSear) then
            local i
            if d.GUISettings.APL.Priest.Shadow.UseSplashData then
                i = r:GetEnemiesInSplashRangeCount(10)
            else
                i = t:GetEnemiesInRange(15)
            end

            return a + ((6 * i * o) / e.MindSear:BaseDuration())
        elseif t:IsCasting(e.VoidTorrent) then
            return a + ((30 * o) / e.MindSear:BaseDuration())
        else
            return a
        end

    end

end, 258)
local i
i = o.AddCoreOverride("Spell.IsCastable", function(a, o, s, r, h, n)
    local o = i(a, o, s, r, h, n)
        if a == e.VampiricTouch then
        return o and (e.UnfurlingDarkness:IsAvailable() or not t:IsCasting(a))
    elseif a == e.MindBlast then
        return o and (a:Charges() >= 2 or not t:IsCasting(a))
    else
        return o
    end

end, 258)

