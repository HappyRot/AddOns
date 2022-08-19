local e, e = ...
local e = HeroDBC.DBC
local c = HeroLib
local e = HeroCache
local j = c.Unit
local t = j.Player
local a = j.Target
local e = j.Pet
local q = c.Spell
local e = c.MultiSpell
local o = c.Item
local n = HeroRotation
local i = n.Cast
local e = n.CastLeft
local s = n.CDsON
local S = n.AoEON
local e = n.CastSuggested
local l = HeroRotationCharDB.Toggles[4]
local w = HeroRotationCharDB.Toggles[5]
local N = HeroRotationCharDB.Toggles[6]
local C = HeroRotationCharDB.Toggles[15]
local P = HeroRotationCharDB.Toggles[12]
local U = HeroRotationCharDB.Toggles[60]
local H = HeroRotationCharDB.Toggles[100]
local e = false
local k = n.Commons.Mage
local R = math.max
local e = q.Mage.Frost
local r = o.Mage.Frost
local h = t:GetEquipment()
local u = o(0)
local d = o(0)
local T = { r.ShadowedOrbofTorment:ID() }
local m = GetInventoryItemID("player", 13)
local f = GetInventoryItemID("player", 14)
if h[13] then
    u = o(h[13])
end

if h[14] then
    d = o(h[14])
end

local E, u, d
local x, g
local D
local v
local L
local o
local y = t:HasLegendaryEquipped(2)
local p = t:HasLegendaryEquipped(3)
local _ = t:HasLegendaryEquipped(4)
local O = t:HasLegendaryEquipped(5)
local z = t:HasLegendaryEquipped(7)
local F = t:HasLegendaryEquipped(8)
local M = t:HasLegendaryEquipped(9)
local b = t:HasLegendaryEquipped(221) or (t:HasUnity() and e.Deathborne:IsAvailable())
local W = t:HasLegendaryEquipped(260) or (t:HasUnity() and e.ShiftingPower:IsAvailable())
local A = 0
local o = 0
local h = 0
local I = n.Commons.Everyone
local h = { General = n.GUISettings.General, Commons = n.GUISettings.APL.Mage.Commons, Frost = n.GUISettings.APL.Mage.Frost }
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
    y = t:HasLegendaryEquipped(2)
    p = t:HasLegendaryEquipped(3)
    _ = t:HasLegendaryEquipped(4)
    O = t:HasLegendaryEquipped(5)
    z = t:HasLegendaryEquipped(7)
    F = t:HasLegendaryEquipped(8)
    M = t:HasLegendaryEquipped(9)
    b = t:HasLegendaryEquipped(221) or (t:HasUnity() and e.Deathborne:IsAvailable())
    W = t:HasLegendaryEquipped(260) or (t:HasUnity() and e.ShiftingPower:IsAvailable())
end, "PLAYER_EQUIPMENT_CHANGED")
local F = t:CovenantID()
c:RegisterForEvent(function()
    F = t:CovenantID()
end, "COVENANT_CHOSEN")
local function F(e)
    if e then
        return 1
    else
        return 0
    end

end

local function F(e)
    return e ~= 0
end

local function F()
    return R(a:DebuffRemains(e.Frostbite), a:DebuffRemains(e.Freeze), a:DebuffRemains(e.FrostNova))
end

local function Y()
    local t = 1
    local a = 7
    local o = .2
    local t = t + (o * a)
    return R(t - e.CometStorm:TimeSinceLastCast(), 0)
end

local function R()
    if e.ArcaneIntellect:IsCastable() and t:BuffDown(e.ArcaneIntellect, true) then
        if i(e.ArcaneIntellect) then
            o = 1459
            return "arcane_intellect precombat 1"
        end

    end

    if e.SummonWaterElemental:IsCastable() then
        if i(e.SummonWaterElemental) then
            o = 31687
            return "summon_water_elemental precombat 2"
        end

    end

    if I.TargetIsValid() then
        if e.Fleshcraft:IsCastable() and l and not t:IsMoving() then
            if i(e.Fleshcraft, nil) then
                o = 324631
                return "fleshcraft precombat 5"
            end

        end

        if r.TomeofMonstruousConstructions:IsEquippedAndReady() and t:BuffDown(e.TomeofMonstruousConstructionsBuff) and not t:IsMoving() then
            if i(r.TomeofMonstruousConstructions, nil, nil) then
                                if r.TomeofMonstruousConstructions:ID() == m then
                    o = 24
                    return "tome_of_monstruous_constructions precombat 3 top"
                elseif r.TomeofMonstruousConstructions:ID() == f then
                    o = 30
                    return "tome_of_monstruous_constructions precombat 3 bot"
                end

            end

        end

        if r.ShadowedOrbofTorment:IsEquippedAndReady() and t:BuffDown(e.RuneofPowerBuff) and not t:IsMoving() then
            if i(r.ShadowedOrbofTorment, nil, nil) then
                                if r.ShadowedOrbofTorment:ID() == m then
                    o = 24
                    return "Orb of Torment 3 top"
                elseif r.ShadowedOrbofTorment:ID() == f then
                    o = 30
                    return "Orb of Torment 3 top"
                end

            end

        end

        if e.Frostbolt:IsCastable() and not t:IsCasting(e.Frostbolt) and not t:IsMoving() then
            if i(e.Frostbolt, nil, nil, not a:IsSpellInRange(e.Frostbolt)) then
                o = 116
                return "frostbolt precombat 5"
            end

        end

    end

end

