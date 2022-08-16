local e, e = ...
local e = HeroDBC.DBC
local l = HeroLib
local e = HeroCache
local e = l.Unit
local a = e.Player
local t = e.Target
local e = l.Spell
local o = l.MultiSpell
local n = l.Item
local c = l.Utils.BoolToInt
local o = l.Utils.IntToBool
local s = HeroRotation
local B = s.AoEON
local G = s.CDsON
local o = s.Cast
local u = s.CastPooling
local _ = s.CastLeftNameplate
local y = pairs
local D = math.floor
local w = s.Commons.Everyone
local h = s.Commons.Rogue
local i = { General = s.GUISettings.General, Commons = s.GUISettings.APL.Rogue.Commons, Commons2 = s.GUISettings.APL.Rogue.Commons2, Assassination = s.GUISettings.APL.Rogue.Assassination }
local e = e.Rogue.Assassination
local n = n.Rogue.Assassination
local W = {  }
local R, m, r, v
local n
local U
local S, x = 2 / a:SpellHaste(), 1 / a:SpellHaste()
local d, g
local I, Y, q, N, H
local j
local F, f, k, O
local A = a:HasLegendaryEquipped(118)
local T = a:HasLegendaryEquipped(129)
local z = a:HasLegendaryEquipped(119)
local p = a:HasLegendaryEquipped(121)
local M = a:HasLegendaryEquipped(117)
local b = p and .55 or 1.
l:RegisterForEvent(function()
    A = a:HasLegendaryEquipped(118)
    T = a:HasLegendaryEquipped(129)
    z = a:HasLegendaryEquipped(119)
    p = a:HasLegendaryEquipped(121)
    M = a:HasLegendaryEquipped(117)
    b = p and .55 or 1.
end, "PLAYER_EQUIPMENT_CHANGED")
local V = { { e.Blind, "Cast Blind (Interrupt)", function()
    return true
end }, { e.KidneyShot, "Cast Kidney Shot (Interrupt)", function()
    return d > 0
end } }
e.Envenom:RegisterDamageFormula(function()
    return a:AttackPowerDamageMod() * d * .16 * 1.51 * (t:DebuffUp(e.ShivDebuff) and 1.3 or 1) * (e.DeeperStratagem:IsAvailable() and 1.05 or 1) * (1 + a:MasteryPct() / 100) * (1 + a:VersatilityDmgPct() / 100)
end)
e.Mutilate:RegisterDamageFormula(function()
    return (a:AttackPowerDamageMod() + a:AttackPowerDamageMod(true)) * .35 * 1.51 * (1 + a:VersatilityDmgPct() / 100)
end)
local function p()
    return e.Nightstalker:IsAvailable() and a:StealthUp(true, false, true) and 1.5 or 1
end

local function E()
    return e.Subterfuge:IsAvailable() and a:StealthUp(true, false, true) and 2 or 1
end

e.Garrote:RegisterPMultiplier(p, E)
e.Rupture:RegisterPMultiplier(p)
local function K()
                if r < 2 then
        return false
    elseif i.Commons.UsePriorityRotation == "Always" then
        return true
    elseif i.Commons.UsePriorityRotation == "On Bosses" and t:IsInBossList() then
        return true
    elseif i.Commons.UsePriorityRotation == "Auto" then
        if a:InstanceDifficulty() == 16 and t:NPCID() == 138967 then
            return true
        end

    end

    return false
end

local function C(o, n, h, r)
    local e, a = nil, h
    local s = t:GUID()
    for i, t in y(r) do
        if t:GUID() ~= s and w.UnitIsCycleValid(t, a, -t:DebuffRemains(o)) and n(t) then
            e, a = t, t:TimeToDie()
        end

    end

        if e then
        _(e, o)
    elseif i.Commons.RangedMultiDoT then
        e, a = nil, h
        for i, t in y(m) do
            if t:GUID() ~= s and w.UnitIsCycleValid(t, a, -t:DebuffRemains(o)) and n(t) then
                e, a = t, t:TimeToDie()
            end

        end

        if e then
            _(e, o)
        end

    end

end

