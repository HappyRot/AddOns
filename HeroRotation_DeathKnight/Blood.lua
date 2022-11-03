local e, e = ...
local e = HeroDBC.DBC
local y = HeroLib
local e = HeroCache
local d = y.Unit
local t = d.Player
local a = d.Target
local ie = d.Pet
local j = y.Spell
local k = y.Item
local s = HeroRotation
local i = s.Cast
local r = s.CDsON
local ee = s.AoEON
local w = HeroRotationCharDB.Toggles[4]
local v = HeroRotationCharDB.Toggles[5]
local C = HeroRotationCharDB.Toggles[6]
local Z = HeroRotationCharDB.Toggles[12]
local O = HeroRotationCharDB.Toggles[13]
local H = HeroRotationCharDB.Toggles[14]
local X = HeroRotationCharDB.Toggles[15]
local R = HeroRotationCharDB.Toggles[16]
local S = HeroRotationCharDB.Toggles[80]
local I = HeroRotationCharDB.Toggles[81]
local N = HeroRotationCharDB.Toggles[82]
local D = HeroRotationCharDB.Toggles[84]
local L = HeroRotationCharDB.Toggles[17]
local W = HeroRotationCharDB.Toggles[85]
local q = HeroRotationCharDB.Toggles[72]
local p = HeroRotationCharDB.Toggles[83]
local ae = false
local f = 0
local te = math.min
local e = j.DeathKnight.Blood
local h = k.DeathKnight.Blood
local ne = {  }
local oe
local M
local o
local E
local T
local o
local x
local U
local m
local F
local A
local Y = y.GhoulTable
local g
local c
local B = 2
local o = 999999
local o = 2
local l = t:CovenantID()
y:RegisterForEvent(function()
    l = t:CovenantID()
end, "COVENANT_CHOSEN")
local b = s.Commons.Everyone
local n = { General = s.GUISettings.General, Commons = s.GUISettings.APL.DeathKnight.Commons, Blood = s.GUISettings.APL.DeathKnight.Blood }
local o = { { e.Asphyxiate, "Cast Asphyxiate (Interrupt)", function()
    return true
end } }
local o = 0
local u = 0
local P = t:HasLegendaryEquipped(30)
local V = t:HasLegendaryEquipped(31)
local G = t:HasLegendaryEquipped(45)
local z = t:HasLegendaryEquipped(35)
y:RegisterForEvent(function()
    equip = t:GetEquipment()
    trinket1 = k(0)
    trinket2 = k(0)
    if equip[13] then
        trinket1 = k(equip[13])
    end

    if equip[14] then
        trinket2 = k(equip[14])
    end

    P = t:HasLegendaryEquipped(30)
    V = t:HasLegendaryEquipped(31)
    G = t:HasLegendaryEquipped(45)
    z = t:HasLegendaryEquipped(35)
end, "PLAYER_EQUIPMENT_CHANGED")
local k = { 5, 8, 10, 30, 40, 100 }
local y = {  }
local function P()
    for t, e in ipairs(k) do
        if e == 8 or 5 then
            y[e] = a:IsInMeleeRange(e)
        end

        y[e] = a:IsInRange(e)
    end

end

local function y(e)
    if e then
        return 1
    else
        return 0
    end

end

local function k(e)
    return e ~= 0
end

local function V(o)
    local e = 0
    if o ~= nil then
        for i, o in pairs(o) do
            if not t:IsTanking(o) and o:GUID() ~= a:GUID() and o:AffectingCombat() then
                e = e + 1
            end

        end

    end

    return e
end

local function k(a)
    local t = 0
    if a ~= nil then
        for o, a in pairs(a) do
            if not a:DebuffUp(e.BloodPlagueDebuff) then
                t = t + 1
            end

        end

    end

    return t
end

local function P(e)
            if ((not t:IsTanking(e) and q) and (e:AffectingCombat()) and e:GUID() == d("mouseover"):GUID() and e:NPCID() ~= 118044 and e:IsInMeleeRange(30)) then
        u = 156222
        return true
    elseif ((not t:IsTanking(e) and q) and (e:AffectingCombat()) and e:GUID() == a:GUID() and e:NPCID() ~= 118044 and e:IsInMeleeRange(30)) then
        o = 56222
        return true
    elseif ((not t:IsTanking(e) and q) and (e:AffectingCombat()) and e:NPCID() ~= 118044 and e:IsInMeleeRange(30)) then
        return true
    end

end

local function Q()
    if b.TargetIsValid() then
        if e.Fleshcraft:IsCastable() and (f == 0 or f > e.Fleshcraft:ExecuteTime()) and w and not t:IsMoving() then
            if i(e.Fleshcraft, nil, nil) then
                o = 324631
                return "fleshcraft precombat 1"
            end

        end

        if e.Marrowrend:IsReady() and a:IsInMeleeRange(8) then
            if i(e.Marrowrend) then
                o = 195182
                return "marrowrend precombat 4"
            end

        end

        if e.BloodBoil:IsCastable() and a:IsInMeleeRange(10) then
            if i(e.BloodBoil) then
                o = 50842
                return "blood_boil precombat 6"
            end

        end

    end

