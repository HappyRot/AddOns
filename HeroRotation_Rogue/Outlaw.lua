local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = d.Spell;
local j = d.MultiSpell;
local k = d.Item;
local l = HeroRotation;
local m = l.AoEON;
local n = l.CDsON;
local o = l.Commons.Everyone.num;
local p = l.Commons.Everyone.bool;
local q = math.min;
local r = math.max;
local s = math.abs;
local t = l.Commons.Everyone;
local u = l.Commons.Rogue;
local v = {
    General = l.GUISettings.General,
    Commons = l.GUISettings.APL.Rogue.Commons,
    Commons2 = l.GUISettings.APL.Rogue.Commons2,
    Outlaw = l.GUISettings.APL.Rogue.Outlaw
}
local w = i.Rogue.Outlaw;
local x = k.Rogue.Outlaw;
local y = {x.ManicGrieftorch:ID()}
w.Dispatch:RegisterDamageFormula(function()
    return g:AttackPowerDamageMod() * u.CPSpend() * 0.3 * 1.0 * (1 + g:VersatilityDmgPct() / 100) *
               (h:DebuffUp(w.GhostlyStrike) and 1.1 or 1)
end)
local z, A, B;
local C;
local D = 6;
local E;
local F, G, H;
local I, J, K, L, M;
local N = {{w.Blind, "Cast Blind (Interrupt)", function()
    return true
end}}
local O, P = 0, 0;
local function Q(R)
    local S = g:EnergyTimeToMaxPredicted(nil, R)
    if S < O or S - O > 0.5 then
        O = S
    end
    return O
end
local function T()
    local U = g:EnergyPredicted()
    if U > P or U - P > 9 then
        P = U
    end
    return P
end
local V = {w.Broadside, w.BuriedTreasure, w.GrandMelee, w.RuthlessPrecision, w.SkullandCrossbones, w.TrueBearing}
local function W(X, Y)
    if not e.APLVar.RtB_List then
        e.APLVar.RtB_List = {}
    end
    if not e.APLVar.RtB_List[X] then
        e.APLVar.RtB_List[X] = {}
    end
    local Z = table.concat(Y)
    if X == "All" then
        if not e.APLVar.RtB_List[X][Z] then
            local _ = 0;
            for a0 = 1, #Y do
                if g:BuffUp(V[Y[a0]]) then
                    _ = _ + 1
                end
            end
            e.APLVar.RtB_List[X][Z] = _ == #Y and true or false
        end
    else
        if not e.APLVar.RtB_List[X][Z] then
            e.APLVar.RtB_List[X][Z] = false;
            for a0 = 1, #Y do
                if g:BuffUp(V[Y[a0]]) then
                    e.APLVar.RtB_List[X][Z] = true;
                    break
                end
            end
        end
    end
    return e.APLVar.RtB_List[X][Z]
end
local function a1()
    if not e.APLVar.RtB_Buffs then
        e.APLVar.RtB_Buffs = {}
        e.APLVar.RtB_Buffs.Total = 0;
        e.APLVar.RtB_Buffs.Normal = 0;
        e.APLVar.RtB_Buffs.Shorter = 0;
        e.APLVar.RtB_Buffs.Longer = 0;
        local a2 = u.RtBRemains()
        for a0 = 1, #V do
            local a3 = g:BuffRemains(V[a0])
            if a3 > 0 then
                e.APLVar.RtB_Buffs.Total = e.APLVar.RtB_Buffs.Total + 1;
                if a3 == a2 then
                    e.APLVar.RtB_Buffs.Normal = e.APLVar.RtB_Buffs.Normal + 1
                elseif a3 > a2 then
                    e.APLVar.RtB_Buffs.Longer = e.APLVar.RtB_Buffs.Longer + 1
                else
                    e.APLVar.RtB_Buffs.Shorter = e.APLVar.RtB_Buffs.Shorter + 1
                end
            end
        end
    end
    return e.APLVar.RtB_Buffs.Total
