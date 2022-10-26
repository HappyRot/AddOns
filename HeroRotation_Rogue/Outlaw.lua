local e, e = ...
local e = HeroDBC.DBC
local w = HeroLib
local r = HeroCache
local u = w.Unit
local t = u.Player
local n = u.Target
local l = w.Spell
local e = w.MultiSpell
local o = w.Item
local a = HeroRotation
local I = a.AoEON
local c = a.CDsON
local f = HeroRotationCharDB.Toggles[4]
local de = HeroRotationCharDB.Toggles[5]
local j = HeroRotationCharDB.Toggles[6]
local P = HeroRotationCharDB.Toggles[12]
local ie = not HeroRotationCharDB.Toggles[15]
local T = HeroRotationCharDB.Toggles[21]
local J = HeroRotationCharDB.Toggles[52]
local V = HeroRotationCharDB.Toggles[22]
local W = HeroRotationCharDB.Toggles[23]
local Y = HeroRotationCharDB.Toggles[24]
local F = HeroRotationCharDB.Toggles[25]
local L = HeroRotationCharDB.Toggles[27]
local U = HeroRotationCharDB.Toggles[50]
local C = HeroRotationCharDB.Toggles[51]
local M = HeroRotationCharDB.Toggles[53]
local B = HeroRotationCharDB.Toggles[30]
local ae = HeroRotationCharDB.Toggles[54]
local E = 0
local ne = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 158337 }
local se = math.min
local Q = math.abs
local X = nil
local G = nil
local x = GetInventoryItemID("player", 13)
local z = GetInventoryItemID("player", 14)
local q = a.Commons.Everyone
local d = a.Commons.Rogue
local i = { General = a.GUISettings.General, Commons = a.GUISettings.APL.Rogue.Commons, Commons2 = a.GUISettings.APL.Rogue.Commons2, Outlaw = a.GUISettings.APL.Rogue.Outlaw }
local e = l.Rogue.Outlaw
local s = o.Rogue.Outlaw
local _ = { s.ComputationDevice:ID(), s.VigorTrinket:ID(), s.FontOfPower:ID(), s.RazorCoral:ID(), s.CacheOfAcquiredTreasures:ID(), s.MistcallerOcarina:ID() }
e.Dispatch:RegisterDamageFormula(function()
    return t:AttackPowerDamageMod() * d.CPSpend() * .35 * 1.13 * (1 + t:VersatilityDmgPct() / 100) * (n:DebuffUp(e.GhostlyStrike) and 1.1 or 1) * (n:DebuffUp(e.SinfulRevelationDebuff) and 1.06 or 1)
end)
local R, D, p
local h
local o = d.ReturnSpell()
local m = d.ReturnSpellMO()
local N = 6
local K
local y, v, g
local b = { { e.Blind, "Cast Blind (Interrupt)", function()
    return true
end } }
local Z = t:HasLegendaryEquipped(116)
local k = t:HasLegendaryEquipped(117)
local ee = t:HasLegendaryEquipped(129)
local A = t:HasLegendaryEquipped(114)
w:RegisterForEvent(function()
    ee = t:HasLegendaryEquipped(129)
    Z = t:HasLegendaryEquipped(116)
    k = t:HasLegendaryEquipped(117)
    A = t:HasLegendaryEquipped(114)
end, "PLAYER_EQUIPMENT_CHANGED")
local te = t:Covenant()
w:RegisterForEvent(function()
    te = t:Covenant()
end, "COVENANT_CHOSEN")
local function b(e)
    if e then
        return 1
    else
        return 0
    end

end

local H, O = 0, 0
local function S()
    local e = t:EnergyTimeToMaxPredicted()
    if Q(H - e) > 1 then
        H = e
    end

    return H
end

local function oe()
    local e = t:EnergyPredicted()
    if Q(O - e) > 9 then
        O = e
    end

    return O
end

local function re(a)
    y = a
    if ((a == 2 and t:BuffUp(e.EchoingReprimand2)) or (a == 3 and t:BuffUp(e.EchoingReprimand3)) or (a == 4 and t:BuffUp(e.EchoingReprimand4)) or (a == 5 and t:BuffUp(e.EchoingReprimand5))) then
        y = 7
        return 7
    else
        y = a
        return a
    end

    local o, i = UnitAttackSpeed("unit")
    local o = (o + i) / 2
    local o = o / 2
    local i = (4 - meleeswings) * o
    local o = (5 - meleeswings) * o
    if y > a and g > 2 and t:AffectingCombat() then
        if a == 2 and not t:BuffUp(e.EchoingReprimand3) or a == 3 and not t:BuffUp(e.EchoingReprimand4) or a == 4 and not t:BuffUp(e.EchoingReprimand5) then
            local e = i
            if e == 0 then
                e = o
            end

            if e < (mathmax(t:EnergyTimeToX(35), t:GCDRemains()) + .5) then
                y = a
            end

        end

    end

end

local function le(e)
    return e:TimeToDie()
end

