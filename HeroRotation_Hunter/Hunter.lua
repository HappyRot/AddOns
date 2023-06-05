local a, b = ...
local c = HeroDBC.DBC
local d = HeroLib
local e = HeroCache
local f = d.Unit
local g = f.Player
local h = f.Target
local i = f.Pet
local j = d.Spell
local k = d.Item
local l = d.Action
local m = HeroRotation
local n = m.AoEON
local o = m.CDsON
local p = m.Cast
local q = m.CastSuggested
local r = math.max
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
local F = HeroRotationCharDB.Toggles[170]
local G
local H
local I
local J
local K = {
    355782,
    333875,
    344739,
    228318,
    332158,
    321764,
    324914,
    326046,
    324776,
    340544,
    324736,
    328015,
    322433,
    334324,
    317936,
    327332,
    328288,
    343470,
    333293,
    320272,
    342139,
    355888,
    349933,
    356549,
    355934,
    353706,
    347775,
    357284,
    335141,
    327155,
    178658,
    333227,
    334800,
    334967,
    324737,
    326450,
    334470,
    320703,
    320012,
    324085,
    333241,
    344739,
    368477,
    368396,
    355057,
    356133,
    158337,
    164426
}
local L = m.Commons.Everyone
local M = m.Commons.Hunter
local N = {
    General = m.GUISettings.General,
    Commons = m.GUISettings.APL.Hunter.Commons,
    BeastMastery = m.GUISettings.APL.Hunter.BeastMastery
}
local O = j.Hunter.BeastMastery
local P = {O.SummonPet, O.SummonPet2, O.SummonPet3, O.SummonPet4, O.SummonPet5}
local Q = k.Hunter.BeastMastery
local R = {}
local S = g:GetEquipment()
local T = S[11] and k(S[11]) or k(0)
local U = S[12] and k(S[12]) or k(0)
local V = k(0)
local W = k(0)
local X = GetInventoryItemID("player", 13)
local Y = GetInventoryItemID("player", 14)
local Z
local _ = 11111
local a0 = 11111
d:RegisterForEvent(
    function()
        S = g:GetEquipment()
        T = S[11] and k(S[11]) or k(0)
        U = S[12] and k(S[12]) or k(0)
    end,
    "PLAYER_EQUIPMENT_CHANGED"
)
d:RegisterForEvent(
    function()
        _ = 11111
        a0 = 11111
    end,
    "PLAYER_REGEN_ENABLED"
)
local a1, a2, a3
local a4
local a5, a6
local a7
local a8
local Z
local a9 = 0
local aa = 0
local ab = {{O.Intimidation, "Cast Intimidation (Interrupt)", function()
            return true
        end}}
local function ac(ad)
    if ad then
        return 1
    else
        return 0
    end
end
local function ae(ad)
    return ad ~= 0
end
local function af(ag)
    local af = 0
    if ag ~= nil then
        for ah in pairs(ag) do
            local ai = ag[ah]
            if
                ai:IsInRange(40) and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and
                    ai:DebuffUp(j(257284))
             then
                af = af + 1
            end
        end
    end
    return af
end
local function aj(ak)
    return ak:DebuffRemains(O.BarbedShotDebuff)
end
local function al(ak)
    return ak:DebuffStack(O.LatentPoisonDebuff)
end
local function am(ak)
    return ak:DebuffRemains(O.SerpentStingDebuff)
