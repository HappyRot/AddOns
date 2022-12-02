local e, e = ...
local e = HeroDBC.DBC
local b = HeroLib
local e = HeroCache
local v = b.Unit
local t = v.Player
local i = v.Target
local e = v.Pet
local Z = b.Spell
local g = b.Item
local h = HeroRotation
local o = h.Cast
local s = h.CDsON
local _ = h.AoEON
local se = HeroRotationCharDB.Toggles[4]
local H = HeroRotationCharDB.Toggles[5]
local te = HeroRotationCharDB.Toggles[6]
local ee = HeroRotationCharDB.Toggles[15]
local O = HeroRotationCharDB.Toggles[12]
local J = HeroRotationCharDB.Toggles[13]
local N = HeroRotationCharDB.Toggles[14]
local C = HeroRotationCharDB.Toggles[16]
local K = HeroRotationCharDB.Toggles[81]
local M = HeroRotationCharDB.Toggles[110]
local ie = HeroRotationCharDB.Toggles[17]
local oe = HeroRotationCharDB.Toggles[111]
local T = HeroRotationCharDB.Toggles[18]
local p = false
local ae = 0
local L = strsplit
local U = GetInventoryItemLink
local e = Z.DeathKnight.Frost
local y = g.DeathKnight.Frost
local W = {  }
local m = t:GetEquipment()
local he = m[13] and g(m[13]) or g(0)
local ne = m[14] and g(m[14]) or g(0)
local F, a = GetInventoryItemID("player", 13)
local D, a = GetInventoryItemID("player", 14)
local a
local a
local a
local A
local a, a
local a
local q
local l
local X
local f
local Q
local w
local I
local j
local R
local c
local P = 11111
local u = 11111
local re = b.GhoulTable
local d = 0
local a = 0
local G = 0
b:RegisterForEvent(function()
    P = 11111
    u = 11111
end, "PLAYER_REGEN_ENABLED")
local r = h.Commons.Everyone
local n = { General = h.GUISettings.General, Commons = h.GUISettings.APL.DeathKnight.Commons, Frost = h.GUISettings.APL.DeathKnight.Frost }
local V = U("player", 16) or ""
local B = U("player", 17) or ""
local k, k, z = L(":", V)
local k, S, x = L(":", B)
local E = (z == "3370" or x == "3370")
local Y = (z == "3368" or x == "3368")
local k = (z == "6243" or x == "6243")
local k = IsEquippedItemType("Two-Hand")
b:RegisterForEvent(function()
    m = t:GetEquipment()
    he = m[13] and g(m[13]) or g(0)
    ne = m[14] and g(m[14]) or g(0)
    V = U("player", 16) or ""
    B = U("player", 17) or ""
    S, S, z = L(":", V)
    S, S, x = L(":", B)
    E = (z == "3370" or x == "3370")
    Y = (z == "3368" or x == "3368")
    k = IsEquippedItemType("Two-Hand")
end, "PLAYER_EQUIPMENT_CHANGED")
local function z(e)
    if e then
        return 1
    else
        return 0
    end

end

local function m(e)
    return e ~= 0
end

local function m(t)
    return ((t:DebuffStack(e.RazoriceDebuff) + 1) / ((t:DebuffRemains(e.RazoriceDebuff) + 1) * z(E)))
end

local function g(t)
    return (t:DebuffDown(e.FrostFeverDebuff))
end

local function x(e)
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and e:GUID() == v("mouseover"):GUID()) then
        d = 149143
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and n.Frost.TargetSwap == "AutoSwap" and e:GUID() ~= i:GUID() and not O) then
        d = 9999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and e:GUID() == i:GUID()) then
        a = 49143
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) then
        return true
    end

end

local function g(e)
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and e:GUID() == v("mouseover"):GUID()) then
        d = 149020
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and n.Frost.TargetSwap == "AutoSwap" and e:GUID() ~= i:GUID() and not O) then
        d = 9999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and e:GUID() == i:GUID()) then
        a = 49020
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) then
        return true
    end

end

local function S()
    if r.TargetIsValid() then
        A = (e.GatheringStorm:IsAvailable() or e.Everfrost:IsAvailable())
        Var2HCheck = (k and e.MightoftheFrozenWastes:IsAvailable())
        if e.HowlingBlast:IsReady() and (not i:IsInRange(8)) then
            if o(e.HowlingBlast, nil, nil, not i:IsInRange(30)) then
                a = 49184
                return "howling_blast precombat"
            end

        end

        if e.RemorselessWinter:IsReady() and (i:IsInRange(8)) then
            if o(e.RemorselessWinter, nil, nil, not i:IsInRange(8)) then
                a = 196770
                return "remorseless_winter precombat"
            end

        end

    end

end

local function L()
    if e.RemorselessWinter:IsReady() then
        if o(e.RemorselessWinter, nil, nil, not i:IsInRange(8)) then
            a = 196770
            return "remorseless_winter aoe 2"
        end

    end

    if e.HowlingBlast:IsReady() and (t:BuffUp(e.RimeBuff) or i:DebuffDown(e.FrostFeverDebuff)) then
        if o(e.HowlingBlast, nil, nil, not i:IsInRange(30)) then
            a = 49184
            return "howling_blast aoe 8"
        end

    end

    if e.GlacialAdvance:IsReady() and ((not c) and f) then
        if o(e.GlacialAdvance, nil, nil, not i:IsInRange(30)) then
            a = 194913
            return "glacial_advance aoe 4"
        end

    end

    if e.Obliterate:IsReady() and (t:BuffUp(e.KillingMachineBuff) and e.CleavingStrikes:IsAvailable() and t:BuffUp(e.DeathAndDecayBuff) and not w) then
        if r.CastTargetIf(e.Obliterate, Enemies10yd, "max", m, g, not i:IsInMeleeRange(8)) then
            return "obliterate aoe 8"
        end

    end

    if e.GlacialAdvance:IsReady() and (not c) then
        if o(e.GlacialAdvance, nil, nil, not i:IsInRange(30)) then
            a = 194913
            return "glacial_advance aoe 10"
        end

    end

    if e.Frostscythe:IsReady() and (w) then
        if o(e.Frostscythe, nil, nil, not i:IsInRange(8)) then
            a = 207230
            return "frostscythe aoe 6"
        end

    end

    if e.Obliterate:IsReady() and (not w) then
        if r.CastTargetIf(e.Obliterate, Enemies10yd, "max", m, g, not i:IsInMeleeRange(8)) then
            return "obliterate aoe 24"
        end

    end

    if e.FrostStrike:IsReady() and not p and ((not c) and not e.GlacialAdvance:IsAvailable()) then
        if r.CastTargetIf(e.FrostStrike, Enemies10yd, "max", m, x, not i:IsInMeleeRange(8)) then
            return "froststrike aoe 26"
        end

    end

    if e.HornofWinter:IsCastable() and (t:Rune() < 2 and t:RunicPowerDeficit() > 25) then
        if o(e.HornofWinter, nil) then
            a = 57330
            return "horn_of_winter aoe 32"
        end

    end

    if e.ArcaneTorrent:IsCastable() and s() and n.Commons.Enabled.Racials and (t:RunicPowerDeficit() > 25) then
        if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
            a = 155145
            return "arcane_torrent aoe 34"
        end

    end

