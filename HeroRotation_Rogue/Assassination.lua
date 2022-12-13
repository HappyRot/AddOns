local e, e = ...
local e = HeroDBC.DBC
local u = HeroLib
local e = HeroCache
local E = u.Unit
local a = E.Player
local t = E.Target
local l = u.Spell
local e = u.MultiSpell
local g = u.Item
local e = u.Utils.num
local w = u.Utils.BoolToInt
local e = u.Utils.IntToBool
local oe = u.Utils.ValueIsInArray
local h = HeroRotation
local ye = h.AoEON
local q = h.CDsON
local n = h.Cast
local z = h.CastPooling
local R = h.CastLeftNameplate
local pe = HeroRotationCharDB.Toggles[4]
local se = HeroRotationCharDB.Toggles[5]
local Z = HeroRotationCharDB.Toggles[6]
local O = HeroRotationCharDB.Toggles[12]
local Q = not HeroRotationCharDB.Toggles[15]
local ge = HeroRotationCharDB.Toggles[20]
local K = HeroRotationCharDB.Toggles[21]
local qe = HeroRotationCharDB.Toggles[22]
local xe = HeroRotationCharDB.Toggles[23]
local je = HeroRotationCharDB.Toggles[24]
local be = HeroRotationCharDB.Toggles[25]
local ke = HeroRotationCharDB.Toggles[26]
local ve = HeroRotationCharDB.Toggles[27]
local fe = HeroRotationCharDB.Toggles[28]
local me = HeroRotationCharDB.Toggles[29]
local ce = HeroRotationCharDB.Toggles[30]
local we = HeroRotationCharDB.Toggles[54]
local _ = pairs
local ee = math.floor
local e = math.max
local I = h.Commons.Everyone
local r = h.Commons.Rogue
local i = { General = h.GUISettings.General, Commons = h.GUISettings.APL.Rogue.Commons, Assassination = h.GUISettings.APL.Rogue.Assassination }
local e = l.Rogue.Assassination
local U = g.Rogue.Assassination
local X = {  }
local V, P, f, k
local W, j, d, T
local s
local G, B = 2 * a:SpellHaste(), 1 * a:SpellHaste()
local m, N
local ie, te, Y, M, D, C, F
local H
local ae, x, ze, S, A
local b = 0
local o = r.ReturnSpell()
local c = r.ReturnSpellMO()
local v = a:GetEquipment()
local y = a:CovenantID()
local y, p, y, y = (y == 1), (y == 2), (y == 3), (y == 4)
local y = a:HasLegendaryEquipped(118)
local y = a:HasLegendaryEquipped(129)
local y = a:HasLegendaryEquipped(119)
local y = a:HasLegendaryEquipped(121)
local L = a:HasLegendaryEquipped(117)
local p = a:HasLegendaryEquipped(229) or (a:HasUnity() and p)
local y = y and .55 or 1.
local y = p and .56 or 1.
local y, y = a:HasTier(28, 2), a:HasTier(28, 4)
local y = v[13] and g(v[13]) or g(0)
local p = v[14] and g(v[14]) or g(0)
local function L()
        if y:TrinketHasStatAnyDps() and (not p:TrinketHasStatAnyDps() or y:Cooldown() >= p:Cooldown()) then
        b = 1
    elseif p:TrinketHasStatAnyDps() and (not y:TrinketHasStatAnyDps() or p:Cooldown() > y:Cooldown()) then
        b = 2
    else
        b = 0
    end

end

L()
u:RegisterForEvent(function()
    v = a:GetEquipment()
    y = v[13] and g(v[13]) or g(0)
    p = v[14] and g(v[14]) or g(0)
    L()
end, "PLAYER_EQUIPMENT_CHANGED")
local function v(t)
    if t then
        return 1
    else
        return 0
    end

end

e.Envenom:RegisterDamageFormula(function()
    return a:AttackPowerDamageMod() * m * .22 * 1. * (t:DebuffUp(e.ShivDebuff) and 1.3 or 1) * (e.DeeperStratagem:IsAvailable() and 1.05 or 1) * (1 + a:MasteryPct() / 100) * (1 + a:VersatilityDmgPct() / 100)
end)
e.Mutilate:RegisterDamageFormula(function()
    return (a:AttackPowerDamageMod() + a:AttackPowerDamageMod(true)) * .485 * 1. * (1 + a:VersatilityDmgPct() / 100)
end)
local function L()
    if a:BuffRemains(e.MasterAssassinBuff) == 9999 then
        return a:GCDRemains() + 3
    end

    return a:BuffRemains(e.MasterAssassinBuff)
end

local function g()
    if a:BuffUp(e.ImprovedGarroteAura) then
        return a:GCDRemains() + 3
    end

    return a:BuffRemains(e.ImprovedGarroteBuff)
end

local function v()
    return e.ImprovedGarrote:IsAvailable() and g() > 0 and 1.5 or 1
end

e.Garrote:RegisterPMultiplier(v)
e.Rupture:RegisterPMultiplier(v)
local function _e()
                if d < 2 then
        return false
    elseif i.Commons.UsePriorityRotation == "Always" then
        return true
    elseif i.Commons.UsePriorityRotation == "On Bosses" and t:IsInBossList() then
        return true
    elseif i.Commons.UsePriorityRotation == "Auto" then
        if a:InstanceDifficulty() == 16 and t:NPCID() == 138967 then
            return true
        end

    end

    return false
