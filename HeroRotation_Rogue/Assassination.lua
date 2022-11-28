local e, e = ...
local e = HeroDBC.DBC
local w = HeroLib
local e = HeroCache
local _ = w.Unit
local a = _.Player
local t = _.Target
local l = w.Spell
local e = w.MultiSpell
local p = w.Item
local e = w.Utils.num
local e = w.Utils.IntToBool
local r = HeroRotation
local ze = r.AoEON
local B = r.CDsON
local Ee = HeroRotationCharDB.Toggles[4]
local Ae = HeroRotationCharDB.Toggles[5]
local Z = HeroRotationCharDB.Toggles[6]
local O = HeroRotationCharDB.Toggles[12]
local ae = not HeroRotationCharDB.Toggles[15]
local Te = HeroRotationCharDB.Toggles[20]
local xe = HeroRotationCharDB.Toggles[21]
local _e = HeroRotationCharDB.Toggles[22]
local je = HeroRotationCharDB.Toggles[23]
local be = HeroRotationCharDB.Toggles[24]
local ve = HeroRotationCharDB.Toggles[25]
local pe = HeroRotationCharDB.Toggles[26]
local ge = HeroRotationCharDB.Toggles[27]
local Ie = HeroRotationCharDB.Toggles[28]
local ke = HeroRotationCharDB.Toggles[29]
local qe = HeroRotationCharDB.Toggles[30]
local Oe = HeroRotationCharDB.Toggles[54]
local n = r.Cast
local A = r.CastPooling
local de = pairs
local W = math.floor
local j = r.Commons.Everyone
local i = r.Commons.Rogue
local h = { General = r.GUISettings.General, Commons = r.GUISettings.APL.Rogue.Commons, Assassination = r.GUISettings.APL.Rogue.Assassination }
local e = l.Rogue.Assassination
local k = p.Rogue.Assassination
local o = {  }
local ne, q, s, Q
local d
local o = i.ReturnSpell()
local c = i.ReturnSpellMO()
local he
local g, m = 2 / a:SpellHaste(), 1 / a:SpellHaste()
local f, u
local S, J, F, ee, H, y, M
local N
local re, I, D, x, y
local R
local te
local K = 11111
local y = 11111
local E = a:GetEquipment()
local z = a:CovenantID()
local ue, T, P, ce = (z == 1), (z == 2), (z == 3), (z == 4)
local Y = a:HasLegendaryEquipped(118)
local ie = a:HasLegendaryEquipped(129)
local V = a:HasLegendaryEquipped(119)
local U = a:HasLegendaryEquipped(121)
local G = a:HasLegendaryEquipped(117)
local C = a:HasLegendaryEquipped(229) or (a:HasUnity() and T)
local oe = U and .55 or 1.
local le = C and .56 or 1.
local se, L = a:HasTier(28, 2), a:HasTier(28, 4)
local b = E[13] and p(E[13]) or p(0)
local v = E[14] and p(E[14]) or p(0)
local function X()
        if b:TrinketHasStatAnyDps() and (not v:TrinketHasStatAnyDps() or b:Cooldown() >= v:Cooldown()) or b:ID() == k.InscrutableQuantumDevice:ID() or T and not v:TrinketHasStatAnyDps() and b:ID() == k.ShadowgraspTotem:ID() then
        TrinketSyncSlot = 1
    elseif v:TrinketHasStatAnyDps() and (not b:TrinketHasStatAnyDps() or v:Cooldown() > b:Cooldown()) or v:ID() == k.InscrutableQuantumDevice:ID() or T and not b:TrinketHasStatAnyDps() and v:ID() == k.ShadowgraspTotem:ID() then
        TrinketSyncSlot = 2
    else
        TrinketSyncSlot = 0
    end

    UseTrinket1PreVendetta = L and (b:ID() == k.InscrutableQuantumDevice:ID() or b:ID() == k.OverchargedAnimaBattery:ID())
    UseTrinket2PreVendetta = L and (v:ID() == k.InscrutableQuantumDevice:ID() or v:ID() == k.OverchargedAnimaBattery:ID())
end

X()
w:RegisterForEvent(function()
    E = a:GetEquipment()
    z = a:CovenantID()
    ue, T, P, ce = (z == 1), (z == 2), (z == 3), (z == 4)
    Y = a:HasLegendaryEquipped(118)
    ie = a:HasLegendaryEquipped(129)
    V = a:HasLegendaryEquipped(119)
    U = a:HasLegendaryEquipped(121)
    G = a:HasLegendaryEquipped(117)
    C = a:HasLegendaryEquipped(229) or (a:HasUnity() and T)
    oe = U and .55 or 1.
    le = C and .56 or 1.
    se, L = a:HasTier(28, 2), a:HasTier(28, 4)
    b = E[13] and p(E[13]) or p(0)
    v = E[14] and p(E[14]) or p(0)
    X()
end, "PLAYER_EQUIPMENT_CHANGED", "COVENANT_CHOSEN")
w:RegisterForEvent(function()
    K = 11111
    y = 11111
end, "PLAYER_REGEN_ENABLED")
local function p(t)
    if t then
        return 1
    else
        return 0
    end

end

e.Envenom:RegisterDamageFormula(function()
    return a:AttackPowerDamageMod() * f * .16 * 1.51 * (t:DebuffUp(e.ShivDebuff) and 1.3 or 1) * (e.DeeperStratagem:IsAvailable() and 1.05 or 1) * (1 + a:MasteryPct() / 100) * (1 + a:VersatilityDmgPct() / 100)
end)
e.Mutilate:RegisterDamageFormula(function()
    return (a:AttackPowerDamageMod() + a:AttackPowerDamageMod(true)) * .35 * 1.51 * (1 + a:VersatilityDmgPct() / 100)
end)
local function z()
    return e.Nightstalker:IsAvailable() and a:StealthUp(true, false, true) and 1.5 or 1
end

local function E()
    return e.Subterfuge:IsAvailable() and a:StealthUp(true, false, true) and 2 or 1
end

