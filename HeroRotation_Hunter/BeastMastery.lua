local e, e = ...
local e = HeroDBC.DBC
local w = HeroLib
local e = HeroCache
local f = w.Unit
local a = f.Player
local i = f.Target
local r = f.Pet
local x = w.Spell
local t = w.Item
local z = w.Action
local d = HeroRotation
local ne = d.AoEON
local n = d.CDsON
local o = d.Cast
local e = d.CastSuggested
local e = math.max
local he = HeroRotationCharDB.Toggles[4]
local v = HeroRotationCharDB.Toggles[5]
local D = HeroRotationCharDB.Toggles[6]
local b = HeroRotationCharDB.Toggles[12]
local ee = HeroRotationCharDB.Toggles[15]
local R = HeroRotationCharDB.Toggles[120]
local H = HeroRotationCharDB.Toggles[121]
local S = HeroRotationCharDB.Toggles[122]
local C = HeroRotationCharDB.Toggles[123]
local U = HeroRotationCharDB.Toggles[124]
local Z = HeroRotationCharDB.Toggles[125]
local K = HeroRotationCharDB.Toggles[142]
local O = HeroRotationCharDB.Toggles[17]
local A
local T
local _
local I
local X = { 355782, 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 343470, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426 }
local m = d.Commons.Everyone
local e = d.Commons.Hunter
local s = { General = d.GUISettings.General, Commons = d.GUISettings.APL.Hunter.Commons, BeastMastery = d.GUISettings.APL.Hunter.BeastMastery }
local e = x.Hunter.BeastMastery
local p = { e.SummonPet, e.SummonPet2, e.SummonPet3, e.SummonPet4, e.SummonPet5 }
local k = t.Hunter.BeastMastery
local Q = {  }
local h = a:GetEquipment()
local u = (h[11]) and t(h[11]) or t(0)
local c = (h[12]) and t(h[12]) or t(0)
local l = t(0)
local l = t(0)
local F = GetInventoryItemID("player", 13)
local se = GetInventoryItemID("player", 14)
local l
local M = 11111
local l = 11111
w:RegisterForEvent(function()
    h = a:GetEquipment()
    u = (h[11]) and t(h[11]) or t(0)
    c = (h[12]) and t(h[12]) or t(0)
end, "PLAYER_EQUIPMENT_CHANGED")
w:RegisterForEvent(function()
    M = 11111
    l = 11111
end, "PLAYER_REGEN_ENABLED")
local y, t, g
local u, L
local E
local j
local h
local t = 0
local c = 0
local q = { { e.Intimidation, "Cast Intimidation (Interrupt)", function()
    return true
end } }
local function q(e)
    if e then
        return 1
    else
        return 0
    end

end

local function q(e)
    return e ~= 0
end

local function q(e)
    local t = 0
    if e ~= nil then
        for a in pairs(e) do
            local e = e[a]
            if e:IsInRange(40) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) and e:DebuffUp(x(257284)) then
                t = t + 1
            end

        end

    end

    return t
end

local function q(t)
    return (t:DebuffRemains(e.BarbedShotDebuff))
end

local function N(t)
    return (t:DebuffStack(e.LatentPoisonDebuff))
end

local function Y(t)
    return (t:DebuffRemains(e.SerpentStingDebuff))
end