end

local function U()
    if e.Frostscythe:IsReady() and (t:BuffUp(e.KillingMachineBuff) and w) then
        if o(e.Frostscythe, nil, nil, not i:IsInRange(8)) then
            a = 207230
            return "frostscythe breath_oblit 2"
        end

    end

    if e.Obliterate:IsReady() and (t:BuffUp(e.KillingMachineBuff)) then
        if r.CastTargetIf(e.Obliterate, Enemies10yd, "max", m, g, not i:IsInMeleeRange(8)) then
            return "obliterate breath_oblit 4"
        end

    end

    if e.HowlingBlast:IsReady() and (t:BuffUp(e.RimeBuff)) then
        if o(e.HowlingBlast) then
            a = 49184
            return "howling_blast breath_oblit 2"
        end

    end

    if e.HowlingBlast:IsReady() and (t:BuffDown(e.KillingMachineBuff)) then
        if o(e.HowlingBlast) then
            a = 49184
            return "howling_blast breath_oblit 2"
        end

    end

    if e.HornofWinter:IsReady() and (t:RunicPowerDeficit() > 25) then
        if o(e.HornofWinter, nil) then
            a = 57330
            return "horn_of_winter breath_oblit 32"
        end

    end

    if e.ArcaneTorrent:IsCastable() and s() and n.Commons.Enabled.Racials and (t:RunicPowerDeficit() > 25) then
        if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
            a = 155145
            return "arcane_torrent breath_oblit 34"
        end

    end

end

local function ne()
    if e.RemorselessWinter:IsReady() and (A and l) then
        if o(e.RemorselessWinter, nil, nil, not i:IsInRange(8)) then
            a = 196770
            return "remorseless_winter breath 2"
        end

    end

    if e.HowlingBlast:IsReady() and (X and t:RunicPower() > (45 - z(e.RageoftheFrozenChampion:IsAvailable()) * 8)) then
        if o(e.HowlingBlast, nil, nil, not i:IsInRange(30)) then
            a = 49184
            return "howling_blast breath 4"
        end

    end

    if e.HornofWinter:IsReady() and (t:Rune() < 2 and t:RunicPowerDeficit() > 25) then
        if o(e.HornofWinter, nil) then
            a = 57330
            return "horn_of_winter breath 6"
        end

    end

    if e.Obliterate:IsReady() and (t:BuffUp(e.KillingMachineBuff) and not w) then
        if r.CastTargetIf(e.Obliterate, Enemies10yd, "max", m, g, not i:IsInMeleeRange(8)) then
            return "obliterate breath 8"
        end

    end

    if e.Frostscythe:IsReady() and (t:BuffUp(e.KillingMachineBuff) and w) then
        if o(e.Frostscythe, nil, nil, not i:IsInRange(8)) then
            a = 207230
            return "frostscythe breath 10"
        end

    end

    if e.Frostscythe:IsReady() and (w and t:RunicPower() > 45) then
        if o(e.Frostscythe, nil, nil, not i:IsInRange(8)) then
            a = 207230
            return "frostscythe breath 12"
        end

    end

    if e.Obliterate:IsReady() and (t:RunicPowerDeficit() > 40 or (t:BuffUp(e.PillarofFrostBuff) and t:RunicPowerDeficit() > 15)) then
        if r.CastTargetIf(e.Obliterate, Enemies10yd, "max", m, g, not i:IsInMeleeRange(8)) then
            return "obliterate breath 14"
        end

    end

    if (e.DeathAndDecay:IsReady() or (CovenantID == 3 and e.DeathsDue:IsReady())) and (t:RunicPower() < 32 and t:RuneTimeToX(2) > t:RunicPower() / 16) then
        if o(e.DeathAndDecay) then
            a = 43265
            return "death_and_decay breath 16"
        end

    end

    if e.RemorselessWinter:IsReady() and (t:RunicPower() < 32 and t:RuneTimeToX(2) > t:RunicPower() / 16) then
        if o(e.RemorselessWinter, nil, nil, not i:IsInRange(8)) then
            a = 196770
            return "remorseless_winter breath 18"
        end

    end

    if e.HowlingBlast:IsReady() and (t:RunicPower() < 32 and t:RuneTimeToX(2) > t:RunicPower() / 16) then
        if o(e.HowlingBlast, nil, nil, not i:IsInRange(30)) then
            a = 49184
            return "howling_blast breath 20"
        end

    end

    if e.Obliterate:IsReady() and (t:RunicPowerDeficit() > 25) then
        if r.CastTargetIf(e.Obliterate, Enemies10yd, "max", m, g, not i:IsInMeleeRange(8)) then
            return "obliterate breath 22"
        end

    end

    if e.HowlingBlast:IsReady() and (t:BuffUp(e.RimeBuff)) then
        if o(e.HowlingBlast, nil, nil, not i:IsInRange(30)) then
            a = 49184
            return "howling_blast breath 24"
        end

    end

    if e.ArcaneTorrent:IsCastable() and s() and n.Commons.Enabled.Racials and (t:RunicPower() < 60) then
        if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
            a = 155145
            return "arcane_torrent bosticking 20"
        end

    end