local function V()
    if FrozenOrb:IsCastable() and not H and (w or s()) then
        if i(FrozenOrb, nil, nil, not a:IsInRange(40)) then
            o = 198149
            return "frozen_orb aoe 1"
        end

    end

    if e.Blizzard:IsCastable() and not t:IsMoving() and (t:BuffDown(e.Deathborne) or (not b) or t:BuffUp(e.FreezingRainBuff) or d >= 6) then
        if i(e.Blizzard, nil, nil, not a:IsInRange(40)) then
            o = 190356
            return "blizzard aoe 11"
        end

    end

    if e.Blizzard:IsCastable() and not t:IsMoving() and t:BuffUp(e.Deathborne) then
        if (d == 5 and (e.FreezingRain:IsAvailable() or e.BoneChilling:IsAvailable() or e.ShiveringCore:ConduitEnabled() or not p)) then
            if i(e.Blizzard, nil, nil, not a:IsInRange(40)) then
                o = 190356
                return "blizzard aoe 12"
            end

        end

        if (d == 4 and (e.FreezingRain:IsAvailable() or (e.BoneChilling:IsAvailable() and e.ShiveringCore:ConduitEnabled()) or ((not p) and not y))) then
            if i(e.Blizzard, nil, nil, not a:IsInRange(40)) then
                o = 190356
                return "blizzard aoe 22"
            end

        end

        if (d <= 3 and (not y) and (not p) and e.ShiveringCore:ConduitEnabled() and (e.FreezingRain:IsAvailable() or e.BoneChilling:IsAvailable())) then
            if i(e.Blizzard, nil, nil, not a:IsInRange(40)) then
                o = 190356
                return "blizzard aoe 32"
            end

        end

    end

    if e.Flurry:IsCastable() and (not t:IsMoving() or t:BuffUp(e.BrainFreezeBuff)) and (a:DebuffDown(e.WintersChillDebuff) and (t:IsCasting(e.Ebonbolt) or (t:BuffUp(e.BrainFreezeBuff) and (t:BuffDownP(e.FingersofFrostBuff) or (b and (t:PrevGCD(1, e.Frostbolt) or t:IsCasting(e.Frostbolt)) and (p or y) and t:BuffUp(e.Deathborne)))))) then
        if i(e.Flurry, nil, nil, not a:IsSpellInRange(e.Flurry)) then
            o = 44614
            return "flurry aoe 3"
        end

    end

    if e.IceNova:IsCastable() then
        if i(e.IceNova, nil, nil, not a:IsSpellInRange(e.IceNova)) then
            o = 157997
            return "ice_nova aoe 4"
        end

    end

    if e.CometStorm:IsCastable() and not (w or s) then
        if i(e.CometStorm, nil, nil, not a:IsSpellInRange(e.CometStorm)) then
            o = 153595
            return "comet_storm aoe 5"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (b and (p or y) and t:BuffRemains(e.Deathborne) > e.Frostbolt:CastTime() + e.Frostbolt:TravelTime()) then
        if i(e.Frostbolt, nil, nil, not a:IsSpellInRange(e.Frostbolt)) then
            o = 116
            return "frostbolt aoe 15"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (a:DebuffStack(e.WintersChillDebuff) == 1 and (Y() > e.IceLance:TravelTime() and e.CometStorm:IsAvailable())) then
        if i(e.Frostbolt, nil, nil, not a:IsSpellInRange(e.Frostbolt)) then
            o = 116
            return "frostbolt aoe 20"
        end

    end

    if e.IceLance:IsCastable() and (t:BuffUp(e.FingersofFrostBuff) or F() > e.IceLance:TravelTime() or (a:DebuffStack(e.WintersChillDebuff) >= 1 and a:DebuffRemains(e.WintersChillDebuff) > e.IceLance:TravelTime())) then
        if i(e.IceLance, nil, nil, not a:IsSpellInRange(e.IceLance)) then
            o = 30455
            return "ice_lance aoe 6"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and l and (e.CombatMeditation:SoulbindEnabled()) then
        if i(e.RadiantSpark, nil, nil, not a:IsSpellInRange(e.RadiantSpark)) then
            o = 307443
            return "radiant_spark aoe 7"
        end

    end

    if l then
        if e.MirrorsofTorment:IsCastable() and not t:IsMoving() and l then
            if i(e.MirrorsofTorment, nil, nil, not a:IsSpellInRange(e.MirrorsofTorment)) then
                o = 314793
                return "mirrors_of_torment aoe 8"
            end

        end

        if e.ShiftingPower:IsCastable() and not t:IsMoving() and l then
            if i(e.ShiftingPower, nil, nil, not a:IsInRange(18)) then
                o = 314791
                return "shifting_power aoe 9"
            end

        end

    end

    if e.FireBlast:IsCastable() and (z and v <= 0 and k.DC.Fire == 0) then
        if i(e.FireBlast) then
            o = 319836
            return "fire_blast aoe 11"
        end

    end

    if e.ArcaneExplosion:IsCastable() and (t:ManaPercentageP() > 30 and g >= 6 and not O) then
        if i(e.ArcaneExplosion) then
            o = 1449
            return "arcane_explosion aoe 12"
        end

    end

    if e.Ebonbolt:IsCastable() and not t:IsMoving() and (w or s()) and (u >= 2) then
        if i(e.Ebonbolt, nil, nil, not a:IsSpellInRange(e.Ebonbolt)) then
            o = 257537
            return "ebonbolt aoe 13"
        end

    end

    local n = 7 - e.Blizzard:TimeSinceLastCast()
    if n < 0 then
        n = 0
    end

    if e.IceLance:IsCastable() and (O and (e.SplittingIce:IsAvailable() or u >= 5) and e.IceLance:TravelTime() < n) then
        if i(e.IceLance, nil, nil, not a:IsSpellInRange(e.IceLance)) then
            o = 30455
            return "ice_lance aoe 14"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() then
        if i(e.Frostbolt, nil, nil, not a:IsSpellInRange(e.Frostbolt)) then
            o = 116
            return "frostbolt aoe 15"
        end

    end

    if e.IceLance:IsCastable() then
        if i(e.IceLance, nil, nil, not a:IsSpellInRange(e.IceLance)) then
            o = 30455
            return "ice_lance aoe 16"
        end

    end

