local e, e = ...
local e = HeroDBC.DBC
local c = HeroLib
local e = HeroCache
local E = c.Unit
local t = E.Player
local o = E.Target
local e = E.Pet
local A = c.Spell
local e = c.MultiSpell
local a = c.Item
local n = HeroRotation
local i = n.Cast
local e = n.CastLeft
local s = n.CDsON
local H = n.AoEON
local e = n.CastSuggested
local d = HeroRotationCharDB.Toggles[4]
local y = HeroRotationCharDB.Toggles[5]
local O = HeroRotationCharDB.Toggles[6]
local M = HeroRotationCharDB.Toggles[15]
local B = HeroRotationCharDB.Toggles[12]
local F = HeroRotationCharDB.Toggles[60]
local S = HeroRotationCharDB.Toggles[100]
local e = false
local g = n.Commons.Mage
local W = math.max
local e = A.Mage.Frost
local h = a.Mage.Frost
local r = t:GetEquipment()
local u = a(0)
local l = a(0)
local _ = { h.ShadowedOrbofTorment:ID() }
local m = GetInventoryItemID("player", 13)
local w = GetInventoryItemID("player", 14)
if r[13] then
    u = a(r[13])
end

if r[14] then
    l = a(r[14])
end

local z, u, l
local q, j
local C
local v
local U
local a
local p = t:HasLegendaryEquipped(2)
local f = t:HasLegendaryEquipped(3)
local x = t:HasLegendaryEquipped(4)
local N = t:HasLegendaryEquipped(5)
local T = t:HasLegendaryEquipped(7)
local D = t:HasLegendaryEquipped(8)
local L = t:HasLegendaryEquipped(9)
local k = t:HasLegendaryEquipped(221) or (t:HasUnity() and e.Deathborne:IsAvailable())
local R = t:HasLegendaryEquipped(260) or (t:HasUnity() and e.ShiftingPower:IsAvailable())
local b = 0
local a = 0
local r = 0
local I = n.Commons.Everyone
local r = { General = n.GUISettings.General, Commons = n.GUISettings.APL.Mage.Commons, Frost = n.GUISettings.APL.Mage.Frost }
e.FrozenOrb:RegisterInFlightEffect(84721)
e.FrozenOrb:RegisterInFlight()
c:RegisterForEvent(function()
    e.FrozenOrb:RegisterInFlight()
end, "LEARNED_SPELL_IN_TAB")
e.Frostbolt:RegisterInFlightEffect(228597)
e.Frostbolt:RegisterInFlight()
e.Flurry:RegisterInFlightEffect(228354)
e.Flurry:RegisterInFlight()
e.IceLance:RegisterInFlightEffect(228598)
e.IceLance:RegisterInFlight()
c:RegisterForEvent(function()
    p = t:HasLegendaryEquipped(2)
    f = t:HasLegendaryEquipped(3)
    x = t:HasLegendaryEquipped(4)
    N = t:HasLegendaryEquipped(5)
    T = t:HasLegendaryEquipped(7)
    D = t:HasLegendaryEquipped(8)
    L = t:HasLegendaryEquipped(9)
    k = t:HasLegendaryEquipped(221) or (t:HasUnity() and e.Deathborne:IsAvailable())
    R = t:HasLegendaryEquipped(260) or (t:HasUnity() and e.ShiftingPower:IsAvailable())
end, "PLAYER_EQUIPMENT_CHANGED")
local D = t:CovenantID()
c:RegisterForEvent(function()
    D = t:CovenantID()
end, "COVENANT_CHOSEN")
local function D(e)
    if e then
        return 1
    else
        return 0
    end

end

local function D(e)
    return e ~= 0
end

local function D()
    return W(o:DebuffRemains(e.Frostbite), o:DebuffRemains(e.Freeze), o:DebuffRemains(e.FrostNova))
end

local function Y()
    local o = 1
    local a = 7
    local t = .2
    local t = o + (t * a)
    return W(t - e.CometStorm:TimeSinceLastCast(), 0)
end