end

local function V()
    if n.Commons.Enabled.Potions and s() and n.Commons.Enabled.Potions and ee and (((Q or u < 25) and not h.GUISettings.General.HoldPotforBL) or (h.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
        local e = r.PotionSelected()
        if e and e:IsReady() then
            if o(e, nil, nil) then
                a = 37
                return "potion cooldowns 2"
            end

        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and s() and (e.Obliteration:IsAvailable() and t:BuffDown(e.EmpowerRuneWeaponBuff) and t:Rune() < 6 and ((e.PillarofFrost:CooldownRemains() < 7 and (l or q)) or t:BuffUp(e.PillarofFrostBuff)) or u < 20) then
        if o(e.EmpowerRuneWeapon, nil) then
            a = 147568
            return "empower_rune_weapon cooldowns 4"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and s() and (t:BuffUp(e.BreathofSindragosa) and e.BreathofSindragosa:IsAvailable() and t:BuffDown(e.EmpowerRuneWeaponBuff) and ((t:RunicPower() < 70 and t:Rune() < 3) or b.CombatTime() < 10)) then
        if o(e.EmpowerRuneWeapon, nil) then
            a = 147568
            return "empower_rune_weapon cooldowns 6"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and s() and ((not e.BreathofSindragosa:IsAvailable()) and (not e.Obliteration:IsAvailable()) and t:BuffDown(e.EmpowerRuneWeaponBuff) and t:Rune() < 5 and (e.PillarofFrost:CooldownRemains() < 7 or t:BuffUp(e.PillarofFrostBuff) or not e.PillarofFrost:IsAvailable())) then
        if o(e.EmpowerRuneWeapon, nil) then
            a = 147568
            return "empower_rune_weapon cooldowns 8"
        end

    end

    if e.AbominationLimb:IsReady() and not T and ((e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff) and (l or q)) or (u < 12)) then
        if o(e.AbominationLimb, nil, nil, not i:IsInRange(10)) then
            a = 315443
            return "abomination_limb cooldowns 10"
        end

    end

    if e.AbominationLimb:IsReady() and not T and (e.BreathofSindragosa:IsAvailable() and (l or q)) then
        if o(e.AbominationLimb, nil, nil, not i:IsInRange(10)) then
            a = 315443
            return "abomination_limb cooldowns 10"
        end

    end

    if e.AbominationLimb:IsReady() and not T and ((not e.BreathofSindragosa:IsAvailable()) and (not e.Obliteration:IsAvailable()) and (l or q)) then
        if o(e.AbominationLimb, nil, nil, not i:IsInRange(20)) then
            a = 315443
            return "abomination_limb_talent cooldowns 12"
        end

    end

    if e.ChillStreak:IsReady() and H and (EnemiesCount10yd >= 2 and ((t:BuffDown(e.DeathAndDecayBuff) and e.CleavingStrikes:IsAvailable()) or (not e.CleavingStrikes:IsAvailable()) or EnemiesCount10yd <= 5)) then
        if o(e.ChillStreak, nil, nil, not i:IsSpellInRange(e.ChillStreak)) then
            a = 305392
            return "chill_streak cooldowns 14"
        end

    end

    if e.PillarofFrost:IsCastable() and H and (e.BreathofSindragosa:IsAvailable() and (l or q) and ((not e.Icecap:IsAvailable() and (t:RunicPower() > 70 or e.BreathofSindragosa:CooldownRemains() > 40)) or (e.Icecap:IsAvailable() and (e.BreathofSindragosa:CooldownRemains() > 10 or t:BuffUp(e.BreathofSindragosa))))) then
        if o(e.PillarofFrost, nil) then
            a = 51271
            return "pillar_of_frost cooldowns 10"
        end

    end

    if e.PillarofFrost:IsCastable() and H and (e.Icecap:IsAvailable() and (not e.Obliteration:IsAvailable()) and (not e.BreathofSindragosa:IsAvailable()) and (l or q)) then
        if o(e.PillarofFrost, nil) then
            a = 51271
            return "pillar_of_frost cooldowns 12"
        end

    end

    if e.BreathofSindragosa:IsCastable() and not p and s() and not oe and ((t:BuffDown(e.BreathofSindragosa) and t:RunicPower() >= n.Frost.MinimumBoS and (l or q)) or u < 30) then
        if o(e.BreathofSindragosa, nil, nil, not i:IsInRange(8)) then
            a = 152279
            return "breath_of_sindragosa cooldowns 16"
        end

    end

    if e.FrostwyrmsFury:IsCastable() and not M and s() and (((e.PillarofFrost:IsAvailable() and t:BuffRemains(e.PillarofFrostBuff) < t:GCD() * 2 and t:BuffUp(e.PillarofFrostBuff) and (not e.Obliteration:IsAvailable())) or not e.PillarofFrost:IsAvailable()) or u < 3) then
        if o(e.FrostwyrmsFury, nil, nil, not i:IsInRange(40)) then
            a = 279302
            return "frostwyrms_fury cooldowns 18"
        end

    end

    if e.FrostwyrmsFury:IsCastable() and not M and s() and (EnemiesCount10yd >= 2 and (e.PillarofFrost:IsAvailable() and t:BuffUp(e.PillarofFrostBuff)) and (t:BuffRemains(e.PillarofFrostBuff) < t:GCD() * 2)) then
        if o(e.FrostwyrmsFury, nil, nil, not i:IsInRange(40)) then
            a = 279302
            return "frostwyrms_fury cooldowns 20"
        end

    end

    if e.FrostwyrmsFury:IsCastable() and not M and s() and (e.Obliteration:IsAvailable() and ((e.PillarofFrost:IsAvailable() and t:BuffUp(e.PillarofFrostBuff) and (not k)) or (t:BuffDown(e.PillarofFrostBuff) and k and e.PillarofFrost:CooldownRemains() > 0) or (not e.PillarofFrost:IsAvailable())) and ((t:BuffRemains(e.PillarofFrostBuff) < t:GCD() or (t:BuffUp(e.UnholyStrengthBuff) and t:BuffRemains(e.UnholyStrengthBuff) < t:GCD())) and (i:DebuffStack(e.RazoriceDebuff) == 5 or ((not E) and not e.GlacialAdvance:IsAvailable())))) then
        if o(e.FrostwyrmsFury, nil, nil, not i:IsInRange(40)) then
            a = 279302
            return "frostwyrms_fury cooldowns 22"
        end

    end

    if e.RaiseDead:IsCastable() and s() then
        if o(e.RaiseDead, nil, nil) then
            a = 46585
            return "raise_dead cooldowns 26"
        end

    end

    if e.SoulReaper:IsReady() and (u > 5 and i:TimeToX(35) < 5 and EnemiesCount10yd <= 2 and ((t:BuffUp(e.BreathofSindragosa) and t:RunicPower() > 40) or (t:BuffDown(e.BreathofSindragosa) and (not e.Obliteration:IsAvailable())) or (e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff)))) then
        if o(e.SoulReaper, nil, nil, not i:IsSpellInRange(e.SoulReaper)) then
            a = 343294
            return "soul_reaper cooldowns 24"
        end

    end

    if e.SacrificialPact:IsReady() and ((not e.GlacialAdvance:IsAvailable()) and t:BuffDown(e.BreathofSindragosa) and re:remains() < t:GCD() * 2 and EnemiesCount10yd > 3) then
        if o(e.SacrificialPact, nil, nil, not i:IsInRange(8)) then
            a = 237574
            return "sacrificial_pact cooldowns 28"
        end

    end

    if e.DeathAndDecay:IsReady() and (t:BuffDown(e.DeathAndDecayBuff) and l and ((t:BuffUp(e.PillarofFrostBuff) and t:BuffRemains(e.PillarofFrostBuff) > 5) or (t:BuffDown(e.PillarofFrostBuff))) and (EnemiesCount10yd > 5 or (e.CleavingStrikes:IsAvailable() and EnemiesCount10yd >= 2))) then
        if o(e.DeathAndDecay, nil) then
            a = 43265
            return "death_and_decay cooldowns 30"
        end

    end

