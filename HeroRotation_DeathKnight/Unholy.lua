local e, e = ...
local e = HeroDBC.DBC
local q = HeroLib
local e = HeroCache
local m = q.Unit
local t = m.Player
local o = m.Target
local e = m.Boss
local c = m.Pet
local P = q.Spell
local _ = q.Item
local r = HeroRotation
local i = r.Cast
local h = r.CDsON
local S = r.AoEON
local pe = HeroRotationCharDB.Toggles[4]
local w = HeroRotationCharDB.Toggles[5]
local J = HeroRotationCharDB.Toggles[6]
local X = HeroRotationCharDB.Toggles[10]
local ve = HeroRotationCharDB.Toggles[11]
local E = HeroRotationCharDB.Toggles[12]
local F = HeroRotationCharDB.Toggles[13]
local L = HeroRotationCharDB.Toggles[14]
local Z = HeroRotationCharDB.Toggles[15]
local D = HeroRotationCharDB.Toggles[16]
local ee = HeroRotationCharDB.Toggles[17]
local W = HeroRotationCharDB.Toggles[18]
local te = nil
local M = nil
local e = false
local e = false
local e = false
local e = false
local e = false
local e = false
local e = 0
local ne = false
local ie = table.insert
local e = P.DeathKnight.Unholy
local y = _.DeathKnight.Unholy
local ye = {  }
local j = t:GetEquipment()
local B = j[13] and _(j[13]) or _(0)
local G = j[14] and _(j[14]) or _(0)
local oe, a = GetInventoryItemID("player", 13)
local ae, K = GetInventoryItemID("player", 14)
local me
local fe
local d = r.Commons.Everyone
local n = { General = r.GUISettings.General, Commons = r.GUISettings.APL.DeathKnight.Commons, Unholy = r.GUISettings.APL.DeathKnight.Unholy }
local H
local Q
local U
local a
local C
local N
local we
local T
local g
local x, I
local O, A
local p
local z
local a, a
local a
local k
local Y = 11111
local l = 11111
local f = q.GhoulTable
local a = 0
local s = 0
local v, u
local R, b
local V
q:RegisterForEvent(function()
    j = t:GetEquipment()
    B = j[13] and _(j[13]) or _(0)
    G = j[14] and _(j[14]) or _(0)
end, "PLAYER_EQUIPMENT_CHANGED")
q:RegisterForEvent(function()
    Y = 11111
    l = 11111
end, "PLAYER_REGEN_ENABLED")
local function _(e)
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
    local a = {  }
    for t in pairs(e) do
        if not m:IsInBossList(e[t]["UnitNPCID"]) then
            ie(a, e[t])
        end

    end

    return q.FightRemains(a)
end

local function j(t)
    return (t:DebuffStack(e.FesteringWoundDebuff))
end

local function ce(t)
    return (t:DebuffRemains(e.SoulReaper))
end

local function B(i)
                if (((i:DebuffUp(e.FesteringWoundDebuff) and g and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3) or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and i:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 1275699
        return true
    elseif (((i:DebuffUp(e.FesteringWoundDebuff) and g and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3) or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and n.Unholy.TargetSwap == "AutoSwap" and i:GUID() ~= o:GUID() and not E) then
        s = 999
        return true
    elseif (((i:DebuffUp(e.FesteringWoundDebuff) and g and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3) or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) and i:GUID() == o:GUID()) then
        a = 275699
        return true
    elseif ((i:DebuffUp(e.FesteringWoundDebuff) and g and t:BuffDown(e.DeathAndDecayBuff) and e.DeathAndDecay:CooldownRemains() < 3) or (t:BuffUp(e.DeathAndDecayBuff) and t:Rune() == 0)) then
        return true
    end

end

local function ue(e)
            if (e:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 1275699
        return true
    elseif (n.Unholy.TargetSwap == "AutoSwap" and e:GUID() ~= o:GUID() and not E) then
        s = 999
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
        s = 343294
        return true
    elseif ((t:TimeToX(35) < 5 and t:TimeToDie() > (t:DebuffRemains(e.SoulReaper) + 5)) and n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not E) then
        s = 999
        return true
    elseif ((t:TimeToX(35) < 5 and t:TimeToDie() > (t:DebuffRemains(e.SoulReaper) + 5)) and t:TimeToDie() > 5 and t:GUID() == o:GUID()) then
        a = 343294
        return true
    elseif ((t:TimeToX(35) < 5 and t:TimeToDie() > (t:DebuffRemains(e.SoulReaper) + 5)) and t:TimeToDie() > 5) then
        return true
    end

end

local function he(t)
                if ((t:DebuffStack(e.FesteringWoundDebuff) < 4) and t:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 185948
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) < 4) and n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not E) then
        s = 999
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) < 4) and t:GUID() == o:GUID()) then
        a = 85948
        return true
    elseif (t:DebuffStack(e.FesteringWoundDebuff) < 4) then
        return true
    end

