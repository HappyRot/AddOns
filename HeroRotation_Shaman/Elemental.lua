local e, e = ...
local e = HeroDBC.DBC
local A = HeroLib
local e = HeroCache
local _ = A.Unit
local t = _.Player
local C = _.Pet
local a = _.Target
local M = A.Spell
local e = A.MultiSpell
local o = A.Item
local e = A.Action
local d = HeroRotation
local i = d.Cast
local R = d.AoEON
local y = d.CDsON
local T = HeroRotationCharDB.Toggles[4]
local z = HeroRotationCharDB.Toggles[5]
local V = HeroRotationCharDB.Toggles[6]
local de = HeroRotationCharDB.Toggles[15]
local I = HeroRotationCharDB.Toggles[12]
local te = HeroRotationCharDB.Toggles[60]
local H = HeroRotationCharDB.Toggles[90]
local W = HeroRotationCharDB.Toggles[91]
local G = HeroRotationCharDB.Toggles[92]
local K = HeroRotationCharDB.Toggles[93]
local B = HeroRotationCharDB.Toggles[94]
local Y = HeroRotationCharDB.Toggles[96]
local P = HeroRotationCharDB.Toggles[95]
local ee = HeroRotationCharDB.Toggles[97]
local n = 0
local ne = UnitPower
local he = Enum.PowerType.Maelstrom
local e = M.Shaman.Elemental
local q = o.Shaman.Elemental
local D = {  }
local s = t:GetEquipment()
local s = o(0)
local o = o(0)
local L, o = GetInventoryItemID("player", 13)
local S, ae = GetInventoryItemID("player", 14)
local me
local re, ue, w, ce
local N, r
local o
local o
local c = 0
local o = 0
local s = 0
local m = d.Commons.Everyone
local s = d.Commons.Shaman
local h = { General = d.GUISettings.General, Commons = d.GUISettings.APL.Shaman.Commons, Elemental = d.GUISettings.APL.Shaman.Elemental }
local s = t:HasLegendaryEquipped(131)
local p = t:HasLegendaryEquipped(134)
local ie = t:HasLegendaryEquipped(135)
local g = t:HasLegendaryEquipped(136)
local Q = t:HasLegendaryEquipped(137)
local l = e.CallOfFlame:ConduitEnabled()
local oe = t:HasLegendaryEquipped(246) or (t:HasUnity() and e.FaeTransfusion:IsAvailable())
local x = t:HasLegendaryEquipped(228) or (t:HasUnity() and e.PrimordialWave:IsAvailable())
A:RegisterForEvent(function()
    s = t:HasLegendaryEquipped(131)
    p = t:HasLegendaryEquipped(134)
    ie = t:HasLegendaryEquipped(135)
    g = t:HasLegendaryEquipped(136)
    Q = t:HasLegendaryEquipped(137)
    l = e.CallOfFlame:ConduitEnabled()
    x = t:HasLegendaryEquipped(228)
end, "PLAYER_EQUIPMENT_CHANGED")
A:RegisterForEvent(function()
    e.PrimordialWave:RegisterInFlightEffect(327162)
    e.PrimordialWave:RegisterInFlight()
    e.LavaBurst:RegisterInFlight()
end, "LEARNED_SPELL_IN_TAB")
e.PrimordialWave:RegisterInFlightEffect(327162)
e.PrimordialWave:RegisterInFlight()
e.LavaBurst:RegisterInFlight()
local function F(e)
    if e then
        return 1
    else
        return 0
    end

end

local function s(e)
    return e ~= 0
end

local v
local f
local b
local s
local k
local j
local u
local E
local l
local U
local function le()
    v = 0
    f = 0
    b = 0
    s = 0
    k = 0
    E = {  }
    j = nil
    u = nil
    local i = 999
    local o = 0
    if R() then
        for a, t in pairs(t:GetEnemiesInRange(40)) do
            if t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 then
                v = v + 1
                local e = t:DebuffRemains(e.FlameShockDebuff)
                if e > 0 then
                    b = b + 1
                end

                if e < 5 then
                    s = s + 1
                end

                if e < i then
                    i = e
                    u = t
                end

                if e == 0 and t:Health() > o then
                    o = t:Health()
                    u = t
                end

                local a = t:GetEnemiesInSplashRange(10)
                local e = {  }
                for t, a in pairs(a) do
                    local t = false
                    for o, e in pairs(e) do
                        if a:GUID() == e:GUID() then
                            t = true
                            break
                        end

                    end

                    if not t then
                        table.insert(e, a)
                    end

                end

                E[t] = e
                if #e > f then
                    f = #e
                    j = t
                end

                if not t:TimeToDieIsNotValid() and not t:IsUserCycleBlacklisted() then
                    k = math.max(k, t:TimeToDie())
                end

            end

        end

    else
        v = 1
        local e = a:DebuffRemains(e.FlameShockDebuff)
        if e > 0 then
            b = 1
        end

        if e < 5 then
            s = 1
        end

        u = a
        f = 1
        j = a
        if not a:TimeToDieIsNotValid() and not a:IsUserCycleBlacklisted() then
            k = a:TimeToDie()
        end

    end

end

local function fe()
    l = false
    U = false
    local t = C:IsActive()
    local e = C:NPCID()
    if t then
                if e == 77942 then
            l = true
        elseif e == 61029 then
            U = true
        end

    end

end

local function s(a)
    if a == nil then
        return nil
    end

    local o = a:IsCastable() and a:IsReady()
                if a == e.Stormkeeper or a == e.ElementalBlast or a == e.Icefury then
        local e = (not t:IsMoving() or t:BuffUp(e.SpiritwalkersGraceBuff))
        return o and e and not t:IsCasting(a)
    elseif a == e.LightningBolt or a == e.ChainLightning then
        local e = (not t:IsMoving() or t:BuffUp(e.StormkeeperBuff) or t:BuffUp(e.SpiritwalkersGraceBuff))
        return o and e
    elseif a == e.LavaBurst then
        local a = (not t:IsMoving() or t:BuffUp(e.LavaSurgeBuff) or t:BuffUp(e.SpiritwalkersGraceBuff))
        local n = t:BuffUp(e.LavaSurgeBuff)
        local i = (not t:IsCasting(e.LavaBurst) and e.LavaBurst:Charges() >= 1)
        local e = (t:IsCasting(e.LavaBurst) and e.LavaBurst:Charges() == 2)
        return o and a and (n or i or e)
    elseif a == e.PrimordialWave then
        return o and not t:BuffUp(e.PrimordialWaveBuff) and not t:BuffUp(e.LavaSurgeBuff)
    else
        return o
    end

end

local function u(t)
    return t:DebuffRemains(e.FlameShockDebuff)
end

local function f(t)
    return t:DebuffDown(e.FlameShockDebuff)
end

local function Z(i)
                if ((t:BuffDown(e.PrimordialWaveBuff) and (not l or (r < 3 and t:BuffStack(e.WindGustBuff) < 20) or e.LeadByExample:SoulbindEnabled() or x) and (r < 5 or e.MasterOfTheElements:IsAvailable() or p or e.LeadByExample:SoulbindEnabled() or x) and not t:BuffUp(e.SplinteredElementsBuff)) and i:IsInRange(40) and i:GUID() == _("mouseover"):GUID()) then
        c = 1326059
        return true
    elseif ((t:BuffDown(e.PrimordialWaveBuff) and (not l or (r < 3 and t:BuffStack(e.WindGustBuff) < 20) or e.LeadByExample:SoulbindEnabled() or x) and (r < 5 or e.MasterOfTheElements:IsAvailable() or p or e.LeadByExample:SoulbindEnabled() or x) and not t:BuffUp(e.SplinteredElementsBuff)) and i:IsInRange(40) and h.Elemental.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not I) then
        c = 999
        return true
    elseif ((t:BuffDown(e.PrimordialWaveBuff) and (not l or (r < 3 and t:BuffStack(e.WindGustBuff) < 20) or e.LeadByExample:SoulbindEnabled() or x) and (r < 5 or e.MasterOfTheElements:IsAvailable() or p or e.LeadByExample:SoulbindEnabled() or x) and not t:BuffUp(e.SplinteredElementsBuff)) and i:IsInRange(40) and i:GUID() == a:GUID()) then
        o = 326059
        return true
    elseif (t:BuffDown(e.PrimordialWaveBuff) and (not l or (r < 3 and t:BuffStack(e.WindGustBuff) < 20) or e.LeadByExample:SoulbindEnabled() or x) and (r < 5 or e.MasterOfTheElements:IsAvailable() or p or e.LeadByExample:SoulbindEnabled() or x) and not t:BuffUp(e.SplinteredElementsBuff) and i:IsInRange(40)) then
        return true
    end