local function ue(e)
                if ((e:FilteredTimeToDie("<", t:ComboPointsDeficit() * 1.5) or (not t:StealthUp(true, false) and t:ComboPointsDeficit() >= d.CPMaxSpend() - 1)) and e:GUID() == u("mouseover"):GUID() and e:NPCID() ~= 170234 and i.Outlaw.TargetSwap == "Mouseover") then
        m = 1376195
        return true
    elseif ((e:FilteredTimeToDie("<", t:ComboPointsDeficit() * 1.5) or (not t:StealthUp(true, false) and t:ComboPointsDeficit() >= d.CPMaxSpend() - 1)) and i.Outlaw.TargetSwap == "AutoSwap" and e:GUID() ~= n:GUID() and e:NPCID() ~= 170234 and not P) then
        m = 999
        return true
    elseif ((e:FilteredTimeToDie("<", t:ComboPointsDeficit() * 1.5) or (not t:StealthUp(true, false) and t:ComboPointsDeficit() >= d.CPMaxSpend() - 1)) and e:GUID() == n:GUID() and e:NPCID() ~= 170234) then
        o = 137619
        return true
    elseif (e:FilteredTimeToDie("<", t:ComboPointsDeficit() * 1.5) or (not t:StealthUp(true, false) and t:ComboPointsDeficit() >= d.CPMaxSpend() - 1)) and e:NPCID() ~= 170234 then
        return true
    end

end

local O = { e.Broadside, e.BuriedTreasure, e.GrandMelee, e.RuthlessPrecision, e.SkullandCrossbones, e.TrueBearing }
local function H(e, a)
    if not r.APLVar.RtB_List then
        r.APLVar.RtB_List = {  }
    end

    if not r.APLVar.RtB_List[e] then
        r.APLVar.RtB_List[e] = {  }
    end

    local o = table.concat(a)
    if e == "All" then
        if not r.APLVar.RtB_List[e][o] then
            local i = 0
            for e = 1, #a do
                if t:BuffUp(O(a[e])) then
                    i = i + 1
                end

            end

            r.APLVar.RtB_List[e][o] = i == #a and true or false
        end

    else
        if not r.APLVar.RtB_List[e][o] then
            r.APLVar.RtB_List[e][o] = false
            for i = 1, #a do
                if t:BuffUp(O(a[i])) then
                    r.APLVar.RtB_List[e][o] = true
                    break
                end

            end

        end

    end

    return r.APLVar.RtB_List[e][o]
end

local function H()
    if not r.APLVar.RtB_Buffs then
        r.APLVar.RtB_Buffs = 0
        for e = 1, #O do
            if t:BuffUp(O[e]) then
                r.APLVar.RtB_Buffs = r.APLVar.RtB_Buffs + 1
            end

        end

    end

    return r.APLVar.RtB_Buffs
end

local function Q()
    if not r.APLVar.RtB_Reroll then
                                                        if i.Outlaw.RolltheBonesLogic == "1+ Buff" then
            r.APLVar.RtB_Reroll = (H() <= 0) and true or false
        elseif i.Outlaw.RolltheBonesLogic == "Broadside" then
            r.APLVar.RtB_Reroll = (not t:BuffUp(e.Broadside)) and true or false
        elseif i.Outlaw.RolltheBonesLogic == "Buried Treasure" then
            r.APLVar.RtB_Reroll = (not t:BuffUp(e.BuriedTreasure)) and true or false
        elseif i.Outlaw.RolltheBonesLogic == "Grand Melee" then
            r.APLVar.RtB_Reroll = (not t:BuffUp(e.GrandMelee)) and true or false
        elseif i.Outlaw.RolltheBonesLogic == "Skull and Crossbones" then
            r.APLVar.RtB_Reroll = (not t:BuffUp(e.SkullandCrossbones)) and true or false
        elseif i.Outlaw.RolltheBonesLogic == "Ruthless Precision" then
            r.APLVar.RtB_Reroll = (not t:BuffUp(e.RuthlessPrecision)) and true or false
        elseif i.Outlaw.RolltheBonesLogic == "True Bearing" then
            r.APLVar.RtB_Reroll = (not t:BuffUp(e.TrueBearing)) and true or false
        else
            r.APLVar.RtB_Reroll = (H() < 2 and (not t:BuffUp(e.TrueBearing) and not t:BuffUp(e.Broadside))) and true or false
        end

        if q.IsSoloMode() then
                        if t:BuffUp(e.GrandMelee) then
                if t:IsTanking(n) or t:HealthPercentage() < se(i.Outlaw.RolltheBonesLeechKeepHP, i.Outlaw.RolltheBonesLeechRerollHP) then
                    r.APLVar.RtB_Reroll = false
                end

            elseif t:HealthPercentage() < i.Outlaw.RolltheBonesLeechRerollHP then
                r.APLVar.RtB_Reroll = true
            end

        end

    end

    return r.APLVar.RtB_Reroll
end

local function r()
    if e.BetweentheEyes:CooldownUp() and y < 5 then
        return false
    end

    return v >= (d.CPMaxSpend() - b(t:BuffUp(e.Broadside)) - (b(t:BuffUp(e.Opportunity)) * b(e.QuickDraw:IsAvailable()))) or y >= d.CPMaxSpend()
end

local function O()
    return g >= 2 + b(t:BuffUp(e.Broadside)) and y < d.CPMaxSpend() and oe() > 50 and (not e.CountTheOdds:ConduitEnabled() or d.RtBRemains() > 10)
end

local function H()
    return not I() or p < 2 or (t:BuffRemains(e.BladeFlurry) > 1 + b(e.KillingSpree:IsAvailable()))
end

local function se()
    return i.Commons.VanishOffensive and c() and not (q.IsSoloMode() and t:IsTanking(n))
end