end

local function J()
    if e.DeathStrike:IsReady() and (n.Commons.UseDefensives) and a:IsInMeleeRange(8) and not c and t:HealthPercentage() < n.Commons.UseDeathStrikeHP then
        if i(e.DeathStrike, nil, nil, not a:IsSpellInRange(e.DeathStrike)) then
            o = 49998
            return "death_strike defensives 4"
        end

    end

    if t:HealthPercentage() < n.Commons.PhialHP and (n.Commons.UseDefensives) and h.PhialofSerenity:IsReady() and h.PhialofSerenity:CooldownRemains() <= 0 and t:BuffDown(e.ShroudofPurgatory) then
        if s.Cast(h.PhialofSerenity, nil) then
            o = 55
            return "PhialofSerenity HP"
        end

    end

    if t:HealthPercentage() < n.Commons.HealthstoneHP and (n.Commons.UseDefensives) and h.Healthstone:IsReady() and h.Healthstone:CooldownRemains() <= 0 and t:BuffDown(e.ShroudofPurgatory) then
        if s.Cast(h.Healthstone, nil) then
            o = 40
            return "Healthstone HP"
        end

    end

    if t:HealthPercentage() < n.Commons.HealPotHP and (n.Commons.UseDefensives) and h.CosmicHealPot:IsReady() and h.CosmicHealPot:CooldownRemains() <= 0 and t:BuffDown(e.ShroudofPurgatory) then
        if s.Cast(h.CosmicHealPot, nil) then
            o = 45
            return "CosmicHealPot HP"
        end

    end

    if t:HealthPercentage() < n.Commons.HealPotHP and (n.Commons.UseDefensives) and h.HealPot:IsReady() and h.HealPot:CooldownRemains() <= 0 and t:BuffDown(e.ShroudofPurgatory) then
        if s.Cast(h.HealPot, nil) then
            o = 41
            return "HealPot HP"
        end

    end

    if e.AntiMagicShell:IsReady() and (n.Commons.UseDefensives) and B > 0 and t:HealthPercentage() <= n.Commons.AntiMagicShellHP then
        if i(e.AntiMagicShell, nil, nil) then
            o = 48707
            return "AntiMagic Shell defensives 18"
        end

    end

    if e.RuneTap:IsReady() and (n.Commons.UseDefensives) and x and t:HealthPercentage() <= n.Blood.RuneTapThreshold and t:Rune() >= 3 and e.RuneTap:Charges() >= 1 and t:BuffDown(e.RuneTapBuff) then
        if i(e.RuneTap, nil) then
            o = 194679
            return "rune_tap defensives 2"
        end

    end

    if b.ActiveMitigationNeeded() and a:IsInMeleeRange(8) and e.Marrowrend:TimeSinceLastCast() > .5 and e.DeathStrike:TimeSinceLastCast() > .5 then
        if e.DeathStrike:IsReady() and (n.Commons.UseDefensives) and not c and t:BuffStack(e.BoneShieldBuff) > 7 then
            if i(e.DeathStrike, nil, nil, not a:IsSpellInRange(e.DeathStrike)) then
                o = 49998
                return "death_strike defensives 4"
            end

        end

        if e.Marrowrend:IsReady() and a:IsInMeleeRange(8) and t:BuffStack(e.BoneShieldBuff) >= 8 then
            if i(e.Marrowrend, nil, nil, not a:IsSpellInRange(e.Marrowrend)) then
                o = 195182
                return "marrowrend defensives 6"
            end

        end

        if e.DeathStrike:IsReady() and (n.Commons.UseDefensives) and a:IsInMeleeRange(8) and not c then
            if i(e.DeathStrike, nil, nil, not a:IsSpellInRange(e.DeathStrike)) then
                o = 49998
                return "death_strike defensives 10"
            end

        end

    end

    if e.Marrowrend:IsReady() and a:IsInMeleeRange(8) and (t:BuffRemains(e.BoneShieldBuff) <= 6 or (a:TimeToDie() < 5 and t:BuffRemains(e.BoneShieldBuff) < 10 and m == 1)) then
        if i(e.Marrowrend, nil, nil, not a:IsSpellInRange(e.Marrowrend)) then
            o = 195182
            return "marrowrend defensives 12"
        end

    end

    if e.VampiricBlood:IsCastable() and (n.Commons.UseDefensives) and x and t:HealthPercentage() <= n.Blood.VampiricBloodThreshold and t:BuffDown(e.IceboundFortitudeBuff) then
        if i(e.VampiricBlood, nil) then
            o = 55233
            return "vampiric_blood defensives 14"
        end

    end

    if e.Lichborne:IsReady() and (n.Commons.UseDefensives) and t:HealthPercentage() <= n.Commons.LichborneHP then
        if i(e.Lichborne, nil, nil) then
            o = 49039
            return "Lichborne defensives 18"
        end

    end

    if e.DeathPact:IsAvailable() and (n.Commons.UseDefensives) and e.DeathPact:IsReady() and t:HealthPercentage() <= n.Commons.DeathPactHP then
        if i(e.DeathPact, nil, nil) then
            o = 48743
            return "DeathPact defensives 18"
        end

    end

    if e.IceboundFortitude:IsCastable() and (n.Commons.UseDefensives) and x and t:HealthPercentage() <= n.Blood.IceboundFortitudeThreshold and t:BuffDown(e.VampiricBloodBuff) then
        if i(e.IceboundFortitude, nil) then
            o = 48792
            return "icebound_fortitude defensives 16"
        end

    end

    if e.DeathStrike:IsReady() and (n.Commons.UseDefensives) and a:IsInMeleeRange(8) and not c and t:HealthPercentage() <= 50 + (t:RunicPower() > 90 and 20 or 0) and not t:HealingAbsorbed() then
        if i(e.DeathStrike, nil, nil, not a:IsSpellInRange(e.DeathStrike)) then
            o = 49998
            return "death_strike defensives 18"
        end

    end

