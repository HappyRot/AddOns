local e, e = ...
local e = HeroDBC.DBC
local z = HeroLib
local e = HeroCache
local _ = z.Unit
local a = _.Player
local t = _.Target
local e = _.Pet
local I = z.Spell
local d = z.Item
local s = HeroRotation
local Z = s.AoEON
local e = s.CDsON
local A = HeroRotationCharDB.Toggles[4]
local ee = HeroRotationCharDB.Toggles[5]
local se = HeroRotationCharDB.Toggles[6]
local Y = HeroRotationCharDB.Toggles[12]
local oe = not HeroRotationCharDB.Toggles[15]
local m = HeroRotationCharDB.Toggles[40]
local ae = HeroRotationCharDB.Toggles[42]
local M = HeroRotationCharDB.Toggles[43]
local C = HeroRotationCharDB.Toggles[41]
local W = HeroRotationCharDB.Toggles[45]
local X = HeroRotationCharDB.Toggles[46]
local L = HeroRotationCharDB.Toggles[47]
local K = HeroRotationCharDB.Toggles[48]
local Q = HeroRotationCharDB.Toggles[49]
local ne = HeroRotationCharDB.Toggles[44]
local b = false
local F = false
local g = false
local v = false
local J = GetInventoryItemID("player", 13)
local te = GetInventoryItemID("player", 14)
local f = 0
local i = s.Cast
local e = s.CastSuggested
local e = string.match
local e = I.DemonHunter.Havoc
local h = d.DemonHunter.Havoc
local U = { h.CacheofAcquiredTreasures }
local q = a:GetEquipment()
local u = d(0)
local c = d(0)
if q[13] then
    u = d(q[13])
end

if q[14] then
    c = d(q[14])
end

local o
local x, ie
local r, D
local R = a:HasLegendaryEquipped(20)
local G = a:HasLegendaryEquipped(23)
local w = a:HasLegendaryEquipped(25)
local E = a:HasLegendaryEquipped(236) or (a:HasUnity() and e.SinfulBrand:IsAvailable())
local T = s.Commons.Everyone
local n = { General = s.GUISettings.General, Commons = s.GUISettings.APL.DemonHunter.Commons, Havoc = s.GUISettings.APL.DemonHunter.Havoc }
local o = { { e.FelEruption, "Cast Fel Eruption (Interrupt)", function()
    return true
end }, { e.ChaosNova, "Cast Chaos Nova (Interrupt)", function()
    return true
end } }
local o = 0
local l = 0
local B = false
local H = false
local y = false
local O = false
local P = false
local re = false
local j = false
local S = false
local k = 0
local V = false
local N = 11111
local p = 11111
local he = a:CovenantID()
z:RegisterForEvent(function()
    he = a:CovenantID()
end, "COVENANT_CHOSEN")
z:RegisterForEvent(function()
    H = false
    y = false
    O = false
    P = false
    re = false
    j = false
    S = false
    N = 11111
    p = 11111
end, "PLAYER_REGEN_ENABLED")
z:RegisterForEvent(function()
    q = a:GetEquipment()
    u = d(0)
    c = d(0)
    if q[13] then
        u = d(q[13])
    end

    if q[14] then
        c = d(q[14])
    end

    R = a:HasLegendaryEquipped(20)
    G = a:HasLegendaryEquipped(23)
    w = a:HasLegendaryEquipped(25)
    E = a:HasLegendaryEquipped(236) or (a:HasUnity() and e.SinfulBrand:IsAvailable())
end, "PLAYER_EQUIPMENT_CHANGED")
local function N(e)
    if e then
        return 1
    else
        return 0
    end

end

local function d(e)
    return e ~= 0
end

local function we(e)
    local t = 0
    if e ~= nil then
        for a in pairs(e) do
            local e = e[a]
            if e:NPCID() == 169421 or e:NPCID() == 169425 or e:NPCID() == 168932 or e:NPCID() == 169426 or e:NPCID() == 169429 or e:NPCID() == 169428 or e:NPCID() == 169430 then
                t = t + 1
            end

        end

    end

    return t
end

local function d(o)
        if e.Felblade:TimeSinceLastCast() <= a:GCD() then
        return true
    elseif ((e.VengefulRetreat:TimeSinceLastCast() < 1. and e.VengefulRetreat:TimeSinceLastCast() > .25) or e.FelRush:TimeSinceLastCast() < 1.) then
        return false
    end

    return o and t:IsInMeleeRange(o) or t:IsInMeleeRange(5)
end

local function q()
    return true
end

local function ye(a)
    local t = 0
    if a ~= nil then
        for o in pairs(a) do
            local a = a[o]
            if a:DebuffDown(e.BurningWoundDebuff) then
                t = t + 1
            end

        end

    end

    return t
end

local function fe(t)
    local a = 0
    if t ~= nil then
        for o in pairs(t) do
            local t = t[o]
            if t:DebuffDown(e.SadisticGleeDebuff) then
                a = a + 1
            end

        end

    end

    return a
end

local function re(t)
    return t:DebuffRemains(e.BurningWoundDebuff)
end

local function he(a)
                if (w and a:DebuffRemains(e.BurningWoundDebuff) < 4 and a:IsInRange(8) and a:GUID() == _("mouseover"):GUID()) then
        if (e.DemonBlades:IsAvailable()) then
            l = 1111
        else
            l = 111
        end

        return true
    elseif (w and a:DebuffRemains(e.BurningWoundDebuff) < 4 and a:IsInRange(8) and n.Havoc.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not Y) then
        l = 999
        return true
    elseif (w and a:DebuffRemains(e.BurningWoundDebuff) < 4 and a:IsInRange(8) and a:GUID() == t:GUID() and t:IsInRange(8)) then
        o = 162243
        return true
    elseif (w and a:DebuffRemains(e.BurningWoundDebuff) < 4 and a:IsInRange(8)) then
        return true
    end

