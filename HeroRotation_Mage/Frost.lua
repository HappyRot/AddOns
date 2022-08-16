local e, e = ...
local e = HeroDBC.DBC
local c = HeroLib
local e = HeroCache
local q = c.Unit
local t = q.Player
local o = q.Target
local e = q.Pet
local j = c.Spell
local e = c.MultiSpell
local a = c.Item
local h = HeroRotation
local i = h.Cast
local C = h.CastLeft
local s = h.CDsON
local I = h.AoEON
local e = h.CastSuggested
local l = HeroRotationCharDB.Toggles[4]
local f = HeroRotationCharDB.Toggles[5]
local A = HeroRotationCharDB.Toggles[6]
local F = HeroRotationCharDB.Toggles[15]
local B = HeroRotationCharDB.Toggles[12]
local P = HeroRotationCharDB.Toggles[60]
local S = HeroRotationCharDB.Toggles[100]
local Y = false
local g = h.Commons.Mage
local W = math.max
local e = j.Mage.Frost
local r = a.Mage.Frost
local n = t:GetEquipment()
local d = a(0)
local u = a(0)
local _ = { r.ShadowedOrbofTorment:ID() }
local p = GetInventoryItemID("player", 13)
local w = GetInventoryItemID("player", 14)
if n[13] then
    d = a(n[13])
end

if n[14] then
    u = a(n[14])
end

local x, u, d
local z
local M
local b
local D
local a
local m = t:HasLegendaryEquipped(2)
local y = t:HasLegendaryEquipped(3)
local T = t:HasLegendaryEquipped(4)
local O = t:HasLegendaryEquipped(5)
local E = t:HasLegendaryEquipped(7)
local L = t:HasLegendaryEquipped(8)
local H = t:HasLegendaryEquipped(9)
local k = t:HasLegendaryEquipped(221) or (t:HasUnity() and e.Deathborne:IsAvailable())
local R = t:HasLegendaryEquipped(260) or (t:HasUnity() and e.ShiftingPower:IsAvailable())
local v = 0
local a = 0
local n = 0
local N = h.Commons.Everyone
local n = { General = h.GUISettings.General, Commons = h.GUISettings.APL.Mage.Commons, Frost = h.GUISettings.APL.Mage.Frost }
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
    m = t:HasLegendaryEquipped(2)
    y = t:HasLegendaryEquipped(3)
    T = t:HasLegendaryEquipped(4)
    O = t:HasLegendaryEquipped(5)
    E = t:HasLegendaryEquipped(7)
    L = t:HasLegendaryEquipped(8)
    H = t:HasLegendaryEquipped(9)
    k = t:HasLegendaryEquipped(221) or (t:HasUnity() and e.Deathborne:IsAvailable())
    R = t:HasLegendaryEquipped(260) or (t:HasUnity() and e.ShiftingPower:IsAvailable())
end, "PLAYER_EQUIPMENT_CHANGED")
local L = t:CovenantID()
c:RegisterForEvent(function()
    L = t:CovenantID()
end, "COVENANT_CHOSEN")
local function G(e)
    if e then
        return 1
    else
        return 0
    end

end

local function L(e)
    return e ~= 0
end

local function U()
    return W(o:DebuffRemains(e.Frostbite), o:DebuffRemains(e.Freeze), o:DebuffRemains(e.FrostNova))
end

local function L()
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

    if N.TargetIsValid() then
        if e.Fleshcraft:IsCastable() and l and not t:IsMoving() then
            if i(e.Fleshcraft, nil) then
                a = 324631
                return "fleshcraft precombat 5"
            end

        end

        if r.TomeofMonstruousConstructions:IsEquippedAndReady() and t:BuffDown(e.TomeofMonstruousConstructionsBuff) and not t:IsMoving() then
            if i(r.TomeofMonstruousConstructions, nil, nil) then
                                if r.TomeofMonstruousConstructions:ID() == p then
                    a = 24
                    return "tome_of_monstruous_constructions precombat 3 top"
                elseif r.TomeofMonstruousConstructions:ID() == w then
                    a = 30
                    return "tome_of_monstruous_constructions precombat 3 bot"
                end

            end

        end

        if r.ShadowedOrbofTorment:IsEquippedAndReady() and t:BuffDown(e.RuneofPowerBuff) and not t:IsMoving() then
            if i(r.ShadowedOrbofTorment, nil, nil) then
                                if r.ShadowedOrbofTorment:ID() == p then
                    a = 24
                    return "Orb of Torment 3 top"
                elseif r.ShadowedOrbofTorment:ID() == w then
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

