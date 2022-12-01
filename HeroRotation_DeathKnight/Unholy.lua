local e, e = ...
local e = HeroDBC.DBC
local b = HeroLib
local e = HeroCache
local m = b.Unit
local t = m.Player
local o = m.Target
local e = m.Boss
local c = m.Pet
local M = b.Spell
local j = b.Item
local r = HeroRotation
local i = r.Cast
local s = r.CDsON
local S = r.AoEON
local pe = HeroRotationCharDB.Toggles[4]
local f = HeroRotationCharDB.Toggles[5]
local Q = HeroRotationCharDB.Toggles[6]
local J = HeroRotationCharDB.Toggles[10]
local ve = HeroRotationCharDB.Toggles[11]
local x = HeroRotationCharDB.Toggles[12]
local Y = HeroRotationCharDB.Toggles[13]
local R = HeroRotationCharDB.Toggles[14]
local X = HeroRotationCharDB.Toggles[15]
local D = HeroRotationCharDB.Toggles[16]
local te = HeroRotationCharDB.Toggles[17]
local W = HeroRotationCharDB.Toggles[18]
local ee = nil
local F = nil
local e = false
local e = false
local e = false
local e = false
local e = false
local e = false
local e = 0
local ie = false
local ne = table.insert
local e = M.DeathKnight.Unholy
local p = j.DeathKnight.Unholy
local ye = {  }
local E = t:GetEquipment()
local V = E[13] and j(E[13]) or j(0)
local K = E[14] and j(E[14]) or j(0)
local ae, a = GetInventoryItemID("player", 13)
local oe, G = GetInventoryItemID("player", 14)
local me
local fe
local u = r.Commons.Everyone
local n = { General = r.GUISettings.General, Commons = r.GUISettings.APL.DeathKnight.Commons, Unholy = r.GUISettings.APL.DeathKnight.Unholy }
local L
local Z
local C
local a
local U
local I
local we
local T
local q
local z, N
local O, A
local v
local _
local a, a
local a
local k
local P = 11111
local l = 11111
local w = b.GhoulTable
local a = 0
local h = 0
local y, d
local H, g
local B
b:RegisterForEvent(function()
    E = t:GetEquipment()
    V = E[13] and j(E[13]) or j(0)
    K = E[14] and j(E[14]) or j(0)
end, "PLAYER_EQUIPMENT_CHANGED")
b:RegisterForEvent(function()
    P = 11111
    l = 11111
end, "PLAYER_REGEN_ENABLED")
local function E(e)
    if e then
        return 1
    else
        return 0
    end

end

local function j(e)
    return e ~= 0
end

local function ge()
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

local function j(e)
    local t = {  }
    for a in pairs(e) do
        if not m:IsInBossList(e[a]["UnitNPCID"]) then
            ne(t, e[a])
        end

    end

    return b.FightRemains(t)
end

local function j(t)
    return (t:DebuffStack(e.FesteringWoundDebuff))
end

local function ce(t)
    return (t:DebuffRemains(e.SoulReaper))
end

