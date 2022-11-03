local e, e = ...
local e = HeroDBC.DBC
local v = HeroLib
local e = HeroCache
local d = v.Unit
local i = d.Player
local t = d.Target
local I = v.Spell
local e = v.MultiSpell
local a = v.Item
local h = HeroRotation
local o = h.Cast
local te = h.AoEON
local f = h.CDsON
local u = HeroRotationCharDB.Toggles[4]
local k = HeroRotationCharDB.Toggles[5]
local j = HeroRotationCharDB.Toggles[6]
local Y = HeroRotationCharDB.Toggles[15]
local p = HeroRotationCharDB.Toggles[12]
local ie = HeroRotationCharDB.Toggles[60]
local T = HeroRotationCharDB.Toggles[90]
local A = HeroRotationCharDB.Toggles[91]
local E = HeroRotationCharDB.Toggles[92]
local H = HeroRotationCharDB.Toggles[93]
local S = HeroRotationCharDB.Toggles[94]
local N = HeroRotationCharDB.Toggles[96]
local O = HeroRotationCharDB.Toggles[95]
local W = HeroRotationCharDB.Toggles[97]
local G = 0
local ae = GetWeaponEnchantInfo
local e = math.max
local e = I.Shaman.Enhancement
local n = a.Shaman.Enhancement
local z = { n.CacheofAcquiredTreasures:ID(), n.ScarsofFraternalStrife:ID(), n.TheFirstSigil:ID() }
local s = i:GetEquipment()
local s = a(0)
local a = a(0)
local b, a = GetInventoryItemID("player", 13)
local y, B = GetInventoryItemID("player", 14)
local oe
local K, Q
local X, Z
local w, q, l, a, J
local g
local P = 0
local a = 0
local r = 0
local a = 0
local s = 0
local m = h.Commons.Everyone
local s = { General = h.GUISettings.General, Commons = h.GUISettings.APL.Shaman.Commons, Enhancement = h.GUISettings.APL.Shaman.Enhancement }
local D = i:HasLegendaryEquipped(132)
local c = i:HasLegendaryEquipped(138)
local F = i:HasLegendaryEquipped(141)
local _ = (i:HasLegendaryEquipped(246) or (i:HasUnity() and e.FaeTransfusion:IsAvailable()))
v:RegisterForEvent(function()
    D = i:HasLegendaryEquipped(132)
    c = i:HasLegendaryEquipped(138)
    F = i:HasLegendaryEquipped(141)
    _ = (i:HasLegendaryEquipped(246) or (i:HasUnity() and e.FaeTransfusion:IsAvailable()))
end, "PLAYER_EQUIPMENT_CHANGED")
local x = i:CovenantID()
v:RegisterForEvent(function()
    x = i:CovenantID()
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
        if string.match(i:TotemName(e), 'Totem') then
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

local function R(o)
                if ((o:DebuffRefreshable(e.FlameShockDebuff) or o:DebuffDown(e.FlameShockDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == d("mouseover"):GUID()) then
        r = 1188389
        return true
    elseif ((o:DebuffRefreshable(e.FlameShockDebuff) or o:DebuffDown(e.FlameShockDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and s.Enhancement.TargetSwap == "AutoSwap" and o:GUID() ~= t:GUID() and not p) then
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
                if ((o:DebuffRefreshable(e.LashingFlamesDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == d("mouseover"):GUID()) then
        r = 160103
        return true
    elseif ((o:DebuffRefreshable(e.LashingFlamesDebuff)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and s.Enhancement.TargetSwap == "AutoSwap" and o:GUID() ~= t:GUID() and not p) then
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

local function L(o)
                if (i:BuffDown(e.PrimordialWaveBuff) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == d("mouseover"):GUID()) then
        r = 1326059
        return true
    elseif (i:BuffDown(e.PrimordialWaveBuff) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and s.Enhancement.TargetSwap == "AutoSwap" and o:GUID() ~= t:GUID() and not p) then
        r = 999
        return true
    elseif (i:BuffDown(e.PrimordialWaveBuff) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == t:GUID()) then
        a = 326059
        return true
    elseif i:BuffDown(e.PrimordialWaveBuff) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) then
        return true
    end

end

local function x(t)
    return (t:DebuffRemains(e.LashingFlamesDebuff))
end

local function M(o)
                if (e.LashingFlames:IsAvailable() and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == d("mouseover"):GUID()) then
        r = 160103
        return true
    elseif (e.LashingFlames:IsAvailable() and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and s.Enhancement.TargetSwap == "AutoSwap" and o:GUID() ~= t:GUID() and not p) then
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
                if ((o:DebuffUp(e.FlameShockDebuff) and (e.FlameShockDebuff:AuraActiveCount() < l and e.FlameShockDebuff:AuraActiveCount() < 6)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == d("mouseover"):GUID()) then
        r = 160103
        return true
    elseif ((o:DebuffUp(e.FlameShockDebuff) and (e.FlameShockDebuff:AuraActiveCount() < l and e.FlameShockDebuff:AuraActiveCount() < 6)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and s.Enhancement.TargetSwap == "AutoSwap" and o:GUID() ~= t:GUID() and not p) then
        r = 999
        return true
    elseif ((o:DebuffUp(e.FlameShockDebuff) and (e.FlameShockDebuff:AuraActiveCount() < l and e.FlameShockDebuff:AuraActiveCount() < 6)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) and o:GUID() == t:GUID()) then
        a = 60103
        return true
    elseif (o:DebuffUp(e.FlameShockDebuff) and (e.FlameShockDebuff:AuraActiveCount() < l and e.FlameShockDebuff:AuraActiveCount() < 6)) and (o:AffectingCombat() or o:IsDummy() or o:NPCID() == 153285 or o:NPCID() == 168326 or UnitExists("boss1")) and (o:IsInMeleeRange(8)) then
        return true
    end

end

local function U()
    if e.Stormkeeper:IsCastable() and not i:IsMoving() then
        if o(e.Stormkeeper) then
            a = 191634
            return "Stormkeeper precombat"
        end

    end

    if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (not c and (i:BuffDown(e.WindfuryTotemBuff, true) or e.WindfuryTotem:TimeSinceLastCast() > 90)) then
        if o(e.WindfuryTotem, nil) then
            a = 8512
            return "windfury_totem precombat"
        end

    end

    if e.Fleshcraft:IsCastable() and u and (e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled()) then
        if o(e.Fleshcraft, nil, nil) then
            a = 324631
            return "fleshcraft precombat 6"
        end

    end

end

local function ee()
    if e.Windstrike:IsReady() and t:IsInMeleeRange(10) then
        if o(e.Windstrike, nil, nil, not t:IsSpellInRange(e.Windstrike)) then
            a = 115356
            return "windstrike single 2"
        end

    end

    if e.LavaLash:IsReady() and t:IsInMeleeRange(10) and (i:BuffUp(e.HotHandBuff) or (F and i:BuffStack(e.PrimalLavaActuatorsBuff) > 6)) then
        if o(e.LavaLash, nil, nil, not t:IsSpellInRange(e.LavaLash)) then
            a = 60103
            return "lava_lash single 4"
        end

    end

    if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (i:BuffDown(e.WindfuryTotemBuff, true)) then
        if o(e.WindfuryTotem, nil) then
            a = 8512
            return "windfury_totem single 6"
        end

    end

    if (c and i:BuffUp(e.DoomWindsBuff)) then
        if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) and (c and i:BuffUp(e.DoomWindsBuff)) then
            if o(e.Stormstrike, nil, nil, not t:IsSpellInRange(e.Stormstrike)) then
                a = 17364
                return "stormstrike single 8"
            end

        end

        if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) and (c and i:BuffUp(e.DoomWindsBuff)) then
            if o(e.CrashLightning, nil, nil, not t:IsInMeleeRange(8)) then
                a = 187874
                return "crash_lightning single 10"
            end

        end

        if e.IceStrike:IsReady() and t:IsInMeleeRange(10) and e.IceStrike:IsAvailable() and (c and i:BuffUp(e.DoomWindsBuff)) then
            if o(e.IceStrike, nil, nil, not t:IsInMeleeRange(5)) then
                a = 342240
                return "ice_strike single 12"
            end

        end

        if e.Sundering:IsReady() and t:IsInMeleeRange(10) and k then
            if o(e.Sundering, nil, nil, not t:IsInRange(11)) then
                a = 197214
                return "sundering single 14"
            end

        end

    end

    if e.PrimordialWave:IsReady() and t:IsInMeleeRange(40) and u and (i:BuffDown(e.PrimordialWaveBuff)) then
        if o(e.PrimordialWave, nil, nil, not t:IsSpellInRange(e.PrimordialWave)) then
            a = 326059
            return "primordial_wave single 6"
        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) and (t:DebuffDown(e.FlameShockDebuff)) then
        if o(e.FlameShock, nil, nil, not t:IsSpellInRange(e.FlameShock)) then
            a = 188389
            return "flame_shock single 18"
        end

    end

    if e.LightningBolt:IsCastable() and t:IsInMeleeRange(40) and (i:BuffStack(e.MaelstromWeaponBuff) >= 5 and i:BuffUp(e.PrimordialWaveBuff) and (i:BuffDown(e.SplinteredElementsBuff) or g <= 12)) then
        if o(e.LightningBolt, nil, nil, not t:IsSpellInRange(e.LightningBolt)) then
            a = 188196
            return "lightning_bolt single 28"
        end

    end

    if e.VesperTotem:IsReady() and t:IsInMeleeRange(40) and u then
        if o(e.VesperTotem, nil, nil, not t:IsInRange(40)) then
            a = 324386
            return "vesper_totem single 20"
        end

    end

    if e.FrostShock:IsReady() and t:IsInMeleeRange(40) and (i:BuffUp(e.HailstormBuff)) then
        if o(e.FrostShock, nil, nil, not t:IsSpellInRange(e.FrostShock)) then
            a = 196840
            return "frost_shock single 22"
        end

    end

    if e.EarthenSpike:IsReady() and t:IsInMeleeRange(10) then
        if o(e.EarthenSpike, nil, nil, not t:IsSpellInRange(e.EarthenSpike)) then
            a = 188089
            return "earthen_spike single 24"
        end

    end

    if e.LavaLash:IsCastable() and t:IsInMeleeRange(10) and (t:DebuffRefreshable(e.FlameShockDebuff)) then
        if o(e.LavaLash, nil, nil, not t:IsSpellInRange(e.LavaLash)) then
            a = 60103
            return "lava_lash single 40"
        end

    end

    if e.FaeTransfusion:IsReady() and t:IsInMeleeRange(10) and u and not i:IsMoving() and ((not _) or e.FeralSpirit:CooldownRemains() > 30) then
        if o(e.FaeTransfusion, nil, nil, not t:IsInRange(40)) then
            a = 328923
            return "fae_transfusion single 26"
        end

    end

    if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) and (e.Stormflurry:IsAvailable() and i:BuffUp(e.StormbringerBuff)) then
        if o(e.Stormstrike, nil, nil, not t:IsSpellInRange(e.Stormstrike)) then
            a = 17364
            return "stormstrike single 36"
        end

    end

    if e.LightningBolt:IsReady() and t:IsInMeleeRange(40) and (i:BuffUp(e.StormkeeperBuff)) then
        if o(e.LightningBolt, nil, nil, not t:IsSpellInRange(e.LightningBolt)) then
            a = 188196
            return "lightning_bolt single 28"
        end

    end

    if e.ElementalBlast:IsReady() and t:IsInMeleeRange(40) and (i:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if o(e.ElementalBlast, nil, nil, not t:IsSpellInRange(e.ElementalBlast)) then
            a = 117014
            return "elemental_blast single 30"
        end

    end

    if e.ChainHarvest:IsReady() and u and t:IsInMeleeRange(40) and (i:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if o(e.ChainHarvest, nil, nil, not t:IsSpellInRange(e.ChainHarvest)) then
            a = 320674
            return "chain_harvest single 32"
        end

    end

    if e.LightningBolt:IsReady() and t:IsInMeleeRange(40) and (i:BuffStack(e.MaelstromWeaponBuff) == 10 and i:BuffDown(e.PrimordialWaveBuff)) then
        if o(e.LightningBolt, nil, nil, not t:IsSpellInRange(e.LightningBolt)) then
            a = 188196
            return "lightning_bolt single 34"
        end

    end

    if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) then
        if o(e.Stormstrike, nil, nil, not t:IsSpellInRange(e.Stormstrike)) then
            a = 17364
            return "stormstrike single 36"
        end

    end

    if e.Stormkeeper:IsCastable() and t:IsInMeleeRange(40) and not i:IsMoving() and (i:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if o(e.Stormkeeper) then
            a = 191634
            return "stormkeeper single 38"
        end

    end

    if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (i:BuffDown(e.WindfuryTotemBuff, true) or e.WindfuryTotem:TimeSinceLastCast() > 110) then
        if o(e.WindfuryTotem, nil) then
            a = 8512
            return "windfury_totem single 58"
        end

    end

    if e.LavaLash:IsCastable() and t:IsInMeleeRange(10) then
        if o(e.LavaLash, nil, nil, not t:IsSpellInRange(e.LavaLash)) then
            a = 60103
            return "lava_lash single 54"
        end

    end

    if e.LightningBolt:IsReady() and t:IsInMeleeRange(40) and (i:BuffStack(e.MaelstromWeaponBuff) >= 5 and i:BuffDown(e.PrimordialWaveBuff)) then
        if o(e.LightningBolt, nil, nil, not t:IsSpellInRange(e.LightningBolt)) then
            a = 188196
            return "lightning_bolt single 54"
        end

    end

    if e.Sundering:IsReady() and t:IsInMeleeRange(10) and k then
        if o(e.Sundering, nil, nil, not t:IsInRange(8)) then
            a = 197214
            return "sundering single 50"
        end

    end

    if e.FrostShock:IsReady() and t:IsInMeleeRange(40) then
        if o(e.FrostShock, nil, nil, not t:IsSpellInRange(e.FrostShock)) then
            a = 196840
            return "frost_shock single 46"
        end

    end

    if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) then
        if o(e.CrashLightning, nil, nil, not t:IsInRange(8)) then
            a = 187874
            return "crash_lightning single 42"
        end

    end

    if e.IceStrike:IsReady() and t:IsInMeleeRange(10) then
        if o(e.IceStrike, nil, nil, not t:IsInMeleeRange(5)) then
            a = 342240
            return "ice_strike single 48"
        end

    end

    if e.FireNova:IsReady() and t:IsInMeleeRange(10) and (t:DebuffUp(e.FlameShockDebuff)) then
        if o(e.FireNova, nil, nil, not t:IsInMeleeRange(5)) then
            a = 333975
            return "fire_nova single 52"
        end

    end

    if e.EarthElemental:IsCastable() and t:IsInMeleeRange(40) and f() and not T then
        if o(e.EarthElemental, nil) then
            a = 198103
            return "earth_elemental single 56"
        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) and (t:DebuffRefreshable(e.FlameShockDebuff)) then
        if o(e.FlameShock, nil, nil, not t:IsSpellInRange(e.FlameShock)) then
            a = 188389
            return "flame_shock single 44"
        end

    end

    if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (i:BuffDown(e.WindfuryTotemBuff, true) or e.WindfuryTotem:TimeSinceLastCast() > 90) then
        if o(e.WindfuryTotem, nil) then
            a = 8512
            return "windfury_totem single 58"
        end

    end

end

local function F()
    if e.ChainHarvest:IsReady() and t:IsInMeleeRange(40) and u and (i:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if o(e.ChainHarvest, nil, nil, not t:IsSpellInRange(e.ChainHarvest)) then
            a = 320674
            return "chain_harvest aoe 34"
        end

    end

    if (c and i:BuffUp(e.DoomWindsBuff)) then
        if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) then
            if o(e.CrashLightning, nil, nil, not t:IsInRange(8)) then
                a = 187874
                return "crash_lightning aoe 6"
            end

        end

        if e.Sundering:IsReady() and t:IsInMeleeRange(10) and k then
            if o(e.Sundering, nil, nil, not t:IsInRange(11)) then
                a = 197214
                return "sundering aoe 10"
            end

        end

    end

    if e.FireNova:IsReady() and t:IsInMeleeRange(10) and (e.FlameShockDebuff:AuraActiveCount() >= 6 or (e.FlameShockDebuff:AuraActiveCount() >= 4 and e.FlameShockDebuff:AuraActiveCount() >= l)) then
        if o(e.FireNova, nil, nil, not t:IsInMeleeRange(5)) then
            a = 333975
            return "fire_nova aoe 16"
        end

    end

    if e.PrimordialWave:IsReady() and t:IsInMeleeRange(40) and u and (i:BuffDown(e.PrimordialWaveBuff)) then
        if m.CastTargetIf(e.PrimordialWave, w, "min", V, L, not t:IsSpellInRange(e.PrimordialWave), nil, nil) then
            return "primordial_wave aoe 14"
        end

        if V(t) and L(t) then
            if o(e.PrimordialWave, nil, nil, not t:IsSpellInRange(e.PrimordialWave)) then
                a = 326059
                return "primordial_wave aoe 14"
            end

        end

    end

    if (D and i:BuffUp(e.CrashLightningBuff)) then
        if e.Windstrike:IsReady() and t:IsInMeleeRange(10) then
            if o(e.Windstrike, nil, nil, not t:IsSpellInRange(e.Windstrike)) then
                a = 115356
                return "windstrike aoe 2"
            end

        end

        if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) then
            if o(e.Stormstrike, nil, nil, not t:IsSpellInRange(e.Stormstrike)) then
                a = 17364
                return "stormstrike aoe 18"
            end

        end

    end

    if e.LavaLash:IsReady() and t:IsInMeleeRange(10) and (e.LashingFlames:IsAvailable()) then
        if m.CastTargetIf(e.LavaLash, q, "min", x, C, not t:IsSpellInRange(e.LavaLash)) then
            return "lava_lash aoe 26"
        end

        if x(t) and C(t) then
            if o(e.LavaLash, nil, nil, not t:IsSpellInRange(e.LavaLash)) then
                a = 60103
                return "lava_lash aoe 26"
            end

        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) and (t:DebuffDown(e.FlameShockDebuff)) then
        if o(e.FlameShock, nil, nil, not t:IsSpellInRange(e.FlameShock)) then
            a = 188389
            return "flame_shock aoe 22"
        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) and ((not e.Hailstorm:IsAvailable()) and e.FlameShockDebuff:AuraActiveCount() < l and e.FlameShockDebuff:AuraActiveCount() < 6) then
        if m.CastCycle(e.FlameShock, w, R, not t:IsSpellInRange(e.FlameShock)) then
            return "flame_shock aoe 24"
        end

        if R(t) then
            if o(e.FlameShock, nil, nil, not t:IsSpellInRange(e.FlameShock)) then
                a = 188389
                return "flame_shock aoe 24"
            end

        end

    end

    if e.LightningBolt:IsCastable() and t:IsInMeleeRange(40) and ((e.FlameShockDebuff:AuraActiveCount() >= l or e.FlameShockDebuff:AuraActiveCount() >= 4) and i:BuffUp(e.PrimordialWaveBuff) and i:BuffStack(e.MaelstromWeaponBuff) >= 5 and (i:BuffDown(e.SplinteredElementsBuff) or g <= 12)) then
        if o(e.LightningBolt, nil, nil, not t:IsSpellInRange(e.LightningBolt)) then
            a = 188196
            return "lightning_bolt aoe 26"
        end

    end

    if e.FrostShock:IsReady() and t:IsInMeleeRange(40) and (i:BuffUp(e.HailstormBuff)) then
        if o(e.FrostShock, nil, nil, not t:IsSpellInRange(e.FrostShock)) then
            a = 196840
            return "frost_shock aoe 8"
        end

    end

    if e.FaeTransfusion:IsReady() and t:IsInMeleeRange(10) and u and not i:IsMoving() and (e.GroveInvigoration:IsAvailable() or e.FieldofBlossoms:IsAvailable() or _) then
        if o(e.FaeTransfusion, nil, nil, not t:IsInRange(40)) then
            a = 328923
            return "fae_transfusion aoe 4"
        end

    end

    if (i:BuffUp(e.PrimordialWaveBuff) and i:BuffStack(e.MaelstromWeaponBuff) < 5) then
        if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) and (i:BuffDown(e.CrashLightningBuff)) then
            if o(e.CrashLightning, nil, nil, not t:IsInRange(8)) then
                a = 187874
                return "crash_lightning aoe 32"
            end

        end

        if e.Sundering:IsReady() and t:IsInMeleeRange(10) and k then
            if o(e.Sundering, nil, nil, not t:IsInRange(11)) then
                a = 197214
                return "sundering aoe 34"
            end

        end

        if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) then
            if o(e.Stormstrike, nil, nil, not t:IsInMeleeRange(5)) then
                a = 17364
                return "stormstrike aoe 36"
            end

        end

    end

    if e.Sundering:IsReady() and t:IsInMeleeRange(10) and k then
        if o(e.Sundering, nil, nil, not t:IsInRange(11)) then
            a = 197214
            return "sundering aoe 34"
        end

    end

    if e.FireNova:IsReady() and t:IsInMeleeRange(10) and (P >= 4) then
        if o(e.FireNova, nil, nil, not t:IsInMeleeRange(5)) then
            a = 333975
            return "fire_nova aoe 16"
        end

    end

    if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) and (e.CrashingStorm:IsAvailable() or i:BuffDown(e.CrashLightningBuff)) then
        if o(e.CrashLightning, nil, nil, not t:IsInRange(8)) then
            a = 187874
            return "crash_lightning aoe 24"
        end

    end

    if e.LavaLash:IsReady() and t:IsInMeleeRange(10) and (e.LashingFlames:IsAvailable()) then
        if m.CastTargetIf(e.LavaLash, w, "min", x, M, not t:IsSpellInRange(e.LavaLash), nil, nil) then
            return "Lava-Lash aoe 14"
        end

        if x(t) and M(t) then
            if o(e.LavaLash, nil, nil, not t:IsSpellInRange(e.LavaLash)) then
                a = 60103
                return "Lava aoe 24"
            end

        end

    end

    if e.FireNova:IsReady() and t:IsInMeleeRange(10) and (e.FlameShockDebuff:AuraActiveCount() >= 3) then
        if o(e.FireNova, nil, nil, not t:IsInMeleeRange(5)) then
            a = 333975
            return "fire_nova aoe 58"
        end

    end

    if e.VesperTotem:IsReady() and t:IsInMeleeRange(40) then
        if o(e.VesperTotem, nil, nil, not t:IsInRange(40)) then
            a = 324386
            return "vesper_totem aoe 18"
        end

    end

    if e.ChainLightning:IsReady() and t:IsInMeleeRange(40) and (i:BuffUp(e.StormkeeperBuff)) then
        if o(e.ChainLightning, nil, nil, not t:IsSpellInRange(e.ChainLightning)) then
            a = 188443
            return "chain_lightning aoe 22"
        end

    end

    if e.LavaLash:IsReady() and t:IsInMeleeRange(10) and (i:BuffUp(e.CrashLightningBuff)) then
        if o(e.LavaLash, nil, nil, not t:IsInMeleeRange(5)) then
            a = 60103
            return "lava_lash aoe 28"
        end

    end

    if (i:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if e.ElementalBlast:IsReady() and t:IsInMeleeRange(40) then
            if o(e.ElementalBlast, nil, nil, not t:IsSpellInRange(e.ElementalBlast)) then
                a = 117014
                return "elemental_blast aoe 36"
            end

        end

        if e.Stormkeeper:IsCastable() and not i:IsMoving() and t:IsInMeleeRange(40) then
            if o(e.Stormkeeper) then
                a = 188443
                return "stormkeeper aoe 38"
            end

        end

    end

    if e.ChainLightning:IsReady() and t:IsInMeleeRange(40) and (i:BuffStack(e.MaelstromWeaponBuff) == 10) then
        if o(e.ChainLightning, nil, nil, not t:IsSpellInRange(e.ChainLightning)) then
            a = 188443
            return "chain_lightning aoe 56"
        end

    end

    if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) and (i:BuffUp(e.CrashLightningBuff)) then
        if o(e.Stormstrike, nil, nil, not t:IsInMeleeRange(5)) then
            a = 17364
            return "stormstrike aoe 30"
        end

    end

    if e.FireNova:IsReady() and t:IsInMeleeRange(10) and (e.FlameShockDebuff:AuraActiveCount() >= 2) then
        if o(e.FireNova, nil, nil, not t:IsInMeleeRange(5)) then
            a = 333975
            return "fire_nova aoe 58"
        end

    end

    if e.CrashLightning:IsReady() and t:IsInMeleeRange(10) then
        if o(e.CrashLightning, nil, nil, not t:IsInRange(8)) then
            a = 187874
            return "crash_lightning aoe 32"
        end

    end

    if e.Windstrike:IsReady() and t:IsInMeleeRange(10) then
        if o(e.Windstrike, nil, nil, not t:IsSpellInRange(e.Windstrike)) then
            a = 115356
            return "windstrike aoe 42"
        end

    end

    if e.Stormstrike:IsReady() and t:IsInMeleeRange(10) then
        if o(e.Stormstrike, nil, nil, not t:IsSpellInRange(e.Stormstrike)) then
            a = 17364
            return "stormstrike aoe 44"
        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) and t:DebuffRefreshable(e.FlameShock) then
        if o(e.FlameShock, nil, nil, not t:IsSpellInRange(e.FlameShock)) then
            a = 188389
            return "flame_shock aoe 48"
        end

    end

    if e.FlameShock:IsReady() and t:IsInMeleeRange(40) then
        if m.CastCycle(e.FlameShock, w, R, not t:IsSpellInRange(e.FlameShock)) then
            return "flame_shock aoe 48"
        end

    end

    if e.FaeTransfusion:IsReady() and t:IsInMeleeRange(10) and u and not i:IsMoving() then
        if o(e.FaeTransfusion, nil, nil, not t:IsInRange(40)) then
            a = 328923
            return "fae_transfusion aoe 50"
        end

    end

    if e.FrostShock:IsReady() and t:IsInMeleeRange(40) then
        if o(e.FrostShock, nil, nil, not t:IsSpellInRange(e.FrostShock)) then
            a = 196840
            return "frost_shock aoe 52"
        end

    end

    if e.ChainLightning:IsReady() and t:IsInMeleeRange(40) and (i:BuffStack(e.MaelstromWeaponBuff) >= 5) then
        if o(e.ChainLightning, nil, nil, not t:IsSpellInRange(e.ChainLightning)) then
            a = 188443
            return "chain_lightning aoe 56"
        end

    end

    if e.EarthenSpike:IsReady() and t:IsInMeleeRange(10) then
        if o(e.EarthenSpike, nil, nil, not t:IsSpellInRange(e.EarthenSpike)) then
            a = 188089
            return "earthen_spike aoe 60"
        end

    end

    if e.EarthElemental:IsCastable() and t:IsInMeleeRange(40) and f() and not T then
        if o(e.EarthElemental, nil) then
            a = 198103
            return "earth_elemental aoe 62"
        end

    end

    if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (i:BuffDown(e.WindfuryTotemBuff, true) or e.WindfuryTotem:TimeSinceLastCast() > 90) then
        if o(e.WindfuryTotem, nil) then
            a = 8512
            return "windfury_totem aoe 64"
        end

    end

