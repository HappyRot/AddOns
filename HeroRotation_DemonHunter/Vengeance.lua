local e, e = ...
local e = HeroDBC.DBC
local l = HeroLib
local e = HeroCache
local e = l.Unit
local t = e.Player
local i = e.Target
local e = e.Pet
local e = l.Spell
local o = l.Item
local s = HeroRotation
local _ = s.AoEON
local z = s.CDsON
local a = s.Cast
local n = s.CastSuggested
local e = e.DemonHunter.Vengeance
local d = o.DemonHunter.Vengeance
local E = { d.PulsatingStoneheart:ID(), d.DarkmoonDeckIndomitable:ID() }
local v = s.Commons.Everyone
local o = { General = s.GUISettings.General, Commons = s.GUISettings.APL.DemonHunter.Commons, Vengeance = s.GUISettings.APL.DemonHunter.Vengeance }
local n
local r, n, m
local h, u
local y
local f
local p
local w
local c = (e.AgonizingFlames:IsAvailable() and e.BurningAlive:IsAvailable() and e.CharredFlesh:IsAvailable())
local g = t:HasLegendaryEquipped(27)
local b = t:CovenantID()
l:RegisterForEvent(function()
    b = t:CovenantID()
end, "COVENANT_CHOSEN")
l:RegisterForEvent(function()
    c = (e.AgonizingFlames:IsAvailable() and e.BurningAlive:IsAvailable() and e.CharredFlesh:IsAvailable())
end, "PLAYER_SPECIALIZATION_CHANGED", "PLAYER_TALENT_UPDATE")
l:RegisterForEvent(function()
    g = t:HasLegendaryEquipped(27)
end, "PLAYER_EQUIPMENT_CHANGED")
local function x()
    r = t:BuffStack(e.SoulFragments)
    if e.SpiritBomb:TimeSinceLastCast() < t:GCD() or e.SoulCleave:TimeSinceLastCast() < t:GCD() then
        n = 0
        return 
    end

    if n == 0 then
        if e.Fracture:IsAvailable() then
            if e.Fracture:TimeSinceLastCast() < t:GCD() and e.Fracture.LastCastTime ~= m then
                n = math.min(r + 2, 5)
                m = e.Fracture.LastCastTime
            end

        else
            if e.Shear:TimeSinceLastCast() < t:GCD() and e.Fracture.Shear ~= m then
                n = math.min(r + 1, 5)
                m = e.Shear.LastCastTime
            end

        end

    else
        if e.Fracture:IsAvailable() then
            if e.Fracture:TimeSinceLastCast() >= t:GCD() then
                n = 0
            end

        else
            if e.Shear:TimeSinceLastCast() >= t:GCD() then
                n = 0
            end

        end

    end

    if n == nil then
        n = 0
    end

        if n > r then
        r = n
    elseif n > 0 then
        n = 0
    end

end

local function j()
    if e.Felblade:TimeSinceLastCast() < t:GCD() or e.InfernalStrike:TimeSinceLastCast() < t:GCD() then
        h = true
        u = true
        return 
    end

    h = i:IsInMeleeRange(5)
    u = h or w > 0
end

local function q()
    if e.InfernalStrike:IsCastable() and not h then
        if a(e.InfernalStrike, nil, nil, not i:IsInRange(30)) then
            return "infernal_strike 6"
        end

    end

    if e.Fracture:IsCastable() and h then
        if a(e.Fracture) then
            return "fracture 8"
        end

    end

end

