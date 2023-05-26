local a, b = ...
local c = HeroDBC.DBC
local d = HeroLib
local e = HeroCache
local f = d.Unit
local g = f.Player
local h = f.Target
local i = d.Spell
local j = d.MultiSpell
local k = d.Item
local l = d.Utils.BoolToInt
local m = HeroRotation
local n = m.AoEON
local o = m.CDsON
local p = HeroRotationCharDB.Toggles[4]
local q = HeroRotationCharDB.Toggles[5]
local r = HeroRotationCharDB.Toggles[12]
local s = not HeroRotationCharDB.Toggles[15]
local t = HeroRotationCharDB.Toggles[20]
local u = HeroRotationCharDB.Toggles[21]
local v = HeroRotationCharDB.Toggles[22]
local w = HeroRotationCharDB.Toggles[23]
local x = HeroRotationCharDB.Toggles[24]
local y = HeroRotationCharDB.Toggles[25]
local z = HeroRotationCharDB.Toggles[26]
local A = HeroRotationCharDB.Toggles[27]
local B = HeroRotationCharDB.Toggles[28]
local C = HeroRotationCharDB.Toggles[29]
local D = HeroRotationCharDB.Toggles[30]
local E = HeroRotationCharDB.Toggles[54]
local F = {
    324736,
    228318,
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
    331510,
    344739,
    368477,
    368396,
    355057,
    356133,
    342139,
    353706,
    355782,
    327155,
    359668,
    321220,
    158337
}
local G = nil
local H = nil
local I = 0
local J = 0
local pairs = pairs
local K = table.insert
local L = math.min
local M = math.max
local N = math.abs
local O = m.Commons.Everyone
local P = m.Commons.Rogue
local Q = i.Rogue.Subtlety
local R = k.Rogue.Subtlety
local S = {
    General = m.GUISettings.General,
    Commons = m.GUISettings.APL.Rogue.Commons,
    Subtlety = m.GUISettings.APL.Rogue.Subtlety
}
Q.Eviscerate:RegisterDamageFormula(
    function()
        return g:AttackPowerDamageMod() * EffectiveComboPoints * 0.176 * 1.21 *
            (Q.Nightstalker:IsAvailable() and g:StealthUp(true, false) and 1.08 or 1) *
            (Q.DeeperStratagem:IsAvailable() and 1.05 or 1) *
            (Q.DarkShadow:IsAvailable() and g:BuffUp(Q.ShadowDanceBuff) and 1.3 or 1) *
            (g:BuffUp(Q.SymbolsofDeath) and 1.1 or 1) *
            (g:BuffUp(Q.FinalityEviscerateBuff) and 1.3 or 1) *
            (1 + g:MasteryPct() / 100) *
            (1 + g:VersatilityDmgPct() / 100) *
            (h:DebuffUp(Q.FindWeaknessDebuff) and 1.5 or 1)
    end
)
Q.Rupture:RegisterPMultiplier(
    function()
        return g:BuffUp(Q.FinalityRuptureBuff) and 1.3 or 1
    end
)
local function T()
    if S.Subtlety.BurnShadowDance == "On Bosses not in Dungeons" and g:IsInDungeonArea() then
        return false
    elseif S.Subtlety.BurnShadowDance ~= "Always" and not h:IsInBossList() then
        return false
    else
        return true
    end
end
local U = g:GetEquipment()
local V = U[13] and k(U[13]) or k(0)
local W = U[14] and k(U[14]) or k(0)
local X = GetInventoryItemID("player", 13)
local Y = GetInventoryItemID("player", 14)
local Z = {}
d:RegisterForEvent(
    function()
        U = g:GetEquipment()
        V = U[13] and k(U[13]) or k(0)
        W = U[14] and k(U[14]) or k(0)
    end,
    "PLAYER_EQUIPMENT_CHANGED"
)
local _, a0, a1, a2
local a3, a4, a5, a6
local a7
local a8 = P.ReturnSpell()
local a9 = P.ReturnSpellMO()
local aa, ab, ac
local ad, ae
local af, ag
local ah = 11111
local ai = 11111
local aj, ak, al
local am
local an
local ao
local ap
local aq
local ar
local as
local at
local au
local av = false
local function aw(ax, ay, az, aA)
    local aB, aC = nil, az
    local aD = h:GUID()
    for aE, aF in pairs(aA) do
        if aF:GUID() ~= aD and O.UnitIsCycleValid(aF, aC, -aF:DebuffRemains(ax)) and ay(aF) then
            aB, aC = aF, aF:TimeToDie()
        end
    end
    if aB then
        m.CastLeftNameplate(aB, ax)
        if aB:GUID() == f("mouseover"):GUID() and S.Subtlety.TargetSwap == "Mouseover" then
            if ax == Q.Rupture then
                a9 = 11943
            elseif ax == Q.SerratedBoneSpike then
                a9 = 1328547
            end
        elseif S.Subtlety.TargetSwap == "AutoSwap" and aB:GUID() ~= h:GUID() and not r then
            a9 = 9999
        end
    elseif false then
        aB, aC = nil, az
        for aE, aF in pairs(a0) do
            if aF:GUID() ~= aD and O.UnitIsCycleValid(aF, aC, -aF:DebuffRemains(ax)) and ay(aF) then
                aB, aC = aF, aF:TimeToDie()
            end
        end
        if aB then
            m.CastLeftNameplate(aB, ax)
            if aB:GUID() == f("mouseover"):GUID() and S.Subtlety.TargetSwap == "Mouseover" then
                if ax == Q.Rupture then
                    a9 = 11943
                elseif ax == Q.SerratedBoneSpike then
                    a9 = 1328547
                end
            elseif S.Subtlety.TargetSwap == "AutoSwap" and aB:GUID() ~= h:GUID() and not r then
                a9 = 9999
            end
        end
    end
end
local function aG()
    if a1 < 2 then
        return false
    elseif S.Commons.UsePriorityRotation == "Always" then
        return true
    elseif S.Commons.UsePriorityRotation == "On Bosses" and h:IsInBossList() then
        return true
    elseif S.Commons.UsePriorityRotation == "Auto" then
        if g:InstanceDifficulty() == 16 and h:NPCID() == 138967 then
            return true
        elseif h:NPCID() == 166969 or h:NPCID() == 166971 or h:NPCID() == 166970 then
            return true
        elseif h:NPCID() == 183463 or h:NPCID() == 183671 then
            return true
        end
    end
    return false
end
local aH = g:CovenantID()
d:RegisterForEvent(
    function()
        aH = g:CovenantID()
    end,
    "COVENANT_CHOSEN"
)
d:RegisterForEvent(
    function()
        ah = 11111
        ai = 11111
    end,
    "PLAYER_REGEN_ENABLED"
)
local function aI(aJ)
    if aJ then
        return 1
    else
        return 0
    end
end
local function aK()
    return 25 + aI(Q.Vigor:IsAvailable()) * 20 + aI(Q.MasterofShadows:IsAvailable()) * 20 +
        aI(Q.ShadowFocus:IsAvailable()) * 25 +
        aI(Q.Alacrity:IsAvailable()) * 20 +
        aI(a1 >= 4) * 25
end
local function aL()
    return Q.ShadowDance:ChargesFractional() >= 0.75 + l(Q.ShadowDanceTalent:IsAvailable())