local function V()
    if r.ShadowedOrbofTorment:IsEquippedAndReady() and t:BuffDown(e.RuneofPowerBuff) and not t:IsMoving() then
        if i(r.ShadowedOrbofTorment, nil, nil) then
                        if r.ShadowedOrbofTorment:ID() == p then
                a = 24
                return "Orb of Torment 3 top"
            elseif r.ShadowedOrbofTorment:ID() == w then
                a = 30
                return "Orb of Torment 3 top"
            end

        end

    end

    if r.PotionofSpectralIntellect:IsReady() and n.Commons.Enabled.Potions and F and s() and (t:PrevGCDP(1, e.IcyVeins) or FightRemains < 30) then
        if i(r.PotionofSpectralIntellect, nil, nil) then
            a = 50
            return "potion cd 2"
        end

    end

    if e.Deathborne:IsCastable() and l and not t:IsMoving() then
        if i(e.Deathborne, nil, nil) then
            a = 324220
            return "deathborne cd 3"
        end

    end

    if e.MirrorsofTorment:IsCastable() and not t:IsMoving() and (u < 3 and (e.SiphonedMalice:ConduitEnabled() or e.WastelandPropriety:SoulbindEnabled()) and t:BuffDown(e.BrainFreezeBuff)) then
        if i(e.MirrorsofTorment, nil, nil) then
            a = 314793
            return "mirrors_of_torment cd 4"
        end

    end

    if e.RuneofPower:IsCastable() and not t:IsMoving() and (f or s()) and not t:IsMoving() and (e.IcyVeins:CooldownRemains() > 12 and t:BuffDown(e.RuneofPowerBuff)) then
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

    if e.TimeWarp:IsCastable() and s() and n.Frost.UseTemporalWarp and (H and t:BloodlustExhaustUp() and t:BloodlustDown() and (t:BuffUp(e.IcyVeins) or FightRemains < 40)) then
        if i(e.TimeWarp, nil) then
            a = 80353
            return "time_warp cd 7"
        end

    end

    if (n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BotTrinket) and s() then
        local e = t:GetUseableTrinkets(_)
        if e then
            if i(e, nil, nil) then
                                if e:ID() == p and n.Commons.Enabled.TopTrinket then
                    a = 24
                    return "top trinket 1"
                elseif e:ID() == w and n.Commons.Enabled.BotTrinket then
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