e.Garrote:RegisterPMultiplier(z, E)
e.Rupture:RegisterPMultiplier(z)
local function z(i, s, r)
    local n = s(t)
    if i == "first" and n ~= 0 then
        return t
    end

    local e, a = nil, 0
    local function d(t)
        for t, o in de(t) do
            local t = s(o)
                                    if not e and i == "first" then
                if t ~= 0 then
                    e, a = o, t
                end

            elseif i == "min" then
                if not e or t < a then
                    e, a = o, t
                end

            elseif i == "max" then
                if not e or t > a then
                    e, a = o, t
                end

            end

            if e and t == a and o:TimeToDie() > e:TimeToDie() then
                e, a = o, t
            end

        end

    end

    d(Q)
    if h.Commons.RangedMultiDoT then
        d(q)
    end

    if e and a == n and r(t) then
        return t
    end

    if e and r(e) then
        return e
    end

    return nil
end

local function Ne(o, a, t)
    local t = t or a:PandemicThreshold()
    if L and o:DebuffUp(e.Vendetta) then
        t = t * .5
    end

    return o:DebuffRefreshable(a, t)
end

local function z()
    local t = i.MasterAssassinsMarkRemains()
        if t > 0 then
        return t
    elseif a:BuffRemains(e.MasterAssassinBuff) < 0 then
        return a:GCDRemains() + 3
    else
        return a:BuffRemains(e.MasterAssassinBuff)
    end

end

local function se(o, i, a)
    local e = t:TimeToDie()
        if not w.BossFightRemainsIsNotValid() then
        e = w.BossFightRemains()
    elseif e < a then
        return false
    end

    if W((e - a) / o) > W((e - a - i) / o) then
        return true
    end

    return false
end

local function le(t)
    if t:DebuffUp(e.SerratedBoneSpikeDebuff) then
        return 1000000
    end

    return t:TimeToDie()
end

local function ue(e)
    return e:TimeToDie()
end

local function E(t)
    return t:DebuffRemains(e.Garrote)
end

local function L(t)
    return t:DebuffRemains(e.DeadlyPoisonDebuff)
end

local function E(t)
    return t:DebuffRemains(e.Garrote)
end

local function ye(t)
    return t:DebuffRemains(e.Rupture)
end

local function ce(a)
                if ((not a:DebuffUp(e.SerratedBoneSpikeDebuff)) and a:GUID() == _("mouseover"):GUID() and h.Assassination.TargetSwap == "Mouseover") then
        c = 1328547
        return true
    elseif ((not a:DebuffUp(e.SerratedBoneSpikeDebuff)) and h.Assassination.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not O) then
        c = 9999
        return true
    elseif ((not a:DebuffUp(e.SerratedBoneSpikeDebuff)) and a:GUID() == t:GUID()) then
        o = 328547
        return true
    elseif not (a:DebuffUp(e.SerratedBoneSpikeDebuff)) then
        return true
    end

end

local function fe(e)
                if ((((not x or e:FilteredTimeToDie("<", 30)) and e:FilteredTimeToDie("<", (u * 1.5))) or (u >= i.CPMaxSpend())) and e:GUID() == _("mouseover"):GUID() and h.Assassination.TargetSwap == "Mouseover") then
        c = 1137619
        return true
    elseif ((((not x or e:FilteredTimeToDie("<", 30)) and e:FilteredTimeToDie("<", (u * 1.5))) or (u >= i.CPMaxSpend())) and h.Assassination.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not O) then
        c = 9999
        return true
    elseif ((((not x or e:FilteredTimeToDie("<", 30)) and e:FilteredTimeToDie("<", (u * 1.5))) or (u >= i.CPMaxSpend())) and e:GUID() == t:GUID()) then
        o = 137619
        return true
    elseif (((not x or e:FilteredTimeToDie("<", 30)) and e:FilteredTimeToDie("<", (u * 1.5))) or (u >= i.CPMaxSpend())) then
        return true
    end

end

local function X(n)
                if ((a:BuffUp(e.ImprovedGarroteBuff) and not i.WillLoseExsanguinate(n, e.Garrote) and (n:DebuffRemains(e.Garrote) < (12 / i.ExsanguinatedRate(n, e.Garrote)) or n:PMultiplier(e.Garrote) <= 1) and (n:FilteredTimeToDie(">", 2, -n:DebuffRemains(e.Garrote)) or n:TimeToDieIsNotValid())) and n:GUID() == _("mouseover"):GUID() and h.Assassination.TargetSwap == "Mouseover") then
        c = 1703
        return true
    elseif ((a:BuffUp(e.ImprovedGarroteBuff) and not i.WillLoseExsanguinate(n, e.Garrote) and (n:DebuffRemains(e.Garrote) < (12 / i.ExsanguinatedRate(n, e.Garrote)) or n:PMultiplier(e.Garrote) <= 1) and (n:FilteredTimeToDie(">", 2, -n:DebuffRemains(e.Garrote)) or n:TimeToDieIsNotValid())) and h.Assassination.TargetSwap == "AutoSwap" and n:GUID() ~= t:GUID() and not O) then
        c = 9999
        return true
    elseif ((a:BuffUp(e.ImprovedGarroteBuff) and not i.WillLoseExsanguinate(n, e.Garrote) and (n:DebuffRemains(e.Garrote) < (12 / i.ExsanguinatedRate(n, e.Garrote)) or n:PMultiplier(e.Garrote) <= 1) and (n:FilteredTimeToDie(">", 2, -n:DebuffRemains(e.Garrote)) or n:TimeToDieIsNotValid())) and n:GUID() == t:GUID()) then
        o = 703
        return true
    elseif (a:BuffUp(e.ImprovedGarroteBuff) and not i.WillLoseExsanguinate(n, e.Garrote) and (n:DebuffRemains(e.Garrote) < (12 / i.ExsanguinatedRate(n, e.Garrote)) or n:PMultiplier(e.Garrote) <= 1) and (n:FilteredTimeToDie(">", 2, -n:DebuffRemains(e.Garrote)) or n:TimeToDieIsNotValid())) then
        return true
    end

end

