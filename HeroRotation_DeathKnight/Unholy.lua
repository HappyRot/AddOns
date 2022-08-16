local e, e = ...
local e = HeroDBC.DBC
local d = HeroLib
local e = HeroCache
local w = d.Unit
local i = w.Player
local a = w.Target
local e = w.Boss
local E = w.Pet
local P = d.Spell
local _ = d.Item
local c = HeroRotation
local o = c.Cast
local f = c.CDsON
local D = c.AoEON
local j = HeroRotationCharDB.Toggles[4]
local R = HeroRotationCharDB.Toggles[5]
local ne = HeroRotationCharDB.Toggles[6]
local Y = HeroRotationCharDB.Toggles[10]
local se = HeroRotationCharDB.Toggles[11]
local q = HeroRotationCharDB.Toggles[12]
local B = HeroRotationCharDB.Toggles[13]
local M = HeroRotationCharDB.Toggles[14]
local oe = HeroRotationCharDB.Toggles[15]
local U = HeroRotationCharDB.Toggles[16]
local Q = HeroRotationCharDB.Toggles[17]
local ie = nil
local J = nil
local b = false
local p = false
local C = false
local k = false
local K = false
local ye = false
local e = 0
local v = false
local he = table.insert
local e = P.DeathKnight.Unholy
local s = _.DeathKnight.Unholy
local pe = { s.DarkmoonDeckVoracity:ID(), s.DreadfireVessel:ID(), s.InscrutableQuantumDevice:ID(), s.MacabreSheetMusic:ID() }
local z = i:GetEquipment()
local X = _(0)
local V = _(0)
local N, t = GetInventoryItemID("player", 13)
local O, te = GetInventoryItemID("player", 14)
if z[13] then
    X = _(z[13])
end

if z[14] then
    V = _(z[14])
end

local we
local ee
local y = c.Commons.Everyone
local n = { General = c.GUISettings.General, Commons = c.GUISettings.APL.DeathKnight.Commons, Unholy = c.GUISettings.APL.DeathKnight.Unholy }
local g
local I
local T
local H
local x
local F
local u
local m
local t, t
local t
local t
local L
local r, h
local S, A
local G
local ae = i:HasLegendaryEquipped(30)
local Z = i:HasLegendaryEquipped(31)
local W = i:HasLegendaryEquipped(45)
local me = { { e.Asphyxiate, "Cast Asphyxiate (Interrupt)", function()
    return true
end } }
local t = 0
local l = 0
d:RegisterForEvent(function()
    z = i:GetEquipment()
    X = _(0)
    V = _(0)
    if z[13] then
        X = _(z[13])
    end

    if z[14] then
        V = _(z[14])
    end

    ae = i:HasLegendaryEquipped(30)
    Z = i:HasLegendaryEquipped(31)
    W = i:HasLegendaryEquipped(45)
end, "PLAYER_EQUIPMENT_CHANGED")
local function z(e)
    if e then
        return 1
    else
        return 0
    end

end

local function z(e)
    return e ~= 0
end

local function ge()
    return (n.General.SoloMode and (i:HealthPercentage() < n.Commons.UseDeathStrikeHP or i:HealthPercentage() < n.Commons.UseDarkSuccorHP and i:BuffUp(e.DeathStrikeBuff)))
end

local function ve(a)
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

local function _(e)
    local a = {  }
    if e ~= nil then
        for t in pairs(e) do
            if not w:IsInBossList(e[t]["UnitNPCID"]) then
                he(a, e[t])
            end

        end

    end

    return d.FightRemains(a)
end

local function z(t)
    return (t:DebuffStack(e.FesteringWoundDebuff))
end

