local e, e = ...
local e = HeroDBC.DBC
local f = HeroLib
local e = HeroCache
local m = f.Unit
local t = m.Player
local i = m.Target
local e = m.Boss
local c = m.Pet
local P = f.Spell
local z = f.Item
local h = HeroRotation
local o = h.Cast
local r = h.CDsON
local R = h.AoEON
local k = HeroRotationCharDB.Toggles[4]
local I = HeroRotationCharDB.Toggles[5]
local X = HeroRotationCharDB.Toggles[6]
local Q = HeroRotationCharDB.Toggles[10]
local pe = HeroRotationCharDB.Toggles[11]
local T = HeroRotationCharDB.Toggles[12]
local B = HeroRotationCharDB.Toggles[13]
local D = HeroRotationCharDB.Toggles[14]
local Z = HeroRotationCharDB.Toggles[15]
local U = HeroRotationCharDB.Toggles[16]
local ee = HeroRotationCharDB.Toggles[17]
local te = nil
local V = nil
local e = false
local e = false
local ve = false
local e = false
local e = false
local e = false
local e = 0
local se = false
local oe = table.insert
local e = P.DeathKnight.Unholy
local v = z.DeathKnight.Unholy
local ye = {  }
local _ = t:GetEquipment()
local ne = _[13] and z(_[13]) or z(0)
local re = _[14] and z(_[14]) or z(0)
local ae, a = GetInventoryItemID("player", 13)
local ie, he = GetInventoryItemID("player", 14)
local ge
local ke
local u = h.Commons.Everyone
local n = { General = h.GUISettings.General, Commons = h.GUISettings.APL.DeathKnight.Commons, Unholy = h.GUISettings.APL.DeathKnight.Unholy }
local L
local G
local Y
local a
local W
local S
local qe
local p
local b
local E, N
local A, O
local g
local j
local a, a
local a
local q
local C = 11111
local l = 11111
local w = f.GhoulTable
local a = 0
local s = 0
local y, d
local H, x
local K
local ue = t:HasLegendaryEquipped(30)
local J = t:HasLegendaryEquipped(31)
local ce = t:HasLegendaryEquipped(45)
local le = t:HasLegendaryEquipped(44)
local de = t:HasLegendaryEquipped(210)
local F = t:HasLegendaryEquipped(213)
local M = t:CovenantID()
f:RegisterForEvent(function()
    M = t:CovenantID()
end, "COVENANT_CHOSEN")
f:RegisterForEvent(function()
    _ = t:GetEquipment()
    ne = _[13] and z(_[13]) or z(0)
    re = _[14] and z(_[14]) or z(0)
    ue = t:HasLegendaryEquipped(30)
    J = t:HasLegendaryEquipped(31)
    ce = t:HasLegendaryEquipped(45)
    le = t:HasLegendaryEquipped(44)
    de = t:HasLegendaryEquipped(210)
    F = t:HasLegendaryEquipped(213)
end, "PLAYER_EQUIPMENT_CHANGED")
f:RegisterForEvent(function()
    C = 11111
    l = 11111
end, "PLAYER_REGEN_ENABLED")
local function _(e)
    if e then
        return 1
    else
        return 0
    end

end

local function z(e)
    return e ~= 0
end

local function we()
    return (n.General.SoloMode and (t:HealthPercentage() < n.Commons.UseDeathStrikeHP or t:HealthPercentage() < n.Commons.UseDarkSuccorHP and t:BuffUp(e.DeathStrikeBuff)))
end

local function be(a)
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

local function de(e)
    local t = {  }
    if e ~= nil then
        for a in pairs(e) do
            if not m:IsInBossList(e[a]["UnitNPCID"]) then
                oe(t, e[a])
            end

        end

    end

    return f.FightRemains(t)
end

local function z(t)
    return (t:DebuffStack(e.FesteringWoundDebuff))
end