end
local function an(ak)
    if
        ak:DebuffStack(O.LatentPoisonDebuff) > 9 and
            (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
                O.ScentofBlood:IsAvailable() and O.BestialWrath:CooldownRemains() < 12 + Z and o() or
                O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == f("mouseover"):GUID()
     then
        aa = 1217200
        return true
    elseif
        ak:DebuffStack(O.LatentPoisonDebuff) > 9 and
            (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
                O.ScentofBlood:IsAvailable() and O.BestialWrath:CooldownRemains() < 12 + Z and o() or
                O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            N.BeastMastery.TargetSwap == "AutoSwap" and
            ak:GUID() ~= h:GUID() and
            not v
     then
        aa = 999
        return true
    elseif
        ak:DebuffStack(O.LatentPoisonDebuff) > 9 and
            (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
                O.ScentofBlood:IsAvailable() and O.BestialWrath:CooldownRemains() < 12 + Z and o() or
                O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == h:GUID()
     then
        a9 = 217200
        return true
    elseif
        ak:DebuffStack(O.LatentPoisonDebuff) > 9 and
            (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
                O.ScentofBlood:IsAvailable() and O.BestialWrath:CooldownRemains() < 12 + Z and o() or
                O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285)
     then
        return true
    end
end
local function ao(ak)
    if
        (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
            O.ScentofBlood:IsAvailable() and O.BestialWrath:CooldownRemains() < 12 + Z and o() or
            O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == f("mouseover"):GUID()
     then
        aa = 1217200
        return true
    elseif
        (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
            O.ScentofBlood:IsAvailable() and O.BestialWrath:CooldownRemains() < 12 + Z and o() or
            O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            N.BeastMastery.TargetSwap == "AutoSwap" and
            ak:GUID() ~= h:GUID() and
            not v
     then
        aa = 999
        return true
    elseif
        (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
            O.ScentofBlood:IsAvailable() and O.BestialWrath:CooldownRemains() < 12 + Z and o() or
            O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == h:GUID()
     then
        a9 = 217200
        return true
    elseif
        (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
            O.ScentofBlood:IsAvailable() and O.BestialWrath:CooldownRemains() < 12 + Z and o() or
            O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285)
     then
        return true
    end
end
local function ap(ak)
    if
        ak:DebuffStack(O.LatentPoisonDebuff) > 9 and
            (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or a0 < 9 or
                O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == f("mouseover"):GUID()
     then
        aa = 1217200
        return true
    elseif
        ak:DebuffStack(O.LatentPoisonDebuff) > 9 and
            (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or a0 < 9 or
                O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            N.BeastMastery.TargetSwap == "AutoSwap" and
            ak:GUID() ~= h:GUID() and
            not v
     then
        aa = 999
        return true
    elseif
        ak:DebuffStack(O.LatentPoisonDebuff) > 9 and
            (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or a0 < 9 or
                O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == h:GUID()
     then
        a9 = 217200
        return true
    elseif
        ak:DebuffStack(O.LatentPoisonDebuff) > 9 and
            (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or a0 < 9 or
                O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285)
     then
        return true
    end
end
local function aq(ak)
    if
        (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or a0 < 9 or
            O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == f("mouseover"):GUID()
     then
        aa = 1217200
        return true
    elseif
        (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or a0 < 9 or
            O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            N.BeastMastery.TargetSwap == "AutoSwap" and
            ak:GUID() ~= h:GUID() and
            not v
     then
        aa = 999
        return true
    elseif
        (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or a0 < 9 or
            O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == h:GUID()
     then
        a9 = 217200
        return true
    elseif
        (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or a0 < 9 or
            O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285)
     then
        return true
    end
end
local function ar(ak)
    if
        ak:DebuffRefreshable(O.SerpentStingDebuff) and ak:TimeToDie() > O.SerpentStingDebuff:BaseDuration() and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == f("mouseover"):GUID()
     then
        aa = 1271788
        return true
    elseif
        ak:DebuffRefreshable(O.SerpentStingDebuff) and ak:TimeToDie() > O.SerpentStingDebuff:BaseDuration() and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            N.BeastMastery.TargetSwap == "AutoSwap" and
            ak:GUID() ~= h:GUID() and
            not v
     then
        aa = 999
        return true
    elseif
        ak:DebuffRefreshable(O.SerpentStingDebuff) and ak:TimeToDie() > O.SerpentStingDebuff:BaseDuration() and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == h:GUID()
     then
        a9 = 271788
        return true
    elseif
        ak:DebuffRefreshable(O.SerpentStingDebuff) and ak:TimeToDie() > O.SerpentStingDebuff:BaseDuration() and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285)
     then
        return true
    end
end
local function as(ak)
    if
        (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
            O.ScentofBlood:IsAvailable() and i:BuffStack(O.FrenzyPetBuff) < 3 and
                (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == f("mouseover"):GUID()
     then
        aa = 1217200
        return true
    elseif
        (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
            O.ScentofBlood:IsAvailable() and i:BuffStack(O.FrenzyPetBuff) < 3 and
                (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            N.BeastMastery.TargetSwap == "AutoSwap" and
            ak:GUID() ~= h:GUID() and
            not v
     then
        aa = 999
        return true
    elseif
        (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
            O.ScentofBlood:IsAvailable() and i:BuffStack(O.FrenzyPetBuff) < 3 and
                (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == h:GUID()
     then
        a9 = 217200
        return true
    elseif
        (i:BuffUp(O.FrenzyPetBuff) and i:BuffRemains(O.FrenzyPetBuff) <= Z + 0.25 or
            O.ScentofBlood:IsAvailable() and i:BuffStack(O.FrenzyPetBuff) < 3 and
                (O.BestialWrath:CooldownRemains() > 0 or not o())) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285)
     then
        return true
    end
end
local function at(ak)
    if
        (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or
            O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8 or
            O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o()) or
            O.ScentofBlood:IsAvailable() and
                (O.BestialWrath:CooldownRemains() < 12 + Z and o() or
                    O.BarbedShot:FullRechargeTime() + Z < 8 and
                        O.BestialWrath:CooldownRemains() < 24 + 8 - Z + O.BarbedShot:FullRechargeTime() and
                        o()) or
            a0 < 9) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == f("mouseover"):GUID()
     then
        aa = 1217200
        return true
    elseif
        (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or
            O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8 or
            O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o()) or
            O.ScentofBlood:IsAvailable() and
                (O.BestialWrath:CooldownRemains() < 12 + Z and o() or
                    O.BarbedShot:FullRechargeTime() + Z < 8 and
                        O.BestialWrath:CooldownRemains() < 24 + 8 - Z + O.BarbedShot:FullRechargeTime() and
                        o()) or
            a0 < 9) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            N.BeastMastery.TargetSwap == "AutoSwap" and
            ak:GUID() ~= h:GUID() and
            not v
     then
        aa = 999
        return true
    elseif
        (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or
            O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8 or
            O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o()) or
            O.ScentofBlood:IsAvailable() and
                (O.BestialWrath:CooldownRemains() < 12 + Z and o() or
                    O.BarbedShot:FullRechargeTime() + Z < 8 and
                        O.BestialWrath:CooldownRemains() < 24 + 8 - Z + O.BarbedShot:FullRechargeTime() and
                        o()) or
            a0 < 9) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == h:GUID()
     then
        a9 = 217200
        return true
    elseif
        (O.WildInstincts:IsAvailable() and g:BuffUp(O.CalloftheWildBuff) or
            O.WildCall:IsAvailable() and O.BarbedShot:ChargesFractional() > 1.8 or
            O.BarbedShot:FullRechargeTime() < Z and (O.BestialWrath:CooldownRemains() > 0 or not o()) or
            O.ScentofBlood:IsAvailable() and
                (O.BestialWrath:CooldownRemains() < 12 + Z and o() or
                    O.BarbedShot:FullRechargeTime() + Z < 8 and
                        O.BestialWrath:CooldownRemains() < 24 + 8 - Z + O.BarbedShot:FullRechargeTime() and
                        o()) or
            a0 < 9) and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285)
     then
        return true
    end
end
local function au(ak)
    if
        ak:DebuffRefreshable(O.SerpentStingDebuff) and h:TimeToDie() > O.SerpentStingDebuff:BaseDuration() and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == f("mouseover"):GUID()
     then
        aa = 1271788
        return true
    elseif
        ak:DebuffRefreshable(O.SerpentStingDebuff) and h:TimeToDie() > O.SerpentStingDebuff:BaseDuration() and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            N.BeastMastery.TargetSwap == "AutoSwap" and
            ak:GUID() ~= h:GUID() and
            not v
     then
        aa = 999
        return true
    elseif
        ak:DebuffRefreshable(O.SerpentStingDebuff) and h:TimeToDie() > O.SerpentStingDebuff:BaseDuration() and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285) and
            ak:GUID() == h:GUID()
     then
        a9 = 271788
        return true
    elseif
        ak:DebuffRefreshable(O.SerpentStingDebuff) and h:TimeToDie() > O.SerpentStingDebuff:BaseDuration() and
            (ak:AffectingCombat() or ak:IsDummy() or ak:NPCID() == 153285)
     then
        return true
    end
end
local function av()
    if L.TargetIsValid() and a5 then
        if O.SteelTrap:IsCastable() and (not O.WailingArrow:IsAvailable() and O.SteelTrap:IsAvailable()) then
            if p(O.SteelTrap, N.Commons2.GCDasOffGCD.SteelTrap, nil, not h:IsInRange(40)) then
                return "steel_trap precombat 2"
            end
        end
        if O.BarbedShot:IsCastable() and O.BarbedShot:Charges() >= 2 then
            if p(O.BarbedShot) then
                a9 = 217200
                return "Barbed Shot (PreCombat)"
            end
        end
        if O.KillShot:IsReady() then
            if p(O.KillShot) then
                a9 = 53351
                return "Kill Shot (PreCombat)"
            end
        end
        if O.KillCommand:IsCastable() and UnitExists("pet") and a7 then
            if p(O.KillCommand) then
                a9 = 34026
                return "Kill Command (PreCombat)"
            end
        end
        if a3 > 1 then
            if O.MultiShot:IsCastable() then
                if p(O.MultiShot) then
                    a9 = 2643
                    return "Multi-Shot (PreCombat)"
                end
            end
        else
            if O.CobraShot:IsCastable() then
                if p(O.CobraShot) then
                    a9 = 193455
                    return "Cobra Shot (PreCombat)"
                end
            end
        end
    end
end
local function aw()
    if
        O.Berserking:IsCastable() and o() and
            (not O.BestialWrath:IsAvailable() or g:BuffUp(O.BestialWrathBuff) or a0 < 16)
     then
        if p(O.Berserking, nil) then
            a9 = 26297
            return "Berserking"
        end
    end
    if
        O.BloodFury:IsCastable() and o() and
            (g:BuffUp(O.CalloftheWildBuff) or
                not O.CalloftheWild:IsAvailable() and
                    (g:BuffUp(O.BestialWrathBuff) and g:BloodlustUp() or h:HealthPercentage() < 20) or
                a0 < 16)
     then
        if p(O.BloodFury, nil) then
            a9 = 20572
            return "Blood Fury"
        end
    end
    if
        O.AncestralCall:IsCastable() and o() and
            (g:BuffUp(O.CalloftheWildBuff) or
                not O.CalloftheWild:IsAvailable() and
                    (g:BuffUp(O.BestialWrathBuff) and g:BloodlustUp() or h:HealthPercentage() < 20) or
                a0 < 16)
     then
        if p(O.AncestralCall, nil) then
            a9 = 274738
            return "Ancestral Call"
        end
    end
    if
        O.Fireblood:IsCastable() and o() and
            (g:BuffUp(O.CalloftheWildBuff) or
                not O.CalloftheWild:IsAvailable() and
                    (g:BuffUp(O.BestialWrathBuff) and (g:BloodlustUp() or h:HealthPercentage() < 20)) or
                a0 < 10)
     then
        if p(O.Fireblood, nil) then
            a9 = 265221
            return "Fireblood"
        end
    end
    if
        N.Commons.Enabled.Potions and o() and w and
            ((g:BuffUp(O.CalloftheWildBuff) or
                not O.CalloftheWild:IsAvailable() and
                    (g:BuffUp(O.BestialWrathBuff) and (g:BloodlustUp() or h:HealthPercentage() < 20)) or
                a0 < 31) and
                not m.GUISettings.General.HoldPotforBL or
                m.GUISettings.General.HoldPotforBL and g:BloodlustUp())
     then
        local ax = L.PotionSelected()
        if ax and ax:IsReady() then
            if p(ax, nil, nil) then
                a9 = 50
                return "potion cooldowns 2"
            end
        end
    end
    if O.LightsJudgment:IsCastable() and o() and (i:BuffRemains(O.FrenzyPetBuff) > Z or i:BuffDown(O.FrenzyPetBuff)) then
        if p(O.LightsJudgment, nil, nil, 40) then
            a9 = 255647
            return "Light's Judgment"
        end
    end
end
local function ay()
    local az = g:GetUseableTrinkets(R, 13)
    if
        az and
            (g:BuffUp(O.CalloftheWildBuff) or
                not O.CalloftheWild:IsAvailable() and
                    (g:BuffUp(O.BestialWrathBuff) and (g:BloodlustUp() or h:HealthPercentage() < 20)) or
                a0 < 31)
     then
        if az:ID() == X and N.Commons.Enabled.TopTrinket then
            if p(az, nil, nil) then
                a9 = 24
                return "Generic use_items for " .. az:Name()
            end
        end
    end
    local aA = g:GetUseableTrinkets(R, 14)
    if
        aA and
            (g:BuffUp(O.CalloftheWildBuff) or
                not O.CalloftheWild:IsAvailable() and
                    (g:BuffUp(O.BestialWrathBuff) and (g:BloodlustUp() or h:HealthPercentage() < 20)) or
                a0 < 31)
     then
        if aA:ID() == X and N.Commons.Enabled.BottomTrinket then
            if p(aA, nil, nil) then
                a9 = 30
                return "Generic use_items for " .. aA:Name()
            end
        end
    end
end
local function aB()
    if O.BarbedShot:IsCastable() then
        if L.CastTargetIf(O.BarbedShot, a1, "max", al, an, not h:IsSpellInRange(O.BarbedShot)) then
            return "barbed_shot cleave 2"
        end
        if al(h) and an(h) then
            if p(O.BarbedShot, nil, nil, not a5) then
                a9 = 217200
                return "barbed_shot cleave 2"
            end
        end
    end
    if O.BarbedShot:IsCastable() then
        if L.CastTargetIf(O.BarbedShot, a1, "min", aj, ao, not h:IsSpellInRange(O.BarbedShot)) then
            return "barbed_shot cleave 4"
        end
        if aj(h) and ao(h) then
            if p(O.BarbedShot, nil, nil, not a5) then
                a9 = 217200
                return "barbed_shot cleave 4"
            end
        end
    end
    if O.MultiShot:IsReady() and Z - i:BuffRemains(O.BeastCleavePetBuff) > 0.25 then
        if p(O.MultiShot, nil, nil, not a5) then
            a9 = 2643
            return "Multi-Shot (Cleave - 1)"
        end
    end
    if O.BestialWrath:IsCastable() and o() then
        if p(O.BestialWrath, nil) then
            a9 = 19574
            return "bestial_wrath cleave 8"
        end
    end
    if
        O.KillCommand:IsReady() and
            (O.KillCommand:FullRechargeTime() < Z and O.AlphaPredator:IsAvailable() and O.KillCleave:IsAvailable())
     then
        if p(O.KillCommand) then
            a9 = 34026
            return "Kill Command (Cleave)"
        end
    end
    if O.CalloftheWild:IsCastable() and o() and h:IsInMeleeRange(40) then
        if p(O.CalloftheWild, nil) then
            a9 = 359844
            return "CalloftheWild (Cleave)"
        end
    end
    if O.ExplosiveShot:IsReady() and h:IsInMeleeRange(40) and t then
        if p(O.ExplosiveShot, nil, nil, not h:IsInRange(40)) then
            a9 = 212431
            return "ExplosiveShot cleave 4"
        end
    end
    if O.Stampede:IsCastable() and H and (g:BuffUp(O.BestialWrathBuff) or a0 < 15) then
        if p(O.Stampede, nil, nil, not a6) then
            a9 = 201430
            return "Stampede (Cleave)"
        end
    end
    if O.Bloodshed:IsCastable() and J then
        if p(O.Bloodshed, nil) then
            a9 = 321530
            return "Bloodshed (ST)"
        end
    end
    if O.DeathChakram:IsCastable() and t then
        if p(O.DeathChakram, nil, nil) then
            a9 = 325028
            return "death_chakram st"
        end
    end
    if O.AMurderofCrows:IsReady() then
        if p(O.AMurderofCrows, nil, nil, not h:IsSpellInRange(O.AMurderofCrows)) then
            a9 = 131894
            return "a_murder_of_crows cleave 24"
        end
    end
    if O.BarbedShot:IsCastable() then
        if L.CastTargetIf(O.BarbedShot, a1, "max", al, ap, not h:IsSpellInRange(O.BarbedShot)) then
            a9 = 217200
            return "barbed_shot cleave 26"
        end
    end
    if O.BarbedShot:IsCastable() then
        if L.CastTargetIf(O.BarbedShot, a1, "min", aj, aq, not h:IsSpellInRange(O.BarbedShot)) then
            a9 = 217200
            return "barbed_shot cleave 28"
        end
    end
    if O.KillCommand:IsReady() then
        if p(O.KillCommand, nil, nil, not h:IsSpellInRange(O.KillCommand)) then
            a9 = 34026
            return "kill_command cleave 30"
        end
    end
    if O.DireBeast:IsCastable() then
        if p(O.DireBeast, nil, nil, not h:IsSpellInRange(O.DireBeast)) then
            a9 = 120679
            return "dire_beast cleave 32"
        end
    end
    if O.SerpentSting:IsReady() then
        if L.CastTargetIf(O.SerpentSting, a1, "min", am, ar, not h:IsSpellInRange(O.SerpentSting)) then
            return "serpent_sting cleave 34"
        end
    end
    if O.Barrage:IsReady() and i:BuffRemains(O.FrenzyPetBuff) > O.Barrage:ExecuteTime() then
        if p(O.Barrage, nil, nil, not h:IsSpellInRange(O.Barrage)) then
            a9 = 120360
            return "barrage cleave 36"
        end
    end
    if O.MultiShot:IsReady() and i:BuffRemains(O.BeastCleavePetBuff) < g:GCD() * 2 then
        if p(O.MultiShot, nil, nil, not h:IsSpellInRange(O.MultiShot)) then
            a9 = 2643
            return "multishot cleave 38"
        end
    end
    if O.AspectoftheWild:IsCastable() and o() then
        if p(O.AspectoftheWild, nil) then
            a9 = 193530
            return "aspect_of_the_wild cleave 40"
        end
    end
    if
        O.CobraShot:IsReady() and
            (g:FocusTimeToMax() < Z * 2 or g:BuffUp(O.AspectoftheWildBuff) and g:FocusTimeToMax() < Z * 4)
     then
        if p(O.CobraShot, nil, nil, not h:IsSpellInRange(O.CobraShot)) then
            a9 = 193455
            return "cobra_shot cleave 42"
        end
    end
    if O.WailingArrow:IsReady() and (i:BuffRemains(O.FrenzyPetBuff) > O.WailingArrow:ExecuteTime() or a0 < 5) then
        if p(O.WailingArrow, nil, nil, not h:IsSpellInRange(O.WailingArrow)) then
            a9 = 392060
            return "wailing_arrow cleave 44"
        end
    end
    if O.BagofTricks:IsCastable() and o() and (g:BuffDown(O.BestialWrathBuff) or a0 < 5) then
        if p(O.BagofTricks, nil) then
            a9 = 312411
            return "bag_of_tricks cleave 46"
        end
    end
    if O.ArcaneTorrent:IsCastable() and o() and g:Focus() + g:FocusRegen() + 30 < g:FocusMax() then
        if p(O.ArcaneTorrent, nil) then
            a9 = 155145
            return "arcane_torrent cleave 48"
        end
    end
    if O.KillShot:IsReady() then
        if p(O.KillShot, nil, nil, not h:IsSpellInRange(O.KillShot)) then
            a9 = 53351
            return "kill_shot cleave 50"
        end
    end
end
local function aC()
    if O.BarbedShot:IsCastable() then
        if L.CastTargetIf(O.BarbedShot, a1, "min", aj, as, not h:IsSpellInRange(O.BarbedShot)) then
            return "barbed_shot st 2"
        end
        if aj(h) and as(h) then
            if p(O.BarbedShot, nil, nil, not a5) then
                a9 = 217200
                return "barbed_shot st 2"
            end
        end
    end
    if O.BarbedShot:IsCastable() and as(h) then
        if p(O.BarbedShot, nil, nil, not h:IsSpellInRange(O.BarbedShot)) then
            a9 = 217200
            return "barbed_shot st mt_backup 3"
        end
    end
    if
        O.KillCommand:IsReady() and UnitExists("pet") and a7 and
            (O.KillCommand:FullRechargeTime() < Z and O.AlphaPredator:IsAvailable())
     then
        if p(O.KillCommand) then
            a9 = 34026
            return "Kill Command (ST)"
        end
    end
    if O.DeathChakram:IsCastable() and t then
        if p(O.DeathChakram, nil, nil) then
            a9 = 325028
            return "death_chakram st"
        end
    end
    if O.Bloodshed:IsCastable() and J then
        if p(O.Bloodshed, nil) then
            a9 = 321530
            return "Bloodshed (ST)"
        end
    end
    if O.Stampede:IsCastable() and H then
        if p(O.Stampede, nil, nil, not a6) then
            a9 = 201430
            return "Stampede (ST)"
        end
    end
    if O.AMurderofCrows:IsReady() then
        if p(O.AMurderofCrows, nil, nil, not a5) then
            a9 = 131894
            return "A Murder of Crows (ST)"
        end
    end
    if O.ExplosiveShot:IsReady() and h:IsInMeleeRange(40) and t then
        if p(O.ExplosiveShot, nil, nil, not h:IsInRange(40)) then
            a9 = 212431
            return "ExplosiveShot cleave 4"
        end
    end
    if O.BestialWrath:IsCastable() and I and UnitExists("pet") and a3 > 0 then
        if p(O.BestialWrath, nil) then
            a9 = 19574
            return "Bestial Wrath (ST)"
        end
    end
    if O.KillCommand:IsReady() and UnitExists("pet") and a7 then
        if p(O.KillCommand) then
            a9 = 34026
            return "Kill Command (ST)"
        end
    end
    if O.BarbedShot:IsCastable() then
        if L.CastTargetIf(O.BarbedShot, a1, "min", aj, at, not h:IsSpellInRange(O.BarbedShot)) then
            return "barbed_shot st 24"
        end
        if aj(h) and at(h) then
            if p(O.BarbedShot, nil, nil, not a5) then
                a9 = 217200
                return "barbed_shot st 24"
            end
        end
    end
    if O.DireBeast:IsReady() then
        if p(O.DireBeast, nil, nil, not a5) then
            a9 = 120679
            return "Dire Beast (ST)"
        end
    end
    if O.SerpentSting:IsReady() then
        if L.CastTargetIf(O.SerpentSting, a1, "min", am, au, not h:IsSpellInRange(O.SerpentSting)) then
            return "serpent_sting st 28"
        end
    end
    if O.KillShot:IsReady() then
        if p(O.KillShot, nil, nil, not a5) then
            a9 = 53351
            return "Kill Shot (ST)"
        end
    end
    if O.AspectoftheWild:IsCastable() and G and UnitExists("pet") and h:IsInMeleeRange(40) then
        if p(O.AspectoftheWild, nil) then
            a9 = 193530
            return "Aspect of the Wild (Cleave)"
        end
    end
    if O.CobraShot:IsReady() then
        if p(O.CobraShot, nil, nil, not a5) then
            a9 = 193455
            return "Cobra Shot (ST)"
        end
    end
    if
        O.WailingArrow:IsReady() and t and not E and not g:IsMoving() and h:IsInMeleeRange(40) and
            (i:BuffRemains(O.FrenzyPetBuff) > O.WailingArrow:ExecuteTime() or a0 < 5)
     then
        if p(O.WailingArrow, nil, nil, not a5) then
            a9 = 355589
            return "Wailing Arrow (ST)"
        end
    end
    if o() then
        if O.BagofTricks:IsCastable() and o() and (g:BuffDown(O.BestialWrathBuff) or a0 < 5) then
            if p(O.BagofTricks, nil, nil, not a5) then
                a9 = 312411
                return "Bag of Tricks (ST)"
            end
        end
        if O.ArcaneTorrent:IsCastable() and o() and g:Focus() + g:FocusRegen() + 15 < g:FocusMax() then
            if p(O.ArcaneTorrent, nil, nil, not h:IsInRange(8)) then
                a9 = 155145
                return "arcane_torrent st 50"
            end
        end
    end
end
local function aD()
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
    F = HeroRotationCharDB.Toggles[170]
    G = false
    H = false
    I = false
    J = false
    if
        N.BeastMastery.AspectoftheWild == "CDs" and o() or N.BeastMastery.AspectoftheWild == "Small CDs" and (o() or t) or
            N.BeastMastery.AspectoftheWild == "Always"
     then
        G = true
    end
    if
        N.BeastMastery.Stampede == "CDs" and o() or N.BeastMastery.Stampede == "Small CDs" and (o() or t) or
            N.BeastMastery.Stampede == "Always"
     then
        H = true
    end
    if
        N.BeastMastery.BestialWrathCD == "CDs" and o() or N.BeastMastery.BestialWrathCD == "Small CDs" and (o() or t) or
            N.BeastMastery.BestialWrathCD == "Always"
     then
        I = true
    end
    if
        N.BeastMastery.Bloodshed == "CDs" and o() or N.BeastMastery.Bloodshed == "Small CDs" and (o() or t) or
            N.BeastMastery.Bloodshed == "Always"
     then
        J = true
    end
    X = GetInventoryItemID("player", 13)
    Y = GetInventoryItemID("player", 14)
end
local function aE()
    if O.Stomp:IsAvailable() then
        d.SplashEnemies.ChangeFriendTargetsTracking("Mine Only")
    else
        d.SplashEnemies.ChangeFriendTargetsTracking("All")
    end
    local X, aF = GetInventoryItemID("player", 13)
    local Y, aF = GetInventoryItemID("player", 14)
    Z = g:GCD() + 0.150
    if L.TargetIsValid() or g:AffectingCombat() then
        _ = d.BossFightRemains(nil, true)
        a0 = _
        if a0 == 11111 then
            a0 = d.FightRemains(a4, false)
        end
    end
    if aa > 0 then
        aa = 0
    end
    if a9 > 0 then
        a9 = 0
    end
    local aG =
        O.BloodBolt:IsPetKnown() and l.FindBySpellID(O.BloodBolt:ID()) and O.BloodBolt or
        O.Bite:IsPetKnown() and l.FindBySpellID(O.Bite:ID()) and O.Bite or
        O.Claw:IsPetKnown() and l.FindBySpellID(O.Claw:ID()) and O.Claw or
        O.Smack:IsPetKnown() and l.FindBySpellID(O.Smack:ID()) and O.Smack or
        nil
    local aH = O.Growl:IsPetKnown() and l.FindBySpellID(O.Growl:ID()) and O.Growl or nil
    if n() then
        a1 = g:GetEnemiesInRange(40)
        a3 = aG and #g:GetEnemiesInSpellActionRange(aG) or h:GetEnemiesInSplashRangeCount(8)
    else
        a1 = {}
        a3 = 0
    end
    a5 = h:IsInRange(40)
    a6 = h:IsInRange(30)
    a7 = aH and h:IsSpellInActionRange(aH) or h:IsInRange(30)
    aD()
    if O.Exhilaration:IsCastable() and g:HealthPercentage() <= N.Commons.ExhilarationHP then
        if p(O.Exhilaration, nil) then
            a9 = 109304
            return "Exhilaration"
        end
    end
    if
        g:HealthPercentage() < N.Commons.HealthstoneHP and Q.Healthstone:IsReady() and
            Q.Healthstone:CooldownRemains() <= 0
     then
        if m.Cast(Q.Healthstone, nil) then
            a9 = 40
            return "Healthstone HP"
        end
    end
    if
        g:HealthPercentage() < N.Commons.HealPotHP and Q.CosmicHealPot:IsReady() and
            Q.CosmicHealPot:CooldownRemains() <= 0
     then
        if m.Cast(Q.CosmicHealPot, nil) then
            a9 = 45
            return "CosmicHealPot HP"
        end
    end
    if g:HealthPercentage() < N.Commons.HealPotHP and Q.HealPot:IsReady() and Q.HealPot:CooldownRemains() <= 0 then
        if m.Cast(Q.HealPot, nil) then
            a9 = 41
            return "HealPot HP"
        end
    end
    if O.AspectoftheTurtle:IsCastable() and g:HealthPercentage() <= N.Commons.TurtleHP then
        if p(O.AspectoftheTurtle, nil) then
            a9 = 186265
            return "AspectoftheTurtle"
        end
    end
    if g:BuffUp(j(5384)) then
        return false
    end
    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if O.CobraShot:IsCastable() and a5 then
            if p(O.CobraShot, nil) then
                aa = 1193455
                return "explosive MO SWD"
            end
        end
    end
    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if O.CobraShot:IsCastable() and a5 then
            if p(O.CobraShot, nil) then
                a9 = 193455
                return "explosive  SWD"
            end
        end
    end
    K = {
        333875,
        344739,
        228318,
        332158,
        321764,
        324914,
        326046,
        324776,
        340544,
        324736,
        328015,
        322433,
        334324,
        317936,
        327332,
        328288,
        195181,
        333293,
        320272,
        342139,
        355888,
        349933,
        356549,
        355934,
        353706,
        347775,
        357284,
        335141,
        327155,
        178658,
        333227,
        334800,
        334967,
        324737,
        326450,
        334470,
        320703,
        320012,
        324085,
        333241,
        344739,
        368477,
        368396,
        355057,
        356133,
        158337,
        164426
    }
    if UnitExists("target") and O.TranqualizingShot:IsCastable() and not D then
        if
            UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true and
                O.TranqualizingShot:IsCastable() and
                O.TranqualizingShot:CooldownRemains(BypassRecovery) <= 0
         then
            for aI = 0, 40 do
                local aF, aF, aJ, aK, aF, aF, aF, aF, aF, aL = UnitBuff("target", aI)
                for aF, aM in pairs(K) do
                    if aM == aL then
                        if m.Cast(O.TranqualizingShot, nil) then
                            a9 = 19801
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
    elseif
        m.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and
            HeroRotationCharDB.Toggles[6]
     then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        m.ToggleIconFrame:UpdateButtonText(6)
        m.Print(
            "Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r.")
        )
    end
    if m.QueuedCast() then
        a9 = m.QueuedCast()
        return "Custom Queue " .. j(a9):ID()
    end
    if x and O.Bindingshot:IsAvailable() and O.Bindingshot:CooldownRemains(BypassRecovery) <= 0 then
        if m.Cast(O.Bindingshot, nil, nil, nil) then
            a9 = 109248
            return "queue Binding Shot"
        end
    elseif (not O.Bindingshot:IsUsableP() or O.Bindingshot:CooldownRemains() > 0) and x then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
        m.Print(
            "Binding Shot Queue is now " ..
                (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if y and O.FreezingTrap:IsAvailable() and O.FreezingTrap:CooldownRemains(BypassRecovery) <= 0 then
        if m.Cast(O.FreezingTrap, nil, nil, nil) then
            a9 = 187650
            return "queue Freezing Trap"
        end
    elseif (not O.FreezingTrap:IsUsableP() or O.FreezingTrap:CooldownRemains() > 0) and y then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
        m.Print(
            "Freezing Trap Queue is now " ..
                (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if z and O.Intimidation:IsAvailable() and O.Intimidation:CooldownRemains(BypassRecovery) <= 0 then
        if m.Cast(O.Intimidation, nil, nil, nil) then
            a9 = 19577
            return "queue Intimidation"
        end
    elseif (not O.Intimidation:IsUsableP() or O.Intimidation:CooldownRemains() > 0) and z then
        HeroRotationCharDB.Toggles[122] = not HeroRotationCharDB.Toggles[122]
        m.Print(
            "Intimidation Queue is now " ..
                (HeroRotationCharDB.Toggles[122] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if A and O.Flare:IsAvailable() and O.Flare:CooldownRemains(BypassRecovery) <= 0 then
        if m.Cast(O.Flare, nil, nil, nil) then
            a9 = 1543
            return "queue Flare"
        end
    elseif (not O.Flare:IsUsableP() or O.Flare:CooldownRemains() > 0) and A then
        HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123]
        m.Print("Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if B and O.TarTrap:IsAvailable() and O.TarTrap:CooldownRemains(BypassRecovery) <= 0 then
        if m.Cast(O.TarTrap, nil, nil, nil) then
            a9 = 187698
            return "queue TarTrap"
        end
    elseif (not O.TarTrap:IsUsableP() or O.TarTrap:CooldownRemains() > 0) and B then
        HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124]
        m.Print(
            "Tar Trap Queue is now " .. (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if F and O.WailingArrow:IsAvailable() and O.WailingArrow:CooldownRemains(BypassRecovery) <= 0 then
        if m.Cast(O.WailingArrow, nil, nil, nil) then
            a9 = 392060
            return "queue WailingArrow"
        end
    elseif (not O.WailingArrow:IsUsableP() or O.WailingArrow:CooldownRemains() > 0) and F then
        HeroRotationCharDB.Toggles[170] = not HeroRotationCharDB.Toggles[170]
        m.Print(
            "WailingArrow Queue is now " ..
                (HeroRotationCharDB.Toggles[170] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if g:BuffUp(j(5384)) then
        return false
    end
    if g:IsCasting(O.RevivePet) then
        if p(O.PoolFocus) then
            a9 = 999999
            return "Pooling Focus"
        end
    end
    if
        i:IsActive() and select(2, GetStablePetInfo(N.Commons.SummonPetSlot)) ~= select(1, UnitName("pet")) and
            N.Commons.SummonPetSlot ~= 0 and
            not g:IsMoving() and
            not g:PrevGCD(1, O.DismissPet) and
            not g:IsCasting(O.DismissPet)
     then
        if p(O.DismissPet, nil) then
            a9 = 2641
            return "Dismiss Pet"
        end
    end
    if O.SummonPet:IsCastable() and not i:IsActive() and N.Commons.SummonPetSlot ~= 0 then
        if N.Commons.SummonPetSlot == 1 and not g:PrevGCD(1, P[N.Commons.SummonPetSlot]) then
            if p(P[N.Commons.SummonPetSlot], nil) then
                a9 = 883
                return "Summon Pet"
            end
        elseif N.Commons.SummonPetSlot == 2 and not g:PrevGCD(1, P[N.Commons.SummonPetSlot]) then
            if p(P[N.Commons.SummonPetSlot], nil) then
                a9 = 83242
                return "Summon Pet"
            end
        elseif N.Commons.SummonPetSlot == 3 and not g:PrevGCD(1, P[N.Commons.SummonPetSlot]) then
            if p(P[N.Commons.SummonPetSlot], nil) then
                a9 = 83243
                return "Summon Pet"
            end
        elseif N.Commons.SummonPetSlot == 4 and not g:PrevGCD(1, P[N.Commons.SummonPetSlot]) then
            if p(P[N.Commons.SummonPetSlot], nil) then
                a9 = 83244
                return "Summon Pet"
            end
        elseif N.Commons.SummonPetSlot == 5 and not g:PrevGCD(1, P[N.Commons.SummonPetSlot]) then
            if p(P[N.Commons.SummonPetSlot], nil) then
                a9 = 83245
                return "Summon Pet"
            end
        end
    end
    if
        (i:IsDeadOrGhost() or not UnitExists("pet")) and O.RevivePet:IsCastable() and not g:IsMoving() and
            N.Commons.SummonPetSlot ~= 0
     then
        if p(O.RevivePet, nil) then
            a9 = 982
            return "Revive Pet"
        end
    end
    local aN, aO, aF = GetSpellCooldown(34477)
    if g:AffectingCombat() and N.Commons.AutoMisdirect and not C then
        if
            aN + aO - GetTime() <= 0 and O.Misdirection:IsAvailable() and
                O.Misdirection:CooldownRemains(BypassRecovery) <= 0 and
                UnitExists("focus") and
                (UnitInParty("focus") or UnitInRaid("focus") or UnitIsUnit("focus", "pet")) and
                IsItemInRange(32698, "focus")
         then
            if m.Cast(O.Misdirection) then
                aa = 134477
                return "MD Focus"
            end
        end
    end
    if
        not i:IsDeadOrGhost() and UnitExists("pet") and O.MendPet:IsCastable() and
            i:HealthPercentage() <= N.Commons.MendPetHighHP and
            not g:PrevGCD(1, O.MendPet)
     then
        if p(O.MendPet) then
            a9 = 1982
            return "Mend Pet High Priority"
        end
    end
    if
        not g:AffectingCombat() and
            (u or
                N.BeastMastery.DBMSupport and
                    (O.BestialWrath:IsCastable() and I and m.BossMods:GetPullTimer() < Z and
                        m.BossMods:GetPullTimer() > 0 or
                        m.BossMods:GetPullTimer() < 0.5 and m.BossMods:GetPullTimer() > 0)) and
            L.TargetIsValid()
     then
        a8 = av()
        if a8 then
            return a8
        end
    end
    if L.TargetIsValid() and (g:AffectingCombat() or u) then
        if not h:AffectingCombat() and not h:IsDummy() and not h:NPCID() == 153285 and a3 >= 1 then
            a9 = 999
        end
        if not h:AffectingCombat() and not h:IsDummy() and not h:NPCID() == 153285 then
            if p(O.PoolFocus) then
                a9 = 999999
                return "Pooling Focus"
            end
        end
        if true then
            a8 = aw()
            if a8 then
                return a8
            end
        end
        if (N.Commons.Enabled.TopTrinket or N.Commons.Enabled.BottomTrinket) and o() then
            local a8 = ay()
            if a8 then
                return a8
            end
        end
        if a3 < 2 or not O.BeastCleave:IsAvailable() and a3 < 3 then
            local a8 = aC()
            if a8 then
                return a8
            end
        end
        if a3 > 2 or O.BeastCleave:IsAvailable() and a3 > 1 then
            local a8 = aB()
            if a8 then
                return a8
            end
        end
        if
            not i:IsDeadOrGhost() and UnitExists("pet") and O.MendPet:IsCastable() and
                i:HealthPercentage() <= N.Commons.MendPetLowHP
         then
            if p(O.MendPet) then
                a9 = 1982
                return "Mend Pet Low Priority (w/ Target)"
            end
        end
        if p(O.PoolFocus) then
            a9 = 999999
            return "Pooling Focus"
        end
    end
    if
        not i:IsDeadOrGhost() and UnitExists("pet") and O.MendPet:IsCastable() and
            i:HealthPercentage() <= N.Commons.MendPetLowHP
     then
        if p(O.MendPet) then
            a9 = 1982
            return "Mend Pet Low Priority (w/o Target)"
        end
    end
end
local function aP()
    d.Print(
        "BeastMastery can use pet abilities to better determine AoE, makes sure you have Growl and Blood Bolt / Bite / Claw / Smack in your player action bars."
    )
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        m.ToggleIconFrame:UpdateButtonText(6)
    end
end
function ReturnSpell1()
    if a9 == 0 then
        return 0
    else
        return a9
    end
end
function ReturnSpellMO1()
    if aa == 0 then
        return 0
    else
        return aa
    end
end
m.SetAPL(253, aE, aP)