end

local function J(i)
                if ((e.PrimordialWave:IsAvailable() and t:BuffDown(e.PrimordialWaveBuff) and t:BuffDown(e.SplinteredElementsBuff)) and i:IsInRange(40) and i:GUID() == _("mouseover"):GUID()) then
        c = 1326059
        return true
    elseif ((e.PrimordialWave:IsAvailable() and t:BuffDown(e.PrimordialWaveBuff) and t:BuffDown(e.SplinteredElementsBuff)) and i:IsInRange(40) and h.Elemental.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not I) then
        c = 999
        return true
    elseif ((e.PrimordialWave:IsAvailable() and t:BuffDown(e.PrimordialWaveBuff) and t:BuffDown(e.SplinteredElementsBuff)) and i:IsInRange(40) and i:GUID() == a:GUID()) then
        o = 326059
        return true
    elseif (e.PrimordialWave:IsAvailable() and t:BuffDown(e.PrimordialWaveBuff) and t:BuffDown(e.SplinteredElementsBuff)) and i:IsInRange(40) then
        return true
    end

end

local function X(i)
                if ((i:DebuffDown(e.FlameShockDebuff) and (not l or (r < 3 and t:BuffStack(e.WindGustBuff) < 20)) and (r < 3 or e.MasterOfTheElements:IsAvailable() or p)) and i:IsInRange(40) and i:GUID() == _("mouseover"):GUID()) then
        c = 1188389
        return true
    elseif ((i:DebuffDown(e.FlameShockDebuff) and (not l or (r < 3 and t:BuffStack(e.WindGustBuff) < 20)) and (r < 3 or e.MasterOfTheElements:IsAvailable() or p)) and i:IsInRange(40) and h.Elemental.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not I) then
        c = 999
        return true
    elseif ((i:DebuffDown(e.FlameShockDebuff) and (not l or (r < 3 and t:BuffStack(e.WindGustBuff) < 20)) and (r < 3 or e.MasterOfTheElements:IsAvailable() or p)) and i:IsInRange(40) and i:GUID() == a:GUID()) then
        o = 188389
        return true
    elseif (i:DebuffDown(e.FlameShockDebuff) and (not l or (r < 3 and t:BuffStack(e.WindGustBuff) < 20)) and (r < 3 or e.MasterOfTheElements:IsAvailable() or p)) and i:IsInRange(40) then
        return true
    end

end

local function O(t)
                if ((t:DebuffRefreshable(e.FlameShockDebuff) or t:DebuffDown(e.FlameShockDebuff)) and t:IsInRange(40) and t:GUID() == _("mouseover"):GUID()) then
        c = 1188389
        return true
    elseif ((t:DebuffRefreshable(e.FlameShockDebuff) or t:DebuffDown(e.FlameShockDebuff)) and t:IsInRange(40) and h.Elemental.TargetSwap == "AutoSwap" and t:GUID() ~= a:GUID() and not I) then
        c = 999
        return true
    elseif ((t:DebuffRefreshable(e.FlameShockDebuff) or t:DebuffDown(e.FlameShockDebuff)) and t:IsInRange(40) and t:GUID() == a:GUID()) then
        o = 188389
        return true
    elseif (t:DebuffRefreshable(e.FlameShockDebuff) or t:DebuffDown(e.FlameShockDebuff)) and t:IsInRange(40) then
        return true
    end

end

local function se(i)
                if (((i:DebuffDown(e.FlameShockDebuff) or i:DebuffRemains(e.FlameShockDebuff) <= t:GCD() or (e.Ascendance:IsAvailable() and i:DebuffRemains(e.FlameShockDebuff) < (e.Ascendance:CooldownRemains() + t:BuffRemains(e.AscendanceBuff)) and e.Ascendance:CooldownRemains() < 4)) and (t:BuffUp(e.LavaSurgeBuff) or not t:BloodlustUp())) and i:IsInRange(40) and i:GUID() == _("mouseover"):GUID()) then
        c = 1188389
        return true
    elseif (((i:DebuffDown(e.FlameShockDebuff) or i:DebuffRemains(e.FlameShockDebuff) <= t:GCD() or (e.Ascendance:IsAvailable() and i:DebuffRemains(e.FlameShockDebuff) < (e.Ascendance:CooldownRemains() + t:BuffRemains(e.AscendanceBuff)) and e.Ascendance:CooldownRemains() < 4)) and (t:BuffUp(e.LavaSurgeBuff) or not t:BloodlustUp())) and i:IsInRange(40) and h.Elemental.TargetSwap == "AutoSwap" and i:GUID() ~= a:GUID() and not I) then
        c = 999
        return true
    elseif (((i:DebuffDown(e.FlameShockDebuff) or i:DebuffRemains(e.FlameShockDebuff) <= t:GCD() or (e.Ascendance:IsAvailable() and i:DebuffRemains(e.FlameShockDebuff) < (e.Ascendance:CooldownRemains() + t:BuffRemains(e.AscendanceBuff)) and e.Ascendance:CooldownRemains() < 4)) and (t:BuffUp(e.LavaSurgeBuff) or not t:BloodlustUp())) and i:IsInRange(40) and i:GUID() == a:GUID()) then
        o = 188389
        return true
    elseif ((i:DebuffDown(e.FlameShockDebuff) or i:DebuffRemains(e.FlameShockDebuff) <= t:GCD() or (e.Ascendance:IsAvailable() and i:DebuffRemains(e.FlameShockDebuff) < (e.Ascendance:CooldownRemains() + t:BuffRemains(e.AscendanceBuff)) and e.Ascendance:CooldownRemains() < 4)) and (t:BuffUp(e.LavaSurgeBuff) or not t:BloodlustUp())) and i:IsInRange(40) then
        return true
    end

end

local function k(t)
                if ((t:DebuffRemains(e.FlameShock) > e.LavaBurst:CastTime()) and t:IsInRange(40) and t:GUID() == _("mouseover"):GUID()) then
        c = 151505
        return true
    elseif ((t:DebuffRemains(e.FlameShock) > e.LavaBurst:CastTime()) and t:IsInRange(40) and h.Elemental.TargetSwap == "AutoSwap" and t:GUID() ~= a:GUID() and not I) then
        c = 999
        return true
    elseif ((t:DebuffRemains(e.FlameShock) > e.LavaBurst:CastTime()) and t:IsInRange(40) and t:GUID() == a:GUID()) then
        o = 51505
        return true
    elseif (t:DebuffRemains(e.FlameShock) > e.LavaBurst:CastTime()) and t:IsInRange(40) then
        return true
    end

end

local function f()
    local a = ne("player", he)
    if not t:IsCasting() then
        return a
    else
                                        if t:IsCasting(e.ElementalBlast) then
            return a + 30
        elseif t:IsCasting(e.Icefury) then
            return a + 25
        elseif t:IsCasting(e.LightningBolt) then
            return a + 8
        elseif t:IsCasting(e.LavaBurst) then
            return a + 10 * (1 + F(t:BuffUp(e.PrimordialWaveBuff)) * b)
        elseif t:IsCasting(e.ChainLightning) then
            return a + (4 * v)
        else
            return a
        end

    end

end

local function v()
    if not e.MasterOfTheElements:IsAvailable() then
        return false
    end

    local a = t:BuffUp(e.MasterOfTheElementsBuff)
    if not t:IsCasting() then
        return a
    else
                                        if t:IsCasting(e.LavaBurst) then
            return true
        elseif t:IsCasting(e.ElementalBlast) then
            return false
        elseif t:IsCasting(e.Icefury) then
            return false
        elseif t:IsCasting(e.LightningBolt) then
            return false
        elseif t:IsCasting(e.ChainLightning) then
            return false
        else
            return a
        end

    end

end

local function E()
    if not e.Stormkeeper:IsAvailable() then
        return false
    end

    local a = t:BuffUp(e.StormkeeperBuff)
    if not t:IsCasting() then
        return a
    else
        if t:IsCasting(e.Stormkeeper) then
            return true
        else
            return a
        end

    end

