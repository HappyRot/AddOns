local e, e = ...
local e = HeroDBC.DBC
local v = HeroLib
local e = HeroCache
local u = v.Unit
local t = u.Player
local i = u.Target
local e = u.Pet
local e = v.Spell
local a = v.MultiSpell
local c = v.Item
local r = HeroRotation
local W = r.AoEON
local j = r.CDsON
local o = r.Cast
local f = HeroRotationCharDB.Toggles[4]
local F = HeroRotationCharDB.Toggles[5]
local E = HeroRotationCharDB.Toggles[6]
local T = HeroRotationCharDB.Toggles[15]
local g = HeroRotationCharDB.Toggles[12]
local I = HeroRotationCharDB.Toggles[60]
local a = r.CastSuggested
local O = { 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 326450, 320703, 320012, 324085, 333241, 331510 }
local a = math.max
local a, C, a, a, x, a = _G, pairs, type, table, string, error
local e = e.Hunter.Marksmanship
local N = c.Hunter.Marksmanship
local M = {  }
local l = t:GetEquipment()
local y = c(0)
local p = c(0)
local A, a = GetInventoryItemID("player", 13)
local _, z = GetInventoryItemID("player", 14)
if l[13] then
    y = c(l[13])
end

if l[14] then
    p = c(l[14])
end

local H = (y:IsEquippedAndReady() or y:CooldownRemains() > 0)
local S = (p:IsEquippedAndReady() or p:CooldownRemains() > 0)
local Y
local a = 0
local s = 0
local w
local h
local n
local m = r.Commons.Everyone
local d = { General = r.GUISettings.General, Commons = r.GUISettings.APL.Hunter.Commons, Commons2 = r.GUISettings.APL.Hunter.Commons2, Marksmanship = r.GUISettings.APL.Hunter.Marksmanship }
local b = i:HealthPercentage() > 70 and e.CarefulAim:IsAvailable()
local k = t:HasLegendaryEquipped(68)
local R = t:HasLegendaryEquipped(74)
local b = t:HasLegendaryEquipped(75)
local q = t:HasLegendaryEquipped(255)
v:RegisterForEvent(function()
    l = t:GetEquipment()
    y = c(0)
    p = c(0)
    if l[13] then
        y = c(l[13])
    end

    if l[14] then
        p = c(l[14])
    end

    H = (y:IsEquippedAndReady() or y:CooldownRemains() > 0)
    S = (p:IsEquippedAndReady() or p:CooldownRemains() > 0)
    k = t:HasLegendaryEquipped(68)
    R = t:HasLegendaryEquipped(74)
    b = t:HasLegendaryEquipped(75)
    q = t:HasLegendaryEquipped(255)
end, "PLAYER_EQUIPMENT_CHANGED")
v:RegisterForEvent(function()
    e.SerpentSting:RegisterInFlight()
    e.SteadyShot:RegisterInFlight()
    e.AimedShot:RegisterInFlight()
end, "LEARNED_SPELL_IN_TAB")
e.SerpentSting:RegisterInFlight()
e.SteadyShot:RegisterInFlight()
e.AimedShot:RegisterInFlight()
local function p(e)
    if e then
        return 1
    else
        return 0
    end

end

local function l(e)
    return e ~= 0
end

local function l()
    return (t:BuffUp(e.MasterMarksmanBuff) or (t:IsCasting(e.AimedShot) and e.MasterMarksman:IsAvailable()))
end

local function U()
    return (t:BuffUp(e.TrickShotsBuff) and not t:IsCasting(e.AimedShot) and not t:IsChanneling(e.RapidFire)) or t:BuffUp(e.VolleyBuff)
end

local function c(t)
    return (t:DebuffRemains(e.SerpentStingDebuff))
end

local function y(t)
                if ((t:TimeToDie() > e.SerpentStingDebuff:BaseDuration() and t:DebuffRemains(e.SerpentStingDebuff) < 3) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == u("mouseover"):GUID() and d.Marksmanship.TargetSwap == "Mouseover") then
        s = 1271788
        return true
    elseif ((t:TimeToDie() > e.SerpentStingDebuff:BaseDuration() and t:DebuffRemains(e.SerpentStingDebuff) < 3) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and d.Marksmanship.TargetSwap == "AutoSwap" and t:GUID() ~= i:GUID() and not g) then
        s = 999
                if s == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif s > 0 and endtime ~= nil and GetTime() > endtime then
            s = 0
        end

        return true
    elseif ((t:TimeToDie() > e.SerpentStingDebuff:BaseDuration() and t:DebuffRemains(e.SerpentStingDebuff) < 3) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == i:GUID()) then
        a = 271788
        return true
    elseif ((t:TimeToDie() > e.SerpentStingDebuff:BaseDuration() and t:DebuffRemains(e.SerpentStingDebuff) < 3) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285)) then
        return true
    end

