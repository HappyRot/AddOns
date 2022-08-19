local e, e = ...
local e = HeroDBC.DBC
local w = HeroLib
local e = HeroCache
local p = w.Unit
local t = p.Player
local n = p.Target
local m = w.Spell
local e = w.MultiSpell
local o = w.Item
local re = w.Utils.BoolToInt
local a = HeroRotation
local Ie = a.AoEON
local b = a.CDsON
local I = HeroRotationCharDB.Toggles[4]
local S = HeroRotationCharDB.Toggles[5]
local me = HeroRotationCharDB.Toggles[6]
local F = HeroRotationCharDB.Toggles[12]
local be = not HeroRotationCharDB.Toggles[15]
local ye = HeroRotationCharDB.Toggles[20]
local se = HeroRotationCharDB.Toggles[21]
local te = HeroRotationCharDB.Toggles[22]
local he = HeroRotationCharDB.Toggles[23]
local ee = HeroRotationCharDB.Toggles[24]
local J = HeroRotationCharDB.Toggles[25]
local X = HeroRotationCharDB.Toggles[26]
local oe = HeroRotationCharDB.Toggles[27]
local ne = HeroRotationCharDB.Toggles[28]
local Y = HeroRotationCharDB.Toggles[29]
local ie = HeroRotationCharDB.Toggles[30]
local _e = HeroRotationCharDB.Toggles[54]
local xe = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 321220, 158337 }
local ze = nil
local ae = nil
local P = false
local z = false
local L = false
local q = false
local _ = false
local je = true
local f = 0
local i = 0
local Z = pairs
local e = table.insert
local x = math.min
local k = math.max
local E = math.abs
local R = a.Commons.Everyone
local r = a.Commons.Rogue
local e = m.Rogue.Subtlety
local c = o.Rogue.Subtlety
local N = GetInventoryItemID("player", 13)
local O = GetInventoryItemID("player", 14)
local de, A, s, le
local l
local o = r.ReturnSpell()
local y = r.ReturnSpellMO()
local g, j, Q
local D, H
local ue, C
local d, h, u
local v
local qe = t:HasLegendaryEquipped(129)
local V = t:HasLegendaryEquipped(116)
local ke = t:HasLegendaryEquipped(127)
local G = t:HasLegendaryEquipped(117)
local T = t:HasLegendaryEquipped(126)
local K = t:HasLegendaryEquipped(229) or (t:HasUnity() and e.Flagellation:IsAvailable())
local ge = t:HasLegendaryEquipped(231) or (t:HasUnity() and e.EchoingReprimand:IsAvailable())
local W = t:HasTier(28, 2)
w:RegisterForEvent(function()
    qe = t:HasLegendaryEquipped(129)
    V = t:HasLegendaryEquipped(116)
    ke = t:HasLegendaryEquipped(127)
    G = t:HasLegendaryEquipped(117)
    T = t:HasLegendaryEquipped(126)
    K = t:HasLegendaryEquipped(229) or (t:HasUnity() and e.Flagellation:IsAvailable())
    ge = t:HasLegendaryEquipped(231) or (t:HasUnity() and e.EchoingReprimand:IsAvailable())
    W = t:HasTier(28, 2)
end, "PLAYER_EQUIPMENT_CHANGED")
local function T(t, t, e, t, t)
    if e == UnitGUID("player") then
        local e, t, n, a, n, n, n, n, n, n, n, o, n, n, n, n, n, n, n, n, n, n, n, n = CombatLogGetCurrentEventInfo()
                if t == "SWING_DAMAGE" and e > i then
            i = e
            f = f + 1
        elseif t == "SPELL_ENERGIZE" and a == UnitGUID("player") and o == 196911 then
            i = e
            f = 0
        end

    end

end

local i = CreateFrame("Frame")
i:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
i:SetScript("OnEvent", T)
e.Eviscerate:RegisterDamageFormula(function()
    return t:AttackPowerDamageMod() * d * .176 * 1.21 * (e.Nightstalker:IsAvailable() and t:StealthUp(true, false) and 1.12 or 1) * (e.DeeperStratagem:IsAvailable() and 1.05 or 1) * (e.DarkShadow:IsAvailable() and t:BuffUp(e.ShadowDanceBuff) and 1.3 or 1) * (not e.DarkShadow:IsAvailable() and t:BuffUp(e.ShadowDanceBuff) and 1.15 or 1) * (t:BuffUp(e.SymbolsofDeath) and 1.15 or 1) * (t:BuffUp(e.FinalityEviscerate) and 1.25 or 1) * (1 + t:MasteryPct() / 100) * (1 + t:VersatilityDmgPct() / 100) * (n:DebuffUp(e.FindWeaknessDebuff) and 1.5 or 1) * (n:DebuffUp(e.SinfulRevelationDebuff) and 1.06 or 1)
end)
e.Rupture:RegisterPMultiplier(function()
    return e.Nightstalker:IsAvailable() and t:StealthUp(true, false) and 1.12 or 1
end)
local i = { General = a.GUISettings.General, Commons = a.GUISettings.APL.Rogue.Commons, Subtlety = a.GUISettings.APL.Rogue.Subtlety }
local function T(e, t)
    if not g then
        g = e
        j = t or 0
    end

end

local function T(e)
    if not Q then
        Q = e
    end

end

local function pe()
        if i.Subtlety.BurnShadowDance == "On Bosses not in Dungeons" and t:IsInDungeonArea() then
        return false
    elseif i.Subtlety.BurnShadowDance ~= "Always" and not n:IsInBossList() then
        return false
    else
        return true
    end

end

local function T(a)
    d = a
    if ((a == 2 and t:BuffUp(e.EchoingReprimand2)) or (a == 3 and t:BuffUp(e.EchoingReprimand3)) or (a == 4 and t:BuffUp(e.EchoingReprimand4)) or (a == 5 and t:BuffUp(e.EchoingReprimand5))) then
        d = 7
        return 7
    else
        d = a
        return a
    end

    local o, i = UnitAttackSpeed("unit")
    local o = (o + i) / 2
    local o = o / 2
    local i = (4 - f) * o
    local o = (5 - f) * o
    if d > a and u > 2 and t:AffectingCombat() then
        if a == 2 and not t:BuffUp(e.EchoingReprimand3) or a == 3 and not t:BuffUp(e.EchoingReprimand4) or a == 4 and not t:BuffUp(e.EchoingReprimand5) then
            local e = i
            if e == 0 then
                e = o
            end

            if e < (k(t:EnergyTimeToX(35), t:GCDRemains()) + .5) then
                d = a
            end

        end

    end

end

local function ve()
                if s < 2 then
        return false
    elseif i.Commons.UsePriorityRotation == "Always" then
        return true
    elseif i.Commons.UsePriorityRotation == "On Bosses" and n:IsInBossList() then
        return true
    elseif i.Commons.UsePriorityRotation == "Auto" then
                if t:InstanceDifficulty() == 16 and n:NPCID() == 138967 then
            return true
        elseif n:NPCID() == 166969 or n:NPCID() == 166971 or n:NPCID() == 166970 then
            return true
        end

    end

    return false
