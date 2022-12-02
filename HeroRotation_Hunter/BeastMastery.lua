local e, e = ...
local e = HeroDBC.DBC
local f = HeroLib
local e = HeroCache
local w = f.Unit
local a = w.Player
local i = w.Target
local h = w.Pet
local z = f.Spell
local t = f.Item
local x = f.Action
local d = HeroRotation
local oe = d.AoEON
local r = d.CDsON
local o = d.Cast
local e = d.CastSuggested
local e = math.max
local se = HeroRotationCharDB.Toggles[4]
local v = HeroRotationCharDB.Toggles[5]
local S = HeroRotationCharDB.Toggles[6]
local g = HeroRotationCharDB.Toggles[12]
local P = HeroRotationCharDB.Toggles[15]
local D = HeroRotationCharDB.Toggles[120]
local M = HeroRotationCharDB.Toggles[121]
local C = HeroRotationCharDB.Toggles[122]
local L = HeroRotationCharDB.Toggles[123]
local U = HeroRotationCharDB.Toggles[124]
local G = HeroRotationCharDB.Toggles[125]
local B = HeroRotationCharDB.Toggles[142]
local _ = HeroRotationCharDB.Toggles[17]
local E
local T
local j
local A
local V = { 355782, 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 343470, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426 }
local m = d.Commons.Everyone
local e = d.Commons.Hunter
local n = { General = d.GUISettings.General, Commons = d.GUISettings.APL.Hunter.Commons, BeastMastery = d.GUISettings.APL.Hunter.BeastMastery }
local e = z.Hunter.BeastMastery
local p = { e.SummonPet, e.SummonPet2, e.SummonPet3, e.SummonPet4, e.SummonPet5 }
local b = t.Hunter.BeastMastery
local Y = {  }
local s = a:GetEquipment()
local u = (s[11]) and t(s[11]) or t(0)
local c = (s[12]) and t(s[12]) or t(0)
local l = t(0)
local l = t(0)
local R = GetInventoryItemID("player", 13)
local ie = GetInventoryItemID("player", 14)
local l
local N = 11111
local l = 11111
f:RegisterForEvent(function()
    s = a:GetEquipment()
    u = (s[11]) and t(s[11]) or t(0)
    c = (s[12]) and t(s[12]) or t(0)
end, "PLAYER_EQUIPMENT_CHANGED")
f:RegisterForEvent(function()
    N = 11111
    l = 11111
end, "PLAYER_REGEN_ENABLED")
local y, t, k
local c, H
local I
local q
local s
local t = 0
local u = 0
local O = { { e.Intimidation, "Cast Intimidation (Interrupt)", function()
    return true
end } }
local function O(e)
    if e then
        return 1
    else
        return 0
    end

end

local function O(e)
    return e ~= 0
end

local function O(e)
    local t = 0
    if e ~= nil then
        for a in pairs(e) do
            local e = e[a]
            if e:IsInRange(40) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) and e:DebuffUp(z(257284)) then
                t = t + 1
            end

        end

    end

    return t
end

local function O(t)
    return (t:DebuffRemains(e.BarbedShotDebuff))
end

local function W(t)
    return (t:DebuffStack(e.LatentPoisonDebuff))
end

local function F(t)
    return (t:DebuffRemains(e.SerpentStingDebuff))
end

local function re(a)
                if ((a:DebuffStack(e.LatentPoisonDebuff) > 9 and ((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + s) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r())))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == w("mouseover"):GUID()) then
        u = 1217200
        return true
    elseif ((a:DebuffStack(e.LatentPoisonDebuff) > 9 and ((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + s) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r())))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not g) then
        u = 999
        return true
    elseif ((a:DebuffStack(e.LatentPoisonDebuff) > 9 and ((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + s) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r())))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif (a:DebuffStack(e.LatentPoisonDebuff) > 9 and ((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + s) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r())))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function he(a)
                if (((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + s) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == w("mouseover"):GUID()) then
        u = 1217200
        return true
    elseif (((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + s) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not g) then
        u = 999
        return true
    elseif (((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + s) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif ((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + s) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function ae(o)
                if ((o:DebuffStack(e.LatentPoisonDebuff) > 9 and ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.2))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == w("mouseover"):GUID()) then
        u = 1217200
        return true
    elseif ((o:DebuffStack(e.LatentPoisonDebuff) > 9 and ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.2))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not g) then
        u = 999
        return true
    elseif ((o:DebuffStack(e.LatentPoisonDebuff) > 9 and ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.2))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif (o:DebuffStack(e.LatentPoisonDebuff) > 9 and ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.2))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) then
        return true
    end

end

local function ne(o)
                if (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.2)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == w("mouseover"):GUID()) then
        u = 1217200
        return true
    elseif (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.2)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not g) then
        u = 999
        return true
    elseif (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.2)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.2)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) then
        return true
    end

