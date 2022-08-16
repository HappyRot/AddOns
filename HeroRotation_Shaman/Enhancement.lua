local e, e = ...
local e = HeroDBC.DBC
local g = HeroLib
local e = HeroCache
local l = g.Unit
local o = l.Player
local t = l.Target
local L = g.Spell
local e = g.MultiSpell
local a = g.Item
local h = HeroRotation
local i = h.Cast
local te = h.AoEON
local m = h.CDsON
local u = HeroRotationCharDB.Toggles[4]
local k = HeroRotationCharDB.Toggles[5]
local j = HeroRotationCharDB.Toggles[6]
local Y = HeroRotationCharDB.Toggles[15]
local b = HeroRotationCharDB.Toggles[12]
local ie = HeroRotationCharDB.Toggles[60]
local O = HeroRotationCharDB.Toggles[90]
local T = HeroRotationCharDB.Toggles[91]
local E = HeroRotationCharDB.Toggles[92]
local N = HeroRotationCharDB.Toggles[93]
local I = HeroRotationCharDB.Toggles[94]
local H = HeroRotationCharDB.Toggles[96]
local A = HeroRotationCharDB.Toggles[95]
local W = HeroRotationCharDB.Toggles[97]
local G = 0
local ae = GetWeaponEnchantInfo
local e = math.max
local e = L.Shaman.Enhancement
local n = a.Shaman.Enhancement
local z = { n.CacheofAcquiredTreasures:ID(), n.ScarsofFraternalStrife:ID(), n.TheFirstSigil:ID() }
local s = o:GetEquipment()
local s = a(0)
local a = a(0)
local y, a = GetInventoryItemID("player", 13)
local p, B = GetInventoryItemID("player", 14)
local oe
local K, Q
local X, Z
local w, q, d, a, J
local v
local P = 0
local a = 0
local r = 0
local a = 0
local s = 0
local f = h.Commons.Everyone
local s = { General = h.GUISettings.General, Commons = h.GUISettings.APL.Shaman.Commons, Enhancement = h.GUISettings.APL.Shaman.Enhancement }
local R = o:HasLegendaryEquipped(132)
local c = o:HasLegendaryEquipped(138)
local F = o:HasLegendaryEquipped(141)
local _ = (o:HasLegendaryEquipped(246) or (o:HasUnity() and e.FaeTransfusion:IsAvailable()))
g:RegisterForEvent(function()
    R = o:HasLegendaryEquipped(132)
    c = o:HasLegendaryEquipped(138)
    F = o:HasLegendaryEquipped(141)
    _ = (o:HasLegendaryEquipped(246) or (o:HasUnity() and e.FaeTransfusion:IsAvailable()))
end, "PLAYER_EQUIPMENT_CHANGED")
local x = o:CovenantID()
g:RegisterForEvent(function()
    x = o:CovenantID()
end, "COVENANT_CHOSEN")
local function x(e)
    if e then
        return 1
    else
        return 0
    end

end

local function x(e)
    return e ~= 0
end

local function x()
    for e = 1, 6, 1 do
        if string.match(o:TotemName(e), 'Totem') then
            return e
        end

    end

end

local function x(a, t)
    local e = 0
    if h.AoEON() then
        for o, t in pairs(t) do
            if t:DebuffUp(a) then
                e = e + 1
                P = e
            end

        end

    end

end