end

local function j()
    if not e.Icefury:IsAvailable() then
        return false
    end

    local a = t:BuffUp(e.IcefuryBuff)
    if not t:IsCasting() then
        return a
    else
        if t:IsCasting(e.Icefury) then
            return true
        else
            return a
        end

    end

end

local function ne()
    if s(e.EarthElemental) and h.Elemental.TTDSetting < a:TimeToDie() and not H and a:IsSpellInRange(e.LightningBolt) and not e.PrimalElementalist:IsAvailable() and y() then
        if i(e.EarthElemental, nil, nil) then
            o = 198103
            return "Precombat Earth Ele"
        end

    end

    if s(e.Stormkeeper) and (n == 0 or n > e.Stormkeeper:ExecuteTime()) and a:IsSpellInRange(e.LightningBolt) and e.Stormkeeper:IsAvailable() and z then
        if i(e.Stormkeeper, nil) then
            o = 191634
            return "Precombat Stormkeeper"
        end

    end

    if s(e.FireElemental) and y() and a:IsSpellInRange(e.ElementalBlast) and not e.StormElemental:IsAvailable() then
        if i(e.FireElemental, nil, nil) then
            o = 198067
            return "Precombat FireElemental"
        end

    end

    if s(e.ElementalBlast) and (n == 0 or n > e.ElementalBlast:ExecuteTime()) and a:IsSpellInRange(e.LightningBolt) and e.ElementalBlast:IsAvailable() and r < 3 then
        if i(e.ElementalBlast, nil, nil, not a:IsSpellInRange(e.ElementalBlast)) then
            o = 117014
            return "Precombat Elemental Blast"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and not t:IsCasting(e.LavaBurst) and ((not e.ElementalBlast:IsAvailable() and N < 3) or E()) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Precombat Lavaburst"
        end

    end

    if s(e.ChainLightning) and (n == 0 or n > e.ChainLightning:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) and not e.ElementalBlast:IsAvailable() and N >= 3 and not E() then
        if i(e.ChainLightning, nil) then
            o = 188443
            return "Precombat ChaimLightning"
        end

    end

    if s(e.ChainLightning) and (n == 0 or n > e.Fleshcraft:ExecuteTime()) and e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled() and not t:IsMoving() then
        if i(e.Fleshcraft, nil, nil) then
            o = 324631
            return "Precombat Fleshcraft"
        end

    end

end

local function he()
    if s(e.StormElemental) and a:IsInRange(40) and e.StormElemental:IsAvailable() and y() and h.Elemental.TTDSetting < a:TimeToDie() then
        if i(e.StormElemental, nil) then
            o = 192249
            return "Storm Elemental 1"
        end

    end

    if s(e.Earthquake) and h.Elemental.TTDSetting < a:TimeToDie() and (n == 0 or n > e.Earthquake:ExecuteTime()) and a:IsInRange(40) and t:BuffUp(e.EchoingShockBuff) then
        if i(e.Earthquake, nil) then
            o = 61882
            return "EQ 1"
        end

    end

    if s(e.ChainHarvest) and (n == 0 or n > e.ChainHarvest:ExecuteTime()) and a:IsInRange(40) and T then
        if i(e.ChainHarvest, nil) then
            o = 320674
            return "Chain Harvest 1"
        end

    end

    if s(e.Stormkeeper) and (n == 0 or n > e.Stormkeeper:ExecuteTime()) and a:IsInRange(40) and e.Stormkeeper:IsAvailable() and z then
        if i(e.Stormkeeper, nil) then
            o = 191634
            return "AoE Stormkeeper 1"
        end

    end

    if s(e.FlameShock) and a:IsInRange(40) and ((b < 2 and r <= 3 and e.PrimordialWave:CooldownRemains() < 16 and e.PrimordialWave:IsAvailable() and not l) or (b < 1 and r >= 4 and not l and e.MasterOfTheElements:IsAvailable()) or (p and not l) or (x and ((b < 3 and not g) or b < 4) and (e.PrimordialWave:CooldownRemains() < 16 or t:BuffUp(e.PrimordialWaveBuff))) and a:DebuffRefreshable(e.FlameShockDebuff)) then
        if i(e.FlameShock, nil) then
            o = 188389
            return "Flameshock aoe 1"
        end

    end

    if s(e.FlameShock) and ((b < 2 and r <= 3 and e.PrimordialWave:CooldownRemains() < 16 and e.PrimordialWave:IsAvailable() and not l) or (b < 1 and r >= 4 and not l and e.MasterOfTheElements:IsAvailable()) or (p and not l) or (x and ((b < 3 and not g) or b < 4) and (e.PrimordialWave:CooldownRemains() < 16 or t:BuffUp(e.PrimordialWaveBuff)))) then
        if m.CastCycle(e.FlameShock, w, O, not a:IsSpellInRange(e.FlameShock), nil) then
            return "FlameShock aoe 104"
        end

    end

    if s(e.FlameShock) and a:IsInRange(40) and a:DebuffDown(e.FlameShockDebuff) and ((not l and (e.MasterOfTheElements:IsAvailable() or p)) or (x and a:DebuffDown(e.FlameShockDebuff) and t:BuffUp(e.PrimordialWaveBuff))) then
        if i(e.FlameShock, nil) then
            o = 188389
            return "Flameshock aoe 2"
        end

    end

    if s(e.EchoingShock) and h.Elemental.TTDSetting < a:TimeToDie() and a:IsInRange(40) and z and e.EchoingShock:IsAvailable() and f() >= 60 and h.Elemental.TTDSetting < a:TimeToDie() and ((g and t:BuffUp(e.EchoesofGreatSunderingBuff)) or not g) then
        if i(e.EchoingShock, nil) then
            o = 320125
            return "Echoing Shock aoe 2"
        end

    end

    if s(e.Ascendance) and a:IsInRange(40) and y() and h.Elemental.TTDSetting < a:TimeToDie() and e.Ascendance:IsAvailable() and (not l) and (not e.Icefury:IsAvailable() or (not j() and not e.Icefury:CooldownUp(e.Icefury))) then
        if i(e.Ascendance, nil) then
            o = 114050
            return "Ascendance aoe 2"
        end

    end

    if s(e.LiquidMagmaTotem) and a:IsInRange(40) and z and e.LiquidMagmaTotem:IsAvailable() then
        if i(e.LiquidMagmaTotem, nil) then
            o = 192222
            return "LiquidMagmaTotem aoe 2"
        end

    end

    if s(e.ChainLightning) and (n == 0 or n > e.ChainLightning:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) and r < 4 and v() and f() < 50 then
        if i(e.ChainLightning, nil) then
            o = 188443
            return "ChainLightning aoe 1"
        end

    end

    if s(e.EarthShock) and a:IsInRange(40) and g and not t:BuffUp(e.EchoesofGreatSunderingBuff) then
        if i(e.EarthShock, nil) then
            o = 8042
            return "EarthShock aoe 1"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and r < 4 and (not l) and (t:BuffUp(e.LavaSurgeBuff) and not v() and e.MasterOfTheElements:IsAvailable()) then
        if m.CastTargetIf(e.LavaBurst, w, "max", u, k) then
            return "Lava Burst aoe 108"
        end

        if u(a) and k(a) then
            if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
                o = 51505
                return "LavaBurst aoe 1"
            end

        end

    end

    if s(e.Earthquake) and h.Elemental.TTDSetting < a:TimeToDie() and (n == 0 or n > e.Earthquake:ExecuteTime()) and a:IsInRange(40) and r >= 2 and not g and (e.MasterOfTheElements:IsAvailable() and f() >= 50 and not v()) then
        if i(e.Earthquake, nil) then
            o = 61882
            return "EQ aoe 2"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and e.PrimordialWave:IsAvailable() and g and t:HasTier(28, 4) and t:BuffUp(e.LavaSurgeBuff) and t:BuffDown(e.PrimordialWaveBuff) then
        if m.CastTargetIf(e.LavaBurst, w, "max", u, k) then
            return "Lava Burst aoe 208"
        end

        if u(a) and k(a) then
            if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
                o = 51505
                return "LavaBurst aoe 2"
            end

        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and t:BuffUp(e.LavaSurgeBuff) and t:BuffUp(e.PrimordialWaveBuff) and (t:BuffRemains(e.PrimordialWaveBuff) < 3 * t:GCD() or (b == r) or (b == 3 and not g) or b == 4) then
        if m.CastTargetIf(e.LavaBurst, w, "max", u, k) then
            return "Lava Burst aoe 208"
        end

        if u(a) and k(a) then
            if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
                o = 51505
                return "LavaBurst aoe 2"
            end

        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and r < 4 and p and t:BuffUp(e.LavaSurgeBuff) and e.MasterOfTheElements:IsAvailable() and not v() and f() >= 50 then
        if m.CastTargetIf(e.LavaBurst, w, "max", u, k) then
            return "Lava Burst aoe 308"
        end

        if u(a) and k(a) then
            if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
                o = 51505
                return "LavaBurst aoe 3"
            end

        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and ((r < 4 and p and e.MasterOfTheElements:IsAvailable()) or (e.MasterOfTheElements:IsAvailable() and f() >= 50 and not v() and (not g or t:BuffUp(e.EchoesofGreatSunderingBuff)) and not p)) then
        if m.CastTargetIf(e.LavaBurst, w, "max", u, k) then
            return "Lava Burst aoe 408"
        end

        if u(a) and k(a) then
            if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
                o = 51505
                return "LavaBurst aoe 4"
            end

        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and (r == 4 and p and t:BuffUp(e.LavaSurgeBuff) and e.MasterOfTheElements:IsAvailable() and not v() and f() >= 50) then
        if m.CastTargetIf(e.LavaBurst, w, "max", u, k) then
            return "Lava Burst aoe 508"
        end

        if u(a) and k(a) then
            if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
                o = 51505
                return "LavaBurst aoe 5"
            end

        end

    end

    if s(e.Earthquake) and h.Elemental.TTDSetting < a:TimeToDie() and (n == 0 or n > e.Earthquake:ExecuteTime()) and a:IsInRange(40) and r >= 2 then
        if i(e.Earthquake, nil) then
            o = 61882
            return "EQ aoe 3"
        end

    end

    if s(e.ChainLightning) and (n == 0 or n > e.ChainLightning:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) and (E() or t:BuffRemains(e.StormkeeperBuff) < (3 * t:GCD() * t:BuffStack(e.StormkeeperBuff))) then
        if i(e.ChainLightning, nil) then
            o = 188443
            return "ChainLightning aoe 2"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and (t:HasTier(28, 4) and t:BuffUp(e.LavaSurgeBuff) and t:BuffDown(e.PrimordialWaveBuff)) then
        if m.CastTargetIf(e.LavaBurst, w, "max", u, k) then
            return "Lava Burst aoe 508"
        end

        if u(a) and k(a) then
            if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
                o = 51505
                return "LavaBurst aoe 6"
            end

        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and (t:HasTier(28, 4) and t:BuffUp(e.LavaSurgeBuff) and t:BuffDown(e.PrimordialWaveBuff)) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "LavaBurst aoe 7"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and t:BuffUp(e.LavaSurgeBuff) and r < 4 and (not l) and a:DebuffUp(e.FlameShockDebuff) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst aoe 8"
        end

    end

    if s(e.ElementalBlast) and (n == 0 or n > e.ElementalBlast:ExecuteTime()) and a:IsInRange(40) and e.ElementalBlast:IsAvailable() and r < 5 and not l then
        if i(e.ElementalBlast, nil, nil, not a:IsSpellInRange(e.ElementalBlast)) then
            o = 117014
            return "Elemental Blast aoe 1"
        end

    end

    if s(e.LavaBeam) and (n == 0 or n > e.LavaBeam:ExecuteTime()) and a:IsInRange(40) and e.Ascendance:IsAvailable() then
        if i(e.LavaBeam, nil, nil, not a:IsSpellInRange(e.LavaBeam)) then
            o = 114074
            return "LavaBeam aoe 1"
        end

    end

    if s(e.ChainLightning) and (n == 0 or n > e.ChainLightning:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) then
        if i(e.ChainLightning, nil) then
            o = 188443
            return "ChainLightning aoe 1"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and t:BuffUp(e.LavaSurgeBuff) and t:IsMoving() then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst aoe 6"
        end

    end

    if s(e.FlameShock) and a:IsInRange(40) and a:DebuffRefreshable(e.FlameShockDebuff) and t:IsMoving() then
        if i(e.FlameShock, nil) then
            o = 188389
            return "Flameshock aoe 2"
        end

    end

    if s(e.FlameShock) and t:IsMoving() then
        if m.CastCycle(e.FlameShock, w, O, not a:IsSpellInRange(e.FlameShock), nil) then
            return "FlameShock aoe 204"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and t:IsMoving() then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock aoe 1"
        end

    end