end

local function G(e)
            if (e:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 185948
        return true
    elseif (n.Unholy.TargetSwap == "AutoSwap" and e:GUID() ~= o:GUID() and not E) then
        s = 999
        return true
    elseif (e:GUID() == o:GUID()) then
        a = 85948
        return true
    else
        return true
    end

end

local function ie(t)
                if ((t:DebuffStack(e.FesteringWoundDebuff) <= 2) and t:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 1207289
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) <= 2) and n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not E) then
        s = 999
        return true
    elseif ((t:DebuffStack(e.FesteringWoundDebuff) <= 2) and t:GUID() == o:GUID()) then
        a = 207289
        return true
    elseif (t:DebuffStack(e.FesteringWoundDebuff) <= 2) then
        return true
    end

end

local function ie(t)
            if (t:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        if e.ClawingShadows:IsAvailable() then
            s = 1207311
            return true
        else
            s = 155090
            return true
        end

    elseif (n.Unholy.TargetSwap == "AutoSwap" and t:GUID() ~= o:GUID() and not E) then
        s = 999
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

local function se(e)
            if (e:GUID() == m("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        s = 1390279
        return true
    elseif (n.Unholy.TargetSwap == "AutoSwap" and e:GUID() ~= o:GUID() and not E) then
        s = 999
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
    if z:IsReady() and not t:IsMoving() and ((t:BuffDown(e.DeathAndDecayBuff) and g and ((e.Festermight:IsAvailable() and t:BuffRemains(e.FestermightBuff) < 3) or not e.Festermight:IsAvailable()) and ((e.FesteringWoundDebuff:AuraActiveCount() == u or e.FesteringWoundDebuff:AuraActiveCount() > 3) or e.FesteringWoundDebuff:AuraActiveCount() == 8 or (not e.BurstingSores:IsAvailable() and not e.VileContagion:IsAvailable()) or (((e.VileContagion:CooldownDown() or not h()) or not e.VileContagion:IsAvailable()) and (c:BuffUp(e.DarkTransformation) or not w) and e.InfectedClaws:IsAvailable() and (t:BuffUp(e.EmpowerRuneWeaponBuff) or t:BuffUp(e.UnholyAssaultBuff) or not h())))) or l < 10) then
        if i(z, nil) then
            a = 43265
            return "any_dnd aoe 4"
        end

    end

    if e.AbominationLimb:IsCastable() and h() and not W and (t:Rune() == 0 and g) then
        if i(e.AbominationLimb, nil, nil) then
            a = 315443
            return "abomination_limb covenants 101"
        end

    end

    if e.Apocalypse:IsReady() and w then
        if j(o) and B(o) then
            if i(e.Apocalypse, nil, nil, not o:IsSpellInRange(e.Apocalypse)) then
                a = 275699
                return "apocalypse aoe 16"
            end

        end

        if d.CastTargetIf(e.Apocalypse, v, "min", j, B, not o:IsInMeleeRange(8)) then
            return "apocalypse aoe 8"
        end

    end

    if e.FesteringStrike:IsReady() and (t:BuffDown(e.DeathAndDecayBuff) and (e.VileContagion:CooldownRemains() < 5 or ((e.Apocalypse:CooldownUp() or not w) and z:CooldownDown()))) then
        if d.CastTargetIf(e.FesteringStrike, v, "max", j, he, not o:IsInMeleeRange(8)) then
            return "festering_strike aoe 10"
        end

    end

    if e.FesteringStrike:IsReady() and (t:BuffDown(e.DeathAndDecayBuff) and (e.VileContagion:CooldownRemains() > 5 or not e.VileContagion:IsAvailable())) then
        if d.CastTargetIf(e.FesteringStrike, v, "min", j, G, not o:IsInMeleeRange(8)) then
            return "festering_strike aoe 12"
        end

    end

    if p:IsReady() and (t:BuffUp(e.DeathAndDecayBuff)) then
        if d.CastTargetIf(p, v, "max", j, ie, not o:IsInMeleeRange(8)) then
            return "wound_spender aoe 14"
        end

    end

    if e.DeathCoil:IsReady() and ((not N) and not e.Epidemic:IsAvailable()) then
        if i(e.DeathCoil, nil, nil, not o:IsSpellInRange(e.DeathCoil)) then
            a = 47541
            return "death_coil aoe 16"
        end

    end

    if e.Epidemic:IsReady() and (not N) then
        if i(e.Epidemic, nil, nil, not o:IsSpellInRange(e.Epidemic)) then
            a = 207317
            return "epidemic aoe 18"
        end

    end

    if p:IsReady() and (e.DeathAndDecay:CooldownRemains() > 10) then
        if d.CastTargetIf(p, v, "max", j, ie, not o:IsInMeleeRange(5)) then
            return "wound_spender aoe 20"
        end

    end

end

local function he()
    if n.Commons.Enabled.Potions then
        local s = d.PotionSelected()
        if s then
            local o = s:BuffDuration()
            if s:IsReady() and h() and n.Commons.Enabled.Potions and Z and ((t:BloodlustUp() and r.GUISettings.General.HoldPotforBL) or (not r.GUISettings.General.HoldPotforBL and ((f:gargactive() and o >= f:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and c:BuffUp(e.DarkTransformation) and o >= c:BuffRemains(e.DarkTransformation)) or (O and A <= o) or (x and I <= o)) or l <= o)) then
                if i(s, nil) then
                    a = 50
                    return "potion cooldowns 2"
                end

            end

        end

    end

    if e.VileContagion:IsReady() and h() and (b >= 2 and z:CooldownRemains() < 3) then
        if d.CastTargetIf(e.VileContagion, R, "max", j, se, not o:IsSpellInRange(e.VileContagion), nil) then
            return "vile_contagion cooldowns 4"
        end

    end

    if e.RaiseDead:IsCastable() then
        if i(e.RaiseDead, nil, nil) then
            a = 46584
            return "raise_dead cooldowns 26 displaystyle"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and h() and ((T and t:RunicPowerDeficit() > 20 and ((f:gargactive() and x) or (not e.SummonGargoyle:IsAvailable() and e.ArmyoftheDamned:IsAvailable() and O and x) or (not e.SummonGargoyle:IsAvailable() and not e.ArmyoftheDamned:IsAvailable() and c:BuffUp(e.DarkTransformation)) or (not e.SummonGargoyle:IsAvailable() and c:BuffUp(e.DarkTransformation)))) or l <= 21) then
        if i(e.EmpowerRuneWeapon, nil) then
            a = 47568
            return "empower_rune_weapon cooldowns 10"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and h() and (g and c:BuffUp(e.DarkTransformation)) then
        if i(e.EmpowerRuneWeapon, nil) then
            a = 47568
            return "empower_rune_weapon cooldowns 12"
        end

    end

    if e.SummonGargoyle:IsReady() and h() and (e.DarkTransformation:TimeSinceLastCast() <= 4 or (not e.CommanderoftheDead:IsAvailable() and t:RunicPower() >= 40)) then
        if i(e.SummonGargoyle, nil) then
            a = 49206
            return "summon_gargoyle cooldowns 14"
        end

    end

    if e.UnholyAssault:IsReady() and h() and (T) then
        if i(e.UnholyAssault, nil, nil, not o:IsInMeleeRange(5)) then
            a = 207289
            return "unholy_assault cooldowns 16"
        end

    end

    if e.DarkTransformation:IsCastable() and w and (T and e.Apocalypse:CooldownRemains() < t:GCD()) then
        if i(e.DarkTransformation, nil) then
            a = 63560
            return "dark_transformation cooldowns 20"
        end

    end

    if e.DarkTransformation:IsCastable() and w and ((g and ((z:CooldownRemains() < 10 and e.InfectedClaws:IsAvailable() and ((e.VileContagion:CooldownDown() and e.FesteringWoundDebuff:AuraActiveCount() < u) or not e.VileContagion:IsAvailable())) or not e.InfectedClaws:IsAvailable())) or l < 25) then
        if i(e.DarkTransformation, nil) then
            a = 63560
            return "dark_transformation cooldowns 22"
        end

    end

    if e.Apocalypse:IsReady() and w and (u <= 3 and ((not e.CommanderoftheDead:IsAvailable()) or (e.CommanderoftheDead:IsAvailable() and e.DarkTransformation:TimeSinceLastCast() <= 4))) then
        if d.CastTargetIf(e.Apocalypse, v, "max", j, ue, not o:IsInMeleeRange(8)) then
            return "apocalypse cooldowns 18"
        end

    end

    if e.SoulReaper:IsReady() and (u == 1 and o:TimeToX(35) < 5 and o:TimeToDie() > 5) then
        if i(e.SoulReaper, nil, nil, not o:IsSpellInRange(e.SoulReaper)) then
            a = 343294
            return "soul_reaper cooldowns 24"
        end

    end

    if e.SoulReaper:IsReady() and (u >= 2) then
        if d.CastTargetIf(e.SoulReaper, v, "min", ce, le, not o:IsSpellInRange(e.SoulReaper)) then
            return "soul_reaper cooldowns 26"
        end

    end

    if e.UnholyBlight:IsReady() and w and (T and (((not e.Apocalypse:IsAvailable() or e.Apocalypse:CooldownDown()) and e.Morbidity:IsAvailable()) or not e.Morbidity:IsAvailable())) then
        if i(e.UnholyBlight, nil, nil, not o:IsInRange(8)) then
            a = 115989
            return "unholy_blight cooldowns 28"
        end

    end

    if e.UnholyBlight:IsReady() and w and (g or l < 21) then
        if i(e.UnholyBlight, nil, nil, not o:IsInRange(8)) then
            a = 115989
            return "unholy_blight cooldowns 30"
        end

    end

    if e.AbominationLimb:IsCastable() and h() and not W and (T and t:Rune() < 3) then
        if i(e.AbominationLimb, nil) then
            a = 315443
            return "abomination_limb cooldowns 32"
        end

    end

    if e.SacrificialPact:IsReady() and h() and ((u >= 2 and c:BuffDown(e.DarkTransformation) and e.DarkTransformation:CooldownRemains() > 6) or l < t:GCD()) then
        if i(e.SacrificialPact, nil, nil, not o:IsInRange(8)) then
            a = 237574
            return "sacrificial_pact cooldowns 34"
        end

    end

end

local function B()
    if e.ArcaneTorrent:IsCastable() and h() and (t:RunicPowerDeficit() > 20 and (e.SummonGargoyle:CooldownRemains() < t:GCD() or (not e.SummonGargoyle:IsAvailable()) or (f:gargactive() and t:Rune() < 2 and k < 1))) then
        if i(e.ArcaneTorrent, nil, nil, not o:IsInRange(8)) then
            a = 28730
            return "arcane_torrent main 2"
        end

    end

    if e.BloodFury:IsCastable() and h() and ((f:gargactive() and e.BloodFury:BaseDuration() >= f:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.BloodFury:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (O and A <= e.BloodFury:BaseDuration()) or (x and I <= e.BloodFury:BaseDuration()) or (b >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or l <= e.BloodFury:BaseDuration()) then
        if i(e.BloodFury, nil) then
            a = 20572
            return "blood_fury main 4"
        end

    end

    if e.Berserking:IsCastable() and h() and (((f:gargactive() and e.Berserking:BaseDuration() >= f:gargremains()) or (not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.Berserking:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (O and A <= e.Berserking:BaseDuration()) or (x and I <= e.Berserking:BaseDuration()) or (b >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or l <= e.Berserking:BaseDuration()) then
        if i(e.Berserking, nil) then
            a = 26297
            return "berserking main 6"
        end

    end

    if e.LightsJudgment:IsCastable() and h() and (t:BuffUp(e.UnholyStrengthBuff) and ((not e.Festermight:IsAvailable()) or (t:BuffRemains(e.FestermightBuff) < o:TimeToDie()) or (t:BuffRemains(e.UnholyStrengthBuff) < o:TimeToDie()))) then
        if i(e.LightsJudgment, nil, nil, not o:IsSpellInRange(e.LightsJudgment)) then
            a = 255647
            return "lights_judgment main 8"
        end

    end

    if e.AncestralCall:IsCastable() and h() and (((f:gargactive() and 15 >= f:gargremains()) or (not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and 15 >= c:BuffRemains(e.DarkTransformation)) or (O and A <= 15) or (x and I <= 15) or (b >= 2 and t:BuffUp(e.DeathAndDecayBuff)))) or l <= 15) then
        if i(e.AncestralCall, nil) then
            a = 274738
            return "ancestral_call main 10"
        end

    end

    if e.ArcanePulse:IsCastable() and h() and (u >= 2 or (t:Rune() <= 1 and t:RunicPowerDeficit() >= 60)) then
        if i(e.ArcanePulse, nil, nil, not o:IsInRange(8)) then
            a = 260364
            return "arcane_pulse main 12"
        end

    end

    if e.Fireblood:IsCastable() and h() and (((f:gargactive() and e.Fireblood:BaseDuration() >= f:gargremains()) or ((not e.SummonGargoyle:IsAvailable() or e.SummonGargoyle:CooldownRemains() > 60) and ((c:BuffUp(e.DarkTransformation) and e.Fireblood:BaseDuration() >= c:BuffRemains(e.DarkTransformation)) or (O and A <= e.Fireblood:BaseDuration()) or (x and I <= e.Fireblood:BaseDuration()) or (b >= 2 and t:BuffUp(e.DeathAndDecayBuff))))) or l <= e.Fireblood:BaseDuration()) then
        if i(e.Fireblood, nil) then
            a = 265221
            return "fireblood main 14"
        end

    end

    if e.BagofTricks:IsCastable() and h() and (u == 1 and (t:BuffUp(e.UnholyStrengthBuff) or q.FilteredFightRemains(v, "<", 5))) then
        if i(e.BagofTricks, nil, nil, not o:IsSpellInRange(e.BagofTricks)) then
            a = 312411
            return "bag_of_tricks main 16"
        end

    end

end

local function ie()
    if e.DeathCoil:IsReady() and ((not N) and (t:Rune() < 3 or f:gargactive() or t:BuffUp(e.SuddenDoomBuff))) then
        if i(e.DeathCoil, nil, nil, not o:IsSpellInRange(e.DeathCoil)) then
            a = 47541
            return "death_coil generic 4"
        end

    end

    if z:IsReady() and not t:IsMoving() and (t:BuffDown(e.DeathAndDecayBuff) and b >= 2 and (e.FesteringWoundDebuff:AuraActiveCount() == u or e.FesteringWoundDebuff:AuraActiveCount() > 3)) then
        if i(z, nil, nil) then
            a = 43265
            return "any_dnd generic 6"
        end

    end

    if p:IsReady() and (C or (u >= 2 and t:BuffUp(e.DeathAndDecayBuff))) then
        if i(p, nil, nil, not o:IsSpellInRange(p)) then
            if e.ClawingShadows:IsAvailable() then
                a = 207311
                return "wound_spender generic 10"
            else
                a = 55090
                return "wound_spender generic 10"
            end

        end

    end

    if e.FesteringStrike:IsReady() and (not C) then
        if d.CastTargetIf(e.FesteringStrike, v, "min", j, G, not o:IsInMeleeRange(8)) then
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

local function f()
    if y.GaveloftheFirstArbiter:IsEquippedAndReady() and o:IsInRange(30) and h() and not ee and n.Commons.Enabled.Items then
        if i(y.GaveloftheFirstArbiter, nil, nil, not o:IsInRange(30)) then
            a = 1515
            return "gavel_of_the_first_arbiter trinkets 4"
        end

    end

    if h() and (e.Apocalypse:CooldownDown() or c:BuffUp(e.DarkTransformation)) then
        local e = t:GetUseableTrinkets(ye)
        if e then
            if i(e, nil, nil) then
                                if e:ID() == oe and n.Commons.Enabled.TopTrinket then
                    a = 30
                    return "top trinket 1"
                elseif e:ID() == ae and n.Commons.Enabled.BottomTrinket then
                    a = 31
                    return "top trinket 2"
                end

            end

        end

    end

end

local function j()
    fe = not ge()
    v = t:GetEnemiesInMeleeRange(8)
    R = t:GetEnemiesInMeleeRange(10)
    oe, K = GetInventoryItemID("player", 13)
    ae, K = GetInventoryItemID("player", 14)
    if S() then
        u = #v
        b = #R
    else
        u = 1
        b = 1
    end

    V = be(R)
    x = e.Apocalypse:TimeSinceLastCast() <= 15
    I = (x) and 15 - e.Apocalypse:TimeSinceLastCast() or 0
    O = e.ArmyoftheDead:TimeSinceLastCast() <= 30
    A = (A) and 30 - e.ArmyoftheDead:TimeSinceLastCast() or 0
    if d.TargetIsValid() or t:AffectingCombat() then
        Y = q.BossFightRemains(nil, true)
        l = Y
        if l == 11111 then
            l = q.FightRemains(Enemies10yd, false)
        end

    end

    J = HeroRotationCharDB.Toggles[6]
    pe = HeroRotationCharDB.Toggles[4]
    w = HeroRotationCharDB.Toggles[5]
    X = HeroRotationCharDB.Toggles[10]
    ve = HeroRotationCharDB.Toggles[11]
    E = HeroRotationCharDB.Toggles[12]
    F = HeroRotationCharDB.Toggles[13]
    L = HeroRotationCharDB.Toggles[14]
    Z = HeroRotationCharDB.Toggles[15]
    D = HeroRotationCharDB.Toggles[16]
    ee = HeroRotationCharDB.Toggles[17]
    W = HeroRotationCharDB.Toggles[18]
    ne = false
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
    p = (e.ClawingShadows:IsAvailable() and e.ClawingShadows or e.ScourgeStrike)
    z = e.DeathAndDecay
    if e.Defile:IsAvailable() then
        z = e.Defile
    end

    me = j()
    if r.QueuedCast() then
        a = r.QueuedCast()
        return "Custom Queue " .. P(a):ID()
    end

        if r.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        te = GetTime()
        M = te + (r.GUISettings.General.OpenerReset)
    elseif r.GUISettings.General.OpenerReset > 0 and M ~= nil and GetTime() > M and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        r.ToggleIconFrame:UpdateButtonText(6)
        r.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (F and e.AntiMagicZone:IsUsableP() and t:AffectingCombat() and e.AntiMagicZone:CooldownRemains(BypassRecovery) <= 0) then
        if i(e.AntiMagicZone, nil, nil, nil) then
            a = 145629
            return "queue AMZ"
        end

    elseif ((not e.AntiMagicZone:IsUsableP() or e.AntiMagicZone:CooldownRemains() > 0 or not t:AffectingCombat()) and F) then
        HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13]
        r.Print("Anti-Magic Zone Queue is now " .. (HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (L and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and d.TargetIsValid() and m("mouseover"):GUID() ~= nil) then
        if i(e.DeathGrip, nil, nil, nil) then
            s = 149576
            return "queue DeathGrip MO"
        end

    elseif (L and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and d.TargetIsValid()) then
        if i(e.DeathGrip, nil, nil, nil) then
            a = 49576
            return "queue DeathGrip"
        end

    elseif ((not e.DeathGrip:IsUsableP() or e.DeathGrip:CooldownRemains() > 0 or not d.TargetIsValid()) and L) then
        HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14]
        r.Print("Death Grip Queue is now " .. (HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (D and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and m("mouseover"):GUID() ~= nil) then
        if i(e.Asphyxiate, nil, nil, nil) then
            s = 1221562
            return "queue Asphyxiate MO"
        end

    elseif (D and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and d.TargetIsValid()) then
        if i(e.Asphyxiate, nil, nil, nil) then
            a = 221562
            return "queue Asphyxiate"
        end

    elseif ((not e.Asphyxiate:IsUsableP() or e.Asphyxiate:CooldownRemains() > 0) and D) then
        HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16]
        r.Print("Asphyxiate Queue is now " .. (HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if t:IsChanneling(P(324631)) then
        if i(e.PoolResources, nil, nil, nil) then
            s = 36
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

    if d.TargetIsValid() then
        k = o:DebuffStack(e.FesteringWoundDebuff)
        if not t:AffectingCombat() and J then
            local e = re()
            if e then
                return e
            end

        end

    end

    if d.TargetIsValid() and t:AffectingCombat() then
        k = o:DebuffStack(e.FesteringWoundDebuff)
        if (not UnitIsEnemy("player", "mouseover") and UnitIsDead("mouseover") and UnitIsPlayer("mouseover")) then
                        if e.RaiseAlly:IsCastable() and (t:RunicPower() >= 30) then
                if i(e.RaiseAlly, nil) then
                    s = 161999
                    return "RaiseAlly MO"
                end

            elseif e.RaiseAlly:CooldownRemains(BypassRecovery) <= 0 and (t:RunicPower() < 30) then
                ne = true
            end

        end

        if (n.Commons.UseDefensives) then
            if t:HealthPercentage() < n.Commons.HealthstoneHP and y.Healthstone:IsReady() and y.Healthstone:CooldownRemains() <= 0 then
                if i(y.Healthstone, nil) then
                    a = 40
                    return "Healthstone HP"
                end

            end

            if t:HealthPercentage() < n.Commons.HealPotHP and y.CosmicHealPot:IsReady() and y.CosmicHealPot:CooldownRemains() <= 0 then
                if i(y.CosmicHealPot, nil) then
                    a = 48707
                    return "CosmicHealPot HP"
                end

            end

            if t:HealthPercentage() < n.Commons.HealPotHP and y.HealPot:IsReady() and y.HealPot:CooldownRemains() <= 0 then
                if i(y.HealPot, nil) then
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

        if e.Apocalypse:CooldownRemains() < 10 and w and k < 4 then
            H = 8
        else
            H = 4
        end

        if e.SummonGargoyle:CooldownRemains() < t:GCD() * 2 and h() then
            Q = ((((e.SummonGargoyle:CooldownRemains() + 1) / t:GCD()) / ((t:Rune() + 1) * (t:RunicPower() + 20))) * 100)
        else
            Q = t:GCD()
        end

        if (e.Festermight:IsAvailable() and t:BuffUp(e.FestermightBuff) and (t:BuffRemains(e.FestermightBuff) / (4 * t:GCD())) >= 1) then
            U = k >= 1
        else
            U = k >= (2 - _(e.InfectedClaws:IsAvailable()))
        end

        C = ((e.Apocalypse:CooldownRemains() > H or not w or not e.Apocalypse:IsAvailable()) and b == 1 and (U or (k >= 1 and (not e.Apocalypse:IsAvailable())) or (k >= 1 and (e.UnholyAssault:CooldownRemains() < 20 and h()) and e.UnholyAssault:IsAvailable() and T) or (k > 4) or (l < k * t:GCD())))
        N = (e.VileContagion:IsAvailable() and e.VileContagion:CooldownRemains() < 3 and t:RunicPower() < 60 and not T)
        we = (e.SoulReaper:IsAvailable() and t:Rune() < 2 and o:TimeToX(35) < 5 and l > 5)
        T = (u <= 3 or not S())
        g = (u >= 4 and S())
        if e.Outbreak:IsReady() and (V > 0 and u == 0) then
            if i(e.Outbreak, nil, nil, not o:IsSpellInRange(e.Outbreak)) then
                a = 77575
                return "outbreak out_of_range"
            end

        end

        if e.Epidemic:IsReady() and S() and e.VirulentPlagueDebuff:AuraActiveCount() > 1 and (not N and u == 0) then
            if i(e.Epidemic, nil, nil, not o:IsInRange(30)) then
                a = 207317
                return "epidemic out_of_range"
            end

        end

        if e.DeathCoil:IsReady() and e.VirulentPlagueDebuff:AuraActiveCount() < 2 and (not N and u == 0) then
            if i(e.DeathCoil, nil, nil, not o:IsSpellInRange(e.DeathCoil)) then
                a = 47541
                return "death_coil out_of_range"
            end

        end

        if e.ArmyoftheDead:IsReady() and not X and not n.Unholy.DisableAotD and h() and (((e.CommanderoftheDead:IsAvailable() and (e.DarkTransformation:CooldownRemains() < 4 or e.DarkTransformation:TimeSinceLastCast() <= 4)) or (not e.CommanderoftheDead:IsAvailable() and e.UnholyAssault:IsAvailable() and e.UnholyAssault:CooldownRemains() < 10) or (not e.UnholyAssault:IsAvailable() and (not e.CommanderoftheDead:IsAvailable()))) or l <= 30) then
            if i(e.ArmyoftheDead, nil, Snil) then
                a = 42650
                return "army_of_the_dead main 1"
            end

        end

        if e.Outbreak:IsReady() and ((o:DebuffRefreshable(e.VirulentPlagueDebuff) or (e.Superstrain:IsAvailable() and (o:DebuffRefreshable(e.FrostFeverDebuff) or o:DebuffRefreshable(e.BloodPlagueDebuff)))) and ((not e.UnholyBlight:IsAvailable()) or (e.UnholyBlight:IsAvailable() and (e.UnholyBlight:CooldownRemains() > 15 / ((_(e.Superstrain:IsAvailable()) * 3) + (_(e.Plaguebringer:IsAvailable()) * 2)) or not w)))) then
            if i(e.Outbreak, nil, nil, not o:IsSpellInRange(e.Outbreak)) then
                a = 77575
                return "outbreak main 18"
            end

        end

        if p:IsReady() and ((e.Apocalypse:CooldownRemains() > H or not w) and e.Plaguebringer:IsAvailable() and e.Superstrain:IsAvailable() and t:BuffRemains(e.PlaguebringerBuff) < t:GCD()) then
            if i(p, nil, nil, not o:IsSpellInRange(p)) then
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
            local e = f()
            if e then
                return e
            end

        end

        if (h()) then
            local e = B()
            if e then
                return e
            end

        end

        if (true) then
            local e = he()
            if e then
                return e
            end

        end

        if (S() and b >= 4) then
            local t = de()
            if t then
                return t
            end

            if i(e.Pool) then
                a = 9999999999
                return "pool for AoE()"
            end

        end

        if (b <= 3) then
            local t = ie()
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
    if s == 0 then
        return 0
    else
        return s
    end

end

r.SetAPL(252, c, t)

