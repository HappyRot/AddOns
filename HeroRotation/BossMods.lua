local e, a = ...
local o = HeroLib
local e, e = HeroCache, o.Utils
local t = o.Unit
local y = t.Player
local e = t.Target
local e = o.Spell
local o = o.Item
local o = math.min
local o = print
local o = select
local o = string.lower
local o = strsplit
local o = tostring
local d = _G.DBM
local l = _G.BigWigsLoader
local m = false
local c = false
HeroRotation = a
a.BossMods = { EngagedBosses = {  } }
local o = a.BossMods.EngagedBosses
local i = false
local n = false
local s = false
local h = false
local r = false
local u = false
local w = false
if d then
    local e, a = {  }, {  }
    local n = 0
    m = true
    DBM_TIMER_PULL = _G.DBM_CORE_L.TIMER_PULL
    d:RegisterCallback("DBM_TimerStart", function(o, t, s, n, o, o, i, o, o, o, o, o, o)
        local o
        if type(n) == "string" then
            o = toNum[n:match("%d+")]
        else
            o = n
        end

        if not e[t] then
            e[t] = { text = s, start = GetTime(), duration = o }
        else
            e[t].text = s
            e[t].start = GetTime()
            e[t].duration = o
        end

        if i then
            e[t].spellid = i
            a[i] = e[t]
        end

    end)
    d:RegisterCallback("DBM_SetStage", function(t, t, t, e, t, t)
        n = e
    end)
    d:RegisterCallback("DBM_TimerStop", function(o, t)
        if e[t] then
        end

        if e[t] and e[t].spellid then
            a[e[t].spellid] = nil
        end

        e[t] = nil
    end)
    DBM_GetTimeRemaining = function(t)
        if t then
            for a, e in pairs(e) do
                if e.text:match(t) then
                    local t = e.start + e.duration
                    local e = t - GetTime()
                    if e < 0 then
                        e = 0
                    end

                    return e, t, n
                end

            end

        else
            error("Bad argument 'text' (nil value) for function DBM_GetTimeRemaining")
        end

        return 0, 0, 0
    end
    DBM_GetTimeRemainingBySpellID = function(e)
        if a[e] then
            local t = a[e].start + a[e].duration
            local e = t - GetTime()
            if e < 0 then
                e = 0
            end

            return e, t, n
        end

        return 0, 0, 0
    end
    hooksecurefunc(d, "StartCombat", function(a, e, a, t)
        if t ~= "TIMER_RECOVERY" then
            local t = e.localization.general.name
            local a = e.id
            if t then
                o[t] = e
                o[t].AddonBaseName = "DBM"
            end

            if a then
                o[a] = e
                o[a].AddonBaseName = "DBM"
            end

        end

    end)
    hooksecurefunc(d, "EndCombat", function(t, e)
        local t = e.localization.general.name or ""
        local e = e.id or ""
        o[t] = nil
        o[e] = nil
    end)
end

local f
if l and not d then
    c = true
    local e = "BigWigs_Plugins"
    if _G.IsAddOnLoaded(e) then
        BIGWIGS_TIMER_PULL = _G.BigWigsAPI:GetLocale("BigWigs: Plugins").pull
    else
        local e = setmetatable({ enUS = "Pull", deDE = "Pull", esES = "Pull", itIT = "Ingaggio", frFR = "Pull", esMS = "Llamado de jefe", koKR = "전투 예정", ptBR = "Pull", zhCN = "拉怪", ruRU = "Атака", zhTW = "開怪倒數" }, { __index = function(e)
            return e.enUS
        end })
        BIGWIGS_TIMER_PULL = e[GetLocale()]
    end

    local e, t = {  }, {  }
    local function a(i, o)
        local t
        for a = #e, 1, -1 do
            t = e[a]
                        if t.module == i and (not o or t.text == o) then
                tremove(e, a)
            elseif t.start + t.duration < GetTime() then
                tremove(e, a)
            end

        end

    end

    l.RegisterMessage(t, "BigWigs_StartBar", function(s, o, i, t, n)
        a(o, t)
        tinsert(e, { module = o, key = i, text = t, start = GetTime(), duration = n })
    end)
    l.RegisterMessage(t, "BigWigs_StopBar", function(o, t, e)
        a(t, e)
    end)
    l.RegisterMessage(t, "BigWigs_StopBars", function(t, e)
        a(e)
    end)
    l.RegisterMessage(t, "BigWigs_OnPluginDisable", function(t, e)
        a(e)
    end)
    l.RegisterMessage(t, "BigWigs_OnBossDisable", function(t, e)
        a(e)
        local t = e.displayName or ""
        local e = e.moduleName or ""
        o[t] = nil
        o[e] = nil
    end)
    l.RegisterMessage(t, "BigWigs_OnBossEngage", function(t, e, t)
        local a = e.displayName
        local t = e.moduleName
        if a then
            o[a] = e
            o[a].AddonBaseName = "BigWigs"
        end

        if t then
            o[t] = e
            o[t].AddonBaseName = "BigWigs"
        end

    end)
    f = function(a)
        local t
        if a then
            for o = 1, #e do
                t = e[o]
                if t.key == a then
                    local a = t.start + t.duration
                    local e = a - GetTime()
                    local o = t.module.stage
                    local t = t.module:GetStage()
                    if e < 0 then
                        e = 0
                    end

                    return e, a, o
                end

            end

        else
            error("Bad argument 'text' (nil value) for function BigWigs_GetTimeRemaining")
        end

        return 0, 0
    end
