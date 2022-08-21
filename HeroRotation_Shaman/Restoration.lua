local e, e = ...
local e = HeroDBC.DBC
local j = HeroLib
local e = HeroCache
local t = j.Unit
local s = t.Player
local e = t.Pet
local r = t.Target
local m = j.Spell
local e = j.MultiSpell
local a = j.Item
local n = HeroRotation
local o = n.Cast
local te = n.AoEON
local ie = n.CDsON
local T = HeroRotationCharDB.Toggles[4]
local we = HeroRotationCharDB.Toggles[5]
local H = HeroRotationCharDB.Toggles[6]
local ye = HeroRotationCharDB.Toggles[15]
local Z = HeroRotationCharDB.Toggles[12]
local re = HeroRotationCharDB.Toggles[60]
local be = HeroRotationCharDB.Toggles[90]
local G = HeroRotationCharDB.Toggles[93]
local B = HeroRotationCharDB.Toggles[94]
local J = HeroRotationCharDB.Toggles[95]
local le = HeroRotationCharDB.Toggles[160]
local se = HeroRotationCharDB.Toggles[161]
local X = HeroRotationCharDB.Toggles[91]
local V = HeroRotationCharDB.Toggles[92]
local D = HeroRotationCharDB.Toggles[163]
local K = HeroRotationCharDB.Toggles[164]
local q = HeroRotationCharDB.Toggles[165]
local E = HeroRotationCharDB.Toggles[166]
local Q = HeroRotationCharDB.Toggles[97]
local he = 0
local e = math.min
local e = m.Shaman.Restoration
local i = a.Shaman.Restoration
local U = e.PurifySpirit:IsCastable()
local i = s:GetEquipment()
local i = a(0)
local a = a(0)
local M, a = GetInventoryItemID("player", 13)
local Y, a = GetInventoryItemID("player", 14)
local P = {  }
local w = n.Commons.Everyone
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
local ue
local a
local a
local a
local f = 1.
local h = nil
local d = 0
local v = 0
local l = 0
local p = 0
local z = false
local R = false
local L = 0
local A = 0
local y, ee, ne
local a, c, u
local b = {  }
local g = false
local O = false
local N = false
local I = false
local S = false
local _ = false
local F = false
j:RegisterForEvent(function()
    R = false
end, "PLAYER_REGEN_ENABLED")
j:RegisterForEvent(function(e, ...)
    if e == "CHAT_MSG_YELL" then
        local e, t, o, o, o, o, o, o, o, o, o, a, o, o, o, o, o = ...
        if e == "DISPEL ME(auto)" then
            y = a
            ee = GetTime()
            ne = t
        end

    end

end, "CHAT_MSG_YELL")
j:RegisterForEvent(function(t, ...)
    local o, e, n, i = ...
    if t == "UNIT_SPELLCAST_SENT" then
        if o == "player" and e then
            a = i
            c = e
        end

    end

    if t == "UI_ERROR_MESSAGE" then
        if e == SPELL_FAILED_LINE_OF_SIGHT then
            u = c
            missedspell = a
        end

    end

end, "UI_ERROR_MESSAGE", "UNIT_SPELLCAST_SENT")
local function de(a, o)
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

local function ge()
    if u then
        table.insert(b, (de(u) .. " " .. GetTime()))
        u = nil
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

local function c(a)
    if table.getn(b) > 0 and a ~= nil then
        for e = 1, table.getn(b) do
            for e in string.gmatch(b[e], "([^%s]+)") do
                if e and e == t(a):GUID() then
                    return true
                end

            end

        end

    else
        return false
    end

end

local function x(e)
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

local a, a, C, a
local k = 0
local a = 0
local u = 0
local function W(e)
    if e then
        return 1
    else
        return 0
    end

end

local function oe(t)
    return t:DebuffRemains(e.FlameShockDebuff)
end

local function W(e)
    return c(e)
end

local function ae(o)
                if (o:DebuffDown(e.FlameShockDebuff) and o:IsInRange(40) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) and o:GUID() == t("mouseover"):GUID()) then
        k = 1188389
        return true
    elseif (o:DebuffDown(e.FlameShockDebuff) and o:IsInRange(40) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) and i.Restoration.TargetSwap == "AutoSwap" and o:GUID() ~= r:GUID() and not Z) then
        k = 999
        return true
    elseif (o:DebuffDown(e.FlameShockDebuff) and o:IsInRange(40) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) and o:GUID() == r:GUID()) then
        a = 188389
        return true
    elseif o:DebuffDown(e.FlameShockDebuff) and o:IsInRange(40) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) then
        return true
    end

end

local function W(e)
    return (e:IsInRange(40) and c(e) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326))
end

local function ve()
    z = false
    for e = 1, 6 do
        local t, t, t, t, e = GetTotemInfo(e)
        if e == 3565451 then
            z = true
        end

    end

    if not z then
        l = 0
        p = 0
    end

    if (e.VesperTotem:TimeSinceLastCast() <= .5 or e.RecallVesperTotem:TimeSinceLastCast() <= .5) and z then
        l = 3
        p = 3
        R = true
    end

    if (e.LavaBurst:TimeSinceLastCast() <= .5 or e.ChainLightning:TimeSinceLastCast() <= .5 or e.LightningBolt:TimeSinceLastCast() <= .5) and L <= GetTime() and z then
        l = l - 1
        L = GetTime() + .66
    end

    if (e.EarthShield:TimeSinceLastCast() <= .5 or e.Riptide:TimeSinceLastCast() <= .5 or e.ChainHeal:TimeSinceLastCast() <= .5 or e.HealingSurge:TimeSinceLastCast() <= .5 or e.HealingStreamTotem:TimeSinceLastCast() <= .5 or e.CloudBurstTotem:TimeSinceLastCast() <= .5 or e.HealingWave:TimeSinceLastCast() <= .5 or e.HealingRain:TimeSinceLastCast() <= .5) and A <= GetTime() and z then
        p = l - 1
        A = GetTime() + .66
    end

