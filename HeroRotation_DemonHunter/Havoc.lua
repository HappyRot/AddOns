local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = f.Pet;
local j = d.Spell;
local k = d.Item;
local l = HeroRotation;
local m = l.AoEON;
local n = l.CDsON;
local o = HeroRotationCharDB.Toggles[4]
local p = HeroRotationCharDB.Toggles[5]
local q = HeroRotationCharDB.Toggles[6]
local r = HeroRotationCharDB.Toggles[12]
local s = not HeroRotationCharDB.Toggles[15]
local t = HeroRotationCharDB.Toggles[40]
local u = HeroRotationCharDB.Toggles[42]
local v = HeroRotationCharDB.Toggles[43]
local w = HeroRotationCharDB.Toggles[41]
local x = HeroRotationCharDB.Toggles[45]
local y = HeroRotationCharDB.Toggles[46]
local z = HeroRotationCharDB.Toggles[47]
local A = HeroRotationCharDB.Toggles[48]
local B = HeroRotationCharDB.Toggles[49]
local C = HeroRotationCharDB.Toggles[44]
local D = false;
local E = false;
local F = false;
local G = false;
local H = GetInventoryItemID("player", 13)
local I = GetInventoryItemID("player", 14)
local J = 0;
local K = l.Cast;
local L = l.CastSuggested;
local M = string.match;
local N = j.DemonHunter.Havoc;
local O = k.DemonHunter.Havoc;
local P = {O.CacheofAcquiredTreasures}
local R = g:GetEquipment()
local S = k(0)
local T = k(0)
if R[13] then
    S = k(R[13])
end
if R[14] then
    T = k(R[14])
end
local U;
local V, W;
local X, Y;
local Z = g:HasLegendaryEquipped(20)
local _ = g:HasLegendaryEquipped(23)
local a0 = g:HasLegendaryEquipped(25)
local a1 = g:HasLegendaryEquipped(236) or g:HasUnity() and N.SinfulBrand:IsAvailable()
local a2 = l.Commons.Everyone;
local a3 = {
    General = l.GUISettings.General,
    Commons = l.GUISettings.APL.DemonHunter.Commons,
    Havoc = l.GUISettings.APL.DemonHunter.Havoc
}
local a4 = {{N.FelEruption, "Cast Fel Eruption (Interrupt)", function()
    return true
end}, {N.ChaosNova, "Cast Chaos Nova (Interrupt)", function()
    return true
end}}
local a5 = 0;
local a6 = 0;
local a7 = false;
local a8 = false;
local a9 = false;
local aa = false;
local ab = false;
local ac = false;
local ad = false;
local ae = false;
local af = 0;
local ag = false;
local ah = 11111;
local ai = 11111;
local aj = g:CovenantID()
d:RegisterForEvent(function()
    aj = g:CovenantID()
end, "COVENANT_CHOSEN")
d:RegisterForEvent(function()
    a8 = false;
    a9 = false;
    aa = false;
    ab = false;
    ac = false;
    ad = false;
    ae = false;
    ah = 11111;
    ai = 11111
end, "PLAYER_REGEN_ENABLED")
d:RegisterForEvent(function()
    R = g:GetEquipment()
    S = k(0)
    T = k(0)
    if R[13] then
        S = k(R[13])
    end
    if R[14] then
        T = k(R[14])
    end
    Z = g:HasLegendaryEquipped(20)
    _ = g:HasLegendaryEquipped(23)
    a0 = g:HasLegendaryEquipped(25)
    a1 = g:HasLegendaryEquipped(236) or g:HasUnity() and N.SinfulBrand:IsAvailable()
end, "PLAYER_EQUIPMENT_CHANGED")
local function ak(al)
    if al then
        return 1
    else
        return 0
    end
end
local function am(al)
    return al ~= 0
end
local function an(ao)
    local an = 0;
    if ao ~= nil then
        for ap in pairs(ao) do
            local aq = ao[ap]
            if aq:NPCID() == 169421 or aq:NPCID() == 169425 or aq:NPCID() == 168932 or aq:NPCID() == 169426 or
                aq:NPCID() == 169429 or aq:NPCID() == 169428 or aq:NPCID() == 169430 then
                an = an + 1
            end
        end
    end
    return an
end
local function ar(as)
    if N.Felblade:TimeSinceLastCast() <= g:GCD() then
        return true
    elseif N.VengefulRetreat:TimeSinceLastCast() < 1.0 and N.VengefulRetreat:TimeSinceLastCast() > 0.25 or
        N.FelRush:TimeSinceLastCast() < 1.0 then
        return false
    end
    return as and h:IsInMeleeRange(as) or h:IsInMeleeRange(5)
end
local function at()
    return true
end
local function au(ao)
    local av = 0;
    if ao ~= nil then
        for ap in pairs(ao) do
            local aq = ao[ap]
            if aq:DebuffDown(N.BurningWoundDebuff) then
                av = av + 1
            end
        end
    end
    return av
end
local function aw(ao)
    local ax = 0;
    if ao ~= nil then
        for ap in pairs(ao) do
            local aq = ao[ap]
            if aq:DebuffDown(N.SadisticGleeDebuff) then
                ax = ax + 1
            end
        end
    end
    return ax
end
local function ay(az)
    return az:DebuffRemains(N.BurningWoundDebuff)
end
local function aA(az)
    if a0 and az:DebuffRemains(N.BurningWoundDebuff) < 4 and az:IsInRange(8) and az:GUID() == f("mouseover"):GUID() then
        if N.DemonBlades:IsAvailable() then
            a6 = 1111
        else
            a6 = 111
        end
        return true
    elseif a0 and az:DebuffRemains(N.BurningWoundDebuff) < 4 and az:IsInRange(8) and a3.Havoc.TargetSwap == "AutoSwap" and
        az:GUID() ~= h:GUID() and not r then
        a6 = 999;
        return true
    elseif a0 and az:DebuffRemains(N.BurningWoundDebuff) < 4 and az:IsInRange(8) and az:GUID() == h:GUID() and
        h:IsInRange(8) then
        a5 = 162243;
        return true
    elseif a0 and az:DebuffRemains(N.BurningWoundDebuff) < 4 and az:IsInRange(8) then
        return true
    end
