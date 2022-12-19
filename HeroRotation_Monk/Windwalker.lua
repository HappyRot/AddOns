local e, e = ...
local e = HeroDBC.DBC
local E = HeroLib
local e = HeroCache
local x = E.Unit
local o = x.Player
local t = x.Target
local e = x.Pet
local J = E.Spell
local e = E.MultiSpell
local a = E.Item
local n = HeroRotation
local i = n.Cast
local m = n.CDsON
local ee = n.AoEON
local he = HeroRotationCharDB.Toggles[4]
local y = HeroRotationCharDB.Toggles[5]
local B = HeroRotationCharDB.Toggles[6]
local se = not HeroRotationCharDB.Toggles[15]
local j = HeroRotationCharDB.Toggles[31]
local Z = HeroRotationCharDB.Toggles[32]
local R = HeroRotationCharDB.Toggles[33]
local F = HeroRotationCharDB.Toggles[34]
local W = HeroRotationCharDB.Toggles[35]
local M = HeroRotationCharDB.Toggles[36]
local C = HeroRotationCharDB.Toggles[37]
local te = HeroRotationCharDB.Toggles[38]
local Y = HeroRotationCharDB.Toggles[39]
local N = HeroRotationCharDB.Toggles[12]
local G = pairs
local I = 0
local e = nil
local e = nil
local A = false
local D = false
local V = GetInventoryItemID("player", 13)
local Q = GetInventoryItemID("player", 14)
local e = J.Monk.Windwalker
local g = a.Monk.Windwalker
local L = {  }
local c
local S
local h
local P = 11111
local d = 11111
local q
local a = false
local k = false
local X = false
local a = false
local a = false
local b = 0
local a = 0
local z
local H = 0
local s = false
local r = 0
local u = n.Commons.Everyone
local s = n.Commons.Monk
local s = { General = n.GUISettings.General, Commons = n.GUISettings.APL.Monk.Commons, Windwalker = n.GUISettings.APL.Monk.Windwalker }
E:RegisterForEvent(function()
    r = 0
    P = 11111
    d = 11111
end, "PLAYER_REGEN_ENABLED")
local function _(e)
    if e then
        return 1
    else
        return 0
    end

end

local function r(e)
    return e ~= 0
end

local function O()
    return math.floor(o:EnergyTimeToMaxPredicted() * 10 + .5) / 10
end

local function r()
    return math.floor(o:EnergyPredicted() + .5)
end

local function l(e)
    return (not o:PrevGCD(1, e))
end

local function r()
    if not e.MarkoftheCrane:IsAvailable() then
        return 0
    end

    local t = 0
    if S then
        for o, a in G(S) do
            if a:DebuffUp(e.MarkoftheCraneDebuff) then
                t = t + 1
            end

        end

    end

    return t
end

local function T()
    if not e.MarkoftheCrane:IsAvailable() then
        return 0
    end

    local a = r()
    local t = 1
    if a > 0 then
        t = t * (1 + (a * .18))
    end

    t = t * (1 + (.1 * e.CraneVortex:TalentRank()))
    t = t * (1 + (.3 * _(o:BuffUp(e.KicksofFlowingMomentumBuff))))
    t = t * (1 + (.05 * e.FastFeet:TalentRank()))
    return t
end

local function U()
    if not e.MarkoftheCrane:IsAvailable() then
        return true
    end

    local e = r()
    if (h == e or e >= 5) then
        return true
    end

    return false
end

local function r(t)
    return t:DebuffRemains(e.MarkoftheCraneDebuff)
end

local function p(t)
    return t:DebuffRemains(e.MarkoftheCraneDebuff) + (_(t:DebuffUp(e.SkyreachExhaustionDebuff)) * 20)
end