end

function a.BossMods:HasAnyAddon()
    return m or c
end

function a.BossMods:GetPullTimer()
    local o, i = 0, 0
    if a.BossMods:HasAnyAddon() then
        local e, n = 0, 0
        local t, a = 0, 0
        if m then
            e, n = DBM_GetTimeRemaining(DBM_TIMER_PULL)
        end

        if c then
            t, a, phase = f(BIGWIGS_TIMER_PULL)
        end

        if e > t then
            o = e
            i = n
        else
            o = t
            i = a
        end

    end

    return o
end

function a.BossMods:GetTimer(e)
    local n, i, t = 0, 0, 0
    if e and self:HasAnyAddon() then
        local t, a = 0, 0
        local o, s = 0, 0
        if m then
            if type(e) == "string" then
                t, a, phase = DBM_GetTimeRemaining(e)
            else
                t, a, phase = DBM_GetTimeRemainingBySpellID(e)
            end

        end

        if c then
            o, s, phase = f(e)
        end

        if t > o then
            n = t
            i = a
        else
            n = o
            i = s
        end

    end

    return n, i, phase
end

function a.BossMods:IsEngage(e)
    if self:HasAnyAddon() then
        local t = e and e
        for a, e in pairs(o) do
            if (not t or a:match(t)) and ((e.AddonBaseName == "DBM" and e.inCombat) or (e.AddonBaseName == "BigWigs" and e.isEngaged)) then
                return true, a
            end

        end

    end

end