local function he()
    if e.BladeFlurry:IsReady() and I() and p >= 2 and not t:BuffUp(e.BladeFlurry) then
        if a.Cast(e.BladeFlurry) then
            o = 13877
            return "Cast Blade Flurry"
        end

    end

    if n:IsSpellInRange(e.SinisterStrike) then
        if e.Vanish:IsCastable() and se() and not t:StealthUp(true, true) then
            if not k then
                if O() and not T and not k and not A and O() and not t:StealthUp(true, true) and (not ee or (t:BuffDown(e.DeathlyShadowsBuff) and v <= 2)) then
                    if a.Cast(e.Vanish, nil) then
                        o = 1856
                        return "Cast Vanish"
                    end

                end

            else
                if d.MasterAssassinsMarkRemains() <= 0 and k and not T and i.Commons.VanishOffensive and H() then
                    if e.MarkedforDeath:IsAvailable() then
                        if r() then
                            if a.Cast(e.Vanish, nil) then
                                o = 1856
                                return "Cast Vanish (MA+MfD)"
                            end

                        end

                    else
                        if not T and k and i.Commons.VanishOffensive(not e.BetweentheEyes:CooldownUp() and r() or e.BetweentheEyes:CooldownUp() and O()) then
                            if a.Cast(e.Vanish, nil) then
                                o = 1856
                                return "Cast Vanish (MA)"
                            end

                        end

                    end

                end

            end

        end

        if c() and e.AdrenalineRush:IsCastable() and not t:BuffUp(e.AdrenalineRush) then
            if a.Cast(e.AdrenalineRush, nil) then
                o = 13750
                return "Cast Adrenaline Rush"
            end

        end

        if e.Fleshcraft:IsCastable() and (E == 0 or E > e.Fleshcraft:ExecuteTime()) and f and i.Outlaw.CastCancelFC and not t:StealthUp(true, true) and (e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled()) and (not t:BuffUp(e.BladeFlurry) or p < 2) and (not t:BuffUp(e.AdrenalineRush) or S() > 2) then
            if a.Cast(e.Fleshcraft, nil) then
                o = 324631
                return "Cast Fleashcraft"
            end

        end

        if c() and e.Flagellation:IsReady() and f and not t:StealthUp(true, true) and not n:DebuffUp(e.Flagellation) and (r() or (n:FilteredTimeToDie(">", 12) or n:IsInBossList())) then
            if a.Cast(e.Flagellation, nil, nil) then
                o = 323654
                return "Cast Flagellation"
            end

        end

        if e.Dreadblades:IsReady() and n:IsSpellInRange(e.Dreadblades) and not t:StealthUp(true, true) and v <= 2 and (te ~= "Venthyr" or e.Flagellation:AnyDebuffUp()) and (not e.MarkedforDeath:IsAvailable() or e.MarkedforDeath:CooldownRemains() > 0) then
            if a.Cast(e.Dreadblades, nil) then
                o = 343142
                return "Cast Dreadblades"
            end

        end

        if e.RolltheBones:IsReady() and d.MasterAssassinsMarkRemains() <= 0 and not t:BuffUp(e.Dreadblades) and (d.RtBRemains() <= 3 or Q()) then
            if a.Cast(e.RolltheBones) then
                o = 315508
                return "Cast Roll the Bones"
            end

        end

    end

    if H() then
        if c() and not J and e.KillingSpree:IsCastable() and n:IsSpellInRange(e.KillingSpree) and not t:StealthUp(true, false) and (not k or e.Vanish:CooldownRemains() > 10 or d.MasterAssassinsMarkRemains() > 2) and (n:DebuffUp(e.BetweentheEyes) and not t:BuffUp(e.Dreadblades) and t:EnergyDeficitPredicted() > (t:EnergyRegen() * 2 + 10) or p > (2 - b(t:BuffUp(e.DeathlyShadowsBuff))) or d.MasterAssassinsMarkRemains() > 0) then
            if a.Cast(e.KillingSpree, nil, nil) then
                o = 51690
                return "Cast Killing Spree"
            end

        end

        if e.BladeRush:IsCastable() and n:IsSpellInRange(e.BladeRush) and (((n:IsInMeleeRange(i.Outlaw.BRRange)) and not C) or (C and n:IsInMeleeRange(5))) and (S() > 2 and not t:BuffUp(e.Dreadblades) or oe() <= 30 or p > 2) then
            if a.Cast(e.BladeRush, nil) then
                o = 271877
                return "Cast Blade Rush"
            end

        end

    end

    if n:IsSpellInRange(e.SinisterStrike) then
        if c() then
            if e.Vanish:IsCastable() and i.Commons.VanishOffensive and A and e.Flagellation:IsAvailable() and not t:StealthUp(true, true) and (e.Flagellation:CooldownRemains() > 0 and (not e.Dreadblades:IsAvailable() or e.Dreadblades:CooldownRemains() > 0 or not e.Flagellation:AnyDebuffUp())) then
                if a.Cast(e.Vanish, nil) then
                    o = 1856
                    return "Cast w/ InvigoratingShdowdustEquipped - Venth"
                end

            end

            if e.Vanish:IsCastable() and i.Commons.VanishOffensive and A and not e.Flagellation:IsAvailable() and not t:StealthUp(true, true) and (e.EchoingReprimand:CooldownRemains() > 6 or not e.Sepsis:CooldownUp() or e.SerratedBoneSpike:FullRechargeTime() > 20) then
                if a.Cast(e.Vanish, nil) then
                    o = 1856
                    return "Cast w/ InvigoratingShdowdustEquipped- non venth"
                end

            end

            if i.Commons.VanishOffensive and e.Shadowmeld:IsCastable() and O() and i.Commons.Enabled.Racials and c() then
                if a.Cast(e.Shadowmeld, nil) then
                    o = 58984
                    return "Cast Shadowmeld"
                end

            end

            if s.PotionofSpectralAgility:IsReady() and c() and i.Commons.Enabled.Potions and ie and ((t:BloodlustUp() and a.GUISettings.General.HoldPotforBL) or ((t:BloodlustUp() or n:TimeToDie() <= 30 or t:BuffUp(e.AdrenalineRush)) and not a.GUISettings.General.HoldPotforBL)) then
                if a.Cast(s.PotionofSpectralAgility, nil) then
                    o = 50
                    return "Cast Pot"
                end

            end

            if e.BloodFury:IsCastable() and i.Commons.Enabled.Racials and c() then
                if a.Cast(e.BloodFury, nil) then
                    o = 20572
                    return "Cast Blood Fury"
                end

            end

            if e.Berserking:IsCastable() and i.Commons.Enabled.Racials and c() then
                if a.Cast(e.Berserking, nil) then
                    o = 26297
                    return "Cast Berserking"
                end

            end

            if e.Fireblood:IsCastable() and i.Commons.Enabled.Racials and c() then
                if a.Cast(e.Fireblood, nil) then
                    o = 265221
                    return "Cast Fireblood"
                end

            end

            if e.AncestralCall:IsCastable() and i.Commons.Enabled.Racials and c() then
                if a.Cast(e.AncestralCall, nil) then
                    o = 274738
                    return "Cast Ancestral Call"
                end

            end

            if i.Commons.Enabled.TopTrinket or i.Commons.Enabled.BottomTrinket then
                if s.CacheOfAcquiredTreasures:IsEquippedAndReady() then
                    if t:BuffUp(e.AcquiredAxe) then
                                                if s.CacheOfAcquiredTreasures:ID() == x and i.Commons.Enabled.TopTrinket then
                            o = 24
                            return "top trinket Cache Axe for AoE"
                        elseif s.CacheOfAcquiredTreasures:ID() == z and i.Commons.Enabled.BottomTrinket then
                            o = 25
                            return "bot trinket Cache Axe for AoE"
                        end

                    end

                end

                local t = t:GetUseableTrinkets(_)
                if t and (n:DebuffUp(e.BetweentheEyes) or w.BossFilteredFightRemains("<", 20) or t:TrinketHasStatAnyDps()) then
                    if t then
                        if a.Cast(t, nil, nil) then
                                                        if t:ID() == GetInventoryItemID("player", 13) and i.Commons.Enabled.TopTrinket then
                                o = 24
                                return "Generic use_items for " .. t:Name()
                            elseif t:ID() == GetInventoryItemID("player", 14) and i.Commons.Enabled.BottomTrinket then
                                o = 25
                                return "Generic use_items for " .. t:Name()
                            end

                        end

                    end

                end

            end

        end

    end