end

local function v(a, e, t)
    local t = t or e:PandemicThreshold()
    return a:DebuffRefreshable(e, t)
end

local function J(a, h, r, d)
    local e, n = nil, r
    local s = t:GUID()
    for o, t in _(d) do
        if t:GUID() ~= s and I.UnitIsCycleValid(t, n, -t:DebuffRemains(a)) and h(t) then
            e, n = t, t:TimeToDie()
        end

    end

        if e then
                        if e:GUID() == E("mouseover"):GUID() and i.Assassination.TargetSwap == "Mouseover" then
                        if a:ID() == 703 then
                c = 1703
            elseif a:ID() == 1943 then
                c = 11943
            end

        elseif i.Assassination.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not O then
            c = 9999
        elseif e:GUID() == t:GUID() then
            o = a:ID()
        end

        R(e, a)
    elseif i.Commons.RangedMultiDoT then
        e, n = nil, r
        for o, t in _(j) do
            if t:GUID() ~= s and I.UnitIsCycleValid(t, n, -t:DebuffRemains(a)) and h(t) then
                e, n = t, t:TimeToDie()
            end

        end

        if e then
                                    if e:GUID() == E("mouseover"):GUID() and i.Assassination.TargetSwap == "Mouseover" then
                                if a:ID() == 703 then
                    c = 1703
                elseif a:ID() == 1943 then
                    c = 11943
                end

            elseif i.Assassination.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not O then
                c = 9999
            elseif e:GUID() == t:GUID() then
                o = a:ID()
            end

            R(e, a)
        end

    end

end

local function le(n, h, r)
    local s = h(t)
    if n == "first" and s ~= 0 then
        return t
    end

    local e, a = nil, 0
    local function d(t)
        for t, o in _(t) do
            local t = h(o)
                                    if not e and n == "first" then
                if t ~= 0 then
                    e, a = o, t
                end

            elseif n == "min" then
                if not e or t < a then
                    e, a = o, t
                end

            elseif n == "max" then
                if not e or t > a then
                    e, a = o, t
                end

            end

            if e and t == a and o:TimeToDie() > e:TimeToDie() then
                e, a = o, t
            end

        end

    end

    d(T)
    if i.Commons.RangedMultiDoT then
        d(j)
    end

    if e and a == s and r(t) then
        return t
    end

    if e and r(e) then
        return e
    end

    return nil
end

local function ne()
    return e.ResoundingClarity:IsAvailable() and 7 or r.CPMaxSpend()
end

local function he(o, i, a)
    local e = t:TimeToDie()
        if not u.BossFightRemainsIsNotValid() then
        e = u.BossFightRemains()
    elseif e < a then
        return false
    end

    if ee((e - a) / o) > ee((e - a - i) / o) then
        return true
    end

    return false
end

local function ee(t)
    if t:DebuffUp(e.SerratedBoneSpikeDebuff) then
        return 1000000
    end

    return t:TimeToDie()
end

local function re(a)
                if ((not a:DebuffUp(e.SerratedBoneSpikeDebuff) and a:IsInMeleeRange(10)) and a:GUID() == E("mouseover"):GUID() and i.Assassination.TargetSwap == "Mouseover") then
        c = 1328547
        return true
    elseif ((not a:DebuffUp(e.SerratedBoneSpikeDebuff) and a:IsInMeleeRange(10)) and i.Assassination.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not O) then
        c = 9999
        return true
    elseif ((not a:DebuffUp(e.SerratedBoneSpikeDebuff) and a:IsInMeleeRange(10)) and a:GUID() == t:GUID()) then
        o = 328547
        return true
    elseif (not a:DebuffUp(e.SerratedBoneSpikeDebuff) and a:IsInMeleeRange(10)) then
        return true
    end

end

local function de()
    if e.BloodFury:IsReady() and q() and i.Commons.Enabled.Racials then
        if h.Cast(e.BloodFury, nil) then
            o = 20572
            return "Cast Blood Fury"
        end

    end

    if e.Berserking:IsReady() and q() and i.Commons.Enabled.Racials then
        if h.Cast(e.Berserking, nil) then
            o = 26297
            return "Cast Berserking"
        end

    end

    if e.Fireblood:IsReady() and q() and i.Commons.Enabled.Racials then
        if h.Cast(e.Fireblood, nil) then
            o = 265221
            return "Cast Fireblood"
        end

    end

    if e.AncestralCall:IsReady() and q() and i.Commons.Enabled.Racials then
        if h.Cast(e.AncestralCall, nil) then
            o = 274738
            return "Cast Ancestral Call"
        end

    end

end