local function H()
    if FrozenOrb:IsCastable() and not S and (f or s()) then
        if i(FrozenOrb, nil, nil, not o:IsInRange(40)) then
            a = 198149
            return "frozen_orb aoe 1"
        end

    end

    if e.Blizzard:IsCastable() and not t:IsMoving() and (t:BuffDown(e.Deathborne) or (not k) or t:BuffUp(e.FreezingRainBuff) or d >= 6) then
        if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
            if false then
                a = 1190356
                return "blizzard aoe 2"
            else
                a = 190356
                return "blizzard aoe 2"
            end

        end

    end

    if e.Blizzard:IsCastable() and not t:IsMoving() and t:BuffUp(e.Deathborne) then
        if (d == 5 and (e.FreezingRain:IsAvailable() or e.BoneChilling:IsAvailable() or e.ShiveringCore:ConduitEnabled() or not y)) then
            if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
                if false then
                    a = 1190356
                    return "blizzard aoe 12"
                else
                    a = 190356
                    return "blizzard aoe 12"
                end

            end

        end

        if (d == 4 and (e.FreezingRain:IsAvailable() or (e.BoneChilling:IsAvailable() and e.ShiveringCore:ConduitEnabled()) or ((not y) and not m))) then
            if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
                if false then
                    a = 1190356
                    return "blizzard aoe 22"
                else
                    a = 190356
                    return "blizzard aoe 22"
                end

            end

        end

        if (d <= 3 and (not m) and (not y) and e.ShiveringCore:ConduitEnabled() and (e.FreezingRain:IsAvailable() or e.BoneChilling:IsAvailable())) then
            if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
                if false then
                    a = 1190356
                    return "blizzard aoe 32"
                else
                    a = 190356
                    return "blizzard aoe 32"
                end

            end

        end

    end

    if e.Flurry:IsCastable() and (not t:IsMoving() or t:BuffUp(e.BrainFreezeBuff)) and (o:DebuffDown(e.WintersChillDebuff) and (t:IsCasting(e.Ebonbolt) or (t:BuffUp(e.BrainFreezeBuff) and (t:BuffDownP(e.FingersofFrostBuff))) or (k and t:PrevGCD(1, e.Frostbolt) and (y or m) and t:BuffUp(e.Deathborne)))) then
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

    if e.CometStorm:IsCastable() and not (f or s) then
        if i(e.CometStorm, nil, nil, not o:IsSpellInRange(e.CometStorm)) then
            a = 153595
            return "comet_storm aoe 5"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (k and (y or m) and t:BuffRemains(e.Deathborne) > e.Frostbolt:CastTime() + e.Frostbolt:TravelTime()) then
        if i(e.Frostbolt, nil, nil, not o:IsSpellInRange(e.Frostbolt)) then
            a = 116
            return "frostbolt aoe 15"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (o:DebuffStack(e.WintersChillDebuff) == 1 and (L() > e.IceLance:TravelTime() and e.CometStorm:IsAvailable())) then
        if i(e.Frostbolt, nil, nil, not o:IsSpellInRange(e.Frostbolt)) then
            a = 116
            return "frostbolt aoe 20"
        end

    end

    if e.IceLance:IsCastable() and (t:BuffUp(e.FingersofFrostBuff) or U() > e.IceLance:TravelTime() or (o:DebuffStack(e.WintersChillDebuff) > 1 and o:DebuffRemains(e.WintersChillDebuff) > e.IceLance:TravelTime())) then
        if i(e.IceLance, nil, nil, not o:IsSpellInRange(e.IceLance)) then
            a = 30455
            return "ice_lance aoe 6"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and l and (e.CombatMeditation:SoulbindEnabled()) then
        if i(e.RadiantSpark, nil, nil, not o:IsSpellInRange(e.RadiantSpark)) then
            a = 307443
            return "radiant_spark aoe 7"
        end

    end

    if l then
        if e.MirrorsofTorment:IsCastable() and not t:IsMoving() and l then
            if i(e.MirrorsofTorment, nil, nil, not o:IsSpellInRange(e.MirrorsofTorment)) then
                a = 314793
                return "mirrors_of_torment aoe 8"
            end

        end

        if e.ShiftingPower:IsCastable() and not t:IsMoving() and l then
            if i(e.ShiftingPower, nil, nil, not o:IsInRange(18)) then
                a = 314791
                return "shifting_power aoe 9"
            end

        end

    end

    if e.FireBlast:IsCastable() and (E and b <= 0 and g.DC.Fire == 0) then
        if i(e.FireBlast) then
            a = 319836
            return "fire_blast aoe 11"
        end

    end

    if e.ArcaneExplosion:IsCastable() and (t:ManaPercentageP() > 30 and u >= 6 and not O) and not t:BuffUp(e.Deathborne) then
        if n.Frost.StayDistance and not o:IsInRange(10) then
            if C(e.ArcaneExplosion) then
                return "arcane_explosion aoe 12 left"
            end

        else
            if i(e.ArcaneExplosion) then
                a = 1449
                return "arcane_explosion aoe 12"
            end

        end

    end

    if e.Ebonbolt:IsCastable() and not t:IsMoving() and (f or s()) and (u >= 2) then
        if i(e.Ebonbolt, nil, nil, not o:IsSpellInRange(e.Ebonbolt)) then
            a = 257537
            return "ebonbolt aoe 13"
        end

    end

    local n = 7 - e.Blizzard:TimeSinceLastCast()
    if n < 0 then
        n = 0
    end

    if e.IceLance:IsCastable() and (O and (e.SplittingIce:IsAvailable() or u >= 5) and e.IceLance:TravelTime() < n) then
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

