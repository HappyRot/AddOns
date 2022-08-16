local e, t = ...
local a = HeroLib
local e, c = HeroCache, a.Utils
local e = a.Unit
local n = e.Player
local e = e.Target
local s = a.Spell
local a = a.Item
local o = pairs
t.Commons = {  }
local a = {  }
t.Commons.Everyone = a
local d = t.GUISettings.General
local h = t.GUISettings.Abilities
function a.TargetIsValid()
    return e:Exists() and n:CanAttack(e) and not e:IsDeadOrGhost()
end

function a.UnitIsCycleValid(e, t, a)
    return not e:IsFacingBlacklisted() and not e:IsUserCycleBlacklisted() and (not t or e:FilteredTimeToDie(">", t, a))
end

function a.CanDoTUnit(e, t)
    return e:Health() >= t or e:IsDummy()
end

local r = { Buff = { s(191941), s(204151), s(239932) }, Debuff = { 348074, 358988, 347607, 351180, 353929 }, Cast = { 197810, 197418, 198079, 214003, 235751, 193668, 227493, 228852, 193211, 200732, 241635, 241636, 236494, 239932, 254919, 244899, 245458, 248499, 258039, 346985, 350828, 350202, 350475, 351066, 350422, 352538, 350732, 348071 }, Channel = {  } }
local h = { Buff = {  }, Debuff = {  }, Cast = { 350732, 355352, 353603 }, Channel = {  } }
function a.ActiveMitigationNeeded()
    if not n:IsTanking(e) then
        return false
    end

    if r.Cast[e:CastSpellID()] then
        return true
    end

    for a, t in o(r.Buff) do
        if e:BuffUp(t, true) then
            return true
        end

    end

    for e, t in o(r.Debuff) do
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
    if not n:IsTanking(e) then
        return false
    end

    if h.Cast[e:CastSpellID()] then
        return true
    end

    for a, t in o(h.Buff) do
        if e:BuffUp(t, true) then
            return true
        end

    end

    for e, t in o(h.Debuff) do
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
    local e = { Debuff = { s(243961) } }
    function n:HealingAbsorbed()
        for t, e in o(e.Debuff) do
            if n:DebuffUp(e, true) then
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
    return d.SoloMode and not n:IsInRaidArea() and not n:IsInDungeonArea()
end

function a.CastCycle(i, n, a, s, h, r)
    if a(e) then
        return t.Cast(i, h, r, s)
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

function a.CastTargetIf(h, m, f, s, a, r, d, l)
    local u = (not a or (a and a(e)))
    if not t.AoEON() and u then
        return t.Cast(h, d, l, r)
    end

    if t.AoEON() then
        local i, n = nil, nil
        for t, e in o(m) do
            if not e:IsFacingBlacklisted() and not e:IsUserCycleBlacklisted() and (e:AffectingCombat() or e:IsDummy()) and (not n or c.CompareThis(f, s(e), n)) then
                i, n = e, s(e)
            end

        end

        if i then
                        if u and (i:GUID() == e:GUID() or n == s(e)) then
                return t.Cast(h, d, l, r)
            elseif ((a and a(i)) or not a) then
                t.CastLeftNameplate(i, h)
            end

        end

    end

end

local e = { Data = {  }, Doubles = { [3] = "Holy + Physical", [5] = "Fire + Physical", [9] = "Nature + Physical", [17] = "Frost + Physical", [33] = "Shadow + Physical", [65] = "Arcane + Physical", [127] = "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical" }, SchoolDoubles = { Holy = { [2] = "Holy", [3] = "Holy + Physical", [6] = "Fire + Holy", [10] = "Nature + Holy", [18] = "Frost + Holy", [34] = "Shadow + Holy", [66] = "Arcane + Holy", [126] = "Arcane + Shadow + Frost + Nature + Fire + Holy", [127] = "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical" }, Fire = { [4] = "Fire", [5] = "Fire + Physical", [6] = "Fire + Holy", [12] = "Nature + Fire", [20] = "Frost + Fire", [28] = "Frost + Nature + Fire", [36] = "Shadow + Fire", [68] = "Arcane + Fire", [124] = "Arcane + Shadow + Frost + Nature + Fire", [126] = "Arcane + Shadow + Frost + Nature + Fire + Holy", [127] = "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical" }, Nature = { [8] = "Nature", [9] = "Nature + Physical", [10] = "Nature + Holy", [12] = "Nature + Fire", [24] = "Frost + Nature", [28] = "Frost + Nature + Fire", [40] = "Shadow + Nature", [72] = "Arcane + Nature", [124] = "Arcane + Shadow + Frost + Nature + Fire", [126] = "Arcane + Shadow + Frost + Nature + Fire + Holy", [127] = "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical" }, Frost = { [16] = "Frost", [17] = "Frost + Physical", [18] = "Frost + Holy", [20] = "Frost + Fire", [24] = "Frost + Nature", [28] = "Frost + Nature + Fire", [48] = "Shadow + Frost", [80] = "Arcane + Frost", [124] = "Arcane + Shadow + Frost + Nature + Fire", [126] = "Arcane + Shadow + Frost + Nature + Fire + Holy", [127] = "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical" }, Shadow = { [32] = "Shadow", [33] = "Shadow + Physical", [34] = "Shadow + Holy", [36] = "Shadow + Fire", [40] = "Shadow + Nature", [48] = "Shadow + Frost", [96] = "Arcane + Shadow", [124] = "Arcane + Shadow + Frost + Nature + Fire", [126] = "Arcane + Shadow + Frost + Nature + Fire + Holy", [127] = "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical" }, Arcane = { [64] = "Arcane", [65] = "Arcane + Physical", [66] = "Arcane + Holy", [68] = "Arcane + Fire", [72] = "Arcane + Nature", [80] = "Arcane + Frost", [96] = "Arcane + Shadow", [124] = "Arcane + Shadow + Frost + Nature + Fire", [126] = "Arcane + Shadow + Frost + Nature + Fire + Holy", [127] = "Arcane + Shadow + Frost + Nature + Fire + Holy + Physical" } } }
local e = 99999