end
local function aM()
    if a1 == 4 - aI(Q.SealFate:IsAvailable()) then
        return true
    elseif a1 > 4 - 2 * l(Q.ShurikenTornado:IsAvailable()) or am and a1 >= 4 then
        return al <= 1
    else
        return ak <= 1
    end
end
local function au()
    return g:BuffUp(Q.SliceandDice) or a1 >= P.CPMaxSpend()
end
local function aN(aO)
    return g:BuffUp(Q.ThistleTea) and a1 == 1 or aO and (a1 == 1 or h:DebuffUp(Q.Rupture) and a1 >= 2)
end
local function aP(aQ)
    return aQ:DebuffRemains(Q.FindWeaknessDebuff)
end
local function aR(aQ)
    return aQ:TimeToDie()
end
local function aS(aQ)
    return aQ:DebuffRemains(Q.Rupture)
end
local function aT(aQ)
    if
        (aQ:DebuffRemains(Q.FindWeaknessDebuff) < 1 or
            Q.SymbolsofDeath:CooldownRemains() < 18 and
                aQ:DebuffRemains(Q.FindWeaknessDebuff) < Q.SymbolsofDeath:CooldownRemains()) and
            aQ:GUID() == f("mouseover"):GUID() and
            S.Subtlety.TargetSwap == "Mouseover"
     then
        a9 = 1185438
        return true
    elseif
        (aQ:DebuffRemains(Q.FindWeaknessDebuff) < 1 or
            Q.SymbolsofDeath:CooldownRemains() < 18 and
                aQ:DebuffRemains(Q.FindWeaknessDebuff) < Q.SymbolsofDeath:CooldownRemains()) and
            S.Subtlety.TargetSwap == "AutoSwap" and
            aQ:GUID() ~= h:GUID() and
            not r
     then
        a9 = 9999
        return true
    elseif
        (aQ:DebuffRemains(Q.FindWeaknessDebuff) < 1 or
            Q.SymbolsofDeath:CooldownRemains() < 18 and
                aQ:DebuffRemains(Q.FindWeaknessDebuff) < Q.SymbolsofDeath:CooldownRemains()) and
            aQ:GUID() == h:GUID()
     then
        a8 = 185438
        return true
    elseif
        aQ:DebuffRemains(Q.FindWeaknessDebuff) < 1 or
            Q.SymbolsofDeath:CooldownRemains() < 18 and
                aQ:DebuffRemains(Q.FindWeaknessDebuff) < Q.SymbolsofDeath:CooldownRemains()
     then
        return true
    end
end
local function aU(aQ)
    if
        aQ:IsInRange(8) and aQ:TimeToDie() > 10 and aQ:GUID() == f("mouseover"):GUID() and
            S.Subtlety.TargetSwap == "Mouseover"
     then
        a9 = 1323654
        return true
    elseif
        aQ:IsInRange(8) and aQ:TimeToDie() > 10 and S.Subtlety.TargetSwap == "AutoSwap" and aQ:GUID() ~= h:GUID() and
            not r
     then
        a9 = 9999
        return true
    elseif aQ:IsInRange(8) and aQ:TimeToDie() > 10 and aQ:GUID() == h:GUID() then
        a8 = 323654
        return true
    elseif aQ:IsInRange(8) and aQ:TimeToDie() > 10 then
        return true
    end
end
local function aV(aQ)
    if
        (aQ:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= P.CPMaxSpend()) and
            aQ:GUID() == f("mouseover"):GUID() and
            S.Subtlety.TargetSwap == "Mouseover"
     then
        a9 = 1137619
        return true
    elseif
        (aQ:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= P.CPMaxSpend()) and
            S.Subtlety.TargetSwap == "AutoSwap" and
            aQ:GUID() ~= h:GUID() and
            not r
     then
        a9 = 9999
        return true
    elseif
        (aQ:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= P.CPMaxSpend()) and
            aQ:GUID() == h:GUID()
     then
        a8 = 137619
        return true
    elseif aQ:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= P.CPMaxSpend() then
        return true
    end
end
local function aW(aQ)
    if
        aQ:FilteredTimeToDie(">=", 2 * ak) and aQ:DebuffRefreshable(Q.Rupture) and aQ:GUID() == f("mouseover"):GUID() and
            S.Subtlety.TargetSwap == "Mouseover"
     then
        a9 = 11943
        return true
    elseif
        aQ:FilteredTimeToDie(">=", 2 * ak) and aQ:DebuffRefreshable(Q.Rupture) and S.Subtlety.TargetSwap == "AutoSwap" and
            aQ:GUID() ~= h:GUID() and
            not r
     then
        a9 = 9999
        return true
    elseif aQ:FilteredTimeToDie(">=", 2 * ak) and aQ:DebuffRefreshable(Q.Rupture) and aQ:GUID() == h:GUID() then
        a8 = 1943
        return true
    elseif aQ:FilteredTimeToDie(">=", 2 * ak) and aQ:DebuffRefreshable(Q.Rupture) then
        return true
    end
end
local function aX()
    local aY = not EnergyThreshold or g:EnergyPredicted() >= EnergyThreshold
    if
        m.AoEON() and Q.ShurikenStorm:IsCastable() and
            a1 >=
                2 +
                    l(
                        Q.Gloomblade:IsAvailable() and g:BuffRemains(Q.LingeringShadowBuff) >= 6 or
                            g:BuffUp(Q.PerforatedVeinsBuff)
                    )
     then
        if m.Cast(Q.ShurikenStorm) then
            a8 = 197835
            return "Cast Shuriken Storm"
        end
    end
    if a5 then
        if
            Q.EchoingReprimand:IsAvailable() and g:Energy() < 60 and
                (ak == 2 and g:BuffUp(Q.EchoingReprimand3) or ak == 3 and g:BuffUp(Q.EchoingReprimand4) or
                    ak == 4 and g:BuffUp(Q.EchoingReprimand5)) and
                (P.TimeToSht(3) < 0.5 or P.TimeToSht(4) < 1.0 or P.TimeToSht(5) < 1.0)
         then
            if m.Cast(Q.PoolEnergy) then
                a8 = 999910
            end
            return "ER Generator Pooling"
        end
        if Q.Gloomblade:IsCastable() then
            if aY and m.Cast(Q.Gloomblade) then
                a8 = 200758
                return "Cast Gloomblade"
            end
        elseif Q.Backstab:IsCastable() then
            if aY and m.Cast(Q.Backstab) then
                a8 = 53
                return "Cast Backstab"
            end
        end
    end