end

local function x()
    j = HeroRotationCharDB.Toggles[6]
    u = HeroRotationCharDB.Toggles[4]
    k = HeroRotationCharDB.Toggles[5]
    p = HeroRotationCharDB.Toggles[12]
    Y = HeroRotationCharDB.Toggles[15]
    ie = HeroRotationCharDB.Toggles[60]
    f = h.CDsON
    T = HeroRotationCharDB.Toggles[90]
    A = HeroRotationCharDB.Toggles[91]
    E = HeroRotationCharDB.Toggles[92]
    H = HeroRotationCharDB.Toggles[93]
    S = HeroRotationCharDB.Toggles[94]
    N = HeroRotationCharDB.Toggles[96]
    O = HeroRotationCharDB.Toggles[95]
    W = HeroRotationCharDB.Toggles[97]
    G = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                G = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

    b = GetInventoryItemID("player", 13)
    y = GetInventoryItemID("player", 14)
            if not s.Commons.Enabled.TopTrinket and not s.Commons.Enabled.BotTrinket then
        z = { b, y, n.CacheofAcquiredTreasures:ID(), n.ScarsofFraternalStrife:ID(), n.TheFirstSigil:ID() }
    elseif not s.Commons.Enabled.TopTrinket and s.Commons.Enabled.BotTrinket then
        z = { b, n.CacheofAcquiredTreasures:ID(), n.ScarsofFraternalStrife:ID(), n.TheFirstSigil:ID() }
    elseif not s.Commons.Enabled.BotTrinket and s.Commons.Enabled.TopTrinket then
        z = { y, n.CacheofAcquiredTreasures:ID(), n.ScarsofFraternalStrife:ID(), n.TheFirstSigil:ID() }
    end