local function W()
    if e.ArcaneIntellect:IsCastable() and t:BuffDown(e.ArcaneIntellect, true) then
        if i(e.ArcaneIntellect) then
            a = 1459
            return "arcane_intellect precombat 1"
        end

    end

    if e.SummonWaterElemental:IsCastable() then
        if i(e.SummonWaterElemental) then
            a = 31687
            return "summon_water_elemental precombat 2"
        end

    end

    if I.TargetIsValid() then
        if e.Fleshcraft:IsCastable() and d and not t:IsMoving() then
            if i(e.Fleshcraft, nil) then
                a = 324631
                return "fleshcraft precombat 5"
            end

        end

        if h.TomeofMonstruousConstructions:IsEquippedAndReady() and t:BuffDown(e.TomeofMonstruousConstructionsBuff) and not t:IsMoving() then
            if i(h.TomeofMonstruousConstructions, nil, nil) then
                                if h.TomeofMonstruousConstructions:ID() == m then
                    a = 24
                    return "tome_of_monstruous_constructions precombat 3 top"
                elseif h.TomeofMonstruousConstructions:ID() == w then
                    a = 30
                    return "tome_of_monstruous_constructions precombat 3 bot"
                end

            end

        end

        if h.ShadowedOrbofTorment:IsEquippedAndReady() and t:BuffDown(e.RuneofPowerBuff) and not t:IsMoving() then
            if i(h.ShadowedOrbofTorment, nil, nil) then
                                if h.ShadowedOrbofTorment:ID() == m then
                    a = 24
                    return "Orb of Torment 3 top"
                elseif h.ShadowedOrbofTorment:ID() == w then
                    a = 30
                    return "Orb of Torment 3 top"
                end

            end

        end

        if e.Frostbolt:IsCastable() and not t:IsCasting(e.Frostbolt) and not t:IsMoving() then
            if i(e.Frostbolt, nil, nil, not o:IsSpellInRange(e.Frostbolt)) then
                a = 116
                return "frostbolt precombat 5"
            end

        end

    end

end