local function he()
    if e.Vanish:IsCastable() and q() and not K and t:IsInMeleeRange(10) and not a:IsTanking(t) then
        if e.ImprovedGarrote:IsAvailable() and e.Garrote:CooldownUp() and not r.Exsanguinated(t, e.Garrote) and t:PMultiplier(e.Garrote) <= 1 then
            if (e.Deathmark:AnyDebuffUp() or e.Deathmark:CooldownRemains() < 4) and N >= math.min(d, 4) then
                if i.Commons.ShowPooling and a:EnergyPredicted() < 45 then
                    if n(e.PoolEnergy) then
                        o = 999999
                        return "Pool for Vanish (Garrote Deathmark)"
                    end

                end

                if n(e.Vanish, nil) then
                    o = 1856
                    return "Cast Vanish (Garrote Deathmark)"
                end

            end

            if d > (3 - w(e.IndiscriminateCarnage:IsAvailable())) and (not e.IndiscriminateCarnage:IsAvailable() or e.IndiscriminateCarnage:CooldownUp()) then
                if i.Commons.ShowPooling and a:EnergyPredicted() < 45 then
                    if n(e.PoolEnergy) then
                        o = 999999
                        return "Pool for Vanish (Garrote)"
                    end

                end

                if n(e.Vanish, nil) then
                    o = 1856
                    return "Cast Vanish (Garrote)"
                end

            end

        end

        if not e.ImprovedGarrote:IsAvailable() and e.MasterAssassin:IsAvailable() and not v(t, e.Rupture) and t:DebuffRemains(e.Garrote) > 3 and t:DebuffUp(e.Deathmark) and (t:DebuffUp(e.ShivDebuff) or t:DebuffRemains(e.Deathmark) < 4 or t:DebuffUp(e.Sepsis)) and t:DebuffRemains(e.Sepsis) < 3 then
            if n(e.Vanish, nil) then
                o = 1856
                return "Cast Vanish (Master Assassin)"
            end

        end

    end

    if e.ShadowDance:IsCastable() and t:IsInMeleeRange(10) then
        if e.ImprovedGarrote:IsAvailable() and e.Garrote:CooldownUp() and not r.Exsanguinated(t, e.Garrote) and t:PMultiplier(e.Garrote) <= 1 and (e.Deathmark:AnyDebuffUp() or e.Deathmark:CooldownRemains() < 4 or e.Deathmark:CooldownRemains() > 60) and N >= math.min(d, 4) then
            if n(e.ShadowDance, nil) then
                o = 185313
                return "Cast Shadow Dance (Garrote)"
            end

        end

        if not e.ImprovedGarrote:IsAvailable() and e.MasterAssassin:IsAvailable() and not v(t, e.Rupture) and t:DebuffRemains(e.Garrote) > 3 and (t:DebuffUp(e.Deathmark) or e.Deathmark:CooldownRemains() > 60) and (t:DebuffUp(e.ShivDebuff) or t:DebuffRemains(e.Deathmark) < 4 or t:DebuffUp(e.Sepsis)) and t:DebuffRemains(e.Sepsis) < 3 then
            if n(e.ShadowDance, nil) then
                o = 185313
                return "Cast Shadow Dance (Master Assassin)"
            end

        end

    end

end