end

local function de(t)
    return t:DebuffRemains(e.BurningWoundDebuff)
end

local function me(a)
                if (w and a:DebuffRemains(e.BurningWoundDebuff) < 4 and a:IsInRange(8) and a:GUID() == _("mouseover"):GUID()) then
        if (e.DemonBlades:IsAvailable()) then
            l = 1111
        else
            l = 111
        end

        return true
    elseif (w and a:DebuffRemains(e.BurningWoundDebuff) < 4 and a:IsInRange(8) and n.Havoc.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not Y) then
        l = 999
        return true
    elseif (w and a:DebuffRemains(e.BurningWoundDebuff) < 4 and a:IsInRange(8) and a:GUID() == t:GUID()) then
        o = 162243
        return true
    elseif (w and a:DebuffRemains(e.BurningWoundDebuff) < 4 and a:IsInRange(8)) then
        return true
    end

end

local function ce()
    if not t:IsInMeleeRange(5) and e.VengefulRetreat:TimeSinceLastCast() > .75 and not m and t:IsInRange(15) and e.FelRush:IsCastable() and b then
        if i(e.FelRush, nil, nil, not t:IsInRange(15)) then
            o = 195072
            return "fel_rush precombat 2"
        end

    end

    if t:IsInMeleeRange(5) and (e.DemonsBite:IsCastable() or e.DemonBlades:IsAvailable()) then
        if (e.DemonBlades:IsAvailable() and IsCurrentSpell(6603) ~= true) then
            if i(e.DemonsBite, nil, nil, not t:IsInMeleeRange(5)) then
                o = 1162243
                return "demons_bite or demon_blades precombat 4"
            end

        else
            if i(e.DemonsBite, nil, nil, not t:IsInMeleeRange(5)) then
                o = 162243
                return "demons_bite or demon_blades precombat 4"
            end

        end

    end

end

local function le()
    if e.Metamorphosis:IsCastable() and g and t:IsInRange(8) and (not e.Demonic:IsAvailable() and ((e.EyeBeam:CooldownRemains() > 20 or not v) or p < 25)) then
        if s.CastAnnotated(e.Metamorphosis, nil, "AWAY") then
            o = 191427
            return "metamorphosis cooldown 2"
        end

    end

    if e.Metamorphosis:IsCastable() and g and t:IsInRange(8) and (e.Demonic:IsAvailable() and ((e.EyeBeam:CooldownRemains() > 20 or not v) and ((not y) or (e.BladeDance:CooldownRemains() > a:GCD() + .5) or p < 25))) then
        if i(e.Metamorphosis, nil, nil, not t:IsInRange(40)) then
            o = 191427
            return "metamorphosis cooldown 4"
        end

    end

    if (h.PotionofPhantomFire:IsReady() or h.PotionofSpectralAgility:IsReady()) and t:IsInMeleeRange(8) and s.CDsON() and oe and n.Commons.Enabled.Potions and (((a:BuffRemains(e.MetamorphosisBuff) > 25 or p < 60) and not s.GUISettings.General.HoldPotforBL) or (s.GUISettings.General.HoldPotforBL and a:BloodlustUp())) then
        if i(h.PotionofPhantomFire, nil, nil) then
            o = 4
            return "potion cooldown 6"
        end

    end

    local d = a:GetUseableTrinkets(U)
    if h.CacheofAcquiredTreasures:IsEquippedAndReady() and s.CDsON() and (a:BuffUp(e.AcquiredAxeBuff) and ((r >= 1) and (r < 3 or e.EyeBeam:CooldownRemains() < 20) or p < 25)) then
        if i(h.CacheofAcquiredTreasures, nil, nil) then
                        if h.CacheofAcquiredTreasures:ID() == GetInventoryItemID("player", 13) and (n.Commons.Enabled.TopTrinket) then
                o = 20
                return "cache_of_acquired_treasures cooldown 7"
            elseif h.CacheofAcquiredTreasures:ID() == GetInventoryItemID("player", 14) and (n.Commons.Enabled.BottomTrinket) then
                o = 25
                return "cache_of_acquired_treasures cooldown 7"
            end

        end

    end

    if u:IsReady() and u:ID() ~= h.CacheofAcquiredTreasures:ID() and t:IsInRange(10) and (n.Commons.Enabled.TopTrinket) and s.CDsON() and (k == 1 and (a:BuffUp(e.MetamorphosisBuff) or ((not e.Demonic:IsAvailable()) and e.Metamorphosis:CooldownRemains() > ((p > u:Cooldown() / 2) and p or u:Cooldown() / 2)) or p <= 20) or (k == 2 and not c:IsReady()) or k == 0) then
        if d then
            if i(u, nil, nil) then
                                if u:ID() == GetInventoryItemID("player", 13) and (n.Commons.Enabled.TopTrinket) then
                    o = 20
                    return "top trinket 1"
                elseif u:ID() == GetInventoryItemID("player", 14) and (n.Commons.Enabled.BottomTrinket) then
                    o = 25
                    return "bot trinket 1"
                end

            end

        end

    end

    if c:IsReady() and c:ID() ~= h.CacheofAcquiredTreasures:ID() and t:IsInRange(10) and (n.Commons.Enabled.BottomTrinket) and s.CDsON() and (k == 2 and (a:BuffUp(e.MetamorphosisBuff) or ((not e.Demonic:IsAvailable()) and e.Metamorphosis:CooldownRemains() > ((p > c:Cooldown() / 2) and p or c:Cooldown() / 2)) or p <= 20) or (k == 1 and not u:IsReady()) or k == 0) then
        if d then
            if i(c, nil, nil) then
                                if c:ID() == GetInventoryItemID("player", 13) and (n.Commons.Enabled.TopTrinket) then
                    o = 20
                    return "top trinket 1"
                elseif c:ID() == GetInventoryItemID("player", 14) and (n.Commons.Enabled.BottomTrinket) then
                    o = 25
                    return "bot trinket 1"
                end

            end

        end

    end

    if e.SinfulBrand:IsCastable() and t:IsInMeleeRange(30) and A and t:NPCID() ~= 185683 and t:NPCID() ~= 185685 and t:NPCID() ~= 185680 and (t:DebuffDown(e.SinfulBrandDebuff) and ((not E) or (e.EyeBeam:CooldownRemains() <= a:GCD() and a:Fury() >= 30)) and (e.Metamorphosis:CooldownDown() or r == 1 or not g)) then
        if i(e.SinfulBrand, nil, nil, not t:IsSpellInRange(e.SinfulBrand)) then
            o = 317009
            return "sinful_brand cooldown 12"
        end

    end

    if e.TheHunt:IsCastable() and not a:IsMoving() and (f == 0 or f > e.TheHunt:CastTime()) and t:IsInRange(40) and A and (((not j) and (not H)) or a:BuffUp(e.FuriousGazeBuff)) then
        if i(e.TheHunt, nil, nil, not t:IsSpellInRange(e.TheHunt)) then
            o = 323639
            return "the_hunt cooldown 14"
        end

    end

    if e.ElysianDecree:IsCastable() and t:IsInRange(30) and A and (r > 0) then
        if i(e.ElysianDecree, nil, nil, not t:IsInRange(30)) then
            o = 306830
            return "elysian_decree cooldown 16"
        end

    end