local function Q(n, r, d)
    local s = r(t)
    if n == "first" and s ~= 0 then
        return t
    end

    local e, a = nil, 0
    local function h(t)
        for t, o in y(t) do
            local t = r(o)
                                    if not e and n == "first" then
                if t ~= 0 then
                    e, a = o, t
                end

            elseif n == "min" then
                if not e or t < a then
                    e, a = o, t
                end

            elseif n == "max" then
                if not e or t > a then
                    e, a = o, t
                end

            end

            if e and t == a and o:TimeToDie() > e:TimeToDie() then
                e, a = o, t
            end

        end

    end

    h(v)
    if i.Commons.RangedMultiDoT then
        h(m)
    end

    if e and a == s and d(t) then
        return t
    end

    if e and d(e) then
        return e
    end

    return nil
end

local function p()
    local t = h.MasterAssassinsMarkRemains()
        if t > 0 then
        return t
    elseif a:BuffRemains(e.MasterAssassinBuff) < 0 then
        return a:GCDRemains() + 3
    else
        return a:BuffRemains(e.MasterAssassinBuff)
    end

end

local function E(o, i, a)
    local e = t:TimeToDie()
        if not l.BossFightRemainsIsNotValid() then
        e = l.BossFightRemains()
    elseif e < a then
        return false
    end

    if D((e - a) / o) > D((e - a - i) / o) then
        return true
    end

    return false
end

local function J(t)
    if t:DebuffUp(e.SerratedBoneSpikeDebuff) then
        return 1000000
    end

    return t:TimeToDie()
end

local function P(t)
    return not t:DebuffUp(e.SerratedBoneSpikeDebuff)
end

local function L()
    local e = a:GetUseableTrinkets(W)
    if e then
        if o(e, nil, i.Commons.TrinketDisplayStyle) then
            return "Generic use_items for " .. e:Name()
        end

    end

    return false
end

local function W()
    if e.BloodFury:IsCastable() then
        if o(e.BloodFury, i.Commons.OffGCDasOffGCD.Racials) then
            return "Cast Blood Fury"
        end

    end

    if e.Berserking:IsCastable() then
        if o(e.Berserking, i.Commons.OffGCDasOffGCD.Racials) then
            return "Cast Berserking"
        end

    end

    if e.Fireblood:IsCastable() then
        if o(e.Fireblood, i.Commons.OffGCDasOffGCD.Racials) then
            return "Cast Fireblood"
        end

    end

    if e.AncestralCall:IsCastable() then
        if o(e.AncestralCall, i.Commons.OffGCDasOffGCD.Racials) then
            return "Cast Ancestral Call"
        end

    end

    return false
end

local function D()
    if not e.Vanish:IsCastable() or a:IsTanking(t) then
        return 
    end

    if e.Nightstalker:IsAvailable() then
        if (not T and d >= h.CPMaxSpend()) or (T and d < 2) then
            if e.Exsanguinate:IsAvailable() and e.Exsanguinate:CooldownRemains() < 1 then
                if o(e.Vanish, i.Commons.OffGCDasOffGCD.Vanish) then
                    return "Cast Vanish (Exsanguinate)"
                end

            end

            if not e.Exsanguinate:IsAvailable() and t:DebuffUp(e.Vendetta) then
                if o(e.Vanish, i.Commons.OffGCDasOffGCD.Vanish) then
                    return "Cast Vanish (Nightstalker)"
                end

            end

        end

    end

    if e.Subterfuge:IsAvailable() and e.Garrote:CooldownUp() and (t:DebuffRefreshable(e.Garrote) or (t:DebuffUp(e.Vendetta) and t:PMultiplier(e.Garrote) <= 1)) and g >= math.min(r, 4) then
        if i.Commons.ShowPooling and a:EnergyPredicted() < 45 then
            if o(e.PoolEnergy) then
                return "Pool for Vanish (Subterfuge)"
            end

        end

        if o(e.Vanish, i.Commons.OffGCDasOffGCD.Vanish) then
            return "Cast Vanish (Subterfuge)"
        end

    end

    if (e.MasterAssassin:IsAvailable() or M) and e.Vendetta:AnyDebuffUp() then
        local t = e.Vendetta:MaxDebuffRemainsUnit()
        if not t:DebuffRefreshable(e.Rupture, I) and t:DebuffRemains(e.Garrote) > 3 and (t:DebuffUp(e.ShivDebuff) or t:DebuffRemains(e.Vendetta) < 4 or e.Sepsis:AnyDebuffUp()) and e.Sepsis:MaxDebuffRemains() < 3 then
            if o(e.Vanish, i.Commons.OffGCDasOffGCD.Vanish) then
                return "Cast Vanish (Master Assassin)"
            end

        end

    end

