local e, e = ...
local e = HeroDBC.DBC
local q = HeroLib
local e = HeroCache
local m = q.Unit
local a = m.Player
local t = m.Target
local e = m.Pet
local e = q.Spell
local o = q.MultiSpell
local o = q.Item
local i = HeroRotation
local ae = i.Cast
local y = i.CDsON
local ve = i.AoEON
local T = HeroRotationCharDB.Toggles[4]
local U = HeroRotationCharDB.Toggles[5]
local M = HeroRotationCharDB.Toggles[6]
local Oe = HeroRotationCharDB.Toggles[15]
local H = HeroRotationCharDB.Toggles[31]
local I = HeroRotationCharDB.Toggles[32]
local b = HeroRotationCharDB.Toggles[33]
local se = HeroRotationCharDB.Toggles[34]
local K = HeroRotationCharDB.Toggles[35]
local ee = HeroRotationCharDB.Toggles[36]
local X = HeroRotationCharDB.Toggles[37]
local ge = HeroRotationCharDB.Toggles[38]
local J = HeroRotationCharDB.Toggles[39]
local w = HeroRotationCharDB.Toggles[12]
local G = false
local A = 0
local n = nil
local n = nil
local N = false
local R = false
local W = false
local te = false
local j = GetInventoryItemID("player", 13)
local k = GetInventoryItemID("player", 14)
local n = math.min
local oe = pairs
local e = e.Monk.Windwalker
local s = o.Monk.Windwalker
local ie = { s.InscrutibleQuantumDevice:ID(), s.Wrathstone:ID(), s.ShadowgraspTotem:ID(), s.OverchargedAnimaBattery:ID(), s.GladiatorsBadgeCosmic:ID(), s.GladiatorsBadgeSinful:ID(), s.GladiatorsBadgeUnchained:ID(), s.TheFirstSigil:ID(), s.EnforcersStunGrenade:ID(), s.CacheofAcquiredTreasures:ID() }
local o
local o
local p
local E
local l
local d
local v
local _e
local r = 0
local o = 0
local D = 0
local ne = false
local _ = false
local C = false
local n = false
local g
local n = false
local n = { { e.SpearHandStrike, "Cast Spear Hand Strike (Interrupt)", function()
    return true
end } }
local n = { { e.LegSweep, "Cast Leg Sweep (Stun)", function()
    return true
end } }
local n = { { e.RingOfPeace, "Cast Ring Of Peace (Stun)", function()
    return true
end } }
local n = { { e.Paralysis, "Cast Paralysis (Stun)", function()
    return true
end } }
local n = false
local S = 0
local f = i.Commons.Everyone
local n = i.Commons.Monk
local n = { General = i.GUISettings.General, Commons = i.GUISettings.APL.Monk.Commons, Windwalker = i.GUISettings.APL.Monk.Windwalker }
local z = a:HasLegendaryEquipped(88)
local h = a:HasLegendaryEquipped(82)
local Z = a:HasLegendaryEquipped(85)
local O = a:HasLegendaryEquipped(83)
local u = a:HasLegendaryEquipped(96)
local c = a:HasLegendaryEquipped(95)
local x = a:HasLegendaryEquipped(97)
local L = a:HasLegendaryEquipped(94)
local ze = a:HasLegendaryEquipped(257)
q:RegisterForEvent(function()
    z = a:HasLegendaryEquipped(88)
    h = a:HasLegendaryEquipped(82)
    Z = a:HasLegendaryEquipped(85)
    O = a:HasLegendaryEquipped(83)
    u = a:HasLegendaryEquipped(96)
    c = a:HasLegendaryEquipped(95)
    x = a:HasLegendaryEquipped(97)
    L = a:HasLegendaryEquipped(94)
    ze = a:HasLegendaryEquipped(257)
end, "PLAYER_EQUIPMENT_CHANGED")
local x = a:CovenantID()
q:RegisterForEvent(function()
    x = a:CovenantID()
end, "COVENANT_CHOSEN")
q:RegisterForEvent(function()
    S = 0
end, "PLAYER_REGEN_ENABLED")
local function S(e)
    if e then
        return 1
    else
        return 0
    end

end

local function h(e)
    return e ~= 0
end

local function Ne(a)
    local t = 0
    for o in oe(a) do
        local a = a[o]
        if a:DebuffUp(e.BonedustBrew) then
            t = t + 1
        end

    end

    return t
end

local function Ie(a)
    local t = 0
    for o in oe(a) do
        local a = a[o]
        if a:DebuffRemains(e.BonedustBrew) > 2 then
            t = t + 1
        end

    end

    return t
end

local function c()
    return math.floor(a:EnergyTimeToMaxPredicted() * 10 + .5) / 10
end

local function h()
    return math.floor(a:EnergyPredicted() + .5)
end

local function h(e)
    return (not a:PrevGCD(1, e))
end

local function u(t)
    return t:DebuffRemains(e.MarkOfTheCraneDebuff)
end

local function z(t)
    return t:DebuffRemains(e.MarkOfTheCraneDebuff) + (S(t:DebuffUp(e.SkyreachExhaustion)) * 20)
end