local function w(e)
                if ((e:IsInMeleeRange(10)) and e:GUID() == x("mouseover"):GUID()) then
        b = 1100780
        return true
    elseif ((e:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not N and not string.find(e:GUID(), 174773)) then
        b = 999
        return true
    elseif ((e:IsInMeleeRange(10)) and e:GUID() == t:GUID()) then
        a = 100780
        return true
    elseif ((e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function f(e)
                if ((e:IsInMeleeRange(10)) and e:GUID() == x("mouseover"):GUID()) then
        b = 1100784
        return true
    elseif ((e:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not N) then
        b = 999
        return true
    elseif ((e:IsInMeleeRange(10)) and e:GUID() == t:GUID()) then
        a = 100784
        return true
    elseif (e:IsInMeleeRange(10)) then
        return true
    end

end

local function v(e)
                if ((e:IsInMeleeRange(10)) and e:GUID() == x("mouseover"):GUID()) then
        b = 1107428
        return true
    elseif ((e:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not N and not string.find(e:GUID(), 174773)) then
        b = 999
        return true
    elseif ((e:IsInMeleeRange(10)) and e:GUID() == t:GUID()) then
        a = 107428
        return true
    elseif ((e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function K()
    local e = o:GetUseableTrinkets(L)
    if e then
                if e:ID() == GetInventoryItemID("player", 13) and s.Commons.Enabled.TopTrinket then
            if n.Cast(e, nil, nil) then
                a = 24
                return "top trinket 1"
            end

        elseif e:ID() == GetInventoryItemID("player", 14) and s.Commons.Enabled.BottomTrinket then
            if n.Cast(e, nil, nil) then
                a = 35
                return "bot trinket 1"
            end

        end

    end

end

local function ne()
    if e.SummonWhiteTigerStatue:IsCastable() and m() and t:IsInRange(8) then
        if i(e.SummonWhiteTigerStatue, nil, nil, not t:IsInRange(40)) then
            a = 388686
            return "summon_white_tiger_statue precombat 2"
        end

    end

    if e.ExpelHarm:IsReady() and t:IsInRange(10) and (o:Chi() < o:ChiMax()) then
        if n.Cast(e.ExpelHarm, nil, nil, not t:IsInMeleeRange(8)) then
            a = 322101
            return "expel_harm opener 4"
        end

    end

    if e.ChiBurst:IsReady() and t:IsInRange(30) and not o:IsMoving() and (I == 0 or I > e.ChiBurst:CastTime() + .5) and (not e.FaelineStomp:IsAvailable()) then
        if n.Cast(e.ChiBurst, nil, nil, not t:IsInRange(40)) then
            a = 123986
            return "Chi Burst 4"
        end

    end

    if e.ChiWave:IsReady() and t:IsInRange(40) then
        if n.Cast(e.ChiWave, nil, nil, not t:IsInRange(40)) then
            a = 115098
            return "Chi Wave 6"
        end

    end

end

local function ae()
    if e.ExpelHarm:IsReady() and t:IsInRange(10) and (e.ChiBurst:IsAvailable() and o:ChiDeficit() >= 3) then
        if i(e.ExpelHarm, nil, nil, not t:IsInMeleeRange(8)) then
            a = 322101
            return "expel_harm opener 2"
        end

    end

    if e.TigerPalm:IsReady() and (l(e.TigerPalm) and o:ChiDeficit() >= (2 + _(o:BuffUp(e.PowerStrikesBuff)))) then
        if u.CastTargetIf(e.TigerPalm, c, "min", p, w, not t:IsInMeleeRange(5)) then
            return "tiger_palm opener 4"
        end

        if p(t) and w(t) then
            if n.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                a = 100780
                return "tiger_palm opener 4"
            end

        end

    end

    if e.ChiWave:IsReady() and t:IsInRange(40) and (o:ChiDeficit() >= 2) then
        if i(e.ChiWave, nil, nil, not t:IsInRange(40)) then
            a = 115098
            return "chi_wave opener 6"
        end

    end

    if e.ExpelHarm:IsReady() and t:IsInRange(10) then
        if i(e.ExpelHarm, nil, nil, not t:IsInMeleeRange(8)) then
            a = 322101
            return "expel_harm opener 10"
        end

    end

    if e.TigerPalm:IsReady() and (o:ChiDeficit() >= (2 + _(o:BuffUp(e.PowerStrikesBuff)))) then
        if u.CastTargetIf(e.TigerPalm, c, "min", p, w, not t:IsInMeleeRange(5)) then
            return "tiger_palm opener 12"
        end

        if p(t) and w(t) then
            if n.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                a = 100780
                return "tiger_palm opener 12"
            end

        end

    end

end

local function ie()
    if e.BonedustBrew:IsCastable() and (U() and o:Chi() >= 4) then
        if i(e.BonedustBrew, nil, nil, not t:IsInRange(40)) then
            a = 325216
            return "bonedust_brew bdb_setup 2"
        end

    end

    if e.BlackoutKick:IsReady() and (l(e.BlackoutKick) and not e.WhirlingDragonPunch:IsAvailable()) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick bdb_setup 4"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick bdb_setup 4"
            end

        end

    end

    if e.RisingSunKick:IsReady() and (l(e.RisingSunKick) and o:Chi() >= 5) then
        if u.CastTargetIf(e.RisingSunKick, c, "min", r, v, not t:IsInMeleeRange(5)) then
            return "rising_sun_kick bdb_setup 6"
        end

        if r(t) and v(t) then
            if n.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                a = 107428
                return "rising_sun_kick bdb_setup 6"
            end

        end

    end

    if e.TigerPalm:IsReady() and (l(e.TigerPalm) and o:ChiDeficit() >= 2) then
        if u.CastTargetIf(e.TigerPalm, c, "min", p, w, not t:IsInMeleeRange(5)) then
            return "tiger_palm bdb_setup 8"
        end

        if p(t) and w(t) then
            if n.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                a = 100780
                return "tiger_palm bdb_setup 8"
            end

        end

    end

    if e.RisingSunKick:IsReady() and (l(e.RisingSunKick) and h >= 2) then
        if u.CastTargetIf(e.RisingSunKick, c, "min", r, v, not t:IsInMeleeRange(5)) then
            return "rising_sun_kick bdb_setup 10"
        end

        if r(t) and v(t) then
            if n.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                a = 107428
                return "rising_sun_kick bdb_setup 10"
            end

        end

    end

end

local function oe()
    if e.SummonWhiteTigerStatue:IsCastable() and m() and t:IsInRange(8) and (q) then
        if i(e.SummonWhiteTigerStatue, nil, nil, not t:IsInRange(40)) then
            a = 388686
            return "summon_white_tiger_statue cd_serenity 2"
        end

    end

    if e.InvokeXuenTheWhiteTiger:IsReady() and A and t:IsInRange(8) and (((not k) and e.BonedustBrew:IsAvailable() and e.BonedustBrew:CooldownRemains() <= 5) or d < 25) then
        if n.Cast(e.InvokeXuenTheWhiteTiger, nil, nil, not t:IsInRange(40)) then
            a = 123904
            return "invoke_xuen_the_white_tiger cd_serenity 4"
        end

    end

    if e.InvokeXuenTheWhiteTiger:IsCastable() and A and t:IsInRange(8) and (((not k) and (not e.BonedustBrew:IsAvailable()) and e.RisingSunKick:CooldownRemains() < 2) or d < 25) then
        if i(e.InvokeXuenTheWhiteTiger, nil, nil, not t:IsInRange(40)) then
            a = 123904
            return "invoke_xuen_the_white_tiger cd_serenity 6"
        end

    end

    if e.BonedustBrew:IsCastable() and m() and t:IsInRange(8) and ((o:BuffDown(e.BonedustBrewBuff) and (e.Serenity:CooldownUp() or e.Serenity:CooldownRemains() > 15 or d < 30 and d > 10)) or d < 10) then
        if i(e.BonedustBrew, nil, nil, not t:IsInRange(40)) then
            a = 325216
            return "bonedust_brew cd_serenity 8"
        end

    end

    if e.Serenity:IsCastable() and m() and t:IsInRange(8) and ((q or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 10 or (not e.InvokeXuenTheWhiteTiger:IsAvailable())) or d < 15) then
        if i(e.Serenity, s.Windwalker.OffGCDasOffGCD.Serenity) then
            a = 152173
            return "serenity cd_serenity 10"
        end

    end

    if e.TouchofDeath:IsReady() and not Y and t:IsInRange(8) and (e.InvokeXuenTheWhiteTiger:IsAvailable() and (l(e.TouchofDeath) and (d > 60 or (q and o:BuffUp(e.BonedustBrewBuff)) or ((e.InvokeXuenTheWhiteTiger:CooldownRemains() > d) and o:BuffUp(e.BonedustBrewBuff)) or d < 10))) then
        if i(e.TouchofDeath, nil, nil, not t:IsInMeleeRange(5)) then
            a = 322109
            return "touch_of_death cd_serenity 12"
        end

    end

    if (o:BuffUp(e.SerenityBuff) or d < 20) then
        if e.AncestralCall:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials then
            if n.Cast(e.AncestralCall, nil) then
                a = 274738
                return "Ancestral Call 512"
            end

        end

        if e.BloodFury:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials then
            if n.Cast(e.BloodFury, nil) then
                a = 20572
                return "Blood Fury 502"
            end

        end

        if e.Fireblood:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials then
            if n.Cast(e.Fireblood, nil) then
                a = 265221
                return "Fireblood 510"
            end

        end

        if e.Berserking:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials then
            if n.Cast(e.Berserking, nil) then
                a = 26297
                return "Berserking 504"
            end

        end

        if e.BagOfTricks:IsCastable() and t:IsInRange(8) and s.Commons.Enabled.Racials then
            if n.Cast(e.BagOfTricks, nil, nil, not t:IsInRange(40)) then
                a = 312411
                return "Bag of Tricks 528"
            end

        end

    end

    if e.LightsJudgment:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials then
        if n.Cast(e.LightsJudgment, nil, nil, not t:IsInRange(40)) then
            a = 255647
            return "Lights Judgment 508"
        end

    end

    if s.Commons.Enabled.Trinkets then
        local e = K()
        if e then
            return e
        end

    end

end

local function ae()
    if e.SummonWhiteTigerStatue:IsCastable() and m() and t:IsInRange(8) and (q) then
        if i(e.SummonWhiteTigerStatue, nil, nil, not t:IsInRange(40)) then
            a = 388686
            return "summon_white_tiger_statue cd_sef 2"
        end

    end

    if e.InvokeXuenTheWhiteTiger:IsReady() and A and t:IsInRange(8) and (((not k) and e.BonedustBrew:IsAvailable() and e.BonedustBrew:CooldownRemains() <= 5 and ((h < 3 and o:Chi() >= 3) or (h >= 3 and o:Chi() >= 2))) or d < 25) then
        if i(e.InvokeXuenTheWhiteTiger, s.Windwalker.GCDasOffGCD.InvokeXuenTheWhiteTiger, nil, not t:IsInRange(40)) then
            a = 123904
            return "invoke_xuen_the_white_tiger cd_sef 4"
        end

    end

    if e.InvokeXuenTheWhiteTiger:IsReady() and A and t:IsInRange(8) and ((not k) and (not e.BonedustBrew:IsAvailable()) and e.RisingSunKick:CooldownRemains() < 2 and o:Chi() >= 3) then
        if i(e.InvokeXuenTheWhiteTiger, s.Windwalker.GCDasOffGCD.InvokeXuenTheWhiteTiger, nil, not t:IsInRange(40)) then
            a = 123904
            return "invoke_xuen_the_white_tiger cd_sef 6"
        end

    end

    if e.StormEarthAndFire:IsCastable() and D and t:IsInRange(10) and (e.BonedustBrew:IsAvailable() and ((d < 30 and e.BonedustBrew:CooldownRemains() < 4 and o:Chi() >= 4) or (o:BuffUp(e.BonedustBrewBuff) and (not X)) or ((not U()) and h >= 3 and e.BonedustBrew:CooldownRemains() <= 2 and o:Chi() >= 2)) and (q or e.InvokeXuenTheWhiteTiger:CooldownRemains() > e.StormEarthAndFire:FullRechargeTime())) then
        if i(e.StormEarthAndFire, nil) then
            a = 137639
            return "storm_earth_and_fire cd_sef 8"
        end

    end

    if e.BonedustBrew:IsCastable() and m() and t:IsInRange(8) and ((o:BuffDown(e.BonedustBrewBuff) and o:BuffUp(e.StormEarthAndFireBuff) and o:BuffRemains(e.StormEarthAndFireBuff) < 11 and U()) or (o:BuffDown(e.BonedustBrewBuff) and d < 30 and d > 10 and U() and o:Chi() >= 4) or d < 10) then
        if i(e.BonedustBrew, nil, nil, not t:IsInRange(40)) then
            a = 325216
            return "bonedust_brew cd_sef 10"
        end

    end

    if (o:BuffDown(e.BonedustBrewBuff) and e.BonedustBrew:IsAvailable() and e.BonedustBrew:CooldownRemains() <= 2 and ((d > 60 and (e.StormEarthAndFire:Charges() > 0 or e.StormEarthAndFire:CooldownRemains() > 10) and (q or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 10 or k)) or (((q or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 13) and (e.StormEarthAndFire:Charges() > 0) or (e.StormEarthAndFire:CooldownRemains() > 13) or (o:BuffUp(e.StormEarthAndFireBuff)))))) then
        local e = ie()
        if e then
            return e
        end

    end

    if e.StormEarthAndFire:IsCastable() and D and t:IsInRange(10) and (d < 20 or ((e.StormEarthAndFire:Charges() == 2 and e.InvokeXuenTheWhiteTiger:CooldownRemains() > e.StormEarthAndFire:FullRechargeTime()) and e.FistsofFury:CooldownRemains() <= 9 and o:Chi() >= 2 and e.WhirlingDragonPunch:CooldownRemains() <= 12)) then
        if i(e.StormEarthAndFire, nil) then
            a = 137639
            return "storm_earth_and_fire cd_sef 12"
        end

    end

    if e.TouchofDeath:IsReady() and not Y and t:IsInRange(8) and ((e.InvokeXuenTheWhiteTiger:IsAvailable() and (l(e.TouchofDeath) and ((d > 60 or (o:BuffDown(e.StormEarthAndFireBuff) and q and o:BuffUp(e.BonedustBrewBuff)) or ((e.InvokeXuenTheWhiteTiger:CooldownRemains() > d) and o:BuffUp(e.BonedustBrewBuff)) or d < 10)))) or (not e.InvokeXuenTheWhiteTiger:IsAvailable() and (l(e.TouchofDeath) and ((d > 60 or (o:BuffDown(e.StormEarthAndFireBuff) and o:BuffUp(e.BonedustBrewBuff)) or d < 10))))) then
        if i(e.TouchofDeath, nil, nil, not t:IsInMeleeRange(5)) then
            a = 322109
            return "touch_of_death cd_sef 14"
        end

    end

    if s.Commons.Enabled.Trinkets and m() then
        local e = K()
        if e then
            return e
        end

    end

    if e.AncestralCall:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or k or d < 20) then
        if i(e.AncestralCall, nil) then
            a = 274738
            return "ancestral_call cd_sef 18"
        end

    end

    if e.BloodFury:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or k or d < 20) then
        if i(e.BloodFury, nil) then
            a = 20572
            return "blood_fury cd_sef 20"
        end

    end

    if e.Fireblood:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or k or d < 10) then
        if i(e.Fireblood, nil) then
            a = 265221
            return "fireblood cd_sef 22"
        end

    end

    if e.Berserking:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or k or d < 15) then
        if i(e.Berserking, nil) then
            a = 26297
            return "berserking cd_sef 24"
        end

    end

    if e.BagofTricks:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials and (o:BuffDown(e.StormEarthAndFireBuff)) then
        if i(e.BagofTricks, nil) then
            a = 312411
            return "bag_of_tricks cd_sef 26"
        end

    end

    if e.LightsJudgment:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials then
        if i(e.LightsJudgment, nil) then
            a = 255647
            return "lights_judgment cd_sef 28"
        end

    end

end

local function K()
    if e.StrikeoftheWindlord:IsReady() and y and t:IsInRange(8) and (h < 3) then
        if i(e.StrikeoftheWindlord, nil, nil, not t:IsInMeleeRange(9)) then
            a = 392983
            return "strike_of_the_windlord serenity 2"
        end

    end

    if e.FaelineStomp:IsCastable() and y and t:IsInRange(8) and (l(e.FaelineStomp) and ((not e.FaelineHarmony:IsAvailable()) or t:DebuffRemains(e.FaeExposureDebuff) < 1)) then
        if i(e.FaelineStomp, nil, nil, not t:IsInRange(30)) then
            a = 327104
            return "faeline_stomp serenity 4"
        end

    end

    if e.BlackoutKick:IsReady() and (l(e.BlackoutKick) and o:BuffStack(e.TeachingsoftheMonasteryBuff) == 3) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick serenity 6"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick serenity 6"
            end

        end

    end

    if e.FistsofFury:IsReady() and not R and t:IsInRange(8) and ((not o:IsChanneling(e.FistsofFury)) and (o:BuffRemains(e.SerenityBuff) < 1)) then
        interruptFoF1 = true
        if n.Cast(e.FistsofFury, nil, nil, not t:IsSpellInRange(8)) then
            a = 113656
            return "one_gcd fists_of_fury serenity 8"
        end

    end

    if e.BlackoutKick:IsReady() and (l(e.BlackoutKick) and h == 3 and o:BuffStack(e.TeachingsoftheMonasteryBuff) == 2) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick serenity 10"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick serenity 10"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (l(e.SpinningCraneKick) and (h > 3 or (h > 2 and T() >= 2.3))) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick serenity 12"
        end

    end

    if e.StrikeoftheWindlord:IsReady() and y and t:IsInRange(8) and (h >= 3) then
        if i(e.StrikeoftheWindlord, nil, nil, not t:IsInMeleeRange(9)) then
            a = 392983
            return "strike_of_the_windlord serenity 14"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (l(e.SpinningCraneKick) and h > 1) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick serenity 16"
        end

    end

    if e.WhirlingDragonPunch:IsReady() and not z and not j and t:IsInRange(8) and (h > 1) then
        if i(e.WhirlingDragonPunch, nil, nil, not t:IsInMeleeRange(5)) then
            a = 152175
            return "whirling_dragon_punch serenity 18"
        end

    end

    if e.BlackoutKick:IsReady() and t:IsInRange(8) and (h >= 3 and e.FistsofFury:CooldownDown() and e.ShadowboxingTreads:IsAvailable()) then
        if i(e.BlackoutKick, nil, nil, not t:IsInMeleeRange(5)) then
            a = 100784
            return "blackout_kick serenity 20"
        end

    end

    if e.RushingJadeWind:IsReady() and t:IsInRange(8) and (o:BuffDown(e.RushingJadeWindBuff) and h >= 3) then
        if i(e.RushingJadeWind, nil, nil, not t:IsInMeleeRange(8)) then
            a = 116847
            return "rushing_jade_wind serenity 22"
        end

    end

    if e.RisingSunKick:IsReady() then
        if u.CastTargetIf(e.RisingSunKick, c, "min", r, v) then
            return "Rising Sun Kick 604"
        end

        if r(t) and v(t) then
            if n.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                a = 107428
                return "Rising Sun Kick 606"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (l(e.SpinningCraneKick) and o:BuffUp(e.DanceofChijiBuff)) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick serenity 24"
        end

    end

    if e.BlackoutKick:IsReady() and t:IsInRange(8) and (l(e.BlackoutKick)) then
        if i(e.BlackoutKick, nil, nil, not t:IsInMeleeRange(5)) then
            a = 100784
            return "blackout_kick serenity 26"
        end

    end

    if e.WhirlingDragonPunch:IsReady() and not z and not j and t:IsInRange(8) then
        if i(e.WhirlingDragonPunch, nil, nil, not t:IsInMeleeRange(5)) then
            a = 152175
            return "whirling_dragon_punch serenity 28"
        end

    end

    if e.TigerPalm:IsReady() and t:IsInRange(8) and (e.TeachingsoftheMonastery:IsAvailable() and o:BuffStack(e.TeachingsoftheMonasteryBuff) < 3) then
        if i(e.TigerPalm, nil, nil, not t:IsInMeleeRange(5)) then
            a = 100780
            return "tiger_palm serenity 30"
        end

    end

end

local function ie()
    if e.FaelineStomp:IsCastable() and y and t:IsInRange(8) and (l(e.FaelineStomp)) then
        if i(e.FaelineStomp, nil, nil, not t:IsInRange(30)) then
            a = 327104
            return "faeline_stomp aoe 2"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (l(e.SpinningCraneKick) and o:BuffUp(e.DanceofChijiBuff) and h > 3) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick aoe 4"
        end

    end

    if e.StrikeoftheWindlord:IsReady() and y and t:IsInRange(8) and (e.Thunderfist:IsAvailable() and h > 3) then
        if i(e.StrikeoftheWindlord, nil, nil, not t:IsInMeleeRange(5)) then
            a = 392983
            return "strike_of_the_windlord aoe 6"
        end

    end

    if e.WhirlingDragonPunch:IsReady() and not z and not j and t:IsInRange(8) and (h > 8) then
        if i(e.WhirlingDragonPunch, nil, nil, not t:IsInMeleeRange(5)) then
            a = 152175
            return "whirling_dragon_punch aoe 8"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (o:BuffUp(e.BonedustBrewBuff) and l(e.SpinningCraneKick) and h > 5 and T() >= 3.2) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick aoe 10"
        end

    end

    if e.BlackoutKick:IsReady() and (o:BuffStack(e.TeachingsoftheMonasteryBuff) == 3 and e.ShadowboxingTreads:IsAvailable()) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick aoe 12"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick aoe 12"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (l(e.SpinningCraneKick) and o:BuffUp(e.DanceofChijiBuff)) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick aoe 14"
        end

    end

    if e.StrikeoftheWindlord:IsReady() and y and t:IsInRange(8) and (e.Thunderfist:IsAvailable()) then
        if i(e.StrikeoftheWindlord, nil, nil, not t:IsInMeleeRange(5)) then
            a = 392983
            return "strike_of_the_windlord aoe 16"
        end

    end

    if e.WhirlingDragonPunch:IsReady() and not z and not j and t:IsInRange(8) and (h > 5) then
        if i(e.WhirlingDragonPunch, nil, nil, not t:IsInMeleeRange(5)) then
            a = 152175
            return "whirling_dragon_punch aoe 18"
        end

    end

    if e.BlackoutKick:IsReady() and (o:BuffUp(e.TeachingsoftheMonasteryBuff) and (o:BuffStack(e.TeachingsoftheMonasteryBuff) == 2 or h < 5) and e.ShadowboxingTreads:IsAvailable()) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick aoe 20"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick aoe 20"
            end

        end

    end

    if e.WhirlingDragonPunch:IsReady() and not z and not j and t:IsInRange(8) then
        if i(e.WhirlingDragonPunch, nil, nil, not t:IsInMeleeRange(5)) then
            a = 152175
            return "whirling_dragon_punch aoe 22"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (o:BuffUp(e.BonedustBrewBuff) and l(e.SpinningCraneKick)) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick aoe 24"
        end

    end

    if e.FistsofFury:IsReady() and not R and t:IsInRange(8) and (h > 3) then
        if i(e.FistsofFury, nil, nil, not t:IsInMeleeRange(8)) then
            a = 113656
            return "fists_of_fury aoe 26"
        end

    end

    if e.BlackoutKick:IsReady() and (o:BuffStack(e.TeachingsoftheMonasteryBuff) == 3) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, nil, not t:IsInMeleeRange(5)) then
            return "blackout_kick aoe 28"
        end

    end

    if e.RushingJadeWind:IsReady() and t:IsInRange(8) and (o:BuffDown(e.RushingJadeWindBuff) and h > 3) then
        if i(e.RushingJadeWind, nil, nil, not t:IsInMeleeRange(8)) then
            a = 116847
            return "rushing_jade_wind aoe 30"
        end

    end

    if e.BlackoutKick:IsReady() and (o:BuffUp(e.TeachingsoftheMonasteryBuff) and h >= 5 and e.ShadowboxingTreads:IsAvailable()) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick aoe 32"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick aoe 32"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (l(e.SpinningCraneKick) and (h >= 7 or h == 6 and T() >= 2.7 or h == 5 and T() >= 2.9)) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick aoe 34"
        end

    end

    if e.StrikeoftheWindlord:IsReady() and y and t:IsInRange(8) then
        if i(e.StrikeoftheWindlord, nil, nil, not t:IsInMeleeRange(5)) then
            a = 392983
            return "strike_of_the_windlord aoe 36"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (l(e.SpinningCraneKick) and h >= 5) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick aoe 38"
        end

    end

    if e.FistsofFury:IsReady() and not R and t:IsInRange(8) then
        if i(e.FistsofFury, nil, nil, not t:IsInMeleeRange(8)) then
            a = 113656
            return "fists_of_fury aoe 40"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (l(e.SpinningCraneKick) and ((h >= 4 and T() >= 2.5) or not e.ShadowboxingTreads:IsAvailable())) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick aoe 42"
        end

    end

    if e.BlackoutKick:IsReady() and (l(e.BlackoutKick)) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick aoe 44"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick aoe 44"
            end

        end

    end

    if e.RushingJadeWind:IsReady() and t:IsInRange(8) and (o:BuffDown(e.RushingJadeWindBuff)) then
        if i(e.RushingJadeWind, nil, nil, not t:IsInMeleeRange(8)) then
            a = 116847
            return "rushing_jade_wind aoe 46"
        end

    end

    if e.RisingSunKick:IsReady() then
        if u.CastTargetIf(e.RisingSunKick, c, "min", r, v) then
            return "Rising Sun Kick 48"
        end

        if r(t) and v(t) then
            if n.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                a = 107428
                return "Rising Sun Kick 48"
            end

        end

    end

    if e.WhirlingDragonPunch:IsReady() and not z and not j and t:IsInRange(8) then
        if i(e.WhirlingDragonPunch, nil, nil, not t:IsInMeleeRange(5)) then
            a = 152175
            return "whirling_dragon_punch aoe 50"
        end

    end

end

local function U()
    if e.FaelineStomp:IsCastable() and y and t:IsInRange(8) and (l(e.FaelineStomp) and ((not e.FaelineHarmony:IsAvailable()) or t:DebuffRemains(e.FaeExposureDebuff) < 1)) then
        if i(e.FaelineStomp, nil, s.Commons.DisplayStyle.Signature, not t:IsInRange(30)) then
            a = 327104
            return "faeline_stomp st_cleave 2"
        end

    end

    if e.BlackoutKick:IsReady() and (o:BuffStack(e.TeachingsoftheMonasteryBuff) == 3 and e.ShadowboxingTreads:IsAvailable()) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick st_cleave 4"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick st_cleave 4"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (l(e.SpinningCraneKick) and o:BuffUp(e.DanceofChijiBuff)) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick st_cleave 6"
        end

    end

    if e.StrikeoftheWindlord:IsReady() and y and t:IsInRange(8) and (e.Thunderfist:IsAvailable()) then
        if i(e.StrikeoftheWindlord, nil, nil, not t:IsInMeleeRange(5)) then
            a = 392983
            return "strike_of_the_windlord st_cleave 8"
        end

    end

    if e.RisingSunKick:IsReady() and (h == 1 and o:BuffUp(e.KicksofFlowingMomentumBuff)) then
        if u.CastTargetIf(e.RisingSunKick, c, "min", r, v) then
            return "rising_sun_kick st_cleave 10"
        end

        if r(t) and v(t) then
            if n.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                a = 107428
                return "rising_sun_kick st_cleave 10"
            end

        end

    end

    if e.BlackoutKick:IsReady() and (o:BuffStack(e.TeachingsoftheMonasteryBuff) == 2 and e.ShadowboxingTreads:IsAvailable()) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick st_cleave 12"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick st_cleave 12"
            end

        end

    end

    if e.FistsofFury:IsReady() and not R and t:IsInRange(8) then
        if i(e.FistsofFury, nil, nil, not t:IsInMeleeRange(8)) then
            a = 113656
            return "fists_of_fury st_cleave 14"
        end

    end

    if e.StrikeoftheWindlord:IsReady() and y and t:IsInRange(8) then
        if i(e.StrikeoftheWindlord, nil, nil, not t:IsInMeleeRange(5)) then
            a = 392983
            return "strike_of_the_windlord st_cleave 16"
        end

    end

    if e.BlackoutKick:IsReady() and t:IsInRange(8) and (o:BuffUp(e.TeachingsoftheMonasteryBuff) and ((e.ShadowboxingTreads:IsAvailable() and h > 1) or e.RisingSunKick:CooldownRemains() > 1)) then
        if i(e.BlackoutKick, nil, nil, not t:IsInMeleeRange(5)) then
            a = 100784
            return "blackout_kick st_cleave 18"
        end

    end

    if e.WhirlingDragonPunch:IsReady() and not z and not j and t:IsInRange(8) and (h == 2) then
        if i(e.WhirlingDragonPunch, nil, nil, not t:IsInMeleeRange(5)) then
            a = 152175
            return "whirling_dragon_punch st_cleave 20"
        end

    end

    if e.BlackoutKick:IsReady() and (o:BuffStack(e.TeachingsoftheMonasteryBuff) == 3) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick st_cleave 22"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick st_cleave 22"
            end

        end

    end

    if e.RisingSunKick:IsReady() and ((h == 1 or not e.ShadowboxingTreads:IsAvailable()) and e.FistsofFury:CooldownRemains() > 4 and e.XuensBattlegear:IsAvailable()) then
        if u.CastTargetIf(e.RisingSunKick, c, "min", r, v) then
            return "rising_sun_kick st_cleave 24"
        end

        if r(t) and v(t) then
            if n.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                a = 107428
                return "rising_sun_kick st_cleave 24"
            end

        end

    end

    if e.BlackoutKick:IsReady() and (l(e.BlackoutKick) and h == 2 and e.RisingSunKick:CooldownDown() and e.FistsofFury:CooldownDown()) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick st_cleave 26"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick st_cleave 26"
            end

        end

    end

    if e.RushingJadeWind:IsReady() and t:IsInRange(8) and (o:BuffDown(e.RushingJadeWindBuff) and h == 2) then
        if i(e.RushingJadeWind, nil, nil, not t:IsInMeleeRange(8)) then
            a = 116847
            return "rushing_jade_wind st_cleave 28"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (o:BuffUp(e.BonedustBrewBuff) and l(e.SpinningCraneKick) and (h > 1 or T() >= 2.7)) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick st_cleave 30"
        end

    end

    if e.RisingSunKick:IsReady() then
        if u.CastTargetIf(e.RisingSunKick, c, "min", r, v) then
            return "rising_sun_kick st_cleave 32"
        end

        if r(t) and v(t) then
            if n.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                a = 107428
                return "rising_sun_kick st_cleave 32"
            end

        end

    end

    if e.WhirlingDragonPunch:IsReady() and not z and not j and t:IsInRange(8) then
        if i(e.WhirlingDragonPunch, nil, nil, not t:IsInMeleeRange(5)) then
            a = 152175
            return "whirling_dragon_punch st_cleave 34"
        end

    end

    if e.RushingJadeWind:IsReady() and t:IsInRange(8) and (o:BuffDown(e.RushingJadeWindBuff)) then
        if i(e.RushingJadeWind, nil, nil, not t:IsInMeleeRange(8)) then
            a = 116847
            return "rushing_jade_wind st_cleave 36"
        end

    end

    if e.BlackoutKick:IsReady() and (l(e.BlackoutKick)) then
        if u.CastTargetIf(e.BlackoutKick, c, "min", r, f, not t:IsInMeleeRange(5)) then
            return "blackout_kick st_cleave 38"
        end

        if r(t) and f(t) then
            if n.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                a = 100784
                return "blackout_kick st_cleave 38"
            end

        end

    end

end

local function f()
    if e.CracklingJadeLightning:IsReady() and t:IsInRange(8) and ((o:BuffStack(e.TheEmperorsCapacitorBuff) > 19 and O() > e.CracklingJadeLightning:ExecuteTime() - 1 and e.RisingSunKick:CooldownRemains() > e.CracklingJadeLightning:ExecuteTime()) or (o:BuffStack(e.TheEmperorsCapacitorBuff) > 14 and (e.Serenity:CooldownRemains() < 5 and e.Serenity:IsAvailable() or d < 5))) then
        if i(e.CracklingJadeLightning, nil, nil, not t:IsSpellInRange(e.CracklingJadeLightning)) then
            a = 117952
            return "crackling_jade_lightning fallthru 2"
        end

    end

    if e.TigerPalm:IsReady() and (l(e.TigerPalm) and o:BuffUp(e.BonedustBrewBuff) and o:ChiDeficit() >= (2 + _(o:BuffUp(e.PowerStrikesBuff)))) then
        if u.CastTargetIf(e.TigerPalm, c, "min", p, w, not t:IsInMeleeRange(5)) then
            return "tiger_palm fallthru 4"
        end

        if p(t) and w(t) then
            if n.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                a = 100780
                return "tiger_palm fallthru 4"
            end

        end

    end

    if e.ExpelHarm:IsReady() and t:IsInRange(8) and (o:ChiDeficit() >= 1) then
        if i(e.ExpelHarm, nil, nil, not t:IsInMeleeRange(8)) then
            a = 322101
            return "expel_harm fallthru 6"
        end

    end

    if e.ChiBurst:IsCastable() and t:IsInRange(30) and not o:IsMoving() and (I == 0 or I > e.ChiBurst:CastTime() + .5) and ((o:ChiDeficit() >= 1 and h == 1) or (o:ChiDeficit() >= 2 and h >= 2)) then
        if i(e.ChiBurst, nil, nil, not t:IsInRange(40)) then
            a = 123986
            return "chi_burst fallthru 8"
        end

    end

    if e.ChiWave:IsCastable() and t:IsInRange(40) then
        if i(e.ChiWave, nil, nil, not t:IsInRange(40)) then
            a = 115098
            return "chi_wave fallthru 10"
        end

    end

    if e.TigerPalm:IsReady() and (l(e.TigerPalm) and o:ChiDeficit() >= (2 + _(o:BuffUp(e.PowerStrikesBuff))) and o:BuffDown(e.StormEarthAndFireBuff)) then
        if u.CastTargetIf(e.TigerPalm, c, "min", p, w, not t:IsInMeleeRange(5)) then
            return "tiger_palm fallthru 12"
        end

        if p(t) and w(t) then
            if n.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                a = 100780
                return "tiger_palm fallthru 12"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (l(e.SpinningCraneKick) and o:BuffStack(e.ChiEnergyBuff) > 30 - 5 * h and o:BuffDown(e.StormEarthAndFireBuff) and ((e.RisingSunKick:CooldownRemains() > 2 and e.FistsofFury:CooldownRemains() > 2) or (e.RisingSunKick:CooldownRemains() < 3 and e.FistsofFury:CooldownRemains() > 3 and o:Chi() > 3) or (e.RisingSunKick:CooldownRemains() > 3 and e.FistsofFury:CooldownRemains() < 3 and o:Chi() > 4) or (o:ChiDeficit() <= 1 and O() < 2)) or (o:BuffStack(e.ChiEnergyBuff) > 10 and d < 7)) then
        if i(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            a = 101546
            return "spinning_crane_kick fallthru 14"
        end

    end

    if e.TigerPalm:IsReady() and (l(e.TigerPalm) and o:ChiDeficit() >= (2 + _(o:BuffUp(e.PowerStrikesBuff)))) then
        if u.CastTargetIf(e.TigerPalm, c, "min", p, w, not t:IsInMeleeRange(5)) then
            return "tiger_palm fallthru 16"
        end

        if p(t) and w(t) then
            if n.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                a = 100780
                return "tiger_palm fallthru 16"
            end

        end

    end

    if e.ArcaneTorrent:IsCastable() and m() and t:IsInRange(8) and s.Commons.Enabled.Racials and (o:ChiDeficit() >= 1) then
        if i(e.ArcaneTorrent, nil) then
            a = 50613
            return "arcane_torrent fallthru 18"
        end

    end

    if e.FlyingSerpentKick:IsCastable() and not s.Windwalker.IgnoreFSK then
        if i(e.FlyingSerpentKick, nil, nil, not t:IsInRange(30)) then
            a = 101545
            return "flying_serpent_kick fallthru 20"
        end

    end

end

local function r()
    if e.ExpelHarm:IsReady() and t:IsInRange(8) and (o:ChiDeficit() >= 1 and (O() < 1 or e.Serenity:CooldownRemains() < 2 or (O() < 4 and e.FistsofFury:CooldownRemains() < 1.5)) and (o:BuffDown(e.BonedustBrewBuff) or o:BloodlustUp() or o:BuffUp(e.InvokersDelightBuff))) then
        if i(e.ExpelHarm, nil, nil, not t:IsInMeleeRange(8)) then
            a = 322101
            return "expel_harm spend_energy 2"
        end

    end

    if e.TigerPalm:IsReady() and (o:BuffStack(e.TeachingsoftheMonasteryBuff) < 3 and l(e.TigerPalm) and o:ChiDeficit() >= (2 + _(o:BuffUp(e.PowerStrikesBuff))) and (O() < 1 or e.Serenity:CooldownRemains() < 2 or (O() < 4 and e.FistsofFury:CooldownRemains() < 1.5))) then
        if u.CastTargetIf(e.TigerPalm, c, "min", p, w, not t:IsInMeleeRange(5)) then
            return "tiger_palm spend_energy 4"
        end

        if p(t) and w(t) then
            if n.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                a = 100780
                return "tiger_palm fallthru 16"
            end

        end

    end

end

local function l()
    B = HeroRotationCharDB.Toggles[6]
    he = HeroRotationCharDB.Toggles[4]
    y = HeroRotationCharDB.Toggles[5]
    N = HeroRotationCharDB.Toggles[12]
    se = not HeroRotationCharDB.Toggles[15]
    j = HeroRotationCharDB.Toggles[31]
    Z = HeroRotationCharDB.Toggles[32]
    R = HeroRotationCharDB.Toggles[33]
    F = HeroRotationCharDB.Toggles[34]
    W = HeroRotationCharDB.Toggles[35]
    M = HeroRotationCharDB.Toggles[36]
    C = HeroRotationCharDB.Toggles[37]
    te = HeroRotationCharDB.Toggles[38]
    Y = HeroRotationCharDB.Toggles[39]
    z = false
    A = false
    D = false
    if ((s.Windwalker.IncludedCooldowns.Xuen and m()) or (s.Windwalker.IncludedSmallCooldowns.Xuen and (m() or y)) or (not s.Windwalker.IncludedSmallCooldowns.Xuen and not s.Windwalker.IncludedCooldowns.Xuen and not s.Windwalker.IncludedSmallCooldowns.SEFEcho and not s.Windwalker.IncludedCooldowns.SEFEco)) then
        A = true
    end

    if ((s.Windwalker.IncludedCooldowns.SEFFull and m()) or (s.Windwalker.IncludedSmallCooldowns.SEFFull and (m() or y)) or (not s.Windwalker.IncludedSmallCooldowns.SEFFull and not s.Windwalker.IncludedCooldowns.SEFFull)) or ((s.Windwalker.IncludedCooldowns.SEFEco and m() and e.StormEarthAndFire:ChargesFractional() > s.Windwalker.SEFEcoCharge) or (s.Windwalker.IncludedSmallCooldowns.SEFEco and (m() or y) and e.StormEarthAndFire:ChargesFractional() > s.Windwalker.SEFEcoCharge) or (not s.Windwalker.IncludedSmallCooldowns.SEFEco and not s.Windwalker.IncludedCooldowns.SEFEco and e.StormEarthAndFire:ChargesFractional() > s.Windwalker.SEFEcoCharge)) then
        D = true
    end

    I = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                I = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

            if not s.Commons.Enabled.TopTrinket and not s.Commons.Enabled.BotTrinket then
        L = { V, Q }
    elseif not s.Commons.Enabled.TopTrinket and s.Commons.Enabled.BotTrinket then
        L = { V }
    elseif not s.Commons.Enabled.BotTrinket and s.Commons.Enabled.TopTrinket then
        L = { Q }
    end

end

local function m()
    local o = 0
    local i = { 322968, 319603, 319611, 325876, 334493, 334496, 332605, 328494, 326836, 336277, 319669, 323831, 330725, 333299 }
    if UnitExists("mouseover") then
        if UnitIsDead("mouseover") == true and UnitCanAttack("player", "mouseover") ~= true then
            o = 9999
        else
            for e = 0, 40 do
                local t, t, t, e, t, t, t, t, t, a = UnitDebuff("mouseover", e)
                for i, t in G(i) do
                    if t == a then
                                                                                                if (e == "Magic") then
                            o = 1
                        elseif (e == "Poison") then
                            o = 2
                        elseif (e == "Disease") then
                            o = 3
                        elseif (e == "Curse") then
                            o = 4
                        end

                    end

                end

            end

        end

    end

    if o == 2 or DebuffCheckC == 3 and e.Detox:IsReady() and x("mouseover"):IsInRange(40) then
        if n.Cast(e.Detox, nil, nil, not t:IsInRange(40)) then
            a = 218164
            return "Detox MO"
        end

    end

end

local function r()
    c = o:GetEnemiesInMeleeRange(5)
    S = o:GetEnemiesInMeleeRange(8)
    if ee() then
        h = #S
    else
        h = 1
    end

    if u.TargetIsValid() or o:AffectingCombat() then
        P = E.BossFightRemains(nil, true)
        d = P
        if d == 11111 then
            d = E.FightRemains(S, false)
        end

    end

    if u.TargetIsValid() or o:AffectingCombat() then
        q = e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24
    end

    if not BotOn then
        b = 0
        a = 0
        H = 0
    end

    if b > 0 then
        b = 0
    end

    if a > 0 then
        a = 0
    end

    if H > 0 then
        H = 0
    end

    ShouldReturn = l()
    if not t:IsInMeleeRange(10) and h > 0 and s.Windwalker.TargetSwap == "AutoSwap" and not N then
        b = 999
    end

    ShouldReturn = m()
    if not o:AffectingCombat() and not o:IsDeadOrGhost() and B then
        local e = ne()
        if e then
            return e
        end

    end

    if u.TargetIsValid() and not o:IsDeadOrGhost() and o:AffectingCombat() then
        if e.FlyingSerpentKickLand:IsReady() and not Z and not s.Windwalker.IgnoreFSK and o:AffectingCombat() then
            if n.Cast(e.FlyingSerpentKickLand, nil, nil, not t:IsInRange(40)) then
                a = 101545
                return "Flying Serpent Kick Slam 740"
            end

        end

        k = ((not e.InvokeXuenTheWhiteTiger:IsAvailable()) or e.InvokeXuenTheWhiteTiger:CooldownRemains() > d or (d - e.InvokeXuenTheWhiteTiger:CooldownRemains() < 120 and ((e.Serenity:IsAvailable() and d > e.Serenity:CooldownRemains() and e.Serenity:CooldownRemains() > 10) or (e.StormEarthAndFire:FullRechargeTime() < d and e.StormEarthAndFire:FullRechargeTime() > 15) or (e.StormEarthAndFire:Charges() == 0 and e.StormEarthAndFire:CooldownRemains() < d))))
        X = ((e.BonedustBrew:CooldownUp() and e.StormEarthAndFire:Charges() < 2 and o:Chi() < 3) or (o:BuffRemains(e.BonedustBrew) < 8))
        if s.Commons.Enabled.Potions then
            local t = u.PotionSelected()
            if t and t:IsReady() then
                                                if (o:BloodlustUp() and n.GUISettings.General.HoldPotforBL) then
                    if i(t, nil, nil) then
                        a = 32
                        return "potion with BL 4"
                    end

                elseif e.InvokeXuenTheWhiteTiger:IsAvailable() and not n.GUISettings.General.HoldPotforBL then
                    if (((o:BuffUp(e.SerenityBuff) or o:BuffUp(e.StormEarthAndFireBuff)) and q) or (d <= 60)) then
                        if i(t, nil, nil) then
                            a = 32
                            return "potion with xuen main 4"
                        end

                    end

                elseif not n.GUISettings.General.HoldPotforBL then
                    if ((o:BuffUp(e.SerenityBuff) or o:BuffUp(e.StormEarthAndFireBuff)) or (d <= 60)) then
                        if i(t, nil, nil) then
                            a = 32
                            return "potion without xuen main 6"
                        end

                    end

                end

            end

        end

        if o:IsChanneling(e.FistsofFury) and (te) then
            if n.Cast(e.PoolEnergy, nil, nil, nil) then
                a = 1000
                return "Casting FoF"
            end

        end

                if o:IsChanneling(e.FistsofFury) and (not interruptFoF1 or e.RisingSunKick:CooldownRemains() <= 0) and o:AffectingCombat() then
            if n.Cast(e.PoolEnergy, nil, nil, nil) then
                a = 99999
                return "Casting FoF"
            end

        elseif (interruptFoF1 == true) and not o:IsChanneling(e.FistsofFury) then
            interruptFoF1 = false
        end

        if o:IsChanneling(e.FistsofFury) then
            if o:AffectingCombat() and s.Windwalker.CastCancelFC and interruptFoF1 then
                a = 1999
            end

        end

        if n.QueuedCast() then
            a = n.QueuedCast()
            return "Custom Queue " .. J(a):ID()
        end

                if (F and e.LegSweep:IsUsableP() and e.LegSweep:CooldownRemains(BypassRecovery) <= 0) then
            if n.Cast(e.LegSweep, nil, nil, nil) then
                a = 119381
                return "queue Leg Sweep"
            end

        elseif ((not e.LegSweep:IsUsableP() or e.LegSweep:CooldownRemains(BypassRecovery) > 0) and F) then
            HeroRotationCharDB.Toggles[34] = not HeroRotationCharDB.Toggles[34]
            n.Print("Leg Sweep Queue is now " .. (HeroRotationCharDB.Toggles[34] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

                if (W and e.Paralysis:IsUsableP() and e.Paralysis:CooldownRemains(BypassRecovery) <= 0) then
            if n.Cast(e.Paralysis, nil, nil, nil) then
                if x("mouseover"):GUID() ~= nil and x("mouseover"):IsSpellInRange(e.Paralysis) then
                    b = 1115078
                    return "queue Paralysis MO"
                else
                    a = 115078
                    return "queue Paralysis"
                end

            end

        elseif ((not e.Paralysis:IsUsableP() or e.Paralysis:CooldownRemains(BypassRecovery) > 0) and W) then
            HeroRotationCharDB.Toggles[35] = not HeroRotationCharDB.Toggles[35]
            n.Print("Paralysis Queue is now " .. (HeroRotationCharDB.Toggles[35] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

                if (M and e.RingOfPeace:IsAvailable() and e.RingOfPeace:IsUsableP() and e.RingOfPeace:CooldownRemains(BypassRecovery) <= 0) then
            if n.Cast(e.RingOfPeace, nil, nil, nil) then
                a = 116844
                return "queue RingOfPeace"
            end

        elseif ((not e.RingOfPeace:IsUsableP() or e.RingOfPeace:CooldownRemains(BypassRecovery) > 0 or not e.RingOfPeace:IsAvailable()) and M) then
            HeroRotationCharDB.Toggles[36] = not HeroRotationCharDB.Toggles[36]
            n.Print("RingOfPeace Queue is now " .. (HeroRotationCharDB.Toggles[36] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

                if (C and e.BonedustBrew:IsUsableP() and e.BonedustBrew:CooldownRemains(BypassRecovery) <= 0) then
            if n.Cast(e.BonedustBrew, nil, nil, nil) then
                a = 325216
                return "queue BonedustBrew"
            end

        elseif ((not e.BonedustBrew:IsUsableP() or e.BonedustBrew:CooldownRemains(BypassRecovery) > 0) and C) then
            HeroRotationCharDB.Toggles[37] = not HeroRotationCharDB.Toggles[37]
            n.Print("BonedustBrew Queue is now " .. (HeroRotationCharDB.Toggles[37] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

        if (o:AffectingCombat()) then
            if e.FortifyingBrew:IsReady() and o:HealthPercentage() < s.Commons.FortifyingBrew then
                if n.Cast(e.FortifyingBrew, nil, nil, nil) then
                    a = 243435
                    return "Fortifying Brew 100"
                end

            end

            if e.TouchOfKarma:IsReady() and o:HealthPercentage() < s.Commons.TouchofKarma then
                if n.Cast(e.TouchOfKarma, nil, nil, nil) then
                    a = 122470
                    return "ToK 100"
                end

            end

            if o:HealthPercentage() < s.Commons.PhialHP and g.PhialofSerenity:IsReady() and g.PhialofSerenity:CooldownRemains() <= 0 then
                if n.Cast(g.PhialofSerenity, nil) then
                    a = 55
                    return "PhialofSerenity HP"
                end

            end

            if o:HealthPercentage() < s.Commons.HealthstoneHP and g.Healthstone:IsReady() and g.Healthstone:CooldownRemains() <= 0 then
                if n.Cast(g.Healthstone, nil) then
                    a = 40
                    return "Healthstone HP"
                end

            end

            if o:HealthPercentage() < s.Commons.HealPotHP and g.CosmicHealPot:IsReady() and g.CosmicHealPot:CooldownRemains() <= 0 then
                if n.Cast(g.CosmicHealPot, nil) then
                    a = 45
                    return "CosmicHealPot HP"
                end

            end

            if o:HealthPercentage() < s.Commons.HealPotHP and g.HealPot:IsReady() and g.HealPot:CooldownRemains() <= 0 then
                if n.Cast(g.HealPot, nil) then
                    a = 41
                    return "HealPot HP"
                end

            end

        end

        if (not e.Serenity:IsAvailable()) then
            local e = ae()
            if e then
                return e
            end

        end

        if (e.Serenity:IsAvailable()) then
            local e = oe()
            if e then
                return e
            end

        end

        if o:BuffUp(e.SerenityBuff) then
            local e = K()
            if e then
                return e
            end

        end

        if (ee() and h >= 3) then
            local e = ie()
            if e then
                return e
            end

        end

        if (h < 3) then
            local e = U()
            if e then
                return e
            end

        end

        if (true) then
            local e = f()
            if e then
                return e
            end

        end

        if o:AffectingCombat() then
            if n.Cast(e.PoolEnergy) and not s.Windwalker.NoWindwalkerPooling then
                return "Pool Energy"
            end

        end

    end

end

local function e()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        n.ToggleIconFrame:UpdateButtonText(6)
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
    if b == 0 then
        return 0
    else
        return b
    end

end

function ReturnSpellFocus()
    if H == 0 then
        return 0
    else
        return H
    end

end

n.SetAPL(269, r, e)

