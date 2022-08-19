local e, e = ...
local e = HeroDBC.DBC
local b = HeroLib
local e = HeroCache
local k = b.Unit
local a = k.Player
local i = k.Target
local r = k.Pet
local f = b.Spell
local h = b.Item
local T = b.Action
local s = HeroRotation
local de = s.AoEON
local u = s.CDsON
local o = s.Cast
local e = s.CastSuggested
local m = HeroRotationCharDB.Toggles[4]
local g = HeroRotationCharDB.Toggles[5]
local Y = HeroRotationCharDB.Toggles[6]
local E = HeroRotationCharDB.Toggles[12]
local X = HeroRotationCharDB.Toggles[15]
local S = HeroRotationCharDB.Toggles[120]
local U = HeroRotationCharDB.Toggles[121]
local W = HeroRotationCharDB.Toggles[122]
local F = HeroRotationCharDB.Toggles[123]
local C = HeroRotationCharDB.Toggles[124]
local J = HeroRotationCharDB.Toggles[125]
local Q = HeroRotationCharDB.Toggles[142]
local x
local I
local l
local N
local B = { 355782, 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 343470, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426 }
local M = math.max
local e, H, e, e, G, e = _G, pairs, type, table, string, error
local j = s.Commons.Everyone
local e = s.Commons.Hunter
local n = { General = s.GUISettings.General, Commons = s.GUISettings.APL.Hunter.Commons, BeastMastery = s.GUISettings.APL.Hunter.BeastMastery }
local e = f.Hunter.BeastMastery
local y = { e.SummonPet, e.SummonPet2, e.SummonPet3, e.SummonPet4, e.SummonPet5 }
local w = h.Hunter.BeastMastery
local re = {  }
local t
local t = a:GetEquipment()
local d = h(0)
local c = h(0)
local K = GetInventoryItemID("player", 13)
local V = GetInventoryItemID("player", 14)
if t[13] then
    d = h(t[13])
end

if t[14] then
    c = h(t[14])
end

local q = a:HasLegendaryEquipped(254) or (a:HasUnity() and e.WildSpirits:IsAvailable())
local p = a:HasLegendaryEquipped(67)
local A = a:HasLegendaryEquipped(68)
local Z = a:HasLegendaryEquipped(72)
local D = a:HasLegendaryEquipped(255)
b:RegisterForEvent(function()
    t = a:GetEquipment()
    d = h(0)
    c = h(0)
    if t[13] then
        d = h(t[13])
    end

    if t[14] then
        c = h(t[14])
    end

    q = a:HasLegendaryEquipped(254) or (a:HasUnity() and e.WildSpirits:IsAvailable())
    p = a:HasLegendaryEquipped(67)
    A = a:HasLegendaryEquipped(68)
    Z = a:HasLegendaryEquipped(72)
    D = a:HasLegendaryEquipped(255)
end, "PLAYER_EQUIPMENT_CHANGED")
local v, t, z
local h, R
local O
local p
local d
local t = 0
local c = 0
local he = { { e.Intimidation, "Cast Intimidation (Interrupt)", function()
    return true
end } }
local function se()
    d = a:GCD() + .15
    if a:BuffUp(e.AspectoftheWildBuff) then
        d = M(.75, d - .2 / (1 + a:HastePct() / 100))
    end

end

function AreaTTD(e)
    local a = 0
    local t = 0
    local o = 40
    if e ~= nil then
        for i in H(e) do
            local e = e[i]
            if e:IsInRange(o) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) then
                local e = e:TimeToDie()
                t = t + 1
                a = e + a
            end

        end

    end

    if t == 0 then
        return 0
    end

    return a / t
end

local function _(e)
    return e ~= 0
end

local function P(e)
    local t = 0
    if e ~= nil then
        for a in H(e) do
            local e = e[a]
            if e:IsInRange(40) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) and e:DebuffUp(f(257284)) then
                t = t + 1
            end

        end

    end

    return t
end

local function L(o)
    local t = r:BuffRemains(o)
        if o == e.FrenzyPetBuff then
        if a:IsPrevCastPending() then
            t = r:BuffRemains(e.FrenzyPetBuff) + (GetTime() - a:GCDStartTime())
        end

    elseif o == e.BeastCleavePetBuff then
        if a:IsPrevCastPending() then
            t = (M(r:BuffRemains(e.BeastCleavePetBuff), a:BuffRemains(e.BeastCleaveBuff))) + (GetTime() - a:GCDStartTime())
        end

    end

    return t
end

local function M(t)
    return t:DebuffRemains(e.BarbedShot)
end

local function ee(e)
    return i:GetEnemiesInSplashRangeCount(15)
end

local function ee(e)
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) and e:GUID() == k("mouseover"):GUID()) then
        c = 12643
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and e:GUID() ~= i:GUID() and not E) then
        c = 999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) and e:GUID() == i:GUID()) then
        t = 2643
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) then
        return true
    end

end

