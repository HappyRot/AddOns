local e, e = ...
local e = HeroDBC.DBC
local j = HeroLib
local e = HeroCache
local t = j.Unit
local s = t.Player
local e = t.Pet
local h = t.Target
local m = j.Spell
local e = j.MultiSpell
local a = j.Item
local n = HeroRotation
local o = n.Cast
local V = n.AoEON
local re = n.CDsON
local T = HeroRotationCharDB.Toggles[4]
local fe = HeroRotationCharDB.Toggles[5]
local N = HeroRotationCharDB.Toggles[6]
local me = HeroRotationCharDB.Toggles[15]
local K = HeroRotationCharDB.Toggles[12]
local de = HeroRotationCharDB.Toggles[60]
local we = HeroRotationCharDB.Toggles[90]
local B = HeroRotationCharDB.Toggles[93]
local P = HeroRotationCharDB.Toggles[94]
local Z = HeroRotationCharDB.Toggles[95]
local pe = HeroRotationCharDB.Toggles[97]
local se = HeroRotationCharDB.Toggles[160]
local he = HeroRotationCharDB.Toggles[161]
local ee = HeroRotationCharDB.Toggles[91]
local J = HeroRotationCharDB.Toggles[92]
local U = HeroRotationCharDB.Toggles[163]
local Q = HeroRotationCharDB.Toggles[164]
local k = HeroRotationCharDB.Toggles[165]
local _ = HeroRotationCharDB.Toggles[166]
local ne = 0
local e = math.min
local e = m.Shaman.Restoration
local i = a.Shaman.Restoration
local G = e.PurifySpirit:IsCastable()
local i = s:GetEquipment()
local i = a(0)
local a = a(0)
local M, a = GetInventoryItemID("player", 13)
local C, a = GetInventoryItemID("player", 14)
local Y = {  }
local f = n.Commons.Everyone
local a = n.Commons.Shaman
local i = { General = n.GUISettings.General, Commons = n.GUISettings.APL.Shaman.Commons, Restoration = n.GUISettings.APL.Shaman.Restoration, RestorationM = n.GUISettings.APL.Shaman.RestorationM, RestorationR = n.GUISettings.APL.Shaman.RestorationR }
j:RegisterForEvent(function()
    e.LavaBurst:RegisterInFlight()
end, "LEARNED_SPELL_IN_TAB")
e.LavaBurst:RegisterInFlight()
local function a(e)
    if e then
        return 1
    else
        return 0
    end

end

local function a(e)
    return e ~= 0
end

local a
local a
local a
local a
local oe
local a
local a
local a
local y = 1.
local r = nil
local c = 0
local w = 0
local d = 0
local p = 0
local z = false
local H = false
local R = 0
local F = 0
local x, X, ie
local a, u, l
local b = {  }
local v = false
local O = false
local I = false
local A = false
local S = false
local E = false
local D = false
j:RegisterForEvent(function()
    H = false
end, "PLAYER_REGEN_ENABLED")
j:RegisterForEvent(function(e, ...)
    if e == "CHAT_MSG_YELL" then
        local e, t, o, o, o, o, o, o, o, o, o, a, o, o, o, o, o = ...
        if e == "DISPEL ME(auto)" then
            x = a
            X = GetTime()
            ie = t
        end

    end

end, "CHAT_MSG_YELL")
j:RegisterForEvent(function(t, ...)
    local o, e, n, i = ...
    if t == "UNIT_SPELLCAST_SENT" then
        if o == "player" and e then
            a = i
            u = e
        end

    end

    if t == "UI_ERROR_MESSAGE" then
        if e == SPELL_FAILED_LINE_OF_SIGHT then
            l = u
            missedspell = a
        end

    end

end, "UI_ERROR_MESSAGE", "UNIT_SPELLCAST_SENT")
local function le(a, o)
    local i, e
    if not o then
        if GetUnitName("player", true) == a then
            return UnitGUID("player")
        end

        if GetUnitName("target", true) == a then
            return t("target"):GUID()
        end

        if GetUnitName("focus", true) == a then
            return UnitGUID("focus")
        end

        e = GetNumGroupMembers()
        if e > 0 and e <= 5 then
            for e = 1, e do
                if GetUnitName("party" .. e, true) == a then
                    return UnitGUID("party" .. e)
                end

            end

        end

        if e > 5 then
            for e = 1, e do
                if GetUnitName("raid" .. e, true) == a then
                    return UnitGUID("raid" .. e)
                end

            end

        end

    else
        if GetUnitName("player", true) == a then
            return "player"
        end

        if GetUnitName("target", true) == a then
            return "target"
        end

        if GetUnitName("focus", true) == a then
            return "focus"
        end

        e = GetNumGroupMembers()
        if e > 0 and e <= 5 then
            for e = 1, e do
                if GetUnitName("party" .. e, true) == a then
                    return "party" .. e
                end

            end

        end

        if e > 5 then
            for e = 1, e do
                if GetUnitName("raid" .. e, true) == a then
                    return "raid" .. e
                end

            end

        end

    end

    return a
end

local function ce()
    if l then
        table.insert(b, (le(l) .. " " .. GetTime()))
        l = nil
    end

    if table.getn(b) > 0 then
        for t = 1, table.getn(b) do
            if b[t] ~= nil then
                for e in string.gmatch(b[t], "([^%s]+)") do
                    e = tonumber(e)
                    if type(e) == "number" then
                        if e <= GetTime() - 3 then
                            table.remove(b, t)
                        end

                    end

                end

            end

        end

    end

end

local function u(e)
    if table.getn(b) > 0 and e ~= nil then
        for a = 1, table.getn(b) do
            for a in string.gmatch(b[a], "([^%s]+)") do
                if a and a == t(e):GUID() then
                    return true
                end

            end

        end

    else
        return false
    end

end

local function q(e)
    if (t(e):BuffUp(m(365153))) then
        for t = 1, 40 do
            if select(10, UnitBuff(e, t)) == 365153 then
                return select(16, UnitBuff(e, t))
            end

        end

    else
        return 0
    end

end

local a, a, L, a
local g = 0
local a = 0
local l = 0
local function W(e)
    if e then
        return 1
    else
        return 0
    end

end

local function te(t)
    return t:DebuffRemains(e.FlameShockDebuff)
end

local function W(e)
    return u(e)
end

