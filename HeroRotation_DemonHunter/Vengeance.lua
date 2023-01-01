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
local R = 0;
local S = 0;
local T = g:FuryDeficit()
d:RegisterForEvent(function()
    L = 0;
    M = false;
    N = false;
    O = false;
    P = false;
    Q = false
end, "PLAYER_REGEN_ENABLED")
local function U()
    C = g:BuffStack(x.SoulFragments)
    if x.SpiritBomb:TimeSinceLastCast() < g:GCD() then
        E = 0
    end
    if E == 0 then
        local V = g:BuffUp(x.MetamorphosisBuff) and 1 or 0;
        if x.SoulCarver:IsAvailable() and x.SoulCarver:TimeSinceLastCast() < g:GCD() and x.SoulCarver.LastCastTime ~= D then
            E = math.min(C + 2, 5)
            D = x.SoulCarver.LastCastTime
        elseif x.Fracture:IsAvailable() and x.Fracture:TimeSinceLastCast() < g:GCD() and x.Fracture.LastCastTime ~= D then
            E = math.min(C + 2 + V, 5)
            D = x.Fracture.LastCastTime
        elseif x.Shear:TimeSinceLastCast() < g:GCD() and x.Fracture.Shear ~= D then
            E = math.min(C + 1 + V, 5)
            D = x.Shear.LastCastTime
        end
    else
        local W = g:PrevGCD(1)
        if W == 207407 and x.SoulCarver:TimeSinceLastCast() >= g:GCD() then
            E = 0
        elseif W == 263642 and x.Fracture:TimeSinceLastCast() >= g:GCD() then
            E = 0
        elseif W == 203782 and x.Shear:TimeSinceLastCast() >= g:GCD() then
            E = 0
        end
    end
    if E > C then
        C = E
    elseif E > 0 then
        E = 0
    end
end
local function X()
    if x.Felblade:TimeSinceLastCast() < g:GCD() or x.InfernalStrike:TimeSinceLastCast() < g:GCD() then
        F = true;
        G = true;
        return
    end
    F = h:IsInMeleeRange(5)
    G = F or K > 0
end
local function Y()
    if x.TheHunt:IsCastable() and not F then
        if o(x.TheHunt, nil, nil, not h:IsInRange(50)) then
            S = 323639;
            return "the_hunt precombat 4"
        end
    end
    if x.Fracture:IsCastable() and F then
        if o(x.Fracture) then
            S = 263642;
            return "fracture precombat 8"
        end
    end
    if x.Shear:IsCastable() and F then
        if o(x.Shear) then
            S = 203782;
            return "shear precombat 10"
        end
    end
end
local function Z()
    if x.DemonSpikes:IsCastable() and g:BuffDown(x.DemonSpikesBuff) and g:BuffDown(x.MetamorphosisBuff) and
        (K == 1 and g:BuffDown(x.FieryBrandDebuff) or K > 1) then
        if x.DemonSpikes:ChargesFractional() > 1.9 then
            if o(x.DemonSpikes, B.Vengeance.OffGCDasOffGCD.DemonSpikes) then
                S = 203720;
                return "demon_spikes defensives (Capped)"
            end
        elseif H or g:HealthPercentage() <= B.Vengeance.DemonSpikesHealthThreshold then
            if o(x.DemonSpikes, B.Vengeance.OffGCDasOffGCD.DemonSpikes) then
                S = 203720;
                return "demon_spikes defensives (Danger)"
            end
        end
    end
    if x.Metamorphosis:IsCastable() and g:HealthPercentage() <= B.Vengeance.MetamorphosisHealthThreshold and
        (g:BuffDown(x.MetamorphosisBuff) or h:TimeToDie() < 15) then
        if o(x.Metamorphosis, nil) then
            S = 187827;
            return "metamorphosis defensives"
        end
    end
    if x.FieryBrand:IsCastable() then
        if o(x.FieryBrand, nil, nil, not h:IsSpellInRange(x.FieryBrand)) then
            S = 204021;
            return "fiery_brand defensives"
        end
    end