end

local function l(t)
    return (t:DebuffRemains(e.SerpentStingDebuff) + (p(e.SerpentSting:InFlight()) * 99))
end

local function v(o)
                if ((t:BuffDown(e.PreciseShotsBuff) or ((t:BuffUp(e.Trueshot) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime() and (not t:IsCasting(e.AimedShot))) and ((not e.ChimaeraShot:IsAvailable()) or h < 2)) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and h > 1)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == u("mouseover"):GUID() and d.Marksmanship.TargetSwap == "Mouseover") then
        s = 119434
        return true
    elseif ((t:BuffDown(e.PreciseShotsBuff) or ((t:BuffUp(e.Trueshot) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime() and (not t:IsCasting(e.AimedShot))) and ((not e.ChimaeraShot:IsAvailable()) or h < 2)) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and h > 1)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and d.Marksmanship.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not g) then
        s = 999
                if s == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif s > 0 and endtime ~= nil and GetTime() > endtime then
            s = 0
        end

        return true
    elseif ((t:BuffDown(e.PreciseShotsBuff) or ((t:BuffUp(e.Trueshot) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime() and (not t:IsCasting(e.AimedShot))) and ((not e.ChimaeraShot:IsAvailable()) or h < 2)) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and h > 1)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == i:GUID()) then
        a = 19434
        return true
    elseif ((t:BuffDown(e.PreciseShotsBuff) or ((t:BuffUp(e.Trueshot) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime() and (not t:IsCasting(e.AimedShot))) and ((not e.ChimaeraShot:IsAvailable()) or h < 2)) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and h > 1))) then
        return true
    end

end

local function p(o)
                if ((t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD() or t:BuffUp(e.Trueshot))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == u("mouseover"):GUID() and d.Marksmanship.TargetSwap == "Mouseover") then
        s = 119434
        return true
    elseif ((t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD() or t:BuffUp(e.Trueshot))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and d.Marksmanship.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not g) then
        s = 999
                if s == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif s > 0 and endtime ~= nil and GetTime() > endtime then
            s = 0
        end

        return true
    elseif ((t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD() or t:BuffUp(e.Trueshot))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == i:GUID()) then
        a = 19434
        return true
    elseif ((t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD() or t:BuffUp(e.Trueshot))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285)) then
        return true
    end

end

local function D(o)
                if ((t:BuffDown(e.DeadEyeBuff) and o:HealthPercentage() <= 20) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == u("mouseover"):GUID() and d.Marksmanship.TargetSwap == "Mouseover") then
        s = 153351
        return true
    elseif ((t:BuffDown(e.DeadEyeBuff) and o:HealthPercentage() <= 20) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and d.Marksmanship.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not g) then
        s = 999
                if s == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif s > 0 and endtime ~= nil and GetTime() > endtime then
            s = 0
        end

        return true
    elseif ((t:BuffDown(e.DeadEyeBuff) and o:HealthPercentage() <= 20) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == i:GUID()) then
        a = 53351
        return true
    elseif ((t:BuffDown(e.DeadEyeBuff) and o:HealthPercentage() <= 20) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285)) then
        return true
    end

end

local function L(e)
                if ((e:HealthPercentage() <= 20) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) and e:GUID() == u("mouseover"):GUID() and d.Marksmanship.TargetSwap == "Mouseover") then
        s = 153351
        return true
    elseif ((e:HealthPercentage() <= 20) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) and d.Marksmanship.TargetSwap == "AutoSwap" and e:GUID() ~= i:GUID() and not g) then
        s = 999
                if s == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif s > 0 and endtime ~= nil and GetTime() > endtime then
            s = 0
        end

        return true
    elseif ((e:HealthPercentage() <= 20) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) and e:GUID() == i:GUID()) then
        a = 53351
        return true
    elseif ((e:HealthPercentage() <= 20) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285)) then
        return true
    end

    return (e:HealthPercentage() <= 20)
