local e, e = ...
local e = HeroDBC.DBC
local v = HeroLib
local r = HeroCache
local u = v.Unit
local t = u.Player
local n = u.Target
local l = v.Spell
local e = v.MultiSpell
local o = v.Item
local a = HeroRotation
local _ = a.AoEON
local c = a.CDsON
local b = HeroRotationCharDB.Toggles[4]
local B = HeroRotationCharDB.Toggles[5]
local z = HeroRotationCharDB.Toggles[6]
local G = HeroRotationCharDB.Toggles[12]
local ae = not HeroRotationCharDB.Toggles[15]
local I = HeroRotationCharDB.Toggles[21]
local ne = HeroRotationCharDB.Toggles[52]
local P = HeroRotationCharDB.Toggles[22]
local V = HeroRotationCharDB.Toggles[23]
local Y = HeroRotationCharDB.Toggles[24]
local C = HeroRotationCharDB.Toggles[25]
local M = HeroRotationCharDB.Toggles[27]
local F = HeroRotationCharDB.Toggles[50]
local Q = HeroRotationCharDB.Toggles[51]
local W = HeroRotationCharDB.Toggles[53]
local K = HeroRotationCharDB.Toggles[30]
local se = HeroRotationCharDB.Toggles[54]
local N = 0
local oe = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 158337 }
local he = math.min
local H = math.abs
local te = nil
local Z = nil
local A = GetInventoryItemID("player", 13)
local S = GetInventoryItemID("player", 14)
local j = a.Commons.Everyone
local d = a.Commons.Rogue
local i = { General = a.GUISettings.General, Commons = a.GUISettings.APL.Rogue.Commons, Commons2 = a.GUISettings.APL.Rogue.Commons2, Outlaw = a.GUISettings.APL.Rogue.Outlaw }
local e = l.Rogue.Outlaw
local s = o.Rogue.Outlaw
local T = { s.ComputationDevice:ID(), s.VigorTrinket:ID(), s.FontOfPower:ID(), s.RazorCoral:ID(), s.CacheOfAcquiredTreasures:ID(), s.MistcallerOcarina:ID() }
e.Dispatch:RegisterDamageFormula(function()
    return t:AttackPowerDamageMod() * d.CPSpend() * .35 * 1.13 * (1 + t:VersatilityDmgPct() / 100) * (n:DebuffUp(e.GhostlyStrike) and 1.1 or 1) * (n:DebuffUp(e.SinfulRevelationDebuff) and 1.06 or 1)
end)
local X, J, w
local h
local o = d.ReturnSpell()
local m = d.ReturnSpellMO()
local U = 6
local ue
local p, y, k
local f = { { e.Blind, "Cast Blind (Interrupt)", function()
    return true
end } }
local ie = t:HasLegendaryEquipped(116)
local g = t:HasLegendaryEquipped(117)
local R = t:HasLegendaryEquipped(129)
local q = t:HasLegendaryEquipped(114)
local L = t:HasLegendaryEquipped(122)
local O = t:HasLegendaryEquipped(125)
v:RegisterForEvent(function()
    R = t:HasLegendaryEquipped(129)
    ie = t:HasLegendaryEquipped(116)
    g = t:HasLegendaryEquipped(117)
    q = t:HasLegendaryEquipped(114)
    L = t:HasLegendaryEquipped(122)
    O = t:HasLegendaryEquipped(125)
end, "PLAYER_EQUIPMENT_CHANGED")
local ee = t:Covenant()
v:RegisterForEvent(function()
    ee = t:Covenant()
end, "COVENANT_CHOSEN")
local function f(e)
    if e then
        return 1
    else
        return 0
    end

end

local x, E = 0, 0
local function D()
    local e = t:EnergyTimeToMaxPredicted()
    if H(x - e) > 1 then
        x = e
    end

    return x
end

local function de()
    local e = t:EnergyPredicted()
    if H(E - e) > 9 then
        E = e
    end

    return E
end

