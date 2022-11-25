local e, e = ...
local e = HeroDBC.DBC
local w = HeroLib
local e = HeroCache
local m = w.Unit
local t = m.Player
local i = m.Target
local e = m.Boss
local c = m.Pet
local M = w.Spell
local E = w.Item
local d = HeroRotation
local o = d.Cast
local h = d.CDsON
local D = d.AoEON
local g = HeroRotationCharDB.Toggles[4]
local I = HeroRotationCharDB.Toggles[5]
local se = HeroRotationCharDB.Toggles[6]
local re = HeroRotationCharDB.Toggles[10]
local pe = HeroRotationCharDB.Toggles[11]
local T = HeroRotationCharDB.Toggles[12]
local V = HeroRotationCharDB.Toggles[13]
local C = HeroRotationCharDB.Toggles[14]
local te = HeroRotationCharDB.Toggles[15]
local U = HeroRotationCharDB.Toggles[16]
local X = HeroRotationCharDB.Toggles[17]
local N = HeroRotationCharDB.Toggles[18]
local ne = nil
local W = nil
local e = false
local e = false
local ve = false
local e = false
local e = false
local e = false
local e = 0
local ae = false
local Z = table.insert
local e = M.DeathKnight.Unholy
local b = E.DeathKnight.Unholy
local be = {  }
local _ = t:GetEquipment()
local de = _[13] and E(_[13]) or E(0)
local Q = _[14] and E(_[14]) or E(0)
local oe, a = GetInventoryItemID("player", 13)
local ee, ie = GetInventoryItemID("player", 14)
local qe
local ke
local l = d.Commons.Everyone
local n = { General = d.GUISettings.General, Commons = d.GUISettings.APL.DeathKnight.Commons, Unholy = d.GUISettings.APL.DeathKnight.Unholy }
local L
local he
local Y
local a
local F
local S
local ge
local y
local v
local z, H
local O, A
local k
local j
local a, a
local a
local x
local B = 11111
local u = 11111
local p = w.GhoulTable
local a = 0
local s = 0
local f, r
local R, q
local J
local le = t:HasLegendaryEquipped(30)
local K = t:HasLegendaryEquipped(31)
local ce = t:HasLegendaryEquipped(45)
local ue = t:HasLegendaryEquipped(44)
local me = t:HasLegendaryEquipped(210)
local P = t:HasLegendaryEquipped(213)
local G = t:CovenantID()
w:RegisterForEvent(function()
    G = t:CovenantID()
end, "COVENANT_CHOSEN")
w:RegisterForEvent(function()
    _ = t:GetEquipment()
    de = _[13] and E(_[13]) or E(0)
    Q = _[14] and E(_[14]) or E(0)
    le = t:HasLegendaryEquipped(30)
    K = t:HasLegendaryEquipped(31)
    ce = t:HasLegendaryEquipped(45)
    ue = t:HasLegendaryEquipped(44)
    me = t:HasLegendaryEquipped(210)
    P = t:HasLegendaryEquipped(213)
end, "PLAYER_EQUIPMENT_CHANGED")
w:RegisterForEvent(function()
    B = 11111
    u = 11111
end, "PLAYER_REGEN_ENABLED")
local function E(e)
    if e then
        return 1
    else
        return 0
    end

end

local function _(e)
    return e ~= 0
end

local function xe()
    return (n.General.SoloMode and (t:HealthPercentage() < n.Commons.UseDeathStrikeHP or t:HealthPercentage() < n.Commons.UseDarkSuccorHP and t:BuffUp(e.DeathStrikeBuff)))
end

local function ze(a)
    local t = 0
    if a ~= nil then
        for o, a in pairs(a) do
            if a:DebuffDown(e.VirulentPlagueDebuff) and a:IsInMeleeRange(8) then
                t = t + 1
            end

        end

    end

    return t
end

local function je(e)
    local a = {  }
    if e ~= nil then
        for t in pairs(e) do
            if not m:IsInBossList(e[t]["UnitNPCID"]) then
                Z(a, e[t])
            end

        end

    end

    return w.FightRemains(a)
end

local function _(t)
    return (t:DebuffStack(e.FesteringWoundDebuff))
end

local function de(t)
    return (t:DebuffRemains(e.SoulReaper))
end

