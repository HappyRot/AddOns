local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = f.Pet;
local j = d.Spell;
local k = d.Item;
local l = HeroRotation;
local m = l.AoEON;
local n = l.CDsON;
local o = l.Cast;
local p = l.CastSuggested;
local q = l.CastAnnotated;
local r = l.Commons.Everyone.num;
local s = l.Commons.Everyone.bool;
local t = l.Commons.DemonHunter;
t.DGBCDR = 0;
t.DGBCDRLastUpdate = 0;
local GetTime = GetTime;
local u = not HeroRotationCharDB.Toggles[167]
local v = not HeroRotationCharDB.Toggles[168]
local w = not HeroRotationCharDB.Toggles[169]
local x = j.DemonHunter.Vengeance;
local y = k.DemonHunter.Vengeance;
local z = {}
local A = l.Commons.Everyone;
local B = {
    General = l.GUISettings.General,
    Commons = l.GUISettings.APL.DemonHunter.Commons,
    Vengeance = l.GUISettings.APL.DemonHunter.Vengeance
}
local C, D;
local E = 0;
local F, G;
local H;
local I;
local J;
local K;
local L = 0;
local M = false;
local N = false;
local O = false;
local P = false;
local Q = false;
local R = g:HasTier(29, 2) and 54 or 45;
local S = g:HasTier(29, 2) and 30 or 25;
local T = 0;
local U = 0;
local V = 0;
local W = g:FuryDeficit()
d:RegisterForEvent(function()
    L = 0;
    M = false;
    N = false;
    O = false;
    P = false;
    Q = false
end, "PLAYER_REGEN_ENABLED")
local function X()
    C = g:BuffStack(x.SoulFragments)
    if x.SpiritBomb:TimeSinceLastCast() < g:GCD() then
        E = 0
    end
    if E == 0 then
        local Y = g:BuffUp(x.MetamorphosisBuff) and 1 or 0;
        if x.SoulCarver:IsAvailable() and x.SoulCarver:TimeSinceLastCast() < g:GCD() and x.SoulCarver.LastCastTime ~= D then
            E = math.min(C + 2, 5)
            D = x.SoulCarver.LastCastTime
        elseif x.Fracture:IsAvailable() and x.Fracture:TimeSinceLastCast() < g:GCD() and x.Fracture.LastCastTime ~= D then
            E = math.min(C + 2 + Y, 5)
            D = x.Fracture.LastCastTime
        elseif x.Shear:TimeSinceLastCast() < g:GCD() and x.Fracture.Shear ~= D then
            E = math.min(C + 1 + Y, 5)
            D = x.Shear.LastCastTime
        end
    else
        local Z = g:PrevGCD(1)
        if Z == 207407 and x.SoulCarver:TimeSinceLastCast() >= g:GCD() then
            E = 0
        elseif Z == 263642 and x.Fracture:TimeSinceLastCast() >= g:GCD() then
            E = 0
        elseif Z == 203782 and x.Shear:TimeSinceLastCast() >= g:GCD() then
            E = 0
        end
    end
    if E > C then
        C = E
    elseif E > 0 then
        E = 0
    end
end
local function _()
    if x.Felblade:TimeSinceLastCast() < g:GCD() or x.InfernalStrike:TimeSinceLastCast() < g:GCD() then
        F = true;
        G = true;
        return
    end
    F = h:IsInMeleeRange(5)
    G = F or K > 0
end
local function a0()
    if x.TheHunt:IsCastable() and not F then
        if o(x.TheHunt, nil, nil, not h:IsInRange(50)) then
            V = 323639;
            return "the_hunt precombat 4"
        end
    end
    if x.Fracture:IsCastable() and F then
        if o(x.Fracture) then
            V = 263642;
            return "fracture precombat 8"
        end
    end
    if x.Shear:IsCastable() and F then
        if o(x.Shear) then
            V = 203782;
            return "shear precombat 10"
        end
    end
