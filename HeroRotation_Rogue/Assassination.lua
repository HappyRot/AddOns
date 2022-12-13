local e, e = ...
local e = HeroDBC.DBC
local c = HeroLib
local e = HeroCache
local z = c.Unit
local a = z.Player
local t = z.Target
local l = c.Spell
local e = c.MultiSpell
local g = c.Item
local e = c.Utils.num
local w = c.Utils.BoolToInt
local e = c.Utils.IntToBool
local ee = c.Utils.ValueIsInArray
local r = HeroRotation
local xe = r.AoEON
local E = r.CDsON
local n = r.Cast
local j = r.CastPooling
local R = r.CastLeftNameplate
local ze = HeroRotationCharDB.Toggles[4]
local X = HeroRotationCharDB.Toggles[5]
local J = HeroRotationCharDB.Toggles[6]
local O = HeroRotationCharDB.Toggles[12]
local fe = not HeroRotationCharDB.Toggles[15]
local we = HeroRotationCharDB.Toggles[20]
local Q = HeroRotationCharDB.Toggles[21]
local me = HeroRotationCharDB.Toggles[22]
local le = HeroRotationCharDB.Toggles[23]
local ye = HeroRotationCharDB.Toggles[24]
local be = HeroRotationCharDB.Toggles[25]
local ke = HeroRotationCharDB.Toggles[26]
local je = HeroRotationCharDB.Toggles[27]
local qe = HeroRotationCharDB.Toggles[28]
local ve = HeroRotationCharDB.Toggles[29]
local ge = HeroRotationCharDB.Toggles[30]
local pe = HeroRotationCharDB.Toggles[54]
local _ = pairs
local Z = math.floor
local e = math.max
local H = r.Commons.Everyone
local h = r.Commons.Rogue
local i = { General = r.GUISettings.General, Commons = r.GUISettings.APL.Rogue.Commons, Assassination = r.GUISettings.APL.Rogue.Assassination }
local e = l.Rogue.Assassination
local D = g.Rogue.Assassination
local ie = {  }
local V, U, m, q
local M, k, d, T
local s
local Y, P = 2 * a:SpellHaste(), 1 * a:SpellHaste()
local f, I
local ae, oe, B, G, F, L, W
local N
local te, x, ue, S, A
local v = 0
local o = h.ReturnSpell()
local u = h.ReturnSpellMO()
local b = a:GetEquipment()
local y = a:CovenantID()
local y, p, y, y = (y == 1), (y == 2), (y == 3), (y == 4)
local y = a:HasLegendaryEquipped(118)
local y = a:HasLegendaryEquipped(129)
local y = a:HasLegendaryEquipped(119)
local y = a:HasLegendaryEquipped(121)
local C = a:HasLegendaryEquipped(117)
local p = a:HasLegendaryEquipped(229) or (a:HasUnity() and p)
local y = y and .55 or 1.
local y = p and .56 or 1.
local y, y = a:HasTier(28, 2), a:HasTier(28, 4)
local y = b[13] and g(b[13]) or g(0)
local p = b[14] and g(b[14]) or g(0)
local function C()
        if y:TrinketHasStatAnyDps() and (not p:TrinketHasStatAnyDps() or y:Cooldown() >= p:Cooldown()) then
        v = 1
    elseif p:TrinketHasStatAnyDps() and (not y:TrinketHasStatAnyDps() or p:Cooldown() > y:Cooldown()) then
        v = 2
    else
        v = 0
    end

end

C()
c:RegisterForEvent(function()
    b = a:GetEquipment()
    y = b[13] and g(b[13]) or g(0)
    p = b[14] and g(b[14]) or g(0)
    C()
end, "PLAYER_EQUIPMENT_CHANGED")
local function b(t)
    if t then
        return 1
    else
        return 0
    end

end

e.Envenom:RegisterDamageFormula(function()
    return a:AttackPowerDamageMod() * f * .22 * 1. * (t:DebuffUp(e.ShivDebuff) and 1.3 or 1) * (e.DeeperStratagem:IsAvailable() and 1.05 or 1) * (1 + a:MasteryPct() / 100) * (1 + a:VersatilityDmgPct() / 100)
end)
e.Mutilate:RegisterDamageFormula(function()
    return (a:AttackPowerDamageMod() + a:AttackPowerDamageMod(true)) * .485 * 1. * (1 + a:VersatilityDmgPct() / 100)
end)
local function C()
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