local function le(o)
                if ((o:DebuffUp(e.FesteringWoundDebuff) and v and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and o:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 1275699
        return true
    elseif ((o:DebuffUp(e.FesteringWoundDebuff) and v and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and n.Unholy.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not T) then
        s = 999
        return true
    elseif ((o:DebuffUp(e.FesteringWoundDebuff) and v and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and o:GUID() == i:GUID()) then
        a = 275699
        return true
    elseif (o:DebuffUp(e.FesteringWoundDebuff) and v and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) then
        return true
    end

end

local function ue(e)
            if (e:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 1275699
        return true
    elseif (n.Unholy.TargetSwap == "AutoSwap" and e:GUID() ~= i:GUID() and not T) then
        s = 999
        return true
    elseif (e:GUID() == i:GUID()) then
        a = 275699
        return true
    else
        return true
    end

end

local function ye(t)
                if ((t:TimeToX(35) < 5 and t:TimeToDie() > (t:DebuffRemains(e.SoulReaper) + 5)) and t:TimeToDie() > 5 and t:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 343294
        return true
    elseif ((t:TimeToX(35) < 5 and t:TimeToDie() > (t:DebuffRemains(e.SoulReaper) + 5)) and n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= i:GUID() and not T) then
        s = 999
        return true
    elseif ((t:TimeToX(35) < 5 and t:TimeToDie() > (t:DebuffRemains(e.SoulReaper) + 5)) and t:TimeToDie() > 5 and t:GUID() == i:GUID()) then
        a = 343294
        return true
    elseif ((t:TimeToX(35) < 5 and t:TimeToDie() > (t:DebuffRemains(e.SoulReaper) + 5)) and t:TimeToDie() > 5) then
        return true
    end

end

local function we(t)
                if ((t:DebuffStack(e.FesteringWoundDebuff) < 4) and t:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 185948
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) < 4) and n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= i:GUID() and not T) then
        s = 999
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) < 4) and t:GUID() == i:GUID()) then
        a = 85948
        return true
    elseif (t:DebuffStack(e.FesteringWoundDebuff) < 4) then
        return true
    end

end

local function Q(e)
            if (e:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 185948
        return true
    elseif (n.Unholy.TargetSwap == "AutoSwap" and e:GUID() ~= i:GUID() and not T) then
        s = 999
        return true
    elseif (e:GUID() == i:GUID()) then
        a = 85948
        return true
    else
        return true
    end

end

local function Z(t)
                if ((t:DebuffStack(e.FesteringWoundDebuff) <= 2) and t:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 1207289
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) <= 2) and n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= i:GUID() and not T) then
        s = 999
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) <= 2) and t:GUID() == i:GUID()) then
        a = 207289
        return true
    elseif (t:DebuffStack(e.FesteringWoundDebuff) <= 2) then
        return true
    end

end

