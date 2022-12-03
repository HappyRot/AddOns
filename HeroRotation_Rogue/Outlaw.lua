local e, e = ...
local e = HeroDBC.DBC
local p = HeroLib
local h = HeroCache
local l = p.Unit
local t = l.Player
local i = l.Target
local d = p.Spell
local e = p.MultiSpell
local o = p.Item
local a = HeroRotation
local j = a.AoEON
local u = a.CDsON
local ue = HeroRotationCharDB.Toggles[4]
local ee = HeroRotationCharDB.Toggles[5]
local q = HeroRotationCharDB.Toggles[6]
local te = HeroRotationCharDB.Toggles[12]
local ae = not HeroRotationCharDB.Toggles[15]
local Z = HeroRotationCharDB.Toggles[21]
local K = HeroRotationCharDB.Toggles[52]
local F = HeroRotationCharDB.Toggles[22]
local Y = HeroRotationCharDB.Toggles[23]
local U = HeroRotationCharDB.Toggles[24]
local C = HeroRotationCharDB.Toggles[25]
local H = HeroRotationCharDB.Toggles[27]
local V = HeroRotationCharDB.Toggles[50]
local D = HeroRotationCharDB.Toggles[51]
local L = HeroRotationCharDB.Toggles[53]
local R = HeroRotationCharDB.Toggles[30]
local X = HeroRotationCharDB.Toggles[54]
local Q = 0
local J = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 158337 }
local N = math.min
local e = math.abs
local ne = nil
local M = nil
local P = GetInventoryItemID("player", 13)
local W = GetInventoryItemID("player", 14)
local k = a.Commons.Everyone
local r = a.Commons.Rogue
local n = { General = a.GUISettings.General, Commons = a.GUISettings.APL.Rogue.Commons, Commons2 = a.GUISettings.APL.Rogue.Commons2, Outlaw = a.GUISettings.APL.Rogue.Outlaw }
local e = d.Rogue.Outlaw
local f = o.Rogue.Outlaw
local x = {  }
e.Dispatch:RegisterDamageFormula(function()
    return t:AttackPowerDamageMod() * r.CPSpend() * .3 * 1. * (1 + t:VersatilityDmgPct() / 100) * (i:DebuffUp(e.GhostlyStrike) and 1.1 or 1)
end)
local G, I, y
local s
local A = 6
local ie
local _, v, c
local oe, T, g, E, O
local o = { { e.Blind, "Cast Blind (Interrupt)", function()
    return true
end } }
local o = r.ReturnSpell()
local w = r.ReturnSpellMO()
local function m(e)
    if e then
        return 1
    else
        return 0
    end

end

local b, z = 0, 0
local function le(e)
    local e = t:EnergyTimeToMaxPredicted(nil, e)
    if e < b or (e - b) > .5 then
        b = e
    end

    return b
end

local function ce()
    local e = t:EnergyPredicted()
    if e > z or (e - z) > 9 then
        z = e
    end

    return z
end

local b = { e.Broadside, e.BuriedTreasure, e.GrandMelee, e.RuthlessPrecision, e.SkullandCrossbones, e.TrueBearing }
local function z(e, a)
    if not h.APLVar.RtB_List then
        h.APLVar.RtB_List = {  }
    end

    if not h.APLVar.RtB_List[e] then
        h.APLVar.RtB_List[e] = {  }
    end

    local o = table.concat(a)
    if e == "All" then
        if not h.APLVar.RtB_List[e][o] then
            local i = 0
            for e = 1, #a do
                if t:BuffUp(b[a[e]]) then
                    i = i + 1
                end

            end

            h.APLVar.RtB_List[e][o] = i == #a and true or false
        end

    else
        if not h.APLVar.RtB_List[e][o] then
            h.APLVar.RtB_List[e][o] = false
            for i = 1, #a do
                if t:BuffUp(b[a[i]]) then
                    h.APLVar.RtB_List[e][o] = true
                    break
                end

            end

        end

    end

    return h.APLVar.RtB_List[e][o]
end

local function z()
    if not h.APLVar.RtB_Buffs then
        h.APLVar.RtB_Buffs = 0
        for e = 1, #b do
            if t:BuffUp(b[e]) then
                h.APLVar.RtB_Buffs = h.APLVar.RtB_Buffs + 1
            end

        end

    end

    return h.APLVar.RtB_Buffs
end