local function ae(o)
                if (o:DebuffDown(e.FlameShockDebuff) and o:IsInRange(40) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) and o:GUID() == t("mouseover"):GUID()) then
        g = 1188389
        return true
    elseif (o:DebuffDown(e.FlameShockDebuff) and o:IsInRange(40) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) and i.Restoration.TargetSwap == "AutoSwap" and o:GUID() ~= h:GUID() and not K) then
        g = 999
        return true
    elseif (o:DebuffDown(e.FlameShockDebuff) and o:IsInRange(40) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) and o:GUID() == h:GUID()) then
        a = 188389
        return true
    elseif o:DebuffDown(e.FlameShockDebuff) and o:IsInRange(40) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) then
        return true
    end

end

local function W(e)
    return (e:IsInRange(40) and u(e) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326))
end

local function be()
    z = false
    for e = 1, 6 do
        local t, t, t, t, e = GetTotemInfo(e)
        if e == 3565451 then
            z = true
        end

    end

    if not z then
        d = 0
        p = 0
    end

    if (e.VesperTotem:TimeSinceLastCast() <= .5 or e.RecallVesperTotem:TimeSinceLastCast() <= .5) and z then
        d = 3
        p = 3
        H = true
    end

    if (e.LavaBurst:TimeSinceLastCast() <= .5 or e.ChainLightning:TimeSinceLastCast() <= .5 or e.LightningBolt:TimeSinceLastCast() <= .5) and R <= GetTime() and z then
        d = d - 1
        R = GetTime() + .66
    end

    if (e.EarthShield:TimeSinceLastCast() <= .5 or e.Riptide:TimeSinceLastCast() <= .5 or e.ChainHeal:TimeSinceLastCast() <= .5 or e.HealingSurge:TimeSinceLastCast() <= .5 or e.HealingStreamTotem:TimeSinceLastCast() <= .5 or e.CloudBurstTotem:TimeSinceLastCast() <= .5 or e.HealingWave:TimeSinceLastCast() <= .5 or e.HealingRain:TimeSinceLastCast() <= .5) and F <= GetTime() and z then
        p = d - 1
        F = GetTime() + .66
    end

end

local function ve(a)
    local t = 0
    if a ~= nil then
        for o in pairs(a) do
            local a = a[o]
            if a:DebuffRefreshable(e.FlameShockDebuff) and a:TimeToDie() > 18 then
                t = t + 1
            end

        end

    end

    return t
end

local function ye()
    local e = false
    local t = 0
    for a = 0, NUM_BAG_SLOTS do
        for o = 1, GetContainerNumSlots(a) do
            t = GetContainerItemID(a, o)
            if t == 177278 then
                e = true
            end

        end

    end

    return e
end

local function p(o)
    if o == nil then
        return nil
    end

    o = o / 100
    local a = 0
    if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
        for e = 1, GetNumGroupMembers() do
            if UnitExists("party" .. e) and not t("party" .. e):IsDeadOrGhost() and t("party" .. e):DebuffDown(m(228578)) then
                local i = UnitHealth("party" .. e) + (UnitGetIncomingHeals("party" .. e) or 0) - q("party" .. e)
                local t = UnitHealthMax("party" .. e)
                if i / t <= o or (UnitHealth("party" .. e) / t == 1 and o == 1) then
                    a = a + 1
                end

            end

        end

        if (((UnitHealth("player") + (UnitGetIncomingHeals("player") or 0)) / UnitHealthMax("player")) < o or (UnitHealth("player") / UnitHealthMax("player") == 1 and o == 1)) then
            a = a + 1
        end

    end

    if GetNumGroupMembers() > 5 then
        for e = 1, GetNumGroupMembers() do
            if UnitExists("raid" .. e) and not UnitIsDead("raid" .. e) and t("raid" .. e):DebuffDown(m(362075)) and t("raid" .. e):DebuffDown(m(362397)) and t("raid" .. e):DebuffDown(m(191587)) then
                local t = 0
                local t = UnitHealth("raid" .. e) + (UnitGetIncomingHeals("raid" .. e) or 0) - q("raid" .. e)
                local e = UnitHealthMax("raid" .. e)
                if t / e <= o then
                    a = a + 1
                end

            end

        end

    end

    if GetNumGroupMembers() == 0 then
        local t = UnitHealth("player") + (UnitGetIncomingHeals("player") or 0) - q("player")
        local e = UnitHealthMax("player")
        if t / e < o then
            a = a + 1
        end

    end

    return a
end

local function F()
    local e = false
    if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
        for a = 1, GetNumGroupMembers() do
            for t = 0, 40 do
                local o, o, o, o, o, o, a, o, o, t = UnitBuff("party" .. a, t)
                if a == "player" and t == 974 then
                    e = true
                end

            end

        end

    end

    if GetNumGroupMembers() > 5 then
        for a = 1, GetNumGroupMembers() do
            for t = 0, 40 do
                local o, o, o, o, o, o, a, o, o, t = UnitBuff("raid" .. a, t)
                if a == "player" and t == 974 then
                    e = true
                end

            end

        end

    end

    return e
end

local function R(t)
    local e = false
    for a = 0, GetNumGroupMembers() do
        local o, o, o, o, o, o, a, o, o, t = UnitBuff(t, a)
        if a == "player" and t == 974 then
            e = true
        end

    end

    return e
end

local function W()
    local t = 0
    if s:BuffUp(m(157504)) then
        for e = 1, 40 do
            if select(10, UnitBuff("player", e)) == 157504 then
                t = select(16, UnitBuff("player", e))
            end

        end

    end

    return t
end

local function d()
    if s:IsMoving() and not s:BuffUp(e.SpiritwalkersGraceBuff) then
        return true
    else
        return false
    end

end