end
local function _()
    if x.DemonSpikes:IsCastable() and g:BuffDown(x.DemonSpikesBuff) then
        if o(x.DemonSpikes, nil) then
            S = 203720;
            return "demon_spikes main 4)"
        end
    end
    if x.FieryBrand:IsCastable() and not x.FieryDemise:IsAvailable() then
        if o(x.FieryBrand, nil) then
            S = 204021;
            return "FieryBrand main 6"
        end
    end
    if x.BulkExtraction:IsCastable() then
        if o(x.BulkExtraction, nil) then
            S = 320341;
            return "bulk_extraction main 8"
        end
    end
    if x.SigilofFlame:IsCastable() and g:FuryDeficit() >= 30 then
        if o(x.SigilofFlame, nil) then
            S = 389810;
            return "sigilofflame 80"
        end
    end
    if B.Commons.Enabled.Potions then
        local a0 = A.PotionSelected()
        if a0 and a0:IsReady() then
            if o(a0, nil) then
                S = 50;
                return "potion main 10"
            end
        end
    end
    if B.Commons.Enabled.Trinkets then
        local a1 = g:GetUseableTrinkets(z, 13)
        if a1 then
            if o(a1, nil) then
                S = 30;
                return "TopTrinket main 12"
            end
        end
        local a2 = g:GetUseableTrinkets(z, 14)
        if a2 then
            if o(a2, nil) then
                S = 40;
                return "BotTrinket main 14"
            end
        end
    end
    if x.TheHunt:IsCastable() or x.TheHunt:IsAvailable() and x.TheHunt:CooldownRemains() < 5 and
        not h:DebuffDown(x.FieryBrandDebuff) then
        if o(x.TheHunt, nil) then
            S = 323639;
            return "the hunt main 16"
        end
    end
    if x.ElysianDecree:IsCastable() then
        if o(x.ElysianDecree, nil) then
            S = 389815;
            return "elysiandecree main 18"
        end
    end
    if x.SoulCarver:IsCastable() or x.SoulCarver:IsAvailable() and x.SoulCarver:CooldownRemains() < 5 and
        not x.FieryDemise:IsAvailable() and not h:DebuffDown(x.FieryBrandDebuff) then
        if o(x.SoulCarver, nil) then
            S = 214743;
            return "soulcarver main 20"
        end
    end
    if x.FieryDemise:IsAvailable() and x.SoulCarver:IsAvailable() and x.SoulCarver:CooldownUp() and
        x.FieryBrand:CooldownUp() or x.FieryBrand:IsAvailable() and x.SoulCarver:IsAvailable() and
        x.SoulCarver:CooldownUp() and x.FieryBrand:CooldownUp() and x.ImmolationAura:CooldownUp() and
        x.FelDevastation:CooldownRemains() < 10 then
        if x.Fracture:IsCastable() and g:FuryDeficit() >= 30 and not h:DebuffRemains(x.FieryBrandDebuff) then
            if o(x.Fracture, nil) then
                S = 263642;
                return "fracture fierydemisewithsoul 10"
            end
        end
        if x.FieryBrand:IsCastable() and (h:DebuffDown(x.FieryBrandDebuff) and g:Fury() >= 30) then
            if o(x.FieryBrand, nil) then
                S = 204021;
                return "fierybrand firedemisewithsoul 20"
            end
        end
        if x.FelDevastation:IsCastable() and h:DebuffRemains(x.FieryBrandDebuff) <= 3 then
            if o(x.FelDevastation, B.Vengeance.GCDasOffGCD.FelDevastation, nil, not h:IsInMeleeRange(20)) then
                S = 212084;
                return "feldevastain 30"
            end
        end
        if x.ImmolationAura:IsCastable() and h:BuffUp(x.FieryBrandDebuff) then
            if o(x.ImmolationAura, nil) then
                S = 258920;
                return "immolationarura 40"
            end
        end
        if x.SpiritBomb:IsCastable() and C >= 4 and h.DebuffRemains(x.FieryBrandDebuff) >= 4 then
            if o(x.SpiritBomb, nil) then
                S = 247454;
                return "spiritbomb 50"
            end
        end
        if x.SoulCarver:IsCastable() and C <= 3 then
            if o(x.SoulCarver, nil) then
                S = 214743;
                return "soulcarver 60"
            end
        end
        if x.Fracture:IsCastable() and C <= 3 and h:DebuffRemains(x.FieryBrandDebuff) >= 5 or
            h:DebuffRemains(x.FieryBrandDebuff) <= 5 and T < 50 then
            if o(x.Fracture, nil) then
                S = 263642;
                return "fracture 70"
            end
        end
        if x.SigilofFlame:IsCastable() and h:DebuffRemains(x.FieryBrandDebuff) <= 3 and T < 50 then
            if o(x.SigilofFlame, nil) then
                S = 389810;
                return "sigilofflame 80"
            end
        end
        if x.ThrowGlaive:IsCastable() then
            if o(x.ThrowGlaive, nil) then
                S = 204157;
                return "throwglaive 90"
            end
        end
    end
    if x.FieryDemise:IsAvailable() and
        (x.SoulCarver:IsAvailable() and x.SoulCarver:CooldownDown() or not x.SoulCarver:IsAvailable()) and
        x.FieryBrand:CooldownUp() and x.ImmolationAura:CooldownUp() and x.FelDevastation:CooldownRemains() < 10 then
        if x.Fracture:IsCastable() and T >= 30 and not h:DebuffRemains(x.FieryBrandDebuff) then
            if o(x.Fracture, nil) then
                S = 263642;
                return "fracture 10"
            end
        end
        if x.FieryBrand:IsCastable() and not h:DebuffRemains(x.FieryBrandDebuff) and T >= 30 then
            if o(x.FieryBrand, nil) then
                S = 204021;
                return "fierybrand 20"
            end
        end
        if x.ImmolationAura:IsCastable() and h:BuffUp(x.FieryBrandDebuff) then
            if o(x.ImmolationAura, nil) then
                S = 258920;
                return "immolationarura 30"
            end
        end
        if x.SpiritBomb:IsReady() and C >= 4 and h:DebuffRemains(x.FieryBrandDebuff) >= 4 and T >= 50 then
            if o(x.SpiritBomb, nil, nil, not h:IsInMeleeRange(8)) then
                S = 247454;
                return "spiritbomb 50"
            end
        end
        if x.Fracture:IsCastable() and
            (C <= 3 and h:DebuffRemains(x.FieryBrandDebuff) >= 5 or h:DebuffRemains(x.FieryBrandDebuff) <= 5 and
                g:Fury() < 50) then
            if o(x.Fracture, nil, nil, not F) then
                S = 263642;
                return "fracture fdsc 14"
            end
        end
        if x.FelDevastation:IsCastable() and h:DebuffRemains(x.FieryBrandDebuff) <= 3 then
            if o(x.FelDevastation, B.Vengeance.GCDasOffGCD.FelDevastation, nil, not h:IsInMeleeRange(20)) then
                S = 212084;
                return "feldevastain 30"
            end
        end
        if x.SigilofFlame:IsCastable() and h:DebuffRemains(x.FieryBrandDebuff) <= 3 and T < 30 then
            if o(x.SigilofFlame, nil) then
                S = 389810;
                return "sigilofflame 80"
            end
        end
    end
    if x.Metamorphosis:IsCastable() and not g:BuffDown(x.MetamorphosisBuff) and not h:DebuffRemains(x.FieryBrandDebuff) then
        if o(x.Metamorphosis, nil) then
            S = 187827;
            return "metamorphosis main 22"
        end
    end
    if x.FelDevastation:IsReady() and not x.DowninFlames:IsAvailable() then
        if o(x.FelDevastation, B.Vengeance.GCDasOffGCD.FelDevastation, nil, not h:IsInMeleeRange(20)) then
            S = 212084;
            return "fel_devastation main 24"
        end
    end
    if x.SpiritBomb:IsReady() and (g:BuffUp(x.MetamorphosisBuff) and x.Fracture:IsAvailable() and C >= 3 or C >= 4) and
        T >= 50 then
        if o(x.SpiritBomb, nil, nil, not h:IsInMeleeRange(8)) then
            S = 247454;
            return "spirit_bomb main 26"
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
            S = 228477;
            return "soul_cleave main 28"
        end
    end
    if x.ImmolationAura:IsCastable() and (x.FieryDemise:IsAvailable() and g:FuryDeficit() >= 10 and
        (x.SoulCarver:CooldownRemains() > 15 or not x.SoulCarver:IsAvailable()) or not x.FieryDemise:IsAvailable() and
        g:FuryDeficit() >= 10) then
        if o(x.ImmolationAura) then
            S = 258920;
            return "immolation_aura main 30"
        end
    end
    if x.Felblade:IsCastable() and g:FuryDeficit() >= 40 then
        if o(x.Felblade, nil, nil, not h:IsSpellInRange(x.Felblade)) then
            S = 232893;
            return "felblade main 30"
        end
    end
    if x.Fracture:IsCastable() and
        (x.SpiritBomb:IsAvailable() and (C <= 3 and K > 1 or K < 2 and g:FuryDeficit() >= 30) or
            not x.SpiritBomb:IsAvailable() and
            (g:BuffUp(x.MetamorphosisBuff) and g:FuryDeficit() >= 45 or g:BuffDown(x.MetamorphosisBuff) and
                g:FuryDeficit() >= 30)) then
        if o(x.Fracture, nil, nil, not F) then
            S = 263642;
            return "fracture main 22"
        end
    end
    if x.SigilofFlame:IsCastable() and g:FuryDeficit() >= 30 then
        if o(x.SigilofFlame, nil) then
            S = 389810;
            return "sigil_of_flame main 34"
        end
    end
    if x.Shear:IsCastable() then
        if o(x.Shear, nil) then
            S = 203782;
            return "shear main 36"
        end
    end
    if x.ThrowGlaive:IsCastable() then
        if o(x.ThrowGlaive, nil, nil, not h:IsSpellInRange(x.ThrowGlaive)) then
            S = 204157;
            return "throw_glaive main 38"
        end
    end