local function we(a)
                if ((a:DebuffDown(e.DeadlyPoisonDebuff) and (not N or a:DebuffUp(e.Garrote) or a:DebuffUp(e.Rupture))) and a:GUID() == _("mouseover"):GUID() and h.Assassination.TargetSwap == "Mouseover") then
        c = 151723
        return true
    elseif ((a:DebuffDown(e.DeadlyPoisonDebuff) and (not N or a:DebuffUp(e.Garrote) or a:DebuffUp(e.Rupture))) and h.Assassination.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not O) then
        c = 9999
        return true
    elseif ((a:DebuffDown(e.DeadlyPoisonDebuff) and (not N or a:DebuffUp(e.Garrote) or a:DebuffUp(e.Rupture))) and a:GUID() == t:GUID()) then
        o = 51723
        return true
    elseif (a:DebuffDown(e.DeadlyPoisonDebuff) and (not N or a:DebuffUp(e.Garrote) or a:DebuffUp(e.Rupture))) then
        return true
    end

end

local function me(a)
                if ((a:DebuffDown(e.DeadlyPoisonDebuff)) and a:GUID() == _("mouseover"):GUID() and h.Assassination.TargetSwap == "Mouseover") then
        c = 11329
        return true
    elseif ((a:DebuffDown(e.DeadlyPoisonDebuff)) and h.Assassination.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not O) then
        c = 9999
        return true
    elseif ((a:DebuffDown(e.DeadlyPoisonDebuff)) and a:GUID() == t:GUID()) then
        o = 1329
        return true
    elseif (a:DebuffDown(e.DeadlyPoisonDebuff)) then
        return true
    end

end

local function ie(a)
                if ((a:DebuffRefreshable(e.Rupture, S) and (a:PMultiplier(e.Rupture) <= 1 or a:DebuffRemains(e.Rupture) <= (i.Exsanguinated(a, e.Rupture) and m or g) and s >= 3) and (not i.WillLoseExsanguinate(a, e.Rupture) or (a:DebuffRemains(e.Rupture) <= m * 2 and s >= 3)) and (a:FilteredTimeToDie(">", H, -a:DebuffRemains(e.Rupture)) or a:TimeToDieIsNotValid())) and a:GUID() == _("mouseover"):GUID() and h.Assassination.TargetSwap == "Mouseover") then
        c = 1137619
        return true
    elseif ((a:DebuffRefreshable(e.Rupture, S) and (a:PMultiplier(e.Rupture) <= 1 or a:DebuffRemains(e.Rupture) <= (i.Exsanguinated(a, e.Rupture) and m or g) and s >= 3) and (not i.WillLoseExsanguinate(a, e.Rupture) or (a:DebuffRemains(e.Rupture) <= m * 2 and s >= 3)) and (a:FilteredTimeToDie(">", H, -a:DebuffRemains(e.Rupture)) or a:TimeToDieIsNotValid())) and h.Assassination.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not O) then
        c = 9999
        return true
    elseif ((a:DebuffRefreshable(e.Rupture, S) and (a:PMultiplier(e.Rupture) <= 1 or a:DebuffRemains(e.Rupture) <= (i.Exsanguinated(a, e.Rupture) and m or g) and s >= 3) and (not i.WillLoseExsanguinate(a, e.Rupture) or (a:DebuffRemains(e.Rupture) <= m * 2 and s >= 3)) and (a:FilteredTimeToDie(">", H, -a:DebuffRemains(e.Rupture)) or a:TimeToDieIsNotValid())) and a:GUID() == t:GUID()) then
        o = 137619
        return true
    elseif (a:DebuffRefreshable(e.Rupture, S) and (a:PMultiplier(e.Rupture) <= 1 or a:DebuffRemains(e.Rupture) <= (i.Exsanguinated(a, e.Rupture) and m or g) and s >= 3) and (not i.WillLoseExsanguinate(a, e.Rupture) or (a:DebuffRemains(e.Rupture) <= m * 2 and s >= 3)) and (a:FilteredTimeToDie(">", H, -a:DebuffRemains(e.Rupture)) or a:TimeToDieIsNotValid())) then
        return true
    end

end

local function de(a)
    M = i.Exsanguinated(a, e.Garrote) and m or g
                if ((not SkipCycleGarrote and a:DebuffRefreshable(e.Garrote) and u >= 1 and (a:PMultiplier(e.Garrote) <= 1 or (a:DebuffRemains(e.Garrote) <= (i.Exsanguinated(a, e.Garrote) and m or g) and s >= 3)) and (not i.WillLoseExsanguinate(a, e.Garrote) or (a:DebuffRemains(e.Garrote) <= m * 2 and s >= 3)) and a:FilteredTimeToDie(">", 12, -a:DebuffRemains(e.Garrote)) and z() == 0) and a:GUID() == _("mouseover"):GUID() and h.Assassination.TargetSwap == "Mouseover") then
        c = 1137619
        return true
    elseif ((not SkipCycleGarrote and a:DebuffRefreshable(e.Garrote) and u >= 1 and (a:PMultiplier(e.Garrote) <= 1 or (a:DebuffRemains(e.Garrote) <= (i.Exsanguinated(a, e.Garrote) and m or g) and s >= 3)) and (not i.WillLoseExsanguinate(a, e.Garrote) or (a:DebuffRemains(e.Garrote) <= m * 2 and s >= 3)) and a:FilteredTimeToDie(">", 12, -a:DebuffRemains(e.Garrote)) and z() == 0) and h.Assassination.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not O) then
        c = 9999
        return true
    elseif ((not SkipCycleGarrote and a:DebuffRefreshable(e.Garrote) and u >= 1 and (a:PMultiplier(e.Garrote) <= 1 or (a:DebuffRemains(e.Garrote) <= (i.Exsanguinated(a, e.Garrote) and m or g) and s >= 3)) and (not i.WillLoseExsanguinate(a, e.Garrote) or (a:DebuffRemains(e.Garrote) <= m * 2 and s >= 3)) and a:FilteredTimeToDie(">", 12, -a:DebuffRemains(e.Garrote)) and z() == 0) and a:GUID() == t:GUID()) then
        o = 137619
        return true
    elseif (not SkipCycleGarrote and a:DebuffRefreshable(e.Garrote) and u >= 1 and (a:PMultiplier(e.Garrote) <= 1 or (a:DebuffRemains(e.Garrote) <= (i.Exsanguinated(a, e.Garrote) and m or g) and s >= 3)) and (not i.WillLoseExsanguinate(a, e.Garrote) or (a:DebuffRemains(e.Garrote) <= m * 2 and s >= 3)) and a:FilteredTimeToDie(">", 12, -a:DebuffRemains(e.Garrote)) and z() == 0) then
        return true
    end