local function ue()
    oe = 0
    y = 1.
    r = nil
    c = 0
    if not h:TimeToDieIsNotValid() and not h:IsUserCycleBlacklisted() then
        oe = h:TimeToDie()
    end

    if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
        if (UnitGUID("focus") == t("party" .. (l / 100)):GUID() or not UnitExists("party" .. (l / 100))) and l ~= 500 then
            l = 0
        end

        if UnitGUID("focus") == UnitGUID("player") and l == 500 then
            l = 0
        end

    end

    if GetNumGroupMembers() > 5 then
        if UnitGUID("focus") == t("raid" .. (l / 1000)):GUID() or not UnitExists("raid" .. (l / 1000)) then
            l = 0
        end

    end

    G = e.PurifySpirit:IsCastable()
        if GetNumGroupMembers() > 0 and not _ then
                if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
            for t = 1, GetNumGroupMembers() do
                if UnitExists("party" .. t) and not UnitIsDead("party" .. t) and IsItemInRange(17067, "party" .. t) and not u("party" .. t) and not UnitCanAttack("player", "party" .. t) then
                    for n = 1, 10 do
                        local u, u, l, s, h, d, u, u, u, n = UnitDebuff("party" .. t, n)
                        if n ~= 329298 then
                            local e = UnitHealth("party" .. t) + (UnitGetIncomingHeals("party" .. t) or 0) - q("party" .. t)
                            local a = UnitHealthMax("party" .. t)
                            if e / a < y and e / a < i.RestorationR.DPSThreshold then
                                y = e / a
                                r = UnitGUID("party" .. t)
                                c = t
                            end

                        end

                        if y >= .5 and G and not U then
                            if (s == "Curse" or s == "Magic") and n ~= 320788 and ((n ~= 323347) or (n == 323347 and l >= 2)) and n ~= 350469 and n ~= 350541 and n ~= 351117 and n ~= 229159 then
                                if (d - h) + (i.Restoration.PurifyDelay / 1000) <= GetTime() then
                                    r = UnitGUID("party" .. t)
                                    c = t
                                end

                                if UnitGUID("focus") == UnitGUID("party" .. t) and (d - h) + (i.Restoration.PurifyDelay / 1000) <= GetTime() and n ~= 227404 then
                                                                        if n ~= 227404 then
                                        if o(e.PurifySpirit) then
                                            a = 77130
                                            return "Purify Spirit"
                                        end

                                    elseif n == 227404 and x and x == UnitGUID("focus") then
                                        if o(e.PurifySpirit) then
                                            a = 77130
                                            return "Purify Spirit"
                                        end

                                    end

                                end

                            end

                        end

                    end

                    if not UnitAffectingCombat("player") and (UnitGroupRolesAssigned("party" .. t) == "TANK") and IsItemInRange(17067, "party" .. t) and not F() and y >= .5 then
                                                if UnitGUID("party" .. t) ~= UnitGUID("focus") then
                            c = t
                            r = UnitGUID("party" .. t)
                        elseif UnitGUID("party" .. t) == UnitGUID("focus") then
                            if true then
                                a = 974
                                return "EarthShield a Tank"
                            end

                        end

                    end

                end

            end

            if ((UnitHealth("player") + (UnitGetIncomingHeals("player") or 0)) / UnitHealthMax("player")) - (0) < y and w <= GetTime() and t("player"):DebuffDown(m(228578)) then
                y = ((UnitHealth("player") + (UnitGetIncomingHeals("player") or 0)) / UnitHealthMax("player")) - (0)
                r = UnitGUID("player")
                c = 5
            end

            if not t("player"):IsDeadOrGhost() and t("player"):DebuffDown(m(228578)) then
                for e = 1, 40 do
                    local s, s, a, t, o, n, s, s, s, e, s, s, s, s, s = UnitDebuff("player", e)
                    if (t == "Curse" or t == "Magic") and e ~= 320788 and ((e ~= 323347) or (e == 323347 and a >= 2)) and e ~= 350469 and e ~= 350541 and e ~= 351117 and e ~= 229159 and e ~= 227404 then
                        if (n - o) + (i.Restoration.PurifyDelay / 1000) <= GetTime() and w <= GetTime() then
                            r = UnitGUID("player")
                            c = 5
                        end

                    end

                end

            end

        elseif GetNumGroupMembers() > 5 and w <= GetTime() then
            for t = 1, GetNumGroupMembers() do
                if UnitExists("raid" .. t) and not UnitIsDead("raid" .. t) and IsItemInRange(17067, "raid" .. t) and not u("raid" .. t) and not UnitCanAttack("player", "raid" .. t) then
                    for n = 1, 10 do
                        local u, u, l, s, h, d, u, u, u, n = UnitDebuff("raid" .. t, n)
                        if n ~= 329298 then
                            local e = UnitHealth("raid" .. t) + (UnitGetIncomingHeals("raid" .. t) or 0) - q("raid" .. t)
                            local a = UnitHealthMax("raid" .. t)
                            if e / a < y and e / a < i.RestorationR.DPSThreshold then
                                y = e / a
                                r = UnitGUID("raid" .. t)
                                c = t * 10
                            end

                        end

                        if y >= .5 and G and not U then
                            if (s == "Curse" or s == "Magic") and n ~= 320788 and ((n ~= 323347) or (n == 323347 and l >= 2)) and n ~= 350469 and n ~= 350541 and n ~= 351117 and n ~= 229159 then
                                if (d - h) + (i.Restoration.PurifyDelay / 1000) <= GetTime() then
                                    r = UnitGUID("raid" .. t)
                                    c = t * 10
                                end

                                if UnitGUID("focus") == UnitGUID("raid" .. t) and (d - h) + (i.Restoration.PurifyDelay / 1000) <= GetTime() and n ~= 227404 then
                                                                        if n ~= 227404 then
                                        if o(e.PurifySpirit) then
                                            a = 77130
                                            return "Purify Spirit"
                                        end

                                    elseif n == 227404 and x and x == UnitGUID("focus") then
                                        if o(e.PurifySpirit) then
                                            a = 77130
                                            return "Purify Spirit"
                                        end

                                    end

                                end

                            end

                        end

                    end

                    if not UnitAffectingCombat("player") and (UnitGroupRolesAssigned("raid" .. t) == "TANK") and IsItemInRange(17067, "raid" .. t) and not F() and y >= .5 then
                                                if UnitGUID("raid" .. t) ~= UnitGUID("focus") then
                            c = t * 10
                            r = UnitGUID("raid" .. t)
                        elseif UnitGUID("raid" .. t) == UnitGUID("focus") then
                            if o(e.EarthShield) then
                                a = 974
                                return "EarthShield a Tank"
                            end

                        end

                    end

                    if (UnitGroupRolesAssigned("raid" .. t) == "TANK") and UnitThreatSituation("raid" .. t, "boss1") ~= nil and UnitThreatSituation("raid" .. t, "boss1") >= 3 and not R("raid" .. t) and y >= .5 then
                                                if UnitGUID("raid" .. t) ~= UnitGUID("focus") then
                            c = t * 10
                            r = UnitGUID("raid" .. t)
                        elseif UnitGUID("raid" .. t) == UnitGUID("focus") and not R("focus") then
                            if o(e.EarthShield) then
                                a = 974
                                return "EarthShield a Tank"
                            end

                        end

                    end

                end

            end

                        if UnitExists("target") and (h:NPCID() == 182822 or h:NPCID() == 184493) and t("target"):HealthPercentage() < 100 and h:GUID() ~= UnitGUID("focus") and w <= GetTime() then
                r = t("target"):GUID()
                c = 1000
            elseif UnitExists("target") and (h:NPCID() == 182822 or h:NPCID() == 184493) and t("target"):HealthPercentage() < 100 and h:GUID() == UnitGUID("focus") then
                r = t("target"):GUID()
                c = 0
            end

        end

    elseif GetNumGroupMembers() == 0 then
        local e = UnitHealth("player") + (UnitGetIncomingHeals("player") or 0) - q("player")
        local t = UnitHealthMax("player")
        if w <= GetTime() and UnitGUID("focus") ~= UnitGUID("player") then
            y = e / t
            r = UnitGUID("player")
            if r == UnitGUID("player") and w <= GetTime() then
                c = 5
            end

        end

    end