end

local function T()
    if e.MarkedforDeath:IsCastable() then
        if t:FilteredTimeToDie("<", a:ComboPointsDeficit() * 1.5) then
            if o(e.MarkedforDeath, i.Commons.OffGCDasOffGCD.MarkedforDeath) then
                return "Cast Marked for Death"
            end

        end

        if g >= h.CPMaxSpend() then
                        if not i.Commons.STMfDAsDPSCD then
                s.CastSuggested(e.MarkedforDeath)
            elseif s.CDsON() then
                if o(e.MarkedforDeath, i.Commons.OffGCDasOffGCD.MarkedforDeath) then
                    return "Cast Marked for Death"
                end

            end

        end

    end

    if not t:IsInMeleeRange(10) or not s.CDsON() then
        return 
    end

    if not a:StealthUp(true, false) then
        if e.Flagellation:IsReady() then
                        if e.Vendetta:CooldownRemains() < 3 and d >= 4 and (t:FilteredTimeToDie(">", 10) or t:TimeToDieIsNotValid()) or t:DebuffUp(e.Vendetta) or l.BossFilteredFightRemains("<=", 24) then
                if o(e.Flagellation, nil, i.Commons.CovenantDisplayStyle) then
                    return "Cast Flagellation (Sync)"
                end

            elseif d >= 4 and E(90, e.Vendetta:CooldownRemains() * b, 24) then
                if o(e.Flagellation, nil, i.Commons.CovenantDisplayStyle) then
                    return "Cast Flagellation (Burn)"
                end

            end

        end

        if e.Sepsis:IsReady() then
                        if e.Vendetta:CooldownRemains() < 1 and (t:FilteredTimeToDie(">", 10) or t:TimeToDieIsNotValid()) or t:DebuffUp(e.Vendetta) or l.BossFilteredFightRemains("<=", 10) then
                if o(e.Sepsis, nil, i.Commons.CovenantDisplayStyle) then
                    return "Cast Sepsis (Sync)"
                end

            elseif E(90, e.Vendetta:CooldownRemains() * b, 10) then
                if o(e.Sepsis, nil, i.Commons.CovenantDisplayStyle) then
                    return "Cast Sepsis (Burn)"
                end

            end

        end

        if e.Vendetta:IsCastable() and t:DebuffUp(e.Rupture) and not t:DebuffUp(e.Vendetta) then
            local s = not e.Nightstalker:IsAvailable() or not e.Exsanguinate:IsAvailable() or e.Exsanguinate:CooldownRemains() < 5 - 2 * c(e.DeeperStratagem:IsAvailable())
            local n = a:Covenant()
            if s and (l.BossFilteredFightRemains("<", 20) or n == "Necrolord" or n == "Kyrian" or n == nil or (n == "Venthyr" and (E(120 * b, e.Flagellation:CooldownRemains(), 20) or a:BuffUp(e.Flagellation) or a:BuffUp(e.FlagellationBuff) or t:DebuffUp(e.Flagellation))) or (n == "Night Fae" and (E(120 * b, e.Sepsis:CooldownRemains(), 20) or t:DebuffUp(e.Sepsis)))) then
                if o(e.Vendetta, i.Assassination.OffGCDasOffGCD.Vendetta) then
                    return "Cast Vendetta"
                end

            end

        end

        if e.Exsanguinate:IsCastable() and (not t:DebuffRefreshable(e.Garrote) and t:DebuffRemains(e.Rupture) > 4 + 4 * h.CPMaxSpend() or t:FilteredTimeToDie("<", t:DebuffRemains(e.Rupture) * .5)) and (t:FilteredTimeToDie(">", 4) or t:TimeToDieIsNotValid()) and h.CanDoTUnit(t, q) then
            if o(e.Exsanguinate) then
                return "Cast Exsanguinate"
            end

        end

    end

    if e.Shiv:IsCastable() and (t:DebuffUp(e.Rupture) and (e.Sepsis:CooldownRemains() > 15 or e.Vendetta:CooldownRemains() > 12) or t:DebuffUp(e.Sepsis)) then
        if o(e.Shiv, i.Assassination.GCDasOffGCD.Shiv) then
            n = "Cast Shiv"
        end

    end

    if t:DebuffUp(e.Vendetta) and (not n or i.Commons.OffGCDasOffGCD.Racials) then
        if n then
            W()
        else
            n = W()
        end

    end

    if not a:StealthUp(true, true) and p() <= 0 then
        if n then
            D()
        else
            n = D()
        end

    end

    if i.Commons.UseTrinkets and (not n or i.Commons.TrinketDisplayStyle ~= "Main Icon") then
        if n then
            L()
        else
            n = L()
        end

    end

    return n