local function b()
    return e.ImprovedGarrote:IsAvailable() and g() > 0 and 1.5 or 1
end

e.Garrote:RegisterPMultiplier(b)
e.Rupture:RegisterPMultiplier(b)
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

local function b(t, e, a)
    local a = a or e:PandemicThreshold()
    return t:DebuffRefreshable(e, a)
end

local function se(a, h, s, d)
    local e, n = nil, s
    local r = t:GUID()
    for o, t in _(d) do
        if t:GUID() ~= r and H.UnitIsCycleValid(t, n, -t:DebuffRemains(a)) and h(t) then
            e, n = t, t:TimeToDie()
        end

    end

        if e then
                        if e:GUID() == z("mouseover"):GUID() and i.Assassination.TargetSwap == "Mouseover" then
                        if a:ID() == 703 then
                u = 1703
            elseif a:ID() == 1943 then
                u = 11943
            end

        elseif i.Assassination.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not O then
            u = 9999
        elseif e:GUID() == t:GUID() then
            o = a:ID()
        end

        R(e, a)
    elseif i.Commons.RangedMultiDoT then
        e, n = nil, s
        for o, t in _(k) do
            if t:GUID() ~= r and H.UnitIsCycleValid(t, n, -t:DebuffRemains(a)) and h(t) then
                e, n = t, t:TimeToDie()
            end

        end

        if e then
                                    if e:GUID() == z("mouseover"):GUID() and i.Assassination.TargetSwap == "Mouseover" then
                                if a:ID() == 703 then
                    u = 1703
                elseif a:ID() == 1943 then
                    u = 11943
                end

            elseif i.Assassination.TargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not O then
                u = 9999
            elseif e:GUID() == t:GUID() then
                o = a:ID()
            end

            R(e, a)
        end

    end

end

local function ce(n, r, d)
    local s = r(t)
    if n == "first" and s ~= 0 then
        return t
    end

    local e, a = nil, 0
    local function h(t)
        for t, o in _(t) do
            local t = r(o)
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

    h(T)
    if i.Commons.RangedMultiDoT then
        h(k)
    end

    if e and a == s and d(t) then
        return t
    end

    if e and d(e) then
        return e
    end

    return nil
end

local function K()
    return e.ResoundingClarity:IsAvailable() and 7 or h.CPMaxSpend()
end

local function ne(o, i, a)
    local e = t:TimeToDie()
        if not c.BossFightRemainsIsNotValid() then
        e = c.BossFightRemains()
    elseif e < a then
        return false
    end

    if Z((e - a) / o) > Z((e - a - i) / o) then
        return true
    end

    return false
end

local function he(t)
    if t:DebuffUp(e.SerratedBoneSpikeDebuff) then
        return 1000000
    end

    return t:TimeToDie()
end

local function de(a)
                if ((not a:DebuffUp(e.SerratedBoneSpikeDebuff)) and a:GUID() == z("mouseover"):GUID() and i.Assassination.TargetSwap == "Mouseover") then
        u = 1328547
        return true
    elseif ((not a:DebuffUp(e.SerratedBoneSpikeDebuff)) and i.Assassination.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not O) then
        u = 9999
        return true
    elseif ((not a:DebuffUp(e.SerratedBoneSpikeDebuff)) and a:GUID() == t:GUID()) then
        o = 328547
        return true
    elseif (not a:DebuffUp(e.SerratedBoneSpikeDebuff)) then
        return true
    end

end

local function ne()
    if e.BloodFury:IsReady() and E() and i.Commons.Enabled.Racials then
        if r.Cast(e.BloodFury, nil) then
            o = 20572
            return "Cast Blood Fury"
        end

    end

    if e.Berserking:IsReady() and E() and i.Commons.Enabled.Racials then
        if r.Cast(e.Berserking, nil) then
            o = 26297
            return "Cast Berserking"
        end

    end

    if e.Fireblood:IsReady() and E() and i.Commons.Enabled.Racials then
        if r.Cast(e.Fireblood, nil) then
            o = 265221
            return "Cast Fireblood"
        end

    end

    if e.AncestralCall:IsReady() and E() and i.Commons.Enabled.Racials then
        if r.Cast(e.AncestralCall, nil) then
            o = 274738
            return "Cast Ancestral Call"
        end

    end