local function ue()
    if e.MarkedforDeath:IsCastable() and t:IsInMeleeRange(10) then
        if t:FilteredTimeToDie("<", a:ComboPointsDeficit() * 1.5) then
            if n(e.MarkedforDeath, nil) then
                o = 137619
                return "Cast Marked for Death"
            end

        end

        if h.CDsON() then
            if n(e.MarkedforDeath, nil) then
                o = 137619
                return "Cast Marked for Death"
            end

        end

    end

    if not k or not h.CDsON() then
        return 
    end

    if not a:StealthUp(true, false) then
        if e.Sepsis:IsReady() and t:DebuffUp(e.Garrote) and (t:FilteredTimeToDie(">", 10) or u.BossFilteredFightRemains("<=", 10)) then
            if n(e.Sepsis, nil, nil) then
                o = 328305
                return "Cast Sepsis"
            end

        end

                if y:IsReady() and not oe(X, y:ID()) and (b == 1 and (e.Deathmark:AnyDebuffUp() or u.BossFilteredFightRemains("<", 20)) or (b == 2 and (not p:IsReady() or e.Deathmark:CooldownRemains() > 20)) or b == 0) then
                        if y:ID() == TopTrinketID and i.Commons.Enabled.TopTrinket then
                o = 24
                return "Generic use_items for " .. y:Name()
            elseif y:ID() == BotTrinketID and i.Commons.Enabled.BottomTrinket then
                o = 25
                return "Generic use_items for " .. y:Name()
            end

        elseif p:IsReady() and not oe(X, p:ID()) and (b == 2 and (e.Deathmark:AnyDebuffUp() or u.BossFilteredFightRemains("<", 20)) or (b == 1 and (not y:IsReady() or e.Deathmark:CooldownRemains() > 20)) or b == 0) then
                        if p:ID() == TopTrinketID and i.Commons.Enabled.TopTrinket then
                o = 24
                return "Generic use_items for " .. p:Name()
            elseif p:ID() == BotTrinketID and i.Commons.Enabled.BottomTrinket then
                o = 25
                return "Generic use_items for " .. p:Name()
            end

        end

        if e.Deathmark:IsCastable() then
            if t:DebuffUp(e.Rupture) and not e.Deathmark:AnyDebuffUp() and (not e.Exsanguinate:IsAvailable() or e.Exsanguinate:CooldownRemains() > 15 or r.Exsanguinated(t, e.Rupture) or r.Exsanguinated(t, e.Garrote)) and (not e.MasterAssassin:IsAvailable() or t:DebuffUp(e.Garrote)) then
                if n(e.Deathmark, nil) then
                    o = 360194
                    return "Cast Deathmark"
                end

            end

        end

        if e.Kingsbane:IsReady() and (t:DebuffUp(e.ShivDebuff) or e.Shiv:CooldownRemains() < 6) and a:BuffUp(e.Envenom) and (e.Deathmark:CooldownRemains() >= 50 or t:DebuffUp(e.Deathmark)) then
            if n(e.Kingsbane, nil) then
                o = 385627
                s = "Cast Kingsbane"
            end

        end

        if e.Exsanguinate:IsAvailable() then
                        if g() == 0 and t:DebuffDown(e.Deathmark) and t:FilteredTimeToDie(">", e.Exsanguinate:CooldownRemains() + 4) then
                if e.ResoundingClarity:IsAvailable() and e.EchoingReprimand:IsReady() and a:ComboPoints() <= 2 and e.Exsanguinate:CooldownRemains() <= 2 and not v(t, e.Garrote) and t:DebuffRemains(e.Rupture) > 9.6 then
                    if n(e.EchoingReprimand, nil, nil, not f) then
                        o = 323547
                        return "Cast Echoing Reprimand (Exsang Sync)"
                    end

                end

                if e.Exsanguinate:IsReady() and not v(t, e.Garrote) and t:DebuffRemains(e.Rupture) > 4 + 4 * ne() or t:FilteredTimeToDie("<", t:DebuffRemains(e.Rupture) * .5) then
                    if n(e.Exsanguinate, nil) then
                        o = 200806
                        s = "Cast Exsanguinate"
                    end

                end

            elseif e.ResoundingClarity:IsAvailable() and e.EchoingReprimand:IsReady() and e.Exsanguinate:CooldownRemains() > 40 then
                if n(e.EchoingReprimand, nil, nil, not f) then
                    o = 323547
                    return "Cast Echoing Reprimand (Exsang Desync)"
                end

            end

        end

    end

    if e.Shiv:IsCastable() and not t:DebuffUp(e.ShivDebuff) and t:DebuffUp(e.Garrote) and t:DebuffUp(e.Rupture) then
                if e.Kingsbane:IsAvailable() then
            if t:DebuffUp(e.Kingsbane) and (not e.CrimsonTempest:IsAvailable() or A or t:DebuffUp(e.CrimsonTempest)) then
                if n(e.Shiv, nil) then
                    o = 5938
                    s = "Cast Shiv (Kingsbane)"
                end

            end

        elseif e.Sepsis:IsAvailable() then
            if (w(e.Sepsis:CooldownUp() or e.Sepsis:CooldownRemains() > 12) + w(e.Deathmark:CooldownUp() or e.Deathmark:CooldownRemains() > 12) == 2) then
                if n(e.Shiv, nil) then
                    o = 5938
                    s = "Cast Shiv (Sepsis)"
                end

            end

        else
            if (not e.CrimsonTempest:IsAvailable() or A or t:DebuffUp(e.CrimsonTempest)) then
                if n(e.Shiv, nil) then
                    o = 5938
                    s = "Cast Shiv"
                end

            end

        end

    end

    if e.ThistleTea:IsCastable() and not a:BuffUp(e.ThistleTea) and (a:EnergyDeficit() >= 100 + x or e.ThistleTea:Charges() == 3 and (t:DebuffUp(e.Kingsbane) or e.Deathmark:AnyDebuffUp()) or u.BossFilteredFightRemains("<", e.ThistleTea:Charges() * 6)) then
        if h.Cast(e.ThistleTea, nil) then
            o = 381623
            return "Cast Thistle Tea"
        end

    end

    if e.IndiscriminateCarnage:IsReady() and d > 1 and (not e.ImprovedGarrote:IsAvailable() or e.Vanish:CooldownRemains() > 45) then
        if n(e.IndiscriminateCarnage, nil) then
            o = 381802
            return "Cast Indiscriminate Carnage"
        end

    end

    if i.Commons.Enabled.Potions and q() and Q and (((a:BloodlustUp() or u.BossFightRemains() <= 30 or (t:DebuffUp(e.Deathmark))) and not h.GUISettings.General.HoldPotforBL) or (h.GUISettings.General.HoldPotforBL and a:BloodlustUp())) then
        local e = I.PotionSelected()
        if e and e:IsReady() then
            if n(e, nil, nil) then
                o = 37
                return "potion cooldowns 2"
            end

        end

    end

    if e.Deathmark:AnyDebuffUp() then
        if s then
            de()
        else
            s = de()
        end

    end

    if not a:StealthUp(true, true) and g() <= 0 and L() <= 0 then
        if s then
            he()
        else
            s = he()
        end

    end

    return s
end