end

local function q(t)
    if t == nil or not f.TargetIsValid() then
        return nil
    end

    local a = t:IsCastable() and t:IsReady()
    local o = (s:BuffUp(e.SpiritwalkersGraceBuff) or not s:IsMoving())
                if t == e.LightningBolt or t == e.ChainLightning or t == e.HealingRain or t == e.HealingWave or t == e.HealingSurge or t == e.Wellspring then
        return a and o
    elseif t == e.VesperTotem then
        return a
    elseif t == e.LavaBurst then
        local t = s:BuffUp(e.LavaSurgeBuff)
        local i = (not s:IsCasting(e.LavaBurst) and e.LavaBurst:Charges() >= 1)
        local n = (s:IsCasting(e.LavaBurst) and e.LavaBurst:Charges() == 2)
        return a and (o or s:BuffUp(e.LavaSurgeBuff)) and (t or i or n)
    elseif f.TargetIsValid() then
        return a
    end

end

local function G()
    if GetNumGroupMembers() > 0 then
        if s:BuffDown(e.WaterShield) and e.WaterShield:IsCastable() then
            if o(e.WaterShield) then
                a = 52127
                return "Water Shield Self"
            end

        end

        if r and UnitGUID("focus") ~= r and w <= GetTime() and not _ then
            l = c * 100
            if r == UnitGUID("focus") then
                w = GetTime() + (s:GCD() + .25)
            end

        end

        if e.EarthShield:IsCastable() and h:NPCID() ~= 182822 then
            if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 and y >= .5 then
                for i = 1, GetNumGroupMembers() do
                    if (UnitGroupRolesAssigned("party" .. i) == "TANK" or t("party" .. i):NPCID() == 72218) and not UnitCanAttack("player", "party" .. i) and not u("party" .. i) and t("party" .. i):IsInMeleeRange(40) and not F() and w <= GetTime() and p(80) == 0 then
                                                if UnitGUID("party" .. i) ~= UnitGUID("focus") and t("party" .. i):IsInMeleeRange(40) and not t("party" .. i):IsDeadOrGhost() then
                            c = i
                            r = UnitGUID("party" .. i)
                        elseif UnitGUID("party" .. i) == UnitGUID("focus") and t("focus"):IsInMeleeRange(40) and not t("party" .. i):IsDeadOrGhost() and not UnitCanAttack("player", "party" .. i) then
                            if o(e.EarthShield) then
                                a = 974
                                return "EarthShield a Tank"
                            end

                        end

                    end

                end

            end

            if GetNumGroupMembers() > 5 then
                for i = 1, GetNumGroupMembers() do
                    if (UnitGroupRolesAssigned("raid" .. i) == "TANK") and IsItemInRange(17067, "raid" .. i) and not UnitCanAttack("player", "raid" .. i) and not u("raid" .. i) and not F() and w <= GetTime() and not UnitAffectingCombat("player") then
                                                if UnitGUID("raid" .. i) ~= UnitGUID("focus") and IsItemInRange(17067, "raid" .. i) and not UnitIsDead("raid" .. i) then
                            c = i * 10
                            r = UnitGUID("raid" .. i)
                        elseif UnitGUID("raid" .. i) == UnitGUID("focus") and t("focus"):IsInMeleeRange(40) and not UnitIsDead("raid" .. i) and not UnitAffectingCombat("player") and not UnitCanAttack("player", "raid" .. i) then
                            if o(e.EarthShield) then
                                a = 974
                                return "EarthShield a Tank"
                            end

                        end

                    end

                    if (UnitGroupRolesAssigned("raid" .. i) == "TANK") and UnitThreatSituation("raid" .. i, "boss1") ~= nil and UnitThreatSituation("raid" .. i, "boss1") >= 3 and IsItemInRange(17067, "raid" .. i) and not u("raid" .. i) and not R("raid" .. i) and not UnitIsDead("raid" .. i) and not UnitCanAttack("player", "raid" .. i) then
                                                if UnitGUID("raid" .. i) ~= UnitGUID("focus") and w <= GetTime() then
                            c = i * 10
                            r = UnitGUID("raid" .. i)
                        elseif UnitGUID("raid" .. i) == UnitGUID("focus") and not R("focus") then
                            if o(e.EarthShield) then
                                a = 974
                                return "EarthShield a Tank"
                            end

                        end

                    end

                end

            end

        end

    else
        if s:BuffDown(e.LightningShieldBuff) then
            if o(e.LightningShield) then
                a = 192106
                return "Lightning Shield Self"
            end

        end

    end

    if e.SummonSteward:IsCastable() and not ye() and not UnitAffectingCombat("player") then
        if o(e.SummonSteward, nil, nil) then
            a = 324739
            return "Precombat SummonSteward"
        end

    end

    if q(e.Fleshcraft) and f.TargetIsValid() and T and N and not UnitAffectingCombat("player") then
        if o(e.Fleshcraft, nil, nil) then
            a = 324631
            return "Precombat Fleshcraft"
        end

    end

    if not k and EnemiesCount10ySplash >= 3 and not u("target") and f.TargetIsValid() and N and not UnitAffectingCombat("player") and q(e.ChainLightning) and not s:IsCasting(e.ChainLightning) then
        if o(e.ChainLightning, nil, nil, not h:IsSpellInRange(e.ChainLightning)) then
            a = 188443
            return "Precombat Chain Lightning"
        end

    end

    if not k and q(e.LavaBurst) and not u("target") and f.TargetIsValid() and N and not UnitAffectingCombat("player") and not s:IsCasting(e.LavaBurst) then
        if o(e.LavaBurst, nil, nil, not h:IsSpellInRange(e.LavaBurst)) then
            a = 51505
            return "Precombat Lavaburst"
        end

    end

    if not k and s:IsCasting(e.LavaBurst) and not u("target") and f.TargetIsValid() and N and not UnitAffectingCombat("player") and e.FlameShock:CooldownRemains() == 0 then
        if o(e.FlameShock, nil, nil, not h:IsSpellInRange(e.FlameShock)) then
            return "Precombat Flameshock"
        end

    end

end