end
local function aB(az)
    return az:DebuffRemains(N.BurningWoundDebuff)
end
local function aC(az)
    if a0 and az:DebuffRemains(N.BurningWoundDebuff) < 4 and az:IsInRange(8) and az:GUID() == f("mouseover"):GUID() then
        if N.DemonBlades:IsAvailable() then
            a6 = 1111
        else
            a6 = 111
        end
        return true
    elseif a0 and az:DebuffRemains(N.BurningWoundDebuff) < 4 and az:IsInRange(8) and a3.Havoc.TargetSwap == "AutoSwap" and
        az:GUID() ~= h:GUID() and not r then
        a6 = 999;
        return true
    elseif a0 and az:DebuffRemains(N.BurningWoundDebuff) < 4 and az:IsInRange(8) and az:GUID() == h:GUID() then
        a5 = 162243;
        return true
    elseif a0 and az:DebuffRemains(N.BurningWoundDebuff) < 4 and az:IsInRange(8) then
        return true
    end
end
local function aD()
    if not h:IsInMeleeRange(5) and N.VengefulRetreat:TimeSinceLastCast() > 0.75 and not t and h:IsInRange(15) and
        N.FelRush:IsCastable() and D then
        if K(N.FelRush, nil, nil, not h:IsInRange(15)) then
            a5 = 195072;
            return "fel_rush precombat 2"
        end
    end
    if h:IsInMeleeRange(5) and (N.DemonsBite:IsCastable() or N.DemonBlades:IsAvailable()) then
        if N.DemonBlades:IsAvailable() and IsCurrentSpell(6603) ~= true then
            if K(N.DemonsBite, nil, nil, not h:IsInMeleeRange(5)) then
                a5 = 1162243;
                return "demons_bite or demon_blades precombat 4"
            end
        else
            if K(N.DemonsBite, nil, nil, not h:IsInMeleeRange(5)) then
                a5 = 162243;
                return "demons_bite or demon_blades precombat 4"
            end
        end
    end
end
local function aE()
    if N.Metamorphosis:IsCastable() and F and h:IsInRange(8) and
        (not N.Demonic:IsAvailable() and (N.EyeBeam:CooldownRemains() > 20 or not G or ai < 25)) then
        if l.CastAnnotated(N.Metamorphosis, nil, "AWAY") then
            a5 = 191427;
            return "metamorphosis cooldown 2"
        end
    end
    if N.Metamorphosis:IsCastable() and F and h:IsInRange(8) and (N.Demonic:IsAvailable() and
        ((N.EyeBeam:CooldownRemains() > 20 or not G) and
            (not a9 or N.BladeDance:CooldownRemains() > g:GCD() + 0.5 or ai < 25))) then
        if K(N.Metamorphosis, nil, nil, not h:IsInRange(40)) then
            a5 = 191427;
            return "metamorphosis cooldown 4"
        end
    end
    if (O.PotionofPhantomFire:IsReady() or O.PotionofSpectralAgility:IsReady()) and h:IsInMeleeRange(8) and l.CDsON() and
        s and a3.Commons.Enabled.Potions and
        ((g:BuffRemains(N.MetamorphosisBuff) > 25 or ai < 60) and not l.GUISettings.General.HoldPotforBL or
            l.GUISettings.General.HoldPotforBL and g:BloodlustUp()) then
        if K(O.PotionofPhantomFire, nil, nil) then
            a5 = 4;
            return "potion cooldown 6"
        end
    end
    local aF = g:GetUseableTrinkets(P)
    if O.CacheofAcquiredTreasures:IsEquippedAndReady() and l.CDsON() and
        (g:BuffUp(N.AcquiredAxeBuff) and (X >= 1 and (X < 3 or N.EyeBeam:CooldownRemains() < 20) or ai < 25)) then
        if K(O.CacheofAcquiredTreasures, nil, nil) then
            if O.CacheofAcquiredTreasures:ID() == GetInventoryItemID("player", 13) and a3.Commons.Enabled.TopTrinket then
                a5 = 20;
                return "cache_of_acquired_treasures cooldown 7"
            elseif O.CacheofAcquiredTreasures:ID() == GetInventoryItemID("player", 14) and
                a3.Commons.Enabled.BottomTrinket then
                a5 = 25;
                return "cache_of_acquired_treasures cooldown 7"
            end
        end
    end
    if S:IsReady() and S:ID() ~= O.CacheofAcquiredTreasures:ID() and h:IsInRange(10) and a3.Commons.Enabled.TopTrinket and
        l.CDsON() and
        (af == 1 and
            (g:BuffUp(N.MetamorphosisBuff) or not N.Demonic:IsAvailable() and N.Metamorphosis:CooldownRemains() >
                (ai > S:Cooldown() / 2 and ai or S:Cooldown() / 2) or ai <= 20) or af == 2 and not T:IsReady() or af ==
            0) then
        if aF then
            if K(S, nil, nil) then
                if S:ID() == GetInventoryItemID("player", 13) and a3.Commons.Enabled.TopTrinket then
                    a5 = 20;
                    return "top trinket 1"
                elseif S:ID() == GetInventoryItemID("player", 14) and a3.Commons.Enabled.BottomTrinket then
                    a5 = 25;
                    return "bot trinket 1"
                end
            end
        end
    end
    if T:IsReady() and T:ID() ~= O.CacheofAcquiredTreasures:ID() and h:IsInRange(10) and
        a3.Commons.Enabled.BottomTrinket and l.CDsON() and
        (af == 2 and
            (g:BuffUp(N.MetamorphosisBuff) or not N.Demonic:IsAvailable() and N.Metamorphosis:CooldownRemains() >
                (ai > T:Cooldown() / 2 and ai or T:Cooldown() / 2) or ai <= 20) or af == 1 and not S:IsReady() or af ==
            0) then
        if aF then
            if K(T, nil, nil) then
                if T:ID() == GetInventoryItemID("player", 13) and a3.Commons.Enabled.TopTrinket then
                    a5 = 20;
                    return "top trinket 1"
                elseif T:ID() == GetInventoryItemID("player", 14) and a3.Commons.Enabled.BottomTrinket then
                    a5 = 25;
                    return "bot trinket 1"
                end
            end
        end
    end
    if N.SinfulBrand:IsCastable() and h:IsInMeleeRange(30) and o and h:NPCID() ~= 185683 and h:NPCID() ~= 185685 and
        h:NPCID() ~= 185680 and
        (h:DebuffDown(N.SinfulBrandDebuff) and (not a1 or N.EyeBeam:CooldownRemains() <= g:GCD() and g:Fury() >= 30) and
            (N.Metamorphosis:CooldownDown() or X == 1 or not F)) then
        if K(N.SinfulBrand, nil, nil, not h:IsSpellInRange(N.SinfulBrand)) then
            a5 = 317009;
            return "sinful_brand cooldown 12"
        end
    end
    if N.TheHunt:IsReady() and not g:IsMoving() and (J == 0 or J > N.TheHunt:CastTime()) and h:IsInRange(40) and o and
        (not ad and not a8 or g:BuffUp(N.FuriousGazeBuff)) then
        if K(N.TheHunt, nil, nil, not h:IsSpellInRange(N.TheHunt)) then
            a5 = 323639;
            return "the_hunt cooldown 14"
        end
    end
    if N.TheHuntTalent:IsReady() and N.TheHuntTalent:IsAvailable() and not g:IsMoving() and
        (J == 0 or J > N.TheHunt:CastTime()) and h:IsInRange(40) and n() and
        (not ad and not a8 or g:BuffUp(N.FuriousGazeBuff)) then
        if K(N.TheHunt, nil, nil, not h:IsSpellInRange(N.TheHunt)) then
            a5 = 323639;
            return "the_hunt cooldown 14"
        end
    end
    if N.ElysianDecree:IsCastable() and h:IsInRange(30) and o and X > 0 then
        if K(N.ElysianDecree, nil, nil, not h:IsInRange(30)) then
            a5 = 306830;
            return "elysian_decree cooldown 16"
        end
    end