end

local function H()
    if m.TargetIsValid() then
        if e.Fleshcraft:IsCastable() then
            if o(e.Fleshcraft, nil, nil) then
                a = 324631
                return "fleshcraft opener"
            end

        end

        if e.TarTrap:IsReady() and k then
            if o(e.TarTrap) then
                a = 187698
                return "tar_trap soulforge_embers equipped opener"
            end

        end

        if e.DoubleTap:IsReady() and (h > 1 or (t:Covenant() ~= "Kyrian" and not e.Volley:IsAvailable())) then
            if o(e.DoubleTap, nil) then
                a = 260402
                return "double_tap opener"
            end

        end

        if e.AimedShot:IsReady() and not (t:IsCasting(e.AimedShot) or e.AimedShot:InFlight()) and (h < 3 and ((t:Covenant() ~= "Kyrian" and not e.Volley:IsAvailable()) or h < 2)) then
            if o(e.AimedShot, nil, nil, not n) then
                a = 19434
                return "aimed_shot opener"
            end

        end

        if e.SteadyShot:IsCastable() and (h > 2 or ((t:Covenant() == "Kyrian" or e.Volley:IsAvailable()) and h == 2)) then
            if o(e.SteadyShot, nil, nil, not n) then
                a = 56641
                return "steady_shot opener"
            end

        end

    end

end

local function R()
    if d.Commons.Enabled.Trinkets and (t:PrevGCDP(1, e.Trueshot) or not e.CallingtheShots:IsAvailable() or i:TimeToDie() < 20) then
        local e = t:GetUseableTrinkets(M)
        if e then
            if o(e, nil, nil) then
                                if e:ID() == A then
                    a = 24
                    return "top trinket 1"
                elseif e:ID() == _ then
                    a = 30
                    return "top trinket 2"
                end

            end

        end

    end

end

local function S()
    if e.Berserking:IsReady() and ((t:BuffUp(e.Trueshot) and i:DebuffUp(e.ResonatingArrowDebuff) and t:Covenant() == "Kyrian") or (t:BuffUp(e.Trueshot) and i:DebuffUp(e.WildMarkDebuff) and t:Covenant() == "Night Fae") or ((t:Covenant() == "Venthyr" or t:Covenant() == "Necrolord") and t:BuffUp(e.Trueshot)) or (i:TimeToDie() < 13) or (t:Covenant() == "Kyrian" and i:DebuffUp(e.ResonatingArrowDebuff) and i:TimeToDie() < 73)) then
        if o(e.Berserking, nil) then
            a = 137096
            return "berserking cds 2"
        end

    end

    if e.BloodFury:IsReady() and (t:BuffUp(e.Trueshot) or e.Trueshot:CooldownRemains() > 30 or i:TimeToDie() < 16) then
        if o(e.BloodFury, nil) then
            a = 20572
            return "blood_fury cds 4"
        end

    end

    if e.AncestralCall:IsReady() and (t:BuffUp(e.Trueshot) or e.Trueshot:CooldownRemains() > 30 or i:TimeToDie() < 16) then
        if o(e.AncestralCall, nil) then
            a = 274738
            return "ancestral_call cds 6"
        end

    end

    if e.Fireblood:IsReady() and (t:BuffUp(e.Trueshot) or e.Trueshot:CooldownRemains() > 30 or i:TimeToDie() < 9) then
        if o(e.Fireblood, nil) then
            a = 273104
            return "fireblood cds 8"
        end

    end

    if e.LightsJudgment:IsReady() and (t:BuffDown(e.Trueshot)) then
        if o(e.LightsJudgment, nil, nil, not i:IsSpellInRange(e.LightsJudgment)) then
            a = 255647
            return "lights_judgment cds 10"
        end

    end

    if N.PotionOfSpectralAgility:IsReady() and d.Commons.Enabled.Potions and T and ((t:BuffUp(e.Trueshot) and (t:BloodlustUp() or i:HealthPercentage() < 20)) or (i:TimeToDie() < 26) or (t:Covenant() == "Kyrian" and i:DebuffUp(e.ResonatingArrowDebuff) and i:TimeToDie() < 72)) then
        if o(N.PotionOfSpectralAgility, nil, nil) then
            a = 12
            return "potion cds 12"
        end

    end