end
local function a4()
    if not e.APLVar.RtB_Reroll then
        if v.Outlaw.RolltheBonesLogic == "1+ Buff" then
            e.APLVar.RtB_Reroll = a1() <= 0 and true or false
        elseif v.Outlaw.RolltheBonesLogic == "Broadside" then
            e.APLVar.RtB_Reroll = not g:BuffUp(w.Broadside) and true or false
        elseif v.Outlaw.RolltheBonesLogic == "Buried Treasure" then
            e.APLVar.RtB_Reroll = not g:BuffUp(w.BuriedTreasure) and true or false
        elseif v.Outlaw.RolltheBonesLogic == "Grand Melee" then
            e.APLVar.RtB_Reroll = not g:BuffUp(w.GrandMelee) and true or false
        elseif v.Outlaw.RolltheBonesLogic == "Skull and Crossbones" then
            e.APLVar.RtB_Reroll = not g:BuffUp(w.SkullandCrossbones) and true or false
        elseif v.Outlaw.RolltheBonesLogic == "Ruthless Precision" then
            e.APLVar.RtB_Reroll = not g:BuffUp(w.RuthlessPrecision) and true or false
        elseif v.Outlaw.RolltheBonesLogic == "True Bearing" then
            e.APLVar.RtB_Reroll = not g:BuffUp(w.TrueBearing) and true or false
        else
            if w.HiddenOpportunity:IsAvailable() then
                a1()
                if (g:BuffDown(w.SkullandCrossbones) or g:BuffRemains(w.SkullandCrossbones) > u.RtBRemains()) and
                    e.APLVar.RtB_Buffs.Normal + e.APLVar.RtB_Buffs.Shorter -
                    o(g:BuffUp(w.GrandMelee) and g:BuffRemains(w.GrandMelee) <= u.RtBRemains()) < 2 +
                    o(g:BuffUp(w.LoadedDiceBuff)) then
                    e.APLVar.RtB_Reroll = true
                else
                    e.APLVar.RtB_Reroll = false
                end
            else
                if a1() == 2 then
                    if g:BuffUp(w.BuriedTreasure) and g:BuffUp(w.GrandMelee) then
                        e.APLVar.RtB_Reroll = true
                    elseif g:BuffUp(w.LoadedDiceBuff) and not g:BuffUp(w.Broadside) and not g:BuffUp(w.TrueBearing) then
                        e.APLVar.RtB_Reroll = true
                    end
                elseif a1() < 2 and
                    (not g:BuffUp(w.Broadside) and
                        (not w.FanTheHammer:IsAvailable() or not g:BuffUp(w.SkullandCrossbones)) and
                        not g:BuffUp(w.TrueBearing) or g:BuffUp(w.LoadedDiceBuff)) then
                    e.APLVar.RtB_Reroll = true
                else
                    e.APLVar.RtB_Reroll = false
                end
            end
        end
        if t.IsSoloMode() then
            if g:BuffUp(w.GrandMelee) then
                if g:IsTanking(h) or g:HealthPercentage() <
                    q(v.Outlaw.RolltheBonesLeechKeepHP, v.Outlaw.RolltheBonesLeechRerollHP) then
                    e.APLVar.RtB_Reroll = false
                end
            elseif g:HealthPercentage() < v.Outlaw.RolltheBonesLeechRerollHP then
                e.APLVar.RtB_Reroll = true
            end
        end
    end
    return e.APLVar.RtB_Reroll