end

local function _()
    if a:EnergyPredicted() < 45 then
        if n(e.PoolEnergy) then
            shadowcast = 9999999999
            return "Pool for Vanish (Exsanguinated)"
        end

    end

    if e.Vanish:IsReady() and (e.ImprovedGarrote:IsAvailable() and not i.Exsanguinated(t, e.Garrote) and t:PMultiplier(e.Garrote) <= 1 and (t:DebuffUp(e.Deathmark) or e.Deathmark:CooldownRemains() < 4) and u >= math.min(s, 4)) then
        if n(e.Vanish, nil) then
            o = 1856
            return "Cast Vanish (Exsanguinate)"
        end

    end

    if a:EnergyPredicted() < 45 then
        if n(e.PoolEnergy) then
            shadowcast = 9999999999
            return "Pool for Vanish (Indiscriminate Carnage/Improved Garrote)"
        end

    end

    if e.Vanish:IsReady() and (e.ImprovedGarrote:IsAvailable() and e.Garrote:CooldownUp() and not i.Exsanguinated(t, e.Garrote) and t:PMultiplier(e.Garrote) <= 1 and s > (3 - p(e.IndiscriminateCarnage:IsAvailable())) and (not e.IndiscriminateCarnage:IsAvailable() or e.IndiscriminateCarnage:IsReady())) then
        if n(e.Vanish, nil) then
            o = 1856
            return "Cast Vanish (Indiscriminate Carnage/Improved Garrote)"
        end

    end

    if e.Vanish:IsReady() and (not e.ImprovedGarrote:IsAvailable() and (e.MasterAssassin:IsAvailable() or G) and not t:DebuffRefreshable(e.Rupture) and t:DebuffRemains(e.Rupture) > 3 and t:DebuffUp(e.Deathmark) and (t:DebuffUp(e.ShivDebuff) or t:DebuffRemains(e.Deathmark) < 4 or t:DebuffUp(e.Sepsis)) and t:DebuffRemains(e.Sepsis) < 3) then
        if n(e.Vanish, nil) then
            o = 1856
            return "Cast Vanish (MasterAssassin)"
        end

    end

    if a:EnergyPredicted() < 45 then
        if n(e.PoolEnergy) then
            shadowcast = 9999999999
            return "Pool for ShadowDance"
        end

    end

    if e.ShadowDance:IsReady() and (e.ImprovedGarrote:IsAvailable() and e.Garrote:CooldownUp() and not i.Exsanguinated(t, e.Garrote) and t:PMultiplier(e.Garrote) <= 1 and (t:DebuffUp(e.Deathmark) or (e.Deathmark:CooldownRemains() < 4) or e.Deathmark:CooldownRemains() > 60) and u >= math.min(s, 4)) then
        if n(e.ShadowDance) then
            o = 185313
            return "Cast ShadowDance (Garrote)"
        end

    end

    if e.ShadowDance:IsReady() and (e.ImprovedGarrote:IsAvailable() and (e.MasterAssassin:IsAvailable() or G) and not t:DebuffRefreshable(e.Rupture) and t:DebuffRemains(e.Rupture) > 3 and (t:DebuffUp(e.Deathmark) or (e.Deathmark:CooldownRemains() < 4) or e.Deathmark:CooldownRemains() > 60) and (t:DebuffUp(e.ShivDebuff) or t:DebuffRemains(e.Deathmark) < 4 or t:DebuffUp(e.Sepsis)) and t:DebuffRemains() < 3) then
        if n(e.ShadowDance) then
            o = 185313
            return "Cast ShadowDance (Master Assassin)"
        end

    end

end

