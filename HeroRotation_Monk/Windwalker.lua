local e, e = ...
local e = HeroDBC.DBC
local j = HeroLib
local e = HeroCache
local m = j.Unit
local t = m.Player
local a = m.Target
local e = m.Pet
local te = j.Spell
local e = j.MultiSpell
local o = j.Item
local i = HeroRotation
local Y = i.Cast
local v = i.CDsON
local xe = i.AoEON
local z = HeroRotationCharDB.Toggles[4]
local B = HeroRotationCharDB.Toggles[5]
local G = HeroRotationCharDB.Toggles[6]
local Ie = HeroRotationCharDB.Toggles[15]
local W = HeroRotationCharDB.Toggles[31]
local D = HeroRotationCharDB.Toggles[32]
local y = HeroRotationCharDB.Toggles[33]
local ne = HeroRotationCharDB.Toggles[34]
local se = HeroRotationCharDB.Toggles[35]
local ie = HeroRotationCharDB.Toggles[36]
local re = HeroRotationCharDB.Toggles[37]
local be = HeroRotationCharDB.Toggles[38]
local oe = HeroRotationCharDB.Toggles[39]
local w = HeroRotationCharDB.Toggles[12]
local ae = false
local I = 0
local _ = 0
local e = nil
local e = nil
local H = false
local Z = false
local J = false
local ee = false
local X = false
local b = GetInventoryItemID("player", 13)
local g = GetInventoryItemID("player", 14)
local e = math.min
local Q = pairs
local e = te.Monk.Windwalker
local n = o.Monk.Windwalker
local M = { n.InscrutibleQuantumDevice:ID(), n.Wrathstone:ID(), n.ShadowgraspTotem:ID(), n.OverchargedAnimaBattery:ID(), n.GladiatorsBadgeCosmic:ID(), n.GladiatorsBadgeSinful:ID(), n.GladiatorsBadgeUnchained:ID(), n.TheFirstSigil:ID(), n.EnforcersStunGrenade:ID(), n.CacheofAcquiredTreasures:ID() }
local o
local o
local p
local E
local d
local l
local k
local ge
local r = 0
local o = 0
local F = 0
local qe = false
local N = false
local ke = false
local R = false
local S = false
local V = false
local P = false
local s = false
local A
local s = false
local s = { { e.SpearHandStrike, "Cast Spear Hand Strike (Interrupt)", function()
    return true
end } }
local s = { { e.LegSweep, "Cast Leg Sweep (Stun)", function()
    return true
end } }
local s = { { e.RingOfPeace, "Cast Ring Of Peace (Stun)", function()
    return true
end } }
local s = { { e.Paralysis, "Cast Paralysis (Stun)", function()
    return true
end } }
local s = false
local O = 0
local f = i.Commons.Everyone
local s = i.Commons.Monk
local s = { General = i.GUISettings.General, Commons = i.GUISettings.APL.Monk.Commons, Windwalker = i.GUISettings.APL.Monk.Windwalker }
local x = t:HasLegendaryEquipped(88)
local q = t:HasLegendaryEquipped(82)
local he = t:HasLegendaryEquipped(85)
local L = t:HasLegendaryEquipped(83)
local c = t:HasLegendaryEquipped(96)
local h = t:HasLegendaryEquipped(95)
local u = t:HasLegendaryEquipped(97)
local U = t:HasLegendaryEquipped(94)
local T = t:HasLegendaryEquipped(257)
j:RegisterForEvent(function()
    x = t:HasLegendaryEquipped(88)
    q = t:HasLegendaryEquipped(82)
    he = t:HasLegendaryEquipped(85)
    L = t:HasLegendaryEquipped(83)
    c = t:HasLegendaryEquipped(96)
    h = t:HasLegendaryEquipped(95)
    u = t:HasLegendaryEquipped(97)
    U = t:HasLegendaryEquipped(94)
    T = t:HasLegendaryEquipped(257)
end, "PLAYER_EQUIPMENT_CHANGED")
local x = t:CovenantID()
j:RegisterForEvent(function()
    x = t:CovenantID()
end, "COVENANT_CHOSEN")
j:RegisterForEvent(function()
    O = 0
end, "PLAYER_REGEN_ENABLED")
local function C(e)
    if e then
        return 1
    else
        return 0
    end

end

local function h(e)
    return e ~= 0
end

local function Ae(a)
    local t = 0
    for o in Q(a) do
        local a = a[o]
        if a:DebuffUp(e.BonedustBrew) then
            t = t + 1
        end

    end

    return t
end

local function Oe(a)
    local t = 0
    for o in Q(a) do
        local a = a[o]
        if a:DebuffRemains(e.BonedustBrew) > 2 then
            t = t + 1
        end

    end

    return t
end

local function Te()
    local r = true
    local l = true
    local n = false
    local e = function(t)
        for a, e in Q(C_Soulbinds.GetSoulbindData(C_Soulbinds.GetActiveSoulbindID()).tree.nodes) do
            if e.conduitID and e.conduitID == t then
                return e.conduitRank + (e.socketEnhanced and 2 or 0)
            end

        end

        return 0
    end
    if I < GetTime() - .25 then
        local t = d
        local s = 1 + (GetMasteryEffect() / 100)
        local a = 1 + (UnitSpellHaste("player") / 100)
        local i = .2
        local c = .41804714952
        local h = .8481600000000001
        local o = e(22)
        local d = function()
            if o == 0 then
                return 1
            end

            return 1 + .085 + (.009 * (o - 1))
        end
        local o = e(19)
        local o = function()
            if o == 0 then
                return .16
            end

            return .16 + .1 + (.01 * (o - 1))
        end
        local e = e(60)
        local u = function()
            if e == 0 then
                return 0
            end

            return .4 + (.04 * (e - 1))
        end
        local e = 5 * math.pow((t / 5), .5)
        local m = t
        local e = math.min(m, e)
        local m = GetSpellCount(101546)
        local o = .18 + o()
        local o = o * m
        local o = 1 + o
        local e = (e * h * o) - (1.1 / 1.676 * .81 / 2.5 * 1.5)
        local h = c / e
        local function o(i, o, n, a, t)
            local e = {  }
            t = t or false
            e.damage = i
            e.execution_time = o
            e.net_chi = n
            e.net_energy = (t and a) or (a + (GetPowerRegen() * o))
            e.idps = e.damage / e.execution_time
            e.cps = e.net_chi / e.execution_time
            e.eps = e.net_energy / e.execution_time
            e.rdps = e.idps + .5 * s * e.cps + .02 * s * (1 + h) * e.eps
            return e
        end

        local e = 1 * (1 + (GetCombatRatingBonus(29) / 100))
        if C_UnitAuras.GetPlayerAuraBySpellID(123904) then
            e = e * 1.1
        end

        if C_UnitAuras.GetPlayerAuraBySpellID(137639) then
            e = e * 1.35
            e = e * (2 * d() + 1) / 3
        end

        e = e * (1 + (.5 * .4 * (UnitsWithBDBCount / t) * (1 + u())))
        local s = o(e * s * (1 + h), 2, 1, -50)
        local h = o(e, 1.5 / a + i, -1, 0, true)
        local e = o(e, 1.5 / a + i, -1, 0)
        local function o()
            if GetSpecialization(false) ~= 3 or UnitsWithBDBCount < 1 or t < 2 then
                r = true
                l = true
                n = false
            end

            if e.rdps > s.rdps then
                local t = 2 * GetPowerRegen()
                local t = (1 - 2 * t) / (1.5 + a * i) / (t / a)
                local t = 1 / (1 + t)
                local e = t * s.rdps + (1 - t) * e.rdps
                if h.rdps > e then
                    r = true
                end

                l = true
            else
                if e.idps < s.idps then
                    n = true
                end

                n = true
            end

        end

        local e = o()
    end

end

local function c()
    return math.floor(t:EnergyTimeToMaxPredicted() * 10 + .5) / 10
end

local function h()
    return math.floor(t:EnergyPredicted() + .5)
end

local function h(e)
    return (not t:PrevGCD(1, e))
end

local function u(t)
    return t:DebuffRemains(e.MarkOfTheCraneDebuff)
end

local function q(t)
    return t:DebuffRemains(e.MarkOfTheCraneDebuff) + (C(t:DebuffUp(e.SkyreachExhaustion)) * 20)
end