end
local function aZ()
    if g:BuffUp(Q.ShurikenTornado) then
        if
            Q.SymbolsofDeath:IsCastable() and Q.ShadowDance:IsCastable() and not g:BuffUp(Q.SymbolsofDeath) and
                not g:BuffUp(Q.ShadowDance)
         then
            if m.Cast(Q.SymbolsofDeath) then
                a8 = 800
                return "Dance + Symbols (during Tornado)"
            end
        elseif Q.SymbolsofDeath:IsCastable() and not g:BuffUp(Q.SymbolsofDeath) then
            if m.Cast(Q.SymbolsofDeath) then
                a8 = 212283
                return "Cast Symbols of Death (during Tornado)"
            end
        elseif Q.ShadowDance:IsCastable() and not g:BuffUp(Q.ShadowDanceBuff) then
            if m.Cast(Q.ShadowDance) then
                a8 = 185313
                return "Cast Shadow Dance (during Tornado)"
            end
        end
    end
    local a_ = au()
    if
        Q.Vanish:IsCastable() and VanishReady and not u and S.Commons.VanishOffensive and ak <= 2 and
            g:BuffStack(Q.DanseMacabreBuff) > 3
     then
        if m.Cast(Q.Vanish, nil, nil) then
            a8 = 1856
            return "Vanish Stealth CD"
        end
    end
    if Q.ColdBlood:IsReady() and p and not Q.SecretTechnique:IsAvailable() and ak >= 5 then
        if m.Cast(Q.ColdBlood) then
            a8 = 382245
            return "Cast Cold Blood"
        end
    end
    if a5 then
        if
            o() and Q.Flagellation:IsReady() and a_ and not g:StealthUp(false, false) and ak >= 5 and
                h:FilteredTimeToDie(">", 10)
         then
            if m.Cast(Q.Flagellation, nil) then
                a8 = 323654
                return "Cast Flagellation"
            end
        end
    end
    if
        Q.ShurikenTornado:IsCastable() and a1 <= 1 and au() and Q.SymbolsofDeath:CooldownUp() and
            Q.ShadowDance:Charges() >= 1 and
            (not Q.Flagellation:IsAvailable() or g:BuffUp(Q.Flagellation) or a1 >= 5) and
            ak <= 2 and
            not g:BuffUp(Q.PremeditationBuff)
     then
        if g:Energy() >= 60 then
            if m.Cast(Q.ShurikenTornado, nil) then
                a8 = 277925
                return "Cast Shuriken Tornado"
            end
        elseif not Q.ShadowFocus:IsAvailable() then
            if m.CastPooling(Q.ShurikenTornado) then
                a8 = 277925
                return "Pool for Shuriken Tornado"
            end
        end
    end
    if a5 then
        if o() and Q.Sepsis:IsReady() and a_ and al >= 1 and not h:FilteredTimeToDie("<", 16) then
            if m.Cast(Q.Sepsis, nil, nil) then
                a8 = 328305
                return "Cast Sepsis"
            end
        end
        if
            Q.SymbolsofDeath:IsCastable() and a_ and
                (not Q.Flagellation:IsAvailable() or Q.Flagellation:CooldownRemains() > 10 or
                    Q.Flagellation:CooldownUp() and ak >= 5)
         then
            if m.Cast(Q.SymbolsofDeath, nil) then
                a8 = 212283
                return "Cast Symbols of Death"
            end
        end
    end
    if Q.MarkedforDeath:IsCastable() then
        if h:FilteredTimeToDie("<", al) then
            if m.Cast(Q.MarkedforDeath, nil) then
                a8 = 137619
                return "Cast Marked for Death"
            end
        end
        if not g:StealthUp(true, true) and al >= P.CPMaxSpend() then
            if m.Cast(Q.MarkedforDeath, nil) then
                a8 = 137619
                return "Cast Marked for Death"
            end
        elseif m.CDsON() then
            if m.Cast(Q.MarkedforDeath, nil) then
                a8 = 137619
                return "Cast Marked for Death"
            end
        end
    end
    if m.CDsON() then
        if
            Q.ShadowBlades:IsCastable() and
                (a_ and al >= 2 and h:FilteredTimeToDie(">=", 10) and
                    (not Q.Sepsis:IsAvailable() or Q.Sepsis:CooldownRemains() <= 8 or h:DebuffUp(Q.Sepsis)) or
                    d.BossFilteredFightRemains("<=", 20))
         then
            if m.Cast(Q.ShadowBlades, nil) then
                a8 = 121471
                return "Cast Shadow Blades"
            end
        end
        if
            Q.EchoingReprimand:IsReady() and a5 and al >= 3 and (am or a1 <= 4 or Q.ResoundingClarity:IsAvailable()) and
                (g:BuffUp(Q.ShadowDanceBuff) or not Q.DanseMacabre:IsAvailable())
         then
            if m.Cast(Q.EchoingReprimand, nil, nil) then
                a8 = 323547
                return "Cast Echoing Reprimand"
            end
        end
        if Q.ShurikenTornado:IsReady() then
            if au and g:BuffUp(Q.SymbolsofDeath) and ak <= 2 and (not g:BuffUp(Q.PremeditationBuff) or a1 > 4) then
                if m.Cast(Q.ShurikenTornado) then
                    a8 = 277925
                    return "Cast Shuriken Tornado (SoD)"
                end
            end
            if
                not Q.Flagellation:IsAvailable() and a1 >= 3 and Q.ShadowDance:Charges() >= 1 and
                    not g:StealthUp(true, true)
             then
                if m.Cast(Q.ShurikenTornado) then
                    a8 = 277925
                    return "Cast Shuriken Tornado (Dance)"
                end
            end
        end
        if
            Q.ShadowDance:IsCastable() and T() and not g:BuffUp(Q.ShadowDanceBuff) and
                d.BossFilteredFightRemains("<=", 8)
         then
            if m.Cast(Q.ShadowDance) then
                a8 = 185313
                return "Cast Shadow Dance (Low TTD)"
            end
        end
        if
            Q.ThistleTea:IsCastable() and not g:BuffUp(Q.ThistleTea) and
                (Q.SymbolsofDeath:CooldownRemains() >= 3 and
                    (g:EnergyDeficit() >= 100 or
                        Q.ThistleTea:ChargesFractional() >= 2.75 and g:BuffUp(Q.ShadowDanceBuff)) or
                    g:BuffRemains(Q.ShadowDanceBuff) > 4 and a1 >= 3 or
                    d.BossFilteredFightRemains("<=", Q.ThistleTea:Charges() * 6))
         then
            if m.Cast(Q.ThistleTea) then
                a8 = 381623
                return "Cast ThistleTea"
            end
        end
        if
            S.Commons.Enabled.Potions and o() and s and
                ((g:BloodlustUp() or ai < 30 or
                    g:BuffUp(Q.SymbolsofDeath) and (g:BuffUp(Q.ShadowBlades) or Q.ShadowBlades:CooldownRemains() <= 10)) and
                    not m.GUISettings.General.HoldPotforBL or
                    m.GUISettings.General.HoldPotforBL and g:BloodlustUp())
         then
            local b0 = O.PotionSelected()
            if b0 and b0:IsReady() then
                if m.Cast(b0, nil, nil) then
                    a8 = 37
                    return "potion cooldowns 2"
                end
            end
        end
        if g:BuffUp(Q.SymbolsofDeath) and o() then
            if Q.BloodFury:IsReady() and S.Commons.Enabled.Racials then
                if m.Cast(Q.BloodFury, nil) then
                    a8 = 20572
                    return "Cast Blood Fury"
                end
            end
            if Q.Berserking:IsReady() and S.Commons.Enabled.Racials then
                if m.Cast(Q.Berserking, nil) then
                    a8 = 26297
                    return "Cast Berserking"
                end
            end
            if Q.Fireblood:IsReady() and S.Commons.Enabled.Racials then
                if m.Cast(Q.Fireblood, nil) then
                    a8 = 265221
                    return "Cast Fireblood"
                end
            end
            if Q.AncestralCall:IsReady() and S.Commons.Enabled.Racials then
                if m.Cast(Q.AncestralCall, nil) then
                    a8 = 274738
                    return "Cast Ancestral Call"
                end
            end
        end
        local b1 = g:GetUseableTrinkets(Z)
        if b1 and o() and (g:BuffUp(Q.SymbolsofDeath) or d.BossFilteredFightRemains("<", 20)) then
            if b1 then
                if m.Cast(b1, nil, nil) then
                    if b1:ID() == GetInventoryItemID("player", 13) and S.Commons.Enabled.TopTrinket then
                        a8 = 24
                        return "Generic use_items for " .. b1:Name()
                    elseif b1:ID() == GetInventoryItemID("player", 14) and S.Commons.Enabled.BottomTrinket then
                        a8 = 25
                        return "Generic use_items for " .. b1:Name()
                    end
                end
            end
        end
    end