end

local function pe(a)
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

local function ce()
    local a = false
    local t = 0
    for e = 0, NUM_BAG_SLOTS do
        for o = 1, GetContainerNumSlots(e) do
            t = GetContainerItemID(e, o)
            if t == 177278 then
                a = true
            end

        end

    end

    return a
end

local function p(a)
    if a == nil then
        return nil
    end

    a = a / 100
    local e = 0
    if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
        for o = 1, GetNumGroupMembers() do
            if UnitExists("party" .. o) and not t("party" .. o):IsDeadOrGhost() and t("party" .. o):DebuffDown(m(228578)) then
                local i = UnitHealth("party" .. o) + (UnitGetIncomingHeals("party" .. o) or 0) - x("party" .. o)
                local t = UnitHealthMax("party" .. o)
                if i / t <= a or (UnitHealth("party" .. o) / t == 1 and a == 1) then
                    e = e + 1
                end

            end

        end

        if (((UnitHealth("player") + (UnitGetIncomingHeals("player") or 0)) / UnitHealthMax("player")) < a or (UnitHealth("player") / UnitHealthMax("player") == 1 and a == 1)) then
            e = e + 1
        end

    end

    if GetNumGroupMembers() > 5 then
        for o = 1, GetNumGroupMembers() do
            if UnitExists("raid" .. o) and not UnitIsDead("raid" .. o) and t("raid" .. o):DebuffDown(m(362075)) and t("raid" .. o):DebuffDown(m(362397)) and t("raid" .. o):DebuffDown(m(191587)) then
                local t = 0
                local i = UnitHealth("raid" .. o) + (UnitGetIncomingHeals("raid" .. o) or 0) - x("raid" .. o)
                local t = UnitHealthMax("raid" .. o)
                if i / t <= a then
                    e = e + 1
                end

            end

        end

    end

    if GetNumGroupMembers() == 0 then
        local o = UnitHealth("player") + (UnitGetIncomingHeals("player") or 0) - x("player")
        local t = UnitHealthMax("player")
        if o / t < a then
            e = e + 1
        end

    end

    return e
end

local function W()
    local e = false
    if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
        for t = 1, GetNumGroupMembers() do
            for a = 0, 40 do
                local o, o, o, o, o, o, t, o, o, a = UnitBuff("party" .. t, a)
                if t == "player" and a == 974 then
                    e = true
                end

            end

        end

    end

    if GetNumGroupMembers() > 5 then
        for t = 1, GetNumGroupMembers() do
            for a = 0, 40 do
                local o, o, o, o, o, o, a, o, o, t = UnitBuff("raid" .. t, a)
                if a == "player" and t == 974 then
                    e = true
                end

            end

        end

    end

    return e
end

local function A(t)
    local e = false
    for a = 0, GetNumGroupMembers() do
        local o, o, o, o, o, o, a, o, o, t = UnitBuff(t, a)
        if a == "player" and t == 974 then
            e = true
        end

    end

    return e
end

local function L()
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

local function l()
    if s:IsMoving() and not s:BuffUp(e.SpiritwalkersGraceBuff) then
        return true
    else
        return false
    end

end