local function T(e)
                if ((t:Chi() < 3) and e:GUID() == m("mouseover"):GUID()) then
        r = 1261947
        return true
    elseif ((t:Chi() < 3) and s.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= a:GUID() and not w and not string.find(e:GUID(), 174773)) then
        r = 999
        return true
    elseif ((t:Chi() < 3) and e:GUID() == a:GUID()) then
        o = 261947
        return true
    elseif ((t:Chi() < 3) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function O(e)
                if ((e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1261947
        return true
    elseif ((e:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= a:GUID() and not w and not string.find(e:GUID(), 174773)) then
        r = 999
        return true
    elseif ((e:IsInMeleeRange(10)) and e:GUID() == a:GUID()) then
        o = 261947
        return true
    elseif ((e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function T(i)
                if ((t:ChiDeficit() >= 3 and (c() < 1 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1261947
        return true
    elseif ((t:ChiDeficit() >= 3 and (c() < 1 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((t:ChiDeficit() >= 3 and (c() < 1 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 261947
        return true
    elseif ((t:ChiDeficit() >= 3 and (c() < 1 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function T(i)
                if ((h(e.TigerPalm) and (t:ChiDeficit() >= 2 or A) and (c() < 1 or e.Serenity:CooldownRemains() < 2 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((h(e.TigerPalm) and (t:ChiDeficit() >= 2 or A) and (c() < 1 or e.Serenity:CooldownRemains() < 2 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.TigerPalm) and (t:ChiDeficit() >= 2 or A) and (c() < 1 or e.Serenity:CooldownRemains() < 2 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 100780
        return true
    elseif ((h(e.TigerPalm) and (t:ChiDeficit() >= 2 or A) and (c() < 1 or e.Serenity:CooldownRemains() < 2 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function de(e)
                if ((t:ChiDeficit() >= 3) and (e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1261947
        return true
    elseif ((t:ChiDeficit() >= 3) and (e:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= a:GUID() and not w) then
        r = 999
        return true
    elseif ((t:ChiDeficit() >= 3) and (e:IsInMeleeRange(10)) and e:GUID() == a:GUID()) then
        o = 261947
        return true
    elseif ((t:ChiDeficit() >= 3) and (e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function T(i)
                if ((h(e.TigerPalm) and (t:ChiDeficit() >= 2 or A)) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((h(e.TigerPalm) and (t:ChiDeficit() >= 2 or A)) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.TigerPalm) and (t:ChiDeficit() >= 2 or A)) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 100780
        return true
    elseif ((h(e.TigerPalm) and (t:ChiDeficit() >= 2 or A)) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function T(e)
                if ((t:ChiDeficit() == 2) and (e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((t:ChiDeficit() == 2) and (e:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= a:GUID() and not w and not string.find(e:GUID(), 174773)) then
        r = 999
        return true
    elseif ((t:ChiDeficit() == 2) and (e:IsInMeleeRange(10)) and e:GUID() == a:GUID()) then
        o = 100780
        return true
    elseif ((t:ChiDeficit() == 2) and (e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function me(i)
                if (((e.WhirlingDragonPunch:IsAvailable() and ((10 / (1 + t:HastePct() / 100)) > (e.WhirlingDragonPunch:CooldownRemains() + 4))) and ((e.FistsOfFury:CooldownRemains() > 3 or y) or t:Chi() >= 5)) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1107428
        return true
    elseif (((e.WhirlingDragonPunch:IsAvailable() and ((10 / (1 + t:HastePct() / 100)) > (e.WhirlingDragonPunch:CooldownRemains() + 4))) and ((e.FistsOfFury:CooldownRemains() > 3 or y) or t:Chi() >= 5)) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif (((e.WhirlingDragonPunch:IsAvailable() and ((10 / (1 + t:HastePct() / 100)) > (e.WhirlingDragonPunch:CooldownRemains() + 4))) and ((e.FistsOfFury:CooldownRemains() > 3 or y) or t:Chi() >= 5)) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 107428
        return true
    elseif (((e.WhirlingDragonPunch:IsAvailable() and ((10 / (1 + t:HastePct() / 100)) > (e.WhirlingDragonPunch:CooldownRemains() + 4))) and ((e.FistsOfFury:CooldownRemains() > 3 or y) or t:Chi() >= 5)) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function ue(i)
                if ((t:ChiDeficit() >= 2 and (not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((t:ChiDeficit() >= 2 and (not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((t:ChiDeficit() >= 2 and (not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 100780
        return true
    elseif ((t:ChiDeficit() >= 2 and (not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function ve(i)
                if ((h(e.BlackoutKick) and (t:BuffUp(e.BlackoutKickBuff) or (e.HitCombo:IsAvailable() and t:PrevGCD(1, e.TigerPalm) and t:Chi() == 2 and e.FistsOfFury:CooldownRemains() < 3) or (t:ChiDeficit() <= 1 and t:PrevGCD(1, e.SpinningCraneKick) and c() < 3))) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and (t:BuffUp(e.BlackoutKickBuff) or (e.HitCombo:IsAvailable() and t:PrevGCD(1, e.TigerPalm) and t:Chi() == 2 and e.FistsOfFury:CooldownRemains() < 3) or (t:ChiDeficit() <= 1 and t:PrevGCD(1, e.SpinningCraneKick) and c() < 3))) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and (t:BuffUp(e.BlackoutKickBuff) or (e.HitCombo:IsAvailable() and t:PrevGCD(1, e.TigerPalm) and t:Chi() == 2 and e.FistsOfFury:CooldownRemains() < 3) or (t:ChiDeficit() <= 1 and t:PrevGCD(1, e.SpinningCraneKick) and c() < 3))) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 100784
        return true
    elseif ((h(e.BlackoutKick) and (t:BuffUp(e.BlackoutKickBuff) or (e.HitCombo:IsAvailable() and t:PrevGCD(1, e.TigerPalm) and t:Chi() == 2 and e.FistsOfFury:CooldownRemains() < 3) or (t:ChiDeficit() <= 1 and t:PrevGCD(1, e.SpinningCraneKick) and c() < 3))) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function we(t)
                if ((h(e.RisingSunKick)) and (t:IsInMeleeRange(10)) and t:GUID() == m("mouseover"):GUID()) then
        r = 1107428
        return true
    elseif ((h(e.RisingSunKick)) and (t:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and t:GUID() ~= a:GUID() and not w and not string.find(t:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.RisingSunKick)) and (t:IsInMeleeRange(10)) and t:GUID() == a:GUID()) then
        o = 107428
        return true
    elseif ((h(e.RisingSunKick)) and (t:IsInMeleeRange(10)) and not string.find(t:GUID(), 174773)) then
        return true
    end

end

local function K(e)
                if ((e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1107428
        return true
    elseif ((e:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= a:GUID() and not w and not string.find(e:GUID(), 174773)) then
        r = 999
        return true
    elseif ((e:IsInMeleeRange(10)) and e:GUID() == a:GUID()) then
        o = 107428
        return true
    elseif ((e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function fe(i)
                if ((h(e.BlackoutKick) and t:BuffUp(e.WeaponsOfOrder) and e.RisingSunKick:CooldownRemains() > 2) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and t:BuffUp(e.WeaponsOfOrder) and e.RisingSunKick:CooldownRemains() > 2) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and t:BuffUp(e.WeaponsOfOrder) and e.RisingSunKick:CooldownRemains() > 2) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 100784
        return true
    elseif ((h(e.BlackoutKick) and t:BuffUp(e.WeaponsOfOrder) and e.RisingSunKick:CooldownRemains() > 2) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function ce(t)
                if ((h(e.BlackoutKick) or not e.HitCombo:IsAvailable()) and (t:IsInMeleeRange(10)) and t:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) or not e.HitCombo:IsAvailable()) and (t:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and t:GUID() ~= a:GUID() and not w and not string.find(t:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) or not e.HitCombo:IsAvailable()) and (t:IsInMeleeRange(10)) and t:GUID() == a:GUID()) then
        o = 100784
        return true
    elseif ((h(e.BlackoutKick) or not e.HitCombo:IsAvailable()) and (t:IsInMeleeRange(10)) and not string.find(t:GUID(), 174773)) then
        return true
    end

end

local function T(i)
                if ((h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() > 0 and t:BuffUp(e.WeaponsOfOrderChiBuff)) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() > 0 and t:BuffUp(e.WeaponsOfOrderChiBuff)) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() > 0 and t:BuffUp(e.WeaponsOfOrderChiBuff)) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 100784
        return true
    elseif ((h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() > 0 and t:BuffUp(e.WeaponsOfOrderChiBuff)) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function T(t)
                if (((e.Serenity:CooldownRemains() > 1) or (not e.Serenity:IsAvailable() and (e.WeaponsOfOrder:CooldownRemains() > 4 or x ~= 1) and ((not U) or e.FistsOfFury:CooldownRemains() > 0))) and (t:IsInMeleeRange(10)) and t:GUID() == m("mouseover"):GUID()) then
        r = 1107428
        return true
    elseif (((e.Serenity:CooldownRemains() > 1) or (not e.Serenity:IsAvailable() and (e.WeaponsOfOrder:CooldownRemains() > 4 or x ~= 1) and ((not U) or e.FistsOfFury:CooldownRemains() > 0))) and (t:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and t:GUID() ~= a:GUID() and not w and not string.find(t:GUID(), 174773)) then
        r = 999
        return true
    elseif (((e.Serenity:CooldownRemains() > 1) or (not e.Serenity:IsAvailable() and (e.WeaponsOfOrder:CooldownRemains() > 4 or x ~= 1) and ((not U) or e.FistsOfFury:CooldownRemains() > 0))) and (t:IsInMeleeRange(10)) and t:GUID() == a:GUID()) then
        o = 107428
        return true
    elseif (((e.Serenity:CooldownRemains() > 1) or (not e.Serenity:IsAvailable() and (e.WeaponsOfOrder:CooldownRemains() > 4 or x ~= 1) and ((not U) or e.FistsOfFury:CooldownRemains() > 0))) and (t:IsInMeleeRange(10)) and not string.find(t:GUID(), 174773)) then
        return true
    end

end

local function ye(e)
                if ((t:Chi() >= 5 and S) and (e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1107428
        return true
    elseif ((t:Chi() >= 5 and S) and (e:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= a:GUID() and not w and not string.find(e:GUID(), 174773)) then
        r = 999
        return true
    elseif ((t:Chi() >= 5 and S) and (e:IsInMeleeRange(10)) and e:GUID() == a:GUID()) then
        o = 107428
        return true
    elseif ((t:Chi() >= 5 and S) and (e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function pe(t)
                if ((e.FistsOfFury:CooldownRemains() > 0 and d >= 2) and (t:IsInMeleeRange(10)) and t:GUID() == m("mouseover"):GUID()) then
        r = 1107428
        return true
    elseif ((e.FistsOfFury:CooldownRemains() > 0 and d >= 2) and (t:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and t:GUID() ~= a:GUID() and not w and not string.find(t:GUID(), 174773)) then
        r = 999
        return true
    elseif ((e.FistsOfFury:CooldownRemains() > 0 and d >= 2) and (t:IsInMeleeRange(10)) and t:GUID() == a:GUID()) then
        o = 107428
        return true
    elseif ((e.FistsOfFury:CooldownRemains() > 0 and d >= 2) and (t:IsInMeleeRange(10)) and not string.find(t:GUID(), 174773)) then
        return true
    end

end

local function le(i)
                if ((t:Chi() >= 5 and t:BuffRemains(e.BonedustBrew) > (t:GCD() * 2) and EnemiesWithMotC < 4 and (10 / (1 + t:HastePct() / 100)) > (t:GCD() + 1) and e.FistsOfFury:CooldownRemains() > (t:GCD() + 1) and e.WhirlingDragonPunch:CooldownRemains() < 1 and e.WhirlingDragonPunch:IsAvailable() and d < 5) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1107428
        return true
    elseif ((t:Chi() >= 5 and t:BuffRemains(e.BonedustBrew) > (t:GCD() * 2) and EnemiesWithMotC < 4 and (10 / (1 + t:HastePct() / 100)) > (t:GCD() + 1) and e.FistsOfFury:CooldownRemains() > (t:GCD() + 1) and e.WhirlingDragonPunch:CooldownRemains() < 1 and e.WhirlingDragonPunch:IsAvailable() and d < 5) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((t:Chi() >= 5 and t:BuffRemains(e.BonedustBrew) > (t:GCD() * 2) and EnemiesWithMotC < 4 and (10 / (1 + t:HastePct() / 100)) > (t:GCD() + 1) and e.FistsOfFury:CooldownRemains() > (t:GCD() + 1) and e.WhirlingDragonPunch:CooldownRemains() < 1 and e.WhirlingDragonPunch:IsAvailable() and d < 5) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 107428
        return true
    elseif ((t:Chi() >= 5 and t:BuffRemains(e.BonedustBrew) > (t:GCD() * 2) and EnemiesWithMotC < 4 and (10 / (1 + t:HastePct() / 100)) > (t:GCD() + 1) and e.FistsOfFury:CooldownRemains() > (t:GCD() + 1) and e.WhirlingDragonPunch:CooldownRemains() < 1 and e.WhirlingDragonPunch:IsAvailable() and d < 5) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function T(i)
                if ((h(e.TigerPalm) and t:ChiDeficit() >= 2 and t:BuffDown(e.StormEarthAndFireBuff)) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((h(e.TigerPalm) and t:ChiDeficit() >= 2 and t:BuffDown(e.StormEarthAndFireBuff)) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.TigerPalm) and t:ChiDeficit() >= 2 and t:BuffDown(e.StormEarthAndFireBuff)) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 100780
        return true
    elseif ((h(e.TigerPalm) and t:ChiDeficit() >= 2 and t:BuffDown(e.StormEarthAndFireBuff)) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function je(i)
                if ((h(e.TigerPalm) and t:ChiDeficit() >= 2 and d >= 2) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((h(e.TigerPalm) and t:ChiDeficit() >= 2 and d >= 2) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.TigerPalm) and t:ChiDeficit() >= 2 and d >= 2) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 100780
        return true
    elseif ((h(e.TigerPalm) and t:ChiDeficit() >= 2 and d >= 2) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function T(e)
                if ((e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((e:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= a:GUID() and not w and not string.find(e:GUID(), 174773)) then
        r = 999
        return true
    elseif ((e:IsInMeleeRange(10)) and e:GUID() == a:GUID()) then
        o = 100780
        return true
    elseif ((e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function I(i)
                if ((h(e.BlackoutKick) and ((e.Serenity:IsAvailable() and e.Serenity:CooldownRemains() < 3) or (e.RisingSunKick:CooldownRemains() > 1 and e.FistsOfFury:CooldownRemains() > 1 or y) or (e.RisingSunKick:CooldownRemains() < 3 and (e.FistsOfFury:CooldownRemains() > 3 or y) and t:Chi() > 2) or (e.RisingSunKick:CooldownRemains() > 3 and e.FistsOfFury:CooldownRemains() < 3 and t:Chi() > 3) or (t:Chi() > 5) or (t:BuffUp(e.BlackoutKickBuff)))) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and ((e.Serenity:IsAvailable() and e.Serenity:CooldownRemains() < 3) or (e.RisingSunKick:CooldownRemains() > 1 and e.FistsOfFury:CooldownRemains() > 1 or y) or (e.RisingSunKick:CooldownRemains() < 3 and (e.FistsOfFury:CooldownRemains() > 3 or y) and t:Chi() > 2) or (e.RisingSunKick:CooldownRemains() > 3 and e.FistsOfFury:CooldownRemains() < 3 and t:Chi() > 3) or (t:Chi() > 5) or (t:BuffUp(e.BlackoutKickBuff)))) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and ((e.Serenity:IsAvailable() and e.Serenity:CooldownRemains() < 3) or (e.RisingSunKick:CooldownRemains() > 1 and e.FistsOfFury:CooldownRemains() > 1 or y) or (e.RisingSunKick:CooldownRemains() < 3 and (e.FistsOfFury:CooldownRemains() > 3 or y) and t:Chi() > 2) or (e.RisingSunKick:CooldownRemains() > 3 and e.FistsOfFury:CooldownRemains() < 3 and t:Chi() > 3) or (t:Chi() > 5) or (t:BuffUp(e.BlackoutKickBuff)))) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 100784
        return true
    elseif (h(e.BlackoutKick) and ((e.Serenity:IsAvailable() and e.Serenity:CooldownRemains() < 3) or (e.RisingSunKick:CooldownRemains() > 1 and e.FistsOfFury:CooldownRemains() > 1 or y) or (e.RisingSunKick:CooldownRemains() < 3 and (e.FistsOfFury:CooldownRemains() > 3 or y) and t:Chi() > 2) or (e.RisingSunKick:CooldownRemains() > 3 and e.FistsOfFury:CooldownRemains() < 3 and t:Chi() > 3) or (t:Chi() > 5) or (t:BuffUp(e.BlackoutKickBuff)))) and (i:IsInMeleeRange(10)) then
        return true
    end

    return 
end

local function I(i)
                if ((h(e.BlackoutKick) and (e.FistsOfFury:CooldownRemains() < 3 and t:Chi() == 2 and t:PrevGCD(1, e.TigerPalm) and t:EnergyTimeToX(50) < 1)) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and (e.FistsOfFury:CooldownRemains() < 3 and t:Chi() == 2 and t:PrevGCD(1, e.TigerPalm) and t:EnergyTimeToX(50) < 1)) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and (e.FistsOfFury:CooldownRemains() < 3 and t:Chi() == 2 and t:PrevGCD(1, e.TigerPalm) and t:EnergyTimeToX(50) < 1)) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 100784
        return true
    elseif ((h(e.BlackoutKick) and (e.FistsOfFury:CooldownRemains() < 3 and t:Chi() == 2 and t:PrevGCD(1, e.TigerPalm) and t:EnergyTimeToX(50) < 1)) and (i:IsInMeleeRange(10))) then
        return true
    end

end

local function I(i)
                if ((h(e.BlackoutKick) and (c() < 2 and (t:ChiDeficit() <= 1 or t:PrevGCD(1, e.TigerPalm))) or A) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and (c() < 2 and (t:ChiDeficit() <= 1 or t:PrevGCD(1, e.TigerPalm))) or A) and (i:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not w) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and (c() < 2 and (t:ChiDeficit() <= 1 or t:PrevGCD(1, e.TigerPalm))) or A) and (i:IsInMeleeRange(10)) and i:GUID() == a:GUID()) then
        o = 100784
        return true
    elseif (h(e.BlackoutKick) and (c() < 2 and (t:ChiDeficit() <= 1 or t:PrevGCD(1, e.TigerPalm))) or A) and (i:IsInMeleeRange(10)) then
        return true
    end

end

local function I(t)
                if (((not e.HitCombo:IsAvailable() or h(e.BlackoutKick))) and (t:IsInMeleeRange(10)) and t:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif (((not e.HitCombo:IsAvailable() or h(e.BlackoutKick))) and (t:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and t:GUID() ~= a:GUID() and not w) then
        r = 999
        return true
    elseif (((not e.HitCombo:IsAvailable() or h(e.BlackoutKick))) and (t:IsInMeleeRange(10)) and t:GUID() == a:GUID()) then
        o = 100784
        return true
    elseif ((not e.HitCombo:IsAvailable() or h(e.BlackoutKick))) and (t:IsInMeleeRange(10)) then
        return true
    end

end

local function I(t)
                if (((not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (t:IsInMeleeRange(10)) and t:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif (((not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (t:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and t:GUID() ~= a:GUID() and not w and not string.find(t:GUID(), 174773)) then
        r = 999
        return true
    elseif (((not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (t:IsInMeleeRange(10)) and t:GUID() == a:GUID()) then
        o = 100780
        return true
    elseif (((not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (t:IsInMeleeRange(10)) and not string.find(t:GUID(), 174773)) then
        return true
    end

end

local function I(e)
                if ((e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((e:IsInMeleeRange(10)) and s.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= a:GUID() and not w) then
        r = 999
        return true
    elseif ((e:IsInMeleeRange(10)) and e:GUID() == a:GUID()) then
        o = 100784
        return true
    elseif (e:IsInMeleeRange(10)) then
        return true
    end

end

local function ze()
    local e = t:GetUseableTrinkets(M)
    if e then
                if e:ID() == GetInventoryItemID("player", 13) and s.Commons.Enabled.TopTrinket then
            if i.Cast(e, nil, nil) then
                o = 24
                return "top trinket 1"
            end

        elseif e:ID() == GetInventoryItemID("player", 14) and s.Commons.Enabled.BottomTrinket then
            if i.Cast(e, nil, nil) then
                o = 35
                return "bot trinket 1"
            end

        end

    end

end

local function _e()
    if e.Fleshcraft:IsCastable() and not t:IsMoving() and z and (_ == 0 or _ > t:GCD() * 1.25) and not t:AffectingCombat() then
        if i.Cast(e.Fleshcraft) then
            o = 324631
            return "fleshcraft precombat 2"
        end

    end

    if e.ExpelHarm:IsReady() and a:IsInRange(10) and (t:ChiDeficit() > 0) then
        if i.Cast(e.ExpelHarm, nil, nil, not a:IsInMeleeRange(8)) then
            o = 322101
            return "expel_harm opener 4"
        end

    end

    if e.ChiBurst:IsReady() and a:IsInRange(30) and not t:IsMoving() and (_ == 0 or _ > e.ChiBurst:CastTime() + .5) and (x ~= 3) then
        if i.Cast(e.ChiBurst, nil, nil, not a:IsInRange(40)) then
            o = 123986
            return "Chi Burst 4"
        end

    end

    if e.ChiWave:IsReady() and a:IsInRange(40) and (not e.EnergizingElixir:IsAvailable()) then
        if i.Cast(e.ChiWave, nil, nil, not a:IsInRange(40)) then
            o = 115098
            return "Chi Wave 6"
        end

    end

end

local function Ee()
    if e.WhirlingDragonPunch:IsReady() and not A and not W and a:IsInRange(8) and ((t:BuffStack(e.PrimordialPotentialBuff) < 9 or e.RisingSunKick:CooldownRemains() < (2 * t:GCD())) and (not e.BonedustBrew:IsAvailable() or (UnitsWithBDBCount > 0 and (e.BonedustBrew:CooldownRemains() > e.FistsOfFury:CooldownRemains() or (e.BonedustBrew:CooldownRemains() == 0 and not z))))) then
        if i.Cast(e.WhirlingDragonPunch, nil, nil, not a:IsInMeleeRange(8)) then
            o = 152175
            return "Whirling Dragon Punch 300"
        end

    end

    if e.FistsOfFury:IsReady() and not y and a:IsInRange(10) and (t:BuffUp(e.FirstStrikeBuff) and not t:BuffUp(e.DanceOfChijiBuff)) then
        if i.Cast(e.FistsOfFury, nil, nil, not a:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 306"
        end

    end

    if (e.SpinningCraneKick:IsReady(BypassRecovery)) and (h(e.SpinningCraneKick) and t:BuffUp(e.DanceOfChijiBuff) and (not e.BonedustBrew:IsAvailable() or ((e.BonedustBrew:CooldownRemains() > t:BuffRemains(e.DanceOfChijiBuff) or (e.BonedustBrew:CooldownRemains() == 0 and not z)) and (e.BonedustBrew:CooldownRemains() > 6 or (e.BonedustBrew:CooldownRemains() == 0 and not z))))) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 306"
        end

    end

    if e.FistsOfFury:IsReady() and not y and a:IsInRange(10) and (c() > e.FistsOfFury:ExecuteTime() or t:ChiDeficit() <= 1 or t:BuffUp(e.PrimordialPowerBuff)) then
        if i.Cast(e.FistsOfFury, nil, nil, not a:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 306"
        end

    end

    if e.RisingSunKick:IsReady() then
        if f.CastTargetIf(e.RisingSunKick, p, "min", u, me) then
            return "Rising Sun Kick 308"
        end

        if u(a) and me(a) then
            if i.Cast(e.RisingSunKick, nil, nil, not a:IsSpellInRange(e.RisingSunKick)) then
                o = 107428
                return "Rising Sun Kick 310"
            end

        end

    end

    if e.RushingJadeWind:IsReady() and (t:BuffDown(e.RushingJadeWindBuff)) and a:IsInRange(8) then
        if i.Cast(e.RushingJadeWind, nil, nil, not a:IsInMeleeRange(8)) then
            o = 116847
            return "Rushing Jade Wind 312"
        end

    end

    if e.ExpelHarm:IsReady() and a:IsInRange(8) and t:ChiDeficit() >= 1 then
        if i.Cast(e.ExpelHarm, nil, nil, not a:IsInMeleeRange(8)) then
            o = 322101
            return "Expel Harm 316"
        end

    end

    if e.FistOfTheWhiteTiger:IsReady() then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, de) then
            return "Fist of the White Tiger 318"
        end

        if u(a) and de(a) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not a:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "Fist of the White Tiger 320"
            end

        end

    end

    if e.ChiBurst:IsReady() and not t:IsMoving() and (_ == 0 or _ > e.ChiBurst:CastTime() + .5) and a:IsInRange(30) and (t:ChiDeficit() >= 2 and UnitsWithBDBCount == 0) then
        if i.Cast(e.ChiBurst, nil, nil, not a:IsInRange(40)) then
            o = 123986
            return "Chi Burst 322"
        end

    end

    if e.CracklingJadeLightning:IsReady() and ((t:BuffStack(e.TheEmperorsCapacitor) > 19) and (c() > (e.CracklingJadeLightning:ExecuteTime() - 1)) and (e.FistsOfFury:CooldownRemains() > e.CracklingJadeLightning:ExecuteTime() or y)) then
        if i.Cast(e.CracklingJadeLightning, nil, nil, not a:IsInRange(40)) then
            o = 117952
            return "Crackling Jade Lightning 324"
        end

    end

    if e.TigerPalm:IsReady() then
        if f.CastTargetIf(e.TigerPalm, p, "min", q, ue) then
            return "Tiger Palm 326"
        end

        if q(a) and ue(a) then
            if i.Cast(e.TigerPalm, nil, nil, not a:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "Tiger Palm 328"
            end

        end

    end

    if e.ArcaneTorrent:IsReady() and a:IsInRange(8) and t:ChiDeficit() >= 1 then
        if i.Cast(e.ArcaneTorrent, nil, nil, not a:IsInMeleeRange(8)) then
            o = 50613
            return "Arcane Torrent 402"
        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInMeleeRange(10) and (h(e.SpinningCraneKick) and ((e.BonedustBrew:CooldownRemains() > 2 or (e.BonedustBrew:CooldownRemains() == 0 and not z)) or x ~= 4) and (t:Chi() >= 5 or e.FistsOfFury:CooldownRemains() > 6 or (e.FistsOfFury:CooldownRemains() > 3 and t:Chi() >= 3 and t:EnergyTimeToX(50) < 1) or c() <= (3 + 3 * C(e.FistsOfFury:CooldownRemains() < 5)) or t:BuffUp(e.StormEarthAndFireBuff))) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 314"
        end

    end

    if e.ChiWave:IsReady() and a:IsInRange(40) and (h(e.ChiWave)) then
        if i.Cast(e.ChiWave, nil, nil, not a:IsInRange(40)) then
            o = 115098
            return "Chi Wave 330"
        end

    end

    local n = e.FlyingSerpentKickActionBarReplacement:IsAvailable() and e.FlyingSerpentKickActionBarReplacement or e.FlyingSerpentKick
    if e.FlyingSerpentKickActionBarReplacement:IsReady() and not D and a:IsInRange(10) and not s.Windwalker.IgnoreFSK then
        if i.Cast(e.FlyingSerpentKickActionBarReplacement, nil, nil, not a:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick Slam 332"
        end

    end

    if e.FlyingSerpentKick:IsReady() and not D and a:IsInRange(10) and not s.Windwalker.IgnoreFSK and t:BuffDown(e.BlackoutKickBuff) then
        if i.Cast(e.FlyingSerpentKick, nil, nil, not a:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick 334"
        end

    end

    if e.BlackoutKick:IsReady() then
        if f.CastTargetIf(e.BlackoutKick, p, "min", u, ve) then
            return "Blackout Kick 336"
        end

        if u(a) and ve(a) then
            if i.Cast(e.BlackoutKick, nil, nil, not a:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 338"
            end

        end

    end

end

local function ue()
    if e.BonedustBrew:IsReady() and UnitsWithBDBCount == 0 and (z) and a:IsInRange(10) and ((d < 3 and t:Chi() >= 3 and R) or (d >= 3 and ((S and R) or (e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() >= 2)) and t:Chi() >= 4)) then
        if i.Cast(e.BonedustBrew, nil, nil) then
            o = 325216
            return "Bonedust Brew 412"
        end

    end

    if e.RisingSunKick:IsReady() then
        if f.CastTargetIf(e.RisingSunKick, p, "min", u, ye) then
            return "Rising Sun Kick 806"
        end

        if u(a) and ye(a) then
            if i.Cast(e.RisingSunKick, nil, nil, not a:IsSpellInRange(e.RisingSunKick)) then
                o = 107428
                return "Rising Sun Kick 808"
            end

        end

    end

    if e.FistsOfFury:IsReady() and not y and (t:Chi() >= 5 and d >= 3 and not S) then
        if i.Cast(e.FistsOfFury, nil, nil, not a:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 810"
        end

    end

    if e.TigerPalm:IsReady() then
        if f.CastTargetIf(e.TigerPalm, p, "min", q, je) then
            return "Tiger Palm 826"
        end

        if q(a) and je(a) then
            if i.Cast(e.TigerPalm, nil, nil, not a:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "Tiger Palm 828"
            end

        end

    end

    if e.RisingSunKick:IsReady() then
        if f.CastTargetIf(e.RisingSunKick, p, "min", u, pe) then
            return "Rising Sun Kick 806"
        end

        if u(a) and pe(a) then
            if i.Cast(e.RisingSunKick, nil, nil, not a:IsSpellInRange(e.RisingSunKick)) then
                o = 107428
                return "Rising Sun Kick 808"
            end

        end

    end

end

local function de()
    if e.FistOfTheWhiteTiger:IsReady() and (t:ChiDeficit() >= 3 and (c() < 1 or (c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5) or (e.WeaponsOfOrder:CooldownRemains() < 2)) and t:BuffDown(e.PrimordialPowerBuff) and not Cap_Energy) then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, O) then
            return "Fist of the White Tiger 200"
        end

        if u(a) and O(a) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not a:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "fist_of_the_white_tiger opener 2"
            end

        end

    end

    if e.ExpelHarm:IsReady() and (t:ChiDeficit() >= 1 and (c() < 1 or (e.Serenity:CooldownRemains() < 2) or (c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5) or e.WeaponsOfOrder:CooldownRemains() < 2) and (t:BuffUp(e.BonedustBrew) or t:BloodlustUp() or t:BuffUp(e.InvokersDelightBuff)) and not Cap_Energy) then
        if i.Cast(e.ExpelHarm, nil, nil, not a:IsInMeleeRange(8)) then
            o = 322101
            return "expel_harm opener 10"
        end

    end

    if e.TigerPalm:IsReady() and (h(e.TigerPalm) and t:ChiDeficit() >= 2 and (c() < 1 or (e.Serenity:CooldownRemains() < 2) or (c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5) or e.WeaponsOfOrder:CooldownRemains() < 2) and t:BuffDown(e.PrimordialPowerBuff) and not Cap_Energy) then
        if f.CastTargetIf(e.TigerPalm, p, "min", q, T) then
            return "Tiger Palm 214"
        end

        if q(a) and T(a) then
            if i.Cast(e.TigerPalm, nil, nil, not a:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "tiger_palm opener 12"
            end

        end

    end

end

local function me()
    if e.WhirlingDragonPunch:IsReady() and not W and a:IsInRange(8) and (e.RisingSunKick:CooldownRemains() < (2 * t:GCD())) then
        if i.Cast(e.WhirlingDragonPunch, nil, nil, not a:IsInMeleeRange(8)) then
            o = 152175
            return "Whirling Dragon Punch 800"
        end

    end

    if d >= 3 and t:PrevGCD(1, e.SpinningCraneKick) and not t:BuffUp(e.WhirlingDragonPunchBuff) then
        local e = de()
        if e then
            return e
        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(10) and (h(e.SpinningCraneKick) and t:BuffUp(e.DanceOfChijiBuff)) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 804"
        end

    end

    if e.RisingSunKick:IsReady() then
        if f.CastTargetIf(e.RisingSunKick, p, "min", u, le) then
            return "Rising Sun Kick 806"
        end

        if u(a) and le(a) then
            if i.Cast(e.RisingSunKick, nil, nil, not a:IsSpellInRange(e.RisingSunKick)) then
                o = 107428
                return "Rising Sun Kick 808"
            end

        end

    end

    if e.FistsOfFury:IsReady() and not y and (d >= 3 and ((t:HasTier(28, 2) and a:DebuffUp(e.CarversEyeDebuff)) or EnemiesWithMotC < 4 or not e.CalculatedStrikes:ConduitEnabled())) then
        if i.Cast(e.FistsOfFury, nil, nil, not a:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 810"
        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(10) and (d >= 3 and (h(e.SpinningCraneKick) or (t:BuffRemains(e.BonedustBrew) < (2 * t:GCD())) or (not TP_Fill or (t:ChiDeficit() < 2 and e.CalculatedStrikes:ConduitEnabled() and EnemiesWithMotC > 3)) and R)) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 804"
        end

    end

    if e.FistOfTheWhiteTiger:IsReady() and (d >= 3 and t:ChiDeficit() >= 3) then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, O) then
            return "Fist of the White Tiger 722"
        end

        if u(a) and O(a) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not a:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "Fist of the White Tiger 724"
            end

        end

    end

    if e.TigerPalm:IsReady() and (d >= 3 and t:ChiDeficit() >= 2) then
        if f.CastTargetIf(e.TigerPalm, p, "min", q, T) then
            return "Tiger Palm 730"
        end

        if q(a) and T(a) then
            if i.Cast(e.TigerPalm, nil, nil, not a:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "Tiger Palm 732"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(10) and (d >= 3 or ((h(e.SpinningCraneKick) or not TP_Fill or t:ChiDeficit() < 2 or t:BuffRemains(e.BonedustBrew) < (2 * t:GCD())) and e.CalculatedStrikes:ConduitEnabled() and EnemiesWithMotC == 5)) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 804"
        end

    end

end

local function le()
    if e.InvokeXuenTheWhiteTiger:IsReady() and H and a:IsInRange(15) and (not N and e.BonedustBrew:IsAvailable() and (e.BonedustBrew:CooldownRemains() <= 5 or not z) and ((d < 3 and t:Chi() >= 3) or d >= 3 and t:Chi() >= 2 and (S or e.FistsOfFury:CooldownRemains() > 0 or e.FistsOfFury:CooldownUp()))) then
        if i.Cast(e.InvokeXuenTheWhiteTiger, nil, nil, not a:IsInRange(40)) then
            o = 123904
            return "Invoke Xuen the White Tiger 400"
        end

    end

    if e.StormEarthAndFire:IsReady() and Z and a:IsInRange(10) and (x == 4 and ((l < 30 and V and e.BonedustBrew:CooldownRemains() < 4 and t:Chi() >= 4) or (t:BuffUp(e.BonedustBrew) and not ke) or (not R and d >= 3 and e.BonedustBrew:CooldownRemains() <= 2 and V and (S or (e.FistsOfFury:CooldownRemains() > 0 and (e.RisingSunKick:CooldownUp() or e.RisingSunKick:CooldownRemains() > 0))) and t:Chi() >= 2)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() < 15 or (e.InvokeXuenTheWhiteTiger:CooldownRemains() > e.StormEarthAndFire:FullRechargeTime()))) then
        if i.Cast(e.StormEarthAndFire, nil) then
            o = 137639
            return "Storm Earth and Fire 416"
        end

    end

    if e.BonedustBrew:IsReady() and UnitsWithBDBCount == 0 and (z) and a:IsInRange(8) and ((t:BuffDown(e.BonedustBrew) and t:BuffUp(e.StormEarthAndFireBuff) and t:BuffRemains(e.StormEarthAndFireBuff) < 11 and R) or (t:BuffDown(e.BonedustBrew) and l < 30 and l > 10 and R and t:Chi() >= 4)) then
        if i.Cast(e.BonedustBrew, nil, nil) then
            o = 325216
            return "Bonedust Brew 412"
        end

    end

    if t:BuffDown(e.BonedustBrew) and (x == 4 and V and e.BonedustBrew:CooldownRemains() <= 2 and ((l > 60 and (e.StormEarthAndFire:Charges() > 0 or e.StormEarthAndFire:CooldownRemains() > 10) and (k or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 10 or N)) or ((k or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 13) and (e.StormEarthAndFire:Charges() > 0 or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 13 or t:BuffUp(e.StormEarthAndFireBuff))))) then
        local e = ue()
        if e then
            return e
        end

    end

    if e.InvokeXuenTheWhiteTiger:IsReady() and H and a:IsInRange(15) and (not N and x ~= 4 and (e.RisingSunKick:CooldownRemains() < 2 or x ~= 1) and t:Chi() >= 3) then
        if i.Cast(e.InvokeXuenTheWhiteTiger, nil, nil, not a:IsInRange(40)) then
            o = 123904
            return "Invoke Xuen the White Tiger 400"
        end

    end

    if e.TouchOfDeath:IsReady() and not oe and a:IsInRange(8) and ((not s.Windwalker.ToDExecute and a:HealthPercentage() <= 15) or (s.Windwalker.ToDExecute and UnitHealth("target") < UnitHealth("player"))) and (l > (180 - C(he) * 120) or (t:BuffDown(e.StormEarthAndFireBuff) and k and (x ~= 4 or t:BuffUp(e.BonedustBrew))) or ((e.InvokeXuenTheWhiteTiger:CooldownRemains() > l) and t:BuffUp(e.BonedustBrew))) then
        if i.Cast(e.TouchOfDeath, nil, nil, not a:IsSpellInRange(e.TouchOfDeath)) then
            o = 322109
            return "Touch of Death 404"
        end

    end

    if e.WeaponsOfOrder:IsReady() and z and a:IsInRange(8) and (e.RisingSunKick:CooldownRemains() < e.WeaponsOfOrder:ExecuteTime() and e.InvokeXuenTheWhiteTiger:CooldownRemains() > (20 + 20 * C(L)) and (not U or e.FistsOfFury:CooldownRemains() > 0)) then
        if i.Cast(e.WeaponsOfOrder, nil, nil) then
            o = 310454
            return "Weapons Of Order 406"
        end

    end

    if e.FallenOrder:IsReady() and z and a:IsInRange(8) then
        if i.Cast(e.FallenOrder, nil, nil) then
            o = 326860
            return "Faeline Stomp 410"
        end

    end

    if e.StormEarthAndFire:IsReady() and Z and a:IsInRange(10) and (x ~= 4 and ((e.StormEarthAndFire:Charges() == 2) or t:BuffUp(e.WeaponsOfOrder) or (x == 1 and e.WeaponsOfOrder:CooldownRemains() > e.StormEarthAndFire:FullRechargeTime()) or (e.InvokeXuenTheWhiteTiger:CooldownRemains() > e.StormEarthAndFire:FullRechargeTime())) and e.FistsOfFury:CooldownRemains() <= 9 and t:Chi() >= 2 and e.WhirlingDragonPunch:CooldownRemains() <= 12) then
        if i.Cast(e.StormEarthAndFire, nil) then
            o = 137639
            return "Storm Earth and Fire 416"
        end

    end

    if s.Commons.Enabled.TopTrinket or s.Commons.Enabled.BottomTrinket then
        local a = t:GetUseableTrinkets(M)
        if n.InscrutibleQuantumDevice:IsEquippedAndReady() and (k or (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 60 and l > 180)) then
                        if n.InscrutibleQuantumDevice:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket InscrutibleQuantumDevice"
            elseif n.InscrutibleQuantumDevice:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket InscrutibleQuantumDevice"
            end

        end

        if n.Wrathstone:IsEquippedAndReady() and (k or l < 20) then
                        if n.Wrathstone:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket Wrathstone"
            elseif n.Wrathstone:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket Wrathstone"
            end

        end

        if n.ShadowgraspTotem:IsEquippedAndReady() and (k or l < 20 or not L) then
                        if n.ShadowgraspTotem:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket ShadowgraspTotem"
            elseif n.ShadowgraspTotem:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket ShadowgraspTotem"
            end

        end

        if n.OverchargedAnimaBattery:IsEquippedAndReady() and (k or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 90 or l < 20) then
                        if n.OverchargedAnimaBattery:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket OverchargedAnimaBattery"
            elseif n.OverchargedAnimaBattery:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket OverchargedAnimaBattery"
            end

        end

        if n.GladiatorsBadgeCosmic:IsEquippedAndReady() and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 55 or N or l < 15) then
                        if n.GladiatorsBadgeCosmic:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeCosmic"
            elseif n.GladiatorsBadgeCosmic:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeCosmic"
            end

        end

        if n.GladiatorsBadgeSinful:IsEquippedAndReady() and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 55 or N or l < 15) then
                        if n.GladiatorsBadgeSinful:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeSinful"
            elseif n.GladiatorsBadgeSinful:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeSinful"
            end

        end

        if n.GladiatorsBadgeUnchained:IsEquippedAndReady() and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 55 or N or l < 15) then
                        if n.GladiatorsBadgeUnchained:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeUnchained"
            elseif n.GladiatorsBadgeUnchained:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeUnchained"
            end

        end

        if n.EnforcersStunGrenade:IsEquippedAndReady() and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 55 or N or l < 15) then
                        if n.EnforcersStunGrenade:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket EnforcersStunGrenade"
            elseif n.EnforcersStunGrenade:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket EnforcersStunGrenade"
            end

        end

        if n.TheFirstSigil:IsEquippedAndReady() and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() < 9 or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 60 and l > 300 or l < 20) then
                        if n.TheFirstSigil:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket TheFirstSigil"
            elseif n.TheFirstSigil:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket TheFirstSigil"
            end

        end

        if n.CacheofAcquiredTreasures:IsEquippedAndReady() and ((d < 2 and t:BuffUp(e.AcquiredWandBuff)) or (d > 1 and t:BuffUp(e.AcquiredAxeBuff) or l < 20)) then
                        if n.CacheofAcquiredTreasures:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket CacheofAcquiredTreasures"
            elseif n.CacheofAcquiredTreasures:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket CacheofAcquiredTreasures"
            end

        end

    end

    if n.Jotungeirr:IsEquippedAndReady() and v() and (k or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 60 and l > 180 or l < 20) then
        if Y(n.Jotungeirr, nil, nil) then
            o = 16
            return "jotungeirr_destinys_call bear 8"
        end

    end

    if e.BloodFury:IsCastable() and v() and a:IsInRange(8) and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or not H or VarXuenHold or j.BossFilteredFightRemains("<", 20)) then
        if i.Cast(e.BloodFury, nil) then
            o = 20572
            return "Blood Fury 420"
        end

    end

    if e.Berserking:IsCastable() and v() and a:IsInRange(8) and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or not H or VarXuenHold or j.BossFilteredFightRemains("<", 15)) then
        if i.Cast(e.Berserking, nil) then
            o = 26297
            return "Berserking 422"
        end

    end

    if e.LightsJudgment:IsCastable() and v() and a:IsInRange(8) then
        if i.Cast(e.LightsJudgment, nil, nil, not a:IsInRange(40)) then
            o = 255647
            return "Lights Judgment 424"
        end

    end

    if e.Fireblood:IsCastable() and v() and a:IsInRange(8) and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or not H or VarXuenHold or j.BossFilteredFightRemains("<", 10)) then
        if i.Cast(e.Fireblood, nil) then
            o = 265221
            return "Fireblood 426"
        end

    end

    if e.AncestralCall:IsCastable() and v() and a:IsInRange(8) and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or not H or VarXuenHold or j.BossFilteredFightRemains("<", 20)) then
        if i.Cast(e.AncestralCall, nil) then
            o = 274738
            return "Ancestral Call 428"
        end

    end

    if e.BagOfTricks:IsCastable() and v() and a:IsInRange(8) and t:BuffDown(e.StormEarthAndFire) then
        if i.Cast(e.BagOfTricks, nil, nil, not a:IsInRange(40)) then
            o = 312411
            return "Bag of Tricks 430"
        end

    end

    if e.Fleshcraft:IsCastable() and not t:IsMoving() and z and (_ == 0 or _ > t:GCD() * 1.25) and s.Windwalker.CastCancelFC and (e.PustuleEruption:SoulbindEnabled() and not k and t:BuffDown(e.StormEarthAndFire) and t:BuffDown(e.BonedustBrew)) then
        if Y(e.Fleshcraft, nil, nil) then
            o = 324631
            return "fleshcraft cd_sef 52"
        end

    end

end

local function ue()
    P = (e.Serenity:CooldownRemains() < 1 or k and e.Serenity:CooldownRemains() > 30 or l < 20)
    if e.InvokeXuenTheWhiteTiger:IsReady() and H and a:IsInRange(8) and ((not N) or l < 25) then
        if i.Cast(e.InvokeXuenTheWhiteTiger, nil, nil, not a:IsInRange(40)) then
            o = 123904
            return "Invoke Xuen the White Tiger 500"
        end

    end

    if P then
        if e.AncestralCall:IsCastable() and v() and a:IsInRange(8) then
            if i.Cast(e.AncestralCall, nil) then
                o = 274738
                return "Ancestral Call 512"
            end

        end

        if e.BloodFury:IsCastable() and v() and a:IsInRange(8) then
            if i.Cast(e.BloodFury, nil) then
                o = 20572
                return "Blood Fury 502"
            end

        end

        if e.Fireblood:IsCastable() and v() and a:IsInRange(8) then
            if i.Cast(e.Fireblood, nil) then
                o = 265221
                return "Fireblood 510"
            end

        end

        if e.Berserking:IsCastable() and v() and a:IsInRange(8) then
            if i.Cast(e.Berserking, nil) then
                o = 26297
                return "Berserking 504"
            end

        end

        if e.BagOfTricks:IsCastable() and a:IsInRange(8) then
            if i.Cast(e.BagOfTricks, nil, nil, not a:IsInRange(40)) then
                o = 312411
                return "Bag of Tricks 528"
            end

        end

    end

    if e.LightsJudgment:IsCastable() and v() and a:IsInRange(8) then
        if i.Cast(e.LightsJudgment, nil, nil, not a:IsInRange(40)) then
            o = 255647
            return "Lights Judgment 508"
        end

    end

    if e.TouchOfDeath:IsReady() and not oe and a:IsInRange(8) and ((not s.Windwalker.ToDExecute and a:HealthPercentage() <= 15) or (s.Windwalker.ToDExecute and UnitHealth("target") < UnitHealth("player"))) and (l > (180 - C(he) * 120) or k and (x ~= 4 or t:BuffUp(e.BonedustBrew)) or (e.InvokeXuenTheWhiteTiger:CooldownRemains() > l) and t:BuffUp(e.BonedustBrew) or l < 10) then
        if i.Cast(e.TouchOfDeath, nil, nil, not a:IsSpellInRange(e.TouchOfDeath)) then
            o = 322109
            return "Touch of Death 514"
        end

    end

    if e.WeaponsOfOrder:IsReady() and z and a:IsInRange(10) and (e.RisingSunKick:CooldownRemains() < e.WeaponsOfOrder:ExecuteTime()) then
        if i.Cast(e.WeaponsOfOrder, nil, nil) then
            o = 310454
            return "Weapons Of Order 518"
        end

    end

    if (P or l < 20) then
        if n.Jotungeirr:IsEquippedAndReady() and v() then
            if Y(n.Jotungeirr, nil, nil) then
                o = 16
                return "jotungeirr_destinys_call cd_serenity 22"
            end

        end

        if s.Commons.Enabled.TopTrinket or s.Commons.Enabled.BottomTrinket then
            local e = t:GetUseableTrinkets(M)
            if n.InscrutibleQuantumDevice:IsEquippedAndReady() then
                                if n.InscrutibleQuantumDevice:ID() == b and s.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket InscrutibleQuantumDevice"
                elseif n.InscrutibleQuantumDevice:ID() == g and s.Commons.Enabled.BottomTrinket then
                    o = 35
                    return "bot trinket InscrutibleQuantumDevice"
                end

            end

            if n.Wrathstone:IsEquippedAndReady() then
                                if n.Wrathstone:ID() == b and s.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket Wrathstone"
                elseif n.Wrathstone:ID() == g and s.Commons.Enabled.BottomTrinket then
                    o = 35
                    return "bot trinket Wrathstone"
                end

            end

            if n.OverchargedAnimaBattery:IsEquippedAndReady() then
                                if n.OverchargedAnimaBattery:ID() == b and s.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket OverchargedAnimaBattery"
                elseif n.OverchargedAnimaBattery:ID() == g and s.Commons.Enabled.BottomTrinket then
                    o = 35
                    return "bot trinket OverchargedAnimaBattery"
                end

            end

        end

    end

    if n.ShadowgraspTotem:IsEquippedAndReady() and (k or l < 20 or not L) then
                if n.ShadowgraspTotem:ID() == b and s.Commons.Enabled.TopTrinket then
            o = 24
            return "top trinket ShadowgraspTotem"
        elseif n.ShadowgraspTotem:ID() == g and s.Commons.Enabled.BottomTrinket then
            o = 35
            return "bot trinket ShadowgraspTotem"
        end

    end

    if (s.Commons.Enabled.TopTrinket or s.Commons.Enabled.BottomTrinket) and (P or l < 20) then
        if n.GladiatorsBadgeCosmic:IsEquippedAndReady() and (k or l < 20 or not L) then
                        if n.GladiatorsBadgeCosmic:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeCosmic"
            elseif n.GladiatorsBadgeCosmic:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeCosmic"
            end

        end

        if n.GladiatorsBadgeSinful:IsEquippedAndReady() and (k or l < 20 or not L) then
                        if n.GladiatorsBadgeSinful:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeSinful"
            elseif n.GladiatorsBadgeSinful:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeSinful"
            end

        end

        if n.GladiatorsBadgeUnchained:IsEquippedAndReady() and (k or l < 20 or not L) then
                        if n.GladiatorsBadgeUnchained:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeUnchained"
            elseif n.GladiatorsBadgeUnchained:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeUnchained"
            end

        end

        if n.EnforcersStunGrenade:IsEquippedAndReady() and (k or l < 20 or not L) then
                        if n.EnforcersStunGrenade:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket EnforcersStunGrenade"
            elseif n.EnforcersStunGrenade:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket EnforcersStunGrenade"
            end

        end

        if n.TheFirstSigil:IsEquippedAndReady() then
                        if n.TheFirstSigil:ID() == b and s.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket TheFirstSigil"
            elseif n.TheFirstSigil:ID() == g and s.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket TheFirstSigil"
            end

        end

    end

    if ((not qe) or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 20 or N) then
        local e = ze()
        if e then
            return e
        end

    end

    if e.FaelineStomp:IsReady() and z and a:IsInRange(10) and h(e.FaelineStomp) then
        if i.Cast(e.FaelineStomp, nil, nil) then
            o = 327104
            return "Faeline Stomp 520"
        end

    end

    if e.FallenOrder:IsReady() and z and a:IsInRange(8) then
        if i.Cast(e.FallenOrder, nil, nil) then
            o = 326860
            return "Faeline Stomp 522"
        end

    end

    if e.BonedustBrew:IsReady() and UnitsWithBDBCount == 0 and z and a:IsInRange(8) and (l < 15 or (t:Chi() >= 2 and (l > 60 and ((e.Serenity:CooldownRemains() > 10 or t:BuffUp(e.SerenityBuff) or e.Serenity:CooldownUp()) and (k or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 10 or N))) or (l <= 60 and (k or e.InvokeXuenTheWhiteTiger:CooldownRemains() > l)))) then
        if i.Cast(e.BonedustBrew, nil, nil) then
            o = 325216
            return "Bonedust Brew 524"
        end

    end

    if e.Serenity:IsReady() and a:IsInRange(8) and (e.RisingSunKick:CooldownRemains() < 2 or l < 15) then
        if i.Cast(e.Serenity, nil) then
            o = 152173
            return "Serenity 526"
        end

    end

    if e.BagOfTricks:IsCastable() and a:IsInRange(8) then
        if i.Cast(e.BagOfTricks, nil, nil, not a:IsInRange(40)) then
            o = 312411
            return "Bag of Tricks 528"
        end

    end

end

local function P()
    if e.FistOfTheWhiteTiger:IsReady() and (t:ChiDeficit() >= 3) then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, O) then
            return "Fist of the White Tiger 200"
        end

        if u(a) and O(a) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not a:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "fist_of_the_white_tiger opener 2"
            end

        end

    end

    if e.ExpelHarm:IsReady() and a:IsInRange(8) and (e.ChiBurst:IsAvailable() and t:ChiDeficit() >= 3) then
        if i.Cast(e.ExpelHarm, nil, nil, not a:IsInMeleeRange(8)) then
            o = 322101
            return "expel_harm opener 4"
        end

    end

    if e.TigerPalm:IsReady() and (h(e.TigerPalm) and t:ChiDeficit() >= 2) then
        if f.CastTargetIf(e.TigerPalm, p, "min", q, T) then
            return "Tiger Palm 206"
        end

        if q(a) and T(a) then
            if i.Cast(e.TigerPalm, nil, nil, not a:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "tiger_palm opener 6"
            end

        end

    end

    if e.ChiWave:IsReady() and a:IsInRange(40) and t:ChiDeficit() >= 2 then
        if i.Cast(e.ChiWave, nil, nil, not a:IsInRange(40)) then
            o = 115098
            return "chi_wave opener 8"
        end

    end

    if e.ExpelHarm:IsReady() and a:IsInRange(10) then
        if i.Cast(e.ExpelHarm, nil, nil, not a:IsInMeleeRange(8)) then
            o = 322101
            return "expel_harm opener 10"
        end

    end

    if e.TigerPalm:IsReady() and (t:ChiDeficit() >= 2) then
        if f.CastTargetIf(e.TigerPalm, p, "min", q, T) then
            return "Tiger Palm 214"
        end

        if q(a) and T(a) then
            if i.Cast(e.TigerPalm, nil, nil, not a:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "tiger_palm opener 12"
            end

        end

    end

end

local function L()
    if e.FistsOfFury:IsReady() and not y and a:IsInRange(8) and t:BuffRemains(e.SerenityBuff) < 1 and (not UnitsWithBDBCount == 0 or not i.AoEON() or d <= 3) then
        if i.Cast(e.FistsOfFury, nil, nil, not a:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 600"
        end

    end

    if v() and (s.Commons.Enabled.TopTrinket or s.Commons.Enabled.BottomTrinket) then
        if (true) then
            local e = ze()
            if e then
                return e
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(8) and (h(e.SpinningCraneKick or EnemiesWithMotC >= 5) and ((i.AoEON() and d >= 3) or (d > 1 and not e.RisingSunKick:CooldownUp()))) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 602"
        end

    end

    if e.RisingSunKick:IsReady() then
        if f.CastTargetIf(e.RisingSunKick, p, "min", u, we) then
            return "Rising Sun Kick 604"
        end

        if u(a) and we(a) then
            if i.Cast(e.RisingSunKick, nil, nil, not a:IsSpellInRange(e.RisingSunKick)) then
                o = 107428
                return "Rising Sun Kick 606"
            end

        end

    end

    if e.FistsOfFury:IsReady() and not y and i.AoEON() and d >= 3 and a:IsInRange(8) and (not UnitsWithBDBCount == 0 or not i.AoEON() or d <= 3) then
        if i.Cast(e.FistsOfFury, nil, nil, not a:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 608"
        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(8) and (h(e.SpinningCraneKick) or EnemiesWithMotC >= 5) and t:BuffUp(e.DanceOfChijiBuff) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 610"
        end

    end

    if e.BlackoutKick:IsReady() then
        if f.CastTargetIf(e.BlackoutKick, p, "min", u, fe) then
            return "Blackout Kick 612"
        end

        if u(a) and fe(a) then
            if i.Cast(e.BlackoutKick, nil, nil, not a:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 614"
            end

        end

    end

    if e.FistsOfFury:IsReady() and not y and (not UnitsWithBDBCount == 0 or not i.AoEON() or d <= 3) then
        if i.Cast(e.FistsOfFury, nil, nil, not a:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            J = true
            return "Fists of Fury 616"
        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(8) and UnitsWithBDBCount == 0 then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 618"
        end

    end

    if e.FistOfTheWhiteTiger:IsReady() and a:IsInRange(8) and t:Chi() < 3 then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, O) then
            return "Fist of the White Tiger 620"
        end

        if u(a) and O(a) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not a:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "Fist of the White Tiger 622"
            end

        end

    end

    if e.ExpelHarm:IsReady() and a:IsInRange(8) and (t:ChiDeficit() >= 1) then
        if i.Cast(e.ExpelHarm, nil, nil, not a:IsInMeleeRange(8)) then
            o = 322101
            return "expel_harm opener 4"
        end

    end

    if e.BlackoutKick:IsReady() then
        if f.CastTargetIf(e.BlackoutKick, p, "min", u, ce) then
            return "Blackout Kick 624"
        end

        if u(a) and ce(a) then
            if i.Cast(e.BlackoutKick, nil, nil, not a:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 626"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(8) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 628"
        end

    end

end

local function he()
    if e.WhirlingDragonPunch:IsReady() and not W and a:IsInRange(8) and ((t:BuffStack(e.PrimordialPotentialBuff) < 9) or (d > 1)) then
        if i.Cast(e.WhirlingDragonPunch, nil, nil, not a:IsInMeleeRange(8)) then
            o = 152175
            return "Whirling Dragon Punch 800"
        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(8) and (h(e.SpinningCraneKick) and t:BuffUp(e.DanceOfChijiBuff)) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 804"
        end

    end

    if e.Fleshcraft:IsCastable() and not t:IsMoving() and z and (_ == 0 or _ > t:GCD() * 1.25) and s.Windwalker.CastCancelFC and (e.VolatileSolvent:SoulbindEnabled() and t:BuffDown(e.StormEarthAndFireBuff) and a:DebuffDown(e.BonedustBrew)) then
        X = true
        if Y(e.Fleshcraft, nil, nil) then
            o = 324631
            return "fleshcraft st 8"
        end

    end

    if e.BlackoutKick:IsReady() and (h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() > 0 and EnemiesWithMotC < 3 and d == 2 and t:BuffDown(e.BonedustBrew) and t:BuffUp(e.BlackoutKickBuff)) then
        if f.CastTargetIf(e.BlackoutKick, p, "min", u, I) then
            return "Blackout Kick 832"
        end

        if u(a) and I(a) then
            if i.Cast(e.BlackoutKick, nil, nil, not a:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 834"
            end

        end

    end

    if e.RisingSunKick:IsReady() and (e.Serenity:CooldownRemains() > 1 or (not e.Serenity:IsAvailable() and (e.WeaponsOfOrder:CooldownRemains() > 4 or x ~= 1) and (not U or e.FistsOfFury:CooldownRemains() > 0))) then
        if f.CastTargetIf(e.RisingSunKick, p, "min", u, K) then
            return "Rising Sun Kick 806"
        end

        if u(a) and K(a) then
            if i.Cast(e.RisingSunKick, nil, nil, not a:IsSpellInRange(e.RisingSunKick)) then
                o = 107428
                return "Rising Sun Kick 808"
            end

        end

    end

    if e.FistsOfFury:IsReady() and not y and (((c() > e.FistsOfFury:ExecuteTime() - 1) or (t:BuffRemains(e.StormEarthAndFireBuff) < e.FistsOfFury:ExecuteTime() + 1)) or (l < e.FistsOfFury:ExecuteTime() + 1) or (a:DebuffUp(e.BonedustBrew)) or (t:BuffUp(e.PrimordialPowerBuff))) then
        if i.Cast(e.FistsOfFury, nil, nil, not a:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 810"
        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(8) and (h(e.SpinningCraneKick) and t:BuffUp(e.BonedustBrew) and e.CalculatedStrikes:ConduitEnabled() and d > 1 and EnemiesWithMotC > 1) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 804"
        end

    end

    if e.CracklingJadeLightning:IsReady() and a:IsInRange(40) and (t:BuffStack(e.TheEmperorsCapacitor) > 19 and c() > e.CracklingJadeLightning:ExecuteTime() - 1 and e.RisingSunKick:CooldownRemains() > e.CracklingJadeLightning:ExecuteTime() or t:BuffStack(e.TheEmperorsCapacitor) > 14 and (e.Serenity:IsAvailable() and e.Serenity:CooldownRemains() < 5 or x == 1 and e.WeaponsOfOrder:CooldownRemains() < 5 or l < 5)) then
        if i.Cast(e.CracklingJadeLightning, nil, nil, not a:IsInRange(40)) then
            o = 117952
            return "Crackling Jade Lightning 812"
        end

    end

    if e.RushingJadeWind:IsReady() and a:IsInRange(8) and (t:BuffDown(e.RushingJadeWindBuff) and d > 1) then
        if i.Cast(e.RushingJadeWind, nil, nil, not a:IsInMeleeRange(8)) then
            o = 116847
            return "Rushing Jade Wind 814"
        end

    end

    if e.FistOfTheWhiteTiger:IsReady() and t:Chi() < 3 then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, O) then
            return "Fist of the White Tiger 816"
        end

        if u(a) and O(a) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not a:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "Fist of the White Tiger 818"
            end

        end

    end

    if e.ExpelHarm:IsReady() and a:IsInRange(8) and t:ChiDeficit() >= 1 then
        if i.Cast(e.ExpelHarm, nil, nil, not a:IsInMeleeRange(8)) then
            o = 322101
            return "Expel Harm 820"
        end

    end

    if e.ChiBurst:IsReady() and a:IsInRange(30) and not t:IsMoving() and (_ == 0 or _ > e.ChiBurst:CastTime() + .5) and ((t:ChiDeficit() >= 1 and d == 1) or (t:ChiDeficit() >= 2 and d >= 2)) then
        if i.Cast(e.ChiBurst, nil, nil, not a:IsInRange(40)) then
            o = 123986
            return "Chi Burst 822"
        end

    end

    if e.ChiWave:IsReady() and a:IsInRange(40) and (t:BuffDown(e.PrimordialPowerBuff)) then
        if i.Cast(e.ChiWave, nil, nil, not a:IsInRange(40)) then
            o = 115098
            return "Chi Wave 824"
        end

    end

    if e.TigerPalm:IsReady() and (h(e.TigerPalm) and t:ChiDeficit() >= 2 and t:BuffDown(e.StormEarthAndFireBuff)) then
        if f.CastTargetIf(e.TigerPalm, p, "min", q, T) then
            return "Tiger Palm 826"
        end

        if q(a) and T(a) then
            if i.Cast(e.TigerPalm, nil, nil, not a:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "Tiger Palm 828"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(8) and ((t:BuffStack(e.ChiEnergyBuff) > (30 - 5 * d) and t:BuffDown(e.StormEarthAndFireBuff) and ((e.RisingSunKick:CooldownRemains() > 2 and e.FistsOfFury:CooldownRemains() > 2) or (e.RisingSunKick:CooldownRemains() < 3 and e.FistsOfFury:CooldownRemains() > 3 and t:Chi() > 3) or (e.RisingSunKick:CooldownRemains() > 3 and e.FistsOfFury:CooldownRemains() < 3 and t:Chi() > 4) or (t:ChiDeficit() <= 1 and c() < 2))) or t:BuffStack(e.ChiEnergyBuff) > 10 and l < 7) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 830"
        end

    end

    if e.BlackoutKick:IsReady() and (h(e.BlackoutKick) and ((e.Serenity:IsAvailable() and e.Serenity:CooldownRemains() < 3) or (e.RisingSunKick:CooldownRemains() > 1 and e.FistsOfFury:CooldownRemains() > 1) or (e.RisingSunKick:CooldownRemains() < 3 and e.FistsOfFury:CooldownRemains() > 3 and t:Chi() > 2) or (e.RisingSunKick:CooldownRemains() > 3 and e.FistsOfFury:CooldownRemains() < 3 and t:Chi() > 3) or (t:Chi() > 5) or t:BuffUp(e.BlackoutKickBuff))) then
        if f.CastTargetIf(e.BlackoutKick, E, "min", u, I) then
            return "Blackout Kick 844"
        end

        if u(a) and I(a) then
            if i.Cast(e.BlackoutKick, nil, nil, not a:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 846"
            end

        end

    end

    if e.TigerPalm:IsReady() and (h(e.TigerPalm) and t:ChiDeficit() >= 2) then
        if f.CastTargetIf(e.TigerPalm, p, "min", q, T) then
            return "Tiger Palm 836"
        end

        if q(a) and T(a) then
            if i.Cast(e.TigerPalm, nil, nil, not a:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "Tiger Palm 838"
            end

        end

    end

    if e.ArcaneTorrent:IsReady() and v() and a:IsInRange(8) and t:ChiDeficit() >= 1 then
        if i.Cast(e.ArcaneTorrent, nil, nil, not a:IsInMeleeRange(8)) then
            o = 50613
            return "Arcane Torrent 402"
        end

    end

    if e.FlyingSerpentKickActionBarReplacement:IsReady() and not D and not s.Windwalker.IgnoreFSK then
        if i.Cast(e.FlyingSerpentKickActionBarReplacement, nil, nil, not a:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick Slam 840"
        end

    end

    if e.FlyingSerpentKick:IsReady() and not D and a:IsInRange(8) and not s.Windwalker.IgnoreFSK then
        if i.Cast(e.FlyingSerpentKick, nil, nil, not a:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick 842"
        end

    end

    if e.BlackoutKick:IsReady() and (h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() < 3 and t:Chi() == 2 and t:PrevGCD(1, TigerPalm) and t:EnergyTimeToX(50) < 1) then
        if f.CastTargetIf(e.BlackoutKick, E, "min", u, I) then
            return "Blackout Kick 848"
        end

        if u(a) and I(a) then
            if i.Cast(e.BlackoutKick, nil, nil, not a:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 850"
            end

        end

    end

    if e.BlackoutKick:IsReady() and (h(e.BlackoutKick) and c() < 2 and (t:ChiDeficit() <= 1 or t:PrevGCD(1, TigerPalm))) then
        if f.CastTargetIf(e.BlackoutKick, E, "min", u, I) then
            return "Blackout Kick 848"
        end

        if u(a) and I(a) then
            if i.Cast(e.BlackoutKick, nil, nil, not a:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 850"
            end

        end

    end

end

local function U()
    if (i.CDsON() and not e.Serenity:IsAvailable()) then
        local e = le()
        if e then
            return e
        end

    end

    if (i.CDsON() and e.Serenity:IsAvailable()) then
        local e = ue()
        if e then
            return e
        end

    end

    if e.RisingSunKick:IsReady() then
        if f.CastTargetIf(e.RisingSunKick, p, "min", u, K) then
            o = 107428
            return "Rising Sun Kick 702"
        end

        if u(a) and K(a) then
            if i.Cast(e.RisingSunKick, nil, nil, not a:IsSpellInRange(e.RisingSunKick)) then
                o = 107428
                return "Rising Sun Kick 704"
            end

        end

    end

    if e.BlackoutKick:IsReady() and a:IsInRange(8) and (h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() > 0 and t:BuffUp(e.WeaponsOfOrderChiBuff)) then
        if f.CastTargetIf(e.BlackoutKick, p, "min", q, I) then
            return "Blackout Kick 718"
        end

        if q(a) and I(a) then
            if i.Cast(e.BlackoutKick, nil, nil, not a:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 718"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(8) and (h(e.SpinningCraneKick) and t:BuffUp(e.DanceOfChijiBuff)) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 720"
        end

    end

    if e.FistsOfFury:IsReady() and not y and a:IsInRange(8) and (t:BuffUp(e.WeaponsOfOrderChiBuff) and t:BuffUp(e.StormEarthAndFireBuff) and (not t:HasTier(28, 2)) and d < 2) then
        ae = true
        if i.Cast(e.FistsOfFury, nil, nil, not a:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 708"
        end

    end

    if e.FistsOfFury:IsReady() and not y and a:IsInRange(8) and ((t:BuffUp(e.WeaponsOfOrderChiBuff) and t:BuffUp(e.StormEarthAndFireBuff) and t:HasTier(28, 2)) or (d >= 2 and xe() and t:BuffRemains(e.WeaponsOfOrderChiBuff) < 1)) then
        if i.Cast(e.FistsOfFury, nil, nil, not a:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 708"
        end

    end

    if e.WhirlingDragonPunch:IsReady() and not W and a:IsInRange(8) and t:BuffUp(e.WhirlingDragonPunchBuff) then
        if i.Cast(e.WhirlingDragonPunch, nil, nil, not a:IsInMeleeRange(8)) then
            o = 152175
            return "Whirling Dragon Punch 710"
        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(8) and (h(e.SpinningCraneKick) and d >= 3 and t:BuffUp(e.WeaponsOfOrderChiBuff)) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 706"
        end

    end

    if e.FistOfTheWhiteTiger:IsReady() and ((t:Chi() == 0 and t:BuffRemains(e.WeaponsOfOrderChiBuff) < 4) or (t:Chi() < 3)) then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, O) then
            return "Fist of the White Tiger 722"
        end

        if u(a) and O(a) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not a:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "Fist of the White Tiger 724"
            end

        end

    end

    if e.ExpelHarm:IsReady() and a:IsInRange(8) and (t:ChiDeficit() >= 1) then
        if i.Cast(e.ExpelHarm, nil, nil, not a:IsInMeleeRange(8)) then
            o = 322101
            return "Expel Harm 756"
        end

    end

    if e.ChiBurst:IsReady() and a:IsInRange(30) and not t:IsMoving() and (_ == 0 or _ > e.ChiBurst:CastTime() + .5) and (t:ChiDeficit() >= (1 + C(d > 1))) then
        if i.Cast(e.ChiBurst, nil, nil, not a:IsInRange(40)) then
            o = 123986
            return "Chi Burst 728"
        end

    end

    if e.TigerPalm:IsReady() and ((t:Chi() == 0 and t:BuffRemains(e.WeaponsOfOrderChiBuff) < 4) or (((not e.HitCombo:IsAvailable()) or h(e.TigerPalm)) and t:ChiDeficit() >= 2)) then
        if f.CastTargetIf(e.TigerPalm, p, "min", q, T) then
            return "Tiger Palm 730"
        end

        if q(a) and T(a) then
            if i.Cast(e.TigerPalm, nil, nil, not a:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "Tiger Palm 732"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and a:IsInRange(8) and (t:BuffStack(e.ChiEnergyBuff) > 30 - 5 * d) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not a:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 24"
        end

    end

    if e.BlackoutKick:IsReady() and (h(e.BlackoutKick) and d <= 3 and t:Chi() >= 3 or t:BuffUp(e.WeaponsOfOrderChiBuff)) then
        if f.CastTargetIf(e.BlackoutKick, p, "min", u, I) then
            return "Blackout Kick 736"
        end

        if u(a) and I(a) then
            if i.Cast(e.BlackoutKick, nil, nil, not a:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 738"
            end

        end

    end

    if e.ChiWave:IsReady() and a:IsInRange(8) then
        if i.Cast(e.ChiWave, nil, nil, not a:IsInRange(40)) then
            o = 115098
            return "Chi Wave 734"
        end

    end

    if e.FlyingSerpentKickActionBarReplacement:IsReady() and not D and not s.Windwalker.IgnoreFSK then
        if i.Cast(e.FlyingSerpentKickActionBarReplacement, nil, nil, not a:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick Slam 740"
        end

    end

    if e.FlyingSerpentKick:IsReady() and not D and a:IsInRange(8) and not s.Windwalker.IgnoreFSK then
        if i.Cast(e.FlyingSerpentKick, nil, nil, not a:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick 742"
        end

    end

end

local function u()
    G = HeroRotationCharDB.Toggles[6]
    z = HeroRotationCharDB.Toggles[4]
    B = HeroRotationCharDB.Toggles[5]
    w = HeroRotationCharDB.Toggles[12]
    Ie = HeroRotationCharDB.Toggles[15]
    W = HeroRotationCharDB.Toggles[31]
    D = HeroRotationCharDB.Toggles[32]
    y = HeroRotationCharDB.Toggles[33]
    ne = HeroRotationCharDB.Toggles[34]
    se = HeroRotationCharDB.Toggles[35]
    ie = HeroRotationCharDB.Toggles[36]
    re = HeroRotationCharDB.Toggles[37]
    be = HeroRotationCharDB.Toggles[38]
    oe = HeroRotationCharDB.Toggles[39]
    A = false
    H = false
    Z = false
    if ((s.Windwalker.IncludedCooldowns.Xuen and v()) or (s.Windwalker.IncludedSmallCooldowns.Xuen and (v() or B)) or (not s.Windwalker.IncludedSmallCooldowns.Xuen and not s.Windwalker.IncludedCooldowns.Xuen and not s.Windwalker.IncludedSmallCooldowns.SEFEcho and not s.Windwalker.IncludedCooldowns.SEFEco)) then
        H = true
    end

    if ((s.Windwalker.IncludedCooldowns.SEFFull and v()) or (s.Windwalker.IncludedSmallCooldowns.SEFFull and (v() or B)) or (not s.Windwalker.IncludedSmallCooldowns.SEFFull and not s.Windwalker.IncludedCooldowns.SEFFull)) or ((s.Windwalker.IncludedCooldowns.SEFEco and v() and e.StormEarthAndFire:ChargesFractional() > s.Windwalker.SEFEcoCharge) or (s.Windwalker.IncludedSmallCooldowns.SEFEco and (v() or B) and e.StormEarthAndFire:ChargesFractional() > s.Windwalker.SEFEcoCharge) or (not s.Windwalker.IncludedSmallCooldowns.SEFEco and not s.Windwalker.IncludedCooldowns.SEFEco and e.StormEarthAndFire:ChargesFractional() > s.Windwalker.SEFEcoCharge)) then
        Z = true
    end

    _ = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                _ = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

            if not s.Commons.Enabled.TopTrinket and not s.Commons.Enabled.BotTrinket then
        M = { b, g, n.InscrutibleQuantumDevice:ID(), n.Wrathstone:ID(), n.ShadowgraspTotem:ID(), n.OverchargedAnimaBattery:ID(), n.GladiatorsBadgeCosmic:ID(), n.GladiatorsBadgeSinful:ID(), n.GladiatorsBadgeUnchained:ID(), n.TheFirstSigil:ID(), n.EnforcersStunGrenade:ID(), n.CacheofAcquiredTreasures:ID() }
    elseif not s.Commons.Enabled.TopTrinket and s.Commons.Enabled.BotTrinket then
        M = { b, n.InscrutibleQuantumDevice:ID(), n.Wrathstone:ID(), n.ShadowgraspTotem:ID(), n.OverchargedAnimaBattery:ID(), n.GladiatorsBadgeCosmic:ID(), n.GladiatorsBadgeSinful:ID(), n.GladiatorsBadgeUnchained:ID(), n.TheFirstSigil:ID(), n.EnforcersStunGrenade:ID(), n.CacheofAcquiredTreasures:ID() }
    elseif not s.Commons.Enabled.BotTrinket and s.Commons.Enabled.TopTrinket then
        M = { g, n.InscrutibleQuantumDevice:ID(), n.Wrathstone:ID(), n.ShadowgraspTotem:ID(), n.OverchargedAnimaBattery:ID(), n.GladiatorsBadgeCosmic:ID(), n.GladiatorsBadgeSinful:ID(), n.GladiatorsBadgeUnchained:ID(), n.TheFirstSigil:ID(), n.EnforcersStunGrenade:ID(), n.CacheofAcquiredTreasures:ID() }
    end

end

local function v()
    local t = 0
    local n = { 322968, 319603, 319611, 325876, 334493, 334496, 332605, 328494, 326836, 336277, 319669, 323831, 330725, 333299 }
    if UnitExists("mouseover") then
        if UnitIsDead("mouseover") == true and UnitCanAttack("player", "mouseover") ~= true then
            t = 9999
        else
            for e = 0, 40 do
                local a, a, a, e, a, a, a, a, a, o = UnitDebuff("mouseover", e)
                for i, a in Q(n) do
                    if a == o then
                                                                                                if (e == "Magic") then
                            t = 1
                        elseif (e == "Poison") then
                            t = 2
                        elseif (e == "Disease") then
                            t = 3
                        elseif (e == "Curse") then
                            t = 4
                        end

                    end

                end

            end

        end

    end

    if t == 2 or DebuffCheckC == 3 and e.Detox:IsReady() and m("mouseover"):IsInRange(40) then
        if i.Cast(e.Detox, nil, nil, not a:IsInRange(40)) then
            o = 218164
            return "Detox MO"
        end

    end

end

local function y()
    p = t:GetEnemiesInMeleeRange(5)
    E = t:GetEnemiesInMeleeRange(8)
    if xe() then
        Enemies10ySplash = a:GetEnemiesInSplashRange(10)
        d = #E
    else
        Enemies10ySplash = 1
        d = 1
    end

    EnemiesWithMotC = GetSpellCount(101546)
    UnitsWithBDBCount = Ae(E)
    UnitsWithBDBSEFCount = Oe(E)
    local y = t:IsTankingAoE(8) or t:IsTanking(a)
    l = j.FightRemains(E, false)
    k = e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24
    if not BotOn then
        r = 0
        o = 0
        F = 0
    end

    if r > 0 then
        r = 0
    end

    if o > 0 then
        o = 0
    end

    if F > 0 then
        F = 0
    end

    ge = u()
    Te()
    if i.QueuedCast() then
        o = i.QueuedCast()
        return "Custom Queue " .. te(o):ID()
    end

    if not a:IsInMeleeRange(10) and d > 0 and s.Windwalker.TargetSwap == "AutoSwap" and not w then
        r = 999
    end

    ge = v()
    if f.TargetIsValid() and not t:IsDeadOrGhost() then
        N = (e.InvokeXuenTheWhiteTiger:CooldownRemains() > l or (l - e.InvokeXuenTheWhiteTiger:CooldownRemains() < 120) and ((e.Serenity:IsAvailable() and l > e.Serenity:CooldownRemains() and e.Serenity:CooldownRemains() > 10) or (e.StormEarthAndFire:FullRechargeTime() < l and e.StormEarthAndFire:FullRechargeTime() > 15) or (e.StormEarthAndFire:Charges() == 0 and e.StormEarthAndFire:CooldownRemains() < l)))
        ke = ((e.BonedustBrew:CooldownUp() and e.StormEarthAndFire:Charges() < 2 and t:Chi() < 3) or t:BuffRemains(e.BonedustBrew) < 8)
        R = (d < 3 or (EnemiesWithMotC >= d) or EnemiesWithMotC == 5)
        S = e.CarversEye:SoulbindEnabled() or not e.CalculatedStrikes:ConduitEnabled() or not e.WhirlingDragonPunch:IsAvailable()
        V = ((n.GladiatorsBadgeCosmic:IsEquipped() and (n.GladiatorsBadgeCosmic:CooldownUp() or n.GladiatorsBadgeCosmic:CooldownRemains() > 5)) or not n.GladiatorsBadgeCosmic:IsEquipped())
        qe = (n.InscrutibleQuantumDevice:IsEquipped() or n.GladiatorsBadgeCosmic:IsEquipped() or n.GladiatorsBadgeSinful:IsEquipped() or n.GladiatorsBadgeUnchained:IsEquipped() or n.Wrathstone:IsEquipped() or n.OverchargedAnimaBattery:IsEquipped() or n.ShadowgraspTotem:IsEquipped() or n.TheFirstSigil:IsEquipped() or n.EnforcersStunGrenade:IsEquipped() or n.CacheofAcquiredTreasures:IsEquipped())
        if not t:AffectingCombat() and G then
            local e = _e()
            if e then
                return e
            end

        end

        if e.FlyingSerpentKickActionBarReplacement:IsReady() and not D and not s.Windwalker.IgnoreFSK and t:AffectingCombat() then
            if i.Cast(e.FlyingSerpentKickActionBarReplacement, nil, nil, not a:IsInRange(40)) then
                o = 101545
                return "Flying Serpent Kick Slam 740"
            end

        end

        if t:IsChanneling(e.FistsOfFury) and (be or ae) then
            if i.Cast(e.PoolEnergy, nil, nil, nil) then
                o = 1000
                return "Casting FoF"
            end

        end

        if not t:IsChanneling(e.FistsOfFury) and e.FistsOfFury:TimeSinceLastCast() > .25 then
            ae = false
        end

                if t:IsChanneling(e.FistsOfFury) and (not J or e.RisingSunKick:CooldownRemains() <= 0) and not ee and t:AffectingCombat() then
            if i.Cast(e.PoolEnergy, nil, nil, nil) then
                o = 99999
                return "Casting FoF"
            end

        elseif (J == true or ee == true) and not t:IsChanneling(e.FistsOfFury) then
            J = false
            ee = false
        end

        if t:IsChanneling(te(324631)) then
            if t:AffectingCombat() and s.Windwalker.CastCancelFC then
                                if X and (t:BuffUp(e.VolatileSolventBuff) or c() < 3 or e.RisingSunKick:CooldownRemains() < 2 or e.FistsOfFury:CooldownRemains() < 2) then
                    o = 1999
                    X = false
                elseif not X then
                    o = 1999
                end

            end

        end

                if (ne and e.LegSweep:IsUsableP() and e.LegSweep:CooldownRemains(BypassRecovery) <= 0) then
            if i.Cast(e.LegSweep, nil, nil, nil) then
                o = 119381
                return "queue Leg Sweep"
            end

        elseif ((not e.LegSweep:IsUsableP() or e.LegSweep:CooldownRemains(BypassRecovery) > 0) and ne) then
            HeroRotationCharDB.Toggles[34] = not HeroRotationCharDB.Toggles[34]
            i.Print("Leg Sweep Queue is now " .. (HeroRotationCharDB.Toggles[34] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

                if (se and e.Paralysis:IsUsableP() and e.Paralysis:CooldownRemains(BypassRecovery) <= 0) then
            if i.Cast(e.Paralysis, nil, nil, nil) then
                if m("mouseover"):GUID() ~= nil and m("mouseover"):IsSpellInRange(e.Paralysis) then
                    r = 1115078
                    return "queue Paralysis MO"
                else
                    o = 115078
                    return "queue Paralysis"
                end

            end

        elseif ((not e.Paralysis:IsUsableP() or e.Paralysis:CooldownRemains(BypassRecovery) > 0) and se) then
            HeroRotationCharDB.Toggles[35] = not HeroRotationCharDB.Toggles[35]
            i.Print("Paralysis Queue is now " .. (HeroRotationCharDB.Toggles[35] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

                if (ie and e.RingOfPeace:IsAvailable() and e.RingOfPeace:IsUsableP() and e.RingOfPeace:CooldownRemains(BypassRecovery) <= 0) then
            if i.Cast(e.RingOfPeace, nil, nil, nil) then
                o = 116844
                return "queue RingOfPeace"
            end

        elseif ((not e.RingOfPeace:IsUsableP() or e.RingOfPeace:CooldownRemains(BypassRecovery) > 0 or not e.RingOfPeace:IsAvailable()) and ie) then
            HeroRotationCharDB.Toggles[36] = not HeroRotationCharDB.Toggles[36]
            i.Print("RingOfPeace Queue is now " .. (HeroRotationCharDB.Toggles[36] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

                if (re and e.BonedustBrew:IsUsableP() and e.BonedustBrew:CooldownRemains(BypassRecovery) <= 0) then
            if i.Cast(e.BonedustBrew, nil, nil, nil) then
                o = 325216
                return "queue BonedustBrew"
            end

        elseif ((not e.BonedustBrew:IsUsableP() or e.BonedustBrew:CooldownRemains(BypassRecovery) > 0) and re) then
            HeroRotationCharDB.Toggles[37] = not HeroRotationCharDB.Toggles[37]
            i.Print("BonedustBrew Queue is now " .. (HeroRotationCharDB.Toggles[37] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

        if (t:AffectingCombat()) then
            if e.FortifyingBrew:IsReady() and t:HealthPercentage() < s.Commons.FortifyingBrew then
                if i.Cast(e.FortifyingBrew, nil, nil, nil) then
                    o = 243435
                    return "Fortifying Brew 100"
                end

            end

            if e.TouchOfKarma:IsReady() and t:HealthPercentage() < s.Commons.TouchofKarma then
                if i.Cast(e.TouchOfKarma, nil, nil, nil) then
                    o = 122470
                    return "ToK 100"
                end

            end

            if t:HealthPercentage() < s.Commons.PhialHP and n.PhialofSerenity:IsReady() and n.PhialofSerenity:CooldownRemains() <= 0 then
                if i.Cast(n.PhialofSerenity, nil) then
                    o = 55
                    return "PhialofSerenity HP"
                end

            end

            if t:HealthPercentage() < s.Commons.HealthstoneHP and n.Healthstone:IsReady() and n.Healthstone:CooldownRemains() <= 0 then
                if i.Cast(n.Healthstone, nil) then
                    o = 40
                    return "Healthstone HP"
                end

            end

            if t:HealthPercentage() < s.Commons.HealPotHP and n.CosmicHealPot:IsReady() and n.CosmicHealPot:CooldownRemains() <= 0 then
                if i.Cast(n.CosmicHealPot, nil) then
                    o = 45
                    return "CosmicHealPot HP"
                end

            end

            if t:HealthPercentage() < s.Commons.HealPotHP and n.HealPot:IsReady() and n.HealPot:CooldownRemains() <= 0 then
                if i.Cast(n.HealPot, nil) then
                    o = 41
                    return "HealPot HP"
                end

            end

        end

        if e.StormEarthAndFireFixate:IsCastable() and e.StormEarthAndFireFixate:TimeSinceLastCast() > 5 and a:IsInRange(10) and (t:BuffUp(e.StormEarthAndFireBuff) and R) then
            if i.Cast(e.StormEarthAndFire, nil) then
                o = 137639
                return "storm_earth_and_fire_fixate cd_sef 14"
            end

        end

        if n.PotionofPhantomFire:IsReady() and t:AffectingCombat() and a:IsInRange(8) and s.Commons.UsePotions and ((((t:BuffUp(e.SerenityBuff) or t:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or j.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if i.CastSuggested(n.PotionofPhantomFire) then
                o = 32
                return "Potion of Phantom Fire 102"
            end

        end

        if n.PotionofSpectralAgility:IsReady() and t:AffectingCombat() and a:IsInRange(8) and s.Commons.UsePotions and ((((t:BuffUp(e.SerenityBuff) or t:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or j.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if i.CastSuggested(n.PotionofSpectralAgility) then
                o = 32
                return "Potion of Spectral Agility 104"
            end

        end

        if n.PotionofDeathlyFixation:IsReady() and t:AffectingCombat() and a:IsInRange(8) and s.Commons.UsePotions and ((((t:BuffUp(e.SerenityBuff) or t:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or j.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if i.CastSuggested(n.PotionofDeathlyFixation) then
                o = 32
                return "Potion of Deathly Fixation 106"
            end

        end

        if n.PotionofEmpoweredExorcisms:IsReady() and t:AffectingCombat() and a:IsInRange(8) and s.Commons.UsePotions and ((((t:BuffUp(e.SerenityBuff) or t:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or j.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if i.CastSuggested(n.PotionofEmpoweredExorcisms) then
                o = 32
                return "Potion of Empowered Exorcisms 108"
            end

        end

        if n.PotionofHardenedShadows:IsReady() and t:AffectingCombat() and a:IsInRange(8) and s.Commons.UsePotions and ((((t:BuffUp(e.SerenityBuff) or t:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or j.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if i.CastSuggested(n.PotionofHardenedShadows) then
                o = 32
                return "Potion of Hardened Shadows 110"
            end

        end

        if n.PotionofSpectralStamina:IsReady() and t:AffectingCombat() and a:IsInRange(8) and s.Commons.UsePotions and ((((t:BuffUp(e.SerenityBuff) or t:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or j.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if i.CastSuggested(n.PotionofSpectralStamina) then
                o = 32
                return "Potion of Spectral Stamina 112"
            end

        end

        if t:BuffUp(e.SerenityBuff) and t:AffectingCombat() then
            local e = L()
            if e then
                return e
            end

        end

        if t:BuffUp(e.WeaponsOfOrder) and t:AffectingCombat() then
            local e = U()
            if e then
                return e
            end

        end

        if (j.CombatTime() < 4 and t:Chi() < 5 and not (k)) and (t:AffectingCombat() or G) then
            local e = P()
            if e then
                return e
            end

        end

        if e.FaelineStomp:IsCastable() and z and a:IsInMeleeRange(10) and (t:AffectingCombat() or G) and (h(e.FaelineStomp)) then
            if Y(e.FaelineStomp, nil) then
                o = 327104
                return "faeline_stomp main 6"
            end

        end

        if not t:BuffUp(e.BonedustBrew) and not t:BuffUp(e.FirstStrikeBuff) then
            local e = de()
            if e then
                return e
            end

        end

        if e.ChiBurst:IsReady() and not t:IsMoving() and a:IsInRange(15) and (x == 3 and e.FaelineStomp:CooldownRemains() > 0 and ((t:ChiDeficit() >= 1 and d == 1) or (t:ChiDeficit() >= 2 and d >= 2)) and not t:BuffUp(e.FirstStrikeBuff)) then
            if i.Cast(e.ChiBurst, nil, nil, not a:IsInRange(40)) then
                o = 123986
                return "chi_burst main 16"
            end

        end

        if e.EnergizingElixir:IsReady() and a:IsInRange(8) and (t:PrevGCD(1, e.TigerPalm) and t:Chi() < 4) then
            if i.Cast(e.EnergizingElixir, nil) then
                o = 115288
                return "Energizing Elixir 700"
            end

        end

        if (not e.Serenity:IsAvailable()) and t:AffectingCombat() then
            local e = le()
            if e then
                return e
            end

        end

        if (e.Serenity:IsAvailable()) and t:AffectingCombat() then
            local e = ue()
            if e then
                return e
            end

        end

        if (t:BuffUp(e.BonedustBrew)) and t:AffectingCombat() then
            local e = me()
            if e then
                return e
            end

        end

        if (d < 3) and t:AffectingCombat() then
            local e = he()
            if e then
                return e
            end

        end

        if (d >= 3) and t:AffectingCombat() then
            local e = Ee()
            if e then
                return e
            end

        end

        if t:AffectingCombat() then
            if i.Cast(e.PoolEnergy) and not s.Windwalker.NoWindwalkerPooling then
                return "Pool Energy"
            end

        end

    end

end

local function e()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        i.ToggleIconFrame:UpdateButtonText(6)
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
    if r == 0 then
        return 0
    else
        return r
    end

end

function ReturnSpellFocus()
    if F == 0 then
        return 0
    else
        return F
    end

end

i.SetAPL(269, y, e)