end

local function A()
    if false and c() and (f or (e.EchoingReprimand:IsAvailable() and c())) and e.EchoingReprimand:IsReady() and n:IsSpellInRange(e.EchoingReprimand) then
        if a.Cast(e.EchoingReprimand, nil, nil) then
            o = 323547
            return "Cast Echoing Reprimand"
        end

    end

    if e.Dispatch:IsCastable() and n:IsSpellInRange(e.Dispatch) and r() then
        if a.CastPooling(e.Dispatch) then
            o = 2098
            return "Cast Dispatch"
        end

    end

    if e.Ambush:IsCastable() and n:IsSpellInRange(e.Ambush) then
        if a.CastPooling(e.Ambush) then
            o = 8676
            return "Cast Ambush"
        end

    end

end

local function k()
    if e.BetweentheEyes:IsCastable() and n:IsSpellInRange(e.BetweentheEyes) and (n:FilteredTimeToDie(">", 4) or n:TimeToDieIsNotValid()) and d.CanDoTUnit(n, K) then
        if a.CastPooling(e.BetweentheEyes) then
            o = 315341
            return "Cast Between the Eyes"
        end

    end

    if e.SliceandDice:IsCastable() and (w.FilteredFightRemains(D, ">", t:BuffRemains(e.SliceandDice), true) or t:BuffRemains(e.SliceandDice) == 0) and t:BuffRemains(e.SliceandDice) < (1 + v) * 1.8 then
        if a.CastPooling(e.SliceandDice) then
            o = 315496
            return "Cast Slice and Dice"
        end

    end

    if e.Dispatch:IsCastable() and n:IsSpellInRange(e.Dispatch) then
        if a.CastPooling(e.Dispatch) then
            o = 2098
            return "Cast Dispatch"
        end

    end

end