local function P()
    if FrozenOrb:IsCastable() and not S and (y or s()) then
        if i(FrozenOrb, nil, nil, not o:IsInRange(40)) then
            a = 198149
            return "frozen_orb aoe 1"
        end

    end

    if e.Blizzard:IsCastable() and not t:IsMoving() and (t:BuffDown(e.Deathborne) or (not k) or t:BuffUp(e.FreezingRainBuff) or l >= 6) then
        if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
            a = 190356
            return "blizzard aoe 11"
        end

    end

    if e.Blizzard:IsCastable() and not t:IsMoving() and t:BuffUp(e.Deathborne) then
        if (l == 5 and (e.FreezingRain:IsAvailable() or e.BoneChilling:IsAvailable() or e.ShiveringCore:ConduitEnabled() or not f)) then
            if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
                a = 190356
                return "blizzard aoe 12"
            end

        end

        if (l == 4 and (e.FreezingRain:IsAvailable() or (e.BoneChilling:IsAvailable() and e.ShiveringCore:ConduitEnabled()) or ((not f) and not p))) then
            if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
                a = 190356
                return "blizzard aoe 22"
            end

        end

        if (l <= 3 and (not p) and (not f) and e.ShiveringCore:ConduitEnabled() and (e.FreezingRain:IsAvailable() or e.BoneChilling:IsAvailable())) then
            if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
                a = 190356
                return "blizzard aoe 32"
            end

        end

    end

    if e.Flurry:IsCastable() and (not t:IsMoving() or t:BuffUp(e.BrainFreezeBuff)) and (o:DebuffDown(e.WintersChillDebuff) and (t:IsCasting(e.Ebonbolt) or (t:BuffUp(e.BrainFreezeBuff) and (t:BuffDownP(e.FingersofFrostBuff) or (k and (t:PrevGCD(1, e.Frostbolt) or t:IsCasting(e.Frostbolt)) and (f or p) and t:BuffUp(e.Deathborne)))))) then
        if i(e.Flurry, nil, nil, not o:IsSpellInRange(e.Flurry)) then
            a = 44614
            return "flurry aoe 3"
        end

    end

    if e.IceNova:IsCastable() then
        if i(e.IceNova, nil, nil, not o:IsSpellInRange(e.IceNova)) then
            a = 157997
            return "ice_nova aoe 4"
        end

    end

    if e.CometStorm:IsCastable() and not (y or s) then
        if i(e.CometStorm, nil, nil, not o:IsSpellInRange(e.CometStorm)) then
            a = 153595
            return "comet_storm aoe 5"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (k and (f or p) and t:BuffRemains(e.Deathborne) > e.Frostbolt:CastTime() + e.Frostbolt:TravelTime()) then
        if i(e.Frostbolt, nil, nil, not o:IsSpellInRange(e.Frostbolt)) then
            a = 116
            return "frostbolt aoe 15"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (o:DebuffStack(e.WintersChillDebuff) == 1 and (Y() > e.IceLance:TravelTime() and e.CometStorm:IsAvailable())) then
        if i(e.Frostbolt, nil, nil, not o:IsSpellInRange(e.Frostbolt)) then
            a = 116
            return "frostbolt aoe 20"
        end

    end

    if e.IceLance:IsCastable() and (t:BuffUp(e.FingersofFrostBuff) or D() > e.IceLance:TravelTime() or (o:DebuffStack(e.WintersChillDebuff) >= 1 and o:DebuffRemains(e.WintersChillDebuff) > e.IceLance:TravelTime())) then
        if i(e.IceLance, nil, nil, not o:IsSpellInRange(e.IceLance)) then
            a = 30455
            return "ice_lance aoe 6"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and d and (e.CombatMeditation:SoulbindEnabled()) then
        if i(e.RadiantSpark, nil, nil, not o:IsSpellInRange(e.RadiantSpark)) then
            a = 307443
            return "radiant_spark aoe 7"
        end

    end

    if d then
        if e.MirrorsofTorment:IsCastable() and not t:IsMoving() and d then
            if i(e.MirrorsofTorment, nil, nil, not o:IsSpellInRange(e.MirrorsofTorment)) then
                a = 314793
                return "mirrors_of_torment aoe 8"
            end

        end

        if e.ShiftingPower:IsCastable() and not t:IsMoving() and d then
            if i(e.ShiftingPower, nil, nil, not o:IsInRange(18)) then
                a = 314791
                return "shifting_power aoe 9"
            end

        end

    end

    if e.FireBlast:IsCastable() and (T and v <= 0 and g.DC.Fire == 0) then
        if i(e.FireBlast) then
            a = 319836
            return "fire_blast aoe 11"
        end

    end

    if e.ArcaneExplosion:IsCastable() and (t:ManaPercentageP() > 30 and u >= 6 and not N) then
        if i(e.ArcaneExplosion) then
            a = 1449
            return "arcane_explosion aoe 12"
        end

    end

    if e.Ebonbolt:IsCastable() and not t:IsMoving() and (y or s()) and (u >= 2) then
        if i(e.Ebonbolt, nil, nil, not o:IsSpellInRange(e.Ebonbolt)) then
            a = 257537
            return "ebonbolt aoe 13"
        end

    end

    local n = 7 - e.Blizzard:TimeSinceLastCast()
    if n < 0 then
        n = 0
    end

    if e.IceLance:IsCastable() and (N and (e.SplittingIce:IsAvailable() or u >= 5) and e.IceLance:TravelTime() < n) then
        if i(e.IceLance, nil, nil, not o:IsSpellInRange(e.IceLance)) then
            a = 30455
            return "ice_lance aoe 14"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() then
        if i(e.Frostbolt, nil, nil, not o:IsSpellInRange(e.Frostbolt)) then
            a = 116
            return "frostbolt aoe 15"
        end

    end

    if e.IceLance:IsCastable() then
        if i(e.IceLance, nil, nil, not o:IsSpellInRange(e.IceLance)) then
            a = 30455
            return "ice_lance aoe 16"
        end

    end

end

