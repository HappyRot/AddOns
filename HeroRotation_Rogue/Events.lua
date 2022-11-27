local e, e = ...
local t = HeroLib
local e, e = HeroCache, t.Utils
local e = t.Unit
local i, a, a = e.Player, e.Pet, e.Target
local a, a = e.Focus, e.MouseOver
local a, a, a = e.Arena, e.Boss, e.Nameplate
local e, e = e.Party, e.Raid
local d = t.Spell
local e = t.Item
local e = HeroRotation
local o = e.Commons.Rogue
local h = C_Timer
local r = math.max
local l = math.min
local e = math.abs
local s = pairs
local u = table.insert
local c = UnitAttackSpeed
local a = GetTime
do
    local e = a()
    function o.RtBRemains()
        local e = e - a() - t.RecoveryOffset()
        return e >= 0 and e or 0
    end

    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, t)
        if t == 315508 then
            e = a() + 30
        end

    end, "SPELL_AURA_APPLIED")
    t:RegisterForSelfCombatEvent(function(i, i, i, i, i, i, i, i, i, i, i, t)
        if t == 315508 then
            e = a() + l(40, 30 + o.RtBRemains())
        end

    end, "SPELL_AURA_REFRESH")
    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, t)
        if t == 315508 then
            e = a()
        end

    end, "SPELL_AURA_REMOVED")
end

do
    local e = { CrimsonTempest = {  }, Garrote = {  }, Rupture = {  } }
    local a = {  }
    local h = d.Rogue.Assassination.Vendetta
    local n = i:HasTier(28, 4)
    t:RegisterForEvent(function()
        n = i:HasTier(28, 4)
    end, "PLAYER_EQUIPMENT_CHANGED")
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
        if n and e:DebuffUp(h) then
            return false
        end

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

    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, t, o, o, o, a)
                if a == 200806 then
            for e, a in s(e) do
                for e, o in s(a) do
                    if e == t then
                        a[e] = true
                    end

                end

            end

        elseif n and a == 79140 then
            for a, e in s(e) do
                for a, o in s(e) do
                    if a == t then
                        e[a] = true
                    end

                end

            end

        end

    end, "SPELL_CAST_SUCCESS")
    t:RegisterForSelfCombatEvent(function(i, i, i, i, i, i, i, t, i, i, i, o)
        if n and o == 79140 then
            a[t] = true
            if e.CrimsonTempest[t] == false then
                e.CrimsonTempest[t] = true
            end

            if e.Garrote[t] == false then
                e.Garrote[t] = true
            end

            if e.Rupture[t] == false then
                e.Rupture[t] = true
            end

            return 
        end

        local a = n and a[t] or false
                        if o == 121411 then
            e.CrimsonTempest[t] = a
        elseif o == 703 then
            e.Garrote[t] = a
        elseif o == 1943 then
            e.Rupture[t] = a
        end

    end, "SPELL_AURA_APPLIED", "SPELL_AURA_REFRESH")
    t:RegisterForSelfCombatEvent(function(i, i, i, i, i, i, i, t, i, i, i, o)
                                if n and o == 79140 then
            if a[t] ~= nil then
                a[t] = nil
            end

        elseif o == 121411 then
            if e.CrimsonTempest[t] ~= nil then
                e.CrimsonTempest[t] = nil
            end

        elseif o == 703 then
            if e.Garrote[t] ~= nil then
                e.Garrote[t] = nil
            end

        elseif o == 1943 then
            if e.Rupture[t] ~= nil then
                e.Rupture[t] = nil
            end

        end

    end, "SPELL_AURA_REMOVED")
    t:RegisterForCombatEvent(function(o, o, o, o, o, o, o, t)
        if a[t] ~= nil then
            a[t] = nil
        end

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
    local e = { Offset = 0, FinishDestGUID = nil, FinishCount = 0 }
    function o.EnergyPredictedWithRS()
        return i:EnergyPredicted() + e.Offset
    end

    function o.EnergyDeficitPredictedWithRS()
        return i:EnergyDeficitPredicted() - e.Offset
    end

    t:RegisterForSelfCombatEvent(function(a, a, a, a, a, a, a, a, a, a, a, t)
        if t == 98440 then
            e.Offset = 0
        end

    end, "SPELL_ENERGIZE")
    t:RegisterForEvent(function(a, a, t)
        if t == "COMBO_POINTS" and i:ComboPoints() > 0 then
            e.Offsetvote = i:ComboPoints() * 6
        end

    end, "UNIT_POWER_UPDATE")
    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, a, o, o, o, t)
        if t == 196819 or t == 1943 or t == 319175 then
            e.FinishDestGUID = a
            e.FinishCount = e.FinishCount + 1
            e.Offset = e.Offsetvote
            h.After(2, function()
                if e.FinishCount == 1 then
                    e.Offset = 0
                end

                e.FinishCount = e.FinishCount - 1
            end)
        end

    end, "SPELL_CAST_SUCCESS")
    t:RegisterForCombatEvent(function(a, a, a, a, a, a, a, t)
        if e.FinishDestGUID == t then
            e.Offset = 0
        end

    end, "UNIT_DIED", "UNIT_DESTROYED")
end

do
    local e, n = 0, 0
    local s = d(277925)
    function o.TimeToNextTornado()
        if not i:BuffUp(s, nil, true) then
            return 0
        end

        local o = i:BuffRemains(s, nil, true) % 1
                        if a() == e then
            return 0
        elseif (a() - e) < .25 and o < .5 then
            return 1
        elseif (o > .75 or o == 0) and (a() - e) > .5 then
            return .1
        end

        return o
    end

    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, t)
                if t == 212743 then
            e = a()
        elseif t == 197835 then
            n = a()
        end

        if n == e then
            e = 0
        end

    end, "SPELL_CAST_SUCCESS")
end

do
    local e = { Counter = 0, LastMH = 0, LastOH = 0 }
    function o.TimeToSht(i)
        if e.Counter >= i then
            return 0
        end

        local n, s = c("player")
        local d = r(e.LastMH + n, a())
        local h = r(e.LastOH + s, a())
        local o = {  }
        for e = 0, 2 do
            u(o, d + e * n)
            u(o, h + e * s)
        end

        table.sort(o)
        local e = l(5, r(1, i - e.Counter))
        return o[e] - a()
    end

    t:RegisterForSelfCombatEvent(function()
        e.Counter = 0
        e.LastMH = a()
        e.LastOH = a()
    end, "PLAYER_ENTERING_WORLD")
    t:RegisterForSelfCombatEvent(function(a, a, a, a, a, a, a, a, a, a, a, t)
        if t == 196911 then
            e.Counter = 0
        end

    end, "SPELL_ENERGIZE")
    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, t)
        e.Counter = e.Counter + 1
        if t then
            e.LastOH = a()
        else
            e.LastMH = a()
        end

    end, "SWING_DAMAGE")
    t:RegisterForSelfCombatEvent(function(o, o, o, o, o, o, o, o, o, o, o, o, o, o, o, t)
        if t then
            e.LastOH = a()
        else
            e.LastMH = a()
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
            h.After(3, n)
        end

    end

    t:RegisterForEvent(function()
        if e == 0 then
            h.After(3, n)
            e = 2
        end

    end, "PLAYER_EQUIPMENT_CHANGED")
    function o.BaseAttackCrit()
        return a
    end

end