local function le(a)
    p = a
    if ((a == 2 and t:BuffUp(e.EchoingReprimand2)) or (a == 3 and t:BuffUp(e.EchoingReprimand3)) or (a == 4 and t:BuffUp(e.EchoingReprimand4)) or (a == 5 and t:BuffUp(e.EchoingReprimand5))) then
        p = 7
        return 7
    else
        p = a
        return a
    end

    local o, i = UnitAttackSpeed("unit")
    local o = (o + i) / 2
    local o = o / 2
    local i = (4 - meleeswings) * o
    local o = (5 - meleeswings) * o
    if p > a and k > 2 and t:AffectingCombat() then
        if a == 2 and not t:BuffUp(e.EchoingReprimand3) or a == 3 and not t:BuffUp(e.EchoingReprimand4) or a == 4 and not t:BuffUp(e.EchoingReprimand5) then
            local e = i
            if e == 0 then
                e = o
            end

            if e < (mathmax(t:EnergyTimeToX(35), t:GCDRemains()) + .5) then
                p = a
            end

        end

    end

end

local function me(e)
    return e:TimeToDie()
end

local function ce(e)
                if ((e:FilteredTimeToDie("<", t:ComboPointsDeficit() * 1.5) or (not t:StealthUp(true, false) and t:ComboPointsDeficit() >= d.CPMaxSpend() - 1)) and e:GUID() == u("mouseover"):GUID() and e:NPCID() ~= 170234 and i.Outlaw.TargetSwap == "Mouseover") then
        m = 1376195
        return true
    elseif ((e:FilteredTimeToDie("<", t:ComboPointsDeficit() * 1.5) or (not t:StealthUp(true, false) and t:ComboPointsDeficit() >= d.CPMaxSpend() - 1)) and i.Outlaw.TargetSwap == "AutoSwap" and e:GUID() ~= n:GUID() and e:NPCID() ~= 170234 and not G) then
        m = 999
        return true
    elseif ((e:FilteredTimeToDie("<", t:ComboPointsDeficit() * 1.5) or (not t:StealthUp(true, false) and t:ComboPointsDeficit() >= d.CPMaxSpend() - 1)) and e:GUID() == n:GUID() and e:NPCID() ~= 170234) then
        o = 137619
        return true
    elseif (e:FilteredTimeToDie("<", t:ComboPointsDeficit() * 1.5) or (not t:StealthUp(true, false) and t:ComboPointsDeficit() >= d.CPMaxSpend() - 1)) and e:NPCID() ~= 170234 then
        return true
    end

end

local x = { e.Broadside, e.BuriedTreasure, e.GrandMelee, e.RuthlessPrecision, e.SkullandCrossbones, e.TrueBearing }
local function E(e, a)
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
                if t:BuffUp(x(a[e])) then
                    i = i + 1
                end

            end

            r.APLVar.RtB_List[e][o] = i == #a and true or false
        end

    else
        if not r.APLVar.RtB_List[e][o] then
            r.APLVar.RtB_List[e][o] = false
            for i = 1, #a do
                if t:BuffUp(x(a[i])) then
                    r.APLVar.RtB_List[e][o] = true
                    break
                end

            end

        end

    end

    return r.APLVar.RtB_List[e][o]
end

local function E()
    if not r.APLVar.RtB_Buffs then
        r.APLVar.RtB_Buffs = 0
        for e = 1, #x do
            if t:BuffUp(x[e]) then
                r.APLVar.RtB_Buffs = r.APLVar.RtB_Buffs + 1
            end

        end

    end

    return r.APLVar.RtB_Buffs
end

local function H()
    if not r.APLVar.RtB_Reroll then
                                                        if i.Outlaw.RolltheBonesLogic == "1+ Buff" then
            r.APLVar.RtB_Reroll = (E() <= 0) and true or false
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
            if (E() < 2 and (not t:BuffUp(e.Broadside) and ((not L and not e.FantheHammer:IsAvailable()) or t:BuffDown(e.SkullandCrossbones)) and (not q or t:BuffDown(e.TrueBearing)))) or (E() == 2 and t:BuffUp(e.BuriedTreasure) and t:BuffUp(e.GrandMelee)) then
                r.APLVar.RtB_Reroll = true
            else
                r.APLVar.RtB_Reroll = false
            end

        end

        if j.IsSoloMode() then
                        if t:BuffUp(e.GrandMelee) then
                if t:IsTanking(n) or t:HealthPercentage() < he(i.Outlaw.RolltheBonesLeechKeepHP, i.Outlaw.RolltheBonesLeechRerollHP) then
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
    if y >= (d.CPMaxSpend() - f(t:BuffUp(e.Broadside)) - (f(t:BuffUp(e.Opportunity)) * f((e.QuickDraw:IsAvailable() or e.FantheHammer:IsAvailable()) or t:BuffUp(e.ConcealedBlunderbuss)))) or p >= d.CPMaxSpend() then
        return true
    end

    if e.BetweentheEyes:CooldownUp() and p < 5 then
        return false
    end

    if e.Flagellation:AnyDebuffUp() and t:BuffRemains(e.Flagellation) < 1 and p >= 2 then
        return true
    end