end

local function fe(o, d, r, l)
    local t, s = nil, r
    local h = n:GUID()
    for a, e in Z(l) do
        if e:GUID() ~= h and R.UnitIsCycleValid(e, s, -e:DebuffRemains(o)) and d(e) then
            t, s = e, e:TimeToDie()
        end

    end

        if t then
        a.CastLeftNameplate(t, o)
                if t:GUID() == p("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover" then
                        if o == e.Rupture then
                y = 11943
            elseif o == e.SerratedBoneSpike then
                y = 1328547
            end

        elseif i.Subtlety.TargetSwap == "AutoSwap" and t:GUID() ~= n:GUID() and not F then
            y = 9999
        end

    elseif false then
        t, s = nil, r
        for a, e in Z(A) do
            if e:GUID() ~= h and R.UnitIsCycleValid(e, s, -e:DebuffRemains(o)) and d(e) then
                t, s = e, e:TimeToDie()
            end

        end

        if t then
            a.CastLeftNameplate(t, o)
                        if t:GUID() == p("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover" then
                                if o == e.Rupture then
                    y = 11943
                elseif o == e.SerratedBoneSpike then
                    y = 1328547
                end

            elseif i.Subtlety.TargetSwap == "AutoSwap" and t:GUID() ~= n:GUID() and not F then
                y = 9999
            end

        end

    end

end

local function f(e)
    if e then
        return 1
    else
        return 0
    end

end

local function Oe(t)
    return t:DebuffRemains(e.FindWeaknessDebuff)
end

local function Te(t)
                if ((not v and t:DebuffRemains(e.FindWeaknessDebuff) < 1 and s <= 3 and t:TimeToDie() > 6 and t:IsInRange(8)) and t:GUID() == p("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover") then
        y = 1185438
        return true
    elseif ((not v and t:DebuffRemains(e.FindWeaknessDebuff) < 1 and s <= 3 and t:TimeToDie() > 6 and t:IsInRange(8)) and i.Subtlety.TargetSwap == "AutoSwap" and t:GUID() ~= n:GUID() and not F) then
        y = 9999
        return true
    elseif ((not v and t:DebuffRemains(e.FindWeaknessDebuff) < 1 and s <= 3 and t:TimeToDie() > 6 and t:IsInRange(8)) and t:GUID() == n:GUID()) then
        o = 185438
        return true
    elseif (not v and t:DebuffRemains(e.FindWeaknessDebuff) < 1 and s <= 3 and t:TimeToDie() > 6 and t:IsInRange(8)) then
        return true
    end

end

local function we()
    return 25 + f(e.Vigor:IsAvailable()) * 20 + f(e.MasterofShadows:IsAvailable()) * 20 + f(e.ShadowFocus:IsAvailable()) * 25 + f(e.Alacrity:IsAvailable()) * 20 + f(s >= 4) * 25
end

local function M()
    return e.ShadowDance:ChargesFractional() >= 1.75
end

local function B()
            if s == 4 then
        return u <= 1
    elseif v and s >= 4 then
        return u <= 1
    elseif e.EchoingReprimand:IsAvailable() then
        return u >= 3
    else
        return u >= (2 + f(t:BuffUp(e.ShadowBlades)))
    end

end

local function Ae()
    return t:BuffUp(e.SliceandDice) or s >= 6
end

local function ce()
    return e.Premeditation:IsAvailable() and s < (5 - f(e.SerratedBoneSpike:IsAvailable())) and not e.EchoingReprimand:IsAvailable()
end

local function Ee(a)
    return r.MasterAssassinsMarkRemains() > 0 or (not e.Nightstalker:IsAvailable() and e.DarkShadow:IsAvailable() and a) or s >= (4 - re(t:StealthUp(true, true) or a) * re(e.ShadowFocus:IsAvailable()))
end

local function U()
    local l = t:BuffUp(e.ShadowDanceBuff) or (StealthSpell and StealthSpell:ID() == e.ShadowDance:ID())
    h = t:ComboPoints()
    d = T(h)
    if e.SliceandDice:IsCastable(BypassRecovery) then
        if not ce() and s < 6 and not t:BuffUp(e.ShadowDanceBuff) and w.FilteredFightRemains(A, ">", t:BuffRemains(e.SliceandDice)) and t:BuffRefreshable(e.SliceandDice) then
            if e.SliceandDice:IsReady(BypassRecovery) and a.Cast(e.SliceandDice) then
                o = 5171
                return "Cast Slice and Dice (not Premed)"
            end

        end

        if ce() and e.ShadowDance:ChargesFractional() < 1.75 and t:BuffRemains(e.SliceandDice) < e.SymbolsofDeath:CooldownRemains() and (e.ShadowDance:CooldownRemains() <= 0 and (t:BuffRemains(e.SymbolsofDeath) - t:BuffRemains(e.ShadowDanceBuff)) < 1.2) then
            if e.SliceandDice:IsReady(BypassRecovery) and a.Cast(e.SliceandDice) then
                o = 5171
                return "Cast Slice and Dice (Premed)"
            end

        end

    end

    local i = Ee(l)
    if (not i or v) and e.Rupture:IsCastable() and not (t:StealthUp(true, true) or l) then
        if n:IsInMeleeRange(8) and (n:FilteredTimeToDie(">", 12, -n:DebuffRemains(e.Rupture)) or n:TimeToDieIsNotValid()) and r.CanDoTUnit(n, C) and n:DebuffRefreshable(e.Rupture, ue) then
            if e.Rupture:IsReady(BypassRecovery) and a.Cast(e.Rupture) then
                o = 1943
                return "Cast Rupture 1"
            end

        end

    end

    if e.SecretTechnique:IsReady(BypassRecovery) then
        if a.Cast(e.SecretTechnique) then
            o = 280719
            return "Cast Secret Technique"
        end

    end

    if not i and e.Rupture:IsCastable(BypassRecovery) then
        if not i and not v and s >= 2 then
            local function a(t)
                return R.CanDoTUnit(t, C) and t:DebuffRefreshable(e.Rupture, ue)
            end

            fe(e.Rupture, a, (5 + 2 * d), le)
        end

        if n:IsInMeleeRange(5) and (n:DebuffRemains(e.Rupture) < e.SymbolsofDeath:CooldownRemains() + 10) and (e.SymbolsofDeath:CooldownRemains() <= 5 or not q) and r.CanDoTUnit(n, C) and (n:FilteredTimeToDie(">", 11 + e.SymbolsofDeath:CooldownRemains(), -n:DebuffRemains(e.Rupture))) then
            if e.Rupture:IsReady(BypassRecovery) and a.Cast(e.Rupture) then
                o = 1943
                return "Cast Rupture 2"
            end

        end

    end

    if e.BlackPowder:IsCastable(BypassRecovery) and not v and s >= 3 and not ye then
        if e.BlackPowder:IsReady(BypassRecovery) and a.Cast(e.BlackPowder) then
            o = 319175
            return "Cast Black Powder"
        end

    end

    if e.Eviscerate:IsCastable() and n:IsInMeleeRange(8) then
        if e.Eviscerate:IsReady(BypassRecovery) and a.Cast(e.Eviscerate) then
            o = 196819
            return "Cast Eviscerate"
        end

    end

end

local function ce()
    local m = t:BuffUp(D) or (StealthSpell and StealthSpell:ID() == D:ID())
    local c = t:BuffUp(H) or (StealthSpell and StealthSpell:ID() == e.Vanish:ID())
    local l = t:BuffUp(e.ShadowDanceBuff) or (StealthSpell and StealthSpell:ID() == e.ShadowDance:ID())
    local l = e.Shadowstrike:IsCastable() or m or c or l
    h = t:ComboPoints()
    d = T(h)
    if l and n:IsInMeleeRange(i.Subtlety.ShadowStrikeRange) and (m or c) and (s < 4 or v) and r.MasterAssassinsMarkRemains() == 0 then
        if a.Cast(e.Shadowstrike, nil, nil) then
            o = 185438
            return "Cast Shadowstrike (Stealth)"
        end

    end

    if d >= r.CPMaxSpend() or (d >= 5 and t:BuffUp(e.ShurikenTornado)) then
        return U()
    end

    if t:BuffUp(e.ShurikenTornado) and u <= 2 then
        return U()
    end

    if s >= 4 and d >= 4 then
        return U()
    end

    if u <= 1 - f(e.DeeperStratagem:IsAvailable() and c) then
        return U()
    end

    if l and n:IsInMeleeRange(i.Subtlety.ShadowStrikeRange) and not t:StealthUp(true, false) and t:BuffUp(e.SepsisBuff) and s < 4 then
        if a.Cast(e.Shadowstrike, nil, nil) then
            o = 185438
            return "Cast Shadowstrike (Sepsis)"
        end

    end

    if t:BuffStack(e.PerforatedVeinsBuff) >= 5 and t:BuffRemains(e.ShadowDanceBuff) >= 3 and t:BuffUp(e.ShadowBlades) and s <= 3 then
        if a.Cast(e.Backstab) then
            o = 53
            return "Cast Backstab (Stealth PV)"
        end

    end

    if e.Shiv:IsReady() and V and e.Nightstalker:IsAvailable() and s < 5 then
        if a.Cast(e.Shiv) then
            o = 5938
            return "Cast Shiv (TTB NS)"
        end

    end

    if e.Shadowstrike:IsCastable() then
        if not v and n:DebuffRemains(e.FindWeaknessDebuff) < 1 and s <= 3 and w.BossFilteredFightRemains("<=", 5) then
            if a.Cast(e.Shadowstrike) then
                o = 185438
                return "Cast Shadowstrike (Prio Rotation)"
            end

        end

        if R.CastTargetIf(e.Shadowstrike, MeleeEnemies8y, "min", Oe, Te) then
            return "Find the Weakness/ShadowStrike 26"
        end

    end

    if l and n:IsInMeleeRange(i.Subtlety.ShadowStrikeRange) and v and (n:DebuffRemains(e.FindWeaknessDebuff) < 1 or (e.Weaponmaster:IsAvailable() and s <= 4)) then
        if a.Cast(e.Shadowstrike) then
            o = 185438
            return "Cast Shadowstrike (Prio Rotation)"
        end

    end

    if e.ShurikenStorm:IsCastable() and d < r.CPMaxSpend() and s >= 3 + f(t:BuffUp(e.TheRottenBuff) or ke or W) and (t:BuffUp(e.SymbolsofDeathCrit) or not t:BuffUp(e.PremeditationBuff) or (s >= 5 and d < r.CPMaxSpend())) then
        if a.Cast(e.ShurikenStorm) then
            o = 197835
            return "Cast Shuriken Storm"
        end

    end

    if l and d < r.CPMaxSpend() and n:IsInMeleeRange(i.Subtlety.ShadowStrikeRange) and (n:DebuffRemains(e.FindWeaknessDebuff) < 1 or ((e.SymbolsofDeath:CooldownRemains() < 18 and q) and n:DebuffRemains(e.FindWeaknessDebuff) < e.SymbolsofDeath:CooldownRemains())) then
        if a.Cast(e.Shadowstrike) then
            o = 185438
            return "Cast Shadowstrike (FW Refresh)"
        end

    end

    if l and d < r.CPMaxSpend() and n:IsInMeleeRange(i.Subtlety.ShadowStrikeRange) then
        if a.Cast(e.Shadowstrike) then
            o = 185438
            return "Cast Shadowstrike 2"
        end

    end

end

local function ke()
    local n = ce(true, StealthSpell)
    h = t:ComboPoints()
    d = T(h)
            if StealthSpell == e.Vanish and (not i.Subtlety.StealthMacro.Vanish or not n) and i.Commons.VanishOffensive and L then
        if a.Cast(e.Vanish, nil) then
            o = 1213
            return "Cast Vanish"
        end

        return false
    elseif StealthSpell == e.Shadowmeld and (not i.Subtlety.StealthMacro.Shadowmeld or not n) and i.Commons.Enabled.Racials then
        if a.Cast(e.Shadowmeld, nil) then
            o = 1214
            return "Cast Shadowmeld"
        end

        return false
    elseif StealthSpell == e.ShadowDance and (not i.Subtlety.StealthMacro.ShadowDance or not n) and z then
        if a.Cast(e.ShadowDance, nil) then
            o = 1212
            return "Cast Shadow Dance"
        end

        return false
    end

    local o = { StealthSpell, n }
    if EnergyThreshold and t:EnergyPredicted() < EnergyThreshold then
        return false
    end

    if o[1] == e.ShadowDance and o[2] == e.DeathfromAbove then
        l = a.CastQueue(o[2], o[1])
        if l then
            return "| " .. o[1]:Name()
        end

    end

    return false
end

local function Ee()
    h = t:ComboPoints()
    d = T(h)
    if t:BuffUp(e.ShurikenTornado) then
        if e.ShadowDance:IsCastable() and z and not t:BuffUp(e.ShadowDanceBuff) and t:BuffRemains(e.ShurikenTornado) <= 3.5 then
            if a.Cast(e.ShadowDance) then
                o = 185313
                return "Cast Shadow Dance (during Tornado)"
            end

        end

        if e.SymbolsofDeath:IsCastable() and q and t:BuffRemains(e.ShurikenTornado) <= 3.5 then
            if a.Cast(e.SymbolsofDeath) then
                o = 212283
                return "Cast Symbols of Death(during Tornado)"
            end

        end

    end

    local m = Ae()
    if n:IsInMeleeRange(8) then
        if I and e.Flagellation:IsReady() and m and not t:StealthUp(false, false) and h >= 5 and (s <= 1 and e.SymbolsofDeath:CooldownUp() and not e.ShadowFocus:IsAvailable() or t:BuffUp(e.SymbolsofDeath)) then
            if a.Cast(e.Flagellation, nil, nil) then
                o = 323654
                return "Cast Flrgrrlation"
            end

        end

    end

    if L and e.Vanish:IsCastable() and not se and i.Commons.VanishOffensive and (G and u <= 1 - f((e.DeeperStratagem:IsAvailable()) or qe and d < 1)) and t:BuffUp(e.SymbolsofDeath) and t:BuffUp(e.ShadowDanceBuff) and r.MasterAssassinsMarkRemains() == 0 and t:BuffDown(e.DeathlyShadowsBuff) then
        if a.Cast(e.Vanish, nil, nil) then
            o = 1856
            return "Vanish Macro"
        end

    end

    if e.ShurikenTornado:IsCastable() and _ and not Y and (t:Energy() < 60 and not e.ShadowFocus:IsAvailable() and m and e.SymbolsofDeath:CooldownUp() and e.ShadowDance:Charges() >= 1 and _ and (not K or n:DebuffUp(e.Flagellation) or (s >= (1 + 4 * (f(not e.Nightstalker:IsAvailable() and not e.DarkShadow:IsAvailable()))))) and d <= 2 and (not t:BuffUp(e.PremeditationBuff) or s > 4) and (not e.Flagellation:IsAvailable() or (e.Flagellation:IsAvailable() and not e.Flagellation:CooldownUp()))) then
        if a.CastPooling(e.ShurikenTornado) then
            o = 1000
            return "Pool for Shuriken Tornado"
        end

    end

    if e.ShurikenTornado:IsCastable() and _ and not Y and (t:Energy() >= 60 and m and (e.SymbolsofDeath:CooldownUp() or not q) and e.ShadowDance:Charges() >= 1 and (not K or n:DebuffUp(e.Flagellation) or (s >= (1 + 4 * (f(not e.Nightstalker:IsAvailable() and not e.DarkShadow:IsAvailable()))))) and h <= 2 and (not t:BuffUp(e.PremeditationBuff) or s > 4) and (not e.Flagellation:IsAvailable() or (e.Flagellation:IsAvailable() and not e.Flagellation:CooldownUp()))) then
        if a.Cast(e.ShurikenTornado) then
            o = 277925
            return "Cast Shuriken Tornado"
        end

    end

    if e.SerratedBoneSpike:IsReady() and t:AffectingCombat() and (m or w.BossFilteredFightRemains("<=", 5) and s < 3) and not t:BuffUp(e.PremeditationBuff) and not t:BuffUp(e.ShurikenTornado) then
        local function i(t)
            return not t:DebuffUp(e.SerratedBoneSpikeDebuff)
        end

        if ((n:IsInRange(30) and t:AffectingCombat()) or (n:IsInRange(20))) and i(n) and n:FilteredTimeToDie(">", 21) then
            if a.Cast(e.SerratedBoneSpike, nil, nil) then
                o = 328547
                return "Cast Serrated Bone Spike (ST)"
            end

        end

        if a.AoEON() then
            fe(e.SerratedBoneSpike, i, 21, de)
        end

    end

    if n:IsInMeleeRange(8) then
        if I and e.Sepsis:IsReady() and m and u >= 1 and not n:FilteredTimeToDie("<", 16) then
            if a.Cast(e.Sepsis, nil, nil) then
                o = 328305
                return "Cast Sepsis"
            end

        end

        if e.SymbolsofDeath:IsCastable() and m and q and (not e.ShurikenTornado:IsAvailable() or e.ShadowFocus:IsAvailable() or s >= 2 or e.ShurikenTornado:CooldownRemains() > 2 or _) and (not e.Flagellation:IsAvailable() or (e.Flagellation:CooldownRemains() > 10 or not I) or (e.Flagellation:CooldownUp() and I) and d >= 5) then
            if a.Cast(e.SymbolsofDeath, nil) then
                o = 212283
                return "Cast Symbols of Death"
            end

        end

    end

    if e.MarkedforDeath:IsCastable() then
        if n:FilteredTimeToDie("<", u) then
            if a.Cast(e.MarkedforDeath, nil) then
                o = 137619
                return "Cast Marked for Death"
            end

        end

        if not t:StealthUp(true, true) and u >= r.CPMaxSpend() then
            if je then
                if a.Cast(e.MarkedforDeath, nil) then
                    o = 137619
                    return "Cast Marked for Death"
                end

            end

        end

        if s == 1 and u >= r.CPMaxSpend() then
            if a.Cast(e.MarkedforDeath, nil) then
                o = 137619
                return "Cast Marked for Death"
            end

        end

    end

    if a.CDsON() or not a.CDsON() then
        if e.ShadowBlades:IsCastable() and m and u >= 2 and P and (t:BuffUp(e.SymbolsofDeath) or w.BossFilteredFightRemains("<=", 20) or (not t:BuffUp(e.ShadowBlades) and W)) then
            if a.Cast(e.ShadowBlades, nil) then
                o = 121471
                return "Cast Shadow Blades"
            end

        end

        if e.EchoingReprimand:IsReady() and I and n:IsInMeleeRange(5) and not t:StealthUp(true, true) and m and u >= 2 and (v or s <= 4 or ge) then
            if a.Cast(e.EchoingReprimand, nil, nil) then
                o = 323547
                return "Cast Echoing Reprimand"
            end

        end

        if e.ShurikenTornado:IsReady() and _ and not Y and ((e.ShadowFocus:IsAvailable() or s >= 2) and m and (t:BuffUp(e.SymbolsofDeath) or not q) and d <= 2 and (not t:BuffUp(e.PremeditationBuff) or s > 4)) then
            if a.Cast(e.ShurikenTornado) then
                o = 277925
                return "Cast Shuriken Tornado (SF)"
            end

        end

        if e.ShadowDance:IsCastable() and (pe() or z) and not t:BuffUp(e.ShadowDanceBuff) and w.BossFilteredFightRemains("<=", (8 + f(e.Subterfuge:IsAvailable()))) then
            l = ke(e.ShadowDance)
            if l then
                return "Shadow Dance Macro (Low TTD) " .. l
            end

        end

        if c.PotionofSpectralAgility:IsReady() and b() and i.Commons.Enabled.Potions and be and ((t:BloodlustUp() and a.GUISettings.General.HoldPotforBL) or ((w.BossFilteredFightRemains("<", 30) or (t:BuffUp(e.SymbolsofDeath) and (t:BuffUp(e.ShadowBlades) or (e.ShadowBlades:CooldownRemains() <= 10 and P)))) and not a.GUISettings.General.HoldPotforBL)) then
            if a.Cast(c.PotionofSpectralAgility, nil) then
                o = 37
                return "potion cooldowns 2"
            end

        end

        if t:BuffUp(e.SymbolsofDeath) then
            if e.BloodFury:IsCastable() and i.Commons.Enabled.Racials then
                if a.Cast(e.BloodFury, nil) then
                    o = 20572
                    return "Cast Blood Fury"
                end

            end

            if e.Berserking:IsCastable() and i.Commons.Enabled.Racials then
                if a.Cast(e.Berserking, nil) then
                    o = 26297
                    return "Cast Berserking"
                end

            end

            if e.Fireblood:IsCastable() and i.Commons.Enabled.Racials then
                if a.Cast(e.Fireblood, nil) then
                    o = 265221
                    return "Cast Fireblood"
                end

            end

            if e.AncestralCall:IsCastable() and i.Commons.Enabled.Racials then
                if a.Cast(e.AncestralCall, nil) then
                    o = 274738
                    return "Cast Ancestral Call"
                end

            end

        end

        if (i.Commons.Enabled.TopTrinket or i.Commons.Enabled.BottomTrinket) and b() then
            local h = t:GetUseableTrinkets(OnUseExcludes)
            if c.CacheOfAcquiredTreasures:IsEquippedAndReady() then
                                if t:BuffUp(e.AcquiredAxe) and s > 1 then
                                        if c.CacheOfAcquiredTreasures:ID() == N and i.Commons.Enabled.TopTrinket then
                        o = 24
                        return "top trinket Cache Axe for AoE"
                    elseif c.CacheOfAcquiredTreasures:ID() == O and i.Commons.Enabled.BottomTrinket then
                        o = 25
                        return "bot trinket Cache Axe for AoE"
                    end

                elseif t:BuffUp(e.AcquiredWand) and (s == 1 and n:IsInBossList() or w.BossFilteredFightRemains("<", 20)) then
                                        if c.CacheOfAcquiredTreasures:ID() == N and i.Commons.Enabled.TopTrinket then
                        o = 24
                        return "top trinket Cache Wand for ST"
                    elseif c.CacheOfAcquiredTreasures:ID() == O and i.Commons.Enabled.BottomTrinket then
                        o = 25
                        return "bot trinket Cache Wand for ST"
                    end

                end

            end

            local e = t:BuffUp(e.SymbolsofDeath) or w.BossFilteredFightRemains("<", 20)
            if e then
                if h then
                    if a.Cast(h, nil, nil) then
                                                if h:ID() == N and i.Commons.Enabled.TopTrinket then
                            o = 24
                            return "Generic use_items for " .. h:Name()
                        elseif h:ID() == O and i.Commons.Enabled.BottomTrinket then
                            o = 25
                            return "Generic use_items for " .. h:Name()
                        end

                    end

                end

            end

        end

    end

end

local function K()
    h = t:ComboPoints()
    d = T(h)
    if (a.CDsON() or not a.CDsON()) and e.ShadowDance:TimeSinceLastDisplay() > .3 and e.Shadowmeld:TimeSinceLastDisplay() > .3 then
        if e.Vanish:IsCastable() and L and not se and i.Commons.VanishOffensive and (not M() or (not e.Nightstalker:IsAvailable() and e.DarkShadow:IsAvailable())) and u > 1 and not G then
            if a.Cast(e.Vanish, nil, nil) then
                o = 1856
                return "Vanish Stealth CD"
            end

        end

        if t:Energy() < 40 and e.Shadowmeld:IsCastable() then
            if a.CastPooling(e.Shadowmeld, t:EnergyTimeToX(40)) then
                o = 1000
                return "Pool for Shadowmeld"
            end

        end

        if e.Shadowmeld:IsCastable() and n:IsInMeleeRange(5) and not t:IsMoving() and i.Commons.Enabled.Racials and t:Energy() >= 40 and t:EnergyDeficitPredicted() >= 10 and not M() and u > 1 then
            if a.Cast(e.Shadowmeld, nil, nil) then
                o = 58984
                return "Shadowmeld Stealth CD"
            end

        end

    end

    if n:IsInMeleeRange(5) and e.ShadowDance:IsCastable() and z and e.Vanish:TimeSinceLastDisplay() > .3 and e.Shadowmeld:TimeSinceLastDisplay() > .3 then
        if (W and Covenant == "Kyrian" and (B() or M())) or (B() and (t:BuffRemains(e.SymbolsofDeath) >= 1.2 or M()) or t:BuffUp(e.ChaosBaneBuff) or (s >= 4 and e.SymbolsofDeath:CooldownRemains() > 10)) and (t:BuffStack(e.PerforatedVeinsBuff) < 4 or s > 3) then
            if a.Cast(e.ShadowDance) then
                o = 185313
                return " Shadow Dance Stealth CD"
            end

        end

        if pe() and (B() and w.BossFilteredFightRemains("<", e.SymbolsofDeath:CooldownRemains()) or not q or not e.EnvelopingShadows:IsAvailable()) and z then
            if a.Cast(e.ShadowDance) then
                o = 185313
                return " Shadow Dance Stealth CD"
            end

        end

    end

end

local function M()
    h = t:ComboPoints()
    d = T(h)
    local i = not EnergyThreshold or t:EnergyPredicted() >= EnergyThreshold
    if e.Shiv:IsCastable() and V and not e.Nightstalker:IsAvailable() and s < 5 then
        if a.Cast(e.Shiv) then
            o = 5938
            return "Cast Shiv (TTB)"
        end

    end

    if e.ShurikenStorm:IsCastable() and s >= 2 and (not e.SerratedBoneSpike:IsAvailable() or (((e.SerratedBoneSpike:MaxCharges() - e.SerratedBoneSpike:ChargesFractional()) >= .25) or s > 4) and t:BuffStack(e.PerforatedVeinsBuff) <= 4 or s > 4) then
        if a.Cast(e.ShurikenStorm) then
            o = 197835
            return "Cast Shuriken Storm"
        end

    end

    if e.SerratedBoneSpike:IsCastable() and t:AffectingCombat() and t:BuffStack(e.PerforatedVeinsBuff) <= 2 and ((e.SerratedBoneSpike:MaxCharges() - e.SerratedBoneSpike:ChargesFractional()) <= .25 or ((e.LeadbyExample:SoulbindEnabled() and not t:BuffUp(e.LeadbyExampleBuff)) or (e.KevinsOozeling:SoulbindEnabled() and not n:DebuffUp(e.KevinsWrathDebuff))) and not w.BossFightRemainsIsNotValid()) then
        if i and a.Cast(e.SerratedBoneSpike, nil, nil) then
            o = 328547
            return "Cast Serrated Bone Spike (Capping Filler)"
        end

    end

    if n:IsInMeleeRange(8) then
        if Covenant == "Kyrian" and t:Energy() < 60 and (h == 2 and t:BuffUp(e.EchoingReprimand3) or h == 3 and t:BuffUp(e.EchoingReprimand4) or h == 4 and t:BuffUp(e.EchoingReprimand5)) and (r.TimeToSht(3) < .5 or r.TimeToSht(4) < 1. or r.TimeToSht(5) < 1.) then
            if a.Cast(e.PoolEnergy) then
                o = 1000
                return "ER Generator Pooling"
            end

        end

                if e.Gloomblade:IsCastable() then
            if i and a.Cast(e.Gloomblade) then
                o = 200758
                return "Cast Gloomblade"
            end

        elseif e.Backstab:IsCastable() then
            if i and a.Cast(e.Backstab) then
                o = 53
                return "Cast Backstab"
            end

        end

    end

end

local W = { { e.Blind, "Cast Blind (Interrupt)", function()
    return true
end }, { e.KidneyShot, "Cast Kidney Shot (Interrupt)", function()
    return d > 0
end }, { e.CheapShot, "Cast Cheap Shot (Interrupt)", function()
    return t:StealthUp(true, true)
end } }
local function W()
    me = HeroRotationCharDB.Toggles[6]
    I = HeroRotationCharDB.Toggles[4]
    S = HeroRotationCharDB.Toggles[5]
    F = HeroRotationCharDB.Toggles[12]
    be = not HeroRotationCharDB.Toggles[15]
    ye = HeroRotationCharDB.Toggles[20]
    se = HeroRotationCharDB.Toggles[21]
    te = HeroRotationCharDB.Toggles[22]
    he = HeroRotationCharDB.Toggles[23]
    ee = HeroRotationCharDB.Toggles[24]
    J = HeroRotationCharDB.Toggles[25]
    X = HeroRotationCharDB.Toggles[26]
    oe = HeroRotationCharDB.Toggles[27]
    ne = HeroRotationCharDB.Toggles[28]
    Y = HeroRotationCharDB.Toggles[29]
    ie = HeroRotationCharDB.Toggles[30]
    _e = HeroRotationCharDB.Toggles[54]
    P = false
    z = false
    L = false
    q = false
    je = true
    _ = false
    if ((i.Subtlety.IncludedCooldowns.ShadowBlades and b()) or (i.Subtlety.IncludedSmallCooldowns.ShadowBlades and (b() or S)) or (not i.Subtlety.IncludedSmallCooldowns.ShadowBlades and not i.Subtlety.IncludedCooldowns.ShadowBlades)) then
        P = true
    end

    if ((i.Subtlety.IncludedCooldowns.ShadowDance and b()) or (i.Subtlety.IncludedSmallCooldowns.ShadowDance and (b() or S)) or (not i.Subtlety.IncludedSmallCooldowns.ShadowDance and not i.Subtlety.IncludedCooldowns.ShadowDance)) then
        z = true
    end

    if ((i.Subtlety.IncludedCooldowns.Vanish and b()) or (i.Subtlety.IncludedSmallCooldowns.Vanish and (b() or S)) or (not i.Subtlety.IncludedSmallCooldowns.Vanish and not i.Subtlety.IncludedCooldowns.Vanish)) then
        L = true
    end

    if ((i.Subtlety.IncludedCooldowns.SymbolsofDeath and b()) or (i.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and (b() or S)) or (not i.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and not i.Subtlety.IncludedCooldowns.SymbolsofDeath)) then
        q = true
    end

    if ((i.Subtlety.IncludedCooldowns.ShurikenTornado and b()) or (i.Subtlety.IncludedSmallCooldowns.ShurikenTornado and (b() or S)) or (not i.Subtlety.IncludedSmallCooldowns.ShurikenTornado and not i.Subtlety.IncludedCooldowns.ShurikenTornado)) then
        _ = true
    end

    N = GetInventoryItemID("player", 13)
    O = GetInventoryItemID("player", 14)
            if not i.Commons.Enabled.TopTrinket and not i.Commons.Enabled.BotTrinket then
        OnUseExcludes = { N, O, c.MistcallerOcarina:ID(), c.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.TopTrinket and i.Commons.Enabled.BotTrinket then
        OnUseExcludes = { N, c.MistcallerOcarina:ID(), c.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.BotTrinket and i.Commons.Enabled.TopTrinket then
        OnUseExcludes = { O, c.MistcallerOcarina:ID(), c.CacheOfAcquiredTreasures:ID() }
    end

end

local function b()
    if e.Subterfuge:IsAvailable() then
        D = e.Stealth2
        H = e.VanishBuff2
    else
        D = e.Stealth
        H = e.VanishBuff
    end

    g = nil
    Q = nil
    j = 0
    if Ie() then
        de = t:GetEnemiesInRange(30)
        MeleeEnemies8y = t:GetEnemiesInMeleeRange(8)
        A = t:GetEnemiesInMeleeRange(10)
        s = #A
        le = t:GetEnemiesInMeleeRange(5)
    else
        de = {  }
        A = {  }
        s = 0
        le = {  }
    end

    h = t:ComboPoints()
    d = T(h)
    u = t:ComboPointsDeficit()
    v = ve()
    l = W()
    if a.QueuedCast() then
        o = a.QueuedCast()
        return "Custom Queue " .. m(o):ID()
    end

    if l then
        return l
    end

    if y > 0 then
        y = 0
    end

    if o > 0 then
        o = 0
    end

    o = r.ReturnSpell()
    y = r.ReturnSpellMO()
        if a.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        ze = GetTime()
        ae = ze + (a.GUISettings.General.OpenerReset)
    elseif a.GUISettings.General.OpenerReset > 0 and ae ~= nil and GetTime() > ae and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        a.ToggleIconFrame:UpdateButtonText(6)
        a.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (te and e.CheapShot:IsUsableP() and e.CheapShot:CooldownRemains(BypassRecovery) <= 0 and t:StealthUp(true, true) and not t:PrevGCD(1, e.CheapShot)) then
        if a.Cast(e.CheapShot, nil, nil, nil) then
            if p("mouseover"):GUID() ~= nil and p("mouseover"):IsSpellInRange(e.CheapShot) then
                y = 11833
                return "queue Cheap Shot MO"
            else
                o = 1833
                return "queue Cheap Shot"
            end

        end

    elseif ((not e.CheapShot:IsUsableP() or e.CheapShot:CooldownRemains() > 0 or t:PrevGCD(1, e.CheapShot)) and te) then
        HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
        a.Print("Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (he and e.KidneyShot:IsUsableP() and e.KidneyShot:CooldownRemains(BypassRecovery) <= 0) then
        if a.Cast(e.KidneyShot, nil, nil, nil) then
            if p("mouseover"):GUID() ~= nil and p("mouseover"):IsSpellInRange(e.KidneyShot) then
                y = 1408
                return "queue Kidney Shot MO"
            else
                o = 408
                return "queue Kidney Shot"
            end

        end

    elseif (t:PrevGCD(1, e.KidneyShot) and he) then
        HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
        a.Print("Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (ee and e.Blind:IsUsableP() and e.Blind:CooldownRemains(BypassRecovery) <= 0) then
        if a.Cast(e.Blind, nil, nil, nil) then
            if p("mouseover"):GUID() ~= nil and p("mouseover"):IsSpellInRange(e.Blind) then
                y = 12094
                return "queue Blind MO"
            else
                o = 2094
                return "queue Blind"
            end

        end

    elseif ((not e.Blind:IsUsableP() or e.Blind:CooldownRemains() > 0) and ee) then
        HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
        a.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (J and e.Sap:IsUsableP() and e.Sap:CooldownRemains(BypassRecovery) <= 0) then
        if a.Cast(e.Sap, nil, nil, nil) then
            if p("mouseover"):GUID() ~= nil and p("mouseover"):IsSpellInRange(e.Sap) then
                y = 16770
                return "queue Sap MO"
            else
                o = 6770
                return "queue Sap"
            end

        end

    elseif ((not e.Sap:IsUsableP() or e.Sap:CooldownRemains() > 0) and J) then
        HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
        a.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (X and e.ShurikenTornado:IsUsableP() and e.ShurikenTornado:CooldownRemains(BypassRecovery) <= 0) then
        if a.Cast(e.ShurikenTornado, nil, nil, nil) then
            o = 277925
            return "queue Shuriken Tornado"
        end

    elseif ((not e.ShurikenTornado:IsUsableP() or e.ShurikenTornado:CooldownRemains() > 0) and X) then
        HeroRotationCharDB.Toggles[26] = not HeroRotationCharDB.Toggles[26]
        a.Print("Shuriken Tornado Queue is now " .. (HeroRotationCharDB.Toggles[26] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (oe and e.Feint:IsUsableP() and e.Feint:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if a.Cast(e.Feint, nil, nil, nil) then
            o = 202
            return "queue Shuriken Tornado"
        end

    elseif ((not e.Feint:IsUsableP() or e.Feint:CooldownRemains() > 0 or not t:AffectingCombat()) and oe) then
        HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27]
        a.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (ne and e.Flagellation:IsUsableP() and e.Flagellation:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if a.Cast(e.Flagellation, nil, nil, nil) then
            o = 323654
            return "queue Flagellation Queue"
        end

    elseif ((not e.Flagellation:IsUsableP() or e.Flagellation:CooldownRemains() > 0 or not t:AffectingCombat()) and ne) then
        HeroRotationCharDB.Toggles[28] = not HeroRotationCharDB.Toggles[28]
        a.Print("Flagellation Queue is now " .. (HeroRotationCharDB.Toggles[28] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if (ie) then
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

        elseif (((e.ArcaneTorrent:IsAvailable() and (not e.ArcaneTorrent:IsUsableP() or e.ArcaneTorrent:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.LightsJudgment:IsAvailable() and (not e.LightsJudgment:IsUsableP() or e.LightsJudgment:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BagofTricks:IsAvailable() and (not e.BagofTricks:IsUsableP() or e.BagofTricks:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BloodFury:IsAvailable() and (not e.BloodFury:IsUsableP() or e.BloodFury:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Berserking:IsAvailable() and (not e.Berserking:IsUsableP() or e.Berserking:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Fireblood:IsAvailable() and (not e.Fireblood:IsUsableP() or e.Fireblood:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.AncestralCall:IsAvailable() and (not e.AncestralCall:IsUsableP() or e.AncestralCall:CooldownRemains() > 0 or not t:AffectingCombat()))) and ie) then
            HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30]
            a.Print("Arcane Torrent Queue is now " .. (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

    end

    if t:BuffUp(e.ShurikenTornado) and h < r.CPMaxSpend() then
        local a = r.TimeToNextTornado()
        if a <= 1 or E(t:GCD() - a) < .25 then
            local e = s + f(t:BuffUp(e.ShadowBlades))
            h = x(h + e, r.CPMaxSpend())
            u = k(u - e, 0)
            d = h
        end

    end

    ue = (4 + d * 4) * .3
    C = e.Eviscerate:Damage() * i.Subtlety.EviscerateDMGOffset
    l = r.CrimsonVial()
    if l then
        return l
    end

    l = r.Feint()
    if l then
        return l
    end

    l = r.Evasion()
    if l then
        return l
    end

    if t:HealthPercentage() < i.Commons.PhialHP and c.PhialofSerenity:IsReady() and c.PhialofSerenity:CooldownRemains() <= 0 then
        if a.Cast(c.PhialofSerenity, nil) then
            o = 55
            return "PhialofSerenity HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealthstoneHP and c.Healthstone:IsReady() and c.Healthstone:CooldownRemains() <= 0 then
        if a.Cast(c.Healthstone, nil) then
            o = 40
            return "Healthstone HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealPotHP and c.CosmicHealPot:IsReady() and c.CosmicHealPot:CooldownRemains() <= 0 then
        if a.Cast(c.CosmicHealPot, nil) then
            o = 45
            return "CosmicHealPot HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealPotHP and c.HealPot:IsReady() and not c.CosmicHealPot:IsReady() and c.HealPot:CooldownRemains() <= 0 then
        if a.Cast(c.HealPot, nil) then
            o = 41
            return "HealPot HP"
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.Backstab:IsCastable() and p("mouseover"):IsInMeleeRange(8) then
            if a.Cast(e.Backstab, nil) then
                y = 153
                return "explosive MO SWD"
            end

        end

        if e.ShurikenToss:IsCastable() and p("mouseover"):IsInMeleeRange(40) and not p("mouseover"):IsInMeleeRange(8) then
            if a.Cast(e.ShurikenToss, nil) then
                y = 1114014
                return "explosive MO SWD"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.Backstab:IsCastable() and n:IsInMeleeRange(8) then
            if a.Cast(e.Backstab, nil) then
                o = 53
                return "explosive  SWD"
            end

        end

        if e.ShurikenToss:IsCastable() and n:IsInMeleeRange(40) and not n:IsInMeleeRange(8) then
            if a.Cast(e.ShurikenToss, nil) then
                o = 114014
                return "explosive MO SWD"
            end

        end

    end

    xe = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 321220, 158337 }
    if UnitExists("target") and e.Shiv:IsReady() and not _e then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
            for t = 0, 40 do
                local t, t, t, t, t, t, t, t, t, i = UnitBuff("target", t)
                for n, t in Z(xe) do
                    if t == i then
                        if a.Cast(e.Shiv, nil) then
                            o = 5938
                            return "Shiv Enrage"
                        end

                    end

                end

            end

        end

    end

    local y = t:AffectingCombat() and 180 or 900
    local c
            if m(8679):IsAvailable() and i.Commons.LethalPoison == "Wound Poison" then
        c = t:BuffRemains(m(8679))
        if c < y and not t:IsCasting(m(8679)) then
            if a.Cast(m(8679)) then
                o = 203
                return "Wound Poison Refresh"
            end

        end

    elseif m(2823):IsAvailable() and i.Commons.LethalPoison == "Deadly Poison" then
        c = t:BuffRemains(m(2823))
        if c < y and not t:IsCasting(m(2823)) then
            if a.Cast(m(2823)) then
                o = 204
                return "Deadly Poison Refresh"
            end

        end

    elseif m(315584):IsAvailable() and i.Commons.LethalPoison == "Instant Poison" then
        c = t:BuffRemains(m(315584))
        if c < y and not t:IsCasting(m(315584)) then
            if a.Cast(m(315584)) then
                o = 205
                return "Instant Poison Refresh"
            end

        end

    end

    c = t:BuffRemains(m(3408))
        if m(3408):IsAvailable() and i.Commons.NonLethalPoison == "Crippling Poison" then
        if c < y and not t:IsCasting(m(3408)) then
            if a.Cast(m(3408)) then
                o = 206
                return "Crippling Poison Refresh"
            end

        end

    elseif m(5761):IsAvailable() and i.Commons.NonLethalPoison == "Numbing Poison" then
        c = t:BuffRemains(m(5761))
        if c < y and not t:IsCasting(NumbingPoison) then
            if a.Cast(m(5761)) then
                o = 204
                return "Numbing Poison Refresh"
            end

        end

    end

    if t:IsChanneling(m(324631)) then
        if a.Cast(e.PoolEnergy, nil, nil, nil) then
            o = 99999
            return "channeling Fleashcraft"
        end

    end

    if not t:AffectingCombat() and not t:IsDeadOrGhost() then
        if not t:BuffUp(e.ShadowDanceBuff) and not t:BuffUp(H) then
            l = r.Stealth(D)
            if l then
                return l
            end

        end

    end

    r.MfDSniping(e.MarkedforDeath)
    if R.TargetIsValid() and ((t:AffectingCombat() and not n:DebuffUp(e.Sap)) or me or (t:BuffUp(H) or (StealthSpell and StealthSpell:ID() == e.Vanish:ID()))) then
        local m, c, y = GetSpellCooldown(57934)
        if i.Commons.AutoToT and t:AffectingCombat() then
            if (m + c - GetTime()) <= 0 and e.TricksoftheTrade:IsAvailable() and e.TricksoftheTrade:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus")) and IsItemInRange(32698, "focus") then
                if a.Cast(e.TricksoftheTrade) then
                    o = 157934
                    return "ToT Focus"
                end

            end

        end

        l = Ee()
        if l then
            return "CDs: " .. l
        end

        if t:BuffUp(e.ShurikenTornado) and h < r.CPMaxSpend() then
            local a = r.TimeToNextTornado()
            if a <= 1 or E(t:GCD() - a) < .25 then
                local e = s + f(t:BuffUp(e.ShadowBlades))
                h = x(h + e, r.CPMaxSpend())
                u = k(u - e, 0)
                d = h
            end

        end

        if (t:StealthUp(true, true) or VanishBuffCheck) then
            l = ce()
            if l then
                return "Stealthed Rotation: " .. l
            end

        end

        if t:BuffUp(e.ShurikenTornado) and h < r.CPMaxSpend() then
            local a = r.TimeToNextTornado()
            if a <= 1 or E(t:GCD() - a) < .25 then
                local e = s + f(t:BuffUp(e.ShadowBlades))
                h = x(h + e, r.CPMaxSpend())
                u = k(u - e, 0)
                d = h
            end

        end

        if e.SliceandDice:IsCastable() and s < 6 and w.FilteredFightRemains(A, ">", 6) and t:BuffRemains(e.SliceandDice) < t:GCD() and h >= 4 - (2 * (re(w.CombatTime() < 5))) then
            if e.SliceandDice:IsReady() and a.Cast(e.SliceandDice) then
                o = 5171
                return "Cast Slice and Dice (Low Duration)"
            end

        end

        local c = ve()
        if c then
            l = K()
            if l then
                return "Stealth CDs: (Priority Rotation)" .. l
            end

        end

        if t:BuffUp(e.ShurikenTornado) and h < r.CPMaxSpend() then
            local a = r.TimeToNextTornado()
            if a <= 1 or E(t:GCD() - a) < .25 then
                local e = s + f(t:BuffUp(e.ShadowBlades))
                h = x(h + e, r.CPMaxSpend())
                u = k(u - e, 0)
                d = h
            end

        end

        if t:EnergyDeficitPredicted() <= we() then
            l = K()
            if l then
                return "Stealth CDs: " .. l
            end

        end

        if t:BuffUp(e.ShurikenTornado) and h < r.CPMaxSpend() then
            local a = r.TimeToNextTornado()
            if a <= 1 or E(t:GCD() - a) < .25 then
                local e = s + f(t:BuffUp(e.ShadowBlades))
                h = x(h + e, r.CPMaxSpend())
                u = k(u - e, 0)
                d = h
            end

        end

        if d >= r.CPMaxSpend() or (d >= 5 and s >= 5 and t:BuffUp(e.ShurikenTornado)) or (u <= 1 or (w.BossFilteredFightRemains("<", 1) and d >= 3) or (t:BuffUp(e.SymbolsofDeathCrit) and d >= 4)) or (s >= 4 and d >= 4) then
            l = U()
            if l then
                return "Finish: " .. l
            end

        end

        if t:BuffUp(e.ShurikenTornado) and h < r.CPMaxSpend() then
            local a = r.TimeToNextTornado()
            if a <= 1 or E(t:GCD() - a) < .25 then
                local e = s + f(t:BuffUp(e.ShadowBlades))
                h = x(h + e, r.CPMaxSpend())
                u = k(u - e, 0)
                d = h
            end

        end

        if t:EnergyDeficitPredicted() <= we() and ((d < r.CPMaxSpend() and t:BuffDown(e.ShurikenTornado)) or (d < 4 and t:BuffUp(e.ShurikenTornado))) then
            l = M()
            if l then
                return "Build: " .. l
            end

        end

        if t:BuffUp(e.ShurikenTornado) and h < r.CPMaxSpend() then
            local a = r.TimeToNextTornado()
            if a <= 1 or E(t:GCD() - a) < .25 then
                local e = s + f(t:BuffUp(e.ShadowBlades))
                h = x(h + e, r.CPMaxSpend())
                u = k(u - e, 0)
                d = h
            end

        end

        if a.CDsON() then
            if e.ArcaneTorrent:IsReady() and n:IsInMeleeRange(5) and t:EnergyDeficitPredicted() > 15 + t:EnergyRegen() and i.Commons.Enabled.Racials then
                if a.Cast(e.ArcaneTorrent, nil) then
                    o = 155145
                    return "Cast Arcane Torrent"
                end

            end

            if e.ArcanePulse:IsReady() and n:IsInMeleeRange(5) then
                if a.Cast(e.ArcanePulse, nil) then
                    o = 260364
                    return "Cast Arcane Pulse"
                end

            end

            if e.LightsJudgment:IsReady() and i.Commons.Enabled.Racials then
                if a.Cast(e.LightsJudgment, nil) then
                    o = 255647
                    return "Cast Lights Judgment"
                end

            end

            if e.BagofTricks:IsReady() and i.Commons.Enabled.Racials then
                if a.Cast(e.BagofTricks, nil) then
                    o = 312411
                    return "Cast Bag of Tricks"
                end

            end

        end

        if false and n:IsInMeleeRange(5) then
                        if type(g) == "table" and #g > 1 then
                if a.CastQueuePooling(t:EnergyTimeToX(j), unpack(g)) then
                    o = 1000
                    return "Macro pool towards " .. g[1]:Name() .. " at " .. j
                end

            elseif g:IsCastable() then
                j = k(j, g:Cost())
                if a.CastPooling(g, t:EnergyTimeToX(j)) then
                    o = 1000
                    return "Pool towards: " .. g:Name() .. " at " .. j
                end

            end

        end

        if a.Cast(e.PoolEnergy) then
            o = 1000
            return "Stealthed Pooling"
        end

    end

end

local function e()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        a.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpell()
    if o == 0 then
        return 0
    else
        return o
    end

end

function ReturnSpellMO()
    if y == 0 then
        return 0
    else
        return y
    end

end

a.SetAPL(261, b, e)

