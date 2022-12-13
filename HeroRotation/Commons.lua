local e, t = ...
local a = HeroLib
local c, w = HeroCache, a.Utils
local h = a.Unit
local s = h.Player
local e = h.Target
local r = a.Spell
local n = a.Item
local o = pairs
local a = string.gsub
local f = UnitInParty
local m = UnitInRaid
t.Commons = {  }
local a = {  }
t.Commons.Everyone = a
local l = t.GUISettings.General
local d = t.GUISettings.Abilities
function a.TargetIsValid()
    return e:Exists() and s:CanAttack(e) and not e:IsDeadOrGhost()
end

function a.UnitIsCycleValid(e, t, a)
    return not e:IsFacingBlacklisted() and not e:IsUserCycleBlacklisted() and (not t or e:FilteredTimeToDie(">", t, a))
end

function a.CanDoTUnit(e, t)
    return e:Health() >= t or e:IsDummy()
end

local u = { Buff = { r(191941), r(204151), r(239932) }, Debuff = { 348074, 358988, 347607, 351180, 353929 }, Cast = { 197810, 197418, 198079, 214003, 235751, 193668, 227493, 228852, 193211, 200732, 241635, 241636, 236494, 239932, 254919, 244899, 245458, 248499, 258039, 346985, 350828, 350202, 350475, 351066, 350422, 352538, 350732, 348071 }, Channel = {  } }
local d = { Buff = {  }, Debuff = {  }, Cast = { 350732, 355352, 353603 }, Channel = {  } }
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

    for t, e in o(u.Debuff) do
        local a, a, a, a, a, a, a, a, a, t, a, a, a, a, a, a = UnitDebuff("player", e)
        if t ~= nil then
            if e == t then
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

    if d.Cast[e:CastSpellID()] then
        return true
    end

    for a, t in o(d.Buff) do
        if e:BuffUp(t, true) then
            return true
        end

    end

    for e, t in o(d.Debuff) do
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
    local e = { Debuff = { r(243961) } }
    function s:HealingAbsorbed()
        for t, e in o(e.Debuff) do
            if s:DebuffUp(e, true) then
                return true
            end

        end

        return false
    end

end

function a.Interrupt(i, o, n, a)
    if l.InterruptEnabled and e:IsInterruptible() and e:IsInRange(i) then
                if o:IsCastable() then
            if t.Cast(o, n) then
                return "Cast " .. o:Name() .. " (Interrupt)"
            end

        elseif l.InterruptWithStun and e:CanBeStunned() then
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
    return l.SoloMode and not s:IsInRaidArea() and not s:IsInDungeonArea()
end

function a.CastCycle(a, r, i, s, h, n)
    if i(e) then
        return t.Cast(a, h, n, s)
    end

    if t.AoEON() then
        local n = e:GUID()
        for o, e in o(r) do
            if e:GUID() ~= n and not e:IsFacingBlacklisted() and not e:IsUserCycleBlacklisted() and i(e) then
                t.CastLeftNameplate(e, a)
                break
            end

        end

    end

end

function a.CastTargetIf(s, m, c, h, a, u, l, d)
    local r = (not a or (a and a(e)))
    if not t.AoEON() and r then
        return t.Cast(s, l, d, u)
    end

    if t.AoEON() then
        local i, n = nil, nil
        for t, e in o(m) do
            if not e:IsFacingBlacklisted() and not e:IsUserCycleBlacklisted() and (e:AffectingCombat() or e:IsDummy()) and (not n or w.CompareThis(c, h(e), n)) then
                i, n = e, h(e)
            end

        end

        if i then
                        if r and (i:GUID() == e:GUID() or n == h(e)) then
                return t.Cast(s, l, d, u)
            elseif ((a and a(i)) or not a) then
                t.CastLeftNameplate(i, s)
            end

        end

    end

end

function a.GroupBuffMissing(t)
    local a = 40
    if t:Name() == "Battle Shout" then
        a = 100
    end

    local e
        if m("player") then
        e = h.Raid
    elseif f("player") then
        e = h.Party
    else
        return false
    end

    for o, e in o(e) do
        if e:Exists() and e:IsInRange(a) and e:BuffDown(t, true) then
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
    local a = { "Warrior", "Paladin", "Hunter", "Rogue", "Priest", "DeathKnight", "Shaman", "Mage", "Warlock", "Monk", "Druid", "DemonHunter", "Evoker" }
    local e = c.Persistent.Player.Class[3]
    local o = a[e]
    local a = { [250] = "Blood", [251] = "Frost", [252] = "Unholy", [577] = "Havoc", [581] = "Vengeance", [102] = "Balance", [103] = "Feral", [104] = "Guardian", [105] = "Restoration", [1467] = "Devastation", [1468] = "Preservation", [253] = "BeastMastery", [254] = "Marksmanship", [255] = "Survival", [62] = "Arcane", [63] = "Fire", [64] = "Frost", [268] = "Brewmaster", [269] = "Windwalker", [270] = "Mistweaver", [65] = "Holy", [66] = "Protection", [70] = "Retribution", [256] = "Discipline", [257] = "Holy", [258] = "Shadow", [259] = "Assassination", [260] = "Outlaw", [261] = "Subtlety", [262] = "Elemental", [263] = "Enhancement", [264] = "Restoration", [265] = "Affliction", [266] = "Demonology", [267] = "Destruction", [71] = "Arms", [72] = "Fury", [73] = "Protection" }
    local e = c.Persistent.Player.Spec[1]
    local e = a[e]
    local e = t.GUISettings.APL[o][e].PotionType.Selected
    local t = { 191914, 191913, 191912, 191907, 191906, 191905, 191383, 191382, 191381, 191389, 191388, 191387 }
    local a = { 191365, 191364, 191363 }
    local o = { 191368, 191367, 191366 }
    local i = { 191401, 191400, 191399 }
                if e == "Power" then
        for t, e in ipairs(t) do
            if n(e):IsUsable() then
                return n(e)
            end

        end

    elseif e == "Frozen Focus" then
        for t, e in ipairs(a) do
            if n(e):IsUsable() then
                return n(e)
            end

        end

    elseif e == "Chilled Clarity" then
        for t, e in ipairs(o) do
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