local function S()
    if not h.APLVar.RtB_Reroll then
                                                        if n.Outlaw.RolltheBonesLogic == "1+ Buff" then
            h.APLVar.RtB_Reroll = (z() <= 0) and true or false
        elseif n.Outlaw.RolltheBonesLogic == "Broadside" then
            h.APLVar.RtB_Reroll = (not t:BuffUp(e.Broadside)) and true or false
        elseif n.Outlaw.RolltheBonesLogic == "Buried Treasure" then
            h.APLVar.RtB_Reroll = (not t:BuffUp(e.BuriedTreasure)) and true or false
        elseif n.Outlaw.RolltheBonesLogic == "Grand Melee" then
            h.APLVar.RtB_Reroll = (not t:BuffUp(e.GrandMelee)) and true or false
        elseif n.Outlaw.RolltheBonesLogic == "Skull and Crossbones" then
            h.APLVar.RtB_Reroll = (not t:BuffUp(e.SkullandCrossbones)) and true or false
        elseif n.Outlaw.RolltheBonesLogic == "Ruthless Precision" then
            h.APLVar.RtB_Reroll = (not t:BuffUp(e.RuthlessPrecision)) and true or false
        elseif n.Outlaw.RolltheBonesLogic == "True Bearing" then
            h.APLVar.RtB_Reroll = (not t:BuffUp(e.TrueBearing)) and true or false
        else
                        if z() == 2 and t:BuffUp(e.BuriedTreasure) and t:BuffUp(e.GrandMelee) then
                h.APLVar.RtB_Reroll = true
            elseif z() < 2 and (not t:BuffUp(e.Broadside) and (not ConcealedBlunderbussEquipped and not e.FanTheHammer:IsAvailable() or not t:BuffUp(e.SkullandCrossbones)) and (not InvigoratingShadowdustEquipped or not t:BuffUp(e.TrueBearing))) then
                h.APLVar.RtB_Reroll = true
            else
                h.APLVar.RtB_Reroll = false
            end

        end

        if k.IsSoloMode() then
                        if t:BuffUp(e.GrandMelee) then
                if t:IsTanking(i) or t:HealthPercentage() < N(n.Outlaw.RolltheBonesLeechKeepHP, n.Outlaw.RolltheBonesLeechRerollHP) then
                    h.APLVar.RtB_Reroll = false
                end

            elseif t:HealthPercentage() < n.Outlaw.RolltheBonesLeechRerollHP then
                h.APLVar.RtB_Reroll = true
            end

        end

    end

    return h.APLVar.RtB_Reroll
end

local function N(a)
    return e.CountTheOdds:IsAvailable() and (t:BuffUp(r.StealthSpell(), nil, a) or t:BuffUp(r.VanishBuffSpell(), nil, a) or t:BuffUp(e.Shadowmeld, nil, a) or t:BuffUp(e.ShadowDanceBuff, nil, a))
end

local function b()
    if e.BetweentheEyes:CooldownUp() and _ < 5 then
        return false
    end

    return v >= (r.CPMaxSpend() - m(t:BuffUp(e.Broadside)) - m(t:BuffUp(e.Opportunity) and (e.QuickDraw:IsAvailable() or e.FanTheHammer:IsAvailable()))) or _ >= r.CPMaxSpend()
end

local function h()
    return c >= 2 + m(e.ImprovedAmbush:IsAvailable()) + m(t:BuffUp(e.Broadside)) and _ < r.CPMaxSpend() and oe >= 50 and (not e.CountTheOdds:IsAvailable() or r.RtBRemains() > 10)
end

local function me()
    return not j() or y < 2 or (t:BuffRemains(e.BladeFlurry) > 1 + m(e.KillingSpree:IsAvailable()))
end

local function B()
    return n.Commons.VanishOffensive and u() and not (k.IsSoloMode() and t:IsTanking(i))
end

local function de(e)
    return e:TimeToDie()
end

local function re(a)
                if (((a:FilteredTimeToDie("<", c * 1.5) or (not t:StealthUp(true, false) and c >= r.CPMaxSpend() - 1)) and not t:DebuffUp(e.Dreadblades)) and a:GUID() == l("mouseover"):GUID() and a:NPCID() ~= 170234 and n.Outlaw.TargetSwap == "Mouseover") then
        w = 1376195
        return true
    elseif (((a:FilteredTimeToDie("<", c * 1.5) or (not t:StealthUp(true, false) and c >= r.CPMaxSpend() - 1)) and not t:DebuffUp(e.Dreadblades)) and n.Outlaw.TargetSwap == "AutoSwap" and a:GUID() ~= i:GUID() and a:NPCID() ~= 170234 and not te) then
        w = 999
        return true
    elseif (((a:FilteredTimeToDie("<", c * 1.5) or (not t:StealthUp(true, false) and c >= r.CPMaxSpend() - 1)) and not t:DebuffUp(e.Dreadblades)) and a:GUID() == i:GUID() and a:NPCID() ~= 170234) then
        o = 137619
        return true
    elseif ((a:FilteredTimeToDie("<", c * 1.5) or (not t:StealthUp(true, false) and c >= r.CPMaxSpend() - 1)) and not t:DebuffUp(e.Dreadblades)) and a:NPCID() ~= 170234 then
        return true
    end

end