end

local function Q(a)
                if ((a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == w("mouseover"):GUID()) then
        u = 1271788
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not g) then
        u = 999
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 271788
        return true
    elseif (a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function K(a)
                if (((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and h:BuffStack(e.FrenzyPetBuff) < 3 and (e.BestialWrath:CooldownRemains() > 0 or not r()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == w("mouseover"):GUID()) then
        u = 1217200
        return true
    elseif (((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and h:BuffStack(e.FrenzyPetBuff) < 3 and (e.BestialWrath:CooldownRemains() > 0 or not r()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not g) then
        u = 999
        return true
    elseif (((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and h:BuffStack(e.FrenzyPetBuff) < 3 and (e.BestialWrath:CooldownRemains() > 0 or not r()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif ((h:BuffUp(e.FrenzyPetBuff) and h:BuffRemains(e.FrenzyPetBuff) <= s + .25) or (e.ScentofBlood:IsAvailable() and h:BuffStack(e.FrenzyPetBuff) < 3 and (e.BestialWrath:CooldownRemains() > 0 or not r()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function J(o)
                if (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.4) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r())) or (e.ScentofBlood:IsAvailable() and (e.BestialWrath:CooldownRemains() < 12 + s or (e.BarbedShot:FullRechargeTime() + s < 8 and e.BestialWrath:CooldownRemains() < 24 + (8 - s) + e.BarbedShot:FullRechargeTime()))) or l < 9) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == w("mouseover"):GUID()) then
        u = 1217200
        return true
    elseif (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.4) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r())) or (e.ScentofBlood:IsAvailable() and (e.BestialWrath:CooldownRemains() < 12 + s or (e.BarbedShot:FullRechargeTime() + s < 8 and e.BestialWrath:CooldownRemains() < 24 + (8 - s) + e.BarbedShot:FullRechargeTime()))) or l < 9) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not g) then
        u = 999
        return true
    elseif (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.4) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r())) or (e.ScentofBlood:IsAvailable() and (e.BestialWrath:CooldownRemains() < 12 + s or (e.BarbedShot:FullRechargeTime() + s < 8 and e.BestialWrath:CooldownRemains() < 24 + (8 - s) + e.BarbedShot:FullRechargeTime()))) or l < 9) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.4) or (e.BarbedShot:FullRechargeTime() < s and (e.BestialWrath:CooldownRemains() > 0 or not r())) or (e.ScentofBlood:IsAvailable() and (e.BestialWrath:CooldownRemains() < 12 + s or (e.BarbedShot:FullRechargeTime() + s < 8 and e.BestialWrath:CooldownRemains() < 24 + (8 - s) + e.BarbedShot:FullRechargeTime()))) or l < 9) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) then
        return true
    end

end