local function F()
    if UnitExists("focus") and not UnitCanAttack("player", "focus") then
        if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and e.CloudBurstTotem:IsCastable() and e.CloudBurstTotem:IsAvailable() and not d() then
            if o(e.CloudBurstTotem) then
                a = 157153
                return "CloudBurst Totem before Ascendance"
            end

        end

        if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and e.Ascendance:IsAvailable() and e.Ascendance:IsCastable() and (e.HealingTideTotem:TimeSinceLastCast() > 10 and e.SpiritLinkTotem:TimeSinceLastCast() > 6) then
            if o(e.Ascendance) then
                a = 114050
                return "Oh S**** Ascendance"
            end

        end

        if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and e.SpiritLinkTotem:IsAvailable() and e.SpiritLinkTotem:IsCastable() and (e.HealingTideTotem:TimeSinceLastCast() > 10 and e.Ascendance:TimeSinceLastCast() > 15) then
            if o(e.SpiritLinkTotem) then
                a = 98008
                return "Oh S**** SpiritLinkTotem"
            end

        end

        if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and e.HealingTideTotem:IsAvailable() and e.HealingTideTotem:IsCastable() and (e.SpiritLinkTotem:TimeSinceLastCast() > 6 and e.Ascendance:TimeSinceLastCast() > 15) then
            if o(e.HealingTideTotem) then
                a = 108280
                return "Oh S**** HealingTideTotem"
            end

        end

    end

end

local function oe()
    local t = s:GetUseableTrinkets(Y)
    if t and re() then
        if o(t, nil, nil) then
                        if t:ID() == M and i.Commons.Enabled.TopTrinket then
                a = 24
                return "top trinket 1"
            elseif t:ID() == C and i.Commons.Enabled.BottomTrinket then
                a = 30
                return "Bot trinket 2"
            end

        end

    end

    if e.ChainHarvest:IsCastable() and not d() and T then
        if o(e.ChainHarvest, nil, nil) then
            a = 320674
            return "Chain Harvest CD"
        end

    end

    if ((e.VesperTotem:IsCastable() and T) or (z and not H and e.RecallVesperTotem:IsReady())) then
        if o(e.VesperTotem, nil, nil) then
            a = 324386
            return "Vesper Totem CD"
        end

    end

end

local function ye()
    if EnemiesCount10ySplash >= 3 then
        return 0
    end

    return EnemiesCount10ySplash
end

local function R()
    if q(e.FlameShock) and f.TargetIsValid() then
        if f.CastTargetIf(e.FlameShock, L, "min", te, ae) then
            return "Flame Shock 108"
        end

        if te(h) and ae(h) then
            if o(e.FlameShock, nil, nil, not h:IsSpellInRange(e.FlameShock)) then
                a = 188389
                return "FlameShock 108"
            end

        end

    end

end

local function te()
        if q(e.LavaBurst) and f.TargetIsValid() and not u("target") then
        a = 51505
        return e.LavaBurst, false
    elseif q(e.LightningBolt) and f.TargetIsValid() and not u("target") then
        a = 188196
        return e.LightningBolt, true
    end

    return nil, false
end

local function ae()
        if q(e.LavaBurst) and f.TargetIsValid() and not u("target") and (EnemiesCount10ySplash < 3) then
        a = 51505
        return e.LavaBurst, true
    elseif q(e.ChainLightning) and f.TargetIsValid() and not u("target") then
        a = 188443
        return e.ChainLightning, true
    end

    return nil, false
end