local function se()
    if not Z and n.Commons.VanishOffensive and e.Vanish:IsCastable() and B() then
        if e.HiddenOpportunity:IsAvailable() or not e.ShadowDance:IsAvailable() or not e.ShadowDance:IsCastable() then
            if e.FindWeakness:IsAvailable() and i:DebuffDown(e.FindWeaknessDebuff) and h() then
                if a.Cast(e.Vanish, nil) then
                    o = 1856
                    return "Cast Vanish (FW)"
                end

                return 
            end

            if e.HiddenOpportunity:IsAvailable() then
                local i = not e.ShadowDance:IsAvailable() and (e.FanTheHammer:TalentRank() + m(e.QuickDraw:IsAvailable()) + m(e.Audacity:IsAvailable()) < m(e.CountTheOdds:IsAvailable()) + m(e.KeepItRolling:IsAvailable()))
                if t:BuffDown(e.AudacityBuff) and (i or t:BuffStack(e.Opportunity) < (e.FanTheHammer:IsAvailable() and 6 or 1)) and h() then
                    if a.Cast(e.Vanish, nil) then
                        o = 1856
                        return "Cast Vanish (HO)"
                    end

                    return 
                end

            end

            if not e.FindWeakness:IsAvailable() and not e.HiddenOpportunity:IsAvailable() and b() then
                if a.Cast(e.Vanish, nil) then
                    return "Cast Vanish (Finish)"
                end

                return 
            end

        end

    end

    if e.ShadowDance:IsCastable() and ee then
        if i:DebuffUp(e.BetweentheEyes) and (not e.GhostlyStrike:IsAvailable() or i:DebuffUp(e.GhostlyStrike)) and (not e.Dreadblades:IsAvailable() or not e.Dreadblades:IsCastable()) and (not e.HiddenOpportunity:IsAvailable() or (t:BuffDown(e.AudacityBuff) and (e.FanTheHammer:TalentRank() < 2 or t:BuffDown(e.Opportunity)))) then
            if e.KeepItRolling:IsAvailable() then
                if (e.KeepItRolling:CooldownRemains() <= 30 or (e.KeepItRolling:CooldownRemains() > 120 and (b() or e.HiddenOpportunity:IsAvailable()))) then
                    if a.Cast(e.ShadowDance, nil) then
                        o = 185313
                        return "Cast Shadow Dance (KiR)"
                    end

                    return 
                end

            else
                if t:BuffUp(e.SliceandDice) and (b() or e.HiddenOpportunity:IsAvailable()) and (not e.HiddenOpportunity:IsAvailable() or not e.Vanish:CooldownUp() or not B()) then
                    if a.Cast(e.ShadowDance, nil) then
                        o = 185313
                        return "Cast Shadow Dance"
                    end

                    return 
                end

            end

        end

    end

end

local function he()
    if e.BladeFlurry:IsReady() and j() and y >= 2 and not t:BuffUp(e.BladeFlurry) then
        if a.Cast(e.BladeFlurry) then
            o = 13877
            return "Cast Blade Flurry"
        end

    end

    if e.RolltheBones:IsReady() and not t:DebuffUp(e.Dreadblades) and (r.RtBRemains() <= 0 or S()) then
        if a.Cast(e.RolltheBones) then
            o = 315508
            return "Cast Roll the Bones"
        end

    end

    if e.KeepItRolling:IsReady() and u() and not S() and (m(t:BuffUp(e.Broadside)) + m(t:BuffUp(e.TrueBearing)) + m(t:BuffUp(e.SkullandCrossbones))) > 2 and (t:BuffDown(e.ShadowDanceBuff) or z() >= 6) then
        if a.Cast(e.KeepItRolling) then
            o = 381989
            return "Cast KeepItRolling"
        end

    end

    if i:IsSpellInRange(e.SinisterStrike) then
        if not t:StealthUp(true, true, true) or e.CountTheOdds:IsAvailable() and not N() then
            s = se()
            if s then
                return s
            end

        end

        if e.AdrenalineRush:IsCastable() and u() and not t:BuffUp(e.AdrenalineRush) and (not e.ImprovedAdrenalineRush:IsAvailable() or v <= 2) then
            if a.Cast(e.AdrenalineRush, nil) then
                o = 13750
                return "Cast Adrenaline Rush"
            end

        end

        if e.Dreadblades:IsReady() and u() and i:IsSpellInRange(e.Dreadblades) and not t:StealthUp(true, true) and v <= 2 and (not e.MarkedforDeath:IsAvailable() or not e.MarkedforDeath:CooldownUp()) and i:FilteredTimeToDie(">=", 10) then
            if a.Cast(e.Dreadblades, nil) then
                o = 343142
                return "Cast Dreadblades"
            end

        end

    end

    if e.ThistleTea:IsCastable() and u() and not t:BuffUp(e.ThistleTea) and (g >= 100 or p.BossFilteredFightRemains("<", e.ThistleTea:Charges() * 6)) then
        if a.Cast(e.ThistleTea, nil) then
            o = 381623
            return "Cast Thistle Tea"
        end

    end

    if me() then
        if e.KillingSpree:IsCastable() and u() and not K and i:IsSpellInRange(e.KillingSpree) and not t:StealthUp(true, false) and (i:DebuffUp(e.BetweentheEyes) and not t:DebuffUp(e.Dreadblades) and g > (T * 2 + 15) or y > 2) then
            if a.Cast(e.KillingSpree, nil, nil) then
                o = 51690
                return "Cast Killing Spree"
            end

        end

        if e.BladeRush:IsCastable() and i:IsSpellInRange(e.BladeRush) and (((i:IsInMeleeRange(n.Outlaw.BRRange)) and not D) or (D and i:IsInMeleeRange(5))) and not t:DebuffUp(e.Dreadblades) and not t:BuffUp(e.ShadowDanceBuff) and E > 4 and i:FilteredTimeToDie(">", 4) then
            if a.Cast(e.BladeRush, nil) then
                o = 271877
                return "Cast Blade Rush"
            end

        end

    end

    if i:IsSpellInRange(e.SinisterStrike) then
        if e.Shadowmeld:IsCastable() and n.Commons.Enabled.Racials and u() and (e.CountTheOdds:IsAvailable() and b() or not e.Weaponmaster:IsAvailable() and h()) then
            if a.Cast(e.Shadowmeld, nil) then
                o = 58984
                return "Cast Shadowmeld"
            end

        end

        if f.PotionofSpectralAgility:IsReady() and u() and n.Commons.Enabled.Potions and ae and ((t:BloodlustUp() and a.GUISettings.General.HoldPotforBL) or ((t:BloodlustUp() or i:TimeToDie() <= 30 or t:BuffUp(e.AdrenalineRush)) and not a.GUISettings.General.HoldPotforBL)) then
            if a.Cast(f.PotionofSpectralAgility, nil) then
                o = 50
                return "Cast Pot"
            end

        end

        if e.BloodFury:IsCastable() and n.Commons.Enabled.Racials and u() then
            if a.Cast(e.BloodFury, nil) then
                o = 20572
                return "Cast Blood Fury"
            end

        end

        if e.Berserking:IsCastable() and n.Commons.Enabled.Racials and u() then
            if a.Cast(e.Berserking, nil) then
                o = 26297
                return "Cast Berserking"
            end

        end

        if e.Fireblood:IsCastable() and n.Commons.Enabled.Racials and u() then
            if a.Cast(e.Fireblood, nil) then
                o = 265221
                return "Cast Fireblood"
            end

        end

        if e.AncestralCall:IsCastable() and n.Commons.Enabled.Racials and u() then
            if a.Cast(e.AncestralCall, nil) then
                o = 274738
                return "Cast Ancestral Call"
            end

        end

        local t = t:GetUseableTrinkets(x)
        if t and (i:DebuffUp(e.BetweentheEyes) or p.BossFilteredFightRemains("<", 20) or t:TrinketHasStatAnyDps()) then
            if t then
                if a.Cast(t, nil, nil) then
                                        if t:ID() == GetInventoryItemID("player", 13) and n.Commons.Enabled.TopTrinket then
                        o = 24
                        return "Generic use_items for " .. t:Name()
                    elseif t:ID() == GetInventoryItemID("player", 14) and n.Commons.Enabled.BottomTrinket then
                        o = 25
                        return "Generic use_items for " .. t:Name()
                    end

                end

            end

        end

    end