local function fe()
    ue = 0
    f = 1.
    h = nil
    d = 0
    if not r:TimeToDieIsNotValid() and not r:IsUserCycleBlacklisted() then
        ue = r:TimeToDie()
    end

    if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
        if (UnitGUID("focus") == t("party" .. (u / 100)):GUID() or not UnitExists("party" .. (u / 100))) and u ~= 500 then
            u = 0
        end

        if UnitGUID("focus") == UnitGUID("player") and u == 500 then
            u = 0
        end

    end

    if GetNumGroupMembers() > 5 then
        if UnitGUID("focus") == t("raid" .. (u / 1000)):GUID() or not UnitExists("raid" .. (u / 1000)) then
            u = 0
        end

    end

    U = e.PurifySpirit:IsCastable()
        if GetNumGroupMembers() > 0 and not E then
                if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
            for t = 1, GetNumGroupMembers() do
                if UnitExists("party" .. t) and not UnitIsDead("party" .. t) and IsItemInRange(17067, "party" .. t) and not c("party" .. t) and not UnitCanAttack("player", "party" .. t) then
                    for n = 1, 10 do
                        local c, c, u, l, s, r, c, c, c, n = UnitDebuff("party" .. t, n)
                        if n ~= 329298 then
                            local a = UnitHealth("party" .. t) + (UnitGetIncomingHeals("party" .. t) or 0) - x("party" .. t)
                            local e = UnitHealthMax("party" .. t)
                            if a / e < f and a / e < (i.RestorationR.DPSThreshold / 100) then
                                f = a / e
                                h = UnitGUID("party" .. t)
                                d = t
                            end

                        end

                        if (f >= .5 or n == 227404) and U and not D then
                            if (l == "Curse" or l == "Magic") and n ~= 320788 and ((n ~= 323347) or (n == 323347 and u >= 2)) and n ~= 350469 and n ~= 350541 and n ~= 351117 and n ~= 229159 then
                                if (r - s) + (i.Restoration.PurifyDelay / 1000) <= GetTime() then
                                                                        if n ~= 227404 then
                                        h = UnitGUID("party" .. t)
                                        d = t
                                    elseif n == 227404 and y and y == UnitGUID("party" .. t) then
                                        h = UnitGUID("party" .. t)
                                        d = t
                                    end

                                end

                                if UnitGUID("focus") == UnitGUID("party" .. t) and (r - s) + (i.Restoration.PurifyDelay / 1000) <= GetTime() then
                                                                        if n ~= 227404 then
                                        if o(e.PurifySpirit) then
                                            a = 77130
                                            return "Purify Spirit"
                                        end

                                    elseif n == 227404 and y and y == UnitGUID("focus") then
                                        if o(e.PurifySpirit) then
                                            a = 77130
                                            return "Purify Spirit"
                                        end

                                    end

                                end

                            end

                        end

                    end

                end

                if not UnitAffectingCombat("player") and (UnitGroupRolesAssigned("party" .. t) == "TANK") and IsItemInRange(17067, "party" .. t) and not W() and f >= .5 then
                                        if UnitGUID("party" .. t) ~= UnitGUID("focus") then
                        d = t
                        h = UnitGUID("party" .. t)
                    elseif UnitGUID("party" .. t) == UnitGUID("focus") then
                        if true then
                            a = 974
                            return "EarthShield a Tank"
                        end

                    end

                end

                if (UnitGroupRolesAssigned("party" .. t) == "TANK") and UnitThreatSituation("party" .. t, "target") ~= nil and UnitThreatSituation("party" .. t, "target") >= 3 and not A("party" .. t) and p(i.RestorationM.DPSThreshold) <= 0 then
                                        if UnitGUID("party" .. t) ~= UnitGUID("focus") then
                        d = t
                        h = UnitGUID("party" .. t)
                    elseif UnitGUID("party" .. t) == UnitGUID("focus") and not A("focus") then
                        if true then
                            a = 974
                            return "EarthShield a Tank"
                        end

                    end

                end

            end

            if ((UnitHealth("player") + (UnitGetIncomingHeals("player") or 0)) / UnitHealthMax("player")) - (0) < f and v <= GetTime() and t("player"):DebuffDown(m(228578)) then
                f = ((UnitHealth("player") + (UnitGetIncomingHeals("player") or 0)) / UnitHealthMax("player")) - (0)
                h = UnitGUID("player")
                d = 5
            end

            if not t("player"):IsDeadOrGhost() and t("player"):DebuffDown(m(228578)) then
                for n = 1, 10 do
                    local c, c, u, l, r, s, c, c, c, t, c, c, c, c, c = UnitDebuff("player", n)
                    if (f >= .5 or t == 227404) and U and not D then
                        if (l == "Curse" or l == "Magic") and t ~= 320788 and ((t ~= 323347) or (t == 323347 and u >= 2)) and t ~= 350469 and t ~= 350541 and t ~= 351117 and t ~= 229159 then
                            if (s - r) + (i.Restoration.PurifyDelay / 1000) <= GetTime() then
                                                                if t ~= 227404 then
                                    h = UnitGUID("player")
                                    d = n
                                elseif t == 227404 and y and y == UnitGUID("player") then
                                    h = UnitGUID("player")
                                    d = n
                                end

                            end

                            if UnitGUID("focus") == UnitGUID("player") and (s - r) + (i.Restoration.PurifyDelay / 1000) <= GetTime() then
                                                                if t ~= 227404 then
                                    if o(e.PurifySpirit) then
                                        a = 77130
                                        return "Purify Spirit"
                                    end

                                elseif t == 227404 and y and y == UnitGUID("focus") then
                                    if o(e.PurifySpirit) then
                                        a = 77130
                                        return "Purify Spirit"
                                    end

                                end

                            end

                        end

                    end

                end

            end

        elseif GetNumGroupMembers() > 5 and v <= GetTime() then
            for t = 1, GetNumGroupMembers() do
                if UnitExists("raid" .. t) and not UnitIsDead("raid" .. t) and IsItemInRange(17067, "raid" .. t) and not c("raid" .. t) and not UnitCanAttack("player", "raid" .. t) then
                    for n = 1, 10 do
                        local c, c, u, r, s, l, c, c, c, n = UnitDebuff("raid" .. t, n)
                        if n ~= 329298 then
                            local e = UnitHealth("raid" .. t) + (UnitGetIncomingHeals("raid" .. t) or 0) - x("raid" .. t)
                            local a = UnitHealthMax("raid" .. t)
                            if e / a < f and e / a < i.RestorationR.DPSThreshold then
                                f = e / a
                                h = UnitGUID("raid" .. t)
                                d = t * 10
                            end

                        end

                        if f >= .5 and U and not D then
                            if (r == "Curse" or r == "Magic") and n ~= 320788 and ((n ~= 323347) or (n == 323347 and u >= 2)) and n ~= 350469 and n ~= 350541 and n ~= 351117 and n ~= 229159 then
                                if (l - s) + (i.Restoration.PurifyDelay / 1000) <= GetTime() then
                                    h = UnitGUID("raid" .. t)
                                    d = t * 10
                                end

                                if UnitGUID("focus") == UnitGUID("raid" .. t) and (l - s) + (i.Restoration.PurifyDelay / 1000) <= GetTime() and n ~= 227404 then
                                                                        if n ~= 227404 then
                                        if o(e.PurifySpirit) then
                                            a = 77130
                                            return "Purify Spirit"
                                        end

                                    elseif n == 227404 and y and y == UnitGUID("focus") then
                                        if o(e.PurifySpirit) then
                                            a = 77130
                                            return "Purify Spirit"
                                        end

                                    end

                                end

                            end

                        end

                    end

                    if not UnitAffectingCombat("player") and (UnitGroupRolesAssigned("raid" .. t) == "TANK") and IsItemInRange(17067, "raid" .. t) and not W() and f >= .5 then
                                                if UnitGUID("raid" .. t) ~= UnitGUID("focus") then
                            d = t * 10
                            h = UnitGUID("raid" .. t)
                        elseif UnitGUID("raid" .. t) == UnitGUID("focus") then
                            if o(e.EarthShield) then
                                a = 974
                                return "EarthShield a Tank"
                            end

                        end

                    end

                    if (UnitGroupRolesAssigned("raid" .. t) == "TANK") and UnitThreatSituation("raid" .. t, "boss1") ~= nil and UnitThreatSituation("raid" .. t, "boss1") >= 3 and not A("raid" .. t) and f >= .5 then
                                                if UnitGUID("raid" .. t) ~= UnitGUID("focus") then
                            d = t * 10
                            h = UnitGUID("raid" .. t)
                        elseif UnitGUID("raid" .. t) == UnitGUID("focus") and not A("focus") then
                            if o(e.EarthShield) then
                                a = 974
                                return "EarthShield a Tank"
                            end

                        end

                    end

                end

            end

                        if UnitExists("target") and (r:NPCID() == 182822 or r:NPCID() == 184493) and t("target"):HealthPercentage() < 100 and r:GUID() ~= UnitGUID("focus") and v <= GetTime() then
                h = t("target"):GUID()
                d = 1000
            elseif UnitExists("target") and (r:NPCID() == 182822 or r:NPCID() == 184493) and t("target"):HealthPercentage() < 100 and r:GUID() == UnitGUID("focus") then
                h = t("target"):GUID()
                d = 0
            end

        end

    elseif GetNumGroupMembers() == 0 then
        local e = UnitHealth("player") + (UnitGetIncomingHeals("player") or 0) - x("player")
        local t = UnitHealthMax("player")
        if v <= GetTime() and UnitGUID("focus") ~= UnitGUID("player") then
            f = e / t
            h = UnitGUID("player")
            if h == UnitGUID("player") and v <= GetTime() then
                d = 5
            end

        end

    end