end

local function O()
    if r.ShadowedOrbofTorment:IsEquippedAndReady() and t:BuffDown(e.RuneofPowerBuff) and not t:IsMoving() then
        if i(r.ShadowedOrbofTorment, nil, nil) then
                        if r.ShadowedOrbofTorment:ID() == m then
                o = 24
                return "Orb of Torment 3 top"
            elseif r.ShadowedOrbofTorment:ID() == f then
                o = 30
                return "Orb of Torment 3 top"
            end

        end

    end

    if r.PotionofSpectralIntellect:IsReady() and s() and h.Commons.Enabled.Potions and C and ((t:BloodlustUp() and n.GUISettings.General.HoldPotforBL) or ((t:PrevGCDP(1, e.IcyVeins) or FightRemains < 30) and not n.GUISettings.General.HoldPotforBL)) then
        if i(r.PotionofSpectralIntellect, nil, nil) then
            o = 50
            return "potion cd 2"
        end

    end

    if e.Deathborne:IsCastable() and l and not t:IsMoving() then
        if i(e.Deathborne, nil, nil) then
            o = 324220
            return "deathborne cd 3"
        end

    end

    if e.MirrorsofTorment:IsCastable() and l and not t:IsMoving() and (u < 3 and (e.SiphonedMalice:ConduitEnabled() or e.WastelandPropriety:SoulbindEnabled()) and t:BuffDown(e.BrainFreezeBuff)) then
        if i(e.MirrorsofTorment, nil, nil) then
            o = 314793
            return "mirrors_of_torment cd 4"
        end

    end

    if e.RuneofPower:IsCastable() and not t:IsMoving() and (w or s()) and not t:IsMoving() and (e.IcyVeins:CooldownRemains() > 12 and t:BuffDown(e.RuneofPowerBuff)) then
        if i(e.RuneofPower, nil) then
            o = 116011
            return "rune_of_power cd 5"
        end

    end

    if e.IcyVeins:IsCastable() and s() and (t:BuffDown(e.RuneofPowerBuff) and (t:BuffDown(e.IcyVeins) or e.RuneofPower:IsAvailable()) and (t:BuffDown(e.SlickIceBuff) or (e.IcyPropulsion:ConduitEnabled() and (e.CometStorm:IsAvailable() or t:HasTier(28, 2))) or u >= 2)) then
        if i(e.IcyVeins, nil) then
            o = 12472
            return "icy_veins cd 6"
        end

    end

    if e.TimeWarp:IsCastable() and s() and h.Frost.UseTemporalWarp and (M and t:BloodlustExhaustUp() and t:BloodlustDown() and (t:BuffUp(e.IcyVeins) or FightRemains < 40)) then
        if i(e.TimeWarp, nil) then
            o = 80353
            return "time_warp cd 7"
        end

    end

    if (h.Commons.Enabled.TopTrinket or h.Commons.Enabled.BotTrinket) and s() then
        local e = t:GetUseableTrinkets(T)
        if e then
            if i(e, nil, nil) then
                                if e:ID() == m and h.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket 1"
                elseif e:ID() == f and h.Commons.Enabled.BotTrinket then
                    o = 30
                    return "top trinket 2"
                end

            end

        end

    end

    if e.BloodFury:IsCastable() and s() then
        if i(e.BloodFury, nil) then
            o = 20572
            return "blood_fury cd 9"
        end

    end

    if e.Berserking:IsCastable() and s() then
        if i(e.Berserking, nil) then
            o = 26297
            return "berserking cd 10"
        end

    end

    if e.LightsJudgment:IsCastable() and s() then
        if i(e.LightsJudgment, nil, nil, not a:IsSpellInRange(e.LightsJudgment)) then
            o = 255647
            return "lights_judgment cd 11"
        end

    end

    if e.Fireblood:IsCastable() and s() then
        if i(e.Fireblood, nil) then
            o = 265221
            return "fireblood cd 12"
        end

    end

    if e.AncestralCall:IsCastable() and s() then
        if i(e.AncestralCall, nil) then
            o = 274738
            return "ancestral_call cd 13"
        end

    end

    if e.BagofTricks:IsCastable() and s() then
        if i(e.BagofTricks, nil, nil, not a:IsSpellInRange(e.BagofTricks)) then
            o = 312411
            return "bag_of_tricks cd 14"
        end

    end

end

local function M()
    if e.ArcaneExplosion:IsCastable() and t:ManaPercentageP() > 30 and g >= 2 then
        if i(e.ArcaneExplosion) then
            o = 1449
            return "arcane_explosion move 16"
        end

    end

    if e.FireBlast:IsCastable() then
        if i(e.FireBlast) then
            o = 319836
            return "fire_blast move 17"
        end

    end

    if e.IceLance:IsCastable() then
        if i(e.IceLance, nil, nil, not a:IsSpellInRange(e.IceLance)) then
            o = 30455
            return "ice_lance move 6"
        end

    end

end

