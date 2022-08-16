local e, e = ...
local e = HeroDBC.DBC
local g = HeroLib
local e = HeroCache
local f = g.Unit
local t = f.Player
local a = f.Target
local e = f.Pet
local j = g.Spell
local o = g.Item
local l = HeroRotation
local G = l.AoEON
local c = l.CDsON
local s = l.Cast
local e = l.CastSuggested
local T = HeroRotationCharDB.Toggles[4]
local S = HeroRotationCharDB.Toggles[5]
local P = HeroRotationCharDB.Toggles[6]
local te = not HeroRotationCharDB.Toggles[15]
local _ = HeroRotationCharDB.Toggles[12]
local ie = HeroRotationCharDB.Toggles[60]
local Q = HeroRotationCharDB.Toggles[61]
local K = HeroRotationCharDB.Toggles[62]
local N = false
local u = false
local D = false
local X = false
local R = false
local r = 0
local we = math.min
local e = j.Priest.Shadow
local n = o.Priest.Shadow
local de = { n.ArchitectsIngenuityCore:ID(), n.EmpyrealOrdinance:ID(), n.InscrutableQuantumDevice:ID(), n.MacabreSheetMusic:ID(), n.ShadowedOrbofTorment:ID(), n.SinfulGladiatorsBadgeofFerocity:ID(), n.SoullettingRuby:ID(), n.TheFirstSigil:ID(), n.ScarsofFraternalStrife:ID() }
local i = t:GetEquipment()
local h = o(0)
local d = o(0)
local k, m = GetInventoryItemID("player", 13)
local v, oe = GetInventoryItemID("player", 14)
if i[13] then
    h = o(i[13])
end

if i[14] then
    d = o(i[14])
end

local fe
local ne, ye, L, W
local F, h
local ee
local Z
local d = 0
local o = 0
local i = 0
local i
local b
local E = l.Commons.Everyone
local i = { General = l.GUISettings.General, Commons = l.GUISettings.APL.Priest.Commons, Shadow = l.GUISettings.APL.Priest.Shadow }
local m = 0
local m = 0
local U = 0
local z = 0
local V = 0
local A = false
local ae = false
local m = 1
local M = false
local J = false
local w = false
local B = false
local p = 0
local O = false
local Y = 2
local q = t:HasLegendaryEquipped(202)
local C = t:HasLegendaryEquipped(161)
local se = t:HasLegendaryEquipped(158)
local y = t:HasLegendaryEquipped(159)
local H = j(200174)
g:RegisterForEvent(function()
    A = false
    ae = false
    m = 1
    M = false
    O = false
end, "PLAYER_REGEN_ENABLED")
local I = t:CovenantID()
g:RegisterForEvent(function()
    I = t:CovenantID()
end, "COVENANT_CHOSEN")
g:RegisterForEvent(function()
    q = t:HasLegendaryEquipped(202)
    C = t:HasLegendaryEquipped(161)
    se = t:HasLegendaryEquipped(158)
    y = t:HasLegendaryEquipped(159)
end, "PLAYER_EQUIPMENT_CHANGED")
g:RegisterForEvent(function()
    e.ShadowCrash:RegisterInFlight()
end, "LEARNED_SPELL_IN_TAB")
e.ShadowCrash:RegisterInFlight()
local function x(e)
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
        return (t:DebuffUp(e.ShadowWordPainDebuff) and (t:DebuffUp(e.VampiricTouchDebuff) or t:TimeToDie() < 18) and t:DebuffUp(e.DevouringPlagueDebuff))
    else
        return (t:DebuffUp(e.ShadowWordPainDebuff) and (t:DebuffUp(e.VampiricTouchDebuff) or t:TimeToDie() < 18))
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

local function ge(t)
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