end

local function x()
    return k >= 2 + f(t:BuffUp(e.Broadside)) and t:Energy() >= 50 and ((not e.CountTheOdds:ConduitEnabled() and not e.CountTheOdds:IsAvailable()) or d.RtBRemains() >= 10)
end

local function L()
    return not _() or w < 2 or (t:BuffRemains(e.BladeFlurry) > 1 + f(e.KillingSpree:IsAvailable()))
end

local function he()
    return i.Commons.VanishOffensive and c() and not (j.IsSoloMode() and t:IsTanking(n))
end

local function re()
    if e.BladeFlurry:IsReady() and _() and w >= 2 and not t:BuffUp(e.BladeFlurry) then
        if a.Cast(e.BladeFlurry) then
            o = 13877
            return "Cast Blade Flurry"
        end

    end

    if n:IsSpellInRange(e.SinisterStrike) then
        if e.RolltheBones:IsReady() and d.MasterAssassinsMarkRemains() <= 0 and not t:BuffUp(e.Dreadblades) and (E == 0 or H()) then
            if a.Cast(e.RolltheBones) then
                o = 315508
                return "Cast Roll the Bones"
            end

        end

        if e.KeepitRolling:IsReady() and e.KeepitRolling:IsAvailable() and c() and not H() and (f(t:BuffUp(e.Broadside)) + f(t:BuffUp(e.TrueBearing)) + f(t:BuffUp(e.SkullandCrossbones)) + f(t:BuffUp(e.RuthlessPrecision))) > 2 then
            if a.Cast(e.KeepitRolling) then
                o = 381989
                return "Cast KeepitRolling"
            end

        end

        if c() and e.Flagellation:IsReady() and b and not t:StealthUp(true, true) and not n:DebuffUp(e.Flagellation) and (r() or (n:FilteredTimeToDie(">", 12) or n:IsInBossList())) then
            if a.Cast(e.Flagellation, nil, nil) then
                o = 323654
                return "Cast Flagellation"
            end

        end

        if e.ShadowDance:IsAvailable() and e.ShadowDance:IsCastable() and B and not g and not q and not R and not t:StealthUp(true, true) and not t:BuffUp(e.TakeEmBySurprise) and ((r() and t:BuffUp(e.SliceandDice)) or (x() and not t:BuffUp(e.SliceandDice))) then
            if a.Cast(e.ShadowDance, nil) then
                o = 185313
                return "Cast ShadowDance"
            end

        end

        if e.Vanish:IsCastable() and he() and not t:StealthUp(true, true) then
            if not g then
                if x() and not I and not g and not q and x() and not t:StealthUp(true, true) and (not R or (t:BuffDown(e.DeathlyShadowsBuff) and y <= 2)) then
                    if a.Cast(e.Vanish, nil) then
                        o = 1856
                        return "Cast Vanish"
                    end

                end

            else
                if d.MasterAssassinsMarkRemains() <= 0 and g and not I and i.Commons.VanishOffensive and L() then
                    if e.MarkedforDeath:IsAvailable() then
                        if r() then
                            if a.Cast(e.Vanish, nil) then
                                o = 1856
                                return "Cast Vanish (MA+MfD)"
                            end

                        end

                    else
                        if not I and g and i.Commons.VanishOffensive(not e.BetweentheEyes:CooldownUp() and r() or e.BetweentheEyes:CooldownUp() and x()) then
                            if a.Cast(e.Vanish, nil) then
                                o = 1856
                                return "Cast Vanish (MA)"
                            end

                        end

                    end

                end

            end

        end

        if c() and e.AdrenalineRush:IsCastable() and not t:BuffUp(e.AdrenalineRush) and (not e.ImprovedAdrenalineRush:IsAvailable() or y <= 2) then
            if a.Cast(e.AdrenalineRush, nil) then
                o = 13750
                return "Cast Adrenaline Rush"
            end

        end

        if e.Fleshcraft:IsCastable() and (N == 0 or N > e.Fleshcraft:ExecuteTime()) and b and i.Outlaw.CastCancelFC and not t:StealthUp(true, true) and (e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled()) and (not t:BuffUp(e.BladeFlurry) or w < 2) and (not t:BuffUp(e.AdrenalineRush) or D() > 2) then
            if a.Cast(e.Fleshcraft, nil) then
                o = 324631
                return "Cast Fleashcraft"
            end

        end

        if e.Dreadblades:IsReady() and n:IsSpellInRange(e.Dreadblades) and not t:StealthUp(true, true) and y <= 2 and (ee ~= "Venthyr" or e.Flagellation:AnyDebuffUp()) and (not e.MarkedforDeath:IsAvailable() or e.MarkedforDeath:CooldownRemains() > 0) then
            if a.Cast(e.Dreadblades, nil) then
                o = 343142
                return "Cast Dreadblades"
            end

        end

    end

    if L() then
        if c() and KillingSpreeVanish and not ne and e.KillingSpree:IsCastable() and n:IsSpellInRange(e.KillingSpree) and not t:StealthUp(true, false) and (not g or e.Vanish:CooldownRemains() > 10 or d.MasterAssassinsMarkRemains() > 2) and (n:DebuffUp(e.BetweentheEyes) and not t:BuffUp(e.Dreadblades) and t:EnergyDeficitPredicted() > (t:EnergyRegen() * 2 + 10) or w > (2 - f(t:BuffUp(e.DeathlyShadowsBuff))) or d.MasterAssassinsMarkRemains() > 0) then
            if a.Cast(e.KillingSpree, nil, nil) then
                o = 51690
                return "Cast Killing Spree"
            end

        end

        if e.BladeRush:IsCastable() and n:IsSpellInRange(e.BladeRush) and (((n:IsInMeleeRange(i.Outlaw.BRRange)) and not Q) or (Q and n:IsInMeleeRange(5))) and (D() > 2 and not t:BuffUp(e.Dreadblades) or de() <= 30 or w > 2) then
            if a.Cast(e.BladeRush, nil) then
                o = 271877
                return "Cast Blade Rush"
            end

        end

    end

    if n:IsSpellInRange(e.SinisterStrike) then
        if c() then
            if e.Vanish:IsCastable() and i.Commons.VanishOffensive and q and e.Flagellation:IsAvailable() and not t:StealthUp(true, true) and (e.Flagellation:CooldownRemains() > 0 and (not e.Dreadblades:IsAvailable() or e.Dreadblades:CooldownRemains() > 0 or not e.Flagellation:AnyDebuffUp())) then
                if a.Cast(e.Vanish, nil) then
                    o = 1856
                    return "Cast w/ InvigoratingShdowdustEquipped - Venth"
                end

            end

            if e.Vanish:IsCastable() and i.Commons.VanishOffensive and q and not e.Flagellation:IsAvailable() and not t:StealthUp(true, true) and (e.EchoingReprimand:CooldownRemains() > 6 or not e.Sepsis:CooldownUp() or e.SerratedBoneSpike:FullRechargeTime() > 20) then
                if a.Cast(e.Vanish, nil) then
                    o = 1856
                    return "Cast w/ InvigoratingShdowdustEquipped- non venth"
                end

            end

            if i.Commons.VanishOffensive and e.Shadowmeld:IsCastable() and x() and i.Commons.Enabled.Racials and c() then
                if a.Cast(e.Shadowmeld, nil) then
                    o = 58984
                    return "Cast Shadowmeld"
                end

            end

            if e.ThistleTea:IsAvailable() and e.ThistleTea:IsReady() and B and t:EnergyDeficitPredicted() >= 100 and not t:BuffUp(e.ThistleTea) and (e.ThistleTea:ChargesFractional() >= 3 or t:BuffUp(e.AdrenalineRush)) then
                if a.Cast(e.ThistleTea, nil, nil) then
                    o = 381623
                    return "Cast ThistleTea"
                end

            end

            if s.PotionofSpectralAgility:IsReady() and c() and i.Commons.Enabled.Potions and ae and ((t:BloodlustUp() and a.GUISettings.General.HoldPotforBL) or ((t:BloodlustUp() or n:TimeToDie() <= 30 or t:BuffUp(e.AdrenalineRush)) and not a.GUISettings.General.HoldPotforBL)) then
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
                                                if s.CacheOfAcquiredTreasures:ID() == A and i.Commons.Enabled.TopTrinket then
                            o = 24
                            return "top trinket Cache Axe for AoE"
                        elseif s.CacheOfAcquiredTreasures:ID() == S and i.Commons.Enabled.BottomTrinket then
                            o = 25
                            return "bot trinket Cache Axe for AoE"
                        end

                    end

                end

                local t = t:GetUseableTrinkets(T)
                if t and (n:DebuffUp(e.BetweentheEyes) or v.BossFilteredFightRemains("<", 20) or t:TrinketHasStatAnyDps()) then
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