end

local function b()
    if e.CrimsonTempest:IsReady() and e.Nightstalker:IsAvailable() and r >= 3 and d >= 4 and (t:FilteredTimeToDie(">", 6, -t:DebuffRemains(e.CrimsonTempest)) or t:TimeToDieIsNotValid()) then
        if o(e.CrimsonTempest) then
            return "Cast Crimson Tempest (Nightstalker)"
        end

    end

    if e.Rupture:IsReady() and e.Nightstalker:IsAvailable() and d >= 4 and (t:FilteredTimeToDie(">", 6, -t:DebuffRemains(e.Rupture)) or t:TimeToDieIsNotValid()) then
        if o(e.Rupture, nil, nil, not t:IsInMeleeRange(5)) then
            return "Cast Rupture (Nightstalker)"
        end

    end

    if e.Garrote:IsCastable() and e.Subterfuge:IsAvailable() then
        local function i(t)
            return t:DebuffRemains(e.Garrote)
        end

        local function o(t)
            return (t:DebuffRemains(e.Garrote) < 12 or t:PMultiplier(e.Garrote) <= 1) and (t:FilteredTimeToDie(">", 2, -t:DebuffRemains(e.Garrote)) or t:TimeToDieIsNotValid()) and h.CanDoTUnit(t, N)
        end

        if s.AoEON() then
            local a = Q("min", i, o)
            if a and a:GUID() ~= t:GUID() then
                _(a, e.Garrote)
            end

        end

        if o(t) then
            if u(e.Garrote, nil, not t:IsInMeleeRange(5)) then
                return "Cast Garrote (Subterfuge)"
            end

        end

        if e.Exsanguinate:IsAvailable() and r == 1 and a:BuffRemains(e.SubterfugeBuff) < 1.3 then
            if u(e.Garrote, nil, not t:IsInMeleeRange(5)) then
                return "Pool for Garrote (Exsanguinate Refresh)"
            end

        end

    end

    if e.Subterfuge:IsAvailable() and e.Mutilate:IsCastable() and d <= 3 then
        if u(e.Mutilate) then
            return "Cast Mutilate (Subterfurge)"
        end

    end

end

