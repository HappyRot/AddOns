local e, e = ...
local e = HeroDBC.DBC
local p = HeroLib
local e = HeroCache
local m = p.Unit
local t = m.Player
local o = m.Target
local e = m.Pet
local b = p.Spell
local a = p.Item
local d = HeroRotation
local Q = d.AoEON
local u = d.CDsON
local s = d.Cast
local e = d.CastSuggested
local N = HeroRotationCharDB.Toggles[4]
local E = HeroRotationCharDB.Toggles[5]
local F = HeroRotationCharDB.Toggles[6]
local G = not HeroRotationCharDB.Toggles[15]
local k = HeroRotationCharDB.Toggles[12]
local J = HeroRotationCharDB.Toggles[60]
local K = HeroRotationCharDB.Toggles[61]
local V = HeroRotationCharDB.Toggles[62]
local I = false
local f = false
local S = false
local P = false
local B = false
local h = 0
local e = math.min
local e = b.Priest.Shadow
local n = a.Priest.Shadow
local de = { n.ArchitectsIngenuityCore:ID(), n.EmpyrealOrdinance:ID(), n.InscrutableQuantumDevice:ID(), n.MacabreSheetMusic:ID(), n.ShadowedOrbofTorment:ID(), n.SinfulGladiatorsBadgeofFerocity:ID(), n.SoullettingRuby:ID(), n.TheFirstSigil:ID(), n.ScarsofFraternalStrife:ID() }
local i = t:GetEquipment()
local r = a(0)
local l = a(0)
local w, c = GetInventoryItemID("player", 13)
local y, te = GetInventoryItemID("player", 14)
if i[13] then
    r = a(i[13])
end

if i[14] then
    l = a(i[14])
end

local ue
local me, fe, R, H
local C, l
local we
local ce
local r = 0
local a = 0
local i = 0
local i
local v
local _ = d.Commons.Everyone
local i = { General = d.GUISettings.General, Commons = d.GUISettings.APL.Priest.Commons, Shadow = d.GUISettings.APL.Priest.Shadow }
local c = 0
local c = 0
local D = 0
local L = 0
local le = 0
local A = false
local Y = false
local T = 1
local Z = false
local j = false
local z = false
local M = false
local g = 0
local W = false
local q = 2
local x = false
local ee = 0
local ae = t:HasLegendaryEquipped(202)
local U = t:HasLegendaryEquipped(161)
local X = t:HasLegendaryEquipped(158)
local O = t:HasLegendaryEquipped(159)
local c = b(200174)
p:RegisterForEvent(function()
    A = false
    Y = false
    T = 1
    Z = false
    j = false
    z = false
    M = false
    g = 0
    W = false
    q = 2
    x = false
    ee = 0
end, "PLAYER_REGEN_ENABLED")
local j = t:CovenantID()
p:RegisterForEvent(function()
    j = t:CovenantID()
end, "COVENANT_CHOSEN")
p:RegisterForEvent(function()
    ae = t:HasLegendaryEquipped(202)
    U = t:HasLegendaryEquipped(161)
    X = t:HasLegendaryEquipped(158)
    O = t:HasLegendaryEquipped(159)
end, "PLAYER_EQUIPMENT_CHANGED")
p:RegisterForEvent(function()
    e.ShadowCrash:RegisterInFlight()
end, "LEARNED_SPELL_IN_TAB")
e.ShadowCrash:RegisterInFlight()
local function X(e)
    if e then
        return 1
    else
        return 0
    end

end

local function q(e)
    return e ~= 0
end

local function q(t, a)
    if a then
        return (t:DebuffUp(e.ShadowWordPainDebuff) and (t:DebuffUp(e.VampiricTouchDebuff) or t:TimeToDie() < 18 or t:IsDummy()) and t:DebuffUp(e.DevouringPlagueDebuff))
    else
        return (t:DebuffUp(e.ShadowWordPainDebuff) and (t:DebuffUp(e.VampiricTouchDebuff) or t:TimeToDie() < 18 or t:IsDummy()))
    end

end

local function pe(a)
    local t = 0
    if a ~= nil then
        for o in pairs(a) do
            local a = a[o]
            if a:DebuffDown(e.ShadowWordPainDebuff) then
                t = t + 1
            end

        end

    end

    return t
end

local function ye(t)
    local a = 0
    if t ~= nil then
        for o in pairs(t) do
            local t = t[o]
            if t:DebuffRefreshable(e.ShadowWordPainDebuff) then
                a = a + 1
            end

        end

    end

    return a
end

local function re(a)
    local t = 0
    if a ~= nil then
        for o in pairs(a) do
            local a = a[o]
            if a:DebuffDown(e.VampiricTouch) and (a:TimeToDie() > 18 or a:IsDummy()) then
                t = t + 1
            end

        end

    end

    return t
end

local function ae(t)
                if (((t:DebuffRefreshable(e.VampiricTouchDebuff) and (t:TimeToDie() > 18 or t:IsDummy())) or t:DebuffRefreshable(e.ShadowWordPainDebuff)) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == m("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        r = 1136149
        return true
    elseif (((t:DebuffRefreshable(e.VampiricTouchDebuff) and (t:TimeToDie() > 18 or t:IsDummy())) or t:DebuffRefreshable(e.ShadowWordPainDebuff)) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not k) then
        r = 999
                if r == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif r > 0 and endtime ~= nil and GetTime() > endtime then
            r = 0
        end

        return true
    elseif (((t:DebuffRefreshable(e.VampiricTouchDebuff) and (t:TimeToDie() > 18 or t:IsDummy())) or t:DebuffRefreshable(e.ShadowWordPainDebuff)) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == o:GUID()) then
        a = 136149
        return true
    elseif ((t:DebuffRefreshable(e.VampiricTouchDebuff) and (t:TimeToDie() > 18 or t:IsDummy())) or t:DebuffRefreshable(e.ShadowWordPainDebuff)) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) then
        return true
    end

end

local function oe(e)
                if (((e:HealthPercentage() < 20 and l < 4) or (c:TimeSinceLastCast() <= 15 and O and l <= 7)) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326) and e:GUID() == m("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        r = 1136149
        return true
    elseif (((e:HealthPercentage() < 20 and l < 4) or (c:TimeSinceLastCast() <= 15 and O and l <= 7)) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and e:GUID() ~= o:GUID() and not k) then
        r = 999
                if r == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif r > 0 and endtime ~= nil and GetTime() > endtime then
            r = 0
        end

        return true
    elseif (((e:HealthPercentage() < 20 and l < 4) or (c:TimeSinceLastCast() <= 15 and O)) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326) and e:GUID() == o:GUID()) then
        a = 136149
        return true
    elseif (((e:HealthPercentage() < 20 and l < 4) or (c:TimeSinceLastCast() <= 15 and O))) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326) then
        return true
    end