local function G()
    if e.MarkedforDeath:IsCastable() then
        if j.CastTargetIf(e.MarkedforDeath, q, "min", ue, fe, not t:IsInMeleeRange(8)) then
            return "Cast Marked for Death"
        end

    end

    if e.MarkedforDeath:IsReady() and (UnitIsUnit("target", "boss1") or UnitIsUnit("target", "boss2") or UnitIsUnit("target", "boss3") or UnitIsUnit("target", "boss4")) and (u >= i.CPMaxSpend() and (not T or ((a:BuffUp(e.FlagellationBuff) or e.Flagellation:CooldownRemains() > 15) and (e.CrimsonTempest:IsAvailable() or e.Shiv:CooldownRemains() > 0)))) then
        if n(e.MarkedforDeath, nil) then
            o = 137619
            return "Cast Marked for Death 2"
        end

    end

    VarDeathmarkExsanguinate = not e.Exsanguinate:IsAvailable() or e.Exsanguinate:CooldownRemains() > 15 or i.Exsanguinated(t, e.Garrote)
    VarDeathmarkMACondition = not e.MasterAssassin:IsAvailable() or t:DebuffUp(e.Garrote) or (T and u == 0)
    if not T then
        VarDeathmarkCovenantCondition = true
    else
        VarDeathmarkCovenantCondition = ((W((y - 20) / (120 * R)) > W((y - 20 - e.Flagellation:CooldownRemains()) / (120 * R)) and e.Flagellation:CooldownRemains() > 10) or a:BuffUp(e.FlagellationBuff) or t:DebuffUp(e.Flagellation) or y < 20)
    end

    if not a:StealthUp(true, false) then
        if e.Flagellation:IsReady() then
                        if ((VarDeathmarkCooldownRemains < 3 and VarDeathmarkMACondition and f >= 4 and (t:FilteredTimeToDie(">", 10) or t:TimeToDieIsNotValid())) or (t:DebuffUp(e.Deathmark) or w.BossFilteredFightRemains("<=", 24))) then
                if n(e.Flagellation, nil, nil) then
                    o = 323654
                    return "Cast Flagellation (Sync)"
                end

            elseif f >= 4 and se(120, e.Flagellation:CooldownRemains() * te, 24) then
                if n(e.Flagellation, nil, nil) then
                    o = 323654
                    return "Cast Flagellation (Burn)"
                end

            end

        end

        if e.Sepsis:IsReady() and CovenantsOn then
                        if e.Vendetta:CooldownRemains() < 1 and (t:FilteredTimeToDie(">", 10) or t:TimeToDieIsNotValid()) or t:DebuffUp(e.Vendetta) or w.BossFilteredFightRemains("<=", 10) then
                if n(e.Sepsis, nil, nil) then
                    o = 328305
                    return "Cast Sepsis (Sync)"
                end

            elseif se(90, e.Vendetta:CooldownRemains() * oe, 10) then
                if n(e.Sepsis, nil, nil) then
                    o = 328305
                    return "Cast Sepsis (Burn)"
                end

            end

        end

        VarDeathmarkCondition = not a:StealthUp(true, false) and t:DebuffUp(e.Rupture) and t:DebuffDown(e.Deathmark) and VarDeathmarkExsanguinate and VarDeathmarkMACondition and VarDeathmarkCovenantCondition
        if DefaultTrinketCondition then
            if TrinketToUse and (a:BuffUp(e.SymbolsofDeath) or y < 20) then
                if r.Cast(TrinketToUse, nil, nil) then
                                        if TrinketToUse:ID() == TopTrinketID and h.Commons.Enabled.TopTrinket and ((TrinketSyncSlot == 1 and (t:DebuffUp(e.Deathmark) or y <= 20)) or (TrinketSyncSlot == 2 and (not v:IsReady() or VarDeathmarkCooldownRemains > 20)) or (TrinketSyncSlot == 0)) then
                        o = 24
                        return "Generic use_items for " .. TrinketToUse:Name()
                    elseif TrinketToUse:ID() == BotTrinketID and h.Commons.Enabled.BottomTrinket and ((TrinketSyncSlot == 2 and (t:DebuffUp(e.Deathmark) or y <= 20)) or (TrinketSyncSlot == 1 and (not b:IsReady() or VarDeathmarkCooldownRemains > 20)) or (TrinketSyncSlot == 0)) then
                        o = 25
                        return "Generic use_items for " .. TrinketToUse:Name()
                    end

                end

            end

        end

        if e.Deathmark:IsReady() and VarDeathmarkCondition then
            if n(e.Deathmark, nil, nil) then
                o = 360194
                return "Cast Deathmark CDs"
            end

        end

        if e.Kingsbane:IsReady() and ((t:DebuffUp(e.Shiv) or e.Shiv:CooldownRemains() < 6) and a:BuffUp(e.Envenom) and (e.Deathmark:CooldownRemains() >= 50 or t:DebuffUp(e.Deathmark))) then
            if n(e.Kingsbane, nil, nil) then
                o = 385627
                return "Cast Kingsbane CDs"
            end

        end

        if e.Exsanguinate:IsCastable() and (not a:BuffUp(e.ImprovedGarroteBuff) and not t:DebuffUp(e.Deathmark) and ((not t:DebuffRefreshable(e.Garrote) and t:DebuffRemains(e.Rupture) > 4 + 4 * i.CPMaxSpend()) or (t:FilteredTimeToDie("<", t:DebuffRemains(e.Rupture) * .5)) and (t:FilteredTimeToDie(">", 4) or t:TimeToDieIsNotValid())) and i.CanDoTUnit(t, F)) then
            if n(e.Exsanguinate) then
                o = 200806
                return "Cast Exsanguinate"
            end

        end

    end

    if e.Shiv:IsCastable() and (e.Kingsbane:IsAvailable() and not t:DebuffUp(e.ShivDebuff) and t:DebuffUp(e.Kingsbane) and t:DebuffUp(e.Garrote) and t:DebuffUp(e.Rupture) and (not e.CrimsonTempest:IsAvailable() or x or t:DebuffUp(e.CrimsonTempest))) then
        if n(e.Shiv, nil) then
            o = 5938
            return "Cast Shiv"
        end

    end

    if e.Shiv:IsCastable() and (not e.Kingsbane:IsAvailable() and not P and not t:DebuffUp(e.ShivDebuff) and t:DebuffUp(e.Garrote) and t:DebuffUp(e.Rupture) and (not e.CrimsonTempest:IsAvailable() or x or t:DebuffUp(e.CrimsonTempest))) then
        if n(e.Shiv, nil) then
            o = 5938
            return "Cast Shiv2"
        end

    end

    if e.Shiv:IsCastable() and (not e.Kingsbane:IsAvailable() and P and not t:DebuffUp(e.ShivDebuff) and t:DebuffUp(e.Garrote) and (p(e.Sepsis:IsReady() or e.Sepsis:CooldownRemains() > 12) + p(e.Deathmark:IsReady() or VarDeathmarkCooldownRemains > 12) == 2)) then
        if n(e.Shiv, nil) then
            o = 5938
            return "Cast Shiv3"
        end

    end

    if e.ThistleTea:IsReady() and (a:EnergyDeficitPredicted() >= 100 and not a:BuffUp(e.ThistleTea) and (e.ThistleTea:ChargesFractional() == 3. or t:DebuffUp(e.Deathmark) or y < e.Deathmark:CooldownRemains())) then
        if n(e.ThistleTea, nil) then
            o = 381623
            return "Cast ThistleTea"
        end

    end

    if e.IndiscriminateCarnage:IsReady() and (not e.ImprovedGarrote:IsAvailable() or e.Vanish:CooldownRemains() > 45) then
        if n(e.IndiscriminateCarnage, nil) then
            o = 381802
            return "Cast IndiscriminateCarnage"
        end

    end

    if h.Commons.Enabled.Potions and B() and h.Commons.Enabled.Potions and ae and (((a:BloodlustUp() or y < 30 or t:DebuffUp(e.Deathmark)) and not r.GUISettings.General.HoldPotforBL) or (r.GUISettings.General.HoldPotforBL and a:BloodlustUp())) then
        local e = j.PotionSelected()
        if e and e:IsReady() then
            if n(e, nil, nil) then
                o = 37
                return "potion cooldowns 2"
            end

        end

    end

    if t:DebuffUp(e.Deathmark) and B() then
        if e.BloodFury:IsReady() and h.Commons.Enabled.Racials then
            if r.Cast(e.BloodFury, nil) then
                o = 20572
                return "Cast Blood Fury"
            end

        end

        if e.Berserking:IsReady() and h.Commons.Enabled.Racials then
            if r.Cast(e.Berserking, nil) then
                o = 26297
                return "Cast Berserking"
            end

        end

        if e.Fireblood:IsReady() and h.Commons.Enabled.Racials then
            if r.Cast(e.Fireblood, nil) then
                o = 265221
                return "Cast Fireblood"
            end

        end

        if e.AncestralCall:IsReady() and h.Commons.Enabled.Racials then
            if r.Cast(e.AncestralCall, nil) then
                o = 274738
                return "Cast Ancestral Call"
            end

        end

    end

    if not a:StealthUp(true, true) and z() <= 0 then
        d = _()
        if d then
            return d
        end

    end

    return false