end

local function Z()
    if e.Vanish:IsCastable() and E() and not Q and t:IsInMeleeRange(10) and not a:IsTanking(t) then
        if e.ImprovedGarrote:IsAvailable() and e.Garrote:CooldownUp() and not h.Exsanguinated(t, e.Garrote) and t:PMultiplier(e.Garrote) <= 1 then
            if (e.Deathmark:AnyDebuffUp() or e.Deathmark:CooldownRemains() < 4) and I >= math.min(d, 4) then
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

        if not e.ImprovedGarrote:IsAvailable() and e.MasterAssassin:IsAvailable() and not b(t, e.Rupture) and t:DebuffRemains(e.Garrote) > 3 and t:DebuffUp(e.Deathmark) and (t:DebuffUp(e.ShivDebuff) or t:DebuffRemains(e.Deathmark) < 4 or t:DebuffUp(e.Sepsis)) and t:DebuffRemains(e.Sepsis) < 3 then
            if n(e.Vanish, nil) then
                o = 1856
                return "Cast Vanish (Master Assassin)"
            end

        end

    end

    if e.ShadowDance:IsCastable() and t:IsInMeleeRange(10) then
        if e.ImprovedGarrote:IsAvailable() and e.Garrote:CooldownUp() and not h.Exsanguinated(t, e.Garrote) and t:PMultiplier(e.Garrote) <= 1 and (e.Deathmark:AnyDebuffUp() or e.Deathmark:CooldownRemains() < 4 or e.Deathmark:CooldownRemains() > 60) and I >= math.min(d, 4) then
            if n(e.ShadowDance, nil) then
                o = 185313
                return "Cast Shadow Dance (Garrote)"
            end

        end

        if not e.ImprovedGarrote:IsAvailable() and e.MasterAssassin:IsAvailable() and not b(t, e.Rupture) and t:DebuffRemains(e.Garrote) > 3 and (t:DebuffUp(e.Deathmark) or e.Deathmark:CooldownRemains() > 60) and (t:DebuffUp(e.ShivDebuff) or t:DebuffRemains(e.Deathmark) < 4 or t:DebuffUp(e.Sepsis)) and t:DebuffRemains(e.Sepsis) < 3 then
            if n(e.ShadowDance, nil) then
                o = 185313
                return "Cast Shadow Dance (Master Assassin)"
            end

        end

    end

end