local function q()
    if false and c() and (b or (e.EchoingReprimand:IsAvailable() and c())) and e.EchoingReprimand:IsReady() and n:IsSpellInRange(e.EchoingReprimand) then
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

local function g()
    if e.BetweentheEyes:IsCastable() and n:IsSpellInRange(e.BetweentheEyes) and (n:FilteredTimeToDie(">", 3) or n:TimeToDieIsNotValid()) and (n:DebuffRemains(e.BetweentheEyes) < 4 or ((O or e.GreenskinsWickersT:IsAvailable()) and not t:BuffUp(e.GreenskinsWickers)) or (not O and not e.GreenskinsWickersT:IsAvailable() and t:BuffUp(e.RuthlessPrecision))) then
        if a.CastPooling(e.BetweentheEyes) then
            o = 315341
            return "Cast Between the Eyes"
        end

    end

    if e.SliceandDice:IsCastable() and (v.FilteredFightRemains(J, ">", t:BuffRemains(e.SliceandDice), true) or t:BuffRemains(e.SliceandDice) == 0) and t:BuffRemains(e.SliceandDice) < (1 + y) * 1.8 and (not e.SwiftSlasher:IsAvailable() or y >= d.CPMaxSpend()) then
        if a.CastPooling(e.SliceandDice) then
            o = 315496
            return "Cast Slice and Dice"
        end

    end

    if e.ColdBlood:IsAvailable() and e.ColdBlood:IsCastable() and not (O or e.GreenskinsWickersT:IsAvailable()) then
        if a.CastPooling(e.ColdBlood) then
            o = 382245
            return "Cast ColdBlood"
        end

    end

    if e.Dispatch:IsCastable() and n:IsSpellInRange(e.Dispatch) then
        if a.CastPooling(e.Dispatch) then
            o = 2098
            return "Cast Dispatch"
        end

    end