end

local function ue()
    if e.EyeBeam:IsReady() and not a:IsMoving() and (f == 0 or f > e.EyeBeam:ExecuteTime()) and v and not t:IsCasting(I(355806)) and t:IsInMeleeRange(10) and e.VengefulRetreat:TimeSinceLastCast() >= 1 and (E and r > 1 and t:DebuffUp(e.SinfulBrandDebuff) and t:DebuffRemains(e.SinfulBrandDebuff) <= a:GCD()) then
        if i(e.EyeBeam, nil, nil, not t:IsInRange(20)) then
            o = 198013
            return "eye_beam demonic 1"
        end

    end

    if e.FelRush:IsCastable() and t:IsInRange(15) and e.VengefulRetreat:TimeSinceLastCast() > .75 and not m and (e.UnboundChaos:IsAvailable() and a:BuffUp(e.UnboundChaosBuff) and e.FelRush:Charges() == 2) and b then
        if i(e.FelRush, nil, nil) then
            o = 195072
            return "fel_rush demonic 2"
        end

    end

    if e.DeathSweep:IsReady() and e.VengefulRetreat:TimeSinceLastCast() >= 1 and t:IsInMeleeRange(8) and (y) then
        if i(e.DeathSweep, nil, nil, not d(8)) then
            o = 210152
            return "death_sweep demonic 4"
        end

    end

    if e.GlaiveTempest:IsReady() and t:IsInMeleeRange(8) and (r > 0) then
        if i(e.GlaiveTempest, nil, nil, not t:IsInMeleeRange(8)) then
            o = 342817
            return "glaive_tempest demonic 6"
        end

    end

    if e.ThrowGlaive:IsCastable() and t:IsInMeleeRange(n.Commons.ThrowGlaiveRange) and e.VengefulRetreat:TimeSinceLastCast() > 1 and (e.SerratedGlaive:ConduitEnabled() and e.EyeBeam:CooldownRemains() < 6 and a:BuffDown(e.MetamorphosisBuff) and t:DebuffDown(e.ExposedWoundDebuff)) then
        if i(e.ThrowGlaive, nil, nil, not t:IsSpellInRange(e.ThrowGlaive)) then
            o = 185123
            return "throw_glaive demonic 8"
        end

    end

    if e.EyeBeam:IsReady() and not a:IsMoving() and (f == 0 or f > e.EyeBeam:ExecuteTime()) and v and not t:IsCasting(I(355806)) and t:IsInMeleeRange(10) and e.VengefulRetreat:TimeSinceLastCast() >= 1 and (r > 0 and ((not V) or r > 1 or a:Fury() < 70) and not S) then
        if i(e.EyeBeam, nil, nil, not t:IsInRange(20)) then
            o = 198013
            return "eye_beam demonic 10"
        end

    end

    if e.BladeDance:IsReady() and e.VengefulRetreat:TimeSinceLastCast() >= 1 and t:IsInMeleeRange(8) and (y and (not e.Metamorphosis:CooldownUp() or not g) and (e.EyeBeam:CooldownRemains() > 5 or not v)) then
        if i(e.BladeDance, nil, nil, not d(8)) then
            o = 188499
            return "blade_dance demonic 12"
        end

    end

    if e.ImmolationAura:IsCastable() and not ae and e.VengefulRetreat:TimeSinceLastCast() >= 1 and t:IsInMeleeRange(8) and (a:BuffDown(e.ImmolationAuraBuff)) then
        if i(e.ImmolationAura, nil, nil, not d(8)) then
            o = 258920
            return "immolation_aura demonic 14"
        end

    end

    if e.Annihilation:IsReady() and t:IsInRange(8) and t:IsInMeleeRange(8) and (not O) then
        if i(e.Annihilation, nil, nil, not t:IsSpellInRange(e.Annihilation)) then
            o = 201427
            return "annihilation demonic 16"
        end

    end

    if e.Felblade:IsCastable() and not a:IsMoving() and not M and t:IsInRange(n.Commons.FelBladeRange) and (t:IsInRange(8) or not m) and (a:FuryDeficit() >= 40) and (not d() or e.VengefulRetreat:TimeSinceLastCast() >= 1.) then
        if i(e.Felblade, nil, nil, not t:IsSpellInRange(e.Felblade)) then
            o = 183226
            return "felblade demonic 18"
        end

    end

    if e.EssenceBreak:IsCastable() and t:IsInMeleeRange(10) and e.VengefulRetreat:TimeSinceLastCast() > 1 then
        if i(e.EssenceBreak, nil, nil, not d(10)) then
            o = 258860
            return "essence_break demonic 20"
        end

    end

    if e.ChaosStrike:IsReady() and t:IsInMeleeRange(8) and ((not O) and (not P)) then
        if i(e.ChaosStrike, nil, nil, not t:IsSpellInRange(e.ChaosStrike)) then
            o = 162794
            return "chaos_strike demonic 22"
        end

    end

    if e.FelRush:IsCastable() and t:IsInRange(15) and e.VengefulRetreat:TimeSinceLastCast() > .75 and not m and (e.DemonBlades:IsAvailable() and not e.EyeBeam:CooldownUp() and q()) and b then
        if i(e.FelRush, nil, nil) then
            o = 195072
            return "fel_rush demonic 24"
        end

    end

    if e.DemonsBite:IsCastable() or e.DemonBlades:IsAvailable() then
        if w and not e.DemonBlades:IsAvailable() and (t:DebuffRemains(e.BurningWoundDebuff) < 4 or (UnitsWithoutBWCount == 0 or not Z())) then
            if i(e.DemonsBite, nil, nil, not t:IsSpellInRange(e.DemonsBite)) then
                o = 162243
                return "demons_bite 26T"
            end

        end

        if T.CastTargetIf(e.DemonsBite, x, "min", de, me) then
            return "demons_bite demonic 26"
        end

    end

    if e.FelRush:IsCastable() and t:IsInRange(15) and e.VengefulRetreat:TimeSinceLastCast() > .75 and not m and (not e.DemonBlades:IsAvailable() and r > 1 and (e.FelRush:Charges() == 2)) and b then
        if i(e.FelRush, nil, nil) then
            o = 195072
            return "fel_rush demonic 28"
        end

    end

    if e.DemonsBite:IsCastable() and not e.DemonBlades:IsAvailable() and t:IsInMeleeRange(8) and not w then
        if i(e.DemonsBite, nil, nil, not t:IsSpellInRange(e.DemonsBite)) then
            o = 162243
            return "demons_bite demonic 30"
        end

    end

    if e.ThrowGlaive:IsCastable() and t:IsInRange(n.Commons.ThrowGlaiveRange) and (not d()) then
        if i(e.ThrowGlaive, nil, nil, not t:IsSpellInRange(e.ThrowGlaive)) then
            o = 185123
            return "throw_glaive demonic 32"
        end

    end

    if e.FelRush:IsCastable() and t:IsInRange(15) and e.VengefulRetreat:TimeSinceLastCast() > .75 and not m and (not d() and q()) and b then
        if i(e.FelRush, nil, nil) then
            o = 195072
            return "fel_rush demonic 34"
        end

    end

    if e.VengefulRetreat:IsCastable() and e.EyeBeam:TimeSinceLastCast() > 1 and t:IsInRange(5) and F and not m and (not d()) then
        if i(e.VengefulRetreat, nil) then
            o = 198793
            return "vengeful_retreat demonic 36"
        end

    end

    if e.ThrowGlaive:IsCastable() and t:IsInRange(n.Commons.ThrowGlaiveRange) and (e.DemonBlades:IsAvailable()) then
        if i(e.ThrowGlaive, nil, nil, not t:IsSpellInRange(e.ThrowGlaive)) then
            o = 185123
            return "throw_glaive demonic 38"
        end

    end