end
local function a1()
    if x.DemonSpikes:IsCastable() and g:BuffDown(x.DemonSpikesBuff) and g:BuffDown(x.MetamorphosisBuff) and
        (K == 1 and g:BuffDown(x.FieryBrandDebuff) or K > 1) then
        if x.DemonSpikes:ChargesFractional() > 1.9 then
            if o(x.DemonSpikes, nil) then
                V = 203720;
                return "demon_spikes defensives (Capped)"
            end
        elseif H or g:HealthPercentage() <= B.Vengeance.DemonSpikesHealthThreshold then
            if o(x.DemonSpikes, nil) then
                V = 203720;
                return "demon_spikes defensives (Danger)"
            end
        end
    end
    if x.Metamorphosis:IsCastable() and g:HealthPercentage() <= B.Vengeance.MetamorphosisHealthThreshold and
        (g:BuffDown(x.MetamorphosisBuff) or h:TimeToDie() < 15) then
        if o(x.Metamorphosis, nil) then
            V = 187827;
            return "metamorphosis defensives"
        end
    end
    if x.FieryBrand:IsCastable() then
        if o(x.FieryBrand, nil, nil, not h:IsSpellInRange(x.FieryBrand)) then
            V = 204021;
            return "fiery_brand defensives"
        end
    end
end
local function a2()
    if not M then
        M = true
    end
    if x.TheHunt:CooldownDown() then
        M = false
    end
    if x.Fracture:IsCastable() and (g:FuryDeficit() >= T and h:DebuffStack(x.FrailtyDebuff) <= 5) then
        if o(x.Fracture, nil, nil, not F) then
            V = 263642;
            return "fracture ramph 2"
        end
    end
    if x.SigilofFlame:IsCastable() and
        ((G or not x.ConcentratedSigils:IsAvailable()) and h:DebuffRefreshable(x.SigilofFlameDebuff)) and
        g:FuryDeficit() >= 30 then
        if x.ConcentratedSigils:IsAvailable() then
            if o(x.SigilofFlame, nil, nil, not G) then
                V = 389810;
                return "sigil_of_flame ramph 4 (Concentrated)"
            end
        else
            if o(x.SigilofFlame, nil, nil, not h:IsInRange(30)) then
                V = 389810;
                return "sigil_of_flame ramph 4 (Normal)"
            end
        end
    end
    if x.Shear:IsCastable() and g:FuryDeficit() <= 90 then
        if o(x.Shear, nil, nil, not F) then
            V = 203782;
            return "shear ramph 6"
        end
    end
    if x.SpiritBomb:IsReady() and (C >= 4 and K > 1) then
        if o(x.SpiritBomb, nil, nil, not h:IsInMeleeRange(8)) then
            V = 247454;
            return "spirit_bomb ramph 8"
        end
    end
    if x.SoulCleave:IsReady() and (C <= 1 and K > 1 or K < 2 or h:DebuffStack(x.FrailtyDebuff) >= 0) then
        if o(x.SoulCleave, nil, nil, not F) then
            V = 228477;
            return "soul_cleave ramph 10"
        end
    end
    if x.TheHunt:IsCastable() then
        if o(x.TheHunt, nil, nil, not h:IsInRange(50)) then
            V = 323639;
            return "the_hunt ramph 12"
        end
    end
end
local function a3()
    if not N then
        N = true
    end
    if x.ElysianDecree:CooldownDown() then
        N = false
    end
    if x.Fracture:IsCastable() and (g:FuryDeficit() >= T and h:DebuffStack(x.FrailtyDebuff) <= 5) then
        if o(x.Fracture, nil, nil, not F) then
            V = 263642;
            return "fracture ramped 2"
        end
    end
    if x.SigilofFlame:IsCastable() and
        ((G or not x.ConcentratedSigils:IsAvailable()) and h:DebuffRefreshable(x.SigilofFlameDebuff)) and
        g:FuryDeficit() >= 30 then
        if x.ConcentratedSigils:IsAvailable() then
            if o(x.SigilofFlame, nil, nil, not G) then
                V = 389810;
                return "sigil_of_flame ramped 4 (Concentrated)"
            end
        else
            if o(x.SigilofFlame, nil, nil, not h:IsInRange(30)) then
                V = 389810;
                return "sigil_of_flame ramped 4 (Normal)"
            end
        end
    end
    if x.Shear:IsCastable() and (g:FuryDeficit() <= 90 and h:DebuffStack(x.FrailtyDebuff) >= 0) then
        if o(x.Shear, nil, nil, not F) then
            V = 203782;
            return "shear ramped 6"
        end
    end
    if x.SpiritBomb:IsReady() and (C >= 4 and K > 1) then
        if o(x.SpiritBomb, nil, nil, not h:IsInMeleeRange(8)) then
            V = 247454;
            return "spirit_bomb ramped 8"
        end
    end
    if x.SoulCleave:IsReady() and (C <= 1 and K > 1 or K < 2 or h:DebuffStack(x.FrailtyDebuff) >= 0) then
        if o(x.SoulCleave, nil, nil, not F) then
            V = 228477;
            return "soul_cleave ramped 10"
        end
    end
    if x.ElysianDecree:IsCastable() then
        if o(x.ElysianDecree, nil, nil, not h:IsInRange(30)) then
            V = 389815;
            return "elysian_decree ramped 12"
        end
    end