end
local function aG()
    if N.EyeBeam:IsReady() and not g:IsMoving() and (J == 0 or J > N.EyeBeam:ExecuteTime()) and G and
        not h:IsCasting(j(355806)) and h:IsInMeleeRange(10) and N.VengefulRetreat:TimeSinceLastCast() >= 1 and
        (a1 and X > 1 and h:DebuffUp(N.SinfulBrandDebuff) and h:DebuffRemains(N.SinfulBrandDebuff) <= g:GCD()) then
        if K(N.EyeBeam, nil, nil, not h:IsInRange(20)) then
            a5 = 198013;
            return "eye_beam demonic 1"
        end
    end
    if N.FelRush:IsCastable() and h:IsInRange(15) and N.VengefulRetreat:TimeSinceLastCast() > 0.75 and not t and
        (N.UnboundChaos:IsAvailable() and g:BuffUp(N.UnboundChaosBuff) and N.FelRush:Charges() == 2) and D then
        if K(N.FelRush, nil, nil) then
            a5 = 195072;
            return "fel_rush demonic 2"
        end
    end
    if N.DeathSweep:IsReady() and N.VengefulRetreat:TimeSinceLastCast() >= 1 and h:IsInMeleeRange(8) and a9 then
        if K(N.DeathSweep, nil, nil, not ar(8)) then
            a5 = 210152;
            return "death_sweep demonic 4"
        end
    end
    if N.GlaiveTempest:IsReady() and h:IsInMeleeRange(8) and X > 0 then
        if K(N.GlaiveTempest, nil, nil, not h:IsInMeleeRange(8)) then
            a5 = 342817;
            return "glaive_tempest demonic 6"
        end
    end
    if N.ThrowGlaive:IsCastable() and h:IsInMeleeRange(a3.Commons.ThrowGlaiveRange) and
        N.VengefulRetreat:TimeSinceLastCast() > 1 and
        (N.SerratedGlaive:ConduitEnabled() and N.EyeBeam:CooldownRemains() < 6 and g:BuffDown(N.MetamorphosisBuff) and
            h:DebuffDown(N.ExposedWoundDebuff)) then
        if K(N.ThrowGlaive, nil, nil, not h:IsSpellInRange(N.ThrowGlaive)) then
            a5 = 185123;
            return "throw_glaive demonic 8"
        end
    end
    if N.EyeBeam:IsReady() and not g:IsMoving() and (J == 0 or J > N.EyeBeam:ExecuteTime()) and G and
        not h:IsCasting(j(355806)) and h:IsInMeleeRange(10) and N.VengefulRetreat:TimeSinceLastCast() >= 1 and
        (X > 0 and (not ag or X > 1 or g:Fury() < 70) and not ae) then
        if K(N.EyeBeam, nil, nil, not h:IsInRange(20)) then
            a5 = 198013;
            return "eye_beam demonic 10"
        end
    end
    if N.BladeDance:IsReady() and N.VengefulRetreat:TimeSinceLastCast() >= 1 and h:IsInMeleeRange(8) and
        (a9 and (not N.Metamorphosis:CooldownUp() or not F) and (N.EyeBeam:CooldownRemains() > 5 or not G)) then
        if K(N.BladeDance, nil, nil, not ar(8)) then
            a5 = 188499;
            return "blade_dance demonic 12"
        end
    end
    if N.ImmolationAura:IsCastable() and not u and N.VengefulRetreat:TimeSinceLastCast() >= 1 and ar(10) and
        g:BuffDown(N.ImmolationAuraBuff) then
        if K(N.ImmolationAura, nil, nil, not ar(8)) then
            a5 = 258920;
            return "immolation_aura demonic 14"
        end
    end
    if N.SigilofFlame:IsCastable() and not u and N.VengefulRetreat:TimeSinceLastCast() >= 1 and ar(10) and
        g:BuffDown(N.ImmolationAuraBuff) then
        if K(N.SigilofFlame, nil, nil, not ar(8)) then
            a5 = 204596;
            return "SigilofFlame demonic 14"
        end
    end
    if N.Annihilation:IsReady() and h:IsInRange(8) and ar(10) and not aa then
        if K(N.Annihilation, nil, nil, not h:IsSpellInRange(N.Annihilation)) then
            a5 = 201427;
            return "annihilation demonic 16"
        end
    end
    if N.Felblade:IsCastable() and not g:IsMoving() and not v and h:IsInRange(a3.Commons.FelBladeRange) and
        (h:IsInRange(8) or not t) and g:FuryDeficit() >= 40 and
        (not ar() or N.VengefulRetreat:TimeSinceLastCast() >= 1.0) then
        if K(N.Felblade, nil, nil, not h:IsSpellInRange(N.Felblade)) then
            a5 = 183226;
            return "felblade demonic 18"
        end
    end
    if N.EssenceBreak:IsCastable() and h:IsInMeleeRange(10) and N.VengefulRetreat:TimeSinceLastCast() > 1 then
        if K(N.EssenceBreak, nil, nil, not ar(10)) then
            a5 = 258860;
            return "essence_break demonic 20"
        end
    end
    if N.ChaosStrike:IsReady() and h:IsInMeleeRange(8) and (not aa and not ab) then
        if K(N.ChaosStrike, nil, nil, not h:IsSpellInRange(N.ChaosStrike)) then
            a5 = 162794;
            return "chaos_strike demonic 22"
        end
    end
    if N.FelRush:IsCastable() and h:IsInRange(15) and N.VengefulRetreat:TimeSinceLastCast() > 0.75 and not t and
        (N.DemonBlades:IsAvailable() and not N.EyeBeam:CooldownUp() and at()) and D then
        if K(N.FelRush, nil, nil) then
            a5 = 195072;
            return "fel_rush demonic 24"
        end
    end
    if N.DemonsBite:IsCastable() or N.DemonBlades:IsAvailable() then
        if a0 and not N.DemonBlades:IsAvailable() and
            (h:DebuffRemains(N.BurningWoundDebuff) < 4 or (UnitsWithoutBWCount == 0 or not m())) then
            if K(N.DemonsBite, nil, nil, not h:IsSpellInRange(N.DemonsBite)) then
                a5 = 162243;
                return "demons_bite 26T"
            end
        end
        if a2.CastTargetIf(N.DemonsBite, V, "min", aB, aC) then
            return "demons_bite demonic 26"
        end
    end
    if N.FelRush:IsCastable() and h:IsInRange(15) and N.VengefulRetreat:TimeSinceLastCast() > 0.75 and not t and
        (not N.DemonBlades:IsAvailable() and X > 1 and N.FelRush:Charges() == 2) and D then
        if K(N.FelRush, nil, nil) then
            a5 = 195072;
            return "fel_rush demonic 28"
        end
    end
    if N.DemonsBite:IsCastable() and not N.DemonBlades:IsAvailable() and h:IsInMeleeRange(8) and not a0 then
        if K(N.DemonsBite, nil, nil, not h:IsSpellInRange(N.DemonsBite)) then
            a5 = 162243;
            return "demons_bite demonic 30"
        end
    end
    if N.ThrowGlaive:IsCastable() and h:IsInRange(a3.Commons.ThrowGlaiveRange) and not ar() then
        if K(N.ThrowGlaive, nil, nil, not h:IsSpellInRange(N.ThrowGlaive)) then
            a5 = 185123;
            return "throw_glaive demonic 32"
        end
    end
    if N.FelRush:IsCastable() and h:IsInRange(15) and N.VengefulRetreat:TimeSinceLastCast() > 0.75 and not t and
        (not ar() and at()) and D then
        if K(N.FelRush, nil, nil) then
            a5 = 195072;
            return "fel_rush demonic 34"
        end
    end
    if N.VengefulRetreat:IsCastable() and N.EyeBeam:TimeSinceLastCast() > 1 and h:IsInRange(5) and E and not t and
        not ar() then
        if K(N.VengefulRetreat, nil) then
            a5 = 198793;
            return "vengeful_retreat demonic 36"
        end
    end
    if N.ThrowGlaive:IsCastable() and h:IsInRange(a3.Commons.ThrowGlaiveRange) and N.DemonBlades:IsAvailable() then
        if K(N.ThrowGlaive, nil, nil, not h:IsSpellInRange(N.ThrowGlaive)) then
            a5 = 185123;
            return "throw_glaive demonic 38"
        end
    end