local function y()
    if GetNumGroupMembers() > 0 then
        if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
            if D and not s:IsCasting(e.Wellspring) then
                a = 1999
            end

            if t("focus"):IsInMeleeRange(40) and e.RecallCloudburstTotem:IsCastable() and not v and W() >= 10000 and (I) then
                if o(e.RecallCloudburstTotem) then
                    a = 201764
                    return "CloudBurst Release under %"
                end

            end

            if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not O and v and e.CloudBurstTotem:IsCastable() and e.CloudBurstTotem:IsAvailable() then
                if o(e.CloudBurstTotem) then
                    a = 157153
                    return "CloudBurst Totem under %"
                end

            end

            if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not d() and UnitAffectingCombat("player") and e.Wellspring:IsReady() and not A and (S) then
                if o(e.Wellspring) then
                    a = 197995
                    return "Wellspring under %"
                end

            end

            if e.PurifySpirit:IsCastable() and UnitExists("focus") and not UnitCanAttack("player", "focus") and not u("focus") and not U and t("focus"):IsInRange(40) and t("focus"):DebuffDown(m(362075)) and t("focus"):DebuffDown(m(362397)) and t("focus"):DebuffDown(m(191587)) and t("focus"):DebuffDown(m(228578)) then
                for t = 1, 40 do
                    local d, d, r, n, h, s, d, d, d, t, d, d, d, d, d = UnitDebuff("focus", t)
                    if (n == "Curse" or n == "Magic") and t ~= 320788 and ((t ~= 323347) or (t == 323347 and r >= 2)) and t ~= 350469 and t ~= 350541 and t ~= 351117 and t ~= 229159 and t ~= 227404 then
                                                if (s - h) + (i.Restoration.PurifyDelay / 1000) <= GetTime() then
                            if o(e.PurifySpirit) then
                                a = 77130
                                return "Purify Spirit"
                            end

                        elseif t == 227404 and x and x == UnitGUID("focus") then
                            if o(e.PurifySpirit) then
                                a = 77130
                                return "Purify Spirit"
                            end

                        end

                    end

                end

            end

            if (UnitExists("focus") and not UnitCanAttack("player", "focus") and not u("focus") and (p(i.RestorationM.DPSThreshold) > 0)) then
                if h:IsInMeleeRange(40) and UnitAffectingCombat("player") and T and (e.VesperTotem:IsCastable() or (z and not H and e.RecallVesperTotem:IsReady())) then
                    if o(e.VesperTotem) then
                        a = 324386
                        return "Vesper Totem Heal"
                    end

                end

                if h:IsInMeleeRange(40) and UnitAffectingCombat("player") and T and e.ChainHarvest:IsCastable() then
                    if o(e.ChainHarvest, nil, nil) then
                        a = 320674
                        return "Chain Harvest Heal"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and e.RecallCloudburstTotem:IsCastable() and not v and W() >= 10000 and (p(i.RestorationM.CloudburstReleaseHP) >= i.RestorationM.CloudburstReleaseParty or not UnitAffectingCombat("player") or I) then
                    if o(e.RecallCloudburstTotem) then
                        a = 201764
                        return "CloudBurst Release under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and (t("focus"):HealthPercentage() <= i.RestorationM.HealingStreamHP or v) and not O and e.CloudBurstTotem:IsCastable() and e.CloudBurstTotem:IsAvailable() and ((e.CloudBurstTotem:Charges() >= 2 and not d()) or v) then
                    if o(e.CloudBurstTotem) then
                        a = 157153
                        return "CloudBurst Totem under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and t("focus"):HealthPercentage() <= i.RestorationM.RiptideHP and e.Riptide:IsCastable() then
                    if o(e.Riptide) then
                        a = 61295
                        return "Riptide under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and e.UnleashLife:IsReady() and t("focus"):HealthPercentage() <= i.RestorationM.UnleashLifeHP then
                    if o(e.UnleashLife) then
                        a = 73685
                        return "UnleashLife under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not d() and UnitAffectingCombat("player") and e.Wellspring:IsReady() and not A and (t("focus"):HealthPercentage() <= i.RestorationM.WellspringHP or S) then
                    if o(e.Wellspring) then
                        a = 197995
                        return "Wellspring under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and ((t("focus"):HealthPercentage() <= i.RestorationM.HealingSurgeHP2 and s:BuffStack(e.TidalWaves) >= 1) or (t("focus"):HealthPercentage() <= i.RestorationM.HealingSurgeHP)) and e.HealingSurge:IsCastable() and not d() then
                    if o(e.HealingSurge) then
                        a = 8004
                        return "Healing Surge under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and ((t("focus"):HealthPercentage() <= i.RestorationM.HealingWaveHP2 and s:BuffStack(e.TidalWaves) >= 1) or (t("focus"):HealthPercentage() <= i.RestorationM.HealingWaveHP)) and e.HealingWave:IsCastable() and not d() then
                    if o(e.HealingWave) then
                        a = 77472
                        return "Healing Wave under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not d() and e.EarthenWallTotem:IsReady() and not E and p(i.RestorationM.EarthenWallTotemHP) >= i.RestorationM.EarthenWallTotemParty and UnitAffectingCombat("player") then
                    if o(e.EarthenWallTotem) then
                        a = 198838
                        return "EarthenWallTotem under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and e.ChainHeal:IsCastable() and not d() and p(i.RestorationM.ChainHealHP) >= i.RestorationM.ChainHealParty then
                    if o(e.ChainHeal) then
                        a = 1064
                        return "Chain Heal under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and e.HealingRain:IsCastable() and not E and not s:IsCasting(e.HealingRain) and not d() and p(i.RestorationM.HealingRainHP) >= i.RestorationM.HealingRainParty then
                    if o(e.HealingRain) then
                        a = 73920
                        return "Healing Rain under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and t("focus"):HealthPercentage() <= i.RestorationM.HealingStreamHP and e.HealingStreamTotem:IsCastable() and not e.CloudBurstTotem:IsAvailable() and not d() then
                    if o(e.HealingStreamTotem) then
                        a = 5394
                        return "Healing Stream Totem under %"
                    end

                end

            end

            if t("focus"):IsInMeleeRange(40) and i.RestorationM.RainIgnoreCheck and UnitAffectingCombat("player") and e.HealingRain:IsCastable() and not E and j.FightRemains(L, false) > 10 and p(i.RestorationM.DPSThreshold) <= 0 and not s:IsCasting(e.HealingRain) and not d() and p(i.RestorationM.HealingRainHP) >= i.RestorationM.HealingRainParty then
                if o(e.HealingRain) then
                    a = 73920
                    return "Healing Rain under % 1"
                end

            end

        end

        if GetNumGroupMembers() > 5 then
            if D and not s:IsCasting(e.Wellspring) then
                a = 1999
            end

            if t("focus"):IsInMeleeRange(40) and e.RecallCloudburstTotem:IsCastable() and not v and W() >= 10000 and (I) then
                if o(e.RecallCloudburstTotem) then
                    a = 201764
                    return "CloudBurst Release DBM"
                end

            end

            if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not O and v and e.CloudBurstTotem:IsCastable() and e.CloudBurstTotem:IsAvailable() then
                if o(e.CloudBurstTotem) then
                    a = 157153
                    return "CloudBurst Totem DBM"
                end

            end

            if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not d() and UnitAffectingCombat("player") and e.Wellspring:IsReady() and not A and (S) then
                if o(e.Wellspring) then
                    a = 197995
                    return "Wellspring DBM"
                end

            end

            if UnitExists("focus") and not UnitCanAttack("player", "focus") and not u("focus") and (p(i.RestorationR.DPSThreshold) > 0 or not UnitExists("target") or not UnitAffectingCombat("player")) then
                if h:IsInMeleeRange(40) and T and (e.VesperTotem:IsReady() or (z and not H and e.RecallVesperTotem:IsReady())) then
                    if o(e.VesperTotem) then
                        a = 324386
                        return "Vesper Totem"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and e.RecallCloudburstTotem:IsReady() and W() >= 10000 and not v and ((p(i.RestorationR.CloudburstReleaseHP) >= i.RestorationR.CloudburstReleaseRaid) or not UnitAffectingCombat("player") or I) then
                    if o(e.RecallCloudburstTotem) then
                        a = 201764
                        return "CloudBurst Release under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and t("focus"):HealthPercentage() <= i.RestorationR.RiptideHP and e.Riptide:IsReady() then
                    if o(e.Riptide) then
                        a = 61295
                        return "Riptide under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and e.HealingRain:IsReady() and not E and not E and not s:IsCasting(e.HealingRain) and not d() and p(i.RestorationR.HealingRainHP) >= i.RestorationR.HealingRainRaid then
                    if o(e.HealingRain) then
                        a = 73920
                        return "Healing Rain under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and e.UnleashLife:IsReady() and t("focus"):HealthPercentage() <= i.RestorationR.UnleashLifeHP then
                    if o(e.UnleashLife) then
                        a = 73685
                        return "UnleashLife under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and not d() and UnitAffectingCombat("player") and e.Wellspring:IsReady() and not A and (t("focus"):HealthPercentage() <= i.RestorationR.WellspringHP or S) then
                    if o(e.Wellspring) then
                        a = 197995
                        return "Wellspring under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not O and (t("focus"):HealthPercentage() <= i.RestorationR.HealingStreamHP or v) and e.CloudBurstTotem:IsReady() and e.CloudBurstTotem:IsAvailable() and ((e.CloudBurstTotem:Charges() >= 2 and not d()) or v) then
                    if o(e.CloudBurstTotem) then
                        a = 157153
                        return "CloudBurst Totem under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and t("focus"):HealthPercentage() <= i.RestorationR.HealingStreamHP and e.HealingStreamTotem:IsReady() and not e.CloudBurstTotem:IsAvailable() and not d() then
                    if o(e.HealingStreamTotem) then
                        a = 5394
                        return "Healing Stream Totem under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and e.EarthenWallTotem:IsReady() and not E and p(i.RestorationR.EarthenWallTotemHP) >= i.RestorationR.EarthenWallTotemRaid and UnitAffectingCombat("player") then
                    if o(e.EarthenWallTotem) then
                        a = 198838
                        return "EarthenWallTotem under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and e.ChainHeal:IsReady() and not d() and p(i.RestorationR.ChainHealHP) >= i.RestorationR.ChainHealRaid then
                    if o(e.ChainHeal) then
                        a = 1064
                        return "Chain Heal under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and ((t("focus"):HealthPercentage() <= i.RestorationR.HealingSurgeHP2 and s:BuffStack(e.TidalWaves) >= 1) or (t("focus"):HealthPercentage() <= i.RestorationR.HealingSurgeHP)) and e.HealingSurge:IsReady() and not d() then
                    if o(e.HealingSurge) then
                        a = 8004
                        return "Healing Surge under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and ((t("focus"):HealthPercentage() <= i.RestorationR.HealingWaveHP2 and s:BuffStack(e.TidalWaves) >= 1) or (t("focus"):HealthPercentage() <= i.RestorationR.HealingWaveHP)) and e.HealingWave:IsReady() and not d() then
                    if o(e.HealingWave) then
                        a = 77472
                        return "Healing Wave under %"
                    end

                end

            end

        end

    else
        if s:BuffDown(e.LightningShieldBuff) then
            if o(e.LightningShield) then
                a = 192106
                return "Lightning Shield Self"
            end

        end

    end