end
local function a5()
    if not e.APLVar.RtB_KiR_Reroll then
        if not w.KeepItRolling:IsAvailable() and not w.CountTheOdds:IsAvailable() then
            e.APLVar.RtB_KiR_Reroll = false
        else
            a1()
            if e.APLVar.RtB_Buffs.Normal == 0 and e.APLVar.RtB_Buffs.Longer > 0 and
                not (g:BuffUp(w.Broadside) and g:BuffUp(w.TrueBearing) and g:BuffUp(w.SkullandCrossbones)) and
                not (g:BuffRemains(w.Broadside) > 39 or g:BuffRemains(w.TrueBearing) > 39 or
                    g:BuffRemains(w.RuthlessPrecision) > 39 or g:BuffRemains(w.SkullandCrossbones) > 39) then
                e.APLVar.RtB_KiR_Reroll = true
            else
                e.APLVar.RtB_KiR_Reroll = false
            end
        end
    end
    return e.APLVar.RtB_KiR_Reroll
end
local function a6(a7)
    return w.CountTheOdds:IsAvailable() and
               (g:StealthUp(false, false, a7) or g:BuffUp(w.Shadowmeld, nil, a7) or g:BuffUp(w.ShadowDanceBuff, nil, a7))
end
local function a8()
    if w.BetweentheEyes:CooldownUp() and F < 5 then
        return false
    end
    return G >= u.CPMaxSpend() - o(g:BuffUp(w.Broadside)) -
               o(g:BuffUp(w.Opportunity) and (w.QuickDraw:IsAvailable() or w.FanTheHammer:IsAvailable())) or F >=
               u.CPMaxSpend()
end
local function a9()
    return H >= 2 + o(w.ImprovedAmbush:IsAvailable()) + o(g:BuffUp(w.Broadside)) and F < u.CPMaxSpend() and I >= 50 and
               (not w.CountTheOdds:IsAvailable() or u.RtBRemains() > 10)
end
local function aa()
    return not m() or B < 2 or g:BuffRemains(w.BladeFlurry) > 1 + o(w.KillingSpree:IsAvailable())
end
local function ab()
    return v.Outlaw.UseDPSVanish and n() and not (t.IsSoloMode() and g:IsTanking(h))
end
local function ac(ad)
    return ad:TimeToDie()
end
local function ae(ad)
    return (ad:FilteredTimeToDie("<", H * 1.5) or not g:StealthUp(true, false) and H >= u.CPMaxSpend() - 1) and
               not g:DebuffUp(w.Dreadblades)
end
local function af()
    if w.Vanish:IsCastable() and ab() then
        if w.HiddenOpportunity:IsAvailable() or not w.ShadowDanceTalent:IsAvailable() or not w.ShadowDance:IsCastable() then
            if w.FindWeakness:IsAvailable() and not w.Audacity:IsAvailable() and h:DebuffDown(w.FindWeaknessDebuff) and
                a9() then
                if l.Cast(w.Vanish, v.Commons.OffGCDasOffGCD.Vanish) then
                    return "Cast Vanish (FW)"
                end
                return
            end
            if w.HiddenOpportunity:IsAvailable() then
                local ag = not w.ShadowDanceTalent:IsAvailable() and w.FanTheHammer:TalentRank() +
                               o(w.QuickDraw:IsAvailable()) + o(w.Audacity:IsAvailable()) <
                               o(w.CountTheOdds:IsAvailable()) + o(w.KeepItRolling:IsAvailable())
                if g:BuffDown(w.AudacityBuff) and
                    (ag or g:BuffStack(w.Opportunity) < (w.FanTheHammer:IsAvailable() and 6 or 1)) and a9() then
                    if l.Cast(w.Vanish, v.Commons.OffGCDasOffGCD.Vanish) then
                        return "Cast Vanish (HO)"
                    end
                    return
                end
            end
            if (not w.FindWeakness:IsAvailable() or not w.Audacity:IsAvailable()) and
                not w.HiddenOpportunity:IsAvailable() and a8() then
                if l.Cast(w.Vanish, v.Commons.OffGCDasOffGCD.Vanish) then
                    return "Cast Vanish (Finish)"
                end
                return
            end
        end
    end
    if w.ShadowDance:IsCastable() then
        if h:DebuffUp(w.BetweentheEyes) and (not w.GhostlyStrike:IsAvailable() or h:DebuffUp(w.GhostlyStrike)) and
            (not w.Dreadblades:IsAvailable() or not w.Dreadblades:IsCastable()) and
            (not w.HiddenOpportunity:IsAvailable() or g:BuffDown(w.AudacityBuff) and
                (w.FanTheHammer:TalentRank() < 2 or g:BuffDown(w.Opportunity))) then
            if w.KeepItRolling:IsAvailable() then
                if w.KeepItRolling:CooldownRemains() <= 30 or w.KeepItRolling:CooldownRemains() > 120 and
                    (a8() or w.HiddenOpportunity:IsAvailable()) then
                    if l.Cast(w.ShadowDance, v.Commons.OffGCDasOffGCD.ShadowDance) then
                        return "Cast Shadow Dance (KiR)"
                    end
                    return
                end
            else
                if g:BuffUp(w.SliceandDice) and (a8() or w.HiddenOpportunity:IsAvailable()) and
                    (not w.HiddenOpportunity:IsAvailable() or not w.Vanish:CooldownUp() or not ab()) then
                    if l.Cast(w.ShadowDance, v.Commons.OffGCDasOffGCD.ShadowDance) then
                        return "Cast Shadow Dance"
                    end
                    return
                end
            end
        end
    end