local function re()
    if e.MarkedforDeath:IsCastable() and t:IsInMeleeRange(10) then
        if t:FilteredTimeToDie("<", a:ComboPointsDeficit() * 1.5) then
            if n(e.MarkedforDeath, nil) then
                o = 137619
                return "Cast Marked for Death"
            end

        end

        if r.CDsON() then
            if n(e.MarkedforDeath, nil) then
                o = 137619
                return "Cast Marked for Death"
            end

        end

    end

    if not q or not r.CDsON() then
        return 
    end

    if not a:StealthUp(true, false) then
        if e.Sepsis:IsReady() and t:DebuffUp(e.Garrote) and (t:FilteredTimeToDie(">", 10) or c.BossFilteredFightRemains("<=", 10)) then
            if n(e.Sepsis, nil, nil) then
                o = 328305
                return "Cast Sepsis"
            end

        end

                if y:IsReady() and not ee(ie, y:ID()) and (v == 1 and (e.Deathmark:AnyDebuffUp() or c.BossFilteredFightRemains("<", 20)) or (v == 2 and (not p:IsReady() or e.Deathmark:CooldownRemains() > 20)) or v == 0) then
                        if y:ID() == TopTrinketID and i.Commons.Enabled.TopTrinket then
                o = 24
                return "Generic use_items for " .. y:Name()
            elseif y:ID() == BotTrinketID and i.Commons.Enabled.BottomTrinket then
                o = 25
                return "Generic use_items for " .. y:Name()
            end

        elseif p:IsReady() and not ee(ie, p:ID()) and (v == 2 and (e.Deathmark:AnyDebuffUp() or c.BossFilteredFightRemains("<", 20)) or (v == 1 and (not y:IsReady() or e.Deathmark:CooldownRemains() > 20)) or v == 0) then
                        if p:ID() == TopTrinketID and i.Commons.Enabled.TopTrinket then
                o = 24
                return "Generic use_items for " .. p:Name()
            elseif p:ID() == BotTrinketID and i.Commons.Enabled.BottomTrinket then
                o = 25
                return "Generic use_items for " .. p:Name()
            end

        end

        if e.Deathmark:IsCastable() then
            if t:DebuffUp(e.Rupture) and not e.Deathmark:AnyDebuffUp() and (not e.Exsanguinate:IsAvailable() or e.Exsanguinate:CooldownRemains() > 15 or h.Exsanguinated(t, e.Rupture) or h.Exsanguinated(t, e.Garrote)) and (not e.MasterAssassin:IsAvailable() or t:DebuffUp(e.Garrote)) then
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
                if e.ResoundingClarity:IsAvailable() and e.EchoingReprimand:IsReady() and a:ComboPoints() <= 2 and e.Exsanguinate:CooldownRemains() <= 2 and not b(t, e.Garrote) and t:DebuffRemains(e.Rupture) > 9.6 then
                    if n(e.EchoingReprimand, nil, nil, not m) then
                        o = 323547
                        return "Cast Echoing Reprimand (Exsang Sync)"
                    end

                end

                if e.Exsanguinate:IsReady() and not b(t, e.Garrote) and t:DebuffRemains(e.Rupture) > 4 + 4 * K() or t:FilteredTimeToDie("<", t:DebuffRemains(e.Rupture) * .5) then
                    if n(e.Exsanguinate, nil) then
                        o = 200806
                        s = "Cast Exsanguinate"
                    end

                end

            elseif e.ResoundingClarity:IsAvailable() and e.EchoingReprimand:IsReady() and e.Exsanguinate:CooldownRemains() > 40 then
                if n(e.EchoingReprimand, nil, nil, not m) then
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

    if e.ThistleTea:IsCastable() and not a:BuffUp(e.ThistleTea) and (a:EnergyDeficit() >= 100 + x or e.ThistleTea:Charges() == 3 and (t:DebuffUp(e.Kingsbane) or e.Deathmark:AnyDebuffUp()) or c.BossFilteredFightRemains("<", e.ThistleTea:Charges() * 6)) then
        if r.Cast(e.ThistleTea, nil) then
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

    if e.Deathmark:AnyDebuffUp() then
        if s then
            ne()
        else
            s = ne()
        end

    end

    if not a:StealthUp(true, true) and g() <= 0 and C() <= 0 then
        if s then
            Z()
        else
            s = Z()
        end

    end

    return s
end

local function p()
    if e.IndiscriminateCarnage:IsReady() and X and t:IsInMeleeRange(10) and d > 1 then
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
            if (not h.WillLoseExsanguinate(a, e.Garrote) and (a:PMultiplier(e.Garrote) <= 1 or a:DebuffRemains(e.Garrote) < (12 / h.ExsanguinatedRate(a, e.Garrote))) and (a:FilteredTimeToDie(">", 2, -a:DebuffRemains(e.Garrote)) or a:TimeToDieIsNotValid()) and h.CanDoTUnit(a, G)) then
                                                if a:GUID() == z("mouseover"):GUID() and i.Assassination.TargetSwap == "Mouseover" then
                    u = 1703
                    return true
                elseif i.Assassination.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not O then
                    u = 9999
                    return true
                elseif a:GUID() == t:GUID() then
                    o = 703
                    return true
                else
                    return true
                end

            end

        end

        local a = ce("min", s, n)
        if a and a:GUID() ~= t:GUID() then
            R(a, e.Garrote)
        end

        if n(t) then
            if j(e.Garrote, nil, not m) then
                o = 703
                return "Cast Garrote (Improved Garrote)"
            end

        end

        if e.Exsanguinate:IsAvailable() and d == 1 and g() < 1.3 then
            if j(e.Garrote, nil, not m) then
                o = 703
                return "Pool for Garrote (Exsanguinate Refresh)"
            end

        end

    end