end

local function p()
    local t
    if GetNumGroupMembers() > 0 and not _ then
        t = y()
        if t then
            return t
        end

    end

    if GetNumGroupMembers() > 5 and not _ then
        t = y()
        if t then
            return t
        end

    end

    if ve(L) < ye() and not k then
        t = R()
        if t then
            return t
        end

    end

    local i, n = nil, false
    if not k then
        if EnemiesCount10ySplash < 2 then
            i, n = te()
        else
            i, n = ae()
        end

    end

    if i ~= nil and q(i) and f.TargetIsValid() and not u("target") and not k then
        if o(i) then
            return "Building Maelstrom with optimal Builder (AOE)"
        end

    end

    if i == nil and f.TargetIsValid() and not u("target") and not k then
        t = R()
        if t then
            return "Refreshing Flame Shock because we cannot build or spend"
        end

        if o(e.FrostShock) then
            a = 196840
            return "Casting Frost Shock because we cannot build or spend or refresh flame shock"
        end

    end

    return nil
end

local function j()
    N = HeroRotationCharDB.Toggles[6]
    T = HeroRotationCharDB.Toggles[4]
    fe = HeroRotationCharDB.Toggles[5]
    K = HeroRotationCharDB.Toggles[12]
    me = HeroRotationCharDB.Toggles[15]
    de = HeroRotationCharDB.Toggles[60]
    re = n.CDsON
    we = HeroRotationCharDB.Toggles[90]
    B = HeroRotationCharDB.Toggles[93]
    P = HeroRotationCharDB.Toggles[94]
    Z = HeroRotationCharDB.Toggles[95]
    pe = HeroRotationCharDB.Toggles[97]
    se = HeroRotationCharDB.Toggles[160]
    he = HeroRotationCharDB.Toggles[161]
    ee = HeroRotationCharDB.Toggles[91]
    J = HeroRotationCharDB.Toggles[162]
    U = HeroRotationCharDB.Toggles[163]
    Q = HeroRotationCharDB.Toggles[164]
    k = HeroRotationCharDB.Toggles[165]
    _ = HeroRotationCharDB.Toggles[166]
    v, I, O, A, S, E, D = nil, nil, nil, nil, nil, nil, nil
    c = 0
    ne = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                ne = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

    M = GetInventoryItemID("player", 13)
    C = GetInventoryItemID("player", 14)
            if not i.Commons.Enabled.TopTrinket and not i.Commons.Enabled.BotTrinket then
        Y = { M, C }
    elseif not i.Commons.Enabled.TopTrinket and i.Commons.Enabled.BotTrinket then
        Y = { M }
    elseif not i.Commons.Enabled.BotTrinket and i.Commons.Enabled.TopTrinket then
        Y = { C }
    end

end