end

local function k()
    K, X, B, B, Q, Z = ae()
    if te() then
        w = i:GetEnemiesInRange(40)
        J = #w
        q = i:GetEnemiesInMeleeRange(10)
        l = #q
    else
        w = {  }
        J = 1
        q = {  }
        l = 1
    end

    g = v.FightRemains(q, false)
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
    if h.QueuedCast() then
        a = h.QueuedCast()
        return "Custom Queue " .. I(a):ID()
    end

    if i:IsChanneling(e.FaeTransfusion) then
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

        if s.Enhancement.PreferEarthShield and e.EarthShield:IsCastable() and e.EarthShield:IsAvailable() and (i:BuffDown(e.EarthShield) or (not i:AffectingCombat() and i:BuffStack(e.EarthShield) < 5)) then
        if o(e.EarthShield, nil) then
            a = 974
            return "Earth Shield Refresh"
        end

    elseif e.LightningShield:IsCastable() and i:BuffDown(e.LightningShield) and (s.Enhancement.PreferEarthShield and i:BuffDown(e.EarthShield) or not s.Enhancement.PreferEarthShield) then
        if o(e.LightningShield, nil) then
            a = 192106
            return "Lightning Shield Refresh"
        end

    end

    if (not K or X < 600000) and e.WindfuryWeapon:IsCastable() then
        if o(e.WindfuryWeapon) then
            a = 33757
            return "WindfuryWeapon enchant"
        end

    end

    if ((not Q) or Z < 600000) and e.FlamentongueWeapon:IsCastable() then
        if o(e.FlamentongueWeapon) then
            a = 318038
            return "FlamentongueWeapon enchant"
        end

    end

    if not i:AffectingCombat() and m.TargetIsValid() and j then
        local e = U()
        if e then
            return e
        end

    end

    if i:IsChanneling() or i:IsChanneling(e.FaeTransfusion) then
        if o(e.Pool, nil) then
            a = 99999
            return "Trinket Channel"
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.FrostShock:IsCastable() then
            if o(e.FrostShock, nil) then
                r = 1196840
                return "explosive MO FS"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.FrostShock:IsCastable() then
            if o(e.FrostShock, nil) then
                a = 196840
                return "explosive  FS"
            end

        end

    end

        if (A and e.CapacitorTotem:IsUsableP() and e.CapacitorTotem:CooldownRemains(BypassRecovery) <= 0) then
        if h.Cast(e.CapacitorTotem, nil, nil, nil) then
            a = 1192058
            return "queue CapacitorTotem"
        end

    elseif ((not e.CapacitorTotem:IsUsableP() or e.CapacitorTotem:CooldownRemains(BypassRecovery) > 0) and A) then
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

        if (H and e.TremorTotem:IsUsableP() and e.TremorTotem:CooldownRemains(BypassRecovery) <= 0) then
        if h.Cast(e.TremorTotem, nil, nil, nil) then
            a = 8143
            return "queue TremorTotem"
        end

    elseif ((not e.TremorTotem:IsUsableP() or e.TremorTotem:CooldownRemains(BypassRecovery) > 0) and H) then
        HeroRotationCharDB.Toggles[93] = not HeroRotationCharDB.Toggles[93]
        h.Print("Tremor Totem Queue is now " .. (HeroRotationCharDB.Toggles[93] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (S and e.WindRushTotem:IsUsableP() and e.WindRushTotem:CooldownRemains(BypassRecovery) <= 0) then
        if h.Cast(e.WindRushTotem, nil, nil, nil) then
            a = 192077
            return "queue WindRushTotem"
        end

    elseif ((not e.WindRushTotem:IsUsableP() or e.WindRushTotem:CooldownRemains(BypassRecovery) > 0) and S) then
        HeroRotationCharDB.Toggles[94] = not HeroRotationCharDB.Toggles[94]
        h.Print("Wind Rush Totem Queue is now " .. (HeroRotationCharDB.Toggles[94] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (N and e.FaeTransfusion:IsUsableP() and e.FaeTransfusion:CooldownRemains(BypassRecovery) <= 0 and e.FaeTransfusion:IsAvailable()) then
        if o(e.FaeTransfusion, nil) then
            a = 328923
            return "FaeTransfusion 1"
        end

    elseif ((not e.FaeTransfusion:IsUsableP() or e.FaeTransfusion:CooldownRemains(BypassRecovery) > 0 or not e.FaeTransfusion:IsAvailable()) and N) then
        HeroRotationCharDB.Toggles[96] = not HeroRotationCharDB.Toggles[96]
        h.Print("Fae Transfusion Queue is now" .. (HeroRotationCharDB.Toggles[96] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (O and e.Hex:IsUsableP() and e.Hex:CooldownRemains(BypassRecovery) <= 0 and UnitExists("mouseover")) then
        if h.Cast(e.Hex, nil, nil, nil) then
            if UnitExists("mouseover") and d("mouseover"):IsInRange(40) then
                r = 151514
                return "queue Hex MO"
            end

        end

    elseif ((not e.Hex:IsUsableP() or e.Hex:CooldownRemains() > 0) and O) then
        HeroRotationCharDB.Toggles[95] = not HeroRotationCharDB.Toggles[95]
        h.Print("Hex Queue is now " .. (HeroRotationCharDB.Toggles[95] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if not i:AffectingCombat() and m.TargetIsValid() and j then
        local e = U()
        if e then
            return e
        end

    end

    for i = 1, 25 do
        local n, n, n, i = UnitBuff("target", i)
        if i ~= nil and i == "Magic" then
            if e.Purge:IsCastable() and W and t:IsInRange(20) then
                if o(e.Purge, nil) then
                    a = 370
                    return "Purge"
                end

            end

        end

    end

    for t = 0, 40 do
        local a, a, a, t, a, a, a, a, a, a = UnitDebuff("mouseover", t)
        if e.CleanseSpirit:IsCastable() and UnitIsDead("mouseover") ~= true and UnitCanAttack("player", "mouseover") ~= true and IsItemInRange(34471, "mouseover") and ((t == "Curse")) then
            if o(e.CleanseSpirit, nil) then
                r = 151886
                return "Cleanse Spirit MO"
            end

        end

    end

    if m.TargetIsValid() and (i:AffectingCombat() or j) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326 or t:NPCID() == 176581 or t:NPCID() == 176920 or t:NPCID() == 177892 or t:NPCID() == 182778 or t:NPCID() == 185402 or t:NPCID() == 183945 or t:NPCID() == 182074 or t:NPCID() == 184737 or t:NPCID() == 179733 or t:NPCID() == 115402 or t:NPCID() == 115406 or t:NPCID() == 115395 or UnitExists("boss1") or t:NPCID() == 115388 or j) and not i:IsDeadOrGhost() then
        local w = 0
        local m = 0
                if GetNumGroupMembers() > 0 then
            if UnitInParty("player") then
                for e = 1, GetNumGroupMembers() do
                    if UnitExists("party" .. e) then
                        m = m + UnitHealth("party" .. e)
                        w = w + UnitHealthMax("party" .. e)
                    end

                end

            end

            if UnitInRaid("player") then
                for e = 1, GetNumGroupMembers() do
                    if UnitExists("raid" .. e) then
                        m = m + UnitHealth("raid" .. e)
                        w = w + UnitHealthMax("raid" .. e)
                    end

                end

            end

        elseif GetNumGroupMembers() == 0 then
            m = UnitHealth("player")
            w = UnitHealthMax("player")
        end

        if i:HealthPercentage() < s.Enhancement.HealthstoneHP and n.Healthstone:IsReady() and n.Healthstone:CooldownRemains() <= 0 then
            if o(n.Healthstone, nil) then
                a = 40
                return "Healthstone HP"
            end

        end

        if i:HealthPercentage() < s.Enhancement.HealPotHP and n.CosmicHealPot:IsReady() and n.CosmicHealPot:CooldownRemains() <= 0 then
            if o(n.CosmicHealPot, nil) then
                a = 45
                return "CosmicHealPot HP"
            end

        end

        if i:HealthPercentage() < s.Enhancement.HealPotHP and n.HealPot:IsReady() and n.HealPot:CooldownRemains() <= 0 then
            if o(n.HealPot, nil) then
                a = 41
                return "HealPot HP"
            end

        end

        if i:HealthPercentage() < s.Enhancement.PhialHP and n.PhialofSerenity:IsReady() and n.PhialofSerenity:CooldownRemains() <= 0 then
            if o(n.PhialofSerenity, nil) then
                a = 55
                return "PhialofSerenity HP"
            end

        end

        if ((m / w) * 100) <= s.Enhancement.FaeTransfusionHealHP and i:BuffUp(I(328933)) then
            if o(e.FaeTransfusion, nil) then
                a = 328923
                return "FaeTransfusion Heal"
            end

        end

        if i:HealthPercentage() < s.Enhancement.AstralShiftHP and e.AstralShift:IsAvailable() and e.AstralShift:IsReady() then
            if o(e.AstralShift) then
                a = 108271
                return "AstralShift HP"
            end

        end

        if i:HealthPercentage() < s.Enhancement.HealingSurgeHP and e.HealingSurge:IsReady() and (not i:IsMoving() or i:BuffUp(e.MaelstromWeaponBuff)) then
            if o(e.HealingSurge) then
                a = 8004
                return "HealingSurge HP"
            end

        end

        if UnitInParty("player") and s.Enhancement.HealingSurgePartyHP > 0 and i:BuffUp(e.MaelstromWeaponBuff) and e.HealingSurge:IsReady() then
                                                if UnitExists("party1") and not d("party1"):IsDeadOrGhost() and d("party1"):HealthPercentage() < s.Enhancement.HealingSurgePartyHP then
                if o(e.HealingSurge) then
                    a = 18004
                    return "HealingSurge party 1 HP"
                end

            elseif UnitExists("party2") and not d("party2"):IsDeadOrGhost() and d("party2"):HealthPercentage() < s.Enhancement.HealingSurgePartyHP then
                if o(e.HealingSurge) then
                    a = 28004
                    return "HealingSurge party 2 HP"
                end

            elseif UnitExists("party3") and not d("party3"):IsDeadOrGhost() and d("party3"):HealthPercentage() < s.Enhancement.HealingSurgePartyHP then
                if o(e.HealingSurge) then
                    a = 38004
                    return "HealingSurge party 3 HP"
                end

            elseif UnitExists("party4") and not d("party4"):IsDeadOrGhost() and d("party4"):HealthPercentage() < s.Enhancement.HealingSurgePartyHP then
                if o(e.HealingSurge) then
                    a = 48004
                    return "HealingSurge party 4 HP"
                end

            end

        end

        if not t:IsInMeleeRange(10) and l > 0 and s.Enhancement.TargetSwap == "AutoSwap" and not p then
            r = 999
        end

        if n.PotionofSpectralAgility:IsReady() and f() and s.Commons.Enabled.Potions and Y then
            if o(n.PotionofSpectralAgility, nil, nil) then
                a = 50
                return "potion default 4"
            end

        end

        if ((s.Commons.Enabled.TopTrinket or s.Commons.Enabled.BottomTrinket) and f() and t:IsInMeleeRange(10)) then
            if n.TheFirstSigil:IsEquippedAndReady() and ((e.Ascendance:IsAvailable() and e.Ascendance:CooldownRemains() < 10) or (e.HotHand:IsAvailable() and i:BuffUp(e.MoltenWeaponBuff)) or i:BuffUp(e.IcyEdgeBuff) or (e.Stormflurry:IsAvailable() and i:BuffUp(e.CracklingSurgeBuff)) or t:DebuffUp(e.EarthenSpike) or l > 1 or g < 30) then
                if o(n.TheFirstSigil, nil, nil) then
                                        if n.TheFirstSigil:ID() == b and s.Commons.Enabled.TopTrinket then
                        a = 24
                        return "top trinket 1"
                    elseif n.TheFirstSigil:ID() == y and s.Commons.Enabled.BottomTrinket then
                        a = 30
                        return "Bot trinket 2"
                    end

                end

            end

            if n.CacheofAcquiredTreasures:IsEquippedAndReady() and (i:BuffUp(e.AcquiredSwordBuff) or g < 25) then
                if o(n.CacheofAcquiredTreasures, nil, nil) then
                                        if n.CacheofAcquiredTreasures:ID() == b and s.Commons.Enabled.TopTrinket then
                        a = 24
                        return "top trinket 1"
                    elseif n.CacheofAcquiredTreasures:ID() == y and s.Commons.Enabled.BottomTrinket then
                        a = 30
                        return "Bot trinket 2"
                    end

                end

            end

            if n.ScarsofFraternalStrife:IsEquippedAndReady() and (i:BuffDown(e.ScarsofFraternalStrifeBuff4) or g < 31 or l > 1) then
                if o(n.ScarsofFraternalStrife, nil, nil) then
                                        if n.ScarsofFraternalStrife:ID() == b and s.Commons.Enabled.TopTrinket then
                        a = 24
                        return "top trinket 1"
                    elseif n.ScarsofFraternalStrife:ID() == y and s.Commons.Enabled.BottomTrinket then
                        a = 30
                        return "Bot trinket 2"
                    end

                end

            end

            local e = i:GetUseableTrinkets(z)
            if e then
                if o(e, nil, nil) then
                                        if e:ID() == b and s.Commons.Enabled.TopTrinket then
                        a = 24
                        return "top trinket 1"
                    elseif e:ID() == y and s.Commons.Enabled.BottomTrinket then
                        a = 30
                        return "Bot trinket 2"
                    end

                end

            end

        end

        if (f() and t:IsInMeleeRange(10)) then
            if e.BloodFury:IsCastable() and t:IsInRange(8) and (not e.Ascendance:IsAvailable() or i:BuffUp(e.AscendanceBuff) or e.Ascendance:CooldownRemains() > 50) then
                if h.Cast(e.BloodFury, nil) then
                    a = 20572
                    return "Blood Fury 420"
                end

            end

            if e.Berserking:IsCastable() and t:IsInRange(8) and (not e.Ascendance:IsAvailable() or i:BuffUp(e.AscendanceBuff)) then
                if h.Cast(e.Berserking, nil) then
                    a = 26297
                    return "Berserking 422"
                end

            end

            if e.AncestralCall:IsCastable() and t:IsInRange(8) and (not e.Ascendance:IsAvailable() or i:BuffUp(e.AscendanceBuff) or e.Ascendance:CooldownRemains() > 50) then
                if h.Cast(e.AncestralCall, nil) then
                    a = 274738
                    return "Ancestral Call 428"
                end

            end

            if e.Fireblood:IsCastable() and t:IsInRange(8) and (not e.Ascendance:IsAvailable() or i:BuffUp(e.AscendanceBuff) or e.Ascendance:CooldownRemains() > 50) then
                if h.Cast(e.Fireblood, nil) then
                    a = 265221
                    return "Fireblood 426"
                end

            end

            if e.BagofTricks:IsCastable() and t:IsInRange(8) and (not e.Ascendance:IsAvailable() or not i:BuffUp(e.AscendanceBuff)) then
                if h.Cast(e.BagofTricks, nil, nil, not t:IsInRange(40)) then
                    a = 312411
                    return "Bag of Tricks 430"
                end

            end

        end

        if e.FeralSpirit:IsCastable() and t:IsInRange(40) and f() then
            if o(e.FeralSpirit, nil) then
                a = 51533
                return "feral_spirit default 6"
            end

        end

        if e.FaeTransfusion:IsReady() and t:IsInMeleeRange(10) and not i:IsMoving() and u and ((e.Ascendance:IsAvailable() or c) and (e.GroveInvigoration:IsAvailable() or e.FieldofBlossoms:IsAvailable() or l == 1)) then
            if o(e.FaeTransfusion, nil, nil, not t:IsInRange(40)) then
                a = 328923
                return "fae_transfusion default 8"
            end

        end

        if e.Ascendance:IsCastable() and t:IsInMeleeRange(10) and f() then
            if o(e.Ascendance, nil) then
                a = 114051
                return "ascendance default 10"
            end

        end

        if e.WindfuryTotem:IsReady() and t:IsInMeleeRange(15) and (c and i:BuffDown(e.DoomWindsBuff) and e.WindfuryTotem:TimeSinceLastCast() > 60) then
            if o(e.WindfuryTotem, nil) then
                a = 8512
                return "windfury_totem default 12"
            end

        end

        if l < 2 then
            local e = ee()
            if e then
                return e
            end

        end

        if l > 1 then
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