end

local function B()
    if e.ChainsofIce:IsReady() and (u < t:GCD() and (t:Rune() < 2 or ((t:BuffDown(e.KillingMachineBuff) and (((not k) and t:BuffStack(e.ColdHeartBuff) >= 4) or (k and t:BuffStack(e.ColdHeartBuff) > 8))) or (t:BuffUp(e.KillingMachineBuff) and (((not k) and t:BuffStack(e.ColdHeartBuff) > 8) or (k and t:BuffStack(e.ColdHeartBuff) > 10)))))) then
        if o(e.ChainsofIce, nil, nil, not i:IsInRange(30)) then
            a = 45524
            return "chains_of_ice coldheart 2"
        end

    end

    if e.ChainsofIce:IsReady() and (not e.Obliteration:IsAvailable() and t:BuffUp(e.PillarofFrostBuff) and t:BuffStack(e.ColdHeartBuff) >= 10 and ((t:BuffRemains(e.PillarofFrostBuff) < t:GCD() * (1 + z(e.FrostwyrmsFury:IsAvailable() and e.FrostwyrmsFury:IsReady()))) or (t:BuffUp(e.UnholyStrengthBuff) and t:BuffRemains(e.UnholyStrengthBuff) < t:GCD()))) then
        if o(e.ChainsofIce, nil, nil, not i:IsInRange(30)) then
            a = 45524
            return "chains_of_ice coldheart 4"
        end

    end

    if e.ChainsofIce:IsReady() and (not e.Obliteration:IsAvailable() and Y and t:BuffDown(e.PillarofFrostBuff) and e.PillarofFrost:CooldownRemains() > 15 and ((t:BuffStack(e.ColdHeartBuff) >= 10 and t:BuffUp(e.UnholyStrengthBuff)) or t:BuffStack(e.ColdHeartBuff) >= 13)) then
        if o(e.ChainsofIce, nil, nil, not i:IsInRange(30)) then
            a = 45524
            return "chains_of_ice coldheart 6"
        end

    end

    if e.ChainsofIce:IsReady() and (not e.Obliteration:IsAvailable() and not Y and t:BuffStack(e.ColdHeartBuff) >= 10 and t:BuffDown(e.PillarofFrostBuff) and e.PillarofFrost:CooldownRemains() > 20) then
        if o(e.ChainsofIce, nil, nil, not i:IsInRange(30)) then
            a = 45524
            return "chains_of_ice coldheart 8"
        end

    end

    if e.ChainsofIce:IsReady() and (e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff) and ((t:BuffStack(e.ColdHeartBuff) >= 14 and (t:BuffUp(e.UnholyStrengthBuff))) or (t:BuffStack(e.ColdHeartBuff) >= 19) or (e.PillarofFrost:CooldownRemains() < 3 and t:BuffStack(e.ColdHeartBuff) >= 14))) then
        if o(e.ChainsofIce, nil, nil, not i:IsInRange(30)) then
            a = 45524
            return "chains_of_ice coldheart 10"
        end

    end

end

