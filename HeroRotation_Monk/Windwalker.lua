local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = f.Pet;
local j = d.Spell;
local k = d.MultiSpell;
local l = d.Item;
local m = HeroRotation;
local n = m.Cast;
local o = m.CDsON;
local p = m.AoEON;
local q = HeroRotationCharDB.Toggles[4]
local r = HeroRotationCharDB.Toggles[5]
local s = HeroRotationCharDB.Toggles[6]
local t = not HeroRotationCharDB.Toggles[15]
local u = HeroRotationCharDB.Toggles[31]
local v = HeroRotationCharDB.Toggles[32]
local w = HeroRotationCharDB.Toggles[33]
local x = HeroRotationCharDB.Toggles[34]
local y = HeroRotationCharDB.Toggles[35]
local z = HeroRotationCharDB.Toggles[36]
local A = HeroRotationCharDB.Toggles[37]
local B = HeroRotationCharDB.Toggles[38]
local C = HeroRotationCharDB.Toggles[39]
local D = HeroRotationCharDB.Toggles[12]
local pairs = pairs;
local E = 0;
local F = nil;
local G = nil;
local H = false;
local I = false;
local J = GetInventoryItemID("player", 13)
local K = GetInventoryItemID("player", 14)
local L = j.Monk.Windwalker;
local M = l.Monk.Windwalker;
local N = {}
local O;
local P;
local Q;
local R = 11111;
local S = 11111;
local T;
local U = false;
local V = false;
local W = false;
local X = false;
local Y = false;
local Z = 0;
local _ = 0;
local a0;
local a1 = 0;
local a2 = false;
local a3 = 0;
local a4 = m.Commons.Everyone;
local a5 = m.Commons.Monk;
local a6 = { General = m.GUISettings.General, Commons = m.GUISettings.APL.Monk.Commons,
    Windwalker = m.GUISettings.APL.Monk.Windwalker }
d:RegisterForEvent(function()
    a3 = 0;
    R = 11111;
    S = 11111
end, "PLAYER_REGEN_ENABLED")
d:RegisterForEvent(function() VarTrinketType = L.Serenity:IsAvailable() and 1 or 2 end, "PLAYER_TALENT_UPDATE")
d:RegisterForEvent(
    function()
        equip = g:GetEquipment()
        trinket1 = equip[13] and l(equip[13]) or l(0)
        trinket2 = equip[14] and l(equip[14]) or l(0)
    end, "PLAYER_EQUIPMENT_CHANGED")
local function a7(a8) if a8 then return 1 else return 0 end end
;
local function a9(a8) return a8 ~= 0 end
;
local function aa() return math.floor(g:EnergyTimeToMaxPredicted() * 10 + 0.5) / 10 end
;
local function ab() return math.floor(g:EnergyPredicted() + 0.5) end
;
local function ac(ad) return not g:PrevGCD(1, ad) end
;
local function ae()
    if not L.MarkoftheCrane:IsAvailable() then return 0 end
    ;
    local af = 0;
    if P then for ag, ah in pairs(P) do if ah:DebuffUp(L.MarkoftheCraneDebuff) then af = af + 1 end end end
    ;
    return af
end
;
local function ai()
    if not L.MarkoftheCrane:IsAvailable() then return 0 end
    ;
    local af = ae()
    local aj = 1;
    if af > 0 then aj = aj * (1 + af * 0.18) end
    ;
    aj = aj * (1 + 0.1 * L.CraneVortex:TalentRank())
    aj = aj * (1 + 0.3 * a7(g:BuffUp(L.KicksofFlowingMomentumBuff)))
    aj = aj * (1 + 0.05 * L.FastFeet:TalentRank())
    return aj
end
;
local function ak()
    if not L.MarkoftheCrane:IsAvailable() then return true end
    ;
    local af = ae()
    if Q == af or af >= 5 then return true end
    ;
    return false
end
;
local function al(am) return am:DebuffRemains(L.MarkoftheCraneDebuff) end
;
local function an(am) return am:DebuffRemains(L.MarkoftheCraneDebuff) + a7(am:DebuffUp(L.SkyreachExhaustionDebuff)) * 20 end
;
local function ao(am) if am:IsInMeleeRange(10) and am:GUID() == f("mouseover"):GUID() then
        Z = 1100780;
        return true
    elseif am:IsInMeleeRange(10) and a6.Windwalker.TargetSwap == "AutoSwap" and am:GUID() ~= h:GUID() and not D and not string.find(am:GUID(), 174773) then
        Z = 999;
        return true
    elseif am:IsInMeleeRange(10) and am:GUID() == h:GUID() then
        _ = 100780;
        return true
    elseif am:IsInMeleeRange(10) and not string.find(am:GUID(), 174773) then return true end end
;
local function ap(am) if am:IsInMeleeRange(10) and am:GUID() == f("mouseover"):GUID() then
        Z = 1100784;
        return true
    elseif am:IsInMeleeRange(10) and a6.Windwalker.TargetSwap == "AutoSwap" and am:GUID() ~= h:GUID() and not D then
        Z = 999;
        return true
    elseif am:IsInMeleeRange(10) and am:GUID() == h:GUID() then
        _ = 100784;
        return true
    elseif am:IsInMeleeRange(10) then return true end end
;
local function aq(am) if am:IsInMeleeRange(10) and am:GUID() == f("mouseover"):GUID() then
        Z = 1107428;
        return true
    elseif am:IsInMeleeRange(10) and a6.Windwalker.TargetSwap == "AutoSwap" and am:GUID() ~= h:GUID() and not D and not string.find(am:GUID(), 174773) then
        Z = 999;
        return true
    elseif am:IsInMeleeRange(10) and am:GUID() == h:GUID() then
        _ = 107428;
        return true
    elseif am:IsInMeleeRange(10) and not string.find(am:GUID(), 174773) then return true end end
;
local function ar()
    local as = g:GetUseableTrinkets(N)
    if as then if as:ID() == GetInventoryItemID("player", 13) and a6.Commons.Enabled.TopTrinket then if m.Cast(as, nil, nil) then
                _ = 24;
                return "top trinket 1"
            end elseif as:ID() == GetInventoryItemID("player", 14) and a6.Commons.Enabled.BottomTrinket then if m.Cast(as, nil, nil) then
                _ = 35;
                return "bot trinket 1"
            end end end
