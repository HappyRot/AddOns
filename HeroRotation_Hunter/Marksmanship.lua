local e, e = ...
local e = HeroDBC.DBC
local y = HeroLib
local e = HeroCache
local w = y.Unit
local t = w.Player
local h = w.Target
local e = w.Pet
local E = y.Spell
local e = y.MultiSpell
local f = y.Item
local s = HeroRotation
local X = s.AoEON
local u = s.CDsON
local o = s.Cast
local e = s.CastSuggested
local Q = HeroRotationCharDB.Toggles[4]
local O = HeroRotationCharDB.Toggles[5]
local D = HeroRotationCharDB.Toggles[6]
local R = not HeroRotationCharDB.Toggles[15]
local g = HeroRotationCharDB.Toggles[12]
local U = HeroRotationCharDB.Toggles[60]
local N = HeroRotationCharDB.Toggles[120]
local H = HeroRotationCharDB.Toggles[121]
local Z = HeroRotationCharDB.Toggles[122]
local T = HeroRotationCharDB.Toggles[123]
local S = HeroRotationCharDB.Toggles[124]
local ee = HeroRotationCharDB.Toggles[142]
local te = HeroRotationCharDB.Toggles[17]
local L = { 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 326450, 320703, 320012, 324085, 333241, 331510 }
local _ = GetTime
local e = s.Commons.Hunter
local e = E.Hunter.Marksmanship
local p = f.Hunter.Marksmanship
local a = { e.SummonPet, e.SummonPet2, e.SummonPet3, e.SummonPet4, e.SummonPet5 }
local k = {  }
local c = t:GetEquipment()
local x = (c[13]) and f(c[13]) or f(0)
local z = (c[14]) and f(c[14]) or f(0)
local j, a = GetInventoryItemID("player", 13)
local q, C = GetInventoryItemID("player", 14)
if c[13] then
    x = f(c[13])
end

if c[14] then
    z = f(c[14])
end

local a = (x:IsEquippedAndReady() or x:CooldownRemains() > 0)
local a = (z:IsEquippedAndReady() or z:CooldownRemains() > 0)
local l = { LastCast = 0, Count = 0 }
local A = 11111
local b = 11111
local a = 0
local d = 0
local v
local I
local r
local i
local m = s.Commons.Everyone
local n = { General = s.GUISettings.General, Commons = s.GUISettings.APL.Hunter.Commons, Commons2 = s.GUISettings.APL.Hunter.Commons2, Marksmanship = s.GUISettings.APL.Hunter.Marksmanship }
local M = h:HealthPercentage() > 70 and e.CarefulAim:IsAvailable()
y:RegisterForEvent(function()
    c = t:GetEquipment()
    x = (c[13]) and f(c[13]) or f(0)
    z = (c[14]) and f(c[14]) or f(0)
end, "PLAYER_EQUIPMENT_CHANGED")
y:RegisterForEvent(function()
    l = { LastCast = 0, Count = 0 }
    A = 11111
    b = 11111
end, "PLAYER_REGEN_ENABLED")
y:RegisterForEvent(function()
    e.SerpentSting:RegisterInFlight()
    e.SteadyShot:RegisterInFlight()
    e.AimedShot:RegisterInFlight()
end, "LEARNED_SPELL_IN_TAB")
e.SerpentSting:RegisterInFlight()
e.SteadyShot:RegisterInFlight()
e.AimedShot:RegisterInFlight()
local function z(e)
    if e then
        return 1
    else
        return 0
    end

end

local function c(e)
    return e ~= 0
end

local function f()
    return (t:BuffUp(e.TrickShotsBuff) and not t:IsCasting(e.AimedShot) and not t:IsChanneling(e.RapidFire)) or t:BuffUp(e.VolleyBuff)
end

local function ae()
    if (l.Count == 0 or l.Count == 1) and t:IsCasting(e.SteadyShot) and l.LastCast < _() - e.SteadyShot:CastTime() then
        l.LastCast = _()
        l.Count = l.Count + 1
    end

    if not (t:IsCasting(e.SteadyShot) or t:PrevGCDP(1, e.SteadyShot)) then
        l.Count = 0
    end

    if e.SteadyFocusBuff.LastAppliedOnPlayerTime > l.LastCast then
        l.Count = 0
    end

end