local function he(i)
                if ((i:DebuffUp(e.FesteringWoundDebuff) and q and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and i:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        h = 1275699
        return true
    elseif ((i:DebuffUp(e.FesteringWoundDebuff) and q and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and n.Unholy.TargetSwap == "AutoSwap" and i:GUID() ~= o:GUID() and not x) then
        h = 999
        return true
    elseif ((i:DebuffUp(e.FesteringWoundDebuff) and q and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and i:GUID() == o:GUID()) then
        a = 275699
        return true
    elseif (i:DebuffUp(e.FesteringWoundDebuff) and q and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3 or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) then
        return true
    end

end

local function ue(e)
            if (e:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        h = 1275699
        return true
    elseif (n.Unholy.TargetSwap == "AutoSwap" and e:GUID() ~= o:GUID() and not x) then
        h = 999
        return true
    elseif (e:GUID() == o:GUID()) then
        a = 275699
        return true
    else
        return true
    end

end

local function le(t)
                if ((t:TimeToX(35) < 5 and t:TimeToDie() > (t:DebuffRemains(e.SoulReaper) + 5)) and t:TimeToDie() > 5 and t:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        h = 343294
        return true
    elseif ((t:TimeToX(35) < 5 and t:TimeToDie() > (t:DebuffRemains(e.SoulReaper) + 5)) and n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not x) then
        h = 999
        return true
    elseif ((t:TimeToX(35) < 5 and t:TimeToDie() > (t:DebuffRemains(e.SoulReaper) + 5)) and t:TimeToDie() > 5 and t:GUID() == o:GUID()) then
        a = 343294
        return true
    elseif ((t:TimeToX(35) < 5 and t:TimeToDie() > (t:DebuffRemains(e.SoulReaper) + 5)) and t:TimeToDie() > 5) then
        return true
    end

end

local function se(t)
                if ((t:DebuffStack(e.FesteringWoundDebuff) < 4) and t:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        h = 185948
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) < 4) and n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not x) then
        h = 999
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) < 4) and t:GUID() == o:GUID()) then
        a = 85948
        return true
    elseif (t:DebuffStack(e.FesteringWoundDebuff) < 4) then
        return true
    end

end

local function V(e)
            if (e:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        h = 185948
        return true
    elseif (n.Unholy.TargetSwap == "AutoSwap" and e:GUID() ~= o:GUID() and not x) then
        h = 999
        return true
    elseif (e:GUID() == o:GUID()) then
        a = 85948
        return true
    else
        return true
    end

end

local function K(t)
                if ((t:DebuffStack(e.FesteringWoundDebuff) <= 2) and t:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        h = 1207289
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) <= 2) and n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not x) then
        h = 999
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) <= 2) and t:GUID() == o:GUID()) then
        a = 207289
        return true
    elseif (t:DebuffStack(e.FesteringWoundDebuff) <= 2) then
        return true
    end

end