end

local function de()
    if e.EyeBeam:IsReady() and not a:IsMoving() and (f == 0 or f > e.EyeBeam:ExecuteTime()) and v and not t:IsCasting(I(355806)) and t:IsInMeleeRange(10) and e.VengefulRetreat:TimeSinceLastCast() >= 1 and (E and r > 1 and t:DebuffUp(e.SinfulBrandDebuff) and t:DebuffRemains(e.SinfulBrandDebuff) <= a:GCD()) then
        if i(e.EyeBeam, nil, nil, not t:IsInRange(20)) then
            o = 198013
            return "eye_beam normal 1"
        end

    end

    if e.VengefulRetreat:IsCastable() and e.EyeBeam:TimeSinceLastCast() > 1 and t:IsInRange(5) and F and not m and (e.Momentum:IsAvailable() and a:BuffDown(e.PreparedBuff) and z.CombatTime() > 1) then
        if i(e.VengefulRetreat, nil) then
            o = 198793
            return "vengeful_retreat normal 2"
        end

    end

    if e.FelRush:IsCastable() and t:IsInRange(15) and e.VengefulRetreat:TimeSinceLastCast() > .75 and not m and ((a:BuffUp(e.UnboundChaosBuff) or j and ((not e.UnboundChaos:IsAvailable()) or not e.ImmolationAura:CooldownUp())) and q()) and b then
        if i(e.FelRush, nil, nil) then
            o = 195072
            return "fel_rush demonic 34"
        end

    end

    if e.FelBarrage:IsCastable() and e.VengefulRetreat:TimeSinceLastCast() > 1 and t:IsInMeleeRange(8) and (r > 1) then
        if i(e.FelBarrage, nil, nil, not d(8)) then
            o = 211053
            return "fel_barrage normal 6"
        end

    end

    if e.DeathSweep:IsReady() and e.VengefulRetreat:TimeSinceLastCast() >= 1 and t:IsInMeleeRange(8) and (y) then
        if i(e.DeathSweep, nil, nil, not d(8)) then
            o = 210152
            return "death_sweep normal 8"
        end

    end

    if e.ImmolationAura:IsCastable() and not ae and e.VengefulRetreat:TimeSinceLastCast() >= 1 and t:IsInMeleeRange(8) and (a:BuffDown(e.ImmolationAuraBuff)) then
        if i(e.ImmolationAura, nil, nil, not d(8)) then
            o = 258920
            return "immolation_aura normal 10"
        end

    end

    if e.GlaiveTempest:IsReady() and e.VengefulRetreat:TimeSinceLastCast() > 1 and t:IsInMeleeRange(8) and (not j and r > 0) then
        if i(e.GlaiveTempest, nil) then
            o = 342817
            return "glaive_tempest normal 12"
        end

    end

    if e.ThrowGlaive:IsCastable() and e.VengefulRetreat:TimeSinceLastCast() > 1 and t:IsInRange(n.Commons.ThrowGlaiveRange) and (e.SerratedGlaive:ConduitEnabled() and e.EyeBeam:CooldownRemains() < 6 and a:BuffDown(e.MetamorphosisBuff) and t:DebuffDown(e.ExposedWoundDebuff)) then
        if i(e.ThrowGlaive, nil, nil, not t:IsSpellInRange(e.ThrowGlaive)) then
            o = 185123
            return "throw_glaive normal 14"
        end

    end

    if e.EyeBeam:IsReady() and not a:IsMoving() and (f == 0 or f > e.EyeBeam:ExecuteTime()) and v and not t:IsCasting(I(355806)) and t:IsInMeleeRange(10) and e.VengefulRetreat:TimeSinceLastCast() >= 1 and ((not j) and (D > 0 and ((not V) or r > 1 or a:Fury() < 70) and not S)) then
        if i(e.EyeBeam, nil, nil, not d(20)) then
            o = 198013
            return "eye_beam normal 16"
        end

    end

    if e.BladeDance:IsReady() and e.VengefulRetreat:TimeSinceLastCast() >= 1 and t:IsInMeleeRange(8) and (y) then
        if i(e.BladeDance, nil, nil, not d(8)) then
            o = 188499
            return "blade_dance normal 18"
        end

    end

    if e.Felblade:IsCastable() and not a:IsMoving() and not M and t:IsInRange(n.Commons.FelBladeRange) and (t:IsInRange(8) or not m) and (a:FuryDeficit() >= 40) and (not d() or e.VengefulRetreat:TimeSinceLastCast() >= 1.) then
        if i(e.Felblade, nil, nil, not t:IsSpellInRange(e.Felblade)) then
            o = 183226
            return "felblade normal 20"
        end

    end

    if e.EssenceBreak:IsCastable() and t:IsInMeleeRange(10) and e.VengefulRetreat:TimeSinceLastCast() > 1 then
        if i(e.EssenceBreak, nil, nil, not d(10)) then
            o = 258860
            return "essence_break normal 22"
        end

    end

    if e.Annihilation:IsReady() and e.VengefulRetreat:TimeSinceLastCast() > 1 and t:IsInMeleeRange(8) and ((e.DemonBlades:IsAvailable() or (not j) or a:FuryDeficit() < 30 or a:BuffRemains(e.MetamorphosisBuff) < 5) and not O) then
        if i(e.Annihilation, nil, nil, not t:IsSpellInRange(e.Annihilation)) then
            o = 201427
            return "annihilation normal 24"
        end

    end

    if e.ChaosStrike:IsReady() and e.VengefulRetreat:TimeSinceLastCast() > 1 and t:IsInMeleeRange(8) and ((e.DemonBlades:IsAvailable() or (not j) or a:FuryDeficit() < 30) and (not H) and not O) then
        if i(e.ChaosStrike, nil, nil, not t:IsSpellInRange(e.ChaosStrike)) then
            o = 162794
            return "chaos_strike normal 26"
        end

    end

    if e.EyeBeam:IsReady() and not a:IsMoving() and (f == 0 or f > e.EyeBeam:ExecuteTime()) and v and not t:IsCasting(I(355806)) and t:IsInMeleeRange(10) and (e.BlindFury:IsAvailable() and not S) then
        if i(e.EyeBeam, nil, nil, not t:IsInRange(20)) then
            o = 198013
            return "eye_beam normal 28"
        end

    end

    if (e.DemonsBite:IsCastable() or e.DemonBlades:IsAvailable()) and e.VengefulRetreat:TimeSinceLastCast() > 1 then
        if w and not e.DemonBlades:IsAvailable() and (t:DebuffRemains(e.BurningWoundDebuff) < 4 or (UnitsWithoutBWCount == 0 or not Z())) then
            if i(e.DemonsBite, nil, nil, not t:IsSpellInRange(e.DemonsBite)) then
                o = 162243
                return "demons_bite 26T"
            end

        end

        if T.CastTargetIf(e.DemonsBite, x, "min", re, he) then
            return "demons_bite normal 28"
        end

    end

    if e.DemonsBite:IsCastable() and not e.DemonBlades:IsAvailable() and e.VengefulRetreat:TimeSinceLastCast() > 1 and t:IsInMeleeRange(8) and not w then
        if i(e.DemonsBite, nil, nil, not t:IsSpellInRange(e.DemonsBite)) then
            o = 162243
            return "demons_bite normal 30"
        end

    end

    if e.FelRush:IsCastable() and t:IsInRange(15) and e.VengefulRetreat:TimeSinceLastCast() > .75 and not m and (not e.Momentum:IsAvailable() and e.DemonBlades:IsAvailable() and q()) and b then
        if i(e.FelRush, nil, nil) then
            o = 195072
            return "fel_rush demonic 34"
        end

    end

    if e.Felblade:IsCastable() and not a:IsMoving() and not M and t:IsInRange(n.Commons.FelBladeRange) and (not d() and not m) then
        if i(e.Felblade, nil, nil, not t:IsSpellInRange(e.Felblade)) then
            o = 183226
            return "felblade normal 34"
        end

    end

    if e.FelRush:IsCastable() and t:IsInRange(15) and e.VengefulRetreat:TimeSinceLastCast() > .75 and not m and (not d() and not e.Momentum:IsAvailable() and q()) and b then
        if i(e.FelRush, nil, nil) then
            o = 195072
            return "fel_rush demonic 34"
        end

    end

    if e.VengefulRetreat:IsCastable() and e.EyeBeam:TimeSinceLastCast() > 1 and t:IsInRange(5) and F and not m and (not d()) then
        if i(e.VengefulRetreat, nil) then
            o = 198793
            return "vengeful_retreat normal 38"
        end

    end

    if e.ThrowGlaive:IsCastable() and e.VengefulRetreat:TimeSinceLastCast() > 1 and t:IsInRange(n.Commons.ThrowGlaiveRange) and (e.DemonBlades:IsAvailable()) then
        if i(e.ThrowGlaive, nil, nil, not t:IsSpellInRange(e.ThrowGlaive)) then
            o = 185123
            return "throw_glaive normal 40"
        end

    end