end
local function ah()
    if n() and w.AdrenalineRush:IsCastable() and not g:BuffUp(w.AdrenalineRush) and
        (not w.ImprovedAdrenalineRush:IsAvailable() or G <= 2) then
        if l.Cast(w.AdrenalineRush, v.Outlaw.OffGCDasOffGCD.AdrenalineRush) then
            return "Cast Adrenaline Rush"
        end
    end
    if w.BladeFlurry:IsReady() and m() and B >= 2 and g:BuffRemains(w.BladeFlurry) <
        (g:BuffUp(w.AdrenalineRush) and 0.8 or 1) then
        if v.Outlaw.GCDasOffGCD.BladeFlurry then
            l.CastSuggested(w.BladeFlurry)
        else
            if l.Cast(w.BladeFlurry) then
                return "Cast Blade Flurry"
            end
        end
    end
    if w.RolltheBones:IsReady() and not g:DebuffUp(w.Dreadblades) and (a1() == 0 or a4() or a5()) then
        if l.Cast(w.RolltheBones) then
            return "Cast Roll the Bones"
        end
    end
    if w.KeepItRolling:IsCastable() and not a4() and o(g:BuffUp(w.Broadside)) + o(g:BuffUp(w.TrueBearing)) +
        o(g:BuffUp(w.SkullandCrossbones)) + o(g:BuffUp(w.RuthlessPrecision)) > 2 and
        (g:BuffDown(w.ShadowDanceBuff) or a1() >= 6) then
        if l.Cast(w.KeepItRolling, v.Outlaw.GCDasOffGCD.KeepItRolling) then
            return "Cast Keep it Rolling"
        end
    end
    if w.BladeRush:IsCastable() and h:IsSpellInRange(w.BladeRush) and aa() and not g:DebuffUp(w.Dreadblades) and L > 4 +
        o(g:StealthUp(true, false)) - B / 3 and d.FilteredFightRemains(A, ">", 4) then
        if l.Cast(w.BladeRush, v.Outlaw.GCDasOffGCD.BladeRush) then
            return "Cast Blade Rush"
        end
    end
    if h:IsSpellInRange(w.SinisterStrike) then
        if not g:StealthUp(true, true, true) or w.CountTheOdds:IsAvailable() and not a6(true) then
            C = af()
            if C then
                return C
            end
        end
        if w.Dreadblades:IsCastable() and h:IsSpellInRange(w.Dreadblades) and not g:StealthUp(true, true) and G <= 2 and
            (not w.MarkedforDeath:IsAvailable() or not w.MarkedforDeath:CooldownUp()) and h:FilteredTimeToDie(">=", 10) then
            if l.CastPooling(w.Dreadblades, v.Outlaw.GCDasOffGCD.Dreadblades) then
                return "Cast Dreadblades"
            end
        end
    end
    if n() and w.ThistleTea:IsCastable() and not g:BuffUp(w.ThistleTea) and
        (K >= 100 or d.BossFilteredFightRemains("<", w.ThistleTea:Charges() * 6)) then
        if l.Cast(w.ThistleTea, v.Commons.OffGCDasOffGCD.ThistleTea) then
            return "Cast Thistle Tea"
        end
    end
    if n() and w.KillingSpree:IsCastable() and h:IsSpellInRange(w.KillingSpree) and aa() and
        not g:StealthUp(true, false) and h:DebuffUp(w.BetweentheEyes) and L > 4 then
        if l.Cast(w.KillingSpree, nil, v.Outlaw.KillingSpreeDisplayStyle) then
            return "Cast Killing Spree"
        end
    end
    if h:IsSpellInRange(w.SinisterStrike) and n() then
        if v.Outlaw.UseDPSVanish and w.Shadowmeld:IsCastable() and
            (w.CountTheOdds:IsAvailable() and a8() or not w.Weaponmaster:IsAvailable() and a9()) then
            if l.Cast(w.Shadowmeld, v.Commons.OffGCDasOffGCD.Racials) then
                return "Cast Shadowmeld"
            end
        end
        if w.BloodFury:IsCastable() then
            if l.Cast(w.BloodFury, v.Commons.OffGCDasOffGCD.Racials) then
                return "Cast Blood Fury"
            end
        end
        if w.Berserking:IsCastable() then
            if l.Cast(w.Berserking, v.Commons.OffGCDasOffGCD.Racials) then
                return "Cast Berserking"
            end
        end
        if w.Fireblood:IsCastable() then
            if l.Cast(w.Fireblood, v.Commons.OffGCDasOffGCD.Racials) then
                return "Cast Fireblood"
            end
        end
        if w.AncestralCall:IsCastable() then
            if l.Cast(w.AncestralCall, v.Commons.OffGCDasOffGCD.Racials) then
                return "Cast Ancestral Call"
            end
        end
        if v.Commons.UseTrinkets then
            if x.ManicGrieftorch:IsEquippedAndReady() and h:FilteredTimeToDie(">", 2) and not g:StealthUp(true, true) then
                if l.Cast(x.ManicGrieftorch, nil, v.Commons.TrinketDisplayStyle) then
                    return "Manic Grieftorch"
                end
            end
            local ai = g:GetUseableTrinkets(y)
            if ai and (h:DebuffUp(w.BetweentheEyes) or d.BossFilteredFightRemains("<", 20) or ai:TrinketHasStatAnyDps()) then
                if l.Cast(ai, nil, v.Commons.TrinketDisplayStyle) then
                    return "Generic use_items for " .. ai:Name()
                end
            end
        end
    end