local function ve(n)
                if (((n:DebuffRefreshable(e.VampiricTouchDebuff) or n:DebuffRefreshable(e.ShadowWordPainDebuff) or (t:BuffDown(e.MindDevourerBuff) and t:Insanity() < 50)) and (t:BuffStack(e.DarkThoughtBuff) < Y or not t:HasTier(28, 2))) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == f("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        d = 1136149
        return true
    elseif (((n:DebuffRefreshable(e.VampiricTouchDebuff) or n:DebuffRefreshable(e.ShadowWordPainDebuff) or (t:BuffDown(e.MindDevourerBuff) and t:Insanity() < 50)) and (t:BuffStack(e.DarkThoughtBuff) < Y or not t:HasTier(28, 2))) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and n:GUID() ~= a:GUID() and not _) then
        d = 999
                if d == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif d > 0 and endtime ~= nil and GetTime() > endtime then
            d = 0
        end

        return true
    elseif (((n:DebuffRefreshable(e.VampiricTouchDebuff) or n:DebuffRefreshable(e.ShadowWordPainDebuff) or (t:BuffDown(e.MindDevourerBuff) and t:Insanity() < 50)) and (t:BuffStack(e.DarkThoughtBuff) < Y or not t:HasTier(28, 2))) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == a:GUID()) then
        o = 136149
        return true
    elseif ((n:DebuffRefreshable(e.VampiricTouchDebuff) or n:DebuffRefreshable(e.ShadowWordPainDebuff) or (t:BuffDown(e.MindDevourerBuff) and t:Insanity() < 50)) and (t:BuffStack(e.DarkThoughtBuff) < Y or not t:HasTier(28, 2))) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) then
        return true
    end

end

local function be(t)
                if (((t:HealthPercentage() < 20 and h < 4) or (e.Mindbender:TimeSinceLastCast() <= 15 and y and h <= 7)) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == f("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        d = 1136149
        return true
    elseif (((t:HealthPercentage() < 20 and h < 4) or (e.Mindbender:TimeSinceLastCast() <= 15 and y and h <= 7)) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and t:GUID() ~= a:GUID() and not _) then
        d = 999
                if d == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif d > 0 and endtime ~= nil and GetTime() > endtime then
            d = 0
        end

        return true
    elseif (((t:HealthPercentage() < 20 and h < 4) or (e.Mindbender:TimeSinceLastCast() <= 15 and y)) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == a:GUID()) then
        o = 136149
        return true
    elseif (((t:HealthPercentage() < 20 and h < 4) or (e.Mindbender:TimeSinceLastCast() <= 15 and y))) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) then
        return true
    end

end

local function me(n)
                if ((n:TimeToDie() < 20 and t:BuffDown(e.VoidformBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == f("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        d = 1319952
        return true
    elseif ((n:TimeToDie() < 20 and t:BuffDown(e.VoidformBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and n:GUID() ~= a:GUID() and not _) then
        d = 999
                if d == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif d > 0 and endtime ~= nil and GetTime() > endtime then
            d = 0
        end

        return true
    elseif ((n:TimeToDie() < 20 and t:BuffDown(e.VoidformBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == a:GUID()) then
        o = 319952
        return true
    elseif (n:TimeToDie() < 20 and t:BuffDown(e.VoidformBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) then
        return true
    end

end

local function Y(n)
                if (((q(n, false) and n:TimeToDie() >= 18 and ((n:DebuffUp(e.VampiricTouchDebuff) or not p) and w > 0)) or (e.Misery:IsAvailable() and n:DebuffRefreshable(e.ShadowWordPainDebuff)) or t:BuffUp(e.UnfurlingDarknessBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == f("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        d = 1263165
        return true
    elseif (((q(n, false) and n:TimeToDie() >= 18 and ((n:DebuffUp(e.VampiricTouchDebuff) or not p) and w > 0)) or (e.Misery:IsAvailable() and n:DebuffRefreshable(e.ShadowWordPainDebuff)) or t:BuffUp(e.UnfurlingDarknessBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and n:GUID() ~= a:GUID() and not _) then
        d = 999
                if d == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif d > 0 and endtime ~= nil and GetTime() > endtime then
            d = 0
        end

        return true
    elseif (((q(n, false) and n:TimeToDie() >= 18 and ((n:DebuffUp(e.VampiricTouchDebuff) or not p) and w > 0)) or (e.Misery:IsAvailable() and n:DebuffRefreshable(e.ShadowWordPainDebuff)) or t:BuffUp(e.UnfurlingDarknessBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == a:GUID()) then
        o = 263165
        return true
    elseif ((q(n, false) and n:TimeToDie() >= 18 and ((n:DebuffUp(e.VampiricTouchDebuff) or not p) and w > 0)) or (e.Misery:IsAvailable() and n:DebuffRefreshable(e.ShadowWordPainDebuff)) or t:BuffUp(e.UnfurlingDarknessBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) then
        return true
    end

end

local function re(n)
                if (((n:DebuffRefreshable(e.VampiricTouchDebuff) and (n:TimeToDie() > 18 or n:IsDummy() or n:NPCID() == 153285) and (n:DebuffUp(e.VampiricTouchDebuff) or not p) and w > 0) or (e.Misery:IsAvailable() and n:DebuffRefreshable(e.ShadowWordPainDebuff)) or t:BuffUp(e.UnfurlingDarknessBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == f("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        d = 134914
        return true
    elseif (((n:DebuffRefreshable(e.VampiricTouchDebuff) and (n:TimeToDie() > 18 or n:IsDummy() or n:NPCID() == 153285) and (n:DebuffUp(e.VampiricTouchDebuff) or not p) and w > 0) or (e.Misery:IsAvailable() and n:DebuffRefreshable(e.ShadowWordPainDebuff)) or t:BuffUp(e.UnfurlingDarknessBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and n:GUID() ~= a:GUID() and not _) then
        d = 999
                if d == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif d > 0 and endtime ~= nil and GetTime() > endtime then
            d = 0
        end

        return true
    elseif (((n:DebuffRefreshable(e.VampiricTouchDebuff) and (n:TimeToDie() > 18 or n:IsDummy() or n:NPCID() == 153285) and (n:DebuffUp(e.VampiricTouchDebuff) or not p) and w > 0) or (e.Misery:IsAvailable() and n:DebuffRefreshable(e.ShadowWordPainDebuff)) or t:BuffUp(e.UnfurlingDarknessBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == a:GUID()) then
        o = 34914
        return true
    elseif ((n:DebuffRefreshable(e.VampiricTouchDebuff) and (n:TimeToDie() > 18 or n:IsDummy() or n:NPCID() == 153285) and (n:DebuffUp(e.VampiricTouchDebuff) or not p) and w > 0) or (e.Misery:IsAvailable() and n:DebuffRefreshable(e.ShadowWordPainDebuff)) or t:BuffUp(e.UnfurlingDarknessBuff)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) then
        return true
    end

end

local function he(t)
                if ((t:DebuffRefreshable(e.ShadowWordPainDebuff) and t:TimeToDie() > 4 and not e.Misery:IsAvailable() and not (e.SearingNightmare:IsAvailable() and h > m) and (not e.PsychicLink:IsAvailable() or (e.PsychicLink:IsAvailable() and h <= 2))) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == f("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        d = 1589
        return true
    elseif ((t:DebuffRefreshable(e.ShadowWordPainDebuff) and t:TimeToDie() > 4 and not e.Misery:IsAvailable() and not (e.SearingNightmare:IsAvailable() and h > m) and (not e.PsychicLink:IsAvailable() or (e.PsychicLink:IsAvailable() and h <= 2))) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and t:GUID() ~= a:GUID() and not _) then
        d = 999
                if d == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif d > 0 and endtime ~= nil and GetTime() > endtime then
            d = 0
        end

        return true
    elseif ((t:DebuffRefreshable(e.ShadowWordPainDebuff) and t:TimeToDie() > 4 and not e.Misery:IsAvailable() and not (e.SearingNightmare:IsAvailable() and h > m) and (not e.PsychicLink:IsAvailable() or (e.PsychicLink:IsAvailable() and h <= 2))) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == a:GUID()) then
        o = 589
        return true
    elseif (t:DebuffRefreshable(e.ShadowWordPainDebuff) and t:TimeToDie() > 4 and not e.Misery:IsAvailable() and not (e.SearingNightmare:IsAvailable() and h > m) and (not e.PsychicLink:IsAvailable() or (e.PsychicLink:IsAvailable() and h <= 2))) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) then
        return true
    end

end

local function Y(t)
                if ((e.SearingNightmare:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff) and h > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == f("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        d = 148045
        return true
    elseif ((e.SearingNightmare:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff) and h > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and t:GUID() ~= a:GUID() and not _) then
        d = 999
                if d == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif d > 0 and endtime ~= nil and GetTime() > endtime then
            d = 0
        end

        return true
    elseif ((e.SearingNightmare:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff) and h > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) and t:GUID() == a:GUID()) then
        o = 48045
        return true
    elseif (e.SearingNightmare:IsAvailable() and t:DebuffRefreshable(e.ShadowWordPainDebuff) and h > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326) then
        return true
    end

end

local function Y(n)
                if ((t:Insanity() < 90 and ((q(n, true) and ((not e.VoidEruption:CooldownUp() or not u) or not e.HungeringVoid:IsAvailable())) or t:BuffUp(e.VoidformBuff)) and (not e.HungeringVoid:IsAvailable() or n:DebuffUp(e.HungeringVoidDebuff) or t:BuffDown(e.VoidformBuff)) and (not e.SearingNightmare:IsAvailable() or h < 5)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == f("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
        d = 1323673
        return true
    elseif ((t:Insanity() < 90 and ((q(n, true) and ((not e.VoidEruption:CooldownUp() or not u) or not e.HungeringVoid:IsAvailable())) or t:BuffUp(e.VoidformBuff)) and (not e.HungeringVoid:IsAvailable() or n:DebuffUp(e.HungeringVoidDebuff) or t:BuffDown(e.VoidformBuff)) and (not e.SearingNightmare:IsAvailable() or h < 5)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and n:GUID() ~= a:GUID() and not _) then
        d = 999
                if d == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif d > 0 and endtime ~= nil and GetTime() > endtime then
            d = 0
        end

        return true
    elseif ((t:Insanity() < 90 and ((q(n, true) and ((not e.VoidEruption:CooldownUp() or not u) or not e.HungeringVoid:IsAvailable())) or t:BuffUp(e.VoidformBuff)) and (not e.HungeringVoid:IsAvailable() or n:DebuffUp(e.HungeringVoidDebuff) or t:BuffDown(e.VoidformBuff)) and (not e.SearingNightmare:IsAvailable() or h < 5)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) and n:GUID() == a:GUID()) then
        o = 323673
        return true
    elseif (t:Insanity() < 90 and ((q(n, true) and ((not e.VoidEruption:CooldownUp() or not u) or not e.HungeringVoid:IsAvailable())) or t:BuffUp(e.VoidformBuff)) and (not e.HungeringVoid:IsAvailable() or n:DebuffUp(e.HungeringVoidDebuff) or t:BuffDown(e.VoidformBuff)) and (not e.SearingNightmare:IsAvailable() or h < 5)) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285 or n:NPCID() == 168326) then
        return true
    end

end

local function Y(e)
    return e:HealthPercentage()
end

local function Y(o)
                if ((t:BuffUp(e.PowerInfusionBuff) or not i.Shadow.SelfPI or n.ShadowedOrbofTorment:IsEquipped()) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) and o:GUID() == f("mouseover"):GUID() and i.Shadow.TargetSwap == "Mouseover") then
                if n.SoullettingRuby:ID() == GetInventoryItemID("player", 13) then
            d = 241
            return true
        elseif n.SoullettingRuby:ID() == GetInventoryItemID("player", 14) then
            d = 251
            return true
        end

    elseif ((t:BuffUp(e.PowerInfusionBuff) or not i.Shadow.SelfPI or n.ShadowedOrbofTorment:IsEquipped()) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) and i.Shadow.TargetSwap == "AutoSwap" and o:GUID() ~= a:GUID() and not _) then
        d = 999
        return true
    elseif ((t:BuffUp(e.PowerInfusionBuff) or not i.Shadow.SelfPI or n.ShadowedOrbofTorment:IsEquipped()) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) and o:GUID() == a:GUID()) then
                if n.SoullettingRuby:ID() == GetInventoryItemID("player", 13) then
            d = 241
            return true
        elseif n.SoullettingRuby:ID() == GetInventoryItemID("player", 14) then
            d = 251
            return true
        end

    elseif (t:BuffUp(e.PowerInfusionBuff) or not i.Shadow.SelfPI or n.ShadowedOrbofTorment:IsEquipped()) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326) then
        return true
    end

end

local function ce()
    if E.TargetIsValid() and not t:IsDeadOrGhost() and not t:AffectingCombat() and ((P) or (i.Commons.DBMSupport and l.BossMods:GetPullTimer() < b + t:GCD() and l.BossMods:GetPullTimer() > 0)) and not t:IsMoving() then
        if e.Fleshcraft:IsCastable() and (r == 0 or r > e.Fleshcraft:ExecuteTime()) and T and not t:IsMoving() and (e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled()) then
            if s(e.Fleshcraft, nil, nil) then
                o = 324631
                return "fleshcraft precombat 1"
            end

        end

        if e.ArcaneTorrent:IsCastable() and c() then
            if s(e.ArcaneTorrent, nil, nil, not a:IsSpellInRange(e.ArcaneTorrent)) then
                o = 28730
                return "arcane_torrent 6"
            end

        end

        if (i.Commons.Enabled.TopTrinket or i.Commons.Enabled.BottomTrinket) and n.ShadowedOrbofTorment:IsEquippedAndReady() and (r == 0 or r > 2) then
            if s(n.ShadowedOrbofTorment, nil, nil) then
                                if n.ShadowedOrbofTorment:ID() == k and i.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket 1"
                elseif n.ShadowedOrbofTorment:ID() == v and i.Commons.Enabled.BottomTrinket then
                    o = 30
                    return "top trinket 2"
                end

            end

        end

        m = 2
        if e.VampiricTouch:IsCastable() and (r == 0 or r > e.VampiricTouch:CastTime() + .5) and (not e.Damnation:IsAvailable()) then
            if s(e.VampiricTouch, nil, nil, not a:IsSpellInRange(e.VampiricTouch)) then
                o = 34914
                return "vampiric_touch 10"
            end

        end

        if e.MindBlast:IsReady() and (r == 0 or r > e.MindBlast:CastTime() + .5) and (e.Damnation:IsAvailable()) then
            if s(e.MindBlast, nil, nil, not a:IsSpellInRange(e.MindBlast)) then
                o = 8092
                return "mind_blast 11"
            end

        end

        if e.MindBlast:IsCastable() and (r == 0 or r > e.MindBlast:CastTime() + .5) and (e.Misery:IsAvailable() and (not C or not e.VoidTorrent:IsAvailable())) then
            if s(e.MindBlast, nil, nil, not a:IsSpellInRange(e.MindBlast)) then
                o = 8092
                return "mind_blast 12"
            end

        end

        if e.VoidTorrent:IsCastable() and (r == 0 or r > 3 + .5) and D and (e.Misery:IsAvailable() and C) then
            if s(e.VoidTorrent, nil, nil, not a:IsSpellInRange(e.VoidTorrent)) then
                o = 263165
                return "void_torrent 14"
            end

        end

        if e.MindFlay:IsCastable() and (r == 0 or r > 1) and not t:IsChanneling(e.MindFlay) and h <= m and (e.Misery:IsAvailable() and C and not e.VoidTorrent:IsAvailable()) then
            if s(e.MindFlay, nil, nil, not a:IsSpellInRange(e.MindFlay)) then
                o = 15407
                return "mind_flay 15"
            end

        end

        if e.ShadowWordPain:IsCastable() and (not e.Misery:IsAvailable()) then
            if s(e.ShadowWordPain, nil, nil, not a:IsSpellInRange(e.ShadowWordPain)) then
                o = 589
                return "shadow_word_pain 16"
            end

        end

    end

end

local function Y()
    if n.ScarsofFraternalStrife:IsEquippedAndReady() and c() and ((t:BuffDown(e.ScarsofFraternalStrifeBuff4) and U > 1) or (t:BuffUp(e.VoidformBuff) or t:BuffUp(e.PowerInfusionBuff) or e.VoidEruption:CooldownRemains() > 10)) then
        if s(n.ScarsofFraternalStrife, nil, nil) then
                        if n.ScarsofFraternalStrife:ID() == k and i.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket 1"
            elseif n.ScarsofFraternalStrife:ID() == v and i.Commons.Enabled.BottomTrinket then
                o = 30
                return "top trinket 2"
            end

        end

    end

    if n.EmpyrealOrdinance:IsEquippedAndReady() and c() and ((e.VoidEruption:CooldownRemains() <= 12 and u) or (e.VoidEruption:CooldownRemains() > 27 or not u)) then
        if s(n.EmpyrealOrdinance, nil, nil, not a:IsInRange(40)) then
                        if n.EmpyrealOrdinance:ID() == k and i.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket 1"
            elseif n.EmpyrealOrdinance:ID() == v and i.Commons.Enabled.BottomTrinket then
                o = 30
                return "top trinket 2"
            end

        end

    end

    if n.InscrutableQuantumDevice:IsEquippedAndReady() and c() and (t:BuffUp(e.VoidformBuff) and t:BuffUp(e.PowerInfusionBuff) or g.BossFilteredFightRemains("<=", 20) or t:BuffUp(e.PowerInfusionBuff) and (g.BossFilteredFightRemains("<", e.VoidEruption:CooldownRemains() + 15) or not u) or t:BuffUp(e.VoidformBuff) and (g.BossFilteredFightRemains("<", e.PowerInfusion:CooldownRemains() + 15) or not N) or ((e.PowerInfusion:CooldownRemains() >= 10 or not N) and (e.VoidEruption:CooldownRemains() >= 10 or not u)) and g.BossFilteredFightRemains(">=", 190)) then
        if s(n.InscrutableQuantumDevice, nil, nil) then
                        if n.InscrutableQuantumDevice:ID() == k and i.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket 1"
            elseif n.InscrutableQuantumDevice:ID() == v and i.Commons.Enabled.BottomTrinket then
                o = 30
                return "top trinket 2"
            end

        end

    end

    if n.MacabreSheetMusic:IsEquippedAndReady() and c() and (e.VoidEruption:CooldownRemains() > 10 or not u) then
        if s(n.MacabreSheetMusic, nil, nil) then
                        if n.MacabreSheetMusic:ID() == k and i.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket 1"
            elseif n.MacabreSheetMusic:ID() == v and i.Commons.Enabled.BottomTrinket then
                o = 30
                return "top trinket 2"
            end

        end

    end

    if n.SoullettingRuby:IsEquippedAndReady() and c() and (t:BuffUp(e.PowerInfusionBuff) or not i.Shadow.SelfPI or n.ShadowedOrbofTorment:IsEquipped()) then
        if s(n.SoullettingRuby, nil, nil) then
                        if n.SoullettingRuby:ID() == k and i.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket 1"
            elseif n.SoullettingRuby:ID() == v and i.Commons.Enabled.BottomTrinket then
                o = 30
                return "top trinket 2"
            end

        end

    end

    if n.TheFirstSigil:IsEquippedAndReady() and c() and (t:BuffUp(e.VoidformBuff) or t:BuffUp(e.PowerInfusionBuff) or (not i.Shadow.SelfPI) or e.VoidEruption:CooldownRemains() > 10 or (n.SoullettingRuby:IsEquipped() and not n.SoullettingRuby:IsReady()) or z < 20) then
        if s(n.TheFirstSigil, nil, nil) then
                        if n.TheFirstSigil:ID() == k and i.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket 1"
            elseif n.TheFirstSigil:ID() == v and i.Commons.Enabled.BottomTrinket then
                o = 30
                return "top trinket 2"
            end

        end

    end

    if n.SinfulGladiatorsBadgeofFerocity:IsEquippedAndReady() and c() and (e.VoidEruption:CooldownRemains() >= 10 or not u) then
        if s(n.SinfulGladiatorsBadgeofFerocity, nil, nil) then
                        if n.SinfulGladiatorsBadgeofFerocity:ID() == k and i.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket 1"
            elseif n.SinfulGladiatorsBadgeofFerocity:ID() == v and i.Commons.Enabled.BottomTrinket then
                o = 30
                return "top trinket 2"
            end

        end

    end

    if n.ShadowedOrbofTorment:IsEquippedAndReady() and c() and (r == 0 or r > 2.5) and ((e.PowerInfusion:CooldownRemains() <= 10 and N and e.VoidEruption:CooldownRemains() <= 10 and u and (I == 4 or I == 1)) or ((I == 2 or I == 3) and (t:BuffDown(e.VoidformBuff) or t:PrevGCD(1, e.VoidBolt)))) then
        if s(n.ShadowedOrbofTorment, nil, nil) then
                        if n.ShadowedOrbofTorment:ID() == k and i.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket 1"
            elseif n.ShadowedOrbofTorment:ID() == v and i.Commons.Enabled.BottomTrinket then
                o = 30
                return "top trinket 2"
            end

        end

    end

    if n.ArchitectsIngenuityCore:IsEquippedAndReady() and c() then
        if s(n.ArchitectsIngenuityCore, nil, nil, not a:IsInRange(30)) then
                        if n.ArchitectsIngenuityCore:ID() == k and i.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket 1"
            elseif n.ArchitectsIngenuityCore:ID() == v and i.Commons.Enabled.BottomTrinket then
                o = 30
                return "top trinket 2"
            end

        end

    end

    if c() and (t:BuffUp(e.VoidformBuff) or t:BuffUp(e.PowerInfusionBuff) or (e.VoidEruption:CooldownRemains() > 10 or not u)) then
        local e = t:GetUseableTrinkets(de)
        if e then
            if s(e, nil, nil) then
                                if e:ID() == k and i.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket 1"
                elseif e:ID() == v and i.Commons.Enabled.BottomTrinket then
                    o = 30
                    return "top trinket 2"
                end

            end

        end

    end

end

local function ue()
    if e.PowerInfusion:IsCastable() and N and not t:IsMoving() and (i.Shadow.SelfPI and (t:BuffUp(e.VoidformBuff) or (t:Covenant() ~= "Kyrian" and t:Covenant() ~= "Necrolord" and (e.VoidEruption:CooldownRemains() >= 10 or not u)) or (z < e.VoidEruption:CooldownRemains()) or not u) and (((z >= e.VoidEruption:CooldownRemains() + 15 and u) and (e.VoidEruption:CooldownRemains() <= t:GCD() * 4 and u)) or (z > e.PowerInfusion:Cooldown() and N) or (z < (e.VoidEruption:CooldownRemains() + 15) or not u) or I == 1 or t:BloodlustUp())) then
        if s(e.PowerInfusion, nil) then
            o = 10060
            return "power_infusion 50"
        end

    end

    if e.FaeGuardians:IsReady() and T and ((t:BuffDown(e.VoidformBuff) and ((not e.VoidTorrent:CooldownUp() or not D) or not e.VoidTorrent:IsAvailable()) and ((A and h == 1) or (p and h > 1))) or (t:BuffUp(e.VoidformBuff) and (e.GroveInvigoration:IsAvailable() or e.FieldofBlossoms:IsAvailable()))) then
        if s(e.FaeGuardians, nil) then
            o = 327661
            return "fae_guardians 52"
        end

    end

    if e.Mindgames:IsReady() and (r == 0 or r > e.Mindgames:CastTime() + .5) and not t:IsMoving() and T then
        if (t:Insanity() < 90 and ((q(a, true) and ((not e.VoidEruption:CooldownUp() or not u) or not e.HungeringVoid:IsAvailable())) or t:BuffUp(e.VoidformBuff)) and (not e.HungeringVoid:IsAvailable() or a:DebuffRemains(e.HungeringVoidDebuff) > e.Mindgames:CastTime() or t:BuffDown(e.VoidformBuff)) and (not e.SearingNightmare:IsAvailable() or h < 5)) then
            if s(e.Mindgames, nil, nil, not a:IsSpellInRange(e.Mindgames)) then
                o = 323673
                return "mindgames 54"
            end

        end

    end

    if e.UnholyNova:IsReady() and T and ((not e.HungeringVoid:IsAvailable() and A) or (a:DebuffUp(e.HungeringVoidDebuff) and t:BuffUp(e.VoidformBuff)) or (((e.VoidEruption:CooldownRemains() > 10 or not u) or not O) and t:BuffDown(e.VoidformBuff))) then
        if s(e.UnholyNova, nil, nil, not a:IsSpellInRange(e.UnholyNova)) then
            o = 324724
            return "Shadow_nova 56"
        end

    end

    if e.BoonoftheAscended:IsCastable() and (r == 0 or r > e.BoonoftheAscended:CastTime() + .5) and T and (t:BuffDown(e.VoidformBuff) and (not e.VoidEruption:CooldownUp() or not u) and h > 1 and not e.SearingNightmare:IsAvailable() or (t:BuffUp(e.VoidformBuff) and h < 2 and not e.SearingNightmare:IsAvailable() and (t:PrevGCD(1, e.VoidBolt) and (not n.EmpyrealOrdinance:IsEquipped() or not e.HungeringVoid:IsAvailable()) or n.EmpyrealOrdinance:IsEquipped() and n.EmpyrealOrdinance:CooldownRemains() <= 162 and a:DebuffUp(e.HungeringVoidDebuff))) or (t:BuffUp(e.VoidformBuff) and e.SearingNightmare:IsAvailable())) then
        if s(e.BoonoftheAscended, nil) then
            o = 325013
            return "boon_of_the_ascended 58"
        end

    end

    if (true) then
        local e = Y()
        if e then
            return e
        end

    end

    if e.Fleshcraft:IsCastable() and T and (r == 0 or r > t:GCD() * 1.25) and i.Shadow.CastCancelFC and (e.VolatileSolvent:SoulbindEnabled() and t:BuffRemains(e.VolatileSolventHumanBuff) < 10 and t:BuffDown(e.VoidformBuff) and t:BuffDown(e.PowerInfusionBuff)) then
        if s(e.Fleshcraft, nil, nil) then
            o = 324631
            return "fleshcraft 60"
        end

    end

end

local function de()
    if e.AscendedBlast:IsReady() and (h <= 3) then
        if s(e.AscendedBlast, nil, nil, not a:IsSpellInRange(e.AscendedBlast)) then
            o = 235283
            return "ascended_blast 70"
        end

    end

    if e.AscendedNova:IsReady() and (#ne > 1 and h > (1 + x(e.SearingNightmare:IsAvailable()))) then
        if s(e.AscendedNova, nil, nil, not a:IsInRange(8)) then
            o = 325020
            return "ascended_nova 72"
        end

    end

end

local function Y()
    if e.MindBlast:IsCastable() and (t:IsChanneling()) then
        if ((t:HasTier(28, 4) and t:BuffUp(e.DarkThoughtBuff) and e.Mindbender:TimeSinceLastCast() < 15 and y and t:BuffDown(e.VoidformBuff) and t:BuffRemains(e.LivingShadowBuff) < z) or (t:BuffUp(e.DarkThoughtBuff) and t:BuffRemains(e.LivingShadowBuff) < t:GCD() * (3 + x(t:BuffDown(e.VoidformBuff)) * 16) and t:BuffRemains(e.LivingShadowBuff) < z)) then
            if s(e.MindBlast, nil, nil, not a:IsSpellInRange(e.MindBlast)) then
                o = 8092
                return "mind_blast 84"
            end

        end

    end

    if e.SearingNightmare:IsReady() and t:IsChanneling(e.MindSear) and ((M and not O) or (Z > 0 and h > 1) or t:Insanity() > 85) then
        if s(e.SearingNightmare, nil, nil, not a:IsInRange(40)) then
            o = 341385
            return "searing_nightmare 80"
        end

    end

    if e.SearingNightmare:IsReady() and t:IsChanneling(e.MindSear) and (Z > 0 and h > 2) then
        if s(e.SearingNightmare, nil, nil, not a:IsInRange(40)) then
            o = 341385
            return "searing_nightmare 82"
        end

    end

    if e.MindBlast:IsCastable() and (t:BuffUp(e.DarkThoughtBuff) and (t:IsChanneling())) and not t:HasTier(28, 4) then
        if s(e.MindBlast, nil, nil, not a:IsSpellInRange(e.MindBlast)) then
            o = 8092
            return "mind_blast 84"
        end

    end

end

local function le()
    if (t:BuffUp(e.BoonoftheAscendedBuff)) then
        local e = de()
        if e then
            return e
        end

    end

    if e.VoidBolt:CooldownUp() and (t:BuffUp(e.DissonantEchoesBuff)) then
        if s(e.VoidBolt, nil, nil, not a:IsInRange(40)) then
            o = 214771
            return "void_bolt 90"
        end

    end

    if e.VoidEruption:IsReady() and (r == 0 or r > e.VoidEruption:CastTime() + .5) and u and not t:IsMoving() and (O and (t:Insanity() >= 25 + (15 * (x(t:Race() == "BloodElf" and U < 30))) or (e.Mindbender:TimeSinceLastCast() <= 15 and y and (not e.MindBlast:CooldownUp() or t:IsCasting(e.MindBlast)) and not e.ShadowWordDeath:CooldownUp())) and (t:Insanity() <= 85 or (e.SearingNightmare:IsAvailable() and M))) then
        if s(e.VoidEruption, nil, nil, not a:IsSpellInRange(e.VoidEruption)) then
            o = 228260
            return "void_eruption 92"
        end

    end

    if e.ShadowWordPain:IsCastable() and (t:BuffUp(e.FaeGuardiansBuff) and a:DebuffDown(e.WrathfulFaerieDebuff) and h < 4) then
        if e.Misery:IsAvailable() and a:TimeToDie() >= 18 then
            if s(e.VampiricTouch, nil, nil, not a:IsSpellInRange(e.VampiricTouch)) then
                o = 34914
                return "vampiric_touch 94"
            end

        else
            if s(e.ShadowWordPain, nil, nil, not a:IsSpellInRange(e.ShadowWordPain)) then
                o = 589
                return "shadow_word_pain 94"
            end

        end

    end

    if e.MindSear:IsCastable() and (r == 0 or r > 1) and not t:IsMoving() and not t:IsChanneling(e.MindSear) and (e.SearingNightmare:IsAvailable() and h > m and ee > 0 and (not H:CooldownUp() or not R) and h >= 4) then
        if s(e.MindSear, nil, nil, not a:IsSpellInRange(e.MindSear)) then
            o = 48045
            return "mind_sear 97"
        end

    end

    if (true) then
        local e = ue()
        if e then
            return e
        end

    end

    if e.MindSear:IsCastable() and (r == 0 or r > 1) and not t:IsMoving() and not t:IsChanneling(e.MindSear) and (e.SearingNightmare:IsAvailable() and h > m and ee > 0 and (not H:CooldownUp() or not R)) then
        if s(e.MindSear, nil, nil, not a:IsSpellInRange(e.MindSear)) then
            o = 48045
            return "mind_sear 97"
        end

    end

    if e.Damnation:IsCastable() then
        if E.CastCycle(e.Damnation, L, ve, not a:IsSpellInRange(e.Damnation)) then
            o = 341374
            return "damnation 98"
        end

    end

    if e.ShadowWordDeath:IsReady() and e.Mindbender:TimeSinceLastCast() <= 15 and y and 15 - e.Mindbender:TimeSinceLastCast() <= (t:GCD() + .5) and h <= 7 then
        if s(e.ShadowWordDeath, nil, nil, not a:IsSpellInRange(e.ShadowWordDeath)) then
            o = 136149
            return "shadow_word_death 99"
        end

    end

    if e.MindBlast:IsCastable() and (r == 0 or r > e.MindBlast:CastTime() + .5) and (not t:IsMoving() or t:BuffUp(e.DarkThoughtBuff)) and (e.MindBlast:CastTime() < e.VoidBolt:CooldownRemains() or (t:BuffUp(e.DarkThoughtBuff) and e.VoidBolt:CooldownRemains() > t:GCD() * 1.1) or t:BuffDown(e.VoidformBuff)) and ((e.MindBlast:Charges() > 1 and (a:DebuffUp(e.HungeringVoidDebuff) or not e.HungeringVoid:IsAvailable())) or (15 - e.Mindbender:TimeSinceLastCast() <= e.MindBlast:CastTime() + t:GCD() and e.Mindbender:TimeSinceLastCast() <= 15 and y and 15 - e.Mindbender:TimeSinceLastCast() > e.MindBlast:CastTime() and h <= 7) or (t:BuffUp(e.DarkThoughtBuff) and t:BuffUp(e.VoidformBuff) and (not e.VoidBolt:CooldownUp()) and ((not y) or e.Mindbender:TimeSinceLastCast() > 15) and t:HasTier(28, 4))) then
        if s(e.MindBlast, nil, nil, not a:IsSpellInRange(e.MindBlast)) then
            o = 8092
            return "mind_blast 100"
        end

    end

    if e.VoidBolt:IsCastable() and (h < 4 or (e.HungeringVoid:IsAvailable() and h <= 6)) and (t:Insanity() <= 85 and e.HungeringVoid:IsAvailable() and e.SearingNightmare:IsAvailable() and h <= 6 or ((e.HungeringVoid:IsAvailable() and not e.SearingNightmare:IsAvailable()) or h == 1)) then
        if s(e.VoidBolt, nil, nil, not a:IsInRange(40)) then
            o = 214771
            return "void_bolt 101"
        end

    end

    if e.DevouringPlague:IsReady() and (t:HasTier(28, 4) or e.HungeringVoid:IsAvailable()) and e.SearingNightmare:IsAvailable() and e.Mindbender:TimeSinceLastCast() <= 15 and y and t:BuffUp(e.VoidformBuff) and h <= 6 then
        if s(e.DevouringPlague, nil, nil, not a:IsSpellInRange(e.DevouringPlague)) then
            o = 335467
            return "devouring_plague 102"
        end

    end

    if e.DevouringPlague:IsReady() and ((a:DebuffRefreshable(e.DevouringPlagueDebuff) or t:Insanity() > 75 or (h > 3 and e.Misery:IsAvailable()) or (e.VoidTorrent:IsAvailable() and e.VoidTorrent:CooldownRemains() <= (3 * t:GCD()) and D)) and (not O or t:Insanity() >= 85) and (not e.SearingNightmare:IsAvailable() or (e.SearingNightmare:IsAvailable() and not M))) then
        if s(e.DevouringPlague, nil, nil, not a:IsSpellInRange(e.DevouringPlague)) then
            o = 335467
            return "devouring_plague 102"
        end

    end

    if e.VoidBolt:IsCastable() and (h < 4 or (e.HungeringVoid:IsAvailable() and h <= 6)) and (h < (4 + x(e.DissonantEchoes:ConduitEnabled())) and t:Insanity() <= 85 and e.SearingNightmare:IsAvailable() or not e.SearingNightmare:IsAvailable()) then
        if s(e.VoidBolt, nil, nil, not a:IsInRange(40)) then
            o = 214771
            return "void_bolt 103"
        end

    end

    if e.ShadowWordDeath:IsReady() and a:IsSpellInRange(e.ShadowWordDeath) and ((a:HealthPercentage() < 20 and h < 4) or (e.Mindbender:TimeSinceLastCast() <= 15 and y and h <= 7)) then
        if s(e.ShadowWordDeath, nil) then
            o = 136149
            return "shadow_word_death 104"
        end

    end

    if e.ShadowWordDeath:IsReady() and h < 4 then
        if E.CastCycle(e.ShadowWordDeath, L, be, not a:IsSpellInRange(e.ShadowWordDeath), nil) then
            return "shadow_word_death 104"
        end

    end

    if e.SurrenderToMadness:IsCastable() then
        if E.CastCycle(e.SurrenderToMadness, L, me, not a:IsSpellInRange(e.SurrenderToMadness), i.Shadow.OffGCDasOffGCD.SurrenderToMadness) then
            return "surrender_to_madness 106"
        end

    end

    if e.VoidTorrent:IsCastable() and (r == 0 or r > 3 + .5) and D and not t:IsMoving() then
        if (q(a, false) and a:TimeToDie() > 3 and (t:BuffDown(e.VoidformBuff) or (t:BuffRemains(e.VoidformBuff) < e.VoidBolt:CooldownRemains() + .5) or (t:PrevGCD(1, e.VoidBolt) and 3 <= e.VoidBolt:CooldownRemains()) and not t:BloodlustUp() and h < 3) and p and h < (5 + (6 * x(e.TwistofFate:IsAvailable())))) then
            if s(e.VoidTorrent, nil) then
                o = 263165
                return "void_torrent 107"
            end

        end

    end

    if H:IsCastable() and R and ((e.SearingNightmare:IsAvailable() and h > m) or a:DebuffUp(e.ShadowWordPainDebuff)) and (p) then
        if s(e.Mindbender, nil, nil, not a:IsSpellInRange(e.Mindbender)) then
            o = 200174
            return "shadowfiend/mindbender 108"
        end

    end

    if e.ShadowWordDeath:IsReady() and (se and A and a:TimeToX(20) > e.ShadowWordDeath:Cooldown() + t:GCD()) then
        if s(e.ShadowWordDeath, nil, nil, not a:IsSpellInRange(e.ShadowWordDeath)) then
            o = 136149
            return "shadow_word_death 112"
        end

    end

    if e.ShadowCrash:IsCastable() and X then
        if s(e.ShadowCrash, nil, nil, not a:IsInRange(40)) then
            o = 205385
            return "shadow_crash 114"
        end

    end

    if e.MindSear:IsCastable() and (r == 0 or r > 1) and not t:IsMoving() and not t:IsChanneling(e.MindSear) and (h > m and t:BuffUp(e.DarkThoughtBuff)) then
        if s(e.MindSear, nil, nil, not a:IsSpellInRange(e.MindSear)) then
            o = 48045
            return "mind_sear 118"
        end

    end

    if e.MindFlay:IsCastable() and (r == 0 or r > 1) and h <= m and not t:IsMoving() and not t:IsChanneling(e.MindFlay) and (t:BuffUp(e.DarkThoughtBuff) and A and not (t:BuffUp(e.VoidformBuff) and not O and e.MindBlast:FullRechargeTime() >= t:GCD() + .15)) then
        if s(e.MindFlay, nil, nil, not a:IsSpellInRange(e.MindFlay)) then
            o = 15407
            return "mind_flay 120"
        end

    end

    if e.DevouringPlague:IsReady() and (h < 3 or t:BuffUp(e.VoidformBuff)) and h < 4 and (C and A and not ae) then
        if s(e.DevouringPlague, nil, nil, not a:IsSpellInRange(e.DevouringPlague)) then
            o = 335467
            return "devouring_plague 121"
        end

    end

    if e.MindBlast:IsCastable() and (r == 0 or r > e.MindBlast:CastTime() + .5) and (not t:IsMoving() or t:BuffUp(e.DarkThoughtBuff)) and (e.VoidBolt:CooldownRemains() >= e.MindBlast:CastTime() or not t:BuffUp(e.VoidformBuff)) and (A and h < (4 + 2 * x(e.Misery:IsAvailable()) + e.VampiricTouchDebuff:AuraActiveCount() * x(e.PsychicLink:IsAvailable()) + we(5, h) * x(e.Mindbender:TimeSinceLastCast() <= 15 and y)) and (not y or ((not H:CooldownUp() or not R) and y) or p)) then
        if s(e.MindBlast, nil, nil, not a:IsSpellInRange(e.MindBlast)) then
            o = 8092
            return "mind_blast 122"
        end

    end

    if e.VampiricTouch:IsCastable() and (r == 0 or r > e.VampiricTouch:CastTime() + .5) and not t:IsMoving() and not t:IsCasting(e.VampiricTouch) and a:IsSpellInRange(e.VampiricTouch) and ((a:DebuffRefreshable(e.VampiricTouchDebuff) and (a:TimeToDie() > 18 or a:IsDummy() or a:NPCID() == 153285) and (a:DebuffUp(e.VampiricTouchDebuff) or not p) and w > 0) or (e.Misery:IsAvailable() and a:DebuffRefreshable(e.ShadowWordPainDebuff)) or t:BuffUp(e.UnfurlingDarknessBuff)) then
        if s(e.VampiricTouch, nil) then
            o = 34914
            return "vampiric_touch 124"
        end

    end

    if e.VampiricTouch:IsCastable() and (r == 0 or r > e.VampiricTouch:CastTime() + .5) and not t:IsMoving() and (h <= 4 or (h < 7 and t:Insanity() < 30 and t:BuffDown(e.DarkThoughtBuff))) then
        if E.CastCycle(e.VampiricTouch, L, re, not a:IsSpellInRange(e.VampiricTouch)) then
            return "vampiric_touch 124"
        end

    end

    if e.ShadowWordPain:IsCastable() and h < 4 and (a:DebuffRefreshable(e.ShadowWordPainDebuff) and a:TimeToDie() > 4 and not e.Misery:IsAvailable() and e.PsychicLink:IsAvailable() and h > 2) then
        if s(e.ShadowWordPain, nil, nil, not a:IsSpellInRange(e.ShadowWordPain)) then
            o = 589
            return "shadow_word_pain 126"
        end

    end

    if e.ShadowWordPain:IsCastable() and (a:DebuffRefreshable(e.ShadowWordPainDebuff) and a:IsSpellInRange(e.ShadowWordPain) and (a:TimeToDie() > 4 or a:IsDummy() or a:NPCID() == 153285) and not e.Misery:IsAvailable() and not (e.SearingNightmare:IsAvailable() and h > m) and (not e.PsychicLink:IsAvailable() or (e.PsychicLink:IsAvailable() and h <= 2))) then
        if s(e.ShadowWordPain, nil) then
            o = 589
            return "shadow_word_pain 128"
        end

    end

    if e.ShadowWordPain:IsCastable() and h <= 4 and (not e.Misery:IsAvailable()) then
        if E.CastCycle(e.ShadowWordPain, L, he, not a:IsSpellInRange(e.ShadowWordPain)) then
            return "shadow_word_pain 128"
        end

    end

    if e.MindSear:IsCastable() and (r == 0 or r > 1) and not t:IsMoving() and not t:IsChanneling(e.MindSear) and (h > m) and (e.VoidBolt:CooldownRemains() >= t:GCD() * .75 or not t:BuffUp(e.VoidformBuff) or h > 6) then
        if s(e.MindSear, nil, nil, not a:IsSpellInRange(e.MindSear)) then
            o = 48045
            return "mind_sear 130"
        end

    end

    if e.MindFlay:IsCastable() and (r == 0 or r > 1) and not t:IsMoving() and h <= m and not t:IsChanneling(e.MindFlay) and (t:BuffDown(e.DarkThoughtBuff) or (e.VoidBolt:CooldownUp() and (t:BuffUp(e.VoidformBuff) or (t:BuffDown(e.DarkThoughtBuff) and t:BuffUp(e.DissonantEchoesBuff))))) and (e.VoidBolt:CooldownRemains() >= t:GCD() * .75 or not t:BuffUp(e.VoidformBuff)) then
        if s(e.MindFlay, nil, nil, not a:IsSpellInRange(e.MindFlay)) then
            o = 15407
            return "mind_flay 132"
        end

    end

    if e.ShadowWordDeath:IsReady() and t:IsMoving() then
        if s(e.ShadowWordDeath, nil, nil, not a:IsSpellInRange(e.ShadowWordDeath)) then
            o = 136149
            return "shadow_word_death 133"
        end

    end

    if e.ShadowWordPain:IsCastable() and t:IsMoving() then
        if s(e.ShadowWordPain, nil, nil, not a:IsSpellInRange(e.ShadowWordPain)) then
            o = 589
            return "shadow_word_pain 134"
        end

    end

end

local function C()
    P = HeroRotationCharDB.Toggles[6]
    T = HeroRotationCharDB.Toggles[4]
    S = HeroRotationCharDB.Toggles[5]
    _ = HeroRotationCharDB.Toggles[12]
    te = not HeroRotationCharDB.Toggles[15]
    ie = HeroRotationCharDB.Toggles[60]
    Q = HeroRotationCharDB.Toggles[61]
    K = HeroRotationCharDB.Toggles[62]
    N = false
    u = false
    D = false
    X = false
    R = false
    if ((i.Shadow.PowerInfusion == "CDs" and c()) or (i.Shadow.PowerInfusion == "Small CDs" and (c() or S)) or (i.Shadow.PowerInfusion == "Always")) then
        N = true
    end

    if ((i.Shadow.VoidEruption == "CDs" and c()) or (i.Shadow.VoidEruption == "Small CDs" and (c() or S)) or (i.Shadow.VoidEruption == "Always")) then
        u = true
    end

    if ((i.Shadow.VoidTorrent == "CDs" and c()) or (i.Shadow.VoidTorrent == "Small CDs" and (c() or S)) or (i.Shadow.VoidTorrent == "Always")) then
        D = true
    end

    if ((i.Shadow.MindBender == "CDs" and c()) or (i.Shadow.MindBender == "Small CDs" and (c() or S)) or (i.Shadow.MindBender == "Always")) then
        R = true
    end

    if ((i.Shadow.ShadowCrash == "CDs" and c()) or (i.Shadow.ShadowCrash == "Small CDs" and (c() or S)) or (i.Shadow.ShadowCrash == "Always")) then
        X = true
    end

    r = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                r = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

    b = 0
    if e.Fleshcraft:IsCastable() and (r == 0 or r > e.Fleshcraft:ExecuteTime()) and T and not t:IsMoving() and (e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled()) then
        b = b + 3
    end

    if e.ArcaneTorrent:IsCastable() and c() then
        b = b + t:GCD()
    end

    if ((n.ShadowedOrbofTorment:ID() == k and i.Commons.Enabled.TopTrinket) or (n.ShadowedOrbofTorment:ID() == v and i.Commons.Enabled.BottomTrinket)) and n.ShadowedOrbofTorment:IsEquippedAndReady() and (r == 0 or r > 2) then
        b = b + 2
    end

    if e.VampiricTouch:IsCastable() and (r == 0 or r > e.VampiricTouch:CastTime() + .5) and (not e.Damnation:IsAvailable()) then
        b = b + e.VampiricTouch:CastTime()
    end

    if e.MindBlast:IsReady() and (r == 0 or r > e.MindBlast:CastTime() + .5) and (e.Damnation:IsAvailable()) then
        b = b + e.MindBlast:CastTime()
    end

end

local function T()
    ne = t:GetEnemiesInMeleeRange(8)
    ye = t:GetEnemiesInRange(30)
    L = t:GetEnemiesInRange(40)
    W = a:GetEnemiesInSplashRange(15)
    k, oe = GetInventoryItemID("player", 13)
    v, oe = GetInventoryItemID("player", 14)
        if G() and i.Commons.AoeMode == "Conservative" then
        F = a:GetEnemiesInSplashRangeCount(8)
        h = a:GetEnemiesInSplashRangeCount(15)
    elseif G() and i.Commons.AoeMode == "Aggresive" then
        local t = 0
        for e = 1, 20 do
            local e = "nameplate" .. e
            if UnitExists(e) then
                if UnitCanAttack("player", e) then
                    if (UnitCanAttack("player", e) and UnitAffectingCombat("target") and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil) or f(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) or string.find(UnitGUID(e), 182778) or string.find(UnitGUID(e), 183945) then
                        t = (t + 1)
                    end

                end

            end

        end

        F = t
        h = t
    end

    local y = 0
    for e = 1, 20 do
        local e = "nameplate" .. e
        if UnitExists(e) then
            if UnitCanAttack("player", e) then
                if (UnitCanAttack("player", e) and UnitAffectingCombat("target") and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil and f(e):TimeToDie() >= 12) or f(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) or string.find(UnitGUID(e), 182778) or string.find(UnitGUID(e), 183945) then
                    y = (y + 1)
                end

            end

        end

    end

    if not G() then
        F = 1
        h = 1
        y = 1
    end

    if ie then
        h = 10
        F = 10
    end

    ee = pe(W)
    Z = ge(W)
    if not BotOn then
        d = 0
        o = 0
    end

    if d > 0 then
        d = 0
    end

    if o > 0 then
        o = 0
    end

    fe = C()
    if j(200174):IsAvailable() then
        H = j(200174)
    else
        H = j(34433)
    end

        if l.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (l.GUISettings.General.OpenerReset)
    elseif l.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        l.ToggleIconFrame:UpdateButtonText(6)
        l.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (Q and e.MassDispell:IsUsableP() and e.MassDispell:CooldownRemains(BypassRecovery) <= 0) then
        if l.Cast(e.MassDispell, nil, nil, nil) then
            o = 327830
            return "queue RingOfPeace"
        end

    elseif ((not e.MassDispell:IsUsableP() or e.MassDispell:CooldownRemains(BypassRecovery) > 0) and Q) then
        HeroRotationCharDB.Toggles[61] = not HeroRotationCharDB.Toggles[61]
        l.Print("Mass Dispel Queue is now " .. (HeroRotationCharDB.Toggles[61] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (K and j(9484):IsUsableP() and j(9484):CooldownRemains(BypassRecovery) <= 0) then
        if f("mouseover"):GUID() ~= nil and f("mouseover"):IsInRange(30) then
            d = 19484
            return "queue Shackle MO"
        end

    elseif ((not j(9484):IsUsableP() or j(9484):CooldownRemains() > 0 or t:PrevGCD(1, j(9484))) and K) then
        HeroRotationCharDB.Toggles[62] = not HeroRotationCharDB.Toggles[62]
        l.Print("Shackle Undead Queue is now " .. (HeroRotationCharDB.Toggles[62] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    local f = select(1, UnitCastingInfo("player"))
    if r ~= 0 and r < .5 and (t:IsChanneling(e.MindSear) or t:IsChanneling(e.MindFlay)) then
        if s(e.Pool, nil) then
            o = 1999
            return "Quaking Stope"
        end

    end

    if t:IsDeadOrGhost() then
        o = 999
    end

    if t:IsChanneling(j(355321)) then
        if s(e.Pool, nil) then
            o = 999
            return "Trinket Channel"
        end

    end

    if e.Shadowform:IsCastable() and (t:BuffDown(e.ShadowformBuff)) then
        if s(e.Shadowform, nil) then
            o = 232698
            return "shadowform 4"
        end

    end

    if e.PowerWordShield:IsCastable() and t:DebuffDown(e.WeakenedSoul) and not t:IsChanneling() and not t:IsCasting() and ((i.Shadow.PWS == "Moving" and t:IsMoving()) or (i.Shadow.PWS == "Always") or (i.Shadow.PWS == "OOC Moving" and t:IsMoving() and not t:AffectingCombat())) then
        if s(e.PowerWordShield, nil) then
            o = 17
            return "PW:S Settings"
        end

    end

    if t:IsChanneling(e.VoidTorrent) then
        local t = Y()
        if t then
            return t
        end

        if s(e.Pool, nil) then
            o = 99999
            return "channeling 4"
        end

    end

    if t:IsChanneling(j(324631)) then
                if t:AffectingCombat() and i.Shadow.CastCancelFC then
            o = 1999
        elseif l.CastAnnotated(e.Pool, false, "WAIT") then
            o = 99999
            return "Pool During Fleshcraft"
        end

    end

    m = 2
    if not t:AffectingCombat() and ((P) or (i.Commons.DBMSupport and l.BossMods:GetPullTimer() < b + t:GCD() and l.BossMods:GetPullTimer() > 0)) and E.TargetIsValid() and not t:IsMoving() then
        local e = ce()
        if e then
            return e
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.ShadowWordDeath:IsCastable() then
            if s(e.ShadowWordDeath, nil) then
                d = 1136149
                return "explosive MO SWD"
            end

        end

        if e.ShadowWordPain:IsCastable() then
            if s(e.ShadowWordPain, nil) then
                d = 1589
                return "explosive MO SWP"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.ShadowWordDeath:IsCastable() then
            if s(e.ShadowWordDeath, nil) then
                o = 136149
                return "explosive  SWD"
            end

        end

        if e.ShadowWordPain:IsCastable() then
            if s(e.ShadowWordPain, nil) then
                o = 589
                return "explosive  SWP"
            end

        end

    end

    if E.TargetIsValid() and t:AffectingCombat() and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or a:NPCID() == 176581 or a:NPCID() == 176920 or a:NPCID() == 177892 or a:NPCID() == 182778 or a:NPCID() == 185402 or a:NPCID() == 183945 or a:NPCID() == 182074 or a:NPCID() == 184737 or a:NPCID() == 179733 or a:NPCID() == 115402 or a:NPCID() == 115406 or a:NPCID() == 115395 or UnitExists("boss1") or a:NPCID() == 115388 or P) and not t:IsDeadOrGhost() then
        z = g.FightRemains(W, false)
        if (a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or a:NPCID() == 176581 or a:NPCID() == 176920) then
            z = 99999999999
        end

        U = g.CombatTime()
        V = z + U
        if e.Dispersion:IsCastable() and t:HealthPercentage() < i.Shadow.DispersionHP then
            if s(e.Dispersion, nil) then
                o = 47585
                return "dispersion low_hp"
            end

        end

        if e.DesperatePrayer:IsCastable() and t:HealthPercentage() < i.Shadow.DesperatePrayerHP then
            if s(e.DesperatePrayer, nil) then
                o = 19236
                return "DesperatePrayer low_hp"
            end

        end

        if t:HealthPercentage() < i.Commons.HealthstoneHP and n.Healthstone:IsReady() and n.Healthstone:CooldownRemains() <= 0 then
            if l.Cast(n.Healthstone, nil) then
                o = 40
                return "Healthstone HP"
            end

        end

        if t:HealthPercentage() < i.Commons.HealPotHP and n.CosmicHealPot:IsReady() and n.CosmicHealPot:CooldownRemains() <= 0 then
            if l.Cast(n.CosmicHealPot, nil) then
                o = 45
                return "CosmicHealPot HP"
            end

        end

        if t:HealthPercentage() < i.Commons.HealPotHP and n.HealPot:IsReady() and n.HealPot:CooldownRemains() <= 0 then
            if l.Cast(n.HealPot, nil) then
                o = 41
                return "HealPot HP"
            end

        end

        if n.PotionofPhantomFire:IsReady() and i.Commons.Enabled.Potions and te and (((t:BuffUp(e.VoidformBuff) or t:BuffUp(e.PowerInfusionBuff)) and not l.GUISettings.General.HoldPotforBL) or (l.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if s(n.PotionofPhantomFire, nil, nil) then
                o = 50
                return "potion_of_phantomfire 2"
            end

        end

        if n.PotionofSpectralIntellect:IsReady() and i.Commons.Enabled.Potions and te and (((t:BuffUp(e.VoidformBuff) or t:BuffUp(e.PowerInfusionBuff)) and not l.GUISettings.General.HoldPotforBL) or (l.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if s(n.PotionofSpectralIntellect, nil, nil) then
                o = 50
                return "potion_of_spectral_intellect 2"
            end

        end

        m = 2
        A = q(a, false)
        ae = q(a, true)
        M = (h > (2 + x(t:BuffUp(e.VoidformBuff))))
        J = ((not SpheresHarmonyEquipped) and (I ~= 4 or (V >= 33 and U <= 20 or V <= 25 and V >= 20)) or e.PowerInfusion:CooldownRemains() < t:GCD() * 3 or t:BuffUp(e.PowerInfusionBuff) or z <= 25)
        w = y
        if e.SearingNightmare:IsAvailable() and y == 7 then
            w = 5 + 2 * x((J and e.VoidEruption:CooldownRemains() <= 10) and e.HungeringVoid:IsAvailable())
        end

        if e.SearingNightmare:IsAvailable() and h >= 7 then
            w = 0
        end

        if e.SearingNightmare:IsAvailable() and y > 4 then
            w = 4
        end

        if e.SearingNightmare:IsAvailable() and y >= 8 and not e.ShadowCrash:IsAvailable() then
            w = 0
        end

        if t:BuffUp(e.VoidformBuff) then
            w = x(y <= 5) * y
        end

        B = 0
        if a:TimeToDie() >= 18 then
            B = 1
        end

        p = (e.VampiricTouchDebuff:AuraActiveCount() >= w or not B)
        O = (e.VoidEruption:CooldownUp() and u and J)
        if (c()) then
            if e.Fireblood:IsCastable() and (t:BuffUp(e.VoidformBuff)) then
                if s(e.Fireblood, nil) then
                    o = 265221
                    return "fireblood 22"
                end

            end

            if e.Berserking:IsCastable() and (t:BuffUp(e.VoidformBuff)) then
                if s(e.Berserking, nil) then
                    o = 26297
                    return "berserking 24"
                end

            end

            if e.LightsJudgment:IsCastable() and (h >= 2) then
                if s(e.LightsJudgment, nil, nil, not a:IsSpellInRange(e.LightsJudgment)) then
                    o = 255647
                    return "lights_judgment 26"
                end

            end

            if e.AncestralCall:IsCastable() and (t:BuffUp(e.VoidformBuff)) then
                if s(e.AncestralCall, nil) then
                    o = 274738
                    return "ancestral_call 28"
                end

            end

            if e.BagofTricks:IsCastable() then
                if s(e.BagofTricks, nil, nil, not a:IsSpellInRange(e.BagofTricks)) then
                    o = 312411
                    return "bag_of_tricks 30"
                end

            end

        end

        if (true) then
            local e = Y()
            if e then
                return e
            end

        end

        if (true) then
            local e = le()
            if e then
                return e
            end

        end

    end

    if E.TargetIsValid() and not UnitIsFriend("target", "player") and t:AffectingCombat() and (not a:AffectingCombat() and not a:IsDummy() and a:NPCID() ~= 153285) and not _ then
        d = 999
    end

end

local function t()
    e.VampiricTouchDebuff:RegisterAuraTracking()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        l.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpell()
    if o == 0 then
        return 0
    else
        return o
    end

end

function ReturnSpellMO()
    if d == 0 then
        return 0
    else
        return d
    end

end

l.SetAPL(258, T, t)