local function F(e)
                if ((a:Chi() < 3) and e:GUID() == m("mouseover"):GUID()) then
        r = 1261947
        return true
    elseif ((a:Chi() < 3) and n.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not w and not string.find(e:GUID(), 174773)) then
        r = 999
        return true
    elseif ((a:Chi() < 3) and e:GUID() == t:GUID()) then
        o = 261947
        return true
    elseif ((a:Chi() < 3) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function we(e)
                if ((e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1261947
        return true
    elseif ((e:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not w and not string.find(e:GUID(), 174773)) then
        r = 999
        return true
    elseif ((e:IsInMeleeRange(10)) and e:GUID() == t:GUID()) then
        o = 261947
        return true
    elseif ((e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function re(i)
                if ((a:ChiDeficit() >= 3 and (c() < 1 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1261947
        return true
    elseif ((a:ChiDeficit() >= 3 and (c() < 1 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((a:ChiDeficit() >= 3 and (c() < 1 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 261947
        return true
    elseif ((a:ChiDeficit() >= 3 and (c() < 1 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function fe(i)
                if ((h(e.TigerPalm) and (a:ChiDeficit() >= 2 or g) and (c() < 1 or e.Serenity:CooldownRemains() < 2 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((h(e.TigerPalm) and (a:ChiDeficit() >= 2 or g) and (c() < 1 or e.Serenity:CooldownRemains() < 2 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.TigerPalm) and (a:ChiDeficit() >= 2 or g) and (c() < 1 or e.Serenity:CooldownRemains() < 2 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 100780
        return true
    elseif ((h(e.TigerPalm) and (a:ChiDeficit() >= 2 or g) and (c() < 1 or e.Serenity:CooldownRemains() < 2 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function Y(e)
                if ((a:ChiDeficit() >= 3) and (e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1261947
        return true
    elseif ((a:ChiDeficit() >= 3) and (e:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not w) then
        r = 999
        return true
    elseif ((a:ChiDeficit() >= 3) and (e:IsInMeleeRange(10)) and e:GUID() == t:GUID()) then
        o = 261947
        return true
    elseif ((a:ChiDeficit() >= 3) and (e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function V(i)
                if ((h(e.TigerPalm) and (a:ChiDeficit() >= 2 or g)) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((h(e.TigerPalm) and (a:ChiDeficit() >= 2 or g)) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.TigerPalm) and (a:ChiDeficit() >= 2 or g)) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 100780
        return true
    elseif ((h(e.TigerPalm) and (a:ChiDeficit() >= 2 or g)) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function he(e)
                if ((a:ChiDeficit() == 2) and (e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((a:ChiDeficit() == 2) and (e:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not w and not string.find(e:GUID(), 174773)) then
        r = 999
        return true
    elseif ((a:ChiDeficit() == 2) and (e:IsInMeleeRange(10)) and e:GUID() == t:GUID()) then
        o = 100780
        return true
    elseif ((a:ChiDeficit() == 2) and (e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function me(i)
                if (((e.WhirlingDragonPunch:IsAvailable() and ((10 / (1 + a:HastePct() / 100)) > (e.WhirlingDragonPunch:CooldownRemains() + 4))) and ((e.FistsOfFury:CooldownRemains() > 3 or b) or a:Chi() >= 5)) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1107428
        return true
    elseif (((e.WhirlingDragonPunch:IsAvailable() and ((10 / (1 + a:HastePct() / 100)) > (e.WhirlingDragonPunch:CooldownRemains() + 4))) and ((e.FistsOfFury:CooldownRemains() > 3 or b) or a:Chi() >= 5)) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif (((e.WhirlingDragonPunch:IsAvailable() and ((10 / (1 + a:HastePct() / 100)) > (e.WhirlingDragonPunch:CooldownRemains() + 4))) and ((e.FistsOfFury:CooldownRemains() > 3 or b) or a:Chi() >= 5)) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 107428
        return true
    elseif (((e.WhirlingDragonPunch:IsAvailable() and ((10 / (1 + a:HastePct() / 100)) > (e.WhirlingDragonPunch:CooldownRemains() + 4))) and ((e.FistsOfFury:CooldownRemains() > 3 or b) or a:Chi() >= 5)) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function ye(i)
                if ((a:ChiDeficit() >= 2 and (not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((a:ChiDeficit() >= 2 and (not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((a:ChiDeficit() >= 2 and (not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 100780
        return true
    elseif ((a:ChiDeficit() >= 2 and (not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function ue(i)
                if ((h(e.BlackoutKick) and (a:BuffUp(e.BlackoutKickBuff) or e.HitCombo:IsAvailable() and a:PrevGCD(1, e.TigerPalm) and a:Chi() == 2 and e.FistsOfFury:CooldownRemains() < 3 or a:ChiDeficit() <= 1 and a:PrevGCD(1, e.SpinningCraneKick) and c() < 3)) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and (a:BuffUp(e.BlackoutKickBuff) or e.HitCombo:IsAvailable() and a:PrevGCD(1, e.TigerPalm) and a:Chi() == 2 and e.FistsOfFury:CooldownRemains() < 3 or a:ChiDeficit() <= 1 and a:PrevGCD(1, e.SpinningCraneKick) and c() < 3)) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and (a:BuffUp(e.BlackoutKickBuff) or e.HitCombo:IsAvailable() and a:PrevGCD(1, e.TigerPalm) and a:Chi() == 2 and e.FistsOfFury:CooldownRemains() < 3 or a:ChiDeficit() <= 1 and a:PrevGCD(1, e.SpinningCraneKick) and c() < 3)) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 100784
        return true
    elseif ((h(e.BlackoutKick) and (a:BuffUp(e.BlackoutKickBuff) or e.HitCombo:IsAvailable() and a:PrevGCD(1, e.TigerPalm) and a:Chi() == 2 and e.FistsOfFury:CooldownRemains() < 3 or a:ChiDeficit() <= 1 and a:PrevGCD(1, e.SpinningCraneKick) and c() < 3)) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function ce(a)
                if ((h(e.RisingSunKick)) and (a:IsInMeleeRange(10)) and a:GUID() == m("mouseover"):GUID()) then
        r = 1107428
        return true
    elseif ((h(e.RisingSunKick)) and (a:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not w and not string.find(a:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.RisingSunKick)) and (a:IsInMeleeRange(10)) and a:GUID() == t:GUID()) then
        o = 107428
        return true
    elseif ((h(e.RisingSunKick)) and (a:IsInMeleeRange(10)) and not string.find(a:GUID(), 174773)) then
        return true
    end

end

local function le(e)
                if ((e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1107428
        return true
    elseif ((e:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not w and not string.find(e:GUID(), 174773)) then
        r = 999
        return true
    elseif ((e:IsInMeleeRange(10)) and e:GUID() == t:GUID()) then
        o = 107428
        return true
    elseif ((e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function de(i)
                if ((h(e.BlackoutKick) and a:BuffUp(e.WeaponsOfOrder) and e.RisingSunKick:CooldownRemains() > 2) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and a:BuffUp(e.WeaponsOfOrder) and e.RisingSunKick:CooldownRemains() > 2) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and a:BuffUp(e.WeaponsOfOrder) and e.RisingSunKick:CooldownRemains() > 2) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 100784
        return true
    elseif ((h(e.BlackoutKick) and a:BuffUp(e.WeaponsOfOrder) and e.RisingSunKick:CooldownRemains() > 2) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function Ee(a)
                if ((h(e.BlackoutKick) or not e.HitCombo:IsAvailable()) and (a:IsInMeleeRange(10)) and a:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) or not e.HitCombo:IsAvailable()) and (a:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not w and not string.find(a:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) or not e.HitCombo:IsAvailable()) and (a:IsInMeleeRange(10)) and a:GUID() == t:GUID()) then
        o = 100784
        return true
    elseif ((h(e.BlackoutKick) or not e.HitCombo:IsAvailable()) and (a:IsInMeleeRange(10)) and not string.find(a:GUID(), 174773)) then
        return true
    end

end

local function P(i)
                if ((h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() > 0 and a:BuffUp(e.WeaponsOfOrderChiBuff)) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() > 0 and a:BuffUp(e.WeaponsOfOrderChiBuff)) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() > 0 and a:BuffUp(e.WeaponsOfOrderChiBuff)) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 100784
        return true
    elseif ((h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() > 0 and a:BuffUp(e.WeaponsOfOrderChiBuff)) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function B(a)
                if (((e.Serenity:CooldownRemains() > 1) or (not e.Serenity:IsAvailable() and (e.WeaponsOfOrder:CooldownRemains() > 4 or x ~= 1) and ((not L) or e.FistsOfFury:CooldownRemains() > 0))) and (a:IsInMeleeRange(10)) and a:GUID() == m("mouseover"):GUID()) then
        r = 1107428
        return true
    elseif (((e.Serenity:CooldownRemains() > 1) or (not e.Serenity:IsAvailable() and (e.WeaponsOfOrder:CooldownRemains() > 4 or x ~= 1) and ((not L) or e.FistsOfFury:CooldownRemains() > 0))) and (a:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not w and not string.find(a:GUID(), 174773)) then
        r = 999
        return true
    elseif (((e.Serenity:CooldownRemains() > 1) or (not e.Serenity:IsAvailable() and (e.WeaponsOfOrder:CooldownRemains() > 4 or x ~= 1) and ((not L) or e.FistsOfFury:CooldownRemains() > 0))) and (a:IsInMeleeRange(10)) and a:GUID() == t:GUID()) then
        o = 107428
        return true
    elseif (((e.Serenity:CooldownRemains() > 1) or (not e.Serenity:IsAvailable() and (e.WeaponsOfOrder:CooldownRemains() > 4 or x ~= 1) and ((not L) or e.FistsOfFury:CooldownRemains() > 0))) and (a:IsInMeleeRange(10)) and not string.find(a:GUID(), 174773)) then
        return true
    end

end

local function xe(i)
                if ((h(e.TigerPalm) and a:ChiDeficit() >= 2 and a:BuffDown(e.StormEarthAndFireBuff)) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((h(e.TigerPalm) and a:ChiDeficit() >= 2 and a:BuffDown(e.StormEarthAndFireBuff)) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w and not string.find(i:GUID(), 174773)) then
        r = 999
        return true
    elseif ((h(e.TigerPalm) and a:ChiDeficit() >= 2 and a:BuffDown(e.StormEarthAndFireBuff)) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 100780
        return true
    elseif ((h(e.TigerPalm) and a:ChiDeficit() >= 2 and a:BuffDown(e.StormEarthAndFireBuff)) and (i:IsInMeleeRange(10)) and not string.find(i:GUID(), 174773)) then
        return true
    end

end

local function je(e)
                if ((e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif ((e:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not w and not string.find(e:GUID(), 174773)) then
        r = 999
        return true
    elseif ((e:IsInMeleeRange(10)) and e:GUID() == t:GUID()) then
        o = 100780
        return true
    elseif ((e:IsInMeleeRange(10)) and not string.find(e:GUID(), 174773)) then
        return true
    end

end

local function ke(i)
                if ((h(e.BlackoutKick) and ((e.Serenity:IsAvailable() and e.Serenity:CooldownRemains() < 3) or (e.RisingSunKick:CooldownRemains() > 1 and e.FistsOfFury:CooldownRemains() > 1 or b) or (e.RisingSunKick:CooldownRemains() < 3 and (e.FistsOfFury:CooldownRemains() > 3 or b) and a:Chi() > 2) or (e.RisingSunKick:CooldownRemains() > 3 and e.FistsOfFury:CooldownRemains() < 3 and a:Chi() > 3) or (a:Chi() > 5) or (a:BuffUp(e.BlackoutKickBuff)))) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and ((e.Serenity:IsAvailable() and e.Serenity:CooldownRemains() < 3) or (e.RisingSunKick:CooldownRemains() > 1 and e.FistsOfFury:CooldownRemains() > 1 or b) or (e.RisingSunKick:CooldownRemains() < 3 and (e.FistsOfFury:CooldownRemains() > 3 or b) and a:Chi() > 2) or (e.RisingSunKick:CooldownRemains() > 3 and e.FistsOfFury:CooldownRemains() < 3 and a:Chi() > 3) or (a:Chi() > 5) or (a:BuffUp(e.BlackoutKickBuff)))) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and ((e.Serenity:IsAvailable() and e.Serenity:CooldownRemains() < 3) or (e.RisingSunKick:CooldownRemains() > 1 and e.FistsOfFury:CooldownRemains() > 1 or b) or (e.RisingSunKick:CooldownRemains() < 3 and (e.FistsOfFury:CooldownRemains() > 3 or b) and a:Chi() > 2) or (e.RisingSunKick:CooldownRemains() > 3 and e.FistsOfFury:CooldownRemains() < 3 and a:Chi() > 3) or (a:Chi() > 5) or (a:BuffUp(e.BlackoutKickBuff)))) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 100784
        return true
    elseif (h(e.BlackoutKick) and ((e.Serenity:IsAvailable() and e.Serenity:CooldownRemains() < 3) or (e.RisingSunKick:CooldownRemains() > 1 and e.FistsOfFury:CooldownRemains() > 1 or b) or (e.RisingSunKick:CooldownRemains() < 3 and (e.FistsOfFury:CooldownRemains() > 3 or b) and a:Chi() > 2) or (e.RisingSunKick:CooldownRemains() > 3 and e.FistsOfFury:CooldownRemains() < 3 and a:Chi() > 3) or (a:Chi() > 5) or (a:BuffUp(e.BlackoutKickBuff)))) and (i:IsInMeleeRange(10)) then
        return true
    end

    return 
end

local function be(i)
                if ((h(e.BlackoutKick) and (e.FistsOfFury:CooldownRemains() < 3 and a:Chi() == 2 and a:PrevGCD(1, e.TigerPalm) and a:EnergyTimeToX(50) < 1)) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and (e.FistsOfFury:CooldownRemains() < 3 and a:Chi() == 2 and a:PrevGCD(1, e.TigerPalm) and a:EnergyTimeToX(50) < 1)) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and (e.FistsOfFury:CooldownRemains() < 3 and a:Chi() == 2 and a:PrevGCD(1, e.TigerPalm) and a:EnergyTimeToX(50) < 1)) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 100784
        return true
    elseif ((h(e.BlackoutKick) and (e.FistsOfFury:CooldownRemains() < 3 and a:Chi() == 2 and a:PrevGCD(1, e.TigerPalm) and a:EnergyTimeToX(50) < 1)) and (i:IsInMeleeRange(10))) then
        return true
    end

end

local function pe(i)
                if ((h(e.BlackoutKick) and (c() < 2 and (a:ChiDeficit() <= 1 or a:PrevGCD(1, e.TigerPalm))) or g) and (i:IsInMeleeRange(10)) and i:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((h(e.BlackoutKick) and (c() < 2 and (a:ChiDeficit() <= 1 or a:PrevGCD(1, e.TigerPalm))) or g) and (i:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        r = 999
        return true
    elseif ((h(e.BlackoutKick) and (c() < 2 and (a:ChiDeficit() <= 1 or a:PrevGCD(1, e.TigerPalm))) or g) and (i:IsInMeleeRange(10)) and i:GUID() == t:GUID()) then
        o = 100784
        return true
    elseif (h(e.BlackoutKick) and (c() < 2 and (a:ChiDeficit() <= 1 or a:PrevGCD(1, e.TigerPalm))) or g) and (i:IsInMeleeRange(10)) then
        return true
    end

end

local function qe(a)
                if (((not e.HitCombo:IsAvailable() or h(e.BlackoutKick))) and (a:IsInMeleeRange(10)) and a:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif (((not e.HitCombo:IsAvailable() or h(e.BlackoutKick))) and (a:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not w) then
        r = 999
        return true
    elseif (((not e.HitCombo:IsAvailable() or h(e.BlackoutKick))) and (a:IsInMeleeRange(10)) and a:GUID() == t:GUID()) then
        o = 100784
        return true
    elseif ((not e.HitCombo:IsAvailable() or h(e.BlackoutKick))) and (a:IsInMeleeRange(10)) then
        return true
    end

end

local function P(a)
                if (((not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (a:IsInMeleeRange(10)) and a:GUID() == m("mouseover"):GUID()) then
        r = 1100780
        return true
    elseif (((not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (a:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not w and not string.find(a:GUID(), 174773)) then
        r = 999
        return true
    elseif (((not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (a:IsInMeleeRange(10)) and a:GUID() == t:GUID()) then
        o = 100780
        return true
    elseif (((not e.HitCombo:IsAvailable() or h(e.TigerPalm))) and (a:IsInMeleeRange(10)) and not string.find(a:GUID(), 174773)) then
        return true
    end

end

local function L(e)
                if ((e:IsInMeleeRange(10)) and e:GUID() == m("mouseover"):GUID()) then
        r = 1100784
        return true
    elseif ((e:IsInMeleeRange(10)) and n.Windwalker.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not w) then
        r = 999
        return true
    elseif ((e:IsInMeleeRange(10)) and e:GUID() == t:GUID()) then
        o = 100784
        return true
    elseif (e:IsInMeleeRange(10)) then
        return true
    end

end

local function Q()
    local e = a:GetUseableTrinkets(ie)
    if e then
                if e:ID() == GetInventoryItemID("player", 13) and n.Commons.Enabled.TopTrinket then
            if i.Cast(e, nil, nil) then
                o = 24
                return "top trinket 1"
            end

        elseif e:ID() == GetInventoryItemID("player", 14) and n.Commons.Enabled.BottomTrinket then
            if i.Cast(e, nil, nil) then
                o = 35
                return "bot trinket 1"
            end

        end

    end

end

local function Ae()
    ne = (s.InscrutibleQuantumDevice:IsEquipped() or s.GladiatorsBadgeCosmic:IsEquipped() or s.GladiatorsBadgeSinful:IsEquipped() or s.GladiatorsBadgeUnchained:IsEquipped() or s.Wrathstone:IsEquipped() or s.OverchargedAnimaBattery:IsEquipped() or s.ShadowgraspTotem:IsEquipped() or s.TheFirstSigil:IsEquipped() or s.EnforcersStunGrenade:IsEquipped() or s.CacheofAcquiredTreasures:IsEquipped())
    if e.ChiBurst:IsReady() and t:IsInRange(30) and not a:IsMoving() and (A == 0 or A > e.ChiBurst:CastTime() + .5) and (x ~= 3) then
        if i.Cast(e.ChiBurst, nil, nil, not t:IsInRange(40)) then
            o = 123986
            return "Chi Burst 4"
        end

    end

    if e.ChiWave:IsReady() and t:IsInRange(40) and (not e.EnergizingElixir:IsAvailable()) then
        if i.Cast(e.ChiWave, nil, nil, not t:IsInRange(40)) then
            o = 115098
            return "Chi Wave 6"
        end

    end

end

local function Te()
    if e.FistOfTheWhiteTiger:IsReady() and t:IsInRange(8) then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, Y) then
            return "Fist of the White Tiger 200"
        end

        if u(t) and Y(t) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not t:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "fist_of_the_white_tiger opener 2"
            end

        end

    end

    if e.ExpelHarm:IsReady() and t:IsInRange(8) and (e.ChiBurst:IsAvailable() and a:ChiDeficit() >= 3) then
        if i.Cast(e.ExpelHarm, nil, nil, not t:IsInMeleeRange(8)) then
            o = 322101
            return "expel_harm opener 4"
        end

    end

    if e.TigerPalm:IsReady() and t:IsInRange(8) then
        if f.CastTargetIf(e.TigerPalm, p, "min", z, V) then
            return "Tiger Palm 206"
        end

        if z(t) and V(t) then
            if i.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "tiger_palm opener 6"
            end

        end

    end

    if e.ChiWave:IsReady() and t:IsInRange(40) and a:ChiDeficit() >= 2 then
        if i.Cast(e.ChiWave, nil, nil, not t:IsInRange(40)) then
            o = 115098
            return "chi_wave opener 8"
        end

    end

    if e.ExpelHarm:IsReady() and t:IsInRange(10) then
        if i.Cast(e.ExpelHarm, nil, nil, not t:IsInMeleeRange(8)) then
            o = 322101
            return "expel_harm opener 10"
        end

    end

    if e.TigerPalm:IsReady() and t:IsInRange(8) then
        if f.CastTargetIf(e.TigerPalm, p, "min", z, he) then
            return "Tiger Palm 214"
        end

        if z(t) and he(t) then
            if i.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "tiger_palm opener 12"
            end

        end

    end

end

local function he()
    if (e.SpinningCraneKick:IsReady(BypassRecovery)) and (not e.WhirlingDragonPunch:IsAvailable() or (e.WhirlingDragonPunch:IsAvailable() and e.WhirlingDragonPunch:CooldownRemains() <= 0)) and ((h(e.SpinningCraneKick) and UnitsWithBDBCount > 0) or (UnitsWithBDBCount >= 3 and l == UnitsWithBDBCount) or UnitsWithBDBCount >= 5) and t:IsInRange(8) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 304"
        end

    end

    if e.WhirlingDragonPunch:IsReady() and not g and not H and t:IsInRange(8) and (not e.BonedustBrew:IsAvailable() or (e.BonedustBrew:CooldownRemains() >= 5) or not T) then
        if i.Cast(e.WhirlingDragonPunch, nil, nil, not t:IsInMeleeRange(8)) then
            o = 152175
            return "Whirling Dragon Punch 300"
        end

    end

    if e.EnergizingElixir:IsReady() and ((a:ChiDeficit() >= 2 and c() > 2) or a:ChiDeficit() >= 4) and t:IsInRange(10) then
        if i.Cast(e.EnergizingElixir, nil) then
            o = 115288
            return "Energizing Elixir 302"
        end

    end

    if (e.SpinningCraneKick:IsReady(BypassRecovery)) and (not e.WhirlingDragonPunch:IsAvailable() or (e.WhirlingDragonPunch:IsAvailable() and e.WhirlingDragonPunch:CooldownRemains() > 0)) and ((h(e.SpinningCraneKick) or (EnemiesWithMotC >= 5 and UnitsWithBDBCount > 0) or (EnemiesWithMotC == l and UnitsWithBDBCount > 0)) and (a:BuffUp(e.DanceOfChijiBuff) or UnitsWithBDBCount > 0)) and t:IsInRange(8) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 306"
        end

    end

    if e.FistsOfFury:IsReady() and not b and UnitsWithBDBCount == 0 and ((c() > e.FistsOfFury:ExecuteTime()) or a:ChiDeficit() <= 1) and t:IsInRange(8) then
        if (EnemiesWithMotC >= l or EnemiesWithMotC >= 5) and (not e.WhirlingDragonPunch:IsAvailable() or (e.WhirlingDragonPunch:IsAvailable() and e.WhirlingDragonPunch:CooldownRemains() > 0) or H) and l >= 2 and e.SpinningCraneKick:IsReady(BypassRecovery) and e.BonedustBrew:CooldownRemains() >= 2 then
            if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
                o = 101546
                return "Spinning Crane Kick 1304"
            end

        else
            if i.Cast(e.FistsOfFury, nil, nil, not t:IsSpellInRange(e.FistsOfFury)) then
                o = 113656
                return "Fists of Fury 306"
            end

        end

    end

    if e.RisingSunKick:IsReady() and (UnitsWithBDBCount == 0 or (e.BonedustBrew:CooldownRemains() <= 0 and T)) then
        if l >= 2 and (not e.WhirlingDragonPunch:IsAvailable() or (e.WhirlingDragonPunch:IsAvailable() and e.WhirlingDragonPunch:CooldownRemains() > 0) or H) and e.SpinningCraneKick:IsReady(BypassRecovery) and e.BonedustBrew:CooldownRemains() >= 2 and ((l == 2 and (EnemiesWithMotC >= 4 or (EnemiesWithMotC >= 2 and e.CalculatedStrikes:SoulbindEnabled()))) or (l == 3 and (EnemiesWithMotC >= 3 or (EnemiesWithMotC >= 2 and e.CalculatedStrikes:SoulbindEnabled()))) or (l >= 4)) then
            if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
                o = 101546
                return "Spinning Crane Kick 1306"
            end

        else
            if f.CastTargetIf(e.RisingSunKick, p, "min", u, me) then
                return "Rising Sun Kick 308"
            end

            if u(t) and me(t) then
                if i.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                    o = 107428
                    return "Rising Sun Kick 310"
                end

            end

        end

    end

    if e.RushingJadeWind:IsReady() and (a:BuffDown(e.RushingJadeWindBuff)) and t:IsInRange(8) then
        if i.Cast(e.RushingJadeWind, nil, nil, not t:IsInMeleeRange(8)) then
            o = 116847
            return "Rushing Jade Wind 312"
        end

    end

    if e.ExpelHarm:IsReady() and t:IsInRange(8) and a:ChiDeficit() >= 1 then
        if i.Cast(e.ExpelHarm, nil, nil, not t:IsInMeleeRange(8)) then
            o = 322101
            return "Expel Harm 316"
        end

    end

    if e.FistOfTheWhiteTiger:IsReady() then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, Y) then
            return "Fist of the White Tiger 318"
        end

        if u(t) and Y(t) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not t:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "Fist of the White Tiger 320"
            end

        end

    end

    if e.ChiBurst:IsReady() and UnitsWithBDBCount == 0 and not a:IsMoving() and (A == 0 or A > e.ChiBurst:CastTime() + .5) and t:IsInRange(30) and (a:ChiDeficit() >= 2) then
        if i.Cast(e.ChiBurst, nil, nil, not t:IsInRange(40)) then
            o = 123986
            return "Chi Burst 322"
        end

    end

    if e.CracklingJadeLightning:IsReady() and ((a:BuffStack(e.TheEmperorsCapacitor) > 19) and (c() > (e.CracklingJadeLightning:ExecuteTime() - 1)) and (e.FistsOfFury:CooldownRemains() > e.CracklingJadeLightning:ExecuteTime() or b)) then
        if i.Cast(e.CracklingJadeLightning, nil, nil, not t:IsInRange(40)) then
            o = 117952
            return "Crackling Jade Lightning 324"
        end

    end

    if e.TigerPalm:IsReady() then
        if f.CastTargetIf(e.TigerPalm, p, "min", z, ye) then
            return "Tiger Palm 326"
        end

        if z(t) and ye(t) then
            if i.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "Tiger Palm 328"
            end

        end

    end

    if e.ArcaneTorrent:IsReady() and t:IsInRange(8) and a:ChiDeficit() >= 1 then
        if i.Cast(e.ArcaneTorrent, nil, nil, not t:IsInMeleeRange(8)) then
            o = 50613
            return "Arcane Torrent 402"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInMeleeRange(10) and ((h(e.SpinningCraneKick) or EnemiesWithMotC >= 5) and (e.BonedustBrew:CooldownRemains() > 2 or x ~= 4) and (a:Chi() >= 5 or e.FistsOfFury:CooldownRemains() > 6 or e.FistsOfFury:CooldownRemains() > 3 and a:Chi() >= 3 and a:EnergyTimeToX(50) < 1 or c() <= (3 + 3 * S(e.FistsOfFury:CooldownRemains() < 5)) or a:BuffUp(e.StormEarthAndFireBuff))) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 314"
        end

    end

    if e.ChiWave:IsReady() and t:IsInRange(40) and (h(e.ChiWave)) then
        if i.Cast(e.ChiWave, nil, nil, not t:IsInRange(40)) then
            o = 115098
            return "Chi Wave 330"
        end

    end

    local s = e.FlyingSerpentKickActionBarReplacement:IsAvailable() and e.FlyingSerpentKickActionBarReplacement or e.FlyingSerpentKick
    if e.FlyingSerpentKickActionBarReplacement:IsReady() and not I and t:IsInRange(10) and not n.Windwalker.IgnoreFSK then
        if i.Cast(e.FlyingSerpentKickActionBarReplacement, nil, nil, not t:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick Slam 332"
        end

    end

    if e.FlyingSerpentKick:IsReady() and not I and t:IsInRange(10) and not n.Windwalker.IgnoreFSK and a:BuffDown(e.BlackoutKickBuff) then
        if i.Cast(e.FlyingSerpentKick, nil, nil, not t:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick 334"
        end

    end

    if e.BlackoutKick:IsReady() and (UnitsWithBDBCount == 0 or (e.BonedustBrew:CooldownRemains() <= 0 and T and EnemiesWithMotC < 5 and EnemiesWithMotC < l)) then
        if l >= 2 and e.SpinningCraneKick:IsReady(BypassRecovery) then
            if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
                o = 101546
                return "Spinning Crane Kick 1304"
            end

        else
            if f.CastTargetIf(e.BlackoutKick, p, "min", u, ue) then
                return "Blackout Kick 336"
            end

            if u(t) and ue(t) then
                if i.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                    o = 100784
                    return "Blackout Kick 338"
                end

            end

        end

    end

    if e.TigerPalm:IsReady() and UnitsWithBDBCount > 0 then
        if f.CastTargetIf(e.TigerPalm, p, "min", u, P) then
            return "TigerPalm 336"
        end

        if u(t) and P(t) then
            if i.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "TigerPalm 348"
            end

        end

    end

    if (e.SpinningCraneKick:IsReady(BypassRecovery)) and (h(e.SpinningCraneKick) or EnemiesWithMotC >= 5 or (EnemiesWithMotC == l and (e.WhirlingDragonPunch:CooldownRemains() > 0 or not e.WhirlingDragonPunch:IsAvailable() or UnitsWithBDBCount > 0))) and t:IsInRange(8) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 304"
        end

    end

end

local function Y()
    C = (e.Serenity:CooldownRemains() < 1 or v and e.Serenity:CooldownRemains() > 30 or d < 20)
    if e.InvokeXuenTheWhiteTiger:IsReady() and N and t:IsInRange(8) and ((not _) or d < 25) then
        if i.Cast(e.InvokeXuenTheWhiteTiger, nil, nil, not t:IsInRange(40)) then
            o = 123904
            return "Invoke Xuen the White Tiger 500"
        end

    end

    if C then
        if e.AncestralCall:IsCastable() and y() and t:IsInRange(8) then
            if i.Cast(e.AncestralCall, nil) then
                o = 274738
                return "Ancestral Call 512"
            end

        end

        if e.BloodFury:IsCastable() and y() and t:IsInRange(8) then
            if i.Cast(e.BloodFury, nil) then
                o = 20572
                return "Blood Fury 502"
            end

        end

        if e.Fireblood:IsCastable() and y() and t:IsInRange(8) then
            if i.Cast(e.Fireblood, nil) then
                o = 265221
                return "Fireblood 510"
            end

        end

        if e.Berserking:IsCastable() and y() and t:IsInRange(8) then
            if i.Cast(e.Berserking, nil) then
                o = 26297
                return "Berserking 504"
            end

        end

        if e.BagOfTricks:IsCastable() and t:IsInRange(8) then
            if i.Cast(e.BagOfTricks, nil, nil, not t:IsInRange(40)) then
                o = 312411
                return "Bag of Tricks 528"
            end

        end

    end

    if e.LightsJudgment:IsCastable() and y() and t:IsInRange(8) then
        if i.Cast(e.LightsJudgment, nil, nil, not t:IsInRange(40)) then
            o = 255647
            return "Lights Judgment 508"
        end

    end

    if e.TouchOfDeath:IsReady() and not J and t:IsInRange(8) and ((not n.Windwalker.ToDExecute and t:HealthPercentage() <= 15) or (n.Windwalker.ToDExecute and UnitHealth("target") < UnitHealth("player"))) and (d > (180 - S(Z) * 120) or v and (x ~= 4 or a:BuffUp(e.BonedustBrew)) or (e.InvokeXuenTheWhiteTiger:CooldownRemains() > d) and a:BuffUp(e.BonedustBrew) or d < 10) then
        if i.Cast(e.TouchOfDeath, nil, nil, not t:IsSpellInRange(e.TouchOfDeath)) then
            o = 322109
            return "Touch of Death 514"
        end

    end

    if e.WeaponsOfOrder:IsReady() and T and t:IsInRange(10) and (e.RisingSunKick:CooldownRemains() < e.WeaponsOfOrder:ExecuteTime()) then
        if i.Cast(e.WeaponsOfOrder, nil, nil) then
            o = 310454
            return "Weapons Of Order 518"
        end

    end

    if (C or d < 20) then
        if s.Jotungeirr:IsEquippedAndReady() and y() then
            if ae(s.Jotungeirr, nil, nil) then
                o = 16
                return "jotungeirr_destinys_call cd_serenity 22"
            end

        end

        if n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket then
            local e = a:GetUseableTrinkets(ie)
            if s.InscrutibleQuantumDevice:IsEquippedAndReady() then
                                if s.InscrutibleQuantumDevice:ID() == j and n.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket InscrutibleQuantumDevice"
                elseif s.InscrutibleQuantumDevice:ID() == k and n.Commons.Enabled.BottomTrinket then
                    o = 35
                    return "bot trinket InscrutibleQuantumDevice"
                end

            end

            if s.Wrathstone:IsEquippedAndReady() then
                                if s.Wrathstone:ID() == j and n.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket Wrathstone"
                elseif s.Wrathstone:ID() == k and n.Commons.Enabled.BottomTrinket then
                    o = 35
                    return "bot trinket Wrathstone"
                end

            end

            if s.OverchargedAnimaBattery:IsEquippedAndReady() then
                                if s.OverchargedAnimaBattery:ID() == j and n.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket OverchargedAnimaBattery"
                elseif s.OverchargedAnimaBattery:ID() == k and n.Commons.Enabled.BottomTrinket then
                    o = 35
                    return "bot trinket OverchargedAnimaBattery"
                end

            end

        end

    end

    if s.ShadowgraspTotem:IsEquippedAndReady() and (v or d < 20 or not O) then
                if s.ShadowgraspTotem:ID() == j and n.Commons.Enabled.TopTrinket then
            o = 24
            return "top trinket ShadowgraspTotem"
        elseif s.ShadowgraspTotem:ID() == k and n.Commons.Enabled.BottomTrinket then
            o = 35
            return "bot trinket ShadowgraspTotem"
        end

    end

    if (n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and (C or d < 20) then
        if s.GladiatorsBadgeCosmic:IsEquippedAndReady() and (v or d < 20 or not O) then
                        if s.GladiatorsBadgeCosmic:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeCosmic"
            elseif s.GladiatorsBadgeCosmic:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeCosmic"
            end

        end

        if s.GladiatorsBadgeSinful:IsEquippedAndReady() and (v or d < 20 or not O) then
                        if s.GladiatorsBadgeSinful:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeSinful"
            elseif s.GladiatorsBadgeSinful:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeSinful"
            end

        end

        if s.GladiatorsBadgeUnchained:IsEquippedAndReady() and (v or d < 20 or not O) then
                        if s.GladiatorsBadgeUnchained:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeUnchained"
            elseif s.GladiatorsBadgeUnchained:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeUnchained"
            end

        end

        if s.EnforcersStunGrenade:IsEquippedAndReady() and (v or d < 20 or not O) then
                        if s.EnforcersStunGrenade:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket EnforcersStunGrenade"
            elseif s.EnforcersStunGrenade:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket EnforcersStunGrenade"
            end

        end

        if s.TheFirstSigil:IsEquippedAndReady() then
                        if s.TheFirstSigil:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket TheFirstSigil"
            elseif s.TheFirstSigil:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket TheFirstSigil"
            end

        end

    end

    if ((not ne) or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 20 or _) then
        local e = Q()
        if e then
            return e
        end

    end

    if e.FaelineStomp:IsReady() and T and t:IsInRange(10) and h(e.FaelineStomp) then
        if i.Cast(e.FaelineStomp, nil, nil) then
            o = 327104
            return "Faeline Stomp 520"
        end

    end

    if e.FallenOrder:IsReady() and T and t:IsInRange(8) then
        if i.Cast(e.FallenOrder, nil, nil) then
            o = 326860
            return "Faeline Stomp 522"
        end

    end

    if e.BonedustBrew:IsReady() and UnitsWithBDBCount == 0 and T and t:IsInRange(8) and (d < 15 or (a:Chi() >= 2 and (d > 60 and ((e.Serenity:CooldownRemains() > 10 or a:BuffUp(e.SerenityBuff) or e.Serenity:CooldownUp()) and (v or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 10 or _))) or (d <= 60 and (v or e.InvokeXuenTheWhiteTiger:CooldownRemains() > d)))) then
        if i.Cast(e.BonedustBrew, nil, nil) then
            o = 325216
            return "Bonedust Brew 524"
        end

    end

    if e.Serenity:IsReady() and t:IsInRange(8) and (e.RisingSunKick:CooldownRemains() < 2 or d < 15) then
        if i.Cast(e.Serenity, nil) then
            o = 152173
            return "Serenity 526"
        end

    end

    if e.BagOfTricks:IsCastable() and t:IsInRange(8) then
        if i.Cast(e.BagOfTricks, nil, nil, not t:IsInRange(40)) then
            o = 312411
            return "Bag of Tricks 528"
        end

    end

end

local function C()
    if e.InvokeXuenTheWhiteTiger:IsReady() and N and t:IsInRange(15) and ((l < 3) or (l >= 3 and (a:BuffUp(e.WhirlingDragonPunchBuff) or e.WhirlingDragonPunch:CooldownRemains() > 2 or not e.WhirlingDragonPunch:IsAvailable()))) and ((not _) and (e.RisingSunKick:CooldownRemains() < 2 or x ~= 1) and (x ~= 4 or e.BonedustBrew:CooldownRemains() < 2) or d < 25) then
                if l >= 3 and a:Chi() < 5 and EnemiesWithMotC < 5 and EnemiesWithMotC < l and n.Windwalker.PoolBeforeBurst then
            g = true
        elseif (EnemiesWithMotC >= 5 or EnemiesWithMotC >= l) or not n.Windwalker.PoolBeforeBurst then
            if i.Cast(e.InvokeXuenTheWhiteTiger, nil, nil, not t:IsInRange(40)) then
                o = 123904
                return "Invoke Xuen the White Tiger 400"
            end

        end

    end

    if e.TouchOfDeath:IsReady() and not J and t:IsInRange(8) and ((not n.Windwalker.ToDExecute and t:HealthPercentage() <= 15) or (n.Windwalker.ToDExecute and UnitHealth("target") < UnitHealth("player"))) and (d > (180 - S(Z) * 120) or a:BuffDown(e.StormEarthAndFireBuff) and v and (x ~= 4 or a:BuffUp(e.BonedustBrew)) or (e.InvokeXuenTheWhiteTiger:CooldownRemains() > d) and a:BuffUp(e.BonedustBrew) or d < 10) then
        if i.Cast(e.TouchOfDeath, nil, nil, not t:IsSpellInRange(e.TouchOfDeath)) then
            o = 322109
            return "Touch of Death 404"
        end

    end

    if e.WeaponsOfOrder:IsReady() and T and t:IsInRange(8) and (e.RisingSunKick:CooldownRemains() < e.WeaponsOfOrder:ExecuteTime() and e.InvokeXuenTheWhiteTiger:CooldownRemains() > (20 + 20 * S(O)) or d < 35) then
        if i.Cast(e.WeaponsOfOrder, nil, nil) then
            o = 310454
            return "Weapons Of Order 406"
        end

    end

    if e.FaelineStomp:IsReady() and T and t:IsInRange(8) and h(e.FaelineStomp) then
        if i.Cast(e.FaelineStomp, nil, nil) then
            o = 327104
            return "Faeline Stomp 408"
        end

    end

    if e.FallenOrder:IsReady() and T and t:IsInRange(8) then
        if i.Cast(e.FallenOrder, nil, nil) then
            o = 326860
            return "Faeline Stomp 410"
        end

    end

    if e.BonedustBrew:IsReady() and UnitsWithBDBCount == 0 and (T) and t:IsInRange(8) and (a:BuffDown(e.BonedustBrew) and (a:Chi() >= 2 and d > 60 and (e.StormEarthAndFire:Charges() > 0 or e.StormEarthAndFire:CooldownRemains() > 10) and (v or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 10 or _) or (a:Chi() >= 2 and d <= 60 and (v or e.InvokeXuenTheWhiteTiger:CooldownRemains() > d) and (e.StormEarthAndFire:Charges() > 0 or e.StormEarthAndFire:CooldownRemains() > d or a:BuffUp(e.StormEarthAndFireBuff))) or d < 15) or d < 10 and e.LeadByExample:SoulbindEnabled()) then
        if ((l >= 3 and a:Chi() < 5 and EnemiesWithMotC < 5 and EnemiesWithMotC < l) or (l < 3 and (e.RisingSunKick:CooldownRemains() > 0))) and n.Windwalker.PoolBeforeBurst then
            g = true
        else
            if i.Cast(e.BonedustBrew, nil, nil) then
                o = 325216
                return "Bonedust Brew 412"
            end

        end

    end

    if e.StormEarthAndFireFixate:IsCastable() and R and t:IsInRange(10) and (a:BuffUp(e.StormEarthAndFireBuff) and e.StormEarthAndFireFixate:TimeSinceLastCast() > 15) and (e.CoordinatedOffensive:ConduitEnabled()) and (EnemiesWithMotC >= l or l < 2 or EnemiesWithMotC >= 5) then
        if i.Cast(e.StormEarthAndFire, nil) then
            o = 137639
            return "storm_earth_and_fire_fixate cd_sef 14"
        end

    end

    if e.StormEarthAndFire:IsReady() and R and t:IsInRange(10) and x ~= 4 and (e.StormEarthAndFire:Charges() == 2 or d < 20 or ((x ~= 1 and x ~= 4) and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > e.StormEarthAndFire:FullRechargeTime() or _) and e.FistsOfFury:CooldownRemains() <= 9 and a:Chi() >= 2 and e.WhirlingDragonPunch:CooldownRemains() <= 12)) then
        if i.Cast(e.StormEarthAndFire, nil) then
            o = 137639
            return "Storm Earth and Fire 416"
        end

    end

    if e.StormEarthAndFire:IsReady() and (x == 1 and (a:BuffUp(e.WeaponsOfOrder) or (d < e.WeaponsOfOrder:CooldownRemains() or e.WeaponsOfOrder:CooldownRemains() > e.StormEarthAndFire:FullRechargeTime()) and e.FistsOfFury:CooldownRemains() <= 9 and a:Chi() >= 2 and e.WhirlingDragonPunch:CooldownRemains() <= 12)) then
        if i.Cast(e.StormEarthAndFire, nil) then
            o = 137639
            return "Storm Earth and Fire 418"
        end

    end

    if e.StormEarthAndFire:IsReady() and R and t:IsInRange(10) and (x == 4 and UnitsWithBDBSEFCount > 0 and (v or _ or e.InvokeXuenTheWhiteTiger:CooldownRemains() > e.StormEarthAndFire:FullRechargeTime() or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30)) then
        if i.Cast(e.StormEarthAndFire, nil) then
            o = 137639
            return "Storm Earth and Fire 420"
        end

    end

    if s.Jotungeirr:IsEquippedAndReady() and y() and (v or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 60 and d > 180 or d < 20) then
        if ae(s.Jotungeirr, nil, nil) then
            o = 16
            return "jotungeirr_destinys_call bear 8"
        end

    end

    if n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket then
        local t = a:GetUseableTrinkets(ie)
        if s.InscrutibleQuantumDevice:IsEquippedAndReady() and (v or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 60 and d > 180 or d < 20) then
                        if s.InscrutibleQuantumDevice:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket InscrutibleQuantumDevice"
            elseif s.InscrutibleQuantumDevice:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket InscrutibleQuantumDevice"
            end

        end

        if s.Wrathstone:IsEquippedAndReady() and (v or d < 20) then
                        if s.Wrathstone:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket Wrathstone"
            elseif s.Wrathstone:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket Wrathstone"
            end

        end

        if s.ShadowgraspTotem:IsEquippedAndReady() and (v or d < 20 or not O) then
                        if s.ShadowgraspTotem:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket ShadowgraspTotem"
            elseif s.ShadowgraspTotem:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket ShadowgraspTotem"
            end

        end

        if s.OverchargedAnimaBattery:IsEquippedAndReady() and (v or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 90 or d < 20) then
                        if s.OverchargedAnimaBattery:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket OverchargedAnimaBattery"
            elseif s.OverchargedAnimaBattery:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket OverchargedAnimaBattery"
            end

        end

        if s.GladiatorsBadgeCosmic:IsEquippedAndReady() and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 55 or _ or d < 15) then
                        if s.GladiatorsBadgeCosmic:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeCosmic"
            elseif s.GladiatorsBadgeCosmic:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeCosmic"
            end

        end

        if s.GladiatorsBadgeSinful:IsEquippedAndReady() and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 55 or _ or d < 15) then
                        if s.GladiatorsBadgeSinful:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeSinful"
            elseif s.GladiatorsBadgeSinful:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeSinful"
            end

        end

        if s.GladiatorsBadgeUnchained:IsEquippedAndReady() and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 55 or _ or d < 15) then
                        if s.GladiatorsBadgeUnchained:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket GladiatorsBadgeUnchained"
            elseif s.GladiatorsBadgeUnchained:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket GladiatorsBadgeUnchained"
            end

        end

        if s.EnforcersStunGrenade:IsEquippedAndReady() and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 55 or _ or d < 15) then
                        if s.EnforcersStunGrenade:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket EnforcersStunGrenade"
            elseif s.EnforcersStunGrenade:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket EnforcersStunGrenade"
            end

        end

        if s.TheFirstSigil:IsEquippedAndReady() and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() < 9 or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 60 and d > 300 or d < 20) then
                        if s.TheFirstSigil:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket TheFirstSigil"
            elseif s.TheFirstSigil:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket TheFirstSigil"
            end

        end

        if s.CacheofAcquiredTreasures:IsEquippedAndReady() and (l < 2 and a:BuffUp(e.AcquiredWandBuff) or l > 1 and a:BuffUp(e.AcquiredAxeBuff) or d < 20) then
                        if s.CacheofAcquiredTreasures:ID() == j and n.Commons.Enabled.TopTrinket then
                o = 24
                return "top trinket CacheofAcquiredTreasures"
            elseif s.CacheofAcquiredTreasures:ID() == k and n.Commons.Enabled.BottomTrinket then
                o = 35
                return "bot trinket CacheofAcquiredTreasures"
            end

        end

        if ((not ne) or e.InvokeXuenTheWhiteTiger:CooldownRemains() > 20 and v and e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() > 4 or _) then
            local e = Q()
            if e then
                return e
            end

        end

    end

    if e.BloodFury:IsCastable() and y() and t:IsInRange(8) and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or not N or VarXuenHold or q.BossFilteredFightRemains("<", 20)) then
        if i.Cast(e.BloodFury, nil) then
            o = 20572
            return "Blood Fury 420"
        end

    end

    if e.Berserking:IsCastable() and y() and t:IsInRange(8) and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or not N or VarXuenHold or q.BossFilteredFightRemains("<", 15)) then
        if i.Cast(e.Berserking, nil) then
            o = 26297
            return "Berserking 422"
        end

    end

    if e.LightsJudgment:IsCastable() and y() and t:IsInRange(8) then
        if i.Cast(e.LightsJudgment, nil, nil, not t:IsInRange(40)) then
            o = 255647
            return "Lights Judgment 424"
        end

    end

    if e.Fireblood:IsCastable() and y() and t:IsInRange(8) and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or not N or VarXuenHold or q.BossFilteredFightRemains("<", 10)) then
        if i.Cast(e.Fireblood, nil) then
            o = 265221
            return "Fireblood 426"
        end

    end

    if e.AncestralCall:IsCastable() and y() and t:IsInRange(8) and (e.InvokeXuenTheWhiteTiger:CooldownRemains() > 30 or not N or VarXuenHold or q.BossFilteredFightRemains("<", 20)) then
        if i.Cast(e.AncestralCall, nil) then
            o = 274738
            return "Ancestral Call 428"
        end

    end

    if e.BagOfTricks:IsCastable() and y() and t:IsInRange(8) and a:BuffDown(e.StormEarthAndFire) then
        if i.Cast(e.BagOfTricks, nil, nil, not t:IsInRange(40)) then
            o = 312411
            return "Bag of Tricks 430"
        end

    end

end

local function k()
    if e.FistsOfFury:IsReady() and not b and t:IsInRange(8) and a:BuffRemains(e.SerenityBuff) < 1 and (not UnitsWithBDBCount == 0 or not i.AoEON() or l <= 3) then
        if i.Cast(e.FistsOfFury, nil, nil, not t:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 600"
        end

    end

    if y() and (n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) then
        if (true) then
            local e = Q()
            if e then
                return e
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (h(e.SpinningCraneKick or EnemiesWithMotC >= 5) and ((i.AoEON() and l >= 3) or (l > 1 and not e.RisingSunKick:CooldownUp()))) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 602"
        end

    end

    if e.RisingSunKick:IsReady() then
        if f.CastTargetIf(e.RisingSunKick, p, "min", u, ce) then
            return "Rising Sun Kick 604"
        end

        if u(t) and ce(t) then
            if i.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                o = 107428
                return "Rising Sun Kick 606"
            end

        end

    end

    if e.FistsOfFury:IsReady() and not b and i.AoEON() and l >= 3 and t:IsInRange(8) and (not UnitsWithBDBCount == 0 or not i.AoEON() or l <= 3) then
        if i.Cast(e.FistsOfFury, nil, nil, not t:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 608"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (h(e.SpinningCraneKick) or EnemiesWithMotC >= 5) and a:BuffUp(e.DanceOfChijiBuff) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 610"
        end

    end

    if e.BlackoutKick:IsReady() then
        if f.CastTargetIf(e.BlackoutKick, p, "min", u, de) then
            return "Blackout Kick 612"
        end

        if u(t) and de(t) then
            if i.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 614"
            end

        end

    end

    if e.FistsOfFury:IsReady() and not b and (not UnitsWithBDBCount == 0 or not i.AoEON() or l <= 3) then
        if i.Cast(e.FistsOfFury, nil, nil, not t:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            W = true
            return "Fists of Fury 616"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and UnitsWithBDBCount == 0 then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 618"
        end

    end

    if e.FistOfTheWhiteTiger:IsReady() then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, F) then
            return "Fist of the White Tiger 620"
        end

        if u(t) and F(t) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not t:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "Fist of the White Tiger 622"
            end

        end

    end

    if e.BlackoutKick:IsReady() then
        if f.CastTargetIf(e.BlackoutKick, p, "min", u, Ee) then
            return "Blackout Kick 624"
        end

        if u(t) and Ee(t) then
            if i.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 626"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 628"
        end

    end

end

local function O()
    if (i.CDsON() and not e.Serenity:IsAvailable()) then
        local e = C()
        if e then
            return e
        end

    end

    if (i.CDsON() and e.Serenity:IsAvailable()) then
        local e = Y()
        if e then
            return e
        end

    end

    if e.RisingSunKick:IsReady() then
        if f.CastTargetIf(e.RisingSunKick, p, "min", u, le) then
            o = 107428
            return "Rising Sun Kick 702"
        end

        if u(t) and le(t) then
            if i.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                o = 107428
                return "Rising Sun Kick 704"
            end

        end

    end

    if e.BlackoutKick:IsReady() and t:IsInRange(8) and (h(e.BlackoutKick) and e.FistsOfFury:CooldownRemains() > 0 and e.RisingSunKick:CooldownRemains() > 0 and a:BuffUp(e.WeaponsOfOrderChiBuff)) then
        if f.CastTargetIf(e.BlackoutKick, p, "min", z, L) then
            return "Blackout Kick 718"
        end

        if z(t) and L(t) then
            if i.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 718"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (h(e.SpinningCraneKick) and a:BuffUp(e.DanceOfChijiBuff)) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 720"
        end

    end

    if e.FistsOfFury:IsReady() and not b and t:IsInRange(8) and (a:BuffUp(e.WeaponsOfOrderChiBuff) and a:BuffUp(e.StormEarthAndFireBuff) and (not a:HasTier(28, 2)) and l < 2) then
        G = true
        if i.Cast(e.FistsOfFury, nil, nil, not t:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 708"
        end

    end

    if e.FistsOfFury:IsReady() and not b and t:IsInRange(8) and ((a:BuffUp(e.WeaponsOfOrderChiBuff) and a:BuffUp(e.StormEarthAndFireBuff) and a:HasTier(28, 2)) or (l >= 2 and ve() and a:BuffRemains(e.WeaponsOfOrderChiBuff) < 1)) then
        if i.Cast(e.FistsOfFury, nil, nil, not t:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 708"
        end

    end

    if e.WhirlingDragonPunch:IsReady() and not H and t:IsInRange(8) and a:BuffUp(e.WhirlingDragonPunchBuff) then
        if i.Cast(e.WhirlingDragonPunch, nil, nil, not t:IsInMeleeRange(8)) then
            o = 152175
            return "Whirling Dragon Punch 710"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (h(e.SpinningCraneKick) and l >= 3 and a:BuffUp(e.WeaponsOfOrderChiBuff)) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 706"
        end

    end

    if e.FistOfTheWhiteTiger:IsReady() and ((a:Chi() == 0 and a:BuffRemains(e.WeaponsOfOrderChiBuff) < 4) or (a:Chi() < 3)) then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, we) then
            return "Fist of the White Tiger 722"
        end

        if u(t) and we(t) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not t:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "Fist of the White Tiger 724"
            end

        end

    end

    if e.ExpelHarm:IsReady() and t:IsInRange(8) and (a:ChiDeficit() >= 1) then
        if i.Cast(e.ExpelHarm, nil, nil, not t:IsInMeleeRange(8)) then
            o = 322101
            return "Expel Harm 756"
        end

    end

    if e.ChiBurst:IsReady() and t:IsInRange(30) and not a:IsMoving() and (A == 0 or A > e.ChiBurst:CastTime() + .5) and (a:ChiDeficit() >= (1 + S(l > 1))) then
        if i.Cast(e.ChiBurst, nil, nil, not t:IsInRange(40)) then
            o = 123986
            return "Chi Burst 728"
        end

    end

    if e.TigerPalm:IsReady() and ((a:Chi() == 0 and a:BuffRemains(e.WeaponsOfOrderChiBuff) < 4) or (((not e.HitCombo:IsAvailable()) or h(e.TigerPalm)) and a:ChiDeficit() >= 2)) then
        if f.CastTargetIf(e.TigerPalm, p, "min", z, je) then
            return "Tiger Palm 730"
        end

        if z(t) and je(t) then
            if i.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "Tiger Palm 732"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (a:BuffStack(e.ChiEnergyBuff) > 30 - 5 * l) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 24"
        end

    end

    if e.BlackoutKick:IsReady() and (h(e.BlackoutKick) and l <= 3 and a:Chi() >= 3 or a:BuffUp(e.WeaponsOfOrderChiBuff)) then
        if f.CastTargetIf(e.BlackoutKick, p, "min", u, L) then
            return "Blackout Kick 736"
        end

        if u(t) and L(t) then
            if i.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 738"
            end

        end

    end

    if e.ChiWave:IsReady() and t:IsInRange(8) then
        if i.Cast(e.ChiWave, nil, nil, not t:IsInRange(40)) then
            o = 115098
            return "Chi Wave 734"
        end

    end

    if e.FlyingSerpentKickActionBarReplacement:IsReady() and not I and not n.Windwalker.IgnoreFSK then
        if i.Cast(e.FlyingSerpentKickActionBarReplacement, nil, nil, not t:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick Slam 740"
        end

    end

    if e.FlyingSerpentKick:IsReady() and not I and t:IsInRange(8) and not n.Windwalker.IgnoreFSK then
        if i.Cast(e.FlyingSerpentKick, nil, nil, not t:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick 742"
        end

    end

end

local function S()
    if e.WhirlingDragonPunch:IsReady() and not H and not g and t:IsInRange(8) and ((a:BuffStack(e.PrimordialPotentialBuff) < 9) or (a:BuffRemains(e.BonedustBrew) < e.RisingSunKick:CooldownRemains() and a:BuffUp(e.BonedustBrew) and v)) then
        if i.Cast(e.WhirlingDragonPunch, nil, nil, not t:IsInMeleeRange(8)) then
            o = 152175
            return "Whirling Dragon Punch 800"
        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (h(e.SpinningCraneKick) and a:BuffUp(e.DanceOfChijiBuff)) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 804"
        end

    end

    if e.RisingSunKick:IsReady() and not g then
        if f.CastTargetIf(e.RisingSunKick, p, "min", u, B) then
            return "Rising Sun Kick 806"
        end

        if u(t) and B(t) then
            if i.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                o = 107428
                return "Rising Sun Kick 808"
            end

        end

    end

    if e.FistsOfFury:IsReady() and not g and not b and (((c() > e.FistsOfFury:ExecuteTime() - 1) or (a:ChiDeficit() <= 1) or (a:BuffRemains(e.StormEarthAndFireBuff) < e.FistsOfFury:ExecuteTime() + 1)) or (d < e.FistsOfFury:ExecuteTime() + 1) or (t:DebuffUp(e.BonedustBrew)) or (a:BuffUp(e.PrimordialPowerBuff))) then
        if i.Cast(e.FistsOfFury, nil, nil, not t:IsSpellInRange(e.FistsOfFury)) then
            o = 113656
            return "Fists of Fury 810"
        end

    end

    if e.CracklingJadeLightning:IsReady() and t:IsInRange(40) and (a:BuffStack(e.TheEmperorsCapacitor) > 19 and c() > e.CracklingJadeLightning:ExecuteTime() - 1 and e.RisingSunKick:CooldownRemains() > e.CracklingJadeLightning:ExecuteTime() or a:BuffStack(e.TheEmperorsCapacitor) > 14 and (e.Serenity:IsAvailable() and e.Serenity:CooldownRemains() < 5 or x == 1 and e.WeaponsOfOrder:CooldownRemains() < 5 or d < 5)) then
        if i.Cast(e.CracklingJadeLightning, nil, nil, not t:IsInRange(40)) then
            o = 117952
            return "Crackling Jade Lightning 812"
        end

    end

    if e.RushingJadeWind:IsReady() and t:IsInRange(8) and (a:BuffDown(e.RushingJadeWindBuff) and l > 1) then
        if i.Cast(e.RushingJadeWind, nil, nil, not t:IsInMeleeRange(8)) then
            o = 116847
            return "Rushing Jade Wind 814"
        end

    end

    if e.FistOfTheWhiteTiger:IsReady() then
        if f.CastTargetIf(e.FistOfTheWhiteTiger, E, "min", u, F) then
            return "Fist of the White Tiger 816"
        end

        if u(t) and F(t) then
            if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not t:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                o = 261947
                return "Fist of the White Tiger 818"
            end

        end

    end

    if e.ExpelHarm:IsReady() and t:IsInRange(8) and a:ChiDeficit() >= 1 then
        if i.Cast(e.ExpelHarm, nil, nil, not t:IsInMeleeRange(8)) then
            o = 322101
            return "Expel Harm 820"
        end

    end

    if e.ChiBurst:IsReady() and t:IsInRange(30) and not a:IsMoving() and (A == 0 or A > e.ChiBurst:CastTime() + .5) and (a:ChiDeficit() >= 1 and l == 1 or a:ChiDeficit() >= 2 and l >= 2) then
        if i.Cast(e.ChiBurst, nil, nil, not t:IsInRange(40)) then
            o = 123986
            return "Chi Burst 822"
        end

    end

    if e.ChiWave:IsReady() and t:IsInRange(40) and (a:BuffDown(e.PrimordialPowerBuff)) then
        if i.Cast(e.ChiWave, nil, nil, not t:IsInRange(40)) then
            o = 115098
            return "Chi Wave 824"
        end

    end

    if e.TigerPalm:IsReady() then
        if f.CastTargetIf(e.TigerPalm, p, "min", z, xe) then
            return "Tiger Palm 826"
        end

        if z(t) and xe(t) then
            if i.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "Tiger Palm 828"
            end

        end

    end

    if e.SpinningCraneKick:IsReady() and t:IsInRange(8) and (a:BuffStack(e.ChiEnergyBuff) > 30 - 5 * l and a:BuffDown(e.StormEarthAndFireBuff) and (e.RisingSunKick:CooldownRemains() > 2 and e.FistsOfFury:CooldownRemains() > 2 or e.RisingSunKick:CooldownRemains() < 3 and e.FistsOfFury:CooldownRemains() > 3 and a:Chi() > 3 or e.RisingSunKick:CooldownRemains() > 3 and e.FistsOfFury:CooldownRemains() < 3 and a:Chi() > 4 or a:ChiDeficit() <= 1 and c() < 2) or a:BuffStack(e.ChiEnergyBuff) > 10 and d < 7) then
        if i.Cast(e.SpinningCraneKick, nil, nil, not t:IsInMeleeRange(8)) then
            o = 101546
            return "Spinning Crane Kick 830"
        end

    end

    if e.BlackoutKick:IsReady() and (not UnitsWithBDBCount == 0 or EnemiesWithMotC < 3 or (not e.CalculatedStrikes:SoulbindEnabled() and EnemiesWithMotC < 2)) then
        if f.CastTargetIf(e.BlackoutKick, p, "min", u, ke) then
            return "Blackout Kick 832"
        end

        if u(t) and ke(t) then
            if i.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 834"
            end

        end

    end

    if e.TigerPalm:IsReady() then
        if f.CastTargetIf(e.TigerPalm, p, "min", z, V) then
            return "Tiger Palm 836"
        end

        if z(t) and V(t) then
            if i.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "Tiger Palm 838"
            end

        end

    end

    if e.ArcaneTorrent:IsReady() and y() and t:IsInRange(8) and a:ChiDeficit() >= 1 then
        if i.Cast(e.ArcaneTorrent, nil, nil, not t:IsInMeleeRange(8)) then
            o = 50613
            return "Arcane Torrent 402"
        end

    end

    if e.FlyingSerpentKickActionBarReplacement:IsReady() and not I and not n.Windwalker.IgnoreFSK then
        if i.Cast(e.FlyingSerpentKickActionBarReplacement, nil, nil, not t:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick Slam 840"
        end

    end

    if e.FlyingSerpentKick:IsReady() and not I and t:IsInRange(8) and not n.Windwalker.IgnoreFSK then
        if i.Cast(e.FlyingSerpentKick, nil, nil, not t:IsInRange(40)) then
            o = 101545
            return "Flying Serpent Kick 842"
        end

    end

    if e.BlackoutKick:IsReady() then
        if f.CastTargetIf(e.BlackoutKick, E, "min", u, be) then
            return "Blackout Kick 844"
        end

        if u(t) and be(t) then
            if i.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 846"
            end

        end

    end

    if e.BlackoutKick:IsReady() then
        if f.CastTargetIf(e.BlackoutKick, E, "min", u, pe) then
            return "Blackout Kick 848"
        end

        if u(t) and pe(t) then
            if i.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "Blackout Kick 850"
            end

        end

    end

    if e.TigerPalm:IsReady() and UnitsWithBDBCount == 0 and not y() then
        if f.CastTargetIf(e.TigerPalm, p, "min", u, P) then
            return "TigerPalm 336"
        end

        if u(t) and P(t) then
            if i.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                o = 100780
                return "TigerPalm 338"
            end

        end

    end

    if e.BlackoutKick:IsReady() and UnitsWithBDBCount == 0 and not y() then
        if f.CastTargetIf(e.BlackoutKick, p, "min", u, qe) then
            return "BlackoutKick 336"
        end

        if u(t) and qe(t) then
            if i.Cast(e.BlackoutKick, nil, nil, not t:IsSpellInRange(e.BlackoutKick)) then
                o = 100784
                return "BlackoutKick 338"
            end

        end

    end

end

local function j()
    M = HeroRotationCharDB.Toggles[6]
    T = HeroRotationCharDB.Toggles[4]
    U = HeroRotationCharDB.Toggles[5]
    w = HeroRotationCharDB.Toggles[12]
    Oe = HeroRotationCharDB.Toggles[15]
    H = HeroRotationCharDB.Toggles[31]
    I = HeroRotationCharDB.Toggles[32]
    b = HeroRotationCharDB.Toggles[33]
    se = HeroRotationCharDB.Toggles[34]
    K = HeroRotationCharDB.Toggles[35]
    ee = HeroRotationCharDB.Toggles[36]
    X = HeroRotationCharDB.Toggles[37]
    ge = HeroRotationCharDB.Toggles[38]
    J = HeroRotationCharDB.Toggles[39]
    g = false
    N = false
    R = false
    if ((n.Windwalker.IncludedCooldowns.Xuen and y()) or (n.Windwalker.IncludedSmallCooldowns.Xuen and (y() or U)) or (not n.Windwalker.IncludedSmallCooldowns.Xuen and not n.Windwalker.IncludedCooldowns.Xuen and not n.Windwalker.IncludedSmallCooldowns.SEFEcho and not n.Windwalker.IncludedCooldowns.SEFEco)) then
        N = true
    end

    if ((n.Windwalker.IncludedCooldowns.SEFFull and y()) or (n.Windwalker.IncludedSmallCooldowns.SEFFull and (y() or U)) or (not n.Windwalker.IncludedSmallCooldowns.SEFFull and not n.Windwalker.IncludedCooldowns.SEFFull)) or ((n.Windwalker.IncludedCooldowns.SEFEco and y() and e.StormEarthAndFire:ChargesFractional() > n.Windwalker.SEFEcoCharge) or (n.Windwalker.IncludedSmallCooldowns.SEFEco and (y() or U) and e.StormEarthAndFire:ChargesFractional() > n.Windwalker.SEFEcoCharge) or (not n.Windwalker.IncludedSmallCooldowns.SEFEco and not n.Windwalker.IncludedCooldowns.SEFEco and e.StormEarthAndFire:ChargesFractional() > n.Windwalker.SEFEcoCharge)) then
        R = true
    end

    A = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                A = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

end

local function b()
    local a = 0
    local n = { 322968, 319603, 319611, 325876, 334493, 334496, 332605, 328494, 326836, 336277, 319669, 323831, 330725, 333299 }
    if UnitExists("mouseover") then
        if UnitIsDead("mouseover") == true and UnitCanAttack("player", "mouseover") ~= true then
            a = 9999
        else
            for e = 0, 40 do
                local o, o, o, e, o, o, o, o, o, t = UnitDebuff("mouseover", e)
                for i, o in oe(n) do
                    if o == t then
                                                                                                if (e == "Magic") then
                            a = 1
                        elseif (e == "Poison") then
                            a = 2
                        elseif (e == "Disease") then
                            a = 3
                        elseif (e == "Curse") then
                            a = 4
                        end

                    end

                end

            end

        end

    end

    if a == 2 or DebuffCheckC == 3 and e.Detox:IsReady() and m("mouseover"):IsInRange(40) then
        if i.Cast(e.Detox, nil, nil, not t:IsInRange(40)) then
            o = 218164
            return "Detox MO"
        end

    end

end

local function y()
    p = a:GetEnemiesInMeleeRange(5)
    E = a:GetEnemiesInMeleeRange(8)
    if ve() then
        Enemies10ySplash = t:GetEnemiesInSplashRange(10)
        l = #E
    else
        Enemies10ySplash = 1
        l = 1
    end

    EnemiesWithMotC = GetSpellCount(101546)
    UnitsWithBDBCount = Ne(E)
    UnitsWithBDBSEFCount = Ie(E)
    local y = a:IsTankingAoE(8) or a:IsTanking(t)
    d = q.FightRemains(E, false)
    v = e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24
    if not BotOn then
        r = 0
        o = 0
        D = 0
    end

    if r > 0 then
        r = 0
    end

    if o > 0 then
        o = 0
    end

    if D > 0 then
        D = 0
    end

    _e = j()
    if not t:IsInMeleeRange(10) and l > 0 and n.Windwalker.TargetSwap == "AutoSwap" and not w then
        r = 999
    end

    _e = b()
    if f.TargetIsValid() and not a:IsDeadOrGhost() then
        if not a:AffectingCombat() and M then
            local e = Ae()
            if e then
                return e
            end

        end

        if e.FlyingSerpentKickActionBarReplacement:IsReady() and not I and not n.Windwalker.IgnoreFSK and a:AffectingCombat() then
            if i.Cast(e.FlyingSerpentKickActionBarReplacement, nil, nil, not t:IsInRange(40)) then
                o = 101545
                return "Flying Serpent Kick Slam 740"
            end

        end

        if a:IsChanneling(e.FistsOfFury) and (ge or G) then
            if i.Cast(e.PoolEnergy, nil, nil, nil) then
                o = 1000
                return "Casting FoF"
            end

        end

        if not a:IsChanneling(e.FistsOfFury) and e.FistsOfFury:TimeSinceLastCast() > .25 then
            G = false
        end

                if a:IsChanneling(e.FistsOfFury) and (not W or e.RisingSunKick:CooldownRemains() <= 0) and not te and a:AffectingCombat() then
            if i.Cast(e.PoolEnergy, nil, nil, nil) then
                o = 99999
                return "Casting FoF"
            end

        elseif (W == true or te == true) and not a:IsChanneling(e.FistsOfFury) then
            W = false
            te = false
        end

                if (se and e.LegSweep:IsUsableP() and e.LegSweep:CooldownRemains(BypassRecovery) <= 0) then
            if i.Cast(e.LegSweep, nil, nil, nil) then
                o = 119381
                return "queue Leg Sweep"
            end

        elseif ((not e.LegSweep:IsUsableP() or e.LegSweep:CooldownRemains(BypassRecovery) > 0) and se) then
            HeroRotationCharDB.Toggles[34] = not HeroRotationCharDB.Toggles[34]
            i.Print("Leg Sweep Queue is now " .. (HeroRotationCharDB.Toggles[34] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

                if (K and e.Paralysis:IsUsableP() and e.Paralysis:CooldownRemains(BypassRecovery) <= 0) then
            if i.Cast(e.Paralysis, nil, nil, nil) then
                if m("mouseover"):GUID() ~= nil and m("mouseover"):IsSpellInRange(e.Paralysis) then
                    r = 1115078
                    return "queue Paralysis MO"
                else
                    o = 115078
                    return "queue Paralysis"
                end

            end

        elseif ((not e.Paralysis:IsUsableP() or e.Paralysis:CooldownRemains(BypassRecovery) > 0) and K) then
            HeroRotationCharDB.Toggles[35] = not HeroRotationCharDB.Toggles[35]
            i.Print("Paralysis Queue is now " .. (HeroRotationCharDB.Toggles[35] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

                if (ee and e.RingOfPeace:IsAvailable() and e.RingOfPeace:IsUsableP() and e.RingOfPeace:CooldownRemains(BypassRecovery) <= 0) then
            if i.Cast(e.RingOfPeace, nil, nil, nil) then
                o = 116844
                return "queue RingOfPeace"
            end

        elseif ((not e.RingOfPeace:IsUsableP() or e.RingOfPeace:CooldownRemains(BypassRecovery) > 0 or not e.RingOfPeace:IsAvailable()) and ee) then
            HeroRotationCharDB.Toggles[36] = not HeroRotationCharDB.Toggles[36]
            i.Print("RingOfPeace Queue is now " .. (HeroRotationCharDB.Toggles[36] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

                if (X and e.BonedustBrew:IsUsableP() and e.BonedustBrew:CooldownRemains(BypassRecovery) <= 0) then
            if i.Cast(e.BonedustBrew, nil, nil, nil) then
                o = 325216
                return "queue BonedustBrew"
            end

        elseif ((not e.BonedustBrew:IsUsableP() or e.BonedustBrew:CooldownRemains(BypassRecovery) > 0) and X) then
            HeroRotationCharDB.Toggles[37] = not HeroRotationCharDB.Toggles[37]
            i.Print("BonedustBrew Queue is now " .. (HeroRotationCharDB.Toggles[37] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

        if (a:AffectingCombat()) then
            if e.FortifyingBrew:IsReady() and a:HealthPercentage() < n.Commons.FortifyingBrew then
                if i.Cast(e.FortifyingBrew, nil, nil, nil) then
                    o = 243435
                    return "Fortifying Brew 100"
                end

            end

            if e.TouchOfKarma:IsReady() and a:HealthPercentage() < n.Commons.TouchofKarma then
                if i.Cast(e.TouchOfKarma, nil, nil, nil) then
                    o = 122470
                    return "ToK 100"
                end

            end

            if a:HealthPercentage() < n.Commons.PhialHP and s.PhialofSerenity:IsReady() and s.PhialofSerenity:CooldownRemains() <= 0 then
                if i.Cast(s.PhialofSerenity, nil) then
                    o = 55
                    return "PhialofSerenity HP"
                end

            end

            if a:HealthPercentage() < n.Commons.HealthstoneHP and s.Healthstone:IsReady() and s.Healthstone:CooldownRemains() <= 0 then
                if i.Cast(s.Healthstone, nil) then
                    o = 40
                    return "Healthstone HP"
                end

            end

            if a:HealthPercentage() < n.Commons.HealPotHP and s.CosmicHealPot:IsReady() and s.CosmicHealPot:CooldownRemains() <= 0 then
                if i.Cast(s.CosmicHealPot, nil) then
                    o = 45
                    return "CosmicHealPot HP"
                end

            end

            if a:HealthPercentage() < n.Commons.HealPotHP and s.HealPot:IsReady() and s.HealPot:CooldownRemains() <= 0 then
                if i.Cast(s.HealPot, nil) then
                    o = 41
                    return "HealPot HP"
                end

            end

        end

        _ = (e.InvokeXuenTheWhiteTiger:CooldownRemains() > d or d - e.InvokeXuenTheWhiteTiger:CooldownRemains() < 120 and ((e.Serenity:IsAvailable() and d > e.Serenity:CooldownRemains() and e.Serenity:CooldownRemains() > 10) or (e.StormEarthAndFire:FullRechargeTime() < d and e.StormEarthAndFire:FullRechargeTime() > 15) or (e.StormEarthAndFire:Charges() == 0 and e.StormEarthAndFire:CooldownRemains() < d)))
        if s.PotionofPhantomFire:IsReady() and a:AffectingCombat() and t:IsInRange(8) and n.Commons.UsePotions and ((((a:BuffUp(e.SerenityBuff) or a:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or q.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and a:BloodlustUp())) then
            if i.CastSuggested(s.PotionofPhantomFire) then
                o = 32
                return "Potion of Phantom Fire 102"
            end

        end

        if s.PotionofSpectralAgility:IsReady() and a:AffectingCombat() and t:IsInRange(8) and n.Commons.UsePotions and ((((a:BuffUp(e.SerenityBuff) or a:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or q.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and a:BloodlustUp())) then
            if i.CastSuggested(s.PotionofSpectralAgility) then
                o = 32
                return "Potion of Spectral Agility 104"
            end

        end

        if s.PotionofDeathlyFixation:IsReady() and a:AffectingCombat() and t:IsInRange(8) and n.Commons.UsePotions and ((((a:BuffUp(e.SerenityBuff) or a:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or q.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and a:BloodlustUp())) then
            if i.CastSuggested(s.PotionofDeathlyFixation) then
                o = 32
                return "Potion of Deathly Fixation 106"
            end

        end

        if s.PotionofEmpoweredExorcisms:IsReady() and a:AffectingCombat() and t:IsInRange(8) and n.Commons.UsePotions and ((((a:BuffUp(e.SerenityBuff) or a:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or q.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and a:BloodlustUp())) then
            if i.CastSuggested(s.PotionofEmpoweredExorcisms) then
                o = 32
                return "Potion of Empowered Exorcisms 108"
            end

        end

        if s.PotionofHardenedShadows:IsReady() and a:AffectingCombat() and t:IsInRange(8) and n.Commons.UsePotions and ((((a:BuffUp(e.SerenityBuff) or a:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or q.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and a:BloodlustUp())) then
            if i.CastSuggested(s.PotionofHardenedShadows) then
                o = 32
                return "Potion of Hardened Shadows 110"
            end

        end

        if s.PotionofSpectralStamina:IsReady() and a:AffectingCombat() and t:IsInRange(8) and n.Commons.UsePotions and ((((a:BuffUp(e.SerenityBuff) or a:BuffUp(e.StormEarthAndFireBuff)) and (e.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= 24) or q.BossFilteredFightRemains("<=", 60)) and not i.GUISettings.General.HoldPotforBL) or (i.GUISettings.General.HoldPotforBL and a:BloodlustUp())) then
            if i.CastSuggested(s.PotionofSpectralStamina) then
                o = 32
                return "Potion of Spectral Stamina 112"
            end

        end

        if a:BuffUp(e.SerenityBuff) and a:AffectingCombat() then
            local e = k()
            if e then
                return e
            end

        end

        if a:BuffUp(e.WeaponsOfOrder) and a:AffectingCombat() then
            local e = O()
            if e then
                return e
            end

        end

        if e.FaelineStomp:IsCastable() and T and t:IsInMeleeRange(10) and (a:AffectingCombat() or M) and (h(e.FaelineStomp) and (ze or e.GroveInvigoration:SoulbindEnabled() or l < 3 and a:BuffDown(e.StormEarthAndFireBuff))) then
            if ae(e.FaelineStomp, nil) then
                o = 327104
                return "faeline_stomp main 6"
            end

        end

        if (q.CombatTime() < 4 and a:Chi() < 5 and not (v)) and (a:AffectingCombat() or M) then
            local e = Te()
            if e then
                return e
            end

        end

        if e.FistOfTheWhiteTiger:IsReady() and a:AffectingCombat() then
            if f.CastTargetIf(e.FistOfTheWhiteTiger, p, "min", u, re) then
                return "Fist of the White Tiger 114"
            end

            if (u(t) and re(t)) then
                if i.Cast(e.FistOfTheWhiteTiger, nil, nil, not t:IsSpellInRange(e.FistOfTheWhiteTiger)) then
                    o = 261947
                    return "Fist of the White Tiger 116"
                end

            end

        end

        if e.ExpelHarm:IsReady() and (UnitsWithBDBCount == 0 or e.RisingSunKick:CooldownRemains(BypassRecovery) > 0 or l <= 2) and a:AffectingCombat() and t:IsInRange(8) and (a:ChiDeficit() >= 1 and (c() < 1 or e.Serenity:CooldownRemains() < 2 or c() < 4 and e.FistsOfFury:CooldownRemains() < 1.5 or e.WeaponsOfOrder:CooldownRemains() < 2) and UnitsWithBDBCount == 0) then
            if i.Cast(e.ExpelHarm, nil, nil, not t:IsInMeleeRange(8)) then
                o = 322101
                return "Expel Harm 118"
            end

        end

        if e.TigerPalm:IsReady() and a:AffectingCombat() and (UnitsWithBDBCount == 0 or e.RisingSunKick:CooldownRemains(BypassRecovery) > 0 or l <= 2) then
            if f.CastTargetIf(e.TigerPalm, E, "min", u, fe) then
                return "Tiger Palm 120"
            end

            if (u(t) and fe(t)) then
                if i.Cast(e.TigerPalm, nil, nil, not t:IsSpellInRange(e.TigerPalm)) then
                    o = 100780
                    return "Tiger Palm 122"
                end

            end

        end

        if e.ChiBurst:IsReady() and not a:IsMoving() and (x == 3 and e.FaelineStomp:CooldownRemains() > 25 and (a:ChiDeficit() >= 1 and l == 1 or a:ChiDeficit() >= 2 and l >= 2)) then
            if i.Cast(e.ChiBurst, nil, nil, not t:IsInRange(40)) then
                o = 123986
                return "chi_burst main 16"
            end

        end

        if ((i.CDsON() or not i.CDsON()) and not e.Serenity:IsAvailable()) and a:AffectingCombat() then
            local e = C()
            if e then
                return e
            end

        end

        if e.RisingSunKick:IsReady() and not g and (UnitsWithBDBCount > 0) then
            if f.CastTargetIf(e.RisingSunKick, p, "min", u, B) then
                return "Rising Sun Kick 806"
            end

            if u(t) and B(t) then
                if i.Cast(e.RisingSunKick, nil, nil, not t:IsSpellInRange(e.RisingSunKick)) then
                    o = 107428
                    return "Rising Sun Kick 808"
                end

            end

        end

        if ((i.CDsON() or not i.CDsON()) and e.Serenity:IsAvailable()) and a:AffectingCombat() then
            local e = Y()
            if e then
                return e
            end

        end

        if ((l < 3) or (not i.AoEON())) and a:AffectingCombat() then
            local e = S()
            if e then
                return e
            end

        end

        if i.AoEON() and (l >= 3) and a:AffectingCombat() then
            local e = he()
            if e then
                return e
            end

        end

        if a:AffectingCombat() then
            if i.Cast(e.PoolEnergy) and not n.Windwalker.NoWindwalkerPooling then
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
    if D == 0 then
        return 0
    else
        return D
    end

end

i.SetAPL(269, y, e)