local function O()
    if e.Sepsis:IsReady() and (f or (e.Sepsis:IsAvailable() and c())) and n:IsSpellInRange(e.Sepsis) and d.MasterAssassinsMarkRemains() <= 0 then
        if a.Cast(e.Sepsis, nil, nil) then
            o = 328305
            return "Cast Sepsis"
        end

    end

    if e.GhostlyStrike:IsReady() and n:IsSpellInRange(e.GhostlyStrike) then
        if a.Cast(e.GhostlyStrike, nil) then
            o = 196937
            return "Cast Ghostly Strike"
        end

    end

    if e.Shiv:IsReady() and Z then
        if a.Cast(e.Shiv) then
            o = 5938
            return "Cast Shiv (TTB)"
        end

    end

    if e.EchoingReprimand:IsReady() and (f or (e.EchoingReprimand:IsAvailable() and c())) and n:IsSpellInRange(e.EchoingReprimand) and (not e.EffusiveAnimaAccelerator:SoulbindEnabled() or H()) then
        if a.Cast(e.EchoingReprimand, nil, nil) then
            o = 323547
            return "Cast Echoing Reprimand"
        end

    end

    if e.SerratedBoneSpike:IsReady() and f then
        if (t:BuffUp(e.SliceandDice) and not n:DebuffUp(e.SerratedBoneSpikeDebuff)) or (i.Outlaw.DumpSpikes and w.BossFilteredFightRemains("<", 5)) then
            if a.Cast(e.SerratedBoneSpike, nil, nil) then
                o = 328547
                return "Cast Serrated Bone Spike"
            end

        end

        if I() then
            local o, s = nil, 4
            local h = n:GUID()
            for a, t in pairs(R) do
                if t:GUID() ~= h and q.UnitIsCycleValid(t, s, -t:DebuffRemains(e.SerratedBoneSpike)) and not t:DebuffUp(e.SerratedBoneSpikeDebuff) then
                    o, s = t, t:TimeToDie()
                end

            end

            if o and f then
                a.CastLeftNameplate(o, e.SerratedBoneSpike)
                                if o:GUID() == u("mouseover"):GUID() and i.Outlaw.TargetSwap == "Mouseover" then
                    m = 3285415
                elseif i.Outlaw.TargetSwap == "AutoSwap" and o:GUID() ~= n:GUID() and not P then
                    m = 999
                end

            end

        end

        if e.SerratedBoneSpike:ChargesFractional() > 2.75 and f then
            if a.Cast(e.SerratedBoneSpike, nil, nil) then
                o = 328547
                return "Cast Serrated Bone Spike Filler"
            end

        end

    end

    if e.PistolShot:IsCastable() and n:IsSpellInRange(e.PistolShot) and t:BuffUp(e.Opportunity) then
        if t:EnergyDeficitPredicted() > (t:EnergyRegen() + 10) or g <= 1 + b(t:BuffUp(e.Broadside)) or e.QuickDraw:IsAvailable() then
            if a.CastPooling(e.PistolShot) then
                o = 185763
                return "Cast Pistol Shot"
            end

        end

        if t:BuffUp(e.GreenskinsWickers) or t:BuffUp(e.ConcealedBlunderbuss) or t:BuffUp(e.TornadoTriggerBuff) then
            if a.CastPooling(e.PistolShot) then
                o = 185763
                return "Cast Pistol Shot (Buffed)"
            end

        end

    end

    if e.SinisterStrike:IsCastable() and n:IsSpellInRange(e.SinisterStrike) then
        if a.CastPooling(e.SinisterStrike) then
            o = 193315
            return "Cast Sinister Strike"
        end

    end

end

local function w()
    j = HeroRotationCharDB.Toggles[6]
    f = HeroRotationCharDB.Toggles[4]
    de = HeroRotationCharDB.Toggles[5]
    P = HeroRotationCharDB.Toggles[12]
    ie = not HeroRotationCharDB.Toggles[15]
    T = HeroRotationCharDB.Toggles[21]
    V = HeroRotationCharDB.Toggles[22]
    W = HeroRotationCharDB.Toggles[23]
    Y = HeroRotationCharDB.Toggles[24]
    F = HeroRotationCharDB.Toggles[25]
    L = HeroRotationCharDB.Toggles[27]
    U = HeroRotationCharDB.Toggles[50]
    C = HeroRotationCharDB.Toggles[51]
    J = HeroRotationCharDB.Toggles[52]
    M = HeroRotationCharDB.Toggles[53]
    B = HeroRotationCharDB.Toggles[30]
    ae = HeroRotationCharDB.Toggles[54]
    x = GetInventoryItemID("player", 13)
    z = GetInventoryItemID("player", 14)
            if not i.Commons.Enabled.TopTrinket and not i.Commons.Enabled.BottomTrinket then
        _ = { x, z, s.ComputationDevice:ID(), s.VigorTrinket:ID(), s.FontOfPower:ID(), s.RazorCoral:ID(), s.CacheOfAcquiredTreasures:ID(), s.MistcallerOcarina:ID() }
    elseif not i.Commons.Enabled.TopTrinket and i.Commons.Enabled.BottomTrinket then
        _ = { x, s.ComputationDevice:ID(), s.VigorTrinket:ID(), s.FontOfPower:ID(), s.RazorCoral:ID(), s.CacheOfAcquiredTreasures:ID(), s.MistcallerOcarina:ID() }
    elseif not i.Commons.Enabled.BottomTrinket and i.Commons.Enabled.TopTrinket then
        _ = { z, s.ComputationDevice:ID(), s.VigorTrinket:ID(), s.FontOfPower:ID(), s.RazorCoral:ID(), s.CacheOfAcquiredTreasures:ID(), s.MistcallerOcarina:ID() }
    end

    E = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                E = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

end