end
local function b2()
    local aO = g:BuffUp(Q.ShadowDanceBuff) or StealthSpell and StealthSpell:ID() == Q.ShadowDance:ID()
    local b3 = g:BuffRemains(Q.ShadowDanceBuff)
    if StealthSpell and StealthSpell:ID() == Q.ShadowDance:ID() then
        b3 = 8
    end
    if Q.SliceandDice:IsCastable() and d.FilteredFightRemains(a0, ">", g:BuffRemains(Q.SliceandDice)) then
        if Q.Premeditation:IsAvailable() and a1 < 5 then
            if
                Q.ShadowDance:ChargesFractional() < 1.75 and
                    g:BuffRemains(Q.SliceandDice) < Q.SymbolsofDeath:CooldownRemains() and
                    (Q.ShadowDance:Charges() >= 1 and
                        g:BuffRemains(Q.SymbolsofDeath) - g:BuffRemains(Q.ShadowDanceBuff) < 1.2)
             then
                if Q.SliceandDice:IsReady() and m.Cast(Q.SliceandDice) then
                    a8 = 5171
                    return "Cast Slice and Dice (Premed)"
                end
            end
        else
            if a1 < 6 and not aO and g:BuffRemains(Q.SliceandDice) < 1 + ak * 1.8 then
                if Q.SliceandDice:IsReady() and m.Cast(Q.SliceandDice) then
                    a8 = 5171
                    return "Cast Slice and Dice"
                end
            end
        end
    end
    local b4 = aN(aO)
    if (not b4 or am) and Q.Rupture:IsCastable() then
        if
            a5 and (h:FilteredTimeToDie(">", 6, -h:DebuffRemains(Q.Rupture)) or h:TimeToDieIsNotValid()) and
                P.CanDoTUnit(h, ag) and
                h:DebuffRefreshable(Q.Rupture, af)
         then
            if m.Cast(Q.Rupture) then
                a8 = 1943
                return "Cast Rupture 1"
            end
        end
    end
    if not b4 and Q.Rupture:IsCastable() then
        if
            a1 == 1 and g:BuffUp(Q.FinalityRuptureBuff) and (Q.DarkBrew:IsAvailable() or Q.DanseMacabre:IsAvailable()) and
                Q.ShadowDance:CooldownRemains() < 12 and
                Q.ShadowDance:ChargesFractional() <= 1
         then
            if m.Cast(Q.Rupture) then
                a8 = 1943
                return "Cast Rupture (Finality)"
            end
        end
    end
    if
        t and Q.SecretTechnique:IsCastable() and aO and
            (g:BuffStack(Q.DanseMacabreBuff) >= 3 or not Q.DanseMacabre:IsAvailable())
     then
        if Q.ColdBlood:IsReady() and g:BuffDown(Q.ColdBlood) then
            if m.Cast(Q.ColdBlood) then
                a8 = 382245
                return "Cast Cold Blood (FunnelAOE)"
            end
        end
        if
            not Q.ColdBlood:IsAvailable() or Q.ColdBlood:IsReady() or g:BuffUp(Q.ColdBlood) or
                Q.ColdBlood:CooldownRemains() > b3 - 2
         then
            if m.Cast(Q.SecretTechnique) then
                a8 = 280719
                return "Cast Secret Technique (FunnelAOE)"
            end
        end
    end
    if t and Q.Eviscerate:IsCastable() and a5 then
        if Q.Eviscerate:IsReady() and m.Cast(Q.Eviscerate) then
            a8 = 196819
            return "Cast Eviscerate (FunnelAOE)"
        end
    end
    if
        Q.SecretTechnique:IsCastable() and aO and
            (g:BuffStack(Q.DanseMacabreBuff) >= 3 or not Q.DanseMacabre:IsAvailable())
     then
        if Q.ColdBlood:IsReady() and g:BuffDown(Q.ColdBlood) then
            if m.Cast(Q.ColdBlood) then
                a8 = 382245
                return "Cast Cold Blood (SecTec)"
            end
        end
        if
            not Q.ColdBlood:IsAvailable() or Q.ColdBlood:IsReady() or g:BuffUp(Q.ColdBlood) or
                Q.ColdBlood:CooldownRemains() > b3 - 2
         then
            if m.Cast(Q.SecretTechnique) then
                a8 = 280719
                return "Cast Secret Technique"
            end
        end
    end
    if not b4 and Q.Rupture:IsCastable() then
        if m.AoEON() and not am and a1 >= 2 then
            local function b5(aQ)
                return O.CanDoTUnit(aQ, ag) and aQ:DebuffRefreshable(Q.Rupture, af)
            end
            if not av then
                aw(Q.Rupture, b5, 2 * ak, a2)
                av = true
            end
        end
        if
            a5 and h:DebuffRemains(Q.Rupture) < Q.SymbolsofDeath:CooldownRemains() + 10 and
                Q.SymbolsofDeath:CooldownRemains() <= 5 and
                P.CanDoTUnit(h, ag) and
                h:FilteredTimeToDie(">", 5 + Q.SymbolsofDeath:CooldownRemains(), -h:DebuffRemains(Q.Rupture))
         then
            if m.Cast(Q.Rupture) then
                a8 = 1943
                return "Cast Rupture 2"
            end
        end
    end
    if Q.BlackPowder:IsCastable() and not am and a1 >= 3 then
        if Q.BlackPowder:IsReady() and m.Cast(Q.BlackPowder) then
            a8 = 319175
            return "Cast Black Powder"
        end
    end
    if Q.Eviscerate:IsCastable() and a5 then
        if Q.Eviscerate:IsReady() and m.Cast(Q.Eviscerate) then
            a8 = 196819
            return "Cast Eviscerate"
        end
    end
