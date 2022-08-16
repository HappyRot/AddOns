local e, e = ...
local e = HeroDBC.DBC
local y = HeroLib
local e = HeroCache
local x = y.Unit
local t = x.Player
local n = x.Target
local e = x.Pet
local te = y.Spell
local d = y.Item
local l = HeroRotation
local o = l.Cast
local r = l.CDsON
local oe = l.AoEON
local k = HeroRotationCharDB.Toggles[4]
local D = HeroRotationCharDB.Toggles[5]
local ie = HeroRotationCharDB.Toggles[6]
local G = HeroRotationCharDB.Toggles[15]
local L = HeroRotationCharDB.Toggles[12]
local X = HeroRotationCharDB.Toggles[13]
local R = HeroRotationCharDB.Toggles[14]
local S = HeroRotationCharDB.Toggles[16]
local Q = HeroRotationCharDB.Toggles[81]
local C = HeroRotationCharDB.Toggles[110]
local f = false
local F = 0
local M = strsplit
local e = math.min
local e = pairs
local N = GetInventoryItemLink
local e = te.DeathKnight.Frost
local h = d.DeathKnight.Frost
local W = { h.InscrutableQuantumDevice:ID(), h.ScarsofFraternalStrife:ID(), h.TheFirstSigil:ID() }
local m = t:GetEquipment()
local V = d(0)
local P = d(0)
local a = 0
local E, a = GetInventoryItemID("player", 13)
local z, a = GetInventoryItemID("player", 14)
if m[13] then
    V = d(m[13])
end

if m[14] then
    P = d(m[14])
end

local ae
local a
local a
local a
local T
local a, a
local a
local a
local j
local q
local p
local U
local v
local ee = y.GhoulTable
local w = 0
local a = 0
local Y = 0
local A = t:CovenantID()
y:RegisterForEvent(function()
    A = t:CovenantID()
end, "COVENANT_CHOSEN")
local u = l.Commons.Everyone
local s = { General = l.GUISettings.General, Commons = l.GUISettings.APL.DeathKnight.Commons, Frost = l.GUISettings.APL.DeathKnight.Frost }
local i = { { e.Asphyxiate, "Cast Asphyxiate (Interrupt)", function()
    return true
end } }
local c = { 5, 8, 10, 30, 40, 100 }
local i = {  }
local function b()
    for t, e in ipairs(c) do
        if e == 8 or 5 then
            i[e] = n:IsInMeleeRange(e)
        end

        i[e] = n:IsInRange(e)
    end

end

local I = t:HasLegendaryEquipped(38)
local Z = t:HasLegendaryEquipped(39)
local O = t:HasLegendaryEquipped(41)
local J = N("player", 16) or ""
local B = N("player", 17) or ""
local c, c, b = M(":", J)
local c, H, _ = M(":", B)
local c = (b == "3370" or _ == "3370")
local K = (b == "3368" or _ == "3368")
local g = IsEquippedItemType("Two-Hand")
y:RegisterForEvent(function()
    m = t:GetEquipment()
    V = d(0)
    P = d(0)
    if m[13] then
        V = d(m[13])
    end

    if m[14] then
        P = d(m[14])
    end

    I = t:HasLegendaryEquipped(38)
    Z = t:HasLegendaryEquipped(39)
    O = t:HasLegendaryEquipped(41)
    J = N("player", 16) or ""
    B = N("player", 17) or ""
    H, H, b = M(":", J)
    H, H, _ = M(":", B)
    c = (b == "3370" or _ == "3370")
    K = (b == "3368" or _ == "3368")
    g = IsEquippedItemType("Two-Hand")
end, "PLAYER_EQUIPMENT_CHANGED")
local function b(e)
    if e then
        return 1
    else
        return 0
    end

end

local function d(e)
    return e ~= 0
end

local function d(t)
    return ((t:DebuffStack(e.RazoriceDebuff) + 1) / (t:DebuffRemains(e.RazoriceDebuff) + 1))
end

local function m(a)
    return (e.RemorselessWinter:CooldownRemains() <= 2 * t:GCD() and e.GatheringStorm:IsAvailable())
end

local function m(t)
    return (t:DebuffDown(e.FrostFeverDebuff))
end

local function _(e)
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and e:GUID() == x("mouseover"):GUID()) then
        w = 149143
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and s.Frost.TargetSwap == "AutoSwap" and e:GUID() ~= n:GUID() and not L) then
        w = 9999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and e:GUID() == n:GUID()) then
        a = 49143
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) then
        return true
    end

end

local function m(e)
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and e:GUID() == x("mouseover"):GUID()) then
        w = 149020
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and s.Frost.TargetSwap == "AutoSwap" and e:GUID() ~= n:GUID() and not L) then
        w = 9999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) and e:GUID() == n:GUID()) then
        a = 49020
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8)) then
        return true
    end

end

local function H()
    if u.TargetIsValid() then
        if e.Fleshcraft:IsCastable() then
            if o(e.Fleshcraft, nil, nil) then
                a = 324631
                return "fleshcraft precombat"
            end

        end

        T = (e.GatheringStorm:IsAvailable() or e.Everfrost:ConduitEnabled() or Z)
        if e.HowlingBlast:IsReady() and (not n:IsInRange(8)) then
            if o(e.HowlingBlast, nil, nil, not i[30]) then
                a = 49184
                return "howling_blast precombat"
            end

        end

        if e.RemorselessWinter:IsReady() and (n:IsInRange(8)) then
            if o(e.RemorselessWinter, nil, nil, not i[8]) then
                a = 196770
                return "remorseless_winter precombat"
            end

        end

    end

end