local function c(t)
    return (t:DebuffRemains(e.SerpentStingDebuff))
end

local function x(t)
    return (t:DebuffRemains(e.SerpentStingDebuff) + z(e.SerpentSting:InFlight()) * 99)
end

local function z(t)
    return (t:DebuffStack(e.LatentPoisonDebuff))
end

local function K(t)
                if ((t:DebuffRefreshable(e.SerpentStingDebuff) and (not e.SerpentstalkersTrickery:IsAvailable())) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == w("mouseover"):GUID() and n.Marksmanship.TargetSwap == "Mouseover") then
        d = 1271788
        return true
    elseif ((t:DebuffRefreshable(e.SerpentStingDebuff) and (not e.SerpentstalkersTrickery:IsAvailable())) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and n.Marksmanship.TargetSwap == "AutoSwap" and t:GUID() ~= h:GUID() and not g) then
        d = 999
        return true
    elseif ((t:DebuffRefreshable(e.SerpentStingDebuff) and (not e.SerpentstalkersTrickery:IsAvailable())) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == h:GUID()) then
        a = 271788
        return true
    elseif (t:DebuffRefreshable(e.SerpentStingDebuff) and (not e.SerpentstalkersTrickery:IsAvailable())) then
        return true
    end

end

local function J(t)
                if ((t:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable()) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == w("mouseover"):GUID() and n.Marksmanship.TargetSwap == "Mouseover") then
        d = 1271788
        return true
    elseif ((t:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable()) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and n.Marksmanship.TargetSwap == "AutoSwap" and t:GUID() ~= h:GUID() and not g) then
        d = 999
        return true
    elseif ((t:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable()) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == h:GUID()) then
        a = 271788
        return true
    elseif (t:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable()) then
        return true
    end

end

local function W(t)
                if ((t:DebuffRefreshable(e.SerpentStingDebuff) and e.PoisonInjection:IsAvailable() and not e.SerpentstalkersTrickery:IsAvailable()) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == w("mouseover"):GUID() and n.Marksmanship.TargetSwap == "Mouseover") then
        d = 1271788
        return true
    elseif ((t:DebuffRefreshable(e.SerpentStingDebuff) and e.PoisonInjection:IsAvailable() and not e.SerpentstalkersTrickery:IsAvailable()) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and n.Marksmanship.TargetSwap == "AutoSwap" and t:GUID() ~= h:GUID() and not g) then
        d = 999
        return true
    elseif ((t:DebuffRefreshable(e.SerpentStingDebuff) and e.PoisonInjection:IsAvailable() and not e.SerpentstalkersTrickery:IsAvailable()) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == h:GUID()) then
        a = 271788
        return true
    elseif (t:DebuffRefreshable(e.SerpentStingDebuff) and e.PoisonInjection:IsAvailable() and not e.SerpentstalkersTrickery:IsAvailable()) then
        return true
    end

end

local function F(o)
                if ((e.SerpentstalkersTrickery:IsAvailable() and ((t:BuffDown(e.PreciseShotsBuff) or (t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime()) and ((not e.ChimaeraShot:IsAvailable()) or r < 2)) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and r > 1))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == w("mouseover"):GUID() and n.Marksmanship.TargetSwap == "Mouseover") then
        d = 119434
        return true
    elseif ((e.SerpentstalkersTrickery:IsAvailable() and ((t:BuffDown(e.PreciseShotsBuff) or (t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime()) and ((not e.ChimaeraShot:IsAvailable()) or r < 2)) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and r > 1))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and n.Marksmanship.TargetSwap == "AutoSwap" and o:GUID() ~= h:GUID() and not g) then
        d = 999
        return true
    elseif ((e.SerpentstalkersTrickery:IsAvailable() and ((t:BuffDown(e.PreciseShotsBuff) or (t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime()) and ((not e.ChimaeraShot:IsAvailable()) or r < 2)) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and r > 1))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == h:GUID()) then
        a = 19434
        return true
    elseif (e.SerpentstalkersTrickery:IsAvailable() and ((t:BuffDown(e.PreciseShotsBuff) or (t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime()) and ((not e.ChimaeraShot:IsAvailable()) or r < 2)) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and r > 1))) then
        return true
    end

end