end

local function N()
    if e.SteadyShot:IsCastable() and (e.SteadyFocus:IsAvailable() and ((t:PrevGCDP(1, e.SteadyShot) and t:BuffRemains(e.SteadyFocusBuff) < 5) or t:BuffDown(e.SteadyFocusBuff)) and (i:DebuffDown(e.ResonatingArrowDebuff) or t:Covenant() ~= "Kyrian")) then
        if o(e.SteadyShot, nil, nil, not n) then
            a = 56641
            return "steady_shot st 2"
        end

    end

    if e.KillShot:IsCastable() then
        if m.CastCycle(e.KillShot, w, L, not n) then
            return "kill_shot st 4"
        end

    end

    if e.KillShot:IsCastable() then
        if o(e.KillShot, nil, nil, not n) then
            a = 53351
            return "kill_shot st 5"
        end

    end

    if e.DoubleTap:IsReady() and ((t:Covenant() == "Kyrian" and (e.ResonatingArrow:CooldownRemains() < t:GCD() + .5)) or (t:Covenant() ~= "Kyrian" and t:Covenant() ~= "Night Fae") or (t:Covenant() == "Night Fae" and (e.WildSpirits:CooldownRemains() < t:GCD() + .5 or (e.WildSpirits:CooldownRemains() > 30))) or i:TimeToDie() < 15) then
        if o(e.DoubleTap, nil) then
            a = 260402
            return "double_tap st 6"
        end

    end

    if e.Flare:IsReady() and not e.TarTrap:CooldownUp() and k then
        if o(e.Flare, nil) then
            a = 1543
            return "flare st 8"
        end

    end

    if e.TarTrap:IsReady() and (k and e.TarTrap:TimeSinceLastCast() > 60 - t:GCD() - .5 and e.Flare:CooldownRemains() < t:GCD()) then
        if o(e.TarTrap, nil, nil, not i:IsInRange(40)) then
            a = 187698
            return "tar_trap soulforge_embers equipped st 10"
        end

    end

    if e.ExplosiveShot:IsReady() then
        if o(e.ExplosiveShot, nil, nil, not n) then
            a = 212431
            return "explosive_shot 12"
        end

    end

    if e.WildSpirits:IsReady() and f then
        if o(e.WildSpirits, nil, nil, not n) then
            a = 328231
            return "wild_spirits st 14"
        end

    end

    if e.FlayedShot:IsReady() and f then
        if o(e.FlayedShot, nil, nil, not n) then
            a = 324149
            return "flayed_shot st 16"
        end

    end

    if e.DeathChakram:IsReady() and f and (t:FocusP() + t:FocusCastRegen(e.DeathChakram:ExecuteTime()) < t:FocusMax()) then
        if o(e.DeathChakram, nil, nil, not n) then
            a = 325028
            return "dark_chakram st 18"
        end

    end

    if e.AMurderofCrows:IsReady() then
        if o(e.AMurderofCrows, nil, nil, not n) then
            a = 131894
            return "a_murder_of_crows st 20"
        end

    end

    if e.WailingArrow:IsReady() and (e.ResonatingArrow:CooldownRemains() < t:GCD() and (not e.ExplosiveShot:IsAvailable() or t:BloodlustUp()) or t:Covenant() ~= "Kyrian" or not e.ResonatingArrow:CooldownUp() or i:TimeToDie() < 5) then
        if o(e.WailingArrow, nil, nil, not n) then
            a = 354831
            return "wailing_arrow st 21"
        end

    end

    if e.ResonatingArrow:IsReady() and f and (t:BuffUp(e.DoubleTap) or not e.DoubleTap:IsAvailable() or i:TimeToDie() < 12) then
        if o(e.ResonatingArrow, nil, nil, not n) then
            a = 208491
            return "resonating_arrow st 22"
        end

    end

    if e.Volley:IsReady() and ((i:DebuffUp(e.ResonatingArrowDebuff)) or (t:Covenant() ~= "Kyrian" and (t:BuffDown(e.PreciseShotsBuff) or not e.ChimaeraShot:IsAvailable() or h < 2))) then
        if o(e.Volley, nil, nil, not n) then
            a = 260243
            return "volley st 24 "
        end

    end

    if e.SteadyShot:IsCastable() and (t:Covenant() == "Kyrian" and t:FocusP() + t:FocusCastRegen(e.SteadyShot:ExecuteTime()) < t:FocusMax() and ((e.ResonatingArrow:CooldownRemains() < t:GCD() * 3 and (not e.EffusiveAnimaAccelerator:IsAvailable() or not e.DoubleTap:IsAvailable())) or (e.DoubleTap:IsAvailable() and e.DoubleTap:CooldownRemains() < 3))) then
        if o(e.SteadyShot, nil, nil, not n) then
            a = 56641
            return "steady_shot st 25"
        end

    end

    if e.Trueshot:IsReady() and j() and ((t:BuffDown(e.PreciseShotsBuff) and (t:Covenant() == "Venthyr" or t:Covenant() == "Necrolord" or e.CallingtheShots:IsAvailable())) or (i:DebuffUp(e.ResonatingArrowDebuff)) or (i:DebuffUp(e.WildMarkDebuff)) or (t:BuffUp(e.VolleyBuff) and h > 1) or (i:TimeToDie() < 25)) then
        if o(e.Trueshot, nil) then
            a = 288613
            return "trueshot st 26"
        end

    end

    if e.RapidFire:IsCastable() and (b and e.Streamline:IsAvailable() and (e.ResonatingArrow:CooldownRemains() > 10 or t:Covenant() ~= "Kyrian" or not e.DoubleTap:IsAvailable() or e.EffusiveAnimaAccelerator:IsAvailable())) then
        if o(e.RapidFire, nil, nil, not n) then
            a = 257044
            return "rapid_fire st 27"
        end

    end

    if e.AimedShot:IsReady() then
        if m.CastTargetIf(e.AimedShot, w, "min", l, v, not n) then
            return "aimed_shot st 28"
        end

    end

    if e.AimedShot:IsReady() then
        if ((t:BuffDown(e.PreciseShotsBuff) or ((t:BuffUp(e.Trueshot) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime() and (not t:IsCasting(e.AimedShot))) and ((not e.ChimaeraShot:IsAvailable()) or h < 2)) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and h > 1))) then
            if o(e.AimedShot, nil, nil, not n) then
                a = 19434
                return "chimaera_shot st 32"
            end

        end

    end

    if e.RapidFire:IsCastable() and (((e.ResonatingArrow:CooldownRemains() > 10 or t:Covenant() ~= "Kyrian" or not e.DoubleTap:IsAvailable() or e.EffusiveAnimaAccelerator:IsAvailable()) and t:FocusP() + t:FocusCastRegen(e.RapidFire:ExecuteTime()) < t:FocusMax() and t:BuffDown(e.DoubleTap) and t:BuffDown(e.EagletalonsTrueFocusBuff)) or (e.Streamline:IsAvailable())) then
        if o(e.RapidFire, nil, nil, not n) then
            a = 257044
            return "rapid_fire st 30"
        end

    end

    if e.ChimaeraShot:IsReady() and (t:BuffUp(e.PreciseShotsBuff) or t:FocusP() > e.ChimaeraShot:Cost() + e.AimedShot:Cost()) then
        if o(e.ChimaeraShot, nil, nil, not n) then
            a = 342049
            return "chimaera_shot st 32"
        end

    end

    if e.ArcaneShot:IsReady() and (t:BuffUp(e.PreciseShotsBuff) or t:FocusP() > e.ArcaneShot:Cost() + e.AimedShot:Cost()) then
        if o(e.ArcaneShot, nil, nil, not n) then
            a = 185358
            return "arcane_shot st 34"
        end

    end

    if e.SerpentSting:IsReady() then
        if m.CastTargetIf(e.SerpentSting, w, "min", c, y, not n) then
            return "serpent_sting st 36"
        end

    end

    if e.Barrage:IsReady() and (h > 1) then
        if o(e.Barrage, nil, nil, not n) then
            a = 120360
            return "barrage st 38"
        end

    end

    if e.RapidFire:IsCastable() and (((e.ResonatingArrow:CooldownRemains() > 10 and b) or (t:Covenant() ~= "Kyrian") or (not e.DoubleTap:IsAvailable()) or (e.EffusiveAnimaAccelerator:IsAvailable())) and t:FocusP() + t:FocusCastRegen(e.RapidFire:ExecuteTime()) < t:FocusMax() and (t:BuffDown(e > DoubleTap) or e.Streamline:IsAvailable())) then
        if o(e.RapidFire, nil, nil, not n) then
            a = 257044
            return "rapid_fire st 40"
        end

    end

    if e.BagofTricks:IsReady() and t:BuffDown(e.Trueshot) then
        if o(e.BagofTricks, nil, nil, not i:IsSpellInRange(e.BagofTricks)) then
            a = 312411
            return "bag_of_tricks st 42"
        end

    end

    if e.Fleshcraft:IsCastable() and (e.PustuleEruption:SoulbindEnabled() and t:BuffDown(e.Trueshot)) then
        if o(e.Fleshcraft, nil, nil) then
            a = 324631
            return "fleshcraft st 43"
        end

    end

    if e.SteadyShot:IsCastable() then
        if o(e.SteadyShot, nil, nil, not n) then
            a = 56641
            return "steady_shot st 44"
        end

    end