local function fe(o)
                if ((o:DebuffUp(e.FesteringWoundDebuff) and b and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and o:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 1275699
        return true
    elseif ((o:DebuffUp(e.FesteringWoundDebuff) and b and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and n.Unholy.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not T) then
        s = 999
        return true
    elseif ((o:DebuffUp(e.FesteringWoundDebuff) and b and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and o:GUID() == i:GUID()) then
        a = 275699
        return true
    elseif (o:DebuffUp(e.FesteringWoundDebuff) and b and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) then
        return true
    end

end

local function me(e)
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

local function re(t)
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

local function ue(t)
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

local function oe(e)
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

local function ne(t)
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

local function ne(t)
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

local function le(e)
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

local function je()
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

local function ce()
    if j:IsReady() and ((t:BuffDown(e.DeathAndDecayBuff) and b and ((e.Festermight:IsAvailable() and t:BuffRemains(e.FestermightBuff) < 3) or not e.Festermight:IsAvailable()) and (e.FesteringWoundDebuff:AuraActiveCount() == d or e.FesteringWoundDebuff:AuraActiveCount() == 8 or (not e.BurstingSores:IsAvailable() and not e.VileContagion:IsAvailable()) or ((e.VileContagion:CooldownDown() or not e.VileContagion:IsAvailable()) and c:BuffUp(e.DarkTransformation) and e.InfectedClaws:IsAvailable() and (t:BuffUp(e.EmpowerRuneWeaponBuff) or t:BuffUp(e.UnholyAssaultBuff))))) or l < 10) then
        if o(j, nil) then
            a = 43265
            return "any_dnd aoe 4"
        end

    end

    if e.AbominationLimb:IsCastable() and k and (t:Rune() == 0 and b) then
        if o(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 101"
        end

    end

    if e.Apocalypse:IsCastable() and I then
        if u.CastTargetIf(e.Apocalypse, y, "min", z, fe, not i:IsInMeleeRange(8)) then
            return "apocalypse aoe 8"
        end

    end

    if e.FesteringStrike:IsReady() and (t:BuffDown(e.DeathAndDecayBuff) and (e.VileContagion:CooldownRemains() < 5 or (e.Apocalypse:CooldownUp() and j:CooldownDown()))) then
        if u.CastTargetIf(e.FesteringStrike, y, "max", z, ue, not i:IsInMeleeRange(8)) then
            return "festering_strike aoe 10"
        end

    end

    if e.FesteringStrike:IsReady() and (t:BuffDown(e.DeathAndDecayBuff) and (e.VileContagion:CooldownRemains() > 5 or not e.VileContagion:IsAvailable())) then
        if u.CastTargetIf(e.FesteringStrike, y, "min", z, oe, not i:IsInMeleeRange(8)) then
            return "festering_strike aoe 12"
        end

    end

    if g:IsReady() and (t:BuffUp(e.DeathAndDecayBuff)) then
        if u.CastTargetIf(g, y, "max", z, ne, not i:IsInMeleeRange(8)) then
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

    if g:IsReady() and (e.DeathAndDecay:CooldownRemains() > 10) then
        if u.CastTargetIf(g, y, "max", z, ne, not i:IsInMeleeRange(5)) then
            return "wound_spender aoe 20"
        end

    end

end

local function ne()
    if n.Commons.Enabled.Potions then
        local s = u.PotionSelected()
        if s then
            local i = s:BuffDuration()
            if s:IsReady() and r() and n.Commons.Enabled.Potions and Z and ((t:BloodlustUp() and h.GUISettings.General.HoldPotforBL) or (not h.GUISettings.General.HoldPotforBL and ((w:gargactive() and i >= w:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and c:BuffUp(e.DarkTransformation) and i >= c:BuffRemains(e.DarkTransformation)) or (A and O <= i) or (E and N <= i)) or l <= i)) then
                if o(s, nil) then
                    a = 50
                    return "potion cooldowns 2"
                end

            end

        end

    end

    if e.VileContagion:IsReady() and r() and (x >= 2 and j:CooldownRemains() < 3) then
        if u.CastTargetIf(e.VileContagion, H, "max", z, le, not i:IsSpellInRange(e.VileContagion), nil) then
            return "vile_contagion cooldowns 4"
        end

    end

    if e.RaiseDead:IsCastable() then
        if o(e.RaiseDead, nil, nil) then
            a = 46584
            return "raise_dead cooldowns 26 displaystyle"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and r() and ((p and t:RunicPowerDeficit() > 20 and ((w:gargactive() and E) or (not e.SummonGargoyle:IsAvailable() and e.ArmyoftheDamned:IsAvailable() and A and E) or (not e.SummonGargoyle:IsAvailable() and not e.ArmyoftheDamned:IsAvailable() and c:BuffUp(e.DarkTransformation)) or (not e.SummonGargoyle:IsAvailable() and c:BuffUp(e.DarkTransformation)))) or l <= 21) then
        if o(e.EmpowerRuneWeapon, nil) then
            a = 47568
            return "empower_rune_weapon cooldowns 10"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and r() and (b and c:BuffUp(e.DarkTransformation)) then
        if o(e.EmpowerRuneWeapon, nil) then
            a = 47568
            return "empower_rune_weapon cooldowns 12"
        end

    end

    if e.SummonGargoyle:IsReady() and r() and (e.DarkTransformation:TimeSinceLastCast() <= 4 or (not e.CommanderoftheDead:IsAvailable() and t:RunicPower() >= 40)) then
        if o(e.SummonGargoyle, nil) then
            a = 49206
            return "summon_gargoyle cooldowns 14"
        end

    end

    if e.UnholyAssault:IsReady() and r() and (p) then
        if o(e.UnholyAssault, nil, nil, not i:IsInMeleeRange(5)) then
            a = 207289
            return "unholy_assault cooldowns 16"
        end

    end

    if e.Apocalypse:IsReady() and I and (d <= 3 and ((not e.CommanderoftheDead:IsAvailable()) or (e.CommanderoftheDead:IsAvailable() and e.DarkTransformation:TimeSinceLastCast() <= 4))) then
        if u.CastTargetIf(e.Apocalypse, H, "max", z, me, not i:IsInMeleeRange(8)) then
            return "apocalypse cooldowns 18"
        end

    end

    if e.DarkTransformation:IsCastable() and I and (p and e.Apocalypse:CooldownRemains() < t:GCD()) then
        if o(e.DarkTransformation, nil) then
            a = 63560
            return "dark_transformation cooldowns 20"
        end

    end

    if e.DarkTransformation:IsCastable() and I and ((b and ((j:CooldownRemains() < 10 and e.InfectedClaws:IsAvailable() and ((e.VileContagion:CooldownDown() and e.FesteringWoundDebuff:AuraActiveCount() < d) or not e.VileContagion:IsAvailable())) or not e.InfectedClaws:IsAvailable())) or l < 25) then
        if o(e.DarkTransformation, nil) then
            a = 63560
            return "dark_transformation cooldowns 22"
        end

    end

    if e.SoulReaper:IsReady() and (d == 1 and i:TimeToX(35) < 5 and i:TimeToDie() > 5) then
        if o(e.SoulReaper, nil, nil, not i:IsSpellInRange(e.SoulReaper)) then
            a = 343294
            return "soul_reaper cooldowns 24"
        end

    end

    if e.SoulReaper:IsReady() and (d >= 2) then
        if u.CastTargetIf(e.SoulReaper, y, "min", EvaluateTargetIfFilterSoulReaper, re, not i:IsSpellInRange(e.SoulReaper)) then
            return "soul_reaper cooldowns 26"
        end

    end

    if e.UnholyBlight:IsReady() and I and (p and (((not e.Apocalypse:IsAvailable() or e.Apocalypse:CooldownDown()) and e.Morbidity:IsAvailable()) or not e.Morbidity:IsAvailable())) then
        if o(e.UnholyBlight, nil, nil, not i:IsInRange(8)) then
            a = 115989
            return "unholy_blight cooldowns 28"
        end

    end

    if e.UnholyBlight:IsReady() and I and (b or l < 21) then
        if o(e.UnholyBlight, nil, nil, not i:IsInRange(8)) then
            a = 115989
            return "unholy_blight cooldowns 30"
        end

    end

    if e.AbominationLimb:IsCastable() and k and (p and t:Rune() < 3) then
        if o(e.AbominationLimb, nil) then
            a = 315443
            return "abomination_limb cooldowns 32"
        end

    end

    if e.SacrificialPact:IsReady() and r() and ((d >= 2 and c:BuffDown(e.DarkTransformation) and e.DarkTransformation:CooldownRemains() > 6) or l < t:GCD()) then
        if o(e.SacrificialPact, nil, nil, not i:IsInRange(8)) then
            a = 237574
            return "sacrificial_pact cooldowns 34"
        end

    end

end

local function le()
    if e.SwarmingMist:IsReady() and k and ((p and t:RunicPowerDeficit() > 16 and (not e.Apocalypse:CooldownUp() or (not e.ArmyoftheDamned:IsAvailable() and not e.DarkTransformation:CooldownUp()))) or f.FilteredFightRemains(y, "<", 11)) then
        if o(e.SwarmingMist, nil, nil, not i:IsInRange(10)) then
            a = 311648
            return "swarming_mist covenants 2"
        end

    end

    if e.SwarmingMist:IsReady() and k and (e.Apocalypse:CooldownDown() and ((d >= 2 and d <= 5 and t:RunicPowerDeficit() > 10 + (d * 6) and b) or (d > 5 and t:RunicPowerDeficit() > 40))) then
        if o(e.SwarmingMist, nil, nil, not i:IsInRange(10)) then
            a = 311648
            return "swarming_mist covenants 4"
        end

    end

    if e.AbominationLimbCov:IsReady() and k and ((p and not e.LeadByExample:SoulbindEnabled() and (not e.Apocalypse:CooldownUp() or (not e.ArmyoftheDamned:IsAvailable() and not e.DarkTransformation:CooldownUp())) and t:RuneTimeToX(4) > t:BuffRemains(e.RunicCorruptionBuff)) or f.FilteredFightRemains(y, "<", 12 + (_(e.KevinsOozeling:SoulbindEnabled()) * 28))) then
        if o(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 6"
        end

    end

    if e.AbominationLimbCov:IsReady() and k and (p and e.LeadByExample:SoulbindEnabled() and (i:DebuffRemains(e.UnholyBlightDebuff) > 11 or (not e.UnholyBlight:IsAvailable() and not e.DarkTransformation:CooldownUp()))) then
        if o(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 8"
        end

    end

    if e.AbominationLimbCov:IsReady() and k and (p and e.KevinsOozeling:SoulbindEnabled() and ((i:DebuffStack(e.FesteringWoundDebuff) >= 4 and not F) or (F and e.Apocalypse:CooldownDown()))) then
        if o(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 10"
        end

    end

    if e.AbominationLimbCov:IsReady() and k and (b and t:RuneTimeToX(4) > t:BuffRemains(e.RunicCorruptionBuff)) then
        if o(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 101"
        end

    end

    if e.ShackleTheUnworthy:IsReady() and k and ((p and (e.Apocalypse:CooldownRemains() > 10 or (not e.ArmyoftheDamned:IsAvailable() and not e.DarkTransformation:CooldownUp()))) or f.FilteredFightRemains(y, "<", 15)) then
        if o(e.ShackleTheUnworthy, nil, nil, not i:IsSpellInRange(e.ShackleTheUnworthy)) then
            a = 312202
            return "shackle_the_unworthy covenants 12"
        end

    end

    if e.ShackleTheUnworthy:IsReady() and k and (b and (t:BuffUp(e.DeathAndDecayBuff) or de(H) <= 14)) then
        if o(e.ShackleTheUnworthy, nil, nil, not i:IsSpellInRange(e.ShackleTheUnworthy)) then
            a = 312202
            return "shackle_the_unworthy covenants 14"
        end

    end

end

local function re()
    if e.ArcaneTorrent:IsCastable() and r() and (t:RunicPowerDeficit() > 20 and (e.SummonGargoyle:CooldownRemains() < t:GCD() or (not e.SummonGargoyle:IsAvailable()) or (w:gargactive() and t:Rune() < 2 and q < 1))) then
        if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
            a = 28730
            return "arcane_torrent main 2"
        end

    end

    if e.BloodFury:IsCastable() and r() and ((w:gargactive() and e.BloodFury:BaseDuration() >= w:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.BloodFury:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (A and O <= e.BloodFury:BaseDuration()) or (E and N <= e.BloodFury:BaseDuration()) or (x >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or l <= e.BloodFury:BaseDuration()) then
        if o(e.BloodFury, nil) then
            a = 20572
            return "blood_fury main 4"
        end

    end

    if e.Berserking:IsCastable() and r() and (((w:gargactive() and e.Berserking:BaseDuration() >= w:gargremains()) or (not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.Berserking:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (A and O <= e.Berserking:BaseDuration()) or (E and N <= e.Berserking:BaseDuration()) or (x >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or l <= e.Berserking:BaseDuration()) then
        if o(e.Berserking, nil) then
            a = 26297
            return "berserking main 6"
        end

    end

    if e.LightsJudgment:IsCastable() and r() and (t:BuffUp(e.UnholyStrengthBuff) and ((not e.Festermight:IsAvailable()) or (t:BuffRemains(e.FestermightBuff) < i:TimeToDie()) or (t:BuffRemains(e.UnholyStrengthBuff) < i:TimeToDie()))) then
        if o(e.LightsJudgment, nil, nil, not i:IsSpellInRange(e.LightsJudgment)) then
            a = 255647
            return "lights_judgment main 8"
        end

    end

    if e.AncestralCall:IsCastable() and r() and (((w:gargactive() and 15 >= w:gargremains()) or (not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and 15 >= c:BuffRemains(e.DarkTransformation)) or (A and O <= 15) or (E and N <= 15) or (x >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or l <= 15) then
        if o(e.AncestralCall, nil) then
            a = 274738
            return "ancestral_call main 10"
        end

    end

    if e.ArcanePulse:IsCastable() and r() and (d >= 2 or (t:Rune() <= 1 and t:RunicPowerDeficit() >= 60)) then
        if o(e.ArcanePulse, nil, nil, not i:IsInRange(8)) then
            a = 260364
            return "arcane_pulse main 12"
        end

    end

    if e.Fireblood:IsCastable() and r() and (((w:gargactive() and e.Fireblood:BaseDuration() >= w:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.Fireblood:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (A and O <= e.Fireblood:BaseDuration()) or (E and N <= e.Fireblood:BaseDuration()) or (x >= 2 and t:BuffUp(e.DeathAndDecayBuff))))) or l <= e.Fireblood:BaseDuration()) then
        if o(e.Fireblood, nil) then
            a = 265221
            return "fireblood main 14"
        end

    end

    if e.BagofTricks:IsCastable() and r() and (d == 1 and (t:BuffUp(e.UnholyStrengthBuff) or f.FilteredFightRemains(y, "<", 5))) then
        if o(e.BagofTricks, nil, nil, not i:IsSpellInRange(e.BagofTricks)) then
            a = 312411
            return "bag_of_tricks main 16"
        end

    end

end

local function F()
    if e.DeathCoil:IsReady() and ((not S) and (t:Rune() < 3 or w:gargactive() or t:BuffUp(e.SuddenDoomBuff))) then
        if o(e.DeathCoil, nil, nil, not i:IsSpellInRange(e.DeathCoil)) then
            a = 47541
            return "death_coil generic 4"
        end

    end

    if j:IsReady() and (t:BuffDown(e.DeathAndDecayBuff) and ((x >= 2 and e.FesteringWoundDebuff:AuraActiveCount() == d) or M == 3 or J)) then
        if o(j, nil, nil) then
            a = 43265
            return "any_dnd generic 6"
        end

    end

    if g:IsReady() and (W or (d >= 2 and t:BuffUp(e.DeathAndDecayBuff))) then
        if o(g, nil, nil, not i:IsSpellInRange(g)) then
            if e.ClawingShadows:IsAvailable() then
                a = 207311
                return "wound_spender generic 10"
            else
                a = 55090
                return "wound_spender generic 10"
            end

        end

    end

    if e.FesteringStrike:IsReady() and (not W) then
        if u.CastTargetIf(e.FesteringStrike, y, "min", z, oe, not i:IsInMeleeRange(8)) then
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

local function w()
    if v.GaveloftheFirstArbiter:IsEquippedAndReady() and i:IsInRange(30) and r() and not ee and n.Commons.Enabled.Items then
        if o(v.GaveloftheFirstArbiter, nil, nil, not i:IsInRange(30)) then
            a = 1515
            return "gavel_of_the_first_arbiter trinkets 4"
        end

    end

    if r() and ((e.Apocalypse:CooldownDown() or c:BuffUp(e.DarkTransformation)) and (not v.InscrutableQuantumDevice:IsEquipped() or v.InscrutableQuantumDevice:CooldownRemains() > 0)) then
        local e = t:GetUseableTrinkets(ye)
        if e then
            if o(e, nil, nil) then
                                if e:ID() == ae and n.Commons.Enabled.TopTrinket then
                    a = 30
                    return "top trinket 1"
                elseif e:ID() == ie and n.Commons.Enabled.BottomTrinket then
                    a = 31
                    return "top trinket 2"
                end

            end

        end

    end

end

local function z()
    ke = not we()
    y = t:GetEnemiesInMeleeRange(8)
    H = i:GetEnemiesInSplashRange(10)
    ae, he = GetInventoryItemID("player", 13)
    ie, he = GetInventoryItemID("player", 14)
    if R() then
        d = #y
        x = #H
    else
        d = 1
        x = 1
    end

    K = be(H)
    E = e.Apocalypse:TimeSinceLastCast() <= 15
    N = (E) and 15 - e.Apocalypse:TimeSinceLastCast() or 0
    A = e.ArmyoftheDead:TimeSinceLastCast() <= 30
    O = (O) and 30 - e.ArmyoftheDead:TimeSinceLastCast() or 0
    if u.TargetIsValid() or t:AffectingCombat() then
        C = f.BossFightRemains(nil, true)
        l = C
        if l == 11111 then
            l = f.FightRemains(Enemies10yd, false)
        end

    end

    X = HeroRotationCharDB.Toggles[6]
    k = HeroRotationCharDB.Toggles[4]
    I = HeroRotationCharDB.Toggles[5]
    Q = HeroRotationCharDB.Toggles[10]
    pe = HeroRotationCharDB.Toggles[11]
    T = HeroRotationCharDB.Toggles[12]
    B = HeroRotationCharDB.Toggles[13]
    D = HeroRotationCharDB.Toggles[14]
    Z = HeroRotationCharDB.Toggles[15]
    U = HeroRotationCharDB.Toggles[16]
    ee = HeroRotationCharDB.Toggles[17]
    se = false
end

local function c()
    g = (e.ClawingShadows:IsAvailable() and e.ClawingShadows or e.ScourgeStrike)
    j = e.DeathAndDecay
    if M == 3 then
        j = e.DeathsDue
    end

    if e.Defile:IsAvailable() then
        j = e.Defile
    end

    ge = z()
    if h.QueuedCast() then
        a = h.QueuedCast()
        return "Custom Queue " .. P(a):ID()
    end

        if h.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        te = GetTime()
        V = te + (h.GUISettings.General.OpenerReset)
    elseif h.GUISettings.General.OpenerReset > 0 and V ~= nil and GetTime() > V and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        h.ToggleIconFrame:UpdateButtonText(6)
        h.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (B and e.AntiMagicZone:IsUsableP() and t:AffectingCombat() and e.AntiMagicZone:CooldownRemains(BypassRecovery) <= 0) then
        if o(e.AntiMagicZone, nil, nil, nil) then
            a = 145629
            return "queue AMZ"
        end

    elseif ((not e.AntiMagicZone:IsUsableP() or e.AntiMagicZone:CooldownRemains() > 0 or not t:AffectingCombat()) and B) then
        HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13]
        h.Print("Anti-Magic Zone Queue is now " .. (HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (D and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and u.TargetIsValid() and m("mouseover"):GUID() ~= nil) then
        if o(e.DeathGrip, nil, nil, nil) then
            s = 149576
            return "queue DeathGrip MO"
        end

    elseif (D and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and u.TargetIsValid()) then
        if o(e.DeathGrip, nil, nil, nil) then
            a = 49576
            return "queue DeathGrip"
        end

    elseif ((not e.DeathGrip:IsUsableP() or e.DeathGrip:CooldownRemains() > 0 or not u.TargetIsValid()) and D) then
        HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14]
        h.Print("Death Grip Queue is now " .. (HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (U and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and m("mouseover"):GUID() ~= nil) then
        if o(e.Asphyxiate, nil, nil, nil) then
            s = 1221562
            return "queue Asphyxiate MO"
        end

    elseif (U and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and u.TargetIsValid()) then
        if o(e.Asphyxiate, nil, nil, nil) then
            a = 221562
            return "queue Asphyxiate"
        end

    elseif ((not e.Asphyxiate:IsUsableP() or e.Asphyxiate:CooldownRemains() > 0) and U) then
        HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16]
        h.Print("Asphyxiate Queue is now " .. (HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if t:IsChanneling(P(324631)) then
        if o(e.PoolResources, nil, nil, nil) then
            s = 36
            return "Raise Ally MO"
        end

    end

    if e.RaiseDead:IsCastable() then
        if n.Unholy.RaiseDeadCastLeft then
            if h.CastLeft(e.RaiseDead) then
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

    if u.TargetIsValid() then
        q = i:DebuffStack(e.FesteringWoundDebuff)
        if not t:AffectingCombat() and X then
            local e = je()
            if e then
                return e
            end

        end

    end

    if u.TargetIsValid() and t:AffectingCombat() then
        q = i:DebuffStack(e.FesteringWoundDebuff)
        if (not UnitIsEnemy("player", "mouseover") and UnitIsDead("mouseover") and UnitIsPlayer("mouseover")) then
                        if e.RaiseAlly:IsCastable() and (t:RunicPower() >= 30) then
                if o(e.RaiseAlly, nil) then
                    s = 161999
                    return "RaiseAlly MO"
                end

            elseif e.RaiseAlly:CooldownRemains(BypassRecovery) <= 0 and (t:RunicPower() < 30) then
                se = true
            end

        end

        if (n.Commons.UseDefensives) then
            if t:HealthPercentage() < n.Commons.HealthstoneHP and v.Healthstone:IsReady() and v.Healthstone:CooldownRemains() <= 0 then
                if o(v.Healthstone, nil) then
                    a = 40
                    return "Healthstone HP"
                end

            end

            if t:HealthPercentage() < n.Commons.HealPotHP and v.CosmicHealPot:IsReady() and v.CosmicHealPot:CooldownRemains() <= 0 then
                if o(v.CosmicHealPot, nil) then
                    a = 48707
                    return "CosmicHealPot HP"
                end

            end

            if t:HealthPercentage() < n.Commons.HealPotHP and v.HealPot:IsReady() and v.HealPot:CooldownRemains() <= 0 then
                if o(v.HealPot, nil) then
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

        if e.Apocalypse:CooldownRemains() < 10 and q < 4 then
            L = 8
        else
            L = 4
        end

        if e.SummonGargoyle:CooldownRemains() < t:GCD() * 2 then
            G = ((((e.SummonGargoyle:CooldownRemains() + 1) / t:GCD()) / ((t:Rune() + 1) * (t:RunicPower() + 20))) * 100)
        else
            G = t:GCD()
        end

        if (e.Festermight:IsAvailable() and t:BuffUp(e.FestermightBuff) and (t:BuffRemains(e.FestermightBuff) / (4 * t:GCD())) >= 1) then
            Y = q >= 1
        else
            Y = q >= (2 - _(e.InfectedClaws:IsAvailable()))
        end

        W = ((e.Apocalypse:CooldownRemains() > L or not e.Apocalypse:IsAvailable()) and (Y or (q >= 1 and (not e.Apocalypse:IsAvailable())) or (q >= 1 and e.UnholyAssault:CooldownRemains() < 20 and e.UnholyAssault:IsAvailable() and p) or (q > 4) or (l < q * t:GCD())))
        S = (e.VileContagion:IsAvailable() and e.VileContagion:CooldownRemains() < 3 and t:RunicPower() < 60 and not p)
        qe = (e.SoulReaper:IsAvailable() and t:Rune() < 2 and i:TimeToX(35) < 5 and l > 5)
        p = (d <= 3 or not R())
        b = (d >= 4 and R())
        if e.Outbreak:IsReady() and (K > 0 and d == 0) then
            if o(e.Outbreak, nil, nil, not i:IsSpellInRange(e.Outbreak)) then
                a = 77575
                return "outbreak out_of_range"
            end

        end

        if e.Epidemic:IsReady() and R() and e.VirulentPlagueDebuff:AuraActiveCount() > 1 and (not S and d == 0) then
            if o(e.Epidemic, nil, nil, not i:IsInRange(30)) then
                a = 207317
                return "epidemic out_of_range"
            end

        end

        if e.DeathCoil:IsReady() and e.VirulentPlagueDebuff:AuraActiveCount() < 2 and (not S and d == 0) then
            if o(e.DeathCoil, nil, nil, not i:IsSpellInRange(e.DeathCoil)) then
                a = 47541
                return "death_coil out_of_range"
            end

        end

        if e.ArmyoftheDead:IsReady() and ve and not Q and not n.Unholy.DisableAotD and r() and (((e.CommanderoftheDead:IsAvailable() and (e.DarkTransformation:CooldownRemains() < 4 or e.DarkTransformation:TimeSinceLastCast() <= 4)) or (not e.CommanderoftheDead:IsAvailable() and e.UnholyAssault:IsAvailable() and e.UnholyAssault:CooldownRemains() < 10) or (not e.UnholyAssault:IsAvailable() and (not e.CommanderoftheDead:IsAvailable()))) or l <= 30) then
            if o(e.ArmyoftheDead, nil, Snil) then
                a = 42650
                return "army_of_the_dead main 1"
            end

        end

        if e.Outbreak:IsReady() and ((i:DebuffRefreshable(e.VirulentPlagueDebuff) or (e.Superstrain:IsAvailable() and (i:DebuffRefreshable(e.FrostFeverDebuff) or i:DebuffRefreshable(e.BloodPlagueDebuff)))) and ((not e.UnholyBlight:IsAvailable()) or (e.UnholyBlight:IsAvailable() and e.UnholyBlight:CooldownRemains() > 15 / ((_(e.Superstrain:IsAvailable()) * 3) + (_(e.Plaguebringer:IsAvailable()) * 2))))) then
            if o(e.Outbreak, nil, nil, not i:IsSpellInRange(e.Outbreak)) then
                a = 77575
                return "outbreak main 18"
            end

        end

        if g:IsReady() and (e.Apocalypse:CooldownRemains() > L and e.Plaguebringer:IsAvailable() and e.Superstrain:IsAvailable() and t:BuffRemains(e.PlaguebringerBuff) < t:GCD()) then
            if o(g, nil, nil, not i:IsSpellInRange(g)) then
                if e.ClawingShadows:IsAvailable() then
                    a = 96320
                    return "wound_spender main 24"
                else
                    a = 55090
                    return "wound_spender main 24"
                end

            end

        end

        if ((n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and r()) then
            local e = w()
            if e then
                return e
            end

        end

        if (r()) then
            local e = re()
            if e then
                return e
            end

        end

        if (r()) then
            local e = ne()
            if e then
                return e
            end

        end

        if (true) then
            local e = le()
            if e then
                return e
            end

        end

        if (R() and x >= 4) then
            local t = ce()
            if t then
                return t
            end

            if o(e.Pool) then
                a = 9999999999
                return "pool for AoE()"
            end

        end

        if (x <= 3) then
            local t = F()
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

h.SetAPL(252, c, t)