end

local function _()
    if e.Envenom:IsReady() and (f >= 4 + p(e.DeeperStratagem:IsAvailable()) and (t:DebuffUp(e.Deathmark) or t:DebuffUp(e.ShivDebuff) or t:DebuffStack(e.AmplifyingPoisonDebuff) <= 10 or a:BuffUp(e.Flagellation) or a:EnergyDeficitPredicted() <= (25 + I) or not x or f > i.CPMaxSpend) and (not e.Exsanguinate:IsAvailable() or e.Exsanguinate:CooldownRemains() > 2)) then
        if n(e.Envenom, nil, nil, not t:IsInMeleeRange(8)) then
            o = 32645
            return "Cast Envenom"
        end

    end

    if not (u > 1 or a:EnergyDeficitPredicted() <= 25 + I or not x) then
        return false
    end

    if e.SerratedBoneSpike:IsReady() then
        if not t:DebuffUp(e.SerratedBoneSpikeDebuff) then
            if n(e.SerratedBoneSpike, nil, nil, not t:IsInMeleeRange(10)) then
                o = 328547
                return "Cast Serrated Bone Spike"
            end

        else
            if r.AoEON() then
                if j.CastTargetIf(e.SerratedBoneSpike, q, "min", le, ce) then
                    return "Cast Serrated Bone (AoE)"
                end

            end

            if z() < .8 and ((y <= 5 or e.SerratedBoneSpike:ChargesFractional() >= 2.75) or ((e.LeadbyExample:SoulbindEnabled() and not a:BuffUp(e.LeadbyExampleBuff) and t:DebuffUp(e.Deathmark)) or a:BuffUp(e.MarrowedGemstoneBuff) or (not x and t:DebuffUp(e.ShivDebuff)))) then
                if n(e.SerratedBoneSpike, nil, nil, not t:IsInMeleeRange(10)) then
                    o = 328547
                    return "Cast Serrated Bone Spike (Filler)"
                end

            end

        end

    end

    if e.FanofKnives:IsCastable() then
        if r.AoEON() and (not N and s >= (3 + p(a:StealthUp(true, false)) + p(e.DragonTemperedBlades:IsAvailable()))) then
            if A(e.FanofKnives) then
                o = 51723
                return "Cast Fan of Knives"
            end

        end

        if r.AoEON() and s >= 3 then
            if j.CastTargetIf(e.FanofKnives, q, "min", L, we) then
                return "FanofKnives Tab"
            end

        end

    end

    if e.EchoingReprimand:IsReady() and CovenantsOn and VarDeathmarkCooldownRemains > 10 then
        if n(e.EchoingReprimand, nil, nil, not t:IsInMeleeRange(8)) then
            o = 323547
            return "Cast Echoing Reprimand"
        end

    end

    if e.Ambush:IsReady() and ((z() <= 0 and not V) or a:BuffUp(e.BlindsideBuff)) then
        if A(e.Ambush, nil, not t:IsInMeleeRange(8)) then
            o = 8676
            return "Cast Ambush"
        end

    end

    if e.Mutilate:IsCastable() and s == 2 then
        if j.CastTargetIf(e.Mutilate, q, "min", L, me) then
            return "Mutilate Tab"
        end

    end

    if e.Mutilate:IsCastable() then
        if A(e.Mutilate, nil, not t:IsInMeleeRange(8)) then
            o = 1329
            return "Cast Mutilate"
        end

    end

    return false
end