end

local function v()
    if e.SteadyShot:IsCastable() and (e.SteadyFocus:IsAvailable() and e.SteadyShot:InFlight() and t:BuffRemains(e.SteadyFocusBuff) < 5) then
        if o(e.SteadyShot, nil, nil, not n) then
            a = 56641
            return "steady_shot trickshots 2"
        end

    end

    if e.KillShot:IsCastable() and q and t:BuffUp(e.FlayersMark) then
        if o(e.KillShot, nil, nil, not n) then
            a = 53351
            return "KillShot Razor trickshots 2"
        end

    end

    if e.FlayedShot:IsReady() and q then
        if o(e.FlayedShot, nil, nil, not n) then
            a = 324149
            return "Flayed Razor trickshots 2"
        end

    end

    if e.DoubleTap:IsReady() and ((t:Covenant() == "Kyrian" and e.ResonatingArrow:CooldownRemains() < t:GCD() + .5) or (t:Covenant() ~= "Kyrian" and t:Covenant() ~= "Night Fae") or (t:Covenant() == "Night Fae" and (e.WildSpirits:CooldownRemains() < t:GCD() + .5 or e.WildSpirits:CooldownRemains() > 30)) or (i:TimeToDie() < 10) or (e.ResonatingArrow:CooldownRemains() > 10 and h > 3)) then
        if o(e.DoubleTap, nil) then
            a = 260402
            return "double_tap trickshots 4"
        end

    end

    if e.TarTrap:IsReady() and (k and e.TarTrap:TimeSinceLastCast() > 60 - t:GCD() - .5 and e.Flare:CooldownRemains() < t:GCD()) then
        if o(e.TarTrap, nil, nil, not i:IsInRange(40)) then
            a = 187698
            return "tar_trap soulforge_embers equipped trickshots 6"
        end

    end

    if e.Flare:IsReady() and not e.TarTrap:CooldownUp() and k then
        if o(e.Flare, nil) then
            a = 1543
            return "flare trickshots 8"
        end

    end

    if e.ExplosiveShot:IsReady() then
        if o(e.ExplosiveShot, nil, nil, not n) then
            a = 212431
            return "explosive_shot trickshots 10"
        end

    end

    if e.WildSpirits:IsReady() and f then
        if o(e.WildSpirits, nil, nil) then
            a = 328231
            return "wild_spirits trickshots 12"
        end

    end

    if e.WailingArrow:IsReady() and ((e.ResonatingArrow:CooldownRemains() < t:GCD() and (not e.ExplosiveShot:IsAvailable() or t:BloodlustUp())) or (t:Covenant() ~= "Kyrian") or (e.ResonatingArrow:CooldownRemains() > 10) or (i:TimeToDie() < 5)) then
        if o(e.WailingArrow, nil, nil, not n) then
            a = 354831
            return "wailing_arrow trickshots 13"
        end

    end

    if e.ResonatingArrow:IsReady() and f and (e.Volley:CooldownRemains() < t:GCD() or not e.Volley:IsAvailable() or i:TimeToDie() < 12) then
        if o(e.ResonatingArrow, nil, nil) then
            a = 208491
            return "resonating_arrow trickshots 14"
        end

    end

    if e.Volley:IsReady() and (i:DebuffUp(e.ResonatingArrowDebuff) or t:Covenant() ~= "Kyrian") then
        if o(e.Volley, nil) then
            a = 260243
            return "volley trickshots 16"
        end

    end

    if e.Barrage:IsReady() then
        if o(e.Barrage, nil, nil, not n) then
            a = 120360
            return "barrage trickshots 18"
        end

    end

    if e.Trueshot:IsReady() and j() and (i:DebuffUp(e.ResonatingArrowDebuff) or e.ResonatingArrow:CooldownRemains() > 10 or t:Covenant() ~= "Kyrian" or i:TimeToDie() < 20) then
        if o(e.Trueshot, nil, nil, not n) then
            a = 288613
            return "trueshot trickshots 20"
        end

    end

    if e.RapidFire:IsCastable() and (b and (e.ResonatingArrow:CooldownRemains() > 10 or t:Covenant() ~= "Kyrian" or not e.DoubleTap:IsAvailable()) and t:BuffRemains(e.TrickShotsBuff) >= e.RapidFire:ExecuteTime()) then
        if o(e.RapidFire, nil, nil, not n) then
            a = 257044
            return "rapid_fire trickshots 22"
        end

    end

    if e.AimedShot:IsReady() then
        if m.CastTargetIf(e.AimedShot, w, "min", l, p, not n) then
            return "aimed_shot trickshots 24"
        end

    end

    if e.AimedShot:IsReady() then
        if (t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD() or t:BuffUp(e.Trueshot))) then
            if o(e.AimedShot, nil, nil) then
                a = 19434
                return "dark_chakram trickshots 26"
            end

        end

    end

    if e.DeathChakram:IsReady() and f and (t:FocusP() + t:FocusCastRegen(e.DeathChakram:ExecuteTime()) < t:FocusMax()) then
        if o(e.DeathChakram, nil, nil) then
            a = 325028
            return "dark_chakram trickshots 26"
        end

    end

    if e.RapidFire:IsCastable() and (((e.ResonatingArrow:CooldownRemains() > 10 and b) or t:Covenant() ~= "Kyrian" or not b or not e.DoubleTap:IsAvailable()) and t:BuffRemains(e.TrickShotsBuff) >= e.RapidFire:ExecuteTime()) then
        if o(e.RapidFire, nil, nil, not n) then
            a = 257044
            return "rapid_fire trickshots 28"
        end

    end

    if e.Multishot:IsReady() and (not U() or t:BuffUp(e.PreciseShotsBuff) and t:FocusP() > e.Multishot:Cost() + e.AimedShot:Cost() and (not e.ChimaeraShot:IsAvailable() or h > 3)) then
        if o(e.Multishot, nil, nil, not n) then
            a = 257620
            return "multishot trickshots 30"
        end

    end

    if e.ChimaeraShot:IsReady() and (t:BuffUp(e.PreciseShotsBuff) and t:FocusP() > e.ChimaeraShot:Cost() + e.AimedShot:Cost() and h < 4) then
        if o(e.ChimaeraShot, nil, nil, not n) then
            a = 342049
            return "chimaera_shot trickshots 32"
        end

    end

    if e.KillShot:IsCastable() then
        if m.CastCycle(e.KillShot, w, D, not n) then
            return "kill_shot trickshots 34"
        end

    end

    if e.KillShot:IsCastable() and (t:BuffDown(e.DeadEyeBuff)) then
        if o(e.KillShot, nil, nil, not n) then
            a = 53351
            return "kill_shot trickshots 35"
        end

    end

    if e.AMurderofCrows:IsReady() then
        if o(e.AMurderofCrows, nil, nil, not n) then
            a = 131894
            return "a_murder_of_crows trickshots 36"
        end

    end

    if e.FlayedShot:IsReady() and f then
        if o(e.FlayedShot, nil, nil) then
            a = 324149
            return "flayed_shot trickshots 38"
        end

    end

    if e.SerpentSting:IsReady() then
        if m.CastTargetIf(e.SerpentSting, w, "min", c, y, not n) then
            return "serpent_sting trickshots 40"
        end

    end

    if e.Multishot:IsReady() and (t:FocusP() > e.Multishot:Cost() + e.AimedShot:Cost() and (e.ResonatingArrow:CooldownRemains() > 5 or t:Covenant() ~= "Kyrian")) then
        if o(e.Multishot, nil, nil, not n) then
            a = 257620
            return "multishot trickshots 42"
        end

    end

    if e.BagofTricks:IsReady() then
        if o(e.BagofTricks, nil, nil, not i:IsSpellInRange(e.BagofTricks)) then
            a = 312411
            return "bag_of_tricks trickshots 44"
        end

    end

    if e.Fleshcraft:IsCastable() and (e.PustuleEruption:SoulbindEnabled() and t:BuffDown(e.Trueshot)) then
        if o(e.Fleshcraft, nil, nil) then
            a = 324631
            return "fleshcraft trickshots 43"
        end

    end

    if e.SteadyShot:IsCastable() then
        if o(e.SteadyShot, nil, nil, not n) then
            a = 56641
            return "steady_shot trickshots 46"
        end

    end