end

local function G()
    if e.BloodFury:IsCastable() and a:IsInMeleeRange(8) and n.Commons.Enabled.Racials and r() and ((e.DancingRuneWeapon:CooldownUp() or N) and (not e.Blooddrinker:IsReady() or not e.Blooddrinker:IsAvailable())) then
        if i(e.BloodFury, nil) then
            o = 20572
            return "blood_fury main 2"
        end

    end

    if e.Berserking:IsCastable() and a:IsInMeleeRange(8) and n.Commons.Enabled.Racials and r() then
        if i(e.Berserking, nil) then
            o = 26297
            return "berserking main 4"
        end

    end

    if e.ArcanePulse:IsCastable() and a:IsInMeleeRange(8) and n.Commons.Enabled.Racials and r() and (m >= 2 or t:Rune() < 1 and t:RunicPowerDeficit() > 60) then
        if i(e.ArcanePulse, nil, nil, not a:IsInRange(8)) then
            o = 260364
            return "arcane_pulse main 6"
        end

    end

    if e.LightsJudgment:IsCastable() and a:IsInMeleeRange(8) and n.Commons.Enabled.Racials and r() and (t:BuffUp(e.UnholyStrengthBuff)) then
        if i(e.LightsJudgment, nil, nil, not a:IsSpellInRange(e.LightsJudgment)) then
            o = 255647
            return "lights_judgment main 8"
        end

    end

    if e.AncestralCall:IsCastable() and a:IsInMeleeRange(8) and n.Commons.Enabled.Racials and r() then
        if i(e.AncestralCall, nil) then
            o = 274738
            return "ancestral_call main 10"
        end

    end

    if e.Fireblood:IsCastable() and a:IsInMeleeRange(8) and n.Commons.Enabled.Racials and r() then
        if i(e.Fireblood, nil) then
            o = 265221
            return "fireblood main 12"
        end

    end

    if e.BagofTricks:IsCastable() and a:IsInMeleeRange(8) and n.Commons.Enabled.Racials and r() then
        if i(e.BagofTricks, nil, nil, not a:IsSpellInRange(e.BagofTricks)) then
            o = 312411
            return "bag_of_tricks main 14"
        end

    end

    if e.ArcaneTorrent:IsCastable() and a:IsInMeleeRange(8) and n.Commons.Enabled.Racials and r() and t:RunicPowerDeficit() > 20 then
        if i(e.ArcaneTorrent, nil, nil, nil) then
            o = 155145
            return "ArcaneTorrent main 14"
        end

    end

end

local function K()
    if e.DeathsDue:IsReady() and a:IsInMeleeRange(8) and w and not t:IsMoving() and (t:BuffDown(e.DeathAndDecayBuff) or t:BuffRemains(e.DeathAndDecayBuff) < 4 or t:BuffUp(e.CrimsonScourgeBuff)) then
        if i(e.DeathsDue, nil, nil, not a:IsSpellInRange(e.DeathsDue)) then
            o = 324128
            return "deaths_due covenants 6"
        end

    end

    if e.SwarmingMist:IsCastable() and a:IsInMeleeRange(8) and w and (e.DancingRuneWeapon:CooldownRemains() > 3 and t:RunicPower() >= (90 - (m * 3))) then
        if i(e.SwarmingMist, nil, nil) then
            o = 311648
            return "swarming_mist covenants 7"
        end

    end

    if e.AbominationLimb:IsCastable() and a:IsInMeleeRange(8) and (w) and (t:BuffDown(e.DancingRuneWeaponBuff)) then
        if i(e.AbominationLimb, nil, nil, not a:IsInRange(8)) then
            o = 315443
            return "abomination_limb covenants 16"
        end

    end

    if e.AbominationLimbTalent:IsCastable() and e.AbominationLimbTalent:IsAvailable() and a:IsInMeleeRange(8) and (w) and (t:BuffDown(e.DancingRuneWeaponBuff)) then
        if i(e.AbominationLimb, nil, nil, not a:IsInRange(8)) then
            o = 315443
            return "abomination_limb covenants 16"
        end

    end

    if e.Fleshcraft:IsCastable() and a:IsInMeleeRange(8) and (f == 0 or f > e.Fleshcraft:ExecuteTime()) and not t:IsMoving() and w and (t:BuffDown(e.DancingRuneWeaponBuff)) and (e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled() and t:BuffDown(e.VolatileSolventHumanBuff)) then
        if i(e.Fleshcraft, nil, nil) then
            o = 324631
            return "fleshcraft covenants 20"
        end

    end

    if e.ShackleTheUnworthy:IsCastable() and a:IsInMeleeRange(30) and w and (t:Rune() < 3 and t:RunicPower() < 100) then
        if i(e.ShackleTheUnworthy, nil, nil, not a:IsSpellInRange(e.ShackleTheUnworthy)) then
            o = 312202
            return "shackle_the_unworthy covenants 18"
        end

    end