local function Z(t)
            if (t:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        if e.ClawingShadows:IsAvailable() then
            s = 1207311
            return true
        else
            s = 155090
            return true
        end

    elseif (n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= i:GUID() and not T) then
        s = 999
        return true
    elseif (t:GUID() == i:GUID()) then
        if e.ClawingShadows:IsAvailable() then
            a = 207311
            return true
        else
            a = 55090
            return true
        end

    else
        return true
    end

end

local function me(e)
            if (e:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 1390279
        return true
    elseif (n.Unholy.TargetSwap == "AutoSwap" and e:GUID() ~= i:GUID() and not T) then
        s = 999
        return true
    elseif (e:GUID() == i:GUID()) then
        a = 390279
        return true
    else
        return true
    end

end

local function ce()
    if e.RaiseDead:IsCastable() then
        if o(e.RaiseDead, nil, nil) then
            a = 46584
            return "raise_dead precombat 2 displaystyle"
        end

    end

    if e.Outbreak:IsReady() and not i:IsInMeleeRange(8) then
        if o(e.Outbreak, nil, nil, not i:IsSpellInRange(e.Outbreak)) then
            a = 77575
            return "outbreak precombat 8"
        end

    end

    if e.FesteringStrike:IsReady() and i:IsInMeleeRange(8) then
        if o(e.FesteringStrike) then
            a = 85948
            return "festering_strike precombat 6"
        end

    end

end

local function fe()
    if j:IsReady() and ((t:BuffDown(e.DeathAndDecayBuff) and v and ((e.Festermight:IsAvailable() and t:BuffRemains(e.FestermightBuff) < 3) or not e.Festermight:IsAvailable()) and (e.FesteringWoundDebuff:AuraActiveCount() == r or e.FesteringWoundDebuff:AuraActiveCount() == 8 or (not e.BurstingSores:IsAvailable() and not e.VileContagion:IsAvailable()) or ((e.VileContagion:CooldownDown() or not e.VileContagion:IsAvailable()) and c:BuffUp(e.DarkTransformation) and e.InfectedClaws:IsAvailable() and (t:BuffUp(e.EmpowerRuneWeaponBuff) or t:BuffUp(e.UnholyAssaultBuff))))) or u < 10) then
        if o(j, nil) then
            a = 43265
            return "any_dnd aoe 4"
        end

    end

    if e.AbominationLimb:IsCastable() and g and not N and (t:Rune() == 0 and v) then
        if o(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 101"
        end

    end

    if e.Apocalypse:IsCastable() and I then
        if l.CastTargetIf(e.Apocalypse, f, "min", _, le, not i:IsInMeleeRange(8)) then
            return "apocalypse aoe 8"
        end

    end

    if e.FesteringStrike:IsReady() and (t:BuffDown(e.DeathAndDecayBuff) and (e.VileContagion:CooldownRemains() < 5 or (e.Apocalypse:CooldownUp() and j:CooldownDown()))) then
        if l.CastTargetIf(e.FesteringStrike, f, "max", _, we, not i:IsInMeleeRange(8)) then
            return "festering_strike aoe 10"
        end

    end

    if e.FesteringStrike:IsReady() and (t:BuffDown(e.DeathAndDecayBuff) and (e.VileContagion:CooldownRemains() > 5 or not e.VileContagion:IsAvailable())) then
        if l.CastTargetIf(e.FesteringStrike, f, "min", _, Q, not i:IsInMeleeRange(8)) then
            return "festering_strike aoe 12"
        end

    end

    if k:IsReady() and (t:BuffUp(e.DeathAndDecayBuff)) then
        if l.CastTargetIf(k, f, "max", _, Z, not i:IsInMeleeRange(8)) then
            return "wound_spender aoe 14"
        end

    end

    if e.DeathCoil:IsReady() and ((not S) and not e.Epidemic:IsAvailable()) then
        if o(e.DeathCoil, nil, nil, not i:IsSpellInRange(e.DeathCoil)) then
            a = 47541
            return "death_coil aoe 16"
        end

    end

    if e.Epidemic:IsReady() and (not S) then
        if o(e.Epidemic, nil, nil, not i:IsSpellInRange(e.Epidemic)) then
            a = 207317
            return "epidemic aoe 18"
        end

    end

    if k:IsReady() and (e.DeathAndDecay:CooldownRemains() > 10) then
        if l.CastTargetIf(k, f, "max", _, Z, not i:IsInMeleeRange(5)) then
            return "wound_spender aoe 20"
        end

    end

end

local function le()
    if n.Commons.Enabled.Potions then
        local s = l.PotionSelected()
        if s then
            local i = s:BuffDuration()
            if s:IsReady() and h() and n.Commons.Enabled.Potions and te and ((t:BloodlustUp() and d.GUISettings.General.HoldPotforBL) or (not d.GUISettings.General.HoldPotforBL and ((p:gargactive() and i >= p:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and c:BuffUp(e.DarkTransformation) and i >= c:BuffRemains(e.DarkTransformation)) or (O and A <= i) or (z and H <= i)) or u <= i)) then
                if o(s, nil) then
                    a = 50
                    return "potion cooldowns 2"
                end

            end

        end

    end

    if e.VileContagion:IsReady() and h() and (q >= 2 and j:CooldownRemains() < 3) then
        if l.CastTargetIf(e.VileContagion, R, "max", _, me, not i:IsSpellInRange(e.VileContagion), nil) then
            return "vile_contagion cooldowns 4"
        end

    end

    if e.RaiseDead:IsCastable() then
        if o(e.RaiseDead, nil, nil) then
            a = 46584
            return "raise_dead cooldowns 26 displaystyle"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and h() and ((y and t:RunicPowerDeficit() > 20 and ((p:gargactive() and z) or (not e.SummonGargoyle:IsAvailable() and e.ArmyoftheDamned:IsAvailable() and O and z) or (not e.SummonGargoyle:IsAvailable() and not e.ArmyoftheDamned:IsAvailable() and c:BuffUp(e.DarkTransformation)) or (not e.SummonGargoyle:IsAvailable() and c:BuffUp(e.DarkTransformation)))) or u <= 21) then
        if o(e.EmpowerRuneWeapon, nil) then
            a = 47568
            return "empower_rune_weapon cooldowns 10"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and h() and (v and c:BuffUp(e.DarkTransformation)) then
        if o(e.EmpowerRuneWeapon, nil) then
            a = 47568
            return "empower_rune_weapon cooldowns 12"
        end

    end

    if e.SummonGargoyle:IsReady() and h() and (e.DarkTransformation:TimeSinceLastCast() <= 4 or (not e.CommanderoftheDead:IsAvailable() and t:RunicPower() >= 40)) then
        if o(e.SummonGargoyle, nil) then
            a = 49206
            return "summon_gargoyle cooldowns 14"
        end

    end

    if e.UnholyAssault:IsReady() and h() and (y) then
        if o(e.UnholyAssault, nil, nil, not i:IsInMeleeRange(5)) then
            a = 207289
            return "unholy_assault cooldowns 16"
        end

    end

    if e.Apocalypse:IsReady() and I and (r <= 3 and ((not e.CommanderoftheDead:IsAvailable()) or (e.CommanderoftheDead:IsAvailable() and e.DarkTransformation:TimeSinceLastCast() <= 4))) then
        if l.CastTargetIf(e.Apocalypse, f, "max", _, ue, not i:IsInMeleeRange(8)) then
            return "apocalypse cooldowns 18"
        end

    end

    if e.DarkTransformation:IsCastable() and I and (y and e.Apocalypse:CooldownRemains() < t:GCD()) then
        if o(e.DarkTransformation, nil) then
            a = 63560
            return "dark_transformation cooldowns 20"
        end

    end

    if e.DarkTransformation:IsCastable() and I and ((v and ((j:CooldownRemains() < 10 and e.InfectedClaws:IsAvailable() and ((e.VileContagion:CooldownDown() and e.FesteringWoundDebuff:AuraActiveCount() < r) or not e.VileContagion:IsAvailable())) or not e.InfectedClaws:IsAvailable())) or u < 25) then
        if o(e.DarkTransformation, nil) then
            a = 63560
            return "dark_transformation cooldowns 22"
        end

    end

    if e.SoulReaper:IsReady() and (r == 1 and i:TimeToX(35) < 5 and i:TimeToDie() > 5) then
        if o(e.SoulReaper, nil, nil, not i:IsSpellInRange(e.SoulReaper)) then
            a = 343294
            return "soul_reaper cooldowns 24"
        end

    end

    if e.SoulReaper:IsReady() and (r >= 2) then
        if l.CastTargetIf(e.SoulReaper, f, "min", de, ye, not i:IsSpellInRange(e.SoulReaper)) then
            return "soul_reaper cooldowns 26"
        end

    end

    if e.UnholyBlight:IsReady() and I and (y and (((not e.Apocalypse:IsAvailable() or e.Apocalypse:CooldownDown()) and e.Morbidity:IsAvailable()) or not e.Morbidity:IsAvailable())) then
        if o(e.UnholyBlight, nil, nil, not i:IsInRange(8)) then
            a = 115989
            return "unholy_blight cooldowns 28"
        end

    end

    if e.UnholyBlight:IsReady() and I and (v or u < 21) then
        if o(e.UnholyBlight, nil, nil, not i:IsInRange(8)) then
            a = 115989
            return "unholy_blight cooldowns 30"
        end

    end

    if e.AbominationLimb:IsCastable() and g and not N and (y and t:Rune() < 3) then
        if o(e.AbominationLimb, nil) then
            a = 315443
            return "abomination_limb cooldowns 32"
        end

    end

    if e.SacrificialPact:IsReady() and h() and ((r >= 2 and c:BuffDown(e.DarkTransformation) and e.DarkTransformation:CooldownRemains() > 6) or u < t:GCD()) then
        if o(e.SacrificialPact, nil, nil, not i:IsInRange(8)) then
            a = 237574
            return "sacrificial_pact cooldowns 34"
        end

    end

end

local function Z()
    if e.SwarmingMist:IsReady() and g and ((y and t:RunicPowerDeficit() > 16 and (not e.Apocalypse:CooldownUp() or (not e.ArmyoftheDamned:IsAvailable() and not e.DarkTransformation:CooldownUp()))) or w.FilteredFightRemains(f, "<", 11)) then
        if o(e.SwarmingMist, nil, nil, not i:IsInRange(10)) then
            a = 311648
            return "swarming_mist covenants 2"
        end

    end

    if e.SwarmingMist:IsReady() and g and (e.Apocalypse:CooldownDown() and ((r >= 2 and r <= 5 and t:RunicPowerDeficit() > 10 + (r * 6) and v) or (r > 5 and t:RunicPowerDeficit() > 40))) then
        if o(e.SwarmingMist, nil, nil, not i:IsInRange(10)) then
            a = 311648
            return "swarming_mist covenants 4"
        end

    end

    if e.AbominationLimbCov:IsReady() and g and not N and ((y and not e.LeadByExample:SoulbindEnabled() and (not e.Apocalypse:CooldownUp() or (not e.ArmyoftheDamned:IsAvailable() and not e.DarkTransformation:CooldownUp())) and t:RuneTimeToX(4) > t:BuffRemains(e.RunicCorruptionBuff)) or w.FilteredFightRemains(f, "<", 12 + (E(e.KevinsOozeling:SoulbindEnabled()) * 28))) then
        if o(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 6"
        end

    end

    if e.AbominationLimbCov:IsReady() and g and not N and (y and e.LeadByExample:SoulbindEnabled() and (i:DebuffRemains(e.UnholyBlightDebuff) > 11 or (not e.UnholyBlight:IsAvailable() and not e.DarkTransformation:CooldownUp()))) then
        if o(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 8"
        end

    end

    if e.AbominationLimbCov:IsReady() and g and not N and (y and e.KevinsOozeling:SoulbindEnabled() and ((i:DebuffStack(e.FesteringWoundDebuff) >= 4 and not P) or (P and e.Apocalypse:CooldownDown()))) then
        if o(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 10"
        end

    end

    if e.AbominationLimbCov:IsReady() and g and not N and (v and t:RuneTimeToX(4) > t:BuffRemains(e.RunicCorruptionBuff)) then
        if o(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 101"
        end

    end

    if e.ShackleTheUnworthy:IsReady() and g and ((y and (e.Apocalypse:CooldownRemains() > 10 or (not e.ArmyoftheDamned:IsAvailable() and not e.DarkTransformation:CooldownUp()))) or w.FilteredFightRemains(f, "<", 15)) then
        if o(e.ShackleTheUnworthy, nil, nil, not i:IsSpellInRange(e.ShackleTheUnworthy)) then
            a = 312202
            return "shackle_the_unworthy covenants 12"
        end

    end

    if e.ShackleTheUnworthy:IsReady() and g and (v and (t:BuffUp(e.DeathAndDecayBuff) or je(R) <= 14)) then
        if o(e.ShackleTheUnworthy, nil, nil, not i:IsSpellInRange(e.ShackleTheUnworthy)) then
            a = 312202
            return "shackle_the_unworthy covenants 14"
        end

    end

end

local function de()
    if e.ArcaneTorrent:IsCastable() and h() and (t:RunicPowerDeficit() > 20 and (e.SummonGargoyle:CooldownRemains() < t:GCD() or (not e.SummonGargoyle:IsAvailable()) or (p:gargactive() and t:Rune() < 2 and x < 1))) then
        if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
            a = 28730
            return "arcane_torrent main 2"
        end

    end

    if e.BloodFury:IsCastable() and h() and ((p:gargactive() and e.BloodFury:BaseDuration() >= p:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.BloodFury:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (O and A <= e.BloodFury:BaseDuration()) or (z and H <= e.BloodFury:BaseDuration()) or (q >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or u <= e.BloodFury:BaseDuration()) then
        if o(e.BloodFury, nil) then
            a = 20572
            return "blood_fury main 4"
        end

    end

    if e.Berserking:IsCastable() and h() and (((p:gargactive() and e.Berserking:BaseDuration() >= p:gargremains()) or (not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.Berserking:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (O and A <= e.Berserking:BaseDuration()) or (z and H <= e.Berserking:BaseDuration()) or (q >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or u <= e.Berserking:BaseDuration()) then
        if o(e.Berserking, nil) then
            a = 26297
            return "berserking main 6"
        end

    end

    if e.LightsJudgment:IsCastable() and h() and (t:BuffUp(e.UnholyStrengthBuff) and ((not e.Festermight:IsAvailable()) or (t:BuffRemains(e.FestermightBuff) < i:TimeToDie()) or (t:BuffRemains(e.UnholyStrengthBuff) < i:TimeToDie()))) then
        if o(e.LightsJudgment, nil, nil, not i:IsSpellInRange(e.LightsJudgment)) then
            a = 255647
            return "lights_judgment main 8"
        end

    end

    if e.AncestralCall:IsCastable() and h() and (((p:gargactive() and 15 >= p:gargremains()) or (not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and 15 >= c:BuffRemains(e.DarkTransformation)) or (O and A <= 15) or (z and H <= 15) or (q >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or u <= 15) then
        if o(e.AncestralCall, nil) then
            a = 274738
            return "ancestral_call main 10"
        end

    end

    if e.ArcanePulse:IsCastable() and h() and (r >= 2 or (t:Rune() <= 1 and t:RunicPowerDeficit() >= 60)) then
        if o(e.ArcanePulse, nil, nil, not i:IsInRange(8)) then
            a = 260364
            return "arcane_pulse main 12"
        end

    end

    if e.Fireblood:IsCastable() and h() and (((p:gargactive() and e.Fireblood:BaseDuration() >= p:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.Fireblood:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (O and A <= e.Fireblood:BaseDuration()) or (z and H <= e.Fireblood:BaseDuration()) or (q >= 2 and t:BuffUp(e.DeathAndDecayBuff))))) or u <= e.Fireblood:BaseDuration()) then
        if o(e.Fireblood, nil) then
            a = 265221
            return "fireblood main 14"
        end

    end

    if e.BagofTricks:IsCastable() and h() and (r == 1 and (t:BuffUp(e.UnholyStrengthBuff) or w.FilteredFightRemains(f, "<", 5))) then
        if o(e.BagofTricks, nil, nil, not i:IsSpellInRange(e.BagofTricks)) then
            a = 312411
            return "bag_of_tricks main 16"
        end

    end

end

local function P()
    if e.DeathCoil:IsReady() and ((not S) and (t:Rune() < 3 or p:gargactive() or t:BuffUp(e.SuddenDoomBuff))) then
        if o(e.DeathCoil, nil, nil, not i:IsSpellInRange(e.DeathCoil)) then
            a = 47541
            return "death_coil generic 4"
        end

    end

    if j:IsReady() and (t:BuffDown(e.DeathAndDecayBuff) and ((q >= 2 and e.FesteringWoundDebuff:AuraActiveCount() == r) or G == 3 or K)) then
        if o(j, nil, nil) then
            a = 43265
            return "any_dnd generic 6"
        end

    end

    if k:IsReady() and (F or (r >= 2 and t:BuffUp(e.DeathAndDecayBuff))) then
        if o(k, nil, nil, not i:IsSpellInRange(k)) then
            if e.ClawingShadows:IsAvailable() then
                a = 207311
                return "wound_spender generic 10"
            else
                a = 55090
                return "wound_spender generic 10"
            end

        end

    end

    if e.FesteringStrike:IsReady() and (not F) then
        if l.CastTargetIf(e.FesteringStrike, f, "min", _, Q, not i:IsInMeleeRange(8)) then
            return "festering_strike generic 10"
        end

    end

    if e.DeathCoil:IsReady() then
        if o(e.DeathCoil, nil, nil, not i:IsSpellInRange(e.DeathCoil)) then
            a = 47541
            return "death_coil generic 18"
        end

    end

end

local function p()
    if b.GaveloftheFirstArbiter:IsEquippedAndReady() and i:IsInRange(30) and h() and not X and n.Commons.Enabled.Items then
        if o(b.GaveloftheFirstArbiter, nil, nil, not i:IsInRange(30)) then
            a = 1515
            return "gavel_of_the_first_arbiter trinkets 4"
        end

    end

    if h() and ((e.Apocalypse:CooldownDown() or c:BuffUp(e.DarkTransformation)) and (not b.InscrutableQuantumDevice:IsEquipped() or b.InscrutableQuantumDevice:CooldownRemains() > 0)) then
        local e = t:GetUseableTrinkets(be)
        if e then
            if o(e, nil, nil) then
                                if e:ID() == oe and n.Commons.Enabled.TopTrinket then
                    a = 30
                    return "top trinket 1"
                elseif e:ID() == ee and n.Commons.Enabled.BottomTrinket then
                    a = 31
                    return "top trinket 2"
                end

            end

        end

    end

end

local function _()
    ke = not xe()
    f = t:GetEnemiesInMeleeRange(8)
    R = i:GetEnemiesInSplashRange(10)
    oe, ie = GetInventoryItemID("player", 13)
    ee, ie = GetInventoryItemID("player", 14)
    if D() then
        r = #f
        q = #R
    else
        r = 1
        q = 1
    end

    J = ze(R)
    z = e.Apocalypse:TimeSinceLastCast() <= 15
    H = (z) and 15 - e.Apocalypse:TimeSinceLastCast() or 0
    O = e.ArmyoftheDead:TimeSinceLastCast() <= 30
    A = (A) and 30 - e.ArmyoftheDead:TimeSinceLastCast() or 0
    if l.TargetIsValid() or t:AffectingCombat() then
        B = w.BossFightRemains(nil, true)
        u = B
        if u == 11111 then
            u = w.FightRemains(Enemies10yd, false)
        end

    end

    se = HeroRotationCharDB.Toggles[6]
    g = HeroRotationCharDB.Toggles[4]
    I = HeroRotationCharDB.Toggles[5]
    re = HeroRotationCharDB.Toggles[10]
    pe = HeroRotationCharDB.Toggles[11]
    T = HeroRotationCharDB.Toggles[12]
    V = HeroRotationCharDB.Toggles[13]
    C = HeroRotationCharDB.Toggles[14]
    te = HeroRotationCharDB.Toggles[15]
    U = HeroRotationCharDB.Toggles[16]
    X = HeroRotationCharDB.Toggles[17]
    N = HeroRotationCharDB.Toggles[18]
    ae = false
    if not BotOn then
        s = 0
        a = 0
    end

    if s > 0 then
        s = 0
    end

    if a > 0 then
        a = 0
    end

end

local function c()
    k = (e.ClawingShadows:IsAvailable() and e.ClawingShadows or e.ScourgeStrike)
    j = e.DeathAndDecay
    if G == 3 then
        j = e.DeathsDue
    end

    if e.Defile:IsAvailable() then
        j = e.Defile
    end

    qe = _()
    if d.QueuedCast() then
        a = d.QueuedCast()
        return "Custom Queue " .. M(a):ID()
    end

        if d.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        ne = GetTime()
        W = ne + (d.GUISettings.General.OpenerReset)
    elseif d.GUISettings.General.OpenerReset > 0 and W ~= nil and GetTime() > W and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        d.ToggleIconFrame:UpdateButtonText(6)
        d.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (V and e.AntiMagicZone:IsUsableP() and t:AffectingCombat() and e.AntiMagicZone:CooldownRemains(BypassRecovery) <= 0) then
        if o(e.AntiMagicZone, nil, nil, nil) then
            a = 145629
            return "queue AMZ"
        end

    elseif ((not e.AntiMagicZone:IsUsableP() or e.AntiMagicZone:CooldownRemains() > 0 or not t:AffectingCombat()) and V) then
        HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13]
        d.Print("Anti-Magic Zone Queue is now " .. (HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (C and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and l.TargetIsValid() and m("mouseover"):GUID() ~= nil) then
        if o(e.DeathGrip, nil, nil, nil) then
            s = 149576
            return "queue DeathGrip MO"
        end

    elseif (C and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and l.TargetIsValid()) then
        if o(e.DeathGrip, nil, nil, nil) then
            a = 49576
            return "queue DeathGrip"
        end

    elseif ((not e.DeathGrip:IsUsableP() or e.DeathGrip:CooldownRemains() > 0 or not l.TargetIsValid()) and C) then
        HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14]
        d.Print("Death Grip Queue is now " .. (HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (U and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and m("mouseover"):GUID() ~= nil) then
        if o(e.Asphyxiate, nil, nil, nil) then
            s = 1221562
            return "queue Asphyxiate MO"
        end

    elseif (U and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and l.TargetIsValid()) then
        if o(e.Asphyxiate, nil, nil, nil) then
            a = 221562
            return "queue Asphyxiate"
        end

    elseif ((not e.Asphyxiate:IsUsableP() or e.Asphyxiate:CooldownRemains() > 0) and U) then
        HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16]
        d.Print("Asphyxiate Queue is now " .. (HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if t:IsChanneling(M(324631)) then
        if o(e.PoolResources, nil, nil, nil) then
            s = 36
            return "Raise Ally MO"
        end

    end

    if e.RaiseDead:IsCastable() then
        if n.Unholy.RaiseDeadCastLeft then
            if d.CastLeft(e.RaiseDead) then
                a = 46584
                return "raise_dead precombat 2 left"
            end

        else
            if o(e.RaiseDead, nil, nil) then
                a = 46584
                return "raise_dead precombat 2 displaystyle"
            end

        end

    end

    if l.TargetIsValid() then
        x = i:DebuffStack(e.FesteringWoundDebuff)
        if not t:AffectingCombat() and se then
            local e = ce()
            if e then
                return e
            end

        end

    end

    if l.TargetIsValid() and t:AffectingCombat() then
        x = i:DebuffStack(e.FesteringWoundDebuff)
        if (not UnitIsEnemy("player", "mouseover") and UnitIsDead("mouseover") and UnitIsPlayer("mouseover")) then
                        if e.RaiseAlly:IsCastable() and (t:RunicPower() >= 30) then
                if o(e.RaiseAlly, nil) then
                    s = 161999
                    return "RaiseAlly MO"
                end

            elseif e.RaiseAlly:CooldownRemains(BypassRecovery) <= 0 and (t:RunicPower() < 30) then
                ae = true
            end

        end

        if (n.Commons.UseDefensives) then
            if t:HealthPercentage() < n.Commons.HealthstoneHP and b.Healthstone:IsReady() and b.Healthstone:CooldownRemains() <= 0 then
                if o(b.Healthstone, nil) then
                    a = 40
                    return "Healthstone HP"
                end

            end

            if t:HealthPercentage() < n.Commons.HealPotHP and b.CosmicHealPot:IsReady() and b.CosmicHealPot:CooldownRemains() <= 0 then
                if o(b.CosmicHealPot, nil) then
                    a = 48707
                    return "CosmicHealPot HP"
                end

            end

            if t:HealthPercentage() < n.Commons.HealPotHP and b.HealPot:IsReady() and b.HealPot:CooldownRemains() <= 0 then
                if o(b.HealPot, nil) then
                    a = 41
                    return "HealPot HP"
                end

            end

            if t:HealthPercentage() < n.Commons.UseDarkSuccorHP and e.DeathStrike:IsReady() and t:BuffUp(e.DeathStrikeBuff) then
                if o(e.DeathStrike) then
                    a = 49998
                    return "DeathStrike Dark Succor HP"
                end

            end

            if t:HealthPercentage() < n.Commons.UseDeathStrikeHP and e.DeathStrike:IsReady() then
                if o(e.DeathStrike) then
                    a = 49998
                    return "DeathStrike HP"
                end

            end

            if t:HealthPercentage() < n.Commons.IceboundFortitudeHP and e.IceboundFortitude:IsReady() then
                if o(e.IceboundFortitude) then
                    a = 48792
                    return "Icebound Fortitude HP"
                end

            end

            if t:HealthPercentage() < n.Commons.LichborneHP and e.Lichborne:IsReady() then
                if o(e.Lichborne) then
                    a = 287081
                    return "Lichborne HP"
                end

            end

            if t:HealthPercentage() < n.Commons.AntiMagicShellHP and e.AntiMagicShell:IsReady() then
                if o(e.AntiMagicShell) then
                    a = 48707
                    return "Anti-Magic Shell HP"
                end

            end

            if t:HealthPercentage() < n.Commons.DeathPactHP and e.DeathPact:IsReady() then
                if o(e.DeathPact) then
                    a = 48743
                    return "Death Pact HP"
                end

            end

        end

        if e.Apocalypse:CooldownRemains() < 10 and x < 4 then
            L = 8
        else
            L = 4
        end

        if e.SummonGargoyle:CooldownRemains() < t:GCD() * 2 then
            he = ((((e.SummonGargoyle:CooldownRemains() + 1) / t:GCD()) / ((t:Rune() + 1) * (t:RunicPower() + 20))) * 100)
        else
            he = t:GCD()
        end

        if (e.Festermight:IsAvailable() and t:BuffUp(e.FestermightBuff) and (t:BuffRemains(e.FestermightBuff) / (4 * t:GCD())) >= 1) then
            Y = x >= 1
        else
            Y = x >= (2 - E(e.InfectedClaws:IsAvailable()))
        end

        F = ((e.Apocalypse:CooldownRemains() > L or not e.Apocalypse:IsAvailable()) and (Y or (x >= 1 and (not e.Apocalypse:IsAvailable())) or (x >= 1 and e.UnholyAssault:CooldownRemains() < 20 and e.UnholyAssault:IsAvailable() and y) or (x > 4) or (u < x * t:GCD())))
        S = (e.VileContagion:IsAvailable() and e.VileContagion:CooldownRemains() < 3 and t:RunicPower() < 60 and not y)
        ge = (e.SoulReaper:IsAvailable() and t:Rune() < 2 and i:TimeToX(35) < 5 and u > 5)
        y = (r <= 3 or not D())
        v = (r >= 4 and D())
        if e.Outbreak:IsReady() and (J > 0 and r == 0) then
            if o(e.Outbreak, nil, nil, not i:IsSpellInRange(e.Outbreak)) then
                a = 77575
                return "outbreak out_of_range"
            end

        end

        if e.Epidemic:IsReady() and D() and e.VirulentPlagueDebuff:AuraActiveCount() > 1 and (not S and r == 0) then
            if o(e.Epidemic, nil, nil, not i:IsInRange(30)) then
                a = 207317
                return "epidemic out_of_range"
            end

        end

        if e.DeathCoil:IsReady() and e.VirulentPlagueDebuff:AuraActiveCount() < 2 and (not S and r == 0) then
            if o(e.DeathCoil, nil, nil, not i:IsSpellInRange(e.DeathCoil)) then
                a = 47541
                return "death_coil out_of_range"
            end

        end

        if e.ArmyoftheDead:IsReady() and ve and not re and not n.Unholy.DisableAotD and h() and (((e.CommanderoftheDead:IsAvailable() and (e.DarkTransformation:CooldownRemains() < 4 or e.DarkTransformation:TimeSinceLastCast() <= 4)) or (not e.CommanderoftheDead:IsAvailable() and e.UnholyAssault:IsAvailable() and e.UnholyAssault:CooldownRemains() < 10) or (not e.UnholyAssault:IsAvailable() and (not e.CommanderoftheDead:IsAvailable()))) or u <= 30) then
            if o(e.ArmyoftheDead, nil, Snil) then
                a = 42650
                return "army_of_the_dead main 1"
            end

        end

        if e.Outbreak:IsReady() and ((i:DebuffRefreshable(e.VirulentPlagueDebuff) or (e.Superstrain:IsAvailable() and (i:DebuffRefreshable(e.FrostFeverDebuff) or i:DebuffRefreshable(e.BloodPlagueDebuff)))) and ((not e.UnholyBlight:IsAvailable()) or (e.UnholyBlight:IsAvailable() and e.UnholyBlight:CooldownRemains() > 15 / ((E(e.Superstrain:IsAvailable()) * 3) + (E(e.Plaguebringer:IsAvailable()) * 2))))) then
            if o(e.Outbreak, nil, nil, not i:IsSpellInRange(e.Outbreak)) then
                a = 77575
                return "outbreak main 18"
            end

        end

        if k:IsReady() and (e.Apocalypse:CooldownRemains() > L and e.Plaguebringer:IsAvailable() and e.Superstrain:IsAvailable() and t:BuffRemains(e.PlaguebringerBuff) < t:GCD()) then
            if o(k, nil, nil, not i:IsSpellInRange(k)) then
                if e.ClawingShadows:IsAvailable() then
                    a = 96320
                    return "wound_spender main 24"
                else
                    a = 55090
                    return "wound_spender main 24"
                end

            end

        end

        if ((n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and h()) then
            local e = p()
            if e then
                return e
            end

        end

        if (h()) then
            local e = de()
            if e then
                return e
            end

        end

        if (h()) then
            local e = le()
            if e then
                return e
            end

        end

        if (true) then
            local e = Z()
            if e then
                return e
            end

        end

        if (D() and q >= 4) then
            local t = fe()
            if t then
                return t
            end

            if o(e.Pool) then
                a = 9999999999
                return "pool for AoE()"
            end

        end

        if (q <= 3) then
            local t = P()
            if t then
                return t
            end

            if o(e.Pool) then
                a = 9999999999
                return "pool for Generic()"
            end

        end

        if (true) then
            if o(e.Pool) then
                a = 9999999999
                return "pool_resources"
            end

        end

    end

end

local function t()
    e.VirulentPlagueDebuff:RegisterAuraTracking()
    e.FesteringWoundDebuff:RegisterAuraTracking()
end

function ReturnSpell()
    if a == 0 then
        return 0
    else
        return a
    end

end

function ReturnSpellMO()
    if s == 0 then
        return 0
    else
        return s
    end

end

d.SetAPL(252, c, t)