local function K(t)
            if (t:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        if e.ClawingShadows:IsAvailable() then
            h = 1207311
            return true
        else
            h = 155090
            return true
        end

    elseif (n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not x) then
        h = 999
        return true
    elseif (t:GUID() == o:GUID()) then
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

local function ne(e)
            if (e:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        h = 1390279
        return true
    elseif (n.Unholy.TargetSwap == "AutoSwap" and e:GUID() ~= o:GUID() and not x) then
        h = 999
        return true
    elseif (e:GUID() == o:GUID()) then
        a = 390279
        return true
    else
        return true
    end

end

local function re()
    if e.RaiseDead:IsCastable() then
        if i(e.RaiseDead, nil, nil) then
            a = 46584
            return "raise_dead precombat 2 displaystyle"
        end

    end

    if e.Outbreak:IsReady() and not o:IsInMeleeRange(8) then
        if i(e.Outbreak, nil, nil, not o:IsSpellInRange(e.Outbreak)) then
            a = 77575
            return "outbreak precombat 8"
        end

    end

    if e.FesteringStrike:IsReady() and o:IsInMeleeRange(8) then
        if i(e.FesteringStrike) then
            a = 85948
            return "festering_strike precombat 6"
        end

    end

end

local function de()
    if _:IsReady() and not t:IsMoving() and ((t:BuffDown(e.DeathAndDecayBuff) and q and ((e.Festermight:IsAvailable() and t:BuffRemains(e.FestermightBuff) < 3) or not e.Festermight:IsAvailable()) and ((e.FesteringWoundDebuff:AuraActiveCount() == d or e.FesteringWoundDebuff:AuraActiveCount() > 3) or e.FesteringWoundDebuff:AuraActiveCount() == 8 or (not e.BurstingSores:IsAvailable() and not e.VileContagion:IsAvailable()) or (((e.VileContagion:CooldownDown() or not s()) or not e.VileContagion:IsAvailable()) and (c:BuffUp(e.DarkTransformation) or not f) and e.InfectedClaws:IsAvailable() and (t:BuffUp(e.EmpowerRuneWeaponBuff) or t:BuffUp(e.UnholyAssaultBuff) or not s())))) or l < 10) then
        if i(_, nil) then
            a = 43265
            return "any_dnd aoe 4"
        end

    end

    if e.AbominationLimb:IsCastable() and s() and not W and (t:Rune() == 0 and q) then
        if i(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 101"
        end

    end

    if e.Apocalypse:IsCastable() and f then
        if u.CastTargetIf(e.Apocalypse, y, "min", j, he, not o:IsInMeleeRange(8)) then
            return "apocalypse aoe 8"
        end

    end

    if e.FesteringStrike:IsReady() and (t:BuffDown(e.DeathAndDecayBuff) and (e.VileContagion:CooldownRemains() < 5 or ((e.Apocalypse:CooldownUp() or not f) and _:CooldownDown()))) then
        if u.CastTargetIf(e.FesteringStrike, y, "max", j, se, not o:IsInMeleeRange(8)) then
            return "festering_strike aoe 10"
        end

    end

    if e.FesteringStrike:IsReady() and (t:BuffDown(e.DeathAndDecayBuff) and (e.VileContagion:CooldownRemains() > 5 or not e.VileContagion:IsAvailable())) then
        if u.CastTargetIf(e.FesteringStrike, y, "min", j, V, not o:IsInMeleeRange(8)) then
            return "festering_strike aoe 12"
        end

    end

    if v:IsReady() and (t:BuffUp(e.DeathAndDecayBuff)) then
        if u.CastTargetIf(v, y, "max", j, K, not o:IsInMeleeRange(8)) then
            return "wound_spender aoe 14"
        end

    end

    if e.DeathCoil:IsReady() and ((not I) and not e.Epidemic:IsAvailable()) then
        if i(e.DeathCoil, nil, nil, not o:IsSpellInRange(e.DeathCoil)) then
            a = 47541
            return "death_coil aoe 16"
        end

    end

    if e.Epidemic:IsReady() and (not I) then
        if i(e.Epidemic, nil, nil, not o:IsSpellInRange(e.Epidemic)) then
            a = 207317
            return "epidemic aoe 18"
        end

    end

    if v:IsReady() and (e.DeathAndDecay:CooldownRemains() > 10) then
        if u.CastTargetIf(v, y, "max", j, K, not o:IsInMeleeRange(5)) then
            return "wound_spender aoe 20"
        end

    end

end

local function K()
    if n.Commons.Enabled.Potions then
        local h = u.PotionSelected()
        if h then
            local o = h:BuffDuration()
            if h:IsReady() and s() and n.Commons.Enabled.Potions and X and ((t:BloodlustUp() and r.GUISettings.General.HoldPotforBL) or (not r.GUISettings.General.HoldPotforBL and ((w:gargactive() and o >= w:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and c:BuffUp(e.DarkTransformation) and o >= c:BuffRemains(e.DarkTransformation)) or (O and A <= o) or (z and N <= o)) or l <= o)) then
                if i(h, nil) then
                    a = 50
                    return "potion cooldowns 2"
                end

            end

        end

    end

    if e.VileContagion:IsReady() and s() and (g >= 2 and _:CooldownRemains() < 3) then
        if u.CastTargetIf(e.VileContagion, H, "max", j, ne, not o:IsSpellInRange(e.VileContagion), nil) then
            return "vile_contagion cooldowns 4"
        end

    end

    if e.RaiseDead:IsCastable() then
        if i(e.RaiseDead, nil, nil) then
            a = 46584
            return "raise_dead cooldowns 26 displaystyle"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and s() and ((T and t:RunicPowerDeficit() > 20 and ((w:gargactive() and z) or (not e.SummonGargoyle:IsAvailable() and e.ArmyoftheDamned:IsAvailable() and O and z) or (not e.SummonGargoyle:IsAvailable() and not e.ArmyoftheDamned:IsAvailable() and c:BuffUp(e.DarkTransformation)) or (not e.SummonGargoyle:IsAvailable() and c:BuffUp(e.DarkTransformation)))) or l <= 21) then
        if i(e.EmpowerRuneWeapon, nil) then
            a = 47568
            return "empower_rune_weapon cooldowns 10"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and s() and (q and c:BuffUp(e.DarkTransformation)) then
        if i(e.EmpowerRuneWeapon, nil) then
            a = 47568
            return "empower_rune_weapon cooldowns 12"
        end

    end

    if e.SummonGargoyle:IsReady() and s() and (e.DarkTransformation:TimeSinceLastCast() <= 4 or (not e.CommanderoftheDead:IsAvailable() and t:RunicPower() >= 40)) then
        if i(e.SummonGargoyle, nil) then
            a = 49206
            return "summon_gargoyle cooldowns 14"
        end

    end

    if e.UnholyAssault:IsReady() and s() and (T) then
        if i(e.UnholyAssault, nil, nil, not o:IsInMeleeRange(5)) then
            a = 207289
            return "unholy_assault cooldowns 16"
        end

    end

    if e.DarkTransformation:IsCastable() and f and (T and e.Apocalypse:CooldownRemains() < t:GCD()) then
        if i(e.DarkTransformation, nil) then
            a = 63560
            return "dark_transformation cooldowns 20"
        end

    end

    if e.DarkTransformation:IsCastable() and f and ((q and ((_:CooldownRemains() < 10 and e.InfectedClaws:IsAvailable() and ((e.VileContagion:CooldownDown() and e.FesteringWoundDebuff:AuraActiveCount() < d) or not e.VileContagion:IsAvailable())) or not e.InfectedClaws:IsAvailable())) or l < 25) then
        if i(e.DarkTransformation, nil) then
            a = 63560
            return "dark_transformation cooldowns 22"
        end

    end

    if e.Apocalypse:IsReady() and f and (d <= 3 and ((not e.CommanderoftheDead:IsAvailable()) or (e.CommanderoftheDead:IsAvailable() and e.DarkTransformation:TimeSinceLastCast() <= 4))) then
        if u.CastTargetIf(e.Apocalypse, y, "max", j, ue, not o:IsInMeleeRange(8)) then
            return "apocalypse cooldowns 18"
        end

    end

    if e.SoulReaper:IsReady() and (d == 1 and o:TimeToX(35) < 5 and o:TimeToDie() > 5) then
        if i(e.SoulReaper, nil, nil, not o:IsSpellInRange(e.SoulReaper)) then
            a = 343294
            return "soul_reaper cooldowns 24"
        end

    end

    if e.SoulReaper:IsReady() and (d >= 2) then
        if u.CastTargetIf(e.SoulReaper, y, "min", ce, le, not o:IsSpellInRange(e.SoulReaper)) then
            return "soul_reaper cooldowns 26"
        end

    end

    if e.UnholyBlight:IsReady() and f and (T and (((not e.Apocalypse:IsAvailable() or e.Apocalypse:CooldownDown()) and e.Morbidity:IsAvailable()) or not e.Morbidity:IsAvailable())) then
        if i(e.UnholyBlight, nil, nil, not o:IsInRange(8)) then
            a = 115989
            return "unholy_blight cooldowns 28"
        end

    end

    if e.UnholyBlight:IsReady() and f and (q or l < 21) then
        if i(e.UnholyBlight, nil, nil, not o:IsInRange(8)) then
            a = 115989
            return "unholy_blight cooldowns 30"
        end

    end

    if e.AbominationLimb:IsCastable() and s() and not W and (T and t:Rune() < 3) then
        if i(e.AbominationLimb, nil) then
            a = 315443
            return "abomination_limb cooldowns 32"
        end

    end

    if e.SacrificialPact:IsReady() and s() and ((d >= 2 and c:BuffDown(e.DarkTransformation) and e.DarkTransformation:CooldownRemains() > 6) or l < t:GCD()) then
        if i(e.SacrificialPact, nil, nil, not o:IsInRange(8)) then
            a = 237574
            return "sacrificial_pact cooldowns 34"
        end

    end

end

local function ne()
    if e.ArcaneTorrent:IsCastable() and s() and (t:RunicPowerDeficit() > 20 and (e.SummonGargoyle:CooldownRemains() < t:GCD() or (not e.SummonGargoyle:IsAvailable()) or (w:gargactive() and t:Rune() < 2 and k < 1))) then
        if i(e.ArcaneTorrent, nil, nil, not o:IsInRange(8)) then
            a = 28730
            return "arcane_torrent main 2"
        end

    end

    if e.BloodFury:IsCastable() and s() and ((w:gargactive() and e.BloodFury:BaseDuration() >= w:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.BloodFury:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (O and A <= e.BloodFury:BaseDuration()) or (z and N <= e.BloodFury:BaseDuration()) or (g >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or l <= e.BloodFury:BaseDuration()) then
        if i(e.BloodFury, nil) then
            a = 20572
            return "blood_fury main 4"
        end

    end

    if e.Berserking:IsCastable() and s() and (((w:gargactive() and e.Berserking:BaseDuration() >= w:gargremains()) or (not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.Berserking:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (O and A <= e.Berserking:BaseDuration()) or (z and N <= e.Berserking:BaseDuration()) or (g >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or l <= e.Berserking:BaseDuration()) then
        if i(e.Berserking, nil) then
            a = 26297
            return "berserking main 6"
        end

    end

    if e.LightsJudgment:IsCastable() and s() and (t:BuffUp(e.UnholyStrengthBuff) and ((not e.Festermight:IsAvailable()) or (t:BuffRemains(e.FestermightBuff) < o:TimeToDie()) or (t:BuffRemains(e.UnholyStrengthBuff) < o:TimeToDie()))) then
        if i(e.LightsJudgment, nil, nil, not o:IsSpellInRange(e.LightsJudgment)) then
            a = 255647
            return "lights_judgment main 8"
        end

    end

    if e.AncestralCall:IsCastable() and s() and (((w:gargactive() and 15 >= w:gargremains()) or (not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and 15 >= c:BuffRemains(e.DarkTransformation)) or (O and A <= 15) or (z and N <= 15) or (g >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or l <= 15) then
        if i(e.AncestralCall, nil) then
            a = 274738
            return "ancestral_call main 10"
        end

    end

    if e.ArcanePulse:IsCastable() and s() and (d >= 2 or (t:Rune() <= 1 and t:RunicPowerDeficit() >= 60)) then
        if i(e.ArcanePulse, nil, nil, not o:IsInRange(8)) then
            a = 260364
            return "arcane_pulse main 12"
        end

    end

    if e.Fireblood:IsCastable() and s() and (((w:gargactive() and e.Fireblood:BaseDuration() >= w:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.Fireblood:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (O and A <= e.Fireblood:BaseDuration()) or (z and N <= e.Fireblood:BaseDuration()) or (g >= 2 and t:BuffUp(e.DeathAndDecayBuff))))) or l <= e.Fireblood:BaseDuration()) then
        if i(e.Fireblood, nil) then
            a = 265221
            return "fireblood main 14"
        end

    end

    if e.BagofTricks:IsCastable() and s() and (d == 1 and (t:BuffUp(e.UnholyStrengthBuff) or b.FilteredFightRemains(y, "<", 5))) then
        if i(e.BagofTricks, nil, nil, not o:IsSpellInRange(e.BagofTricks)) then
            a = 312411
            return "bag_of_tricks main 16"
        end

    end

end

local function se()
    if e.DeathCoil:IsReady() and ((not I) and (t:Rune() < 3 or w:gargactive() or t:BuffUp(e.SuddenDoomBuff))) then
        if i(e.DeathCoil, nil, nil, not o:IsSpellInRange(e.DeathCoil)) then
            a = 47541
            return "death_coil generic 4"
        end

    end

    if _:IsReady() and not t:IsMoving() and (t:BuffDown(e.DeathAndDecayBuff) and g >= 2 and (e.FesteringWoundDebuff:AuraActiveCount() == d or e.FesteringWoundDebuff:AuraActiveCount() > 3)) then
        if i(_, nil, nil) then
            a = 43265
            return "any_dnd generic 6"
        end

    end

    if v:IsReady() and (U or (d >= 2 and t:BuffUp(e.DeathAndDecayBuff))) then
        if i(v, nil, nil, not o:IsSpellInRange(v)) then
            if e.ClawingShadows:IsAvailable() then
                a = 207311
                return "wound_spender generic 10"
            else
                a = 55090
                return "wound_spender generic 10"
            end

        end

    end

    if e.FesteringStrike:IsReady() and (not U) then
        if u.CastTargetIf(e.FesteringStrike, y, "min", j, V, not o:IsInMeleeRange(8)) then
            return "festering_strike generic 10"
        end

    end

    if e.DeathCoil:IsReady() then
        if i(e.DeathCoil, nil, nil, not o:IsSpellInRange(e.DeathCoil)) then
            a = 47541
            return "death_coil generic 18"
        end

    end

end

local function w()
    if p.GaveloftheFirstArbiter:IsEquippedAndReady() and o:IsInRange(30) and s() and not te and n.Commons.Enabled.Items then
        if i(p.GaveloftheFirstArbiter, nil, nil, not o:IsInRange(30)) then
            a = 1515
            return "gavel_of_the_first_arbiter trinkets 4"
        end

    end

    if s() and (e.Apocalypse:CooldownDown() or c:BuffUp(e.DarkTransformation)) then
        local e = t:GetUseableTrinkets(ye)
        if e then
            if i(e, nil, nil) then
                                if e:ID() == ae and n.Commons.Enabled.TopTrinket then
                    a = 30
                    return "top trinket 1"
                elseif e:ID() == oe and n.Commons.Enabled.BottomTrinket then
                    a = 31
                    return "top trinket 2"
                end

            end

        end

    end

end

local function c()
    fe = not ge()
    y = t:GetEnemiesInMeleeRange(8)
    H = o:GetEnemiesInSplashRange(10)
    ae, G = GetInventoryItemID("player", 13)
    oe, G = GetInventoryItemID("player", 14)
    if S() then
        d = #y
        g = #H
    else
        d = 1
        g = 1
    end

    B = be(H)
    z = e.Apocalypse:TimeSinceLastCast() <= 15
    N = (z) and 15 - e.Apocalypse:TimeSinceLastCast() or 0
    O = e.ArmyoftheDead:TimeSinceLastCast() <= 30
    A = (A) and 30 - e.ArmyoftheDead:TimeSinceLastCast() or 0
    if u.TargetIsValid() or t:AffectingCombat() then
        P = b.BossFightRemains(nil, true)
        l = P
        if l == 11111 then
            l = b.FightRemains(Enemies10yd, false)
        end

    end

    Q = HeroRotationCharDB.Toggles[6]
    pe = HeroRotationCharDB.Toggles[4]
    f = HeroRotationCharDB.Toggles[5]
    J = HeroRotationCharDB.Toggles[10]
    ve = HeroRotationCharDB.Toggles[11]
    x = HeroRotationCharDB.Toggles[12]
    Y = HeroRotationCharDB.Toggles[13]
    R = HeroRotationCharDB.Toggles[14]
    X = HeroRotationCharDB.Toggles[15]
    D = HeroRotationCharDB.Toggles[16]
    te = HeroRotationCharDB.Toggles[17]
    W = HeroRotationCharDB.Toggles[18]
    ie = false
    if not BotOn then
        h = 0
        a = 0
    end

    if h > 0 then
        h = 0
    end

    if a > 0 then
        a = 0
    end

end

local function y()
    v = (e.ClawingShadows:IsAvailable() and e.ClawingShadows or e.ScourgeStrike)
    _ = e.DeathAndDecay
    if e.Defile:IsAvailable() then
        _ = e.Defile
    end

    me = c()
    if r.QueuedCast() then
        a = r.QueuedCast()
        return "Custom Queue " .. M(a):ID()
    end

        if r.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        ee = GetTime()
        F = ee + (r.GUISettings.General.OpenerReset)
    elseif r.GUISettings.General.OpenerReset > 0 and F ~= nil and GetTime() > F and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        r.ToggleIconFrame:UpdateButtonText(6)
        r.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (Y and e.AntiMagicZone:IsUsableP() and t:AffectingCombat() and e.AntiMagicZone:CooldownRemains(BypassRecovery) <= 0) then
        if i(e.AntiMagicZone, nil, nil, nil) then
            a = 145629
            return "queue AMZ"
        end

    elseif ((not e.AntiMagicZone:IsUsableP() or e.AntiMagicZone:CooldownRemains() > 0 or not t:AffectingCombat()) and Y) then
        HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13]
        r.Print("Anti-Magic Zone Queue is now " .. (HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (R and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and u.TargetIsValid() and m("mouseover"):GUID() ~= nil) then
        if i(e.DeathGrip, nil, nil, nil) then
            h = 149576
            return "queue DeathGrip MO"
        end

    elseif (R and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and u.TargetIsValid()) then
        if i(e.DeathGrip, nil, nil, nil) then
            a = 49576
            return "queue DeathGrip"
        end

    elseif ((not e.DeathGrip:IsUsableP() or e.DeathGrip:CooldownRemains() > 0 or not u.TargetIsValid()) and R) then
        HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14]
        r.Print("Death Grip Queue is now " .. (HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (D and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and m("mouseover"):GUID() ~= nil) then
        if i(e.Asphyxiate, nil, nil, nil) then
            h = 1221562
            return "queue Asphyxiate MO"
        end

    elseif (D and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and u.TargetIsValid()) then
        if i(e.Asphyxiate, nil, nil, nil) then
            a = 221562
            return "queue Asphyxiate"
        end

    elseif ((not e.Asphyxiate:IsUsableP() or e.Asphyxiate:CooldownRemains() > 0) and D) then
        HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16]
        r.Print("Asphyxiate Queue is now " .. (HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if t:IsChanneling(M(324631)) then
        if i(e.PoolResources, nil, nil, nil) then
            h = 36
            return "Raise Ally MO"
        end

    end

    if e.RaiseDead:IsCastable() then
        if n.Unholy.RaiseDeadCastLeft then
            if r.CastLeft(e.RaiseDead) then
                a = 46584
                return "raise_dead precombat 2 left"
            end

        else
            if i(e.RaiseDead, nil, nil) then
                a = 46584
                return "raise_dead precombat 2 displaystyle"
            end

        end

    end

    if u.TargetIsValid() then
        k = o:DebuffStack(e.FesteringWoundDebuff)
        if not t:AffectingCombat() and Q then
            local e = re()
            if e then
                return e
            end

        end

    end

    if u.TargetIsValid() and t:AffectingCombat() then
        k = o:DebuffStack(e.FesteringWoundDebuff)
        if (not UnitIsEnemy("player", "mouseover") and UnitIsDead("mouseover") and UnitIsPlayer("mouseover")) then
                        if e.RaiseAlly:IsCastable() and (t:RunicPower() >= 30) then
                if i(e.RaiseAlly, nil) then
                    h = 161999
                    return "RaiseAlly MO"
                end

            elseif e.RaiseAlly:CooldownRemains(BypassRecovery) <= 0 and (t:RunicPower() < 30) then
                ie = true
            end

        end

        if (n.Commons.UseDefensives) then
            if t:HealthPercentage() < n.Commons.HealthstoneHP and p.Healthstone:IsReady() and p.Healthstone:CooldownRemains() <= 0 then
                if i(p.Healthstone, nil) then
                    a = 40
                    return "Healthstone HP"
                end

            end

            if t:HealthPercentage() < n.Commons.HealPotHP and p.CosmicHealPot:IsReady() and p.CosmicHealPot:CooldownRemains() <= 0 then
                if i(p.CosmicHealPot, nil) then
                    a = 48707
                    return "CosmicHealPot HP"
                end

            end

            if t:HealthPercentage() < n.Commons.HealPotHP and p.HealPot:IsReady() and p.HealPot:CooldownRemains() <= 0 then
                if i(p.HealPot, nil) then
                    a = 41
                    return "HealPot HP"
                end

            end

            if t:HealthPercentage() < n.Commons.UseDarkSuccorHP and e.DeathStrike:IsReady() and t:BuffUp(e.DeathStrikeBuff) then
                if i(e.DeathStrike) then
                    a = 49998
                    return "DeathStrike Dark Succor HP"
                end

            end

            if t:HealthPercentage() < n.Commons.UseDeathStrikeHP and e.DeathStrike:IsReady() then
                if i(e.DeathStrike) then
                    a = 49998
                    return "DeathStrike HP"
                end

            end

            if t:HealthPercentage() < n.Commons.IceboundFortitudeHP and e.IceboundFortitude:IsReady() then
                if i(e.IceboundFortitude) then
                    a = 48792
                    return "Icebound Fortitude HP"
                end

            end

            if t:HealthPercentage() < n.Commons.LichborneHP and e.Lichborne:IsReady() then
                if i(e.Lichborne) then
                    a = 287081
                    return "Lichborne HP"
                end

            end

            if t:HealthPercentage() < n.Commons.AntiMagicShellHP and e.AntiMagicShell:IsReady() then
                if i(e.AntiMagicShell) then
                    a = 48707
                    return "Anti-Magic Shell HP"
                end

            end

            if t:HealthPercentage() < n.Commons.DeathPactHP and e.DeathPact:IsReady() then
                if i(e.DeathPact) then
                    a = 48743
                    return "Death Pact HP"
                end

            end

        end

        if e.Apocalypse:CooldownRemains() < 10 and f and k < 4 then
            L = 8
        else
            L = 4
        end

        if e.SummonGargoyle:CooldownRemains() < t:GCD() * 2 and s() then
            Z = ((((e.SummonGargoyle:CooldownRemains() + 1) / t:GCD()) / ((t:Rune() + 1) * (t:RunicPower() + 20))) * 100)
        else
            Z = t:GCD()
        end

        if (e.Festermight:IsAvailable() and t:BuffUp(e.FestermightBuff) and (t:BuffRemains(e.FestermightBuff) / (4 * t:GCD())) >= 1) then
            C = k >= 1
        else
            C = k >= (2 - E(e.InfectedClaws:IsAvailable()))
        end

        U = ((e.Apocalypse:CooldownRemains() > L or not f or not e.Apocalypse:IsAvailable()) and (C or (k >= 1 and (not e.Apocalypse:IsAvailable())) or (k >= 1 and (e.UnholyAssault:CooldownRemains() < 20 and s()) and e.UnholyAssault:IsAvailable() and T) or (k > 4) or (l < k * t:GCD())))
        I = (e.VileContagion:IsAvailable() and e.VileContagion:CooldownRemains() < 3 and t:RunicPower() < 60 and not T)
        we = (e.SoulReaper:IsAvailable() and t:Rune() < 2 and o:TimeToX(35) < 5 and l > 5)
        T = (d <= 3 or not S())
        q = (d >= 4 and S())
        if e.Outbreak:IsReady() and (B > 0 and d == 0) then
            if i(e.Outbreak, nil, nil, not o:IsSpellInRange(e.Outbreak)) then
                a = 77575
                return "outbreak out_of_range"
            end

        end

        if e.Epidemic:IsReady() and S() and e.VirulentPlagueDebuff:AuraActiveCount() > 1 and (not I and d == 0) then
            if i(e.Epidemic, nil, nil, not o:IsInRange(30)) then
                a = 207317
                return "epidemic out_of_range"
            end

        end

        if e.DeathCoil:IsReady() and e.VirulentPlagueDebuff:AuraActiveCount() < 2 and (not I and d == 0) then
            if i(e.DeathCoil, nil, nil, not o:IsSpellInRange(e.DeathCoil)) then
                a = 47541
                return "death_coil out_of_range"
            end

        end

        if e.ArmyoftheDead:IsReady() and not J and not n.Unholy.DisableAotD and s() and (((e.CommanderoftheDead:IsAvailable() and (e.DarkTransformation:CooldownRemains() < 4 or e.DarkTransformation:TimeSinceLastCast() <= 4)) or (not e.CommanderoftheDead:IsAvailable() and e.UnholyAssault:IsAvailable() and e.UnholyAssault:CooldownRemains() < 10) or (not e.UnholyAssault:IsAvailable() and (not e.CommanderoftheDead:IsAvailable()))) or l <= 30) then
            if i(e.ArmyoftheDead, nil, Snil) then
                a = 42650
                return "army_of_the_dead main 1"
            end

        end

        if e.Outbreak:IsReady() and ((o:DebuffRefreshable(e.VirulentPlagueDebuff) or (e.Superstrain:IsAvailable() and (o:DebuffRefreshable(e.FrostFeverDebuff) or o:DebuffRefreshable(e.BloodPlagueDebuff)))) and ((not e.UnholyBlight:IsAvailable()) or (e.UnholyBlight:IsAvailable() and (e.UnholyBlight:CooldownRemains() > 15 / ((E(e.Superstrain:IsAvailable()) * 3) + (E(e.Plaguebringer:IsAvailable()) * 2)) or not f)))) then
            if i(e.Outbreak, nil, nil, not o:IsSpellInRange(e.Outbreak)) then
                a = 77575
                return "outbreak main 18"
            end

        end

        if v:IsReady() and ((e.Apocalypse:CooldownRemains() > L or not f) and e.Plaguebringer:IsAvailable() and e.Superstrain:IsAvailable() and t:BuffRemains(e.PlaguebringerBuff) < t:GCD()) then
            if i(v, nil, nil, not o:IsSpellInRange(v)) then
                if e.ClawingShadows:IsAvailable() then
                    a = 96320
                    return "wound_spender main 24"
                else
                    a = 55090
                    return "wound_spender main 24"
                end

            end

        end

        if ((n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and s()) then
            local e = w()
            if e then
                return e
            end

        end

        if (s()) then
            local e = ne()
            if e then
                return e
            end

        end

        if (s()) then
            local e = K()
            if e then
                return e
            end

        end

        if (S() and g >= 4) then
            local t = de()
            if t then
                return t
            end

            if i(e.Pool) then
                a = 9999999999
                return "pool for AoE()"
            end

        end

        if (g <= 3) then
            local t = se()
            if t then
                return t
            end

            if i(e.Pool) then
                a = 9999999999
                return "pool for Generic()"
            end

        end

        if (true) then
            if i(e.Pool) then
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
    if h == 0 then
        return 0
    else
        return h
    end

end

r.SetAPL(252, y, t)