end
local function b6()
    if
        m.CDsON() and Q.ShadowDance:TimeSinceLastDisplay() > 0.3 and Q.Shadowmeld:TimeSinceLastDisplay() > 0.3 and
            not g:IsTanking(h)
     then
        if Q.Vanish:IsCastable() and (not Q.DanseMacabre:IsAvailable() or a1 >= 3) and not aL() and al > 1 then
            if m.Cast(Q.Vanish, nil, nil) then
                a8 = 1856
                return "Vanish Stealth CD"
            end
        end
        if
            Q.Shadowmeld:IsCastable() and a5 and not g:IsMoving() and g:EnergyDeficitPredicted() > 10 and not aL() and
                al > 4
         then
            if m.CastPooling(Q.Shadowmeld, g:EnergyTimeToX(40)) then
                a8 = 1000
                return "Pool for Shadowmeld"
            end
        end
    end
    if
        a5 and Q.ShadowDance:IsCastable() and Q.ShadowDance:Charges() >= 1 and Q.Vanish:TimeSinceLastDisplay() > 0.3 and
            Q.Shadowmeld:TimeSinceLastDisplay() > 0.3 and
            (m.CDsON() or
                Q.ShadowDance:ChargesFractional() >=
                    S.Subtlety.ShDEcoCharge - (not Q.ShadowDanceTalent:IsAvailable() and 0.75 or 0))
     then
        if
            (aM() and (g:BuffRemains(Q.SymbolsofDeath) >= 2.2 - l(Q.Flagellation:IsAvailable()) or aL()) or
                g:BuffUp(Q.Flagellation) or
                g:BuffRemains(Q.FlagellationPersistBuff) >= 6 or
                a1 >= 4 and Q.SymbolsofDeath:CooldownRemains() > 10) and
                g:BuffDown(Q.TheRottenBuff)
         then
            if m.Cast(Q.ShadowDance) then
                a8 = 185313
                return "Shadow Dance Stealth CD 1"
            end
        end
        if
            T() and
                (aM() and d.BossFilteredFightRemains("<", Q.SymbolsofDeath:CooldownRemains()) or
                    not Q.ShadowDanceTalent:IsAvailable() and h:DebuffUp(Q.Rupture) and a1 <= 4 and
                        g:BuffDown(Q.TheRottenBuff))
         then
            if m.Cast(Q.ShadowDance) then
                a8 = 185313
                return "Shadow Dance Stealth CD 2"
            end
        end
    end
end
local function b7()
    local b8 = g:BuffUp(P.StealthSpell()) or StealthSpell and StealthSpell:ID() == P.StealthSpell():ID()
    local b9 = g:BuffUp(P.VanishBuffSpell()) or StealthSpell and StealthSpell:ID() == P.VanishBuffSpell():ID()
    local aO = g:BuffUp(Q.ShadowDanceBuff) or StealthSpell and StealthSpell:ID() == Q.ShadowDance:ID()
    local b3 = g:BuffRemains(Q.ShadowDanceBuff)
    local ba = StealthSpell or g:BuffUp(Q.PremeditationBuff)
    if StealthSpell and StealthSpell:ID() == Q.ShadowDance:ID() then
        b3 = 8
    end
    local bb = Q.Shadowstrike:IsCastable() or b8 or b9 or aO
    if b8 or b9 then
        bb = bb and h:IsInRange(25)
    else
        bb = bb and a5
    end
    if bb and (b8 or b9) and (a1 < 4 or am) then
        if m.Cast(Q.Shadowstrike) then
            a8 = 185438
            return "Cast Shadowstrike (Stealth)"
        end
    end
    if
        g:BuffStack(Q.DanseMacabreBuff) < 5 and (al == 2 or al == 3) and (ba or EffectiveComboPoints < 7) and
            (a1 <= 8 or Q.LingeringShadow:IsAvailable())
     then
        if
            Q.ImprovedShurikenStorm:IsAvailable() and
                (g:BuffUp(Q.SilentStormBuff) or StealthSpell and Q.SilentStorm:IsAvailable()) and
                h:DebuffDown(Q.FindWeaknessDebuff)
         then
            if m.Cast(Q.ShurikenStorm) then
                a8 = 197835
                return "Cast Shuriken Storm (FW)"
            end
        end
        if Q.Gloomblade:IsCastable() then
            if m.Cast(Q.Gloomblade) then
                a8 = 700
                return "Cast Gloomblade (Stealth)"
            end
        elseif
            Q.Backstab:IsCastable() and Q.DanseMacabre:IsAvailable() and g:BuffStack(Q.DanseMacabreBuff) <= 2 and
                a1 <= 2
         then
            if m.Cast(Q.Backstab) then
                a8 = 600
                return "Cast Backstab (Stealth)"
            end
        end
    end
    if EffectiveComboPoints >= P.CPMaxSpend() then
        return b2()
    end
    if g:BuffUp(Q.ShurikenTornado) and al <= 2 then
        return b2()
    end
    if a1 >= 4 - l(Q.SealFate:IsAvailable()) and EffectiveComboPoints >= 4 then
        return b2()
    end
    if al <= 1 + aI(Q.SealFate:IsAvailable() or Q.DeeperStratagem:IsAvailable() or Q.SecretStratagem:IsAvailable()) then
        return b2()
    end
    if g:BuffStack(Q.PerforatedVeinsBuff) >= 5 and a1 < 3 then
        if Q.Gloomblade:IsCastable() then
            if m.Cast(Q.Gloomblade) then
                a8 = 7007
                return "Cast Gloomblade (Stealth PV)"
            end
        elseif Q.Backstab:IsCastable() then
            if m.Cast(Q.Backstab) then
                a8 = 6006
                return "Cast Backstab (Stealth PV)"
            end
        end
    end
    if bb and not g:StealthUp(true, false) and not StealthSpell and g:BuffUp(Q.SepsisBuff) and a1 < 4 then
        if m.Cast(Q.Shadowstrike) then
            a8 = 185438
            return "Cast Shadowstrike (Sepsis)"
        end
    end
    if m.AoEON() and Q.ShurikenStorm:IsCastable() and a1 >= 3 + l(g:BuffUp(Q.TheRottenBuff)) and (not ba or a1 >= 7) then
        if m.Cast(Q.ShurikenStorm) then
            a8 = 197835
            return "Cast Shuriken Storm"
        end
    end
    if
        bb and
            (h:DebuffRemains(Q.FindWeaknessDebuff) < 1 or
                Q.SymbolsofDeath:CooldownRemains() < 18 and
                    h:DebuffRemains(Q.FindWeaknessDebuff) < Q.SymbolsofDeath:CooldownRemains())
     then
        if m.Cast(Q.Shadowstrike) then
            a8 = 185438
            return "Cast Shadowstrike (FW Refresh)"
        end
    end
    if bb then
        if m.Cast(Q.Shadowstrike) then
            a8 = 185438
            return "Cast Shadowstrike 2"
        end
    end