end

local function B()
    if e.DeathAndDecay:IsCastable() and a:IsInMeleeRange(8) and not p and not t:IsMoving() and (EnemiesCount10y >= 3) and t:BuffDown(e.DeathAndDecayBuff) and not e.DeathsDue:IsAvailable() then
        if i(e.DeathAndDecay, nil, nil, not a:IsInRange(30)) then
            o = 43265
            return "death_and_decay drw_up 14"
        end

    end

    if e.EmpowerRuneWeapon:IsReady() and e.EmpowerRuneWeapon:IsAvailable() and r() then
        if i(e.EmpowerRuneWeapon, nil, nil, not a:IsInRange(8)) then
            o = 47568
            return "EmpowerRuneWeapon drw_up 11"
        end

    end

    if e.Tombstone:IsReady() and v and a:IsInMeleeRange(8) and (t:BuffStack(e.BoneShieldBuff) >= 5 and t:Rune() >= 2 and z) then
        if i(e.Tombstone, nil) then
            o = 219808
            return "tombstone drw_up 2"
        end

    end

    if e.Bonestorm:IsReady() and not c and (t:RunicPower() >= n.Blood.BonestormPower) and v then
        if i(e.Bonestorm, nil, nil, not a:IsInRange(8)) then
            o = 194844
            return "bonestorm drw_up 10"
        end

    end

    if e.HeartStrike:IsReady() and a:IsInMeleeRange(8) and t:HasTier(28, 2) then
        if i(e.HeartStrike, nil, nil, not a:IsSpellInRange(e.HeartStrike)) then
            o = 206930
            return "heart_strike drw_up 18"
        end

    end

    if e.Marrowrend:IsReady() and a:IsInMeleeRange(8) and ((t:BuffRemains(e.BoneShieldBuff) <= t:RuneTimeToX(3) or t:BuffRemains(e.BoneShieldBuff) <= (t:GCD() + y(e.Blooddrinker:CooldownUp()) * y(e.Blooddrinker:IsAvailable()) * 4) or (t:BuffStack(e.BoneShieldBuff) < 2 and (l ~= 4 or t:BuffUp(e.AbominationLimb)))) and t:RunicPowerDeficit() > 20) then
        if i(e.Marrowrend, nil, nil, not a:IsSpellInRange(e.Marrowrend)) then
            o = 195182
            return "marrowrend drw_up 2"
        end

    end

    if e.BloodBoil:IsCastable() and a:IsInRange(10) and (e.BloodBoil:Charges() >= 2 and t:Rune() <= 1) then
        if i(e.BloodBoil, nil, nil, not a:IsInMeleeRange(10)) then
            o = 50842
            return "blood_boil drw_up 4"
        end

    end

    T = (15 + y(t:BuffUp(e.DancingRuneWeaponBuff)) * 10 + F * y(e.Heartbreaker:IsAvailable()) * 2)
    if e.DeathStrike:IsReady() and a:IsInMeleeRange(8) and (t:RunicPower() >= n.Blood.MinimumRP + 45) and not c and not g and (t:RunicPowerDeficit() <= T and (not (e.Bonestorm:IsAvailable() and e.Bonestorm:CooldownRemains() < 2))) then
        if i(e.DeathStrike, nil, nil, not a:IsSpellInRange(e.DeathStrike)) then
            o = 49998
            return "death_strike drw_up 6"
        end

    end

    if e.HeartStrike:IsReady() and a:IsInMeleeRange(8) and (t:RuneTimeToX(2) < t:GCD() or t:RunicPowerDeficit() >= T) then
        if i(e.HeartStrike, nil, nil, not a:IsSpellInRange(e.HeartStrike)) then
            o = 206930
            return "heart_strike drw_up 8"
        end

    end

    if e.DeathAndDecay:IsCastable() and a:IsInMeleeRange(10) and not p and not t:IsMoving() and t:BuffDown(e.DeathAndDecayBuff) and (EnemiesCount10y >= 3) then
        if i(e.DeathAndDecay, nil, nil, not a:IsInRange(30)) then
            o = 43265
            return "death_and_decay drw_up 14"
        end

    end

end