local function q()
    L = s:GetEnemiesInRange(40)
        if V() and i.Commons.AoeMode == "Conservative" then
        EnemiesCount8ySplash = h:GetEnemiesInSplashRangeCount(8)
        EnemiesCount10ySplash = h:GetEnemiesInSplashRangeCount(15)
    elseif V() and i.Commons.AoeMode == "Aggresive" then
        local a = 0
        for e = 1, 20 do
            local e = "nameplate" .. e
            if UnitExists(e) then
                if UnitCanAttack("player", e) then
                    if (UnitCanAttack("player", e) and UnitAffectingCombat(e) and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil) or t(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) then
                        a = (a + 1)
                    end

                end

            end

        end

        EnemiesCount8ySplash = a
        EnemiesCount10ySplash = a
    end

    if not V() then
        EnemiesCount8ySplash = 1
        EnemiesCount10ySplash = 1
    end

    if de then
        EnemiesCount10ySplash = 10
        EnemiesCount8ySplash = 10
    end

    if not BotOn then
        g = 0
        a = 0
    end

    if x ~= nil and X and X <= GetTime() - 10 then
        x = nil
        ie = nil
    end

    if g > 0 then
        g = 0
    end

    if a > 0 then
        a = 0
    end

    be()
    j()
    ce()
    if n.QueuedCast() then
        a = n.QueuedCast()
        return "Custom Queue " .. m(a):ID()
    end

    if i.Commons.DBMSupport then
        v, I, O, A, S, E, D = n.RaidDamageInc()
    end

    if UnitAffectingCombat("player") and EnemiesCount10ySplash >= 1 and i.Restoration.TargetSwap == "AutoSwap" and not K and not k then
        if not UnitExists("target") or UnitReaction("player", "target") == 8 or UnitReaction("player", "target") == 7 or UnitReaction("player", "target") == 6 or UnitReaction("player", "target") == 5 then
            g = 999
        end

    end

    if s:IsChanneling() or s:IsChanneling(e.FaeTransfusion) then
        if o(e.Pool, nil) then
            a = 99999
            return "Trinket Channel"
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.FrostShock:IsCastable() then
            if o(e.FrostShock, nil) then
                g = 1196840
                return "explosive MO FS"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.FrostShock:IsCastable() then
            if o(e.FrostShock, nil) then
                a = 196840
                return "explosive  FS"
            end

        end

    end

        if n.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (n.GUISettings.General.OpenerReset)
    elseif n.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        n.ToggleIconFrame:UpdateButtonText(6)
        n.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

    local i
    if GetNumGroupMembers() >= 0 and GetNumGroupMembers() <= 5 then
        if UnitGUID("focus") == t("party" .. (l / 100)):GUID() and l ~= 500 then
            l = 0
        end

        if UnitGUID("focus") == UnitGUID("player") and l == 500 then
            l = 0
        end

    end

    if GetNumGroupMembers() > 5 then
        if UnitGUID("focus") == t("raid" .. (l / 1000)):GUID() then
            l = 0
        end

    end

    if GetNumGroupMembers() >= 0 then
        if w <= GetTime() then
            ue()
            if (r ~= nil) and UnitGUID("focus") ~= r and w <= GetTime() then
                l = c * 100
            end

            w = GetTime() + .5
        end

    end

        if (Q and e.PurifySpirit:IsUsableP() and e.PurifySpirit:CooldownRemains(BypassRecovery) <= 0 and UnitExists("mouseover")) then
        if n.Cast(e.PurifySpirit, nil, nil, nil) then
            if UnitExists("mouseover") and t("mouseover"):IsInRange(40) and not UnitIsEnemy("mouseover", "player") then
                a = 177130
                return "queue PurifySpirit MO"
            end

        end

    elseif ((not e.PurifySpirit:IsUsableP() or e.PurifySpirit:CooldownRemains() > 0) and Q) then
        HeroRotationCharDB.Toggles[164] = not HeroRotationCharDB.Toggles[164]
        n.Print("PurifySpirit Queue is now " .. (HeroRotationCharDB.Toggles[164] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (ee and e.CapacitorTotem:IsUsableP() and e.CapacitorTotem:CooldownRemains(BypassRecovery) <= 0) then
        if n.Cast(e.CapacitorTotem, nil, nil, nil) then
            a = 1192058
            return "queue CapacitorTotem"
        end

    elseif ((not e.CapacitorTotem:IsUsableP() or e.CapacitorTotem:CooldownRemains(BypassRecovery) > 0) and ee) then
        HeroRotationCharDB.Toggles[91] = not HeroRotationCharDB.Toggles[91]
        n.Print("Capacitor Totem Queue is now " .. (HeroRotationCharDB.Toggles[91] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (J and e.VesperTotem:IsUsableP() and (e.VesperTotem:CooldownRemains(BypassRecovery) <= 0 or m(324519):IsCastable())) then
        if n.Cast(e.VesperTotem, nil, nil, nil) then
            a = 324386
            return "queue VesperTotem"
        end

    elseif ((not e.VesperTotem:IsUsableP() or (e.VesperTotem:CooldownRemains(BypassRecovery) > 0 and not m(324519):IsCastable())) and J) then
        HeroRotationCharDB.Toggles[162] = not HeroRotationCharDB.Toggles[162]
        n.Print("Capacitor Totem Queue is now " .. (HeroRotationCharDB.Toggles[162] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (P and e.WindRushTotem:IsUsableP() and e.WindRushTotem:IsAvailable() and e.WindRushTotem:CooldownRemains(BypassRecovery) <= 0) then
        if n.Cast(e.WindRushTotem, nil, nil, nil) then
            a = 192077
            return "queue WindRushTotem"
        end

    elseif ((not e.WindRushTotem:IsUsableP() or not e.WindRushTotem:IsAvailable() or e.WindRushTotem:CooldownRemains(BypassRecovery) > 0) and P) then
        HeroRotationCharDB.Toggles[94] = not HeroRotationCharDB.Toggles[94]
        n.Print("Wind Rush Totem Queue is now " .. (HeroRotationCharDB.Toggles[94] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (Z and e.Hex:IsUsableP() and e.Hex:CooldownRemains(BypassRecovery) <= 0 and UnitExists("mouseover")) then
        if n.Cast(e.Hex, nil, nil, nil) then
            if UnitExists("mouseover") and t("mouseover"):IsInRange(40) then
                g = 151514
                return "queue Hex MO"
            end

        end

    elseif ((not e.Hex:IsUsableP() or e.Hex:CooldownRemains() > 0) and Z) then
        HeroRotationCharDB.Toggles[95] = not HeroRotationCharDB.Toggles[95]
        n.Print("Hex Queue is now " .. (HeroRotationCharDB.Toggles[95] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (B and e.TremorTotem:IsUsableP() and e.TremorTotem:CooldownRemains(BypassRecovery) <= 0) then
        if n.Cast(e.TremorTotem, nil, nil, nil) then
            a = 8143
            return "queue TremorTotem"
        end

    elseif ((not e.TremorTotem:IsUsableP() or e.TremorTotem:CooldownRemains(BypassRecovery) > 0) and B) then
        HeroRotationCharDB.Toggles[93] = not HeroRotationCharDB.Toggles[93]
        n.Print("Tremor Totem Queue is now " .. (HeroRotationCharDB.Toggles[93] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if se and not UnitAffectingCombat("player") and not _ then
        i = y()
        if i then
            return i
        end

    end

    i = G()
    if i then
        return i
    end

    if e.CloudBurstTotem:IsCastable() and not _ and e.CloudBurstTotem:IsAvailable() and not d() and UnitAffectingCombat("player") and e.CloudBurstTotem:Charges() >= 1 and (e.HealingTideTotem:TimeSinceLastCast() <= 7 or e.Ascendance:TimeSinceLastCast() <= 10 or e.SpiritLinkTotem:TimeSinceLastCast() <= 3) then
        if o(e.CloudBurstTotem) then
            a = 157153
            return "CloudBurst Totem for Burst"
        end

    end

    if (UnitAffectingCombat("player") or N) then
        if he then
            i = F()
            if i then
                return i
            end

        end

        if f.TargetIsValid() and not _ then
            i = oe()
            if i then
                return i
            end

        end

        i = p()
        if i then
            return i
        end

        if f.TargetIsValid() and u("target") and not k then
            n.CastAnnotated(e.Pool, false, "LoS")
        end

    end

end

local function o()
    n.Print("Restoration Shaman rotation is currently a work in progress.")
end

function ReturnSpell3()
    if a == 0 then
        return 0
    else
        return a
    end

end

function ReturnSpellMO3()
    if g == 0 then
        return 0
    else
        return g
    end

end

function ReturnSpellF3()
    if l == 0 then
        return 0
    else
        return l
    end

end

function BlacklistExport()
    local t = nil
    if table.getn(b) > 0 then
        for e = 1, table.getn(b) do
            for e in string.gmatch(b[e], "([^%s]+)") do
                if tonumber(e) ~= nil then
                    e = tonumber(e)
                end

                if type(e) == "string" then
                    t = le(e)
                end

            end

        end

    end

    return t
end

n.SetAPL(264, q, o)

