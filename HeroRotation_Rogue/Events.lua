local e, e = ...
local t = HeroLib
local e, e = HeroCache, t.Utils
local e = t.Unit
local i, a, a = e.Player, e.Pet, e.Target
local a, a = e.Focus, e.MouseOver
local a, a, a = e.Arena, e.Boss, e.Nameplate
local e, e = e.Party, e.Raid
local h = t.Spell
local e = t.Item
local e = HeroRotation
local o = e.Commons.Rogue
local l = C_Timer
local n = math.max
local r = math.min
local e = math.abs
local s = pairs
local d = table.insert
local u = UnitAttackSpeed
local e = GetTime
do
    local a = e()
    function o.RtBRemains(o)
        local e = a - e() - t.RecoveryOffset(o)
        return e >= 0 and e or 0
    end

    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, t)
        if t == 315508 then
            a = e() + 30
        end

    end, "SPELL_AURA_APPLIED")
    t:RegisterForSelfCombatEvent(function(i, i, i, i, i, i, i, i, i, i, i, t)
        if t == 315508 then
            a = e() + r(40, 30 + o.RtBRemains(true))
        end

    end, "SPELL_AURA_REFRESH")
    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, t)
        if t == 315508 then
            a = e()
        end

    end, "SPELL_AURA_REMOVED")
end

do
    local e = { CrimsonTempest = {  }, Garrote = {  }, Rupture = {  } }
    function o.Exsanguinated(t, a)
        local t = t:GUID()
        if not t then
            return false
        end

        local a = a:ID()
                        if a == 121411 then
            return e.CrimsonTempest[t] or false
        elseif a == 703 then
            return e.Garrote[t] or false
        elseif a == 1943 then
            return e.Rupture[t] or false
        end

        return false
    end

    function o.WillLoseExsanguinate(e, t)
        if o.Exsanguinated(e, t) then
            return true
        end

        return false
    end

    function o.ExsanguinatedRate(a, e)
        if o.Exsanguinated(a, e) then
            return 2.
        end

        return 1.
    end

    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, a, o, o, o, t)
        if t == 200806 then
            for e, t in s(e) do
                for e, o in s(t) do
                    if e == a then
                        t[e] = true
                    end

                end

            end

        end

    end, "SPELL_CAST_SUCCESS")
    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, a, o, o, o, t)
                        if t == 121411 then
            e.CrimsonTempest[a] = false
        elseif t == 703 then
            e.Garrote[a] = false
        elseif t == 1943 then
            e.Rupture[a] = false
        end

    end, "SPELL_AURA_APPLIED", "SPELL_AURA_REFRESH")
    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, t, o, o, o, a)
                        if a == 121411 then
            if e.CrimsonTempest[t] ~= nil then
                e.CrimsonTempest[t] = nil
            end

        elseif a == 703 then
            if e.Garrote[t] ~= nil then
                e.Garrote[t] = nil
            end

        elseif a == 1943 then
            if e.Rupture[t] ~= nil then
                e.Rupture[t] = nil
            end

        end

    end, "SPELL_AURA_REMOVED")
    t:RegisterForCombatEvent(function(a, a, a, a, a, a, a, t)
        if e.CrimsonTempest[t] ~= nil then
            e.CrimsonTempest[t] = nil
        end

        if e.Garrote[t] ~= nil then
            e.Garrote[t] = nil
        end

        if e.Rupture[t] ~= nil then
            e.Rupture[t] = nil
        end

    end, "UNIT_DIED", "UNIT_DESTROYED")
end

do
    local a, n = 0, 0
    local s = h(277925)
    function o.TimeToNextTornado()
        if not i:BuffUp(s, nil, true) then
            return 0
        end

        local o = i:BuffRemains(s, nil, true) % 1
                        if e() == a then
            return 0
        elseif (e() - a) < .1 and o < .25 then
            return 1
        elseif (o > .9 or o == 0) and (e() - a) > .75 then
            return .1
        end

        return o
    end

    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, t)
                if t == 212743 then
            a = e()
        elseif t == 197835 then
            n = e()
        end

        if n == a then
            a = 0
        end

    end, "SPELL_CAST_SUCCESS")
end

do
    local a = { Counter = 0, LastMH = 0, LastOH = 0 }
    function o.TimeToSht(i)
        if a.Counter >= i then
            return 0
        end

        local h, s = u("player")
        local l = n(a.LastMH + h, e())
        local u = n(a.LastOH + s, e())
        local o = {  }
        for e = 0, 2 do
            d(o, l + e * h)
            d(o, u + e * s)
        end

        table.sort(o)
        local a = r(5, n(1, i - a.Counter))
        return o[a] - e()
    end

    t:RegisterForSelfCombatEvent(function()
        a.Counter = 0
        a.LastMH = e()
        a.LastOH = e()
    end, "PLAYER_ENTERING_WORLD")
    t:RegisterForSelfCombatEvent(function(t, t, t, t, t, t, t, t, t, t, t, e)
        if e == 196911 then
            a.Counter = 0
        end

    end, "SPELL_ENERGIZE")
    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, t)
        a.Counter = a.Counter + 1
        if t then
            a.LastOH = e()
        else
            a.LastMH = e()
        end

    end, "SWING_DAMAGE")
    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, t)
        if t then
            a.LastOH = e()
        else
            a.LastMH = e()
        end

    end, "SWING_MISSED")
end

do
    local a = i:CritChancePct()
    local e = 0
    local function n()
        if not i:AffectingCombat() then
            a = i:CritChancePct()
            t.Debug("Base Crit Set to: " .. a)
        end

        if e == nil or e < 0 then
            e = 0
        else
            e = e - 1
        end

        if e > 0 then
            l.After(3, n)
        end

    end

    t:RegisterForEvent(function()
        if e == 0 then
            l.After(3, n)
            e = 2
        end

    end, "PLAYER_EQUIPMENT_CHANGED")
    function o.BaseAttackCrit()
        return a
    end

end