local function T()
    if e.Tombstone:IsCastable() and v and (t:BuffStack(e.BoneShieldBuff) >= 5 and z and e.DancingRuneWeapon:CooldownRemains() > 20) then
        if i(e.Tombstone, nil) then
            o = 219808
            return "tombstone standard 1"
        end

    end

    if e.Bonestorm:IsReady() and a:IsInMeleeRange(10) and not c and (t:RunicPower() >= n.Blood.BonestormPower) and v then
        if i(e.Bonestorm, nil, nil, not a:IsInRange(10)) then
            o = 194844
            return "bonestorm standard 14"
        end

    end

    if e.HeartStrike:IsReady() and a:IsInMeleeRange(8) and (l == 3 and t:BuffUp(e.DeathAndDecayBuff) and (t:BuffUp(e.DeathAndDecayBuff) and t:BuffRemains(e.DeathAndDecayBuff) < 6)) then
        if i(e.HeartStrike, nil, nil, not a:IsSpellInRange(e.HeartStrike)) then
            o = 206930
            return "heart_strike standard 2"
        end

    end

    if e.DeathAndDecay:IsCastable() and a:IsInMeleeRange(10) and not p and not t:IsMoving() and t:BuffDown(e.DeathAndDecayBuff) and (EnemiesCount10y >= 3) and not e.DeathsDue:IsAvailable() then
        if i(e.DeathAndDecay, nil, nil, not a:IsInRange(30)) then
            o = 43265
            return "death_and_decay drw_up 14"
        end

    end

    if e.Tombstone:IsCastable() and v and (t:BuffStack(e.BoneShieldBuff) >= 5 and t:Rune() >= 2 and t:RunicPowerDeficit() >= 30) then
        if i(e.Tombstone, nil) then
            o = 219808
            return "tombstone standard 4"
        end

    end

    if e.Marrowrend:IsReady() and a:IsInMeleeRange(8) and ((t:BuffRemains(e.BoneShieldBuff) <= t:RuneTimeToX(3) or t:BuffRemains(e.BoneShieldBuff) <= (t:GCD() + y(e.Blooddrinker:CooldownUp()) * y(e.Blooddrinker:IsAvailable()) * 4) or t:BuffStack(e.BoneShieldBuff) < 6 or ((l ~= 3 or (t:BuffRemains(e.DeathAndDecayBuff) > 5 and l == 3)) and t:BuffRemains(e.BoneShieldBuff) < 7)) and t:RunicPowerDeficit() > 20) then
        if i(e.Marrowrend, nil, nil, not a:IsSpellInRange(e.Marrowrend)) then
            o = 195182
            return "marrowrend standard 6"
        end

    end

    if e.DeathStrike:IsReady() and a:IsInMeleeRange(8) and (t:RunicPower() >= n.Blood.MinimumRP + 45) and not c and not g and (t:RunicPowerDeficit() <= M and (not (e.Bonestorm:IsAvailable() and e.Bonestorm:CooldownRemains() < 2)) and not (l == 2 and e.SwarmingMist:CooldownRemains() < 3)) then
        if i(e.DeathStrike, nil, nil, not a:IsSpellInRange(e.DeathStrike)) then
            o = 49998
            return "death_strike standard 8"
        end

    end

    if e.BloodBoil:IsCastable() and a:IsInRange(10) and (e.BloodBoil:ChargesFractional() >= 1.8 and (t:BuffStack(e.HemostasisBuff) <= (5 - EnemiesCount10y) or EnemiesCount10y > 2)) then
        if i(e.BloodBoil, nil, nil, not a:IsInMeleeRange(10)) then
            o = 50842
            return "blood_boil standard 10"
        end

    end

    if e.DeathAndDecay:IsReady() and a:IsInMeleeRange(10) and not p and not t:IsMoving() and t:BuffDown(e.DeathAndDecayBuff) and ((t:BuffUp(e.CrimsonScourgeBuff)) and t:RunicPowerDeficit() > 10) then
        if i(e.DeathAndDecay, nil, nil, not a:IsInRange(30)) then
            o = 43265
            return "death_and_decay standard 12"
        end

    end

    if (l == 3 and t:BuffUp(e.DeathAndDecayBuff)) then
        E = (15 + m * y(e.Heartbreaker:IsAvailable()) * 2)
    else
        E = (15 + m * y(e.Heartbreaker:IsAvailable()) * 2) * 1.2
    end

    if e.DeathStrike:IsReady() and a:IsInMeleeRange(8) and (t:RunicPower() >= n.Blood.MinimumRP + 45) and not c and not g and ((t:RunicPowerDeficit() <= E) or a:TimeToDie() < 10) then
        if i(e.DeathStrike, nil, nil, not a:IsSpellInRange(e.DeathStrike)) then
            o = 49998
            return "death_strike standard 16"
        end

    end

    if e.DeathAndDecay:IsReady() and a:IsInMeleeRange(10) and not p and not t:IsMoving() and t:BuffDown(e.DeathAndDecayBuff) and (m >= 3) then
        if i(e.DeathAndDecay, nil, nil, not a:IsInRange(30)) then
            o = 43265
            return "death_and_decay standard 18"
        end

    end

    if e.DeathAndDecay:IsReady() and a:IsInMeleeRange(10) and not p and not t:IsMoving() and t:BuffDown(e.DeathAndDecayBuff) and (t:BuffUp(e.CrimsonScourgeBuff) or e.RapidDecomposition:IsAvailable()) then
        if i(e.DeathAndDecay, nil, nil, not a:IsInRange(30)) then
            o = 43265
            return "death_and_decay standard 22"
        end

    end

    if e.HeartStrike:IsReady() and a:IsInMeleeRange(8) and (t:RuneTimeToX(4) < t:GCD()) then
        if i(e.HeartStrike, nil, nil, not a:IsSpellInRange(e.HeartStrike)) then
            o = 206930
            return "heart_strike standard 20"
        end

    end

    if e.Consumption:IsCastable() and a:IsInMeleeRange(8) then
        if i(e.Consumption, nil, nil, not a:IsSpellInRange(e.Consumption)) then
            o = 274156
            return "consumption standard 24"
        end

    end

    if e.BloodBoil:IsCastable() and a:IsInRange(10) and (e.BloodBoil:ChargesFractional() >= 1.1) then
        if i(e.BloodBoil, nil, nil, not a:IsInMeleeRange(10)) then
            o = 50842
            return "blood_boil standard 26"
        end

    end

    if e.HeartStrike:IsReady() and a:IsInMeleeRange(8) and (t:Rune() > 1 and (t:RuneTimeToX(3) < t:GCD() or t:BuffStack(e.BoneShieldBuff) > 7)) then
        if i(e.HeartStrike, nil, nil, not a:IsSpellInRange(e.HeartStrike)) then
            o = 206930
            return "heart_strike standard 28"
        end

    end