local function y()
    if e.IndiscriminateCarnage:IsReady() and se and t:IsInMeleeRange(10) and d > 1 then
        if n(e.IndiscriminateCarnage, i.Assassination.OffGCDasOffGCD.IndiscriminateCarnage) then
            o = 381802
            return "Cast Indiscriminate Carnage"
        end

    end

    if e.Garrote:IsCastable() and t:IsInMeleeRange(10) and g() > 0 then
        local function s(t)
            return t:DebuffRemains(e.Garrote)
        end

        local function n(a)
            if (not r.WillLoseExsanguinate(a, e.Garrote) and (a:PMultiplier(e.Garrote) <= 1 or a:DebuffRemains(e.Garrote) < (12 / r.ExsanguinatedRate(a, e.Garrote))) and (a:FilteredTimeToDie(">", 2, -a:DebuffRemains(e.Garrote)) or a:TimeToDieIsNotValid()) and r.CanDoTUnit(a, M)) then
                                                if a:GUID() == E("mouseover"):GUID() and i.Assassination.TargetSwap == "Mouseover" then
                    c = 1703
                    return true
                elseif i.Assassination.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not O then
                    c = 9999
                    return true
                elseif a:GUID() == t:GUID() then
                    o = 703
                    return true
                else
                    return true
                end

            end

        end

        local a = le("min", s, n)
        if a and a:GUID() ~= t:GUID() then
            R(a, e.Garrote)
        end

        if n(t) then
            if z(e.Garrote, nil, not f) then
                o = 703
                return "Cast Garrote (Improved Garrote)"
            end

        end

        if e.Exsanguinate:IsAvailable() and d == 1 and g() < 1.3 then
            if z(e.Garrote, nil, not f) then
                o = 703
                return "Pool for Garrote (Exsanguinate Refresh)"
            end

        end

    end

end

local function p()
    local s, l, i = false, false, false
    if H then
        s = d > 3 and (t:DebuffRemains(e.Garrote) < 6 or S)
        l = (t:DebuffUp(e.ShivDebuff) and d > 2) or S
    end

    if h.CDsON() and t:IsInMeleeRange(10) and e.Exsanguinate:IsAvailable() and e.Exsanguinate:CooldownRemains() < 2 then
        if e.Garrote:IsCastable() and f and d == 1 and not r.WillLoseExsanguinate(t, e.Garrote) and t:PMultiplier(e.Garrote) <= 1 and t:FilteredTimeToDie(">", t:DebuffRemains(e.Garrote) * .5) then
            if z(e.Garrote) then
                o = 703
                return "Cast Garrote (Pre-Exsanguinate)"
            end

        end

        if e.Rupture:IsReady() and f and t:PMultiplier(e.Rupture) <= 1 and not r.WillLoseExsanguinate(t, e.Rupture) and (m >= ne() and e.Exsanguinate:CooldownRemains() < 1 and t:FilteredTimeToDie(">", t:DebuffRemains(e.Rupture) * .5)) then
            if n(e.Rupture) then
                o = 1943
                return "Cast Rupture (Pre-Exsanguinate)"
            end

        end

    end

    if e.Garrote:IsCastable() and t:IsInMeleeRange(10) and N >= 1 then
        local function a(t)
            F = r.Exsanguinated(t, e.Garrote) and B or G
            return v(t, e.Garrote) and L() <= 0 and (t:PMultiplier(e.Garrote) <= 1 or (d >= 3 and t:DebuffRemains(e.Garrote) <= F)) and (not r.WillLoseExsanguinate(t, e.Garrote) or t:DebuffRemains(e.Garrote) <= F * (1 + w(d >= 3)))
        end

        if a(t) and r.CanDoTUnit(t, M) and (t:FilteredTimeToDie(">", 4, -t:DebuffRemains(e.Garrote)) or t:TimeToDieIsNotValid()) then
            if z(e.Garrote, nil, not f) then
                o = 703
                return "Pool for Garrote (ST)"
            end

        end

        if not s then
            J(e.Garrote, a, 12, T)
        end

    end

    if e.CrimsonTempest:IsReady() and t:IsInMeleeRange(10) and d >= 2 and m >= 4 and x > 20 and (not e.Deathmark:CooldownUp() or t:DebuffUp(e.Rupture)) then
        for a, t in _(j) do
            if t:DebuffRemains(e.CrimsonTempest) < (2 + 3 * w(d >= 4)) then
                if n(e.CrimsonTempest) then
                    o = 121411
                    return "Cast Crimson Tempest (AoE)"
                end

            end

        end

    end

    if e.Rupture:IsReady() and t:IsInMeleeRange(10) and m >= 4 then
        D = 4 + w(e.DashingScoundrel:IsAvailable()) * 5 + w(e.Doomblade:IsAvailable()) * 5 + w(S) * 6
        local function a(t)
            C = r.Exsanguinated(t, e.Rupture) and B or G
            return v(t, e.Rupture, ie) and (t:PMultiplier(e.Rupture) <= 1 or t:DebuffRemains(e.Rupture) <= C and d >= 3) and (not r.WillLoseExsanguinate(t, e.Rupture) or t:DebuffRemains(e.Rupture) <= C * (1 + w(d >= 3))) and (t:FilteredTimeToDie(">", D, -t:DebuffRemains(e.Rupture)) or t:TimeToDieIsNotValid())
        end

        if not i and a(t) and r.CanDoTUnit(t, Y) then
            if n(e.Rupture, nil, nil, not f) then
                o = 1943
                return "Cast Rupture (Refresh)"
            end

        end

        if not i and not l and h.AoEON() then
            J(e.Rupture, a, D, T)
        end

    end

    if h.AoEON() and t:IsInMeleeRange(10) and e.CrimsonTempest:IsReady() and d >= 2 and m >= 4 then
        for a, t in _(j) do
            if t:DebuffRemains(e.CrimsonTempest) < 2 + 3 * w(d >= 4) then
                if n(e.CrimsonTempest) then
                    o = 121411
                    return "Cast Crimson Tempest (AoE Fallback)"
                end

            end

        end

    end

    if e.CrimsonTempest:IsReady() and k and d == 1 and not e.DashingScoundrel:IsAvailable() and m >= (r.CPMaxSpend() - 1) and v(t, e.CrimsonTempest, te) and not r.WillLoseExsanguinate(t, e.CrimsonTempest) and not t:DebuffUp(e.ShivDebuff) and t:DebuffStack(e.AmplifyingPoisonDebuff) < 15 and (t:FilteredTimeToDie(">", 4, -t:DebuffRemains(e.CrimsonTempest)) or t:TimeToDieIsNotValid()) and r.CanDoTUnit(t, Y) then
        if n(e.CrimsonTempest) then
            o = 121411
            return "Cast Crimson Tempest (ST)"
        end

    end

    return false