local function V()
    if h.ShadowedOrbofTorment:IsEquippedAndReady() and t:BuffDown(e.RuneofPowerBuff) and not t:IsMoving() then
        if i(h.ShadowedOrbofTorment, nil, nil) then
                        if h.ShadowedOrbofTorment:ID() == m then
                a = 24
                return "Orb of Torment 3 top"
            elseif h.ShadowedOrbofTorment:ID() == w then
                a = 30
                return "Orb of Torment 3 top"
            end

        end

    end

    if h.PotionofSpectralIntellect:IsReady() and s() and r.Commons.Enabled.Potions and M and ((t:BloodlustUp() and n.GUISettings.General.HoldPotforBL) or ((t:PrevGCDP(1, e.IcyVeins) or FightRemains < 30) and not n.GUISettings.General.HoldPotforBL)) then
        if i(h.PotionofSpectralIntellect, nil, nil) then
            a = 50
            return "potion cd 2"
        end

    end

    if e.Deathborne:IsCastable() and d and not t:IsMoving() then
        if i(e.Deathborne, nil, nil) then
            a = 324220
            return "deathborne cd 3"
        end

    end

    if e.MirrorsofTorment:IsCastable() and d and not t:IsMoving() and (u < 3 and (e.SiphonedMalice:ConduitEnabled() or e.WastelandPropriety:SoulbindEnabled()) and t:BuffDown(e.BrainFreezeBuff)) then
        if i(e.MirrorsofTorment, nil, nil) then
            a = 314793
            return "mirrors_of_torment cd 4"
        end

    end

    if e.RuneofPower:IsCastable() and not t:IsMoving() and (y or s()) and not t:IsMoving() and (e.IcyVeins:CooldownRemains() > 12 and t:BuffDown(e.RuneofPowerBuff)) then
        if i(e.RuneofPower, nil) then
            a = 116011
            return "rune_of_power cd 5"
        end

    end

    if e.IcyVeins:IsCastable() and s() and (t:BuffDown(e.RuneofPowerBuff) and (t:BuffDown(e.IcyVeins) or e.RuneofPower:IsAvailable()) and (t:BuffDown(e.SlickIceBuff) or (e.IcyPropulsion:ConduitEnabled() and (e.CometStorm:IsAvailable() or t:HasTier(28, 2))) or u >= 2)) then
        if i(e.IcyVeins, nil) then
            a = 12472
            return "icy_veins cd 6"
        end

    end

    if e.TimeWarp:IsCastable() and s() and r.Frost.UseTemporalWarp and (L and t:BloodlustExhaustUp() and t:BloodlustDown() and (t:BuffUp(e.IcyVeins) or FightRemains < 40)) then
        if i(e.TimeWarp, nil) then
            a = 80353
            return "time_warp cd 7"
        end

    end

    if (r.Commons.Enabled.TopTrinket or r.Commons.Enabled.BotTrinket) and s() then
        local e = t:GetUseableTrinkets(_)
        if e then
            if i(e, nil, nil) then
                                if e:ID() == m and r.Commons.Enabled.TopTrinket then
                    a = 24
                    return "top trinket 1"
                elseif e:ID() == w and r.Commons.Enabled.BotTrinket then
                    a = 30
                    return "top trinket 2"
                end

            end

        end

    end

    if e.BloodFury:IsCastable() and s() then
        if i(e.BloodFury, nil) then
            a = 20572
            return "blood_fury cd 9"
        end

    end

    if e.Berserking:IsCastable() and s() then
        if i(e.Berserking, nil) then
            a = 26297
            return "berserking cd 10"
        end

    end

    if e.LightsJudgment:IsCastable() and s() then
        if i(e.LightsJudgment, nil, nil, not o:IsSpellInRange(e.LightsJudgment)) then
            a = 255647
            return "lights_judgment cd 11"
        end

    end

    if e.Fireblood:IsCastable() and s() then
        if i(e.Fireblood, nil) then
            a = 265221
            return "fireblood cd 12"
        end

    end

    if e.AncestralCall:IsCastable() and s() then
        if i(e.AncestralCall, nil) then
            a = 274738
            return "ancestral_call cd 13"
        end

    end

    if e.BagofTricks:IsCastable() and s() then
        if i(e.BagofTricks, nil, nil, not o:IsSpellInRange(e.BagofTricks)) then
            a = 312411
            return "bag_of_tricks cd 14"
        end

    end

end

local function h()
    if e.ArcaneExplosion:IsCastable() and t:ManaPercentageP() > 30 and j >= 2 then
        if i(e.ArcaneExplosion) then
            a = 1449
            return "arcane_explosion move 16"
        end

    end

    if e.FireBlast:IsCastable() then
        if i(e.FireBlast) then
            a = 319836
            return "fire_blast move 17"
        end

    end

    if e.IceLance:IsCastable() then
        if i(e.IceLance, nil, nil, not o:IsSpellInRange(e.IceLance)) then
            a = 30455
            return "ice_lance move 6"
        end

    end

end