end

local function oe(n)
                if (((n:TimeToDie() < 20 or n:IsDummy()) and t:BuffDown(e.VoidformBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == m("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        r = 1319952
        return true
    elseif (((n:TimeToDie() < 20 or n:IsDummy()) and t:BuffDown(e.VoidformBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and n:GUID() ~= o:GUID() and not k) then
        r = 999
                if r == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif r > 0 and endtime ~= nil and GetTime() > endtime then
            r = 0
        end

        return true
    elseif (((n:TimeToDie() < 20 or n:IsDummy()) and t:BuffDown(e.VoidformBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == o:GUID()) then
        a = 319952
        return true
    elseif ((n:TimeToDie() < 20 or n:IsDummy()) and t:BuffDown(e.VoidformBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) then
        return true
    end

end

local function oe(e)
                if ((q(e, false) and (e:TimeToDie() >= 18 or e:IsDummy())) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326) and e:GUID() == m("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        r = 1263165
        return true
    elseif ((q(e, false) and (e:TimeToDie() >= 18 or e:IsDummy())) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and e:GUID() ~= o:GUID() and not k) then
        r = 999
                if r == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif r > 0 and endtime ~= nil and GetTime() > endtime then
            r = 0
        end

        return true
    elseif ((q(e, false) and (e:TimeToDie() >= 18 or e:IsDummy())) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326) and e:GUID() == o:GUID()) then
        a = 263165
        return true
    elseif (q(e, false) and (e:TimeToDie() >= 18 or e:IsDummy())) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326) then
        return true
    end

end

local function ne(t)
                if ((((t:DebuffRefreshable(e.VampiricTouchDebuff) and (t:TimeToDie() > 18 or t:IsDummy() or t:NPCID() == 153285) and (t:DebuffUp(e.VampiricTouchDebuff) or not g) and z > 0) or (e.Misery:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff))) and (e.ShadowCrash:CooldownRemains() >= t:DebuffRemains(e.VampiricTouchDebuff) or t:DebuffDown(e.VampiricTouchDebuff)) and e.ShadowCrash:TimeSinceLastCast() > 1) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == m("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        r = 134914
        return true
    elseif ((((t:DebuffRefreshable(e.VampiricTouchDebuff) and (t:TimeToDie() > 18 or t:IsDummy() or t:NPCID() == 153285) and (t:DebuffUp(e.VampiricTouchDebuff) or not g) and z > 0) or (e.Misery:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff))) and (e.ShadowCrash:CooldownRemains() >= t:DebuffRemains(e.VampiricTouchDebuff) or t:DebuffDown(e.VampiricTouchDebuff)) and e.ShadowCrash:TimeSinceLastCast() > 1) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not k) then
        r = 999
                if r == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif r > 0 and endtime ~= nil and GetTime() > endtime then
            r = 0
        end

        return true
    elseif ((((t:DebuffRefreshable(e.VampiricTouchDebuff) and (t:TimeToDie() > 18 or t:IsDummy() or t:NPCID() == 153285) and (t:DebuffUp(e.VampiricTouchDebuff) or not g) and z > 0) or (e.Misery:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff))) and (e.ShadowCrash:CooldownRemains() >= t:DebuffRemains(e.VampiricTouchDebuff) or t:DebuffDown(e.VampiricTouchDebuff)) and e.ShadowCrash:TimeSinceLastCast() > 1) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == o:GUID()) then
        a = 34914
        return true
    elseif (((t:DebuffRefreshable(e.VampiricTouchDebuff) and (t:TimeToDie() > 18 or t:IsDummy() or t:NPCID() == 153285) and (t:DebuffUp(e.VampiricTouchDebuff) or not g) and z > 0) or (e.Misery:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff))) and (e.ShadowCrash:CooldownRemains() >= t:DebuffRemains(e.VampiricTouchDebuff) or t:DebuffDown(e.VampiricTouchDebuff)) and e.ShadowCrash:TimeSinceLastCast() > 1) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) then
        return true
    end

end

local function ie(t)
                if ((t:DebuffRefreshable(e.ShadowWordPainDebuff) and (t:TimeToDie() >= 18 or t:IsDummy()) and not e.Misery:IsAvailable()) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == m("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        r = 1589
        return true
    elseif ((t:DebuffRefreshable(e.ShadowWordPainDebuff) and (t:TimeToDie() >= 18 or t:IsDummy()) and not e.Misery:IsAvailable()) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not k) then
        r = 999
                if r == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif r > 0 and endtime ~= nil and GetTime() > endtime then
            r = 0
        end

        return true
    elseif ((t:DebuffRefreshable(e.ShadowWordPainDebuff) and (t:TimeToDie() >= 18 or t:IsDummy()) and not e.Misery:IsAvailable()) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == o:GUID()) then
        a = 589
        return true
    elseif (t:DebuffRefreshable(e.ShadowWordPainDebuff) and (t:TimeToDie() >= 18 or t:IsDummy()) and not e.Misery:IsAvailable()) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) then
        return true
    end

end

local function se(t)
                if ((e.SearingNightmare:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff) and l > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == m("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        r = 148045
        return true
    elseif ((e.SearingNightmare:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff) and l > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not k) then
        r = 999
                if r == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif r > 0 and endtime ~= nil and GetTime() > endtime then
            r = 0
        end

        return true
    elseif ((e.SearingNightmare:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff) and l > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == o:GUID()) then
        a = 48045
        return true
    elseif (e.SearingNightmare:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff) and l > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) then
        return true
    end

end

local function se(n)
                if ((t:Insanity() < 90 and ((q(n, true) and ((not e.VoidEruption:CooldownUp() or not f) or not e.HungeringVoid:IsAvailable())) or t:BuffUp(e.VoidformBuff)) and (not e.HungeringVoid:IsAvailable() or n:DebuffUp(e.HungeringVoidDebuff) or t:BuffDown(e.VoidformBuff)) and (not e.SearingNightmare:IsAvailable() or l < 5)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == m("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        r = 1323673
        return true
    elseif ((t:Insanity() < 90 and ((q(n, true) and ((not e.VoidEruption:CooldownUp() or not f) or not e.HungeringVoid:IsAvailable())) or t:BuffUp(e.VoidformBuff)) and (not e.HungeringVoid:IsAvailable() or n:DebuffUp(e.HungeringVoidDebuff) or t:BuffDown(e.VoidformBuff)) and (not e.SearingNightmare:IsAvailable() or l < 5)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and n:GUID() ~= o:GUID() and not k) then
        r = 999
                if r == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif r > 0 and endtime ~= nil and GetTime() > endtime then
            r = 0
        end

        return true
    elseif ((t:Insanity() < 90 and ((q(n, true) and ((not e.VoidEruption:CooldownUp() or not f) or not e.HungeringVoid:IsAvailable())) or t:BuffUp(e.VoidformBuff)) and (not e.HungeringVoid:IsAvailable() or n:DebuffUp(e.HungeringVoidDebuff) or t:BuffDown(e.VoidformBuff)) and (not e.SearingNightmare:IsAvailable() or l < 5)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == o:GUID()) then
        a = 323673
        return true
    elseif (t:Insanity() < 90 and ((q(n, true) and ((not e.VoidEruption:CooldownUp() or not f) or not e.HungeringVoid:IsAvailable())) or t:BuffUp(e.VoidformBuff)) and (not e.HungeringVoid:IsAvailable() or n:DebuffUp(e.HungeringVoidDebuff) or t:BuffDown(e.VoidformBuff)) and (not e.SearingNightmare:IsAvailable() or l < 5)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) then
        return true
    end

end

local function se(e)
    return e:HealthPercentage()
end

local function se(a)
                if ((t:BuffUp(e.PowerInfusionBuff) or not i.Shadow.SelfPI or n.ShadowedOrbofTorment:IsEquipped()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326) and a:GUID() == m("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
                if n.SoullettingRuby:ID() == GetInventoryItemID("player", 13) then
            r = 241
            return true
        elseif n.SoullettingRuby:ID() == GetInventoryItemID("player", 14) then
            r = 251
            return true
        end

    elseif ((t:BuffUp(e.PowerInfusionBuff) or not i.Shadow.SelfPI or n.ShadowedOrbofTorment:IsEquipped()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and a:GUID() ~= o:GUID() and not k) then
        r = 999
        return true
    elseif ((t:BuffUp(e.PowerInfusionBuff) or not i.Shadow.SelfPI or n.ShadowedOrbofTorment:IsEquipped()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326) and a:GUID() == o:GUID()) then
                if n.SoullettingRuby:ID() == GetInventoryItemID("player", 13) then
            r = 241
            return true
        elseif n.SoullettingRuby:ID() == GetInventoryItemID("player", 14) then
            r = 251
            return true
        end

    elseif (t:BuffUp(e.PowerInfusionBuff) or not i.Shadow.SelfPI or n.ShadowedOrbofTorment:IsEquipped()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326) then
        return true
    end

end

local function he()
    if _.TargetIsValid() and not t:IsDeadOrGhost() and not t:AffectingCombat() and ((F) or (i.Commons.DBMSupport and d.BossMods:GetPullTimer() < v + t:GCD() and d.BossMods:GetPullTimer() > 0)) and not t:IsMoving() then
        if e.Fleshcraft:IsCastable() and (h == 0 or h > e.Fleshcraft:ExecuteTime()) and N and not t:IsMoving() and (e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled()) then
            if s(e.Fleshcraft, nil, nil) then
                a = 324631
                return "fleshcraft precombat 1"
            end

        end

        if e.ArcaneTorrent:IsCastable() and u() then
            if s(e.ArcaneTorrent, nil, nil, not o:IsSpellInRange(e.ArcaneTorrent)) then
                a = 28730
                return "arcane_torrent 6"
            end

        end

        if (i.Commons.Enabled.TopTrinket or i.Commons.Enabled.BottomTrinket) and n.ShadowedOrbofTorment:IsEquippedAndReady() and (h == 0 or h > 2) then
            if s(n.ShadowedOrbofTorment, nil, nil) then
                                if n.ShadowedOrbofTorment:ID() == w and i.Commons.Enabled.TopTrinket then
                    a = 24
                    return "top trinket 1"
                elseif n.ShadowedOrbofTorment:ID() == y and i.Commons.Enabled.BottomTrinket then
                    a = 30
                    return "top trinket 2"
                end

            end

        end

        T = 2
        if e.MindBlast:IsReady() and (h == 0 or h > e.MindBlast:CastTime() + .5) and (e.Damnation:IsAvailable()) then
            if s(e.MindBlast, nil, nil, not o:IsSpellInRange(e.MindBlast)) then
                a = 8092
                return "mind_blast 11"
            end

        end

        if e.VampiricTouch:IsCastable() and (h == 0 or h > e.VampiricTouch:CastTime() + .5) and (not e.Damnation:IsAvailable()) then
            if s(e.VampiricTouch, nil, nil, not o:IsSpellInRange(e.VampiricTouch)) then
                a = 34914
                return "vampiric_touch 10"
            end

        end

        if e.MindBlast:IsCastable() and (h == 0 or h > e.MindBlast:CastTime() + .5) and (e.Misery:IsAvailable() and (not U or not e.VoidTorrent:IsAvailable())) then
            if s(e.MindBlast, nil, nil, not o:IsSpellInRange(e.MindBlast)) then
                a = 8092
                return "mind_blast 12"
            end

        end

        if e.VoidTorrent:IsCastable() and (h == 0 or h > 3 + .5) and S and (e.Misery:IsAvailable() and U) then
            if s(e.VoidTorrent, nil, nil, not o:IsSpellInRange(e.VoidTorrent)) then
                a = 263165
                return "void_torrent 14"
            end

        end

        if e.MindFlay:IsCastable() and (h == 0 or h > 1) and not t:IsChanneling(e.MindFlay) and l <= T and (e.Misery:IsAvailable() and U and not e.VoidTorrent:IsAvailable()) then
            if s(e.MindFlay, nil, nil, not o:IsSpellInRange(e.MindFlay)) then
                a = 15407
                return "mind_flay 15"
            end

        end

        if e.ShadowWordPain:IsCastable() and (not e.Misery:IsAvailable()) then
            if s(e.ShadowWordPain, nil, nil, not o:IsSpellInRange(e.ShadowWordPain)) then
                a = 589
                return "shadow_word_pain 16"
            end

        end

    end

end

local function se()
    if n.ScarsofFraternalStrife:IsEquippedAndReady() and u() and ((t:BuffDown(e.ScarsofFraternalStrifeBuff4) and D > 1) or (t:BuffUp(e.VoidformBuff) or t:BuffUp(e.PowerInfusionBuff) or e.VoidEruption:CooldownRemains() > 10)) then
        if s(n.ScarsofFraternalStrife, nil, nil) then
                        if n.ScarsofFraternalStrife:ID() == w and i.Commons.Enabled.TopTrinket then
                a = 24
                return "top trinket 1"
            elseif n.ScarsofFraternalStrife:ID() == y and i.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if n.EmpyrealOrdinance:IsEquippedAndReady() and u() and ((e.VoidEruption:CooldownRemains() <= 12 and f) or (e.VoidEruption:CooldownRemains() > 27 or not f)) then
        if s(n.EmpyrealOrdinance, nil, nil, not o:IsInRange(40)) then
                        if n.EmpyrealOrdinance:ID() == w and i.Commons.Enabled.TopTrinket then
                a = 24
                return "top trinket 1"
            elseif n.EmpyrealOrdinance:ID() == y and i.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if n.InscrutableQuantumDevice:IsEquippedAndReady() and u() and (t:BuffUp(e.VoidformBuff) and t:BuffUp(e.PowerInfusionBuff) or p.BossFilteredFightRemains("<=", 20) or t:BuffUp(e.PowerInfusionBuff) and (p.BossFilteredFightRemains("<", e.VoidEruption:CooldownRemains() + 15) or not f) or t:BuffUp(e.VoidformBuff) and (p.BossFilteredFightRemains("<", e.PowerInfusion:CooldownRemains() + 15) or not I) or ((e.PowerInfusion:CooldownRemains() >= 10 or not I) and (e.VoidEruption:CooldownRemains() >= 10 or not f)) and p.BossFilteredFightRemains(">=", 190)) then
        if s(n.InscrutableQuantumDevice, nil, nil) then
                        if n.InscrutableQuantumDevice:ID() == w and i.Commons.Enabled.TopTrinket then
                a = 24
                return "top trinket 1"
            elseif n.InscrutableQuantumDevice:ID() == y and i.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if n.MacabreSheetMusic:IsEquippedAndReady() and u() and (e.VoidEruption:CooldownRemains() > 10 or not f) then
        if s(n.MacabreSheetMusic, nil, nil) then
                        if n.MacabreSheetMusic:ID() == w and i.Commons.Enabled.TopTrinket then
                a = 24
                return "top trinket 1"
            elseif n.MacabreSheetMusic:ID() == y and i.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if n.SoullettingRuby:IsEquippedAndReady() and u() and (t:BuffUp(e.PowerInfusionBuff) or not i.Shadow.SelfPI or n.ShadowedOrbofTorment:IsEquipped()) then
        if s(n.SoullettingRuby, nil, nil) then
                        if n.SoullettingRuby:ID() == w and i.Commons.Enabled.TopTrinket then
                a = 24
                return "top trinket 1"
            elseif n.SoullettingRuby:ID() == y and i.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if n.TheFirstSigil:IsEquippedAndReady() and u() and (t:BuffUp(e.VoidformBuff) or t:BuffUp(e.PowerInfusionBuff) or (not i.Shadow.SelfPI) or e.VoidEruption:CooldownRemains() > 10 or (n.SoullettingRuby:IsEquipped() and not n.SoullettingRuby:IsReady()) or L < 20) then
        if s(n.TheFirstSigil, nil, nil) then
                        if n.TheFirstSigil:ID() == w and i.Commons.Enabled.TopTrinket then
                a = 24
                return "top trinket 1"
            elseif n.TheFirstSigil:ID() == y and i.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if n.SinfulGladiatorsBadgeofFerocity:IsEquippedAndReady() and u() and (e.VoidEruption:CooldownRemains() >= 10 or not f) then
        if s(n.SinfulGladiatorsBadgeofFerocity, nil, nil) then
                        if n.SinfulGladiatorsBadgeofFerocity:ID() == w and i.Commons.Enabled.TopTrinket then
                a = 24
                return "top trinket 1"
            elseif n.SinfulGladiatorsBadgeofFerocity:ID() == y and i.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if n.ShadowedOrbofTorment:IsEquippedAndReady() and u() and (h == 0 or h > 2.5) and ((e.PowerInfusion:CooldownRemains() <= 10 and I and e.VoidEruption:CooldownRemains() <= 10 and f and (j == 4 or j == 1)) or ((j == 2 or j == 3) and (t:BuffDown(e.VoidformBuff) or t:PrevGCD(1, e.VoidBolt)))) then
        if s(n.ShadowedOrbofTorment, nil, nil) then
                        if n.ShadowedOrbofTorment:ID() == w and i.Commons.Enabled.TopTrinket then
                a = 24
                return "top trinket 1"
            elseif n.ShadowedOrbofTorment:ID() == y and i.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if n.ArchitectsIngenuityCore:IsEquippedAndReady() and u() then
        if s(n.ArchitectsIngenuityCore, nil, nil, not o:IsInRange(30)) then
                        if n.ArchitectsIngenuityCore:ID() == w and i.Commons.Enabled.TopTrinket then
                a = 24
                return "top trinket 1"
            elseif n.ArchitectsIngenuityCore:ID() == y and i.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if u() and (t:BuffUp(e.VoidformBuff) or t:BuffUp(e.PowerInfusionBuff) or (e.VoidEruption:CooldownRemains() > 10 or not f)) then
        local e = t:GetUseableTrinkets(de)
        if e then
            if s(e, nil, nil) then
                                if e:ID() == w and i.Commons.Enabled.TopTrinket then
                    a = 24
                    return "top trinket 1"
                elseif e:ID() == y and i.Commons.Enabled.BottomTrinket then
                    a = 30
                    return "top trinket 2"
                end

            end

        end

    end

end

local function U()
    if e.PowerInfusion:IsCastable() and I and not t:IsMoving() and (i.Shadow.SelfPI and (t:BuffUp(e.VoidformBuff) or t:BuffUp(e.DarkAscension))) then
        if s(e.PowerInfusion, nil) then
            a = 10060
            return "power_infusion 50"
        end

    end

    print("1", e.VoidEruption:IsReady(), (h == 0 or h > e.VoidEruption:CastTime() + .5), f, (not t:IsMoving()))
    print("2", (c:IsReady()))
    print("3", (c:TimeSinceLastCast() < 15), (not e.Mindbender:IsAvailable() or j == 3))
    print("4", (e.MindBlast:Charges() == 0), (D > 15), (t:BuffUp(e.ShadowyInsightBuff) and e.MindBlast:Charges() == t:BuffStack(e.ShadowyInsightBuff)))
    if e.VoidEruption:IsReady() and (h == 0 or h > e.VoidEruption:CastTime() + .5) and f and not t:IsMoving() and (c:IsReady() and (c:TimeSinceLastCast() < 15 or not e.Mindbender:IsAvailable() or j == 3) and (e.MindBlast:Charges() == 0 or D > 15 or (t:BuffUp(e.ShadowyInsightBuff) and e.MindBlast:Charges() == t:BuffStack(e.ShadowyInsightBuff)))) then
        if s(e.VoidEruption, nil, nil, not o:IsSpellInRange(e.VoidEruption)) then
            a = 228260
            return "void_eruption 92"
        end

    end

    if e.DarkAscension:IsCastable() and (h == 0 or h > e.DarkAscension:CastTime() + .5) and u() and not t:IsMoving() and ((c:TimeSinceLastCast() < 15 and e.MindBlast:Charges() < 2) or (not e.Mindbender:IsAvailable() and not c:CooldownUp()) or (j == 3 and c:CooldownRemains() >= 15 and e.FaeGuardians:CooldownRemains() >= 4 * t:GCD())) then
        if s(e.DarkAscension, nil) then
            a = 391109
            return "DarkAscension 51"
        end

    end

    if (true) then
        local e = se()
        if e then
            return e
        end

    end

    if e.UnholyNova:IsReady() and N and ((o:DebuffUp(e.ShadowWordPainDebuff) and g) or e.ShadowCrash:TimeSinceLastCast() < 1) then
        if s(e.UnholyNova, nil, nil, not o:IsSpellInRange(e.UnholyNova)) then
            a = 324724
            return "UnholyNova 56"
        end

    end

    if e.FaeGuardians:IsReady() and N and (((o:DebuffUp(e.ShadowWordPainDebuff) and g) or e.ShadowCrash:TimeSinceLastCast() < 1) and (not e.VoidEruption:IsAvailable() or (t:BuffUp(e.VoidformBuff) and not e.VoidBolt:CooldownUp() and e.MindBlast:FullRechargeTime() > t:GCD()) or (not e.VoidEruption:CooldownUp() and e.VoidEruption:IsAvailable()))) then
        if s(e.FaeGuardians, nil) then
            a = 327661
            return "fae_guardians 52"
        end

    end

    if c:IsCastable() and B and ((o:DebuffUp(e.ShadowWordPainDebuff) and g) or e.ShadowCrash:TimeSinceLastCast() < 1) then
        if s(c, nil, nil, not o:IsSpellInRange(e.Mindbender)) then
            a = 200174
            return "shadowfiend/mindbender 108"
        end

    end

end

local function se()
    if (true) then
        local e = U()
        if e then
            return e
        end

    end

    if e.ShadowWordDeath:IsReady() and c:TimeSinceLastCast() <= 15 and x and ((15 - c:TimeSinceLastCast()) <= (t:GCD()) or o:HealthPercentage() < 20) and l <= 7 then
        if s(e.ShadowWordDeath, nil, nil, not o:IsSpellInRange(e.ShadowWordDeath)) then
            a = 136149
            return "shadow_word_death 99"
        end

    end

    if e.MindBlast:IsCastable() and (h == 0 or h > e.MindBlast:CastTime() + .5) and (not t:IsMoving() or t:BuffUp(e.DarkThoughtBuff)) and (e.MindBlast:CastTime() < e.VoidBolt:CooldownRemains() or (t:BuffUp(e.DarkThoughtBuff) and e.VoidBolt:CooldownRemains() > t:GCD() * 1.1) or t:BuffDown(e.VoidformBuff)) and ((e.MindBlast:FullRechargeTime() <= t:GCD() or ((15 - c:TimeSinceLastCast()) <= e.MindBlast:CastTime() + t:GCD())) and c:TimeSinceLastCast() <= 15 and x and ((15 - c:TimeSinceLastCast()) > e.MindBlast:CastTime()) and l <= 7) then
        if s(e.MindBlast, nil, nil, not o:IsSpellInRange(e.MindBlast)) then
            a = 8092
            return "mind_blast 100"
        end

    end

    if e.Damnation:IsCastable() then
        if _.CastCycle(e.Damnation, R, ae, not o:IsSpellInRange(e.Damnation)) then
            a = 341374
            return "damnation 98"
        end

    end

    if e.VoidBolt:IsCastable() and A and t:Insanity() <= 85 then
        if s(e.VoidBolt, nil, nil, not o:IsInRange(40)) then
            a = 214771
            return "void_bolt 90"
        end

    end

    if e.MindSear:IsCastable() and t:Insanity() > 50 and (h == 0 or h > 1) and not t:IsMoving() and not t:IsChanneling(e.MindSear) and ((l > T or t:BuffUp(e.VoidformBuff)) and t:BuffUp(e.MindDevourerBuff)) then
        if s(e.MindSear, nil, nil, not o:IsSpellInRange(e.MindSear)) then
            a = 48045
            return "mind_sear 97"
        end

    end

    if t:IsChanneling(e.MindSear) then
        if s(e.Pool, nil) then
            a = 99999
            return "channeling 4"
        end

    end

    if e.MindSear:IsCastable() and t:Insanity() > 50 and (h == 0 or h > 1) and not t:IsMoving() and not t:IsChanneling(e.MindSear) and (l > T) then
        if s(e.MindSear, nil, nil, not o:IsSpellInRange(e.MindSear)) then
            a = 48045
            return "mind_sear 97"
        end

    end

    if e.DevouringPlague:IsReady() and ((o:DebuffRefreshable(e.DevouringPlagueDebuff) and not W) or t:Insanity() > 75 or (e.VoidTorrent:IsAvailable() and e.VoidTorrent:CooldownRemains() <= (3 * t:GCD()) and S) or (t:BuffUp(e.MindDevourerBuff) and e.MindBlast:FullRechargeTime() <= 2 * t:GCD() and not e.VoidEruption:CooldownUp() and e.VoidEruption:IsAvailable())) then
        if s(e.DevouringPlague, nil, nil, not o:IsSpellInRange(e.DevouringPlague)) then
            a = 335467
            return "devouring_plague 102"
        end

    end

    if e.ShadowWordDeath:IsReady() and o:IsSpellInRange(e.ShadowWordDeath) and (((o:HealthPercentage() < 20 and l < 4) and (not x or c:CooldownRemains() >= 10)) or (c:TimeSinceLastCast() <= 15 and x and l <= 7) or (t:BuffUp(e.DeathspeakerBuff) and ((c:CooldownRemains() + t:GCD()) > t:BuffRemains(e.DeathspeakerBuff)))) then
        if s(e.ShadowWordDeath, nil) then
            a = 136149
            return "shadow_word_death 104"
        end

    end

    if e.VampiricTouch:IsCastable() and (h == 0 or h > e.VampiricTouch:CastTime() + .5) and not t:IsMoving() and not t:IsCasting(e.VampiricTouch) and o:IsSpellInRange(e.VampiricTouch) then
        if _.CastCycle(e.VampiricTouch, R, ne, not o:IsSpellInRange(e.VampiricTouch)) then
            a = 34914
            return "VampiricTouch 98"
        end

    end

    if e.ShadowWordPain:IsCastable() then
        if _.CastCycle(e.ShadowWordPain, R, ie, not o:IsSpellInRange(e.ShadowWordPain)) then
            a = 589
            return "ShadowWordPain 98"
        end

    end

    if e.MindBlast:IsCastable() and (h == 0 or h > e.MindBlast:CastTime() + .5) and (not t:IsMoving() or t:BuffUp(e.DarkThoughtBuff)) and (e.MindBlast:CastTime() < e.VoidBolt:CooldownRemains() or (t:BuffUp(e.DarkThoughtBuff) and e.VoidBolt:CooldownRemains() > t:GCD() * 1.1) or t:BuffDown(e.VoidformBuff)) and (g and (not t:BuffUp(e.MindDevourerBuff) or (e.VoidEruption:CooldownUp() and e.VoidEruption:IsAvailable()))) then
        if s(e.MindBlast, nil, nil, not o:IsSpellInRange(e.MindBlast)) then
            a = 8092
            return "mind_blast 100"
        end

    end

    if e.Mindgames:IsReady() and (h == 0 or h > e.Mindgames:CastTime() + .5) and not t:IsMoving() and N and (l < 5 and Y) then
        if s(e.Mindgames, nil, nil, not o:IsSpellInRange(e.Mindgames)) then
            a = 323673
            return "mindgames 54"
        end

    end

    if e.ShadowCrash:IsCastable() and P then
        if s(e.ShadowCrash, nil, nil, not o:IsInRange(40)) then
            a = 205385
            return "shadow_crash 114"
        end

    end

    if e.DarkVoid:IsCastable() and (E or u()) then
        if s(e.DarkVoid, nil, nil, not o:IsInRange(40)) then
            a = 263346
            return "DarkVoid 114"
        end

    end

    if e.DevouringPlague:IsReady() and (t:BuffUp(e.VoidformBuff) and A) then
        if s(e.DevouringPlague, nil, nil, not o:IsSpellInRange(e.DevouringPlague)) then
            a = 335467
            return "devouring_plague 102"
        end

    end

    if e.VoidTorrent:IsCastable() and (h == 0 or h > 3 + .5) and S and not t:IsMoving() and t:Insanity() <= 35 then
        if _.CastCycle(e.VoidTorrent, R, oe, not o:IsSpellInRange(e.VoidTorrent), nil) then
            a = 263165
            return "VoidTorrent 104"
        end

    end

    if e.MindBlast:IsCastable() and (h == 0 or h > e.MindBlast:CastTime() + .5) and (not t:IsMoving() or t:BuffUp(e.DarkThoughtBuff)) and (e.VoidBolt:CooldownRemains() >= e.MindBlast:CastTime() or not t:BuffUp(e.VoidformBuff)) and (not x or (not c:CooldownUp() and x) or g) then
        if s(e.MindBlast, nil, nil, not o:IsSpellInRange(e.MindBlast)) then
            a = 8092
            return "mind_blast 122"
        end

    end

    if e.VampiricTouch:IsCastable() and (h == 0 or h > e.VampiricTouch:CastTime() + .5) and not t:IsMoving() and not t:IsCasting(e.VampiricTouch) and o:IsSpellInRange(e.VampiricTouch) and (t:BuffUp(e.UnfurlingDarknessBuff)) then
        if s(e.VampiricTouch, nil) then
            a = 34914
            return "vampiric_touch 127"
        end

    end

    if e.MindFlay:IsCastable() and (h == 0 or h > 1) and not t:IsMoving() and not t:IsChanneling(e.MindFlay) and (t:BuffUp(e.MindFlayInsanityBuff) and A and (not t:BuffUp(e.SurgeofDarkness) or e.ScreamsoftheVoid:IsAvailable())) then
        if s(e.MindFlay, nil, nil, not o:IsSpellInRange(e.MindFlay)) then
            a = 15407
            return "mind_flay 120"
        end

    end

    if e.MindSpike:IsCastable() and (h == 0 or h > e.MindSpike:CastTime()) and not t:IsMoving() and (t:BuffUp(e.MindFlayInsanityBuff) and A and (not t:BuffUp(e.SurgeofDarkness) or e.ScreamsoftheVoid:IsAvailable())) then
        if s(e.MindSpike, nil, nil, not o:IsSpellInRange(e.MindSpike)) then
            a = 73510
            return "MindSpike 120"
        end

    end

    if e.MindFlay:IsCastable() and (h == 0 or h > 1) and not t:IsMoving() and not t:IsChanneling(e.MindFlay) then
        if s(e.MindFlay, nil, nil, not o:IsSpellInRange(e.MindFlay)) then
            a = 15407
            return "MindFlay 97"
        end

    end

    if t:IsChanneling(e.MindFlay) and e.MindFlay:TickTime() * 2 < (GetTime() - t:ChannelStart()) then
        a = 1999
    end

    if e.ShadowWordDeath:IsReady() and t:IsMoving() then
        if s(e.ShadowWordDeath, nil, nil, not o:IsSpellInRange(e.ShadowWordDeath)) then
            a = 136149
            return "shadow_word_death 133"
        end

    end

    if e.ShadowWordPain:IsCastable() and t:IsMoving() then
        if s(e.ShadowWordPain, nil, nil, not o:IsSpellInRange(e.ShadowWordPain)) then
            a = 589
            return "shadow_word_pain 134"
        end

    end

end

local function U()
    F = HeroRotationCharDB.Toggles[6]
    N = HeroRotationCharDB.Toggles[4]
    E = HeroRotationCharDB.Toggles[5]
    k = HeroRotationCharDB.Toggles[12]
    G = not HeroRotationCharDB.Toggles[15]
    J = HeroRotationCharDB.Toggles[60]
    K = HeroRotationCharDB.Toggles[61]
    V = HeroRotationCharDB.Toggles[62]
    I = false
    f = false
    S = false
    P = false
    B = false
    if ((i.Shadow.PowerInfusion == "CDs" and u()) or (i.Shadow.PowerInfusion == "Small CDs" and (u() or E)) or (i.Shadow.PowerInfusion == "Always")) then
        I = true
    end

    if ((i.Shadow.VoidEruption == "CDs" and u()) or (i.Shadow.VoidEruption == "Small CDs" and (u() or E)) or (i.Shadow.VoidEruption == "Always")) then
        f = true
    end

    if ((i.Shadow.VoidTorrent == "CDs" and u()) or (i.Shadow.VoidTorrent == "Small CDs" and (u() or E)) or (i.Shadow.VoidTorrent == "Always")) then
        S = true
    end

    if ((i.Shadow.MindBender == "CDs" and u()) or (i.Shadow.MindBender == "Small CDs" and (u() or E)) or (i.Shadow.MindBender == "Always")) then
        B = true
    end

    if ((i.Shadow.ShadowCrash == "CDs" and u()) or (i.Shadow.ShadowCrash == "Small CDs" and (u() or E)) or (i.Shadow.ShadowCrash == "Always")) then
        P = true
    end

    h = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                h = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

    v = 0
    if e.Fleshcraft:IsCastable() and (h == 0 or h > e.Fleshcraft:ExecuteTime()) and N and not t:IsMoving() and (e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled()) then
        v = v + 3
    end

    if e.ArcaneTorrent:IsCastable() and u() then
        v = v + t:GCD()
    end

    if ((n.ShadowedOrbofTorment:ID() == w and i.Commons.Enabled.TopTrinket) or (n.ShadowedOrbofTorment:ID() == y and i.Commons.Enabled.BottomTrinket)) and n.ShadowedOrbofTorment:IsEquippedAndReady() and (h == 0 or h > 2) then
        v = v + 2
    end

    if e.VampiricTouch:IsCastable() and (h == 0 or h > e.VampiricTouch:CastTime() + .5) and (not e.Damnation:IsAvailable()) then
        v = v + e.VampiricTouch:CastTime()
    end

    if e.MindBlast:IsReady() and (h == 0 or h > e.MindBlast:CastTime() + .5) and (e.Damnation:IsAvailable()) then
        v = v + e.MindBlast:CastTime()
    end

end

local function j()
    me = t:GetEnemiesInMeleeRange(8)
    fe = t:GetEnemiesInRange(30)
    R = t:GetEnemiesInRange(40)
    H = o:GetEnemiesInSplashRange(15)
    w, te = GetInventoryItemID("player", 13)
    y, te = GetInventoryItemID("player", 14)
        if Q() and i.Commons.AoeMode == "Conservative" then
        C = o:GetEnemiesInSplashRangeCount(8)
        l = o:GetEnemiesInSplashRangeCount(15)
    elseif Q() and i.Commons.AoeMode == "Aggresive" then
        local t = 0
        for e = 1, 20 do
            local e = "nameplate" .. e
            if UnitExists(e) then
                if UnitCanAttack("player", e) then
                    if (UnitCanAttack("player", e) and UnitAffectingCombat("target") and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil) or m(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) or string.find(UnitGUID(e), 182778) or string.find(UnitGUID(e), 183945) then
                        t = (t + 1)
                    end

                end

            end

        end

        C = t
        l = t
    end

    local w = 0
    for e = 1, 20 do
        local e = "nameplate" .. e
        if UnitExists(e) then
            if UnitCanAttack("player", e) then
                if (UnitCanAttack("player", e) and UnitAffectingCombat("target") and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil and m(e):TimeToDie() >= 18) or m(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) or string.find(UnitGUID(e), 182778) or string.find(UnitGUID(e), 183945) then
                    w = (w + 1)
                end

            end

        end

    end

    if not Q() then
        C = 1
        l = 1
        w = 1
    end

    if J then
        l = 10
        C = 10
    end

    we = pe(H)
    ce = ye(H)
    if not BotOn then
        r = 0
        a = 0
    end

    if r > 0 then
        r = 0
    end

    if a > 0 then
        a = 0
    end

    ue = U()
    if d.QueuedCast() then
        a = d.QueuedCast()
        return "Custom Queue " .. b(a):ID()
    end

    if b(200174):IsAvailable() then
        c = e.Mindbender
    else
        c = e.Shadowfiend
    end

        if d.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (d.GUISettings.General.OpenerReset)
    elseif d.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        d.ToggleIconFrame:UpdateButtonText(6)
        d.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (K and e.MassDispell:IsUsableP() and e.MassDispell:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.MassDispell, nil, nil, nil) then
            a = 327830
            return "queue RingOfPeace"
        end

    elseif ((not e.MassDispell:IsUsableP() or e.MassDispell:CooldownRemains(BypassRecovery) > 0) and K) then
        HeroRotationCharDB.Toggles[61] = not HeroRotationCharDB.Toggles[61]
        d.Print("Mass Dispel Queue is now " .. (HeroRotationCharDB.Toggles[61] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (V and b(9484):IsUsableP() and b(9484):CooldownRemains(BypassRecovery) <= 0) then
        if m("mouseover"):GUID() ~= nil and m("mouseover"):IsInRange(30) then
            r = 19484
            return "queue Shackle MO"
        end

    elseif ((not b(9484):IsUsableP() or b(9484):CooldownRemains() > 0 or t:PrevGCD(1, b(9484))) and V) then
        HeroRotationCharDB.Toggles[62] = not HeroRotationCharDB.Toggles[62]
        d.Print("Shackle Undead Queue is now " .. (HeroRotationCharDB.Toggles[62] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    local c = select(1, UnitCastingInfo("player"))
    if h ~= 0 and h < .5 and (t:IsChanneling(e.MindSear) or t:IsChanneling(e.MindFlay)) then
        if s(e.Pool, nil) then
            a = 1999
            return "Quaking Stope"
        end

    end

    if t:IsDeadOrGhost() then
        a = 999
    end

    if t:IsChanneling(b(355321)) then
        if s(e.Pool, nil) then
            a = 999
            return "Trinket Channel"
        end

    end

    if e.Shadowform:IsCastable() and (t:BuffDown(e.ShadowformBuff)) then
        if s(e.Shadowform, nil) then
            a = 232698
            return "shadowform 4"
        end

    end

    if e.PowerWordShield:IsCastable() and t:DebuffDown(e.WeakenedSoul) and not t:IsChanneling() and not t:IsCasting() and ((i.Shadow.PWS == "Moving" and t:IsMoving()) or (i.Shadow.PWS == "Always") or (i.Shadow.PWS == "OOC Moving" and t:IsMoving() and not t:AffectingCombat())) then
        if s(e.PowerWordShield, nil) then
            a = 17
            return "PW:S Settings"
        end

    end

    if t:IsChanneling(e.VoidTorrent) then
        local t = Cwc()
        if t then
            return t
        end

        if s(e.Pool, nil) then
            a = 99999
            return "channeling 4"
        end

    end

    if t:IsChanneling(b(324631)) then
                if t:AffectingCombat() and i.Shadow.CastCancelFC then
            a = 1999
        elseif d.CastAnnotated(e.Pool, false, "WAIT") then
            a = 99999
            return "Pool During Fleshcraft"
        end

    end

    T = 2
    if not t:AffectingCombat() and ((F) or (i.Commons.DBMSupport and d.BossMods:GetPullTimer() < v + t:GCD() and d.BossMods:GetPullTimer() > 0)) and _.TargetIsValid() and not t:IsMoving() then
        local e = he()
        if e then
            return e
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.ShadowWordDeath:IsCastable() then
            if s(e.ShadowWordDeath, nil) then
                r = 1136149
                return "explosive MO SWD"
            end

        end

        if e.ShadowWordPain:IsCastable() then
            if s(e.ShadowWordPain, nil) then
                r = 1589
                return "explosive MO SWP"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.ShadowWordDeath:IsCastable() then
            if s(e.ShadowWordDeath, nil) then
                a = 136149
                return "explosive  SWD"
            end

        end

        if e.ShadowWordPain:IsCastable() then
            if s(e.ShadowWordPain, nil) then
                a = 589
                return "explosive  SWP"
            end

        end

    end

    if _.TargetIsValid() and t:AffectingCombat() and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or o:NPCID() == 176581 or o:NPCID() == 176920 or o:NPCID() == 177892 or o:NPCID() == 182778 or o:NPCID() == 185402 or o:NPCID() == 183945 or o:NPCID() == 182074 or o:NPCID() == 184737 or o:NPCID() == 179733 or o:NPCID() == 115402 or o:NPCID() == 115406 or o:NPCID() == 115395 or UnitExists("boss1") or o:NPCID() == 115388 or F) and not t:IsDeadOrGhost() then
        L = p.FightRemains(H, false)
        if (o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or o:NPCID() == 176581 or o:NPCID() == 176920) then
            L = 99999999999
        end

        D = p.CombatTime()
        le = L + D
        if e.Dispersion:IsCastable() and t:HealthPercentage() < i.Shadow.DispersionHP then
            if s(e.Dispersion, nil) then
                a = 47585
                return "dispersion low_hp"
            end

        end

        if e.DesperatePrayer:IsCastable() and t:HealthPercentage() < i.Shadow.DesperatePrayerHP then
            if s(e.DesperatePrayer, nil) then
                a = 19236
                return "DesperatePrayer low_hp"
            end

        end

        if t:HealthPercentage() < i.Commons.HealthstoneHP and n.Healthstone:IsReady() and n.Healthstone:CooldownRemains() <= 0 then
            if d.Cast(n.Healthstone, nil) then
                a = 40
                return "Healthstone HP"
            end

        end

        if t:HealthPercentage() < i.Commons.HealPotHP and n.CosmicHealPot:IsReady() and n.CosmicHealPot:CooldownRemains() <= 0 then
            if d.Cast(n.CosmicHealPot, nil) then
                a = 45
                return "CosmicHealPot HP"
            end

        end

        if t:HealthPercentage() < i.Commons.HealPotHP and n.HealPot:IsReady() and n.HealPot:CooldownRemains() <= 0 then
            if d.Cast(n.HealPot, nil) then
                a = 41
                return "HealPot HP"
            end

        end

        if n.PotionofPhantomFire:IsReady() and i.Commons.Enabled.Potions and G and (((t:BuffUp(e.VoidformBuff) or t:BuffUp(e.PowerInfusionBuff)) and not d.GUISettings.General.HoldPotforBL) or (d.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if s(n.PotionofPhantomFire, nil, nil) then
                a = 50
                return "potion_of_phantomfire 2"
            end

        end

        if n.PotionofSpectralIntellect:IsReady() and i.Commons.Enabled.Potions and G and (((t:BuffUp(e.VoidformBuff) or t:BuffUp(e.PowerInfusionBuff)) and not d.GUISettings.General.HoldPotforBL) or (d.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if s(n.PotionofSpectralIntellect, nil, nil) then
                a = 50
                return "potion_of_spectral_intellect 2"
            end

        end

        T = 2
        A = q(o, false)
        Y = q(o, true)
        z = w
        if t:BuffUp(e.VoidformBuff) then
            z = X(w <= 5) * w
        end

        M = 0
        if re(H) > 0 then
            M = 1
        end

        g = (e.VampiricTouchDebuff:AuraActiveCount() >= z or not M)
        Z = (l > (2 + X(t:BuffUp(e.VoidformBuff))))
        x = O or e.InescapableTorment:IsAvailable()
        W = ((e.VoidEruption:CooldownRemains() <= t:GCD() * 3 and e.VoidEruption:IsAvailable() and f) or (e.DarkAscension:CooldownUp() and e.DarkAscension:IsAvailable()))
        if (u()) then
            if e.Fireblood:IsCastable() and (t:BuffUp(e.VoidformBuff)) then
                if s(e.Fireblood, nil) then
                    a = 265221
                    return "fireblood 22"
                end

            end

            if e.Berserking:IsCastable() and (t:BuffUp(e.VoidformBuff)) then
                if s(e.Berserking, nil) then
                    a = 26297
                    return "berserking 24"
                end

            end

            if e.LightsJudgment:IsCastable() and (l >= 2) then
                if s(e.LightsJudgment, nil, nil, not o:IsSpellInRange(e.LightsJudgment)) then
                    a = 255647
                    return "lights_judgment 26"
                end

            end

            if e.AncestralCall:IsCastable() and (t:BuffUp(e.VoidformBuff)) then
                if s(e.AncestralCall, nil) then
                    a = 274738
                    return "ancestral_call 28"
                end

            end

        end

        ee = 60
        if (true) then
            local e = se()
            if e then
                return e
            end

        end

    end

    if _.TargetIsValid() and not UnitIsFriend("target", "player") and t:AffectingCombat() and (not o:AffectingCombat() and not o:IsDummy() and o:NPCID() ~= 153285) and not k then
        r = 999
    end

end

local function t()
    e.VampiricTouchDebuff:RegisterAuraTracking()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        d.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpell()
    if a == 0 then
        return 0
    else
        return a
    end

end

function ReturnSpellMO()
    if r == 0 then
        return 0
    else
        return r
    end

end

d.SetAPL(258, j, t)