end

local function x(t)
    if t == nil or not w.TargetIsValid() then
        return nil
    end

    local a = t:IsCastable() and t:IsReady()
    local o = (s:BuffUp(e.SpiritwalkersGraceBuff) or not s:IsMoving())
                if t == e.LightningBolt or t == e.ChainLightning or t == e.HealingRain or t == e.HealingWave or t == e.HealingSurge or t == e.Wellspring then
        return a and o
    elseif t == e.VesperTotem then
        return a
    elseif t == e.LavaBurst then
        local n = s:BuffUp(e.LavaSurgeBuff)
        local t = (not s:IsCasting(e.LavaBurst) and e.LavaBurst:Charges() >= 1)
        local i = (s:IsCasting(e.LavaBurst) and e.LavaBurst:Charges() == 2)
        return a and (o or s:BuffUp(e.LavaSurgeBuff)) and (n or t or i)
    elseif w.TargetIsValid() then
        return a
    end

end

local function me()
    if GetNumGroupMembers() > 0 then
        if s:BuffDown(e.WaterShield) and e.WaterShield:IsCastable() then
            if o(e.WaterShield) then
                a = 52127
                return "Water Shield Self"
            end

        end

        if h and UnitGUID("focus") ~= h and v <= GetTime() and not E then
            u = d * 100
            if h == UnitGUID("focus") then
                v = GetTime() + (s:GCD() + .25)
            end

        end

        if e.EarthShield:IsCastable() and r:NPCID() ~= 182822 then
            if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 and f >= .5 then
                for i = 1, GetNumGroupMembers() do
                    if (UnitGroupRolesAssigned("party" .. i) == "TANK" or t("party" .. i):NPCID() == 72218) and not UnitCanAttack("player", "party" .. i) and not c("party" .. i) and t("party" .. i):IsInMeleeRange(40) and not W() and v <= GetTime() and p(80) == 0 then
                                                if UnitGUID("party" .. i) ~= UnitGUID("focus") and t("party" .. i):IsInMeleeRange(40) and not t("party" .. i):IsDeadOrGhost() then
                            d = i
                            h = UnitGUID("party" .. i)
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
                    if (UnitGroupRolesAssigned("raid" .. i) == "TANK") and IsItemInRange(17067, "raid" .. i) and not UnitCanAttack("player", "raid" .. i) and not c("raid" .. i) and not W() and v <= GetTime() and not UnitAffectingCombat("player") then
                                                if UnitGUID("raid" .. i) ~= UnitGUID("focus") and IsItemInRange(17067, "raid" .. i) and not UnitIsDead("raid" .. i) then
                            d = i * 10
                            h = UnitGUID("raid" .. i)
                        elseif UnitGUID("raid" .. i) == UnitGUID("focus") and t("focus"):IsInMeleeRange(40) and not UnitIsDead("raid" .. i) and not UnitAffectingCombat("player") and not UnitCanAttack("player", "raid" .. i) then
                            if o(e.EarthShield) then
                                a = 974
                                return "EarthShield a Tank"
                            end

                        end

                    end

                    if (UnitGroupRolesAssigned("raid" .. i) == "TANK") and UnitThreatSituation("raid" .. i, "boss1") ~= nil and UnitThreatSituation("raid" .. i, "boss1") >= 3 and IsItemInRange(17067, "raid" .. i) and not c("raid" .. i) and not A("raid" .. i) and not UnitIsDead("raid" .. i) and not UnitCanAttack("player", "raid" .. i) then
                                                if UnitGUID("raid" .. i) ~= UnitGUID("focus") and v <= GetTime() then
                            d = i * 10
                            h = UnitGUID("raid" .. i)
                        elseif UnitGUID("raid" .. i) == UnitGUID("focus") and not A("focus") then
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

    if e.SummonSteward:IsCastable() and not ce() and not UnitAffectingCombat("player") then
        if o(e.SummonSteward, nil, nil) then
            a = 324739
            return "Precombat SummonSteward"
        end

    end

    if x(e.Fleshcraft) and w.TargetIsValid() and T and H and not UnitAffectingCombat("player") then
        if o(e.Fleshcraft, nil, nil) then
            a = 324631
            return "Precombat Fleshcraft"
        end

    end

    if not q and EnemiesCount10ySplash >= 3 and not c("target") and w.TargetIsValid() and H and not UnitAffectingCombat("player") and x(e.ChainLightning) and not s:IsCasting(e.ChainLightning) then
        if o(e.ChainLightning, nil, nil, not r:IsSpellInRange(e.ChainLightning)) then
            a = 188443
            return "Precombat Chain Lightning"
        end

    end

    if not q and x(e.LavaBurst) and not c("target") and w.TargetIsValid() and H and not UnitAffectingCombat("player") and not s:IsCasting(e.LavaBurst) then
        if o(e.LavaBurst, nil, nil, not r:IsSpellInRange(e.LavaBurst)) then
            a = 51505
            return "Precombat Lavaburst"
        end

    end

    if not q and s:IsCasting(e.LavaBurst) and not c("target") and w.TargetIsValid() and H and not UnitAffectingCombat("player") and e.FlameShock:CooldownRemains() == 0 then
        if o(e.FlameShock, nil, nil, not r:IsSpellInRange(e.FlameShock)) then
            return "Precombat Flameshock"
        end

    end