end
local function a4()
    if not O then
        O = true
    end
    if x.SoulCarver:CooldownDown() then
        O = false
    end
    if x.Fracture:IsCastable() and (g:FuryDeficit() >= T and h:DebuffStack(x.FrailtyDebuff) <= 5) then
        if o(x.Fracture, nil, nil, not F) then
            V = 263642;
            return "fracture rampsc 2"
        end
    end
    if x.SigilofFlame:IsCastable() and
        ((G or not x.ConcentratedSigils:IsAvailable()) and h:DebuffRefreshable(x.SigilofFlameDebuff)) and
        g:FuryDeficit() >= 30 then
        if x.ConcentratedSigils:IsAvailable() then
            if o(x.SigilofFlame, nil, nil, not G) then
                V = 389810;
                return "sigil_of_flame rampsc 4 (Concentrated)"
            end
        else
            if o(x.SigilofFlame, nil, nil, not h:IsInRange(30)) then
                V = 389810;
                return "sigil_of_flame rampsc 4 (Normal)"
            end
        end
    end
    if x.Shear:IsCastable() and (g:FuryDeficit() <= 90 and h:DebuffStack(x.FrailtyDebuff) >= 0) then
        if o(x.Shear, nil, nil, not F) then
            V = 203782;
            return "shear rampsc 6"
        end
    end
    if x.SpiritBomb:IsReady() and (C >= 4 and K > 1) then
        if o(x.SpiritBomb, nil, nil, not h:IsInMeleeRange(8)) then
            V = 247454;
            return "spirit_bomb rampsc 8"
        end
    end
    if x.SoulCleave:IsReady() and (C <= 1 and K > 1 or K < 2 or h:DebuffStack(x.FrailtyDebuff) >= 0) then
        if o(x.SoulCleave, nil, nil, not F) then
            V = 228477;
            return "soul_cleave rampsc 10"
        end
    end
    if x.SoulCarver:IsCastable() then
        if o(x.SoulCarver, nil, nil, not F) then
            V = 214743;
            return "soul_carver rampsc 12"
        end
    end