local function r()
    if e.Flurry:IsCastable() and (not t:IsMoving() or t:BuffUp(e.BrainFreezeBuff)) and (a:DebuffDown(e.WintersChillDebuff) and ((t:IsCasting(e.Ebonbolt) or t:PrevGCD(1, e.Ebonbolt)) or (t:BuffUp(e.BrainFreezeBuff) and ((t:IsCasting(e.GlacialSpike) or t:PrevGCD(1, e.GlacialSpike)) or ((t:IsCasting(e.Frostbolt) or t:PrevGCD(1, e.Frostbolt)) and (not e.IreOfTheAscended:ConduitEnabled() or e.RadiantSpark:CooldownRemains() > 0 or _)) or (t:IsCasting(e.RadiantSpark) or t:PrevGCD(1, e.RadiantSpark)) or (t:BuffDownP(e.FingersofFrostBuff) and (a:DebuffUp(e.MirrorsofTorment) or t:BuffUp(e.FreezingWindsBuff) or t:BuffUp(e.ExpandedPotentialBuff))))))) then
        if i(e.Flurry, nil, nil, not a:IsSpellInRange(e.Flurry)) then
            o = 44614
            return "flurry single 1"
        end

    end

    if FrozenOrb:IsCastable() and not H and (w or s()) then
        if i(FrozenOrb, nil, nil, not a:IsInRange(40)) then
            o = 198149
            return "frozen_orb single 2"
        end

    end

    if e.CometStorm:IsCastable() and (a:DebuffUp(e.WintersChillDebuff)) then
        if i(e.CometStorm, nil, nil, not a:IsSpellInRange(e.CometStorm)) then
            o = 153595
            return "comet_storm single 7"
        end

    end

    if e.IceLance:IsCastable() and (e.SplittingIce:IsAvailable() and e.ChainReaction:IsAvailable() and t:BuffStack(e.FingersofFrostBuff) == 2) then
        if i(e.IceLance, nil, nil, not a:IsSpellInRange(e.IceLance)) then
            o = 30455
            return "ice_lance single 6"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (b and (p or y) and t:BuffRemains(e.Deathborne) > (e.Frostbolt:CastTime() + e.Frostbolt:TravelTime()) and d >= 2) then
        if i(e.Frostbolt, nil, nil, not a:IsSpellInRange(e.Frostbolt)) then
            o = 116
            return "frostbolt single 8"
        end

    end

    if e.Blizzard:IsCastable() and not t:IsMoving() and ((not y or (not e.IcyPropulsion:ConduitEnabled() and t:BuffDown(e.Deathborne))) and d >= 2) then
        if i(e.Blizzard, nil, nil, not a:IsInRange(40)) then
            o = 190356
            return "blizzard single 3"
        end

    end

    if e.RayofFrost:IsCastable() and not t:IsMoving() and s() and (a:DebuffStack(e.WintersChillDebuff) == 1) then
        if i(e.RayofFrost, nil, nil, not a:IsSpellInRange(e.RayofFrost)) then
            o = 205021
            return "ray_of_frost single 4"
        end

    end

    if e.GlacialSpike:IsCastable() and not t:IsMoving() and (a:DebuffUp(e.WintersChillDebuff) and a:DebuffRemains(e.WintersChillDebuff) > e.GlacialSpike:CastTime() + e.GlacialSpike:TravelTime()) then
        if i(e.GlacialSpike, nil, nil, not a:IsSpellInRange(e.GlacialSpike)) then
            o = 199786
            return "glacial_spike single 5"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (a:DebuffStack(e.WintersChillDebuff) == 1 and (Y() > e.IceLance:TravelTime() and e.CometStorm:IsAvailable())) then
        if i(e.Frostbolt, nil, nil, not a:IsSpellInRange(e.Frostbolt)) then
            o = 116
            return "frostbolt single 16"
        end

    end

    if e.IceLance:IsCastable() and (a:DebuffUp(e.WintersChillDebuff) and a:DebuffStack(e.WintersChillDebuff) > t:BuffStack(e.FingersofFrostBuff) and a:DebuffRemains(e.WintersChillDebuff) > e.IceLance:TravelTime()) then
        if i(e.IceLance, nil, nil, not a:IsSpellInRange(e.IceLance)) then
            o = 30455
            return "ice_lance single 16"
        end

    end

    if e.IceNova:IsCastable() then
        if i(e.IceNova, nil, nil, not a:IsSpellInRange(e.IceNova)) then
            o = 157997
            return "ice_nova single 8"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and l and (t:BuffUp(e.FreezingWindsBuff) and d == 1) then
        if i(e.RadiantSpark, nil, nil, not a:IsSpellInRange(e.RadiantSpark)) then
            o = 307443
            return "radiant_spark single 9"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and l and (t:BuffUp(e.BrainFreezeBuff) and e.GlacialSpike:IsAvailable() and e.IreOfTheAscended:ConduitEnabled() and t:BuffStack(e.IciclesBuff) >= 4) then
        if i(e.RadiantSpark, nil, nil, not a:IsSpellInRange(e.RadiantSpark)) then
            o = 307443
            return "radiant_spark single 10"
        end

    end

    if e.IceLance:IsCastable() and (t:BuffUp(e.FingersofFrostBuff) or F() > e.IceLance:TravelTime()) then
        if i(e.IceLance, nil, nil, not a:IsSpellInRange(e.IceLance)) then
            o = 30455
            return "ice_lance single 11"
        end

    end

    if e.Ebonbolt:IsCastable() and not t:IsMoving() and (w or s()) then
        if i(e.Ebonbolt, nil, nil, not a:IsSpellInRange(e.Ebonbolt)) then
            o = 257537
            return "ebonbolt single 12"
        end

    end

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and l and ((not e.GlacialSpike:IsAvailable() or not e.IreOfTheAscended:ConduitEnabled()) and (not _ or x >= 2) and t:BuffUp(e.BrainFreezeBuff)) then
        if i(e.RadiantSpark, nil, nil, not a:IsSpellInRange(e.RadiantSpark)) then
            o = 307443
            return "radiant_spark single 13"
        end

    end

    if l then
        if e.MirrorsofTorment:IsCastable() and not t:IsMoving() and l then
            if i(e.MirrorsofTorment, nil, nil) then
                o = 314793
                return "mirrors_of_torment single 14"
            end

        end

        if e.ShiftingPower:IsCastable() and not t:IsMoving() and l and (t:BuffDown(e.RuneofPowerBuff) and (W or e.GroveInvigoration:IsAvailable() or e.FieldOfBlossoms:IsAvailable() or (_ and t:BuffDown(e.FreezingWindsBuff)) or d >= 2)) then
            if i(e.ShiftingPower, nil, nil, not a:IsInRange(18)) then
                o = 314791
                return "shifting_power single 15"
            end

        end

    end

    if e.ArcaneExplosion:IsCastable() and (z and v <= 0 and k.DC.Arcane == 0) then
        if i(e.ArcaneExplosion) then
            o = 1449
            return "arcane_explosion single 16"
        end

    end

    if e.FireBlast:IsCastable() and (z and v <= 0 and k.DC.Fire == 0) then
        if i(e.FireBlast) then
            o = 319836
            return "fire_blast single 17"
        end

    end

    if e.GlacialSpike:IsCastable() and not t:IsMoving() and (t:BuffUp(e.BrainFreezeBuff)) then
        if i(e.GlacialSpike, nil, nil, not a:IsSpellInRange(e.GlacialSpike)) then
            o = 199786
            return "glacial_spike single 18"
        end

    end

    if e.Frostbolt:IsCastable() and not t:IsMoving() then
        if i(e.Frostbolt, nil, nil, not a:IsSpellInRange(e.Frostbolt)) then
            o = 116
            return "frostbolt single 19"
        end

    end

    if e.IceLance:IsCastable() then
        if i(e.IceLance, nil, nil, not a:IsSpellInRange(e.IceLance)) then
            o = 30455
            return "ice_lance aoe 16"
        end

    end