end

local function x()
    if e.Sepsis:IsReady() and (b or (e.Sepsis:IsAvailable() and c())) and n:TimeToDie() > 1 and n:DebuffUp(e.BetweentheEyes) then
        if a.Cast(e.Sepsis, nil, nil) then
            o = 328305
            return "Cast Sepsis"
        end

    end

    if e.GhostlyStrike:IsReady() and n:IsSpellInRange(e.GhostlyStrike) and n:DebuffRemains(e.GhostlyStrike) <= 3 then
        if a.Cast(e.GhostlyStrike, nil) then
            o = 196937
            return "Cast Ghostly Strike"
        end

    end

    if e.Shiv:IsReady() and ie then
        if a.Cast(e.Shiv) then
            o = 5938
            return "Cast Shiv (TTB)"
        end

    end

    if e.EchoingReprimand:IsReady() and (b or (e.EchoingReprimand:IsAvailable() and c())) and n:IsSpellInRange(e.EchoingReprimand) and (not e.EffusiveAnimaAccelerator:SoulbindEnabled() or L()) then
        if a.Cast(e.EchoingReprimand, nil, nil) then
            o = 323547
            return "Cast Echoing Reprimand"
        end

    end

    if e.Ambush:IsCastable() and n:IsSpellInRange(e.Ambush) and t:StealthUp(true, true) then
        if a.Cast(e.Ambush) then
            o = 8676
            return "Cast Ambush"
        end

    end

    if e.ColdBlood:IsAvailable() and e.ColdBlood:IsCastable() and ((t:BuffUp(e.Opportunity) and t:BuffUp(e.GreenskinsWickers)) or (t:BuffUp(e.GreenskinsWickers) and t:BuffRemains(e.GreenskinsWickers) < 1.5)) then
        if a.Cast(e.ColdBlood) then
            o = 382245
            return "Cast ColdBlood"
        end

    end

    if e.PistolShot:IsCastable() and n:IsSpellInRange(e.PistolShot) and t:BuffUp(e.Opportunity) then
        if ((t:BuffUp(e.GreenskinsWickers) or t:BuffUp(e.ConcealedBlunderbuss) or e.FantheHammer:IsAvailable()) or (t:BuffUp(e.GreenskinsWickers) and t:BuffRemains(e.GreenskinsWickers) < 1.5)) then
            if a.Cast(e.PistolShot) then
                o = 185763
                return "Cast Pistol Shot (Buffed)"
            end

        end

    end

    if e.Ambush:IsCastable() and n:IsSpellInRange(e.Ambush) and t:StealthUp(true, true) then
        if a.Cast(e.Ambush) then
            o = 8676
            return "Cast Ambush"
        end

    end

    if e.SerratedBoneSpike:IsReady() and b then
        if (t:BuffUp(e.SliceandDice) and not n:DebuffUp(e.SerratedBoneSpikeDebuff)) or (i.Outlaw.DumpSpikes and v.BossFilteredFightRemains("<", 5)) then
            if a.Cast(e.SerratedBoneSpike, nil, nil) then
                o = 328547
                return "Cast Serrated Bone Spike"
            end

        end

        if _() then
            local o, s = nil, 4
            local h = n:GUID()
            for a, t in pairs(X) do
                if t:GUID() ~= h and j.UnitIsCycleValid(t, s, -t:DebuffRemains(e.SerratedBoneSpike)) and not t:DebuffUp(e.SerratedBoneSpikeDebuff) then
                    o, s = t, t:TimeToDie()
                end

            end

            if o and b then
                a.CastLeftNameplate(o, e.SerratedBoneSpike)
                                if o:GUID() == u("mouseover"):GUID() and i.Outlaw.TargetSwap == "Mouseover" then
                    m = 3285415
                elseif i.Outlaw.TargetSwap == "AutoSwap" and o:GUID() ~= n:GUID() and not G then
                    m = 999
                end

            end

        end

        if e.SerratedBoneSpike:ChargesFractional() > 2.75 and b then
            if a.Cast(e.SerratedBoneSpike, nil, nil) then
                o = 328547
                return "Cast Serrated Bone Spike Filler"
            end

        end

    end

    if e.PistolShot:IsCastable() and n:IsSpellInRange(e.PistolShot) and t:BuffUp(e.Opportunity) then
        if t:BuffUp(e.Opportunity) and (EnergyDeficitPredicted > EnergyRegen * 1.5 or (not e.WeaponmasterT:IsAvailable() and k <= 1 + f(t:BuffUp(e.Broadside))) or e.QuickDraw:IsAvailable() or (e.Audacity:IsAvailable() and not t:BuffUp(e.Audacity))) then
            if a.CastPooling(e.PistolShot) then
                o = 185763
                return "Cast Pistol Shot 1"
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

