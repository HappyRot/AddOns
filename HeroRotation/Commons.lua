local e, t = ...
local a = HeroLib
local c, y = HeroCache, a.Utils
local r = a.Unit
local s = r.Player
local e = r.Target
local h = a.Spell
local n = a.Item
local o = pairs
local w = string.gsub
local f = UnitInParty
local m = UnitInRaid
t.Commons = {  }
local a = {  }
t.Commons.Everyone = a
local d = t.GUISettings.General
local l = t.GUISettings.Abilities
function a.TargetIsValid()
    return e:Exists() and s:CanAttack(e) and not e:IsDeadOrGhost()
end

function a.UnitIsCycleValid(e, t, a)
    return not e:IsFacingBlacklisted() and not e:IsUserCycleBlacklisted() and (not t or e:FilteredTimeToDie(">", t, a))
end

function a.CanDoTUnit(e, t)
    return e:Health() >= t or e:IsDummy()
end

local u = { Buff = { h(191941), h(204151), h(239932) }, Debuff = { 348074, 358988, 347607, 351180, 353929 }, Cast = { 197810, 197418, 198079, 214003, 235751, 193668, 227493, 228852, 193211, 200732, 241635, 241636, 236494, 239932, 254919, 244899, 245458, 248499, 258039, 346985, 350828, 350202, 350475, 351066, 350422, 352538, 350732, 348071 }, Channel = {  } }
local l = { Buff = {  }, Debuff = {  }, Cast = { 350732, 355352, 353603 }, Channel = {  } }
function a.ActiveMitigationNeeded()
    if not s:IsTanking(e) then
        return false
    end

    if u.Cast[e:CastSpellID()] then
        return true
    end

    for a, t in o(u.Buff) do
        if e:BuffUp(t, true) then
            return true
        end

    end

    for e, t in o(u.Debuff) do
        local a, a, a, a, a, a, a, a, a, e, a, a, a, a, a, a = UnitDebuff("player", t)
        if e ~= nil then
            if t == e then
                return true
            end

        end

    end

    return false
end

function a.BigActiveMitigationNeeded()
    if not s:IsTanking(e) then
        return false
    end

    if l.Cast[e:CastSpellID()] then
        return true
    end

    for a, t in o(l.Buff) do
        if e:BuffUp(t, true) then
            return true
        end

    end

    for e, t in o(l.Debuff) do
        local a, a, a, a, a, a, a, a, a, e, a, a, a, a, a, a = UnitDebuff("player", i)
        if e ~= nil then
            if t == e then
                return true
            end

        end

    end

    return false
end

do
    local e = { Debuff = { h(243961) } }
    function s:HealingAbsorbed()
        for t, e in o(e.Debuff) do
            if s:DebuffUp(e, true) then
                return true
            end

        end

        return false
    end

end

function a.Interrupt(n, o, i, a)
    if d.InterruptEnabled and e:IsInterruptible() and e:IsInRange(n) then
                if o:IsCastable() then
            if t.Cast(o, i) then
                return "Cast " .. o:Name() .. " (Interrupt)"
            end

        elseif d.InterruptWithStun and e:CanBeStunned() then
            if a then
                for e = 1, #a do
                    if a[e][1]:IsCastable() and a[e][3]() then
                        if t.Cast(a[e][1]) then
                            return a[e][2]
                        end

                    end

                end

            end

        end

    end

end

function a.IsSoloMode()
    return d.SoloMode and not s:IsInRaidArea() and not s:IsInDungeonArea()
end

function a.CastCycle(i, n, a, r, h, s)
    if a(e) then
        return t.Cast(i, h, s, r)
    end

    if t.AoEON() then
        local s = e:GUID()
        for o, e in o(n) do
            if e:GUID() ~= s and not e:IsFacingBlacklisted() and not e:IsUserCycleBlacklisted() and a(e) then
                t.CastLeftNameplate(e, i)
                break
            end

        end

    end

end

function a.CastTargetIf(h, m, c, s, a, l, d, r)
    local u = (not a or (a and a(e)))
    if not t.AoEON() and u then
        return t.Cast(h, d, r, l)
    end

    if t.AoEON() then
        local i, n = nil, nil
        for t, e in o(m) do
            if not e:IsFacingBlacklisted() and not e:IsUserCycleBlacklisted() and (e:AffectingCombat() or e:IsDummy()) and (not n or y.CompareThis(c, s(e), n)) then
                i, n = e, s(e)
            end

        end

        if i then
                        if u and (i:GUID() == e:GUID() or n == s(e)) then
                return t.Cast(h, d, r, l)
            elseif ((a and a(i)) or not a) then
                t.CastLeftNameplate(i, h)
            end

        end

    end

end

function a.GroupBuffMissing(a)
    local t = 40
    if a:Name() == "Battle Shout" then
        t = 100
    end

    local e
        if m("player") then
        e = r.Raid
    elseif f("player") then
        e = r.Party
    else
        return false
    end

    for o, e in o(e) do
        if e:Exists() and e:IsInRange(t) and e:BuffDown(a, true) then
            return true
        end

    end

    return false
end

function a.GetCurrentEmpowerData(n)
    local i = 0
    local a = {  }
    _, _, _, StartTimeMS, EndTimeMS, _, _, _, _, StageTotal = UnitChannelInfo("player")
    if StageTotal and StageTotal > 0 then
        local o = 0
        for e = 1, StageTotal do
            a[e] = { Start = o, Finish = o + GetUnitEmpowerStageDuration("player", e - 1) / 1000 }
            t.Print(" Start" .. e .. ": " .. a[e].Start)
            t.Print("Finish" .. e .. ": " .. a[e].Finish)
            o = a[e].Finish
            if StartTimeMS / 1000 + o <= GetTime() then
                i = e
            end

        end

    end

    if n then
        return i
    else
        return a
    end

end

function a.PotionSelected()
    local e = c.Persistent.Player.Class[1]
    e = w(e, "%s+", "")
    local a = c.Persistent.Player.Spec[2]
    local e = t.GUISettings.APL[e][a].PotionType.Selected
    local a = { 191914, 191913, 191912, 191907, 191906, 191905, 191383, 191382, 191381, 191389, 191388, 191387 }
    local o = { 191365, 191364, 191363 }
    local t = { 191368, 191367, 191366 }
    local i = { 191401, 191400, 191399 }
                if e == "Power" then
        for t, e in ipairs(a) do
            if n(e):IsUsable() then
                return n(e)
            end

        end

    elseif e == "Frozen Focus" then
        for t, e in ipairs(o) do
            if n(e):IsUsable() then
                return n(e)
            end

        end

    elseif e == "Chilled Clarity" then
        for t, e in ipairs(t) do
            if n(e):IsUsable() then
                return n(e)
            end

        end

    elseif e == "Shocking Disclosure" then
        for t, e in ipairs(i) do
            if n(e):IsUsable() then
                return n(e)
            end

        end

    else
        return nil
    end

end