end

local function z()
    if e.BladeFlurry:IsReady() and j() and y >= 2 and e.Subterfuge:IsAvailable() and e.HiddenOpportunity:IsAvailable() and not t:BuffUp(e.BladeFlurry) then
        if a.Cast(e.BladeFlurry) then
            o = 13877
            return "Cast Blade Flurry"
        end

    end

    if e.Dispatch:IsCastable() and i:IsSpellInRange(e.Dispatch) and b() then
        if a.CastPooling(e.Dispatch) then
            o = 2098
            return "Cast Dispatch"
        end

    end

    if e.Ambush:IsReady() and i:IsSpellInRange(e.Ambush) and (N() or e.HiddenOpportunity:IsAvailable() or (t:BuffUp(e.Stealth) or t:BuffUp(e.VanishBuff)) and e.FindWeakness:IsAvailable() and not i:DebuffUp(e.FindWeaknessDebuff)) then
        if a.CastPooling(e.Ambush) then
            o = 8676
            return "Cast Ambush"
        end

    end

end

local function B()
    if e.BetweentheEyes:IsCastable() and i:IsSpellInRange(e.BetweentheEyes) and (i:FilteredTimeToDie(">", 4) or i:TimeToDieIsNotValid()) and r.CanDoTUnit(i, ie) and (i:DebuffRemains(e.BetweentheEyes) < 4 or (e.GreenskinsWickers:IsAvailable() and not t:BuffUp(e.GreenskinsWickersBuff)) or (not e.GreenskinsWickers:IsAvailable() and t:BuffUp(e.RuthlessPrecision))) then
        if e.ColdBlood:IsReady() and e.ImprovedBetweentheEyes:IsAvailable() then
            if a.Cast(e.ColdBlood) then
                o = 382245
                return "Cast ColdBlood"
            end

        end

        if a.CastPooling(e.BetweentheEyes) then
            o = 315341
            return "Cast Between the Eyes"
        end

    end

    if e.SliceandDice:IsCastable() and (p.FilteredFightRemains(I, ">", t:BuffRemains(e.SliceandDice), true) or t:BuffRemains(e.SliceandDice) == 0) and t:BuffRemains(e.SliceandDice) < (1 + v) * 1.8 and (not e.SwiftSlasher:IsAvailable() or c == 0) then
        if a.CastPooling(e.SliceandDice) then
            o = 315496
            return "Cast Slice and Dice"
        end

    end

    if e.ColdBlood:IsReady() and e.ColdBlood:IsCastable() and not e.ImprovedBetweentheEyes:IsAvailable() then
        if a.Cast(e.ColdBlood) then
            o = 382245
            return "Cast ColdBlood"
        end

    end

    if e.Dispatch:IsCastable() and i:IsSpellInRange(e.Dispatch) then
        if a.CastPooling(e.Dispatch) then
            o = 2098
            return "Cast Dispatch"
        end

    end

end