end

local function W()
    if UnitExists("focus") and not UnitCanAttack("player", "focus") then
        if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and e.CloudBurstTotem:IsCastable() and e.CloudBurstTotem:IsAvailable() and not l() then
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

local function ue()
    local t = s:GetUseableTrinkets(P)
    if t and ie() then
        if o(t, nil, nil) then
                        if t:ID() == M and i.Commons.Enabled.TopTrinket then
                a = 24
                return "top trinket 1"
            elseif t:ID() == Y and i.Commons.Enabled.BottomTrinket then
                a = 30
                return "Bot trinket 2"
            end

        end

    end

    if e.ChainHarvest:IsCastable() and not l() and T then
        if o(e.ChainHarvest, nil, nil) then
            a = 320674
            return "Chain Harvest CD"
        end

    end

    if ((e.VesperTotem:IsCastable() and T) or (z and not R and e.RecallVesperTotem:IsReady())) then
        if o(e.VesperTotem, nil, nil) then
            a = 324386
            return "Vesper Totem CD"
        end

    end

end

local function ce()
    if EnemiesCount10ySplash >= 3 then
        return 0
    end

    return EnemiesCount10ySplash
end

local function U()
    if x(e.FlameShock) and w.TargetIsValid() then
        if w.CastTargetIf(e.FlameShock, C, "min", oe, ae) then
            return "Flame Shock 108"
        end

        if oe(r) and ae(r) then
            if o(e.FlameShock, nil, nil, not r:IsSpellInRange(e.FlameShock)) then
                a = 188389
                return "FlameShock 108"
            end

        end

    end

end

local function oe()
        if x(e.LavaBurst) and w.TargetIsValid() and not c("target") then
        a = 51505
        return e.LavaBurst, false
    elseif x(e.LightningBolt) and w.TargetIsValid() and not c("target") then
        a = 188196
        return e.LightningBolt, true
    end

    return nil, false
end

local function ae()
        if x(e.LavaBurst) and w.TargetIsValid() and not c("target") and (EnemiesCount10ySplash < 3) then
        a = 51505
        return e.LavaBurst, true
    elseif x(e.ChainLightning) and w.TargetIsValid() and not c("target") then
        a = 188443
        return e.ChainLightning, true
    end

    return nil, false
end

