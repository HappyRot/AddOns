local e, e = ...
local e = HeroLib
local t, t = HeroCache, e.Utils
local t = e.Unit
local o, a, a = t.Player, t.Pet, t.Target
local a, a = t.Focus, t.MouseOver
local a, a, a = t.Arena, t.Boss, t.Nameplate
local t, t = t.Party, t.Raid
local u = e.Spell
local t = e.Item
local t = HeroRotation
local i = t.Commons.Rogue
local n = C_Timer
local l = math.max
local h = math.min
local t = math.abs
local s = pairs
local r = table.insert
local d = UnitAttackSpeed
local a = GetTime
do
    local t = a()
    function i.RtBRemains()
        local t = t - a() - e.RecoveryOffset()
        return t >= 0 and t or 0
    end

    e:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, e)
        if e == 315508 then
            t = a() + 30
        end

    end, "SPELL_AURA_APPLIED")
    e:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, e)
        if e == 315508 then
            t = a() + h(40, 30 + i.RtBRemains())
        end

    end, "SPELL_AURA_REFRESH")
    e:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, e)
        if e == 315508 then
            t = a()
        end

    end, "SPELL_AURA_REMOVED")
end

do
    local t = { CrimsonTempest = {  }, Garrote = {  }, Rupture = {  } }
    function i.Exsanguinated(a, o)
        local a = a:GUID()
        if not a then
            return false
        end

        local o = o:ID()
                        if o == 121411 then
            return t.CrimsonTempest[a] or false
        elseif o == 703 then
            return t.Garrote[a] or false
        elseif o == 1943 then
            return t.Rupture[a] or false
        end

        return false
    end

    e:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, a, o, o, o, e)
        if e == 200806 then
            for t, e in s(t) do
                for t, o in s(e) do
                    if t == a then
                        e[t] = true
                    end

                end

            end

        end

    end, "SPELL_CAST_SUCCESS")
    e:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, e, o, o, o, a)
                        if a == 121411 then
            t.CrimsonTempest[e] = false
        elseif a == 703 then
            t.Garrote[e] = false
        elseif a == 1943 then
            t.Rupture[e] = false
        end

    end, "SPELL_AURA_APPLIED", "SPELL_AURA_REFRESH")
    e:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, e, o, o, o, a)
                        if a == 121411 then
            if t.CrimsonTempest[e] ~= nil then
                t.CrimsonTempest[e] = nil
            end

        elseif a == 703 then
            if t.Garrote[e] ~= nil then
                t.Garrote[e] = nil
            end

        elseif a == 1943 then
            if t.Rupture[e] ~= nil then
                t.Rupture[e] = nil
            end

        end

    end, "SPELL_AURA_REMOVED")
    e:RegisterForCombatEvent(function(a, a, a, a, a, a, a, e)
        if t.CrimsonTempest[e] ~= nil then
            t.CrimsonTempest[e] = nil
        end

        if t.Garrote[e] ~= nil then
            t.Garrote[e] = nil
        end

        if t.Rupture[e] ~= nil then
            t.Rupture[e] = nil
        end

    end, "UNIT_DIED", "UNIT_DESTROYED")
end

do
    local t = { Offset = 0, FinishDestGUID = nil, FinishCount = 0 }
    function i.EnergyPredictedWithRS()
        return o:EnergyPredicted() + t.Offset
    end

    function i.EnergyDeficitPredictedWithRS()
        return o:EnergyDeficitPredicted() - t.Offset
    end

    e:RegisterForSelfCombatEvent(function(a, a, a, a, a, a, a, a, a, a, a, e)
        if e == 98440 then
            t.Offset = 0
        end

    end, "SPELL_ENERGIZE")
    e:RegisterForEvent(function(a, a, e)
        if e == "COMBO_POINTS" and o:ComboPoints() > 0 then
            t.Offsetvote = o:ComboPoints() * 6
        end

    end, "UNIT_POWER_UPDATE")
    e:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, a, o, o, o, e)
        if e == 196819 or e == 1943 or e == 319175 then
            t.FinishDestGUID = a
            t.FinishCount = t.FinishCount + 1
            t.Offset = t.Offsetvote
            n.After(2, function()
                if t.FinishCount == 1 then
                    t.Offset = 0
                end

                t.FinishCount = t.FinishCount - 1
            end)
        end

    end, "SPELL_CAST_SUCCESS")
    e:RegisterForCombatEvent(function(a, a, a, a, a, a, a, e)
        if t.FinishDestGUID == e then
            t.Offset = 0
        end

    end, "UNIT_DIED", "UNIT_DESTROYED")
end

do
    local t, n = 0, 0
    local s = u(277925)
    function i.TimeToNextTornado()
        if not o:BuffUp(s, nil, true) then
            return 0
        end

        local o = o:BuffRemains(s, nil, true) % 1
                        if a() == t then
            return 0
        elseif (a() - t) < .1 and o < .25 then
            return 1
        elseif (o > .9 or o == 0) and (a() - t) > .75 then
            return .1
        end

        return o
    end

    e:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, e)
                if e == 212743 then
            t = a()
        elseif e == 197835 then
            n = a()
        end

        if n == t then
            t = 0
        end

    end, "SPELL_CAST_SUCCESS")
end

do
    local t = { Counter = 0, LastMH = 0, LastOH = 0 }
    function i.TimeToSht(n)
        local s, i = d("player")
        local o = {  }
        for e = 1, 5 do
            r(o, t.LastMH + e * s)
            r(o, t.LastOH + e * i)
        end

        table.sort(o)
        local t = h(5, l(1, n - t.Counter))
        return o[t] - a()
    end

    e:RegisterForSelfCombatEvent(function()
        t.Counter = 0
        t.LastMH = a()
        t.LastOH = a()
    end, "PLAYER_ENTERING_WORLD")
    e:RegisterForSelfCombatEvent(function(a, a, a, a, a, a, a, a, a, a, a, e)
        if e == 196911 then
            t.Counter = 0
        end

    end, "SPELL_ENERGIZE")
    e:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, e)
        t.Counter = t.Counter + 1
        if e then
            t.LastOH = a()
        else
            t.LastMH = a()
        end

    end, "SWING_DAMAGE")
    e:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, e)
        if e then
            t.LastOH = a()
        else
            t.LastMH = a()
        end

    end, "SWING_MISSED")
end

do
    local a = o:CritChancePct()
    local t = 0
    local function s()
        if not o:AffectingCombat() then
            a = o:CritChancePct()
            e.Debug("Base Crit Set to: " .. a)
        end

        if t == nil or t < 0 then
            t = 0
        else
            t = t - 1
        end

        if t > 0 then
            n.After(3, s)
        end

    end

    e:RegisterForEvent(function()
        if t == 0 then
            n.After(3, s)
            t = 2
        end

    end, "PLAYER_EQUIPMENT_CHANGED")
    function i.BaseAttackCrit()
        return a
    end

end