local function ke(o)
                if (h >= 2 and o:DebuffStack(e.FesteringWoundDebuff) >= 4 and i:BuffDown(e.DeathAndDecayBuff) and o:GUID() == w("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        l = 151
        return true
    elseif (h >= 2 and o:DebuffStack(e.FesteringWoundDebuff) >= 4 and i:BuffDown(e.DeathAndDecayBuff) and n.Unholy.TargetSwap == "AutoSwap" and o:GUID() ~= a:GUID() and not q) then
        l = 999
        return true
    elseif (h >= 2 and o:DebuffStack(e.FesteringWoundDebuff) >= 4 and i:BuffDown(e.DeathAndDecayBuff) and o:GUID() == a:GUID()) then
        t = 15
        return true
    elseif (h >= 2 and a:DebuffStack(e.FesteringWoundDebuff) >= 4 and i:BuffDown(e.DeathAndDecayBuff)) then
        return true
    end

end

local function de(o)
                if (o:DebuffStack(e.FesteringWoundDebuff) <= 3 and (e.Apocalypse:CooldownRemains() < 3) and o:GUID() == w("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        l = 61
        return true
    elseif (o:DebuffStack(e.FesteringWoundDebuff) <= 3 and (e.Apocalypse:CooldownRemains() < 3) and n.Unholy.TargetSwap == "AutoSwap" and o:GUID() ~= a:GUID() and not q) then
        l = 999
        return true
    elseif (o:DebuffStack(e.FesteringWoundDebuff) <= 3 and (e.Apocalypse:CooldownRemains() < 3) and o:GUID() == a:GUID()) then
        t = 6
        return true
    elseif (o:DebuffStack(e.FesteringWoundDebuff) <= 3 and (e.Apocalypse:CooldownRemains() < 3)) then
        return true
    end

end

local function be(e)
                if (i:RuneTimeToX(4) < m:CooldownRemains() and e:GUID() == w("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        l = 61
        return true
    elseif (i:RuneTimeToX(4) < m:CooldownRemains() and n.Unholy.TargetSwap == "AutoSwap" and e:GUID() ~= a:GUID() and not q) then
        l = 999
        return true
    elseif (i:RuneTimeToX(4) < m:CooldownRemains() and e:GUID() == a:GUID()) then
        t = 6
        return true
    elseif i:RuneTimeToX(4) < m:CooldownRemains() then
        return true
    end

end

local function ce(o)
                if ((o:DebuffStack(e.FesteringWoundDebuff) <= 3 and (e.Apocalypse:CooldownRemains() < 5) or o:DebuffStack(e.FesteringWoundDebuff) < 1) and o:GUID() == w("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        l = 61
        return true
    elseif ((o:DebuffStack(e.FesteringWoundDebuff) <= 3 and (e.Apocalypse:CooldownRemains() < 5) or o:DebuffStack(e.FesteringWoundDebuff) < 1) and n.Unholy.TargetSwap == "AutoSwap" and o:GUID() ~= a:GUID() and not q) then
        l = 999
        return true
    elseif ((o:DebuffStack(e.FesteringWoundDebuff) <= 3 and (e.Apocalypse:CooldownRemains() < 5) or o:DebuffStack(e.FesteringWoundDebuff) < 1) and o:GUID() == a:GUID()) then
        t = 6
        return true
    elseif (o:DebuffStack(e.FesteringWoundDebuff) <= 3 and (e.Apocalypse:CooldownRemains() < 5) or o:DebuffStack(e.FesteringWoundDebuff) < 1) then
        return true
    end

end

local function fe(o)
                if ((e.Apocalypse:CooldownRemains() > 5) and o:DebuffStack(e.FesteringWoundDebuff) < 1 and o:GUID() == w("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        l = 61
        return true
    elseif ((e.Apocalypse:CooldownRemains() > 5) and o:DebuffStack(e.FesteringWoundDebuff) < 1 and n.Unholy.TargetSwap == "AutoSwap" and o:GUID() ~= a:GUID() and not q) then
        l = 999
        return true
    elseif ((e.Apocalypse:CooldownRemains() > 5) and o:DebuffStack(e.FesteringWoundDebuff) < 1 and o:GUID() == a:GUID()) then
        t = 6
        return true
    elseif (e.Apocalypse:CooldownRemains() > 5) and o:DebuffStack(e.FesteringWoundDebuff) < 1 then
        return true
    end

end

local function ue(o)
                if (h >= 2 and o:DebuffStack(e.FesteringWoundDebuff) < 2 and o:GUID() == w("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        l = 171
        return true
    elseif (h >= 2 and o:DebuffStack(e.FesteringWoundDebuff) < 2 and n.Unholy.TargetSwap == "AutoSwap" and o:GUID() ~= a:GUID() and not q) then
        l = 999
        return true
    elseif (h >= 2 and o:DebuffStack(e.FesteringWoundDebuff) < 2 and o:GUID() == a:GUID()) then
        t = 17
        return true
    elseif (h >= 2 and o:DebuffStack(e.FesteringWoundDebuff) < 2) then
        return true
    end

end

local function X(o)
                if (((e.Apocalypse:CooldownRemains() > 5) and o:DebuffUp(e.FesteringWoundDebuff) or o:DebuffStack(e.FesteringWoundDebuff) > 4) and (d.FilteredFightRemains(r, "<", m:CooldownRemains() + 10) or d.FilteredFightRemains(r, ">", e.Apocalypse:CooldownRemains())) and o:GUID() == w("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        l = 71
        return true
    elseif (((e.Apocalypse:CooldownRemains() > 5) and o:DebuffUp(e.FesteringWoundDebuff) or o:DebuffStack(e.FesteringWoundDebuff) > 4) and (d.FilteredFightRemains(r, "<", m:CooldownRemains() + 10) or d.FilteredFightRemains(r, ">", e.Apocalypse:CooldownRemains())) and n.Unholy.TargetSwap == "AutoSwap" and o:GUID() ~= a:GUID() and not q) then
        l = 999
        return true
    elseif (((e.Apocalypse:CooldownRemains() > 5) and o:DebuffUp(e.FesteringWoundDebuff) or o:DebuffStack(e.FesteringWoundDebuff) > 4) and (d.FilteredFightRemains(r, "<", m:CooldownRemains() + 10) or d.FilteredFightRemains(r, ">", e.Apocalypse:CooldownRemains())) and o:GUID() == a:GUID()) then
        t = 7
        return true
    elseif (((e.Apocalypse:CooldownRemains() > 5) and o:DebuffUp(e.FesteringWoundDebuff) or o:DebuffStack(e.FesteringWoundDebuff) > 4) and (d.FilteredFightRemains(r, "<", m:CooldownRemains() + 10) or d.FilteredFightRemains(r, ">", e.Apocalypse:CooldownRemains()))) then
        return true
    end

end

local function he(o)
                if (o:DebuffDown(e.FesteringWoundDebuff)) and o:GUID() == w("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover" then
        l = 61
        return true
    elseif (o:DebuffDown(e.FesteringWoundDebuff)) and n.Unholy.TargetSwap == "AutoSwap" and o:GUID() ~= a:GUID() and not q then
        l = 999
        return true
    elseif (o:DebuffDown(e.FesteringWoundDebuff)) and o:GUID() == a:GUID() then
        t = 6
        return true
    elseif (o:DebuffDown(e.FesteringWoundDebuff)) then
        return true
    end

end

local function V(e)
                if ((e:TimeToX(35) < 5 or e:HealthPercentage() < 35) and e:TimeToDie() > 5 and e:GUID() == w("mouseover"):GUID() and n.Unholy.TargetSwap == "Mouseover") then
        l = 111
        return true
    elseif ((e:TimeToX(35) < 5 or e:HealthPercentage() < 35) and e:TimeToDie() > 5 and n.Unholy.TargetSwap == "AutoSwap" and e:GUID() ~= a:GUID() and not q) then
        l = 999
        return true
    elseif ((e:TimeToX(35) < 5 or e:HealthPercentage() < 35) and e:TimeToDie() > 5 and e:GUID() == a:GUID()) then
        t = 11
        return true
    elseif ((e:TimeToX(35) < 5 or e:HealthPercentage() < 35) and e:TimeToDie() > 5) then
        return true
    end

end

local function le()
    if e.RaiseDead:IsCastable() then
        if n.Unholy.RaiseDeadCastLeft then
            if c.CastLeft(e.RaiseDead) then
                t = 1
                return "raise_dead precombat 2 left"
            end

        else
            if o(e.RaiseDead, nil, nil) then
                t = 1
                return "raise_dead precombat 2 displaystyle"
            end

        end

    end

    if e.ArmyoftheDead:IsReady() and C and not Y and not n.Unholy.DisableAotD and (not e.SummonGargoyle:IsAvailable()) then
        if o(e.ArmyoftheDead, nil, nil) then
            t = 400
            return "army_of_the_dead precombat 4"
        end

    end

    L = (e.ArmyoftheDamned:IsAvailable() and e.ConvocationOfTheDead:ConduitRank() >= 9)
    if e.FesteringStrike:IsReady() and a:IsSpellInRange(e.FesteringStrike) then
        if o(e.FesteringStrike) then
            t = 6
            return "festering_strike precombat 6"
        end

    end

    if e.Outbreak:IsReady() then
        if o(e.Outbreak, nil, nil, not a:IsSpellInRange(e.Outbreak)) then
            t = 8
            return "outbreak precombat 8"
        end

    end

end

local function re()
    if m:IsReady() and not i:IsMoving() and (e.FesteringWoundDebuff:AuraActiveCount() == h or e.FesteringWoundDebuff:AuraActiveCount() >= 5 or not e.BurstingSores:IsAvailable() or A > 1 and _(S) <= 11 or d.FilteredFightRemains(r, "<=", 11)) then
        if m == e.DeathsDue then
            if o(m, nil, nil) then
                t = 2
                return "any_dnd aoe_setup 2"
            end

        else
            if o(m, nil) then
                t = 2
                return "any_dnd aoe_setup 4"
            end

        end

    end

    if e.DeathCoil:IsReady() and not v and (not g and (E:BuffUp(e.DarkTransformation) and W and h <= 3 or h == 2)) then
        if o(e.DeathCoil, nil, nil, not a:IsSpellInRange(e.DeathCoil)) then
            t = 10
            return "death_coil aoe_setup 10"
        end

    end

    if e.Epidemic:IsReady() and not v and (not g) then
        if o(e.Epidemic, n.Unholy.GCDasOffGCD.Epidemic, nil, not a:IsInRange(30)) then
            t = 12
            return "epidemic aoe_setup 12"
        end

    end

    if e.FesteringStrike:IsReady() then
        if (a:DebuffStack(e.FesteringWoundDebuff) <= 3 and (e.Apocalypse:CooldownRemains() < 3)) then
            if o(e.FesteringStrike, nil, nil, not a:IsSpellInRange(e.FesteringStrike)) then
                t = 6
                return "festering_strike aoe_setup 14"
            end

        end

        if y.CastTargetIf(e.FesteringStrike, r, "max", z, de) then
            return "festering_strike aoe_setup 14"
        end

    end

    if e.FesteringStrike:IsReady() then
        if y.CastCycle(e.FesteringStrike, r, he) then
            return "festering_strike aoe_setup 16"
        end

    end

    if e.FesteringStrike:IsReady() then
        if (a:DebuffStack(e.FesteringWoundDebuff) <= 3 and (e.Apocalypse:CooldownRemains() < 3)) then
            if o(e.FesteringStrike, nil, nil, not a:IsSpellInRange(e.FesteringStrike)) then
                t = 6
                return "festering_strike aoe_setup 16"
            end

        end

        if y.CastTargetIf(e.FesteringStrike, r, "min", z, be) then
            return "festering_strike aoe_setup 16"
        end

    end

end

local function de()
    if e.ClawingShadows:IsReady() and (A <= 5) then
        if o(e.ClawingShadows, nil, nil, not a:IsSpellInRange(e.ClawingShadows)) then
            t = 5
            return "clawing_shadows aoe_burst 2"
        end

    end

    if e.ClawingShadows:IsReady() and (A == 6 and e.FesteringWoundDebuff:AuraActiveCount() >= 3) then
        if o(e.ClawingShadows, nil, nil, not a:IsSpellInRange(e.ClawingShadows)) then
            t = 5
            return "clawing_shadows aoe_burst 4"
        end

    end

    if u:IsReady() and (e.BurstingSores:IsAvailable() and (e.FesteringWoundDebuff:AuraActiveCount() == h or e.FesteringWoundDebuff:AuraActiveCount() >= 3) or e.BurstingSores:IsAvailable() and e.ClawingShadows:IsAvailable() and e.FesteringWoundDebuff:AuraActiveCount() >= 1) then
        if o(u, nil, nil, not a:IsSpellInRange(u)) then
            t = 7
            return "wound_spender aoe_burst 6"
        end

    end

    if e.DeathCoil:IsReady() and not v and ((i:BuffUp(e.SuddenDoomBuff) or not g) and (E:BuffUp(e.DarkTransformation) and W and h <= 3 or h == 2)) then
        if o(e.DeathCoil, nil, nil, not a:IsSpellInRange(e.DeathCoil)) then
            t = 10
            return "death_coil aoe_burst 8"
        end

    end

    if e.Epidemic:IsReady() and not v and (i:RunicPowerDeficit() < (10 + e.FesteringWoundDebuff:AuraActiveCount() * 3) and e.FesteringWoundDebuff:AuraActiveCount() < 6 and not g or i:BuffUp(e.SwarmingMistBuff)) then
        if o(e.Epidemic, n.Unholy.GCDasOffGCD.Epidemic, nil, not a:IsInRange(30)) then
            t = 12
            return "epidemic aoe_burst 10"
        end

    end

    if e.Epidemic:IsReady() and not v and (i:RunicPowerDeficit() < 25 and e.FesteringWoundDebuff:AuraActiveCount() > 5 and not g) then
        if o(e.Epidemic, n.Unholy.GCDasOffGCD.Epidemic, nil, not a:IsInRange(30)) then
            t = 12
            return "epidemic aoe_burst 12"
        end

    end

    if e.Epidemic:IsReady() and not v and (e.FesteringWoundDebuff:AuraActiveCount() == 0 and not g or A > 1 and _(S) < 5) then
        if o(e.Epidemic, n.Unholy.GCDasOffGCD.Epidemic, nil, not a:IsInRange(30)) then
            t = 12
            return "epidemic aoe_burst 14"
        end

    end

    if u:IsReady() then
        if o(u, nil, nil, not a:IsSpellInRange(u)) then
            t = 7
            return "wound_spender aoe_burst 16"
        end

    end

    if e.Epidemic:IsReady() and not v and (not g) then
        if o(e.Epidemic, n.Unholy.GCDasOffGCD.Epidemic, nil, not a:IsInRange(30)) then
            t = 12
            return "epidemic aoe_burst 18"
        end

    end

end

local function he()
    if e.DeathCoil:IsReady() and not v and ((not g or i:BuffUp(e.SuddenDoomBuff)) and (E:BuffUp(e.DarkTransformation) and W and h <= 3 or h == 2)) then
        if o(e.DeathCoil, nil, nil, not a:IsSpellInRange(e.DeathCoil)) then
            t = 10
            return "death_coil aoe_generic 2"
        end

    end

    if e.Epidemic:IsReady() and not v and (i:BuffUp(e.SuddenDoomBuff) or not g) then
        if o(e.Epidemic, n.Unholy.GCDasOffGCD.Epidemic, nil, not a:IsInRange(30)) then
            t = 12
            return "epidemic aoe_generic 4"
        end

    end

    if u:IsReady() then
        if y.CastTargetIf(u, r, "max", z, X) then
            t = 7
            return "wound_spender aoe_generic 6"
        end

    end

    if e.FesteringStrike:IsReady() then
        if (a:DebuffStack(e.FesteringWoundDebuff) <= 3 and (e.Apocalypse:CooldownRemains() < 5 and p) or a:DebuffStack(e.FesteringWoundDebuff) < 1) then
            if o(e.FesteringStrike, nil, nil, not a:IsSpellInRange(e.FesteringStrike)) then
                t = 6
                return "festering_strike aoe_generic 8"
            end

        end

        if y.CastTargetIf(e.FesteringStrike, r, "max", z, ce) then
            t = 6
            return "festering_strike aoe_generic 8"
        end

    end

    if e.FesteringStrike:IsReady() then
        if (e.Apocalypse:CooldownRemains() > 5 or not p) and a:DebuffStack(e.FesteringWoundDebuff) < 1 then
            if o(e.FesteringStrike, nil, nil, not a:IsSpellInRange(e.FesteringStrike)) then
                t = 6
                return "festering_strike aoe_generic 10"
            end

        end

        if y.CastTargetIf(e.FesteringStrike, r, "min", z, fe) then
            t = 6
            return "festering_strike aoe_generic 10"
        end

    end

end

local function W()
    if s.PotionofSpectralStrength:IsReady() and f() and n.Commons.Enabled.Potions and oe and (((H or x and e.SummonGargoyle:TimeSinceLastCast() >= 9 or d.FilteredFightRemains(r, "<", 26)) and not c.GUISettings.General.HoldPotforBL) or (c.GUISettings.General.HoldPotforBL and i:BloodlustUp())) then
        if o(s.PotionofSpectralStrength, nil) then
            t = 9
            return "potion cooldowns 2"
        end

    end

    if e.ArmyoftheDead:IsReady() and C and not Y and not n.Unholy.DisableAotD and ((e.UnholyBlight:CooldownRemains() < 7 and k) and (e.DarkTransformation:CooldownRemains() < 7 and b) and e.UnholyBlight:IsAvailable() and ((e.Apocalypse:CooldownRemains() < 7 and p) and L or not L) or not e.UnholyBlight:IsAvailable() or d.FilteredFightRemains(r, "<", 35)) then
        if o(e.ArmyoftheDead, nil, nil) then
            t = 400
            return "army_of_the_dead cooldowns 4"
        end

    end

    if e.SoulReaper:IsReady() and (h <= 3) then
        if ((a:TimeToX(35) < 5 or a:HealthPercentage() < 35) and a:TimeToDie() > 5) then
            if o(e.SoulReaper, nil, nil, not a:IsSpellInRange(e.SoulReaper)) then
                t = 11
                return "soul_reaper cooldowns 5"
            end

        else
            if y.CastCycle(e.SoulReaper, r, V) then
                t = 11
                return "soul_reaper cooldowns 6"
            end

        end

    end

    if e.UnholyBlight:IsReady() and k and (T and ((e.Apocalypse:CooldownRemains() < 5 and p) or (e.Apocalypse:CooldownRemains() > 10 or not p)) and ((e.DarkTransformation:CooldownRemains() < i:GCD() and b) or E:BuffUp(e.DarkTransformation))) then
        if o(e.UnholyBlight, nil, nil, not a:IsInRange(8)) then
            t = 13
            return "unholy_blight cooldowns 8"
        end

    end

    if e.UnholyBlight:IsReady() and k and (h >= 2 or d.FilteredFightRemains(r, "<", 21)) then
        if o(e.UnholyBlight, nil, nil, not a:IsInRange(8)) then
            t = 13
            return "unholy_blight cooldowns 10"
        end

    end

    if e.DarkTransformation:IsCastable() and b and (T and (a:DebuffUp(e.UnholyBlightDebuff) or not e.UnholyBlight:IsAvailable())) then
        if o(e.DarkTransformation, n.Unholy.GCDasOffGCD.DarkTransformation) then
            t = 14
            return "dark_transformation cooldowns 12"
        end

    end

    if e.DarkTransformation:IsCastable() and b and ((h >= 2 and (a:DebuffUp(e.UnholyBlightDebuff) or not e.UnholyBlight:IsAvailable())) or d.FilteredFightRemains(r, "<", 21)) then
        if o(e.DarkTransformation, n.Unholy.GCDasOffGCD.DarkTransformation) then
            t = 14
            return "dark_transformation cooldowns 14"
        end

    end

    if e.Apocalypse:IsCastable() and p and e.Apocalypse:IsUsable() and ((h == 1 or not D()) and a:DebuffStack(e.FesteringWoundDebuff) >= 4 and (not L or L and ((e.UnholyBlight:CooldownRemains() > 10 or not k) or (e.DarkTransformation:CooldownRemains() > 10 or not b) and not e.UnholyBlight:IsAvailable()))) then
        if o(e.Apocalypse, nil, nil, not a:IsSpellInRange(e.Apocalypse)) then
            t = 15
            return "apocalypse cooldowns 16"
        end

    end

    if e.Apocalypse:IsCastable() and p and e.Apocalypse:IsUsable() then
        if (h >= 2 and a:DebuffStack(e.FesteringWoundDebuff) >= 4 and i:BuffDown(e.DeathAndDecayBuff)) then
            if o(e.Apocalypse, nil, nil, not a:IsSpellInRange(e.Apocalypse)) then
                t = 15
                return "apocalypse cooldowns 18"
            end

        end

        if y.CastTargetIf(e.Apocalypse, r, "max", z, ke, not a:IsSpellInRange(e.Apocalypse), n.Unholy.GCDasOffGCD.Apocalypse) then
            t = 15
            return "apocalypse cooldowns 18"
        end

    end

    if e.SummonGargoyle:IsCastable() and (i:RunicPowerDeficit() < 14 and (e.UnholyBlight:CooldownRemains() < 13 and k) and (e.DarkTransformation:CooldownRemains() < 13 and b)) then
        if o(e.SummonGargoyle, n.Unholy.GCDasOffGCD.SummonGargoyle, nil, not a:IsInRange(30)) then
            t = 16
            return "summon_gargoyle cooldowns 20"
        end

    end

    if e.UnholyAssault:IsCastable() and T and a:DebuffStack(e.FesteringWoundDebuff) < 2 and (F or E:BuffUp(e.DarkTransformation) and (e.Apocalypse:CooldownRemains() > 10 or not p)) then
        if o(e.UnholyAssault, n.Unholy.GCDasOffGCD.UnholyAssault) then
            t = 17
            return "unholy_assault cooldowns 22"
        end

    end

    if e.UnholyAssault:IsCastable() then
        if y.CastTargetIf(e.UnholyAssault, r, "min", z, ue) then
            t = 17
            return "unholy_assault cooldowns 24"
        end

    end

    if e.RaiseDead:IsCastable() then
        if n.Unholy.RaiseDeadCastLeft then
            if c.CastLeft(e.RaiseDead) then
                t = 1
                return "raise_dead cooldowns 26 left"
            end

        else
            if o(e.RaiseDead, nil, nil) then
                t = 1
                return "raise_dead cooldowns 26 displaystyle"
            end

        end

    end

    if e.SacrificialPact:IsReady() and not E:DebuffUp(P(111673)) and not se and K and (h >= 2 and E:BuffDown(e.DarkTransformation) and (e.DarkTransformation:CooldownRemains() > 5 or not b) or d.FilteredFightRemains(r, "<", i:GCD())) then
        if o(e.SacrificialPact, nil, nil, not a:IsInRange(8)) then
            t = 18
            return "sacrificial_pact cooldowns 28"
        end

    end

end

local function L()
    if e.SwarmingMist:IsReady() and j and (T and i:RunicPowerDeficit() > 16 and ((not e.Apocalypse:CooldownUp() or not p) or not e.ArmyoftheDamned:IsAvailable() and (not e.DarkTransformation:CooldownUp() or not b)) or d.FilteredFightRemains(r, "<", 11)) then
        if o(e.SwarmingMist, nil, nil, not a:IsInRange(10)) then
            t = 19
            return "swarming_mist covenants 2"
        end

    end

    if e.SwarmingMist:IsReady() and j and (not e.Apocalypse:CooldownUp() or not p) and (h >= 2 and h <= 5 and i:RunicPowerDeficit() > 10 + (h * 6) or h > 5 and i:RunicPowerDeficit() > 40) then
        if o(e.SwarmingMist, nil, nil, not a:IsInRange(10)) then
            t = 19
            return "swarming_mist covenants 4"
        end

    end

    if e.AbominationLimb:IsCastable() and j and (T and not e.LeadByExample:SoulbindEnabled() and (not e.Apocalypse:CooldownUp() or not p) or not e.ArmyoftheDamned:IsAvailable() and (not e.DarkTransformation:CooldownUp() or not b) and i:RuneTimeToX(4) > i:BuffRemains(e.RunicCorruptionBuff) or d.FilteredFightRemains(r, "<", 21)) then
        if o(e.AbominationLimb, nil, nil) then
            t = 20
            return "abomination_limb covenants 6"
        end

    end

    if e.AbominationLimb:IsCastable() and j and (T and e.LeadByExample:SoulbindEnabled() and (a:DebuffRemains(e.UnholyBlightDebuff) > 11 or not e.UnholyBlight:IsAvailable() and (not e.DarkTransformation:CooldownUp() or not b))) then
        if o(e.AbominationLimb, nil, nil) then
            t = 20
            return "abomination_limb covenants 8"
        end

    end

    if e.AbominationLimb:IsCastable() and j and (h >= 2 and i:RuneTimeToX(4) > i:BuffRemains(e.RunicCorruptionBuff)) then
        if o(e.AbominationLimb, nil, nil) then
            t = 20
            return "abomination_limb covenants 10"
        end

    end

    if (e.AbominationLimb:IsCastable() and j) then
        if o(e.AbominationLimb, nil, nil) then
            t = 20
            return "abomination_limb covenants 101"
        end

    end

    if e.ShackleTheUnworthy:IsCastable() and j and (T and ((e.Apocalypse:CooldownRemains() > 10 or not p) or not e.ArmyoftheDamned:IsAvailable() and (not e.DarkTransformation:CooldownUp() or not b)) or d.FilteredFightRemains(r, "<", 15)) then
        if o(e.ShackleTheUnworthy, nil, nil, not a:IsSpellInRange(e.ShackleTheUnworthy)) then
            t = 21
            return "shackle_the_unworthy covenants 12"
        end

    end

    if e.ShackleTheUnworthy:IsCastable() and j and (h >= 2 and (i:BuffUp(e.DeathAndDecayBuff) or A > 1 and _(S) <= 14)) then
        if o(e.ShackleTheUnworthy, nil, nil, not a:IsSpellInRange(e.ShackleTheUnworthy)) then
            t = 21
            return "shackle_the_unworthy covenants 14"
        end

    end

end

local function z()
    if e.ArcaneTorrent:IsCastable() and (i:RunicPowerDeficit() > 65 and (x or not e.SummonGargoyle:IsAvailable()) and i:Rune() <= 1) then
        if o(e.ArcaneTorrent, nil, nil, not a:IsInRange(8)) then
            t = 22
            return "arcane_torrent main 2"
        end

    end

    if e.BloodFury:IsCastable() and (H or x and (35 - e.Gargoyle:TimeSinceLastCast()) <= e.BloodFury:BaseDuration() or d.FilteredFightRemains(r, "<=", e.BloodFury:BaseDuration())) then
        if o(e.BloodFury, nil) then
            t = 23
            return "blood_fury main 4"
        end

    end

    if e.Berserking:IsCastable() and (H or x and (35 - e.Gargoyle:TimeSinceLastCast()) <= e.Berserking:BaseDuration() or d.FilteredFightRemains(r, "<=", e.Berserking:BaseDuration())) then
        if o(e.Berserking, nil) then
            t = 24
            return "berserking main 6"
        end

    end

    if e.LightsJudgment:IsCastable() and (i:BuffUp(e.UnholyStrengthBuff)) then
        if o(e.LightsJudgment, nil, nil, not a:IsSpellInRange(e.LightsJudgment)) then
            t = 25
            return "lights_judgment main 8"
        end

    end

    if e.AncestralCall:IsCastable() and (H or x and e.Gargoyle:TimeSinceLastCast() >= 20 or d.FilteredFightRemains(r, "<=", 15)) then
        if o(e.AncestralCall, nil) then
            t = 26
            return "ancestral_call main 10"
        end

    end

    if e.ArcanePulse:IsCastable() and (h >= 2 or (i:Rune() <= 1 and i:RunicPowerDeficit() >= 60)) then
        if o(e.ArcanePulse, nil, nil, not a:IsInRange(8)) then
            t = 27
            return "arcane_pulse main 12"
        end

    end

    if e.Fireblood:IsCastable() and (H or x and (35 - e.Gargoyle:TimeSinceLastCast()) <= e.Fireblood:BaseDuration() or d.FilteredFightRemains(r, "<=", e.Fireblood:BaseDuration())) then
        if o(e.Fireblood, nil) then
            t = 28
            return "fireblood main 14"
        end

    end

    if e.BagofTricks:IsCastable() and (h == 1 and (i:BuffUp(e.UnholyStrengthBuff) or d.FilteredFightRemains(r, "<", 5))) then
        if o(e.BagofTricks, nil, nil, not a:IsSpellInRange(e.BagofTricks)) then
            t = 29
            return "bag_of_tricks main 16"
        end

    end

end

local function V()
    if e.DeathCoil:IsReady() and not v and (not g and (i:BuffUp(e.SuddenDoomBuff) or i:RunicPowerDeficit() <= 13) or x and i:Rune() <= 3 or d.FilteredFightRemains(r, "<", 10) and a:DebuffDown(e.FesteringWoundDebuff)) then
        if o(e.DeathCoil, nil, nil, not a:IsSpellInRange(e.DeathCoil)) then
            t = 10
            return "death_coil generic 4"
        end

    end

    if m:IsReady() and not i:IsMoving() and ((e.Defile:IsAvailable() or i:Covenant() == "Night Fae" or Z) and (not I or d.FilteredFightRemains(r, "<", 5))) then
        if m == e.DeathsDue then
            if o(m, nil, nil) then
                t = 2
                return "any_dnd generic 6"
            end

        else
            if o(m, nil) then
                t = 2
                return "any_dnd generic 8"
            end

        end

    end

    if u:IsReady() and (VarMajorProcsActive and a:DebuffStack(e.FesteringWoundDebuff) >= 1 and (e.Apocalypse:CooldownRemains() > 5 or not p) and not I) then
        if o(u, nil, nil, not a:IsSpellInRange(u)) then
            t = 7
            return "wound_spender generic 10"
        end

    end

    if u:IsReady() and (a:DebuffStack(e.FesteringWoundDebuff) > 3 and not I or a:DebuffUp(e.FesteringWoundDebuff) and d.FilteredFightRemains(r, "<", (a:DebuffStack(e.FesteringWoundDebuff) * i:GCD()))) then
        if o(u, nil, nil, not a:IsSpellInRange(u)) then
            t = 7
            return "wound_spender generic 12"
        end

    end

    if e.DeathCoil:IsReady() and not v and (i:RunicPowerDeficit() <= 20 and not g) then
        if o(e.DeathCoil, nil, nil, not a:IsSpellInRange(e.DeathCoil)) then
            t = 10
            return "death_coil generic 14"
        end

    end

    if e.FesteringStrike:IsReady() and (a:DebuffStack(e.FesteringWoundDebuff) < 4 and not I) then
        if o(e.FesteringStrike, nil, nil, not a:IsInMeleeRange(5)) then
            t = 6
            return "festering_strike generic 16"
        end

    end

    if e.DeathCoil:IsReady() and not v and (not g) then
        if o(e.DeathCoil, nil, nil, not a:IsSpellInRange(e.DeathCoil)) then
            t = 10
            return "death_coil generic 18"
        end

    end

    if u:IsReady() and (a:DebuffStack(e.FesteringWoundDebuff) >= 1 and i:Rune() < 2 and not I and (e.Apocalypse:CooldownRemains() > 5 or not p)) then
        if o(u, nil, nil, not a:IsSpellInRange(u)) then
            t = 7
            return "wound_spender generic 20"
        end

    end

end

local function X()
    if s.InscrutableQuantumDevice:IsEquippedAndReady() and (((e.UnholyBlight:CooldownRemains() > 20 or not k) or (e.DarkTransformation:CooldownRemains() > 20 or not b)) and (h >= 2 or e.ArmyoftheDead:TimeSinceLastCast() <= 30 or F and (e.UnholyAssault:IsAvailable() or n.Unholy.DisableAotD) or x) or d.FilteredFightRemains(r, "<", 21) or a:TimeToX(20) < 5) then
        if o(s.InscrutableQuantumDevice, nil, nil) then
                        if s.InscrutableQuantumDevice:ID() == N and n.Commons.Enabled.TopTrinket == true then
                t = 30
                return "top trinket 1"
            elseif s.InscrutableQuantumDevice:ID() == O and n.Commons.Enabled.BottomTrinket then
                t = 31
                return "top trinket 2"
            end

        end

    end

    if s.GaveloftheFirstArbiter:IsEquippedAndReady() and a:IsInRange(30) and f() and not Q then
        if o(s.GaveloftheFirstArbiter, nil, nil, not a:IsInRange(30)) then
            t = 1515
            return "gavel_of_the_first_arbiter trinkets 4"
        end

    end

    if s.JotungeirrDestinysCall:IsEquippedAndReady() and f() and not Q then
        if o(s.JotungeirrDestinysCall, nil, nil, not a:IsInRange(30)) then
            t = 1515
            return "JotungeirrDestinysCall trinkets 4"
        end

    end

    if s.MacabreSheetMusic:IsEquippedAndReady() and (e.Apocalypse:CooldownRemains() < 5 and (not s.InscrutableQuantumDevice:IsEquipped() or s.InscrutableQuantumDevice:CooldownRemains() > 0) or d.FilteredFightRemains(r, "<", 21)) then
        if o(s.MacabreSheetMusic, nil, nil) then
                        if s.MacabreSheetMusic:ID() == N and n.Commons.Enabled.TopTrinket then
                t = 30
                return "top trinket 1"
            elseif s.MacabreSheetMusic:ID() == O and n.Commons.Enabled.BottomTrinket then
                t = 31
                return "top trinket 2"
            end

        end

    end

    if s.DreadfireVessel:IsEquippedAndReady() and (not e.Apocalypse:CooldownUp() and (not s.InscrutableQuantumDevice:IsEquipped() or s.InscrutableQuantumDevice:CooldownRemains() > 0) or d.FilteredFightRemains(r, "<", 3)) then
        if o(s.DreadfireVessel, nil, nil, not a:IsInRange(50)) then
                        if s.DreadfireVessel:ID() == N and n.Commons.Enabled.TopTrinket then
                t = 30
                return "top trinket 1"
            elseif s.DreadfireVessel:ID() == O and n.Commons.Enabled.BottomTrinket then
                t = 31
                return "top trinket 2"
            end

        end

    end

    if s.DarkmoonDeckVoracity:IsEquippedAndReady() and (not e.Apocalypse:CooldownUp() and (not s.InscrutableQuantumDevice:IsEquipped() or s.InscrutableQuantumDevice:CooldownRemains() > 0) or d.FilteredFightRemains(r, "<", 21)) then
        if o(s.DarkmoonDeckVoracity, nil, nil) then
                        if s.DarkmoonDeckVoracity:ID() == N and n.Commons.Enabled.TopTrinket then
                t = 30
                return "top trinket 1"
            elseif s.DarkmoonDeckVoracity:ID() == O and n.Commons.Enabled.BottomTrinket then
                t = 31
                return "top trinket 2"
            end

        end

    end

    if ((not e.Apocalypse:CooldownUp() or E:BuffUp(e.DarkTransformation)) and (not s.InscrutableQuantumDevice:IsEquipped() or s.InscrutableQuantumDevice:CooldownRemains() > 0)) then
        local e = i:GetUseableTrinkets(pe)
        if e then
            if o(e, nil, nil) then
                                if e:ID() == N and n.Commons.Enabled.TopTrinket then
                    t = 30
                    return "top trinket 1"
                elseif e:ID() == O and n.Commons.Enabled.BottomTrinket then
                    t = 31
                    return "top trinket 2"
                end

            end

        end

    end

end

local function _()
    ne = HeroRotationCharDB.Toggles[6]
    j = HeroRotationCharDB.Toggles[4]
    R = HeroRotationCharDB.Toggles[5]
    Y = HeroRotationCharDB.Toggles[10]
    se = HeroRotationCharDB.Toggles[11]
    q = HeroRotationCharDB.Toggles[12]
    B = HeroRotationCharDB.Toggles[13]
    M = HeroRotationCharDB.Toggles[14]
    oe = HeroRotationCharDB.Toggles[15]
    U = HeroRotationCharDB.Toggles[16]
    Q = HeroRotationCharDB.Toggles[17]
    v = false
    C = false
    b = false
    p = false
    k = false
    K = false
    if ((n.Unholy.IncludedCooldowns.ArmyoftheDead and f()) or (n.Unholy.IncludedSmallCooldowns.ArmyoftheDead and (f() or R)) or (not n.Unholy.IncludedSmallCooldowns.ArmyoftheDead and not n.Unholy.IncludedCooldowns.ArmyoftheDead)) then
        C = true
    end

    if ((n.Unholy.IncludedCooldowns.DarkTransformation and f()) or (n.Unholy.IncludedSmallCooldowns.DarkTransformation and (f() or R)) or (not n.Unholy.IncludedSmallCooldowns.DarkTransformation and not n.Unholy.IncludedCooldowns.DarkTransformation)) then
        b = true
    end

    if ((n.Unholy.IncludedCooldowns.Apocalypse and f()) or (n.Unholy.IncludedSmallCooldowns.Apocalypse and (f() or R)) or (not n.Unholy.IncludedSmallCooldowns.Apocalypse and not n.Unholy.IncludedCooldowns.Apocalypse)) then
        p = true
    end

    if ((n.Unholy.IncludedCooldowns.UnholyBlight and f()) or (n.Unholy.IncludedSmallCooldowns.UnholyBlight and (f() or R)) or (not n.Unholy.IncludedSmallCooldowns.UnholyBlight and not n.Unholy.IncludedCooldowns.UnholyBlight)) then
        k = true
    end

    if ((n.Unholy.IncludedCooldowns.SacrificialPact and f()) or (n.Unholy.IncludedSmallCooldowns.SacrificialPact and (f() or R)) or (not n.Unholy.IncludedSmallCooldowns.SacrificialPact and not n.Unholy.IncludedCooldowns.SacrificialPact)) then
        K = true
    end

end

local function p()
    ee = not ge()
    r = i:GetEnemiesInMeleeRange(8)
    S = a:GetEnemiesInSplashRange(10)
    N, te = GetInventoryItemID("player", 13)
    O, te = GetInventoryItemID("player", 14)
    if D() then
        h = #r
        A = #S
    else
        h = 1
        A = 1
    end

    G = ve(S)
    x = e.SummonGargoyle:TimeSinceLastCast() <= 35
    F = e.Apocalypse:TimeSinceLastCast() <= 15
    u = (e.ClawingShadows:IsAvailable() and e.ClawingShadows or e.ScourgeStrike)
    m = e.DeathAndDecay
    if i:CovenantID() == 3 then
        m = e.DeathsDue
    end

    if e.Defile:IsAvailable() then
        m = e.Defile
    end

    if not BotOn then
        l = 0
        t = 0
    end

    if l > 0 then
        l = 0
    end

    if t > 0 then
        t = 0
    end

    we = _()
        if c.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        ie = GetTime()
        J = ie + (c.GUISettings.General.OpenerReset)
    elseif c.GUISettings.General.OpenerReset > 0 and J ~= nil and GetTime() > J and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        c.ToggleIconFrame:UpdateButtonText(6)
        c.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (B and e.AntiMagicZone:IsUsableP() and i:AffectingCombat() and e.AntiMagicZone:CooldownRemains(BypassRecovery) <= 0) then
        if o(e.AntiMagicZone, nil, nil, nil) then
            t = 38
            return "queue AMZ"
        end

    elseif ((not e.AntiMagicZone:IsUsableP() or e.AntiMagicZone:CooldownRemains() > 0 or not i:AffectingCombat()) and B) then
        HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13]
        c.Print("Anti-Magic Zone Queue is now " .. (HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (M and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and y.TargetIsValid() and w("mouseover"):GUID() ~= nil) then
        if o(e.DeathGrip, nil, nil, nil) then
            l = 72
            return "queue DeathGrip MO"
        end

    elseif (M and e.DeathGrip:IsUsableP() and e.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and y.TargetIsValid()) then
        if o(e.DeathGrip, nil, nil, nil) then
            t = 39
            return "queue DeathGrip"
        end

    elseif ((not e.DeathGrip:IsUsableP() or e.DeathGrip:CooldownRemains() > 0 or not y.TargetIsValid()) and M) then
        HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14]
        c.Print("Death Grip Queue is now " .. (HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

            if (U and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and w("mouseover"):GUID() ~= nil) then
        if o(e.Asphyxiate, nil, nil, nil) then
            l = 471
            return "queue Asphyxiate MO"
        end

    elseif (U and e.Asphyxiate:IsUsableP() and e.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and y.TargetIsValid()) then
        if o(e.Asphyxiate, nil, nil, nil) then
            t = 47
            return "queue Asphyxiate"
        end

    elseif ((not e.Asphyxiate:IsUsableP() or e.Asphyxiate:CooldownRemains() > 0) and U) then
        HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16]
        c.Print("Asphyxiate Queue is now " .. (HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if i:IsChanneling(P(324631)) then
        if o(e.PoolResources, nil, nil, nil) then
            l = 36
            return "Raise Ally MO"
        end

    end

    if e.RaiseDead:IsCastable() then
        if n.Unholy.RaiseDeadCastLeft then
            if c.CastLeft(e.RaiseDead) then
                t = 1
                return "raise_dead precombat 2 left"
            end

        else
            if o(e.RaiseDead, nil, nil) then
                t = 1
                return "raise_dead precombat 2 displaystyle"
            end

        end

    end

    if y.TargetIsValid() then
        if not i:AffectingCombat() and ne then
            ye = false
            local e = le()
            if e then
                return e
            end

        end

    end

    if y.TargetIsValid() and i:AffectingCombat() then
        if (not UnitIsEnemy("player", "mouseover") and UnitIsDead("mouseover")) then
                        if e.RaiseAlly:IsCastable() and (i:RunicPower() >= 30) then
                if o(e.RaiseAlly, nil) then
                    l = 73
                    return "RaiseAlly MO"
                end

            elseif e.RaiseAlly:CooldownRemains(BypassRecovery) <= 0 and (i:RunicPower() < 30) then
                v = true
            end

        end

        if (n.Commons.UseDefensives) then
            if i:HealthPercentage() < n.Commons.HealthstoneHP and s.Healthstone:IsReady() and s.Healthstone:CooldownRemains() <= 0 then
                if o(s.Healthstone, nil) then
                    t = 40
                    return "Healthstone HP"
                end

            end

            if i:HealthPercentage() < n.Commons.HealPotHP and s.CosmicHealPot:IsReady() and s.CosmicHealPot:CooldownRemains() <= 0 then
                if o(s.CosmicHealPot, nil) then
                    t = 45
                    return "CosmicHealPot HP"
                end

            end

            if i:HealthPercentage() < n.Commons.HealPotHP and s.HealPot:IsReady() and s.HealPot:CooldownRemains() <= 0 then
                if o(s.HealPot, nil) then
                    t = 41
                    return "HealPot HP"
                end

            end

            if i:HealthPercentage() < n.Commons.UseDarkSuccorHP and e.DeathStrike:IsReady() and i:BuffUp(e.DeathStrikeBuff) then
                if o(e.DeathStrike) then
                    t = 42
                    return "DeathStrike Dark Succor HP"
                end

            end

            if i:HealthPercentage() < n.Commons.UseDeathStrikeHP and e.DeathStrike:IsReady() then
                if o(e.DeathStrike) then
                    t = 42
                    return "DeathStrike HP"
                end

            end

            if i:HealthPercentage() < n.Commons.IceboundFortitudeHP and e.IceboundFortitude:IsReady() then
                if o(e.IceboundFortitude) then
                    t = 43
                    return "Icebound Fortitude HP"
                end

            end

            if i:HealthPercentage() < n.Commons.LichborneHP and e.Lichborne:IsReady() then
                if o(e.Lichborne) then
                    t = 44
                    return "Lichborne HP"
                end

            end

            if i:HealthPercentage() < n.Commons.AntiMagicShellHP and e.AntiMagicShell:IsReady() then
                if o(e.AntiMagicShell) then
                    t = 45
                    return "Anti-Magic Shell HP"
                end

            end

            if i:HealthPercentage() < n.Commons.DeathPactHP and e.DeathPact:IsReady() then
                if o(e.DeathPact) then
                    t = 46
                    return "Death Pact HP"
                end

            end

        end

        local s = y.Interrupt(15, e.MindFreeze, nil, me)
        if s then
            return s
        end

        if e.DeathStrike:IsReady() and not ee then
            if o(e.DeathStrike) then
                t = 35
                return "death_strike low hp or proc"
            end

        end

        g = (e.SummonGargoyle:IsAvailable() and e.SummonGargoyle:CooldownRemains() < 5 and (e.UnholyBlight:IsAvailable() and (e.UnholyBlight:CooldownRemains() < 13 and k) and (e.DarkTransformation:CooldownRemains() < 13 and b) or not e.UnholyBlight:IsAvailable()))
        I = (e.SoulReaper:IsAvailable() and i:Rune() < 2 and a:TimeToX(35) < 5 and d.FilteredFightRemains(r, ">", 5))
        T = (h == 1 or not D())
        H = ((e.SummonGargoyle:IsAvailable() and not x and not e.SummonGargoyle:CooldownUp() or not e.SummonGargoyle:IsAvailable()) and (i:BuffUp(e.UnholyAssault) or e.ArmyoftheDamned:IsAvailable() and F or i:BuffUp(e.DarkTransformation)))
        VarMajorProcsActive = (i:Covenant() == "Night Fae" and i:BuffUp(e.DeathAndDecayBuff) and i:BuffStack(e.DeathsDueBuff) < 4 or i:BuffUp(e.MarrowedGemstoneEnhancement) or i:BuffUp(e.ThrillSeeker) or i:BuffUp(e.FrenziedMonstrosity) or i:BuffUp(e.LeadByExample))
        if e.Outbreak:IsReady() and (G > 0 and h == 0) then
            if o(e.Outbreak, nil, nil, not a:IsSpellInRange(e.Outbreak)) then
                t = 8
                return "outbreak out_of_range"
            end

        end

        if e.Epidemic:IsReady() and D() and not v and e.VirulentPlagueDebuff:AuraActiveCount() > 1 and (not g and h == 0) then
            if o(e.Epidemic, nil, nil, not a:IsInRange(30)) then
                t = 12
                return "epidemic out_of_range"
            end

        end

        if e.DeathCoil:IsReady() and not v and e.VirulentPlagueDebuff:AuraActiveCount() < 2 and (not g and h == 0) then
            if o(e.DeathCoil, nil, nil, not a:IsSpellInRange(e.DeathCoil)) then
                t = 10
                return "death_coil out_of_range"
            end

        end

        if e.Outbreak:IsReady() and (a:DebuffRefreshable(e.VirulentPlagueDebuff) and ((not e.UnholyBlight:IsAvailable() or e.UnholyBlight:IsAvailable() and not e.UnholyBlight:CooldownUp()) or not k)) then
            if o(e.Outbreak, nil, nil, not a:IsSpellInRange(e.Outbreak)) then
                t = 8
                return "outbreak main 18"
            end

        end

        if e.Outbreak:IsReady() and ((a:DebuffRefreshable(e.VirulentPlagueDebuff) or G > 0) and h >= 2 and ((not e.UnholyBlight:IsAvailable() or e.UnholyBlight:IsAvailable() and not e.UnholyBlight:CooldownUp()) or not k)) then
            if o(e.Outbreak, nil, nil, not a:IsSpellInRange(e.Outbreak)) then
                t = 8
                return "outbreak main 20"
            end

        end

        if e.Outbreak:IsReady() and (ae and (a:DebuffRefreshable(e.FrostFeverDebuff) or a:DebuffRefreshable(e.BloodPlagueDebuff))) then
            if o(e.Outbreak, nil, nil, not a:IsSpellInRange(e.Outbreak)) then
                t = 8
                return "outbreak main 22"
            end

        end

        if u:IsReady() and (i:Covenant() == "Night Fae" and i:BuffRemains(e.DeathAndDecayBuff) < (i:GCD() * 1.5) and i:BuffUp(e.DeathAndDecayBuff)) then
            if o(u, nil, nil, not a:IsSpellInRange(u)) then
                t = 7
                return "wound_spender main 24"
            end

        end

        if e.DeathsDue:IsReady() and a:IsInMeleeRange(10) and j and e.DeathsDue:CooldownRemains() < i:GCD() and h == 1 then
            if o(e.DeathsDue, nil, nil) then
                t = 2
                return "deaths_due covenants 2"
            end

        end

        if ((n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and f()) then
            local e = X()
            if e then
                return e
            end

        end

        if (true) then
            local e = L()
            if e then
                return e
            end

        end

        if (f()) then
            local e = z()
            if e then
                return e
            end

        end

        if (f() or not f()) then
            local e = W()
            if e then
                return e
            end

        end

        if (D()) then
            if (h >= 2 and m:CooldownRemains() < 10 and i:BuffDown(e.DeathAndDecayBuff)) then
                local e = re()
                if e then
                    return e
                end

            end

            if (h >= 2 and i:BuffUp(e.DeathAndDecayBuff)) then
                local e = de()
                if e then
                    return e
                end

            end

            if (h >= 2 and i:BuffDown(e.DeathAndDecayBuff)) then
                local e = he()
                if e then
                    return e
                end

            end

        end

        if (h == 1) then
            local e = V()
            if e then
                return e
            end

        end

        if e.ClawingShadows:IsReady() and e.ClawingShadows:IsAvailable() and a:IsInMeleeRange(30) and not a:IsInMeleeRange(10) and a:DebuffUp(e.FesteringWoundDebuff) then
            if o(u, nil, nil, not a:IsSpellInRange(u)) then
                t = 7
                return "wound_spender main 99"
            end

        end

        if (true) then
            if o(e.PoolResources) then
                t = 36
                return "pool_resources"
            end

        end

    end

end

local function a()
    e.VirulentPlagueDebuff:RegisterAuraTracking()
    e.FesteringWoundDebuff:RegisterAuraTracking()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        c.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpell()
    if t == 0 then
        return 0
    else
        return t
    end

end

function ReturnSpellMO()
    if l == 0 then
        return 0
    else
        return l
    end

end

c.SetAPL(252, p, a)