local function v()
    z = HeroRotationCharDB.Toggles[6]
    b = HeroRotationCharDB.Toggles[4]
    B = HeroRotationCharDB.Toggles[5]
    G = HeroRotationCharDB.Toggles[12]
    ae = not HeroRotationCharDB.Toggles[15]
    I = HeroRotationCharDB.Toggles[21]
    P = HeroRotationCharDB.Toggles[22]
    V = HeroRotationCharDB.Toggles[23]
    Y = HeroRotationCharDB.Toggles[24]
    C = HeroRotationCharDB.Toggles[25]
    M = HeroRotationCharDB.Toggles[27]
    F = HeroRotationCharDB.Toggles[50]
    Q = HeroRotationCharDB.Toggles[51]
    ne = HeroRotationCharDB.Toggles[52]
    W = HeroRotationCharDB.Toggles[53]
    K = HeroRotationCharDB.Toggles[30]
    se = HeroRotationCharDB.Toggles[54]
    A = GetInventoryItemID("player", 13)
    S = GetInventoryItemID("player", 14)
            if not i.Commons.Enabled.TopTrinket and not i.Commons.Enabled.BottomTrinket then
        T = { A, S, s.ComputationDevice:ID(), s.VigorTrinket:ID(), s.FontOfPower:ID(), s.RazorCoral:ID(), s.CacheOfAcquiredTreasures:ID(), s.MistcallerOcarina:ID() }
    elseif not i.Commons.Enabled.TopTrinket and i.Commons.Enabled.BottomTrinket then
        T = { A, s.ComputationDevice:ID(), s.VigorTrinket:ID(), s.FontOfPower:ID(), s.RazorCoral:ID(), s.CacheOfAcquiredTreasures:ID(), s.MistcallerOcarina:ID() }
    elseif not i.Commons.Enabled.BottomTrinket and i.Commons.Enabled.TopTrinket then
        T = { S, s.ComputationDevice:ID(), s.VigorTrinket:ID(), s.FontOfPower:ID(), s.RazorCoral:ID(), s.CacheOfAcquiredTreasures:ID(), s.MistcallerOcarina:ID() }
    end

    N = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                N = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