local function k()
    if e.RemorselessWinter:IsReady() and (EnemiesCount10yd > 3) then
        if o(e.RemorselessWinter, nil, nil, not i:IsInRange(8)) then
            a = 196770
            return "remorseless_winter obliteration 2"
        end

    end

    if e.Obliterate:IsReady() and (t:BuffUp(e.KillingMachineBuff) and not w) then
        if r.CastTargetIf(e.Obliterate, Enemies10yd, "max", m, g, not i:IsInMeleeRange(8)) then
            return "obliterate obliteration 6"
        end

    end

    if e.Frostscythe:IsReady() and (t:BuffUp(e.KillingMachineBuff) and w) then
        if o(e.Frostscythe, nil, nil, not i:IsInRange(8)) then
            a = 207230
            return "frostscythe obliteration 8"
        end

    end

    if e.HowlingBlast:IsReady() and (i:DebuffDown(e.FrostFeverDebuff) and t:BuffDown(e.KillingMachineBuff)) then
        if o(e.HowlingBlast, nil, nil, not i:IsInRange(30)) then
            a = 49184
            return "howling_blast obliteration 10"
        end

    end

    if e.FrostStrike:IsReady() and not p and (t:BuffDown(e.KillingMachineBuff) and (f or (i:DebuffStack(e.RazoriceDebuff) == 5 and e.ShatteringBlade:IsAvailable())) and (not c) and ((not e.GlacialAdvance:IsAvailable()) or EnemiesCount10yd == 1)) then
        if r.CastTargetIf(e.FrostStrike, Enemies10yd, "max", m, x, not i:IsInMeleeRange(8)) then
            return "froststrike obliteration 12"
        end

    end

    if e.HowlingBlast:IsReady() and (t:BuffUp(e.RimeBuff) and t:BuffUp(e.KillingMachineBuff)) then
        if o(e.HowlingBlast, nil, nil, not i:IsInRange(30)) then
            a = 49184
            return "howling_blast obliteration 14"
        end

    end

    if e.GlacialAdvance:IsReady() and ((not c) and f and t:BuffDown(e.KillingMachineBuff) and EnemiesCount10yd >= 2) then
        if o(e.GlacialAdvance, nil, nil, i:IsInRange(100)) then
            a = 194913
            return "glacial_advance obliteration 16"
        end

    end

    if e.FrostStrike:IsReady() and not p and (t:BuffDown(e.KillingMachineBuff) and (not c) and ((not e.GlacialAdvance:IsAvailable()) or EnemiesCount10yd == 1)) then
        if r.CastTargetIf(e.FrostStrike, Enemies10yd, "max", m, x, not i:IsInMeleeRange(8)) then
            return "froststrike obliteration 18"
        end

    end

    if e.HowlingBlast:IsReady() and (t:BuffDown(e.KillingMachineBuff) and t:RunicPower() < 25) then
        if o(e.HowlingBlast, nil, nil, not i:IsInRange(30)) then
            a = 49184
            return "howling_blast obliteration 20"
        end

    end

    if e.ArcaneTorrent:IsCastable() and s() and n.Commons.Enabled.Racials and (t:Rune() < 1 and t:RunicPower() < 25) then
        if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
            a = 155145
            return "arcane_torrent obliteration 22"
        end

    end

    if e.GlacialAdvance:IsReady() and ((not c) and EnemiesCount10yd >= 2) then
        if o(e.GlacialAdvance, nil, nil, i:IsInRange(100)) then
            a = 194913
            return "glacial_advance obliteration 24"
        end

    end

    if e.FrostStrike:IsReady() and not p and ((not c) and ((not e.GlacialAdvance:IsAvailable()) or EnemiesCount10yd == 1)) then
        if r.CastTargetIf(e.FrostStrike, EnemiesMelee, "max", m, x) then
            return "frost_strike obliteration 26"
        end

    end

    if e.HowlingBlast:IsReady() and (t:BuffUp(e.RimeBuff)) then
        if o(e.HowlingBlast, nil, nil, not i:IsInRange(30)) then
            a = 49184
            return "howling_blast obliteration 28"
        end

    end

    if e.Obliterate:IsReady() then
        if r.CastTargetIf(e.Obliterate, EnemiesMelee, "max", m, g) then
            return "obliterate obliteration 30"
        end

    end

end

local function m()
    if e.RemorselessWinter:IsReady() and (A or l) then
        if o(e.RemorselessWinter, nil, nil, not i:IsInRange(8)) then
            a = 196770
            return "remorseless_winter standard 2"
        end

    end

    if e.Frostscythe:IsReady() and ((not R) and t:BuffUp(e.KillingMachineBuff) and w) then
        if o(e.Frostscythe, nil, nil, not i:IsInRange(8)) then
            a = 207230
            return "frostscythe standard 4"
        end

    end

    if e.Obliterate:IsReady() and ((not R) and t:BuffUp(e.KillingMachineBuff)) then
        if o(e.Obliterate, nil, nil, not i:IsInRange(8)) then
            a = 49020
            return "obliterate standard 6"
        end

    end

    if e.HowlingBlast:IsReady() and (t:BuffUp(e.RimeBuff) and e.Icebreaker:TalentRank() == 2) then
        if o(e.HowlingBlast, nil, nil, not i:IsInRange(30)) then
            a = 49184
            return "howling_blast standard 8"
        end

    end

    if e.HornofWinter:IsReady() and (t:Rune() < 4 and t:RunicPowerDeficit() > 25 and e.Obliteration:IsAvailable() and e.BreathofSindragosa:IsAvailable()) then
        if o(e.HornofWinter, nil) then
            a = 57330
            return "horn_of_winter standard 10"
        end

    end

    if e.FrostStrike:IsReady() and ((not c) and (f or t:RunicPowerDeficit() < 25 or i:DebuffStack(e.RazoriceDebuff) == 5 and e.ShatteringBlade:IsAvailable())) then
        if o(e.FrostStrike, nil, nil, not i:IsInRange(8)) then
            a = 49143
            return "frost_strike standard 12"
        end

    end

    if e.HowlingBlast:IsReady() and (X) then
        if o(e.HowlingBlast, nil, nil, not i:IsInRange(30)) then
            a = 49184
            return "howling_blast standard 14"
        end

    end

    if e.GlacialAdvance:IsReady() and ((not c) and (not E) and (i:DebuffStack(e.RazoriceDebuff) < 5 or i:DebuffRemains(e.RazoriceDebuff) < t:GCD() * 3)) then
        if o(e.GlacialAdvance, nil, nil, i:IsInRange(100)) then
            a = 194913
            return "glacial_advance standard 16"
        end

    end

    if e.Obliterate:IsReady() and (not R) then
        if o(e.Obliterate, nil, nil, not i:IsInRange(8)) then
            a = 49020
            return "obliterate standard 18"
        end

    end

    if e.HornofWinter:IsReady() and (t:Rune() < 4 and t:RunicPowerDeficit() > 25 and ((not e.BreathofSindragosa:IsAvailable()) or e.BreathofSindragosa:CooldownRemains() > 45)) then
        if o(e.HornofWinter, nil) then
            a = 57330
            return "horn_of_winter standard 20"
        end

    end

    if e.ArcaneTorrent:IsCastable() and s() and n.Commons.Enabled.Racials and (t:RunicPowerDeficit() > 20) then
        if o(e.ArcaneTorrent, nil) then
            return "arcane_torrent standard 22"
        end

    end

    if e.FrostStrike:IsReady() and (not c) then
        if o(e.FrostStrike, nil, nil, not i:IsInRange(8)) then
            a = 49143
            return "frost_strike standard 24"
        end

    end