local function E()
    local n, l, i = false, false, false
    if j then
        n = r > 3 and (t:DebuffRemains(e.Garrote) < 6 or k)
        l = (t:DebuffUp(e.ShivDebuff) and r > 2) or k
    end

    i = t:DebuffUp(e.Vendetta) and (t:DebuffUp(e.ShivDebuff) or p() > 0) and t:DebuffRemains(e.Rupture) > 2
    if s.CDsON() and e.Exsanguinate:IsAvailable() then
        if e.Garrote:IsCastable() and t:IsInMeleeRange(5) and r == 1 and e.Exsanguinate:CooldownRemains() < 2 and not h.Exsanguinated(t, e.Garrote) and t:PMultiplier(e.Garrote) <= 1 and t:FilteredTimeToDie(">", t:DebuffRemains(e.Garrote) * .5) then
            if u(e.Garrote) then
                return "Cast Garrote (Pre-Exsanguinate)"
            end

        end

        if e.Rupture:IsReady() and t:IsInMeleeRange(5) and d > 0 and (d >= h.CPMaxSpend() and e.Exsanguinate:CooldownRemains() < 1 and t:FilteredTimeToDie(">", t:DebuffRemains(e.Rupture) * .5)) then
            if o(e.Rupture) then
                return "Cast Rupture (Pre-Exsanguinate)"
            end

        end

    end

    if e.Garrote:IsCastable() and g >= 1 then
        local function a(t)
            return t:DebuffRefreshable(e.Garrote) and (t:PMultiplier(e.Garrote) <= 1 or (r >= 3 and t:DebuffRemains(e.Garrote) <= (h.Exsanguinated(t, e.Garrote) and x or S))) and (not h.Exsanguinated(t, e.Garrote) or t:DebuffRemains(e.Garrote) <= 1.5 and r >= 3) and p() <= 0
        end

        if a(t) and h.CanDoTUnit(t, N) and (t:FilteredTimeToDie(">", 4, -t:DebuffRemains(e.Garrote)) or t:TimeToDieIsNotValid()) then
            if u(e.Garrote, nil, not t:IsInMeleeRange(5)) then
                return "Pool for Garrote (ST)"
            end

        end

        if s.AoEON() and not n then
            C(e.Garrote, a, 12, v)
        end

    end

    if s.AoEON() and e.CrimsonTempest:IsReady() and r >= 2 and d >= 4 and f > 20 and (not e.Vendetta:CooldownUp() or t:DebuffUp(e.Rupture)) then
        for a, t in y(m) do
            if t:DebuffRemains(e.CrimsonTempest) < 2 + 3 * c(r >= 4) then
                if o(e.CrimsonTempest) then
                    return "Cast Crimson Tempest (AoE)"
                end

            end

        end

    end

    if not i and e.Rupture:IsReady() and d >= 4 then
        H = 4 + c(A) * 5 + c(z) * 5 + c(k) * 6
        local function a(t)
            return t:DebuffRefreshable(e.Rupture, I) and (t:PMultiplier(e.Rupture) <= 1 or t:DebuffRemains(e.Rupture) <= (h.Exsanguinated(t, e.Rupture) and x or S) and r >= 3) and (not h.Exsanguinated(t, e.Rupture) or t:DebuffRemains(e.Rupture) <= x * 2 and r >= 3) and (t:FilteredTimeToDie(">", H, -t:DebuffRemains(e.Rupture)) or t:TimeToDieIsNotValid())
        end

        if a(t) and h.CanDoTUnit(t, q) then
            if o(e.Rupture, nil, nil, not t:IsInMeleeRange(5)) then
                return "Cast Rupture (Refresh)"
            end

        end

        if s.AoEON() and not l then
            C(e.Rupture, a, H, v)
        end

    end

    if s.AoEON() and e.CrimsonTempest:IsReady() and r >= 2 and d >= 4 then
        for a, t in y(m) do
            if t:DebuffRemains(e.CrimsonTempest) < 2 + 3 * c(r >= 4) then
                if o(e.CrimsonTempest) then
                    return "Cast Crimson Tempest (AoE Fallback)"
                end

            end

        end

    end

    if e.CrimsonTempest:IsReady() and t:IsInMeleeRange(10) and r == 1 and not A and p() <= 0 and d >= (h.CPMaxSpend() - 1) and t:DebuffRefreshable(e.CrimsonTempest, Y) and not h.Exsanguinated(t, e.CrimsonTempest) and not t:DebuffUp(e.ShivDebuff) and a:EnergyDeficitPredicted() <= 25 + f and (t:FilteredTimeToDie(">", 4, -t:DebuffRemains(e.CrimsonTempest)) or t:TimeToDieIsNotValid()) and h.CanDoTUnit(t, q) then
        if o(e.CrimsonTempest) then
            return "Cast Crimson Tempest (ST)"
        end

    end

    return false
end