end
local function a5()
    if not P then
        P = true
    end
    if x.SoulCarver:CooldownDown() and
        (x.FieryBrand:CooldownDown() or x.DowninFlames:IsAvailable() and x.FieryBrand:ChargesFractional() < 1.65) and
        x.FelDevastation:CooldownDown() then
        P = false
    end
    if x.Fracture:IsCastable() and (g:FuryDeficit() >= T and h:DebuffDown(x.FieryBrandDebuff)) then
        if o(x.Fracture, nil, nil, not F) then
            V = 263642;
            return "fracture fdsc 2"
        end
    end
    if x.FieryBrand:IsCastable() and (h:DebuffDown(x.FieryBrandDebuff) and g:Fury() >= 30) then
        if o(x.FieryBrand, B.Vengeance.GCDasOffGCD.FieryBrand, nil, not h:IsSpellInRange(x.FieryBrand)) then
            V = 204021;
            return "fiery_brand fdsc 4"
        end
    end
    if x.ImmolationAura:IsCastable() and h:DebuffUp(x.FieryBrandDebuff) then
        if o(x.ImmolationAura) then
            V = 258920;
            return "immolation_aura fdsc 6"
        end
    end
    if x.FelDevastation:IsReady() and h:DebuffRemains(x.FieryBrandDebuff) <= 3 then
        if o(x.FelDevastation, B.Vengeance.GCDasOffGCD.FelDevastation, nil, not h:IsInMeleeRange(20)) then
            V = 212084;
            return "fel_devastation fdsc 8"
        end
    end
    if x.SpiritBomb:IsReady() and ((g:BuffUp(x.MetamorphosisBuff) and x.Fracture:IsAvailable() and C >= 3 or C >= 4) and
        h:DebuffRemains(x.FieryBrandDebuff) >= 4) then
        if o(x.SpiritBomb, nil, nil, not h:IsInMeleeRange(8)) then
            V = 247454;
            return "spirit_bomb fdsc 10"
        end
    end
    if x.SoulCleave:IsReady() and (C <= 1 and K > 1 or K < 2 and h:DebuffRemains(x.FieryBrandDebuff) >= 4) then
        if o(x.SoulCleave, nil, nil, not h:IsInMeleeRange(8)) then
            V = 228477;
            return "soul_cleave fdsc 12"
        end
    end
    if x.SoulCarver:IsCastable() and (C <= 3 and h:DebuffUp(x.FieryBrandDebuff)) then
        if o(x.SoulCarver, nil, nil, not F) then
            V = 214743;
            return "soul_carver fdsc 12"
        end
    end
    if x.Fracture:IsCastable() and
        (C <= 3 and h:DebuffRemains(x.FieryBrandDebuff) >= 5 or h:DebuffRemains(x.FieryBrandDebuff) <= 5 and g:Fury() <
            50) then
        if o(x.Fracture, nil, nil, not F) then
            V = 263642;
            return "fracture fdsc 14"
        end
    end
    if x.SigilofFlame:IsCastable() and
        ((G or not x.ConcentratedSigils:IsAvailable()) and h:DebuffRefreshable(x.SigilofFlameDebuff)) and
        (h:DebuffRemains(x.FieryBrandDebuff) <= 3 and g:Fury() < 50) then
        if x.ConcentratedSigils:IsAvailable() then
            if o(x.SigilofFlame, nil, nil, not G) then
                V = 389810;
                return "sigil_of_flame fdsc 16 (Concentrated)"
            end
        else
            if o(x.SigilofFlame, nil, nil, not h:IsInRange(30)) then
                V = 389810;
                return "sigil_of_flame fdsc 16 (Normal)"
            end
        end
    end
    if x.ThrowGlaive:IsCastable() then
        if o(x.ThrowGlaive, nil, nil, not h:IsSpellInRange(x.ThrowGlaive)) then
            V = 204157;
            return "throw_glaive fdsc 18"
        end
    end
end
local function a6()
    if not Q then
        Q = true
    end
    if (x.FieryBrand:CooldownDown() or x.DowninFlames:IsAvailable() and x.FieryBrand:ChargesFractional() < 1.65) and
        x.FelDevastation:CooldownDown() then
        Q = false
    end
    if x.Fracture:IsCastable() and (g:FuryDeficit() >= T and h:DebuffDown(x.FieryBrandDebuff)) then
        if o(x.Fracture, nil, nil, not F) then
            V = 263642;
            return "fracture fdnosc 2"
        end
    end
    if x.FieryBrand:IsCastable() and (h:DebuffDown(x.FieryBrandDebuff) and g:Fury() >= 30) then
        if o(x.FieryBrand, B.Vengeance.GCDasOffGCD.FieryBrand, nil, not h:IsSpellInRange(x.FieryBrand)) then
            V = 204021;
            return "fiery_brand fdnosc 4"
        end
    end
    if x.ImmolationAura:IsCastable() and h:DebuffUp(x.FieryBrandDebuff) then
        if o(x.ImmolationAura) then
            V = 258920;
            return "immolation_aura fdnosc 6"
        end
    end
    if x.SpiritBomb:IsReady() and ((g:BuffUp(x.MetamorphosisBuff) and x.Fracture:IsAvailable() and C >= 3 or C >= 4) and
        h:DebuffRemains(x.FieryBrandDebuff) >= 4) then
        if o(x.SpiritBomb, nil, nil, not h:IsInMeleeRange(8)) then
            V = 247454;
            return "spirit_bomb fdnosc 8"
        end
    end
    if x.SoulCleave:IsReady() and (C <= 1 and K > 1 or K < 2 and h:DebuffRemains(x.FieryBrandDebuff) >= 4) then
        if o(x.SoulCleave, nil, nil, not h:IsInMeleeRange(8)) then
            V = 228477;
            return "soul_cleave fdnosc 10"
        end
    end
    if x.Fracture:IsCastable() and
        (C <= 3 and h:DebuffRemains(x.FieryBrandDebuff) >= 5 or h:DebuffRemains(x.FieryBrandDebuff) <= 5 and g:Fury() <
            50) then
        if o(x.Fracture, nil, nil, not F) then
            V = 263642;
            return "fracture fdnosc 12"
        end
    end
    if x.FelDevastation:IsReady() and h:DebuffRemains(x.FieryBrandDebuff) <= 3 then
        if o(x.FelDevastation, B.Vengeance.GCDasOffGCD.FelDevastation, nil, not h:IsInMeleeRange(20)) then
            V = 212084;
            return "fel_devastation fdnosc 14"
        end
    end
    if x.SigilofFlame:IsCastable() and
        ((G or not x.ConcentratedSigils:IsAvailable()) and h:DebuffRefreshable(x.SigilofFlameDebuff)) and
        (h:DebuffRemains(x.FieryBrandDebuff) <= 3 and g:Fury() < 50) then
        if x.ConcentratedSigils:IsAvailable() then
            if o(x.SigilofFlame, nil, nil, not G) then
                V = 389810;
                return "sigil_of_flame fdnosc 16 (Concentrated)"
            end
        else
            if o(x.SigilofFlame, nil, nil, not h:IsInRange(30)) then
                V = 389810;
                return "sigil_of_flame fdnosc 16 (Normal)"
            end
        end
    end