end

local function s()
    N = HeroRotationCharDB.Toggles[6]
    l = HeroRotationCharDB.Toggles[4]
    w = HeroRotationCharDB.Toggles[5]
    P = HeroRotationCharDB.Toggles[12]
    C = HeroRotationCharDB.Toggles[15]
    U = HeroRotationCharDB.Toggles[60]
    H = HeroRotationCharDB.Toggles[100]
    m = GetInventoryItemID("player", 13)
    f = GetInventoryItemID("player", 14)
            if not h.Commons.Enabled.TopTrinket and not h.Commons.Enabled.BotTrinket then
        T = { m, f }
    elseif not h.Commons.Enabled.TopTrinket then
        T = { m }
    elseif not h.Commons.Enabled.BotTrinket then
        T = { f }
    end

end

local function l()
    FrozenOrb = e.FrozenOrb
    D = a:GetEnemiesInSplashRange(8)
        if S() and h.Commons.AoeMode == "Conservative" then
        E = a:GetEnemiesInSplashRangeCount(6)
        u = a:GetEnemiesInSplashRangeCount(8)
        d = a:GetEnemiesInSplashRangeCount(16)
        x = #t:GetEnemiesInMeleeRange(15)
        g = #t:GetEnemiesInMeleeRange(8)
    elseif S() and h.Commons.AoeMode == "Aggresive" then
        local a = 0
        for e = 1, 20 do
            local e = "nameplate" .. e
            if UnitExists(e) then
                if UnitCanAttack("player", e) then
                    if (UnitCanAttack("player", e) and UnitAffectingCombat("target") and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil) or j(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) or string.find(UnitGUID(e), 182778) or string.find(UnitGUID(e), 183945) then
                        a = (a + 1)
                    end

                end

            end

        end

        x = #t:GetEnemiesInMeleeRange(15)
        g = #t:GetEnemiesInMeleeRange(15)
        E = a
        u = a
        d = a
    end

    if not S() then
        x = 1
        g = 1
        E = 1
        u = 1
        d = 1
    end

    if U then
        E = 10
        d = 10
        u = 10
    end

    if not BotOn then
        A = 0
        o = 0
    end

    if A > 0 then
        A = 0
    end

    if o > 0 then
        o = 0
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

    if t:IsChanneling(q(314791)) then
        if i(e.Pool) then
            o = 999999
            return "channeling"
        end

    end

    if t:IsChanneling(q(324631)) then
        if i(e.Pool) then
            o = 999999
            return "channeling"
        end

    end

    if t:IsChanneling() or t:IsChanneling(e.ShiftingPower) then
        if i(e.Pool, nil) then
            o = 99999
            return "Trinket Channel"
        end

    end

    if t:IsChanneling(q(324631)) then
        if i(e.Pool) then
            o = 999999
            return "channeling"
        end

    end

    k.IFTracker()
    FightRemains = c.FightRemains(D, false)
    L = e.DisciplinaryCommandBuff:TimeSinceLastAppliedOnPlayer()
    v = 30 - L
    if v < 0 then
        v = 0
    end

    k.DCCheck()
    if not t:AffectingCombat() and I.TargetIsValid() and N then
        local e = R()
        if e then
            return e
        end

    end

    if I.TargetIsValid() and t:AffectingCombat() and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or a:NPCID() == 176581 or a:NPCID() == 176920 or a:NPCID() == 177892 or a:NPCID() == 182778 or a:NPCID() == 185402 or a:NPCID() == 183945 or a:NPCID() == 182074 or a:NPCID() == 184737 or a:NPCID() == 179733 or a:NPCID() == 115402 or a:NPCID() == 115406 or a:NPCID() == 115395 or UnitExists("boss1") or a:NPCID() == 115388 or N) and not t:IsDeadOrGhost() then
        if t:HealthPercentage() < h.Frost.IceBlockHP and e.IceBlock:IsReady() then
            if i(e.IceBlock, nil) then
                o = 45438
                return "IceBlock HP"
            end

        end

        if t:HealthPercentage() < h.Frost.IceBarrierHP and e.IceBarrier:IsReady() then
            if i(e.IceBarrier, nil) then
                o = 11426
                return "IceBarrier HP"
            end

        end

        if t:HealthPercentage() < h.Frost.MirrorImageHP and e.MirrorImage:IsReady() then
            if i(e.MirrorImage, nil) then
                o = 55342
                return "MirrorImage HP"
            end

        end

        if t:IsMoving() then
            local e = M()
            if e then
                return e
            end

        end

        if true then
            local e = O()
            if e then
                return e
            end

        end

        if d >= 3 then
            local e = V()
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