end

local function v()
    if e.Envenom:IsReady() and t:IsInMeleeRange(10) and m >= 4 + w(e.DeeperStratagem:IsAvailable()) and (t:DebuffUp(e.Deathmark) or t:DebuffUp(e.ShivDebuff) or t:DebuffStack(e.AmplifyingPoisonDebuff) >= 10 or a:EnergyDeficit() <= (25 + x) or not A or m > r.CPMaxSpend()) and (not e.Exsanguinate:IsAvailable() or e.Exsanguinate:CooldownRemains() > 2 or not h.CDsON() or e.ResoundingClarity:IsAvailable() and (e.EchoingReprimand:IsReady() and a:ComboPoints() > 2 or m > 5)) then
        if n(e.Envenom, nil, nil, not f) then
            o = 32645
            return "Cast Envenom"
        end

    end

    if not (N > 1 or a:EnergyDeficit() <= 25 + x or not A) then
        return false
    end

    if e.SerratedBoneSpike:IsReady() and t:IsInMeleeRange(10) then
        if not t:DebuffUp(e.SerratedBoneSpikeDebuff) then
            if n(e.SerratedBoneSpike, nil, nil, not k) then
                o = 328547
                return "Cast Serrated Bone Spike"
            end

        else
            if h.AoEON() then
                if I.CastTargetIf(e.SerratedBoneSpike, W, "min", ee, re) then
                    return "Cast Serrated Bone (AoE)"
                end

                if ee(t) and re(t) then
                    if n(e.SerratedBoneSpike, nil, nil, not k) then
                        o = 328547
                        return "Cast Serrated Bone (AoE)"
                    end

                end

            end

            if L() < .8 then
                                if (u.BossFightRemains() <= 5 or (e.SerratedBoneSpike:MaxCharges() - e.SerratedBoneSpike:ChargesFractional() <= .25)) then
                    if n(e.SerratedBoneSpike, nil, nil, not k) then
                        o = 328547
                        return "Cast Serrated Bone Spike (Dump Charge)"
                    end

                elseif not A and t:DebuffUp(e.ShivDebuff) then
                    if n(e.SerratedBoneSpike, nil, nil, not k) then
                        o = 328547
                        return "Cast Serrated Bone Spike (Shiv)"
                    end

                end

            end

        end

    end

    if e.FanofKnives:IsCastable() and t:IsInMeleeRange(10) then
        if h.AoEON() and d >= 1 and (not H and d >= 3 + w(a:StealthUp(true, false)) + w(e.DragonTemperedBlades:IsAvailable())) then
            if z(e.FanofKnives) then
                o = 51723
                return "Cast Fan of Knives"
            end

        end

        if h.AoEON() and a:BuffUp(e.DeadlyPoison) and d >= 3 then
            for a, t in _(j) do
                if not t:DebuffUp(e.DeadlyPoisonDebuff, true) and (not H or t:DebuffUp(e.Garrote) or t:DebuffUp(e.Rupture)) then
                    if z(e.FanofKnives) then
                        o = 51723
                        return "Cast Fan of Knives (DP Refresh)"
                    end

                end

            end

        end

    end

    if q() and t:IsInMeleeRange(10) and e.EchoingReprimand:IsReady() and ((not e.Exsanguinate:IsAvailable() or not e.ResoundingClarity:IsAvailable()) and (not e.Deathmark:IsAvailable() or e.Deathmark:CooldownRemains() > 10) or u.BossFilteredFightRemains("<=", 20)) then
        if n(e.EchoingReprimand, nil, nil, not f) then
            o = 323547
            return "Cast Echoing Reprimand"
        end

    end

    if e.Ambush:IsCastable() and t:IsInMeleeRange(10) and (a:StealthUp(true, true) or a:BuffUp(e.BlindsideBuff)) then
        if z(e.Ambush, nil, not f) then
            o = 8676
            return "Cast Ambush"
        end

    end

    if e.Mutilate:IsCastable() and t:IsInMeleeRange(10) and d == 2 and t:DebuffUp(e.DeadlyPoisonDebuff, true) then
        local n = t:GUID()
        for s, a in _(T) do
            if a:GUID() ~= n and (a:DebuffUp(e.Garrote) or a:DebuffUp(e.Rupture)) and not a:DebuffUp(e.DeadlyPoisonDebuff, true) and not a:DebuffUp(e.AmplifyingPoisonDebuff, true) then
                                                if a:GUID() == E("mouseover"):GUID() and i.Assassination.TargetSwap == "Mouseover" then
                    c = 11329
                elseif i.Assassination.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not O then
                    c = 9999
                elseif a:GUID() == t:GUID() then
                    o = 1329
                end

                R(a, e.Mutilate)
                break
            end

        end

    end

    if e.Mutilate:IsCastable() and t:IsInMeleeRange(10) then
        if z(e.Mutilate, nil, not f) then
            o = 1329
            return "Cast Mutilate"
        end

    end

    return false