local function V(a)
                if ((a:DebuffStack(e.LatentPoisonDebuff) > 9 and ((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n())))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == f("mouseover"):GUID()) then
        c = 1217200
        return true
    elseif ((a:DebuffStack(e.LatentPoisonDebuff) > 9 and ((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n())))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and s.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not b) then
        c = 999
        return true
    elseif ((a:DebuffStack(e.LatentPoisonDebuff) > 9 and ((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n())))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif (a:DebuffStack(e.LatentPoisonDebuff) > 9 and ((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n())))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function B(a)
                if (((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == f("mouseover"):GUID()) then
        c = 1217200
        return true
    elseif (((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and s.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not b) then
        c = 999
        return true
    elseif (((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif ((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function P(o)
                if ((o:DebuffStack(e.LatentPoisonDebuff) > 9 and ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == f("mouseover"):GUID()) then
        c = 1217200
        return true
    elseif ((o:DebuffStack(e.LatentPoisonDebuff) > 9 and ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and s.BeastMastery.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not b) then
        c = 999
        return true
    elseif ((o:DebuffStack(e.LatentPoisonDebuff) > 9 and ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif (o:DebuffStack(e.LatentPoisonDebuff) > 9 and ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8))) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) then
        return true
    end

end

local function W(o)
                if (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == f("mouseover"):GUID()) then
        c = 1217200
        return true
    elseif (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and s.BeastMastery.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not b) then
        c = 999
        return true
    elseif (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or l < 9 or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) then
        return true
    end

end

local function re(a)
                if ((a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == f("mouseover"):GUID()) then
        c = 1271788
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and s.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not b) then
        c = 999
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 271788
        return true
    elseif (a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function J(a)
                if (((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and r:BuffStack(e.FrenzyPetBuff) < 3 and (e.BestialWrath:CooldownRemains() > 0 or not n()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == f("mouseover"):GUID()) then
        c = 1217200
        return true
    elseif (((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and r:BuffStack(e.FrenzyPetBuff) < 3 and (e.BestialWrath:CooldownRemains() > 0 or not n()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and s.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not b) then
        c = 999
        return true
    elseif (((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and r:BuffStack(e.FrenzyPetBuff) < 3 and (e.BestialWrath:CooldownRemains() > 0 or not n()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif ((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= h + .25) or (e.ScentofBlood:IsAvailable() and r:BuffStack(e.FrenzyPetBuff) < 3 and (e.BestialWrath:CooldownRemains() > 0 or not n()))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function G(o)
                if (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n())) or (e.ScentofBlood:IsAvailable() and ((e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() + h < 8 and e.BestialWrath:CooldownRemains() < 24 + (8 - h) + e.BarbedShot:FullRechargeTime() and n()))) or l < 9) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == f("mouseover"):GUID()) then
        c = 1217200
        return true
    elseif (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n())) or (e.ScentofBlood:IsAvailable() and ((e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() + h < 8 and e.BestialWrath:CooldownRemains() < 24 + (8 - h) + e.BarbedShot:FullRechargeTime() and n()))) or l < 9) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and s.BeastMastery.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not b) then
        c = 999
        return true
    elseif (((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n())) or (e.ScentofBlood:IsAvailable() and ((e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() + h < 8 and e.BestialWrath:CooldownRemains() < 24 + (8 - h) + e.BarbedShot:FullRechargeTime() and n()))) or l < 9) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif ((e.WildInstincts:IsAvailable() and a:BuffUp(e.CalloftheWildBuff)) or (e.WildCall:IsAvailable() and e.BarbedShot:ChargesFractional() > 1.8) or (e.BarbedShot:FullRechargeTime() < h and (e.BestialWrath:CooldownRemains() > 0 or not n())) or (e.ScentofBlood:IsAvailable() and ((e.BestialWrath:CooldownRemains() < 12 + h and n()) or (e.BarbedShot:FullRechargeTime() + h < 8 and e.BestialWrath:CooldownRemains() < 24 + (8 - h) + e.BarbedShot:FullRechargeTime() and n()))) or l < 9) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) then
        return true
    end

end

local function ie(a)
                if ((a:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == f("mouseover"):GUID()) then
        c = 1271788
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and s.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not b) then
        c = 999
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 271788
        return true
    elseif (a:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > e.SerpentStingDebuff:BaseDuration()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function ae()
    if m.TargetIsValid() and u then
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

        if e.KillCommand:IsCastable() and UnitExists("pet") and E then
            if o(e.KillCommand) then
                t = 34026
                return "Kill Command (PreCombat)"
            end

        end

        if g > 1 then
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

local function te()
    if e.Berserking:IsCastable() and n() and ((not e.BestialWrath:IsAvailable()) or a:BuffUp(e.BestialWrathBuff) or l < 16) then
        if o(e.Berserking, nil) then
            t = 26297
            return "Berserking"
        end

    end

    if e.BloodFury:IsCastable() and n() and (a:BuffUp(e.CalloftheWildBuff) or ((not e.CalloftheWild:IsAvailable()) and ((a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp()) or i:HealthPercentage() < 20))) or l < 16) then
        if o(e.BloodFury, nil) then
            t = 20572
            return "Blood Fury"
        end

    end

    if e.AncestralCall:IsCastable() and n() and (a:BuffUp(e.CalloftheWildBuff) or ((not e.CalloftheWild:IsAvailable()) and ((a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp()) or i:HealthPercentage() < 20))) or l < 16) then
        if o(e.AncestralCall, nil) then
            t = 274738
            return "Ancestral Call"
        end

    end

    if e.Fireblood:IsCastable() and n() and ((a:BuffUp(e.CalloftheWildBuff)) or (not e.CalloftheWild:IsAvailable() and (a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp() or i:HealthPercentage() < 20))) or l < 10) then
        if o(e.Fireblood, nil) then
            t = 265221
            return "Fireblood"
        end

    end

    if s.Commons.Enabled.Potions and n() and s.Commons.Enabled.Potions and ee and (((a:BuffUp(e.CalloftheWildBuff) or ((not e.CalloftheWild:IsAvailable()) and (a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp() or i:HealthPercentage() < 20))) or l < 31) and not d.GUISettings.General.HoldPotforBL) or (d.GUISettings.General.HoldPotforBL and a:BloodlustUp())) then
        local e = m.PotionSelected()
        if e and e:IsReady() then
            if o(e, nil, nil) then
                t = 50
                return "potion cooldowns 2"
            end

        end

    end

    if e.LightsJudgment:IsCastable() and n() and (r:BuffRemains(e.FrenzyPetBuff) > h or r:BuffDown(e.FrenzyPetBuff)) then
        if o(e.LightsJudgment, nil, nil, 40) then
            t = 255647
            return "Light's Judgment"
        end

    end

end

local function oe()
    local n = a:GetUseableTrinkets(Q, 13)
    if n and (a:BuffUp(e.CalloftheWildBuff) or ((not e.CalloftheWild:IsAvailable()) and (a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp() or i:HealthPercentage() < 20))) or l < 31) then
        if n:ID() == F and s.Commons.Enabled.TopTrinket then
            if o(n, nil, nil) then
                t = 24
                return "Generic use_items for " .. n:Name()
            end

        end

    end

    local n = a:GetUseableTrinkets(Q, 14)
    if n and (a:BuffUp(e.CalloftheWildBuff) or (not e.CalloftheWild:IsAvailable()) and (a:BuffUp(e.BestialWrathBuff) and (a:BloodlustUp() or i:HealthPercentage() < 20)) or l < 31) then
        if n:ID() == F and s.Commons.Enabled.BottomTrinket then
            if o(n, nil, nil) then
                t = 30
                return "Generic use_items for " .. n:Name()
            end

        end

    end

end

local function Q()
    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "max", N, V, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot cleave 2"
        end

        if N(i) and V(i) then
            if o(e.BarbedShot, nil, nil, not u) then
                t = 217200
                return "barbed_shot cleave 2"
            end

        end

    end

    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "min", q, B, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot cleave 4"
        end

        if q(i) and B(i) then
            if o(e.BarbedShot, nil, nil, not u) then
                t = 217200
                return "barbed_shot cleave 4"
            end

        end

    end

    if e.MultiShot:IsReady() and (h - r:BuffRemains(e.BeastCleavePetBuff) > .25) then
        if o(e.MultiShot, nil, nil, not u) then
            t = 2643
            return "Multi-Shot (Cleave - 1)"
        end

    end

    if e.KillCommand:IsReady() and (e.KillCommand:FullRechargeTime() < h and e.AlphaPredator:IsAvailable() and e.KillCleave:IsAvailable()) then
        if o(e.KillCommand) then
            t = 34026
            return "Kill Command (Cleave)"
        end

    end

    if e.CalloftheWild:IsCastable() and n() and i:IsInMeleeRange(40) then
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
        if o(e.Stampede, nil, nil, not L) then
            t = 201430
            return "Stampede (Cleave)"
        end

    end

    if e.Bloodshed:IsCastable() and I then
        if o(e.Bloodshed, nil) then
            t = 321530
            return "Bloodshed (ST)"
        end

    end

    if e.DeathChakram:IsCastable() and n() then
        if o(e.DeathChakram, nil, nil) then
            t = 325028
            return "death_chakram st"
        end

    end

    if e.BestialWrath:IsCastable() and UnitExists("pet") and _ then
        if o(e.BestialWrath, nil) then
            t = 19574
            return "Bestial Wrath (Cleave)"
        end

    end

    if e.AMurderofCrows:IsReady() then
        if o(e.AMurderofCrows, nil, nil, not u) then
            t = 131894
            return "A Murder of Crows (Cleave)"
        end

    end

    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "max", N, P, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot cleave 26"
        end

        if N(i) and P(i) then
            if o(e.BarbedShot, nil, nil, not u) then
                t = 217200
                return "barbed_shot cleave 26"
            end

        end

    end

    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "min", q, W, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot cleave 28"
        end

        if q(i) and W(i) then
            if o(e.BarbedShot, nil, nil, not u) then
                t = 217200
                return "barbed_shot cleave 28"
            end

        end

    end

    if e.KillCommand:IsReady() and UnitExists("pet") then
        if o(e.KillCommand) then
            t = 34026
            return "Kill Command (Cleave)"
        end

    end

    if e.DireBeast:IsReady() then
        if o(e.DireBeast, nil, nil, not u) then
            t = 120679
            return "Dire Beast (Cleave)"
        end

    end

    if e.SerpentSting:IsReady() then
        if m.CastTargetIf(e.SerpentSting, y, "min", Y, re, not i:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting cleave 34"
        end

    end

    if e.Barrage:IsReady() and r:BuffRemains(e.BeastCleavePetBuff) > e.Barrage:ExecuteTime() then
        if o(e.Barrage, nil, nil, not u) then
            t = 120360
            return "Barrage (Cleave)"
        end

    end

    if e.KillShot:IsReady() then
        if o(e.KillShot, nil, nil, not u) then
            t = 53351
            return "Kill Shot (Cleave) 8"
        end

    end

    if e.AspectoftheWild:IsCastable() and A and UnitExists("pet") and i:IsInMeleeRange(40) then
        if o(e.AspectoftheWild, nil) then
            t = 193530
            return "Aspect of the Wild (Cleave)"
        end

    end

    if e.CobraShot:IsReady() and (a:FocusTimeToMax() < h * 2 or (a:BuffUp(e.AspectoftheWildBuff) and a:FocusTimeToMax() < h * 4)) then
        if o(e.CobraShot) then
            t = 193455
            return "Cobra-Shot (Cleave)"
        end

    end

    if e.WailingArrow:IsReady() and v and not O and not a:IsMoving() and i:IsInMeleeRange(40) and (r:BuffRemains(e.FrenzyPetBuff) > e.WailingArrow:ExecuteTime() or l < 5) then
        if o(e.WailingArrow, nil, nil, not u) then
            t = 392060
            return "Wailing Arrow (Cleave)"
        end

    end

    if e.BagofTricks:IsCastable() and n() and (a:BuffDown(e.BestialWrathBuff) or l < 5) then
        if o(e.BagofTricks, nil, nil, not u) then
            t = 312411
            return "Bag of Tricks (ST)"
        end

    end

    if e.ArcaneTorrent:IsCastable() and n() and ((a:Focus() + a:FocusRegen() + 30) < a:FocusMax()) then
        if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
            t = 155145
            return "arcane_torrent cleave 56"
        end

    end

end

local function N()
    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "min", q, J, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot st 2"
        end

        if q(i) and J(i) then
            if o(e.BarbedShot, nil, nil, not u) then
                t = 217200
                return "barbed_shot st 2"
            end

        end

    end

    if e.KillCommand:IsReady() and UnitExists("pet") and E and (e.KillCommand:FullRechargeTime() < h and e.AlphaPredator:IsAvailable()) then
        if o(e.KillCommand) then
            t = 34026
            return "Kill Command (ST)"
        end

    end

    if e.CalloftheWild:IsCastable() and n() and i:IsInMeleeRange(40) then
        if o(e.CalloftheWild, nil) then
            t = 359844
            return "CalloftheWild (Cleave)"
        end

    end

    if e.DeathChakram:IsCastable() and n() then
        if o(e.DeathChakram, nil, nil) then
            t = 325028
            return "death_chakram st"
        end

    end

    if e.Bloodshed:IsCastable() and I then
        if o(e.Bloodshed, nil) then
            t = 321530
            return "Bloodshed (ST)"
        end

    end

    if e.Stampede:IsCastable() and T then
        if o(e.Stampede, nil, nil, not L) then
            t = 201430
            return "Stampede (ST)"
        end

    end

    if e.AMurderofCrows:IsReady() then
        if o(e.AMurderofCrows, nil, nil, not u) then
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

    if e.BestialWrath:IsCastable() and _ and UnitExists("pet") and g > 0 then
        if o(e.BestialWrath, nil) then
            t = 19574
            return "Bestial Wrath (ST)"
        end

    end

    if e.KillCommand:IsReady() and UnitExists("pet") and E then
        if o(e.KillCommand) then
            t = 34026
            return "Kill Command (ST)"
        end

    end

    if e.BarbedShot:IsCastable() then
        if m.CastTargetIf(e.BarbedShot, y, "min", q, G, not i:IsSpellInRange(e.BarbedShot)) then
            return "barbed_shot st 24"
        end

        if q(i) and G(i) then
            if o(e.BarbedShot, nil, nil, not u) then
                t = 217200
                return "barbed_shot st 24"
            end

        end

    end

    if e.DireBeast:IsReady() then
        if o(e.DireBeast, nil, nil, not u) then
            t = 120679
            return "Dire Beast (ST)"
        end

    end

    if e.SerpentSting:IsReady() then
        if m.CastTargetIf(e.SerpentSting, y, "min", Y, ie, not i:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting st 28"
        end

    end

    if e.KillShot:IsReady() then
        if o(e.KillShot, nil, nil, not u) then
            t = 53351
            return "Kill Shot (ST)"
        end

    end

    if e.AspectoftheWild:IsCastable() and A and UnitExists("pet") and i:IsInMeleeRange(40) then
        if o(e.AspectoftheWild, nil) then
            t = 193530
            return "Aspect of the Wild (Cleave)"
        end

    end

    if e.CobraShot:IsReady() then
        if o(e.CobraShot, nil, nil, not u) then
            t = 193455
            return "Cobra Shot (ST)"
        end

    end

    if e.WailingArrow:IsReady() and v and not O and not a:IsMoving() and i:IsInMeleeRange(40) and (r:BuffRemains(e.FrenzyPetBuff) > e.WailingArrow:ExecuteTime() or l < 5) then
        if o(e.WailingArrow, nil, nil, not u) then
            t = 355589
            return "Wailing Arrow (ST)"
        end

    end

    if n() then
        if e.BagofTricks:IsCastable() and n() and (a:BuffDown(e.BestialWrathBuff) or l < 5) then
            if o(e.BagofTricks, nil, nil, not u) then
                t = 312411
                return "Bag of Tricks (ST)"
            end

        end

        if e.ArcaneTorrent:IsCastable() and n() and ((a:Focus() + a:FocusRegen() + 15) < a:FocusMax()) then
            if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
                t = 155145
                return "arcane_torrent st 50"
            end

        end

    end

end

local function q()
    D = HeroRotationCharDB.Toggles[6]
    he = HeroRotationCharDB.Toggles[4]
    v = HeroRotationCharDB.Toggles[5] or n()
    b = HeroRotationCharDB.Toggles[12]
    ee = HeroRotationCharDB.Toggles[15]
    R = HeroRotationCharDB.Toggles[120]
    H = HeroRotationCharDB.Toggles[121]
    S = HeroRotationCharDB.Toggles[122]
    C = HeroRotationCharDB.Toggles[123]
    U = HeroRotationCharDB.Toggles[124]
    Z = HeroRotationCharDB.Toggles[125]
    K = HeroRotationCharDB.Toggles[142]
    O = HeroRotationCharDB.Toggles[17]
    A = false
    T = false
    _ = false
    I = false
    if ((s.BeastMastery.AspectoftheWild == "CDs" and n()) or (s.BeastMastery.AspectoftheWild == "Small CDs" and (n() or v)) or (s.BeastMastery.AspectoftheWild == "Always")) then
        A = true
    end

    if ((s.BeastMastery.Stampede == "CDs" and n()) or (s.BeastMastery.Stampede == "Small CDs" and (n() or v)) or (s.BeastMastery.Stampede == "Always")) then
        T = true
    end

    if ((s.BeastMastery.BestialWrathCD == "CDs" and n()) or (s.BeastMastery.BestialWrathCD == "Small CDs" and (n() or v)) or (s.BeastMastery.BestialWrathCD == "Always")) then
        _ = true
    end

    if ((s.BeastMastery.Bloodshed == "CDs" and n()) or (s.BeastMastery.Bloodshed == "Small CDs" and (n() or v)) or (s.BeastMastery.Bloodshed == "Always")) then
        I = true
    end

    F = GetInventoryItemID("player", 13)
    se = GetInventoryItemID("player", 14)
end

local function b()
    if e.Stomp:IsAvailable() then
        w.SplashEnemies.ChangeFriendTargetsTracking("Mine Only")
    else
        w.SplashEnemies.ChangeFriendTargetsTracking("All")
    end

    local f, f = GetInventoryItemID("player", 13)
    local f, f = GetInventoryItemID("player", 14)
    h = a:GCD() + .15
    if m.TargetIsValid() or a:AffectingCombat() then
        M = w.BossFightRemains(nil, true)
        l = M
        if l == 11111 then
            l = w.FightRemains(Enemies8y, false)
        end

    end

    if c > 0 then
        c = 0
    end

    if t > 0 then
        t = 0
    end

    local l = (e.BloodBolt:IsPetKnown() and z.FindBySpellID(e.BloodBolt:ID()) and e.BloodBolt) or (e.Bite:IsPetKnown() and z.FindBySpellID(e.Bite:ID()) and e.Bite) or (e.Claw:IsPetKnown() and z.FindBySpellID(e.Claw:ID()) and e.Claw) or (e.Smack:IsPetKnown() and z.FindBySpellID(e.Smack:ID()) and e.Smack) or nil
    local f = (e.Growl:IsPetKnown() and z.FindBySpellID(e.Growl:ID()) and e.Growl) or nil
    if ne() then
        y = a:GetEnemiesInRange(40)
        g = (l and #a:GetEnemiesInSpellActionRange(l)) or i:GetEnemiesInSplashRangeCount(8)
    else
        y = {  }
        g = 0
    end

    u = i:IsInRange(40)
    L = i:IsInRange(30)
    E = (f and i:IsSpellInActionRange(f)) or i:IsInRange(30)
    q()
    if e.Exhilaration:IsCastable() and a:HealthPercentage() <= s.Commons.ExhilarationHP then
        if o(e.Exhilaration, nil) then
            t = 109304
            return "Exhilaration"
        end

    end

    if a:HealthPercentage() < s.Commons.HealthstoneHP and k.Healthstone:IsReady() and k.Healthstone:CooldownRemains() <= 0 then
        if d.Cast(k.Healthstone, nil) then
            t = 40
            return "Healthstone HP"
        end

    end

    if a:HealthPercentage() < s.Commons.HealPotHP and k.CosmicHealPot:IsReady() and k.CosmicHealPot:CooldownRemains() <= 0 then
        if d.Cast(k.CosmicHealPot, nil) then
            t = 45
            return "CosmicHealPot HP"
        end

    end

    if a:HealthPercentage() < s.Commons.HealPotHP and k.HealPot:IsReady() and k.HealPot:CooldownRemains() <= 0 then
        if d.Cast(k.HealPot, nil) then
            t = 41
            return "HealPot HP"
        end

    end

    if e.AspectoftheTurtle:IsCastable() and a:HealthPercentage() <= s.Commons.TurtleHP then
        if o(e.AspectoftheTurtle, nil) then
            t = 186265
            return "AspectoftheTurtle"
        end

    end

    if a:BuffUp(x(5384)) then
        return false
    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.CobraShot:IsCastable() and u then
            if o(e.CobraShot, nil) then
                c = 1193455
                return "explosive MO SWD"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.CobraShot:IsCastable() and u then
            if o(e.CobraShot, nil) then
                t = 193455
                return "explosive  SWD"
            end

        end

    end

    X = { 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 195181, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426 }
    if UnitExists("target") and e.TranqualizingShot:IsCastable() and not K then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true and e.TranqualizingShot:IsCastable() and e.TranqualizingShot:CooldownRemains(BypassRecovery) <= 0 then
            for a = 0, 40 do
                local a, a, a, a, a, a, a, a, a, o = UnitBuff("target", a)
                for i, a in pairs(X) do
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
        return "Custom Queue " .. x(t):ID()
    end

        if (R and e.Bindingshot:IsAvailable() and e.Bindingshot:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.Bindingshot, nil, nil, nil) then
            t = 109248
            return "queue Binding Shot"
        end

    elseif ((not e.Bindingshot:IsUsableP() or e.Bindingshot:CooldownRemains() > 0) and R) then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
        d.Print("Binding Shot Queue is now " .. (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (H and e.FreezingTrap:IsAvailable() and e.FreezingTrap:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.FreezingTrap, nil, nil, nil) then
            t = 187650
            return "queue Freezing Trap"
        end

    elseif ((not e.FreezingTrap:IsUsableP() or e.FreezingTrap:CooldownRemains() > 0) and H) then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
        d.Print("Freezing Trap Queue is now " .. (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (S and e.Intimidation:IsAvailable() and e.Intimidation:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.Intimidation, nil, nil, nil) then
            t = 19577
            return "queue Intimidation"
        end

    elseif ((not e.Intimidation:IsUsableP() or e.Intimidation:CooldownRemains() > 0) and S) then
        HeroRotationCharDB.Toggles[122] = not HeroRotationCharDB.Toggles[122]
        d.Print("Intimidation Queue is now " .. (HeroRotationCharDB.Toggles[122] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (C and e.Flare:IsAvailable() and e.Flare:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.Flare, nil, nil, nil) then
            t = 1543
            return "queue Flare"
        end

    elseif ((not e.Flare:IsUsableP() or e.Flare:CooldownRemains() > 0) and C) then
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

    if a:BuffUp(x(5384)) then
        return false
    end

    if a:IsCasting(e.RevivePet) then
        if o(e.PoolFocus) then
            t = 999999
            return "Pooling Focus"
        end

    end

    if (r:IsActive() and select(2, GetStablePetInfo(s.Commons.SummonPetSlot)) ~= select(1, UnitName("pet"))) and s.Commons.SummonPetSlot ~= 0 and not a:IsMoving() and not a:PrevGCD(1, e.DismissPet) and not a:IsCasting(e.DismissPet) then
        if o(e.DismissPet, nil) then
            t = 2641
            return "Dismiss Pet"
        end

    end

    if e.SummonPet:IsCastable() and (not r:IsActive()) and s.Commons.SummonPetSlot ~= 0 then
                                        if s.Commons.SummonPetSlot == 1 and not a:PrevGCD(1, p[s.Commons.SummonPetSlot]) then
            if o(p[s.Commons.SummonPetSlot], nil) then
                t = 883
                return "Summon Pet"
            end

        elseif s.Commons.SummonPetSlot == 2 and not a:PrevGCD(1, p[s.Commons.SummonPetSlot]) then
            if o(p[s.Commons.SummonPetSlot], nil) then
                t = 83242
                return "Summon Pet"
            end

        elseif s.Commons.SummonPetSlot == 3 and not a:PrevGCD(1, p[s.Commons.SummonPetSlot]) then
            if o(p[s.Commons.SummonPetSlot], nil) then
                t = 83243
                return "Summon Pet"
            end

        elseif s.Commons.SummonPetSlot == 4 and not a:PrevGCD(1, p[s.Commons.SummonPetSlot]) then
            if o(p[s.Commons.SummonPetSlot], nil) then
                t = 83244
                return "Summon Pet"
            end

        elseif s.Commons.SummonPetSlot == 5 and not a:PrevGCD(1, p[s.Commons.SummonPetSlot]) then
            if o(p[s.Commons.SummonPetSlot], nil) then
                t = 83245
                return "Summon Pet"
            end

        end

    end

    if (r:IsDeadOrGhost() or not UnitExists("pet")) and e.RevivePet:IsCastable() and not a:IsMoving() and s.Commons.SummonPetSlot ~= 0 then
        if o(e.RevivePet, nil) then
            t = 982
            return "Revive Pet"
        end

    end

    local l, f, w = GetSpellCooldown(34477)
    if a:AffectingCombat() and s.Commons.AutoMisdirect and not Z then
        if (l + f - GetTime()) <= 0 and e.Misdirection:IsAvailable() and e.Misdirection:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus") or UnitIsUnit("focus", "pet")) and IsItemInRange(32698, "focus") then
            if d.Cast(e.Misdirection) then
                c = 134477
                return "MD Focus"
            end

        end

    end

    if not r:IsDeadOrGhost() and UnitExists("pet") and e.MendPet:IsCastable() and r:HealthPercentage() <= s.Commons.MendPetHighHP and not a:PrevGCD(1, e.MendPet) then
        if o(e.MendPet) then
            t = 1982
            return "Mend Pet High Priority"
        end

    end

    if not a:AffectingCombat() and ((D) or (s.BeastMastery.DBMSupport and ((e.BestialWrath:IsCastable() and _ and d.BossMods:GetPullTimer() < h and d.BossMods:GetPullTimer() > 0) or d.BossMods:GetPullTimer() < .5 and d.BossMods:GetPullTimer() > 0))) and m.TargetIsValid() then
        j = ae()
        if j then
            return j
        end

    end

    if m.TargetIsValid() and (a:AffectingCombat() or D) then
        if (not i:AffectingCombat() and not i:IsDummy() and not i:NPCID() == 153285) and g >= 1 then
            t = 999
        end

        if (not i:AffectingCombat() and not i:IsDummy() and not i:NPCID() == 153285) then
            if o(e.PoolFocus) then
                t = 999999
                return "Pooling Focus"
            end

        end

        if true then
            j = te()
            if j then
                return j
            end

        end

        if ((s.Commons.Enabled.TopTrinket or s.Commons.Enabled.BottomTrinket) and n()) then
            local e = oe()
            if e then
                return e
            end

        end

        if (g < 2 or ((not e.BeastCleave:IsAvailable()) and g < 3)) then
            local e = N()
            if e then
                return e
            end

        end

        if (g > 2 or (e.BeastCleave:IsAvailable() and g > 1)) then
            local e = Q()
            if e then
                return e
            end

        end

        if not r:IsDeadOrGhost() and UnitExists("pet") and e.MendPet:IsCastable() and r:HealthPercentage() <= s.Commons.MendPetLowHP then
            if o(e.MendPet) then
                t = 1982
                return "Mend Pet Low Priority (w/ Target)"
            end

        end

        if v and not O and not a:IsMoving() and i:IsInMeleeRange(40) and (e.WailingArrow:IsReady() and r:BuffRemains(e.FrenzyPetBuff) > e.WailingArrow:ExecuteTime() and (a:Covenant() == "Night Fae" and a:BuffUp(e.WildSpiritsBuff))) then
            if o(e.WailingArrow, nil, nil, not u) then
                t = 355589
                return "Wailing Arrow (ST)1"
            end

        end

        if o(e.PoolFocus) then
            t = 999999
            return "Pooling Focus"
        end

    end

    if not r:IsDeadOrGhost() and UnitExists("pet") and e.MendPet:IsCastable() and r:HealthPercentage() <= s.Commons.MendPetLowHP then
        if o(e.MendPet) then
            t = 1982
            return "Mend Pet Low Priority (w/o Target)"
        end

    end

end

local function e()
    w.Print("BeastMastery can use pet abilities to better determine AoE, makes sure you have Growl and Blood Bolt / Bite / Claw / Smack in your player action bars.")
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
    if c == 0 then
        return 0
    else
        return c
    end

end

d.SetAPL(253, b, e)