end
local function bc()
    aa = nil
    ac = nil
    ab = 0
    a3 = Q.AcrobaticStrikes:IsAvailable() and 8 or 5
    a4 = Q.AcrobaticStrikes:IsAvailable() and 10 or 13
    a5 = h:IsInMeleeRange(a3)
    a6 = h:IsInMeleeRange(a4)
    q = HeroRotationCharDB.Toggles[5]
    p = HeroRotationCharDB.Toggles[4]
    r = HeroRotationCharDB.Toggles[12]
    s = not HeroRotationCharDB.Toggles[15]
    t = HeroRotationCharDB.Toggles[20]
    u = HeroRotationCharDB.Toggles[21]
    v = HeroRotationCharDB.Toggles[22]
    w = HeroRotationCharDB.Toggles[23]
    x = HeroRotationCharDB.Toggles[24]
    y = HeroRotationCharDB.Toggles[25]
    z = HeroRotationCharDB.Toggles[26]
    A = HeroRotationCharDB.Toggles[27]
    B = HeroRotationCharDB.Toggles[28]
    C = HeroRotationCharDB.Toggles[29]
    D = HeroRotationCharDB.Toggles[30]
    E = HeroRotationCharDB.Toggles[54]
    SBReady = false
    SDReady = false
    VanishReady = false
    SoDReady = false
    MfDReady = true
    STReady = false
    if
        S.Subtlety.IncludedCooldowns.ShadowBlades and o() or
            S.Subtlety.IncludedSmallCooldowns.ShadowBlades and (o() or p) or
            not S.Subtlety.IncludedSmallCooldowns.ShadowBlades and not S.Subtlety.IncludedCooldowns.ShadowBlades
     then
        SBReady = true
    end
    if
        S.Subtlety.IncludedCooldowns.ShadowDance and o() or S.Subtlety.IncludedSmallCooldowns.ShadowDance and (o() or p) or
            not S.Subtlety.IncludedSmallCooldowns.ShadowDance and not S.Subtlety.IncludedCooldowns.ShadowDance
     then
        SDReady = true
    end
    if
        S.Subtlety.IncludedCooldowns.Vanish and o() or S.Subtlety.IncludedSmallCooldowns.Vanish and (o() or p) or
            not S.Subtlety.IncludedSmallCooldowns.Vanish and not S.Subtlety.IncludedCooldowns.Vanish
     then
        VanishReady = true
    end
    if
        S.Subtlety.IncludedCooldowns.SymbolsofDeath and o() or
            S.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and (o() or p) or
            not S.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and not S.Subtlety.IncludedCooldowns.SymbolsofDeath
     then
        SoDReady = true
    end
    if
        S.Subtlety.IncludedCooldowns.ShurikenTornado and o() or
            S.Subtlety.IncludedSmallCooldowns.ShurikenTornado and (o() or p) or
            not S.Subtlety.IncludedSmallCooldowns.ShurikenTornado and not S.Subtlety.IncludedCooldowns.ShurikenTornado
     then
        STReady = true
    end
    X = GetInventoryItemID("player", 13)
    Y = GetInventoryItemID("player", 14)
    av = false