end

local function g()
    if (Q) then
        if e.BloodFury:IsCastable() and s() and n.Commons.Enabled.Racials then
            if o(e.BloodFury, nil) then
                a = 20572
                return "blood_fury racials 2"
            end

        end

        if e.Berserking:IsCastable() and s() and n.Commons.Enabled.Racials then
            if o(e.Berserking, nil) then
                a = 26297
                return "berserking racials 4"
            end

        end

        if e.ArcanePulse:IsCastable() and s() and n.Commons.Enabled.Racials then
            if o(e.ArcanePulse, nil, nil, not i:IsInRange(8)) then
                a = 260364
                return "arcane_pulse racials 6"
            end

        end

        if e.LightsJudgment:IsCastable() and s() and n.Commons.Enabled.Racials then
            if o(e.LightsJudgment, nil, nil, not i:IsInRange(40)) then
                a = 255647
                return "lights_judgment racials 8"
            end

        end

        if e.AncestralCall:IsCastable() and s() and n.Commons.Enabled.Racials then
            if o(e.AncestralCall, nil) then
                a = 274738
                return "ancestral_call racials 10"
            end

        end

        if e.Fireblood:IsCastable() and s() and n.Commons.Enabled.Racials then
            if o(e.Fireblood, nil) then
                a = 265221
                return "fireblood racials 12"
            end

        end

        if e.BagofTricks:IsCastable() and s() and n.Commons.Enabled.Racials and (e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff) and t:BuffUp(e.UnholyStrengthBuff)) then
            if o(e.BagofTricks, nil, nil, not i:IsInRange(40)) then
                a = 312411
                return "bag_of_tricks racials 14"
            end

        end

    end

end