local function se()
    if u() and e.Sepsis:IsReady() and i:IsSpellInRange(e.Sepsis) and (i:FilteredTimeToDie(">", 11) and i:DebuffUp(e.BetweentheEyes) or p.BossFilteredFightRemains("<", 11)) then
        if a.Cast(e.Sepsis, nil, nil) then
            o = 328305
            return "Cast Sepsis"
        end

    end

    if e.GhostlyStrike:IsReady() and i:IsSpellInRange(e.GhostlyStrike) and i:DebuffRemains(e.GhostlyStrike) <= 3 and (y <= 2 or t:BuffUp(e.Dreadblades)) and i:FilteredTimeToDie(">=", 5) then
        if a.Cast(e.GhostlyStrike, nil) then
            o = 196937
            return "Cast Ghostly Strike"
        end

    end

    if e.EchoingReprimand:IsReady() and u() and i:IsSpellInRange(e.EchoingReprimand) and not t:DebuffUp(e.Dreadblades) then
        if a.Cast(e.EchoingReprimand, nil, nil) then
            o = 323547
            return "Cast Echoing Reprimand"
        end

    end

    if e.Ambush:IsReady() and i:IsSpellInRange(e.Ambush) and (e.HiddenOpportunity:IsAvailable() and t:BuffUp(e.AudacityBuff) or e.FindWeakness:IsAvailable() and not i:DebuffUp(e.FindWeaknessDebuff)) then
        if a.Cast(e.Ambush) then
            o = 8676
            return "Cast Ambush"
        end

    end

    if e.PistolShot:IsCastable() and i:IsSpellInRange(e.PistolShot) then
                if t:BuffUp(e.GreenskinsWickersBuff) and (not e.FanTheHammer:IsAvailable() and t:BuffUp(e.Opportunity)) then
            if a.CastPooling(e.PistolShot) then
                o = 185763
                return "Cast Pistol Shot (Buffed)"
            end

        elseif t:BuffUp(e.GreenskinsWickersBuff) and t:BuffRemains(e.GreenskinsWickersBuff) < 1.5 then
            if a.CastPooling(e.PistolShot) then
                o = 185763
                return "Cast Pistol Shot (GSW Dump)"
            end

        end

        if e.FanTheHammer:IsAvailable() and t:BuffUp(e.Opportunity) then
                        if t:BuffStack(e.Opportunity) >= 6 or t:BuffRemains(e.Opportunity) < 2 then
                if a.CastPooling(e.PistolShot) then
                    o = 185763
                    return "Cast Pistol Shot (FtH Dump)"
                end

            elseif c > (1 + m(e.QuickDraw:IsAvailable()) * e.FanTheHammer:TalentRank()) and not t:DebuffUp(e.Dreadblades) and (not e.HiddenOpportunity:IsAvailable() or not t:BuffUp(e.SubterfugeBuff) and not t:BuffUp(e.ShadowDanceBuff)) then
                if a.CastPooling(e.PistolShot) then
                    o = 185763
                    return "Cast Pistol Shot (FtH)"
                end

            end

        end

    end

    if e.Ambush:IsReady() and (t:BuffUp(e.AudacityBuff) or t:StealthUp(true, true)) and (e.HiddenOpportunity:IsAvailable() or e.FindWeakness:IsAvailable() and not i:DebuffUp(e.FindWeaknessDebuff)) then
        if a.CastPooling(e.Ambush) then
            o = 8676
            return "Cast Ambush (Pooling)"
        end

    end

    if not e.FanTheHammer:IsAvailable() and e.PistolShot:IsCastable() and i:IsSpellInRange(e.PistolShot) and t:BuffUp(e.Opportunity) then
        if (E > 1.5 or e.QuickDraw:IsAvailable() or (e.Audacity:IsAvailable() and not t:BuffUp(e.AudacityBuff)) or (not e.Weaponmaster:IsAvailable() and c <= 1 + m(t:BuffUp(e.Broadside)))) then
            if a.CastPooling(e.PistolShot) then
                o = 185763
                return "Cast Pistol Shot"
            end

        end

    end

    if e.SinisterStrike:IsCastable() and i:IsSpellInRange(e.SinisterStrike) then
        if a.CastPooling(e.SinisterStrike) then
            o = 193315
            return "Cast Sinister Strike"
        end

    end

end

local function h()
    q = HeroRotationCharDB.Toggles[6]
    ue = HeroRotationCharDB.Toggles[4]
    ee = HeroRotationCharDB.Toggles[5]
    te = HeroRotationCharDB.Toggles[12]
    ae = not HeroRotationCharDB.Toggles[15]
    Z = HeroRotationCharDB.Toggles[21]
    F = HeroRotationCharDB.Toggles[22]
    Y = HeroRotationCharDB.Toggles[23]
    U = HeroRotationCharDB.Toggles[24]
    C = HeroRotationCharDB.Toggles[25]
    H = HeroRotationCharDB.Toggles[27]
    V = HeroRotationCharDB.Toggles[50]
    D = HeroRotationCharDB.Toggles[51]
    K = HeroRotationCharDB.Toggles[52]
    L = HeroRotationCharDB.Toggles[53]
    R = HeroRotationCharDB.Toggles[30]
    X = HeroRotationCharDB.Toggles[54]
    P = GetInventoryItemID("player", 13)
    W = GetInventoryItemID("player", 14)
            if not n.Commons.Enabled.TopTrinket and not n.Commons.Enabled.BottomTrinket then
        x = { P, W }
    elseif not n.Commons.Enabled.TopTrinket and n.Commons.Enabled.BottomTrinket then
        x = { P }
    elseif not n.Commons.Enabled.BottomTrinket and n.Commons.Enabled.TopTrinket then
        x = { W }
    end

    Q = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                Q = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