end
;
local function at()
    if L.SummonWhiteTigerStatue:IsCastable() and o() and h:IsInRange(8) then if n(L.SummonWhiteTigerStatue, nil, nil, not h:IsInRange(40)) then
            _ = 388686;
            return "summon_white_tiger_statue precombat 2"
        end end
    ;
    if L.ExpelHarm:IsReady() and h:IsInRange(10) and g:Chi() < g:ChiMax() then if m.Cast(L.ExpelHarm, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 322101;
            return "expel_harm opener 4"
        end end
    ;
    if L.ChiBurst:IsReady() and h:IsInRange(30) and not g:IsMoving() and (E == 0 or E > L.ChiBurst:CastTime() + 0.5) and not L.FaelineStomp:IsAvailable() then if m.Cast(L.ChiBurst, nil, nil, not h:IsInRange(40)) then
            _ = 123986;
            return "Chi Burst 6"
        end end
    ;
    if L.ChiWave:IsReady() and h:IsInRange(40) then if m.Cast(L.ChiWave, nil, nil, not h:IsInRange(40)) then
            _ = 115098;
            return "Chi Wave 8"
        end end
end
;
local function au()
    if L.ExpelHarm:IsReady() and (L.ChiBurst:IsAvailable() and g:ChiDeficit() >= 3) then if n(L.ExpelHarm, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 322101;
            return "expel_harm opener 2"
        end end
    ;
    if L.TigerPalm:IsReady() and (ac(L.TigerPalm) and g:ChiDeficit() >= 2 + a7(g:BuffUp(L.PowerStrikesBuff))) then if a4.CastTargetIf(L.TigerPalm, O, "min", an, nil, not h:IsInMeleeRange(5)) then
            _ = 100780;
            return "tiger_palm opener 4"
        end end
    ;
    if L.ChiWave:IsReady() and g:ChiDeficit() >= 2 then if n(L.ChiWave, nil, nil, not h:IsInRange(40)) then
            _ = 115098;
            return "chi_wave opener 6"
        end end
    ;
    if L.ExpelHarm:IsReady() then if n(L.ExpelHarm, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 322101;
            return "expel_harm opener 10"
        end end
    ;
    if L.TigerPalm:IsReady() and g:ChiDeficit() >= 2 + a7(g:BuffUp(L.PowerStrikesBuff)) then if a4.CastTargetIf(L.TigerPalm, O, "min", an, nil, not h:IsInMeleeRange(5)) then
            _ = 100780;
            return "tiger_palm opener 12"
        end end
end
;
local function av()
    if L.BonedustBrew:IsCastable() and (ak() and g:Chi() >= 4) then if n(L.BonedustBrew, nil, nil, not h:IsInRange(40)) then
            _ = 325216;
            return "bonedust_brew bdb_setup 2"
        end end
    ;
    if L.BlackoutKick:IsReady() and (ac(L.BlackoutKick) and not L.WhirlingDragonPunch:IsAvailable()) then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return
            "blackout_kick bdb_setup 4" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick bdb_setup 4"
            end end
    end
    ;
    if L.RisingSunKick:IsReady() and (ac(L.RisingSunKick) and g:Chi() >= 5) then
        if a4.CastTargetIf(L.RisingSunKick, O, "min", al, aq, not h:IsInMeleeRange(5)) then return
            "rising_sun_kick bdb_setup 6" end
        ;
        if al(h) and aq(h) then if m.Cast(L.RisingSunKick, nil, nil, not h:IsSpellInRange(L.RisingSunKick)) then
                _ = 107428;
                return "rising_sun_kick bdb_setup 6"
            end end
    end
    ;
    if L.TigerPalm:IsReady() and (ac(L.TigerPalm) and g:ChiDeficit() >= 2) then
        if a4.CastTargetIf(L.TigerPalm, O, "min", an, ao, not h:IsInMeleeRange(5)) then return "tiger_palm bdb_setup 8" end
        ;
        if an(h) and ao(h) then if m.Cast(L.TigerPalm, nil, nil, not h:IsSpellInRange(L.TigerPalm)) then
                _ = 100780;
                return "tiger_palm bdb_setup 8"
            end end
    end
    ;
    if L.RisingSunKick:IsReady() and (ac(L.RisingSunKick) and Q >= 2) then
        if a4.CastTargetIf(L.RisingSunKick, O, "min", al, aq, not h:IsInMeleeRange(5)) then return
            "rising_sun_kick bdb_setup 10" end
        ;
        if al(h) and aq(h) then if m.Cast(L.RisingSunKick, nil, nil, not h:IsSpellInRange(L.RisingSunKick)) then
                _ = 107428;
                return "rising_sun_kick bdb_setup 10"
            end end
    end
end
;
local function aw()
    if L.SummonWhiteTigerStatue:IsCastable() and o() and h:IsInRange(8) and T then if n(L.SummonWhiteTigerStatue, nil, nil, not h:IsInRange(40)) then
            _ = 388686;
            return "summon_white_tiger_statue cd_serenity 2"
        end end
    ;
    if L.InvokeXuenTheWhiteTiger:IsReady() and H and h:IsInRange(8) and (not V and L.BonedustBrew:IsAvailable() and L.BonedustBrew:CooldownRemains() <= 5 or S < 25) then if m.Cast(L.InvokeXuenTheWhiteTiger, nil, nil, not h:IsInRange(40)) then
            _ = 123904;
            return "invoke_xuen_the_white_tiger cd_serenity 4"
        end end
    ;
    if L.InvokeXuenTheWhiteTiger:IsCastable() and H and h:IsInRange(8) and (not V and not L.BonedustBrew:IsAvailable() and L.RisingSunKick:CooldownRemains() < 2 or S < 25) then if n(L.InvokeXuenTheWhiteTiger, nil, nil, not h:IsInRange(40)) then
            _ = 123904;
            return "invoke_xuen_the_white_tiger cd_serenity 6"
        end end
    ;
    if a6.Commons.Enabled.Trinkets then
        local ShouldReturn = ar()
        if ShouldReturn then return ShouldReturn end
    end
    ;
    if L.BonedustBrew:IsCastable() and o() and h:IsInRange(8) and (g:BuffDown(L.BonedustBrewBuff) and (L.Serenity:CooldownUp() or L.Serenity:CooldownRemains() > 15 or S < 30 and S > 10) or S < 10) then if n(L.BonedustBrew, nil, nil, not h:IsInRange(40)) then
            _ = 325216;
            return "bonedust_brew cd_serenity 8"
        end end
    ;
    if L.Serenity:IsCastable() and o() and h:IsInRange(8) and (T or L.InvokeXuenTheWhiteTiger:CooldownRemains() > 10 or not L.InvokeXuenTheWhiteTiger:IsAvailable() or S < 15) then if n(L.Serenity, a6.Windwalker.OffGCDasOffGCD.Serenity) then
            _ = 152173;
            return "serenity cd_serenity 10"
        end end
    ;
    if L.TouchofDeath:IsReady() and not C and h:IsInRange(8) and (L.InvokeXuenTheWhiteTiger:IsAvailable() and (ac(L.TouchofDeath) and (S > 60 or T and g:BuffUp(L.BonedustBrewBuff) or L.InvokeXuenTheWhiteTiger:CooldownRemains() > S and g:BuffUp(L.BonedustBrewBuff) or S < 10))) then if n(L.TouchofDeath, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 322109;
            return "touch_of_death cd_serenity 12"
        end end
    ;
    if g:BuffUp(L.SerenityBuff) or S < 20 then
        if L.AncestralCall:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials then if m.Cast(L.AncestralCall, nil) then
                _ = 274738;
                return "Ancestral Call 512"
            end end
        ;
        if L.BloodFury:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials then if m.Cast(L.BloodFury, nil) then
                _ = 20572;
                return "Blood Fury 502"
            end end
        ;
        if L.Fireblood:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials then if m.Cast(L.Fireblood, nil) then
                _ = 265221;
                return "Fireblood 510"
            end end
        ;
        if L.Berserking:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials then if m.Cast(L.Berserking, nil) then
                _ = 26297;
                return "Berserking 504"
            end end
        ;
        if L.BagofTricks:IsCastable() and h:IsInRange(8) and a6.Commons.Enabled.Racials then if m.Cast(L.BagofTricks, nil, nil, not h:IsInRange(40)) then
                _ = 312411;
                return "Bag of Tricks 528"
            end end
    end
    ;
    if L.LightsJudgment:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials then if m.Cast(L.LightsJudgment, nil, nil, not h:IsInRange(40)) then
            _ = 255647;
            return "Lights Judgment 508"
        end end
    ;
    if a6.Commons.Enabled.Trinkets then
        local ShouldReturn = ar()
        if ShouldReturn then return ShouldReturn end
    end
end
;
local function ax()
    if L.SummonWhiteTigerStatue:IsCastable() and o() and h:IsInRange(8) and T then if n(L.SummonWhiteTigerStatue, nil, nil, not h:IsInRange(40)) then
            _ = 388686;
            return "summon_white_tiger_statue cd_sef 2"
        end end
    ;
    if L.InvokeXuenTheWhiteTiger:IsReady() and H and h:IsInRange(8) and (not V and L.BonedustBrew:IsAvailable() and L.BonedustBrew:CooldownRemains() <= 5 and (Q < 3 and g:Chi() >= 3 or Q >= 3 and g:Chi() >= 2) or S < 25) then if n(L.InvokeXuenTheWhiteTiger, a6.Windwalker.GCDasOffGCD.InvokeXuenTheWhiteTiger, nil, not h:IsInRange(40)) then
            _ = 123904;
            return "invoke_xuen_the_white_tiger cd_sef 4"
        end end
    ;
    if L.InvokeXuenTheWhiteTiger:IsReady() and H and h:IsInRange(8) and (not V and not L.BonedustBrew:IsAvailable() and L.RisingSunKick:CooldownRemains() < 2 and g:Chi() >= 3) then if n(L.InvokeXuenTheWhiteTiger, a6.Windwalker.GCDasOffGCD.InvokeXuenTheWhiteTiger, nil, not h:IsInRange(40)) then
            _ = 123904;
            return "invoke_xuen_the_white_tiger cd_sef 6"
        end end
    ;
    if a6.Commons.Enabled.Trinkets then
        local ShouldReturn = ar()
        if ShouldReturn then return ShouldReturn end
    end
    ;
    if L.StormEarthAndFire:IsCastable() and (L.BonedustBrew:IsAvailable() and (S < 30 and L.BonedustBrew:CooldownRemains() < 4 and g:Chi() >= 4 or g:BuffUp(L.BonedustBrewBuff) or not ak() and Q >= 3 and L.BonedustBrew:CooldownRemains() <= 2 and g:Chi() >= 2) and (T or L.InvokeXuenTheWhiteTiger:CooldownRemains() > L.StormEarthAndFire:FullRechargeTime())) then if n(L.StormEarthAndFire, a6.Windwalker.OffGCDasOffGCD.StormEarthAndFire) then return
            "storm_earth_and_fire cd_sef 8" end end
    ;
    if L.BonedustBrew:IsCastable() and o() and h:IsInRange(8) and (g:BuffDown(L.BonedustBrewBuff) and g:BuffUp(L.StormEarthAndFireBuff) and g:BuffRemains(L.StormEarthAndFireBuff) < 11 and ak() or g:BuffDown(L.BonedustBrewBuff) and S < 30 and S > 10 and ak() and g:Chi() >= 4 or S < 10) then if n(L.BonedustBrew, nil, nil, not h:IsInRange(40)) then
            _ = 325216;
            return "bonedust_brew cd_sef 10"
        end end
    ;
    if g:BuffDown(L.BonedustBrewBuff) and L.BonedustBrew:IsAvailable() and L.BonedustBrew:CooldownRemains() <= 2 and (S > 60 and (L.StormEarthAndFire:Charges() > 0 or L.StormEarthAndFire:CooldownRemains() > 10) and (T or L.InvokeXuenTheWhiteTiger:CooldownRemains() > 10 or V) or ((T or L.InvokeXuenTheWhiteTiger:CooldownRemains() > 13) and L.StormEarthAndFire:Charges() > 0 or L.StormEarthAndFire:CooldownRemains() > 13 or g:BuffUp(L.StormEarthAndFireBuff))) then
        local ShouldReturn = av()
        if ShouldReturn then return ShouldReturn end
    end
    ;
    if L.StormEarthAndFire:IsCastable() and I and h:IsInRange(10) and (S < 20 or L.StormEarthAndFire:Charges() == 2 and L.InvokeXuenTheWhiteTiger:CooldownRemains() > L.StormEarthAndFire:FullRechargeTime() and L.FistsofFury:CooldownRemains() <= 9 and g:Chi() >= 2 and L.WhirlingDragonPunch:CooldownRemains() <= 12) then if n(L.StormEarthAndFire, nil) then
            _ = 137639;
            return "storm_earth_and_fire cd_sef 12"
        end end
    ;
    if L.TouchofDeath:IsReady() and not C and h:IsInRange(8) and (L.InvokeXuenTheWhiteTiger:IsAvailable() and (ac(L.TouchofDeath) and (S > 60 or g:BuffDown(L.StormEarthAndFireBuff) and T and g:BuffUp(L.BonedustBrewBuff) or L.InvokeXuenTheWhiteTiger:CooldownRemains() > S and g:BuffUp(L.BonedustBrewBuff) or S < 10)) or not L.InvokeXuenTheWhiteTiger:IsAvailable() and (ac(L.TouchofDeath) and (S > 60 or g:BuffDown(L.StormEarthAndFireBuff) and g:BuffUp(L.BonedustBrewBuff) or S < 10))) then if n(L.TouchofDeath, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 322109;
            return "touch_of_death cd_sef 14"
        end end
    ;
    if a6.Commons.Enabled.Trinkets and o() then
        local ShouldReturn = ar()
        if ShouldReturn then return ShouldReturn end
    end
    ;
    if L.AncestralCall:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials and (L.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or V or S < 20) then if n(L.AncestralCall, nil) then
            _ = 274738;
            return "ancestral_call cd_sef 18"
        end end
    ;
    if L.BloodFury:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials and (L.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or V or S < 20) then if n(L.BloodFury, nil) then
            _ = 20572;
            return "blood_fury cd_sef 20"
        end end
    ;
    if L.Fireblood:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials and (L.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or V or S < 10) then if n(L.Fireblood, nil) then
            _ = 265221;
            return "fireblood cd_sef 22"
        end end
    ;
    if L.Berserking:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials and (L.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or V or S < 15) then if n(L.Berserking, nil) then
            _ = 26297;
            return "berserking cd_sef 24"
        end end
    ;
    if L.BagofTricks:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials and g:BuffDown(L.StormEarthAndFireBuff) then if n(L.BagofTricks, nil) then
            _ = 312411;
            return "bag_of_tricks cd_sef 26"
        end end
    ;
    if L.LightsJudgment:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials then if n(L.LightsJudgment, nil) then
            _ = 255647;
            return "lights_judgment cd_sef 28"
        end end
end
;
local function ay()
    if L.StrikeoftheWindlord:IsReady() and r and h:IsInRange(8) and Q < 3 then if n(L.StrikeoftheWindlord, nil, nil, not h:IsInMeleeRange(9)) then
            _ = 392983;
            return "strike_of_the_windlord serenity 2"
        end end
    ;
    if L.FaelineStomp:IsCastable() and r and h:IsInRange(8) and (ac(L.FaelineStomp) and (not L.FaelineHarmony:IsAvailable() or h:DebuffRemains(L.FaeExposureDebuff) < 1)) then if n(L.FaelineStomp, nil, nil, not h:IsInRange(30)) then
            _ = 327104;
            return "faeline_stomp serenity 4"
        end end
    ;
    if L.BlackoutKick:IsReady() and (ac(L.BlackoutKick) and g:BuffStack(L.TeachingsoftheMonasteryBuff) == 3) then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return
            "blackout_kick serenity 6" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick serenity 6"
            end end
    end
    ;
    if L.FistsofFury:IsReady() and not w and h:IsInRange(8) and (not g:IsChanneling(L.FistsofFury) and g:BuffRemains(L.SerenityBuff) < 1) then
        interruptFoF1 = true;
        if m.Cast(L.FistsofFury, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 113656;
            return "one_gcd fists_of_fury serenity 8"
        end
    end
    ;
    if L.BlackoutKick:IsReady() and (ac(L.BlackoutKick) and Q == 3 and g:BuffStack(L.TeachingsoftheMonasteryBuff) == 2) then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return
            "blackout_kick serenity 10" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick serenity 10"
            end end
    end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (ac(L.SpinningCraneKick) and (Q > 3 or Q > 2 and ai() >= 2.3)) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick serenity 12"
        end end
    ;
    if L.StrikeoftheWindlord:IsReady() and r and h:IsInRange(8) and Q >= 3 then if n(L.StrikeoftheWindlord, nil, nil, not h:IsInMeleeRange(9)) then
            _ = 392983;
            return "strike_of_the_windlord serenity 14"
        end end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (ac(L.SpinningCraneKick) and Q > 1) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick serenity 16"
        end end
    ;
    if L.WhirlingDragonPunch:IsReady() and not a0 and not u and h:IsInRange(8) and Q > 1 then if n(L.WhirlingDragonPunch, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 152175;
            return "whirling_dragon_punch serenity 18"
        end end
    ;
    if L.BlackoutKick:IsReady() and h:IsInRange(8) and (Q >= 3 and L.FistsofFury:CooldownDown() and L.ShadowboxingTreads:IsAvailable()) then if n(L.BlackoutKick, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 100784;
            return "blackout_kick serenity 20"
        end end
    ;
    if L.RushingJadeWind:IsReady() and h:IsInRange(8) and (g:BuffDown(L.RushingJadeWindBuff) and Q >= 3) then if n(L.RushingJadeWind, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 116847;
            return "rushing_jade_wind serenity 22"
        end end
    ;
    if L.RisingSunKick:IsReady() then
        if a4.CastTargetIf(L.RisingSunKick, O, "min", al, aq) then return "Rising Sun Kick 604" end
        ;
        if al(h) and aq(h) then if m.Cast(L.RisingSunKick, nil, nil, not h:IsSpellInRange(L.RisingSunKick)) then
                _ = 107428;
                return "Rising Sun Kick 606"
            end end
    end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (ac(L.SpinningCraneKick) and g:BuffUp(L.DanceofChijiBuff)) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick serenity 24"
        end end
    ;
    if L.BlackoutKick:IsReady() and h:IsInRange(8) and ac(L.BlackoutKick) then if n(L.BlackoutKick, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 100784;
            return "blackout_kick serenity 26"
        end end
    ;
    if L.WhirlingDragonPunch:IsReady() and not a0 and not u and h:IsInRange(8) then if n(L.WhirlingDragonPunch, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 152175;
            return "whirling_dragon_punch serenity 28"
        end end
    ;
    if L.TigerPalm:IsReady() and h:IsInRange(8) and (L.TeachingsoftheMonastery:IsAvailable() and g:BuffStack(L.TeachingsoftheMonasteryBuff) < 3) then if n(L.TigerPalm, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 100780;
            return "tiger_palm serenity 30"
        end end
    ;
    if a6.Commons.Enabled.Trinkets then
        local ShouldReturn = ar()
        if ShouldReturn then return ShouldReturn end
    end
end
;
local function az()
    if L.FaelineStomp:IsCastable() and r and h:IsInRange(8) and ac(L.FaelineStomp) then if n(L.FaelineStomp, nil, nil, not h:IsInRange(30)) then
            _ = 327104;
            return "faeline_stomp aoe 2"
        end end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (ac(L.SpinningCraneKick) and g:BuffUp(L.DanceofChijiBuff) and Q > 3) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick aoe 4"
        end end
    ;
    if L.StrikeoftheWindlord:IsReady() and r and h:IsInRange(8) and (L.Thunderfist:IsAvailable() and Q > 3) then if n(L.StrikeoftheWindlord, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 392983;
            return "strike_of_the_windlord aoe 6"
        end end
    ;
    if L.WhirlingDragonPunch:IsReady() and not a0 and not u and h:IsInRange(8) and Q > 8 then if n(L.WhirlingDragonPunch, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 152175;
            return "whirling_dragon_punch aoe 8"
        end end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (g:BuffUp(L.BonedustBrewBuff) and ac(L.SpinningCraneKick) and Q > 5 and ai() >= 3.2) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick aoe 10"
        end end
    ;
    if L.BlackoutKick:IsReady() and (g:BuffStack(L.TeachingsoftheMonasteryBuff) == 3 and L.ShadowboxingTreads:IsAvailable()) then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return "blackout_kick aoe 12" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick aoe 12"
            end end
    end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (ac(L.SpinningCraneKick) and g:BuffUp(L.DanceofChijiBuff)) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick aoe 14"
        end end
    ;
    if L.StrikeoftheWindlord:IsReady() and r and h:IsInRange(8) and L.Thunderfist:IsAvailable() then if n(L.StrikeoftheWindlord, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 392983;
            return "strike_of_the_windlord aoe 16"
        end end
    ;
    if L.WhirlingDragonPunch:IsReady() and not a0 and not u and h:IsInRange(8) and Q > 5 then if n(L.WhirlingDragonPunch, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 152175;
            return "whirling_dragon_punch aoe 18"
        end end
    ;
    if L.BlackoutKick:IsReady() and (g:BuffUp(L.TeachingsoftheMonasteryBuff) and (g:BuffStack(L.TeachingsoftheMonasteryBuff) == 2 or Q < 5) and L.ShadowboxingTreads:IsAvailable()) then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return "blackout_kick aoe 20" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick aoe 20"
            end end
    end
    ;
    if L.WhirlingDragonPunch:IsReady() and not a0 and not u and h:IsInRange(8) then if n(L.WhirlingDragonPunch, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 152175;
            return "whirling_dragon_punch aoe 22"
        end end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (g:BuffUp(L.BonedustBrewBuff) and ac(L.SpinningCraneKick)) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick aoe 24"
        end end
    ;
    if L.FistsofFury:IsReady() and not w and h:IsInRange(8) and Q > 3 then if n(L.FistsofFury, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 113656;
            return "fists_of_fury aoe 26"
        end end
    ;
    if L.BlackoutKick:IsReady() and g:BuffStack(L.TeachingsoftheMonasteryBuff) == 3 then if a4.CastTargetIf(L.BlackoutKick, O, "min", al, nil, not h:IsInMeleeRange(5)) then return
            "blackout_kick aoe 28" end end
    ;
    if L.RushingJadeWind:IsReady() and h:IsInRange(8) and (g:BuffDown(L.RushingJadeWindBuff) and Q > 3) then if n(L.RushingJadeWind, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 116847;
            return "rushing_jade_wind aoe 30"
        end end
    ;
    if L.BlackoutKick:IsReady() and (g:BuffUp(L.TeachingsoftheMonasteryBuff) and Q >= 5 and L.ShadowboxingTreads:IsAvailable()) then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return "blackout_kick aoe 32" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick aoe 32"
            end end
    end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (ac(L.SpinningCraneKick) and (Q >= 7 or Q == 6 and ai() >= 2.7 or Q == 5 and ai() >= 2.9)) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick aoe 34"
        end end
    ;
    if L.StrikeoftheWindlord:IsReady() and r and h:IsInRange(8) then if n(L.StrikeoftheWindlord, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 392983;
            return "strike_of_the_windlord aoe 36"
        end end
    ;
    if L.SpinningCraneKick:IsReady() and (ac(L.SpinningCraneKick) and Q >= 5 or Q == 4 and ai() >= 2.5 or not L.ShadowboxingTreads:IsAvailable()) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick aoe 38"
        end end
    ;
    if L.FistsofFury:IsReady() and not w and h:IsInRange(8) then if n(L.FistsofFury, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 113656;
            return "fists_of_fury aoe 40"
        end end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (ac(L.SpinningCraneKick) and (Q >= 4 and ai() >= 2.5 or not L.ShadowboxingTreads:IsAvailable())) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick aoe 42"
        end end
    ;
    if L.BlackoutKick:IsReady() and ac(L.BlackoutKick) then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return "blackout_kick aoe 44" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick aoe 44"
            end end
    end
    ;
    if L.RushingJadeWind:IsReady() and h:IsInRange(8) and g:BuffDown(L.RushingJadeWindBuff) then if n(L.RushingJadeWind, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 116847;
            return "rushing_jade_wind aoe 46"
        end end
    ;
    if L.RisingSunKick:IsReady() then
        if a4.CastTargetIf(L.RisingSunKick, O, "min", al, aq) then return "Rising Sun Kick 48" end
        ;
        if al(h) and aq(h) then if m.Cast(L.RisingSunKick, nil, nil, not h:IsSpellInRange(L.RisingSunKick)) then
                _ = 107428;
                return "Rising Sun Kick 48"
            end end
    end
    ;
    if L.WhirlingDragonPunch:IsReady() and not a0 and not u and h:IsInRange(8) then if n(L.WhirlingDragonPunch, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 152175;
            return "whirling_dragon_punch aoe 50"
        end end
end
;
local function aA()
    if L.FaelineStomp:IsCastable() and r and h:IsInRange(8) and (ac(L.FaelineStomp) and (not L.FaelineHarmony:IsAvailable() or h:DebuffRemains(L.FaeExposureDebuff) < 1)) then if n(L.FaelineStomp, nil, nil, not h:IsInRange(30)) then
            _ = 327104;
            return "faeline_stomp st_cleave 2"
        end end
    ;
    if L.BlackoutKick:IsReady() and (g:BuffStack(L.TeachingsoftheMonasteryBuff) == 3 and L.ShadowboxingTreads:IsAvailable()) then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return
            "blackout_kick st_cleave 4" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick st_cleave 4"
            end end
    end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (ac(L.SpinningCraneKick) and g:BuffUp(L.DanceofChijiBuff)) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick st_cleave 6"
        end end
    ;
    if L.StrikeoftheWindlord:IsReady() and r and h:IsInRange(8) and L.Thunderfist:IsAvailable() then if n(L.StrikeoftheWindlord, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 392983;
            return "strike_of_the_windlord st_cleave 8"
        end end
    ;
    if L.RisingSunKick:IsReady() and (Q == 1 and g:BuffUp(L.KicksofFlowingMomentumBuff)) then
        if a4.CastTargetIf(L.RisingSunKick, O, "min", al, aq) then return "rising_sun_kick st_cleave 10" end
        ;
        if al(h) and aq(h) then if m.Cast(L.RisingSunKick, nil, nil, not h:IsSpellInRange(L.RisingSunKick)) then
                _ = 107428;
                return "rising_sun_kick st_cleave 10"
            end end
    end
    ;
    if L.BlackoutKick:IsReady() and (g:BuffStack(L.TeachingsoftheMonasteryBuff) == 2 and L.ShadowboxingTreads:IsAvailable()) then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return
            "blackout_kick st_cleave 12" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick st_cleave 12"
            end end
    end
    ;
    if L.FistsofFury:IsReady() and not w and h:IsInRange(8) then if n(L.FistsofFury, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 113656;
            return "fists_of_fury st_cleave 14"
        end end
    ;
    if L.StrikeoftheWindlord:IsReady() and r and h:IsInRange(8) then if n(L.StrikeoftheWindlord, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 392983;
            return "strike_of_the_windlord st_cleave 16"
        end end
    ;
    if L.BlackoutKick:IsReady() and h:IsInRange(8) and (g:BuffUp(L.TeachingsoftheMonasteryBuff) and (L.ShadowboxingTreads:IsAvailable() and Q > 1 or L.RisingSunKick:CooldownRemains() > 1)) then if n(L.BlackoutKick, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 100784;
            return "blackout_kick st_cleave 18"
        end end
    ;
    if L.WhirlingDragonPunch:IsReady() and not a0 and not u and h:IsInRange(8) and Q == 2 then if n(L.WhirlingDragonPunch, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 152175;
            return "whirling_dragon_punch st_cleave 20"
        end end
    ;
    if L.BlackoutKick:IsReady() and g:BuffStack(L.TeachingsoftheMonasteryBuff) == 3 then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return
            "blackout_kick st_cleave 22" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick st_cleave 22"
            end end
    end
    ;
    if L.RisingSunKick:IsReady() and ((Q == 1 or not L.ShadowboxingTreads:IsAvailable()) and L.FistsofFury:CooldownRemains() > 4 and L.XuensBattlegear:IsAvailable()) then
        if a4.CastTargetIf(L.RisingSunKick, O, "min", al, aq) then return "rising_sun_kick st_cleave 24" end
        ;
        if al(h) and aq(h) then if m.Cast(L.RisingSunKick, nil, nil, not h:IsSpellInRange(L.RisingSunKick)) then
                _ = 107428;
                return "rising_sun_kick st_cleave 24"
            end end
    end
    ;
    if L.BlackoutKick:IsReady() and (ac(L.BlackoutKick) and Q == 2 and L.RisingSunKick:CooldownDown() and L.FistsofFury:CooldownDown()) then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return
            "blackout_kick st_cleave 26" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick st_cleave 26"
            end end
    end
    ;
    if L.RushingJadeWind:IsReady() and h:IsInRange(8) and (g:BuffDown(L.RushingJadeWindBuff) and Q == 2) then if n(L.RushingJadeWind, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 116847;
            return "rushing_jade_wind st_cleave 28"
        end end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (g:BuffUp(L.BonedustBrewBuff) and ac(L.SpinningCraneKick) and (Q > 1 or ai() >= 2.7)) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick st_cleave 30"
        end end
    ;
    if L.RisingSunKick:IsReady() then
        if a4.CastTargetIf(L.RisingSunKick, O, "min", al, aq) then return "rising_sun_kick st_cleave 32" end
        ;
        if al(h) and aq(h) then if m.Cast(L.RisingSunKick, nil, nil, not h:IsSpellInRange(L.RisingSunKick)) then
                _ = 107428;
                return "rising_sun_kick st_cleave 32"
            end end
    end
    ;
    if L.WhirlingDragonPunch:IsReady() and not a0 and not u and h:IsInRange(8) then if n(L.WhirlingDragonPunch, nil, nil, not h:IsInMeleeRange(5)) then
            _ = 152175;
            return "whirling_dragon_punch st_cleave 34"
        end end
    ;
    if L.RushingJadeWind:IsReady() and h:IsInRange(8) and g:BuffDown(L.RushingJadeWindBuff) then if n(L.RushingJadeWind, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 116847;
            return "rushing_jade_wind st_cleave 36"
        end end
    ;
    if L.BlackoutKick:IsReady() and ac(L.BlackoutKick) then
        if a4.CastTargetIf(L.BlackoutKick, O, "min", al, ap, not h:IsInMeleeRange(5)) then return
            "blackout_kick st_cleave 38" end
        ;
        if al(h) and ap(h) then if m.Cast(L.BlackoutKick, nil, nil, not h:IsSpellInRange(L.BlackoutKick)) then
                _ = 100784;
                return "blackout_kick st_cleave 38"
            end end
    end
end
;
local function aB()
    if L.CracklingJadeLightning:IsReady() and h:IsInRange(8) and (g:BuffStack(L.TheEmperorsCapacitorBuff) > 19 and aa() > L.CracklingJadeLightning:ExecuteTime() - 1 and L.RisingSunKick:CooldownRemains() > L.CracklingJadeLightning:ExecuteTime() or g:BuffStack(L.TheEmperorsCapacitorBuff) > 14 and (L.Serenity:CooldownRemains() < 5 and L.Serenity:IsAvailable() or S < 5)) then if n(L.CracklingJadeLightning, nil, nil, not h:IsSpellInRange(L.CracklingJadeLightning)) then
            _ = 117952;
            return "crackling_jade_lightning fallthru 2"
        end end
    ;
    if L.FaelineStomp:IsCastable() and r and h:IsInRange(8) and ac(L.FaelineStomp) then if n(L.FaelineStomp, nil, nil, not h:IsInRange(30)) then
            _ = 327104;
            return "faeline_stomp serenity 4"
        end end
    ;
    if L.FaelineStomp:IsCastable() and ac(L.FaelineStomp) then if n(L.FaelineStomp, nil, nil, not h:IsInRange(30)) then
            shouldreturn = 327104;
            return "faeline_stomp fallthru 4"
        end end
    ;
    if L.TigerPalm:IsReady() and (ac(L.TigerPalm) and g:ChiDeficit() >= 2 + a7(g:BuffUp(L.PowerStrikesBuff))) then
        if a4.CastTargetIf(L.TigerPalm, O, "min", an, ao, not h:IsInMeleeRange(5)) then return "tiger_palm fallthru 4" end
        ;
        if an(h) and ao(h) then if m.Cast(L.TigerPalm, nil, nil, not h:IsSpellInRange(L.TigerPalm)) then
                _ = 100780;
                return "tiger_palm fallthru 4"
            end end
    end
    ;
    if L.ExpelHarm:IsReady() and h:IsInRange(8) and (g:ChiDeficit() >= 1 and Q > 2) then if n(L.ExpelHarm, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 322101;
            return "expel_harm fallthru 6"
        end end
    ;
    if L.ChiBurst:IsCastable() and h:IsInRange(30) and not g:IsMoving() and (E == 0 or E > L.ChiBurst:CastTime() + 0.5) and (g:ChiDeficit() >= 1 and Q == 1 or g:ChiDeficit() >= 2 and Q >= 2) then if n(L.ChiBurst, nil, nil, not h:IsInRange(40)) then
            _ = 123986;
            return "chi_burst fallthru 8"
        end end
    ;
    if L.ChiWave:IsCastable() and h:IsInRange(40) then if n(L.ChiWave, nil, nil, not h:IsInRange(40)) then
            _ = 115098;
            return "chi_wave fallthru 10"
        end end
    ;
    if L.ExpelHarm:IsReady() and h:IsInRange(8) and g:ChiDeficit() >= 1 then if n(L.ExpelHarm, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 322101;
            return "expel_harm fallthru 2"
        end end
    ;
    if L.SpinningCraneKick:IsReady() and h:IsInRange(8) and (ac(L.SpinningCraneKick) and g:BuffStack(L.ChiEnergyBuff) > 30 - 5 * Q and g:BuffDown(L.StormEarthAndFireBuff) and (L.RisingSunKick:CooldownRemains() > 2 and L.FistsofFury:CooldownRemains() > 2 or L.RisingSunKick:CooldownRemains() < 3 and L.FistsofFury:CooldownRemains() > 3 and g:Chi() > 3 or L.RisingSunKick:CooldownRemains() > 3 and L.FistsofFury:CooldownRemains() < 3 and g:Chi() > 4 or g:ChiDeficit() <= 1 and aa() < 2) or g:BuffStack(L.ChiEnergyBuff) > 10 and S < 7) then if n(L.SpinningCraneKick, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 101546;
            return "spinning_crane_kick fallthru 14"
        end end
    ;
    if L.ArcaneTorrent:IsCastable() and o() and h:IsInRange(8) and a6.Commons.Enabled.Racials and g:ChiDeficit() >= 1 then if n(L.ArcaneTorrent, nil) then
            _ = 50613;
            return "arcane_torrent fallthru 18"
        end end
    ;
    if L.FlyingSerpentKick:IsCastable() and not a6.Windwalker.IgnoreFSK then if n(L.FlyingSerpentKick, nil, nil, not h:IsInRange(30)) then
            _ = 101545;
            return "flying_serpent_kick fallthru 20"
        end end
    ;
    if L.TigerPalm:IsReady() and h:IsInRange(8) then
        if a4.CastTargetIf(L.TigerPalm, O, "min", an, ao, not h:IsInMeleeRange(5)) then return "tiger_palm fallthru 12" end
        ;
        if an(h) and ao(h) then if m.Cast(L.TigerPalm, nil, nil, not h:IsSpellInRange(L.TigerPalm)) then
                _ = 100780;
                return "tiger_palm fallthru 12"
            end end
    end
end
;
local function aC()
    if L.ExpelHarm:IsReady() and h:IsInRange(8) and (g:ChiDeficit() >= 1 and (aa() < 1 or L.Serenity:CooldownRemains() < 2 or aa() < 4 and L.FistsofFury:CooldownRemains() < 1.5) and (g:BuffDown(L.BonedustBrewBuff) or g:BloodlustUp() or g:BuffUp(L.InvokersDelightBuff))) then if n(L.ExpelHarm, nil, nil, not h:IsInMeleeRange(8)) then
            _ = 322101;
            return "expel_harm spend_energy 2"
        end end
    ;
    if L.TigerPalm:IsReady() and (g:BuffStack(L.TeachingsoftheMonasteryBuff) < 3 and ac(L.TigerPalm) and g:ChiDeficit() >= 2 + a7(g:BuffUp(L.PowerStrikesBuff)) and (aa() < 1 or L.Serenity:CooldownRemains() < 2 or aa() < 4 and L.FistsofFury:CooldownRemains() < 1.5)) then
        if a4.CastTargetIf(L.TigerPalm, O, "min", an, ao, not h:IsInMeleeRange(5)) then return
            "tiger_palm spend_energy 4" end
        ;
        if an(h) and ao(h) then if m.Cast(L.TigerPalm, nil, nil, not h:IsSpellInRange(L.TigerPalm)) then
                _ = 100780;
                return "tiger_palm fallthru 16"
            end end
    end
end
;
local function aD()
    s = HeroRotationCharDB.Toggles[6]
    q = HeroRotationCharDB.Toggles[4]
    r = HeroRotationCharDB.Toggles[5]
    D = HeroRotationCharDB.Toggles[12]
    t = not HeroRotationCharDB.Toggles[15]
    u = HeroRotationCharDB.Toggles[31]
    v = HeroRotationCharDB.Toggles[32]
    w = HeroRotationCharDB.Toggles[33]
    x = HeroRotationCharDB.Toggles[34]
    y = HeroRotationCharDB.Toggles[35]
    z = HeroRotationCharDB.Toggles[36]
    A = HeroRotationCharDB.Toggles[37]
    B = HeroRotationCharDB.Toggles[38]
    C = HeroRotationCharDB.Toggles[39]
    a0 = false;
    H = false;
    I = false;
    if a6.Windwalker.IncludedCooldowns.Xuen and o() or a6.Windwalker.IncludedSmallCooldowns.Xuen and (o() or r) or not a6.Windwalker.IncludedSmallCooldowns.Xuen and not a6.Windwalker.IncludedCooldowns.Xuen and not a6.Windwalker.IncludedSmallCooldowns.SEFEcho and not a6.Windwalker.IncludedCooldowns.SEFEco then H = true end
    ;
    if a6.Windwalker.IncludedCooldowns.SEFFull and o() or a6.Windwalker.IncludedSmallCooldowns.SEFFull and (o() or r) or not a6.Windwalker.IncludedSmallCooldowns.SEFFull and not a6.Windwalker.IncludedCooldowns.SEFFull or (a6.Windwalker.IncludedCooldowns.SEFEco and o() and L.StormEarthAndFire:ChargesFractional() > a6.Windwalker.SEFEcoCharge or a6.Windwalker.IncludedSmallCooldowns.SEFEco and (o() or r) and L.StormEarthAndFire:ChargesFractional() > a6.Windwalker.SEFEcoCharge or not a6.Windwalker.IncludedSmallCooldowns.SEFEco and not a6.Windwalker.IncludedCooldowns.SEFEco and L.StormEarthAndFire:ChargesFractional() > a6.Windwalker.SEFEcoCharge) then I = true end
    ;
    E = 0;
    for aE = 1, 20 do if select(10, UnitDebuff("player", aE)) == 240447 then if select(6, UnitDebuff("player", aE)) ~= nil then E =
                    select(6, UnitDebuff("player", aE)) - GetTime() end end end
    ;
    if not a6.Commons.Enabled.TopTrinket and not a6.Commons.Enabled.BotTrinket then N = { J, K } elseif not a6.Commons.Enabled.TopTrinket and a6.Commons.Enabled.BotTrinket then N = {
            J } elseif not a6.Commons.Enabled.BotTrinket and a6.Commons.Enabled.TopTrinket then N = { K } end
end
;
local function aF()
    local aG = 0;
    local aH = { 322968, 319603, 319611, 325876, 334493, 334496, 332605, 328494, 326836, 336277, 319669, 323831, 330725,
        333299 }
    if UnitExists("mouseover") then if UnitIsDead("mouseover") == true and UnitCanAttack("player", "mouseover") ~= true then aG = 9999 else for aE = 0, 40 do
                local ag, ag, aI, aJ, ag, ag, ag, ag, ag, aK = UnitDebuff("mouseover", aE)
                for ag, aL in pairs(aH) do if aL == aK then if aJ == "Magic" then aG = 1 elseif aJ == "Poison" then aG = 2 elseif aJ == "Disease" then aG = 3 elseif aJ == "Curse" then aG = 4 end end end
            end end end
    ;
    if aG == 2 or DebuffCheckC == 3 and L.Detox:IsReady() and f("mouseover"):IsInRange(40) then if m.Cast(L.Detox, nil, nil, not h:IsInRange(40)) then
            _ = 218164;
            return "Detox MO"
        end end
end
;
local function aM()
    O = g:GetEnemiesInMeleeRange(5)
    P = g:GetEnemiesInMeleeRange(8)
    if p() then Q = #P else Q = 1 end
    ;
    if a4.TargetIsValid() or g:AffectingCombat() then
        R = d.BossFightRemains(nil, true)
        S = R;
        if S == 11111 then S = d.FightRemains(P, false) end
    end
    ;
    if a4.TargetIsValid() or g:AffectingCombat() then T = L.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24 end
    ;
    if not BotOn then
        Z = 0;
        _ = 0;
        a1 = 0
    end
    ;
    if Z > 0 then Z = 0 end
    ;
    if _ > 0 then _ = 0 end
    ;
    if a1 > 0 then a1 = 0 end
    ;
    ShouldReturn = aD()
    if not h:IsInMeleeRange(10) and Q > 0 and a6.Windwalker.TargetSwap == "AutoSwap" and not D then Z = 999 end
    ;
    ShouldReturn = aF()
    if not g:AffectingCombat() and not g:IsDeadOrGhost() and s then
        local ShouldReturn = at()
        if ShouldReturn then return ShouldReturn end
    end
    ;
    if a4.TargetIsValid() and not g:IsDeadOrGhost() and g:AffectingCombat() then
        if L.FlyingSerpentKickLand:IsReady() and not v and not a6.Windwalker.IgnoreFSK and g:AffectingCombat() then if m.Cast(L.FlyingSerpentKickLand, nil, nil, not h:IsInRange(40)) then
                _ = 101545;
                return "Flying Serpent Kick Slam 740"
            end end
        ;
        V = not L.InvokeXuenTheWhiteTiger:IsAvailable() or L.InvokeXuenTheWhiteTiger:CooldownRemains() > S or
            S - L.InvokeXuenTheWhiteTiger:CooldownRemains() < 120 and
            (L.Serenity:IsAvailable() and S > L.Serenity:CooldownRemains() and L.Serenity:CooldownRemains() > 10 or L.StormEarthAndFire:FullRechargeTime() < S and L.StormEarthAndFire:FullRechargeTime() > 15 or L.StormEarthAndFire:Charges() == 0 and L.StormEarthAndFire:CooldownRemains() < S)
        W = L.BonedustBrew:CooldownUp() and L.StormEarthAndFire:Charges() < 2 and g:Chi() < 3 or
            g:BuffRemains(L.BonedustBrew) < 8;
        if a6.Commons.Enabled.Potions then
            local aN = a4.PotionSelected()
            if aN and aN:IsReady() then if g:BloodlustUp() and m.GUISettings.General.HoldPotforBL then if n(aN, nil, nil) then
                        _ = 32;
                        return "potion with BL 4"
                    end elseif L.InvokeXuenTheWhiteTiger:IsAvailable() and not m.GUISettings.General.HoldPotforBL then if (g:BuffUp(L.SerenityBuff) or g:BuffUp(L.StormEarthAndFireBuff)) and T or S <= 60 then if n(aN, nil, nil) then
                            _ = 32;
                            return "potion with xuen main 4"
                        end end elseif not m.GUISettings.General.HoldPotforBL then if g:BuffUp(L.SerenityBuff) or g:BuffUp(L.StormEarthAndFireBuff) or S <= 60 then if n(aN, nil, nil) then
                            _ = 32;
                            return "potion without xuen main 6"
                        end end end end
        end
        ;
        if g:IsChanneling(L.FistsofFury) and B then if m.Cast(L.PoolEnergy, nil, nil, nil) then
                _ = 1000;
                return "Casting FoF"
            end end
        ;
        if g:IsChanneling(L.FistsofFury) and (not interruptFoF1 or L.RisingSunKick:CooldownRemains() <= 0) and g:AffectingCombat() then if m.Cast(L.PoolEnergy, nil, nil, nil) then
                _ = 99999;
                return "Casting FoF"
            end elseif interruptFoF1 == true and not g:IsChanneling(L.FistsofFury) then interruptFoF1 = false end
        ;
        if g:IsChanneling(L.FistsofFury) then if g:AffectingCombat() and a6.Windwalker.CastCancelFC and interruptFoF1 then _ = 1999 end end
        ;
        if m.QueuedCast() then
            _ = m.QueuedCast()
            return "Custom Queue " .. j(_):ID()
        end
        ;
        if x and L.LegSweep:IsUsableP() and L.LegSweep:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(L.LegSweep, nil, nil, nil) then
                _ = 119381;
                return "queue Leg Sweep"
            end elseif (not L.LegSweep:IsUsableP() or L.LegSweep:CooldownRemains(BypassRecovery) > 0) and x then
            HeroRotationCharDB.Toggles[34] = not HeroRotationCharDB.Toggles[34]
            m.Print("Leg Sweep Queue is now " .. (HeroRotationCharDB.Toggles[34] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end
        ;
        if y and L.Paralysis:IsUsableP() and L.Paralysis:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(L.Paralysis, nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(L.Paralysis) then
                    Z = 1115078;
                    return "queue Paralysis MO"
                else
                    _ = 115078;
                    return "queue Paralysis"
                end end elseif (not L.Paralysis:IsUsableP() or L.Paralysis:CooldownRemains(BypassRecovery) > 0) and y then
            HeroRotationCharDB.Toggles[35] = not HeroRotationCharDB.Toggles[35]
            m.Print("Paralysis Queue is now " .. (HeroRotationCharDB.Toggles[35] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end
        ;
        if z and L.RingOfPeace:IsAvailable() and L.RingOfPeace:IsUsableP() and L.RingOfPeace:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(L.RingOfPeace, nil, nil, nil) then
                _ = 116844;
                return "queue RingOfPeace"
            end elseif (not L.RingOfPeace:IsUsableP() or L.RingOfPeace:CooldownRemains(BypassRecovery) > 0 or not L.RingOfPeace:IsAvailable()) and z then
            HeroRotationCharDB.Toggles[36] = not HeroRotationCharDB.Toggles[36]
            m.Print("RingOfPeace Queue is now " ..
            (HeroRotationCharDB.Toggles[36] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end
        ;
        if A and L.BonedustBrew:IsUsableP() and L.BonedustBrew:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(L.BonedustBrew, nil, nil, nil) then
                _ = 325216;
                return "queue BonedustBrew"
            end elseif (not L.BonedustBrew:IsUsableP() or L.BonedustBrew:CooldownRemains(BypassRecovery) > 0) and A then
            HeroRotationCharDB.Toggles[37] = not HeroRotationCharDB.Toggles[37]
            m.Print("BonedustBrew Queue is now " ..
            (HeroRotationCharDB.Toggles[37] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end
        ;
        if g:AffectingCombat() then
            if L.FortifyingBrew:IsReady() and g:HealthPercentage() < a6.Commons.FortifyingBrew then if m.Cast(L.FortifyingBrew, nil, nil, nil) then
                    _ = 243435;
                    return "Fortifying Brew 100"
                end end
            ;
            if L.TouchOfKarma:IsReady() and g:HealthPercentage() < a6.Commons.TouchofKarma then if m.Cast(L.TouchOfKarma, nil, nil, nil) then
                    _ = 122470;
                    return "ToK 100"
                end end
            ;
            if g:HealthPercentage() < a6.Commons.HealthstoneHP and M.Healthstone:IsReady() and M.Healthstone:CooldownRemains() <= 0 then if m.Cast(M.Healthstone, nil) then
                    _ = 40;
                    return "Healthstone HP"
                end end
            ;
            if g:HealthPercentage() < a6.Commons.HealPotHP and (M.RefreshingHealingPotion1:IsReady() and M.RefreshingHealingPotion1:CooldownRemains() <= 0 or M.RefreshingHealingPotion2:IsReady() and M.RefreshingHealingPotion2:CooldownRemains() <= 0 or M.RefreshingHealingPotion3:IsReady() and M.RefreshingHealingPotion3:CooldownRemains() <= 0) then if m.Cast(M.RefreshingHealingPotion1, nil) then
                    _ = 45;
                    return "RefreshingHealingPotion HP"
                end end
        end
        ;
        if o() and not L.Serenity:IsAvailable() then
            local ShouldReturn = ax()
            if ShouldReturn then return ShouldReturn end
        end
        ;
        if o() and L.Serenity:IsAvailable() then
            local ShouldReturn = aw()
            if ShouldReturn then return ShouldReturn end
        end
        ;
        if g:BuffUp(L.SerenityBuff) then
            local ShouldReturn = ay()
            if ShouldReturn then return ShouldReturn end
        end
        ;
        if p() and Q >= 3 then
            local ShouldReturn = az()
            if ShouldReturn then return ShouldReturn end
        end
        ;
        if Q < 3 then
            local ShouldReturn = aA()
            if ShouldReturn then return ShouldReturn end
        end
        ;
        if true then
            local ShouldReturn = aB()
            if ShouldReturn then return ShouldReturn end
        end
        ;
        if g:AffectingCombat() then if m.Cast(L.PoolEnergy) and not a6.Windwalker.NoWindwalkerPooling then return
                "Pool Energy" end end
    end
end
;
local function aO() if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        m.ToggleIconFrame:UpdateButtonText(6)
    end end
;
function ReturnSpell() if _ == 0 then return 0 else return _ end end

;
function ReturnSpellMO() if Z == 0 then return 0 else return Z end end

;
function ReturnSpellFocus() if a1 == 0 then return 0 else return a1 end end

;
m.SetAPL(269, aM, aO)