local function f()
    N = e.AcrobaticStrikes:IsAvailable() and 9 or 6
    K = e.Dispatch:Damage() * 1.25
    v = t:ComboPoints()
    y = re(v)
    g = t:ComboPointsDeficit()
    if I() then
        R = t:GetEnemiesInRange(30)
        D = t:GetEnemiesInRange(N)
        p = #D
    else
        p = 1
    end

    h = w()
    if a.QueuedCast() then
        o = a.QueuedCast()
        return "Custom Queue " .. l(o):ID()
    end

    if h then
        return h
    end

    if m > 0 then
        m = 0
    end

    if o > 0 then
        o = 0
    end

    o = d.ReturnSpell()
    m = d.ReturnSpellMO()
        if a.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        X = GetTime()
        G = X + (a.GUISettings.General.OpenerReset)
    elseif a.GUISettings.General.OpenerReset > 0 and G ~= nil and GetTime() > G and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        a.ToggleIconFrame:UpdateButtonText(6)
        a.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (M and e.GrapplingHook:IsUsableP() and e.GrapplingHook:CooldownRemains(BypassRecovery) <= 0) then
        if a.Cast(e.GrapplingHook, nil, nil, nil) then
            o = 195457
            return "queue Grappling Hook"
        end

    elseif ((not e.GrapplingHook:IsUsableP() or e.GrapplingHook:CooldownRemains() > 0) and M) then
        HeroRotationCharDB.Toggles[53] = not HeroRotationCharDB.Toggles[53]
        a.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[53] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (V and e.CheapShot:IsUsableP() and e.CheapShot:CooldownRemains(BypassRecovery) <= 0 and (t:StealthUp(true, true) or t:BuffUp(e.VanishBuff)) and (n:IsInRange(8) or u("mouseover"):IsInRange(8))) then
        if a.Cast(e.CheapShot, nil, nil, nil) then
            if u("mouseover"):GUID() ~= nil and u("mouseover"):IsSpellInRange(e.CheapShot) then
                m = 18335
                return "queue Cheap Shot MO"
            else
                o = 1833
                return "queue Cheap Shot"
            end

        end

    elseif ((not e.CheapShot:IsUsableP() or e.CheapShot:CooldownRemains() > 0) and V) then
        HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
        a.Print("Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (W and e.KidneyShot:IsUsableP() and e.KidneyShot:CooldownRemains(BypassRecovery) <= 0 and (n:IsInRange(8) or u("mouseover"):IsInRange(8))) then
        if a.Cast(e.KidneyShot, nil, nil, nil) then
            if u("mouseover"):GUID() ~= nil and u("mouseover"):IsSpellInRange(e.KidneyShot) then
                m = 4085
                return "queue Kidney Shot MO"
            else
                o = 408
                return "queue Kidney Shot"
            end

        end

    elseif ((not e.KidneyShot:IsUsableP() or e.KidneyShot:CooldownRemains() > 0) and W) then
        HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
        a.Print("Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (Y and e.Blind:IsUsableP() and e.Blind:CooldownRemains(BypassRecovery) <= 0 and (n:IsInRange(15) or u("mouseover"):IsInRange(15))) then
        if a.Cast(e.Blind, nil, nil, nil) then
            if u("mouseover"):GUID() ~= nil and u("mouseover"):IsSpellInRange(e.Blind) then
                m = 20945
                return "queue Blind MO"
            end

        end

    elseif ((not e.Blind:IsUsableP() or e.Blind:CooldownRemains() > 0) and Y) then
        HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
        a.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (F and e.Sap:IsUsableP() and e.Sap:CooldownRemains(BypassRecovery) <= 0 and t:StealthUp(true, true) and (n:IsInRange(10) or u("mouseover"):IsInRange(10))) then
        if a.Cast(e.Sap, nil, nil, nil) then
            if u("mouseover"):GUID() ~= nil and u("mouseover"):IsSpellInRange(e.Sap) then
                m = 67705
                return "queue Sap MO"
            else
                o = 6770
                return "queue Sap"
            end

        end

    elseif ((not e.Sap:IsUsableP() or e.Sap:CooldownRemains() > 0 or not t:StealthUp(true, true)) and F) then
        HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
        a.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (L and e.Feint:IsUsableP() and e.Feint:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if a.Cast(e.Feint, nil, nil, nil) then
            o = 202
            return "queue Shuriken Tornado"
        end

    elseif ((not e.Feint:IsUsableP() or e.Feint:CooldownRemains() > 0 or not t:AffectingCombat()) and L) then
        HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27]
        a.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (U and e.Gouge:IsUsableP() and e.Gouge:CooldownRemains(BypassRecovery) <= 0 and (n:IsInRange(8) or u("mouseover"):IsInRange(8))) then
        if a.Cast(e.Gouge, nil, nil, nil) then
            if u("mouseover"):GUID() ~= nil and u("mouseover"):IsSpellInRange(e.Gouge) then
                m = 17765
                return "queue Gouge MO"
            else
                o = 1776
                return "queue Gouge"
            end

        end

    elseif ((not e.Gouge:IsUsableP() or e.Gouge:CooldownRemains() > 0 or not t:AffectingCombat()) and U) then
        HeroRotationCharDB.Toggles[50] = not HeroRotationCharDB.Toggles[50]
        a.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[50] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if (B) then
                                                                if (e.ArcaneTorrent:IsAvailable() and e.ArcaneTorrent:IsUsableP() and e.ArcaneTorrent:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
            if a.Cast(e.ArcaneTorrent, nil, nil, nil) then
                o = 155145
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.LightsJudgment:IsAvailable() and e.LightsJudgment:IsUsableP() and e.LightsJudgment:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
            if a.Cast(e.LightsJudgment, nil, nil, nil) then
                o = 255647
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.BagofTricks:IsAvailable() and e.BagofTricks:IsUsableP() and e.BagofTricks:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
            if a.Cast(e.BagofTricks, nil, nil, nil) then
                o = 312411
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.BloodFury:IsAvailable() and e.BloodFury:IsUsableP() and e.BloodFury:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
            if a.Cast(e.BloodFury, nil, nil, nil) then
                o = 20572
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.Berserking:IsAvailable() and e.Berserking:IsUsableP() and e.Berserking:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
            if a.Cast(e.Berserking, nil, nil, nil) then
                o = 26297
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.Fireblood:IsAvailable() and e.Fireblood:IsUsableP() and e.Fireblood:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
            if a.Cast(e.Fireblood, nil, nil, nil) then
                o = 265221
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.AncestralCall:IsAvailable() and e.AncestralCall:IsUsableP() and e.AncestralCall:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
            if a.Cast(e.AncestralCall, nil, nil, nil) then
                o = 274738
                return "queue ArcaneTorrent Queue"
            end

        elseif (((e.ArcaneTorrent:IsAvailable() and (not e.ArcaneTorrent:IsUsableP() or e.ArcaneTorrent:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.LightsJudgment:IsAvailable() and (not e.LightsJudgment:IsUsableP() or e.LightsJudgment:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BagofTricks:IsAvailable() and (not e.BagofTricks:IsUsableP() or e.BagofTricks:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BloodFury:IsAvailable() and (not e.BloodFury:IsUsableP() or e.BloodFury:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Berserking:IsAvailable() and (not e.Berserking:IsUsableP() or e.Berserking:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Fireblood:IsAvailable() and (not e.Fireblood:IsUsableP() or e.Fireblood:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.AncestralCall:IsAvailable() and (not e.AncestralCall:IsUsableP() or e.AncestralCall:CooldownRemains() > 0 or not t:AffectingCombat()))) and B) then
            HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30]
            a.Print("Arcane Torrent Queue is now " .. (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

    end

    if t:IsChanneling(l(324631)) then
                if t:AffectingCombat() and i.Outlaw.CastCancelFC then
            o = 1999
        elseif a.CastAnnotated(e.PoolEnergy, false, "WAIT") then
            o = 99999
            return "Pool During Fleshcraft"
        end

    end

    if t:IsChanneling(l(324631)) then
        if a.Cast(e.PoolEnergy, nil, nil, nil) then
            o = 99999
            return "channeling Fleashcraft"
        end

    end

    h = d.CrimsonVial()
    if h then
        return h
    end

    h = d.Feint()
    if h then
        return h
    end

    h = d.Evasion()
    if h then
        return h
    end

    if t:HealthPercentage() < i.Commons.PhialHP and s.PhialofSerenity:IsReady() and s.PhialofSerenity:CooldownRemains() <= 0 then
        if a.Cast(s.PhialofSerenity, nil) then
            o = 55
            return "PhialofSerenity HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealthstoneHP and s.Healthstone:IsReady() and s.Healthstone:CooldownRemains() <= 0 then
        if a.Cast(s.Healthstone, nil) then
            o = 40
            return "Healthstone HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealPotHP and s.CosmicHealPot:IsReady() and s.CosmicHealPot:CooldownRemains() <= 0 then
        if a.Cast(s.CosmicHealPot, nil) then
            o = 45
            return "CosmicHealPot HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealPotHP and s.HealPot:IsReady() and s.HealPot:CooldownRemains() <= 0 then
        if a.Cast(s.HealPot, nil) then
            o = 41
            return "HealPot HP"
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.PistolShot:IsCastable() and u("mouseover"):IsInMeleeRange(20) then
            if a.Cast(e.PistolShot, nil) then
                m = 1185763
                return "explosive MO Pistol"
            end

        end

    end

    if e.PistolShot:IsCastable() and u("target"):IsInMeleeRange(40) and string.find(UnitGUID("target"), 120651) then
        if a.Cast(e.PistolShot, nil) then
            o = 185763
            return "explosive Tar Pistol"
        end

    end

    ne = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 158337 }
    if UnitExists("target") and e.Shiv:IsReady() and not ae then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
            for t = 0, 10 do
                local i, i, i, i, t, s, i, i, i, n = UnitBuff("target", t)
                for h, i in pairs(ne) do
                    if i == n and (s - t) + (500 / 1000) <= GetTime() then
                        if a.Cast(e.Shiv, nil) then
                            o = 5938
                            return "Shiv Enrage"
                        end

                    end

                end

            end

        end

    end

    local u = t:AffectingCombat() and 180 or 900
    local s
            if l(8679):IsAvailable() and i.Commons.LethalPoison == "Wound Poison" then
        s = t:BuffRemains(l(8679))
        if s < u and not t:IsCasting(l(8679)) then
            if a.Cast(l(8679)) then
                o = 203
                return "Wound Poison Refresh"
            end

        end

    elseif l(2823):IsAvailable() and i.Commons.LethalPoison == "Deadly Poison" then
        s = t:BuffRemains(l(2823))
        if s < u and not t:IsCasting(l(2823)) then
            if a.Cast(l(2823)) then
                o = 208
                return "Deadly Poison Refresh"
            end

        end

    elseif l(315584):IsAvailable() and i.Commons.LethalPoison == "Instant Poison" then
        s = t:BuffRemains(l(315584))
        if s < u and not t:IsCasting(l(315584)) then
            if a.Cast(l(315584)) then
                o = 205
                return "Instant Poison Refresh"
            end

        end

    end

    s = t:BuffRemains(l(3408))
        if l(3408):IsAvailable() and i.Commons.NonLethalPoison == "Crippling Poison" then
        if s < u and not t:IsCasting(l(3408)) then
            if a.Cast(l(3408)) then
                o = 206
                return "Crippling Poison Refresh"
            end

        end

    elseif l(5761):IsAvailable() and i.Commons.NonLethalPoison == "Numbing Poison" then
        s = t:BuffRemains(l(5761))
        if s < u and not t:IsCasting(NumbingPoison) then
            if a.Cast(l(5761)) then
                o = 204
                return "Numbing Poison Refresh"
            end

        end

    end

    if not t:BuffUp(e.VanishBuff) and not t:AffectingCombat() and not t:StealthUp(true, true) then
        h = d.Stealth(e.Stealth)
        if h then
            return h
        end

    end

    if not t:AffectingCombat() and j then
        if q.TargetIsValid() and (not t:AffectingCombat() and j) then
            if c() and e.MarkedforDeath:IsCastable() and g >= d.CPMaxSpend() - 1 and n:NPCID() ~= 170234 then
                if i.Commons.STMfDAsDPSCD then
                    if a.Cast(e.MarkedforDeath, nil) then
                        o = 137619
                        return "Cast Marked for Death (OOC)"
                    end

                else
                    if a.Cast(e.MarkedforDeath, nil) then
                        o = 137619
                        return "Cast Marked for Death (OOC)"
                    end

                end

            end

            if e.RolltheBones:IsReady() and (d.RtBRemains() <= 3 or Q()) then
                if a.Cast(e.RolltheBones) then
                    o = 315508
                    return "Cast Roll the Bones (Opener)"
                end

            end

            if e.SliceandDice:IsReady() and t:BuffRemains(e.SliceandDice) < (1 + v) * 1.8 then
                if a.CastPooling(e.SliceandDice) then
                    o = 315496
                    return "Cast Slice and Dice (Opener)"
                end

            end

                                    if (t:StealthUp(true, true) or t:BuffUp(e.VanishBuff)) then
                h = A()
                if h then
                    return "Stealth (Opener): " .. h
                end

            elseif r() then
                h = k()
                if h then
                    return "Finish (Opener): " .. h
                end

            elseif e.SinisterStrike:IsCastable() then
                if a.Cast(e.SinisterStrike) then
                    o = 193315
                    return "Cast Sinister Strike (Opener)"
                end

            end

        end

        return 
    end

    if e.MarkedforDeath:IsCastable() and (t:AffectingCombat() or j or t:BuffUp(e.VanishBuff)) then
                if p > 1 and q.CastTargetIf(e.MarkedforDeath, R, "min", le, ue, nil, nil) then
            return "Cast Marked for Death (Cycle)"
        elseif p == 1 and not t:StealthUp(true, false) and g >= d.CPMaxSpend() - 1 and n:NPCID() ~= 170234 then
            if i.Commons.STMfDAsDPSCD then
                if a.Cast(e.MarkedforDeath, nil) then
                    o = 137619
                    return "Cast Marked for Death (ST)"
                end

            else
                if a.Cast(e.MarkedforDeath, nil) then
                    o = 137619
                    return "Cast Marked for Death (ST)"
                end

            end

        end

    end

    if q.TargetIsValid() and (t:AffectingCombat() or j or t:BuffUp(e.VanishBuff)) then
        if (t:StealthUp(true, true) or t:BuffUp(e.VanishBuff)) then
            h = A()
            if h then
                return "Stealth: " .. h
            end

        end

        local d, s, l = GetSpellCooldown(57934)
        if i.Commons.AutoToT then
            if (d + s - GetTime()) <= 0 and e.TricksoftheTrade:IsAvailable() and e.TricksoftheTrade:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus")) and IsItemInRange(32698, "focus") then
                if a.Cast(e.TricksoftheTrade) then
                    o = 207
                    return "ToT Focus"
                end

            end

        end

        h = he()
        if h then
            return "CDs: " .. h
        end

        if r() then
            h = k()
            if h then
                return "Finish: " .. h
            end

            a.Cast(e.PoolEnergy)
            return "Finish Pooling"
        end

        h = O()
        if h then
            return "Build: " .. h
        end

        if e.ArcaneTorrent:IsCastable() and i.Commons.Enabled.Racials and c() and n:IsSpellInRange(e.SinisterStrike) and t:EnergyDeficitPredicted() > 15 + t:EnergyRegen() then
            if a.Cast(e.ArcaneTorrent, nil) then
                o = 155145
                return "Cast Arcane Torrent"
            end

        end

        if e.ArcanePulse:IsCastable() and i.Commons.Enabled.Racials and c() and n:IsSpellInRange(e.SinisterStrike) then
            if a.Cast(e.ArcanePulse) then
                o = 260364
                return "Cast Arcane Pulse"
            end

        end

        if e.LightsJudgment:IsCastable() and i.Commons.Enabled.Racials and c() and n:IsInMeleeRange(5) then
            if a.Cast(e.LightsJudgment, nil) then
                o = 255647
                return "Cast Lights Judgment"
            end

        end

        if e.BagofTricks:IsCastable() and i.Commons.Enabled.Racials and c() and n:IsInMeleeRange(5) then
            if a.Cast(e.BagofTricks, nil) then
                o = 312411
                return "Cast Bag of Tricks"
            end

        end

        if e.PistolShot:IsCastable() and n:IsSpellInRange(e.PistolShot) and not n:IsInRange(N) and not t:StealthUp(true, true) and t:EnergyDeficitPredicted() < 25 and (g >= 1 or S() <= 1.2) then
            if a.Cast(e.PistolShot) then
                o = 185763
                return "Cast Pistol Shot (OOR)"
            end

        end

    end

end

local function t()
    e.Flagellation:RegisterAuraTracking()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        a.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpellOut()
    if o == 0 then
        return 0
    else
        return o
    end

end

function ReturnSpellMOOut()
    if m == 0 then
        return 0
    else
        return m
    end

end

a.SetAPL(260, f, t)