local function N()
    if e.Flurry:IsCastable() and (not t:IsMoving() or t:BuffUp(e.BrainFreezeBuff)) and (o:DebuffDown(e.WintersChillDebuff) and ((t:IsCasting(e.Ebonbolt) or t:PrevGCD(1, e.Ebonbolt)) or (t:BuffUp(e.BrainFreezeBuff) and ((t:IsCasting(e.GlacialSpike) or t:PrevGCD(1, e.GlacialSpike)) or ((t:IsCasting(e.Frostbolt) or t:PrevGCD(1, e.Frostbolt)) and (not e.IreOfTheAscended:ConduitEnabled() or e.RadiantSpark:CooldownRemains() > 0 or x)) or (t:IsCasting(e.RadiantSpark) or t:PrevGCD(1, e.RadiantSpark)) or (t:BuffDownP(e.FingersofFrostBuff) and (o:DebuffUp(e.MirrorsofTorment) or t:BuffUp(e.FreezingWindsBuff) or t:BuffUp(e.ExpandedPotentialBuff))))))) then
        if i(e.Flurry, nil, nil, not o:IsSpellInRange(e.Flurry)) then
            a = 44614
            return "flurry single 1"
        end

    end

    if FrozenOrb:IsCastable() and not S and (y or s()) then
        if i(FrozenOrb, nil, nil, not o:IsInRange(40)) then
            a = 198149
            return "frozen_orb single 2"
        end

    end

    if e.CometStorm:IsCastable() and (o:DebuffUp(e.WintersChillDebuff)) then
        if i(e.CometStorm, nil, nil, not o:IsSpellInRange(e.CometStorm)) then
            a = 153595
            return "comet_storm single 7"
        end

    end

    if e.IceLance:IsCastable() and (e.SplittingIce:IsAvailable() and e.ChainReaction:IsAvailable() and t:BuffStack(e.FingersofFrostBuff) == 2) then
        if i(e.IceLance, nil, nil, not o:IsSpellInRange(e.IceLance)) then
            a = 30455
            return "ice_lance single 6"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (k and (f or p) and t:BuffRemains(e.Deathborne) > (e.Frostbolt:CastTime() + e.Frostbolt:TravelTime()) and l >= 2) then
        if i(e.Frostbolt, nil, nil, not o:IsSpellInRange(e.Frostbolt)) then
            a = 116
            return "frostbolt single 8"
        end

    end

    if e.Blizzard:IsCastable() and not t:IsMoving() and ((not p or (not e.IcyPropulsion:ConduitEnabled() and t:BuffDown(e.Deathborne))) and l >= 2) then
        if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
            a = 190356
            return "blizzard single 3"
        end

    end

    if e.RayofFrost:IsCastable() and not t:IsMoving() and s() and (o:DebuffStack(e.WintersChillDebuff) == 1) then
        if i(e.RayofFrost, nil, nil, not o:IsSpellInRange(e.RayofFrost)) then
            a = 205021
            return "ray_of_frost single 4"
        end

    end

    if e.GlacialSpike:IsCastable() and not t:IsMoving() and (o:DebuffUp(e.WintersChillDebuff) and o:DebuffRemains(e.WintersChillDebuff) > e.GlacialSpike:CastTime() + e.GlacialSpike:TravelTime()) then
        if i(e.GlacialSpike, nil, nil, not o:IsSpellInRange(e.GlacialSpike)) then
            a = 199786
            return "glacial_spike single 5"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (o:DebuffStack(e.WintersChillDebuff) == 1 and (Y() > e.IceLance:TravelTime() and e.CometStorm:IsAvailable())) then
        if i(e.Frostbolt, nil, nil, not o:IsSpellInRange(e.Frostbolt)) then
            a = 116
            return "frostbolt single 16"
        end

    end

    if e.IceLance:IsCastable() and (o:DebuffUp(e.WintersChillDebuff) and o:DebuffStack(e.WintersChillDebuff) > t:BuffStack(e.FingersofFrostBuff) and o:DebuffRemains(e.WintersChillDebuff) > e.IceLance:TravelTime()) then
        if i(e.IceLance, nil, nil, not o:IsSpellInRange(e.IceLance)) then
            a = 30455
            return "ice_lance single 16"
        end

    end

    if e.IceNova:IsCastable() then
        if i(e.IceNova, nil, nil, not o:IsSpellInRange(e.IceNova)) then
            a = 157997
            return "ice_nova single 8"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and d and (t:BuffUp(e.FreezingWindsBuff) and l == 1) then
        if i(e.RadiantSpark, nil, nil, not o:IsSpellInRange(e.RadiantSpark)) then
            a = 307443
            return "radiant_spark single 9"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and d and (t:BuffUp(e.BrainFreezeBuff) and e.GlacialSpike:IsAvailable() and e.IreOfTheAscended:ConduitEnabled() and t:BuffStack(e.IciclesBuff) >= 4) then
        if i(e.RadiantSpark, nil, nil, not o:IsSpellInRange(e.RadiantSpark)) then
            a = 307443
            return "radiant_spark single 10"
        end

    end

    if e.IceLance:IsCastable() and (t:BuffUp(e.FingersofFrostBuff) or D() > e.IceLance:TravelTime()) then
        if i(e.IceLance, nil, nil, not o:IsSpellInRange(e.IceLance)) then
            a = 30455
            return "ice_lance single 11"
        end

    end

    if e.Ebonbolt:IsCastable() and not t:IsMoving() and (y or s()) then
        if i(e.Ebonbolt, nil, nil, not o:IsSpellInRange(e.Ebonbolt)) then
            a = 257537
            return "ebonbolt single 12"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and d and ((not e.GlacialSpike:IsAvailable() or not e.IreOfTheAscended:ConduitEnabled()) and (not x or q >= 2) and t:BuffUp(e.BrainFreezeBuff)) then
        if i(e.RadiantSpark, nil, nil, not o:IsSpellInRange(e.RadiantSpark)) then
            a = 307443
            return "radiant_spark single 13"
        end

    end

    if d then
        if e.MirrorsofTorment:IsCastable() and not t:IsMoving() and d then
            if i(e.MirrorsofTorment, nil, nil) then
                a = 314793
                return "mirrors_of_torment single 14"
            end

        end

        if e.ShiftingPower:IsCastable() and not t:IsMoving() and d and (t:BuffDown(e.RuneofPowerBuff) and (R or e.GroveInvigoration:IsAvailable() or e.FieldOfBlossoms:IsAvailable() or (x and t:BuffDown(e.FreezingWindsBuff)) or l >= 2)) then
            if i(e.ShiftingPower, nil, nil, not o:IsInRange(18)) then
                a = 314791
                return "shifting_power single 15"
            end

        end

    end

    if e.ArcaneExplosion:IsCastable() and (T and v <= 0 and g.DC.Arcane == 0) then
        if i(e.ArcaneExplosion) then
            a = 1449
            return "arcane_explosion single 16"
        end

    end

    if e.FireBlast:IsCastable() and (T and v <= 0 and g.DC.Fire == 0) then
        if i(e.FireBlast) then
            a = 319836
            return "fire_blast single 17"
        end

    end

    if e.GlacialSpike:IsCastable() and not t:IsMoving() and (t:BuffUp(e.BrainFreezeBuff)) then
        if i(e.GlacialSpike, nil, nil, not o:IsSpellInRange(e.GlacialSpike)) then
            a = 199786
            return "glacial_spike single 18"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() then
        if i(e.Frostbolt, nil, nil, not o:IsSpellInRange(e.Frostbolt)) then
            a = 116
            return "frostbolt single 19"
        end

    end

    if e.IceLance:IsCastable() then
        if i(e.IceLance, nil, nil, not o:IsSpellInRange(e.IceLance)) then
            a = 30455
            return "ice_lance aoe 16"
        end

    end