end

local function u()
    Z = HeroRotationCharDB.Toggles[6]
    pe = HeroRotationCharDB.Toggles[4]
    se = HeroRotationCharDB.Toggles[5]
    O = HeroRotationCharDB.Toggles[12]
    Q = not HeroRotationCharDB.Toggles[15]
    ge = HeroRotationCharDB.Toggles[20]
    K = HeroRotationCharDB.Toggles[21]
    qe = HeroRotationCharDB.Toggles[22]
    xe = HeroRotationCharDB.Toggles[23]
    je = HeroRotationCharDB.Toggles[24]
    be = HeroRotationCharDB.Toggles[25]
    ke = HeroRotationCharDB.Toggles[26]
    ve = HeroRotationCharDB.Toggles[27]
    fe = HeroRotationCharDB.Toggles[28]
    me = HeroRotationCharDB.Toggles[29]
    ce = HeroRotationCharDB.Toggles[30]
    we = HeroRotationCharDB.Toggles[54]
    TopTrinketID = GetInventoryItemID("player", 13)
    BotTrinketID = GetInventoryItemID("player", 14)
            if not i.Commons.Enabled.TopTrinket and not i.Commons.Enabled.BotTrinket then
        OnUseExcludes = { TopTrinketID, BotTrinketID, U.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.TopTrinket and i.Commons.Enabled.BotTrinket then
        OnUseExcludes = { TopTrinketID, U.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.BotTrinket and i.Commons.Enabled.TopTrinket then
        OnUseExcludes = { BotTrinketID, U.CacheOfAcquiredTreasures:ID() }
    end

end

local function w()
    V = e.AcrobaticStrikes:IsAvailable() and 8 or 5
    P = e.AcrobaticStrikes:IsAvailable() and 10 or 13
    f = t:IsInMeleeRange(V)
    k = t:IsInMeleeRange(P)
    if ye() then
        W = a:GetEnemiesInRange(30)
        j = a:GetEnemiesInMeleeRange(P)
        d = #j
        T = a:GetEnemiesInMeleeRange(V)
    else
        W = {  }
        j = {  }
        d = 1
        T = {  }
    end

    G, B = 2 * a:SpellHaste(), 1 * a:SpellHaste()
    m = r.EffectiveComboPoints(a:ComboPoints())
    N = a:ComboPointsMax() - m
    ie = (4 + m * 4) * .3
    te = (2 + m * 2) * .3
    Y = e.Envenom:Damage() * i.Assassination.EnvenomDMGOffset
    M = e.Mutilate:Damage() * i.Assassination.MutilateDMGOffset
    H = _e()
    s = u()
    if s then
        return s
    end

    if c > 0 then
        c = 0
    end

    if o > 0 then
        o = 0
    end

    o = r.ReturnSpell()
    c = r.ReturnSpellMO()
    s = r.CrimsonVial()
    if s then
        return s
    end

    s = r.Feint()
    if s then
        return s
    end

    local c = a:AffectingCombat() and 180 or 900
    local u
                if l(8679):IsAvailable() and (i.Assassination.LethalPoison1 == "Wound Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.LethalPoison2 == "Wound Poison")) then
        u = a:BuffRemains(l(8679))
        if u < c and not a:IsCasting(l(8679)) then
            if h.Cast(l(8679)) then
                o = 203
                return "Wound Poison Refresh"
            end

        end

    elseif l(2823):IsAvailable() and (i.Assassination.LethalPoison1 == "Deadly Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.LethalPoison2 == "Deadly Poison")) then
        u = a:BuffRemains(l(2823))
        if u < c and not a:IsCasting(l(2823)) then
            if h.Cast(l(2823)) then
                o = 208
                return "Deadly Poison Refresh"
            end

        end

    elseif l(315584):IsAvailable() and (i.Assassination.LethalPoison1 == "Instant Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.LethalPoison2 == "Instant Poison")) then
        u = a:BuffRemains(l(315584))
        if u < c and not a:IsCasting(l(315584)) then
            if h.Cast(l(315584)) then
                o = 205
                return "Instant Poison Refresh"
            end

        end

    elseif l(381664):IsAvailable() and (i.Assassination.LethalPoison1 == "Amplifying Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.LethalPoison2 == "Amplifying Poison")) then
        u = a:BuffRemains(l(381664))
        if u < c and not a:IsCasting(l(381664)) then
            if h.Cast(l(381664)) then
                o = 209
                return "Amplifying Poison Refresh"
            end

        end

    end

        if l(381637):IsAvailable() and (i.Assassination.NonLethalPoison1 == "Atrophic Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.NonLethalPoison2 == "Atrophic Poison")) then
        u = a:BuffRemains(l(381637))
        if u < c and not a:IsCasting(l(381637)) then
            if h.Cast(l(381637)) then
                o = 381637
                return "Atropic Poison Refresh"
            end

        end

    elseif l(5761):IsAvailable() and (i.Assassination.NonLethalPoison1 == "Numbing Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.NonLethalPoison2 == "Numbing Poison")) then
        u = a:BuffRemains(l(5761))
        if u < c and not a:IsCasting(NumbingPoison) then
            if h.Cast(l(5761)) then
                o = 204
                return "Numbing Poison Refresh"
            end

        end

    end

    if not a:AffectingCombat() and not a:IsDeadOrGhost() then
        if not a:BuffUp(r.VanishBuffSpell()) then
            s = r.Stealth(r.StealthSpell())
            if s then
                return s
            end

        end

        if not a:BuffUp(e.SliceandDice) then
            if e.SliceandDice:IsReady() and m >= 2 then
                if n(e.SliceandDice) then
                    o = 5171
                    return "Cast Slice and Dice"
                end

            end

        end

    end

    r.MfDSniping(e.MarkedforDeath)
    if I.TargetIsValid() and ((a:AffectingCombat() and not t:DebuffUp(e.Sap)) or Z) then
        if s then
            return s
        end

        ae = r.PoisonedBleeds()
        x = a:EnergyRegen() + ae * 6 / (2 * a:SpellHaste())
        ze = a:EnergyDeficit() / x
        S = x > 35
        A = d < 2
        if a:StealthUp(true, false) or g() > 0 then
            s = y()
            if s then
                return s .. " (Stealthed)"
            end

        end

        s = ue()
        if s then
            return s
        end

                if not a:BuffUp(e.SliceandDice) and t:IsInMeleeRange(10) then
            if e.SliceandDice:IsReady() and a:ComboPoints() >= 2 or not e.CutToTheChase:IsAvailable() and a:ComboPoints() >= 4 and a:BuffRemains(e.SliceandDice) < (1 + a:ComboPoints()) * 1.8 then
                if n(e.SliceandDice) then
                    o = 5171
                    return "Cast Slice and Dice"
                end

            end

        elseif k and e.CutToTheChase:IsAvailable() then
            if e.Envenom:IsReady() and t:IsInMeleeRange(10) and a:BuffRemains(e.SliceandDice) < 5 and a:ComboPoints() >= 4 then
                if n(e.Envenom, nil, nil, not f) then
                    o = 32645
                    return "Cast Envenom (CttC)"
                end

            end

        else
            if e.PoisonedKnife:IsCastable() and t:IsInRange(30) and not a:StealthUp(true, true) and a:AffectingCombat() and d == 0 and a:EnergyTimeToMax() <= a:GCD() * 1.5 then
                if n(e.PoisonedKnife) then
                    o = 185565
                    return "Cast Poisoned Knife"
                end

            end

        end

        s = p()
        if s then
            return s
        end

        s = v()
        if s then
            return s
        end

        if q() and i.Commons.Enabled.Racials then
            if e.ArcaneTorrent:IsCastable() and t:IsInMeleeRange(8) and a:EnergyDeficitPredicted() > 15 + x then
                if n(e.ArcaneTorrent, nil) then
                    o = 155145
                    return "Cast Arcane Torrent"
                end

            end

            if e.ArcanePulse:IsCastable() and t:IsInMeleeRange(8) then
                if n(e.ArcanePulse, nil) then
                    o = 260364
                    return "Cast Arcane Pulse"
                end

            end

            if e.LightsJudgment:IsCastable() and t:IsInMeleeRange(8) then
                if n(e.LightsJudgment, nil) then
                    o = 255647
                    return "Cast Lights Judgment"
                end

            end

            if e.BagofTricks:IsCastable() and t:IsInMeleeRange(8) then
                if n(e.BagofTricks, nil) then
                    o = 312411
                    return "Cast Bag of Tricks"
                end

            end

        end

        if e.Mutilate:IsCastable() and k then
            if n(e.PoolEnergy) then
                shadowcast = 9999999999
                return "Normal Pooling"
            end

        end

    end

end

local function t()
    e.Deathmark:RegisterAuraTracking()
    e.Sepsis:RegisterAuraTracking()
end

function ReturnSpellAss()
    if o == 0 then
        return 0
    else
        return o
    end

end

function ReturnSpellMOAss()
    if c == 0 then
        return 0
    else
        return c
    end

end

h.SetAPL(259, w, t)