end

local function w()
    se = HeroRotationCharDB.Toggles[6]
    A = HeroRotationCharDB.Toggles[4]
    ee = HeroRotationCharDB.Toggles[5]
    Y = HeroRotationCharDB.Toggles[12]
    oe = not HeroRotationCharDB.Toggles[15]
    m = HeroRotationCharDB.Toggles[40]
    C = HeroRotationCharDB.Toggles[41]
    ae = HeroRotationCharDB.Toggles[42]
    M = HeroRotationCharDB.Toggles[43]
    ne = HeroRotationCharDB.Toggles[44]
    W = HeroRotationCharDB.Toggles[45]
    X = HeroRotationCharDB.Toggles[46]
    L = HeroRotationCharDB.Toggles[47]
    K = HeroRotationCharDB.Toggles[48]
    Q = HeroRotationCharDB.Toggles[49]
    J = GetInventoryItemID("player", 13)
    te = GetInventoryItemID("player", 14)
            if not n.Commons.Enabled.TopTrinket and not n.Commons.Enabled.BotTrinket then
        U = { J, te, h.CacheofAcquiredTreasures:ID() }
    elseif not n.Commons.Enabled.TopTrinket and n.Commons.Enabled.BotTrinket then
        U = { J, h.CacheofAcquiredTreasures:ID() }
    elseif not n.Commons.Enabled.BotTrinket and n.Commons.Enabled.TopTrinket then
        U = { te, h.CacheofAcquiredTreasures:ID() }
    end

    b = ((n.Havoc.FelRushMode == "All In") or (n.Havoc.FelRushMode == "Safe" and e.Felblade:CooldownRemains(BypassRecovery) <= 0) or (n.Havoc.FelRushMode == "w/ Gap Closer" and (e.Felblade:CooldownRemains(BypassRecovery) <= 0 or (e.Metamorphosis:CooldownRemains(BypassRecovery) <= 0 and g) or e.FelRush:Charges() == 2 or (e.TheHunt:CooldownRemains(BypassRecovery) <= 0 and A))))
    F = ((n.Havoc.VengefulRetreatMode == "All In") or (n.Havoc.VengefulRetreatMode == "Safe" and e.Felblade:CooldownRemains(BypassRecovery) <= 0) or (n.Havoc.VengefulRetreatMode == "w/ Gap Closer" and (e.Felblade:CooldownRemains(BypassRecovery) <= 0 or (e.Metamorphosis:CooldownRemains(BypassRecovery) <= 0 and g) or e.FelRush:CooldownRemains(BypassRecovery) <= 0 or (e.TheHunt:CooldownRemains(BypassRecovery) <= 0 and A))))
    g = false
    v = false
    if ((n.Havoc.IncludedCooldowns.Metamorphosis and s.CDsON()) or (n.Havoc.IncludedSmallCooldowns.Metamorphosis and (s.CDsON() or ee)) or (not n.Havoc.IncludedSmallCooldowns.Metamorphosis and not n.Havoc.IncludedCooldowns.Metamorphosis)) then
        g = true
    end

    if ((n.Havoc.IncludedCooldowns.EyeBeam and s.CDsON() and not L) or (n.Havoc.IncludedSmallCooldowns.EyeBeam and (s.CDsON() or ee) and not L) or (not n.Havoc.IncludedSmallCooldowns.EyeBeam and not n.Havoc.IncludedCooldowns.EyeBeam and not L)) then
        v = true
    end

    f = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                f = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