function a.Sepulcher()
                                    if t("boss1"):NPCID() == 180773 then
        local t, a, o = a.BossMods:GetTimer(360412)
        if o == 1 then
            t = 100 - UnitPower("boss1", 3)
            a = (100 - t) + GetTime()
            if ((t <= 1 and t > 0)) and a ~= 0 then
                CoreShieldExpire = a + 11
            end

                                    if ((t > 5 and t < 20)) then
                if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and t < 15)) and t ~= 0 then
                    n = true
                end

            elseif (t <= 5 and t ~= 0) then
                i = true
            elseif CoreShieldExpire and GetTime() >= CoreShieldExpire and (GetTime() - 1) < CoreShieldExpire then
                s = true
            end

        end

    elseif t("boss1"):NPCID() == 181395 then
        local o, d, l = a.BossMods:GetTimer(359829)
        if ((o <= 1 and o > 0)) and d ~= 0 then
            DustFlailExpire = d + 8
        end

        if t("boss1"):IsCasting(e(359829)) then
            DustFlailExpire = GetTime() + t("boss1"):CastRemains()
        end

                if o <= 10 and o > e(197995):CastTime() + .5 then
            h = true
        elseif DustFlailExpire and GetTime() + e(197995):CastTime() >= DustFlailExpire and (GetTime() + e(197995):CastTime() - 3) < DustFlailExpire then
            r = true
        end

        local a, o, h = a.BossMods:GetTimer(359770)
        if ((a <= 1 and a > 0)) and o ~= 0 then
            RaveningBurrowExpire = o + 8
        end

        if t("boss1"):IsCasting(e(359770)) then
            RaveningBurrowExpire = GetTime() + t("boss1"):CastRemains() + 1.5
        end

                        if a > 3 and a < 18 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                n = true
            end

        elseif a <= 3 and a ~= 0 then
            i = true
        elseif RaveningBurrowExpire and GetTime() >= RaveningBurrowExpire and (GetTime() - 1) < RaveningBurrowExpire then
            s = true
        end

    elseif t("boss1"):NPCID() == 183501 then
        local d, o, o = a.BossMods:GetTimer(362803)
        local a, o, l = a.BossMods:GetTimer(362801)
        if ((a <= 1 and a > 0)) and o ~= 0 then
            RelocationExpire = o + 6
        end

        for a = 1, GetNumGroupMembers() do
            if (UnitGroupRolesAssigned("raid" .. a) == "TANK") and t("raid" .. a):DebuffUp(e(362801)) then
                RelocationExpire = GetTime() + t("raid" .. a):DebuffRemains(e(362801))
            end

        end

                        if a > 9 and a < 24 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                n = true
            end

        elseif a <= 9 and a ~= 0 then
            i = true
        elseif RelocationExpire and GetTime() >= RelocationExpire and (GetTime() - 1) < RelocationExpire then
            s = true
        end

                if d + 6 <= 20 and d > e(197995):CastTime() + .5 then
            h = true
        elseif RelocationExpire and (GetTime() >= RelocationExpire or (GetTime + e(197995):CastTime() < RelocationExpire and GetTime() + e(197995):CastTime() > RelocationExpire + .5)) and (GetTime() + e(197995):CastTime() - 5) < RelocationExpire then
            r = true
        end

    elseif t("boss1"):NPCID() == 181224 then
        for a = 1, GetNumGroupMembers() do
                        if (UnitGroupRolesAssigned("raid" .. a) == "TANK") and t("raid" .. a):DebuffRemains(e(361966)) > e(197995):CastTime() and UnitThreatSituation("raid" .. a, "boss1") ~= nil and UnitThreatSituation("raid" .. a, "boss1") < 2 then
                h = true
            elseif (UnitGroupRolesAssigned("raid" .. a) == "TANK") and t("raid" .. a):DebuffRemains(e(361966)) < e(197995):CastTime() and UnitThreatSituation("raid" .. a, "boss1") ~= nil and UnitThreatSituation("raid" .. a, "boss1") < 2 then
                r = true
            end

        end

        local a, o, h = a.BossMods:GetTimer(361643)
        if ((a <= 1 and a > 0)) and not t("boss1"):IsCasting(e(361630)) and not t("boss1"):IsCasting(e(361643)) and o ~= 0 then
            DominionExpire = o + 5
        end

        if t("boss1"):IsCasting(e(361643)) then
            DominionExpire = t("boss1"):CastRemains() + 6.5
        end

        if t("boss1"):IsCasting(e(361630)) then
            DominionExpire = GetTime() + t("boss1"):CastRemains() + 10
        end

                        if a > 8 and a < 23 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                n = true
            end

        elseif a <= 8 and a ~= 0 then
            i = true
            if DominionExpire then
            end

        elseif DominionExpire and GetTime() >= DominionExpire and (GetTime() - 1) < DominionExpire then
            s = true
        end

    elseif t("boss1"):NPCID() == 182169 then
        local o, d, l = a.BossMods:GetTimer(363088)
        if ((o <= 1 and o > 0)) and d ~= 0 then
            CosmicShiftExpire = d + 3
        end

        if t("boss1"):IsCasting(e(363088)) then
            CosmicShiftExpire = GetTime() + t("boss1"):CastRemains()
        end

                if o <= 20 and o > e(197995):CastTime() + .5 then
            h = true
        elseif CosmicShiftExpire and GetTime() + e(197995):CastTime() >= CosmicShiftExpire and (GetTime() + e(197995):CastTime() - 1) < CosmicShiftExpire then
            w = true
            r = true
        end

        local a, o, h = a.BossMods:GetTimer(363130)
        if ((a <= 1 and a > 0)) and o ~= 0 then
            SynthesizeExpire = o + 20
        end

        if t("boss1"):IsCasting(e(363130)) then
            SynthesizeExpire = GetTime() + t("boss1"):CastRemains() + 20
        end

        if t("boss1"):IsChanneling(e(363130)) then
            SynthesizeExpire = GetTime() + t("boss1"):ChannelRemains()
        end

                        if a > 10 and a < 25 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                n = true
            end

        elseif t("boss1"):IsChanneling(e(363130)) and t("boss1"):ChannelRemains() > 10 and y:DebuffUp(e(363356)) and a ~= 0 then
            i = true
        elseif SynthesizeExpire and GetTime() >= SynthesizeExpire and (GetTime() - 1) < SynthesizeExpire then
            s = true
        end

    elseif t("boss1"):NPCID() == 180906 then
        local t, t, e = a.BossMods:GetTimer(359236)
        if e == 2 then
            u = true
        end

    elseif t("boss1"):NPCID() == 181954 then
        local o, d, l = a.BossMods:GetTimer(361815)
        if ((o <= 1 and o > 0)) and d ~= 0 then
            HopeBreakerExpire = d + 2
        end

        if t("boss1"):IsCasting(e(361630)) then
            HopeBreakerExpire = GetTime() + t("boss1"):CastRemains()
        end

                        if o > 13 and o < 28 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and o < 15)) and o ~= 0 then
                n = true
            end

        elseif o <= 13 and o ~= 0 then
            i = true
        elseif HopeBreakerExpire and GetTime() >= HopeBreakerExpire and (GetTime() - 1) < HopeBreakerExpire then
            s = true
        end

                if o <= 20 and o > e(197995):CastTime() + .5 then
            h = true
        elseif HopeBreakerExpire and GetTime() + e(197995):CastTime() >= HopeBreakerExpire and (GetTime() + e(197995):CastTime() - 1) < HopeBreakerExpire then
            r = true
        end

        local a, o, d = a.BossMods:GetTimer(365805)
        if ((a <= 1 and a > 0)) and o ~= 0 then
            EmpoweredHopeBreakerExpire = o + 2
        end

        if t("boss1"):IsCasting(e(365805)) then
            EmpoweredHopeBreakerExpire = GetTime() + t("boss1"):CastRemains()
        end

                        if a > 13 and a < 28 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                n = true
            end

        elseif a <= 13 and a ~= 0 then
            i = true
        elseif EmpoweredHopeBreakerExpire and GetTime() >= EmpoweredHopeBreakerExpire and (GetTime() - 3) < EmpoweredHopeBreakerExpire then
            s = true
        end

                if a <= 20 and a > e(197995):CastTime() + .5 then
            h = true
        elseif EmpoweredHopeBreakerExpire and (a > 20 or a == 0) and GetTime() + e(197995):CastTime() >= EmpoweredHopeBreakerExpire and (GetTime() + e(197995):CastTime() - 5) < EmpoweredHopeBreakerExpire then
            r = true
        end

    elseif t("boss1"):NPCID() == 181398 or t("boss1"):NPCID() == 181399 then
        local o, r, h = a.BossMods:GetTimer(360300)
        local a, h, d = a.BossMods:GetTimer(360304)
                if ((o <= 1 and o > 0)) and r ~= 0 then
            SwarmExpire = r + 20
        elseif ((a <= 1 and a > 0)) and h ~= 0 then
            SwarmExpire = h + 20
        end

        for e = 1, 2 do
            if t("boss" .. e):IsCasting(360300) or t("boss" .. e):IsCasting(360304) then
                SwarmExpire = GetTime() + t("boss" .. e):CastRemains() + 20
            end

        end

                        if SwarmExpire and GetTime() < SwarmExpire - 20 and GetTime() + 15 >= SwarmExpire - 20 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and o < 15)) and o ~= 0 then
                n = true
            end

        elseif SwarmExpire and GetTime() >= SwarmExpire - 20 and o ~= 0 then
            i = true
        elseif SwarmExpire and (GetTime() - 1) < SwarmExpire - 2 then
            s = true
        end

    elseif t("boss1"):NPCID() == 180990 then
        local a, o, h = a.BossMods:GetTimer(360281)
        if h == 3 then
            if ((a <= 1 and a > 0)) and o ~= 0 then
                RuneExpire = o + 8
            end

            local o = nil
            for a = 1, GetNumGroupMembers() do
                if t("raid" .. a):DebuffUp(e(360281)) then
                    if o == nil or o < t("raid" .. a):DebuffRemains(e(360281)) then
                        o = t("raid" .. a):DebuffRemains(360281)
                        RuneExpire = GetTime() + o
                    end

                end

            end

                                    if a > 5 and a < 20 then
                if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                    n = true
                end

            elseif a <= 5 and a ~= 0 then
                i = true
                if RuneExpire then
                end

            elseif RuneExpire and GetTime() >= RuneExpire and (GetTime() - 1) < RuneExpire and S.RecallCloudburstTotem:IsReady() then
                s = true
            end

        end

    end

    return i, s, n, h, r, u, w
end

function a.SpecSelection()
    local a, t = IsAddOnLoaded("HeroRotation_Shaman")
    if a == true and t == true then
        local e = e.Shaman.Restoration
        i = false
        n = false
        s = false
        h = false
        r = false
        u = false
        w = false
    end

end

function a.RaidDamageInc()
    local e = false
    local t = nil
    local t = nil
    local t = nil
    local t = nil
    local t = nil
    local t = nil
    local t = nil
    local t = nil
    local t = nil
    local t = nil
    local t = nil
    a.SpecSelection()
    local o, o, o, o, o, o, o, t, o, o = GetInstanceInfo()
    if t == 2481 then
        i, s, n, h, r, u, e = a.Sepulcher()
        return i, s, n, h, r, u, e
    end

end