end
local function aj()
    if w.BladeFlurry:IsReady() and m() and B >= 2 and w.Subterfuge:IsAvailable() and w.HiddenOpportunity:IsAvailable() and
        not g:BuffUp(w.BladeFlurry) then
        if v.Outlaw.GCDasOffGCD.BladeFlurry then
            l.CastSuggested(w.BladeFlurry)
        else
            if l.Cast(w.BladeFlurry) then
                return "Cast Blade Flurry"
            end
        end
    end
    if w.Dispatch:IsCastable() and h:IsSpellInRange(w.Dispatch) and a8() then
        if l.CastPooling(w.Dispatch) then
            return "Cast Dispatch"
        end
    end
    if w.Ambush:IsCastable() and h:IsSpellInRange(w.Ambush) and
        (a6() or w.HiddenOpportunity:IsAvailable() or g:StealthUp(false, false) and w.FindWeakness:IsAvailable() and
            not h:DebuffUp(w.FindWeaknessDebuff)) then
        if l.CastPooling(w.Ambush) then
            return "Cast Ambush"
        end
    end
end
local function ak()
    if w.BetweentheEyes:IsCastable() and h:IsSpellInRange(w.BetweentheEyes) and
        (h:FilteredTimeToDie(">", 4) or h:TimeToDieIsNotValid()) and u.CanDoTUnit(h, E) and
        (h:DebuffRemains(w.BetweentheEyes) < 4 or w.GreenskinsWickers:IsAvailable() and
            not g:BuffUp(w.GreenskinsWickersBuff) or not w.GreenskinsWickers:IsAvailable() and
            g:BuffUp(w.RuthlessPrecision)) then
        if l.CastPooling(w.BetweentheEyes) then
            return "Cast Between the Eyes"
        end
    end
    if w.SliceandDice:IsCastable() and
        (d.FilteredFightRemains(A, ">", g:BuffRemains(w.SliceandDice), true) or g:BuffRemains(w.SliceandDice) == 0) and
        g:BuffRemains(w.SliceandDice) < (1 + G) * 1.8 and (not w.SwiftSlasher:IsAvailable() or H == 0) then
        if l.CastPooling(w.SliceandDice) then
            return "Cast Slice and Dice"
        end
    end
    if w.Dispatch:IsCastable() and h:IsSpellInRange(w.Dispatch) then
        if l.CastPooling(w.Dispatch) then
            return "Cast Dispatch"
        end
    end
