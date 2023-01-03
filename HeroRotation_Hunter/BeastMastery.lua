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
local l = d.Action;
local m = HeroRotation;
local n = m.AoEON;
local o = m.CDsON;
local p = m.Cast;
local q = m.CastSuggested;
local r = math.max;
local s = HeroRotationCharDB.Toggles[4]
local t = HeroRotationCharDB.Toggles[5]
local u = HeroRotationCharDB.Toggles[6]
local v = HeroRotationCharDB.Toggles[12]
local w = not HeroRotationCharDB.Toggles[15]
local x = HeroRotationCharDB.Toggles[120]
local y = HeroRotationCharDB.Toggles[121]
local z = HeroRotationCharDB.Toggles[122]
local A = HeroRotationCharDB.Toggles[123]
local B = HeroRotationCharDB.Toggles[124]
local C = HeroRotationCharDB.Toggles[125]
local D = HeroRotationCharDB.Toggles[142]
local E = HeroRotationCharDB.Toggles[17]
local F;
local G;
local H;
local I;
local J = {355782, 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433,
           334324, 317936, 327332, 328288, 343470, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706,
           347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012,
           324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426}
local K = m.Commons.Everyone;
local L = m.Commons.Hunter;
local M = {
    General = m.GUISettings.General,
    Commons = m.GUISettings.APL.Hunter.Commons,
    BeastMastery = m.GUISettings.APL.Hunter.BeastMastery
}
local N = j.Hunter.BeastMastery;
local O = {N.SummonPet, N.SummonPet2, N.SummonPet3, N.SummonPet4, N.SummonPet5}
local P = k.Hunter.BeastMastery;
local Q = {}
local R = g:GetEquipment()
local S = R[11] and k(R[11]) or k(0)
local T = R[12] and k(R[12]) or k(0)
local U = k(0)
local V = k(0)
local W = GetInventoryItemID("player", 13)
local X = GetInventoryItemID("player", 14)
local Y;
local Z = 11111;
local _ = 11111;
d:RegisterForEvent(function()
    R = g:GetEquipment()
    S = R[11] and k(R[11]) or k(0)
    T = R[12] and k(R[12]) or k(0)
end, "PLAYER_EQUIPMENT_CHANGED")
d:RegisterForEvent(function()
    Z = 11111;
    _ = 11111
end, "PLAYER_REGEN_ENABLED")
local a0, a1, a2;
local a3, a4;
local a5;
local a6;
local Y;
local a7 = 0;
local a8 = 0;
local a9 = {{N.Intimidation, "Cast Intimidation (Interrupt)", function()
    return true
end}}
local function aa(ab)
    if ab then
        return 1
    else
        return 0
    end
end
local function ac(ab)
    return ab ~= 0
end
local function ad(ae)
    local ad = 0;
    if ae ~= nil then
        for af in pairs(ae) do
            local ag = ae[af]
            if ag:IsInRange(40) and (ag:AffectingCombat() or ag:IsDummy() or ag:NPCID() == 153285) and
                ag:DebuffUp(j(257284)) then
                ad = ad + 1
            end
        end
    end
    return ad
end
local function ah(ai)
    return ai:DebuffRemains(N.BarbedShotDebuff)
end
local function aj(ai)
    return ai:DebuffStack(N.LatentPoisonDebuff)
end
local function ak(ai)
    return ai:DebuffRemains(N.SerpentStingDebuff)
