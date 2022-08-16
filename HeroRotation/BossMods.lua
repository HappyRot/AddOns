local e, a = ...
local o = HeroLib
local e, e = HeroCache, o.Utils
local t = o.Unit
local m = t.Player
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
local o = _G.BigWigsLoader
local u = false
HeroRotation = a
a.BossMods = { EngagedBosses = {  } }
local r = a.BossMods.EngagedBosses
local n = false
local i = false
local o = false
local h = false
local s = false
local l = false
local c = false
if d then
    local e, a = {  }, {  }
    local i = 0
    u = true
    DBM_TIMER_PULL = _G.DBM_CORE_L.TIMER_PULL
    d:RegisterCallback("DBM_TimerStart", function(o, t, s, i, o, o, n, o, o, o, o, o, o)
        local o
        if type(i) == "string" then
            o = toNum[i:match("%d+")]
        else
            o = i
        end

        if not e[t] then
            e[t] = { text = s, start = GetTime(), duration = o }
        else
            e[t].text = s
            e[t].start = GetTime()
            e[t].duration = o
        end

        if n then
            e[t].spellid = n
            a[n] = e[t]
        end

    end)
    d:RegisterCallback("DBM_SetStage", function(t, t, t, e, t, t)
        i = e
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

                    return e, t, i
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

            return e, t, i
        end

        return 0, 0, 0
    end
    hooksecurefunc(d, "StartCombat", function(a, e, a, t)
        if t ~= "TIMER_RECOVERY" then
            local t = e.localization.general.name
            local a = e.id
            if t then
                r[t] = e
                r[t].AddonBaseName = "DBM"
            end

            if a then
                r[a] = e
                r[a].AddonBaseName = "DBM"
            end

        end

    end)
    hooksecurefunc(d, "EndCombat", function(t, e)
        local t = e.localization.general.name or ""
        local e = e.id or ""
        r[t] = nil
        r[e] = nil
    end)
end

function a.BossMods:HasAnyAddon()
    return u or HasBigWigs
end

function a.BossMods:GetPullTimer()
    local e, n = 0, 0
    if self:HasAnyAddon() then
        local t, i = 0, 0
        local a, o = 0, 0
        if u then
            t, i = DBM_GetTimeRemaining(DBM_TIMER_PULL)
        end

        if self.HasBigWigs then
            a, o = BigWigs_GetTimeRemaining(BIGWIGS_TIMER_PULL)
        end

        if t > a then
            e = t
            n = i
        else
            e = a
            n = o
        end

    end

    return e
end

function a.BossMods:GetTimer(e)
    local i, n, t = 0, 0, 0
    if e and self:HasAnyAddon() then
        local t, o = 0, 0
        local a, s = 0, 0
        if u then
            if type(e) == "string" then
                t, o, phase = DBM_GetTimeRemaining(e)
            else
                t, o, phase = DBM_GetTimeRemainingBySpellID(e)
            end

        end

        if self.HasBigWigs then
            a, s = BigWigs_GetTimeRemaining(e)
        end

        if t > a then
            i = t
            n = o
        else
            i = a
            n = s
        end

    end

    return i, n, phase
end

function a.BossMods:IsEngage(e)
    if self:HasAnyAddon() then
        local t = e and e
        for a, e in pairs(r) do
            if (not t or a:match(t)) and ((e.AddonBaseName == "DBM" and e.inCombat) or (e.AddonBaseName == "BigWigs" and e.isEngaged)) then
                return true, a
            end

        end

    end

end

function a.Sepulcher()
                                    if t("boss1"):NPCID() == 180773 then
        local t, a, s = a.BossMods:GetTimer(360412)
        if s == 1 then
            t = 100 - UnitPower("boss1", 3)
            a = (100 - t) + GetTime()
            if ((t <= 1 and t > 0)) and a ~= 0 then
                CoreShieldExpire = a + 11
            end

                                    if ((t > 5 and t < 20)) then
                if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and t < 15)) and t ~= 0 then
                    i = true
                end

            elseif (t <= 5 and t ~= 0) then
                n = true
            elseif CoreShieldExpire and GetTime() >= CoreShieldExpire and (GetTime() - 1) < CoreShieldExpire then
                o = true
            end

        end

    elseif t("boss1"):NPCID() == 181395 then
        local r, d, l = a.BossMods:GetTimer(359829)
        if ((r <= 1 and r > 0)) and d ~= 0 then
            DustFlailExpire = d + 8
        end

        if t("boss1"):IsCasting(e(359829)) then
            DustFlailExpire = GetTime() + t("boss1"):CastRemains()
        end

                if r <= 10 and r > e(197995):CastTime() + .5 then
            h = true
        elseif DustFlailExpire and GetTime() + e(197995):CastTime() >= DustFlailExpire and (GetTime() + e(197995):CastTime() - 3) < DustFlailExpire then
            s = true
        end

        local a, s, h = a.BossMods:GetTimer(359770)
        if ((a <= 1 and a > 0)) and s ~= 0 then
            RaveningBurrowExpire = s + 8
        end

        if t("boss1"):IsCasting(e(359770)) then
            RaveningBurrowExpire = GetTime() + t("boss1"):CastRemains() + 1.5
        end

                        if a > 3 and a < 18 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                i = true
            end

        elseif a <= 3 and a ~= 0 then
            n = true
        elseif RaveningBurrowExpire and GetTime() >= RaveningBurrowExpire and (GetTime() - 1) < RaveningBurrowExpire then
            o = true
        end

    elseif t("boss1"):NPCID() == 183501 then
        local r, d, d = a.BossMods:GetTimer(362803)
        local a, d, l = a.BossMods:GetTimer(362801)
        if ((a <= 1 and a > 0)) and d ~= 0 then
            RelocationExpire = d + 6
        end

        for a = 1, GetNumGroupMembers() do
            if (UnitGroupRolesAssigned("raid" .. a) == "TANK") and t("raid" .. a):DebuffUp(e(362801)) then
                RelocationExpire = GetTime() + t("raid" .. a):DebuffRemains(e(362801))
            end

        end

                        if a > 9 and a < 24 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                i = true
            end

        elseif a <= 9 and a ~= 0 then
            n = true
        elseif RelocationExpire and GetTime() >= RelocationExpire and (GetTime() - 1) < RelocationExpire then
            o = true
        end

                if r + 6 <= 20 and r > e(197995):CastTime() + .5 then
            h = true
        elseif RelocationExpire and (GetTime() >= RelocationExpire or (GetTime + e(197995):CastTime() < RelocationExpire and GetTime + e(197995):CastTime() > RelocationExpire + .5)) and (GetTime() + e(197995):CastTime() - 5) < RelocationExpire then
            s = true
        end

    elseif t("boss1"):NPCID() == 181224 then
        for a = 1, GetNumGroupMembers() do
                        if (UnitGroupRolesAssigned("raid" .. a) == "TANK") and t("raid" .. a):DebuffRemains(e(361966)) > e(197995):CastTime() and UnitThreatSituation("raid" .. a, "boss1") ~= nil and UnitThreatSituation("raid" .. a, "boss1") < 2 then
                h = true
            elseif (UnitGroupRolesAssigned("raid" .. a) == "TANK") and t("raid" .. a):DebuffRemains(e(361966)) < e(197995):CastTime() and UnitThreatSituation("raid" .. a, "boss1") ~= nil and UnitThreatSituation("raid" .. a, "boss1") < 2 then
                s = true
            end

        end

        local a, s, h = a.BossMods:GetTimer(361643)
        if ((a <= 1 and a > 0)) and not t("boss1"):IsCasting(e(361630)) and not t("boss1"):IsCasting(e(361643)) and s ~= 0 then
            DominionExpire = s + 5
        end

        if t("boss1"):IsCasting(e(361643)) then
            DominionExpire = t("boss1"):CastRemains() + 6.5
        end

        if t("boss1"):IsCasting(e(361630)) then
            DominionExpire = GetTime() + t("boss1"):CastRemains() + 10
        end

                        if a > 8 and a < 23 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                i = true
            end

        elseif a <= 8 and a ~= 0 then
            n = true
            if DominionExpire then
            end

        elseif DominionExpire and GetTime() >= DominionExpire and (GetTime() - 1) < DominionExpire then
            o = true
        end

    elseif t("boss1"):NPCID() == 182169 then
        local r, d, l = a.BossMods:GetTimer(363088)
        if ((r <= 1 and r > 0)) and d ~= 0 then
            CosmicShiftExpire = d + 3
        end

        if t("boss1"):IsCasting(e(363088)) then
            CosmicShiftExpire = GetTime() + t("boss1"):CastRemains()
        end

                if r <= 20 and r > e(197995):CastTime() + .5 then
            h = true
        elseif CosmicShiftExpire and GetTime() + e(197995):CastTime() >= CosmicShiftExpire and (GetTime() + e(197995):CastTime() - 1) < CosmicShiftExpire then
            c = true
            s = true
        end

        local a, s, h = a.BossMods:GetTimer(363130)
        if ((a <= 1 and a > 0)) and s ~= 0 then
            SynthesizeExpire = s + 20
        end

        if t("boss1"):IsCasting(e(363130)) then
            SynthesizeExpire = GetTime() + t("boss1"):CastRemains() + 20
        end

        if t("boss1"):IsChanneling(e(363130)) then
            SynthesizeExpire = GetTime() + t("boss1"):ChannelRemains()
        end

                        if a > 10 and a < 25 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                i = true
            end

        elseif t("boss1"):IsChanneling(e(363130)) and t("boss1"):ChannelRemains() > 10 and m:DebuffUp(e(363356)) and a ~= 0 then
            n = true
        elseif SynthesizeExpire and GetTime() >= SynthesizeExpire and (GetTime() - 1) < SynthesizeExpire then
            o = true
        end

    elseif t("boss1"):NPCID() == 180906 then
        local t, t, e = a.BossMods:GetTimer(359236)
        if e == 2 then
            l = true
        end

    elseif t("boss1"):NPCID() == 181954 then
        local r, d, l = a.BossMods:GetTimer(361815)
        if ((r <= 1 and r > 0)) and d ~= 0 then
            HopeBreakerExpire = d + 2
        end

        if t("boss1"):IsCasting(e(361630)) then
            HopeBreakerExpire = GetTime() + t("boss1"):CastRemains()
        end

                        if r > 13 and r < 28 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and r < 15)) and r ~= 0 then
                i = true
            end

        elseif r <= 13 and r ~= 0 then
            n = true
        elseif HopeBreakerExpire and GetTime() >= HopeBreakerExpire and (GetTime() - 1) < HopeBreakerExpire then
            o = true
        end

                if r <= 20 and r > e(197995):CastTime() + .5 then
            h = true
        elseif HopeBreakerExpire and GetTime() + e(197995):CastTime() >= HopeBreakerExpire and (GetTime() + e(197995):CastTime() - 1) < HopeBreakerExpire then
            s = true
        end

        local a, r, d = a.BossMods:GetTimer(365805)
        if ((a <= 1 and a > 0)) and r ~= 0 then
            EmpoweredHopeBreakerExpire = r + 2
        end

        if t("boss1"):IsCasting(e(365805)) then
            EmpoweredHopeBreakerExpire = GetTime() + t("boss1"):CastRemains()
        end

                        if a > 13 and a < 28 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                i = true
            end

        elseif a <= 13 and a ~= 0 then
            n = true
        elseif EmpoweredHopeBreakerExpire and GetTime() >= EmpoweredHopeBreakerExpire and (GetTime() - 3) < EmpoweredHopeBreakerExpire then
            o = true
        end

                if a <= 20 and a > e(197995):CastTime() + .5 then
            h = true
        elseif EmpoweredHopeBreakerExpire and (a > 20 or a == 0) and GetTime() + e(197995):CastTime() >= EmpoweredHopeBreakerExpire and (GetTime() + e(197995):CastTime() - 5) < EmpoweredHopeBreakerExpire then
            s = true
        end

    elseif t("boss1"):NPCID() == 181398 or t("boss1"):NPCID() == 181399 then
        local s, h, r = a.BossMods:GetTimer(360300)
        local a, r, d = a.BossMods:GetTimer(360304)
                if ((s <= 1 and s > 0)) and h ~= 0 then
            SwarmExpire = h + 20
        elseif ((a <= 1 and a > 0)) and r ~= 0 then
            SwarmExpire = r + 20
        end

        for e = 1, 2 do
            if t("boss" .. e):IsCasting(360300) or t("boss" .. e):IsCasting(360304) then
                SwarmExpire = GetTime() + t("boss" .. e):CastRemains() + 20
            end

        end

                        if SwarmExpire and GetTime() < SwarmExpire - 20 and GetTime() + 15 >= SwarmExpire - 20 then
            if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and s < 15)) and s ~= 0 then
                i = true
            end

        elseif SwarmExpire and GetTime() >= SwarmExpire - 20 and s ~= 0 then
            n = true
        elseif SwarmExpire and (GetTime() - 1) < SwarmExpire - 2 then
            o = true
        end

    elseif t("boss1"):NPCID() == 180990 then
        local a, s, h = a.BossMods:GetTimer(360281)
        if h == 3 then
            if ((a <= 1 and a > 0)) and s ~= 0 then
                RuneExpire = s + 8
            end

            local s = nil
            for a = 1, GetNumGroupMembers() do
                if t("raid" .. a):DebuffUp(e(360281)) then
                    if s == nil or s < t("raid" .. a):DebuffRemains(e(360281)) then
                        s = t("raid" .. a):DebuffRemains(360281)
                        RuneExpire = GetTime() + s
                    end

                end

            end

                                    if a > 5 and a < 20 then
                if ((e(157153):Charges() < 2) or (e(157153):Charges() == 2 and a < 15)) and a ~= 0 then
                    i = true
                end

            elseif a <= 5 and a ~= 0 then
                n = true
                if RuneExpire then
                end

            elseif RuneExpire and GetTime() >= RuneExpire and (GetTime() - 1) < RuneExpire and S.RecallCloudburstTotem:IsReady() then
                o = true
            end

        end

    end

    return n, o, i, h, s, l, c
end

function a.SpecSelection()
    local a, t = IsAddOnLoaded("HeroRotation_Shaman")
    if a == true and t == true then
        local e = e.Shaman.Restoration
        n = false
        i = false
        o = false
        h = false
        s = false
        l = false
        c = false
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
    local r, r, r, r, r, r, r, t, r, r = GetInstanceInfo()
    if t == 2481 then
        n, o, i, h, s, l, e = a.Sepulcher()
        return n, o, i, h, s, l, e
    end

end