local e, e = ...
local e = HeroDBC.DBC
local u = HeroLib
local e = HeroCache
local x = u.Unit
local t = x.Player
local o = x.Target
local e = x.Pet
local b = u.Spell
local e = u.MultiSpell
local a = u.Item
local n = HeroRotation
local i = n.Cast
local e = n.CastLeft
local s = n.CDsON
local I = n.AoEON
local e = n.CastSuggested
local d = HeroRotationCharDB.Toggles[4]
local y = HeroRotationCharDB.Toggles[5]
local N = HeroRotationCharDB.Toggles[6]
local D = HeroRotationCharDB.Toggles[15]
local P = HeroRotationCharDB.Toggles[12]
local U = HeroRotationCharDB.Toggles[60]
local O = HeroRotationCharDB.Toggles[100]
local e = false
local q = n.Commons.Mage
local R = math.max
local e = b.Mage.Frost
local h = a.Mage.Frost
local r = t:GetEquipment()
local c = a(0)
local l = a(0)
local A = { h.ShadowedOrbofTorment:ID() }
local m = GetInventoryItemID("player", 13)
local f = GetInventoryItemID("player", 14)
if r[13] then
    c = a(r[13])
end

if r[14] then
    l = a(r[14])
end

local _, c, l
local z, g
local W
local v
local Y
local a
local p = t:HasLegendaryEquipped(2)
local w = t:HasLegendaryEquipped(3)
local E = t:HasLegendaryEquipped(4)
local H = t:HasLegendaryEquipped(5)
local T = t:HasLegendaryEquipped(7)
local L = t:HasLegendaryEquipped(8)
local F = t:HasLegendaryEquipped(9)
local k = t:HasLegendaryEquipped(221) or (t:HasUnity() and e.Deathborne:IsAvailable())
local M = t:HasLegendaryEquipped(260) or (t:HasUnity() and e.ShiftingPower:IsAvailable())
local j = 0
local a = 0
local r = 0
local S = n.Commons.Everyone
local r = { General = n.GUISettings.General, Commons = n.GUISettings.APL.Mage.Commons, Frost = n.GUISettings.APL.Mage.Frost }
e.FrozenOrb:RegisterInFlightEffect(84721)
e.FrozenOrb:RegisterInFlight()
u:RegisterForEvent(function()
    e.FrozenOrb:RegisterInFlight()
end, "LEARNED_SPELL_IN_TAB")
e.Frostbolt:RegisterInFlightEffect(228597)
e.Frostbolt:RegisterInFlight()
e.Flurry:RegisterInFlightEffect(228354)
e.Flurry:RegisterInFlight()
e.IceLance:RegisterInFlightEffect(228598)
e.IceLance:RegisterInFlight()
u:RegisterForEvent(function()
    p = t:HasLegendaryEquipped(2)
    w = t:HasLegendaryEquipped(3)
    E = t:HasLegendaryEquipped(4)
    H = t:HasLegendaryEquipped(5)
    T = t:HasLegendaryEquipped(7)
    L = t:HasLegendaryEquipped(8)
    F = t:HasLegendaryEquipped(9)
    k = t:HasLegendaryEquipped(221) or (t:HasUnity() and e.Deathborne:IsAvailable())
    M = t:HasLegendaryEquipped(260) or (t:HasUnity() and e.ShiftingPower:IsAvailable())
end, "PLAYER_EQUIPMENT_CHANGED")
local L = t:CovenantID()
u:RegisterForEvent(function()
    L = t:CovenantID()
end, "COVENANT_CHOSEN")
local function L(e)
    if e then
        return 1
    else
        return 0
    end

end

local function L(e)
    return e ~= 0
end

local function C()
    return R(o:DebuffRemains(e.Frostbite), o:DebuffRemains(e.Freeze), o:DebuffRemains(e.FrostNova))
end

local function L()
    local t = 1
    local a = 7
    local o = .2
    local t = t + (o * a)
    return R(t - e.CometStorm:TimeSinceLastCast(), 0)
end