local function r()
    if e.Flurry:IsCastable() and (not t:IsMoving() or t:BuffUp(e.BrainFreezeBuff)) and (o:DebuffDown(e.WintersChillDebuff) and (t:IsCasting(e.Ebonbolt) or (t:BuffUp(e.BrainFreezeBuff) and (t:IsCasting(e.GlacialSpike) or (t:IsCasting(e.Frostbolt) and (not e.IreOfTheAscended:ConduitEnabled() or e.RadiantSpark:CooldownRemains() > 0 or T)) or t:IsCasting(e.RadiantSpark) or (t:BuffDownP(e.FingersofFrostBuff) and (o:DebuffUp(e.MirrorsofTorment) or t:BuffUp(e.FreezingWindsBuff) or t:BuffUp(e.ExpandedPotentialBuff))))))) then
        if i(e.Flurry, nil, nil, not o:IsSpellInRange(e.Flurry)) then
            a = 44614
            return "flurry single 1"
        end

    end

    if FrozenOrb:IsCastable() and not S and (f or s()) then
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

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (k and (y or m) and t:BuffRemains(e.Deathborne) > e.Frostbolt:CastTime() + e.Frostbolt:TravelTime() and d >= 2) then
        if i(e.Frostbolt, nil, nil, not o:IsSpellInRange(e.Frostbolt)) then
            a = 116
            return "frostbolt single 8"
        end

    end

    if e.Blizzard:IsCastable() and not t:IsMoving() and (((not m) or (not e.IcyPropulsion:ConduitEnabled() and t:BuffDown(e.Deathborne))) and d >= 2) then
        if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
            if false then
                a = 1190356
                return "blizzard single 3"
            else
                a = 190356
                return "blizzard single 3"
            end

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

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (o:DebuffStack(e.WintersChillDebuff) == 1 and (L() > e.IceLance:TravelTime() and e.CometStorm:IsAvailable())) then
        if i(e.Frostbolt, nil, nil, not o:IsSpellInRange(e.Frostbolt)) then
            a = 116
            return "frostbolt single 16"
        end

    end

    if e.IceLance:IsCastable() and (o:DebuffUp(e.WintersChillDebuff) and o:DebuffStack(e.WintersChillDebuff) > G(t:BuffUp(e.FingersofFrostBuff)) and o:DebuffRemains(e.WintersChillDebuff) > e.IceLance:TravelTime()) then
        if i(e.IceLance, nil, nil, not o:IsSpellInRange(e.IceLance)) then
            a = 30455
            return "ice_lance single 6"
        end

    end

    if e.IceNova:IsCastable() then
        if i(e.IceNova, nil, nil, not o:IsSpellInRange(e.IceNova)) then
            a = 157997
            return "ice_nova single 8"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and l and (t:BuffUp(e.FreezingWindsBuff) and d == 1) then
        if i(e.RadiantSpark, nil, nil, not o:IsSpellInRange(e.RadiantSpark)) then
            a = 307443
            return "radiant_spark single 9"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and l and (t:BuffUp(e.BrainFreezeBuff) and e.GlacialSpike:IsAvailable() and e.IreOfTheAscended:ConduitEnabled() and t:BuffStack(e.IciclesBuff) >= 4) then
        if i(e.RadiantSpark, nil, nil, not o:IsSpellInRange(e.RadiantSpark)) then
            a = 307443
            return "radiant_spark single 10"
        end

    end

    if e.IceLance:IsCastable() and (t:BuffUp(e.FingersofFrostBuff) or U() > e.IceLance:TravelTime()) then
        if i(e.IceLance, nil, nil, not o:IsSpellInRange(e.IceLance)) then
            a = 30455
            return "ice_lance single 11"
        end

    end

    if e.Ebonbolt:IsCastable() and not t:IsMoving() and (f or s()) then
        if i(e.Ebonbolt, nil, nil, not o:IsSpellInRange(e.Ebonbolt)) then
            a = 257537
            return "ebonbolt single 12"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and l and ((not e.GlacialSpike:IsAvailable() or not e.IreOfTheAscended:ConduitEnabled()) and (not T or z >= 2) and t:BuffUp(e.BrainFreezeBuff)) then
        if i(e.RadiantSpark, nil, nil, not o:IsSpellInRange(e.RadiantSpark)) then
            a = 307443
            return "radiant_spark single 13"
        end

    end

    if l then
        if e.MirrorsofTorment:IsCastable() and not t:IsMoving() and l then
            if i(e.MirrorsofTorment, nil, nil) then
                a = 314793
                return "mirrors_of_torment single 14"
            end

        end

        if e.ShiftingPower:IsCastable() and not t:IsMoving() and l and (t:BuffDown(e.RuneofPowerBuff) and (R or e.GroveInvigoration:IsAvailable() or e.FieldOfBlossoms:IsAvailable() or (T and t:BuffDown(e.FreezingWindsBuff)) or d >= 2)) then
            if i(e.ShiftingPower, nil, nil, not o:IsInRange(18)) then
                a = 314791
                return "shifting_power single 15"
            end

        end

    end

    if e.ArcaneExplosion:IsCastable() and t:ManaPercentageP() > 30 and (E and b <= 0 and g.DC.Arcane == 0) then
        if n.Frost.StayDistance and not o:IsInRange(10) then
            if C(e.ArcaneExplosion) then
                return "arcane_explosion single 16 left"
            end

        else
            if i(e.ArcaneExplosion) then
                a = 1449
                return "arcane_explosion single 16"
            end

        end

    end

    if e.FireBlast:IsCastable() and (E and b <= 0 and g.DC.Fire == 0) then
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