end

local function f()
    U = e.AcrobaticStrikes:IsAvailable() and 9 or 6
    ue = e.Dispatch:Damage() * 1.25
    y = t:ComboPoints()
    p = le(y)
    k = t:ComboPointsDeficit()
    if _() then
        X = t:GetEnemiesInRange(30)
        J = t:GetEnemiesInRange(U)
        w = #J
    else
        w = 1
    end

    h = v()
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
        te = GetTime()
        Z = te + (a.GUISettings.General.OpenerReset)
    elseif a.GUISettings.General.OpenerReset > 0 and Z ~= nil and GetTime() > Z and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        a.ToggleIconFrame:UpdateButtonText(6)
        a.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (W and e.GrapplingHook:IsUsableP() and e.GrapplingHook:CooldownRemains(BypassRecovery) <= 0) then
        if a.Cast(e.GrapplingHook, nil, nil, nil) then
            o = 195457
            return "queue Grappling Hook"
        end

    elseif ((not e.GrapplingHook:IsUsableP() or e.GrapplingHook:CooldownRemains() > 0) and W) then
        HeroRotationCharDB.Toggles[53] = not HeroRotationCharDB.Toggles[53]
        a.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[53] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (P and e.CheapShot:IsUsableP() and e.CheapShot:CooldownRemains(BypassRecovery) <= 0 and (t:StealthUp(true, true) or t:BuffUp(e.VanishBuff)) and (n:IsInRange(8) or u("mouseover"):IsInRange(8))) then
        if a.Cast(e.CheapShot, nil, nil, nil) then
            if u("mouseover"):GUID() ~= nil and u("mouseover"):IsSpellInRange(e.CheapShot) then
                m = 18335
                return "queue Cheap Shot MO"
            else
                o = 1833
                return "queue Cheap Shot"
            end

        end

    elseif ((not e.CheapShot:IsUsableP() or e.CheapShot:CooldownRemains() > 0) and P) then
        HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
        a.Print("Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (V and e.KidneyShot:IsUsableP() and e.KidneyShot:CooldownRemains(BypassRecovery) <= 0 and (n:IsInRange(8) or u("mouseover"):IsInRange(8))) then
        if a.Cast(e.KidneyShot, nil, nil, nil) then
            if u("mouseover"):GUID() ~= nil and u("mouseover"):IsSpellInRange(e.KidneyShot) then
                m = 4085
                return "queue Kidney Shot MO"
            else
                o = 408
                return "queue Kidney Shot"
            end

        end

    elseif ((not e.KidneyShot:IsUsableP() or e.KidneyShot:CooldownRemains() > 0) and V) then
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

        if (C and e.Sap:IsUsableP() and e.Sap:CooldownRemains(BypassRecovery) <= 0 and t:StealthUp(true, true) and (n:IsInRange(10) or u("mouseover"):IsInRange(10))) then
        if a.Cast(e.Sap, nil, nil, nil) then
            if u("mouseover"):GUID() ~= nil and u("mouseover"):IsSpellInRange(e.Sap) then
                m = 67705
                return "queue Sap MO"
            else
                o = 6770
                return "queue Sap"
            end

        end

    elseif ((not e.Sap:IsUsableP() or e.Sap:CooldownRemains() > 0 or not t:StealthUp(true, true)) and C) then
        HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
        a.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (M and e.Feint:IsUsableP() and e.Feint:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if a.Cast(e.Feint, nil, nil, nil) then
            o = 202
            return "queue Shuriken Tornado"
        end

    elseif ((not e.Feint:IsUsableP() or e.Feint:CooldownRemains() > 0 or not t:AffectingCombat()) and M) then
        HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27]
        a.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (F and e.Gouge:IsUsableP() and e.Gouge:CooldownRemains(BypassRecovery) <= 0 and (n:IsInRange(8) or u("mouseover"):IsInRange(8))) then
        if a.Cast(e.Gouge, nil, nil, nil) then
            if u("mouseover"):GUID() ~= nil and u("mouseover"):IsSpellInRange(e.Gouge) then
                m = 17765
                return "queue Gouge MO"
            else
                o = 1776
                return "queue Gouge"
            end

        end

    elseif ((not e.Gouge:IsUsableP() or e.Gouge:CooldownRemains() > 0 or not t:AffectingCombat()) and F) then
        HeroRotationCharDB.Toggles[50] = not HeroRotationCharDB.Toggles[50]
        a.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[50] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if (K) then
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

        elseif (((e.ArcaneTorrent:IsAvailable() and (not e.ArcaneTorrent:IsUsableP() or e.ArcaneTorrent:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.LightsJudgment:IsAvailable() and (not e.LightsJudgment:IsUsableP() or e.LightsJudgment:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BagofTricks:IsAvailable() and (not e.BagofTricks:IsUsableP() or e.BagofTricks:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BloodFury:IsAvailable() and (not e.BloodFury:IsUsableP() or e.BloodFury:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Berserking:IsAvailable() and (not e.Berserking:IsUsableP() or e.Berserking:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Fireblood:IsAvailable() and (not e.Fireblood:IsUsableP() or e.Fireblood:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.AncestralCall:IsAvailable() and (not e.AncestralCall:IsUsableP() or e.AncestralCall:CooldownRemains() > 0 or not t:AffectingCombat()))) and K) then
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

    oe = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 158337 }
    if UnitExists("target") and e.Shiv:IsReady() and not se then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
            for t = 0, 10 do
                local i, i, i, i, n, t, i, i, i, s = UnitBuff("target", t)
                for h, i in pairs(oe) do
                    if i == s and (t - n) + (500 / 1000) <= GetTime() then
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

    s = t:BuffRemains(l(381637))
        if l(381637):IsAvailable() and i.Commons.NonLethalPoison == "Atrophic Poison" then
        if s < u and not t:IsCasting(l(381637)) then
            if a.Cast(l(381637)) then
                o = 381637
                return "Antropic Poison Refresh"
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

    if not t:AffectingCombat() and z then
        if j.TargetIsValid() and (not t:AffectingCombat() and z) then
            if c() and e.MarkedforDeath:IsCastable() and k >= d.CPMaxSpend() - 1 and n:NPCID() ~= 170234 then
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

            if e.RolltheBones:IsReady() and (d.RtBRemains() <= 3 or H()) then
                if a.Cast(e.RolltheBones) then
                    o = 315508
                    return "Cast Roll the Bones (Opener)"
                end

            end

            if e.SliceandDice:IsReady() and t:BuffRemains(e.SliceandDice) < (1 + y) * 1.8 then
                if a.CastPooling(e.SliceandDice) then
                    o = 315496
                    return "Cast Slice and Dice (Opener)"
                end

            end

                                    if (t:StealthUp(true, true) or t:BuffUp(e.VanishBuff)) then
                h = q()
                if h then
                    return "Stealth (Opener): " .. h
                end

            elseif r() then
                h = g()
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

    if e.MarkedforDeath:IsCastable() and (t:AffectingCombat() or z or t:BuffUp(e.VanishBuff)) then
                if w > 1 and j.CastTargetIf(e.MarkedforDeath, X, "min", me, ce, nil, nil) then
            return "Cast Marked for Death (Cycle)"
        elseif w == 1 and not t:StealthUp(true, false) and k >= d.CPMaxSpend() - 1 and n:NPCID() ~= 170234 then
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

    if j.TargetIsValid() and (t:AffectingCombat() or z or t:BuffUp(e.VanishBuff)) then
        if (t:StealthUp(true, true) or t:BuffUp(e.VanishBuff)) then
            h = q()
            if h then
                return "Stealth: " .. h
            end

        end

        local s, d, l = GetSpellCooldown(57934)
        if i.Commons.AutoToT then
            if (s + d - GetTime()) <= 0 and e.TricksoftheTrade:IsAvailable() and e.TricksoftheTrade:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus")) and IsItemInRange(32698, "focus") then
                if a.Cast(e.TricksoftheTrade) then
                    o = 207
                    return "ToT Focus"
                end

            end

        end

        h = re()
        if h then
            return "CDs: " .. h
        end

        if r() then
            h = g()
            if h then
                return "Finish: " .. h
            end

            a.Cast(e.PoolEnergy)
            return "Finish Pooling"
        end

        h = x()
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

        if e.PistolShot:IsCastable() and n:IsSpellInRange(e.PistolShot) and not n:IsInRange(U) and not t:StealthUp(true, true) and t:EnergyDeficitPredicted() < 25 and (k >= 1 or D() <= 1.2) then
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