local function A()
    if GetNumGroupMembers() > 0 then
        if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
            if F and not s:IsCasting(e.Wellspring) then
                a = 1999
            end

            if t("focus"):IsInMeleeRange(40) and e.RecallCloudburstTotem:IsCastable() and not g and L() >= 10000 and (N) then
                if o(e.RecallCloudburstTotem) then
                    a = 201764
                    return "CloudBurst Release under %"
                end

            end

            if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not O and g and e.CloudBurstTotem:IsCastable() and e.CloudBurstTotem:IsAvailable() then
                if o(e.CloudBurstTotem) then
                    a = 157153
                    return "CloudBurst Totem under %"
                end

            end

            if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not l() and UnitAffectingCombat("player") and e.Wellspring:IsReady() and not I and (S) then
                if o(e.Wellspring) then
                    a = 197995
                    return "Wellspring under %"
                end

            end

            if e.PurifySpirit:IsCastable() and UnitExists("focus") and not UnitCanAttack("player", "focus") and not c("focus") and not D and t("focus"):IsInRange(40) and t("focus"):DebuffDown(m(362075)) and t("focus"):DebuffDown(m(362397)) and t("focus"):DebuffDown(m(191587)) and t("focus"):DebuffDown(m(228578)) then
                for t = 1, 40 do
                    local d, d, r, n, s, h, d, d, d, t, d, d, d, d, d = UnitDebuff("focus", t)
                    if (n == "Curse" or n == "Magic") and t ~= 320788 and ((t ~= 323347) or (t == 323347 and r >= 2)) and t ~= 350469 and t ~= 350541 and t ~= 351117 and t ~= 229159 and t ~= 227404 then
                                                if (h - s) + (i.Restoration.PurifyDelay / 1000) <= GetTime() then
                            if o(e.PurifySpirit) then
                                a = 77130
                                return "Purify Spirit"
                            end

                        elseif t == 227404 and y and y == UnitGUID("focus") then
                            if o(e.PurifySpirit) then
                                a = 77130
                                return "Purify Spirit"
                            end

                        end

                    end

                end

            end

            if (UnitExists("focus") and not UnitCanAttack("player", "focus") and not c("focus") and (p(i.RestorationM.DPSThreshold) > 0)) then
                if r:IsInMeleeRange(40) and UnitAffectingCombat("player") and T and (e.VesperTotem:IsCastable() or (z and not R and e.RecallVesperTotem:IsReady())) then
                    if o(e.VesperTotem) then
                        a = 324386
                        return "Vesper Totem Heal"
                    end

                end

                if r:IsInMeleeRange(40) and UnitAffectingCombat("player") and T and e.ChainHarvest:IsCastable() then
                    if o(e.ChainHarvest, nil, nil) then
                        a = 320674
                        return "Chain Harvest Heal"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and e.RecallCloudburstTotem:IsCastable() and not g and L() >= 10000 and (p(i.RestorationM.CloudburstReleaseHP) >= i.RestorationM.CloudburstReleaseParty or not UnitAffectingCombat("player") or N) then
                    if o(e.RecallCloudburstTotem) then
                        a = 201764
                        return "CloudBurst Release under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and (t("focus"):HealthPercentage() <= i.RestorationM.HealingStreamHP or g) and not O and e.CloudBurstTotem:IsCastable() and e.CloudBurstTotem:IsAvailable() and ((e.CloudBurstTotem:Charges() >= 2 and not l()) or g) then
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

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not l() and UnitAffectingCombat("player") and e.Wellspring:IsReady() and not I and (t("focus"):HealthPercentage() <= i.RestorationM.WellspringHP or S) then
                    if o(e.Wellspring) then
                        a = 197995
                        return "Wellspring under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and ((t("focus"):HealthPercentage() <= i.RestorationM.HealingSurgeHP2 and s:BuffStack(e.TidalWaves) >= 1) or (t("focus"):HealthPercentage() <= i.RestorationM.HealingSurgeHP)) and e.HealingSurge:IsCastable() and not l() then
                    if o(e.HealingSurge) then
                        a = 8004
                        return "Healing Surge under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and ((t("focus"):HealthPercentage() <= i.RestorationM.HealingWaveHP2 and s:BuffStack(e.TidalWaves) >= 1) or (t("focus"):HealthPercentage() <= i.RestorationM.HealingWaveHP)) and e.HealingWave:IsCastable() and not l() then
                    if o(e.HealingWave) then
                        a = 77472
                        return "Healing Wave under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not l() and e.EarthenWallTotem:IsReady() and not _ and p(i.RestorationM.EarthenWallTotemHP) >= i.RestorationM.EarthenWallTotemParty and UnitAffectingCombat("player") then
                    if o(e.EarthenWallTotem) then
                        a = 198838
                        return "EarthenWallTotem under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and e.ChainHeal:IsCastable() and not l() and p(i.RestorationM.ChainHealHP) >= i.RestorationM.ChainHealParty then
                    if o(e.ChainHeal) then
                        a = 1064
                        return "Chain Heal under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and e.HealingRain:IsCastable() and not _ and not s:IsCasting(e.HealingRain) and not l() and p(i.RestorationM.HealingRainHP) >= i.RestorationM.HealingRainParty then
                    if o(e.HealingRain) then
                        a = 73920
                        return "Healing Rain under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and t("focus"):HealthPercentage() <= i.RestorationM.HealingStreamHP and e.HealingStreamTotem:IsCastable() and not e.CloudBurstTotem:IsAvailable() and not l() then
                    if o(e.HealingStreamTotem) then
                        a = 5394
                        return "Healing Stream Totem under %"
                    end

                end

            end

            if t("focus"):IsInMeleeRange(40) and i.RestorationM.RainIgnoreCheck and UnitAffectingCombat("player") and e.HealingRain:IsCastable() and not _ and j.FightRemains(C, false) > 10 and p(i.RestorationM.DPSThreshold) <= 0 and not s:IsCasting(e.HealingRain) and not l() and p(i.RestorationM.HealingRainHP) >= i.RestorationM.HealingRainParty then
                if o(e.HealingRain) then
                    a = 73920
                    return "Healing Rain under % 1"
                end

            end

        end

        if GetNumGroupMembers() > 5 then
            if F and not s:IsCasting(e.Wellspring) then
                a = 1999
            end

            if t("focus"):IsInMeleeRange(40) and e.RecallCloudburstTotem:IsCastable() and not g and L() >= 10000 and (N) then
                if o(e.RecallCloudburstTotem) then
                    a = 201764
                    return "CloudBurst Release DBM"
                end

            end

            if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not O and g and e.CloudBurstTotem:IsCastable() and e.CloudBurstTotem:IsAvailable() then
                if o(e.CloudBurstTotem) then
                    a = 157153
                    return "CloudBurst Totem DBM"
                end

            end

            if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not l() and UnitAffectingCombat("player") and e.Wellspring:IsReady() and not I and (S) then
                if o(e.Wellspring) then
                    a = 197995
                    return "Wellspring DBM"
                end

            end

            if UnitExists("focus") and not UnitCanAttack("player", "focus") and not c("focus") and (p(i.RestorationR.DPSThreshold) > 0 or not UnitExists("target") or not UnitAffectingCombat("player")) then
                if r:IsInMeleeRange(40) and T and (e.VesperTotem:IsReady() or (z and not R and e.RecallVesperTotem:IsReady())) then
                    if o(e.VesperTotem) then
                        a = 324386
                        return "Vesper Totem"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and e.RecallCloudburstTotem:IsReady() and L() >= 10000 and not g and ((p(i.RestorationR.CloudburstReleaseHP) >= i.RestorationR.CloudburstReleaseRaid) or not UnitAffectingCombat("player") or N) then
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

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and e.HealingRain:IsReady() and not _ and not _ and not s:IsCasting(e.HealingRain) and not l() and p(i.RestorationR.HealingRainHP) >= i.RestorationR.HealingRainRaid then
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

                if t("focus"):IsInMeleeRange(40) and not l() and UnitAffectingCombat("player") and e.Wellspring:IsReady() and not I and (t("focus"):HealthPercentage() <= i.RestorationR.WellspringHP or S) then
                    if o(e.Wellspring) then
                        a = 197995
                        return "Wellspring under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not O and (t("focus"):HealthPercentage() <= i.RestorationR.HealingStreamHP or g) and e.CloudBurstTotem:IsReady() and e.CloudBurstTotem:IsAvailable() and ((e.CloudBurstTotem:Charges() >= 2 and not l()) or g) then
                    if o(e.CloudBurstTotem) then
                        a = 157153
                        return "CloudBurst Totem under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and t("focus"):HealthPercentage() <= i.RestorationR.HealingStreamHP and e.HealingStreamTotem:IsReady() and not e.CloudBurstTotem:IsAvailable() and not l() then
                    if o(e.HealingStreamTotem) then
                        a = 5394
                        return "Healing Stream Totem under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and e.EarthenWallTotem:IsReady() and not _ and p(i.RestorationR.EarthenWallTotemHP) >= i.RestorationR.EarthenWallTotemRaid and UnitAffectingCombat("player") then
                    if o(e.EarthenWallTotem) then
                        a = 198838
                        return "EarthenWallTotem under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and e.ChainHeal:IsReady() and not l() and p(i.RestorationR.ChainHealHP) >= i.RestorationR.ChainHealRaid then
                    if o(e.ChainHeal) then
                        a = 1064
                        return "Chain Heal under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and ((t("focus"):HealthPercentage() <= i.RestorationR.HealingSurgeHP2 and s:BuffStack(e.TidalWaves) >= 1) or (t("focus"):HealthPercentage() <= i.RestorationR.HealingSurgeHP)) and e.HealingSurge:IsReady() and not l() then
                    if o(e.HealingSurge) then
                        a = 8004
                        return "Healing Surge under %"
                    end

                end

                if t("focus"):IsInMeleeRange(40) and ((t("focus"):HealthPercentage() <= i.RestorationR.HealingWaveHP2 and s:BuffStack(e.TidalWaves) >= 1) or (t("focus"):HealthPercentage() <= i.RestorationR.HealingWaveHP)) and e.HealingWave:IsReady() and not l() then
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