end
local function aH()
    if N.EyeBeam:IsReady() and not g:IsMoving() and (J == 0 or J > N.EyeBeam:ExecuteTime()) and G and
        not h:IsCasting(j(355806)) and h:IsInMeleeRange(10) and N.VengefulRetreat:TimeSinceLastCast() >= 1 and
        (a1 and X > 1 and h:DebuffUp(N.SinfulBrandDebuff) and h:DebuffRemains(N.SinfulBrandDebuff) <= g:GCD()) then
        if K(N.EyeBeam, nil, nil, not h:IsInRange(20)) then
            a5 = 198013;
            return "eye_beam normal 1"
        end
    end
    if N.VengefulRetreat:IsCastable() and N.EyeBeam:TimeSinceLastCast() > 1 and h:IsInRange(5) and E and not t and
        (N.Momentum:IsAvailable() and g:BuffDown(N.PreparedBuff) and d.CombatTime() > 1) then
        if K(N.VengefulRetreat, nil) then
            a5 = 198793;
            return "vengeful_retreat normal 2"
        end
    end
    if N.FelRush:IsCastable() and h:IsInRange(15) and N.VengefulRetreat:TimeSinceLastCast() > 0.75 and not t and
        ((g:BuffUp(N.UnboundChaosBuff) or ad and (not N.UnboundChaos:IsAvailable() or not N.ImmolationAura:CooldownUp())) and
            at()) and D then
        if K(N.FelRush, nil, nil) then
            a5 = 195072;
            return "fel_rush demonic 34"
        end
    end
    if N.FelBarrage:IsCastable() and N.VengefulRetreat:TimeSinceLastCast() > 1 and h:IsInMeleeRange(8) and X > 1 then
        if K(N.FelBarrage, nil, nil, not ar(8)) then
            a5 = 211053;
            return "fel_barrage normal 6"
        end
    end
    if N.DeathSweep:IsReady() and N.VengefulRetreat:TimeSinceLastCast() >= 1 and h:IsInMeleeRange(8) and a9 then
        if K(N.DeathSweep, nil, nil, not ar(8)) then
            a5 = 210152;
            return "death_sweep normal 8"
        end
    end
    if N.ImmolationAura:IsCastable() and not u and N.VengefulRetreat:TimeSinceLastCast() >= 1 and h:IsInMeleeRange(8) and
        g:BuffDown(N.ImmolationAuraBuff) then
        if K(N.ImmolationAura, nil, nil, not ar(8)) then
            a5 = 258920;
            return "immolation_aura normal 10"
        end
    end
    if N.GlaiveTempest:IsReady() and N.VengefulRetreat:TimeSinceLastCast() > 1 and h:IsInMeleeRange(8) and
        (not ad and X > 0) then
        if K(N.GlaiveTempest, nil) then
            a5 = 342817;
            return "glaive_tempest normal 12"
        end
    end
    if N.ThrowGlaive:IsCastable() and N.VengefulRetreat:TimeSinceLastCast() > 1 and
        h:IsInRange(a3.Commons.ThrowGlaiveRange) and
        (N.SerratedGlaive:ConduitEnabled() and N.EyeBeam:CooldownRemains() < 6 and g:BuffDown(N.MetamorphosisBuff) and
            h:DebuffDown(N.ExposedWoundDebuff)) then
        if K(N.ThrowGlaive, nil, nil, not h:IsSpellInRange(N.ThrowGlaive)) then
            a5 = 185123;
            return "throw_glaive normal 14"
        end
    end
    if N.EyeBeam:IsReady() and not g:IsMoving() and (J == 0 or J > N.EyeBeam:ExecuteTime()) and G and
        not h:IsCasting(j(355806)) and h:IsInMeleeRange(10) and N.VengefulRetreat:TimeSinceLastCast() >= 1 and
        (not ad and (Y > 0 and (not ag or X > 1 or g:Fury() < 70) and not ae)) then
        if K(N.EyeBeam, nil, nil, not ar(20)) then
            a5 = 198013;
            return "eye_beam normal 16"
        end
    end
    if N.BladeDance:IsReady() and N.VengefulRetreat:TimeSinceLastCast() >= 1 and h:IsInMeleeRange(8) and a9 then
        if K(N.BladeDance, nil, nil, not ar(8)) then
            a5 = 188499;
            return "blade_dance normal 18"
        end
    end
    if N.Felblade:IsCastable() and not g:IsMoving() and not v and h:IsInRange(a3.Commons.FelBladeRange) and
        (h:IsInRange(8) or not t) and g:FuryDeficit() >= 40 and
        (not ar() or N.VengefulRetreat:TimeSinceLastCast() >= 1.0) then
        if K(N.Felblade, nil, nil, not h:IsSpellInRange(N.Felblade)) then
            a5 = 183226;
            return "felblade normal 20"
        end
    end
    if N.EssenceBreak:IsCastable() and h:IsInMeleeRange(10) and N.VengefulRetreat:TimeSinceLastCast() > 1 then
        if K(N.EssenceBreak, nil, nil, not ar(10)) then
            a5 = 258860;
            return "essence_break normal 22"
        end
    end
    if N.Annihilation:IsReady() and N.VengefulRetreat:TimeSinceLastCast() > 1 and h:IsInMeleeRange(8) and
        ((N.DemonBlades:IsAvailable() or not ad or g:FuryDeficit() < 30 or g:BuffRemains(N.MetamorphosisBuff) < 5) and
            not aa) then
        if K(N.Annihilation, nil, nil, not h:IsSpellInRange(N.Annihilation)) then
            a5 = 201427;
            return "annihilation normal 24"
        end
    end
    if N.ChaosStrike:IsReady() and N.VengefulRetreat:TimeSinceLastCast() > 1 and h:IsInMeleeRange(8) and
        ((N.DemonBlades:IsAvailable() or not ad or g:FuryDeficit() < 30) and not a8 and not aa) then
        if K(N.ChaosStrike, nil, nil, not h:IsSpellInRange(N.ChaosStrike)) then
            a5 = 162794;
            return "chaos_strike normal 26"
        end
    end
    if N.EyeBeam:IsReady() and not g:IsMoving() and (J == 0 or J > N.EyeBeam:ExecuteTime()) and G and
        not h:IsCasting(j(355806)) and h:IsInMeleeRange(10) and (N.BlindFury:IsAvailable() and not ae) then
        if K(N.EyeBeam, nil, nil, not h:IsInRange(20)) then
            a5 = 198013;
            return "eye_beam normal 28"
        end
    end
    if (N.DemonsBite:IsCastable() or N.DemonBlades:IsAvailable()) and N.VengefulRetreat:TimeSinceLastCast() > 1 then
        if a0 and not N.DemonBlades:IsAvailable() and
            (h:DebuffRemains(N.BurningWoundDebuff) < 4 or (UnitsWithoutBWCount == 0 or not m())) then
            if K(N.DemonsBite, nil, nil, not h:IsSpellInRange(N.DemonsBite)) then
                a5 = 162243;
                return "demons_bite 26T"
            end
        end
        if a2.CastTargetIf(N.DemonsBite, V, "min", ay, aA) then
            return "demons_bite normal 28"
        end
    end
    if N.DemonsBite:IsCastable() and not N.DemonBlades:IsAvailable() and N.VengefulRetreat:TimeSinceLastCast() > 1 and
        h:IsInMeleeRange(8) and not a0 then
        if K(N.DemonsBite, nil, nil, not h:IsSpellInRange(N.DemonsBite)) then
            a5 = 162243;
            return "demons_bite normal 30"
        end
    end
    if N.FelRush:IsCastable() and h:IsInRange(15) and N.VengefulRetreat:TimeSinceLastCast() > 0.75 and not t and
        (not N.Momentum:IsAvailable() and N.DemonBlades:IsAvailable() and at()) and D then
        if K(N.FelRush, nil, nil) then
            a5 = 195072;
            return "fel_rush demonic 34"
        end
    end
    if N.Felblade:IsCastable() and not g:IsMoving() and not v and h:IsInRange(a3.Commons.FelBladeRange) and
        (not ar() and not t) then
        if K(N.Felblade, nil, nil, not h:IsSpellInRange(N.Felblade)) then
            a5 = 183226;
            return "felblade normal 34"
        end
    end
    if N.FelRush:IsCastable() and h:IsInRange(15) and N.VengefulRetreat:TimeSinceLastCast() > 0.75 and not t and
        (not ar() and not N.Momentum:IsAvailable() and at()) and D then
        if K(N.FelRush, nil, nil) then
            a5 = 195072;
            return "fel_rush demonic 34"
        end
    end
    if N.VengefulRetreat:IsCastable() and N.EyeBeam:TimeSinceLastCast() > 1 and h:IsInRange(5) and E and not t and
        not ar() then
        if K(N.VengefulRetreat, nil) then
            a5 = 198793;
            return "vengeful_retreat normal 38"
        end
    end
    if N.ThrowGlaive:IsCastable() and N.VengefulRetreat:TimeSinceLastCast() > 1 and
        h:IsInRange(a3.Commons.ThrowGlaiveRange) and N.DemonBlades:IsAvailable() then
        if K(N.ThrowGlaive, nil, nil, not h:IsSpellInRange(N.ThrowGlaive)) then
            a5 = 185123;
            return "throw_glaive normal 40"
        end
    end
    if N.SigilofFlame:IsReady() and ar(10) and (not aa and not ab) then
        if K(N.SigilofFlame, nil, nil, not h:IsSpellInRange(N.SigilofFlame)) then
            a5 = 204596;
            return "sigilofFlame demonic 42"
        end
    end