local function te(a)
                if ((a:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == w("mouseover"):GUID()) then
        u = 1271788
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not g) then
        u = 999
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 271788
        return true
    elseif (a:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function Z()
    if m.TargetIsValid() and c then
        if e.BarbedShot:IsCastable() and e.BarbedShot:Charges() >= 2 then
            if o(e.BarbedShot) then
                t = 217200
                return "Barbed Shot (PreCombat)"
            end

        end

        if e.KillShot:IsReady() then
            if o(e.KillShot) then
                t = 53351
                return "Kill Shot (PreCombat)"
            end

        end

        if e.KillCommand:IsCastable() and UnitExists("pet") and I then
            if o(e.KillCommand) then
                t = 34026
                return "Kill Command (PreCombat)"
            end

        end

        if k > 1 then
            if e.MultiShot:IsCastable() then
                if o(e.MultiShot) then
                    t = 2643
                    return "Multi-Shot (PreCombat)"
                end

            end

        else
            if e.CobraShot:IsCastable() then
                if o(e.CobraShot) then
                    t = 193455
                    return "Cobra Shot (PreCombat)"
                end

            end

        end

    end

end

local function ee()
    if e.Berserking:IsCastable() and r() and ((not e.BestialWrath:IsAvailable()) or a:BuffUp(e.BestialWrathBuff) or l < 16) then
        if o(e.Berserking, nil) then
            t = 26297
            return "Berserking"
        end

    end

    if e.BloodFury:IsCastable() and r() and (a:BuffUp(e.CalloftheWildBuff) or ((not e.CalloftheWild:IsAvailable()) and ((a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp()) or i:HealthPercentage() < 20))) or l < 16) then
        if o(e.BloodFury, nil) then
            t = 20572
            return "Blood Fury"
        end

    end

    if e.AncestralCall:IsCastable() and r() and (a:BuffUp(e.CalloftheWildBuff) or ((not e.CalloftheWild:IsAvailable()) and ((a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp()) or i:HealthPercentage() < 20))) or l < 16) then
        if o(e.AncestralCall, nil) then
            t = 274738
            return "Ancestral Call"
        end

    end

    if e.Fireblood:IsCastable() and r() and ((a:BuffUp(e.CalloftheWildBuff)) or (not e.CalloftheWild:IsAvailable() and (a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp() or i:HealthPercentage() < 20))) or l < 10) then
        if o(e.Fireblood, nil) then
            t = 265221
            return "Fireblood"
        end

    end

    if n.Commons.Enabled.Potions and r() and n.Commons.Enabled.Potions and P and (((a:BuffUp(e.CalloftheWildBuff) or ((not e.CalloftheWild:IsAvailable()) and (a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp() or i:HealthPercentage() < 20))) or l < 31) and not d.GUISettings.General.HoldPotforBL) or (d.GUISettings.General.HoldPotforBL and a:BloodlustUp())) then
        local e = m.PotionSelected()
        if e and e:IsReady() then
            if o(e, nil, nil) then
                t = 50
                return "potion cooldowns 2"
            end

        end

    end

    if e.LightsJudgment:IsCastable() and r() and (PetBuffRemains(e.FrenzyPetBuff) > s or h:BuffDown(e.FrenzyPetBuff)) then
        if o(e.LightsJudgment, nil, nil, 40) then
            t = 255647
            return "Light's Judgment"
        end

    end

end

local function X()
    local s = a:GetUseableTrinkets(Y, 13)
    if s and (a:BuffUp(e.CalloftheWildBuff) or ((not e.CalloftheWild:IsAvailable()) and (a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp() or i:HealthPercentage() < 20))) or l < 31) then
        if s:ID() == R and n.Commons.Enabled.TopTrinket then
            if o(s, nil, nil) then
                t = 24
                return "Generic use_items for " .. s:Name()
            end

        end

    end

    local s = a:GetUseableTrinkets(Y, 14)
    if s and (a:BuffUp(e.CalloftheWildBuff) or (not e.CalloftheWild:IsAvailable()) and (a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp() or i:HealthPercentage() < 20)) or l < 31) then
        if s:ID() == R and n.Commons.Enabled.BottomTrinket then
            if o(s, nil, nil) then
                t = 30
                return "Generic use_items for " .. s:Name()
            end

        end

    end

end