local function T()
    local a, d, h = false, false, false
    if N then
        a = (t:DebuffRemains(e.Garrote) < 6 or D)
        a = (t:DebuffUp(e.Shiv) and s > 2) or D
    end

    h = t:DebuffUp(e.Deathmark) and (t:DebuffUp(e.ShivDebuff) or z() > 0) and t:DebuffRemains(e.Rupture) > 2
    if r.CDsON() and e.Exsanguinate:IsAvailable() then
        M = i.Exsanguinated(t, e.Garrote) and m or g
        if e.Garrote:IsCastable() and t:IsInMeleeRange(8) and (not i.WillLoseExsanguinate(t, e.Garrote) and e.Exsanguinate:CooldownRemains() < 2 and t:PMultiplier(e.Garrote) <= 1 and e.Exsanguinate:CooldownRemains() < 2 and s == 1 and t:FilteredTimeToDie(">", t:DebuffRemains(e.Garrote) * .5)) then
            if A(e.Garrote) then
                o = 703
                return "Cast Garrote (Pre-Exsanguinate)"
            end

        end

        if e.Rupture:IsReady() and t:IsInMeleeRange(8) and (not i.WillLoseExsanguinate(t, e.Garrote) and t:PMultiplier(e.Garrote) <= 1 and (f >= i.CPMaxSpend() and e.Exsanguinate:CooldownRemains() < 1 and t:FilteredTimeToDie(">", t:DebuffRemains(e.Rupture) * .5))) then
            if n(e.Rupture) then
                o = 1943
                return "Cast Rupture (Pre-Exsanguinate)"
            end

        end

    end

    if e.Garrote:IsCastable() and u >= 1 then
        if (t:DebuffRefreshable(e.Garrote) and u >= 1 and (t:PMultiplier(e.Garrote) <= 1 or (t:DebuffRemains(e.Garrote) <= M and s >= 3)) and (not i.WillLoseExsanguinate(t, e.Garrote) or (t:DebuffRemains(e.Garrote) <= M and s >= 3)) and t:FilteredTimeToDie(">", 4, -t:DebuffRemains(e.Garrote)) and z() == 0) then
            if A(e.Garrote, nil, not t:IsInMeleeRange(8)) then
                o = 703
                return "Pool for Garrote (ST)"
            end

        end

        if de(t) and i.CanDoTUnit(t, ee) and (t:FilteredTimeToDie(">", 4, -t:DebuffRemains(e.Garrote)) or t:TimeToDieIsNotValid()) then
            if A(e.Garrote, nil, not t:IsInMeleeRange(8)) then
                o = 703
                return "Pool for Garrote Tab (ST)"
            end

        end

        if r.AoEON() and not a then
            if j.CastTargetIf(e.Mutilate, q, "min", E, de) then
                return "Garrote Tab"
            end

        end

    end

    if r.AoEON() and e.CrimsonTempest:IsReady() and s >= 2 and f >= 4 and I > 20 and (not e.Deathmark:IsReady() or t:DebuffUp(e.Rupture)) and t:DebuffRemains(e.CrimsonTempest) < 2 + 3 * p(s >= 4) then
        if n(e.CrimsonTempest) then
            o = 121411
            return "Cast Crimson Tempest (AoE)"
        end

    end

    if not h and e.Rupture:IsReady() and f >= 4 then
        H = 4 + p(Y) * 5 + p(V) * 5 + p(D) * 6
        if ie(t) and i.CanDoTUnit(t, F) then
            if n(e.Rupture, nil, nil, not t:IsInMeleeRange(8)) then
                o = 1943
                return "Cast Rupture (Refresh)"
            end

        end

        if r.AoEON() and not d then
            if j.CastTargetIf(e.Mutilate, q, "min", ye, ie) then
                return "Garrote Tab"
            end

        end

    end

    if r.AoEON() and e.CrimsonTempest:IsReady() and s >= 2 and f >= 4 and t:DebuffRemains(e.CrimsonTempest) < 2 + 3 * p(s >= 4) then
        if n(e.CrimsonTempest) then
            o = 121411
            return "Cast Crimson Tempest (AoE Fallback)"
        end

    end

    if e.CrimsonTempest:IsReady() and t:IsInMeleeRange(10) and (s == 1 and not Y and f >= (i.CPMaxSpend() - 1) and Ne(t, e.CrimsonTempest, J) and not i.WillLoseExsanguinate(t, e.CrimsonTempest) and not t:DebuffUp(e.ShivDebuff) and t:DebuffStack(AmplifyingPoisonDebuff) < 15 and (t:FilteredTimeToDie(">", 4, -t:DebuffRemains(e.CrimsonTempest)) or t:TimeToDieIsNotValid()) and i.CanDoTUnit(t, F)) then
        if n(e.CrimsonTempest) then
            o = 121411
            return "Cast Crimson Tempest (ST)"
        end

    end

    return false
end

local function v()
    if e.IndiscriminateCarnage:IsReady() and (s > 1) then
        if n(e.IndiscriminateCarnage, nil) then
            o = 381802
            return "Cast IndiscriminateCarnage stealth"
        end

    end

    if e.Garrote:IsReady() then
        if (X(t)) then
            if A(e.Garrote, nil, not t:IsInMeleeRange(8)) then
                o = 703
                return "Cast Garrote (Improved Garrote)"
            end

        end

        if j.CastTargetIf(e.Garrote, q, "min", E, X, not t:IsInMeleeRange(8)) then
            return "Cast Garrote stealth"
        end

    end

    if e.Garrote:IsReady() and (e.Exsanguinate:IsAvailable() and a:BuffUp(e.ImprovedGarroteBuff) and s == 1 and not i.WillLoseExsanguinate(t, e.Garrote) and a:BuffRemains(e.ImprovedGarroteBuff) < 1.3) then
        if A(e.Garrote, nil, not t:IsInMeleeRange(8)) then
            o = 703
            return "Cast Garrote (Improved Garrote)"
        end

    end

    return false
end

local function b()
    Z = HeroRotationCharDB.Toggles[6]
    Ee = HeroRotationCharDB.Toggles[4]
    Ae = HeroRotationCharDB.Toggles[5]
    O = HeroRotationCharDB.Toggles[12]
    ae = not HeroRotationCharDB.Toggles[15]
    Te = HeroRotationCharDB.Toggles[20]
    xe = HeroRotationCharDB.Toggles[21]
    _e = HeroRotationCharDB.Toggles[22]
    je = HeroRotationCharDB.Toggles[23]
    be = HeroRotationCharDB.Toggles[24]
    ve = HeroRotationCharDB.Toggles[25]
    pe = HeroRotationCharDB.Toggles[26]
    ge = HeroRotationCharDB.Toggles[27]
    Ie = HeroRotationCharDB.Toggles[28]
    ke = HeroRotationCharDB.Toggles[29]
    qe = HeroRotationCharDB.Toggles[30]
    Oe = HeroRotationCharDB.Toggles[54]
    TopTrinketID = GetInventoryItemID("player", 13)
    BotTrinketID = GetInventoryItemID("player", 14)
            if not h.Commons.Enabled.TopTrinket and not h.Commons.Enabled.BotTrinket then
        OnUseExcludes = { TopTrinketID, BotTrinketID, k.CacheOfAcquiredTreasures:ID() }
    elseif not h.Commons.Enabled.TopTrinket and h.Commons.Enabled.BotTrinket then
        OnUseExcludes = { TopTrinketID, k.CacheOfAcquiredTreasures:ID() }
    elseif not h.Commons.Enabled.BotTrinket and h.Commons.Enabled.TopTrinket then
        OnUseExcludes = { BotTrinketID, k.CacheOfAcquiredTreasures:ID() }
    end

end