local function m()
    A = HeroRotationCharDB.Toggles[6]
    l = HeroRotationCharDB.Toggles[4]
    f = HeroRotationCharDB.Toggles[5]
    B = HeroRotationCharDB.Toggles[12]
    F = HeroRotationCharDB.Toggles[15]
    P = HeroRotationCharDB.Toggles[60]
    S = HeroRotationCharDB.Toggles[100]
end

local function s()
    FrozenOrb = e.FrozenOrb
    M = o:GetEnemiesInSplashRange(8)
        if I() and n.Commons.AoeMode == "Conservative" then
        x = o:GetEnemiesInSplashRangeCount(6)
        u = o:GetEnemiesInSplashRangeCount(8)
        d = o:GetEnemiesInSplashRangeCount(16)
        z = t:GetEnemiesInMeleeRange(15)
    elseif I() and n.Commons.AoeMode == "Aggresive" then
        local a = 0
        for e = 1, 20 do
            local e = "nameplate" .. e
            if UnitExists(e) then
                if UnitCanAttack("player", e) then
                    if (UnitCanAttack("player", e) and UnitAffectingCombat("target") and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil) or q(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) or string.find(UnitGUID(e), 182778) or string.find(UnitGUID(e), 183945) then
                        a = (a + 1)
                    end

                end

            end

        end

        z = t:GetEnemiesInMeleeRange(15)
        x = a
        u = a
        d = a
    end

    if not I() then
        z = 1
        x = 1
        u = 1
        d = 1
    end

    if P then
        x = 10
        d = 10
        u = 10
    end

    if not BotOn then
        v = 0
        a = 0
    end

    if v > 0 then
        v = 0
    end

    if a > 0 then
        a = 0
    end

    p = GetInventoryItemID("player", 13)
    w = GetInventoryItemID("player", 14)
            if not n.Commons.Enabled.TopTrinket and not n.Commons.Enabled.BotTrinket then
        _ = { p, w }
    elseif not n.Commons.Enabled.TopTrinket then
        _ = { p }
    elseif not n.Commons.Enabled.BotTrinket then
        _ = { w }
    end

    if IsAddOnLoaded("ElvUI") and not IsAddOnLoaded("Bartender4") and ElvUI_Bar1Button10:GetAttribute("checkselfcast") and false then
        ElvUI_Bar1Button10:SetAttribute("checkselfcast", false)
    end

    if IsAddOnLoaded("Bartender4") and BT4Button10:GetAttribute("checkselfcast") and false then
        BT4Button10:SetAttribute("checkselfcast", false)
        SetBinding("CTRL-0")
        GetModifiedClick('SELFCAST')
        SetModifiedClick('SELFCAST', "CTRL")
        SetCVar("autoSelfCast", "0")
        SaveBindings(GetCurrentBindingSet())
    end

    if not IsAddOnLoaded("ElvUI") and not IsAddOnLoaded("Bartender4") and ActionButton10:GetAttribute("checkselfcast") and false then
        ActionButton10:SetAttribute("checkselfcast", false)
    end

    if IsAddOnLoaded("ElvUI") and not IsAddOnLoaded("Bartender4") and false and not Y then
        if ElvUI_Bar1Button10:GetAttribute("checkselfcast") then
            ElvUI_Bar1Button10:SetAttribute("checkselfcast", false)
        end

        Y = true
        SetBinding("CTRL-0")
        GetModifiedClick('SELFCAST')
        SetModifiedClick('SELFCAST', "CTRL")
        SetCVar("autoSelfCast", "0")
        SaveBindings(GetCurrentBindingSet())
    end

    ShouldReturn = m()
        if h.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (h.GUISettings.General.OpenerReset)
    elseif h.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        h.ToggleIconFrame:UpdateButtonText(6)
        h.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

    if t:IsChanneling(j(314791)) then
        if i(e.Pool) then
            a = 999999
            return "channeling"
        end

    end

    if t:IsChanneling(j(324631)) then
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

    if t:IsChanneling(j(324631)) then
        if i(e.Pool) then
            a = 999999
            return "channeling"
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.IceLance:IsCastable() then
            if i(e.IceLance, nil) then
                v = 1196840
                return "explosive MO FS"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.IceLance:IsCastable() then
            if i(e.IceLance, nil) then
                a = 196840
                return "explosive  FS"
            end

        end

    end

    g.IFTracker()
    FightRemains = c.FightRemains(M, false)
    D = e.DisciplinaryCommandBuff:TimeSinceLastAppliedOnPlayer()
    b = 30 - D
    if b < 0 then
        b = 0
    end

    g.DCCheck()
    if not t:AffectingCombat() and N.TargetIsValid() and A then
        local e = W()
        if e then
            return e
        end

    end

    if N.TargetIsValid() and t:AffectingCombat() and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or o:NPCID() == 176581 or o:NPCID() == 176920 or o:NPCID() == 177892 or o:NPCID() == 182778 or o:NPCID() == 185402 or o:NPCID() == 183945 or o:NPCID() == 182074 or o:NPCID() == 184737 or o:NPCID() == 179733 or o:NPCID() == 115402 or o:NPCID() == 115406 or o:NPCID() == 115395 or UnitExists("boss1") or o:NPCID() == 115388 or A) and not t:IsDeadOrGhost() then
        if t:HealthPercentage() < n.Frost.IceBlockHP and e.IceBlock:IsReady() then
            if i(e.IceBlock, nil) then
                a = 45438
                return "IceBlock HP"
            end

        end

        if t:HealthPercentage() < n.Frost.IceBarrierHP and e.IceBarrier:IsReady() then
            if i(e.IceBarrier, nil) then
                a = 11426
                return "IceBarrier HP"
            end

        end

        if t:HealthPercentage() < n.Frost.MirrorImageHP and e.MirrorImage:IsReady() then
            if i(e.MirrorImage, nil) then
                a = 55342
                return "MirrorImage HP"
            end

        end

        if true then
            local e = V()
            if e then
                return e
            end

        end

        if d >= 3 then
            local e = H()
            if e then
                return e
            end

        end

        if d < 3 then
            local e = r()
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
    if v == 0 then
        return 0
    else
        return v
    end

end

h.SetAPL(64, s, e)