local function M(o)
                if (((t:BuffDown(e.PreciseShotsBuff) or ((t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime()) and ((not e.ChimaeraShot:IsAvailable()) or r < 2))) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and r > 1)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == w("mouseover"):GUID() and n.Marksmanship.TargetSwap == "Mouseover") then
        d = 119434
        return true
    elseif (((t:BuffDown(e.PreciseShotsBuff) or ((t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime()) and ((not e.ChimaeraShot:IsAvailable()) or r < 2))) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and r > 1)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and n.Marksmanship.TargetSwap == "AutoSwap" and o:GUID() ~= h:GUID() and not g) then
        d = 999
        return true
    elseif (((t:BuffDown(e.PreciseShotsBuff) or ((t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime()) and ((not e.ChimaeraShot:IsAvailable()) or r < 2))) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and r > 1)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == h:GUID()) then
        a = 19434
        return true
    elseif ((t:BuffDown(e.PreciseShotsBuff) or ((t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < t:GCD() + e.AimedShot:CastTime()) and ((not e.ChimaeraShot:IsAvailable()) or r < 2))) or (t:BuffRemains(e.TrickShotsBuff) > e.AimedShot:ExecuteTime() and r > 1)) then
        return true
    end

end

local function V(o)
                if ((e.SerpentstalkersTrickery:IsAvailable() and (t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD()))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == w("mouseover"):GUID() and n.Marksmanship.TargetSwap == "Mouseover") then
        d = 119434
        return true
    elseif ((e.SerpentstalkersTrickery:IsAvailable() and (t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD()))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and n.Marksmanship.TargetSwap == "AutoSwap" and o:GUID() ~= h:GUID() and not g) then
        d = 999
        return true
    elseif ((e.SerpentstalkersTrickery:IsAvailable() and (t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD()))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == h:GUID()) then
        a = 19434
        return true
    elseif (e.SerpentstalkersTrickery:IsAvailable() and (t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD()))) then
        return true
    end

end

local function Y(o)
                if ((t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD())) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == w("mouseover"):GUID() and n.Marksmanship.TargetSwap == "Mouseover") then
        d = 119434
        return true
    elseif ((t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD())) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and n.Marksmanship.TargetSwap == "AutoSwap" and o:GUID() ~= h:GUID() and not g) then
        d = 999
        return true
    elseif ((t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD())) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == h:GUID()) then
        a = 19434
        return true
    elseif (t:BuffRemains(e.TrickShotsBuff) >= e.AimedShot:ExecuteTime() and (t:BuffDown(e.PreciseShotsBuff) or t:BuffUp(e.TrueshotBuff) or e.AimedShot:FullRechargeTime() < e.AimedShot:CastTime() + t:GCD())) then
        return true
    end

end

local function B()
    if m.TargetIsValid() then
        if e.DoubleTap:IsReady() and u() then
            if o(e.DoubleTap, nil) then
                a = 260402
                return "double_tap opener"
            end

        end

        if e.AimedShot:IsReady() and (not t:IsCasting(e.AimedShot)) and (r < 3 and ((not e.Volley:IsAvailable()) or r < 2)) then
            if o(e.AimedShot, nil, nil, not i) then
                a = 19434
                return "aimed_shot opener"
            end

        end

        if e.WailingArrow:IsReady() and u() and (not t:IsCasting(e.WailingArrow)) and (r > 2 or not e.SteadyFocus:IsAvailable()) then
            if o(e.WailingArrow, nil, nil, not i) then
                a = 355589
                return "wailing_arrow opener"
            end

        end

        if e.SteadyShot:IsCastable() and (r > 2 or e.Volley:IsAvailable() and r == 2) then
            if o(e.SteadyShot, nil, nil, not i) then
                a = 56641
                return "steady_shot opener"
            end

        end

    end

end