local function k()
    if e.DemonSpikes:IsCastable() and t:BuffDown(e.DemonSpikesBuff) and t:BuffDown(e.MetamorphosisBuff) then
                if e.DemonSpikes:ChargesFractional() > 1.9 then
            if a(e.DemonSpikes, o.Vengeance.OffGCDasOffGCD.DemonSpikes) then
                return "demon_spikes defensives (Capped)"
            end

        elseif (y or t:HealthPercentage() <= o.Vengeance.DemonSpikesHealthThreshold) then
            if a(e.DemonSpikes, o.Vengeance.OffGCDasOffGCD.DemonSpikes) then
                return "demon_spikes defensives (Danger)"
            end

        end

    end

    if d.DarkmoonDeckIndomitable:IsEquipped() and d.DarkmoonDeckIndomitable:IsReady() and o.Commons.Enabled.Trinkets and t:HealthPercentage() <= 75 then
        if a(d.DarkmoonDeckIndomitable, nil, o.Commons.DisplayStyle.Trinkets) then
            return "darkmoon_deck_indomitable defensives"
        end

    end

    if e.Metamorphosis:IsCastable() and t:HealthPercentage() <= o.Vengeance.MetamorphosisHealthThreshold and (t:BuffDown(e.MetamorphosisBuff) and (not e.SinfulBrand:IsAvailable() or i:DebuffDown(e.SinfulBrandDebuff)) or i:TimeToDie() < 15) then
        if a(e.Metamorphosis, nil, o.Commons.DisplayStyle.Metamorphosis) then
            return "metamorphosis defensives"
        end

    end

    if e.FieryBrand:IsCastable() and i:DebuffDown(e.FieryBrandDebuff) and (y or t:HealthPercentage() <= o.Vengeance.FieryBrandHealthThreshold) then
        if a(e.FieryBrand, o.Vengeance.OffGCDasOffGCD.FieryBrand, nil, not i:IsSpellInRange(e.FieryBrand)) then
            return "fiery_brand defensives"
        end

    end

    if e.DoorofShadows:IsCastable() and e.EnduringGloom:IsAvailable() and f then
        if a(e.DoorofShadows, nil, o.Commons.DisplayStyle.Covenant) then
            return "door_of_shadows defensives"
        end

    end

end

local function l()
    if e.FieryBrand:IsCastable() and h then
        if a(e.FieryBrand, o.Vengeance.OffGCDasOffGCD.FieryBrand, nil, not i:IsSpellInRange(e.FieryBrand)) then
            return "fiery_brand 92"
        end

    end

    if e.ImmolationAura:IsCastable() and h and (i:DebuffUp(e.FieryBrandDebuff)) then
        if a(e.ImmolationAura) then
            return "immolation_aura 88"
        end

    end

end

local function m()
    if d.PotionofPhantomFire:IsReady() and o.Commons.Enabled.Potions then
        if a(d.PotionofPhantomFire, nil, o.Commons.DisplayStyle.Potions) then
            return "potion_of_unbridled_fury 60"
        end

    end

    if o.Commons.Enabled.Trinkets then
        local e = t:GetUseableTrinkets(E)
        if e then
            if a(e, nil, o.Commons.DisplayStyle.Trinkets) then
                return "Generic use_items for " .. e:Name()
            end

        end

    end

    if e.SinfulBrand:IsCastable() and (i:BuffDown(e.SinfulBrandDebuff)) then
        if a(e.SinfulBrand, nil, o.Commons.DisplayStyle.Covenant, not i:IsSpellInRange(e.SinfulBrand)) then
            return "sinful_brand 74"
        end

    end

    if e.TheHunt:IsCastable() then
        if a(e.TheHunt, nil, o.Commons.DisplayStyle.Covenant, not i:IsSpellInRange(e.TheHunt)) then
            return "the_hunt 76"
        end

    end

    if e.ElysianDecree:IsCastable() then
        if a(e.ElysianDecree, nil, o.Commons.DisplayStyle.Covenant) then
            return "elysian_decree 80"
        end

    end

end