end

local function y()
    local l, i, s = false, false, false
    if N then
        l = d > 3 and (t:DebuffRemains(e.Garrote) < 6 or S)
        i = (t:DebuffUp(e.ShivDebuff) and d > 2) or S
    end

    if r.CDsON() and t:IsInMeleeRange(10) and e.Exsanguinate:IsAvailable() and e.Exsanguinate:CooldownRemains() < 2 then
        if e.Garrote:IsCastable() and m and d == 1 and not h.WillLoseExsanguinate(t, e.Garrote) and t:PMultiplier(e.Garrote) <= 1 and t:FilteredTimeToDie(">", t:DebuffRemains(e.Garrote) * .5) then
            if j(e.Garrote) then
                o = 703
                return "Cast Garrote (Pre-Exsanguinate)"
            end

        end

        if e.Rupture:IsReady() and m and t:PMultiplier(e.Rupture) <= 1 and not h.WillLoseExsanguinate(t, e.Rupture) and (f >= K() and e.Exsanguinate:CooldownRemains() < 1 and t:FilteredTimeToDie(">", t:DebuffRemains(e.Rupture) * .5)) then
            if n(e.Rupture) then
                o = 1943
                return "Cast Rupture (Pre-Exsanguinate)"
            end

        end

    end

    if e.Garrote:IsCastable() and t:IsInMeleeRange(10) and I >= 1 then
        local function a(t)
            W = h.Exsanguinated(t, e.Garrote) and P or Y
            return b(t, e.Garrote) and C() <= 0 and (t:PMultiplier(e.Garrote) <= 1 or (d >= 3 and t:DebuffRemains(e.Garrote) <= W)) and (not h.WillLoseExsanguinate(t, e.Garrote) or t:DebuffRemains(e.Garrote) <= W * (1 + w(d >= 3)))
        end

        if a(t) and h.CanDoTUnit(t, G) and (t:FilteredTimeToDie(">", 4, -t:DebuffRemains(e.Garrote)) or t:TimeToDieIsNotValid()) then
            if j(e.Garrote, nil, not m) then
                o = 703
                return "Pool for Garrote (ST)"
            end

        end

        if not l then
            se(e.Garrote, a, 12, T)
        end

    end

    if e.CrimsonTempest:IsReady() and t:IsInMeleeRange(10) and d >= 2 and f >= 4 and x > 20 and (not e.Deathmark:CooldownUp() or t:DebuffUp(e.Rupture)) then
        for a, t in _(k) do
            if t:DebuffRemains(e.CrimsonTempest) < (2 + 3 * w(d >= 4)) then
                if n(e.CrimsonTempest) then
                    o = 121411
                    return "Cast Crimson Tempest (AoE)"
                end

            end

        end

    end

    if e.Rupture:IsReady() and t:IsInMeleeRange(10) and f >= 4 then
        F = 4 + w(e.DashingScoundrel:IsAvailable()) * 5 + w(e.Doomblade:IsAvailable()) * 5 + w(S) * 6
        local function a(t)
            L = h.Exsanguinated(t, e.Rupture) and P or Y
            return b(t, e.Rupture, ae) and (t:PMultiplier(e.Rupture) <= 1 or t:DebuffRemains(e.Rupture) <= L and d >= 3) and (not h.WillLoseExsanguinate(t, e.Rupture) or t:DebuffRemains(e.Rupture) <= L * (1 + w(d >= 3))) and (t:FilteredTimeToDie(">", F, -t:DebuffRemains(e.Rupture)) or t:TimeToDieIsNotValid())
        end

        if not s and a(t) and h.CanDoTUnit(t, B) then
            if n(e.Rupture, nil, nil, not m) then
                o = 1943
                return "Cast Rupture (Refresh)"
            end

        end

        if not s and not i and r.AoEON() then
            se(e.Rupture, a, F, T)
        end

    end

    if r.AoEON() and t:IsInMeleeRange(10) and e.CrimsonTempest:IsReady() and d >= 2 and f >= 4 then
        for a, t in _(k) do
            if t:DebuffRemains(e.CrimsonTempest) < 2 + 3 * w(d >= 4) then
                if n(e.CrimsonTempest) then
                    o = 121411
                    return "Cast Crimson Tempest (AoE Fallback)"
                end

            end

        end

    end

    if e.CrimsonTempest:IsReady() and q and d == 1 and not e.DashingScoundrel:IsAvailable() and f >= (h.CPMaxSpend() - 1) and b(t, e.CrimsonTempest, oe) and not h.WillLoseExsanguinate(t, e.CrimsonTempest) and not t:DebuffUp(e.ShivDebuff) and t:DebuffStack(e.AmplifyingPoisonDebuff) < 15 and (t:FilteredTimeToDie(">", 4, -t:DebuffRemains(e.CrimsonTempest)) or t:TimeToDieIsNotValid()) and h.CanDoTUnit(t, B) then
        if n(e.CrimsonTempest) then
            o = 121411
            return "Cast Crimson Tempest (ST)"
        end

    end

    return false