local function te(o)
                if (((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= d) or (a:BuffUp(e.WildSpiritsBuff) and e.BarbedShot:ChargesFractional() > 1.4 and q)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == k("mouseover"):GUID()) then
        c = 1217200
        return true
    elseif (((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= d) or (a:BuffUp(e.WildSpiritsBuff) and e.BarbedShot:ChargesFractional() > 1.4 and q)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not E) then
        c = 999
        return true
    elseif (((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= d) or (a:BuffUp(e.WildSpiritsBuff) and e.BarbedShot:ChargesFractional() > 1.4 and q)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) and o:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif ((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= d) or (a:BuffUp(e.WildSpiritsBuff) and e.BarbedShot:ChargesFractional() > 1.4 and q)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285) then
        return true
    end

end

local function ee(a)
                if (((e.BarbedShot:FullRechargeTime() < d and (_(e.BestialWrath:CooldownRemains() or not l))) or (e.BestialWrath:CooldownRemains() < 12 + d and e.ScentOfBlood:IsAvailable())) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == k("mouseover"):GUID()) then
        c = 1217200
        return true
    elseif (((e.BarbedShot:FullRechargeTime() < d and (_(e.BestialWrath:CooldownRemains() or not l))) or (e.BestialWrath:CooldownRemains() < 12 + d and e.ScentOfBlood:IsAvailable())) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not E) then
        c = 999
        return true
    elseif (((e.BarbedShot:FullRechargeTime() < d and (_(e.BestialWrath:CooldownRemains() or not l))) or (e.BestialWrath:CooldownRemains() < 12 + d and e.ScentOfBlood:IsAvailable())) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif ((e.BarbedShot:FullRechargeTime() < d and (_(e.BestialWrath:CooldownRemains() or not l))) or (e.BestialWrath:CooldownRemains() < 12 + d and e.ScentOfBlood:IsAvailable())) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function ne(a)
                if ((a:TimeToDie() < 9 and e.Bloodletting:ConduitEnabled()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == k("mouseover"):GUID()) then
        c = 1217200
        return true
    elseif ((a:TimeToDie() < 9 and e.Bloodletting:ConduitEnabled()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and n.BeastMastery.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and not E) then
        c = 999
        return true
    elseif ((a:TimeToDie() < 9 and e.Bloodletting:ConduitEnabled()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == i:GUID()) then
        t = 217200
        return true
    elseif (a:TimeToDie() < 9 and e.Bloodletting:ConduitEnabled()) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) then
        return true
    end

end

local function ie()
    if j.TargetIsValid() and h then
        if f(257284):IsCastable() and f(339264):ConduitEnabled() and i:DebuffDown(f(257284)) and P(v) <= 0 and (UnitName("target") == "Nalthor the Rimebinder" or UnitName("target") == "Tirnenn Villager" or UnitName("target") == "Drust Boughbreaker" or UnitName("target") == "Ingra Maloch" or UnitName("target") == "Mistveil Stalker" or UnitName("target") == "Mistcaller" or UnitName("target") == "Blightbone" or UnitName("target") == "Rotspew" or UnitName("target") == "Amarth" or UnitName("target") == "Surgeon Stitchflesh" or UnitName("target") == "Lubricator" or UnitName("target") == "Tred'ova" or UnitName("target") == "Azules" or UnitName("target") == "Ventunax" or UnitName("target") == "Oryphion" or UnitName("target") == "Astronos" or UnitName("target") == "Lakesis" or UnitName("target") == "Klotos" or UnitName("target") == "Devos" or UnitName("target") == "Halkias" or UnitName("target") == "High Adjudicator Aleez" or UnitName("target") == "Wo Drifter" or UnitName("target") == "Lord Chamberlain" or UnitName("target") == "Enraged Spirit" or UnitName("target") == "Hakkar The Soulflayer" or UnitName("target") == "Sentient Oil" or UnitName("target") == "Millhouse Manastorm" or UnitName("target") == "Millificent Manastorm" or UnitName("target") == "Dealer Xy’exa" or UnitName("target") == "Mueh'zala" or UnitName("target") == "Fungi Stormer" or UnitName("target") == "Globgrog" or UnitName("target") == "Slime Tentacle" or UnitName("target") == "Virulax Blightweaver" or UnitName("target") == "Doctor Ickus" or UnitName("target") == "Domina Venomblade" or UnitName("target") == "Margrave Stradama" or UnitName("target") == "Dreadful Huntmaster" or UnitName("target") == "Insatiable Brute" or UnitName("target") == "Kryxis the Voracious" or UnitName("target") == "Grand Overseer" or UnitName("target") == "Research Scribe" or UnitName("target") == "Executor Tarvold" or UnitName("target") == "Grand Proctor Beryllia" or UnitName("target") == "General Kaal" or UnitName("target") == "Paceran the Virulent" or UnitName("target") == "Shard of Halkias" or UnitName("target") == "Shambling Arbalest" or UnitName("target") == "Nekthara the Mangler" or UnitName("target") == "Harugia the Bloodthirtsy" or UnitName("target") == "Heavin the Breaker" or UnitName("target") == "Echelon" or UnitName("target") == "Advent Nevermore" or UnitName("target") == "Xav the Unfallen" or UnitName("target") == "Portal Guardian" or UnitName("target") == "Kul'Tharok" or UnitName("target") == "Gorechop" or UnitName("target") == "Mordretha, the Endless Empress" or UnitName("target") == "Gatewarden Zo'mazz" or UnitName("target") == "Zophex" or UnitName("target") == "Alcruux" or UnitName("target") == "Achillite" or UnitName("target") == "Venza Goldfuse" or UnitName("target") == "Zo'gron" or UnitName("target") == "P.O.S.T Master" or UnitName("target") == "So'azmi" or UnitName("target") == "Portalmancer Zo'dahh" or (IsInRaid() and UnitName("boss1") == UnitName("boss1"))) then
            if o(e.HuntersMark, nil) then
                t = 257284
                return "HuntersMark M+"
            end

        end

        if e.BestialWrath:IsCastable() and l and UnitExists("pet") then
            if o(e.BestialWrath, nil) then
                t = 19574
                return "Bestial Wrath (PreCombat)"
            end

        end

        if e.BarbedShot:IsCastable() and e.BarbedShot:Charges() >= 2 then
            if o(e.BarbedShot) then
                t = 217200
                return "Barbed Shot (PreCombat)"
            end

        end

        if e.KillShot:IsCastable() and (i:HealthPercentage() <= 20 or a:BuffUp(e.FlayersMark)) then
            if o(e.KillShot) then
                t = 53351
                return "Kill Shot (PreCombat)"
            end

        end

        if e.KillCommand:IsCastable() and UnitExists("pet") and O then
            if o(e.KillCommand) then
                t = 34026
                return "Kill Command (PreCombat)"
            end

        end

        if z > 1 then
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

local function ae()
    if e.AncestralCall:IsCastable() and u() and (e.BestialWrath:CooldownRemains() > 30 or not l) then
        if o(e.AncestralCall, nil) then
            t = 274738
            return "Ancestral Call"
        end

    end

    if e.Fireblood:IsCastable() and u() and (e.BestialWrath:CooldownRemains() > 30 or not l) then
        if o(e.Fireblood, nil) then
            t = 265221
            return "Fireblood"
        end

    end

    if e.Berserking:IsCastable() and u() and (a:BuffUp(e.AspectoftheWildBuff) and (i:TimeToDie() > 180 + e.BerserkingBuff:BaseDuration() or (i:HealthPercentage() < 35 or not e.KillerInstinct:IsAvailable())) or i:TimeToDie() < 13) then
        if o(e.Berserking, nil) then
            t = 26297
            return "Berserking"
        end

    end

    if e.BloodFury:IsCastable() and u() and (a:BuffUp(e.AspectoftheWildBuff) and (i:TimeToDie() > 120 + e.BloodFuryBuff:BaseDuration() or (i:HealthPercentage() < 35 or not e.KillerInstinct:IsAvailable())) or i:TimeToDie() < 16) then
        if o(e.BloodFury, nil) then
            t = 20572
            return "Blood Fury"
        end

    end

    if e.LightsJudgment:IsCastable() and u() and (L(e.FrenzyPetBuff) > d or r:BuffDown(e.FrenzyPetBuff)) then
        if o(e.LightsJudgment, nil, nil, 40) then
            t = 255647
            return "Light's Judgment"
        end

    end

    if n.Commons.Enabled.Potions and w.PotionOfSpectralAgility:IsReady() and X and (((a:BuffUp(e.AspectoftheWildBuff) or i:TimeToDie() < 26) and not s.GUISettings.General.HoldPotforBL) or (a:BloodlustUp() and s.GUISettings.General.HoldPotforBL)) then
        if o(w.PotionOfSpectralAgility, nil) then
            t = 50
            return "Potion of Spectral Agility"
        end

    end

end

local function oe()
    if x and e.AspectoftheWild:IsCastable() and UnitExists("pet") and i:IsInMeleeRange(40) then
        if o(e.AspectoftheWild, nil) then
            t = 193530
            return "Aspect of the Wild (Cleave)"
        end

    end

    if e.BarbedShot:IsCastable() then
        if j.CastTargetIf(e.BarbedShot, v, "min", M, te) then
            return "Barbed Shot (Cleave - 1)"
        end

        if ((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= d) or (a:BuffUp(e.WildSpiritsBuff) and e.BarbedShot:ChargesFractional() > 1.4 and q)) then
            if o(e.BarbedShot, nil, nil, not h) then
                t = 217200
                return "Barbed Shot (Cleave - 1@Target)"
            end

        end

    end

    if e.MultiShot:IsReady() and (d - L(e.BeastCleavePetBuff) > .25) then
        if o(e.MultiShot, nil, nil, not h) then
            t = 2643
            return "Multi-Shot (Cleave - 1)"
        end

    end

    if e.KillShot:IsCastable() and (i:HealthPercentage() <= 20 or a:BuffUp(e.FlayersMark)) and (D and a:BuffUp(e.FlayersMarkBuff)) then
        if o(e.KillShot, nil, nil, not h) then
            t = 53351
            return "Kill Shot (Cleave) 8"
        end

    end

    if e.FlayedShot:IsCastable() and m and (D) then
        if o(e.FlayedShot, nil, nil) then
            t = 324149
            return "flayed_shot cleave 10"
        end

    end

    if e.TarTrap:IsCastable() and (A and e.Flare:CooldownRemains() < a:GCD()) then
        if o(e.TarTrap, nil, nil, not i:IsInRange(40)) then
            t = 187698
            return "tar_trap st 4"
        end

    end

    if e.Flare:IsCastable() and not e.TarTrap:CooldownUp() and A then
        if o(e.Flare, nil) then
            t = 1543
            return "flare st 5"
        end

    end

    if m and e.DeathChakram:IsCastable() and (a:Focus() + a:FocusCastRegen(e.DeathChakram:ExecuteTime()) < a:FocusMax()) then
        if o(e.DeathChakram, nil, nil) then
            t = 325028
            return "death_chakram st"
        end

    end

    if m and e.WildSpirits:IsCastable() then
        if o(e.WildSpirits, nil, nil) then
            t = 328231
            return "wild_spirits st"
        end

    end

    if e.BarbedShot:IsCastable() then
        if j.CastTargetIf(e.BarbedShot, v, "min", M, ee) then
            return "Barbed Shot (Cleave - 2)"
        end

        if ((e.BarbedShot:FullRechargeTime() < d and (_(e.BestialWrath:CooldownRemains() or not l))) or (e.BestialWrath:CooldownRemains() < 12 + d and e.ScentOfBlood:IsAvailable())) then
            if o(e.BarbedShot, nil, nil, not h) then
                t = 217200
                return "Barbed Shot (Cleave - 2@Target)"
            end

        end

    end

    if e.BestialWrath:IsCastable() and UnitExists("pet") and l then
        if o(e.BestialWrath, nil) then
            t = 19574
            return "Bestial Wrath (Cleave)"
        end

    end

    if e.ResonatingArrow:IsCastable() and m then
        if o(e.ResonatingArrow, nil, nil) then
            t = 308491
            return "resonating_arrow cleave"
        end

    end

    if e.Stampede:IsCastable() and I and (a:BuffUp(e.AspectoftheWildBuff) or i:TimeToDie() < 15 or not x) then
        if o(e.Stampede, nil, nil, not R) then
            t = 201430
            return "Stampede (Cleave)"
        end

    end

    if e.WailingArrow:IsReady() and g and not a:IsMoving() and i:IsInMeleeRange(40) and (r:BuffRemains(e.FrenzyPetBuff) > e.WailingArrow:ExecuteTime()) then
        if o(e.WailingArrow, nil, nil, not h) then
            t = 355589
            return "Wailing Arrow (Cleave)"
        end

    end

    if e.FlayedShot:IsCastable() and m then
        if o(e.FlayedShot, nil, nil) then
            t = 324149
            return "flayed_shot cleave"
        end

    end

    if e.KillShot:IsCastable() and (i:HealthPercentage() <= 20 or a:BuffUp(e.FlayersMark)) then
        if o(e.KillShot, nil, nil, not h) then
            t = 53351
            return "Kill Shot (Cleave)"
        end

    end

    if e.ChimaeraShot:IsCastable() then
        if o(e.ChimaeraShot, nil, nil, not h) then
            t = 53209
            return "Chimaera Shot (Cleave)"
        end

    end

    if N and e.Bloodshed:IsCastable() then
        if o(e.Bloodshed, nil) then
            t = 321530
            return "Bloodshed (ST)"
        end

    end

    if e.AMurderofCrows:IsReady() then
        if o(e.AMurderofCrows, nil, nil, not h) then
            t = 131894
            return "A Murder of Crows (Cleave)"
        end

    end

    if e.Barrage:IsReady() and L(e.BeastCleavePetBuff) > e.Barrage:ExecuteTime() then
        if o(e.Barrage, nil, nil, not h) then
            t = 120360
            return "Barrage (Cleave)"
        end

    end

    if e.KillCommand:IsReady() and UnitExists("pet") and O and (a:Focus() > e.KillCommand:Cost() + e.MultiShot:Cost()) then
        if o(e.KillCommand) then
            t = 34026
            return "Kill Command (Cleave)"
        end

    end

    if e.BagofTricks:IsCastable() and (a:BuffDown(e.BestialWrathBuff) or i:TimeToDie() < 5) then
        if o(e.BagofTricks, nil, nil, not h) then
            t = 312411
            return "Bag of Tricks (ST)"
        end

    end

    if e.DireBeast:IsReady() then
        if o(e.DireBeast, nil, nil, not h) then
            t = 120679
            return "Dire Beast (Cleave)"
        end

    end

    if e.BarbedShot:IsCastable() then
        if j.CastTargetIf(e.BarbedShot, v, "min", M, ne) then
            return "Barbed Shot (Cleave - 3)"
        end

        if (i:TimeToDie() < 9 and e.Bloodletting:ConduitEnabled()) then
            if o(e.BarbedShot, nil, nil, not h) then
                t = 217200
                return "Barbed Shot (Cleave - 3@Target)"
            end

        end

    end

    if e.CobraShot:IsCastable() and a:FocusTimeToMaxPredicted() < d then
        if o(e.CobraShot) then
            t = 193455
            return "Cobra-Shot (Cleave)"
        end

    end

    if e.ArcaneTorrent:IsCastable() and u() and ((a:Focus() + a:FocusRegen() + 30) < a:FocusMax()) then
        if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
            t = 155145
            return "arcane_torrent cleave 56"
        end

    end

end

local function k()
    if x and e.AspectoftheWild:IsCastable() and UnitExists("pet") and i:IsInMeleeRange(40) and (CovenantID ~= 3 or e.WildSpirits:CooldownRemains() > 20) then
        if o(e.AspectoftheWild, nil) then
            t = 193530
            return "Aspect of the Wild (ST)"
        end

    end

    if e.BarbedShot:IsCastable() and ((r:BuffUp(e.FrenzyPetBuff) and r:BuffRemains(e.FrenzyPetBuff) <= d) or (a:BuffUp(e.WildSpiritsBuff) and e.BarbedShot:ChargesFractional() > 1.4 and q)) then
        if o(e.BarbedShot, nil, nil, not h) then
            t = 217200
            return "Barbed Shot (ST - 1)"
        end

    end

    if e.TarTrap:IsCastable() and (A and i:BuffDown(e.SoulforgeEmbersDebuff) and e.Flare:CooldownRemains() < a:GCD()) then
        if o(e.TarTrap, nil, nil, not i:IsInRange(40)) then
            t = 187698
            return "tar_trap st 4"
        end

    end

    if e.Flare:IsCastable() and not e.TarTrap:CooldownUp() and A then
        if o(e.Flare, nil) then
            t = 1543
            return "flare st 5"
        end

    end

    if N and e.Bloodshed:IsCastable() then
        if o(e.Bloodshed, nil) then
            t = 321530
            return "Bloodshed (ST)"
        end

    end

    if g and not a:IsMoving() and i:IsInMeleeRange(40) and e.WailingArrow:IsReady() and (a:Covenant() == "Night Fae") then
        if o(e.WailingArrow, nil, nil, not h) then
            t = 355589
            return "Wailing Arrow (ST)"
        end

    end

    if m and e.WildSpirits:IsCastable() then
        if o(e.WildSpirits, nil, nil) then
            t = 328231
            return "wild_spirits st"
        end

    end

    if m and e.FlayedShot:IsCastable() then
        if o(e.FlayedShot, nil, nil) then
            t = 324149
            return "flayed_shot st"
        end

    end

    if e.KillShot:IsCastable() and (i:HealthPercentage() <= 20 or a:BuffUp(e.FlayersMark)) then
        if o(e.KillShot, nil, nil, not h) then
            t = 53351
            return "Kill Shot (ST)"
        end

    end

    if g and not a:IsMoving() and i:IsInMeleeRange(40) and e.WailingArrow:IsReady() and ((r:BuffRemains(e.FrenzyPetBuff) > e.WailingArrow:ExecuteTime() and ((e.ResonatingArrow:CooldownRemains() < a:GCD() and (not e.ExplosiveShot:IsAvailable() or a:BloodlustUp())) or CovenantID ~= 1)) or i:TimeToDie() < 5) then
        if o(e.WailingArrow, nil, nil, not h) then
            t = 355589
            return "Wailing Arrow (ST)"
        end

    end

    if e.BarbedShot:IsCastable() and ((e.BestialWrath:CooldownRemains() < ((12 * e.BarbedShot:ChargesFractional()) + d) and e.ScentOfBlood:IsAvailable()) or (e.BarbedShot:FullRechargeTime() < d and ((_(e.BestialWrath:CooldownRemains() or not l) or not l))) or i:TimeToDie() < 9) then
        if o(e.BarbedShot, nil, nil, not h) then
            t = 217200
            return "Barbed Shot (ST - 1)"
        end

    end

    if m and e.DeathChakram:IsCastable() and (a:Focus() + a:FocusCastRegen(e.DeathChakram:ExecuteTime()) < a:FocusMax()) then
        if o(e.DeathChakram, nil, nil) then
            t = 325028
            return "death_chakram st"
        end

    end

    if e.Stampede:IsCastable() and I and (((a:BuffUp(e.AspectoftheWildBuff) or not x) and (a:BuffUp(e.BestialWrathBuff) or not l)) or i:TimeToDie() < 15) then
        if o(e.Stampede, nil, nil, not R) then
            t = 201430
            return "Stampede (ST)"
        end

    end

    if e.AMurderofCrows:IsReady() then
        if o(e.AMurderofCrows, nil, nil, not h) then
            t = 131894
            return "A Murder of Crows (ST)"
        end

    end

    if m and e.ResonatingArrow:IsCastable() and (a:BuffUp(e.BestialWrathBuff) or not l or i:TimeToDie() < 10) then
        if o(e.ResonatingArrow, nil, nil) then
            t = 308491
            return "resonating_arrow st"
        end

    end

    if l and UnitExists("pet") and e.BestialWrath:IsCastable() and ((not e.WildSpirits:IsAvailable() or e.WildSpirits:CooldownRemains() > 15 or not m) or (CovenantID == 1 and (e.ResonatingArrow:CooldownRemains() < 5 or e.ResonatingArrow:CooldownRemains() > 20 or not m)) or (i:TimeToDie() < 15) or (CovenantID ~= 3 and CovenantID ~= 1)) then
        if o(e.BestialWrath, nil) then
            t = 19574
            return "Bestial Wrath (ST)"
        end

    end

    if e.ChimaeraShot:IsCastable() then
        if o(e.ChimaeraShot, nil, nil, not h) then
            t = 53209
            return "Chimaera Shot (ST)"
        end

    end

    if e.KillCommand:IsReady() and UnitExists("pet") and O then
        if o(e.KillCommand) then
            t = 34026
            return "Kill Command (ST)"
        end

    end

    if e.BagofTricks:IsCastable() and (a:BuffDown(e.BestialWrathBuff) or i:TimeToDie() < 5) then
        if o(e.BagofTricks, nil, nil, not h) then
            t = 312411
            return "Bag of Tricks (ST)"
        end

    end

    if e.DireBeast:IsReady() then
        if o(e.DireBeast, nil, nil, not h) then
            t = 120679
            return "Dire Beast (ST)"
        end

    end

    if e.CobraShot:IsReady() and (((a:Focus() - e.CobraShot:Cost() + a:FocusRegen() * (e.KillCommand:CooldownRemains() - 1) > e.KillCommand:Cost()) or (e.KillCommand:CooldownRemains() > 1 + d)) or ((a:BuffUp(e.BestialWrathBuff) or a:BuffUp(e.NesingwarysTrappingApparatusBuff)) and not Z) or i:TimeToDie() < 3) then
        if o(e.CobraShot, nil, nil, not h) then
            t = 193455
            return "Cobra Shot (ST)"
        end

    end

    if e.BarbedShot:IsCastable() and (a:BuffUp(e.WildSpiritsBuff) or e.BarbedShot:ChargesFractional() > 1.2 and e.Bloodletting:ConduitEnabled()) then
        if o(e.BarbedShot, nil, nil, not h) then
            t = 217200
            return "Barbed Shot (ST - 3)"
        end

    end

    if e.ArcaneTorrent:IsCastable() and u() and ((a:Focus() + a:FocusRegen() + 15) < a:FocusMax()) then
        if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
            t = 155145
            return "arcane_torrent st 50"
        end

    end

end

local function q()
    local e = a:GetUseableTrinkets(re)
    if e then
        if o(e, nil, nil) then
                        if e:ID() == K and n.Commons.Enabled.TopTrinket then
                t = 24
                return "Generic use_items for " .. e:Name()
            elseif e:ID() == V and n.Commons.Enabled.BottomTrinket then
                t = 30
                return "Generic use_items for " .. e:Name()
            end

        end

    end

end

local function _()
    Y = HeroRotationCharDB.Toggles[6]
    m = HeroRotationCharDB.Toggles[4]
    g = HeroRotationCharDB.Toggles[5] or u()
    E = HeroRotationCharDB.Toggles[12]
    X = HeroRotationCharDB.Toggles[15]
    S = HeroRotationCharDB.Toggles[120]
    U = HeroRotationCharDB.Toggles[121]
    W = HeroRotationCharDB.Toggles[122]
    F = HeroRotationCharDB.Toggles[123]
    C = HeroRotationCharDB.Toggles[124]
    J = HeroRotationCharDB.Toggles[125]
    Q = HeroRotationCharDB.Toggles[142]
    x = false
    I = false
    l = false
    N = false
    if ((n.BeastMastery.AspectoftheWild == "CDs" and u()) or (n.BeastMastery.AspectoftheWild == "Small CDs" and (u() or g)) or (n.BeastMastery.AspectoftheWild == "Always")) then
        x = true
    end

    if ((n.BeastMastery.Stampede == "CDs" and u()) or (n.BeastMastery.Stampede == "Small CDs" and (u() or g)) or (n.BeastMastery.Stampede == "Always")) then
        I = true
    end

    if ((n.BeastMastery.BestialWrathCD == "CDs" and u()) or (n.BeastMastery.BestialWrathCD == "Small CDs" and (u() or g)) or (n.BeastMastery.BestialWrathCD == "Always")) and ((not a:IsInDungeonArea()) or (a:IsInDungeonArea() and AreaTTD(v) >= 15)) then
        l = true
    end

    if ((n.BeastMastery.Bloodshed == "CDs" and u()) or (n.BeastMastery.Bloodshed == "Small CDs" and (u() or g)) or (n.BeastMastery.Bloodshed == "Always")) then
        N = true
    end

    K = GetInventoryItemID("player", 13)
    V = GetInventoryItemID("player", 14)
end

local function g()
    if e.Stomp:IsAvailable() then
        b.SplashEnemies.ChangeFriendTargetsTracking("Mine Only")
    else
        b.SplashEnemies.ChangeFriendTargetsTracking("All")
    end

    local m, m = GetInventoryItemID("player", 13)
    local m, m = GetInventoryItemID("player", 14)
    se()
    if c > 0 then
        c = 0
    end

    if t > 0 then
        t = 0
    end

    local b = (e.BloodBolt:IsPetKnown() and T.FindBySpellID(e.BloodBolt:ID()) and e.BloodBolt) or (e.Bite:IsPetKnown() and T.FindBySpellID(e.Bite:ID()) and e.Bite) or (e.Claw:IsPetKnown() and T.FindBySpellID(e.Claw:ID()) and e.Claw) or (e.Smack:IsPetKnown() and T.FindBySpellID(e.Smack:ID()) and e.Smack) or nil
    local m = (e.Growl:IsPetKnown() and T.FindBySpellID(e.Growl:ID()) and e.Growl) or nil
    if de() then
        v = a:GetEnemiesInRange(40)
        z = (b and #a:GetEnemiesInSpellActionRange(b)) or i:GetEnemiesInSplashRangeCount(8)
    else
        v = {  }
        z = 0
    end

    h = i:IsInRange(40)
    R = i:IsInRange(30)
    O = (m and i:IsSpellInActionRange(m)) or (not m and i:IsInRange(30))
    _()
    if s.QueuedCast() then
        t = s.QueuedCast()
        return "Custom Queue " .. f(t):ID()
    end

    if e.Exhilaration:IsCastable() and a:HealthPercentage() <= n.Commons.ExhilarationHP then
        if o(e.Exhilaration, nil) then
            t = 109304
            return "Exhilaration"
        end

    end

    if a:HealthPercentage() < n.Commons.HealthstoneHP and w.Healthstone:IsReady() and w.Healthstone:CooldownRemains() <= 0 then
        if s.Cast(w.Healthstone, nil) then
            t = 40
            return "Healthstone HP"
        end

    end

    if a:HealthPercentage() < n.Commons.HealPotHP and w.CosmicHealPot:IsReady() and w.CosmicHealPot:CooldownRemains() <= 0 then
        if s.Cast(w.CosmicHealPot, nil) then
            t = 45
            return "CosmicHealPot HP"
        end

    end

    if a:HealthPercentage() < n.Commons.HealPotHP and w.HealPot:IsReady() and w.HealPot:CooldownRemains() <= 0 then
        if s.Cast(w.HealPot, nil) then
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

    if a:BuffUp(f(5384)) then
        return false
    end

    if UnitExists("mouseover") and G.find(UnitGUID("mouseover"), 120651) then
        if e.CobraShot:IsCastable() and h then
            if o(e.CobraShot, nil) then
                c = 1193455
                return "explosive MO SWD"
            end

        end

    end

    if UnitExists("target") and G.find(UnitGUID("target"), 120651) then
        if e.CobraShot:IsCastable() and h then
            if o(e.CobraShot, nil) then
                t = 193455
                return "explosive  SWD"
            end

        end

    end

    B = { 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 195181, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426 }
    if UnitExists("target") and e.TranqualizingShot:IsCastable() and not Q then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true and e.TranqualizingShot:IsCastable() and e.TranqualizingShot:CooldownRemains(BypassRecovery) <= 0 then
            for a = 0, 40 do
                local o, o, o, o, o, o, o, o, o, a = UnitBuff("target", a)
                for i, o in H(B) do
                    if o == a then
                        if s.Cast(e.TranqualizingShot, nil) then
                            t = 19801
                            return "Tranq Enrage"
                        end

                    end

                end

            end

        end

    end

        if s.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (s.GUISettings.General.OpenerReset)
    elseif s.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        s.ToggleIconFrame:UpdateButtonText(6)
        s.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (S and e.Bindingshot:IsAvailable() and e.Bindingshot:CooldownRemains(BypassRecovery) <= 0) then
        if s.Cast(e.Bindingshot, nil, nil, nil) then
            t = 109248
            return "queue Binding Shot"
        end

    elseif ((not e.Bindingshot:IsUsableP() or e.Bindingshot:CooldownRemains() > 0) and S) then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
        s.Print("Binding Shot Queue is now " .. (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (U and e.FreezingTrap:IsAvailable() and e.FreezingTrap:CooldownRemains(BypassRecovery) <= 0) then
        if s.Cast(e.FreezingTrap, nil, nil, nil) then
            t = 187650
            return "queue Freezing Trap"
        end

    elseif ((not e.FreezingTrap:IsUsableP() or e.FreezingTrap:CooldownRemains() > 0) and U) then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
        s.Print("Freezing Trap Queue is now " .. (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (W and e.Intimidation:IsAvailable() and e.Intimidation:CooldownRemains(BypassRecovery) <= 0) then
        if s.Cast(e.Intimidation, nil, nil, nil) then
            t = 19577
            return "queue Intimidation"
        end

    elseif ((not e.Intimidation:IsUsableP() or e.Intimidation:CooldownRemains() > 0) and W) then
        HeroRotationCharDB.Toggles[122] = not HeroRotationCharDB.Toggles[122]
        s.Print("Intimidation Queue is now " .. (HeroRotationCharDB.Toggles[122] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (F and e.Flare:IsAvailable() and e.Flare:CooldownRemains(BypassRecovery) <= 0) then
        if s.Cast(e.Flare, nil, nil, nil) then
            t = 1543
            return "queue Flare"
        end

    elseif ((not e.Flare:IsUsableP() or e.Flare:CooldownRemains() > 0) and F) then
        HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123]
        s.Print("Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (C and e.TarTrap:IsAvailable() and e.TarTrap:CooldownRemains(BypassRecovery) <= 0) then
        if s.Cast(e.TarTrap, nil, nil, nil) then
            t = 187698
            return "queue TarTrap"
        end

    elseif ((not e.TarTrap:IsUsableP() or e.TarTrap:CooldownRemains() > 0) and C) then
        HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124]
        s.Print("Tar Trap Queue is now " .. (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if a:BuffUp(f(5384)) then
        return false
    end

    if a:IsCasting(e.RevivePet) then
        if o(e.PoolFocus) then
            t = 999999
            return "Pooling Focus"
        end

    end

    if (r:IsActive() and select(2, GetStablePetInfo(n.Commons.SummonPetSlot)) ~= select(1, UnitName("pet"))) and n.Commons.SummonPetSlot ~= 0 and not a:IsMoving() and not a:PrevGCD(1, e.DismissPet) and not a:IsCasting(e.DismissPet) then
        if o(e.DismissPet, nil) then
            t = 2641
            return "Dismiss Pet"
        end

    end

    if e.SummonPet:IsCastable() and (not r:IsActive()) and n.Commons.SummonPetSlot ~= 0 then
                                        if n.Commons.SummonPetSlot == 1 and not a:PrevGCD(1, y[n.Commons.SummonPetSlot]) then
            if o(y[n.Commons.SummonPetSlot], nil) then
                t = 883
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 2 and not a:PrevGCD(1, y[n.Commons.SummonPetSlot]) then
            if o(y[n.Commons.SummonPetSlot], nil) then
                t = 83242
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 3 and not a:PrevGCD(1, y[n.Commons.SummonPetSlot]) then
            if o(y[n.Commons.SummonPetSlot], nil) then
                t = 83243
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 4 and not a:PrevGCD(1, y[n.Commons.SummonPetSlot]) then
            if o(y[n.Commons.SummonPetSlot], nil) then
                t = 83244
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 5 and not a:PrevGCD(1, y[n.Commons.SummonPetSlot]) then
            if o(y[n.Commons.SummonPetSlot], nil) then
                t = 83245
                return "Summon Pet"
            end

        end

    end

    if (r:IsDeadOrGhost() or not UnitExists("pet")) and e.RevivePet:IsCastable() and not a:IsMoving() and n.Commons.SummonPetSlot ~= 0 then
        if o(e.RevivePet, nil) then
            t = 982
            return "Revive Pet"
        end

    end

    local m, h, w = GetSpellCooldown(34477)
    if a:AffectingCombat() and n.Commons.AutoMisdirect and not J then
        if (m + h - GetTime()) <= 0 and e.Misdirection:IsAvailable() and e.Misdirection:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus") or UnitIsUnit("focus", "pet")) and IsItemInRange(32698, "focus") then
            if s.Cast(e.Misdirection) then
                c = 134477
                return "MD Focus"
            end

        end

    end

    if not r:IsDeadOrGhost() and UnitExists("pet") and e.MendPet:IsCastable() and r:HealthPercentage() <= n.Commons.MendPetHighHP and not a:PrevGCD(1, e.MendPet) then
        if o(e.MendPet) then
            t = 1982
            return "Mend Pet High Priority"
        end

    end

    if not a:AffectingCombat() and ((Y) or (n.BeastMastery.DBMSupport and ((e.BestialWrath:IsCastable() and l and s.BossMods:GetPullTimer() < d and s.BossMods:GetPullTimer() > 0) or s.BossMods:GetPullTimer() < .5 and s.BossMods:GetPullTimer() > 0))) and j.TargetIsValid() then
        p = ie()
        if p then
            return p
        end

    end

    if j.TargetIsValid() and (a:AffectingCombat() or Y) then
        if f(257284):IsCastable() and f(339264):ConduitEnabled() and i:DebuffDown(f(257284)) and (P(v) <= 0 or UnitName("target") == "Fleeting Manifestation") and (UnitName("target") == "Nalthor the Rimebinder" or UnitName("target") == "Tirnenn Villager" or UnitName("target") == "Drust Boughbreaker" or UnitName("target") == "Ingra Maloch" or UnitName("target") == "Mistveil Stalker" or UnitName("target") == "Mistcaller" or UnitName("target") == "Blightbone" or UnitName("target") == "Rotspew" or UnitName("target") == "Amarth" or UnitName("target") == "Surgeon Stitchflesh" or UnitName("target") == "Lubricator" or UnitName("target") == "Tred'ova" or UnitName("target") == "Azules" or UnitName("target") == "Ventunax" or UnitName("target") == "Oryphion" or UnitName("target") == "Astronos" or UnitName("target") == "Lakesis" or UnitName("target") == "Klotos" or UnitName("target") == "Devos" or UnitName("target") == "Halkias" or UnitName("target") == "High Adjudicator Aleez" or UnitName("target") == "Wo Drifter" or UnitName("target") == "Lord Chamberlain" or UnitName("target") == "Enraged Spirit" or UnitName("target") == "Hakkar The Soulflayer" or UnitName("target") == "Sentient Oil" or UnitName("target") == "Millhouse Manastorm" or UnitName("target") == "Millificent Manastorm" or UnitName("target") == "Dealer Xy’exa" or UnitName("target") == "Mueh'zala" or UnitName("target") == "Fungi Stormer" or UnitName("target") == "Globgrog" or UnitName("target") == "Slime Tentacle" or UnitName("target") == "Virulax Blightweaver" or UnitName("target") == "Doctor Ickus" or UnitName("target") == "Domina Venomblade" or UnitName("target") == "Margrave Stradama" or UnitName("target") == "Dreadful Huntmaster" or UnitName("target") == "Insatiable Brute" or UnitName("target") == "Kryxis the Voracious" or UnitName("target") == "Grand Overseer" or UnitName("target") == "Research Scribe" or UnitName("target") == "Executor Tarvold" or UnitName("target") == "Grand Proctor Beryllia" or UnitName("target") == "General Kaal" or UnitName("target") == "Paceran the Virulent" or UnitName("target") == "Shard of Halkias" or UnitName("target") == "Shambling Arbalest" or UnitName("target") == "Nekthara the Mangler" or UnitName("target") == "Harugia the Bloodthirtsy" or UnitName("target") == "Heavin the Breaker" or UnitName("target") == "Echelon" or UnitName("target") == "Advent Nevermore" or UnitName("target") == "Xav the Unfallen" or UnitName("target") == "Portal Guardian" or UnitName("target") == "Kul'Tharok" or UnitName("target") == "Gorechop" or UnitName("target") == "Mordretha, the Endless Empress" or UnitName("target") == "Gatewarden Zo'mazz" or UnitName("target") == "Zophex" or UnitName("target") == "Alcruux" or UnitName("target") == "Achillite" or UnitName("target") == "Venza Goldfuse" or UnitName("target") == "Zo'gron" or UnitName("target") == "P.O.S.T Master" or UnitName("target") == "So'azmi" or UnitName("target") == "Portalmancer Zo'dahh" or UnitName("target") == "4.RF-4.RF" or UnitName("target") == "Inquisitor Sigar" or UnitName("target") == "Fleeting Manifestation" or UnitName("target") == "Corpse Harvester" or UnitName("target") == "Zolramus Necromancer" or UnitName("target") == "Nar'zudah" or UnitName("target") == "Raging Bloodhorn" or UnitName("target") == "Harugia the Bloodthirsty" or UnitName("target") == "Portalmancer Zo'honn" or UnitName("target") == "Enraged Direhorn" or UnitName("target") == "Coastwalker Goliath" or UnitName("target") == "Adorned Starseer" or UnitName("target") == "Wandering Pulsar" or (IsInRaid() and UnitName("target") == UnitName("boss1"))) then
            if o(e.HuntersMark, nil) then
                t = 257284
                return "HuntersMark M+"
            end

        end

        p = j.Interrupt(40, e.CounterShot, nil, he)
        if p then
            t = 147362
            return p
        end

        if (not i:AffectingCombat() and not i:IsDummy() and not i:NPCID() == 153285) and z >= 1 then
            t = 999
        end

        if (not i:AffectingCombat() and not i:IsDummy() and not i:NPCID() == 153285) then
            if o(e.PoolFocus) then
                t = 999999
                return "Pooling Focus"
            end

        end

        if ((n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and u() and ((CovenantID == 1 and e.AspectoftheWild:CooldownDown() and e.ResonatingArrow:CooldownDown()) or (CovenantID ~= 1 and e.AspectoftheWild:CooldownRemains() > 0))) then
            local e = q()
            if e then
                return e
            end

        end

        if true then
            p = ae()
            if p then
                return p
            end

        end

        if (z < 2) then
            local e = k()
            if e then
                return e
            end

        end

        if (z > 1) then
            local e = oe()
            if e then
                return e
            end

        end

        if not r:IsDeadOrGhost() and UnitExists("pet") and e.MendPet:IsCastable() and r:HealthPercentage() <= n.Commons.MendPetLowHP then
            if o(e.MendPet) then
                t = 1982
                return "Mend Pet Low Priority (w/ Target)"
            end

        end

        if o(e.PoolFocus) then
            t = 999999
            return "Pooling Focus"
        end

    end

    if not r:IsDeadOrGhost() and UnitExists("pet") and e.MendPet:IsCastable() and r:HealthPercentage() <= n.Commons.MendPetLowHP then
        if o(e.MendPet) then
            t = 1982
            return "Mend Pet Low Priority (w/o Target)"
        end

    end

    if not e.RocketBarrage:IsCastable() and UnitRace("player") == "Goblin" and i:IsInMeleeRange(30) then
        if o(e.RocketBarrage) then
            t = 69041
            return "RocketBarrage"
        end

    end

end

local function e()
    b.Print("BeastMastery can use pet abilities to better determine AoE, makes sure you have Growl and Blood Bolt / Bite / Claw / Smack in your player action bars.")
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        s.ToggleIconFrame:UpdateButtonText(6)
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

s.SetAPL(253, g, e)