end

local function m()
    A = e.AcrobaticStrikes:IsAvailable() and 9 or 6
    ie = e.Dispatch:Damage() * 1.25
    v = t:ComboPoints()
    _ = r.EffectiveComboPoints(v)
    c = t:ComboPointsDeficit()
    O = t:BuffUp(e.AdrenalineRush, nil, true) and -50 or 0
    oe = ce()
    T = t:EnergyRegen()
    E = le(O)
    g = t:EnergyDeficitPredicted(nil, O)
    if j() then
        G = t:GetEnemiesInRange(30)
        I = t:GetEnemiesInRange(A)
        y = #I
    else
        y = 1
    end

    s = h()
    if a.QueuedCast() then
        o = a.QueuedCast()
        return "Custom Queue " .. d(o):ID()
    end

    if s then
        return s
    end

    if w > 0 then
        w = 0
    end

    if o > 0 then
        o = 0
    end

    o = r.ReturnSpell()
    w = r.ReturnSpellMO()
        if a.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        ne = GetTime()
        M = ne + (a.GUISettings.General.OpenerReset)
    elseif a.GUISettings.General.OpenerReset > 0 and M ~= nil and GetTime() > M and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        a.ToggleIconFrame:UpdateButtonText(6)
        a.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (L and e.GrapplingHook:IsUsableP() and e.GrapplingHook:CooldownRemains(BypassRecovery) <= 0) then
        if a.Cast(e.GrapplingHook, nil, nil, nil) then
            o = 195457
            return "queue Grappling Hook"
        end

    elseif ((not e.GrapplingHook:IsUsableP() or e.GrapplingHook:CooldownRemains() > 0) and L) then
        HeroRotationCharDB.Toggles[53] = not HeroRotationCharDB.Toggles[53]
        a.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[53] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (F and e.CheapShot:IsUsableP() and e.CheapShot:CooldownRemains(BypassRecovery) <= 0 and (t:StealthUp(true, true) or t:BuffUp(e.VanishBuff)) and (i:IsInRange(8) or l("mouseover"):IsInRange(8))) then
        if a.Cast(e.CheapShot, nil, nil, nil) then
            if l("mouseover"):GUID() ~= nil and l("mouseover"):IsSpellInRange(e.CheapShot) then
                w = 18335
                return "queue Cheap Shot MO"
            else
                o = 1833
                return "queue Cheap Shot"
            end

        end

    elseif ((not e.CheapShot:IsUsableP() or e.CheapShot:CooldownRemains() > 0) and F) then
        HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
        a.Print("Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (Y and e.KidneyShot:IsUsableP() and e.KidneyShot:CooldownRemains(BypassRecovery) <= 0 and (i:IsInRange(8) or l("mouseover"):IsInRange(8))) then
        if a.Cast(e.KidneyShot, nil, nil, nil) then
            if l("mouseover"):GUID() ~= nil and l("mouseover"):IsSpellInRange(e.KidneyShot) then
                w = 4085
                return "queue Kidney Shot MO"
            else
                o = 408
                return "queue Kidney Shot"
            end

        end

    elseif ((not e.KidneyShot:IsUsableP() or e.KidneyShot:CooldownRemains() > 0) and Y) then
        HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
        a.Print("Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (U and e.Blind:IsUsableP() and e.Blind:CooldownRemains(BypassRecovery) <= 0 and (i:IsInRange(15) or l("mouseover"):IsInRange(15))) then
        if a.Cast(e.Blind, nil, nil, nil) then
            if l("mouseover"):GUID() ~= nil and l("mouseover"):IsSpellInRange(e.Blind) then
                w = 20945
                return "queue Blind MO"
            end

        end

    elseif ((not e.Blind:IsUsableP() or e.Blind:CooldownRemains() > 0) and U) then
        HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
        a.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (C and e.Sap:IsUsableP() and e.Sap:CooldownRemains(BypassRecovery) <= 0 and t:StealthUp(true, true) and (i:IsInRange(10) or l("mouseover"):IsInRange(10))) then
        if a.Cast(e.Sap, nil, nil, nil) then
            if l("mouseover"):GUID() ~= nil and l("mouseover"):IsSpellInRange(e.Sap) then
                w = 67705
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

        if (H and e.Feint:IsUsableP() and e.Feint:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if a.Cast(e.Feint, nil, nil, nil) then
            o = 202
            return "queue Shuriken Tornado"
        end

    elseif ((not e.Feint:IsUsableP() or e.Feint:CooldownRemains() > 0 or not t:AffectingCombat()) and H) then
        HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27]
        a.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (V and e.Gouge:IsUsableP() and e.Gouge:CooldownRemains(BypassRecovery) <= 0 and (i:IsInRange(8) or l("mouseover"):IsInRange(8))) then
        if a.Cast(e.Gouge, nil, nil, nil) then
            if l("mouseover"):GUID() ~= nil and l("mouseover"):IsSpellInRange(e.Gouge) then
                w = 17765
                return "queue Gouge MO"
            else
                o = 1776
                return "queue Gouge"
            end

        end

    elseif ((not e.Gouge:IsUsableP() or e.Gouge:CooldownRemains() > 0 or not t:AffectingCombat()) and V) then
        HeroRotationCharDB.Toggles[50] = not HeroRotationCharDB.Toggles[50]
        a.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[50] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if (R) then
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

        elseif (((e.ArcaneTorrent:IsAvailable() and (not e.ArcaneTorrent:IsUsableP() or e.ArcaneTorrent:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.LightsJudgment:IsAvailable() and (not e.LightsJudgment:IsUsableP() or e.LightsJudgment:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BagofTricks:IsAvailable() and (not e.BagofTricks:IsUsableP() or e.BagofTricks:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BloodFury:IsAvailable() and (not e.BloodFury:IsUsableP() or e.BloodFury:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Berserking:IsAvailable() and (not e.Berserking:IsUsableP() or e.Berserking:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Fireblood:IsAvailable() and (not e.Fireblood:IsUsableP() or e.Fireblood:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.AncestralCall:IsAvailable() and (not e.AncestralCall:IsUsableP() or e.AncestralCall:CooldownRemains() > 0 or not t:AffectingCombat()))) and R) then
            HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30]
            a.Print("Arcane Torrent Queue is now " .. (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

    end

    if t:IsChanneling(d(324631)) then
        if a.Cast(e.PoolEnergy, nil, nil, nil) then
            o = 99999
            return "channeling Fleashcraft"
        end

    end

    s = r.CrimsonVial()
    if s then
        return s
    end

    s = r.Feint()
    if s then
        return s
    end

    s = r.Evasion()
    if s then
        return s
    end

    if t:HealthPercentage() < n.Commons.PhialHP and f.PhialofSerenity:IsReady() and f.PhialofSerenity:CooldownRemains() <= 0 then
        if a.Cast(f.PhialofSerenity, nil) then
            o = 55
            return "PhialofSerenity HP"
        end

    end

    if t:HealthPercentage() < n.Commons.HealthstoneHP and f.Healthstone:IsReady() and f.Healthstone:CooldownRemains() <= 0 then
        if a.Cast(f.Healthstone, nil) then
            o = 40
            return "Healthstone HP"
        end

    end

    if t:HealthPercentage() < n.Commons.HealPotHP and f.CosmicHealPot:IsReady() and f.CosmicHealPot:CooldownRemains() <= 0 then
        if a.Cast(f.CosmicHealPot, nil) then
            o = 45
            return "CosmicHealPot HP"
        end

    end

    if t:HealthPercentage() < n.Commons.HealPotHP and f.HealPot:IsReady() and f.HealPot:CooldownRemains() <= 0 then
        if a.Cast(f.HealPot, nil) then
            o = 41
            return "HealPot HP"
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.PistolShot:IsCastable() and l("mouseover"):IsInMeleeRange(20) then
            if a.Cast(e.PistolShot, nil) then
                w = 1185763
                return "explosive MO Pistol"
            end

        end

    end

    if e.PistolShot:IsCastable() and l("target"):IsInMeleeRange(40) and string.find(UnitGUID("target"), 120651) then
        if a.Cast(e.PistolShot, nil) then
            o = 185763
            return "explosive Tar Pistol"
        end

    end

    J = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 158337 }
    if UnitExists("target") and e.Shiv:IsReady() and not X then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
            for t = 0, 10 do
                local t, t, t, t, i, s, t, t, t, n = UnitBuff("target", t)
                for h, t in pairs(J) do
                    if t == n and (s - i) + (500 / 1000) <= GetTime() then
                        if a.Cast(e.Shiv, nil) then
                            o = 5938
                            return "Shiv Enrage"
                        end

                    end

                end

            end

        end

    end

    local l = t:AffectingCombat() and 180 or 900
    local h
            if d(8679):IsAvailable() and n.Commons.LethalPoison == "Wound Poison" then
        h = t:BuffRemains(d(8679))
        if h < l and not t:IsCasting(d(8679)) then
            if a.Cast(d(8679)) then
                o = 203
                return "Wound Poison Refresh"
            end

        end

    elseif d(2823):IsAvailable() and n.Commons.LethalPoison == "Deadly Poison" then
        h = t:BuffRemains(d(2823))
        if h < l and not t:IsCasting(d(2823)) then
            if a.Cast(d(2823)) then
                o = 208
                return "Deadly Poison Refresh"
            end

        end

    elseif d(315584):IsAvailable() and n.Commons.LethalPoison == "Instant Poison" then
        h = t:BuffRemains(d(315584))
        if h < l and not t:IsCasting(d(315584)) then
            if a.Cast(d(315584)) then
                o = 205
                return "Instant Poison Refresh"
            end

        end

    end

    h = t:BuffRemains(d(381637))
            if d(381637):IsAvailable() and n.Commons.NonLethalPoison == "Atrophic Poison" then
        if h < l and not t:IsCasting(d(381637)) then
            if a.Cast(d(381637)) then
                o = 381637
                return "Antropic Poison Refresh"
            end

        end

    elseif d(5761):IsAvailable() and n.Commons.NonLethalPoison == "Numbing Poison" then
        h = t:BuffRemains(d(5761))
        if h < l and not t:IsCasting(NumbingPoison) then
            if a.Cast(d(5761)) then
                o = 204
                return "Numbing Poison Refresh"
            end

        end

    elseif d(3408):IsAvailable() and n.Commons.NonLethalPoison == "Crippling Poison" then
        h = t:BuffRemains(d(3408))
        if h < l and not t:IsCasting(NumbingPoison) then
            if a.Cast(d(3408)) then
                o = 206
                return "Crippling Poison Refresh"
            end

        end

    end

    if not t:BuffUp(e.VanishBuff) and not t:AffectingCombat() and not t:StealthUp(true, true) then
        s = r.Stealth(e.Stealth)
        if s then
            return s
        end

    end

    if not t:AffectingCombat() and q then
        if k.TargetIsValid() and (not t:AffectingCombat() and q) then
            if u() and e.MarkedforDeath:IsCastable() and c >= r.CPMaxSpend() - 1 and i:NPCID() ~= 170234 then
                if n.Commons.STMfDAsDPSCD then
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

            if e.RolltheBones:IsReady() and (r.RtBRemains() <= 0 or S()) then
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

                        if (t:StealthUp(true, false) or t:BuffUp(e.VanishBuff)) then
                s = z()
                if s then
                    return "Stealth (Opener): " .. s
                end

                if e.Ambush:IsReady() then
                    if a.Cast(e.Ambush) then
                        o = 8676
                        return "Cast Ambush (Opener)"
                    end

                end

            elseif b() then
                s = B()
                if s then
                    return "Finish (Opener): " .. s
                end

            end

            if e.SinisterStrike:IsCastable() then
                if a.Cast(e.SinisterStrike) then
                    o = 193315
                    return "Cast Sinister Strike (Opener)"
                end

            end

        end

        return 
    end

    if e.MarkedforDeath:IsCastable() and (t:AffectingCombat() or q or t:BuffUp(e.VanishBuff)) then
                if y > 1 and k.CastTargetIf(e.MarkedforDeath, G, "min", de, re, nil, nil) then
            return "Cast Marked for Death (Cycle)"
        elseif y == 1 and not t:StealthUp(true, false) and c >= r.CPMaxSpend() - 1 and not t:DebuffUp(e.Dreadblades) and i:NPCID() ~= 170234 then
            if a.Cast(e.MarkedforDeath, nil) then
                o = 137619
                return "Cast Marked for Death (ST)"
            end

        end

    end

    if k.TargetIsValid() and (t:AffectingCombat() or q or t:BuffUp(e.VanishBuff)) then
        if t:BuffUp(e.Stealth) or t:BuffUp(e.VanishBuff) or t:BuffUp(e.Shadowmeld) then
            s = z()
            if s then
                return "Stealth: " .. s
            end

        end

        local r, h, d = GetSpellCooldown(57934)
        if n.Commons.AutoToT then
            if (r + h - GetTime()) <= 0 and e.TricksoftheTrade:IsAvailable() and e.TricksoftheTrade:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus")) and IsItemInRange(32698, "focus") then
                if a.Cast(e.TricksoftheTrade) then
                    o = 207
                    return "ToT Focus"
                end

            end

        end

        s = he()
        if s then
            return "CDs: " .. s
        end

        if N() then
            s = z()
            if s then
                return "Stealth CtO: " .. s
            end

        end

        if b() then
            s = B()
            if s then
                return "Finish: " .. s
            end

            a.Cast(e.PoolEnergy)
            return "Finish Pooling"
        end

        s = se()
        if s then
            return "Build: " .. s
        end

        if e.ArcaneTorrent:IsCastable() and n.Commons.Enabled.Racials and u() and i:IsSpellInRange(e.SinisterStrike) and g > 15 + T then
            if a.Cast(e.ArcaneTorrent, nil) then
                o = 155145
                return "Cast Arcane Torrent"
            end

        end

        if e.ArcanePulse:IsCastable() and n.Commons.Enabled.Racials and u() and i:IsSpellInRange(e.SinisterStrike) then
            if a.Cast(e.ArcanePulse) then
                o = 260364
                return "Cast Arcane Pulse"
            end

        end

        if e.LightsJudgment:IsCastable() and n.Commons.Enabled.Racials and u() and i:IsInMeleeRange(5) then
            if a.Cast(e.LightsJudgment, nil) then
                o = 255647
                return "Cast Lights Judgment"
            end

        end

        if e.BagofTricks:IsCastable() and n.Commons.Enabled.Racials and u() and i:IsInMeleeRange(5) then
            if a.Cast(e.BagofTricks, nil) then
                o = 312411
                return "Cast Bag of Tricks"
            end

        end

        if e.PistolShot:IsCastable() and i:IsSpellInRange(e.PistolShot) and not i:IsInRange(A) and not t:StealthUp(true, true) and g < 25 and (c >= 1 or E <= 1.2) then
            if a.Cast(e.PistolShot) then
                o = 185763
                return "Cast Pistol Shot (OOR)"
            end

        end

    end

end

local function e()
end

function ReturnSpellOut()
    if o == 0 then
        return 0
    else
        return o
    end

end

function ReturnSpellMOOut()
    if w == 0 then
        return 0
    else
        return w
    end

end

a.SetAPL(260, m, e)