end

local function l()
    E = HeroRotationCharDB.Toggles[6]
    f = HeroRotationCharDB.Toggles[4]
    F = HeroRotationCharDB.Toggles[5]
    g = HeroRotationCharDB.Toggles[12]
    T = HeroRotationCharDB.Toggles[15]
    I = HeroRotationCharDB.Toggles[60]
end

local function c()
    n = i:IsSpellInRange(e.AimedShot)
    A, z = GetInventoryItemID("player", 13)
    _, z = GetInventoryItemID("player", 14)
    if W() then
        h = i:GetEnemiesInSplashRangeCount(10)
        w = t:GetEnemiesInRange(e.AimedShot.MaximumRange)
    else
        h = 1
        w = {  }
    end

    if I then
        h = 10
        EnemiesCount8ySplash = 10
    end

    if not BotOn then
        s = 0
        a = 0
    end

    if s > 0 then
        s = 0
    end

    if a > 0 then
        a = 0
    end

    Y = l()
        if r.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (r.GUISettings.General.OpenerReset)
    elseif r.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        r.ToggleIconFrame:UpdateButtonText(6)
        r.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

    if UnitExists("mouseover") and x.find(UnitGUID("mouseover"), 120651) then
        if e.ArcaneShot:IsCastable() and u("mouseover"):IsInMeleeRange(8) then
            if o(e.ArcaneShot, nil) then
                s = 1185358
                return "explosive MO AS"
            end

        end

    end

    if UnitExists("target") and x.find(UnitGUID("target"), 120651) then
        if e.ArcaneShot:IsCastable() and i:IsInMeleeRange(8) then
            if o(e.ArcaneShot, nil) then
                a = 185358
                return "explosive  SWD"
            end

        end

    end

    O = { 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 326450, 320703, 320012, 324085, 333241, 331510 }
    if UnitExists("target") then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
            for t = 0, 40 do
                local t, t, t, t, t, t, t, t, t, o = UnitBuff("target", t)
                for i, t in C(O) do
                    if t == o then
                        if r.Cast(e.TranqualizingShot, nil) then
                            a = 19801
                            return "Tranq Enrage"
                        end

                    end

                end

            end

        end

    end

    if not t:AffectingCombat() and m.TargetIsValid() and E then
        local e = H()
        if e then
            return e
        end

    end

    if m.TargetIsValid() and t:AffectingCombat() and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285) then
        if e.Exhilaration:IsReady() and t:HealthPercentage() <= d.Commons2.ExhilarationHP then
            if o(e.Exhilaration, nil) then
                a = 109304
                return "exhilaration"
            end

        end

        if (d.Commons.Enabled.Trinkets and ((t:Covenant() == "Kyrian" and not e.Trueshot:CooldownUp() and not e.ResonatingArrow:CooldownUp()) or (t:Covenant() ~= "Kyrian" and not e.Trueshot:CooldownUp()))) then
            local e = R()
            if e then
                return e
            end

        end

        if (j()) then
            local e = S()
            if e then
                return e
            end

        end

        if (h < 3) then
            local e = N()
            if e then
                return e
            end

        end

        if (h > 2) then
            local e = v()
            if e then
                return e
            end

        end

    end

end

local function e()
    r.Print("Marksmanship Hunter rotation is currently a work in progress.")
end

function ReturnSpell()
    if a == 0 then
        return 0
    else
        return a
    end

end

function ReturnSpellMO()
    if s == 0 then
        return 0
    else
        return s
    end

end

r.SetAPL(254, c, e)