local function z()
    local t
    if GetNumGroupMembers() > 0 and not E then
        t = A()
        if t then
            return t
        end

    end

    if GetNumGroupMembers() > 5 and not E then
        t = A()
        if t then
            return t
        end

    end

    if pe(C) < ce() and not q then
        t = U()
        if t then
            return t
        end

    end

    local i, n = nil, false
    if not q then
        if EnemiesCount10ySplash < 2 then
            i, n = oe()
        else
            i, n = ae()
        end

    end

    if i ~= nil and x(i) and w.TargetIsValid() and not c("target") and not q then
        if o(i) then
            return "Building Maelstrom with optimal Builder (AOE)"
        end

    end

    if i == nil and w.TargetIsValid() and not c("target") and not q then
        t = U()
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

local function p()
    H = HeroRotationCharDB.Toggles[6]
    T = HeroRotationCharDB.Toggles[4]
    we = HeroRotationCharDB.Toggles[5]
    Z = HeroRotationCharDB.Toggles[12]
    ye = HeroRotationCharDB.Toggles[15]
    re = HeroRotationCharDB.Toggles[60]
    ie = n.CDsON
    be = HeroRotationCharDB.Toggles[90]
    G = HeroRotationCharDB.Toggles[93]
    B = HeroRotationCharDB.Toggles[94]
    J = HeroRotationCharDB.Toggles[95]
    Q = HeroRotationCharDB.Toggles[97]
    le = HeroRotationCharDB.Toggles[160]
    se = HeroRotationCharDB.Toggles[161]
    X = HeroRotationCharDB.Toggles[91]
    V = HeroRotationCharDB.Toggles[162]
    D = HeroRotationCharDB.Toggles[163]
    K = HeroRotationCharDB.Toggles[164]
    q = HeroRotationCharDB.Toggles[165]
    E = HeroRotationCharDB.Toggles[166]
    Q = HeroRotationCharDB.Toggles[97]
    g, N, O, I, S, _, F = nil, nil, nil, nil, nil, nil, nil
    d = 0
    he = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                he = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

    M = GetInventoryItemID("player", 13)
    Y = GetInventoryItemID("player", 14)
            if not i.Commons.Enabled.TopTrinket and not i.Commons.Enabled.BottomTrinket then
        P = { M, Y }
    elseif not i.Commons.Enabled.TopTrinket and i.Commons.Enabled.BottomTrinket then
        P = { M }
    elseif not i.Commons.Enabled.BottomTrinket and i.Commons.Enabled.TopTrinket then
        P = { Y }
    end

end