end

local function s()
    O = HeroRotationCharDB.Toggles[6]
    d = HeroRotationCharDB.Toggles[4]
    y = HeroRotationCharDB.Toggles[5]
    B = HeroRotationCharDB.Toggles[12]
    M = HeroRotationCharDB.Toggles[15]
    F = HeroRotationCharDB.Toggles[60]
    S = HeroRotationCharDB.Toggles[100]
    m = GetInventoryItemID("player", 13)
    w = GetInventoryItemID("player", 14)
            if not r.Commons.Enabled.TopTrinket and not r.Commons.Enabled.BotTrinket then
        _ = { m, w }
    elseif not r.Commons.Enabled.TopTrinket then
        _ = { m }
    elseif not r.Commons.Enabled.BotTrinket then
        _ = { w }
    end

end

local function d()
    FrozenOrb = e.FrozenOrb
    C = o:GetEnemiesInSplashRange(8)
        if H() and r.Commons.AoeMode == "Conservative" then
        z = o:GetEnemiesInSplashRangeCount(6)
        u = o:GetEnemiesInSplashRangeCount(8)
        l = o:GetEnemiesInSplashRangeCount(16)
        q = #t:GetEnemiesInMeleeRange(15)
        j = #t:GetEnemiesInMeleeRange(8)
    elseif H() and r.Commons.AoeMode == "Aggresive" then
        local a = 0
        for e = 1, 20 do
            local e = "nameplate" .. e
            if UnitExists(e) then
                if UnitCanAttack("player", e) then
                    if (UnitCanAttack("player", e) and UnitAffectingCombat("target") and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil) or E(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) or string.find(UnitGUID(e), 182778) or string.find(UnitGUID(e), 183945) then
                        a = (a + 1)
                    end

                end

            end

        end

        q = #t:GetEnemiesInMeleeRange(15)
        j = #t:GetEnemiesInMeleeRange(15)
        z = a
        u = a
        l = a
    end

    if not H() then
        q = 1
        j = 1
        z = 1
        u = 1
        l = 1
    end

    if F then
        z = 10
        l = 10
        u = 10
    end

    if not BotOn then
        b = 0
        a = 0
    end

    if b > 0 then
        b = 0
    end

    if a > 0 then
        a = 0
    end

    ShouldReturn = s()
        if n.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (n.GUISettings.General.OpenerReset)
    elseif n.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        n.ToggleIconFrame:UpdateButtonText(6)
        n.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

    if t:IsChanneling(A(314791)) then
        if i(e.Pool) then
            a = 999999
            return "channeling"
        end

    end

    if t:IsChanneling(A(324631)) then
        if i(e.Pool) then
            a = 999999
            return "channeling"
        end

    end

    if t:IsChanneling() or t:IsChanneling(e.ShiftingPower) then
        if i(e.Pool, nil) then
            a = 99999
            return "Trinket Channel"
        end

    end

    if t:IsChanneling(A(324631)) then
        if i(e.Pool) then
            a = 999999
            return "channeling"
        end

    end

    g.IFTracker()
    FightRemains = c.FightRemains(C, false)
    U = e.DisciplinaryCommandBuff:TimeSinceLastAppliedOnPlayer()
    v = 30 - U
    if v < 0 then
        v = 0
    end

    g.DCCheck()
    if not t:AffectingCombat() and I.TargetIsValid() and O then
        local e = W()
        if e then
            return e
        end

    end

    if I.TargetIsValid() and t:AffectingCombat() and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or o:NPCID() == 176581 or o:NPCID() == 176920 or o:NPCID() == 177892 or o:NPCID() == 182778 or o:NPCID() == 185402 or o:NPCID() == 183945 or o:NPCID() == 182074 or o:NPCID() == 184737 or o:NPCID() == 179733 or o:NPCID() == 115402 or o:NPCID() == 115406 or o:NPCID() == 115395 or UnitExists("boss1") or o:NPCID() == 115388 or O) and not t:IsDeadOrGhost() then
        if t:HealthPercentage() < r.Frost.IceBlockHP and e.IceBlock:IsReady() then
            if i(e.IceBlock, nil) then
                a = 45438
                return "IceBlock HP"
            end

        end

        if t:HealthPercentage() < r.Frost.IceBarrierHP and e.IceBarrier:IsReady() then
            if i(e.IceBarrier, nil) then
                a = 11426
                return "IceBarrier HP"
            end

        end

        if t:HealthPercentage() < r.Frost.MirrorImageHP and e.MirrorImage:IsReady() then
            if i(e.MirrorImage, nil) then
                a = 55342
                return "MirrorImage HP"
            end

        end

        if t:IsMoving() then
            local e = h()
            if e then
                return e
            end

        end

        if true then
            local e = V()
            if e then
                return e
            end

        end

        if l >= 3 then
            local e = P()
            if e then
                return e
            end

        end

        if l < 3 then
            local e = N()
            if e then
                return e
            end

        end

    end

end

local function e()
end

function ReturnSpell1()
    if a == 0 then
        return 0
    else
        return a
    end

end

function ReturnSpellMO1()
    if b == 0 then
        return 0
    else
        return b
    end

end

n.SetAPL(64, d, e)