end
local function a3()
end
local function a4()
    u = not HeroRotationCharDB.Toggles[167]
    v = not HeroRotationCharDB.Toggles[168]
    w = not HeroRotationCharDB.Toggles[169]
end
local function a5()
    J = g:GetEnemiesInMeleeRange(8)
    if m() then
        K = #J
    else
        K = 1
    end
    U()
    X()
    H = g:ActiveMitigationNeeded()
    I = g:IsTankingAoE(8) or g:IsTanking(h)
    if l.QueuedCast() then
        S = l.QueuedCast()
        return "Custom Queue " .. j(S):ID()
    end
    if u and x.InfernalStrike:IsAvailable() and x.InfernalStrike:CooldownRemains(BypassRecovery) <= 0 then
        if x.InfernalStrike:IsCastable() and x.InfernalStrike:ChargesFractional() > 1.9 and
            x.InfernalStrike:TimeSinceLastCast() > 2 then
            if l.Cast(x.InfernalStrike, nil, nil, nil) then
                S = 189110;
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
            S = 202137;
            return "queue Sigil of Silence"
        end
    elseif (not x.SigilOfSilence:IsUsableP() or x.SigilOfSilence:CooldownRemains() >= 0) and v then
        HeroRotationCharDB.Toggles[168] = not HeroRotationCharDB.Toggles[168]
        l.Print("Sigil of Silence  Queue is now " ..
                    (HeroRotationCharDB.Toggles[168] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if w and x.ChaosNova:IsReady() and x.ChaosNova:CooldownRemains(BypassRecovery) <= 0 then
        if l.Cast(x.ChaosNova, nil, nil, nil) then
            S = 179057;
            return "queue Chaos Nova"
        end
    elseif (not x.ChaosNova:IsUsableP() or x.ChaosNova:CooldownRemains() >= 0) and w then
        HeroRotationCharDB.Toggles[169] = not HeroRotationCharDB.Toggles[169]
        l.Print("Chaos Nova  Queue is now " ..
                    (HeroRotationCharDB.Toggles[169] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if g:IsChanneling(x.FelDevestation) then
        if l.CastAnnotated(x.Pool, false, "WAIT") then
            S = 99999;
            return "Pool During FelDevestation"
        end
    end
    a4()
    if A.TargetIsValid() then
        if not g:AffectingCombat() then
            local a6 = Y()
            if a6 then
                return a6
            end
        end
        local a6 = A.Interrupt(10, x.Disrupt, B.Commons.OffGCDasOffGCD.Disrupt, false)
        if a6 then
            return a6
        end
        if I then
            local a6 = Z()
            if a6 then
                return a6
            end
        end
        if true then
            local a6 = _()
            if a6 then
                return a6
            end
        end
        if q(x.Pool, false, "WAIT") then
            return "Wait/Pool Resources"
        end
    end
end
local function a7()
    l.Print("Vengeance DH rotation is currently a work in progress, but has been updated for patch 10.0.")
end
function ReturnSpellV()
    if S == 0 then
        return 0
    else
        return S
    end
end
function ReturnSpellMOV()
    if R == 0 then
        return 0
    else
        return R
    end
end
l.SetAPL(581, a5, a7)