local function n()
    if e.InfernalStrike:IsCastable() and (not o.Vengeance.ConserveInfernalStrike or e.InfernalStrike:ChargesFractional() > 1.9) and (e.InfernalStrike:TimeSinceLastCast() > 2) then
        if a(e.InfernalStrike, o.Vengeance.OffGCDasOffGCD.InfernalStrike, nil, not i:IsInRange(30)) then
            return "infernal_strike 24"
        end

    end

    if e.BulkExtraction:IsCastable() then
        if a(e.BulkExtraction) then
            return "bulk_extraction 26"
        end

    end

    if e.SpiritBomb:IsReady() and u and ((t:BuffUp(e.Metamorphosis) and e.Fracture:IsAvailable() and r >= 3) or r >= 4) then
        if a(e.SpiritBomb) then
            return "spirit_bomb 28"
        end

    end

    if e.FelDevastation:IsReady() and (e.Demonic:IsAvailable() and t:BuffDown(e.Metamorphosis) or not e.Demonic:IsAvailable()) then
        if a(e.FelDevastation, o.Vengeance.GCDasOffGCD.FelDevastation, nil, not i:IsInMeleeRange(20)) then
            return "fel_devastation 34"
        end

    end

    if e.SoulCleave:IsReady() and (((e.SpiritBomb:IsAvailable() and r == 0) or not e.SpiritBomb:IsAvailable()) and ((e.Fracture:IsAvailable() and t:Fury() >= 55) or (not e.Fracture:IsAvailable() and t:Fury() >= 70) or e.FelDevastation:CooldownRemains() > i:TimeToDie() or (t:BuffUp(e.MetamorphosisBuff) and ((e.Fracture:IsAvailable() and t:Fury() >= 35) or (not e.Fracture:IsAvailable() and t:Fury() >= 50))))) then
        if a(e.SoulCleave, nil, nil, not i:IsSpellInRange(e.SoulCleave)) then
            return "soul_cleave 36"
        end

    end

    if e.ImmolationAura:IsCastable() and (((c and e.FieryBrand:CooldownRemains() > 10) or not c) and t:Fury() <= 90) then
        if a(e.ImmolationAura) then
            return "immolation_aura 38"
        end

    end

    if e.Felblade:IsCastable() and (t:Fury() <= 60) then
        if a(e.Felblade, nil, nil, not i:IsSpellInRange(e.Felblade)) then
            return "felblade 40"
        end

    end

    if e.Fracture:IsCastable() and h and ((e.SpiritBomb:IsAvailable() and r <= 3) or (not e.SpiritBomb:IsAvailable() and ((t:BuffUp(e.MetamorphosisBuff) and t:Fury() <= 55) or (t:BuffDown(e.MetamorphosisBuff) and t:Fury() <= 70)))) then
        if a(e.Fracture) then
            return "fracture 42"
        end

    end

    if e.SigilofFlame:IsCastable() and (u or not e.ConcentratedSigils:IsAvailable()) and i:DebuffRemains(e.SigilofFlameDebuff) <= 3 and (not (b == 1 and g)) then
        if e.ConcentratedSigils:IsAvailable() then
            if a(e.SigilofFlame, nil, nil, not u) then
                return "sigil_of_flame 44 (Concentrated)"
            end

        else
            if a(e.SigilofFlame, nil, nil, not i:IsInRange(30)) then
                return "sigil_of_flame 44 (Normal)"
            end

        end

    end

    if e.Shear:IsReady() and h then
        if a(e.Shear) then
            return "shear 46"
        end

    end

    if e.Fracture:IsCastable() and h then
        if a(e.Fracture) then
            return "fracture 48"
        end

    end

    if e.ThrowGlaive:IsCastable() then
        if a(e.ThrowGlaive, nil, nil, not i:IsSpellInRange(e.ThrowGlaive)) then
            return "throw_glaive 50 (OOR)"
        end

    end

end

local function h()
    p = t:GetEnemiesInMeleeRange(8)
    if (_()) then
        w = #p
    else
        w = 1
    end

    x()
    j()
    y = t:ActiveMitigationNeeded()
    f = t:IsTankingAoE(8) or t:IsTanking(i)
    if v.TargetIsValid() then
        if not t:AffectingCombat() then
            local e = q()
            if e then
                return e
            end

        end

        local o = v.Interrupt(10, e.Disrupt, o.Commons.OffGCDasOffGCD.Disrupt, false)
        if o then
            return o
        end

        if e.ThrowGlaive:IsCastable() and (t:BuffStack(e.FelBombardmentBuff) == 5 and (t:BuffUp(e.ImmolationAuraBuff) or t:BuffDown(e.MetamorphosisBuff))) then
            if a(e.ThrowGlaive, nil, nil, not i:IsSpellInRange(e.ThrowGlaive)) then
                return "throw_glaive fel_bombardment"
            end

        end

        if c then
            local e = l()
            if e then
                return e
            end

        end

        if (f) then
            local e = k()
            if e then
                return e
            end

        end

        if (z()) then
            local e = m()
            if e then
                return e
            end

        end

        local t = n()
        if t then
            return t
        end

        if s.CastAnnotated(e.Pool, false, "WAIT") then
            return "Wait/Pool Resources"
        end

    end

end

local function e()
end

s.SetAPL(581, h, e)