end
local function aI()
    q = HeroRotationCharDB.Toggles[6]
    o = HeroRotationCharDB.Toggles[4]
    p = HeroRotationCharDB.Toggles[5]
    r = HeroRotationCharDB.Toggles[12]
    s = not HeroRotationCharDB.Toggles[15]
    t = HeroRotationCharDB.Toggles[40]
    w = HeroRotationCharDB.Toggles[41]
    u = HeroRotationCharDB.Toggles[42]
    v = HeroRotationCharDB.Toggles[43]
    C = HeroRotationCharDB.Toggles[44]
    x = HeroRotationCharDB.Toggles[45]
    y = HeroRotationCharDB.Toggles[46]
    z = HeroRotationCharDB.Toggles[47]
    A = HeroRotationCharDB.Toggles[48]
    B = HeroRotationCharDB.Toggles[49]
    H = GetInventoryItemID("player", 13)
    I = GetInventoryItemID("player", 14)
    if not a3.Commons.Enabled.TopTrinket and not a3.Commons.Enabled.BotTrinket then
        P = {H, I, O.CacheofAcquiredTreasures:ID()}
    elseif not a3.Commons.Enabled.TopTrinket and a3.Commons.Enabled.BotTrinket then
        P = {H, O.CacheofAcquiredTreasures:ID()}
    elseif not a3.Commons.Enabled.BotTrinket and a3.Commons.Enabled.TopTrinket then
        P = {I, O.CacheofAcquiredTreasures:ID()}
    end
    D = a3.Havoc.FelRushMode == "All In" or a3.Havoc.FelRushMode == "Safe" and
            N.Felblade:CooldownRemains(BypassRecovery) <= 0 or a3.Havoc.FelRushMode == "w/ Gap Closer" and
            (N.Felblade:CooldownRemains(BypassRecovery) <= 0 or N.Metamorphosis:CooldownRemains(BypassRecovery) <= 0 and
                F or N.FelRush:Charges() == 2 or N.TheHunt:CooldownRemains(BypassRecovery) <= 0 and o)
    E = a3.Havoc.VengefulRetreatMode == "All In" or a3.Havoc.VengefulRetreatMode == "Safe" and
            N.Felblade:CooldownRemains(BypassRecovery) <= 0 or a3.Havoc.VengefulRetreatMode == "w/ Gap Closer" and
            (N.Felblade:CooldownRemains(BypassRecovery) <= 0 or N.Metamorphosis:CooldownRemains(BypassRecovery) <= 0 and
                F or N.FelRush:CooldownRemains(BypassRecovery) <= 0 or N.TheHunt:CooldownRemains(BypassRecovery) <= 0 and
                o)
    F = false;
    G = false;
    if a3.Havoc.IncludedCooldowns.Metamorphosis and l.CDsON() or a3.Havoc.IncludedSmallCooldowns.Metamorphosis and
        (l.CDsON() or p) or not a3.Havoc.IncludedSmallCooldowns.Metamorphosis and
        not a3.Havoc.IncludedCooldowns.Metamorphosis then
        F = true
    end
    if a3.Havoc.IncludedCooldowns.EyeBeam and l.CDsON() and not z or a3.Havoc.IncludedSmallCooldowns.EyeBeam and
        (l.CDsON() or p) and not z or not a3.Havoc.IncludedSmallCooldowns.EyeBeam and
        not a3.Havoc.IncludedCooldowns.EyeBeam and not z then
        G = true
    end
    J = 0;
    for aJ = 1, 20 do
        if select(10, UnitDebuff("player", aJ)) == 240447 then
            if select(6, UnitDebuff("player", aJ)) ~= nil then
                J = select(6, UnitDebuff("player", aJ)) - GetTime()
            end
        end
    end