end

local function v()
    if e.Envenom:IsReady() and t:IsInMeleeRange(10) and f >= 4 + w(e.DeeperStratagem:IsAvailable()) and (t:DebuffUp(e.Deathmark) or t:DebuffUp(e.ShivDebuff) or t:DebuffStack(e.AmplifyingPoisonDebuff) >= 10 or a:EnergyDeficit() <= (25 + x) or not A or f > h.CPMaxSpend()) and (not e.Exsanguinate:IsAvailable() or e.Exsanguinate:CooldownRemains() > 2 or not r.CDsON() or e.ResoundingClarity:IsAvailable() and (e.EchoingReprimand:IsReady() and a:ComboPoints() > 2 or f > 5)) then
        if n(e.Envenom, nil, nil, not m) then
            o = 32645
            return "Cast Envenom"
        end

    end

    if not (I > 1 or a:EnergyDeficit() <= 25 + x or not A) then
        return false
    end

    if e.SerratedBoneSpike:IsReady() and t:IsInMeleeRange(10) then
        if not t:DebuffUp(e.SerratedBoneSpikeDebuff) then
            if n(e.SerratedBoneSpike, nil, nil, not q) then
                o = 328547
                return "Cast Serrated Bone Spike"
            end

        else
            if r.AoEON() then
                if H.CastTargetIf(e.SerratedBoneSpike, M, "min", he, de) then
                    return "Cast Serrated Bone (AoE)"
                end

            end

            if C() < .8 then
                                if (c.BossFightRemains() <= 5 or (e.SerratedBoneSpike:MaxCharges() - e.SerratedBoneSpike:ChargesFractional() <= .25)) then
                    if n(e.SerratedBoneSpike, nil, nil, not q) then
                        o = 328547
                        return "Cast Serrated Bone Spike (Dump Charge)"
                    end

                elseif not A and t:DebuffUp(e.ShivDebuff) then
                    if n(e.SerratedBoneSpike, nil, nil, not q) then
                        o = 328547
                        return "Cast Serrated Bone Spike (Shiv)"
                    end

                end

            end

        end

    end

    if e.FanofKnives:IsCastable() and t:IsInMeleeRange(10) then
        if r.AoEON() and d >= 1 and (not N and d >= 3 + w(a:StealthUp(true, false)) + w(e.DragonTemperedBlades:IsAvailable())) then
            if j(e.FanofKnives) then
                o = 51723
                return "Cast Fan of Knives"
            end

        end

        if r.AoEON() and a:BuffUp(e.DeadlyPoison) and d >= 3 then
            for a, t in _(k) do
                if not t:DebuffUp(e.DeadlyPoisonDebuff, true) and (not N or t:DebuffUp(e.Garrote) or t:DebuffUp(e.Rupture)) then
                    if j(e.FanofKnives) then
                        o = 51723
                        return "Cast Fan of Knives (DP Refresh)"
                    end

                end

            end

        end

    end

    if E() and t:IsInMeleeRange(10) and e.EchoingReprimand:IsReady() and ((not e.Exsanguinate:IsAvailable() or not e.ResoundingClarity:IsAvailable()) and (not e.Deathmark:IsAvailable() or e.Deathmark:CooldownRemains() > 10) or c.BossFilteredFightRemains("<=", 20)) then
        if n(e.EchoingReprimand, nil, nil, not m) then
            o = 323547
            return "Cast Echoing Reprimand"
        end

    end

    if e.Ambush:IsCastable() and t:IsInMeleeRange(10) and (a:StealthUp(true, true) or a:BuffUp(e.BlindsideBuff)) then
        if j(e.Ambush, nil, not m) then
            o = 8676
            return "Cast Ambush"
        end

    end

    if e.Mutilate:IsCastable() and t:IsInMeleeRange(10) and d == 2 and t:DebuffUp(e.DeadlyPoisonDebuff, true) then
        local n = t:GUID()
        for s, a in _(T) do
            if a:GUID() ~= n and (a:DebuffUp(e.Garrote) or a:DebuffUp(e.Rupture)) and not a:DebuffUp(e.DeadlyPoisonDebuff, true) and not a:DebuffUp(e.AmplifyingPoisonDebuff, true) then
                                                if a:GUID() == z("mouseover"):GUID() and i.Assassination.TargetSwap == "Mouseover" then
                    u = 11329
                elseif i.Assassination.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not O then
                    u = 9999
                elseif a:GUID() == t:GUID() then
                    o = 1329
                end

                R(a, e.Mutilate)
                break
            end

        end

    end

    if e.Mutilate:IsCastable() and t:IsInMeleeRange(10) then
        if j(e.Mutilate, nil, not m) then
            o = 1329
            return "Cast Mutilate"
        end

    end

    return false