end
local function al(ai)
    if ai:DebuffStack(N.LatentPoisonDebuff) > 9 and
        (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
            N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() < Y and
            (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == f("mouseover"):GUID() then
        a8 = 1217200;
        return true
    elseif ai:DebuffStack(N.LatentPoisonDebuff) > 9 and
        (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
            N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() < Y and
            (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and M.BeastMastery.TargetSwap == "AutoSwap" and
        ai:GUID() ~= h:GUID() and not v then
        a8 = 999;
        return true
    elseif ai:DebuffStack(N.LatentPoisonDebuff) > 9 and
        (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
            N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() < Y and
            (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == h:GUID() then
        a7 = 217200;
        return true
    elseif ai:DebuffStack(N.LatentPoisonDebuff) > 9 and
        (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
            N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() < Y and
            (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) then
        return true
    end
end
local function am(ai)
    if (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
        N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() < Y and
        (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == f("mouseover"):GUID() then
        a8 = 1217200;
        return true
    elseif (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
        N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() < Y and
        (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and M.BeastMastery.TargetSwap == "AutoSwap" and
        ai:GUID() ~= h:GUID() and not v then
        a8 = 999;
        return true
    elseif (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
        N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() < Y and
        (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == h:GUID() then
        a7 = 217200;
        return true
    elseif (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
        N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() < Y and
        (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) then
        return true
    end
end
local function an(ai)
    if ai:DebuffStack(N.LatentPoisonDebuff) > 9 and
        (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or _ < 9 or N.WildCall:IsAvailable() and
            N.BarbedShot:ChargesFractional() > 1.8) and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and
        ai:GUID() == f("mouseover"):GUID() then
        a8 = 1217200;
        return true
    elseif ai:DebuffStack(N.LatentPoisonDebuff) > 9 and
        (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or _ < 9 or N.WildCall:IsAvailable() and
            N.BarbedShot:ChargesFractional() > 1.8) and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and
        M.BeastMastery.TargetSwap == "AutoSwap" and ai:GUID() ~= h:GUID() and not v then
        a8 = 999;
        return true
    elseif ai:DebuffStack(N.LatentPoisonDebuff) > 9 and
        (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or _ < 9 or N.WildCall:IsAvailable() and
            N.BarbedShot:ChargesFractional() > 1.8) and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and
        ai:GUID() == h:GUID() then
        a7 = 217200;
        return true
    elseif ai:DebuffStack(N.LatentPoisonDebuff) > 9 and
        (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or _ < 9 or N.WildCall:IsAvailable() and
            N.BarbedShot:ChargesFractional() > 1.8) and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) then
        return true
    end
end
local function ao(ai)
    if (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or _ < 9 or N.WildCall:IsAvailable() and
        N.BarbedShot:ChargesFractional() > 1.8) and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and
        ai:GUID() == f("mouseover"):GUID() then
        a8 = 1217200;
        return true
    elseif (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or _ < 9 or N.WildCall:IsAvailable() and
        N.BarbedShot:ChargesFractional() > 1.8) and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and
        M.BeastMastery.TargetSwap == "AutoSwap" and ai:GUID() ~= h:GUID() and not v then
        a8 = 999;
        return true
    elseif (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or _ < 9 or N.WildCall:IsAvailable() and
        N.BarbedShot:ChargesFractional() > 1.8) and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and
        ai:GUID() == h:GUID() then
        a7 = 217200;
        return true
    elseif (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or _ < 9 or N.WildCall:IsAvailable() and
        N.BarbedShot:ChargesFractional() > 1.8) and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) then
        return true
    end
end
local function ap(ai)
    if ai:DebuffRefreshable(N.SerpentStingDebuff) and ai:TimeToDie() > N.SerpentStingDebuff:BaseDuration() and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == f("mouseover"):GUID() then
        a8 = 1271788;
        return true
    elseif ai:DebuffRefreshable(N.SerpentStingDebuff) and ai:TimeToDie() > N.SerpentStingDebuff:BaseDuration() and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and M.BeastMastery.TargetSwap == "AutoSwap" and
        ai:GUID() ~= h:GUID() and not v then
        a8 = 999;
        return true
    elseif ai:DebuffRefreshable(N.SerpentStingDebuff) and ai:TimeToDie() > N.SerpentStingDebuff:BaseDuration() and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == h:GUID() then
        a7 = 271788;
        return true
    elseif ai:DebuffRefreshable(N.SerpentStingDebuff) and ai:TimeToDie() > N.SerpentStingDebuff:BaseDuration() and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) then
        return true
    end
end
local function aq(ai)
    if (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
        i:BuffStack(N.FrenzyPetBuff) < 3 and (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == f("mouseover"):GUID() then
        a8 = 1217200;
        return true
    elseif (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
        i:BuffStack(N.FrenzyPetBuff) < 3 and (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and M.BeastMastery.TargetSwap == "AutoSwap" and
        ai:GUID() ~= h:GUID() and not v then
        a8 = 999;
        return true
    elseif (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
        i:BuffStack(N.FrenzyPetBuff) < 3 and (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == h:GUID() then
        a7 = 217200;
        return true
    elseif (i:BuffUp(N.FrenzyPetBuff) and i:BuffRemains(N.FrenzyPetBuff) <= Y + 0.25 or N.ScentofBlood:IsAvailable() and
        i:BuffStack(N.FrenzyPetBuff) < 3 and (N.BestialWrath:CooldownRemains() > 0 or not o())) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) then
        return true
    end
end
local function ar(ai)
    if (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or N.WildCall:IsAvailable() and
        N.BarbedShot:ChargesFractional() > 1.8 or N.BarbedShot:FullRechargeTime() < Y and
        (N.BestialWrath:CooldownRemains() > 0 or not o()) or N.ScentofBlood:IsAvailable() and
        (N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() + Y < 8 and
            N.BestialWrath:CooldownRemains() < 24 + 8 - Y + N.BarbedShot:FullRechargeTime() and o()) or _ < 9) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == f("mouseover"):GUID() then
        a8 = 1217200;
        return true
    elseif (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or N.WildCall:IsAvailable() and
        N.BarbedShot:ChargesFractional() > 1.8 or N.BarbedShot:FullRechargeTime() < Y and
        (N.BestialWrath:CooldownRemains() > 0 or not o()) or N.ScentofBlood:IsAvailable() and
        (N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() + Y < 8 and
            N.BestialWrath:CooldownRemains() < 24 + 8 - Y + N.BarbedShot:FullRechargeTime() and o()) or _ < 9) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and M.BeastMastery.TargetSwap == "AutoSwap" and
        ai:GUID() ~= h:GUID() and not v then
        a8 = 999;
        return true
    elseif (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or N.WildCall:IsAvailable() and
        N.BarbedShot:ChargesFractional() > 1.8 or N.BarbedShot:FullRechargeTime() < Y and
        (N.BestialWrath:CooldownRemains() > 0 or not o()) or N.ScentofBlood:IsAvailable() and
        (N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() + Y < 8 and
            N.BestialWrath:CooldownRemains() < 24 + 8 - Y + N.BarbedShot:FullRechargeTime() and o()) or _ < 9) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == h:GUID() then
        a7 = 217200;
        return true
    elseif (N.WildInstincts:IsAvailable() and g:BuffUp(N.CalloftheWildBuff) or N.WildCall:IsAvailable() and
        N.BarbedShot:ChargesFractional() > 1.8 or N.BarbedShot:FullRechargeTime() < Y and
        (N.BestialWrath:CooldownRemains() > 0 or not o()) or N.ScentofBlood:IsAvailable() and
        (N.BestialWrath:CooldownRemains() < 12 + Y and o() or N.BarbedShot:FullRechargeTime() + Y < 8 and
            N.BestialWrath:CooldownRemains() < 24 + 8 - Y + N.BarbedShot:FullRechargeTime() and o()) or _ < 9) and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) then
        return true
    end
end
local function as(ai)
    if ai:DebuffRefreshable(N.SerpentStingDebuff) and h:TimeToDie() > N.SerpentStingDebuff:BaseDuration() and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == f("mouseover"):GUID() then
        a8 = 1271788;
        return true
    elseif ai:DebuffRefreshable(N.SerpentStingDebuff) and h:TimeToDie() > N.SerpentStingDebuff:BaseDuration() and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and M.BeastMastery.TargetSwap == "AutoSwap" and
        ai:GUID() ~= h:GUID() and not v then
        a8 = 999;
        return true
    elseif ai:DebuffRefreshable(N.SerpentStingDebuff) and h:TimeToDie() > N.SerpentStingDebuff:BaseDuration() and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == h:GUID() then
        a7 = 271788;
        return true
    elseif ai:DebuffRefreshable(N.SerpentStingDebuff) and h:TimeToDie() > N.SerpentStingDebuff:BaseDuration() and
        (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) then
        return true
    end
end
local function at()
    if K.TargetIsValid() and a3 then
        if N.BarbedShot:IsCastable() and N.BarbedShot:Charges() >= 2 then
            if p(N.BarbedShot) then
                a7 = 217200;
                return "Barbed Shot (PreCombat)"
            end
        end
        if N.KillShot:IsReady() then
            if p(N.KillShot) then
                a7 = 53351;
                return "Kill Shot (PreCombat)"
            end
        end
        if N.KillCommand:IsCastable() and UnitExists("pet") and a5 then
            if p(N.KillCommand) then
                a7 = 34026;
                return "Kill Command (PreCombat)"
            end
        end
        if a2 > 1 then
            if N.MultiShot:IsCastable() then
                if p(N.MultiShot) then
                    a7 = 2643;
                    return "Multi-Shot (PreCombat)"
                end
            end
        else
            if N.CobraShot:IsCastable() then
                if p(N.CobraShot) then
                    a7 = 193455;
                    return "Cobra Shot (PreCombat)"
                end
            end
        end
    end
end
local function au()
    if N.Berserking:IsCastable() and o() and
        (not N.BestialWrath:IsAvailable() or g:BuffUp(N.BestialWrathBuff) or _ < 16) then
        if p(N.Berserking, nil) then
            a7 = 26297;
            return "Berserking"
        end
    end
    if N.BloodFury:IsCastable() and o() and (g:BuffUp(N.CalloftheWildBuff) or not N.CalloftheWild:IsAvailable() and
        (g:BuffUp(N.BestialWrathBuff) and g:BloodlustUp() or h:HealthPercentage() < 20) or _ < 16) then
        if p(N.BloodFury, nil) then
            a7 = 20572;
            return "Blood Fury"
        end
    end
    if N.AncestralCall:IsCastable() and o() and (g:BuffUp(N.CalloftheWildBuff) or not N.CalloftheWild:IsAvailable() and
        (g:BuffUp(N.BestialWrathBuff) and g:BloodlustUp() or h:HealthPercentage() < 20) or _ < 16) then
        if p(N.AncestralCall, nil) then
            a7 = 274738;
            return "Ancestral Call"
        end
    end
    if N.Fireblood:IsCastable() and o() and (g:BuffUp(N.CalloftheWildBuff) or not N.CalloftheWild:IsAvailable() and
        (g:BuffUp(N.BestialWrathBuff) and (g:BloodlustUp() or h:HealthPercentage() < 20)) or _ < 10) then
        if p(N.Fireblood, nil) then
            a7 = 265221;
            return "Fireblood"
        end
    end
    if M.Commons.Enabled.Potions and o() and w and
        ((g:BuffUp(N.CalloftheWildBuff) or not N.CalloftheWild:IsAvailable() and
            (g:BuffUp(N.BestialWrathBuff) and (g:BloodlustUp() or h:HealthPercentage() < 20)) or _ < 31) and
            not m.GUISettings.General.HoldPotforBL or m.GUISettings.General.HoldPotforBL and g:BloodlustUp()) then
        local av = K.PotionSelected()
        if av and av:IsReady() then
            if p(av, nil, nil) then
                a7 = 50;
                return "potion cooldowns 2"
            end
        end
    end
    if N.LightsJudgment:IsCastable() and o() and (i:BuffRemains(N.FrenzyPetBuff) > Y or i:BuffDown(N.FrenzyPetBuff)) then
        if p(N.LightsJudgment, nil, nil, 40) then
            a7 = 255647;
            return "Light's Judgment"
        end
    end
end
local function aw()
    local ax = g:GetUseableTrinkets(Q, 13)
    if ax and (g:BuffUp(N.CalloftheWildBuff) or not N.CalloftheWild:IsAvailable() and
        (g:BuffUp(N.BestialWrathBuff) and (g:BloodlustUp() or h:HealthPercentage() < 20)) or _ < 31) then
        if ax:ID() == W and M.Commons.Enabled.TopTrinket then
            if p(ax, nil, nil) then
                a7 = 24;
                return "Generic use_items for " .. ax:Name()
            end
        end
    end
    local ay = g:GetUseableTrinkets(Q, 14)
    if ay and (g:BuffUp(N.CalloftheWildBuff) or not N.CalloftheWild:IsAvailable() and
        (g:BuffUp(N.BestialWrathBuff) and (g:BloodlustUp() or h:HealthPercentage() < 20)) or _ < 31) then
        if ay:ID() == W and M.Commons.Enabled.BottomTrinket then
            if p(ay, nil, nil) then
                a7 = 30;
                return "Generic use_items for " .. ay:Name()
            end
        end
    end
end
local function az()
    if N.BarbedShot:IsCastable() then
        if K.CastTargetIf(N.BarbedShot, a0, "max", aj, al, not h:IsSpellInRange(N.BarbedShot)) then
            return "barbed_shot cleave 2"
        end
        if aj(h) and al(h) then
            if p(N.BarbedShot, nil, nil, not a3) then
                a7 = 217200;
                return "barbed_shot cleave 2"
            end
        end
    end
    if N.BarbedShot:IsCastable() then
        if K.CastTargetIf(N.BarbedShot, a0, "min", ah, am, not h:IsSpellInRange(N.BarbedShot)) then
            return "barbed_shot cleave 4"
        end
        if ah(h) and am(h) then
            if p(N.BarbedShot, nil, nil, not a3) then
                a7 = 217200;
                return "barbed_shot cleave 4"
            end
        end
    end
    if N.MultiShot:IsReady() and Y - i:BuffRemains(N.BeastCleavePetBuff) > 0.25 then
        if p(N.MultiShot, nil, nil, not a3) then
            a7 = 2643;
            return "Multi-Shot (Cleave - 1)"
        end
    end
    if N.KillCommand:IsReady() and
        (N.KillCommand:FullRechargeTime() < Y and N.AlphaPredator:IsAvailable() and N.KillCleave:IsAvailable()) then
        if p(N.KillCommand) then
            a7 = 34026;
            return "Kill Command (Cleave)"
        end
    end
    if N.CalloftheWild:IsCastable() and o() and h:IsInMeleeRange(40) then
        if p(N.CalloftheWild, nil) then
            a7 = 359844;
            return "CalloftheWild (Cleave)"
        end
    end
    if N.ExplosiveShot:IsReady() and h:IsInMeleeRange(40) and t then
        if p(N.ExplosiveShot, nil, nil, not h:IsInRange(40)) then
            a7 = 212431;
            return "ExplosiveShot cleave 4"
        end
    end
    if N.Stampede:IsCastable() and G and (g:BuffUp(N.BestialWrathBuff) or _ < 15) then
        if p(N.Stampede, nil, nil, not a4) then
            a7 = 201430;
            return "Stampede (Cleave)"
        end
    end
    if N.Bloodshed:IsCastable() and I then
        if p(N.Bloodshed, nil) then
            a7 = 321530;
            return "Bloodshed (ST)"
        end
    end
    if N.DeathChakram:IsCastable() and t then
        if p(N.DeathChakram, nil, nil) then
            a7 = 325028;
            return "death_chakram st"
        end
    end
    if N.BestialWrath:IsCastable() and UnitExists("pet") and H then
        if p(N.BestialWrath, nil) then
            a7 = 19574;
            return "Bestial Wrath (Cleave)"
        end
    end
    if N.AMurderofCrows:IsReady() then
        if p(N.AMurderofCrows, nil, nil, not a3) then
            a7 = 131894;
            return "A Murder of Crows (Cleave)"
        end
    end
    if N.BarbedShot:IsCastable() then
        if K.CastTargetIf(N.BarbedShot, a0, "max", aj, an, not h:IsSpellInRange(N.BarbedShot)) then
            return "barbed_shot cleave 26"
        end
        if aj(h) and an(h) then
            if p(N.BarbedShot, nil, nil, not a3) then
                a7 = 217200;
                return "barbed_shot cleave 26"
            end
        end
    end
    if N.BarbedShot:IsCastable() then
        if K.CastTargetIf(N.BarbedShot, a0, "min", ah, ao, not h:IsSpellInRange(N.BarbedShot)) then
            return "barbed_shot cleave 28"
        end
        if ah(h) and ao(h) then
            if p(N.BarbedShot, nil, nil, not a3) then
                a7 = 217200;
                return "barbed_shot cleave 28"
            end
        end
    end
    if N.KillCommand:IsReady() and UnitExists("pet") then
        if p(N.KillCommand) then
            a7 = 34026;
            return "Kill Command (Cleave)"
        end
    end
    if N.DireBeast:IsReady() then
        if p(N.DireBeast, nil, nil, not a3) then
            a7 = 120679;
            return "Dire Beast (Cleave)"
        end
    end
    if N.SerpentSting:IsReady() then
        if K.CastTargetIf(N.SerpentSting, a0, "min", ak, ap, not h:IsSpellInRange(N.SerpentSting)) then
            return "serpent_sting cleave 34"
        end
    end
    if N.Barrage:IsReady() and i:BuffRemains(N.BeastCleavePetBuff) > N.Barrage:ExecuteTime() then
        if p(N.Barrage, nil, nil, not a3) then
            a7 = 120360;
            return "Barrage (Cleave)"
        end
    end
    if N.KillShot:IsReady() then
        if p(N.KillShot, nil, nil, not a3) then
            a7 = 53351;
            return "Kill Shot (Cleave) 8"
        end
    end
    if N.AspectoftheWild:IsCastable() and F and UnitExists("pet") and h:IsInMeleeRange(40) then
        if p(N.AspectoftheWild, nil) then
            a7 = 193530;
            return "Aspect of the Wild (Cleave)"
        end
    end
    if N.CobraShot:IsReady() and
        (g:FocusTimeToMax() < Y * 2 or g:BuffUp(N.AspectoftheWildBuff) and g:FocusTimeToMax() < Y * 4) then
        if p(N.CobraShot) then
            a7 = 193455;
            return "Cobra-Shot (Cleave)"
        end
    end
    if N.WailingArrow:IsReady() and t and not E and not g:IsMoving() and h:IsInMeleeRange(40) and
        (i:BuffRemains(N.FrenzyPetBuff) > N.WailingArrow:ExecuteTime() or _ < 5) then
        if p(N.WailingArrow, nil, nil, not a3) then
            a7 = 392060;
            return "Wailing Arrow (Cleave)"
        end
    end
    if N.BagofTricks:IsCastable() and o() and (g:BuffDown(N.BestialWrathBuff) or _ < 5) then
        if p(N.BagofTricks, nil, nil, not a3) then
            a7 = 312411;
            return "Bag of Tricks (ST)"
        end
    end
    if N.ArcaneTorrent:IsCastable() and o() and g:Focus() + g:FocusRegen() + 30 < g:FocusMax() then
        if p(N.ArcaneTorrent, nil, nil, not h:IsInRange(8)) then
            a7 = 155145;
            return "arcane_torrent cleave 56"
        end
    end
end
local function aA()
    if N.BarbedShot:IsCastable() then
        if K.CastTargetIf(N.BarbedShot, a0, "min", ah, aq, not h:IsSpellInRange(N.BarbedShot)) then
            return "barbed_shot st 2"
        end
        if ah(h) and aq(h) then
            if p(N.BarbedShot, nil, nil, not a3) then
                a7 = 217200;
                return "barbed_shot st 2"
            end
        end
    end
    if N.KillCommand:IsReady() and UnitExists("pet") and a5 and
        (N.KillCommand:FullRechargeTime() < Y and N.AlphaPredator:IsAvailable()) then
        if p(N.KillCommand) then
            a7 = 34026;
            return "Kill Command (ST)"
        end
    end
    if N.CalloftheWild:IsCastable() and o() and h:IsInMeleeRange(40) then
        if p(N.CalloftheWild, nil) then
            a7 = 359844;
            return "CalloftheWild (Cleave)"
        end
    end
    if N.DeathChakram:IsCastable() and t then
        if p(N.DeathChakram, nil, nil) then
            a7 = 325028;
            return "death_chakram st"
        end
    end
    if N.Bloodshed:IsCastable() and I then
        if p(N.Bloodshed, nil) then
            a7 = 321530;
            return "Bloodshed (ST)"
        end
    end
    if N.Stampede:IsCastable() and G then
        if p(N.Stampede, nil, nil, not a4) then
            a7 = 201430;
            return "Stampede (ST)"
        end
    end
    if N.AMurderofCrows:IsReady() then
        if p(N.AMurderofCrows, nil, nil, not a3) then
            a7 = 131894;
            return "A Murder of Crows (ST)"
        end
    end
    if N.ExplosiveShot:IsReady() and h:IsInMeleeRange(40) and t then
        if p(N.ExplosiveShot, nil, nil, not h:IsInRange(40)) then
            a7 = 212431;
            return "ExplosiveShot cleave 4"
        end
    end
    if N.BestialWrath:IsCastable() and H and UnitExists("pet") and a2 > 0 then
        if p(N.BestialWrath, nil) then
            a7 = 19574;
            return "Bestial Wrath (ST)"
        end
    end
    if N.KillCommand:IsReady() and UnitExists("pet") and a5 then
        if p(N.KillCommand) then
            a7 = 34026;
            return "Kill Command (ST)"
        end
    end
    if N.BarbedShot:IsCastable() then
        if K.CastTargetIf(N.BarbedShot, a0, "min", ah, ar, not h:IsSpellInRange(N.BarbedShot)) then
            return "barbed_shot st 24"
        end
        if ah(h) and ar(h) then
            if p(N.BarbedShot, nil, nil, not a3) then
                a7 = 217200;
                return "barbed_shot st 24"
            end
        end
    end
    if N.DireBeast:IsReady() then
        if p(N.DireBeast, nil, nil, not a3) then
            a7 = 120679;
            return "Dire Beast (ST)"
        end
    end
    if N.SerpentSting:IsReady() then
        if K.CastTargetIf(N.SerpentSting, a0, "min", ak, as, not h:IsSpellInRange(N.SerpentSting)) then
            return "serpent_sting st 28"
        end
    end
    if N.KillShot:IsReady() then
        if p(N.KillShot, nil, nil, not a3) then
            a7 = 53351;
            return "Kill Shot (ST)"
        end
    end
    if N.AspectoftheWild:IsCastable() and F and UnitExists("pet") and h:IsInMeleeRange(40) then
        if p(N.AspectoftheWild, nil) then
            a7 = 193530;
            return "Aspect of the Wild (Cleave)"
        end
    end
    if N.CobraShot:IsReady() then
        if p(N.CobraShot, nil, nil, not a3) then
            a7 = 193455;
            return "Cobra Shot (ST)"
        end
    end
    if N.WailingArrow:IsReady() and t and not E and not g:IsMoving() and h:IsInMeleeRange(40) and
        (i:BuffRemains(N.FrenzyPetBuff) > N.WailingArrow:ExecuteTime() or _ < 5) then
        if p(N.WailingArrow, nil, nil, not a3) then
            a7 = 355589;
            return "Wailing Arrow (ST)"
        end
    end
    if o() then
        if N.BagofTricks:IsCastable() and o() and (g:BuffDown(N.BestialWrathBuff) or _ < 5) then
            if p(N.BagofTricks, nil, nil, not a3) then
                a7 = 312411;
                return "Bag of Tricks (ST)"
            end
        end
        if N.ArcaneTorrent:IsCastable() and o() and g:Focus() + g:FocusRegen() + 15 < g:FocusMax() then
            if p(N.ArcaneTorrent, nil, nil, not h:IsInRange(8)) then
                a7 = 155145;
                return "arcane_torrent st 50"
            end
        end
    end
end
local function aB()
    u = HeroRotationCharDB.Toggles[6]
    s = HeroRotationCharDB.Toggles[4]
    t = HeroRotationCharDB.Toggles[5]
    v = HeroRotationCharDB.Toggles[12]
    w = not HeroRotationCharDB.Toggles[15]
    x = HeroRotationCharDB.Toggles[120]
    y = HeroRotationCharDB.Toggles[121]
    z = HeroRotationCharDB.Toggles[122]
    A = HeroRotationCharDB.Toggles[123]
    B = HeroRotationCharDB.Toggles[124]
    C = HeroRotationCharDB.Toggles[125]
    D = HeroRotationCharDB.Toggles[142]
    E = HeroRotationCharDB.Toggles[17]
    F = false;
    G = false;
    H = false;
    I = false;
    if M.BeastMastery.AspectoftheWild == "CDs" and o() or M.BeastMastery.AspectoftheWild == "Small CDs" and (o() or t) or
        M.BeastMastery.AspectoftheWild == "Always" then
        F = true
    end
    if M.BeastMastery.Stampede == "CDs" and o() or M.BeastMastery.Stampede == "Small CDs" and (o() or t) or
        M.BeastMastery.Stampede == "Always" then
        G = true
    end
    if M.BeastMastery.BestialWrathCD == "CDs" and o() or M.BeastMastery.BestialWrathCD == "Small CDs" and (o() or t) or
        M.BeastMastery.BestialWrathCD == "Always" then
        H = true
    end
    if M.BeastMastery.Bloodshed == "CDs" and o() or M.BeastMastery.Bloodshed == "Small CDs" and (o() or t) or
        M.BeastMastery.Bloodshed == "Always" then
        I = true
    end
    W = GetInventoryItemID("player", 13)
    X = GetInventoryItemID("player", 14)
end
local function aC()
    if N.Stomp:IsAvailable() then
        d.SplashEnemies.ChangeFriendTargetsTracking("Mine Only")
    else
        d.SplashEnemies.ChangeFriendTargetsTracking("All")
    end
    local W, aD = GetInventoryItemID("player", 13)
    local X, aD = GetInventoryItemID("player", 14)
    Y = g:GCD() + 0.150;
    if K.TargetIsValid() or g:AffectingCombat() then
        Z = d.BossFightRemains(nil, true)
        _ = Z;
        if _ == 11111 then
            _ = d.FightRemains(Enemies8y, false)
        end
    end
    if a8 > 0 then
        a8 = 0
    end
    if a7 > 0 then
        a7 = 0
    end
    local aE = N.BloodBolt:IsPetKnown() and l.FindBySpellID(N.BloodBolt:ID()) and N.BloodBolt or N.Bite:IsPetKnown() and
                   l.FindBySpellID(N.Bite:ID()) and N.Bite or N.Claw:IsPetKnown() and l.FindBySpellID(N.Claw:ID()) and
                   N.Claw or N.Smack:IsPetKnown() and l.FindBySpellID(N.Smack:ID()) and N.Smack or nil;
    local aF = N.Growl:IsPetKnown() and l.FindBySpellID(N.Growl:ID()) and N.Growl or nil;
    if n() then
        a0 = g:GetEnemiesInRange(40)
        a2 = aE and #g:GetEnemiesInSpellActionRange(aE) or h:GetEnemiesInSplashRangeCount(8)
    else
        a0 = {}
        a2 = 0
    end
    a3 = h:IsInRange(40)
    a4 = h:IsInRange(30)
    a5 = aF and h:IsSpellInActionRange(aF) or h:IsInRange(30)
    aB()
    if N.Exhilaration:IsCastable() and g:HealthPercentage() <= M.Commons.ExhilarationHP then
        if p(N.Exhilaration, nil) then
            a7 = 109304;
            return "Exhilaration"
        end
    end
    if g:HealthPercentage() < M.Commons.HealthstoneHP and P.Healthstone:IsReady() and P.Healthstone:CooldownRemains() <=
        0 then
        if m.Cast(P.Healthstone, nil) then
            a7 = 40;
            return "Healthstone HP"
        end
    end
    if g:HealthPercentage() < M.Commons.HealPotHP and P.CosmicHealPot:IsReady() and P.CosmicHealPot:CooldownRemains() <=
        0 then
        if m.Cast(P.CosmicHealPot, nil) then
            a7 = 45;
            return "CosmicHealPot HP"
        end
    end
    if g:HealthPercentage() < M.Commons.HealPotHP and P.HealPot:IsReady() and P.HealPot:CooldownRemains() <= 0 then
        if m.Cast(P.HealPot, nil) then
            a7 = 41;
            return "HealPot HP"
        end
    end
    if N.AspectoftheTurtle:IsCastable() and g:HealthPercentage() <= M.Commons.TurtleHP then
        if p(N.AspectoftheTurtle, nil) then
            a7 = 186265;
            return "AspectoftheTurtle"
        end
    end
    if g:BuffUp(j(5384)) then
        return false
    end
    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if N.CobraShot:IsCastable() and a3 then
            if p(N.CobraShot, nil) then
                a8 = 1193455;
                return "explosive MO SWD"
            end
        end
    end
    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if N.CobraShot:IsCastable() and a3 then
            if p(N.CobraShot, nil) then
                a7 = 193455;
                return "explosive  SWD"
            end
        end
    end
    J = {333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936,
         327332, 328288, 195181, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141,
         327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477,
         368396, 355057, 356133, 158337, 164426}
    if UnitExists("target") and N.TranqualizingShot:IsCastable() and not D then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true and
            N.TranqualizingShot:IsCastable() and N.TranqualizingShot:CooldownRemains(BypassRecovery) <= 0 then
            for aG = 0, 40 do
                local aD, aD, aH, aI, aD, aD, aD, aD, aD, aJ = UnitBuff("target", aG)
                for aD, aK in pairs(J) do
                    if aK == aJ then
                        if m.Cast(N.TranqualizingShot, nil) then
                            a7 = 19801;
                            return "Tranq Enrage"
                        end
                    end
                end
            end
        end
    end
    if m.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + m.GUISettings.General.OpenerReset
    elseif m.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and
        HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        m.ToggleIconFrame:UpdateButtonText(6)
        m.Print("Opener is now " ..
                    (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end
    if m.QueuedCast() then
        a7 = m.QueuedCast()
        return "Custom Queue " .. j(a7):ID()
    end
    if x and N.Bindingshot:IsAvailable() and N.Bindingshot:CooldownRemains(BypassRecovery) <= 0 then
        if m.Cast(N.Bindingshot, nil, nil, nil) then
            a7 = 109248;
            return "queue Binding Shot"
        end
    elseif (not N.Bindingshot:IsUsableP() or N.Bindingshot:CooldownRemains() > 0) and x then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
        m.Print("Binding Shot Queue is now " ..
                    (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if y and N.FreezingTrap:IsAvailable() and N.FreezingTrap:CooldownRemains(BypassRecovery) <= 0 then
        if m.Cast(N.FreezingTrap, nil, nil, nil) then
            a7 = 187650;
            return "queue Freezing Trap"
        end
    elseif (not N.FreezingTrap:IsUsableP() or N.FreezingTrap:CooldownRemains() > 0) and y then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
        m.Print("Freezing Trap Queue is now " ..
                    (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if z and N.Intimidation:IsAvailable() and N.Intimidation:CooldownRemains(BypassRecovery) <= 0 then
        if m.Cast(N.Intimidation, nil, nil, nil) then
            a7 = 19577;
            return "queue Intimidation"
        end
    elseif (not N.Intimidation:IsUsableP() or N.Intimidation:CooldownRemains() > 0) and z then
        HeroRotationCharDB.Toggles[122] = not HeroRotationCharDB.Toggles[122]
        m.Print("Intimidation Queue is now " ..
                    (HeroRotationCharDB.Toggles[122] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if A and N.Flare:IsAvailable() and N.Flare:CooldownRemains(BypassRecovery) <= 0 then
        if m.Cast(N.Flare, nil, nil, nil) then
            a7 = 1543;
            return "queue Flare"
        end
    elseif (not N.Flare:IsUsableP() or N.Flare:CooldownRemains() > 0) and A then
        HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123]
        m.Print("Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if B and N.TarTrap:IsAvailable() and N.TarTrap:CooldownRemains(BypassRecovery) <= 0 then
        if m.Cast(N.TarTrap, nil, nil, nil) then
            a7 = 187698;
            return "queue TarTrap"
        end
    elseif (not N.TarTrap:IsUsableP() or N.TarTrap:CooldownRemains() > 0) and B then
        HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124]
        m.Print("Tar Trap Queue is now " ..
                    (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if g:BuffUp(j(5384)) then
        return false
    end
    if g:IsCasting(N.RevivePet) then
        if p(N.PoolFocus) then
            a7 = 999999;
            return "Pooling Focus"
        end
    end
    if i:IsActive() and select(2, GetStablePetInfo(M.Commons.SummonPetSlot)) ~= select(1, UnitName("pet")) and
        M.Commons.SummonPetSlot ~= 0 and not g:IsMoving() and not g:PrevGCD(1, N.DismissPet) and
        not g:IsCasting(N.DismissPet) then
        if p(N.DismissPet, nil) then
            a7 = 2641;
            return "Dismiss Pet"
        end
    end
    if N.SummonPet:IsCastable() and not i:IsActive() and M.Commons.SummonPetSlot ~= 0 then
        if M.Commons.SummonPetSlot == 1 and not g:PrevGCD(1, O[M.Commons.SummonPetSlot]) then
            if p(O[M.Commons.SummonPetSlot], nil) then
                a7 = 883;
                return "Summon Pet"
            end
        elseif M.Commons.SummonPetSlot == 2 and not g:PrevGCD(1, O[M.Commons.SummonPetSlot]) then
            if p(O[M.Commons.SummonPetSlot], nil) then
                a7 = 83242;
                return "Summon Pet"
            end
        elseif M.Commons.SummonPetSlot == 3 and not g:PrevGCD(1, O[M.Commons.SummonPetSlot]) then
            if p(O[M.Commons.SummonPetSlot], nil) then
                a7 = 83243;
                return "Summon Pet"
            end
        elseif M.Commons.SummonPetSlot == 4 and not g:PrevGCD(1, O[M.Commons.SummonPetSlot]) then
            if p(O[M.Commons.SummonPetSlot], nil) then
                a7 = 83244;
                return "Summon Pet"
            end
        elseif M.Commons.SummonPetSlot == 5 and not g:PrevGCD(1, O[M.Commons.SummonPetSlot]) then
            if p(O[M.Commons.SummonPetSlot], nil) then
                a7 = 83245;
                return "Summon Pet"
            end
        end
    end
    if (i:IsDeadOrGhost() or not UnitExists("pet")) and N.RevivePet:IsCastable() and not g:IsMoving() and
        M.Commons.SummonPetSlot ~= 0 then
        if p(N.RevivePet, nil) then
            a7 = 982;
            return "Revive Pet"
        end
    end
    local aL, aM, aD = GetSpellCooldown(34477)
    if g:AffectingCombat() and M.Commons.AutoMisdirect and not C then
        if aL + aM - GetTime() <= 0 and N.Misdirection:IsAvailable() and N.Misdirection:CooldownRemains(BypassRecovery) <=
            0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus") or UnitIsUnit("focus", "pet")) and
            IsItemInRange(32698, "focus") then
            if m.Cast(N.Misdirection) then
                a8 = 134477;
                return "MD Focus"
            end
        end
    end
    if not i:IsDeadOrGhost() and UnitExists("pet") and N.MendPet:IsCastable() and i:HealthPercentage() <=
        M.Commons.MendPetHighHP and not g:PrevGCD(1, N.MendPet) then
        if p(N.MendPet) then
            a7 = 1982;
            return "Mend Pet High Priority"
        end
    end
    if not g:AffectingCombat() and (u or M.BeastMastery.DBMSupport and
        (N.BestialWrath:IsCastable() and H and m.BossMods:GetPullTimer() < Y and m.BossMods:GetPullTimer() > 0 or
            m.BossMods:GetPullTimer() < 0.5 and m.BossMods:GetPullTimer() > 0)) and K.TargetIsValid() then
        a6 = at()
        if a6 then
            return a6
        end
    end
    if K.TargetIsValid() and (g:AffectingCombat() or u) then
        if not h:AffectingCombat() and not h:IsDummy() and not h:NPCID() == 153285 and a2 >= 1 then
            a7 = 999
        end
        if not h:AffectingCombat() and not h:IsDummy() and not h:NPCID() == 153285 then
            if p(N.PoolFocus) then
                a7 = 999999;
                return "Pooling Focus"
            end
        end
        if true then
            a6 = au()
            if a6 then
                return a6
            end
        end
        if (M.Commons.Enabled.TopTrinket or M.Commons.Enabled.BottomTrinket) and o() then
            local a6 = aw()
            if a6 then
                return a6
            end
        end
        if a2 < 2 or not N.BeastCleave:IsAvailable() and a2 < 3 then
            local a6 = aA()
            if a6 then
                return a6
            end
        end
        if a2 > 2 or N.BeastCleave:IsAvailable() and a2 > 1 then
            local a6 = az()
            if a6 then
                return a6
            end
        end
        if not i:IsDeadOrGhost() and UnitExists("pet") and N.MendPet:IsCastable() and i:HealthPercentage() <=
            M.Commons.MendPetLowHP then
            if p(N.MendPet) then
                a7 = 1982;
                return "Mend Pet Low Priority (w/ Target)"
            end
        end
        if t and not E and not g:IsMoving() and h:IsInMeleeRange(40) and
            (N.WailingArrow:IsReady() and i:BuffRemains(N.FrenzyPetBuff) > N.WailingArrow:ExecuteTime() and
                (g:Covenant() == "Night Fae" and g:BuffUp(N.WildSpiritsBuff))) then
            if p(N.WailingArrow, nil, nil, not a3) then
                a7 = 355589;
                return "Wailing Arrow (ST)1"
            end
        end
        if p(N.PoolFocus) then
            a7 = 999999;
            return "Pooling Focus"
        end
    end
    if not i:IsDeadOrGhost() and UnitExists("pet") and N.MendPet:IsCastable() and i:HealthPercentage() <=
        M.Commons.MendPetLowHP then
        if p(N.MendPet) then
            a7 = 1982;
            return "Mend Pet Low Priority (w/o Target)"
        end
    end
end
local function aN()
    d.Print(
        "BeastMastery can use pet abilities to better determine AoE, makes sure you have Growl and Blood Bolt / Bite / Claw / Smack in your player action bars.")
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        m.ToggleIconFrame:UpdateButtonText(6)
    end
end
function ReturnSpell1()
    if a7 == 0 then
        return 0
    else
        return a7
    end
end
function ReturnSpellMO1()
    if a8 == 0 then
        return 0
    else
        return a8
    end
end
m.SetAPL(253, aC, aN)