local function j()
    C = s:GetEnemiesInRange(40)
        if te() and i.Commons.AoeMode == "Conservative" then
        EnemiesCount8ySplash = r:GetEnemiesInSplashRangeCount(8)
        EnemiesCount10ySplash = r:GetEnemiesInSplashRangeCount(15)
    elseif te() and i.Commons.AoeMode == "Aggresive" then
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

    if not te() then
        EnemiesCount8ySplash = 1
        EnemiesCount10ySplash = 1
    end

    if re then
        EnemiesCount10ySplash = 10
        EnemiesCount8ySplash = 10
    end

    if not BotOn then
        k = 0
        a = 0
    end

    if y ~= nil and ee and ee <= GetTime() - 10 then
        y = nil
        ne = nil
    end

    if k > 0 then
        k = 0
    end

    if a > 0 then
        a = 0
    end

    ve()
    p()
    ge()
    if n.QueuedCast() then
        a = n.QueuedCast()
        return "Custom Queue " .. m(a):ID()
    end

    if i.Commons.DBMSupport then
        g, N, O, I, S, _, F = n.RaidDamageInc()
    end

    if UnitAffectingCombat("player") and EnemiesCount10ySplash >= 1 and i.Restoration.TargetSwap == "AutoSwap" and not Z and not q then
        if not UnitExists("target") or UnitReaction("player", "target") == 8 or UnitReaction("player", "target") == 7 or UnitReaction("player", "target") == 6 or UnitReaction("player", "target") == 5 then
            k = 999
        end

    end

    if s:IsChanneling() or s:IsChanneling(e.FaeTransfusion) then
        if o(e.Pool, nil) then
            a = 99999
            return "Trinket Channel"
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
        if UnitGUID("focus") == t("party" .. (u / 100)):GUID() and u ~= 500 then
            u = 0
        end

        if UnitGUID("focus") == UnitGUID("player") and u == 500 then
            u = 0
        end

    end

    if GetNumGroupMembers() > 5 then
        if UnitGUID("focus") == t("raid" .. (u / 1000)):GUID() then
            u = 0
        end

    end

    if GetNumGroupMembers() >= 0 then
        if v <= GetTime() then
            fe()
            if (h ~= nil) and UnitGUID("focus") ~= h and v <= GetTime() then
                u = d * 100
            end

            v = GetTime() + .5
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.FrostShock:IsCastable() then
            if o(e.FrostShock, nil) then
                k = 1196840
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

        if (K and e.PurifySpirit:IsUsableP() and e.PurifySpirit:CooldownRemains(BypassRecovery) <= 0 and UnitExists("mouseover")) then
        if n.Cast(e.PurifySpirit, nil, nil, nil) then
            if UnitExists("mouseover") and t("mouseover"):IsInRange(40) and not UnitIsEnemy("mouseover", "player") then
                a = 177130
                return "queue PurifySpirit MO"
            end

        end

    elseif ((not e.PurifySpirit:IsUsableP() or e.PurifySpirit:CooldownRemains() > 0) and K) then
        HeroRotationCharDB.Toggles[164] = not HeroRotationCharDB.Toggles[164]
        n.Print("PurifySpirit Queue is now " .. (HeroRotationCharDB.Toggles[164] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (X and e.CapacitorTotem:IsUsableP() and e.CapacitorTotem:CooldownRemains(BypassRecovery) <= 0) then
        if n.Cast(e.CapacitorTotem, nil, nil, nil) then
            a = 1192058
            return "queue CapacitorTotem"
        end

    elseif ((not e.CapacitorTotem:IsUsableP() or e.CapacitorTotem:CooldownRemains(BypassRecovery) > 0) and X) then
        HeroRotationCharDB.Toggles[91] = not HeroRotationCharDB.Toggles[91]
        n.Print("Capacitor Totem Queue is now " .. (HeroRotationCharDB.Toggles[91] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (V and e.VesperTotem:IsUsableP() and (e.VesperTotem:CooldownRemains(BypassRecovery) <= 0 or m(324519):IsCastable())) then
        if n.Cast(e.VesperTotem, nil, nil, nil) then
            a = 324386
            return "queue VesperTotem"
        end

    elseif ((not e.VesperTotem:IsUsableP() or (e.VesperTotem:CooldownRemains(BypassRecovery) > 0 and not m(324519):IsCastable())) and V) then
        HeroRotationCharDB.Toggles[162] = not HeroRotationCharDB.Toggles[162]
        n.Print("Capacitor Totem Queue is now " .. (HeroRotationCharDB.Toggles[162] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (B and e.WindRushTotem:IsUsableP() and e.WindRushTotem:IsAvailable() and e.WindRushTotem:CooldownRemains(BypassRecovery) <= 0) then
        if n.Cast(e.WindRushTotem, nil, nil, nil) then
            a = 192077
            return "queue WindRushTotem"
        end

    elseif ((not e.WindRushTotem:IsUsableP() or not e.WindRushTotem:IsAvailable() or e.WindRushTotem:CooldownRemains(BypassRecovery) > 0) and B) then
        HeroRotationCharDB.Toggles[94] = not HeroRotationCharDB.Toggles[94]
        n.Print("Wind Rush Totem Queue is now " .. (HeroRotationCharDB.Toggles[94] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (J and e.Hex:IsUsableP() and e.Hex:CooldownRemains(BypassRecovery) <= 0 and UnitExists("mouseover")) then
        if n.Cast(e.Hex, nil, nil, nil) then
            if UnitExists("mouseover") and t("mouseover"):IsInRange(40) then
                k = 151514
                return "queue Hex MO"
            end

        end

    elseif ((not e.Hex:IsUsableP() or e.Hex:CooldownRemains() > 0) and J) then
        HeroRotationCharDB.Toggles[95] = not HeroRotationCharDB.Toggles[95]
        n.Print("Hex Queue is now " .. (HeroRotationCharDB.Toggles[95] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (G and e.TremorTotem:IsUsableP() and e.TremorTotem:CooldownRemains(BypassRecovery) <= 0) then
        if n.Cast(e.TremorTotem, nil, nil, nil) then
            a = 8143
            return "queue TremorTotem"
        end

    elseif ((not e.TremorTotem:IsUsableP() or e.TremorTotem:CooldownRemains(BypassRecovery) > 0) and G) then
        HeroRotationCharDB.Toggles[93] = not HeroRotationCharDB.Toggles[93]
        n.Print("Tremor Totem Queue is now " .. (HeroRotationCharDB.Toggles[93] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if le and not UnitAffectingCombat("player") and not E then
        i = A()
        if i then
            return i
        end

    end

    i = me()
    if i then
        return i
    end

    if e.CloudBurstTotem:IsCastable() and not E and e.CloudBurstTotem:IsAvailable() and not l() and UnitAffectingCombat("player") and e.CloudBurstTotem:Charges() >= 1 and (e.HealingTideTotem:TimeSinceLastCast() <= 7 or e.Ascendance:TimeSinceLastCast() <= 10 or e.SpiritLinkTotem:TimeSinceLastCast() <= 3) then
        if o(e.CloudBurstTotem) then
            a = 157153
            return "CloudBurst Totem for Burst"
        end

    end

    if (UnitAffectingCombat("player") or H) then
        if se then
            i = W()
            if i then
                return i
            end

        end

        if f > .5 then
            for t = 1, 10 do
                local i, i, i, t = UnitBuff("target", t)
                if t ~= nil and t == "Magic" then
                    if e.Purge:IsCastable() and Q and r:IsInRange(30) then
                        if o(e.Purge, nil) then
                            a = 370
                            return "Purge"
                        end

                    end

                end

            end

        end

        if w.TargetIsValid() and not E then
            i = ue()
            if i then
                return i
            end

        end

        i = z()
        if i then
            return i
        end

        if w.TargetIsValid() and c("target") and not q then
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
    if k == 0 then
        return 0
    else
        return k
    end

end

function ReturnSpellF3()
    if u == 0 then
        return 0
    else
        return u
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
                    t = de(e)
                end

            end

        end

    end

    return t
end

n.SetAPL(264, j, o)