local function B()
    if e.RemorselessWinter:IsReady() then
        if o(e.RemorselessWinter, nil, nil, not i[8]) then
            a = 196770
            return "remorseless_winter aoe 2"
        end

    end

    if e.GlacialAdvance:IsReady() and (e.Frostscythe:IsAvailable()) then
        if o(e.GlacialAdvance, nil, nil, not i[30]) then
            a = 194913
            return "glacial_advance aoe 4"
        end

    end

    if e.Frostscythe:IsReady() and (t:BuffUp(e.KillingMachineBuff) and not v) then
        if o(e.Frostscythe, nil, nil, not i[8]) then
            a = 207230
            return "frostscythe aoe 6"
        end

    end

    if e.HowlingBlast:IsReady() and (p and e.Avalanche:IsAvailable()) then
        if o(e.HowlingBlast, nil, nil, not i[30]) then
            a = 49184
            return "howling_blast aoe 8"
        end

    end

    if e.GlacialAdvance:IsReady() and ((t:BuffDown(e.RimeBuff) and EnemiesCount10yd <= 3) or EnemiesCount10yd > 3) then
        if o(e.GlacialAdvance, nil, nil, not i[30]) then
            a = 194913
            return "glacial_advance aoe 10"
        end

    end

    if e.FrostStrike:IsReady() and not f and (e.RemorselessWinter:CooldownRemains() <= (2 * t:GCD()) and e.GatheringStorm:IsAvailable()) then
        if c then
            if u.CastTargetIf(e.FrostStrike, EnemiesMelee, "max", d, _) then
                return "frost_strike aoe 12"
            end

        else
            if o(e.FrostStrike, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49143
                return "frost_strike aoe 12 no_razorice"
            end

        end

    end

    if e.HowlingBlast:IsReady() and (p) then
        if o(e.HowlingBlast, nil, nil, not i[30]) then
            a = 49184
            return "howling_blast aoe 14"
        end

    end

    if e.Frostscythe:IsReady() and (e.GatheringStorm:IsAvailable() and t:BuffUp(e.RemorselessWinter) and EnemiesCount10yd > 2 and not v) then
        if o(e.Frostscythe, nil, nil, not i[8]) then
            a = 207230
            return "frostscythe aoe 16"
        end

    end

    if e.Obliterate:IsReady() and ((v and t:BuffStack(e.DeathsDueBuff) < 4) or (e.GatheringStorm:IsAvailable() and t:BuffUp(e.RemorselessWinter))) then
        if o(e.Obliterate, nil, nil, not i[8]) then
            a = 49020
            return "obliterate aoe 18"
        end

    end

    if e.FrostStrike:IsReady() and not f and (t:RunicPowerDeficit() < (15 + b(e.RunicAttenuation:IsAvailable()) * 5)) then
        if c then
            if u.CastTargetIf(e.FrostStrike, EnemiesMelee, "max", d, _) then
                return "frost_strike aoe 20 razorice"
            end

        else
            if o(e.FrostStrike, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49143
                return "frost_strike aoe 20 no_razorice"
            end

        end

    end

    if e.Frostscythe:IsReady() and (not v) then
        if o(e.Frostscythe, nil, nil, not i[8]) then
            a = 207230
            return "frostscythe aoe 22"
        end

    end

    if e.Obliterate:IsReady() and (t:RunicPowerDeficit() > (25 + b(e.RunicAttenuation:IsAvailable()) * 5)) then
        if c then
            if d(n) and m(n) then
                if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                    a = 49020
                    return "obliterate aoe 24 no_razorice"
                end

            end

            if u.CastTargetIf(e.Obliterate, EnemiesMelee, "max", d, m) then
                return "obliterate aoe 24 razorice"
            end

        else
            if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49020
                return "obliterate aoe 24 no_razorice"
            end

        end

    end

    if e.GlacialAdvance:IsReady() then
        if o(e.GlacialAdvance, nil, nil, not i[30]) then
            a = 194913
            return "glacial_advance aoe 26"
        end

    end

    if e.Frostscythe:IsReady() then
        if o(e.Frostscythe, nil, nil, not i[8]) then
            a = 207230
            return "frostscythe aoe 28"
        end

    end

    if e.FrostStrike:IsReady() and not f then
        if c then
            if u.CastTargetIf(e.FrostStrike, EnemiesMelee, "max", d, _) then
                return "frost_strike aoe 30 razorice"
            end

        else
            if o(e.FrostStrike, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49143
                return "frost_strike aoe 30 no_razorice"
            end

        end

    end

    if e.HornofWinter:IsCastable() then
        if o(e.HornofWinter, nil) then
            a = 57330
            return "horn_of_winter aoe 32"
        end

    end

    if e.ArcaneTorrent:IsCastable() and r() and s.Commons.Enabled.Racials then
        if o(e.ArcaneTorrent, nil, nil, not i[8]) then
            a = 155145
            return "arcane_torrent aoe 34"
        end

    end

end

local function ne()
    if e.RemorselessWinter:IsReady() and (EnemiesCount10yd >= 2 or T) then
        if o(e.RemorselessWinter, nil, nil, not i[8]) then
            a = 196770
            return "remorseless_winter bospooling 4"
        end

    end

    if e.Obliterate:IsReady() and (t:BuffUp(e.KillingMachineBuff) and e.PillarofFrost:CooldownRemains() > 3) then
        if c then
            if d(n) and m(n) then
                if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                    a = 49020
                    return "obliterate bospooling 4 razorice"
                end

            end

            if u.CastTargetIf(e.Obliterate, EnemiesMelee, "max", d, m) then
                return "obliterate bospooling 4 razorice"
            end

        else
            if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49020
                return "obliterate bospooling 4 no_razorice"
            end

        end

    end

    if e.HowlingBlast:IsReady() and (p) then
        if o(e.HowlingBlast) then
            a = 49184
            return "howling_blast bospooling 2"
        end

    end

    if e.Frostscythe:IsReady() and (t:BuffUp(e.KillingMachineBuff) and t:RunicPowerDeficit() > (15 + b(e.RunicAttenuation:IsAvailable()) * 5) and EnemiesMeleeCount > 2 and not v) then
        if o(e.Frostscythe, nil, nil, not i[8]) then
            a = 207230
            return "frostscythe bospooling 12"
        end

    end

    if e.Frostscythe:IsReady() and (t:RunicPowerDeficit() >= (35 + b(e.RunicAttenuation:IsAvailable()) * 5) and EnemiesMeleeCount > 2 and not v) then
        if o(e.Frostscythe, nil, nil, not i[8]) then
            a = 207230
            return "frostscythe bospooling 14"
        end

    end

    if e.Obliterate:IsReady() and (t:RunicPowerDeficit() >= 25) then
        if c then
            if d(n) and m(n) then
                if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                    a = 49020
                    return "obliterate bospooling 12 razorice"
                end

            end

            if u.CastTargetIf(e.Obliterate, EnemiesMelee, "max", d, m) then
                return "obliterate bospooling 12 razorice"
            end

        else
            if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49020
                return "obliterate bospooling 12 no_razorice"
            end

        end

    end

    if e.GlacialAdvance:IsReady() and (t:RunicPowerDeficit() < 20 and EnemiesCount10yd >= 2 and e.PillarofFrost:CooldownRemains() > 5) then
        if o(e.GlacialAdvance, nil, nil, i[100]) then
            a = 194913
            return "glacial_advance bospooling 8"
        end

    end

    if e.FrostStrike:IsReady() and not f and (t:RunicPowerDeficit() < 20 and e.PillarofFrost:CooldownRemains() > 5) then
        if c then
            if u.CastTargetIf(e.FrostStrike, EnemiesMelee, "max", d, _) then
                return "frost_strike aoe 20 razorice"
            end

        else
            if o(e.FrostStrike, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49143
                return "frost_strike aoe 20 no_razorice"
            end

        end

    end

    if e.GlacialAdvance:IsReady() and (e.PillarofFrost:CooldownRemains() > t:RuneTimeToX(4) and t:RunicPowerDeficit() < 40 and EnemiesCount10yd >= 2) then
        if o(e.GlacialAdvance, nil, nil, i[100]) then
            a = 194913
            return "glacial_advance bospooling 16"
        end

    end

    if e.FrostStrike:IsReady() and (e.PillarofFrost:CooldownRemains() > t:RuneTimeToX(4) and t:RunicPowerDeficit() < 40) then
        if c then
            if u.CastTargetIf(e.FrostStrike, EnemiesMelee, "max", d, _) then
                return "frost_strike aoe 20 razorice"
            end

        else
            if o(e.FrostStrike, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49143
                return "frost_strike aoe 20 no_razorice"
            end

        end

    end

    if l.CastAnnotated(e.Pool, false, "WAIT") then
        return "Wait Resources BoS Pooling"
    end

end

local function M()
    if e.Obliterate:IsReady() and (t:RunicPowerDeficit() >= (45 + b(e.RunicAttenuation:IsAvailable()) * 5)) then
        if c then
            if d(n) and m(n) then
                if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                    a = 49020
                    return "obliterate bosticking  2 razorice"
                end

            end

            if u.CastTargetIf(e.Obliterate, EnemiesMelee, "max", d, m) then
                print("4")
                return "obliterate bosticking  2 razorice"
            end

        else
            if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49020
                return "obliterate bosticking  2 no_razorice"
            end

        end

    end

    if e.RemorselessWinter:IsReady() and (T or EnemiesCount10yd >= 2 or t:RunicPower() < 32) then
        if o(e.RemorselessWinter, nil, nil, not i[8]) then
            a = 196770
            return "remorseless_winter bosticking 4"
        end

    end

    if e.DeathAndDecay:IsReady() and (t:RunicPower() < 32) then
        if o(e.DeathAndDecay) then
            a = 43265
            return "death_and_decay bosticking 6"
        end

    end

    if e.HowlingBlast:IsReady() and ((p and (t:RunicPowerDeficit() < 55 or t:RuneTimeToX(3) <= t:GCD() or O or EnemiesCount10yd >= 2 or t:BuffRemains(e.RimeBuff) < 3)) or t:RunicPower() < 32) then
        if o(e.HowlingBlast, nil, nil, not i[30]) then
            a = 49184
            return "howling_blast bosticking 8"
        end

    end

    if e.Frostscythe:IsReady() and (t:BuffUp(e.KillingMachineBuff) and EnemiesCount10yd > 2 and not v) then
        if o(e.Frostscythe, nil, nil, not i[8]) then
            a = 207230
            return "frostscythe bosticking 10"
        end

    end

    if e.Obliterate:IsReady() and (t:BuffUp(e.KillingMachineBuff)) then
        if c then
            if d(n) and m(n) then
                if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                    a = 49020
                    return "obliterate bosticking  12 razorice"
                end

            end

            if u.CastTargetIf(e.Obliterate, EnemiesMelee, "max", d, m) then
                return "obliterate bosticking  12 razorice"
            end

        else
            if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49020
                return "obliterate bosticking  12 no_razorice"
            end

        end

    end

    if e.HornofWinter:IsCastable() and (t:RunicPowerDeficit() >= 40 and t:RuneTimeToX(3) > t:GCD()) then
        if o(e.HornofWinter, nil) then
            a = 57330
            return "horn_of_winter bosticking 12"
        end

    end

    if e.Frostscythe:IsReady() and (EnemiesCount10yd > 2 and not v) then
        if o(e.Frostscythe, nil, nil, not i[8]) then
            a = 207230
            return "frostscythe bosticking 14"
        end

    end

    if e.Obliterate:IsReady() and (t:RunicPowerDeficit() > 25 or t:RuneTimeToX(3) < t:GCD()) then
        if c then
            if d(n) and m(n) then
                if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                    a = 49020
                    return "obliterate bosticking  18 razorice"
                end

            end

            if u.CastTargetIf(e.Obliterate, EnemiesMelee, "max", d, m) then
                return "obliterate bosticking  18 razorice"
            end

        else
            if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49020
                return "obliterate bosticking  18 no_razorice"
            end

        end

    end

    if e.HowlingBlast:IsReady() and (p) then
        if o(e.HowlingBlast, nil, nil, not i[30]) then
            a = 49184
            return "howling_blast bosticking 18"
        end

    end

    if e.ArcaneTorrent:IsCastable() and t:RunicPowerDeficit() > 50 and r() and s.Commons.Enabled.Racials then
        if o(e.ArcaneTorrent, nil, nil, not i[8]) then
            a = 155145
            return "arcane_torrent bosticking 20"
        end

    end

    if l.CastAnnotated(e.Pool, false, "WAIT") then
        return "Wait Resources BoS Ticking"
    end

end

local function N()
    if e.ChainsofIce:IsReady() and (y.FilteredFightRemains(Enemies10yd, "<", t:GCD()) and (t:Rune() < 2 or (t:BuffDown(e.KillingMachineBuff) and (((not g) and t:BuffStack(e.ColdHeartBuff) >= 4 + b(I)) or (g and t:BuffStack(e.ColdHeartBuff) > 8 + b(I)))) or (t:BuffUp(e.KillingMachineBuff) and (((not g) and t:BuffStack(e.ColdHeartBuff) > 8 + b(I)) or (g and t:BuffStack(e.ColdHeartBuff) > 10 + b(I)))))) then
        if o(e.ChainsofIce, nil, nil, not i[30]) then
            a = 45524
            return "chains_of_ice coldheart 2"
        end

    end

    if e.ChainsofIce:IsReady() and ((not e.Obliteration:IsAvailable() and t:BuffUp(e.PillarofFrostBuff) and t:BuffStack(e.ColdHeartBuff) >= 10 and (t:BuffRemains(e.PillarofFrostBuff) < t:GCD() * (1 + b(e.FrostwyrmsFury:CooldownUp())))) or (t:BuffUp(e.UnholyStrengthBuff) and t:BuffRemains(e.UnholyStrengthBuff) < t:GCD()) or (t:BuffUp(e.ChaosBaneBuff) and t:BuffRemains(e.ChaosBaneBuff) < t:GCD())) then
        if o(e.ChainsofIce, nil, nil, not i[30]) then
            a = 45524
            return "chains_of_ice coldheart 4"
        end

    end

    if e.ChainsofIce:IsReady() and (not e.Obliteration:IsAvailable() and K and t:BuffDown(e.PillarofFrostBuff) and e.PillarofFrost:CooldownRemains() > 15 and ((t:BuffStack(e.ColdHeartBuff) >= 10 and (t:BuffUp(e.UnholyStrengthBuff) or t:BuffUp(e.ChaosBaneBuff))) or (t:BuffStack(e.ColdHeartBuff) >= 13))) then
        if o(e.ChainsofIce, nil, nil, not i[30]) then
            a = 45524
            return "chains_of_ice coldheart 6"
        end

    end

    if e.ChainsofIce:IsReady() and (not e.Obliteration:IsAvailable() and not K and t:BuffStack(e.ColdHeartBuff) >= 10 and t:BuffDown(e.PillarofFrostBuff) and e.PillarofFrost:CooldownRemains() > 20) then
        if o(e.ChainsofIce, nil, nil, not i[30]) then
            a = 45524
            return "chains_of_ice coldheart 8"
        end

    end

    if e.ChainsofIce:IsReady() and (e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff) and ((t:BuffStack(e.ColdHeartBuff) >= 14 and (t:BuffUp(e.UnholyStrengthBuff) or t:BuffUp(e.ChaosBaneBuff))) or (t:BuffStack(e.ColdHeartBuff) >= 19) or (e.PillarofFrost:CooldownRemains() < 3 and t:BuffStack(e.ColdHeartBuff) >= 14))) then
        if o(e.ChainsofIce, nil, nil, not i[30]) then
            a = 45524
            return "chains_of_ice coldheart 10"
        end

    end

end

local function I()
    if e.DeathsDue:IsReady() and k and (((not e.Obliteration:IsAvailable()) or (e.Obliteration:IsAvailable() and EnemiesCount10yd >= 2 and e.PillarofFrost:CooldownDown()) or EnemiesCount10yd == 1) and (j or q)) then
        if o(e.DeathsDue, nil, nil, not i[10]) then
            a = 324128
            return "deaths_due covenants 2"
        end

    end

    if e.SwarmingMist:IsReady() and k and (t:RunicPowerDeficit() > 13 and e.PillarofFrost:CooldownRemains() < 3 and (not e.BreathofSindragosa:IsAvailable()) and j) then
        if o(e.SwarmingMist, nil, nil, not i[10]) then
            a = 311648
            return "swarming_mist covenants 4"
        end

    end

    if e.SwarmingMist:IsReady() and k and ((not e.BreathofSindragosa:IsAvailable()) and q) then
        if o(e.SwarmingMist, nil, nil, not i[10]) then
            a = 311648
            return "swarming_mist covenants 6"
        end

    end

    if e.SwarmingMist:IsReady() and k and (e.BreathofSindragosa:IsAvailable() and ((t:BuffUp(e.BreathofSindragosa) and ((j and t:RunicPowerDeficit() > 40) or (q and t:RunicPowerDeficit() > 60) or (q and y.FilteredFightRemains(Enemies10yd, "<", 9)))) or (t:BuffDown(e.BreathofSindragosa) and e.BreathofSindragosa:CooldownRemains() > 0))) then
        if o(e.SwarmingMist, nil, nil, not i[10]) then
            a = 311648
            return "swarming_mist covenants 8"
        end

    end

    if e.AbominationLimb:IsCastable() and k and ((e.PillarofFrost:CooldownRemains() < t:GCD() * 2 or t:BuffUp(e.BreathofSindragosa)) and j and (((e.BreathofSindragosa:IsAvailable() and t:RunicPower() > 65 and e.BreathofSindragosa:CooldownRemains() < 2) or t:BuffUp(e.BreathofSindragosa)) or (not e.BreathofSindragosa:IsAvailable()))) then
        if o(e.AbominationLimb, nil, nil, not i[10]) then
            a = 315443
            return "abomination_limb covenants 10"
        end

    end

    if e.AbominationLimb:IsCastable() and k and (q) then
        if o(e.AbominationLimb, nil, nil, not i[10]) then
            a = 315443
            return "abomination_limb covenants 12"
        end

    end

    if e.ShackleTheUnworthy:IsCastable() and k and (j and (e.PillarofFrost:CooldownRemains() < 3 or e.Icecap:IsAvailable())) then
        if o(e.ShackleTheUnworthy, nil, nil, not i[10]) then
            a = 312202
            return "shackle_the_unworthy covenants 14"
        end

    end

    if e.ShackleTheUnworthy:IsCastable() and k and (q) then
        if o(e.ShackleTheUnworthy, nil, nil, not i[10]) then
            a = 312202
            return "shackle_the_unworthy covenants 16"
        end

    end

    if e.Fleshcraft:IsCastable() and (F == 0 or F > 3) and k and not t:IsMoving() and s.Frost.CastCancelFC and (t:BuffDown(e.PillarofFrostBuff) and (e.PustuleEruption:SoulbindEnabled() or (e.VolatileSolvent:SoulbindEnabled() and t:BuffDown(e.VolatileSolventHumanBuff)))) then
        if o(e.Fleshcraft, nil, nil) then
            a = 324631
            return "fleshcraft covenants 18"
        end

    end

end

local function P()
    if e.BloodFury:IsCastable() and r() and s.Commons.Enabled.Racials and (t:BuffUp(e.PillarofFrostBuff)) then
        if o(e.BloodFury, nil) then
            a = 20572
            return "blood_fury racials 2"
        end

    end

    if e.Berserking:IsCastable() and r() and s.Commons.Enabled.Racials and t:BuffUp(e.PillarofFrostBuff) then
        if o(e.Berserking, nil) then
            a = 26297
            return "berserking racials 4"
        end

    end

    if e.ArcanePulse:IsCastable() and r() and s.Commons.Enabled.Racials and ((t:BuffDown(e.PillarofFrostBuff) and EnemiesMeleeCount >= 2) or (t:BuffDown(e.PillarofFrostBuff) and t:Rune() <= 1 and t:RunicPowerDeficit() >= 60)) then
        if o(e.ArcanePulse, nil, nil, not i[8]) then
            a = 260364
            return "arcane_pulse racials 6"
        end

    end

    if e.LightsJudgment:IsCastable() and r() and s.Commons.Enabled.Racials and t:BuffUp(e.PillarofFrostBuff) then
        if o(e.LightsJudgment, nil, nil, not i[40]) then
            a = 255647
            return "lights_judgment racials 8"
        end

    end

    if e.AncestralCall:IsCastable() and r() and s.Commons.Enabled.Racials and (t:BuffUp(e.PillarofFrostBuff) and t:BuffUp(e.EmpowerRuneWeaponBuff)) then
        if o(e.AncestralCall, nil) then
            a = 274738
            return "ancestral_call racials 10"
        end

    end

    if e.Fireblood:IsCastable() and r() and s.Commons.Enabled.Racials and (t:BuffRemains(e.PillarofFrostBuff) <= 8 and t:BuffUp(e.PillarofFrostBuff) and t:BuffUp(e.EmpowerRuneWeaponBuff)) then
        if o(e.Fireblood, nil) then
            a = 265221
            return "fireblood racials 12"
        end

    end

    if e.BagofTricks:IsCastable() and r() and s.Commons.Enabled.Racials and (t:BuffUp(e.PillarofFrostBuff) and EnemiesMeleeCount == 1 and ((t:BuffRemains(e.PillarofFrostBuff) < 5 and e.ColdHeart:IsAvailable()) or (not e.ColdHeart:IsAvailable() and t:BuffRemains(e.PillarofFrostBuff) < 3))) then
        if o(e.BagofTricks, nil, nil, not i[40]) then
            a = 312411
            return "bag_of_tricks racials 14"
        end

    end

end

local function V()
    if h.InscrutableQuantumDevice:IsEquippedAndReady() and r() and (t:BuffUp(e.PillarofFrostBuff) or n:TimeToX(20) < 5 or y.FilteredFightRemains(Enemies10yd, "<", 21)) then
        if o(h.InscrutableQuantumDevice, nil, nil) then
                        if h.InscrutableQuantumDevice:ID() == E and s.Commons.Enabled.TopTrinket == true then
                a = 24
                return "top trinket 1"
            elseif h.InscrutableQuantumDevice:ID() == z and s.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if h.GaveloftheFirstArbiter:IsEquippedAndReady() and n:IsInRange(30) and r() and not HoldWeapon then
        if o(h.GaveloftheFirstArbiter, nil, nil, not n:IsInRange(30)) then
            a = 16
            return "gavel_of_the_first_arbiter trinkets 4"
        end

    end

    if h.JotungeirrDestinysCall:IsEquippedAndReady() and r() and not HoldWeapon then
        if o(h.JotungeirrDestinysCall, nil, nil, not n:IsInRange(30)) then
            a = 16
            return "JotungeirrDestinysCall trinkets 4"
        end

    end

    if h.ScarsofFraternalStrife:IsEquippedAndReady() and r() then
        if o(h.ScarsofFraternalStrife, nil, nil) then
                        if h.ScarsofFraternalStrife:ID() == E and s.Commons.Enabled.TopTrinket == true then
                a = 24
                return "top trinket 1"
            elseif h.ScarsofFraternalStrife:ID() == z and s.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if h.TheFirstSigil:IsEquippedAndReady() and r() and (t:BuffUp(e.PillarofFrostBuff) and t:BuffUp(e.EmpowerRuneWeaponBuff)) then
        if o(h.TheFirstSigil, nil, nil) then
                        if h.TheFirstSigil:ID() == E and s.Commons.Enabled.TopTrinket == true then
                a = 24
                return "top trinket 1"
            elseif h.TheFirstSigil:ID() == z and s.Commons.Enabled.BottomTrinket then
                a = 30
                return "top trinket 2"
            end

        end

    end

    if e.PillarofFrost:CooldownUp() or e.PillarofFrost:CooldownRemains() > 20 then
        if ((s.Commons.Enabled.TopTrinket or s.Commons.Enabled.BottomTrinket) and r()) then
            local e = t:GetUseableTrinkets(W)
            if e then
                if o(e, nil, nil) then
                                        if e:ID() == E and s.Commons.Enabled.TopTrinket then
                        a = 24
                        return "top trinket 1"
                    elseif e:ID() == z and s.Commons.Enabled.BottomTrinket then
                        a = 30
                        return "top trinket 2"
                    end

                end

            end

        end

    end

end

local function K()
    if h.PotionofSpectralStrength:IsReady() and r() and s.Commons.Enabled.Potions and G and ((t:BuffUp(e.PillarofFrostBuff) and not l.GUISettings.General.HoldPotforBL) or (l.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
        if o(h.PotionofSpectralStrength, nil, nil) then
            a = 37
            return "potion cooldowns 2"
        end

    end

    if h.PotionofPhantomFire:IsReady() and r() and s.Commons.Enabled.Potions and G and ((t:BuffUp(e.PillarofFrostBuff) and not l.GUISettings.General.HoldPotforBL) or (l.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
        if o(h.PotionofPhantomFire, nil, nil) then
            a = 37
            return "potion cooldowns 2"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and r() and ((e.Obliteration:IsAvailable() and t:Rune() < 6 and (j or q) and ((e.PillarofFrost:CooldownRemains() < 5 and ((e.Fleshcraft:CooldownRemains() > 5 and e.PustuleEruption:SoulbindEnabled()) or (not e.PustuleEruption:SoulbindEnabled()) or not s.Frost.CastCancelFC)) or t:BuffUp(e.PillarofFrostBuff))) or y.FilteredFightRemains(Enemies10yd, "<", 20)) then
        if o(e.EmpowerRuneWeapon, nil) then
            a = 147568
            return "empower_rune_weapon cooldowns 4"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and r() and (e.BreathofSindragosa:IsAvailable() and t:RunicPowerDeficit() > 30 and t:RuneTimeToX(5) > t:GCD() and ((t:BuffUp(e.BreathofSindragosa) and e.BreathofSindragosa:TimeSinceLastCast() >= 5) or y.FilteredFightRemains(Enemies10yd, "<", 20))) then
        if o(e.EmpowerRuneWeapon, nil) then
            a = 147568
            return "empower_rune_weapon cooldowns 6"
        end

    end

    if e.EmpowerRuneWeapon:IsCastable() and r() and (e.Icecap:IsAvailable()) then
        if o(e.EmpowerRuneWeapon, nil) then
            a = 147568
            return "empower_rune_weapon cooldowns 8"
        end

    end

    if e.PillarofFrost:IsCastable() and D and (e.BreathofSindragosa:IsAvailable() and (j or q) and (e.BreathofSindragosa:CooldownRemains() > 0 or (e.BreathofSindragosa:CooldownUp() and t:RunicPowerDeficit() < 65))) then
        if o(e.PillarofFrost, nil) then
            a = 51271
            return "pillar_of_frost cooldowns 10"
        end

    end

    if e.PillarofFrost:IsCastable() and D and (e.Icecap:IsAvailable() and not t:BuffUp(e.PillarofFrost)) then
        if o(e.PillarofFrost, nil) then
            a = 51271
            return "pillar_of_frost cooldowns 12"
        end

    end

    if e.PillarofFrost:IsCastable() and D and (e.Obliteration:IsAvailable() and ((t:RunicPower() >= 35 and t:BuffDown(e.AbominationLimb)) or t:BuffUp(e.AbominationLimb) or O) and (j or q) and ((e.GatheringStorm:IsAvailable() and t:BuffUp(e.RemorselessWinter)) or not e.GatheringStorm:IsAvailable())) then
        if o(e.PillarofFrost, nil) then
            a = 51271
            return "pillar_of_frost cooldowns 14"
        end

    end

    if e.BreathofSindragosa:IsCastable() and not f and r() and t:BuffUp(e.PillarofFrostBuff) and t:RunicPower() >= s.Frost.MinimumBoS then
        if o(e.BreathofSindragosa, nil, nil, not i[8]) then
            a = 152279
            return "breath_of_sindragosa cooldowns 16"
        end

    end

    if e.FrostwyrmsFury:IsCastable() and not C and r() and ((EnemiesCount10yd == 1 and t:BuffRemains(e.PillarofFrostBuff) < t:GCD() and t:BuffUp(e.PillarofFrostBuff) and not e.Obliteration:IsAvailable()) or y.FilteredFightRemains(Enemies10yd, "<", 3)) then
        if o(e.FrostwyrmsFury, nil, nil, not i[40]) then
            a = 279302
            return "frostwyrms_fury cooldowns 18"
        end

    end

    if e.FrostwyrmsFury:IsCastable() and not C and r() and (EnemiesMeleeCount >= 2 and t:BuffUp(e.PillarofFrostBuff) and t:BuffRemains(e.PillarofFrostBuff) < t:GCD()) then
        if o(e.FrostwyrmsFury, nil, nil, not i[40]) then
            a = 279302
            return "frostwyrms_fury cooldowns 20"
        end

    end

    if e.FrostwyrmsFury:IsCastable() and not C and r() and (e.Obliteration:IsAvailable() and ((t:BuffUp(e.PillarofFrostBuff) and (not g)) or (t:BuffDown(e.PillarofFrostBuff) and g and e.PillarofFrost:CooldownRemains() > 0)) and ((t:BuffRemains(e.PillarofFrostBuff) < t:GCD() or (t:BuffUp(e.UnholyStrengthBuff) and t:BuffRemains(e.UnholyStrengthBuff) < t:GCD())) and (n:DebuffStack(e.RazoriceDebuff) == 5 or not c))) then
        if o(e.FrostwyrmsFury, nil, nil, not i[40]) then
            a = 279302
            return "frostwyrms_fury cooldowns 22"
        end

    end

    if e.HypothermicPresence:IsCastable() and r() and ((e.BreathofSindragosa:IsAvailable() and t:RunicPowerDeficit() > 40 and t:Rune() <= 3 and (t:BuffUp(e.BreathofSindragosa) or e.BreathofSindragosa:CooldownRemains() > 40)) or (not e.BreathofSindragosa:IsAvailable() and t:RunicPowerDeficit() >= 25)) then
        if o(e.HypothermicPresence, nil) then
            a = 321995
            return "hypothermic_presence cooldowns 24"
        end

    end

    if e.RaiseDead:IsCastable() and r() and (e.PillarofFrost:CooldownRemains() <= 5 or t:BuffUp(e.PillarofFrostBuff)) then
        if o(e.RaiseDead, nil, s.Commons.DisplayStyle.RaiseDead) then
            a = 46585
            return "raise_dead cooldowns 26"
        end

    end

    if e.SacrificialPact:IsReady() and ee.active() and (EnemiesCount10yd >= 2 and (y.FilteredFightRemains(Enemies10yd, "<", 3) or ee.remains() < t:GCD())) then
        if o(e.SacrificialPact, nil, nil, not i[8]) then
            a = 237574
            return "sacrificial_pact cooldowns 28"
        end

    end

    if e.DeathAndDecay:IsReady() and (EnemiesCount10yd > 5) then
        if o(e.DeathAndDecay, nil) then
            a = 43265
            return "death_and_decay cooldowns 30"
        end

    end

end

local function J()
    if e.RemorselessWinter:IsReady() and (T or EnemiesCount10yd >= 2) then
        if o(e.RemorselessWinter, nil, nil, not i[8]) then
            a = 196770
            return "remorseless_winter obliteration_pooling 2"
        end

    end

    if e.GlacialAdvance:IsReady() and (EnemiesCount10yd >= 2 and e.Frostscythe:IsAvailable()) then
        if o(e.GlacialAdvance, nil, nil, not i[100]) then
            a = 194913
            return "glacial_advance obliteration_pooling "
        end

    end

    if e.Frostscythe:IsReady() and (t:BuffUp(e.KillingMachineBuff) and EnemiesCount10yd > 2 and not v) then
        if o(e.Frostscythe, nil, nil, not i[100]) then
            a = 207230
            return "frostscythe obliteration_pooling "
        end

    end

    if e.Obliterate:IsReady() and (t:RuneTimeToX(4) < t:GCD() or t:RunicPower() <= 45) then
        if c then
            if d(n) and m(n) then
                if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                    a = 49020
                    return "obliterate pooling  8 razorice"
                end

            end

            if u.CastTargetIf(e.Obliterate, EnemiesMelee, "max", d, m) then
                return "obliterate pooling  8 razorice"
            end

        else
            if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49020
                return "obliterate pooling  8 no_razorice"
            end

        end

    end

    if e.FrostStrike:IsReady() and not f and (Enemies10yd == 1 and U) then
        if o(e.FrostStrike, nil, nil, not i[8]) then
            a = 49143
            return "frost_strike obliteration_pooling 4"
        end

    end

    if e.HowlingBlast:IsReady() and (p) then
        if o(e.HowlingBlast) then
            a = 49184
            return "howling_blast obliteration_pooling 7"
        end

    end

    if e.GlacialAdvance:IsReady() and (EnemiesCount10yd >= 2 and t:RunicPowerDeficit() < 60) then
        if o(e.GlacialAdvance, nil, nil, i[100]) then
            a = 194913
            return "glacial_advance obliteration_pooling 8"
        end

    end

    if e.FrostStrike:IsReady() and not f and (t:RunicPowerDeficit() < 70) then
        if c then
            if u.CastTargetIf(e.FrostStrike, EnemiesMelee, "max", d, _) then
                return "frost_strike aoe 20 razorice"
            end

        else
            if o(e.FrostStrike, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49143
                return "frost_strike aoe 20 no_razorice"
            end

        end

    end

    if e.Obliterate:IsReady() and ((t:Rune() >= 3 and ((not g) or A == 4 or A == 1)) or (t:Rune() >= 4 and g)) then
        if c then
            if d(n) and m(n) then
                if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                    a = 49020
                    return "obliterate pooling  18 razorice"
                end

            end

            if u.CastTargetIf(e.Obliterate, EnemiesMelee, "max", d, m) then
                return "obliterate pooling  18 razorice"
            end

        else
            if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49020
                return "obliterate pooling  18 no_razorice"
            end

        end

    end

    if e.Frostscythe:IsReady() and (EnemiesCount10yd >= 4 and not v) then
        if o(e.Frostscythe, nil, nil, not i[8]) then
            a = 207230
            return "frostscythe obliteration_pooling 14"
        end

    end

    if l.CastAnnotated(e.Pool, false, "WAIT") then
        return "Wait Resources Obliteration Pooling"
    end

end

local function Z()
    if e.RemorselessWinter:IsReady() and (EnemiesCount10yd >= 3 and T) then
        if o(e.RemorselessWinter, nil, nil, not i[8]) then
            a = 196770
            return "remorseless_winter obliteration 2"
        end

    end

    if e.FrostStrike:IsReady() and not f and (t:BuffDown(e.KillingMachineBuff) and (t:Rune() < 2 or (e.IcyTalons:IsAvailable() and t:BuffRemains(e.IcyTalonsBuff) < t:GCD() * 2) or (e.UnleashedFrenzy:ConduitEnabled() and (t:BuffRemains(e.UnleashedFrenzyBuff) < t:GCD() * 2 or t:BuffStack(e.UnleashedFrenzyBuff) < 3)))) then
        if o(e.FrostStrike, nil, nil, not i[8]) then
            a = 49143
            return "frost_strike obliteration 3"
        end

    end

    if e.HowlingBlast:IsReady() and (t:BuffDown(e.KillingMachineBuff) and t:Rune() >= 3 and ((t:BuffRemains(e.RimeBuff) < 3 and t:BuffUp(e.RimeBuff)) or n:DebuffDown(e.FrostFeverDebuff))) then
        if o(e.HowlingBlast, nil, nil, not i[30]) then
            a = 49184
            return "howling_blast obliteration 4"
        end

    end

    if e.GlacialAdvance:IsReady() and ((t:BuffDown(e.KillingMachineBuff) and EnemiesCount10yd >= 2) or (t:BuffDown(e.KillingMachineBuff) and (n:DebuffStack(e.RazoriceDebuff) < 5 or n:DebuffRemains(e.RazoriceDebuff) < t:GCD() * 4))) then
        if o(e.GlacialAdvance, nil, nil, i[100]) then
            a = 194913
            return "glacial_advance obliteration 10"
        end

    end

    if e.Frostscythe:IsReady() and (t:BuffUp(e.KillingMachineBuff) and EnemiesCount10yd > 2 and not v) then
        if o(e.Frostscythe, nil, nil, not i[8]) then
            a = 207230
            return "frostscythe obliteration 6"
        end

    end

    if e.Obliterate:IsReady() and (t:BuffUp(e.KillingMachineBuff)) then
        if c then
            if d(n) and m(n) then
                if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                    a = 49020
                    return "obliterate obliteration  12 razorice"
                end

            end

            if u.CastTargetIf(e.Obliterate, EnemiesMelee, "max", d, m) then
                return "obliterate obliteration  12 razorice"
            end

        else
            if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49020
                return "obliterate obliteration  12 no_razorice"
            end

        end

    end

    if e.FrostStrike:IsReady() and not f and (EnemiesCount10yd == 1 and U) then
        if o(e.FrostStrike, nil, nil, not i[8]) then
            a = 49143
            return "frost_strike obliteration 12"
        end

    end

    if e.HowlingBlast:IsReady() and (p and EnemiesCount10yd >= 2) then
        if o(e.HowlingBlast, nil, nil, not i[30]) then
            a = 49184
            return "howling_blast obliteration 14"
        end

    end

    if e.GlacialAdvance:IsReady() and (EnemiesCount10yd >= 2) then
        if o(e.GlacialAdvance, nil, nil, i[100]) then
            a = 194913
            return "glacial_advance obliteration 16"
        end

    end

    if e.FrostStrike:IsReady() and not f and ((not e.Avalanche:IsAvailable() and t:BuffDown(e.KillingMachineBuff)) or (e.Avalanche:IsAvailable() and (not p)) or (p and t:RuneTimeToX(2) >= t:GCD())) then
        if c then
            if u.CastTargetIf(e.FrostStrike, EnemiesMelee, "max", d, _) then
                return "frost_strike obliteration 20 razorice"
            end

        else
            if o(e.FrostStrike, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49143
                return "frost_strike obliteration 20 no_razorice"
            end

        end

    end

    if e.HowlingBlast:IsReady() and (p) then
        if o(e.HowlingBlast, nil, nil, not i[30]) then
            a = 49184
            return "howling_blast obliteration 20"
        end

    end

    if e.Obliterate:IsReady() then
        if c then
            if d(n) and m(n) then
                if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                    a = 49020
                    return "obliterate obliteration  24 razorice"
                end

            end

            if u.CastTargetIf(e.Obliterate, EnemiesMelee, "max", d, m) then
                return "obliterate pooling  24 razorice"
            end

        else
            if o(e.Obliterate, nil, nil, not n:IsInMeleeRange(5)) then
                a = 49020
                return "obliterate pooling  24 no_razorice"
            end

        end

    end

end

local function _()
    if e.RemorselessWinter:IsReady() and (T) then
        if o(e.RemorselessWinter, nil, nil, not i[8]) then
            a = 196770
            return "remorseless_winter standard 2"
        end

    end

    if e.Obliterate:IsReady() and (t:BuffUp(e.KillingMachineBuff)) then
        if o(e.Obliterate, nil, nil, not i[8]) then
            a = 49020
            return "obliterate standard 4"
        end

    end

    if e.HowlingBlast:IsReady() and (p and t:BuffRemains(e.RimeBuff) < 3) then
        if o(e.HowlingBlast, nil, nil, not i[30]) then
            a = 49184
            return "howling_blast standard 6"
        end

    end

    if e.FrostStrike:IsReady() and not f and (U) then
        if o(e.FrostStrike, nil, nil, not i[8]) then
            a = 49143
            return "frost_strike standard 8"
        end

    end

    if e.GlacialAdvance:IsReady() and (not c and (n:DebuffStack(e.RazoriceDebuff) < 5 or n:DebuffRemains(e.RazoriceDebuff) < (t:GCD() * 4))) then
        if o(e.GlacialAdvance, nil, nil, i[100]) then
            a = 194913
            return "glacial_advance standard 10"
        end

    end

    if e.FrostStrike:IsReady() and not f and (e.RemorselessWinter:CooldownRemains() <= (2 * t:GCD()) and e.GatheringStorm:IsAvailable()) then
        if o(e.FrostStrike, nil, nil, not i[8]) then
            a = 49143
            return "frost_strike standard 12"
        end

    end

    if e.HowlingBlast:IsReady() and (p) then
        if o(e.HowlingBlast, nil, nil, not i[30]) then
            a = 49184
            return "howling_blast standard 14"
        end

    end

    if e.FrostStrike:IsReady() and not f and (t:RunicPowerDeficit() < (15 + b(e.RunicAttenuation:IsAvailable()) * 5)) then
        if o(e.FrostStrike, nil, nil, not i[8]) then
            a = 49143
            return "frost_strike standard 18"
        end

    end

    if e.Obliterate:IsReady() and ((t:BuffDown(e.FrozenPulseBuff) and e.FrozenPulse:IsAvailable()) or (v and t:BuffStack(e.DeathsDueBuff) < 4) or (t:Rune() >= 4 and t:HasTier(28, 4)) or ((g or A ~= 3 or not t:HasTier(28, 4)) and e.GatheringStorm:IsAvailable() and t:BuffUp(e.RemorselessWinter)) or ((not t:HasTier(28, 4)) and t:RunicPowerDeficit() > (25 + b(e.RunicAttenuation:IsAvailable()) * 5))) then
        if o(e.Obliterate, nil, nil, not i[8]) then
            a = 49020
            return "obliterate standard 16"
        end

    end

    if e.FrostStrike:IsReady() and not f then
        if o(e.FrostStrike, nil, nil, not i[8]) then
            a = 49143
            return "frost_strike standard 22"
        end

    end

    if e.HornofWinter:IsCastable() then
        if o(e.HornofWinter, nil) then
            a = 57330
            return "horn_of_winter standard 24"
        end

    end

    if e.ArcaneTorrent:IsCastable() and r() and Setting.Commons.Enabled.Racials then
        if o(e.ArcaneTorrent, nil) then
            return "arcane_torrent standard 26"
        end

    end

end

local function d()
    Opener = HeroRotationCharDB.Toggles[6]
    k = HeroRotationCharDB.Toggles[4]
    D = HeroRotationCharDB.Toggles[5] or r()
    L = HeroRotationCharDB.Toggles[12]
    X = HeroRotationCharDB.Toggles[13]
    R = HeroRotationCharDB.Toggles[14]
    G = HeroRotationCharDB.Toggles[15]
    S = HeroRotationCharDB.Toggles[16]
    Q = HeroRotationCharDB.Toggles[81]
    C = HeroRotationCharDB.Toggles[110]
    f = false
    F = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                F = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

    E = GetInventoryItemID("player", 13)
    z = GetInventoryItemID("player", 14)
            if not s.Commons.Enabled.TopTrinket and not s.Commons.Enabled.BotTrinket then
        W = { h.InscrutableQuantumDevice:ID(), h.ScarsofFraternalStrife:ID(), h.TheFirstSigil:ID(), E, z }
    elseif not s.Commons.Enabled.TopTrinket then
        W = { h.InscrutableQuantumDevice:ID(), h.ScarsofFraternalStrife:ID(), h.TheFirstSigil:ID(), E }
    elseif not s.Commons.Enabled.BotTrinket then
        W = { h.InscrutableQuantumDevice:ID(), h.ScarsofFraternalStrife:ID(), h.TheFirstSigil:ID(), z }
    end

end

local function m()
    if oe() then
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

    if not BotOn then
        w = 0
        a = 0
        Y = 0
    end

    if w > 0 then
        w = 0
    end

    if a > 0 then
        a = 0
    end

    if Y > 0 then
        Y = 0
    end

    ae = d()
        if l.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (l.GUISettings.General.OpenerReset)
    elseif l.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        l.ToggleIconFrame:UpdateButtonText(6)
        l.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (X and e.AntiMagicZone:IsUsableP() and t:AffectingCombat() and e.AntiMagicZone:CooldownRemains(BypassRecovery) <= 0) then
        if o(e.AntiMagicZone, nil, nil, nil) then
            a = 51052
            return "queue AMZ"
        end

    elseif ((not e.AntiMagicZone:IsUsableP() or e.AntiMagicZone:CooldownRemains() > 0 or not t:AffectingCombat()) and X) then
        HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13]
        l.Print("Anti-Magic Zone Queue is now " .. (HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (R and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and x("mouseover"):GUID() ~= nil) then
        if o(e.DeathGrip, nil, nil, nil) then
            w = 149576
            return "queue DeathGrip MO"
        end

    elseif (R and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and u.TargetIsValid()) then
        if o(e.DeathGrip, nil, nil, nil) then
            a = 49576
            return "queue DeathGrip"
        end

    elseif ((not e.DeathGrip:IsUsableP() or e.DeathGrip:CooldownRemains() > 0 or not u.TargetIsValid()) and R) then
        HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14]
        l.Print("Death Grip Queue is now " .. (HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (S and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and x("mouseover"):GUID() ~= nil) then
        if o(e.Asphyxiate, nil, nil, nil) then
            w = 1221562
            return "queue Asphyxiate MO"
        end

    elseif (S and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and u.TargetIsValid()) then
        if o(e.Asphyxiate, nil, nil, nil) then
            a = 221562
            return "queue Asphyxiate"
        end

    elseif ((not e.Asphyxiate:IsUsableP() or e.Asphyxiate:CooldownRemains() > 0) and S) then
        HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16]
        l.Print("Asphyxiate Queue is now " .. (HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (Q and e.ControlUndead:IsUsableP() and e.ControlUndead:CooldownRemains(BypassRecovery) <= 0 and not t:PrevGCD(1, e.ControlUndead)) then
        if l.Cast(e.ControlUndead, nil, nil, nil) then
            if x("mouseover"):GUID() ~= nil and x("mouseover"):IsInRange(30) then
                w = 1111673
                return "queue ControlUndead MO"
            else
                a = 111673
                return "queue ControlUndead"
            end

        end

    elseif ((not e.ControlUndead:IsUsableP() or e.ControlUndead:CooldownRemains() > 0 or t:PrevGCD(1, e.ControlUndead)) and Q) then
        HeroRotationCharDB.Toggles[81] = not HeroRotationCharDB.Toggles[81]
        l.Print("Control Undead Queue is now " .. (HeroRotationCharDB.Toggles[81] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if t:IsChanneling(te(324631)) then
                if t:AffectingCombat() and s.Frost.CastCancelFC then
            a = 1999
        elseif o(e.Pool, nil, nil, nil) then
            w = 99999
            return "Raise Ally MO"
        end

    end

    if not n:IsInMeleeRange(15) and EnemiesMeleeCount > 0 and s.Frost.TargetSwap == "AutoSwap" and not L then
        w = 9999
    end

    if not t:AffectingCombat() and u.TargetIsValid() and not t:IsDeadOrGhost() and ie then
        local e = H()
        if e then
            return e
        end

    end

    if u.TargetIsValid() and not t:IsDeadOrGhost() and u.TargetIsValid() and t:AffectingCombat() then
        if (not UnitIsEnemy("player", "mouseover") and UnitIsDead("mouseover")) then
                        if e.RaiseAlly:IsCastable() and (t:RunicPower() >= 30) then
                if o(e.RaiseAlly, nil) then
                    w = 161999
                    return "RaiseAlly MO"
                end

            elseif e.RaiseAlly:CooldownRemains(BypassRecovery) <= 0 and (t:RunicPower() < 30) then
                f = true
            end

        end

        if (s.Commons.UseDefensives) then
            if t:HealthPercentage() < s.Commons.HealthstoneHP and h.Healthstone:IsReady() and h.Healthstone:CooldownRemains() <= 0 then
                if o(h.Healthstone, nil) then
                    a = 40
                    return "Healthstone HP"
                end

            end

            if t:HealthPercentage() < s.Commons.HealPotHP and h.HealPot:IsReady() and h.CosmicHealPot:CooldownRemains() <= 0 then
                if o(h.CosmicHealPot, nil) then
                    a = 45
                    return "Cosmic HealPot HP"
                end

            end

            if t:HealthPercentage() < s.Commons.HealPotHP and h.HealPot:IsReady() and h.HealPot:CooldownRemains() <= 0 then
                if o(h.HealPot, nil) then
                    a = 41
                    return "HealPot HP"
                end

            end

            if t:HealthPercentage() < s.Commons.UseDarkSuccorHP and e.DeathStrike:IsReady() and t:BuffUp(e.DeathStrikeBuff) then
                if o(e.DeathStrike) then
                    a = 49998
                    return "DeathStrike Dark Succor HP"
                end

            end

            if t:HealthPercentage() < s.Commons.UseDeathStrikeHP and e.DeathStrike:IsReady() then
                if o(e.DeathStrike) then
                    a = 49998
                    return "DeathStrike HP"
                end

            end

            if t:HealthPercentage() < s.Commons.IceboundFortitudeHP and e.IceboundFortitude:IsReady() then
                if o(e.IceboundFortitude) then
                    a = 48792
                    return "Icebound Fortitude HP"
                end

            end

            if t:HealthPercentage() < s.Commons.LichborneHP and e.Lichborne:IsReady() then
                if o(e.Lichborne) then
                    a = 49039
                    return "Lichborne HP"
                end

            end

            if t:HealthPercentage() < s.Commons.AntiMagicShellHP and e.AntiMagicShell:IsReady() then
                if o(e.AntiMagicShell) then
                    a = 48707
                    return "Anti-Magic Shell HP"
                end

            end

            if t:HealthPercentage() < s.Commons.DeathPactHP and e.DeathPact:IsReady() then
                if o(e.DeathPact) then
                    a = 48743
                    return "Death Pact HP"
                end

            end

        end

        j = (EnemiesCount10yd == 1)
        q = (EnemiesCount10yd >= 2)
        p = (t:BuffUp(e.RimeBuff) and ((not O) or (O and t:RunicPowerDeficit() > 8)))
        U = ((e.EradicatingBlow:ConduitEnabled() and t:BuffStack(e.EradicatingBlowBuff) == 2) or (e.UnleashedFrenzy:ConduitEnabled() and t:BuffRemains(e.UnleashedFrenzyBuff) < (t:GCD() * 2)))
        v = (t:BuffUp(e.DeathAndDecayBuff) and A == 3)
        if e.RemorselessWinter:IsReady() and ((e.Everfrost:ConduitEnabled() and e.GatheringStorm:IsAvailable() and not e.Obliteration:IsAvailable() and e.PillarofFrost:CooldownRemains() > 0) or (t:HasTier(28, 4) and e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff))) then
            if o(e.RemorselessWinter, nil, nil, not i[8]) then
                a = 196770
                return "remorseless_winter main 2"
            end

        end

        if e.HowlingBlast:IsReady() and n:DebuffRefreshable(e.FrostFeverDebuff) and (e.Icecap:IsAvailable() or (t:BuffDown(e.BreathofSindragosa) and e.BreathofSindragosa:IsAvailable()) or (e.Obliteration:IsAvailable() and e.PillarofFrost:CooldownRemains() > 0 and t:BuffDown(e.KillingMachineBuff))) then
            if o(e.HowlingBlast, nil) then
                a = 49184
                return "howling_blast main 4"
            end

        end

        if e.GlacialAdvance:IsReady() and (t:BuffRemains(e.IcyTalonsBuff) <= (t:GCD() * 2) and e.IcyTalons:IsAvailable() and EnemiesCount10yd >= 2 and (e.Icecap:IsAvailable() or (e.BreathofSindragosa:IsAvailable() and e.BreathofSindragosa:CooldownRemains() > 15) or (e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff)))) then
            if o(e.GlacialAdvance, nil, nil, 100) then
                a = 194913
                return "glacial_advance main 6"
            end

        end

        if e.FrostStrike:IsReady() and not f and (t:BuffRemains(e.IcyTalonsBuff) <= (t:GCD() * 2) and e.IcyTalons:IsAvailable() and (e.Icecap:IsAvailable() or (e.BreathofSindragosa:IsAvailable() and t:BuffDown(e.BreathofSindragosa) and e.BreathofSindragosa:CooldownRemains() > 10) or (e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff)))) then
            if o(e.FrostStrike) then
                a = 49143
                return "frost_strike main 8"
            end

        end

        local h = e.DeathsDue:IsAvailable() and e.DeathsDue or e.DeathAndDecay
        if e.Obliterate:IsReady() and (A == 3 and t:BuffUp(e.DeathAndDecayBuff) and 10 - h:TimeSinceLastCast() < (t:GCD() * 1.5) and ((not e.Obliteration:IsAvailable()) or (e.Obliteration:IsAvailable() and t:BuffDown(e.PillarofFrostBuff)))) then
            if o(e.Obliterate, nil, nil, not i[8]) then
                a = 49020
                return "obliterate main 10"
            end

        end

        if (true) then
            local e = I()
            if e then
                return e
            end

        end

        if (r() and s.Commons.Enabled.Racials) then
            local e = P()
            if e then
                return e
            end

        end

        if (r()) then
            local e = V()
            if e then
                return e
            end

        end

        if (true) then
            local e = K()
            if e then
                return e
            end

        end

        if (e.ColdHeart:IsAvailable() and (t:BuffDown(e.KillingMachineBuff) or e.BreathofSindragosa:IsAvailable()) and ((n:DebuffStack(e.RazoriceDebuff) == 5 or not c) or y.FilteredFightRemains(Enemies10yd, "<=", t:GCD()))) then
            local e = N()
            if e then
                return e
            end

        end

        if (t:BuffUp(e.BreathofSindragosa)) then
            local e = M()
            if e then
                return e
            end

        end

        if not s.Frost.DisableBoSPooling and e.BreathofSindragosa:IsAvailable() and (e.BreathofSindragosa:CooldownRemains() < 10 and r()) then
            local e = ne()
            if e then
                return e
            end

        end

        if (t:BuffUp(e.PillarofFrostBuff) and e.Obliteration:IsAvailable()) then
            local e = Z()
            if e then
                return e
            end

        end

        if ((not t:HasTier(28, 4)) and (not O) and e.Obliteration:IsAvailable() and e.PillarofFrost:CooldownRemains() < 10) then
            local e = J()
            if e then
                return e
            end

        end

        if (EnemiesCount10yd >= 2) then
            local e = B()
            if e then
                return e
            end

        end

        if (true) then
            local e = _()
            if e then
                return e
            end

        end

        if l.CastAnnotated(e.Pool, false, "WAIT") then
            return "Wait/Pool Resources"
        end

    end

end

local function e()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        l.ToggleIconFrame:UpdateButtonText(6)
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
    if w == 0 then
        return 0
    else
        return w
    end

end

l.SetAPL(251, m, e)