end

local function d()
    if Z() then
        x = a:GetEnemiesInMeleeRange(8)
        ie = a:GetEnemiesInMeleeRange(20)
        r = #x
        D = #ie
    else
        r = 1
        D = 1
    end

    if e.Detainment:IsAvailable() then
        Imprison = e.Imprison2
    else
        Imprison = e.Imprison
    end

    UnitsWithoutBWCount = ye(x)
    UnitsWithoutSGCount = fe(x)
    w()
    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.ThrowGlaive:IsCastable() and _("mouseover"):IsInMeleeRange(30) then
            if i(e.ThrowGlaive, nil) then
                l = 1185123
                return "explosive MO SWD"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.ThrowGlaive:IsCastable() and t:IsInMeleeRange(30) then
            if i(e.ThrowGlaive, nil) then
                o = 1185123
                return "explosive  SWD"
            end

        end

    end

    p = z.FightRemains(x, false)
    if not BotOn then
        l = 0
        o = 0
    end

    if l > 0 then
        l = 0
    end

    if o > 0 then
        o = 0
    end

    B = false
    NecroPetsUpCount = we(x)
    if a:IsChanneling(e.EyeBeam) then
        if i(e.Pool) then
            o = 9999
            return "casting EB"
        end

    end

            if (C and Imprison:IsCastable(BypassRecovery) and Imprison:CooldownRemains() <= 0 and _("mouseover"):GUID() ~= nil) then
        if i(Imprison, nil, nil, nil) then
            l = 231
            return "queue Imprison MO"
        end

    elseif (C and Imprison:IsCastable(BypassRecovery) and Imprison:CooldownRemains() <= 0 and T.TargetIsValid()) then
        if i(Imprison, nil, nil, nil) then
            o = 217832
            return "queue Imprison"
        end

    elseif ((not Imprison:IsUsableP() or Imprison:CooldownRemains() > 0) and C) then
        HeroRotationCharDB.Toggles[41] = not HeroRotationCharDB.Toggles[41]
        s.Print("Imprison Queue is now " .. (HeroRotationCharDB.Toggles[41] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (W and e.FelEruption:IsCastable(BypassRecovery) and e.FelEruption:CooldownRemains(BypassRecovery) <= 0 and e.FelEruption:IsAvailable() and _("mouseover"):GUID() ~= nil) then
        if i(e.FelEruption, nil, nil, nil) then
            l = 1211881
            return "queue Fel Eruption"
        end

    elseif (W and e.FelEruption:IsCastable(BypassRecovery) and e.FelEruption:CooldownRemains(BypassRecovery) <= 0 and e.FelEruption:IsAvailable() and T.TargetIsValid()) then
        if i(e.FelEruption, nil, nil, nil) then
            o = 211881
            return "queue Fel Eruption"
        end

    elseif (((not e.FelEruption:IsUsableP() and a:Fury() > 10) or e.FelEruption:CooldownRemains() > 0 or not e.FelEruption:IsAvailable()) and W) then
        HeroRotationCharDB.Toggles[45] = not HeroRotationCharDB.Toggles[45]
        s.Print("Fel Eruption Queue is now " .. (HeroRotationCharDB.Toggles[45] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (X and (e.ChaosNova:IsCastable(BypassRecovery)) and e.ChaosNova:CooldownRemains(BypassRecovery) <= 0 and a:Fury() >= 30) then
        if i(e.ChaosNova, nil, nil, nil) then
            o = 179057
            return "queue Chaos Nova MO"
        end

    elseif (((not e.ChaosNova:IsUsableP() and a:Fury() > 30) or e.ChaosNova:CooldownRemains() > 0 or not T.TargetIsValid()) and X) then
        HeroRotationCharDB.Toggles[46] = not HeroRotationCharDB.Toggles[46]
        s.Print("ChaosNova Queue is now " .. (HeroRotationCharDB.Toggles[46] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (K and (e.FelRush:IsCastable(BypassRecovery)) and e.FelRush:CooldownRemains(BypassRecovery) <= 0) then
        if i(e.FelRush, nil, nil, nil) then
            o = 195072
            return "queue FelRush"
        end

    elseif (((not e.FelRush:IsUsableP()) or e.FelRush:CooldownRemains() > 0) and K) then
        HeroRotationCharDB.Toggles[48] = not HeroRotationCharDB.Toggles[48]
        s.Print("Fel Rush Queue is now " .. (HeroRotationCharDB.Toggles[48] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (Q and (e.Darkness:IsCastable(BypassRecovery)) and e.Darkness:CooldownRemains(BypassRecovery) <= 0) then
        if i(e.Darkness, nil, nil, nil) then
            o = 196718
            return "queue FelRush"
        end

    elseif (((not e.Darkness:IsUsableP()) or e.Darkness:CooldownRemains() > 0) and Q) then
        HeroRotationCharDB.Toggles[49] = not HeroRotationCharDB.Toggles[49]
        s.Print("Darkness Queue is now " .. (HeroRotationCharDB.Toggles[49] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if a:FuryDeficit() >= 35 and not a:IsChanneling(e.EyeBeam) or not a:AffectingCombat() then
        B = true
    end

    if T.TargetIsValid() then
        k = 0
        if (u:TrinketHasStatAnyDps() and ((not c:TrinketHasStatAnyDps()) or u:Cooldown() >= c:Cooldown())) then
            k = 1
        end

        if (c:TrinketHasStatAnyDps() and ((not u:TrinketHasStatAnyDps()) or c:Cooldown() >= u:Cooldown())) then
            k = 2
        end

        V = (e.BlindFury:IsAvailable() and (R or (e.DemonBlades:IsAvailable() and not E)))
        if not a:AffectingCombat() and se then
            local e = ce()
            if e then
                return e
            end

        end

        if ((not G) and not R) then
            y = (e.FirstBlood:IsAvailable() or (r >= (3 - N(e.TrailofRuin:IsAvailable()))))
        end

        if (G) then
            y = (a:BuffDown(e.ChaosTheoryBuff) or e.FirstBlood:IsAvailable() and r >= (2 - N(e.TrailofRuin:IsAvailable())) or (not e.CycleofHatred:IsAvailable()) and r >= (4 - N(e.TrailofRuin:IsAvailable())))
        end

        if (R) then
            y = (e.FirstBlood:IsAvailable() or (a:BuffUp(e.MetamorphosisBuff) or e.TrailofRuin:IsAvailable() or t:DebuffUp(e.EssenceBreakDebuff)) and r >= (3 - N(e.TrailofRuin:IsAvailable())) or (not e.Demonic:IsAvailable()) and r >= 4)
        end

        if (e.EssenceBreak:IsAvailable() and e.EssenceBreak:CooldownUp()) then
            y = false
        end

        if (E and e.CycleofHatred:IsAvailable()) then
            y = y and e.SinfulBrandDebuff:AuraActiveCount() < 2
        end

        H = (not e.Demonic:IsAvailable()) and (e.Metamorphosis:CooldownRemains() < 6 and g) and a:FuryDeficit() > 30
        O = y and a:Fury() < 75 - N(e.FirstBlood:IsAvailable()) * 20
        P = e.Demonic:IsAvailable() and (not e.BlindFury:IsAvailable()) and e.EyeBeam:CooldownRemains() < (a:GCD() * 2) and v and a:FuryDeficit() > 20
        j = e.Momentum:IsAvailable() and a:BuffDown(e.MomentumBuff)
        if (E) then
            S = t:DebuffDown(e.SinfulBrandDebuff) and e.SinfulBrand:CooldownRemains() < a:GCD() * 4 and (e.Metamorphosis:CooldownDown() or r == 1) and D <= 3
        end

        for a = 1, 25 do
            local n, n, n, a = UnitBuff("target", a)
            if a ~= nil and a == "Magic" then
                if e.ConsumeMagic:IsCastable() and ne and t:IsInRange(30) then
                    if i(e.ConsumeMagic, nil) then
                        o = 278326
                        return "Consume Magic"
                    end

                end

            end

        end

        if h.CruciformVeinripper:IsEquipped() and t:DebuffUp(e.SadisticGleeDebuff) and UnitsWithoutSGCount > 0 and n.Havoc.TargetSwap == "AutoSwap" and not Y then
            l = 999
        end

        if NecroPetsUpCount > 0 and e.ThrowGlaive:IsCastable() and (t:IsInRange(8) or a:HealthPercentage() <= 25) then
            l = 21185123
        end

        if e.Blur:IsCastable() and a:HealthPercentage() <= n.Havoc.BlurHealthThreshold and a:AffectingCombat() then
            if i(e.Blur, nil) then
                o = 198589
                return "Blur defensives (Danger)"
            end

        end

        if a:HealthPercentage() < n.Havoc.PhialHP and h.PhialofSerenity:IsReady() and h.PhialofSerenity:CooldownRemains() <= 0 then
            if s.Cast(h.PhialofSerenity, nil) then
                o = 55
                return "PhialofSerenity HP"
            end

        end

        if a:HealthPercentage() < n.Havoc.HealthstoneHP and h.Healthstone:IsReady() and h.Healthstone:CooldownRemains() <= 0 then
            if s.Cast(h.Healthstone, nil) then
                o = 40
                return "Healthstone HP"
            end

        end

        if a:HealthPercentage() < n.Havoc.HealPotHP and h.CosmicHealPot:IsReady() and h.CosmicHealPot:CooldownRemains() <= 0 then
            if s.Cast(h.CosmicHealPot, nil) then
                o = 45
                return "CosmicHealPot HP"
            end

        end

        if a:HealthPercentage() < n.Havoc.HealPotHP and h.HealPot:IsReady() and h.HealPot:CooldownRemains() <= 0 then
            if s.Cast(h.HealPot, nil) then
                o = 41
                return "HealPot HP"
            end

        end

        if a:AffectingCombat() then
            local e = le()
            if e then
                return e
            end

        end

        if e.ThrowGlaive:IsCastable() and t:IsInMeleeRange(n.Commons.ThrowGlaiveRange) and e.VengefulRetreat:TimeSinceLastCast() > 1 and a:AffectingCombat() and (a:BuffStack(e.FelBombardmentBuff) == 5 and (a:BuffUp(e.ImmolationAuraBuff) or a:BuffDown(e.MetamorphosisBuff))) then
            if i(e.ThrowGlaive, nil, nil, not t:IsSpellInRange(e.ThrowGlaive)) then
                o = 185123
                return "throw_glaive fel_bombardment"
            end

        end

        if (e.Demonic:IsAvailable() and a:AffectingCombat()) then
            local e = ue()
            if e then
                return e
            end

        end

        if (true) then
            local e = de()
            if e then
                return e
            end

        end

    end

end

local function t()
    e.SinfulBrandDebuff:RegisterAuraTracking()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        s.ToggleIconFrame:UpdateButtonText(6)
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
    if l == 0 then
        return 0
    else
        return l
    end

end

function ShouldOrb()
    return B
end

s.SetAPL(577, d, t)