local function A()
    if e.Envenom:IsReady() and d >= 4 + c(e.DeeperStratagem:IsAvailable()) and (t:DebuffUp(e.Vendetta) or t:DebuffUp(e.ShivDebuff) or t:DebuffUp(e.Flagellation) or a:BuffUp(e.Flagellation) or a:BuffUp(e.MarrowedGemstoneBuff) or a:EnergyDeficitPredicted() <= (25 + f) or not O) and (not e.Exsanguinate:IsAvailable() or e.Exsanguinate:CooldownRemains() > 2 or not s.CDsON()) then
        if o(e.Envenom, nil, nil, not t:IsInMeleeRange(5)) then
            return "Cast Envenom"
        end

    end

    if not (g > 1 or a:EnergyDeficitPredicted() <= 25 + f or not O) then
        return false
    end

    if e.SerratedBoneSpike:IsReady() then
        if not t:DebuffUp(e.SerratedBoneSpikeDebuff) then
            if o(e.SerratedBoneSpike, nil, i.Commons.CovenantDisplayStyle, not t:IsInMeleeRange(10)) then
                return "Cast Serrated Bone Spike"
            end

        else
            if s.AoEON() then
                if w.CastTargetIf(e.SerratedBoneSpike, R, "min", J, P) then
                    return "Cast Serrated Bone (AoE)"
                end

            end

            if p() < .8 and (l.BossFightRemains() <= 5 or e.SerratedBoneSpike:ChargesFractional() >= 2.75 or (e.LeadbyExample:SoulbindEnabled() and not a:BuffUp(e.LeadbyExampleBuff) and t:DebuffUp(e.Vendetta)) or a:BuffUp(e.MarrowedGemstoneBuff)) then
                if o(e.SerratedBoneSpike, nil, i.Commons.SerratedBoneSpikeDumpDisplayStyle, not t:IsInMeleeRange(10)) then
                    return "Cast Serrated Bone Spike (Filler)"
                end

            end

        end

    end

    if e.FanofKnives:IsCastable() then
        if s.AoEON() and (a:BuffStack(e.HiddenBladesBuff) >= 19 and r >= 1 or (not j and r >= 4 + c(z and e.CrimsonTempest:IsAvailable()) + c(a:StealthUp(true, false)))) then
            if u(e.FanofKnives) then
                return "Cast Fan of Knives"
            end

        end

        if s.AoEON() and a:BuffUp(e.DeadlyPoison) and r >= 3 then
            for a, t in y(m) do
                if not t:DebuffUp(e.DeadlyPoisonDebuff, true) and (not j or t:DebuffUp(e.Garrote) or t:DebuffUp(e.Rupture)) then
                    if u(e.FanofKnives) then
                        return "Cast Fan of Knives (DP Refresh)"
                    end

                end

            end

        end

    end

    if G() and e.EchoingReprimand:IsReady() and e.Vendetta:CooldownRemains() > 10 then
        if o(e.EchoingReprimand, nil, i.Commons.CovenantDisplayStyle, not t:IsInMeleeRange(5)) then
            return "Cast Echoing Reprimand"
        end

    end

    if e.Ambush:IsCastable() and (p() <= 0 and not z and a:StealthUp(true, true) or a:BuffUp(e.BlindsideBuff)) then
        if u(e.Ambush, nil, not t:IsInMeleeRange(5)) then
            return "Cast Ambush"
        end

    end

    if e.Mutilate:IsCastable() and r == 2 and t:DebuffUp(e.DeadlyPoisonDebuff, true) then
        local a = t:GUID()
        for o, t in y(v) do
            if t:GUID() ~= a and (t:DebuffUp(e.Garrote) or t:DebuffUp(e.Rupture)) and not t:DebuffUp(e.DeadlyPoisonDebuff, true) then
                _(t, e.Mutilate)
                break
            end

        end

    end

    if e.Mutilate:IsCastable() then
        if u(e.Mutilate, nil, not t:IsInMeleeRange(5)) then
            return "Cast Mutilate"
        end

    end

    return false
end