end
local function al()
    if n() and w.Sepsis:IsReady() and h:IsSpellInRange(w.Sepsis) and
        (h:FilteredTimeToDie(">", 11) and h:DebuffUp(w.BetweentheEyes) or d.BossFilteredFightRemains("<", 11)) then
        if l.Cast(w.Sepsis, nil, v.Commons.CovenantDisplayStyle) then
            return "Cast Sepsis"
        end
    end
    if w.GhostlyStrike:IsReady() and h:IsSpellInRange(w.GhostlyStrike) and h:DebuffRemains(w.GhostlyStrike) <= 3 and
        (B <= 2 or g:BuffUp(w.Dreadblades)) and g:BuffDown(w.SubterfugeBuff) and h:FilteredTimeToDie(">=", 5) then
        if l.Cast(w.GhostlyStrike, v.Outlaw.GCDasOffGCD.GhostlyStrike) then
            return "Cast Ghostly Strike"
        end
    end
    if n() and w.EchoingReprimand:IsReady() and not g:DebuffUp(w.Dreadblades) then
        if l.Cast(w.EchoingReprimand, nil, v.Commons.CovenantDisplayStyle) then
            return "Cast Echoing Reprimand"
        end
    end
    if w.Ambush:IsReady() and
        (w.HiddenOpportunity:IsAvailable() and g:BuffUp(w.AudacityBuff) or w.FindWeakness:IsAvailable() and
            not h:DebuffUp(w.FindWeaknessDebuff)) then
        if l.Cast(w.Ambush) then
            return "Cast Ambush (HO/FW)"
        end
    end
    if w.PistolShot:IsCastable() and h:IsSpellInRange(w.PistolShot) then
        if g:BuffUp(w.GreenskinsWickersBuff) and (not w.FanTheHammer:IsAvailable() and g:BuffUp(w.Opportunity)) then
            if l.CastPooling(w.PistolShot) then
                return "Cast Pistol Shot (Buffed)"
            end
        elseif g:BuffUp(w.GreenskinsWickersBuff) and g:BuffRemains(w.GreenskinsWickersBuff) < 1.5 then
            if l.CastPooling(w.PistolShot) then
                return "Cast Pistol Shot (GSW Dump)"
            end
        end
        if w.FanTheHammer:IsAvailable() and g:BuffUp(w.Opportunity) then
            if w.Audacity:IsAvailable() and w.HiddenOpportunity:IsAvailable() and g:BuffDown(w.AudacityBuff) and
                g:BuffDown(w.SubterfugeBuff) and g:BuffDown(w.ShadowDanceBuff) then
                if l.CastPooling(w.PistolShot) then
                    return "Cast Pistol Shot (Audacity)"
                end
            elseif g:BuffStack(w.Opportunity) >= 6 or g:BuffRemains(w.Opportunity) < 2 then
                if l.CastPooling(w.PistolShot) then
                    return "Cast Pistol Shot (FtH Dump)"
                end
            elseif H > 1 + o(w.QuickDraw:IsAvailable()) * w.FanTheHammer:TalentRank() and not g:DebuffUp(w.Dreadblades) and
                (not w.HiddenOpportunity:IsAvailable() or not g:BuffUp(w.SubterfugeBuff) and
                    not g:BuffUp(w.ShadowDanceBuff)) then
                if l.CastPooling(w.PistolShot) then
                    return "Cast Pistol Shot (FtH)"
                end
            end
        end
    end
    if w.Ambush:IsCastable() and (g:BuffUp(w.AudacityBuff) or g:StealthUp(true, true)) and
        (w.HiddenOpportunity:IsAvailable() or w.FindWeakness:IsAvailable() and not h:DebuffUp(w.FindWeaknessDebuff)) then
        if l.CastPooling(w.Ambush) then
            return "Cast Ambush (Pooling)"
        end
    end
    if not w.FanTheHammer:IsAvailable() and w.PistolShot:IsCastable() and h:IsSpellInRange(w.PistolShot) and
        g:BuffUp(w.Opportunity) then
        if L > 1.5 or w.QuickDraw:IsAvailable() or w.Audacity:IsAvailable() and not g:BuffUp(w.AudacityBuff) or
            not w.Weaponmaster:IsAvailable() and H <= 1 + o(g:BuffUp(w.Broadside)) then
            if l.CastPooling(w.PistolShot) then
                return "Cast Pistol Shot"
            end
        end
    end
    if w.SinisterStrike:IsCastable() and h:IsSpellInRange(w.SinisterStrike) then
        if l.CastPooling(w.SinisterStrike) then
            return "Cast Sinister Strike"
        end
    end