end
local function a7()
    u = not HeroRotationCharDB.Toggles[167]
    v = not HeroRotationCharDB.Toggles[168]
    w = not HeroRotationCharDB.Toggles[169]
end
local function a8()
    if l.QueuedCast() then
        V = l.QueuedCast()
        return "Custom Queue " .. j(V):ID()
    end
    if u and x.InfernalStrike:IsAvailable() and x.InfernalStrike:CooldownRemains(BypassRecovery) <= 0 then
        if x.InfernalStrike:IsCastable() and x.InfernalStrike:ChargesFractional() > 1.9 and
            x.InfernalStrike:TimeSinceLastCast() > 2 then
            if l.Cast(x.InfernalStrike, nil, nil, nil) then
                V = 189110;
                return "queue Infernal Strike"
            end
        end
    elseif (not x.InfernalStrike:IsUsableP() or x.InfernalStrike:CooldownRemains() >= 0) and u then
        HeroRotationCharDB.Toggles[167] = not HeroRotationCharDB.Toggles[167]
        l.Print("InfernalStrike  Queue is now " ..
                    (HeroRotationCharDB.Toggles[167] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if v and x.SigilOfSilence:IsAvailable() and x.SigilOfSilence:CooldownRemains(BypassRecovery) <= 0 then
        if l.Cast(x.SigilOfSilence, nil, nil, nil) then
            V = 202137;
            return "queue Sigil of Silence"
        end
    elseif (not x.SigilOfSilence:IsUsableP() or x.SigilOfSilence:CooldownRemains() >= 0) and v then
        HeroRotationCharDB.Toggles[168] = not HeroRotationCharDB.Toggles[168]
        l.Print("Sigil of Silence  Queue is now " ..
                    (HeroRotationCharDB.Toggles[168] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if w and x.ChaosNova:IsReady() and x.ChaosNova:CooldownRemains(BypassRecovery) <= 0 then
        if l.Cast(x.ChaosNova, nil, nil, nil) then
            V = 179057;
            return "queue Chaos Nova"
        end
    elseif (not x.ChaosNova:IsUsableP() or x.ChaosNova:CooldownRemains() >= 0) and w then
        HeroRotationCharDB.Toggles[169] = not HeroRotationCharDB.Toggles[169]
        l.Print("Chaos Nova  Queue is now " ..
                    (HeroRotationCharDB.Toggles[169] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if g:IsChanneling(x.FelDevestation) then
        if l.CastAnnotated(x.Pool, false, "WAIT") then
            V = 99999;
            return "Pool During FelDevestation"
        end
    end
    a7()
    J = g:GetEnemiesInMeleeRange(8)
    if m() then
        K = #J
    else
        K = 1
    end
    X()
    _()
    H = g:ActiveMitigationNeeded()
    I = g:IsTankingAoE(8) or g:IsTanking(h)
    if A.TargetIsValid() then
        if x.DarkglareBoon:IsAvailable() and g:PrevGCD(1, x.FelDevastation) and
            (t.DGBCDRLastUpdate == 0 or GetTime() - t.DGBCDRLastUpdate < 5) then
            if t.DGBCDR >= 18 then
                L = true
            else
                L = false
            end
        end
        T = g:BuffUp(x.MetamorphosisBuff) and R or S;
        if not g:AffectingCombat() then
            local a9 = a0()
            if a9 then
                return a9
            end
        end
        local a9 = A.Interrupt(10, x.Disrupt, B.Commons.OffGCDasOffGCD.Disrupt, false)
        if a9 then
            return a9
        end
        if I then
            local a9 = a1()
            if a9 then
                return a9
            end
        end
        if x.FieryBrand:IsCastable() and B.Vengeance.UseFieryBrandOffensively and
            (not x.FieryDemise:IsAvailable() and h:DebuffDown(x.FieryBrandDebuff)) then
            if o(x.FieryBrand, B.Vengeance.GCDasOffGCD.FieryBrand, nil, not h:IsSpellInRange(x.FieryBrand)) then
                return "fiery_brand main 4"
            end
        end
        if x.BulkExtraction:IsCastable() then
            if o(x.BulkExtraction, nil, nil, not h:IsInMeleeRange(8)) then
                V = 320341;
                return "bulk_extraction main 6"
            end
        end
        if B.Commons.Enabled.Potions then
            local aa = A.PotionSelected()
            if aa and aa:IsReady() then
                if o(aa, nil, B.Commons.DisplayStyle.Potions) then
                    return "potion main 8"
                end
            end
        end
        if B.Commons.Enabled.Trinkets then
            local ab = g:GetUseableTrinkets(z, 13)
            if ab then
                if o(ab, nil, B.Commons.DisplayStyle.Trinkets) then
                    V = 30;
                    return "trinket1 main 10"
                end
            end
            local ac = g:GetUseableTrinkets(z, 14)
            if ac then
                if o(ac, nil, B.Commons.DisplayStyle.Trinkets) then
                    V = 40;
                    return "trinket2 main 12"
                end
            end
        end
        if M or x.TheHunt:IsAvailable() and x.TheHunt:CooldownRemains() < 5 then
            local a9 = a2()
            if a9 then
                return a9
            end
            if q(x.Pool, false, "WAIT") then
                return "Pool for HuntRamp()"
            end
        end
        if N or x.ElysianDecree:IsAvailable() and x.ElysianDecree:CooldownRemains() < 5 then
            local a9 = a3()
            if a9 then
                return a9
            end
            if q(x.Pool, false, "WAIT") then
                return "Pool for EDRamp()"
            end
        end
        if O or x.SoulCarver:IsAvailable() and x.SoulCarver:CooldownRemains() < 5 and not x.FieryDemise:IsAvailable() then
            local a9 = a4()
            if a9 then
                return a9
            end
            if q(x.Pool, false, "WAIT") then
                return "Pool for SCRamp()"
            end
        end
        if P or x.FieryDemise:IsAvailable() and x.SoulCarver:IsAvailable() and x.SoulCarver:CooldownUp() and
            x.FieryBrand:CooldownUp() and x.ImmolationAura:CooldownUp() and x.FelDevastation:CooldownRemains() < 10 then
            local a9 = a5()
            if a9 then
                return a9
            end
            if q(x.Pool, false, "WAIT") then
                return "Pool for FDSC()"
            end
        end
        if Q or x.FieryDemise:IsAvailable() and
            (x.SoulCarver:IsAvailable() and x.SoulCarver:CooldownDown() or not x.SoulCarver:IsAvailable()) and
            x.FieryBrand:CooldownUp() and x.ImmolationAura:CooldownUp() and x.FelDevastation:CooldownRemains() < 10 and
            (x.DarkglareBoon:IsAvailable() and L or not x.DarkglareBoon:IsAvailable()) then
            local a9 = a6()
            if a9 then
                return a9
            end
            if q(x.Pool, false, "WAIT") then
                return "Pool for FDNoSC()"
            end
        end
        if x.Metamorphosis:IsCastable() and B.Vengeance.UseMetaOffensively and
            (g:BuffDown(x.MetamorphosisBuff) and h:DebuffDown(x.FieryBrandDebuff)) then
            if o(x.Metamorphosis, nil, B.Commons.DisplayStyle.Metamorphosis) then
                V = 187827;
                return "metamorphosis main 14"
            end
        end
        if x.FelDevastation:IsReady() and not x.DowninFlames:IsAvailable() then
            if o(x.FelDevastation, B.Vengeance.GCDasOffGCD.FelDevastation, nil, not h:IsInMeleeRange(20)) then
                V = 212084;
                return "fel_devastation main 16"
            end
        end
        if x.SpiritBomb:IsReady() and
            (g:BuffUp(x.MetamorphosisBuff) and x.Fracture:IsAvailable() and C >= 3 and K > 1 or C >= 4 and K > 1) then
            if o(x.SpiritBomb, nil, nil, not h:IsInMeleeRange(8)) then
                V = 247454;
                return "spirit_bomb main 18"
            end
        end
        if x.SoulCleave:IsReady() and (x.SpiritBomb:IsAvailable() and C <= 1 and K > 1 or K < 2 and
            (x.Fracture:IsAvailable() and g:Fury() >= 55 or not x.Fracture:IsAvailable() and g:Fury() >= 70 or
                g:BuffUp(x.MetamorphosisBuff) and
                (x.Fracture:IsAvailable() and g:Fury() >= 35 or not x.Fracture:IsAvailable() and g:Fury() >= 50)) or
            not x.SpiritBomb:IsAvailable() and
            (x.Fracture:IsAvailable() and g:Fury() >= 55 or not x.Fracture:IsAvailable() and g:Fury() >= 70 or
                g:BuffUp(x.MetamorphosisBuff) and
                (x.Fracture:IsAvailable() and g:Fury() >= 35 or not x.Fracture:IsAvailable() and g:Fury() >= 50))) then
            if o(x.SoulCleave, nil, nil, not h:IsSpellInRange(x.SoulCleave)) then
                V = 228477;
                return "soul_cleave main 20"
            end
        end
        if x.ImmolationAura:IsCastable() and (x.FieryDemise:IsAvailable() and g:FuryDeficit() >= 10 and
            (x.SoulCarver:CooldownRemains() > 15 or not x.SoulCarver:IsAvailable()) or not x.FieryDemise:IsAvailable() and
            g:FuryDeficit() >= 10) then
            if o(x.ImmolationAura) then
                V = 258920;
                return "immolation_aura main 22"
            end
        end
        if x.Felblade:IsCastable() and g:FuryDeficit() >= 40 then
            if o(x.Felblade, nil, nil, not h:IsSpellInRange(x.Felblade)) then
                V = 232893;
                return "felblade main 24"
            end
        end
        if x.Fracture:IsCastable() and
            (x.SpiritBomb:IsAvailable() and (C <= 3 and K > 1 or K < 2 and g:FuryDeficit() >= T) or
                not x.SpiritBomb:IsAvailable() and g:FuryDeficit() >= T) then
            if o(x.Fracture, nil, nil, not F) then
                V = 263642;
                return "fracture main 26"
            end
        end
        if x.SigilofFlame:IsCastable() and
            ((G or not x.ConcentratedSigils:IsAvailable()) and h:DebuffRefreshable(x.SigilofFlameDebuff)) and
            g:FuryDeficit() >= 30 then
            if x.ConcentratedSigils:IsAvailable() then
                if o(x.SigilofFlame, nil, nil, not G) then
                    V = 389810;
                    return "sigil_of_flame main 28 (Concentrated)"
                end
            else
                if o(x.SigilofFlame, nil, nil, not h:IsInRange(30)) then
                    V = 389810;
                    return "sigil_of_flame main 28 (Normal)"
                end
            end
        end
        if x.Shear:IsCastable() and F then
            if o(x.Shear) then
                V = 203782;
                return "shear main 30"
            end
        end
        if x.Fracture:IsCastable() and F then
            if o(x.Fracture) then
                V = 263642;
                return "fracture main 32"
            end
        end
        if x.ThrowGlaive:IsCastable() then
            if o(x.ThrowGlaive, nil, nil, not h:IsSpellInRange(x.ThrowGlaive)) then
                V = 204157;
                return "throw_glaive main 34"
            end
        end
        if q(x.Pool, false, "WAIT") then
            return "Wait/Pool Resources"
        end
    end
end
function ReturnSpellV()
    if V == 0 then
        return 0
    else
        return V
    end
end
function ReturnSpellMOV()
    if U == 0 then
        return 0
    else
        return U
    end
end
local function ad()
    l.Print("Vengeance DH rotation is currently a work in progress, but has been updated for patch 10.0.")
end
l.SetAPL(581, a8, ad)