local function Y()
    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "max", W, re, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot cleave 2"
        end

    end

    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "min", O, he, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot cleave 4"
        end

    end

    if e.MultiShot:IsReady() and (s - h:BuffRemains(e.BeastCleavePetBuff) > .25) then
        if o(e.MultiShot, nil, nil, not c) then
            t = 2643
            return "Multi-Shot (Cleave - 1)"
        end

    end

    if e.KillCommand:IsReady() and (e.KillCommand:FullRechargeTime() < s and e.AlphaPredator:IsAvailable() and e.KillCleave:IsAvailable()) then
        if o(e.KillCommand) then
            t = 34026
            return "Kill Command (Cleave)"
        end

    end

    if e.CalloftheWild:IsCastable() and r() and i:IsInMeleeRange(40) then
        if o(e.CalloftheWild, nil) then
            t = 359844
            return "CalloftheWild (Cleave)"
        end

    end

    if e.ExplosiveShot:IsReady() and i:IsInMeleeRange(40) and v then
        if o(e.ExplosiveShot, nil, nil, not i:IsInRange(40)) then
            t = 212431
            return "ExplosiveShot cleave 4"
        end

    end

    if e.Stampede:IsCastable() and T and (a:BuffUp(e.BestialWrathBuff) or l < 15) then
        if o(e.Stampede, nil, nil, not H) then
            t = 201430
            return "Stampede (Cleave)"
        end

    end

    if e.Bloodshed:IsCastable() and A then
        if o(e.Bloodshed, nil) then
            t = 321530
            return "Bloodshed (ST)"
        end

    end

    if e.DeathChakram:IsCastable() and r() then
        if o(e.DeathChakram, nil, nil) then
            t = 325028
            return "death_chakram st"
        end

    end

    if e.BestialWrath:IsCastable() and UnitExists("pet") and j then
        if o(e.BestialWrath, nil) then
            t = 19574
            return "Bestial Wrath (Cleave)"
        end

    end

    if e.AMurderofCrows:IsReady() then
        if o(e.AMurderofCrows, nil, nil, not c) then
            t = 131894
            return "A Murder of Crows (Cleave)"
        end

    end

    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "max", W, ae, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot cleave 26"
        end

    end

    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "min", O, ne, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot cleave 28"
        end

    end

    if e.KillCommand:IsReady() and UnitExists("pet") then
        if o(e.KillCommand) then
            t = 34026
            return "Kill Command (Cleave)"
        end

    end

    if e.DireBeast:IsReady() then
        if o(e.DireBeast, nil, nil, not c) then
            t = 120679
            return "Dire Beast (Cleave)"
        end

    end

    if e.SerpentSting:IsReady() then
        if m.CastTargetIf(e.SerpentSting, y, "min", F, Q, not i:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting cleave 34"
        end

    end

    if e.Barrage:IsReady() and PetBuffRemains(e.BeastCleavePetBuff) > e.Barrage:ExecuteTime() then
        if o(e.Barrage, nil, nil, not c) then
            t = 120360
            return "Barrage (Cleave)"
        end

    end

    if e.KillShot:IsReady() then
        if o(e.KillShot, nil, nil, not c) then
            t = 53351
            return "Kill Shot (Cleave) 8"
        end

    end

    if e.AspectoftheWild:IsCastable() and E and UnitExists("pet") and i:IsInMeleeRange(40) then
        if o(e.AspectoftheWild, nil) then
            t = 193530
            return "Aspect of the Wild (Cleave)"
        end

    end

    if e.CobraShot:IsReady() and (a:FocusTimeToMax() < s * 2 or (a:BuffUp(e.AspectoftheWildBuff) and a:FocusTimeToMax() < s * 4)) then
        if o(e.CobraShot) then
            t = 193455
            return "Cobra-Shot (Cleave)"
        end

    end

    if e.WailingArrow:IsReady() and v and not _ and not a:IsMoving() and i:IsInMeleeRange(40) and (h:BuffRemains(e.FrenzyPetBuff) > e.WailingArrow:ExecuteTime() or l < 5) then
        if o(e.WailingArrow, nil, nil, not c) then
            t = 355589
            return "Wailing Arrow (Cleave)"
        end

    end

    if e.BagofTricks:IsCastable() and r() and (a:BuffDown(e.BestialWrathBuff) or l < 5) then
        if o(e.BagofTricks, nil, nil, not c) then
            t = 312411
            return "Bag of Tricks (ST)"
        end

    end

    if e.ArcaneTorrent:IsCastable() and r() and ((a:Focus() + a:FocusRegen() + 30) < a:FocusMax()) then
        if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
            t = 155145
            return "arcane_torrent cleave 56"
        end

    end

end

local function w()
    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "min", O, K, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot st 2"
        end

    end

    if e.KillCommand:IsReady() and UnitExists("pet") and I and (e.KillCommand:FullRechargeTime() < s and e.AlphaPredator:IsAvailable()) then
        if o(e.KillCommand) then
            t = 34026
            return "Kill Command (ST)"
        end

    end

    if e.CalloftheWild:IsCastable() and r() and i:IsInMeleeRange(40) then
        if o(e.CalloftheWild, nil) then
            t = 359844
            return "CalloftheWild (Cleave)"
        end

    end

    if e.DeathChakram:IsCastable() and r() then
        if o(e.DeathChakram, nil, nil) then
            t = 325028
            return "death_chakram st"
        end

    end

    if e.Bloodshed:IsCastable() and A then
        if o(e.Bloodshed, nil) then
            t = 321530
            return "Bloodshed (ST)"
        end

    end

    if e.Stampede:IsCastable() and T then
        if o(e.Stampede, nil, nil, not H) then
            t = 201430
            return "Stampede (ST)"
        end

    end

    if e.AMurderofCrows:IsReady() then
        if o(e.AMurderofCrows, nil, nil, not c) then
            t = 131894
            return "A Murder of Crows (ST)"
        end

    end

    if e.ExplosiveShot:IsReady() and i:IsInMeleeRange(40) and v then
        if o(e.ExplosiveShot, nil, nil, not i:IsInRange(40)) then
            t = 212431
            return "ExplosiveShot cleave 4"
        end

    end

    if e.BestialWrath:IsCastable() and j and UnitExists("pet") then
        if o(e.BestialWrath, nil) then
            t = 19574
            return "Bestial Wrath (ST)"
        end

    end

    if e.KillCommand:IsReady() and UnitExists("pet") and I then
        if o(e.KillCommand) then
            t = 34026
            return "Kill Command (ST)"
        end

    end

    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "min", O, J, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot st 24"
        end

    end

    if e.DireBeast:IsReady() then
        if o(e.DireBeast, nil, nil, not c) then
            t = 120679
            return "Dire Beast (ST)"
        end

    end

    if e.SerpentSting:IsReady() then
        if m.CastTargetIf(e.SerpentSting, y, "min", F, te, not i:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting st 28"
        end

    end

    if e.KillShot:IsReady() then
        if o(e.KillShot, nil, nil, not c) then
            t = 53351
            return "Kill Shot (ST)"
        end

    end

    if e.AspectoftheWild:IsCastable() and E and UnitExists("pet") and i:IsInMeleeRange(40) then
        if o(e.AspectoftheWild, nil) then
            t = 193530
            return "Aspect of the Wild (Cleave)"
        end

    end

    if e.CobraShot:IsReady() then
        if o(e.CobraShot, nil, nil, not c) then
            t = 193455
            return "Cobra Shot (ST)"
        end

    end

    if e.WailingArrow:IsReady() and v and not _ and not a:IsMoving() and i:IsInMeleeRange(40) and (h:BuffRemains(e.FrenzyPetBuff) > e.WailingArrow:ExecuteTime() or l < 5) then
        if o(e.WailingArrow, nil, nil, not c) then
            t = 355589
            return "Wailing Arrow (ST)"
        end

    end

    if r() then
        if e.BagofTricks:IsCastable() and r() and (a:BuffDown(e.BestialWrathBuff) or l < 5) then
            if o(e.BagofTricks, nil, nil, not c) then
                t = 312411
                return "Bag of Tricks (ST)"
            end

        end

        if e.ArcaneTorrent:IsCastable() and r() and ((a:Focus() + a:FocusRegen() + 15) < a:FocusMax()) then
            if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
                t = 155145
                return "arcane_torrent st 50"
            end

        end

    end

end

local function O()
    S = HeroRotationCharDB.Toggles[6]
    se = HeroRotationCharDB.Toggles[4]
    v = HeroRotationCharDB.Toggles[5] or r()
    g = HeroRotationCharDB.Toggles[12]
    P = HeroRotationCharDB.Toggles[15]
    D = HeroRotationCharDB.Toggles[120]
    M = HeroRotationCharDB.Toggles[121]
    C = HeroRotationCharDB.Toggles[122]
    L = HeroRotationCharDB.Toggles[123]
    U = HeroRotationCharDB.Toggles[124]
    G = HeroRotationCharDB.Toggles[125]
    B = HeroRotationCharDB.Toggles[142]
    _ = HeroRotationCharDB.Toggles[17]
    E = false
    T = false
    j = false
    A = false
    if ((n.BeastMastery.AspectoftheWild == "CDs" and r()) or (n.BeastMastery.AspectoftheWild == "Small CDs" and (r() or v)) or (n.BeastMastery.AspectoftheWild == "Always")) then
        E = true
    end

    if ((n.BeastMastery.Stampede == "CDs" and r()) or (n.BeastMastery.Stampede == "Small CDs" and (r() or v)) or (n.BeastMastery.Stampede == "Always")) then
        T = true
    end

    if ((n.BeastMastery.BestialWrathCD == "CDs" and r()) or (n.BeastMastery.BestialWrathCD == "Small CDs" and (r() or v)) or (n.BeastMastery.BestialWrathCD == "Always")) then
        j = true
    end

    if ((n.BeastMastery.Bloodshed == "CDs" and r()) or (n.BeastMastery.Bloodshed == "Small CDs" and (r() or v)) or (n.BeastMastery.Bloodshed == "Always")) then
        A = true
    end

    R = GetInventoryItemID("player", 13)
    ie = GetInventoryItemID("player", 14)
end

local function g()
    if e.Stomp:IsAvailable() then
        f.SplashEnemies.ChangeFriendTargetsTracking("Mine Only")
    else
        f.SplashEnemies.ChangeFriendTargetsTracking("All")
    end

    local g, g = GetInventoryItemID("player", 13)
    local g, g = GetInventoryItemID("player", 14)
    s = a:GCD() + .15
    if m.TargetIsValid() or a:AffectingCombat() then
        N = f.BossFightRemains(nil, true)
        l = N
        if l == 11111 then
            l = f.FightRemains(Enemies8y, false)
        end

    end

    if u > 0 then
        u = 0
    end

    if t > 0 then
        t = 0
    end

    local l = (e.BloodBolt:IsPetKnown() and x.FindBySpellID(e.BloodBolt:ID()) and e.BloodBolt) or (e.Bite:IsPetKnown() and x.FindBySpellID(e.Bite:ID()) and e.Bite) or (e.Claw:IsPetKnown() and x.FindBySpellID(e.Claw:ID()) and e.Claw) or (e.Smack:IsPetKnown() and x.FindBySpellID(e.Smack:ID()) and e.Smack) or nil
    local f = (e.Growl:IsPetKnown() and x.FindBySpellID(e.Growl:ID()) and e.Growl) or nil
    if oe() then
        y = a:GetEnemiesInRange(40)
        k = (l and #a:GetEnemiesInSpellActionRange(l)) or i:GetEnemiesInSplashRangeCount(8)
    else
        y = {  }
        k = 0
    end

    c = i:IsInRange(40)
    H = i:IsInRange(30)
    I = (f and i:IsSpellInActionRange(f)) or i:IsInRange(30)
    O()
    if e.Exhilaration:IsCastable() and a:HealthPercentage() <= n.Commons.ExhilarationHP then
        if o(e.Exhilaration, nil) then
            t = 109304
            return "Exhilaration"
        end

    end

    if a:HealthPercentage() < n.Commons.HealthstoneHP and b.Healthstone:IsReady() and b.Healthstone:CooldownRemains() <= 0 then
        if d.Cast(b.Healthstone, nil) then
            t = 40
            return "Healthstone HP"
        end

    end

    if a:HealthPercentage() < n.Commons.HealPotHP and b.CosmicHealPot:IsReady() and b.CosmicHealPot:CooldownRemains() <= 0 then
        if d.Cast(b.CosmicHealPot, nil) then
            t = 45
            return "CosmicHealPot HP"
        end

    end

    if a:HealthPercentage() < n.Commons.HealPotHP and b.HealPot:IsReady() and b.HealPot:CooldownRemains() <= 0 then
        if d.Cast(b.HealPot, nil) then
            t = 41
            return "HealPot HP"
        end

    end

    if e.AspectoftheTurtle:IsCastable() and a:HealthPercentage() <= n.Commons.TurtleHP then
        if o(e.AspectoftheTurtle, nil) then
            t = 186265
            return "AspectoftheTurtle"
        end

    end

    if a:BuffUp(z(5384)) then
        return false
    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.CobraShot:IsCastable() and c then
            if o(e.CobraShot, nil) then
                u = 1193455
                return "explosive MO SWD"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.CobraShot:IsCastable() and c then
            if o(e.CobraShot, nil) then
                t = 193455
                return "explosive  SWD"
            end

        end

    end

    V = { 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 195181, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426 }
    if UnitExists("target") and e.TranqualizingShot:IsCastable() and not B then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true and e.TranqualizingShot:IsCastable() and e.TranqualizingShot:CooldownRemains(BypassRecovery) <= 0 then
            for a = 0, 40 do
                local a, a, a, a, a, a, a, a, a, o = UnitBuff("target", a)
                for i, a in pairs(V) do
                    if a == o then
                        if d.Cast(e.TranqualizingShot, nil) then
                            t = 19801
                            return "Tranq Enrage"
                        end

                    end

                end

            end

        end

    end

        if d.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (d.GUISettings.General.OpenerReset)
    elseif d.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        d.ToggleIconFrame:UpdateButtonText(6)
        d.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

    if d.QueuedCast() then
        t = d.QueuedCast()
        return "Custom Queue " .. z(t):ID()
    end

        if (D and e.Bindingshot:IsAvailable() and e.Bindingshot:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.Bindingshot, nil, nil, nil) then
            t = 109248
            return "queue Binding Shot"
        end

    elseif ((not e.Bindingshot:IsUsableP() or e.Bindingshot:CooldownRemains() > 0) and D) then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
        d.Print("Binding Shot Queue is now " .. (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (M and e.FreezingTrap:IsAvailable() and e.FreezingTrap:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.FreezingTrap, nil, nil, nil) then
            t = 187650
            return "queue Freezing Trap"
        end

    elseif ((not e.FreezingTrap:IsUsableP() or e.FreezingTrap:CooldownRemains() > 0) and M) then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
        d.Print("Freezing Trap Queue is now " .. (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (C and e.Intimidation:IsAvailable() and e.Intimidation:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.Intimidation, nil, nil, nil) then
            t = 19577
            return "queue Intimidation"
        end

    elseif ((not e.Intimidation:IsUsableP() or e.Intimidation:CooldownRemains() > 0) and C) then
        HeroRotationCharDB.Toggles[122] = not HeroRotationCharDB.Toggles[122]
        d.Print("Intimidation Queue is now " .. (HeroRotationCharDB.Toggles[122] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (L and e.Flare:IsAvailable() and e.Flare:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.Flare, nil, nil, nil) then
            t = 1543
            return "queue Flare"
        end

    elseif ((not e.Flare:IsUsableP() or e.Flare:CooldownRemains() > 0) and L) then
        HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123]
        d.Print("Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (U and e.TarTrap:IsAvailable() and e.TarTrap:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.TarTrap, nil, nil, nil) then
            t = 187698
            return "queue TarTrap"
        end

    elseif ((not e.TarTrap:IsUsableP() or e.TarTrap:CooldownRemains() > 0) and U) then
        HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124]
        d.Print("Tar Trap Queue is now " .. (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if a:BuffUp(z(5384)) then
        return false
    end

    if a:IsCasting(e.RevivePet) then
        if o(e.PoolFocus) then
            t = 999999
            return "Pooling Focus"
        end

    end

    if (h:IsActive() and select(2, GetStablePetInfo(n.Commons.SummonPetSlot)) ~= select(1, UnitName("pet"))) and n.Commons.SummonPetSlot ~= 0 and not a:IsMoving() and not a:PrevGCD(1, e.DismissPet) and not a:IsCasting(e.DismissPet) then
        if o(e.DismissPet, nil) then
            t = 2641
            return "Dismiss Pet"
        end

    end

    if e.SummonPet:IsCastable() and (not h:IsActive()) and n.Commons.SummonPetSlot ~= 0 then
                                        if n.Commons.SummonPetSlot == 1 and not a:PrevGCD(1, p[n.Commons.SummonPetSlot]) then
            if o(p[n.Commons.SummonPetSlot], nil) then
                t = 883
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 2 and not a:PrevGCD(1, p[n.Commons.SummonPetSlot]) then
            if o(p[n.Commons.SummonPetSlot], nil) then
                t = 83242
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 3 and not a:PrevGCD(1, p[n.Commons.SummonPetSlot]) then
            if o(p[n.Commons.SummonPetSlot], nil) then
                t = 83243
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 4 and not a:PrevGCD(1, p[n.Commons.SummonPetSlot]) then
            if o(p[n.Commons.SummonPetSlot], nil) then
                t = 83244
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 5 and not a:PrevGCD(1, p[n.Commons.SummonPetSlot]) then
            if o(p[n.Commons.SummonPetSlot], nil) then
                t = 83245
                return "Summon Pet"
            end

        end

    end

    if (h:IsDeadOrGhost() or not UnitExists("pet")) and e.RevivePet:IsCastable() and not a:IsMoving() and n.Commons.SummonPetSlot ~= 0 then
        if o(e.RevivePet, nil) then
            t = 982
            return "Revive Pet"
        end

    end

    local l, f, y = GetSpellCooldown(34477)
    if a:AffectingCombat() and n.Commons.AutoMisdirect and not G then
        if (l + f - GetTime()) <= 0 and e.Misdirection:IsAvailable() and e.Misdirection:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus") or UnitIsUnit("focus", "pet")) and IsItemInRange(32698, "focus") then
            if d.Cast(e.Misdirection) then
                u = 134477
                return "MD Focus"
            end

        end

    end

    if not h:IsDeadOrGhost() and UnitExists("pet") and e.MendPet:IsCastable() and h:HealthPercentage() <= n.Commons.MendPetHighHP and not a:PrevGCD(1, e.MendPet) then
        if o(e.MendPet) then
            t = 1982
            return "Mend Pet High Priority"
        end

    end

    if not a:AffectingCombat() and ((S) or (n.BeastMastery.DBMSupport and ((e.BestialWrath:IsCastable() and j and d.BossMods:GetPullTimer() < s and d.BossMods:GetPullTimer() > 0) or d.BossMods:GetPullTimer() < .5 and d.BossMods:GetPullTimer() > 0))) and m.TargetIsValid() then
        q = Z()
        if q then
            return q
        end

    end

    if m.TargetIsValid() and (a:AffectingCombat() or S) then
        if (not i:AffectingCombat() and not i:IsDummy() and not i:NPCID() == 153285) and k >= 1 then
            t = 999
        end

        if (not i:AffectingCombat() and not i:IsDummy() and not i:NPCID() == 153285) then
            if o(e.PoolFocus) then
                t = 999999
                return "Pooling Focus"
            end

        end

        if true then
            q = ee()
            if q then
                return q
            end

        end

        if ((n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and r()) then
            local e = X()
            if e then
                return e
            end

        end

        if (k < 2 or ((not e.BeastCleave:IsAvailable()) and k < 3)) then
            local e = w()
            if e then
                return e
            end

        end

        if (k > 2 or (e.BeastCleave:IsAvailable() and k > 1)) then
            local e = Y()
            if e then
                return e
            end

        end

        if not h:IsDeadOrGhost() and UnitExists("pet") and e.MendPet:IsCastable() and h:HealthPercentage() <= n.Commons.MendPetLowHP then
            if o(e.MendPet) then
                t = 1982
                return "Mend Pet Low Priority (w/ Target)"
            end

        end

        if v and not _ and not a:IsMoving() and i:IsInMeleeRange(40) and (e.WailingArrow:IsReady() and h:BuffRemains(e.FrenzyPetBuff) > e.WailingArrow:ExecuteTime() and (a:Covenant() == "Night Fae" and a:BuffUp(e.WildSpiritsBuff))) then
            if o(e.WailingArrow, nil, nil, not c) then
                t = 355589
                return "Wailing Arrow (ST)1"
            end

        end

        if o(e.PoolFocus) then
            t = 999999
            return "Pooling Focus"
        end

    end

    if not h:IsDeadOrGhost() and UnitExists("pet") and e.MendPet:IsCastable() and h:HealthPercentage() <= n.Commons.MendPetLowHP then
        if o(e.MendPet) then
            t = 1982
            return "Mend Pet Low Priority (w/o Target)"
        end

    end

end

local function e()
    f.Print("BeastMastery can use pet abilities to better determine AoE, makes sure you have Growl and Blood Bolt / Bite / Claw / Smack in your player action bars.")
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        d.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpell1()
    if t == 0 then
        return 0
    else
        return t
    end

end

function ReturnSpellMO1()
    if u == 0 then
        return 0
    else
        return u
    end

end

d.SetAPL(253, g, e)