end

local function c()
    J = HeroRotationCharDB.Toggles[6]
    ze = HeroRotationCharDB.Toggles[4]
    X = HeroRotationCharDB.Toggles[5]
    O = HeroRotationCharDB.Toggles[12]
    fe = not HeroRotationCharDB.Toggles[15]
    we = HeroRotationCharDB.Toggles[20]
    Q = HeroRotationCharDB.Toggles[21]
    me = HeroRotationCharDB.Toggles[22]
    le = HeroRotationCharDB.Toggles[23]
    ye = HeroRotationCharDB.Toggles[24]
    be = HeroRotationCharDB.Toggles[25]
    ke = HeroRotationCharDB.Toggles[26]
    je = HeroRotationCharDB.Toggles[27]
    qe = HeroRotationCharDB.Toggles[28]
    ve = HeroRotationCharDB.Toggles[29]
    ge = HeroRotationCharDB.Toggles[30]
    pe = HeroRotationCharDB.Toggles[54]
    TopTrinketID = GetInventoryItemID("player", 13)
    BotTrinketID = GetInventoryItemID("player", 14)
            if not i.Commons.Enabled.TopTrinket and not i.Commons.Enabled.BotTrinket then
        OnUseExcludes = { TopTrinketID, BotTrinketID, D.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.TopTrinket and i.Commons.Enabled.BotTrinket then
        OnUseExcludes = { TopTrinketID, D.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.BotTrinket and i.Commons.Enabled.TopTrinket then
        OnUseExcludes = { BotTrinketID, D.CacheOfAcquiredTreasures:ID() }
    end

end

local function w()
    V = e.AcrobaticStrikes:IsAvailable() and 8 or 5
    U = e.AcrobaticStrikes:IsAvailable() and 10 or 13
    m = t:IsInMeleeRange(V)
    q = t:IsInMeleeRange(U)
    if xe() then
        M = a:GetEnemiesInRange(30)
        k = a:GetEnemiesInMeleeRange(U)
        d = #k
        T = a:GetEnemiesInMeleeRange(V)
    else
        M = {  }
        k = {  }
        d = 1
        T = {  }
    end

    Y, P = 2 * a:SpellHaste(), 1 * a:SpellHaste()
    f = h.EffectiveComboPoints(a:ComboPoints())
    I = a:ComboPointsMax() - f
    ae = (4 + f * 4) * .3
    oe = (2 + f * 2) * .3
    B = e.Envenom:Damage() * i.Assassination.EnvenomDMGOffset
    G = e.Mutilate:Damage() * i.Assassination.MutilateDMGOffset
    N = _e()
    s = c()
    if s then
        return s
    end

    if u > 0 then
        u = 0
    end

    if o > 0 then
        o = 0
    end

    o = h.ReturnSpell()
    u = h.ReturnSpellMO()
    s = h.CrimsonVial()
    if s then
        return s
    end

    s = h.Feint()
    if s then
        return s
    end

    local c = a:AffectingCombat() and 180 or 900
    local u
                if l(8679):IsAvailable() and (i.Assassination.LethalPoison1 == "Wound Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.LethalPoison2 == "Wound Poison")) then
        u = a:BuffRemains(l(8679))
        if u < c and not a:IsCasting(l(8679)) then
            if r.Cast(l(8679)) then
                o = 203
                return "Wound Poison Refresh"
            end

        end

    elseif l(2823):IsAvailable() and (i.Assassination.LethalPoison1 == "Deadly Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.LethalPoison2 == "Deadly Poison")) then
        u = a:BuffRemains(l(2823))
        if u < c and not a:IsCasting(l(2823)) then
            if r.Cast(l(2823)) then
                o = 208
                return "Deadly Poison Refresh"
            end

        end

    elseif l(315584):IsAvailable() and (i.Assassination.LethalPoison1 == "Instant Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.LethalPoison2 == "Instant Poison")) then
        u = a:BuffRemains(l(315584))
        if u < c and not a:IsCasting(l(315584)) then
            if r.Cast(l(315584)) then
                o = 205
                return "Instant Poison Refresh"
            end

        end

    elseif l(381664):IsAvailable() and (i.Assassination.LethalPoison1 == "Amplifying Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.LethalPoison2 == "Amplifying Poison")) then
        u = a:BuffRemains(l(381664))
        if u < c and not a:IsCasting(l(381664)) then
            if r.Cast(l(381664)) then
                o = 209
                return "Amplifying Poison Refresh"
            end

        end

    end

        if l(381637):IsAvailable() and (i.Assassination.NonLethalPoison1 == "Atrophic Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.NonLethalPoison2 == "Atrophic Poison")) then
        u = a:BuffRemains(l(381637))
        if u < c and not a:IsCasting(l(381637)) then
            if r.Cast(l(381637)) then
                o = 381637
                return "Atropic Poison Refresh"
            end

        end

    elseif l(5761):IsAvailable() and (i.Assassination.NonLethalPoison1 == "Numbing Poison" or (e.DragonTemperedBlades:IsAvailable() and i.Assassination.NonLethalPoison2 == "Numbing Poison")) then
        u = a:BuffRemains(l(5761))
        if u < c and not a:IsCasting(NumbingPoison) then
            if r.Cast(l(5761)) then
                o = 204
                return "Numbing Poison Refresh"
            end

        end

    end

    if not a:AffectingCombat() and not a:IsDeadOrGhost() then
        if not a:BuffUp(h.VanishBuffSpell()) then
            s = h.Stealth(h.StealthSpell())
            if s then
                return s
            end

        end

        if not a:BuffUp(e.SliceandDice) then
            if e.SliceandDice:IsReady() and f >= 2 then
                if n(e.SliceandDice) then
                    o = 5171
                    return "Cast Slice and Dice"
                end

            end

        end

    end

    h.MfDSniping(e.MarkedforDeath)
    if H.TargetIsValid() and ((a:AffectingCombat() and not t:DebuffUp(e.Sap)) or J) then
        if s then
            return s
        end

        te = h.PoisonedBleeds()
        x = a:EnergyRegen() + te * 6 / (2 * a:SpellHaste())
        ue = a:EnergyDeficit() / x
        S = x > 35
        A = d < 2
        if a:StealthUp(true, false) or g() > 0 then
            s = p()
            if s then
                return s .. " (Stealthed)"
            end

        end

        s = re()
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

        elseif q and e.CutToTheChase:IsAvailable() then
            if e.Envenom:IsReady() and t:IsInMeleeRange(10) and a:BuffRemains(e.SliceandDice) < 5 and a:ComboPoints() >= 4 then
                if n(e.Envenom, nil, nil, not m) then
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

        s = y()
        if s then
            return s
        end

        s = v()
        if s then
            return s
        end

        if E() and i.Commons.Enabled.Racials then
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

        if e.Mutilate:IsCastable() and q then
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
    if u == 0 then
        return 0
    else
        return u
    end

end

r.SetAPL(259, w, t)