end
local function am()
    D = w.AcrobaticStrikes:IsAvailable() and 9 or 6;
    E = w.Dispatch:Damage() * 1.25;
    G = g:ComboPoints()
    F = u.EffectiveComboPoints(G)
    H = g:ComboPointsDeficit()
    M = g:BuffUp(w.AdrenalineRush, nil, true) and -50 or 0;
    I = T()
    J = g:EnergyRegen()
    L = Q(M)
    K = g:EnergyDeficitPredicted(nil, M)
    if m() then
        z = g:GetEnemiesInRange(30)
        A = g:GetEnemiesInRange(D)
        B = #A
    else
        B = 1
    end
    C = u.CrimsonVial()
    if C then
        return C
    end
    C = u.Feint()
    if C then
        return C
    end
    u.Poisons()
    if not g:AffectingCombat() and w.Vanish:TimeSinceLastCast() > 1 then
        if not g:StealthUp(true, false) then
            C = u.Stealth(u.StealthSpell())
            if C then
                return C
            end
        end
        if t.TargetIsValid() then
            if n() and w.MarkedforDeath:IsCastable() and H >= u.CPMaxSpend() - 1 then
                if v.Commons.STMfDAsDPSCD then
                    if l.Cast(w.MarkedforDeath, v.Commons.OffGCDasOffGCD.MarkedforDeath) then
                        return "Cast Marked for Death (OOC)"
                    end
                else
                    if l.CastSuggested(w.MarkedforDeath) then
                        return "Cast Marked for Death (OOC)"
                    end
                end
            end
            if w.AdrenalineRush:IsReady() and w.ImprovedAdrenalineRush:IsAvailable() and G <= 2 then
                if l.Cast(w.AdrenalineRush) then
                    return "Cast Adrenaline Rush (Opener)"
                end
            end
            if w.RolltheBones:IsReady() and not g:DebuffUp(w.Dreadblades) and (a1() == 0 or a4() or a5()) then
                if l.Cast(w.RolltheBones) then
                    return "Cast Roll the Bones (Opener)"
                end
            end
            if w.SliceandDice:IsReady() and g:BuffRemains(w.SliceandDice) < (1 + G) * 1.8 then
                if l.CastPooling(w.SliceandDice) then
                    return "Cast Slice and Dice (Opener)"
                end
            end
            if g:StealthUp(true, false) then
                C = aj()
                if C then
                    return "Stealth (Opener): " .. C
                end
                if w.Ambush:IsCastable() then
                    if l.Cast(w.Ambush) then
                        return "Cast Ambush (Opener)"
                    end
                end
            elseif a8() then
                C = ak()
                if C then
                    return "Finish (Opener): " .. C
                end
            end
            if w.SinisterStrike:IsCastable() then
                if l.Cast(w.SinisterStrike) then
                    return "Cast Sinister Strike (Opener)"
                end
            end
        end
        return
    end
    if w.FanTheHammer:IsAvailable() and w.PistolShot:TimeSinceLastCast() < g:GCDRemains() then
        G = r(G, u.FanTheHammerCP())
    end
    if w.MarkedforDeath:IsCastable() then
        if B > 1 and t.CastTargetIf(w.MarkedforDeath, z, "min", ac, ae, nil, v.Commons.OffGCDasOffGCD.MarkedforDeath) then
            return "Cast Marked for Death (Cycle)"
        elseif B == 1 and H >= u.CPMaxSpend() - 1 and not g:DebuffUp(w.Dreadblades) then
            if v.Commons.STMfDAsDPSCD then
                if l.Cast(w.MarkedforDeath, v.Commons.OffGCDasOffGCD.MarkedforDeath) then
                    return "Cast Marked for Death (ST)"
                end
            else
                l.CastSuggested(w.MarkedforDeath)
            end
        end
    end
    if t.TargetIsValid() then
        C = t.Interrupt(5, w.Kick, v.Commons2.OffGCDasOffGCD.Kick, N)
        if C then
            return C
        end
        if g:StealthUp(false, false) or g:BuffUp(w.Shadowmeld) then
            C = aj()
            if C then
                return "Stealth: " .. C
            end
        end
        C = ah()
        if C then
            return "CDs: " .. C
        end
        if a6() then
            C = aj()
            if C then
                return "Stealth CtO: " .. C
            end
        end
        if a8() then
            C = ak()
            if C then
                return "Finish: " .. C
            end
            l.Cast(w.PoolEnergy)
            return "Finish Pooling"
        end
        C = al()
        if C then
            return "Build: " .. C
        end
        if w.ArcaneTorrent:IsCastable() and h:IsSpellInRange(w.SinisterStrike) and K > 15 + J then
            if l.Cast(w.ArcaneTorrent, v.Commons.GCDasOffGCD.Racials) then
                return "Cast Arcane Torrent"
            end
        end
        if w.ArcanePulse:IsCastable() and h:IsSpellInRange(w.SinisterStrike) then
            if l.Cast(w.ArcanePulse) then
                return "Cast Arcane Pulse"
            end
        end
        if w.LightsJudgment:IsCastable() and h:IsInMeleeRange(5) then
            if l.Cast(w.LightsJudgment, v.Commons.GCDasOffGCD.Racials) then
                return "Cast Lights Judgment"
            end
        end
        if w.BagofTricks:IsCastable() and h:IsInMeleeRange(5) then
            if l.Cast(w.BagofTricks, v.Commons.GCDasOffGCD.Racials) then
                return "Cast Bag of Tricks"
            end
        end
        if w.PistolShot:IsCastable() and h:IsSpellInRange(w.PistolShot) and not h:IsInRange(D) and
            not g:StealthUp(true, true) and K < 25 and (H >= 1 or L <= 1.2) then
            if l.Cast(w.PistolShot) then
                return "Cast Pistol Shot (OOR)"
            end
        end
    end
end
local function an()
end
l.SetAPL(260, am, an)