end
local function aK()
    if m() then
        V = g:GetEnemiesInMeleeRange(8)
        W = g:GetEnemiesInMeleeRange(20)
        X = #V;
        Y = #W
    else
        X = 1;
        Y = 1
    end
    if N.Detainment:IsAvailable() then
        Imprison = N.Imprison2
    else
        Imprison = N.Imprison
    end
    UnitsWithoutBWCount = au(V)
    UnitsWithoutSGCount = aw(V)
    aI()
    if l.QueuedCast() then
        a5 = l.QueuedCast()
        return "Custom Queue " .. j(a5):ID()
    end
    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if N.ThrowGlaive:IsCastable() and f("mouseover"):IsInMeleeRange(30) then
            if K(N.ThrowGlaive, nil) then
                a6 = 1185123;
                return "explosive MO SWD"
            end
        end
    end
    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if N.ThrowGlaive:IsCastable() and h:IsInMeleeRange(30) then
            if K(N.ThrowGlaive, nil) then
                a5 = 1185123;
                return "explosive  SWD"
            end
        end
    end
    ai = d.FightRemains(V, false)
    if not BotOn then
        a6 = 0;
        a5 = 0
    end
    if a6 > 0 then
        a6 = 0
    end
    if a5 > 0 then
        a5 = 0
    end
    a7 = false;
    NecroPetsUpCount = an(V)
    if g:IsChanneling(N.EyeBeam) then
        if K(N.Pool) then
            a5 = 9999;
            return "casting EB"
        end
    end
    if w and Imprison:IsCastable(BypassRecovery) and Imprison:CooldownRemains() <= 0 and f("mouseover"):GUID() ~= nil then
        if K(Imprison, nil, nil, nil) then
            a6 = 231;
            return "queue Imprison MO"
        end
    elseif w and Imprison:IsCastable(BypassRecovery) and Imprison:CooldownRemains() <= 0 and a2.TargetIsValid() then
        if K(Imprison, nil, nil, nil) then
            a5 = 217832;
            return "queue Imprison"
        end
    elseif (not Imprison:IsUsableP() or Imprison:CooldownRemains() > 0) and w then
        HeroRotationCharDB.Toggles[41] = not HeroRotationCharDB.Toggles[41]
        l.Print("Imprison Queue is now " .. (HeroRotationCharDB.Toggles[41] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if x and N.FelEruption:IsCastable(BypassRecovery) and N.FelEruption:CooldownRemains(BypassRecovery) <= 0 and
        N.FelEruption:IsAvailable() and f("mouseover"):GUID() ~= nil then
        if K(N.FelEruption, nil, nil, nil) then
            a6 = 1211881;
            return "queue Fel Eruption"
        end
    elseif x and N.FelEruption:IsCastable(BypassRecovery) and N.FelEruption:CooldownRemains(BypassRecovery) <= 0 and
        N.FelEruption:IsAvailable() and a2.TargetIsValid() then
        if K(N.FelEruption, nil, nil, nil) then
            a5 = 211881;
            return "queue Fel Eruption"
        end
    elseif (not N.FelEruption:IsUsableP() and g:Fury() > 10 or N.FelEruption:CooldownRemains() > 0 or
        not N.FelEruption:IsAvailable()) and x then
        HeroRotationCharDB.Toggles[45] = not HeroRotationCharDB.Toggles[45]
        l.Print("Fel Eruption Queue is now " ..
                    (HeroRotationCharDB.Toggles[45] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if y and N.ChaosNova:IsCastable(BypassRecovery) and N.ChaosNova:CooldownRemains(BypassRecovery) <= 0 and g:Fury() >=
        30 then
        if K(N.ChaosNova, nil, nil, nil) then
            a5 = 179057;
            return "queue Chaos Nova MO"
        end
    elseif (not N.ChaosNova:IsUsableP() and g:Fury() > 30 or N.ChaosNova:CooldownRemains() > 0 or not a2.TargetIsValid()) and
        y then
        HeroRotationCharDB.Toggles[46] = not HeroRotationCharDB.Toggles[46]
        l.Print("ChaosNova Queue is now " ..
                    (HeroRotationCharDB.Toggles[46] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if Q and N.ChaosNova:IsCastable(BypassRecovery) and N.ChaosNova:CooldownRemains(BypassRecovery) <= 0 and g:Fury() >=
        30 then
        if K(N.ChaosNova, nil, nil, nil) then
            a5 = 179057;
            return "queue Chaos Nova MO"
        end
    elseif (not N.ChaosNova:IsUsableP() and g:Fury() > 30 or N.ChaosNova:CooldownRemains() > 0 or not a2.TargetIsValid()) and
        y then
        HeroRotationCharDB.Toggles[46] = not HeroRotationCharDB.Toggles[46]
        l.Print("ChaosNova Queue is now " ..
                    (HeroRotationCharDB.Toggles[46] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if A and N.FelRush:IsCastable(BypassRecovery) and N.FelRush:CooldownRemains(BypassRecovery) <= 0 then
        if K(N.FelRush, nil, nil, nil) then
            a5 = 195072;
            return "queue FelRush"
        end
    elseif (not N.FelRush:IsUsableP() or N.FelRush:CooldownRemains() > 0) and A then
        HeroRotationCharDB.Toggles[48] = not HeroRotationCharDB.Toggles[48]
        l.Print("Fel Rush Queue is now " .. (HeroRotationCharDB.Toggles[48] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if B and N.Darkness:IsCastable(BypassRecovery) and N.Darkness:CooldownRemains(BypassRecovery) <= 0 then
        if K(N.Darkness, nil, nil, nil) then
            a5 = 196718;
            return "queue FelRush"
        end
    elseif (not N.Darkness:IsUsableP() or N.Darkness:CooldownRemains() > 0) and B then
        HeroRotationCharDB.Toggles[49] = not HeroRotationCharDB.Toggles[49]
        l.Print("Darkness Queue is now " .. (HeroRotationCharDB.Toggles[49] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if g:FuryDeficit() >= 35 and not g:IsChanneling(N.EyeBeam) or not g:AffectingCombat() then
        a7 = true
    end
    if a2.TargetIsValid() then
        af = 0;
        if S:TrinketHasStatAnyDps() and (not T:TrinketHasStatAnyDps() or S:Cooldown() >= T:Cooldown()) then
            af = 1
        end
        if T:TrinketHasStatAnyDps() and (not S:TrinketHasStatAnyDps() or T:Cooldown() >= S:Cooldown()) then
            af = 2
        end
        ag = N.BlindFury:IsAvailable() and (Z or N.DemonBlades:IsAvailable() and not a1)
        if not g:AffectingCombat() and q then
            local U = aD()
            if U then
                return U
            end
        end
        if not _ and not Z then
            a9 = N.FirstBlood:IsAvailable() or X >= 3 - ak(N.TrailofRuin:IsAvailable())
        end
        if _ then
            a9 = g:BuffDown(N.ChaosTheoryBuff) or N.FirstBlood:IsAvailable() and X >= 2 -
                     ak(N.TrailofRuin:IsAvailable()) or not N.CycleofHatred:IsAvailable() and X >= 4 -
                     ak(N.TrailofRuin:IsAvailable())
        end
        if Z then
            a9 = N.FirstBlood:IsAvailable() or
                     (g:BuffUp(N.MetamorphosisBuff) or N.TrailofRuin:IsAvailable() or h:DebuffUp(N.EssenceBreakDebuff)) and
                     X >= 3 - ak(N.TrailofRuin:IsAvailable()) or not N.Demonic:IsAvailable() and X >= 4
        end
        if N.EssenceBreak:IsAvailable() and N.EssenceBreak:CooldownUp() then
            a9 = false
        end
        if a1 and N.CycleofHatred:IsAvailable() then
            a9 = a9 and N.SinfulBrandDebuff:AuraActiveCount() < 2
        end
        a8 = not N.Demonic:IsAvailable() and (N.Metamorphosis:CooldownRemains() < 6 and F) and g:FuryDeficit() > 30;
        aa = a9 and g:Fury() < 75 - ak(N.FirstBlood:IsAvailable()) * 20;
        ab = N.Demonic:IsAvailable() and not N.BlindFury:IsAvailable() and N.EyeBeam:CooldownRemains() < g:GCD() * 2 and
                 G and g:FuryDeficit() > 20;
        ad = N.Momentum:IsAvailable() and g:BuffDown(N.MomentumBuff)
        if a1 then
            ae = h:DebuffDown(N.SinfulBrandDebuff) and N.SinfulBrand:CooldownRemains() < g:GCD() * 4 and
                     (N.Metamorphosis:CooldownDown() or X == 1) and Y <= 3
        end
        for aJ = 1, 25 do
            local aL, aM, aM, aN = UnitBuff("target", aJ)
            if aN ~= nil and aN == "Magic" then
                if N.ConsumeMagic:IsCastable() and C and h:IsInRange(30) then
                    if K(N.ConsumeMagic, nil) then
                        a5 = 278326;
                        return "Consume Magic"
                    end
                end
            end
        end
        if O.CruciformVeinripper:IsEquipped() and h:DebuffUp(N.SadisticGleeDebuff) and UnitsWithoutSGCount > 0 and
            a3.Havoc.TargetSwap == "AutoSwap" and not r then
            a6 = 999
        end
        if NecroPetsUpCount > 0 and N.ThrowGlaive:IsCastable() and (h:IsInRange(8) or g:HealthPercentage() <= 25) then
            a6 = 21185123
        end
        if N.Blur:IsCastable() and g:HealthPercentage() <= a3.Havoc.BlurHealthThreshold and g:AffectingCombat() then
            if K(N.Blur, nil) then
                a5 = 198589;
                return "Blur defensives (Danger)"
            end
        end
        if g:HealthPercentage() < a3.Havoc.PhialHP and O.PhialofSerenity:IsReady() and
            O.PhialofSerenity:CooldownRemains() <= 0 and aj == 1 then
            if l.Cast(O.PhialofSerenity, nil) then
                a5 = 55;
                return "PhialofSerenity HP"
            end
        end
        if g:HealthPercentage() < a3.Havoc.HealthstoneHP and O.Healthstone:IsReady() and O.Healthstone:CooldownRemains() <=
            0 then
            if l.Cast(O.Healthstone, nil) then
                a5 = 40;
                return "Healthstone HP"
            end
        end
        if g:HealthPercentage() < a3.Havoc.HealPotHP and O.CosmicHealPot:IsReady() and O.CosmicHealPot:CooldownRemains() <=
            0 then
            if l.Cast(O.CosmicHealPot, nil) then
                a5 = 45;
                return "CosmicHealPot HP"
            end
        end
        if g:HealthPercentage() < a3.Havoc.HealPotHP and O.HealPot:IsReady() and O.HealPot:CooldownRemains() <= 0 then
            if l.Cast(O.HealPot, nil) then
                a5 = 41;
                return "HealPot HP"
            end
        end
        if g:AffectingCombat() then
            local U = aE()
            if U then
                return U
            end
        end
        if N.ThrowGlaive:IsCastable() and h:IsInMeleeRange(a3.Commons.ThrowGlaiveRange) and
            N.VengefulRetreat:TimeSinceLastCast() > 1 and g:AffectingCombat() and
            (g:BuffStack(N.FelBombardmentBuff) == 5 and
                (g:BuffUp(N.ImmolationAuraBuff) or g:BuffDown(N.MetamorphosisBuff))) then
            if K(N.ThrowGlaive, nil, nil, not h:IsSpellInRange(N.ThrowGlaive)) then
                a5 = 185123;
                return "throw_glaive fel_bombardment"
            end
        end
        if N.Demonic:IsAvailable() and g:AffectingCombat() then
            local U = aG()
            if U then
                return U
            end
        end
        if true then
            local U = aH()
            if U then
                return U
            end
        end
    end
end
local function aO()
    N.SinfulBrandDebuff:RegisterAuraTracking()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        l.ToggleIconFrame:UpdateButtonText(6)
    end
end
function ReturnSpell()
    if a5 == 0 then
        return 0
    else
        return a5
    end
end
function ReturnSpellMO()
    if a6 == 0 then
        return 0
    else
        return a6
    end
end
function ShouldOrb()
    return a7
end
l.SetAPL(577, aK, aO)