local function S(o)
                if ((o:DebuffRefreshable(e.FlameShockDebuff) or o:DebuffDown(e.FlameShockDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == l("mouseover"):GUID()) then
        r = 1188389
        return true
    elseif ((o:DebuffRefreshable(e.FlameShockDebuff) or o:DebuffDown(e.FlameShockDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and s.Enhancement.TargetSwap == "AutoSwap" and o:GUID() ~= t:GUID() and not b) then
        r = 999
        return true
    elseif ((o:DebuffRefreshable(e.FlameShockDebuff) or o:DebuffDown(e.FlameShockDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == t:GUID()) then
        a = 188389
        return true
    elseif (o:DebuffRefreshable(e.FlameShockDebuff) or o:DebuffDown(e.FlameShockDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) then
        return true
    end

end

local function x(o)
                if ((o:DebuffRefreshable(e.LashingFlamesDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == l("mouseover"):GUID()) then
        r = 160103
        return true
    elseif ((o:DebuffRefreshable(e.LashingFlamesDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and s.Enhancement.TargetSwap == "AutoSwap" and o:GUID() ~= t:GUID() and not b) then
        r = 999
        return true
    elseif ((o:DebuffRefreshable(e.LashingFlamesDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == t:GUID()) then
        a = 60103
        return true
    elseif (o:DebuffRefreshable(e.LashingFlamesDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) then
        return true
    end

end

local function V(t)
    return (t:DebuffRemains(e.FlameShockDebuff))
end

local function D(i)
                if (o:BuffDown(e.PrimordialWaveBuff) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and (i:IsInMeleeRange(8)) and i:GUID() == l("mouseover"):GUID()) then
        r = 1326059
        return true
    elseif (o:BuffDown(e.PrimordialWaveBuff) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and (i:IsInMeleeRange(8)) and s.Enhancement.TargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not b) then
        r = 999
        return true
    elseif (o:BuffDown(e.PrimordialWaveBuff) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and (i:IsInMeleeRange(8)) and i:GUID() == t:GUID()) then
        a = 326059
        return true
    elseif o:BuffDown(e.PrimordialWaveBuff) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and (i:IsInMeleeRange(8)) then
        return true
    end

end

local function x(t)
    return (t:DebuffRemains(e.LashingFlamesDebuff))
end

local function M(o)
                if (e.LashingFlames:IsAvailable() and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == l("mouseover"):GUID()) then
        r = 160103
        return true
    elseif (e.LashingFlames:IsAvailable() and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and s.Enhancement.TargetSwap == "AutoSwap" and o:GUID() ~= t:GUID() and not b) then
        r = 999
        return true
    elseif (e.LashingFlames:IsAvailable() and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == t:GUID()) then
        a = 60103
        return true
    elseif e.LashingFlames:IsAvailable() and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) then
        return true
    end

end

local function C(o)
                if ((o:DebuffUp(e.FlameShockDebuff) and (e.FlameShockDebuff:AuraActiveCount() < d and e.FlameShockDebuff:AuraActiveCount() < 6)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == l("mouseover"):GUID()) then
        r = 160103
        return true
    elseif ((o:DebuffUp(e.FlameShockDebuff) and (e.FlameShockDebuff:AuraActiveCount() < d and e.FlameShockDebuff:AuraActiveCount() < 6)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and s.Enhancement.TargetSwap == "AutoSwap" and o:GUID() ~= t:GUID() and not b) then
        r = 999
        return true
    elseif ((o:DebuffUp(e.FlameShockDebuff) and (e.FlameShockDebuff:AuraActiveCount() < d and e.FlameShockDebuff:AuraActiveCount() < 6)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == t:GUID()) then
        a = 60103
        return true
    elseif (o:DebuffUp(e.FlameShockDebuff) and (e.FlameShockDebuff:AuraActiveCount() < d and e.FlameShockDebuff:AuraActiveCount() < 6)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) then
        return true
    end

end

local function U()
    if e.Stormkeeper:IsCastable() and not o:IsMoving() then
        if i(e.Stormkeeper) then
            a = 191634
            return "Stormkeeper precombat"
        end

    end

    if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (not c and (o:BuffDown(e.WindfuryTotemBuff, true) or e.WindfuryTotem:TimeSinceLastCast() > 90)) then
        if i(e.WindfuryTotem, nil) then
            a = 8512
            return "windfury_totem precombat"
        end

    end

    if e.Fleshcraft:IsCastable() and u and (e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled()) then
        if i(e.Fleshcraft, nil, nil) then
            a = 324631
            return "fleshcraft precombat 6"
        end

    end

end

local function ee()
    if e.Windstrike:IsReady() and t:IsInMeleeRange(10) then
        if i(e.Windstrike, nil, nil, not t:IsSpellInRange(e.Windstrike)) then
            a = 115356
            return "windstrike single 2"
        end

    end

    if e.LavaLash:IsReady() and t:IsInMeleeRange(10) and (o:BuffUp(e.HotHandBuff) or (F and o:BuffStack(e.PrimalLavaActuatorsBuff) > 6)) then
        if i(e.LavaLash, nil, nil, not t:IsSpellInRange(e.LavaLash)) then
            a = 60103
            return "lava_lash single 4"
        end

    end

    if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (o:BuffDown(e.WindfuryTotemBuff, true)) then
        if i(e.WindfuryTotem, nil) then
            a = 8512
            return "windfury_totem single 6"
        end

    end

    if (c and o:BuffUp(e.DoomWindsBuff)) then
        if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) and (c and o:BuffUp(e.DoomWindsBuff)) then
            if i(e.Stormstrike, nil, nil, not t:IsSpellInRange(e.Stormstrike)) then
                a = 17364
                return "stormstrike single 8"
            end

        end

        if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) and (c and o:BuffUp(e.DoomWindsBuff)) then
            if i(e.CrashLightning, nil, nil, not t:IsInMeleeRange(8)) then
                a = 187874
                return "crash_lightning single 10"
            end

        end

        if e.IceStrike:IsReady() and t:IsInMeleeRange(10) and e.IceStrike:IsAvailable() and (c and o:BuffUp(e.DoomWindsBuff)) then
            if i(e.IceStrike, nil, nil, not t:IsInMeleeRange(5)) then
                a = 342240
                return "ice_strike single 12"
            end

        end

        if e.Sundering:IsReady() and t:IsInMeleeRange(10) and k then
            if i(e.Sundering, nil, nil, not t:IsInRange(11)) then
                a = 197214
                return "sundering single 14"
            end

        end

    end

    if e.PrimordialWave:IsReady() and t:IsInMeleeRange(40) and u and (o:BuffDown(e.PrimordialWaveBuff)) then
        if i(e.PrimordialWave, nil, nil, not t:IsSpellInRange(e.PrimordialWave)) then
            a = 326059
            return "primordial_wave single 6"
        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) and (t:DebuffDown(e.FlameShockDebuff)) then
        if i(e.FlameShock, nil, nil, not t:IsSpellInRange(e.FlameShock)) then
            a = 188389
            return "flame_shock single 18"
        end

    end

    if e.LightningBolt:IsCastable() and t:IsInMeleeRange(40) and (o:BuffStack(e.MaelstromWeaponBuff) >= 5 and o:BuffUp(e.PrimordialWaveBuff) and (o:BuffDown(e.SplinteredElementsBuff) or v <= 12)) then
        if i(e.LightningBolt, nil, nil, not t:IsSpellInRange(e.LightningBolt)) then
            a = 188196
            return "lightning_bolt single 28"
        end

    end

    if e.VesperTotem:IsReady() and t:IsInMeleeRange(40) and u then
        if i(e.VesperTotem, nil, nil, not t:IsInRange(40)) then
            a = 324386
            return "vesper_totem single 20"
        end

    end

    if e.FrostShock:IsReady() and t:IsInMeleeRange(40) and (o:BuffUp(e.HailstormBuff)) then
        if i(e.FrostShock, nil, nil, not t:IsSpellInRange(e.FrostShock)) then
            a = 196840
            return "frost_shock single 22"
        end

    end

    if e.EarthenSpike:IsReady() and t:IsInMeleeRange(10) then
        if i(e.EarthenSpike, nil, nil, not t:IsSpellInRange(e.EarthenSpike)) then
            a = 188089
            return "earthen_spike single 24"
        end

    end

    if e.LavaLash:IsCastable() and t:IsInMeleeRange(10) and (t:DebuffRefreshable(e.FlameShockDebuff)) then
        if i(e.LavaLash, nil, nil, not t:IsSpellInRange(e.LavaLash)) then
            a = 60103
            return "lava_lash single 40"
        end

    end

    if e.FaeTransfusion:IsReady() and t:IsInMeleeRange(10) and u and not o:IsMoving() and ((not _) or e.FeralSpirit:CooldownRemains() > 30) then
        if i(e.FaeTransfusion, nil, nil, not t:IsInRange(40)) then
            a = 328923
            return "fae_transfusion single 26"
        end

    end

    if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) and (e.Stormflurry:IsAvailable() and o:BuffUp(e.StormbringerBuff)) then
        if i(e.Stormstrike, nil, nil, not t:IsSpellInRange(e.Stormstrike)) then
            a = 17364
            return "stormstrike single 36"
        end

    end

    if e.LightningBolt:IsReady() and t:IsInMeleeRange(40) and (o:BuffUp(e.StormkeeperBuff)) then
        if i(e.LightningBolt, nil, nil, not t:IsSpellInRange(e.LightningBolt)) then
            a = 188196
            return "lightning_bolt single 28"
        end

    end

    if e.ElementalBlast:IsReady() and t:IsInMeleeRange(40) and (o:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if i(e.ElementalBlast, nil, nil, not t:IsSpellInRange(e.ElementalBlast)) then
            a = 117014
            return "elemental_blast single 30"
        end

    end

    if e.ChainHarvest:IsReady() and t:IsInMeleeRange(40) and (o:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if i(e.ChainHarvest, nil, nil, not t:IsSpellInRange(e.ChainHarvest)) then
            a = 320674
            return "chain_harvest single 32"
        end

    end

    if e.LightningBolt:IsReady() and t:IsInMeleeRange(40) and (o:BuffStack(e.MaelstromWeaponBuff) == 10 and o:BuffDown(e.PrimordialWaveBuff)) then
        if i(e.LightningBolt, nil, nil, not t:IsSpellInRange(e.LightningBolt)) then
            a = 188196
            return "lightning_bolt single 34"
        end

    end

    if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) then
        if i(e.Stormstrike, nil, nil, not t:IsSpellInRange(e.Stormstrike)) then
            a = 17364
            return "stormstrike single 36"
        end

    end

    if e.Stormkeeper:IsCastable() and t:IsInMeleeRange(40) and not o:IsMoving() and (o:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if i(e.Stormkeeper) then
            a = 191634
            return "stormkeeper single 38"
        end

    end

    if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (o:BuffDown(e.WindfuryTotemBuff, true) or e.WindfuryTotem:TimeSinceLastCast() > 110) then
        if i(e.WindfuryTotem, nil) then
            a = 8512
            return "windfury_totem single 58"
        end

    end

    if e.LavaLash:IsCastable() and t:IsInMeleeRange(10) then
        if i(e.LavaLash, nil, nil, not t:IsSpellInRange(e.LavaLash)) then
            a = 60103
            return "lava_lash single 54"
        end

    end

    if e.LightningBolt:IsReady() and t:IsInMeleeRange(40) and (o:BuffStack(e.MaelstromWeaponBuff) >= 5 and o:BuffDown(e.PrimordialWaveBuff)) then
        if i(e.LightningBolt, nil, nil, not t:IsSpellInRange(e.LightningBolt)) then
            a = 188196
            return "lightning_bolt single 54"
        end

    end

    if e.Sundering:IsReady() and t:IsInMeleeRange(10) and k then
        if i(e.Sundering, nil, nil, not t:IsInRange(8)) then
            a = 197214
            return "sundering single 50"
        end

    end

    if e.FrostShock:IsReady() and t:IsInMeleeRange(40) then
        if i(e.FrostShock, nil, nil, not t:IsSpellInRange(e.FrostShock)) then
            a = 196840
            return "frost_shock single 46"
        end

    end

    if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) then
        if i(e.CrashLightning, nil, nil, not t:IsInRange(8)) then
            a = 187874
            return "crash_lightning single 42"
        end

    end

    if e.IceStrike:IsReady() and t:IsInMeleeRange(10) then
        if i(e.IceStrike, nil, nil, not t:IsInMeleeRange(5)) then
            a = 342240
            return "ice_strike single 48"
        end

    end

    if e.FireNova:IsReady() and t:IsInMeleeRange(10) and (t:DebuffUp(e.FlameShockDebuff)) then
        if i(e.FireNova, nil, nil, not t:IsInMeleeRange(5)) then
            a = 333975
            return "fire_nova single 52"
        end

    end

    if e.EarthElemental:IsCastable() and t:IsInMeleeRange(40) and m() and not O then
        if i(e.EarthElemental, nil) then
            a = 198103
            return "earth_elemental single 56"
        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) and (t:DebuffRefreshable(e.FlameShockDebuff)) then
        if i(e.FlameShock, nil, nil, not t:IsSpellInRange(e.FlameShock)) then
            a = 188389
            return "flame_shock single 44"
        end

    end

    if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (o:BuffDown(e.WindfuryTotemBuff, true) or e.WindfuryTotem:TimeSinceLastCast() > 90) then
        if i(e.WindfuryTotem, nil) then
            a = 8512
            return "windfury_totem single 58"
        end

    end

end

local function F()
    if e.ChainHarvest:IsReady() and t:IsInMeleeRange(40) and u and (o:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if i(e.ChainHarvest, nil, nil, not t:IsSpellInRange(e.ChainHarvest)) then
            a = 320674
            return "chain_harvest aoe 34"
        end

    end

    if (c and o:BuffUp(e.DoomWindsBuff)) then
        if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) then
            if i(e.CrashLightning, nil, nil, not t:IsInRange(8)) then
                a = 187874
                return "crash_lightning aoe 6"
            end

        end

        if e.Sundering:IsReady() and t:IsInMeleeRange(10) and k then
            if i(e.Sundering, nil, nil, not t:IsInRange(11)) then
                a = 197214
                return "sundering aoe 10"
            end

        end

    end

    if e.FireNova:IsReady() and t:IsInMeleeRange(10) and (e.FlameShockDebuff:AuraActiveCount() >= 6 or (e.FlameShockDebuff:AuraActiveCount() >= 4 and e.FlameShockDebuff:AuraActiveCount() >= d)) then
        if i(e.FireNova, nil, nil, not t:IsInMeleeRange(5)) then
            a = 333975
            return "fire_nova aoe 16"
        end

    end

    if e.PrimordialWave:IsReady() and t:IsInMeleeRange(40) and u and (o:BuffDown(e.PrimordialWaveBuff)) then
        if f.CastTargetIf(e.PrimordialWave, w, "min", V, D, not t:IsSpellInRange(e.PrimordialWave), nil, nil) then
            return "primordial_wave aoe 14"
        end

        if V(t) and D(t) then
            if i(e.PrimordialWave, nil, nil, not t:IsSpellInRange(e.PrimordialWave)) then
                a = 326059
                return "primordial_wave aoe 14"
            end

        end

    end

    if (R and o:BuffUp(e.CrashLightningBuff)) then
        if e.Windstrike:IsReady() and t:IsInMeleeRange(10) then
            if i(e.Windstrike, nil, nil, not t:IsSpellInRange(e.Windstrike)) then
                a = 115356
                return "windstrike aoe 2"
            end

        end

        if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) then
            if i(e.Stormstrike, nil, nil, not t:IsSpellInRange(e.Stormstrike)) then
                a = 17364
                return "stormstrike aoe 18"
            end

        end

    end

    if e.LavaLash:IsReady() and t:IsInMeleeRange(10) and (e.LashingFlames:IsAvailable()) then
        if f.CastTargetIf(e.LavaLash, q, "min", x, C, not t:IsSpellInRange(e.LavaLash)) then
            return "lava_lash aoe 26"
        end

        if x(t) and C(t) then
            if i(e.LavaLash, nil, nil, not t:IsSpellInRange(e.LavaLash)) then
                a = 60103
                return "lava_lash aoe 26"
            end

        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) and (t:DebuffDown(e.FlameShockDebuff)) then
        if i(e.FlameShock, nil, nil, not t:IsSpellInRange(e.FlameShock)) then
            a = 188389
            return "flame_shock aoe 22"
        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) and ((not e.Hailstorm:IsAvailable()) and e.FlameShockDebuff:AuraActiveCount() < d and e.FlameShockDebuff:AuraActiveCount() < 6) then
        if f.CastCycle(e.FlameShock, w, S, not t:IsSpellInRange(e.FlameShock)) then
            return "flame_shock aoe 24"
        end

        if S(t) then
            if i(e.FlameShock, nil, nil, not t:IsSpellInRange(e.FlameShock)) then
                a = 188389
                return "flame_shock aoe 24"
            end

        end

    end

    if e.LightningBolt:IsCastable() and t:IsInMeleeRange(40) and ((e.FlameShockDebuff:AuraActiveCount() >= d or e.FlameShockDebuff:AuraActiveCount() >= 4) and o:BuffUp(e.PrimordialWaveBuff) and o:BuffStack(e.MaelstromWeaponBuff) >= 5 and (o:BuffDown(e.SplinteredElementsBuff) or v <= 12)) then
        if i(e.LightningBolt, nil, nil, not t:IsSpellInRange(e.LightningBolt)) then
            a = 188196
            return "lightning_bolt aoe 26"
        end

    end

    if e.FrostShock:IsReady() and t:IsInMeleeRange(40) and (o:BuffUp(e.HailstormBuff)) then
        if i(e.FrostShock, nil, nil, not t:IsSpellInRange(e.FrostShock)) then
            a = 196840
            return "frost_shock aoe 8"
        end

    end

    if e.FaeTransfusion:IsReady() and t:IsInMeleeRange(10) and u and not o:IsMoving() and (e.GroveInvigoration:IsAvailable() or e.FieldofBlossoms:IsAvailable() or _) then
        if i(e.FaeTransfusion, nil, nil, not t:IsInRange(40)) then
            a = 328923
            return "fae_transfusion aoe 4"
        end

    end

    if (o:BuffUp(e.PrimordialWaveBuff) and o:BuffStack(e.MaelstromWeaponBuff) < 5) then
        if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) and (o:BuffDown(e.CrashLightningBuff)) then
            if i(e.CrashLightning, nil, nil, not t:IsInRange(8)) then
                a = 187874
                return "crash_lightning aoe 32"
            end

        end

        if e.Sundering:IsReady() and t:IsInMeleeRange(10) and k then
            if i(e.Sundering, nil, nil, not t:IsInRange(11)) then
                a = 197214
                return "sundering aoe 34"
            end

        end

        if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) then
            if i(e.Stormstrike, nil, nil, not t:IsInMeleeRange(5)) then
                a = 17364
                return "stormstrike aoe 36"
            end

        end

    end

    if e.Sundering:IsReady() and t:IsInMeleeRange(10) and k then
        if i(e.Sundering, nil, nil, not t:IsInRange(11)) then
            a = 197214
            return "sundering aoe 34"
        end

    end

    if e.FireNova:IsReady() and t:IsInMeleeRange(10) and (P >= 4) then
        if i(e.FireNova, nil, nil, not t:IsInMeleeRange(5)) then
            a = 333975
            return "fire_nova aoe 16"
        end

    end

    if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) and (e.CrashingStorm:IsAvailable() or o:BuffDown(e.CrashLightningBuff)) then
        if i(e.CrashLightning, nil, nil, not t:IsInRange(8)) then
            a = 187874
            return "crash_lightning aoe 24"
        end

    end

    if e.LavaLash:IsReady() and t:IsInMeleeRange(10) and (e.LashingFlames:IsAvailable()) then
        if f.CastTargetIf(e.LavaLash, w, "min", x, M, not t:IsSpellInRange(e.LavaLash), nil, nil) then
            return "Lava-Lash aoe 14"
        end

        if x(t) and M(t) then
            if i(e.LavaLash, nil, nil, not t:IsSpellInRange(e.LavaLash)) then
                a = 60103
                return "Lava aoe 24"
            end

        end

    end

    if e.FireNova:IsReady() and t:IsInMeleeRange(10) and (e.FlameShockDebuff:AuraActiveCount() >= 3) then
        if i(e.FireNova, nil, nil, not t:IsInMeleeRange(5)) then
            a = 333975
            return "fire_nova aoe 58"
        end

    end

    if e.VesperTotem:IsReady() and t:IsInMeleeRange(40) then
        if i(e.VesperTotem, nil, nil, not t:IsInRange(40)) then
            a = 324386
            return "vesper_totem aoe 18"
        end

    end

    if e.ChainLightning:IsReady() and t:IsInMeleeRange(40) and (o:BuffUp(e.StormkeeperBuff)) then
        if i(e.ChainLightning, nil, nil, not t:IsSpellInRange(e.ChainLightning)) then
            a = 188443
            return "chain_lightning aoe 22"
        end

    end

    if e.LavaLash:IsReady() and t:IsInMeleeRange(10) and (o:BuffUp(e.CrashLightningBuff)) then
        if i(e.LavaLash, nil, nil, not t:IsInMeleeRange(5)) then
            a = 60103
            return "lava_lash aoe 28"
        end

    end

    if (o:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if e.ElementalBlast:IsReady() and t:IsInMeleeRange(40) then
            if i(e.ElementalBlast, nil, nil, not t:IsSpellInRange(e.ElementalBlast)) then
                a = 117014
                return "elemental_blast aoe 36"
            end

        end

        if e.Stormkeeper:IsCastable() and not o:IsMoving() and t:IsInMeleeRange(40) then
            if i(e.Stormkeeper) then
                a = 188443
                return "stormkeeper aoe 38"
            end

        end

    end

    if e.ChainLightning:IsReady() and t:IsInMeleeRange(40) and (o:BuffStack(e.MaelstromWeaponBuff) == 10) then
        if i(e.ChainLightning, nil, nil, not t:IsSpellInRange(e.ChainLightning)) then
            a = 188443
            return "chain_lightning aoe 56"
        end

    end

    if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) and (o:BuffUp(e.CrashLightningBuff)) then
        if i(e.Stormstrike, nil, nil, not t:IsInMeleeRange(5)) then
            a = 17364
            return "stormstrike aoe 30"
        end

    end

    if e.FireNova:IsReady() and t:IsInMeleeRange(10) and (e.FlameShockDebuff:AuraActiveCount() >= 2) then
        if i(e.FireNova, nil, nil, not t:IsInMeleeRange(5)) then
            a = 333975
            return "fire_nova aoe 58"
        end

    end

    if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) then
        if i(e.CrashLightning, nil, nil, not t:IsInRange(8)) then
            a = 187874
            return "crash_lightning aoe 32"
        end

    end

    if e.Windstrike:IsReady() and t:IsInMeleeRange(10) then
        if i(e.Windstrike, nil, nil, not t:IsSpellInRange(e.Windstrike)) then
            a = 115356
            return "windstrike aoe 42"
        end

    end

    if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) then
        if i(e.Stormstrike, nil, nil, not t:IsSpellInRange(e.Stormstrike)) then
            a = 17364
            return "stormstrike aoe 44"
        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) and t:DebuffRefreshable(e.FlameShock) then
        if i(e.FlameShock, nil, nil, not t:IsSpellInRange(e.FlameShock)) then
            a = 188389
            return "flame_shock aoe 48"
        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) then
        if f.CastCycle(e.FlameShock, w, S, not t:IsSpellInRange(e.FlameShock)) then
            return "flame_shock aoe 48"
        end

    end

    if e.FaeTransfusion:IsReady() and t:IsInMeleeRange(10) and u and not o:IsMoving() then
        if i(e.FaeTransfusion, nil, nil, not t:IsInRange(40)) then
            a = 328923
            return "fae_transfusion aoe 50"
        end

    end

    if e.FrostShock:IsReady() and t:IsInMeleeRange(40) then
        if i(e.FrostShock, nil, nil, not t:IsSpellInRange(e.FrostShock)) then
            a = 196840
            return "frost_shock aoe 52"
        end

    end

    if e.ChainLightning:IsReady() and t:IsInMeleeRange(40) and (o:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if i(e.ChainLightning, nil, nil, not t:IsSpellInRange(e.ChainLightning)) then
            a = 188443
            return "chain_lightning aoe 56"
        end

    end

    if e.EarthenSpike:IsReady() and t:IsInMeleeRange(10) then
        if i(e.EarthenSpike, nil, nil, not t:IsSpellInRange(e.EarthenSpike)) then
            a = 188089
            return "earthen_spike aoe 60"
        end

    end

    if e.EarthElemental:IsCastable() and t:IsInMeleeRange(40) and m() and not O then
        if i(e.EarthElemental, nil) then
            a = 198103
            return "earth_elemental aoe 62"
        end

    end

    if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (o:BuffDown(e.WindfuryTotemBuff, true) or e.WindfuryTotem:TimeSinceLastCast() > 90) then
        if i(e.WindfuryTotem, nil) then
            a = 8512
            return "windfury_totem aoe 64"
        end

    end

end

local function x()
    j = HeroRotationCharDB.Toggles[6]
    u = HeroRotationCharDB.Toggles[4]
    k = HeroRotationCharDB.Toggles[5]
    b = HeroRotationCharDB.Toggles[12]
    Y = HeroRotationCharDB.Toggles[15]
    ie = HeroRotationCharDB.Toggles[60]
    m = h.CDsON
    O = HeroRotationCharDB.Toggles[90]
    T = HeroRotationCharDB.Toggles[91]
    E = HeroRotationCharDB.Toggles[92]
    N = HeroRotationCharDB.Toggles[93]
    I = HeroRotationCharDB.Toggles[94]
    H = HeroRotationCharDB.Toggles[96]
    A = HeroRotationCharDB.Toggles[95]
    W = HeroRotationCharDB.Toggles[97]
    G = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                G = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

    y = GetInventoryItemID("player", 13)
    p = GetInventoryItemID("player", 14)
            if not s.Commons.Enabled.TopTrinket and not s.Commons.Enabled.BotTrinket then
        z = { y, p, n.CacheofAcquiredTreasures:ID(), n.ScarsofFraternalStrife:ID(), n.TheFirstSigil:ID() }
    elseif not s.Commons.Enabled.TopTrinket and s.Commons.Enabled.BotTrinket then
        z = { y, n.CacheofAcquiredTreasures:ID(), n.ScarsofFraternalStrife:ID(), n.TheFirstSigil:ID() }
    elseif not s.Commons.Enabled.BotTrinket and s.Commons.Enabled.TopTrinket then
        z = { p, n.CacheofAcquiredTreasures:ID(), n.ScarsofFraternalStrife:ID(), n.TheFirstSigil:ID() }
    end

end

local function k()
    K, X, B, B, Q, Z = ae()
    if te() then
        w = o:GetEnemiesInRange(40)
        J = #w
        q = o:GetEnemiesInMeleeRange(10)
        d = #q
    else
        w = {  }
        J = 1
        q = {  }
        d = 1
    end

    v = g.FightRemains(q, false)
    if not BotOn then
        r = 0
        a = 0
    end

    if r > 0 then
        r = 0
    end

    if a > 0 then
        a = 0
    end

    oe = x()
    if o:IsChanneling(e.FaeTransfusion) then
        if h.CastAnnotated(e.Pool, false, "WAIT") then
            a = 99999
            return "Pool During FaeTransfusion"
        end

    end

        if h.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (h.GUISettings.General.OpenerReset)
    elseif h.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        h.ToggleIconFrame:UpdateButtonText(6)
        h.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if s.Enhancement.PreferEarthShield and e.EarthShield:IsReady() and (o:BuffDown(e.EarthShield) or (not o:AffectingCombat() and o:BuffStack(e.EarthShield) < 5)) then
        if i(e.EarthShield, nil) then
            a = 974
            return "Earth Shield Refresh"
        end

    elseif e.LightningShield:IsCastable() and o:BuffDown(e.LightningShield) and (s.Enhancement.PreferEarthShield and o:BuffDown(e.EarthShield) or not s.Enhancement.PreferEarthShield) then
        if i(e.LightningShield, nil) then
            a = 192106
            return "Lightning Shield Refresh"
        end

    end

    if (not K or X < 600000) and e.WindfuryWeapon:IsCastable() then
        if i(e.WindfuryWeapon) then
            a = 33757
            return "WindfuryWeapon enchant"
        end

    end

    if ((not Q) or Z < 600000) and e.FlamentongueWeapon:IsCastable() then
        if i(e.FlamentongueWeapon) then
            a = 318038
            return "FlamentongueWeapon enchant"
        end

    end

    if not o:AffectingCombat() and f.TargetIsValid() and j then
        local e = U()
        if e then
            return e
        end

    end

    if o:IsChanneling() or o:IsChanneling(e.FaeTransfusion) then
        if i(e.Pool, nil) then
            a = 99999
            return "Trinket Channel"
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.FrostShock:IsCastable() then
            if i(e.FrostShock, nil) then
                r = 1196840
                return "explosive MO FS"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.FrostShock:IsCastable() then
            if i(e.FrostShock, nil) then
                a = 196840
                return "explosive  FS"
            end

        end

    end

        if (T and e.CapacitorTotem:IsUsableP() and e.CapacitorTotem:CooldownRemains(BypassRecovery) <= 0) then
        if h.Cast(e.CapacitorTotem, nil, nil, nil) then
            a = 1192058
            return "queue CapacitorTotem"
        end

    elseif ((not e.CapacitorTotem:IsUsableP() or e.CapacitorTotem:CooldownRemains(BypassRecovery) > 0) and T) then
        HeroRotationCharDB.Toggles[91] = not HeroRotationCharDB.Toggles[91]
        h.Print("Capacitor Totem Queue is now " .. (HeroRotationCharDB.Toggles[91] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (E and e.HealingStreamTotem:IsUsableP() and e.HealingStreamTotem:CooldownRemains(BypassRecovery) <= 0) then
        if h.Cast(e.HealingStreamTotem, nil, nil, nil) then
            a = 5394
            return "queue HealingStreamTotem"
        end

    elseif ((not e.HealingStreamTotem:IsUsableP() or e.HealingStreamTotem:CooldownRemains(BypassRecovery) > 0) and E) then
        HeroRotationCharDB.Toggles[92] = not HeroRotationCharDB.Toggles[92]
        h.Print("Healing Stream Totem Queue is now " .. (HeroRotationCharDB.Toggles[92] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (N and e.TremorTotem:IsUsableP() and e.TremorTotem:CooldownRemains(BypassRecovery) <= 0) then
        if h.Cast(e.TremorTotem, nil, nil, nil) then
            a = 8143
            return "queue TremorTotem"
        end

    elseif ((not e.TremorTotem:IsUsableP() or e.TremorTotem:CooldownRemains(BypassRecovery) > 0) and N) then
        HeroRotationCharDB.Toggles[93] = not HeroRotationCharDB.Toggles[93]
        h.Print("Tremor Totem Queue is now " .. (HeroRotationCharDB.Toggles[93] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (I and e.WindRushTotem:IsUsableP() and e.WindRushTotem:CooldownRemains(BypassRecovery) <= 0) then
        if h.Cast(e.WindRushTotem, nil, nil, nil) then
            a = 192077
            return "queue WindRushTotem"
        end

    elseif ((not e.WindRushTotem:IsUsableP() or e.WindRushTotem:CooldownRemains(BypassRecovery) > 0) and I) then
        HeroRotationCharDB.Toggles[94] = not HeroRotationCharDB.Toggles[94]
        h.Print("Wind Rush Totem Queue is now " .. (HeroRotationCharDB.Toggles[94] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (H and e.FaeTransfusion:IsUsableP() and e.FaeTransfusion:CooldownRemains(BypassRecovery) <= 0 and e.FaeTransfusion:IsAvailable()) then
        if i(e.FaeTransfusion, nil) then
            a = 328923
            return "FaeTransfusion 1"
        end

    elseif ((not e.FaeTransfusion:IsUsableP() or e.FaeTransfusion:CooldownRemains(BypassRecovery) > 0 or not e.FaeTransfusion:IsAvailable()) and H) then
        HeroRotationCharDB.Toggles[96] = not HeroRotationCharDB.Toggles[96]
        h.Print("Fae Transfusion Queue is now" .. (HeroRotationCharDB.Toggles[96] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (A and e.Hex:IsUsableP() and e.Hex:CooldownRemains(BypassRecovery) <= 0 and UnitExists("mouseover")) then
        if h.Cast(e.Hex, nil, nil, nil) then
            if UnitExists("mouseover") and l("mouseover"):IsInRange(40) then
                r = 151514
                return "queue Hex MO"
            end

        end

    elseif ((not e.Hex:IsUsableP() or e.Hex:CooldownRemains() > 0) and A) then
        HeroRotationCharDB.Toggles[95] = not HeroRotationCharDB.Toggles[95]
        h.Print("Hex Queue is now " .. (HeroRotationCharDB.Toggles[95] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if not o:AffectingCombat() and f.TargetIsValid() and j then
        local e = U()
        if e then
            return e
        end

    end

    for o = 1, 25 do
        local n, n, n, o = UnitBuff("target", o)
        if o ~= nil and o == "Magic" then
            if e.Purge:IsCastable() and W and t:IsInRange(20) then
                if i(e.Purge, nil) then
                    a = 370
                    return "Purge"
                end

            end

        end

    end

    for t = 0, 40 do
        local a, a, a, t, a, a, a, a, a, a = UnitDebuff("mouseover", t)
        if e.CleanseSpirit:IsCastable() and UnitIsDead("mouseover") ~= true and UnitCanAttack("player", "mouseover") ~= true and IsItemInRange(34471, "mouseover") and ((t == "Curse")) then
            if i(e.CleanseSpirit, nil) then
                r = 151886
                return "Cleanse Spirit MO"
            end

        end

    end

    if f.TargetIsValid() and (o:AffectingCombat() or j) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326 or t:NPCID() == 176581 or t:NPCID() == 176920 or t:NPCID() == 177892 or t:NPCID() == 182778 or t:NPCID() == 185402 or t:NPCID() == 183945 or t:NPCID() == 182074 or t:NPCID() == 184737 or t:NPCID() == 179733 or t:NPCID() == 115402 or t:NPCID() == 115406 or t:NPCID() == 115395 or UnitExists("boss1") or t:NPCID() == 115388 or j) and not o:IsDeadOrGhost() then
        local w = 0
        local f = 0
                if GetNumGroupMembers() > 0 then
            if UnitInParty("player") then
                for e = 1, GetNumGroupMembers() do
                    if UnitExists("party" .. e) then
                        f = f + UnitHealth("party" .. e)
                        w = w + UnitHealthMax("party" .. e)
                    end

                end

            end

            if UnitInRaid("player") then
                for e = 1, GetNumGroupMembers() do
                    if UnitExists("raid" .. e) then
                        f = f + UnitHealth("raid" .. e)
                        w = w + UnitHealthMax("raid" .. e)
                    end

                end

            end

        elseif GetNumGroupMembers() == 0 then
            f = UnitHealth("player")
            w = UnitHealthMax("player")
        end

        if o:HealthPercentage() < s.Enhancement.HealthstoneHP and n.Healthstone:IsReady() and n.Healthstone:CooldownRemains() <= 0 then
            if i(n.Healthstone, nil) then
                a = 40
                return "Healthstone HP"
            end

        end

        if o:HealthPercentage() < s.Enhancement.HealPotHP and n.CosmicHealPot:IsReady() and n.CosmicHealPot:CooldownRemains() <= 0 then
            if i(n.CosmicHealPot, nil) then
                a = 45
                return "CosmicHealPot HP"
            end

        end

        if o:HealthPercentage() < s.Enhancement.HealPotHP and n.HealPot:IsReady() and n.HealPot:CooldownRemains() <= 0 then
            if i(n.HealPot, nil) then
                a = 41
                return "HealPot HP"
            end

        end

        if o:HealthPercentage() < s.Enhancement.PhialHP and n.PhialofSerenity:IsReady() and n.PhialofSerenity:CooldownRemains() <= 0 then
            if i(n.PhialofSerenity, nil) then
                a = 55
                return "PhialofSerenity HP"
            end

        end

        if ((f / w) * 100) <= s.Enhancement.FaeTransfusionHealHP and o:BuffUp(L(328933)) then
            if i(e.FaeTransfusion, nil) then
                a = 328923
                return "FaeTransfusion Heal"
            end

        end

        if o:HealthPercentage() < s.Enhancement.AstralShiftHP and e.AstralShift:IsAvailable() and e.AstralShift:IsReady() then
            if i(e.AstralShift) then
                a = 108271
                return "AstralShift HP"
            end

        end

        if o:HealthPercentage() < s.Enhancement.HealingSurgeHP and e.HealingSurge:IsReady() and (not o:IsMoving() or o:BuffUp(e.MaelstromWeaponBuff)) then
            if i(e.HealingSurge) then
                a = 8004
                return "HealingSurge HP"
            end

        end

        if UnitInParty("player") and s.Enhancement.HealingSurgePartyHP > 0 and o:BuffUp(e.MaelstromWeaponBuff) and e.HealingSurge:IsReady() then
                                                if UnitExists("party1") and not l("party1"):IsDeadOrGhost() and l("party1"):HealthPercentage() < s.Enhancement.HealingSurgePartyHP then
                if i(e.HealingSurge) then
                    a = 18004
                    return "HealingSurge party 1 HP"
                end

            elseif UnitExists("party2") and not l("party2"):IsDeadOrGhost() and l("party2"):HealthPercentage() < s.Enhancement.HealingSurgePartyHP then
                if i(e.HealingSurge) then
                    a = 28004
                    return "HealingSurge party 2 HP"
                end

            elseif UnitExists("party3") and not l("party3"):IsDeadOrGhost() and l("party3"):HealthPercentage() < s.Enhancement.HealingSurgePartyHP then
                if i(e.HealingSurge) then
                    a = 38004
                    return "HealingSurge party 3 HP"
                end

            elseif UnitExists("party4") and not l("party4"):IsDeadOrGhost() and l("party4"):HealthPercentage() < s.Enhancement.HealingSurgePartyHP then
                if i(e.HealingSurge) then
                    a = 48004
                    return "HealingSurge party 4 HP"
                end

            end

        end

        if not t:IsInMeleeRange(10) and d > 0 and s.Enhancement.TargetSwap == "AutoSwap" and not b then
            r = 999
        end

        if n.PotionofSpectralAgility:IsReady() and m() and s.Commons.Enabled.Potions and Y and ((e.Ascendance:IsAvailable() and e.Ascendance:CooldownRemains() < 10) or (e.HotHand:IsAvailable() and o:BuffUp(e.MoltenWeaponBuff)) or o:BuffUp(e.IcyEdgeBuff) or (e.Stormflurry:IsAvailable() and o:BuffUp(e.CracklingSurgeBuff)) or t:DebuffUp(e.EarthenSpike) or d > 1 or v < 30) then
            if i(n.PotionofSpectralAgility, nil, nil) then
                a = 50
                return "potion default 4"
            end

        end

        if ((s.Commons.Enabled.TopTrinket or s.Commons.Enabled.BottomTrinket) and m() and t:IsInMeleeRange(10)) then
            if n.TheFirstSigil:IsEquippedAndReady() and ((e.Ascendance:IsAvailable() and e.Ascendance:CooldownRemains() < 10) or (e.HotHand:IsAvailable() and o:BuffUp(e.MoltenWeaponBuff)) or o:BuffUp(e.IcyEdgeBuff) or (e.Stormflurry:IsAvailable() and o:BuffUp(e.CracklingSurgeBuff)) or t:DebuffUp(e.EarthenSpike) or d > 1 or v < 30) then
                if i(n.TheFirstSigil, nil, nil) then
                                        if n.TheFirstSigil:ID() == y and s.Commons.Enabled.TopTrinket then
                        a = 24
                        return "top trinket 1"
                    elseif n.TheFirstSigil:ID() == p and s.Commons.Enabled.BottomTrinket then
                        a = 30
                        return "Bot trinket 2"
                    end

                end

            end

            if n.CacheofAcquiredTreasures:IsEquippedAndReady() and (o:BuffUp(e.AcquiredSwordBuff) or v < 25) then
                if i(n.CacheofAcquiredTreasures, nil, nil) then
                                        if n.CacheofAcquiredTreasures:ID() == y and s.Commons.Enabled.TopTrinket then
                        a = 24
                        return "top trinket 1"
                    elseif n.CacheofAcquiredTreasures:ID() == p and s.Commons.Enabled.BottomTrinket then
                        a = 30
                        return "Bot trinket 2"
                    end

                end

            end

            if n.ScarsofFraternalStrife:IsEquippedAndReady() and (o:BuffDown(e.ScarsofFraternalStrifeBuff4) or v < 31 or d > 1) then
                if i(n.ScarsofFraternalStrife, nil, nil) then
                                        if n.ScarsofFraternalStrife:ID() == y and s.Commons.Enabled.TopTrinket then
                        a = 24
                        return "top trinket 1"
                    elseif n.ScarsofFraternalStrife:ID() == p and s.Commons.Enabled.BottomTrinket then
                        a = 30
                        return "Bot trinket 2"
                    end

                end

            end

            local e = o:GetUseableTrinkets(z)
            if e then
                if i(e, nil, nil) then
                                        if e:ID() == y and s.Commons.Enabled.TopTrinket then
                        a = 24
                        return "top trinket 1"
                    elseif e:ID() == p and s.Commons.Enabled.BottomTrinket then
                        a = 30
                        return "Bot trinket 2"
                    end

                end

            end

        end

        if (m() and t:IsInMeleeRange(10)) then
            if e.BloodFury:IsCastable() and t:IsInRange(8) and (not e.Ascendance:IsAvailable() or o:BuffUp(e.AscendanceBuff) or e.Ascendance:CooldownRemains() > 50) then
                if h.Cast(e.BloodFury, nil) then
                    a = 20572
                    return "Blood Fury 420"
                end

            end

            if e.Berserking:IsCastable() and t:IsInRange(8) and (not e.Ascendance:IsAvailable() or o:BuffUp(e.AscendanceBuff)) then
                if h.Cast(e.Berserking, nil) then
                    a = 26297
                    return "Berserking 422"
                end

            end

            if e.AncestralCall:IsCastable() and t:IsInRange(8) and (not e.Ascendance:IsAvailable() or o:BuffUp(e.AscendanceBuff) or e.Ascendance:CooldownRemains() > 50) then
                if h.Cast(e.AncestralCall, nil) then
                    a = 274738
                    return "Ancestral Call 428"
                end

            end

            if e.Fireblood:IsCastable() and t:IsInRange(8) and (not e.Ascendance:IsAvailable() or o:BuffUp(e.AscendanceBuff) or e.Ascendance:CooldownRemains() > 50) then
                if h.Cast(e.Fireblood, nil) then
                    a = 265221
                    return "Fireblood 426"
                end

            end

            if e.BagofTricks:IsCastable() and t:IsInRange(8) and (not e.Ascendance:IsAvailable() or not o:BuffUp(e.AscendanceBuff)) then
                if h.Cast(e.BagofTricks, nil, nil, not t:IsInRange(40)) then
                    a = 312411
                    return "Bag of Tricks 430"
                end

            end

        end

        if e.FeralSpirit:IsCastable() and t:IsInRange(40) and m() then
            if i(e.FeralSpirit, nil) then
                a = 51533
                return "feral_spirit default 6"
            end

        end

        if e.FaeTransfusion:IsReady() and t:IsInMeleeRange(10) and not o:IsMoving() and u and ((e.Ascendance:IsAvailable() or c) and (e.GroveInvigoration:IsAvailable() or e.FieldofBlossoms:IsAvailable() or d == 1)) then
            if i(e.FaeTransfusion, nil, nil, not t:IsInRange(40)) then
                a = 328923
                return "fae_transfusion default 8"
            end

        end

        if e.Ascendance:IsCastable() and t:IsInMeleeRange(10) and m() then
            if i(e.Ascendance, nil) then
                a = 114051
                return "ascendance default 10"
            end

        end

        if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (c and o:BuffDown(e.DoomWindsBuff) and e.WindfuryTotem:TimeSinceLastCast() > 60) then
            if i(e.WindfuryTotem, nil) then
                a = 8512
                return "windfury_totem default 12"
            end

        end

        if d < 2 then
            local e = ee()
            if e then
                return e
            end

        end

        if d > 1 then
            local e = F()
            if e then
                return e
            end

        end

        if h.CastAnnotated(e.Pool, false, "WAIT") then
            a = 9999
            return "Wait/Pool Resources"
        end

    end

end

local function t()
    e.FlameShockDebuff:RegisterAuraTracking()
    SetCVar("autoSelfCast", "1")
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        h.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpell2()
    if a == 0 then
        return 0
    else
        return a
    end

end

function ReturnSpellMO2()
    if r == 0 then
        return 0
    else
        return r
    end

end

h.SetAPL(263, k, t)