local function x()
    if y.GaveloftheFirstArbiter:IsEquippedAndReady() and i:IsInRange(30) and s() and not ie then
        if o(y.GaveloftheFirstArbiter, nil, nil, not i:IsInRange(30)) then
            a = 16
            return "gavel_of_the_first_arbiter trinkets 4"
        end

    end

    if s() then
        if ((n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and s()) then
            local e = t:GetUseableTrinkets(W)
            if e then
                if o(e, nil, nil) then
                                        if e:ID() == F and n.Commons.Enabled.TopTrinket then
                        a = 24
                        return "top trinket 1"
                    elseif e:ID() == D and n.Commons.Enabled.BottomTrinket then
                        a = 30
                        return "top trinket 2"
                    end

                end

            end

        end

    end

end

local function z()
    te = HeroRotationCharDB.Toggles[6]
    se = HeroRotationCharDB.Toggles[4]
    H = HeroRotationCharDB.Toggles[5] or s()
    O = HeroRotationCharDB.Toggles[12]
    J = HeroRotationCharDB.Toggles[13]
    N = HeroRotationCharDB.Toggles[14]
    ee = HeroRotationCharDB.Toggles[15]
    C = HeroRotationCharDB.Toggles[16]
    K = HeroRotationCharDB.Toggles[81]
    M = HeroRotationCharDB.Toggles[110]
    ie = HeroRotationCharDB.Toggles[17]
    oe = HeroRotationCharDB.Toggles[111]
    T = HeroRotationCharDB.Toggles[18]
    p = false
    ae = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                ae = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

    F = GetInventoryItemID("player", 13)
    D = GetInventoryItemID("player", 14)
            if not n.Commons.Enabled.TopTrinket and not n.Commons.Enabled.BottomTrinket then
        W = { F, D }
    elseif not n.Commons.Enabled.TopTrinket then
        W = { F }
    elseif not n.Commons.Enabled.BottomTrinket then
        W = { D }
    end

end

local function s()
    if _() then
        EnemiesMelee = t:GetEnemiesInMeleeRange(8)
        Enemies10yd = t:GetEnemiesInMeleeRange(10)
        EnemiesCount10yd = #Enemies10yd
        EnemiesMeleeCount = #EnemiesMelee
    else
        EnemiesMelee = {  }
        Enemies10yd = {  }
        EnemiesCount10yd = 1
        EnemiesMeleeCount = 1
    end

    if r.TargetIsValid() or t:AffectingCombat() then
        if IsInRaid() and UnitExists("boss1") then
            P = b.BossFightRemains(nil, true)
            u = P
            if u == 11111 then
                u = b.FightRemains(Enemies10yd, false)
            end

        end

    end

    if not BotOn then
        d = 0
        a = 0
        G = 0
    end

    if d > 0 then
        d = 0
    end

    if a > 0 then
        a = 0
    end

    if G > 0 then
        G = 0
    end

    z()
    if h.QueuedCast() then
        a = h.QueuedCast()
        return "Custom Queue " .. Z(a):ID()
    end

        if h.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (h.GUISettings.General.OpenerReset)
    elseif h.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        h.ToggleIconFrame:UpdateButtonText(6)
        h.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (J and e.AntiMagicZone:IsUsableP() and t:AffectingCombat() and e.AntiMagicZone:CooldownRemains(BypassRecovery) <= 0) then
        if o(e.AntiMagicZone, nil, nil, nil) then
            a = 51052
            return "queue AMZ"
        end

    elseif ((not e.AntiMagicZone:IsUsableP() or e.AntiMagicZone:CooldownRemains() > 0 or not t:AffectingCombat()) and J) then
        HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13]
        h.Print("Anti-Magic Zone Queue is now " .. (HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (N and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and v("mouseover"):GUID() ~= nil) then
        if o(e.DeathGrip, nil, nil, nil) then
            d = 149576
            return "queue DeathGrip MO"
        end

    elseif (N and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and r.TargetIsValid()) then
        if o(e.DeathGrip, nil, nil, nil) then
            a = 49576
            return "queue DeathGrip"
        end

    elseif ((not e.DeathGrip:IsUsableP() or e.DeathGrip:CooldownRemains() > 0 or not r.TargetIsValid()) and N) then
        HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14]
        h.Print("Death Grip Queue is now " .. (HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (C and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and v("mouseover"):GUID() ~= nil) then
        if o(e.Asphyxiate, nil, nil, nil) then
            d = 1221562
            return "queue Asphyxiate MO"
        end

    elseif (C and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and r.TargetIsValid()) then
        if o(e.Asphyxiate, nil, nil, nil) then
            a = 221562
            return "queue Asphyxiate"
        end

    elseif ((not e.Asphyxiate:IsUsableP() or e.Asphyxiate:CooldownRemains() > 0) and C) then
        HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16]
        h.Print("Asphyxiate Queue is now " .. (HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (K and e.ControlUndead:IsUsableP() and e.ControlUndead:CooldownRemains(BypassRecovery) <= 0 and not t:PrevGCD(1, e.ControlUndead)) then
        if h.Cast(e.ControlUndead, nil, nil, nil) then
            if v("mouseover"):GUID() ~= nil and v("mouseover"):IsInRange(30) then
                d = 1111673
                return "queue ControlUndead MO"
            else
                a = 111673
                return "queue ControlUndead"
            end

        end

    elseif ((not e.ControlUndead:IsUsableP() or e.ControlUndead:CooldownRemains() > 0 or t:PrevGCD(1, e.ControlUndead)) and K) then
        HeroRotationCharDB.Toggles[81] = not HeroRotationCharDB.Toggles[81]
        h.Print("Control Undead Queue is now " .. (HeroRotationCharDB.Toggles[81] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if t:IsChanneling(Z(324631)) then
                if t:AffectingCombat() and n.Frost.CastCancelFC then
            a = 1999
        elseif o(e.Pool, nil, nil, nil) then
            d = 99999
            return "wait"
        end

    end

    if not t:AffectingCombat() and r.TargetIsValid() and not t:IsDeadOrGhost() and te then
        local e = S()
        if e then
            return e
        end

    end

    if r.TargetIsValid() and not t:IsDeadOrGhost() and r.TargetIsValid() and t:AffectingCombat() then
        if (not UnitIsEnemy("player", "mouseover") and UnitIsDead("mouseover")) then
                        if e.RaiseAlly:IsCastable() and (t:RunicPower() >= 30) then
                if o(e.RaiseAlly, nil) then
                    d = 161999
                    return "RaiseAlly MO"
                end

            elseif e.RaiseAlly:CooldownRemains(BypassRecovery) <= 0 and (t:RunicPower() < 30) then
                p = true
            end

        end

        if not i:IsInMeleeRange(15) and EnemiesMeleeCount > 0 and n.Frost.TargetSwap == "AutoSwap" and not O then
            d = 9999
        end

        if (n.Commons.UseDefensives) then
            if t:HealthPercentage() < n.Commons.HealthstoneHP and y.Healthstone:IsReady() and y.Healthstone:CooldownRemains() <= 0 then
                if o(y.Healthstone, nil) then
                    a = 40
                    return "Healthstone HP"
                end

            end

            if t:HealthPercentage() < n.Commons.HealPotHP and y.HealPot:IsReady() and y.CosmicHealPot:CooldownRemains() <= 0 then
                if o(y.CosmicHealPot, nil) then
                    a = 45
                    return "Cosmic HealPot HP"
                end

            end

            if t:HealthPercentage() < n.Commons.HealPotHP and y.HealPot:IsReady() and y.HealPot:CooldownRemains() <= 0 then
                if o(y.HealPot, nil) then
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
                    a = 49039
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

        q = (EnemiesCount10yd == 1 or not _())
        l = (EnemiesCount10yd >= 2 and _())
        X = (t:BuffUp(e.RimeBuff) and (e.RageoftheFrozenChampion:IsAvailable() or e.Avalanche:IsAvailable() or e.Icebreaker:IsAvailable()))
        f = ((e.UnleashedFrenzy:IsAvailable() and (t:BuffRemains(e.UnleashedFrenzyBuff) < t:GCD() * 3 or t:BuffStack(e.UnleashedFrenzyBuff) < 3)) or (e.IcyTalons:IsAvailable() and (t:BuffRemains(e.IcyTalonsBuff) < t:GCD() * 3 or t:BuffStack(e.IcyTalonsBuff) < 3)))
        Q = ((e.PillarofFrost:IsAvailable() and t:BuffUp(e.PillarofFrostBuff)) or ((not e.PillarofFrost:IsAvailable()) and t:BuffUp(e.EmpowerRuneWeaponBuff)) or ((not e.PillarofFrost:IsAvailable()) and not e.EmpowerRuneWeapon:IsAvailable()))
        w = ((e.Frostscythe:IsAvailable() and (t:BuffUp(e.KillingMachineBuff)) or EnemiesCount10yd >= 3) and (((not e.ImprovedObliterate:IsAvailable()) and (not e.FrigidExecutioner:IsAvailable()) and (not e.Frostreaper:IsAvailable()) and (not e.MightoftheFrozenWastes:IsAvailable())) or (not e.CleavingStrikes:IsAvailable()) or (e.CleavingStrikes:IsAvailable() and (EnemiesCount10yd > 6 or (t:BuffDown(e.DeathAndDecayBuff) and EnemiesCount10yd > 3)))))
        if t:RunicPower() < 35 and t:Rune() < 2 and e.PillarofFrost:CooldownRemains() < 10 then
            I = (((e.PillarofFrost:CooldownRemains() + 1) / t:GCD()) / ((t:Rune() + 3) * (t:RunicPower() + 5)) * 100)
        else
            I = (t:GCD() * 2)
        end

        if t:RunicPowerDeficit() > 10 and e.BreathofSindragosa:CooldownRemains() < 10 then
            j = (((e.BreathofSindragosa:CooldownRemains() + 1) / t:GCD()) / ((t:Rune() + 1) * (t:RunicPower() + 20)) * 100)
        else
            j = (t:GCD() * 2)
        end

        R = (e.Obliteration:IsAvailable() and e.PillarofFrost:CooldownRemains() < I)
        c = ((e.BreathofSindragosa:IsAvailable() and e.BreathofSindragosa:CooldownRemains() < j) or (e.Obliteration:IsAvailable() and t:RunicPower() < 35 and e.PillarofFrost:CooldownRemains() < I))
        if e.HowlingBlast:IsReady() and (i:DebuffDown(e.FrostFeverDebuff) and EnemiesCount10yd >= 2 and ((not e.Obliteration:IsAvailable()) or (e.Obliteration:IsAvailable() and (t:BuffDown(e.PillarofFrostBuff) or (t:BuffUp(e.PillarofFrostBuff) and t:BuffDown(e.KillingMachineBuff)))))) then
            if o(e.HowlingBlast, nil) then
                a = 49184
                return "howling_blast main 4"
            end

        end

        if e.GlacialAdvance:IsReady() and (EnemiesCount10yd >= 2 and f and e.Obliteration:IsAvailable() and e.BreathofSindragosa:IsAvailable() and t:BuffDown(e.PillarofFrostBuff) and t:BuffDown(e.BreathofSindragosa) and e.BreathofSindragosa:CooldownRemains() > j) then
            if o(e.GlacialAdvance, nil, nil, 100) then
                a = 194913
                return "glacial_advance main 6"
            end

        end

        if e.GlacialAdvance:IsReady() and (EnemiesCount10yd >= 2 and f and e.BreathofSindragosa:IsAvailable() and t:BuffDown(e.BreathofSindragosa) and e.BreathofSindragosa:CooldownRemains() > j) then
            if o(e.GlacialAdvance, nil, nil, 100) then
                a = 194913
                return "glacial_advance main 6"
            end

        end

        if e.GlacialAdvance:IsReady() and (EnemiesCount10yd >= 2 and f and (not e.BreathofSindragosa:IsAvailable()) and e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff)) then
            if o(e.GlacialAdvance, nil, nil, 100) then
                a = 194913
                return "glacial_advance main 6"
            end

        end

        if e.FrostStrike:IsReady() and not p and (EnemiesCount10yd == 1 and f and e.Obliteration:IsAvailable() and e.BreathofSindragosa:IsAvailable() and t:BuffDown(e.PillarofFrostBuff) and t:BuffDown(e.BreathofSindragosa) and e.BreathofSindragosa:CooldownRemains() > j) then
            if o(e.FrostStrike) then
                a = 49143
                return "frost_strike main 8"
            end

        end

        if e.FrostStrike:IsReady() and not p and (EnemiesCount10yd == 1 and f and e.BreathofSindragosa:IsAvailable() and t:BuffDown(e.BreathofSindragosa) and e.BreathofSindragosa:CooldownRemains() > j) then
            if o(e.FrostStrike) then
                a = 49143
                return "frost_strike main 8"
            end

        end

        if e.FrostStrike:IsReady() and not p and (EnemiesCount10yd == 1 and f and (not e.BreathofSindragosa:IsAvailable()) and e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff)) then
            if o(e.FrostStrike) then
                a = 49143
                return "frost_strike main 8"
            end

        end

        if e.RemorselessWinter:IsReady() and ((not e.BreathofSindragosa:IsAvailable()) and (not e.Obliteration:IsAvailable()) and A) then
            if o(e.RemorselessWinter, nil, nil, not i:IsInRange(8)) then
                a = 196770
                return "remorseless_winter main 2"
            end

        end

        if e.RemorselessWinter:IsReady() and (e.Obliteration:IsAvailable() and EnemiesCount10yd >= 3 and l) then
            if o(e.RemorselessWinter, nil, nil, not i:IsInRange(8)) then
                a = 196770
                return "remorseless_winter main 2"
            end

        end

        if (true) then
            local e = x()
            if e then
                return e
            end

        end

        if (true) then
            local e = V()
            if e then
                return e
            end

        end

        if (n.Commons.Enabled.Racials) then
            local e = g()
            if e then
                return e
            end

        end

        if (e.ColdHeart:IsAvailable() and (t:BuffDown(e.KillingMachineBuff) or e.BreathofSindragosa:IsAvailable()) and ((i:DebuffStack(e.RazoriceDebuff) == 5 or ((not E) and (not e.GlacialAdvance:IsAvailable()) and not e.Avalanche:IsAvailable())) or u <= t:GCD() + .5)) then
            local e = B()
            if e then
                return e
            end

        end

        if (t:BuffUp(e.BreathofSindragosa) and e.Obliteration:IsAvailable() and t:BuffUp(e.PillarofFrostBuff)) then
            local t = U()
            if t then
                return t
            end

            if o(e.Pool) then
                return "pool for BreathOblit()"
            end

        end

        if (t:BuffUp(e.BreathofSindragosa) and ((not e.Obliteration:IsAvailable()) or e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff))) then
            local t = ne()
            if t then
                return t
            end

            if o(e.Pool) then
                return "pool for Breath()"
            end

        end

        if (e.Obliteration:IsAvailable() and t:BuffUp(e.PillarofFrostBuff) and t:BuffDown(e.BreathofSindragosa)) then
            local t = k()
            if t then
                return t
            end

            if o(e.Pool) then
                return "pool for Obliteration()"
            end

        end

        if (EnemiesCount10yd >= 2 and _()) then
            local e = L()
            if e then
                return e
            end

        end

        if (EnemiesCount10yd == 1 or not _()) then
            local e = m()
            if e then
                return e
            end

        end

        if h.CastAnnotated(e.Pool, false, "WAIT") then
            return "Wait/Pool Resources"
        end

    end

end

local function e()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        h.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpellF()
    if a == 0 then
        return 0
    else
        return a
    end

end

function ReturnSpellMOF()
    if d == 0 then
        return 0
    else
        return d
    end

end

h.SetAPL(251, s, e)