local function R()
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

    if S.TargetIsValid() then
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
                elseif h.TomeofMonstruousConstructions:ID() == f then
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
                elseif h.ShadowedOrbofTorment:ID() == f then
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
    if FrozenOrb:IsCastable() and not O and (y or s()) then
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
        if (l == 5 and (e.FreezingRain:IsAvailable() or e.BoneChilling:IsAvailable() or e.ShiveringCore:ConduitEnabled() or not w)) then
            if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
                a = 190356
                return "blizzard aoe 12"
            end

        end

        if (l == 4 and (e.FreezingRain:IsAvailable() or (e.BoneChilling:IsAvailable() and e.ShiveringCore:ConduitEnabled()) or ((not w) and not p))) then
            if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
                a = 190356
                return "blizzard aoe 22"
            end

        end

        if (l <= 3 and (not p) and (not w) and e.ShiveringCore:ConduitEnabled() and (e.FreezingRain:IsAvailable() or e.BoneChilling:IsAvailable())) then
            if i(e.Blizzard, nil, nil, not o:IsInRange(40)) then
                a = 190356
                return "blizzard aoe 32"
            end

        end

    end

    if e.Flurry:IsCastable() and (not t:IsMoving() or t:BuffUp(e.BrainFreezeBuff)) and (o:DebuffDown(e.WintersChillDebuff) and (t:IsCasting(e.Ebonbolt) or (t:BuffUp(e.BrainFreezeBuff) and (t:BuffDownP(e.FingersofFrostBuff) or (k and (t:PrevGCD(1, e.Frostbolt) or t:IsCasting(e.Frostbolt)) and (w or p) and t:BuffUp(e.Deathborne)))))) then
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

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (k and (w or p) and t:BuffRemains(e.Deathborne) > e.Frostbolt:CastTime() + e.Frostbolt:TravelTime()) then
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

    if e.IceLance:IsCastable() and (t:BuffUp(e.FingersofFrostBuff) or C() > e.IceLance:TravelTime() or (o:DebuffStack(e.WintersChillDebuff) >= 1 and o:DebuffRemains(e.WintersChillDebuff) > e.IceLance:TravelTime())) then
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

    if e.FireBlast:IsCastable() and (T and v <= 0 and q.DC.Fire == 0) then
        if i(e.FireBlast) then
            a = 319836
            return "fire_blast aoe 11"
        end

    end

    if e.ArcaneExplosion:IsCastable() and (t:ManaPercentageP() > 30 and g >= 6 and not H) then
        if i(e.ArcaneExplosion) then
            a = 1449
            return "arcane_explosion aoe 12"
        end

    end

    if e.Ebonbolt:IsCastable() and not t:IsMoving() and (y or s()) and (c >= 2) then
        if i(e.Ebonbolt, nil, nil, not o:IsSpellInRange(e.Ebonbolt)) then
            a = 257537
            return "ebonbolt aoe 13"
        end

    end

    local n = 7 - e.Blizzard:TimeSinceLastCast()
    if n < 0 then
        n = 0
    end

    if e.IceLance:IsCastable() and (H and (e.SplittingIce:IsAvailable() or c >= 5) and e.IceLance:TravelTime() < n) then
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

local function B()
    if h.ShadowedOrbofTorment:IsEquippedAndReady() and t:BuffDown(e.RuneofPowerBuff) and not t:IsMoving() then
        if i(h.ShadowedOrbofTorment, nil, nil) then
                        if h.ShadowedOrbofTorment:ID() == m then
                a = 24
                return "Orb of Torment 3 top"
            elseif h.ShadowedOrbofTorment:ID() == f then
                a = 30
                return "Orb of Torment 3 top"
            end

        end

    end

    if h.PotionofSpectralIntellect:IsReady() and s() and r.Commons.Enabled.Potions and D and ((t:BloodlustUp() and n.GUISettings.General.HoldPotforBL) or ((t:PrevGCDP(1, e.IcyVeins) or FightRemains < 30) and not n.GUISettings.General.HoldPotforBL)) then
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

    if e.MirrorsofTorment:IsCastable() and d and not t:IsMoving() and (c < 3 and (e.SiphonedMalice:ConduitEnabled() or e.WastelandPropriety:SoulbindEnabled()) and t:BuffDown(e.BrainFreezeBuff)) then
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

    if e.IcyVeins:IsCastable() and s() and (t:BuffDown(e.RuneofPowerBuff) and (t:BuffDown(e.IcyVeins) or e.RuneofPower:IsAvailable()) and (t:BuffDown(e.SlickIceBuff) or (e.IcyPropulsion:ConduitEnabled() and (e.CometStorm:IsAvailable() or t:HasTier(28, 2))) or c >= 2)) then
        if i(e.IcyVeins, nil) then
            a = 12472
            return "icy_veins cd 6"
        end

    end

    if e.TimeWarp:IsCastable() and s() and r.Frost.UseTemporalWarp and (F and t:BloodlustExhaustUp() and t:BloodlustDown() and (t:BuffUp(e.IcyVeins) or FightRemains < 40)) then
        if i(e.TimeWarp, nil) then
            a = 80353
            return "time_warp cd 7"
        end

    end

    if (r.Commons.Enabled.TopTrinket or r.Commons.Enabled.BotTrinket) and s() then
        local e = t:GetUseableTrinkets(A)
        if e then
            if i(e, nil, nil) then
                                if e:ID() == m and r.Commons.Enabled.TopTrinket then
                    a = 24
                    return "top trinket 1"
                elseif e:ID() == f and r.Commons.Enabled.BotTrinket then
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
    if e.ArcaneExplosion:IsCastable() and t:ManaPercentageP() > 30 and g >= 2 then
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