local function G()
    if e.Berserking:IsReady() and n.Commons.Enabled.Racials and u() and (b < 13) then
        if o(e.Berserking, nil) then
            a = 137096
            return "berserking cds 2"
        end

    end

    if e.BloodFury:IsReady() and n.Commons.Enabled.Racials and u() and (t:BuffUp(e.TrueshotBuff) or e.Trueshot:CooldownRemains() > 30 or b < 16) then
        if o(e.BloodFury, nil) then
            a = 20572
            return "blood_fury cds 4"
        end

    end

    if e.AncestralCall:IsReady() and n.Commons.Enabled.Racials and u() and (t:BuffUp(e.TrueshotBuff) or e.Trueshot:CooldownRemains() > 30 or b < 16) then
        if o(e.AncestralCall, nil) then
            a = 274738
            return "ancestral_call cds 6"
        end

    end

    if e.Fireblood:IsReady() and n.Commons.Enabled.Racials and u() and (t:BuffUp(e.TrueshotBuff) or e.Trueshot:CooldownRemains() > 30 or b < 9) then
        if o(e.Fireblood, nil) then
            a = 273104
            return "fireblood cds 8"
        end

    end

    if e.LightsJudgment:IsReady() and n.Commons.Enabled.Racials and u() and (t:BuffDown(e.TrueshotBuff)) then
        if o(e.LightsJudgment, nil, nil, not h:IsSpellInRange(e.LightsJudgment)) then
            a = 255647
            return "lights_judgment cds 10"
        end

    end

    if n.Commons.Enabled.Potions and u() and R and (((t:BuffUp(e.TrueshotBuff)) and not s.GUISettings.General.HoldPotforBL) or (s.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
        local e = m.PotionSelected()
        if e and e:IsReady() then
            if o(e, nil, nil) then
                a = 12
                return "potion cds 12"
            end

        end

    end

end

local function P()
    if e.SteadyShot:IsCastable() and (e.SteadyFocus:IsAvailable() and ((l.Count == 1 and t:BuffRemains(e.SteadyFocusBuff) < 5) or (t:BuffDown(e.SteadyFocusBuff) and t:BuffDown(e.TrueshotBuff) and l.Count ~= 2))) then
        if o(e.SteadyShot, nil, nil, not i) then
            a = 56641
            return "steady_shot st 2"
        end

    end

    if e.KillShot:IsReady() then
        if o(e.KillShot, nil, nil, not i) then
            a = 53351
            return "KillShot st 4"
        end

    end

    if e.SerpentSting:IsReady() and (t:BuffDown(e.TrueshotBuff)) then
        if m.CastTargetIf(e.SerpentSting, v, "min", c, K, not i) then
            return "serpent_sting st 8"
        end

    end

    if e.ExplosiveShot:IsReady() then
        if o(e.ExplosiveShot, nil, nil, not i) then
            a = 212431
            return "explosive_shot 10"
        end

    end

    if e.DoubleTap:IsReady() and ((e.RapidFire:CooldownRemains() < t:GCD() or h:HealthPercentage() > 70 or not e.Streamline:IsAvailable())) then
        if o(e.DoubleTap, nil) then
            a = 260402
            return "double_tap st 12"
        end

    end

    if e.Stampede:IsCastable() then
        if o(e.Stampede, nil, nil, not h:IsInRange(30)) then
            a = 201430
            return "stampede st 14"
        end

    end

    if e.DeathChakram:IsReady() and O then
        if o(e.DeathChakram, nil, nil, not i) then
            a = 325028
            return "dark_chakram st 16"
        end

    end

    if e.WailingArrow:IsReady() and u() and (r > 1) then
        if o(e.WailingArrow, nil, nil, not i) then
            a = 354831
            return "wailing_arrow st 18"
        end

    end

    if e.Volley:IsReady() then
        if o(e.Volley, nil, nil, not i) then
            a = 260243
            return "volley st 20 "
        end

    end

    if e.RapidFire:IsCastable() and (e.SurgingShots:IsAvailable() or (t:BuffUp(e.DoubleTapBuff) and e.Streamline:IsAvailable() and h:HealthPercentage() < 70)) then
        if o(e.RapidFire, nil, nil, not i) then
            a = 257044
            return "rapid_fire st 22"
        end

    end

    if e.Trueshot:IsReady() and u() then
        if o(e.Trueshot, nil) then
            a = 288613
            return "trueshot st 24"
        end

    end

    if e.MultiShot:IsReady() and (t:BuffUp(e.BombardmentBuff) and (not f()) and r > 1 or e.Salvo:IsAvailable() and not e.Volley:IsAvailable()) then
        if o(e.MultiShot, nil, nil, not i) then
            a = 257620
            return "MultiShot trickshots 26"
        end

    end

    if e.AimedShot:IsReady() then
        if m.CastTargetIf(e.AimedShot, v, "min", x, F, not i) then
            return "aimed_shot st 28"
        end

    end

    if e.AimedShot:IsReady() then
        if m.CastTargetIf(e.AimedShot, v, "max", z, M, not i) then
            return "aimed_shot st 30"
        end

    end

    if e.SteadyShot:IsCastable() and (e.SteadyFocus:IsAvailable() and t:BuffRemains(e.SteadyFocusBuff) < e.SteadyShot:ExecuteTime() * 2) and l.Count ~= 2 then
        if o(e.SteadyShot, nil, nil, not i) then
            a = 56641
            return "steady_shot st 32"
        end

    end

    if e.RapidFire:IsCastable() then
        if o(e.RapidFire, nil, nil, not i) then
            a = 257044
            return "rapid_fire st 34"
        end

    end

    if e.WailingArrow:IsReady() and (t:BuffDown(e.TrueshotBuff)) then
        if o(e.WailingArrow, nil, nil, not i) then
            a = 354831
            return "wailing_arrow st 36"
        end

    end

    if e.ChimaeraShot:IsReady() and (t:BuffUp(e.PreciseShotsBuff) or t:FocusPredicted() > e.ChimaeraShot:Cost() + e.AimedShot:Cost()) then
        if o(e.ChimaeraShot, nil, nil, not i) then
            a = 342049
            return "chimaera_shot st 38"
        end

    end

    if e.ArcaneShot:IsReady() and (t:BuffUp(e.PreciseShotsBuff) or t:FocusPredicted() > e.ArcaneShot:Cost() + e.AimedShot:Cost()) then
        if o(e.ArcaneShot, nil, nil, not i) then
            a = 185358
            return "arcane_shot st 40"
        end

    end

    if e.BagofTricks:IsReady() and u() and n.Commons.Enabled.Racials and t:BuffDown(e.Trueshot) then
        if o(e.BagofTricks, nil, nil, not h:IsSpellInRange(e.BagofTricks)) then
            a = 312411
            return "bag_of_tricks st 42"
        end

    end

    if e.SteadyShot:IsCastable() then
        if o(e.SteadyShot, nil, nil, not i) then
            a = 56641
            return "steady_shot st 44"
        end

    end

end

local function M()
    if e.SteadyShot:IsCastable() and (e.SteadyFocus:IsAvailable() and l.Count == 1 and t:BuffRemains(e.SteadyFocusBuff) < 8) then
        if o(e.SteadyShot, nil, nil, not i) then
            a = 56641
            return "steady_shot trickshots 2"
        end

    end

    if e.KillShot:IsReady() and (t:BuffUp(e.RazorFragmentsBuff)) then
        if o(e.KillShot, nil, nil, not i) then
            a = 53351
            return "KillShot Razor trickshots 2"
        end

    end

    if e.DoubleTap:IsReady() and (e.RapidFire:CooldownRemains() < t:GCD() or h:HealthPercentage() > 70 or not e.Streamline:IsAvailable()) then
        if o(e.DoubleTap, nil) then
            a = 260402
            return "double_tap trickshots 4"
        end

    end

    if e.ExplosiveShot:IsReady() then
        if o(e.ExplosiveShot, nil, nil, not i) then
            a = 212431
            return "explosive_shot trickshots 10"
        end

    end

    if e.FlayedShot:IsReady() and PouchofRazorFragmentsEquiped then
        if o(e.FlayedShot, nil, nil, not i) then
            a = 324149
            return "Flayed Razor trickshots 2"
        end

    end

    if e.TarTrap:IsReady() and (SoulForgeEmbersEquipped and e.TarTrap:TimeSinceLastCast() > 60 - t:GCD() - .5 and e.Flare:CooldownRemains() < t:GCD()) then
        if o(e.TarTrap, nil, nil, not h:IsInRange(40)) then
            a = 187698
            return "tar_trap soulforge_embers equipped trickshots 6"
        end

    end

    if e.Flare:IsReady() and not e.TarTrap:CooldownUp() and SoulForgeEmbersEquipped then
        if o(e.Flare, nil) then
            a = 1543
            return "flare trickshots 8"
        end

    end

    if e.DeathChakram:IsReady() and O then
        if o(e.DeathChakram, nil, nil) then
            a = 325028
            return "dark_chakram trickshots 26"
        end

    end

    if e.Stampede:IsReady() then
        if o(e.Stampede, nil, nil, not h:IsInRange(30)) then
            a = 201430
            return "stampede trickshots 12"
        end

    end

    if e.WailingArrow:IsReady() then
        if o(e.WailingArrow, nil, nil, not i) then
            a = 354831
            return "wailing_arrow trickshots 13"
        end

    end

    if e.SerpentSting:IsReady() then
        if m.CastTargetIf(e.SerpentSting, v, "min", c, J, not i) then
            return "serpent_sting trickshots 16"
        end

    end

    if e.Barrage:IsReady() and (r > 7) then
        if o(e.Barrage, nil, nil, not i) then
            a = 120360
            return "barrage trickshots 18"
        end

    end

    if e.Volley:IsReady() then
        if o(e.Volley, nil) then
            a = 260243
            return "volley trickshots 16"
        end

    end

    if e.Trueshot:IsReady() and u() then
        if o(e.Trueshot, nil, nil, not i) then
            a = 288613
            return "trueshot trickshots 20"
        end

    end

    if e.RapidFire:IsCastable() and (t:BuffRemains(e.TrickShotsBuff) >= e.RapidFire:ExecuteTime() and (e.SurgingShots:IsAvailable() or (t:BuffUp(e.DoubleTapBuff) and e.Streamline:IsAvailable() and h:HealthPercentage() < 70))) then
        if o(e.RapidFire, nil, nil, not i) then
            a = 257044
            return "rapid_fire trickshots 22"
        end

    end

    if e.AimedShot:IsReady() then
        if m.CastTargetIf(e.AimedShot, v, "min", x, V, not i) then
            return "aimed_shot trickshots 26"
        end

    end

    if e.AimedShot:IsReady() then
        if m.CastTargetIf(e.AimedShot, v, "max", z, Y, not i) then
            return "aimed_shot trickshots 28"
        end

    end

    if e.RapidFire:IsCastable() and (t:BuffRemains(e.TrickShotsBuff) >= e.RapidFire:ExecuteTime()) then
        if o(e.RapidFire, nil, nil, not i) then
            a = 257044
            return "rapid_fire trickshots 28"
        end

    end

    if e.ChimaeraShot:IsReady() and (t:BuffUp(e.TrickShotsBuff) and t:BuffUp(e.PreciseShotsBuff) and t:FocusPredicted() > e.ChimaeraShot:Cost() + e.AimedShot:Cost() and r < 4) then
        if o(e.ChimaeraShot, nil, nil, not i) then
            a = 342049
            return "chimaera_shot trickshots 32"
        end

    end

    if e.MultiShot:IsReady() and ((not f()) or ((t:BuffUp(e.PreciseShotsBuff) or t:BuffStack(e.BulletstormBuff) == 10) and t:FocusPredicted() > e.MultiShot:Cost() + e.AimedShot:Cost())) then
        if o(e.MultiShot, nil, nil, not i) then
            a = 257620
            return "MultiShot trickshots 30"
        end

    end

    if e.SerpentSting:IsReady() then
        if m.CastTargetIf(e.SerpentSting, v, "min", c, W, not i) then
            return "serpent_sting trickshots 36"
        end

    end

    if e.KillShot:IsReady() and (t:FocusPredicted() > e.KillShot:Cost() + e.AimedShot:Cost()) then
        if o(e.KillShot, nil, nil, not i) then
            a = 53351
            return "kill_shot trickshots 35"
        end

    end

    if e.MultiShot:IsReady() and (t:FocusPredicted() > e.MultiShot:Cost() + e.AimedShot:Cost()) then
        if o(e.MultiShot, nil, nil, not i) then
            a = 257620
            return "MultiShot trickshots 42"
        end

    end

    if e.BagofTricks:IsReady() and u() and n.Commons.Enabled.Racials and t:BuffDown(e.Trueshot) then
        if o(e.BagofTricks, nil, nil, not h:IsSpellInRange(e.BagofTricks)) then
            a = 312411
            return "bag_of_tricks st 42"
        end

    end

    if e.SteadyShot:IsCastable() then
        if o(e.SteadyShot, nil, nil, not i) then
            a = 56641
            return "steady_shot trickshots 46"
        end

    end

end

local function l()
    D = HeroRotationCharDB.Toggles[6]
    Q = HeroRotationCharDB.Toggles[4]
    O = HeroRotationCharDB.Toggles[5]
    g = HeroRotationCharDB.Toggles[12]
    R = not HeroRotationCharDB.Toggles[15]
    U = HeroRotationCharDB.Toggles[60]
    N = HeroRotationCharDB.Toggles[120]
    H = HeroRotationCharDB.Toggles[121]
    Z = HeroRotationCharDB.Toggles[122]
    T = HeroRotationCharDB.Toggles[123]
    S = HeroRotationCharDB.Toggles[124]
    HoldMD = HeroRotationCharDB.Toggles[125]
    ee = HeroRotationCharDB.Toggles[142]
    te = HeroRotationCharDB.Toggles[17]
    j = GetInventoryItemID("player", 13)
    q = GetInventoryItemID("player", 14)
                if not n.Commons.Enabled.TopTrinket and not n.Commons.Enabled.BotTrinket then
        k = { j, q }
    elseif not n.Commons.Enabled.TopTrinket and n.Commons.Enabled.BotTrinket then
        k = { j }
    elseif not n.Commons.Enabled.BotTrinket and n.Commons.Enabled.TopTrinket then
        k = { q }
    elseif not n.Commons.Enabled.BotTrinket and not n.Commons.Enabled.TopTrinket then
        k = {  }
    end

end

local function u()
    i = h:IsSpellInRange(e.AimedShot)
    v = t:GetEnemiesInRange(e.AimedShot.MaximumRange)
    I = h:GetEnemiesInSplashRange(10)
    j, C = GetInventoryItemID("player", 13)
    q, C = GetInventoryItemID("player", 14)
    if X() then
        r = #I
    else
        r = 1
    end

    if U then
        r = 10
    end

    if m.TargetIsValid() or t:AffectingCombat() then
        A = y.BossFightRemains(nil, true)
        b = A
        if b == 11111 then
            b = y.FightRemains(I, false)
        end

    end

    if not BotOn then
        d = 0
        a = 0
    end

    if d > 0 then
        d = 0
    end

    if a > 0 then
        a = 0
    end

    l()
        if s.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = _()
        endtime = starttime + (s.GUISettings.General.OpenerReset)
    elseif s.GUISettings.General.OpenerReset > 0 and endtime ~= nil and _() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        s.ToggleIconFrame:UpdateButtonText(6)
        s.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

    if t:BuffUp(E(5384)) then
        return false
    end

    if s.QueuedCast() then
        a = s.QueuedCast()
        return "Custom Queue " .. E(a):ID()
    end

        if (N and e.Bindingshot:IsAvailable() and e.Bindingshot:CooldownRemains(BypassRecovery) <= 0) then
        if s.Cast(e.Bindingshot, nil, nil, nil) then
            a = 109248
            return "queue Binding Shot"
        end

    elseif ((not e.Bindingshot:IsUsableP() or e.Bindingshot:CooldownRemains() > 0) and N) then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
        s.Print("Binding Shot Queue is now " .. (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (H and e.FreezingTrap:IsAvailable() and e.FreezingTrap:CooldownRemains(BypassRecovery) <= 0) then
        if s.Cast(e.FreezingTrap, nil, nil, nil) then
            a = 187650
            return "queue Freezing Trap"
        end

    elseif ((not e.FreezingTrap:IsUsableP() or e.FreezingTrap:CooldownRemains() > 0) and H) then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
        s.Print("Freezing Trap Queue is now " .. (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (T and e.Flare:IsAvailable() and e.Flare:CooldownRemains(BypassRecovery) <= 0) then
        if s.Cast(e.Flare, nil, nil, nil) then
            a = 1543
            return "queue Flare"
        end

    elseif ((not e.Flare:IsUsableP() or e.Flare:CooldownRemains() > 0) and T) then
        HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123]
        s.Print("Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (S and e.TarTrap:IsAvailable() and e.TarTrap:CooldownRemains(BypassRecovery) <= 0) then
        if s.Cast(e.TarTrap, nil, nil, nil) then
            a = 187698
            return "queue TarTrap"
        end

    elseif ((not e.TarTrap:IsUsableP() or e.TarTrap:CooldownRemains() > 0) and S) then
        HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124]
        s.Print("Tar Trap Queue is now " .. (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if e.Exhilaration:IsCastable() and t:HealthPercentage() <= n.Commons.ExhilarationHP then
        if o(e.Exhilaration, nil) then
            a = 109304
            return "Exhilaration"
        end

    end

    if t:HealthPercentage() < n.Commons.HealthstoneHP and p.Healthstone:IsReady() and p.Healthstone:CooldownRemains() <= 0 then
        if s.Cast(p.Healthstone, nil) then
            a = 40
            return "Healthstone HP"
        end

    end

    if t:HealthPercentage() < n.Commons.HealPotHP and p.CosmicHealPot:IsReady() and p.CosmicHealPot:CooldownRemains() <= 0 then
        if s.Cast(p.CosmicHealPot, nil) then
            a = 45
            return "CosmicHealPot HP"
        end

    end

    if t:HealthPercentage() < n.Commons.HealPotHP and p.HealPot:IsReady() and p.HealPot:CooldownRemains() <= 0 then
        if s.Cast(p.HealPot, nil) then
            a = 41
            return "HealPot HP"
        end

    end

    if e.AspectoftheTurtle:IsCastable() and t:HealthPercentage() <= n.Commons.TurtleHP then
        if o(e.AspectoftheTurtle, nil) then
            a = 186265
            return "AspectoftheTurtle"
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.ArcaneShot:IsCastable() and w("mouseover"):IsInMeleeRange(8) then
            if o(e.ArcaneShot, nil) then
                d = 1185358
                return "explosive MO AS"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.ArcaneShot:IsCastable() and h:IsInMeleeRange(8) then
            if o(e.ArcaneShot, nil) then
                a = 185358
                return "explosive  SWD"
            end

        end

    end

    -- L = { 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 326450, 320703, 320012, 324085, 333241, 331510 }
    -- if UnitExists("target") then
        -- if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
            -- for t = 0, 40 do
                -- local o, o, o, o, o, o, o, o, o, t = UnitBuff("target", t)
                -- for i, o in pairs(L) do
                    -- if o == t then
                        -- if s.Cast(e.TranqualizingShot, nil) then
                            -- a = 19801
                            -- return "Tranq Enrage"
                        -- end

                    -- end

                -- end

            -- end

        -- end

    -- end

    if not t:AffectingCombat() and m.TargetIsValid() and D then
        local e = B()
        if e then
            return e
        end

    end

    if m.TargetIsValid() and t:AffectingCombat() and (h:AffectingCombat() or h:IsDummy() or h:NPCID() == 153285) then
        ae()
        local i = t:GetUseableTrinkets(k, 13)
        if i and ((not i:TrinketHasUseBuff()) or t:BuffUp(e.TrueshotBuff)) then
            if o(i, nil, nil) then
                a = 24
                return "trinket1 main 2"
            end

        end

        local h = t:GetUseableTrinkets(k, 14)
        if h and n.Commons.Enabled.BottomTrinket and ((not h:TrinketHasUseBuff()) or t:BuffUp(e.TrueshotBuff)) then
            if o(h, nil, nil) then
                a = 25
                return "trinket2 main 4"
            end

        end

        if i or h then
            local e = i or h
            if s.Cast(e, nil, nil) then
                                if e:ID() == j and n.Commons.Enabled.TopTrinket then
                    a = 24
                    return "Generic use_items for " .. e:Name()
                elseif e:ID() == q and n.Commons.Enabled.BottomTrinket then
                    a = 25
                    return "Generic use_items for " .. e:Name()
                end

            end

        end

        if (true) then
            local e = G()
            if e then
                return e
            end

        end

        if (r < 3 or not e.TrickShots:IsAvailable()) then
            local e = P()
            if e then
                return e
            end

        end

        if (r > 2) then
            local e = M()
            if e then
                return e
            end

        end

        if s.CastAnnotated(e.PoolFocus, false, "WAIT") then
            a = 9999999
            return "Pooling Focus"
        end

    end

end

local function e()
    s.Print("Marksmanship Hunter rotation is currently a work in progress.")
end

function ReturnSpell()
    if a == 0 then
        return 0
    else
        return a
    end

end

function ReturnSpellMO()
    if d == 0 then
        return 0
    else
        return d
    end

end

s.SetAPL(254, u, e)