end

local function y()
    C = HeroRotationCharDB.Toggles[6]
    w = HeroRotationCharDB.Toggles[4]
    v = HeroRotationCharDB.Toggles[5]
    Z = HeroRotationCharDB.Toggles[12]
    O = HeroRotationCharDB.Toggles[13]
    H = HeroRotationCharDB.Toggles[14]
    X = HeroRotationCharDB.Toggles[15]
    R = HeroRotationCharDB.Toggles[16]
    S = HeroRotationCharDB.Toggles[80]
    I = HeroRotationCharDB.Toggles[81]
    N = HeroRotationCharDB.Toggles[82]
    q = HeroRotationCharDB.Toggles[72]
    p = HeroRotationCharDB.Toggles[83]
    D = HeroRotationCharDB.Toggles[84]
    L = HeroRotationCharDB.Toggles[17]
    W = HeroRotationCharDB.Toggles[85]
    g = false
    c = false
    if e.Bonestorm:IsAvailable() and r() and e.Bonestorm:CooldownRemains() <= 0 and e.Bonestorm:IsCastable() then
        g = true
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

local function w()
    Enemies10y = t:GetEnemiesInRange(10)
    if ee() then
        U = t:GetEnemiesInMeleeRange(8)
        m = #U
        EnemiesCount10y = #Enemies10y
        Enemies40y = t:GetEnemiesInRange(40)
    else
        m = 1
        EnemiesCount10y = 1
    end

    A = k(Enemies10y)
    F = te(m, t:BuffUp(e.DeathAndDecayBuff) and 5 or 2)
    A = k(Enemies10y)
    x = t:IsTankingAoE(8) or t:IsTanking(a)
    TopTrinketID, _ = GetInventoryItemID("player", 13)
    BotTrinketID, _ = GetInventoryItemID("player", 14)
    ActiveMitigationNeeded = t:ActiveMitigationNeeded()
    MissingAggro = V(Enemies10y)
    if not BotOn then
        u = 0
        o = 0
    end

    if u > 0 then
        u = 0
    end

    if o > 0 then
        o = 0
    end

    oe = y()
    if s.QueuedCast() then
        o = s.QueuedCast()
        return "Custom Queue " .. j(o):ID()
    end

        if s.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (s.GUISettings.General.OpenerReset)
    elseif s.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        s.ToggleIconFrame:UpdateButtonText(6)
        s.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

    if t:IsChanneling(j(324631)) then
        if s.CastAnnotated(e.Pool, false, "WAIT") then
            o = 99999
            return "Pool During Blooddrinker"
        end

    end

    if not t:AffectingCombat() then
        ae = false
    end

    if not t:AffectingCombat() and b.TargetIsValid() and C then
        local e = Q()
        if e then
            return e
        end

    end

    if (not UnitIsEnemy("player", "mouseover") and UnitIsPlayer("mouseover") and UnitIsDead("mouseover")) and not W then
                if e.RaiseAlly:IsCastable() and t:RunicPower() >= 30 then
            if i(e.RaiseAlly, nil) then
                u = 161999
                return "RaiseAlly MO"
            end

        elseif e.RaiseAlly:CooldownRemains(BypassRecovery) <= 0 and (t:RunicPower() < 30) then
            c = true
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) and d("mouseover"):IsInMeleeRange(8) then
        if e.HeartStrike:IsCastable() then
            if i(e.HeartStrike, nil) then
                u = 1206930
                return "explosive MO HeartStrike"
            end

        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) and d("mouseover"):IsInMeleeRange(8) then
        if e.DeathStrike:IsCastable() then
            if i(e.DeathStrike, nil) then
                u = 149998
                return "explosive MO DeathStrike"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) and a:IsInMeleeRange(8) then
        if e.HeartStrike:IsCastable() then
            if i(e.HeartStrike, nil) then
                o = 206930
                return "explosive  HeartStrike"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) and a:IsInMeleeRange(8) then
        if e.DeathStrike:IsCastable() then
            if i(e.DeathStrike, nil) then
                o = 49998
                return "explosive  DeathStrike"
            end

        end

    end

    if b.TargetIsValid() then
        if e.DarkCommand:IsReady() and t:AffectingCombat() and (not t:IsTanking(a) and q) then
            if i(e.DarkCommand, nil) then
                o = 56222
                return "DarkCommand bear 3"
            end

        end

        if e.DarkCommand:IsReady() then
            if b.CastCycle(e.DarkCommand, Enemies40y, P, not a:IsSpellInRange(e.DarkCommand)) then
                return "DarkCommand 4"
            end

        end

    end

        if (R and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0) then
        if s.Cast(e.Asphyxiate, nil, nil, nil) then
            if d("mouseover"):GUID() ~= nil and d("mouseover"):IsSpellInRange(e.Asphyxiate) then
                u = 1221562
                return "queue Asphyxiate MO"
            else
                o = 221562
                return "queue Asphyxiate"
            end

        end

    elseif ((not e.Asphyxiate:IsUsableP() or e.Asphyxiate:CooldownRemains() > 0) and R) then
        HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16]
        s.Print("Asphyxiate Queue is now " .. (HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (D and e.BloodBoil:IsUsableP() and e.BloodBoil:CooldownRemains(BypassRecovery) <= 0 and not t:PrevGCD(1, e.BloodBoil)) then
        if s.Cast(e.BloodBoil, nil, nil, nil) then
            o = 50842
            return "queue BloodBoil"
        end

    elseif ((not e.BloodBoil:IsUsableP() or e.BloodBoil:CooldownRemains() > 0 or t:PrevGCD(1, e.BloodBoil)) and D) then
        HeroRotationCharDB.Toggles[84] = not HeroRotationCharDB.Toggles[84]
        s.Print("Blood Boil Queue is now " .. (HeroRotationCharDB.Toggles[84] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (H and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0) then
        if s.Cast(e.DeathGrip, nil, nil, nil) then
            if d("mouseover"):GUID() ~= nil and d("mouseover"):IsSpellInRange(e.DeathGrip) then
                u = 149576
                return "queue DeathGrip MO"
            else
                o = 49576
                return "queue DeathGrip"
            end

        end

    elseif ((not e.DeathGrip:IsUsableP() or e.DeathGrip:CooldownRemains() > 0) and H) then
        HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14]
        s.Print("DeathGrip Queue is now " .. (HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (S and e.GorefiendsGrasp:IsUsableP() and e.GorefiendsGrasp:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.GorefiendsGrasp, nil, nil, nil) then
            o = 108199
            return "queue Gorefiends Grasp"
        end

    elseif ((not e.GorefiendsGrasp:IsUsableP() or e.GorefiendsGrasp:CooldownRemains() > 0 or not t:AffectingCombat()) and S) then
        HeroRotationCharDB.Toggles[80] = not HeroRotationCharDB.Toggles[80]
        s.Print("Gorefiend's Grasp Queue is now " .. (HeroRotationCharDB.Toggles[80] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (O and e.AntiMagicZone:IsUsableP() and e.AntiMagicZone:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.AntiMagicZone, nil, nil, nil) then
            o = 51052
            return "queue Anti Magic Zone"
        end

    elseif ((not e.AntiMagicZone:IsUsableP() or e.AntiMagicZone:CooldownRemains() > 0 or not t:AffectingCombat()) and O) then
        HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13]
        s.Print("Anti-Magic Zone Queue is now " .. (HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (I and e.ControlUndead:IsUsableP() and e.ControlUndead:CooldownRemains(BypassRecovery) <= 0 and not t:PrevGCD(1, e.ControlUndead)) then
        if s.Cast(e.ControlUndead, nil, nil, nil) then
            if d("mouseover"):GUID() ~= nil and d("mouseover"):IsInRange(30) then
                u = 1111673
                return "queue ControlUndead MO"
            else
                o = 111673
                return "queue ControlUndead"
            end

        end

    elseif ((not e.ControlUndead:IsUsableP() or e.ControlUndead:CooldownRemains() > 0 or t:PrevGCD(1, e.ControlUndead)) and I) then
        HeroRotationCharDB.Toggles[81] = not HeroRotationCharDB.Toggles[81]
        s.Print("Control Undead Queue is now " .. (HeroRotationCharDB.Toggles[81] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if b.TargetIsValid() and t:AffectingCombat() then
        if true then
            local e = J()
            if e then
                return e
            end

        end

        if t:IsChanneling(e.Blooddrinker) and t:BuffUp(e.BoneShieldBuff) and A == 0 and not t:ShouldStopCasting() and t:CastRemains() > .2 then
            if s.CastAnnotated(e.Pool, false, "WAIT") then
                o = 99999
                return "Pool During Blooddrinker"
            end

        end

        M = (l == 3 and t:BuffRemains(e.DeathAndDecayBuff) > 6) and 70 or 55
        if h.PotionofPhantomFire:IsReady() and n.Commons.Enabled.Potions and ((t:BuffUp(e.DancingRuneWeaponBuff) and not s.GUISettings.General.HoldPotforBL) or (s.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if i(h.PotionofPhantomFire, nil, nil) then
                o = 37
                return "potion main 16"
            end

        end

        if ((n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket)) then
            local e = t:GetUseableTrinkets(ne)
            if e then
                if i(e, nil, nil) then
                                        if e:ID() == TopTrinketID and n.Commons.Enabled.TopTrinket and ((n.Blood.TopTrinketHP <= 0 and r()) or n.Blood.TopTrinketHP > t:HealthPercentage()) then
                        o = 24
                        return "top trinket 1"
                    elseif e:ID() == BotTrinketID and n.Commons.Enabled.BottomTrinket and ((n.Blood.BotTrinketHP <= 0 and r()) or n.Blood.BotTrinketHP > t:HealthPercentage()) then
                        o = 30
                        return "top trinket 2"
                    end

                end

            end

        end

        if h.GaveloftheFirstArbiter:IsEquippedAndReady() and a:IsInRange(30) and r() and not L then
            if i(h.GaveloftheFirstArbiter, nil, nil, not a:IsInRange(30)) then
                o = 16
                return "gavel_of_the_first_arbiter trinkets 4"
            end

        end

        if h.JotungeirrDestinysCall:IsEquippedAndReady() and a:IsInMeleeRange(30) and r() and not L then
            if i(h.JotungeirrDestinysCall, nil, nil, not a:IsInRange(30)) then
                o = 16
                return "JotungeirrDestinysCall trinkets 4"
            end

        end

        if e.BloodBoil:IsCastable() and a:IsInMeleeRange(10) and not UnitExists("boss1") and MissingAggro > 0 then
            if i(e.BloodBoil) then
                o = 50842
                return "blood_boil for aggro 6"
            end

        end

        if r() and not ie:DebuffUp(j(111673)) and e.RaiseDead:IsCastable() then
            if i(e.RaiseDead, nil, nil) then
                o = 46585
                return "raise_dead main 24"
            end

        end

        if e.Blooddrinker:IsReady() and a:IsInMeleeRange(30) and (f == 0 or f > 3) and (t:BuffDown(e.DancingRuneWeaponBuff) and (l ~= 3 or (l == 3 and t:BuffRemains(e.DeathAndDecayBuff) > 7))) then
            if i(e.Blooddrinker, nil, nil, not a:IsSpellInRange(e.Blooddrinker)) then
                o = 206931
                return "blooddrinker main 20"
            end

        end

        if (true) then
            local e = G()
            if e then
                return e
            end

        end

        if e.RaiseDead:TimeSinceLastCast() <= 60 and Y.active() and ((l ~= 3 or (l == 3 and t:BuffRemains(e.DeathAndDecayBuff) > 6)) and t:BuffRemains(e.DancingRuneWeaponBuff) > 4 and (Y.remains() < 2 or a:TimeToDie() < t:GCD())) then
            if i(e.SacrificialPact, nil) then
                o = 237574
                return "sacrificial_pact covenants 8"
            end

        end

        if (true) then
            local e = K()
            if e then
                return e
            end

        end

        if e.BloodTap:IsCastable() and ((t:Rune() <= 2 and t:RuneTimeToX(4) > t:GCD() and e.BloodTap:ChargesFractional() >= 1.8) or t:RuneTimeToX(3) > t:GCD()) then
            if i(e.BloodTap) then
                o = 221699
                return "blood_tap main 12"
            end

        end

        if e.DancingRuneWeapon:IsCastable() and a:IsInMeleeRange(10) and not N and r() and (t:BuffDown(e.DancingRuneWeaponBuff)) then
            if i(e.DancingRuneWeapon, nil) then
                o = 49028
                return "dancing_rune_weapon main 14"
            end

        end

        if (t:BuffUp(e.DancingRuneWeaponBuff)) then
            local e = B()
            if e then
                return e
            end

        end

        if (true) then
            local e = T()
            if e then
                return e
            end

        end

        if s.CastAnnotated(e.Pool, false, "WAIT") then
            return "Wait/Pool Resources"
        end

    end

end

local function e()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        s.ToggleIconFrame:UpdateButtonText(6)
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
    if u == 0 then
        return 0
    else
        return u
    end

end

s.SetAPL(250, w, e)