end

local function k()
    if s(e.LightningBolt) and (n == 0 or n > e.LightningBolt:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) and t:BuffRemains(e.StormkeeperBuff) < (1.1 * t:GCD() * t:BuffStack(e.StormkeeperBuff)) then
        if i(e.LightningBolt, nil) then
            o = 188196
            return "LightningBolt st 1"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and e.Icefury:IsAvailable() and j() and t:BuffRemains(e.IcefuryBuff) < (1.1 * t:GCD() * t:BuffStack(e.IcefuryBuff)) then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock st 1"
        end

    end

    if s(e.FlameShock) and a:IsInRange(40) and ((a:DebuffDown(e.FlameShockDebuff) or a:DebuffRemains(e.FlameShockDebuff) <= t:GCD() or (e.Ascendance:IsAvailable() and a:DebuffRemains(e.FlameShockDebuff) < (e.Ascendance:CooldownRemains() + t:BuffRemains(e.AscendanceBuff)) and e.Ascendance:CooldownRemains() < 4)) and (t:BuffUp(e.LavaSurgeBuff) or not t:BloodlustUp())) then
        if i(e.FlameShock, nil) then
            o = 188389
            return "Flameshock st 2"
        end

    end

    if s(e.FlameShock) and t:IsMoving() then
        if m.CastCycle(e.FlameShock, w, se, not a:IsSpellInRange(e.FlameShock), nil) then
            return "FlameShock st 204"
        end

    end

    if s(e.FlameShock) and t:BuffUp(e.PrimordialWaveBuff) then
        if m.CastTargetIf(e.FlameShock, w, "min", u, O) then
            return "FlameShock st 204"
        end

        if u(a) and O(a) then
            if i(e.FlameShock, nil, nil, not a:IsSpellInRange(e.FlameShock)) then
                o = 188389
                return "FlameShock st 204"
            end

        end

    end

    if s(e.Ascendance) and a:IsInRange(40) and y() and h.Elemental.TTDSetting < a:TimeToDie() and e.Ascendance:IsAvailable() and (A.CombatTime() >= 60 or t:BloodlustUp() or GetNumGroupMembers() <= 5) and (e.LavaBurst:CooldownRemains() > 0) and (not e.Icefury:IsAvailable() or (not j() and not e.Icefury:CooldownUp())) then
        if i(e.Ascendance, nil) then
            o = 114050
            return "Ascendance st 1"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and t:BuffUp(e.LavaSurgeBuff) and (Q or (not v() and e.MasterOfTheElements:IsAvailable())) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst st 1"
        end

    end

    if s(e.ElementalBlast) and (n == 0 or n > e.ElementalBlast:ExecuteTime()) and a:IsInRange(40) and e.ElementalBlast:IsAvailable() and f() < 70 then
        if i(e.ElementalBlast, nil, nil, not a:IsSpellInRange(e.ElementalBlast)) then
            o = 117014
            return "Elemental Blast st 1"
        end

    end

    if s(e.Stormkeeper) and (n == 0 or n > e.Stormkeeper:ExecuteTime()) and a:IsInRange(40) and e.Stormkeeper:IsAvailable() and f() < 44 and z then
        if i(e.Stormkeeper, nil) then
            o = 191634
            return "st Stormkeeper 1"
        end

    end

    if s(e.EchoingShock) and h.Elemental.TTDSetting < a:TimeToDie() and h.Elemental.TTDSetting < a:TimeToDie() and a:IsInRange(40) and z and e.EchoingShock:IsAvailable() and e.LavaBurst:CooldownRemains() <= t:GCD() then
        if i(e.EchoingShock, nil) then
            o = 320125
            return "Echoing Shock st 1"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and e.EchoingShock:IsAvailable() and t:BuffUp(e.EchoingShockBuff) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst st 2"
        end

    end

    if s(e.LiquidMagmaTotem) and a:IsInRange(40) and z and e.LiquidMagmaTotem:IsAvailable() then
        if i(e.LiquidMagmaTotem, nil) then
            o = 192222
            return "LiquidMagmaTotem st 2"
        end

    end

    if s(e.Earthquake) and h.Elemental.TTDSetting < a:TimeToDie() and (n == 0 or n > e.Earthquake:ExecuteTime()) and a:IsInRange(40) and t:BuffUp(e.EchoesofGreatSunderingBuff) and e.MasterOfTheElements:IsAvailable() and v() then
        if i(e.Earthquake, nil) then
            o = 61882
            return "EQ st 1"
        end

    end

    if s(e.LightningBolt) and (n == 0 or n > e.LightningBolt:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) and E() and v() and f() < 60 then
        if i(e.LightningBolt, nil) then
            o = 188196
            return "LightningBolt st 1"
        end

    end

    if s(e.Earthquake) and h.Elemental.TTDSetting < a:TimeToDie() and (n == 0 or n > e.Earthquake:ExecuteTime()) and a:IsInRange(40) and t:BuffUp(e.EchoesofGreatSunderingBuff) and (e.MasterOfTheElements:IsAvailable() or (e.LavaBurst:CooldownRemains() > 0 and f() >= 92) or (r < 2 and E() and e.LavaBurst:CooldownRemains() <= t:GCD()) or (not e.MasterOfTheElements:IsAvailable()) or (e.ElementalBlast:CooldownRemains() <= (1.1 * t:GCD() * 2))) then
        if i(e.Earthquake, nil) then
            o = 61882
            return "EQ st 2"
        end

    end

    if s(e.Earthquake) and h.Elemental.TTDSetting < a:TimeToDie() and (n == 0 or n > e.Earthquake:ExecuteTime()) and a:IsInRange(40) and r > 1 and not a:DebuffRefreshable(e.FlameShockDebuff) and not g and (not e.MasterOfTheElements:IsAvailable() or v() or (e.LavaBurst:CooldownRemains() > 0 and f() >= 92)) then
        if i(e.Earthquake, nil) then
            o = 61882
            return "EQ st 3"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and not v() and j() then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst st 3"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and e.LavaBurst:Charges() > F(e.EchoOfTheElements:IsAvailable()) and not j() then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst st 4"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and e.EchoOfTheElements:IsAvailable() and not v() and f() >= 50 and t:BuffDown(e.EchoesofGreatSunderingBuff) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst st 5"
        end

    end

    if s(e.EarthShock) and a:IsInRange(40) and (g or r < 2) and ((e.MasterOfTheElements:IsAvailable() and t:BuffDown(e.EchoesofGreatSunderingBuff) and (v() or f() >= 92 or (r < 2 and E() and e.LavaBurst:CooldownRemains() <= t:GCD()))) or (not e.MasterOfTheElements:IsAvailable() or e.ElementalBlast:CooldownRemains() <= (1.1 * t:GCD() * 2))) then
        if i(e.EarthShock, nil) then
            o = 8042
            return "EarthShock st 1"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and e.Icefury:IsAvailable() and e.MasterOfTheElements:IsAvailable() and j() and v() then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock st 2"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and t:BuffUp(e.AscendanceBuff) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst st 6"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and not e.MasterOfTheElements:IsAvailable() then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst st 7"
        end

    end

    if s(e.Icefury) and e.Icefury:IsAvailable() and not (f() > 35 and e.LavaBurst:CooldownRemains() <= 0) then
        if i(e.Icefury, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 210714
            return "Icefury st 1"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and e.Icefury:IsAvailable() and j() and (t:BuffRemains(e.IcefuryBuff) < (t:GCD() * 4 * t:BuffStack(e.IcefuryBuff)) or E() or not e.MasterOfTheElements:IsAvailable()) then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock st 3"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst st 8"
        end

    end

    if s(e.FlameShock) and a:IsInRange(40) and a:DebuffRefreshable(e.FlameShockDebuff) then
        if i(e.FlameShock, nil) then
            o = 188389
            return "Flameshock st 4"
        end

    end

    if s(e.FlameShock) then
        if m.CastCycle(e.FlameShock, w, O, not a:IsSpellInRange(e.FlameShock), nil) then
            return "FlameShock st 304"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and ie and t:BuffDown(e.ElementalEquilibriumBuff) and not e.ElementalBlast:IsAvailable() and not e.EchoingShock:IsAvailable() then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock st 5"
        end

    end

    if s(e.ChainHarvest) and (n == 0 or n > e.ChainHarvest:ExecuteTime()) and a:IsInRange(40) and T then
        if i(e.ChainHarvest, nil) then
            o = 320674
            return "Chain Harvest st 1"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and e.Icefury:IsAvailable() and j() then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock st 6"
        end

    end

    if s(e.StaticDischarge) and e.StaticDischarge:IsAvailable() and z then
        if i(e.StaticDischarge, nil, nil) then
            o = 342243
            return "st StaticDischarge"
        end

    end

    if s(e.EarthElemental) and y() and h.Elemental.TTDSetting < a:TimeToDie() and not H and (not e.PrimalElementalist:IsAvailable() or not U) then
        if i(e.EarthElemental, nil, nil) then
            o = 198103
            return "st Earth Ele"
        end

    end

    if s(e.ChainLightning) and (n == 0 or n > e.ChainLightning:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) and r > 1 then
        if i(e.ChainLightning, nil) then
            o = 188443
            return "ChainLightning st 1"
        end

    end

    if s(e.LightningBolt) and (n == 0 or n > e.LightningBolt:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) then
        if i(e.LightningBolt, nil) then
            o = 188196
            return "LightningBolt st 2"
        end

    end

    if s(e.FlameShock) and a:IsInRange(40) and a:DebuffRefreshable(e.FlameShockDebuff) and t:IsMoving() then
        if i(e.FlameShock, nil) then
            o = 188389
            return "Flameshock st 2"
        end

    end

    if s(e.FlameShock) and t:IsMoving() then
        if m.CastCycle(e.FlameShock, w, O, not a:IsSpellInRange(e.FlameShock), nil) then
            return "FlameShock st 204"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and t:IsMoving() then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock st 7"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and e.Icefury:IsAvailable() and j() and t:BuffRemains(e.IcefuryBuff) < (1.1 * t:GCD() * t:BuffStack(e.IcefuryBuff)) then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock st 7"
        end

    end

end

local function x()
    if s(e.StormElemental) and a:IsInRange(40) and e.StormElemental:IsAvailable() and y() and h.Elemental.TTDSetting < a:TimeToDie() then
        if i(e.StormElemental, nil) then
            o = 192249
            return "Storm Elemental sest 1"
        end

    end

    if s(e.LightningBolt) and (n == 0 or n > e.LightningBolt:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) and t:BuffUp(e.SurgeOfPower) then
        if i(e.LightningBolt, nil) then
            o = 188196
            return "LightningBolt sest 1"
        end

    end

    if s(e.PrimordialWave) and T and e.PrimordialWave:IsAvailable() and t:BuffDown(e.PrimordialWaveBuff) and t:BuffDown(e.SplinteredElementsBuff) then
        if m.CastTargetIf(e.PrimordialWave, w, "min", u, J) then
            return "Primo Wave 108"
        end

        if u(a) and J(a) then
            if i(e.PrimordialWave, nil, nil, not a:IsSpellInRange(e.PrimordialWave)) then
                o = 326059
                return "PrimordialWave 108"
            end

        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and e.Icefury:IsAvailable() and j() and t:BuffRemains(e.IcefuryBuff) < (1.1 * t:GCD() * t:BuffStack(e.IcefuryBuff)) and t:BuffStack(e.WindGustBuff) < 18 then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock sest 1"
        end

    end

    if s(e.FlameShock) and a:IsInRange(40) and a:DebuffRefreshable(e.FlameShockDebuff) then
        if i(e.FlameShock, nil) then
            o = 188389
            return "Flameshock sest 2"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and e.Icefury:IsAvailable() and j() and t:BuffRemains(e.IcefuryBuff) < (1.1 * t:GCD() * t:BuffStack(e.IcefuryBuff)) then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock sest 2"
        end

    end

    if s(e.ElementalBlast) and (n == 0 or n > e.ElementalBlast:ExecuteTime()) and a:IsInRange(40) and e.ElementalBlast:IsAvailable() then
        if i(e.ElementalBlast, nil, nil, not a:IsSpellInRange(e.ElementalBlast)) then
            o = 117014
            return "Elemental Blast sest 1"
        end

    end

    if s(e.Stormkeeper) and (n == 0 or n > e.Stormkeeper:ExecuteTime()) and a:IsInRange(40) and e.Stormkeeper:IsAvailable() and z then
        if i(e.Stormkeeper, nil) then
            o = 191634
            return "sest Stormkeeper 1"
        end

    end

    if s(e.EchoingShock) and h.Elemental.TTDSetting < a:TimeToDie() and a:IsInRange(40) and z and e.EchoingShock:IsAvailable() and ((e.LavaBurst:CooldownRemains() <= t:GCD() and r < 2) or (f() >= 60 and r >= 2 and (not g or t:BuffUp(e.EchoesofGreatSunderingBuff))) or (r < 2 and t:BuffStack(e.WindGustBuff) >= 18 and (not g or t:BuffUp(e.EchoesofGreatSunderingBuff)) and f() >= 60)) then
        if i(e.EchoingShock, nil) then
            o = 320125
            return "Echoing Shock sest 2"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and ((t:BuffStack(e.WindGustBuff) < 18 and not t:BloodlustUp()) or t:BuffUp(e.LavaSurgeBuff)) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst sest 6"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and e.EchoingShock:IsAvailable() and t:BuffUp(e.EchoingShockBuff) and r < 2 then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst sest 6"
        end

    end

    if s(e.Earthquake) and h.Elemental.TTDSetting < a:TimeToDie() and (n == 0 or n > e.Earthquake:ExecuteTime()) and a:IsInRange(40) and e.EchoingShock:IsAvailable() and t:BuffUp(e.EchoingShockBuff) and r >= 2 then
        if i(e.Earthquake, nil) then
            o = 61882
            return "EQ sest 1"
        end

    end

    if s(e.LightningBolt) and (n == 0 or n > e.LightningBolt:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) and E() then
        if i(e.LightningBolt, nil) then
            o = 188196
            return "LightningBolt sest 1"
        end

    end

    if s(e.Earthquake) and h.Elemental.TTDSetting < a:TimeToDie() and (n == 0 or n > e.Earthquake:ExecuteTime()) and a:IsInRange(40) and t:BuffUp(e.EchoesofGreatSunderingBuff) then
        if i(e.Earthquake, nil) then
            o = 61882
            return "EQ sest 2"
        end

    end

    if s(e.EarthShock) and a:IsInRange(40) and ((r < 2 and f() >= 60 and (t:BuffStack(e.WindGustBuff) < 20 or f() > 90)) or (g and not t:BuffUp(e.EchoesofGreatSunderingBuff)) or Q) then
        if i(e.EarthShock, nil) then
            o = 8042
            return "EarthShock sest 2"
        end

    end

    if s(e.Earthquake) and h.Elemental.TTDSetting < a:TimeToDie() and (n == 0 or n > e.Earthquake:ExecuteTime()) and a:IsInRange(40) and r > 1 and not a:DebuffRefreshable(e.FlameShockDebuff) then
        if i(e.Earthquake, nil) then
            o = 61882
            return "EQ sest 3"
        end

    end

    if s(e.ChainLightning) and (n == 0 or n > e.ChainLightning:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) and r > 1 and l and t:BloodlustUp() then
        if i(e.ChainLightning, nil) then
            o = 188443
            return "ChainLightning sest 1"
        end

    end

    if s(e.LightningBolt) and (n == 0 or n > e.LightningBolt:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) and l and t:BloodlustUp() then
        if i(e.LightningBolt, nil) then
            o = 188196
            return "LightningBolt sest 1"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and t:BuffUp(e.AscendanceBuff) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst sest 6"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst sest 7"
        end

    end

    if s(e.LavaBurst) and (n == 0 or n > e.LavaBurst:ExecuteTime() or t:BuffUp(e.LavaSurgeBuff)) and a:IsInRange(40) and e.LavaBurst:SpellCharges() > F(e.EchoOfTheElements:IsAvailable()) then
        if i(e.LavaBurst, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 51505
            return "Lavaburst sest 8"
        end

    end

    if s(e.Icefury) and not l and e.Icefury:IsAvailable() and not (f() > 35 and e.LavaBurst:CooldownRemains() <= 0) then
        if i(e.Icefury, nil, nil, not a:IsSpellInRange(e.LavaBurst)) then
            o = 210714
            return "Icefury sest 1"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and e.Icefury:IsAvailable() and j() and not l and (t:BuffRemains(e.IcefuryBuff) < (t:GCD() * 4 * t:BuffStack(e.IcefuryBuff)) or E() or not e.MasterOfTheElements:IsAvailable()) then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock sest 3"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and e.Icefury:IsAvailable() and j() and not l then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock SEST 1"
        end

    end

    if s(e.ChainHarvest) and (n == 0 or n > e.ChainHarvest:ExecuteTime()) and a:IsInRange(40) and T then
        if i(e.ChainHarvest, nil) then
            o = 320674
            return "Chain Harvest SEST 1"
        end

    end

    if s(e.StaticDischarge) and e.StaticDischarge:IsAvailable() and z then
        if i(e.StaticDischarge, nil, nil) then
            o = 342243
            return "SEST StaticDischarge"
        end

    end

    if s(e.EarthElemental) and y() and h.Elemental.TTDSetting < a:TimeToDie() and not H and a:IsSpellInRange(e.LightningBolt) and (not e.PrimalElementalist:IsAvailable() or (e.PrimalElementalist:IsAvailable() and not l)) then
        if i(e.EarthElemental, nil, nil) then
            o = 198103
            return "sest Earth Ele"
        end

    end

    if s(e.ChainLightning) and (n == 0 or n > e.ChainLightning:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) and r > 1 then
        if i(e.ChainLightning, nil) then
            o = 188443
            return "ChainLightning sest 2"
        end

    end

    if s(e.LightningBolt) and (n == 0 or n > e.LightningBolt:ExecuteTime() or t:BuffUp(e.StormkeeperBuff)) and a:IsInRange(40) then
        if i(e.LightningBolt, nil) then
            o = 188196
            return "LightningBolt sest 2"
        end

    end

    if s(e.FlameShock) and a:IsInRange(40) and a:DebuffRefreshable(e.FlameShockDebuff) and t:IsMoving() then
        if i(e.FlameShock, nil) then
            o = 188389
            return "Flameshock sest 2"
        end

    end

    if s(e.FlameShock) and t:IsMoving() then
        if m.CastCycle(e.FlameShock, w, O, not a:IsSpellInRange(e.FlameShock), nil) then
            return "FlameShock sest 204"
        end

    end

    if s(e.FrostShock) and a:IsInRange(40) and t:IsMoving() then
        if i(e.FrostShock, nil) then
            o = 196840
            return "FrostShock aoe 1"
        end

    end

end

local function f()
    V = HeroRotationCharDB.Toggles[6]
    T = HeroRotationCharDB.Toggles[4]
    z = HeroRotationCharDB.Toggles[5]
    I = HeroRotationCharDB.Toggles[12]
    de = HeroRotationCharDB.Toggles[15]
    te = HeroRotationCharDB.Toggles[60]
    y = d.CDsON
    H = HeroRotationCharDB.Toggles[90]
    W = HeroRotationCharDB.Toggles[91]
    G = HeroRotationCharDB.Toggles[92]
    K = HeroRotationCharDB.Toggles[93]
    B = HeroRotationCharDB.Toggles[94]
    Y = HeroRotationCharDB.Toggles[96]
    P = HeroRotationCharDB.Toggles[95]
    ee = HeroRotationCharDB.Toggles[97]
    n = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                n = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

            if not h.Commons.Enabled.TopTrinket and not h.Commons.Enabled.BotTrinket then
        D = { L, S }
    elseif not h.Commons.Enabled.TopTrinket and h.Commons.Enabled.BotTrinket then
        D = { L }
    elseif not h.Commons.Enabled.BotTrinket and h.Commons.Enabled.TopTrinket then
        D = { S }
    end

end

local function b()
    re = t:GetEnemiesInMeleeRange(8)
    ue = t:GetEnemiesInRange(30)
    w = t:GetEnemiesInRange(40)
    ce = a:GetEnemiesInSplashRange(15)
    L, ae = GetInventoryItemID("player", 13)
    S, ae = GetInventoryItemID("player", 14)
        if R() and h.Commons.AoeMode == "Conservative" then
        N = a:GetEnemiesInSplashRangeCount(8)
        r = a:GetEnemiesInSplashRangeCount(15)
    elseif R() and h.Commons.AoeMode == "Aggresive" then
        local t = 0
        for e = 1, 20 do
            local e = "nameplate" .. e
            if UnitExists(e) then
                if UnitCanAttack("player", e) then
                    if (UnitCanAttack("player", e) and UnitAffectingCombat("target") and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil) or _(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) then
                        t = (t + 1)
                    end

                end

            end

        end

        N = t
        r = t
    end

    if not R() then
        N = 1
        r = 1
    end

    if te then
        r = 10
        N = 10
    end

    le()
    fe()
    if not BotOn then
        c = 0
        o = 0
    end

    if c > 0 then
        c = 0
    end

    if o > 0 then
        o = 0
    end

    me = f()
    if d.QueuedCast() then
        o = d.QueuedCast()
        return "Custom Queue " .. M(o):ID()
    end

        if d.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (d.GUISettings.General.OpenerReset)
    elseif d.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        d.ToggleIconFrame:UpdateButtonText(6)
        d.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if h.Elemental.PreferEarthShield and e.EarthShield:IsCastable() and (t:BuffDown(e.EarthShield) or (not t:AffectingCombat() and t:BuffStack(e.EarthShield) < 5)) then
        if i(e.EarthShield, nil) then
            o = 974
            return "Earth Shield Refresh"
        end

    elseif e.LightningShield:IsCastable() and t:BuffDown(e.LightningShield) and (h.Elemental.PreferEarthShield and t:BuffDown(e.EarthShield) or not h.Elemental.PreferEarthShield) then
        if i(e.LightningShield, nil) then
            o = 192106
            return "Lightning Shield Refresh"
        end

    end

    if t:IsChanneling() or t:IsChanneling(e.FaeTransfusion) then
        if i(e.Pool, nil) then
            o = 99999
            return "Trinket Channel"
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.FrostShock:IsCastable() then
            if i(e.FrostShock, nil) then
                c = 1196840
                return "explosive MO FS"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.FrostShock:IsCastable() then
            if i(e.FrostShock, nil) then
                o = 196840
                return "explosive  FS"
            end

        end

    end

        if (W and e.CapacitorTotem:IsUsableP() and e.CapacitorTotem:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.CapacitorTotem, nil, nil, nil) then
            o = 1192058
            return "queue CapacitorTotem"
        end

    elseif ((not e.CapacitorTotem:IsUsableP() or e.CapacitorTotem:CooldownRemains(BypassRecovery) > 0) and W) then
        HeroRotationCharDB.Toggles[91] = not HeroRotationCharDB.Toggles[91]
        d.Print("Capacitor Totem Queue is now " .. (HeroRotationCharDB.Toggles[91] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (G and e.HealingStreamTotem:IsUsableP() and e.HealingStreamTotem:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.HealingStreamTotem, nil, nil, nil) then
            o = 5394
            return "queue HealingStreamTotem"
        end

    elseif ((not e.HealingStreamTotem:IsUsableP() or e.HealingStreamTotem:CooldownRemains(BypassRecovery) > 0) and G) then
        HeroRotationCharDB.Toggles[92] = not HeroRotationCharDB.Toggles[92]
        d.Print("Healing Stream Totem Queue is now " .. (HeroRotationCharDB.Toggles[92] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (K and e.TremorTotem:IsUsableP() and e.TremorTotem:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.TremorTotem, nil, nil, nil) then
            o = 8143
            return "queue TremorTotem"
        end

    elseif ((not e.TremorTotem:IsUsableP() or e.TremorTotem:CooldownRemains(BypassRecovery) > 0) and K) then
        HeroRotationCharDB.Toggles[93] = not HeroRotationCharDB.Toggles[93]
        d.Print("Tremor Totem Queue is now " .. (HeroRotationCharDB.Toggles[93] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (B and e.WindRushTotem:IsUsableP() and e.WindRushTotem:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.WindRushTotem, nil, nil, nil) then
            o = 192077
            return "queue WindRushTotem"
        end

    elseif ((not e.WindRushTotem:IsUsableP() or e.WindRushTotem:CooldownRemains(BypassRecovery) > 0) and B) then
        HeroRotationCharDB.Toggles[94] = not HeroRotationCharDB.Toggles[94]
        d.Print("Wind Rush Totem Queue is now " .. (HeroRotationCharDB.Toggles[94] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (Y and e.FaeTransfusion:IsUsableP() and e.FaeTransfusion:CooldownRemains(BypassRecovery) <= 0 and e.FaeTransfusion:IsAvailable()) then
        if i(e.FaeTransfusion, nil) then
            o = 328923
            return "FaeTransfusion 3"
        end

    elseif ((not e.FaeTransfusion:IsUsableP() or e.FaeTransfusion:CooldownRemains(BypassRecovery) > 0 or not e.FaeTransfusion:IsAvailable()) and Y) then
        HeroRotationCharDB.Toggles[96] = not HeroRotationCharDB.Toggles[96]
        d.Print("Fae Transfusion Queue is now" .. (HeroRotationCharDB.Toggles[96] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (P and e.Hex:IsUsableP() and e.Hex:CooldownRemains(BypassRecovery) <= 0 and UnitExists("mouseover")) then
        if d.Cast(e.Hex, nil, nil, nil) then
            if UnitExists("mouseover") and _("mouseover"):IsInRange(40) then
                c = 151514
                return "queue Hex MO"
            end

        end

    elseif ((not e.Hex:IsUsableP() or e.Hex:CooldownRemains() > 0) and P) then
        HeroRotationCharDB.Toggles[95] = not HeroRotationCharDB.Toggles[95]
        d.Print("Hex Queue is now " .. (HeroRotationCharDB.Toggles[95] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if not t:AffectingCombat() and m.TargetIsValid() and V then
        local e = ne()
        if e then
            return e
        end

    end

    for t = 1, 25 do
        local n, n, n, t = UnitBuff("target", t)
        if t ~= nil and t == "Magic" then
            if e.Purge:IsCastable() and ee and a:IsInRange(30) then
                if i(e.Purge, nil) then
                    o = 370
                    return "Purge"
                end

            end

        end

    end

    for t = 0, 40 do
        local a, a, a, t, a, a, a, a, a, a = UnitDebuff("mouseover", t)
        if e.CleanseSpirit:IsCastable() and UnitIsDead("mouseover") ~= true and UnitCanAttack("player", "mouseover") ~= true and IsItemInRange(34471, "mouseover") and ((t == "Curse")) then
            if i(e.CleanseSpirit, nil) then
                c = 151886
                return "Cleanse Spirit MO"
            end

        end

    end

    if m.TargetIsValid() and t:AffectingCombat() and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or a:NPCID() == 176581 or a:NPCID() == 176920 or a:NPCID() == 177892 or a:NPCID() == 182778 or a:NPCID() == 185402 or a:NPCID() == 183945 or a:NPCID() == 182074 or a:NPCID() == 184737 or a:NPCID() == 179733 or a:NPCID() == 115402 or a:NPCID() == 115406 or a:NPCID() == 115395 or UnitExists("boss1") or a:NPCID() == 115388 or V) and not t:IsDeadOrGhost() then
        if l and e.EyeOfTheStorm:CooldownRemains() <= 0 and C:BuffUp(e.CallLightningBuff) then
            if i(e.EyeOfTheStorm, nil) then
                o = 157375
                return "EyeOfTheStorm  Pet"
            end

        end

        if U and UnitExists("pet") and e.Meteor:CooldownRemains(BypassRecovery) == 0 then
            if i(e.Meteor, nil) then
                o = 117588
                return "Meteor  Pet"
            end

        end

        local c = 0
        local n = 0
                if GetNumGroupMembers() > 0 then
            if UnitInParty("player") then
                for e = 1, GetNumGroupMembers() do
                    if UnitExists("party" .. e) then
                        n = n + UnitHealth("party" .. e)
                        c = c + UnitHealthMax("party" .. e)
                    end

                end

            end

            if UnitInRaid("player") then
                for e = 1, GetNumGroupMembers() do
                    if UnitExists("raid" .. e) then
                        n = n + UnitHealth("raid" .. e)
                        c = c + UnitHealthMax("raid" .. e)
                    end

                end

            end

        elseif GetNumGroupMembers() == 0 then
            n = UnitHealth("player")
            c = UnitHealthMax("player")
        end

        if t:HealthPercentage() < h.Elemental.HealthstoneHP and q.Healthstone:IsReady() and q.Healthstone:CooldownRemains() <= 0 then
            if i(q.Healthstone, nil) then
                o = 40
                return "Healthstone HP"
            end

        end

        if t:HealthPercentage() < h.Elemental.HealPotHP and q.CosmicHealPot:IsReady() and q.CosmicHealPot:CooldownRemains() <= 0 then
            if i(q.CosmicHealPot, nil) then
                o = 45
                return "CosmicHealPot HP"
            end

        end

        if t:HealthPercentage() < h.Elemental.HealPotHP and q.HealPot:IsReady() and q.HealPot:CooldownRemains() <= 0 then
            if i(q.HealPot, nil) then
                o = 41
                return "HealPot HP"
            end

        end

        if t:HealthPercentage() < h.Elemental.PhialHP and q.PhialofSerenity:IsReady() and q.PhialofSerenity:CooldownRemains() <= 0 then
            if i(q.PhialofSerenity, nil) then
                o = 55
                return "PhialofSerenity HP"
            end

        end

        if ((n / c) * 100) <= h.Elemental.FaeTransfusionHealHP and t:BuffUp(M(328933)) then
            if i(e.FaeTransfusion, nil) then
                o = 328923
                return "FaeTransfusion Heal"
            end

        end

        if t:HealthPercentage() < h.Elemental.AncestralGuideanceHP and e.AncestralGuidance:IsAvailable() and e.AncestralGuidance:IsReady() then
            if i(e.AncestralGuidance) then
                o = 108281
                return "AncestralGuidance HP"
            end

        end

        if t:HealthPercentage() < h.Elemental.HealingSurgeHP and e.HealingSurge:IsReady() and not t:IsMoving() then
            if i(e.HealingSurge) then
                o = 8004
                return "HealingSurge HP"
            end

        end

        if q.PotionofSpectralIntellect:IsReady() and h.Commons.Enabled.Potions and (not d.GUISettings.General.HoldPotforBL or (d.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if i(q.PotionofSpectralIntellect, nil, nil) then
                o = 50
                return "potion main 16"
            end

        end

        if ((h.Commons.Enabled.TopTrinket or h.Commons.Enabled.BottomTrinket) and y()) and h.Elemental.TTDSetting < a:TimeToDie() then
            local e = t:GetUseableTrinkets(D)
            if e then
                if i(e, nil, nil) then
                                        if e:ID() == L and h.Commons.Enabled.TopTrinket then
                        o = 24
                        return "top trinket 1"
                    elseif e:ID() == S and h.Commons.Enabled.BottomTrinket then
                        o = 30
                        return "Bot trinket 2"
                    end

                end

            end

        end

        if s(e.FlameShock) and a:IsInRange(30) and not e.ElementalBlast:IsAvailable() and a:DebuffDown(e.FlameShockDebuff) and not l and (r < 3 or e.MasterOfTheElements:IsAvailable() or p) then
            if i(e.FlameShock, nil) then
                o = 188389
                return "Flameshock 1"
            end

        end

        if s(e.PrimordialWave) and T then
            if m.CastTargetIf(e.PrimordialWave, w, "min", u, Z) then
                return "Primo Wave 108"
            end

            if u(a) and Z(a) then
                if i(e.PrimordialWave, nil, nil, not a:IsSpellInRange(e.PrimordialWave)) then
                    o = 326059
                    return "PrimordialWave 108"
                end

            end

        end

        if s(e.FlameShock) then
            if m.CastTargetIf(e.FlameShock, w, "min", u, X) then
                return "Flame Shock 108"
            end

            if u(a) and X(a) then
                if i(e.FlameShock, nil, nil, not a:IsSpellInRange(e.FlameShock)) then
                    o = 188389
                    return "FlameShock 108"
                end

            end

        end

        if s(e.FireElemental) and y() and h.Elemental.TTDSetting < a:TimeToDie() and not e.StormElemental:IsAvailable() then
            if i(e.FireElemental, nil) then
                o = 198067
                return "Fire Elemental 1"
            end

        end

        if y() then
            if e.BloodFury:IsCastable() and h.Elemental.TTDSetting < a:TimeToDie() and y() and a:IsInRange(40) and (not e.Ascendance:IsAvailable() or t:BuffUp(e.Ascendance) or e.Ascendance:CooldownRemains() > 50) then
                if d.Cast(e.BloodFury, nil) then
                    o = 20572
                    return "Blood Fury 420"
                end

            end

            if e.Berserking:IsCastable() and h.Elemental.TTDSetting < a:TimeToDie() and y() and a:IsInRange(40) and (not e.Ascendance:IsAvailable() or t:BuffUp(e.Ascendance)) then
                if d.Cast(e.Berserking, nil) then
                    o = 26297
                    return "Berserking 422"
                end

            end

            if e.Fireblood:IsCastable() and h.Elemental.TTDSetting < a:TimeToDie() and y() and a:IsInRange(40) and (not e.Ascendance:IsAvailable() or t:BuffUp(e.Ascendance) or e.Ascendance:CooldownRemains() > 50) then
                if d.Cast(e.Fireblood, nil) then
                    o = 265221
                    return "Fireblood 426"
                end

            end

            if e.AncestralCall:IsCastable() and h.Elemental.TTDSetting < a:TimeToDie() and y() and a:IsInRange(40) and (not e.Ascendance:IsAvailable() or t:BuffUp(e.Ascendance) or e.Ascendance:CooldownRemains() > 50) then
                if d.Cast(e.AncestralCall, nil) then
                    o = 274738
                    return "Ancestral Call 428"
                end

            end

            if e.BagofTricks:IsCastable() and h.Elemental.TTDSetting < a:TimeToDie() and y() and a:IsInRange(40) and (not e.Ascendance:IsAvailable() or t:BuffUp(e.Ascendance)) then
                if d.Cast(e.BagofTricks, nil, nil, not a:IsInRange(40)) then
                    o = 312411
                    return "Bag of Tricks 430"
                end

            end

        end

        if s(e.VesperTotem) and T and h.Elemental.TTDSetting < a:TimeToDie() and a:IsInRange(40) and e.VesperTotem:IsAvailable() then
            if i(e.VesperTotem, nil) then
                o = 324386
                return "VesperTotem 1"
            end

        end

        if s(e.FaeTransfusion) and T and h.Elemental.TTDSetting < a:TimeToDie() and e.FaeTransfusion:IsAvailable() and not oe and (not e.MasterOfTheElements:IsAvailable() or v()) and r < 3 then
            if i(e.FaeTransfusion, nil) then
                o = 328923
                return "FaeTransfusion 1"
            end

        end

        if s(e.FaeTransfusion) and T and h.Elemental.TTDSetting < a:TimeToDie() and e.FaeTransfusion:IsAvailable() and oe and (not e.MasterOfTheElements:IsAvailable() or v() or r >= 3) and ((e.FireElemental:CooldownRemains() > 20 and not e.StormElemental:IsAvailable()) or (e.StormElemental:CooldownRemains() > 20 and e.StormElemental:IsAvailable())) then
            if i(e.FaeTransfusion, nil) then
                o = 328923
                return "FaeTransfusion 2"
            end

        end

        if r > 2 then
            local e = he()
            if e then
                return e
            end

        end

        if (not e.StormElemental:IsAvailable() and r <= 2) then
            local e = k()
            if e then
                return e
            end

        end

        if (e.StormElemental:IsAvailable() and r <= 2) then
            local e = x()
            if e then
                return e
            end

        end

        d.CastAnnotated(e.Pool, false, "ERR")
    end

end

local function e()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        d.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpell1()
    if o == 0 then
        return 0
    else
        return o
    end

end

function ReturnSpellMO1()
    if c == 0 then
        return 0
    else
        return c
    end

end

d.SetAPL(262, b, e)