end
local function bd()
    if Q.Subterfuge:IsAvailable() then
        ad = Q.Stealth2
        ae = Q.VanishBuff2
    else
        ad = Q.Stealth
        ae = Q.VanishBuff
    end
    a7 = bc()
    a3 = Q.AcrobaticStrikes:IsAvailable() and 8 or 5
    a4 = Q.AcrobaticStrikes:IsAvailable() and 13 or 10
    a5 = h:IsInMeleeRange(a3)
    a6 = h:IsInMeleeRange(a4)
    if n() then
        _ = g:GetEnemiesInRange(30)
        a0 = g:GetEnemiesInMeleeRange(a4)
        a1 = #a0
        a2 = g:GetEnemiesInMeleeRange(a3)
    else
        _ = {}
        a0 = {}
        a1 = 0
        a2 = {}
    end
    ak = g:ComboPoints()
    EffectiveComboPoints = P.EffectiveComboPoints(ak)
    al = g:ComboPointsDeficit()
    am = aG()
    StealthEnergyRequired = g:EnergyMax() - aK()
    if O.TargetIsValid() or g:AffectingCombat() then
        if IsInRaid() and UnitExists("boss1") then
            ah = d.BossFightRemains(nil, true)
            ai = ah
            if ai == 11111 then
                ai = d.FightRemains(Enemies10yd, false)
            end
        end
    end
    if EffectiveComboPoints > ak and al > 2 and g:AffectingCombat() then
        if
            ak == 2 and not g:BuffUp(Q.EchoingReprimand3) or ak == 3 and not g:BuffUp(Q.EchoingReprimand4) or
                ak == 4 and not g:BuffUp(Q.EchoingReprimand5)
         then
            local be = P.TimeToSht(4)
            if be == 0 then
                be = P.TimeToSht(5)
            end
            if be < M(g:EnergyTimeToX(35), g:GCDRemains()) + 0.5 then
                EffectiveComboPoints = ak
            end
        end
    end
    if g:BuffUp(Q.ShurikenTornado, nil, true) and ak < P.CPMaxSpend() then
        local bf = P.TimeToNextTornado()
        if bf <= g:GCDRemains() or N(g:GCDRemains() - bf) < 0.25 then
            local bg = a1 + aI(g:BuffUp(Q.ShadowBlades))
            ak = L(ak + bg, P.CPMaxSpend())
            al = M(al - bg, 0)
            if EffectiveComboPoints < P.CPMaxSpend() then
                EffectiveComboPoints = ak
            end
        end
    end
    af = (4 + EffectiveComboPoints * 4) * 0.3
    ag = Q.Eviscerate:Damage() * S.Subtlety.EviscerateDMGOffset
    if a7 then
        return a7
    end
    if a9 > 0 then
        a9 = 0
    end
    if a8 > 0 then
        a8 = 0
    end
    a8 = P.ReturnSpell()
    a9 = P.ReturnSpellMO()
    if m.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        G = GetTime()
        H = G + m.GUISettings.General.OpenerReset
    elseif m.GUISettings.General.OpenerReset > 0 and H ~= nil and GetTime() > H and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        m.ToggleIconFrame:UpdateButtonText(6)
        m.Print(
            "Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r.")
        )
    end
    if m.QueuedCast() then
        a8 = m.QueuedCast()
        return "Custom Queue " .. i(a8):ID()
    end
    if
        v and Q.CheapShot:IsUsableP() and Q.CheapShot:CooldownRemains() <= 0 and g:StealthUp(true, true) and
            not g:PrevGCD(1, Q.CheapShot)
     then
        if m.Cast(Q.CheapShot, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.CheapShot) then
                a9 = 11833
                return "queue Cheap Shot MO"
            else
                a8 = 1833
                return "queue Cheap Shot"
            end
        end
    elseif (not Q.CheapShot:IsUsableP() or Q.CheapShot:CooldownRemains() > 0 or g:PrevGCD(1, Q.CheapShot)) and v then
        HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
        m.Print(
            "Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if w and Q.KidneyShot:IsUsableP() and Q.KidneyShot:CooldownRemains() <= 0 then
        if m.Cast(Q.KidneyShot, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.KidneyShot) then
                a9 = 1408
                return "queue Kidney Shot MO"
            else
                a8 = 408
                return "queue Kidney Shot"
            end
        end
    elseif g:PrevGCD(1, Q.KidneyShot) and w then
        HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
        m.Print(
            "Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if x and Q.Blind:IsUsableP() and Q.Blind:CooldownRemains() <= 0 then
        if m.Cast(Q.Blind, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.Blind) then
                a9 = 12094
                return "queue Blind MO"
            else
                a8 = 2094
                return "queue Blind"
            end
        end
    elseif (not Q.Blind:IsUsableP() or Q.Blind:CooldownRemains() > 0) and x then
        HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
        m.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if y and Q.Sap:IsUsableP() and Q.Sap:CooldownRemains() <= 0 then
        if m.Cast(Q.Sap, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.Sap) then
                a9 = 16770
                return "queue Sap MO"
            else
                a8 = 6770
                return "queue Sap"
            end
        end
    elseif (not Q.Sap:IsUsableP() or Q.Sap:CooldownRemains() > 0) and y then
        HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
        m.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if z and Q.ShurikenTornado:IsUsableP() and Q.ShurikenTornado:CooldownRemains() <= 0 then
        if m.Cast(Q.ShurikenTornado, nil, nil, nil) then
            a8 = 277925
            return "queue Shuriken Tornado"
        end
    elseif (not Q.ShurikenTornado:IsUsableP() or Q.ShurikenTornado:CooldownRemains() > 0) and z then
        HeroRotationCharDB.Toggles[26] = not HeroRotationCharDB.Toggles[26]
        m.Print(
            "Shuriken Tornado Queue is now " ..
                (HeroRotationCharDB.Toggles[26] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if A and Q.Feint:IsUsableP() and Q.Feint:CooldownRemains() <= 0 and g:AffectingCombat() then
        if m.Cast(Q.Feint, nil, nil, nil) then
            a8 = 202
            return "queue Shuriken Tornado"
        end
    elseif (not Q.Feint:IsUsableP() or Q.Feint:CooldownRemains() > 0 or not g:AffectingCombat()) and A then
        HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27]
        m.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if B and Q.Flagellation:IsUsableP() and Q.Flagellation:CooldownRemains() <= 0 and g:AffectingCombat() then
        if m.Cast(Q.Flagellation, nil, nil, nil) then
            a8 = 323654
            return "queue Flagellation Queue"
        end
    elseif (not Q.Flagellation:IsUsableP() or Q.Flagellation:CooldownRemains() > 0 or not g:AffectingCombat()) and B then
        HeroRotationCharDB.Toggles[28] = not HeroRotationCharDB.Toggles[28]
        m.Print(
            "Flagellation Queue is now " .. (HeroRotationCharDB.Toggles[28] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if D then
        if
            Q.ArcaneTorrent:IsAvailable() and Q.ArcaneTorrent:IsUsableP() and Q.ArcaneTorrent:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.ArcaneTorrent, nil, nil, nil) then
                a8 = 155145
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.LightsJudgment:IsAvailable() and Q.LightsJudgment:IsUsableP() and Q.LightsJudgment:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.LightsJudgment, nil, nil, nil) then
                a8 = 255647
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.BagofTricks:IsAvailable() and Q.BagofTricks:IsUsableP() and Q.BagofTricks:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.BagofTricks, nil, nil, nil) then
                a8 = 312411
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.BloodFury:IsAvailable() and Q.BloodFury:IsUsableP() and Q.BloodFury:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.BloodFury, nil, nil, nil) then
                a8 = 20572
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.Berserking:IsAvailable() and Q.Berserking:IsUsableP() and Q.Berserking:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.Berserking, nil, nil, nil) then
                a8 = 26297
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.Fireblood:IsAvailable() and Q.Fireblood:IsUsableP() and Q.Fireblood:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.Fireblood, nil, nil, nil) then
                a8 = 265221
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.AncestralCall:IsAvailable() and Q.AncestralCall:IsUsableP() and Q.AncestralCall:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.AncestralCall, nil, nil, nil) then
                a8 = 274738
                return "queue ArcaneTorrent Queue"
            end
        elseif
            (Q.ArcaneTorrent:IsAvailable() and
                (not Q.ArcaneTorrent:IsUsableP() or Q.ArcaneTorrent:CooldownRemains() > 0 or not g:AffectingCombat()) or
                Q.LightsJudgment:IsAvailable() and
                    (not Q.LightsJudgment:IsUsableP() or Q.LightsJudgment:CooldownRemains() > 0 or
                        not g:AffectingCombat()) or
                Q.BagofTricks:IsAvailable() and
                    (not Q.BagofTricks:IsUsableP() or Q.BagofTricks:CooldownRemains() > 0 or not g:AffectingCombat()) or
                Q.BloodFury:IsAvailable() and
                    (not Q.BloodFury:IsUsableP() or Q.BloodFury:CooldownRemains() > 0 or not g:AffectingCombat()) or
                Q.Berserking:IsAvailable() and
                    (not Q.Berserking:IsUsableP() or Q.Berserking:CooldownRemains() > 0 or not g:AffectingCombat()) or
                Q.Fireblood:IsAvailable() and
                    (not Q.Fireblood:IsUsableP() or Q.Fireblood:CooldownRemains() > 0 or not g:AffectingCombat()) or
                Q.AncestralCall:IsAvailable() and
                    (not Q.AncestralCall:IsUsableP() or Q.AncestralCall:CooldownRemains() > 0 or not g:AffectingCombat())) and
                D
         then
            HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30]
            m.Print(
                "Arcane Torrent Queue is now " ..
                    (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r.")
            )
        end
    end
    a7 = P.CrimsonVial()
    if a7 then
        return a7
    end
    a7 = P.Feint()
    if a7 then
        return a7
    end
    a7 = P.Evasion()
    if a7 then
        return a7
    end
    if
        g:HealthPercentage() < S.Commons.PhialHP and R.PhialofSerenity:IsReady() and
            R.PhialofSerenity:CooldownRemains() <= 0
     then
        if m.Cast(R.PhialofSerenity, nil) then
            a8 = 55
            return "PhialofSerenity HP"
        end
    end
    if
        g:HealthPercentage() < S.Commons.HealthstoneHP and R.Healthstone:IsReady() and
            R.Healthstone:CooldownRemains() <= 0
     then
        if m.Cast(R.Healthstone, nil) then
            a8 = 40
            return "Healthstone HP"
        end
    end
    if
        g:HealthPercentage() < S.Commons.HealPotHP and R.CosmicHealPot:IsReady() and
            R.CosmicHealPot:CooldownRemains() <= 0
     then
        if m.Cast(R.CosmicHealPot, nil) then
            a8 = 45
            return "CosmicHealPot HP"
        end
    end
    if
        g:HealthPercentage() < S.Commons.HealPotHP and R.HealPot:IsReady() and not R.CosmicHealPot:IsReady() and
            R.HealPot:CooldownRemains() <= 0
     then
        if m.Cast(R.HealPot, nil) then
            a8 = 41
            return "HealPot HP"
        end
    end
    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if Q.Backstab:IsReady() and f("mouseover"):IsInMeleeRange(8) then
            if m.Cast(Q.Backstab, nil) then
                a9 = 153
                return "explosive MO SWD"
            end
        end
        if Q.ShurikenToss:IsReady() and f("mouseover"):IsInMeleeRange(40) and not f("mouseover"):IsInMeleeRange(8) then
            if m.Cast(Q.ShurikenToss, nil) then
                a9 = 1114014
                return "explosive MO SWD"
            end
        end
    end
    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if Q.Backstab:IsReady() and h:IsInMeleeRange(8) then
            if m.Cast(Q.Backstab, nil) then
                a8 = 53
                return "explosive  SWD"
            end
        end
        if Q.ShurikenToss:IsReady() and h:IsInMeleeRange(40) and not h:IsInMeleeRange(8) then
            if m.Cast(Q.ShurikenToss, nil) then
                a8 = 114014
                return "explosive MO SWD"
            end
        end
    end
    F = {
        324736,
        228318,
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
        331510,
        344739,
        368477,
        368396,
        355057,
        356133,
        342139,
        353706,
        355782,
        327155,
        359668,
        321220,
        158337
    }
    if UnitExists("target") and Q.Shiv:IsReady() and not E then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
            for bh = 0, 40 do
                local aE, aE, bi, bj, aE, aE, aE, aE, aE, bk = UnitBuff("target", bh)
                for aE, bl in pairs(F) do
                    if bl == bk then
                        if m.Cast(Q.Shiv, nil) then
                            a8 = 5938
                            return "Shiv Enrage"
                        end
                    end
                end
            end
        end
    end
    local bm = g:AffectingCombat() and 180 or 900
    local bn
    if i(8679):IsAvailable() and S.Commons.LethalPoison == "Wound Poison" then
        bn = g:BuffRemains(i(8679))
        if bn < bm and not g:IsCasting(i(8679)) then
            if m.Cast(i(8679)) then
                a8 = 203
                return "Wound Poison Refresh"
            end
        end
    elseif i(2823):IsAvailable() and S.Commons.LethalPoison == "Deadly Poison" then
        bn = g:BuffRemains(i(2823))
        if bn < bm and not g:IsCasting(i(2823)) then
            if m.Cast(i(2823)) then
                a8 = 208
                return "Deadly Poison Refresh"
            end
        end
    elseif i(315584):IsAvailable() and S.Commons.LethalPoison == "Instant Poison" then
        bn = g:BuffRemains(i(315584))
        if bn < bm and not g:IsCasting(i(315584)) then
            if m.Cast(i(315584)) then
                a8 = 205
                return "Instant Poison Refresh"
            end
        end
    end
    if i(381637):IsAvailable() and S.Commons.NonLethalPoison == "Atrophic Poison" then
        bn = g:BuffRemains(i(381637))
        if bn < bm and not g:IsCasting(i(381637)) then
            if m.Cast(i(381637)) then
                a8 = 381637
                return "Atropic Poison Refresh"
            end
        end
    elseif i(5761):IsAvailable() and S.Commons.NonLethalPoison == "Numbing Poison" then
        bn = g:BuffRemains(i(5761))
        if bn < bm and not g:IsCasting(NumbingPoison) then
            if m.Cast(i(5761)) then
                a8 = 204
                return "Numbing Poison Refresh"
            end
        end
    elseif i(3408):IsAvailable() and S.Commons.NonLethalPoison == "Crippling Poison" then
        bn = g:BuffRemains(i(3408))
        if bn < bm and not g:IsCasting(NumbingPoison) then
            if m.Cast(i(3408)) then
                a8 = 206
                return "Crippling Poison Refresh"
            end
        end
    end
    if not g:AffectingCombat() and not g:IsDeadOrGhost() then
        if not g:BuffUp(Q.ShadowDanceBuff) and not g:BuffUp(P.VanishBuffSpell()) then
            a7 = P.Stealth(P.StealthSpell())
            if a7 then
                return a7
            end
        end
        if O.TargetIsValid() and (h:IsSpellInRange(Q.Shadowstrike) or a5) and (not g:AffectingCombat() or q) then
            if m.CDsON() then
                if Q.MarkedforDeath:IsCastable() and g:ComboPointsDeficit() >= P.CPMaxSpend() then
                    if m.Cast(Q.MarkedforDeath, nil) then
                        a8 = 137619
                        return "Cast Marked for Death OOC"
                    end
                end
            end
            if g:StealthUp(true, true) and (g:AffectingCombat() or q) then
                a7 = b7()
                if a7 then
                    return a7 .. " (1OOC)"
                end
            elseif ak >= 5 then
                if g:AffectingCombat() or q then
                    a7 = b2()
                    if a7 then
                        return a7 .. " (2OOC)"
                    end
                end
            elseif Q.Backstab:IsCastable() then
                if m.Cast(Q.Backstab) then
                    a8 = 53
                    return "Cast Backstab (OOC)"
                end
            end
        end
        return
    end
    P.MfDSniping(Q.MarkedforDeath)
    if
        O.TargetIsValid() and
            (not h:DebuffUp(Q.Sap) or (g:BuffUp(ae) or StealthSpell and StealthSpell:ID() == Q.Vanish:ID()))
     then
        if a7 then
            return a7
        end
        a7 = aZ()
        if a7 then
            return "CDs: " .. a7
        end
        local bo, bp, aE = GetSpellCooldown(57934)
        if S.Commons.AutoToT and g:AffectingCombat() then
            if
                bo + bp - GetTime() <= 0 and Q.TricksoftheTrade:IsAvailable() and
                    Q.TricksoftheTrade:CooldownRemains() <= 0 and
                    UnitExists("focus") and
                    (UnitInParty("focus") or UnitInRaid("focus")) and
                    IsItemInRange(32698, "focus")
             then
                if m.Cast(Q.TricksoftheTrade) then
                    a8 = 157934
                    return "ToT Focus"
                end
            end
        end
        if
            Q.SliceandDice:IsCastable() and a1 < P.CPMaxSpend() and d.FilteredFightRemains(a0, ">", 6) and
                g:BuffRemains(Q.SliceandDice) < g:GCD() and
                ak >= 4
         then
            if Q.SliceandDice:IsReady() and m.Cast(Q.SliceandDice) then
                a8 = 5171
                return "Cast Slice and Dice (Low Duration)"
            end
        end
        if g:StealthUp(true, true) and (g:AffectingCombat() or q) then
            a7 = b7()
            if a7 then
                return "Stealthed : " .. a7
            end
        end
        if g:EnergyPredicted() >= StealthEnergyRequired then
            a7 = b6()
            if a7 then
                return "Stealth CDs: " .. a7
            end
        end
        if
            EffectiveComboPoints >= P.CPMaxSpend() or
                (al <= 1 + aI(g:BuffUp(Q.TheRottenBuff)) or
                    d.BossFilteredFightRemains("<", 2) and EffectiveComboPoints >= 3) or
                a1 >= 4 - aI(Q.SealFate:IsAvailable()) and EffectiveComboPoints >= 4
         then
            a7 = b2()
            if a7 then
                return "Finish: " .. a7
            end
        else
            a7 = b6()
            if a7 then
                return "Stealth CDs: " .. a7
            end
            a7 = aX()
            if a7 then
                return "Build: " .. a7
            end
        end
        if m.CDsON() then
            if
                Q.ArcaneTorrent:IsReady() and h:IsInMeleeRange(8) and S.Commons.Enabled.Racials and
                    g:EnergyDeficitPredicted() > 15 + g:EnergyRegen()
             then
                if m.Cast(Q.ArcaneTorrent, nil) then
                    a8 = 155145
                    return "Cast Arcane Torrent"
                end
            end
            if Q.ArcanePulse:IsReady() and h:IsInMeleeRange(8) and S.Commons.Enabled.Racials then
                if m.Cast(Q.ArcanePulse, nil) then
                    a8 = 260364
                    return "Cast Arcane Pulse"
                end
            end
            if Q.LightsJudgment:IsReady() and h:IsInMeleeRange(8) and S.Commons.Enabled.Racials then
                if m.Cast(Q.LightsJudgment, nil) then
                    a8 = 255647
                    return "Cast Lights Judgment"
                end
            end
            if Q.BagofTricks:IsReady() and h:IsInMeleeRange(8) and S.Commons.Enabled.Racials then
                if m.Cast(Q.BagofTricks, nil) then
                    a8 = 312411
                    return "Cast Bag of Tricks"
                end
            end
        end
    end
end
local function bq()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        m.ToggleIconFrame:UpdateButtonText(6)
    end
end
function ReturnSpell()
    if a8 == 0 then
        return 0
    else
        return a8
    end
end
function ReturnSpellMO()
    if a9 == 0 then
        return 0
    else
        return a9
    end
end
m.SetAPL(261, bd, bq)