local function l()
    if B() then
        R = a:GetEnemiesInRange(30)
        m = a:GetEnemiesInMeleeRange(10)
        r = #m
        v = a:GetEnemiesInMeleeRange(5)
    else
        R = {  }
        m = {  }
        r = 1
        v = {  }
    end

    U = e.Subterfuge:IsAvailable() and e.Stealth2 or e.Stealth
    S, x = 2 / a:SpellHaste(), 1 / a:SpellHaste()
    d = h.EffectiveComboPoints(a:ComboPoints())
    g = a:ComboPointsMax() - d
    I = (4 + d * 4) * .3
    Y = (2 + d * 2) * .3
    q = e.Envenom:Damage() * i.Assassination.EnvenomDMGOffset
    N = e.Mutilate:Damage() * i.Assassination.MutilateDMGOffset
    j = K()
    n = h.CrimsonVial()
    if n then
        return n
    end

    n = h.Feint()
    if n then
        return n
    end

    h.Poisons()
    if not a:AffectingCombat() then
        if not a:BuffUp(e.VanishBuff) then
            n = h.Stealth(U)
            if n then
                return n
            end

        end

        if w.TargetIsValid() then
            if s.CDsON() then
                if e.MarkedforDeath:IsCastable() and a:ComboPointsDeficit() >= h.CPMaxSpend() and w.TargetIsValid() then
                    if o(e.MarkedforDeath, i.Commons.OffGCDasOffGCD.MarkedforDeath) then
                        return "Cast Marked for Death (OOC)"
                    end

                end

            end

        end

    end

    h.MfDSniping(e.MarkedforDeath)
    if w.TargetIsValid() then
        n = w.Interrupt(5, e.Kick, i.Commons2.OffGCDasOffGCD.Kick, V)
        if n then
            return n
        end

        F = h.PoisonedBleeds()
        f = a:EnergyRegen() + F * 8 / (2 * a:SpellHaste())
        k = f > 35
        O = r < 2
        if a:StealthUp(true, false) then
            n = b()
            if n then
                return n .. " (Stealthed)"
            end

        end

        if not e.MasterAssassin:IsAvailable() or t:DebuffUp(e.Garrote) then
            n = T()
            if n then
                return n
            end

        end

                if not a:BuffUp(e.SliceandDice) then
            if e.SliceandDice:IsReady() and d >= 1 then
                if o(e.SliceandDice) then
                    return "Cast Slice and Dice"
                end

            end

        elseif t:IsInMeleeRange(10) then
            if e.Envenom:IsReady() and a:BuffRemains(e.SliceandDice) < 5 and d >= 4 then
                if o(e.Envenom, nil, nil, not t:IsInMeleeRange(5)) then
                    return "Cast Envenom (CttC)"
                end

            end

        else
            if e.PoisonedKnife:IsCastable() and t:IsInRange(30) and not a:StealthUp(true, true) and r == 0 and a:EnergyTimeToMax() <= a:GCD() * 1.5 then
                if o(e.PoisonedKnife) then
                    return "Cast Poisoned Knife"
                end

            end

        end

        n = E()
        if n then
            return n
        end

        n = A()
        if n then
            return n
        end

        if s.CDsON() then
            if e.ArcaneTorrent:IsCastable() and t:IsInMeleeRange(5) and a:EnergyDeficitPredicted() > 15 + f then
                if o(e.ArcaneTorrent, i.Commons.GCDasOffGCD.Racials) then
                    return "Cast Arcane Torrent"
                end

            end

            if e.ArcanePulse:IsCastable() and t:IsInMeleeRange(5) then
                if o(e.ArcanePulse, i.Commons.GCDasOffGCD.Racials) then
                    return "Cast Arcane Pulse"
                end

            end

            if e.LightsJudgment:IsCastable() and t:IsInMeleeRange(5) then
                if o(e.LightsJudgment, i.Commons.GCDasOffGCD.Racials) then
                    return "Cast Lights Judgment"
                end

            end

            if e.BagofTricks:IsCastable() and t:IsInMeleeRange(5) then
                if o(e.BagofTricks, i.Commons.GCDasOffGCD.Racials) then
                    return "Cast Bag of Tricks"
                end

            end

        end

        if e.Mutilate:IsCastable() and t:IsInMeleeRange(10) then
            if o(e.PoolEnergy) then
                return "Normal Pooling"
            end

        end

    end

end

local function t()
    e.Vendetta:RegisterAuraTracking()
    e.Sepsis:RegisterAuraTracking()
end

s.SetAPL(259, l, t)