local function k()
    if ze() then
        ne = a:GetEnemiesInRange(30)
        q = a:GetEnemiesInMeleeRange(10)
        s = #q
        Q = a:GetEnemiesInMeleeRange(5)
    else
        ne = {  }
        q = {  }
        s = 1
        Q = {  }
    end

    he = e.Subterfuge:IsAvailable() and e.Stealth2 or e.Stealth
    g, m = 2 / a:SpellHaste(), 1 / a:SpellHaste()
    f = i.EffectiveComboPoints(a:ComboPoints())
    u = a:ComboPointsMax() - f
    S = (4 + f * 4) * .3
    J = (2 + f * 2) * .3
    F = e.Envenom:Damage() * 3
    ee = e.Mutilate:Damage() * 3
    N = false
    R = 1 - (p(U) * .45)
    te = 1 - (p(C) * .44)
    if j.TargetIsValid() or a:AffectingCombat() then
        if IsInRaid() and UnitExists("boss1") then
            K = w.BossFightRemains(nil, true)
            y = K
            if y == 11111 then
                y = w.FightRemains(Enemies10yd, false)
            end

        end

    end

    d = b()
    if d then
        return d
    end

    if c > 0 then
        c = 0
    end

    if o > 0 then
        o = 0
    end

    o = i.ReturnSpell()
    c = i.ReturnSpellMO()
    d = i.CrimsonVial()
    if d then
        return d
    end

    d = i.Feint()
    if d then
        return d
    end

    local c = a:AffectingCombat() and 180 or 900
    local u
            if l(8679):IsAvailable() and h.Commons.LethalPoison == "Wound Poison" then
        u = a:BuffRemains(l(8679))
        if u < c and not a:IsCasting(l(8679)) then
            if r.Cast(l(8679)) then
                o = 203
                return "Wound Poison Refresh"
            end

        end

    elseif l(2823):IsAvailable() and h.Commons.LethalPoison == "Deadly Poison" then
        u = a:BuffRemains(l(2823))
        if u < c and not a:IsCasting(l(2823)) then
            if r.Cast(l(2823)) then
                o = 208
                return "Deadly Poison Refresh"
            end

        end

    elseif l(315584):IsAvailable() and h.Commons.LethalPoison == "Instant Poison" then
        u = a:BuffRemains(l(315584))
        if u < c and not a:IsCasting(l(315584)) then
            if r.Cast(l(315584)) then
                o = 205
                return "Instant Poison Refresh"
            end

        end

    end

        if l(381637):IsAvailable() and h.Commons.NonLethalPoison == "Atrophic Poison" then
        u = a:BuffRemains(l(381637))
        if u < c and not a:IsCasting(l(381637)) then
            if r.Cast(l(381637)) then
                o = 381637
                return "Atropic Poison Refresh"
            end

        end

    elseif l(5761):IsAvailable() and h.Commons.NonLethalPoison == "Numbing Poison" then
        u = a:BuffRemains(l(5761))
        if u < c and not a:IsCasting(NumbingPoison) then
            if r.Cast(l(5761)) then
                o = 204
                return "Numbing Poison Refresh"
            end

        end

    end

    if a:IsChanneling(l(324631)) then
        if r.Cast(e.PoolEnergy, nil, nil, nil) then
            o = 99999
            return "channeling Fleashcraft"
        end

    end

    if not a:AffectingCombat() and not a:IsDeadOrGhost() then
        if not a:BuffUp(e.VanishBuff) then
            d = i.Stealth(he)
            if d then
                return d
            end

        end

    end

    i.MfDSniping(e.MarkedforDeath)
    if j.TargetIsValid() and ((a:AffectingCombat() and not t:DebuffUp(e.Sap)) or Z) then
        re = i.PoisonedBleeds()
        I = a:EnergyRegen() + re * 8 / (2 * a:SpellHaste())
        EnergyTimeToMaxCombined = a:EnergyDeficitPredicted() / I
        x = s < 2
        D = I > 35
        VarDeathmarkCooldownRemains = e.Deathmark:CooldownRemains() * R
        if (a:StealthUp(true, false) or a:BuffUp(e.ImprovedGarroteBuff)) then
            d = v()
            if d then
                return d .. " (Stealthed)"
            end

        end

        if true then
            d = G()
            if d then
                return d
            end

        end

                if not a:BuffUp(e.SliceandDice) then
            if e.SliceandDice:IsReady() and f >= 2 then
                if n(e.SliceandDice) then
                    o = 5171
                    return "Cast Slice and Dice"
                end

            end

        elseif t:IsInMeleeRange(10) then
            if e.Envenom:IsReady() and a:BuffRemains(e.SliceandDice) < 5 and f >= 4 then
                if n(e.Envenom, nil, nil, not t:IsInMeleeRange(8)) then
                    o = 32645
                    return "Cast Envenom (CttC)"
                end

            end

        else
            if e.PoisonedKnife:IsCastable() and t:IsInRange(30) and not a:StealthUp(true, true) and s == 0 and a:EnergyTimeToMax() <= a:GCD() * 1.5 then
                if n(e.PoisonedKnife) then
                    return "Cast Poisoned Knife"
                end

            end

        end

        if e.Envenom:IsReady() and t:IsInMeleeRange(10) and a:BuffUp(e.FlagellationBuff) and a:BuffRemains(e.FlagellationBuff) < 1 and a:BuffStack(e.FlagellationBuff) < 30 and f >= 2 then
            if n(e.Envenom, nil, nil, not t:IsInMeleeRange(8)) then
                o = 32645
                return "Cast Envenom (flag)"
            end

        end

        d = T()
        if d then
            return d
        end

        d = _()
        if d then
            return d
        end

        if B() and h.Commons.Enabled.Racials then
            if e.ArcaneTorrent:IsCastable() and t:IsInMeleeRange(8) and a:EnergyDeficitPredicted() > 15 + I then
                if n(e.ArcaneTorrent, nil) then
                    o = 155145
                    return "Cast Arcane Torrent"
                end

            end

            if e.ArcanePulse:IsCastable() and t:IsInMeleeRange(8) then
                if n(e.ArcanePulse, nil) then
                    o = 260364
                    return "Cast Arcane Pulse"
                end

            end

            if e.LightsJudgment:IsCastable() and t:IsInMeleeRange(8) then
                if n(e.LightsJudgment, nil) then
                    o = 255647
                    return "Cast Lights Judgment"
                end

            end

            if e.BagofTricks:IsCastable() and t:IsInMeleeRange(8) then
                if n(e.BagofTricks, nil) then
                    o = 312411
                    return "Cast Bag of Tricks"
                end

            end

        end

        if e.Mutilate:IsCastable() and t:IsInMeleeRange(10) then
            if n(e.PoolEnergy) then
                shadowcast = 9999999999
                return "Normal Pooling"
            end

        end

    end

end

local function t()
    e.Vendetta:RegisterAuraTracking()
    e.Sepsis:RegisterAuraTracking()
end

function ReturnSpellAss()
    if o == 0 then
        return 0
    else
        return o
    end

end

function ReturnSpellMOAss()
    if c == 0 then
        return 0
    else
        return c
    end

end

r.SetAPL(259, k, t)