local function H()
    if e.Flurry:IsCastable() and (not t:IsMoving() or t:BuffUp(e.BrainFreezeBuff)) and (o:DebuffDown(e.WintersChillDebuff) and ((t:IsCasting(e.Ebonbolt) or t:PrevGCD(1, e.Ebonbolt)) or (t:BuffUp(e.BrainFreezeBuff) and ((t:IsCasting(e.GlacialSpike) or t:PrevGCD(1, e.GlacialSpike)) or ((t:IsCasting(e.Frostbolt) or t:PrevGCD(1, e.Frostbolt)) and (not e.IreOfTheAscended:ConduitEnabled() or e.RadiantSpark:CooldownRemains() > 0 or E)) or (t:IsCasting(e.RadiantSpark) or t:PrevGCD(1, e.RadiantSpark)) or (t:BuffDownP(e.FingersofFrostBuff) and (o:DebuffUp(e.MirrorsofTorment) or t:BuffUp(e.FreezingWindsBuff) or t:BuffUp(e.ExpandedPotentialBuff))))))) then
        if i(e.Flurry, nil, nil, not o:IsSpellInRange(e.Flurry)) then
            a = 44614
            return "flurry single 1"
        end

    end

    if FrozenOrb:IsCastable() and not O and (y or s()) then
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

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (k and (w or p) and t:BuffRemains(e.Deathborne) > (e.Frostbolt:CastTime() + e.Frostbolt:TravelTime()) and l >= 2) then
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

    if e.Frostbolt:IsCastable() and not t:IsMoving() and (o:DebuffStack(e.WintersChillDebuff) == 1 and (L() > e.IceLance:TravelTime() and e.CometStorm:IsAvailable())) then
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

    if e.IceLance:IsCastable() and (t:BuffUp(e.FingersofFrostBuff) or C() > e.IceLance:TravelTime()) then
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

    if e.RadiantSpark:IsCastable() and not t:IsMoving() and d and ((not e.GlacialSpike:IsAvailable() or not e.IreOfTheAscended:ConduitEnabled()) and (not E or z >= 2) and t:BuffUp(e.BrainFreezeBuff)) then
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

        if e.ShiftingPower:IsCastable() and not t:IsMoving() and d and (t:BuffDown(e.RuneofPowerBuff) and (M or e.GroveInvigoration:IsAvailable() or e.FieldOfBlossoms:IsAvailable() or (E and t:BuffDown(e.FreezingWindsBuff)) or l >= 2)) then
            if i(e.ShiftingPower, nil, nil, not o:IsInRange(18)) then
                a = 314791
                return "shifting_power single 15"
            end

        end

    end

    if e.ArcaneExplosion:IsCastable() and (T and v <= 0 and q.DC.Arcane == 0) then
        if i(e.ArcaneExplosion) then
            a = 1449
            return "arcane_explosion single 16"
        end

    end

    if e.FireBlast:IsCastable() and (T and v <= 0 and q.DC.Fire == 0) then
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
    N = HeroRotationCharDB.Toggles[6]
    d = HeroRotationCharDB.Toggles[4]
    y = HeroRotationCharDB.Toggles[5]
    P = HeroRotationCharDB.Toggles[12]
    D = HeroRotationCharDB.Toggles[15]
    U = HeroRotationCharDB.Toggles[60]
    O = HeroRotationCharDB.Toggles[100]
    m = GetInventoryItemID("player", 13)
    f = GetInventoryItemID("player", 14)
            if not r.Commons.Enabled.TopTrinket and not r.Commons.Enabled.BotTrinket then
        A = { m, f }
    elseif not r.Commons.Enabled.TopTrinket then
        A = { m }
    elseif not r.Commons.Enabled.BotTrinket then
        A = { f }
    end

end

local function d()
    FrozenOrb = e.FrozenOrb
    W = o:GetEnemiesInSplashRange(8)
        if I() and r.Commons.AoeMode == "Conservative" then
        _ = o:GetEnemiesInSplashRangeCount(6)
        c = o:GetEnemiesInSplashRangeCount(8)
        l = o:GetEnemiesInSplashRangeCount(16)
        z = #t:GetEnemiesInMeleeRange(15)
        g = #t:GetEnemiesInMeleeRange(8)
    elseif I() and r.Commons.AoeMode == "Aggresive" then
        local a = 0
        for e = 1, 20 do
            local e = "nameplate" .. e
            if UnitExists(e) then
                if UnitCanAttack("player", e) then
                    if (UnitCanAttack("player", e) and UnitAffectingCombat("target") and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil) or x(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) or string.find(UnitGUID(e), 182778) or string.find(UnitGUID(e), 183945) then
                        a = (a + 1)
                    end

                end

            end

        end

        z = #t:GetEnemiesInMeleeRange(15)
        g = #t:GetEnemiesInMeleeRange(15)
        _ = a
        c = a
        l = a
    end

    if not I() then
        z = 1
        g = 1
        _ = 1
        c = 1
        l = 1
    end

    if U then
        _ = 10
        l = 10
        c = 10
    end

    if not BotOn then
        j = 0
        a = 0
    end

    if j > 0 then
        j = 0
    end

    if a > 0 then
        a = 0
    end

    ShouldReturn = s()
    if n.QueuedCast() then
        a = n.QueuedCast()
        return "Custom Queue " .. b(a):ID()
    end

        if n.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (n.GUISettings.General.OpenerReset)
    elseif n.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        n.ToggleIconFrame:UpdateButtonText(6)
        n.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

    if t:IsChanneling(b(314791)) then
        if i(e.Pool) then
            a = 999999
            return "channeling"
        end

    end

    if t:IsChanneling(b(324631)) then
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

    if t:IsChanneling(b(324631)) then
        if i(e.Pool) then
            a = 999999
            return "channeling"
        end

    end

    q.IFTracker()
    FightRemains = u.FightRemains(W, false)
    Y = e.DisciplinaryCommandBuff:TimeSinceLastAppliedOnPlayer()
    v = 30 - Y
    if v < 0 then
        v = 0
    end

    q.DCCheck()
    if not t:AffectingCombat() and S.TargetIsValid() and N then
        local e = R()
        if e then
            return e
        end

    end

    if S.TargetIsValid() and t:AffectingCombat() and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or o:NPCID() == 176581 or o:NPCID() == 176920 or o:NPCID() == 177892 or o:NPCID() == 182778 or o:NPCID() == 185402 or o:NPCID() == 183945 or o:NPCID() == 182074 or o:NPCID() == 184737 or o:NPCID() == 179733 or o:NPCID() == 115402 or o:NPCID() == 115406 or o:NPCID() == 115395 or UnitExists("boss1") or o:NPCID() == 115388 or N) and not t:IsDeadOrGhost() then
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
            local e = B()
            if e then
                return e
            end

        end

        if l >= 3 then
            local e = V()
            if e then
                return e
            end

        end

        if l < 3 then
            local e = H()
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
    if j == 0 then
        return 0
    else
        return j
    end

end

n.SetAPL(64, d, e)

