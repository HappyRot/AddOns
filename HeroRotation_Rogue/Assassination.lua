local a, b = ...
local c = HeroDBC.DBC
local d = HeroLib
local e = HeroCache
local f = d.Unit
local g = f.Player
local h = f.Target
local i = d.Spell
local j = d.MultiSpell
local k = d.Item
local l = d.Utils.num
local m = d.Utils.BoolToInt
local n = d.Utils.IntToBool
local o = d.Utils.ValueIsInArray
local p = HeroRotation
local q = p.AoEON
local r = p.CDsON
local s = p.Cast
local t = p.CastPooling
local u = p.CastLeftNameplate
local v = HeroRotationCharDB.Toggles[4]
local w = HeroRotationCharDB.Toggles[5]
local x = HeroRotationCharDB.Toggles[6]
local y = HeroRotationCharDB.Toggles[12]
local z = not HeroRotationCharDB.Toggles[15]
local A = HeroRotationCharDB.Toggles[20]
local B = HeroRotationCharDB.Toggles[21]
local C = HeroRotationCharDB.Toggles[22]
local D = HeroRotationCharDB.Toggles[23]
local E = HeroRotationCharDB.Toggles[24]
local F = HeroRotationCharDB.Toggles[25]
local G = HeroRotationCharDB.Toggles[26]
local H = HeroRotationCharDB.Toggles[27]
local I = HeroRotationCharDB.Toggles[28]
local J = HeroRotationCharDB.Toggles[29]
local K = HeroRotationCharDB.Toggles[30]
local L = HeroRotationCharDB.Toggles[54]
local pairs = pairs
local M = math.floor
local N = math.max
local O = p.Commons.Everyone
local P = p.Commons.Rogue
local Q = {
    General = p.GUISettings.General,
    Commons = p.GUISettings.APL.Rogue.Commons,
    Assassination = p.GUISettings.APL.Rogue.Assassination
}
local R = i.Rogue.Assassination
local S = k.Rogue.Assassination
local T = {}
local U, V, W, X
local Y, Z, _, a0
local a1
local a2, a3 = 2 * g:SpellHaste(), 1 * g:SpellHaste()
local a4, a5
local a6, a7, a8, a9, aa, ab, ac
local ad
local ae, af, ag, ah, ai
local aj = 0
local ak = P.ReturnSpell()
local al = P.ReturnSpellMO()
local am = g:GetEquipment()
local an = g:CovenantID()
local ao, ap, aq, ar = an == 1, an == 2, an == 3, an == 4
local as = g:HasLegendaryEquipped(118)
local at = g:HasLegendaryEquipped(129)
local au = g:HasLegendaryEquipped(119)
local av = g:HasLegendaryEquipped(121)
local aw = g:HasLegendaryEquipped(117)
local ax = g:HasLegendaryEquipped(229) or g:HasUnity() and ap
local ay = av and 0.55 or 1.0
local az = ax and 0.56 or 1.0
local aA, aB = g:HasTier(28, 2), g:HasTier(28, 4)
local aC = am[13] and k(am[13]) or k(0)
local aD = am[14] and k(am[14]) or k(0)
local function aE()
    if aC:TrinketHasStatAnyDps() and (not aD:TrinketHasStatAnyDps() or aC:Cooldown() >= aD:Cooldown()) then
        aj = 1
    elseif aD:TrinketHasStatAnyDps() and (not aC:TrinketHasStatAnyDps() or aD:Cooldown() > aC:Cooldown()) then
        aj = 2
    else
        aj = 0
    end
end
aE()
d:RegisterForEvent(
    function()
        am = g:GetEquipment()
        aC = am[13] and k(am[13]) or k(0)
        aD = am[14] and k(am[14]) or k(0)
        aE()
    end,
    "PLAYER_EQUIPMENT_CHANGED"
)
local function l(aF)
    if aF then
        return 1
    else
        return 0
    end
end
R.Envenom:RegisterDamageFormula(
    function()
        return g:AttackPowerDamageMod() * a4 * 0.22 * 1.0 * (h:DebuffUp(R.ShivDebuff) and 1.3 or 1) *
            (R.DeeperStratagem:IsAvailable() and 1.05 or 1) *
            (1 + g:MasteryPct() / 100) *
            (1 + g:VersatilityDmgPct() / 100)
    end
)
R.Mutilate:RegisterDamageFormula(
    function()
        return (g:AttackPowerDamageMod() + g:AttackPowerDamageMod(true)) * 0.485 * 1.0 *
            (1 + g:VersatilityDmgPct() / 100)
    end
)
local function aG()
    if g:BuffRemains(R.MasterAssassinBuff) == 9999 then
        return g:GCDRemains() + 3
    end
    return g:BuffRemains(R.MasterAssassinBuff)
end
local function aH()
    if g:BuffUp(R.ImprovedGarroteAura) then
        return g:GCDRemains() + 3
    end
    return g:BuffRemains(R.ImprovedGarroteBuff)
end
local function aI()
    return R.ImprovedGarrote:IsAvailable() and aH() > 0 and 1.5 or 1
end
R.Garrote:RegisterPMultiplier(aI)
R.Rupture:RegisterPMultiplier(aI)
local function aJ()
    if _ < 2 then
        return false
    elseif Q.Commons.UsePriorityRotation == "Always" then
        return true
    elseif Q.Commons.UsePriorityRotation == "On Bosses" and h:IsInBossList() then
        return true
    elseif Q.Commons.UsePriorityRotation == "Auto" then
        if g:InstanceDifficulty() == 16 and h:NPCID() == 138967 then
            return true
        end
    end
    return false
end
local function aK()
    if
        R.Deathmark:CooldownRemains() > R.Exsanguinate:CooldownRemains() and
            (d.BossFightRemainsIsNotValid() or d.BossFilteredFightRemains(">", R.Deathmark:CooldownRemains()))
     then
        return R.Deathmark:CooldownRemains()
    end
    return R.Exsanguinate:CooldownRemains()
end
local function aL(aM, i, aN)
    local aN = aN or i:PandemicThreshold()
    return aM:DebuffRefreshable(i, aN)
end
local function aO(aP, aQ, aR, aS)
    local aT, aU = nil, aR
    local aV = h:GUID()
    for aW, aX in pairs(aS) do
        if aX:GUID() ~= aV and O.UnitIsCycleValid(aX, aU, -aX:DebuffRemains(aP)) and aQ(aX) then
            aT, aU = aX, aX:TimeToDie()
        end
    end
    if aT then
        if aT:GUID() == f("mouseover"):GUID() and Q.Assassination.TargetSwap == "Mouseover" then
            if aP:ID() == 703 then
                al = 1703
            elseif aP:ID() == 1943 then
                al = 11943
            end
        elseif Q.Assassination.TargetSwap == "AutoSwap" and aT:GUID() ~= h:GUID() and not y then
            al = 9999
        elseif aT:GUID() == h:GUID() then
            ak = aP:ID()
        end
        u(aT, aP)
    elseif Q.Commons.RangedMultiDoT then
        aT, aU = nil, aR
        for aW, aX in pairs(Z) do
            if aX:GUID() ~= aV and O.UnitIsCycleValid(aX, aU, -aX:DebuffRemains(aP)) and aQ(aX) then
                aT, aU = aX, aX:TimeToDie()
            end
        end
        if aT then
            if aT:GUID() == f("mouseover"):GUID() and Q.Assassination.TargetSwap == "Mouseover" then
                if aP:ID() == 703 then
                    al = 1703
                elseif aP:ID() == 1943 then
                    al = 11943
                end
            elseif Q.Assassination.TargetSwap == "AutoSwap" and aT:GUID() ~= h:GUID() and not y then
                al = 9999
            elseif aT:GUID() == h:GUID() then
                ak = aP:ID()
            end
            u(aT, aP)
        end
    end
end
local function aY(aZ, a_, b0)
    local b1 = a_(h)
    if aZ == "first" and b1 ~= 0 then
        return h
    end
    local aT, b2 = nil, 0
    local function b3(aS)
        for aW, aX in pairs(aS) do
            local b4 = a_(aX)
            if not aT and aZ == "first" then
                if b4 ~= 0 then
                    aT, b2 = aX, b4
                end
            elseif aZ == "min" then
                if not aT or b4 < b2 then
                    aT, b2 = aX, b4
                end
            elseif aZ == "max" then
                if not aT or b4 > b2 then
                    aT, b2 = aX, b4
                end
            end
            if aT and b4 == b2 and aX:TimeToDie() > aT:TimeToDie() then
                aT, b2 = aX, b4
            end
        end
    end
    b3(a0)
    if Q.Commons.RangedMultiDoT then
        b3(Z)
    end
    if aT and b2 == b1 and b0(h) then
        return h
    end
    if aT and b0(aT) then
        return aT
    end
    return nil
end
local function b5()
    return R.ResoundingClarity:IsAvailable() and 7 or P.CPMaxSpend()
end
local function b6(b7, b8, b9)
    local ba = h:TimeToDie()
    if not d.BossFightRemainsIsNotValid() then
        ba = d.BossFightRemains()
    elseif ba < b9 then
        return false
    end
    if M((ba - b9) / b7) > M((ba - b9 - b8) / b7) then
        return true
    end
    return false
end
local function bb(aM)
    if aM:DebuffUp(R.SerratedBoneSpikeDebuff) then
        return 1000000
    end
    return aM:TimeToDie()
end
local function bc(aM)
    if
        not aM:DebuffUp(R.SerratedBoneSpikeDebuff) and aM:IsInMeleeRange(10) and aM:GUID() == f("mouseover"):GUID() and
            Q.Assassination.TargetSwap == "Mouseover"
     then
        al = 1328547
        return true
    elseif
        not aM:DebuffUp(R.SerratedBoneSpikeDebuff) and aM:IsInMeleeRange(10) and
            Q.Assassination.TargetSwap == "AutoSwap" and
            aM:GUID() ~= h:GUID() and
            not y
     then
        al = 9999
        return true
    elseif not aM:DebuffUp(R.SerratedBoneSpikeDebuff) and aM:IsInMeleeRange(10) and aM:GUID() == h:GUID() then
        ak = 328547
        return true
    elseif not aM:DebuffUp(R.SerratedBoneSpikeDebuff) and aM:IsInMeleeRange(10) then
        return true
    end
end
local function bd()
    if R.BloodFury:IsReady() and r() and Q.Commons.Enabled.Racials then
        if p.Cast(R.BloodFury, nil) then
            ak = 20572
            return "Cast Blood Fury"
        end
    end
    if R.Berserking:IsReady() and r() and Q.Commons.Enabled.Racials then
        if p.Cast(R.Berserking, nil) then
            ak = 26297
            return "Cast Berserking"
        end
    end
    if R.Fireblood:IsReady() and r() and Q.Commons.Enabled.Racials then
        if p.Cast(R.Fireblood, nil) then
            ak = 265221
            return "Cast Fireblood"
        end
    end
    if R.AncestralCall:IsReady() and r() and Q.Commons.Enabled.Racials then
        if p.Cast(R.AncestralCall, nil) then
            ak = 274738
            return "Cast Ancestral Call"
        end
    end
end
local function be()
    if R.Vanish:IsCastable() and r() and not B and h:IsInMeleeRange(10) and not g:IsTanking(h) then
        if
            R.ImprovedGarrote:IsAvailable() and R.Garrote:CooldownUp() and not P.Exsanguinated(h, R.Garrote) and
                (h:PMultiplier(R.Garrote) <= 1 or aL(h, R.Garrote))
         then
            if (R.Deathmark:AnyDebuffUp() or R.Deathmark:CooldownRemains() < 4) and a5 >= math.min(_, 4) then
                if Q.Commons.ShowPooling and g:EnergyPredicted() < 45 then
                    if s(R.PoolEnergy) then
                        ak = 999999
                        return "Pool for Vanish (Garrote Deathmark)"
                    end
                end
                if s(R.Vanish, nil) then
                    ak = 1856
                    return "Cast Vanish (Garrote Deathmark)"
                end
            end
            if
                _ > 3 - m(R.IndiscriminateCarnage:IsAvailable()) and
                    (not R.IndiscriminateCarnage:IsAvailable() or R.IndiscriminateCarnage:CooldownUp())
             then
                if Q.Commons.ShowPooling and g:EnergyPredicted() < 45 then
                    if s(R.PoolEnergy) then
                        ak = 999999
                        return "Pool for Vanish (Garrote)"
                    end
                end
                if s(R.Vanish, nil) then
                    ak = 1856
                    return "Cast Vanish (Garrote)"
                end
            end
        end
        if
            not R.ImprovedGarrote:IsAvailable() and R.MasterAssassin:IsAvailable() and not aL(h, R.Rupture) and
                h:DebuffRemains(R.Garrote) > 3 and
                h:DebuffUp(R.Deathmark) and
                (h:DebuffUp(R.ShivDebuff) or h:DebuffRemains(R.Deathmark) < 4 or h:DebuffUp(R.Sepsis)) and
                h:DebuffRemains(R.Sepsis) < 3
         then
            if s(R.Vanish, nil) then
                ak = 1856
                return "Cast Vanish (Master Assassin)"
            end
        end
    end
    if R.ShadowDance:IsCastable() and h:IsInMeleeRange(10) then
        if
            R.ImprovedGarrote:IsAvailable() and R.Garrote:CooldownUp() and not P.Exsanguinated(h, R.Garrote) and
                h:PMultiplier(R.Garrote) <= 1 and
                (R.Deathmark:AnyDebuffUp() or R.Deathmark:CooldownRemains() < 12 or R.Deathmark:CooldownRemains() > 60) and
                a5 >= math.min(_, 4)
         then
            if s(R.ShadowDance, nil) then
                ak = 185313
                return "Cast Shadow Dance (Garrote)"
            end
        end
        if
            not R.ImprovedGarrote:IsAvailable() and R.MasterAssassin:IsAvailable() and not aL(h, R.Rupture) and
                h:DebuffRemains(R.Garrote) > 3 and
                (h:DebuffUp(R.Deathmark) or R.Deathmark:CooldownRemains() > 60) and
                (h:DebuffUp(R.ShivDebuff) or h:DebuffRemains(R.Deathmark) < 4 or h:DebuffUp(R.Sepsis)) and
                h:DebuffRemains(R.Sepsis) < 3
         then
            if s(R.ShadowDance, nil) then
                ak = 185313
                return "Cast Shadow Dance (Master Assassin)"
            end
        end
    end
end
local function bf()
    if R.MarkedforDeath:IsCastable() and h:IsInMeleeRange(10) then
        if h:FilteredTimeToDie("<", g:ComboPointsDeficit() * 1.5) then
            if s(R.MarkedforDeath, nil) then
                ak = 137619
                return "Cast Marked for Death"
            end
        end
        if p.CDsON() then
            if s(R.MarkedforDeath, nil) then
                ak = 137619
                return "Cast Marked for Death"
            end
        end
    end
    if not X or not p.CDsON() then
        return
    end
    if not g:StealthUp(true, false) then
        if
            R.Sepsis:IsReady() and aH() == 0 and
                (R.ImprovedGarrote:IsAvailable() and R.Garrote:CooldownUp() or h:DebuffUp(R.Garrote)) and
                (h:FilteredTimeToDie(">", 10) or d.BossFilteredFightRemains("<=", 10))
         then
            if s(R.Sepsis, nil, nil) then
                ak = 328305
                return "Cast Sepsis"
            end
        end
        if
            aC:IsReady() and not o(T, aC:ID()) and
                (aj == 1 and (R.Deathmark:AnyDebuffUp() or d.BossFilteredFightRemains("<", 20)) or
                    aj == 2 and (not aD:IsReady() or R.Deathmark:CooldownRemains() > 20) or
                    aj == 0)
         then
            if aC:ID() == TopTrinketID and Q.Commons.Enabled.TopTrinket then
                ak = 24
                return "Generic use_items for " .. aC:Name()
            elseif aC:ID() == BotTrinketID and Q.Commons.Enabled.BottomTrinket then
                ak = 25
                return "Generic use_items for " .. aC:Name()
            end
        elseif
            aD:IsReady() and not o(T, aD:ID()) and
                (aj == 2 and (R.Deathmark:AnyDebuffUp() or d.BossFilteredFightRemains("<", 20)) or
                    aj == 1 and (not aC:IsReady() or R.Deathmark:CooldownRemains() > 20) or
                    aj == 0)
         then
            if aD:ID() == TopTrinketID and Q.Commons.Enabled.TopTrinket then
                ak = 24
                return "Generic use_items for " .. aD:Name()
            elseif aD:ID() == BotTrinketID and Q.Commons.Enabled.BottomTrinket then
                ak = 25
                return "Generic use_items for " .. aD:Name()
            end
        end
        if R.Deathmark:IsCastable() then
            if
                h:DebuffUp(R.Rupture) and not R.Deathmark:AnyDebuffUp() and
                    (not R.Exsanguinate:IsAvailable() or R.Exsanguinate:CooldownRemains() > 15 or
                        P.Exsanguinated(h, R.Rupture) or
                        P.Exsanguinated(h, R.Garrote)) and
                    (not R.MasterAssassin:IsAvailable() or h:DebuffUp(R.Garrote))
             then
                if s(R.Deathmark, nil) then
                    ak = 360194
                    return "Cast Deathmark"
                end
            end
        end
        if
            R.Kingsbane:IsReady() and (h:DebuffUp(R.ShivDebuff) or R.Shiv:CooldownRemains() < 6) and g:BuffUp(R.Envenom) and
                (R.Deathmark:CooldownRemains() >= 50 or h:DebuffUp(R.Deathmark))
         then
            if s(R.Kingsbane, nil) then
                ak = 385627
                a1 = "Cast Kingsbane"
            end
        end
        if R.Exsanguinate:IsAvailable() then
            if
                aH() == 0 and h:DebuffDown(R.Deathmark) and h:FilteredTimeToDie(">", ExsanguinateSyncRemains + 4) and
                    ExsanguinateSyncRemains < 4
             then
                if
                    R.ResoundingClarity:IsAvailable() and R.EchoingReprimand:IsReady() and g:ComboPoints() <= 2 and
                        ExsanguinateSyncRemains <= 2 and
                        not aL(h, R.Garrote) and
                        h:DebuffRemains(R.Rupture) > 9.6
                 then
                    if s(R.EchoingReprimand, nil, nil, not W) then
                        ak = 323547
                        return "Cast Echoing Reprimand (Exsang Sync)"
                    end
                end
                if
                    R.Exsanguinate:IsReady() and not aL(h, R.Garrote) and h:DebuffRemains(R.Rupture) > 4 + 4 * b5() or
                        h:FilteredTimeToDie("<", h:DebuffRemains(R.Rupture) * 0.5)
                 then
                    if s(R.Exsanguinate, nil) then
                        ak = 200806
                        a1 = "Cast Exsanguinate"
                    end
                end
                if
                    R.Exsanguinate:IsReady() and not aL(h, R.Garrote) and h:DebuffRemains(R.Rupture) > 4 + 4 * b5() or
                        h:FilteredTimeToDie("<", h:DebuffRemains(R.Rupture) * 0.5)
                 then
                    if s(R.Exsanguinate, nil, nil, not W) then
                        ak = 200806
                        return "Cast Exsanguinate "
                    end
                end
            end
        end
    end
    if R.Shiv:IsCastable() and not h:DebuffUp(R.ShivDebuff) and h:DebuffUp(R.Garrote) and h:DebuffUp(R.Rupture) then
        if R.Kingsbane:IsAvailable() then
            if h:DebuffUp(R.Kingsbane) and (not R.CrimsonTempest:IsAvailable() or ai or h:DebuffUp(R.CrimsonTempest)) then
                if s(R.Shiv, nil) then
                    ak = 5938
                    a1 = "Cast Shiv (Kingsbane)"
                end
            end
        end
        if R.ArterialPrecision:IsAvailable() then
            if
                R.Deathmark:AnyDebuffUp() or
                    R.Shiv:ChargesFractional() > R.Shiv:MaxCharges() - 0.5 and R.Deathmark:CooldownRemains() > 10
             then
                if s(R.Shiv, nil) then
                    ak = 5938
                    a1 = "Cast Shiv (Arterial Precision)"
                end
            end
        end
        if not R.ArterialPrecision:IsAvailable() and not R.ArterialPrecision:IsAvailable() then
            if R.Sepsis:IsAvailable() then
                if
                    m(R.Sepsis:CooldownUp() or R.Sepsis:CooldownRemains() > 12) +
                        m(R.Deathmark:CooldownUp() or R.Deathmark:CooldownRemains() > 12) ==
                        2
                 then
                    if s(R.Shiv, nil) then
                        ak = 5938
                        a1 = "Cast Shiv (Sepsis)"
                    end
                end
            else
                if
                    (not R.CrimsonTempest:IsAvailable() or ai or h:DebuffUp(R.CrimsonTempest)) and
                        (not R.Exsanguinate:IsAvailable() or ExsanguinateSyncRemains > 2)
                 then
                    if s(R.Shiv, nil) then
                        ak = 5938
                        a1 = "Cast Shiv"
                    end
                end
            end
        end
    end
    if
        R.ThistleTea:IsCastable() and not g:BuffUp(R.ThistleTea) and
            (g:EnergyDeficit() >= 100 + af or
                R.ThistleTea:Charges() == 3 and (h:DebuffUp(R.Kingsbane) or R.Deathmark:AnyDebuffUp()) or
                d.BossFilteredFightRemains("<", R.ThistleTea:Charges() * 6))
     then
        if p.Cast(R.ThistleTea, nil) then
            ak = 381623
            return "Cast Thistle Tea"
        end
    end
    if not p.CDsON() then
        return
    end
    if
        R.IndiscriminateCarnage:IsReady() and _ > 1 and
            (not R.ImprovedGarrote:IsAvailable() or R.Vanish:CooldownRemains() > 45)
     then
        if s(R.IndiscriminateCarnage, nil) then
            ak = 381802
            return "Cast Indiscriminate Carnage"
        end
    end
    if
        Q.Commons.Enabled.Potions and r() and z and
            ((g:BloodlustUp() or d.BossFightRemains() <= 30 or h:DebuffUp(R.Deathmark)) and
                not p.GUISettings.General.HoldPotforBL or
                p.GUISettings.General.HoldPotforBL and g:BloodlustUp())
     then
        local bg = O.PotionSelected()
        if bg and bg:IsReady() then
            if s(bg, nil, nil) then
                ak = 37
                return "potion cooldowns 2"
            end
        end
    end
    if R.Deathmark:AnyDebuffUp() then
        if a1 then
            bd()
        else
            a1 = bd()
        end
    end
    if not g:StealthUp(true, true) and aH() <= 0 and aG() <= 0 then
        if a1 then
            be()
        else
            a1 = be()
        end
    end
    if R.ColdBlood:IsReady() and g:DebuffDown(R.ColdBlood) and a4 >= 4 then
        if s(R.ColdBlood, nil) then
            ak = 382245
            return "Cast Cold Blood"
        end
    end
    return a1
end
local function bh()
    if R.IndiscriminateCarnage:IsReady() and w and h:IsInMeleeRange(10) and _ > 1 then
        if s(R.IndiscriminateCarnage, Q.Assassination.OffGCDasOffGCD.IndiscriminateCarnage) then
            ak = 381802
            return "Cast Indiscriminate Carnage"
        end
    end
    if R.Garrote:IsCastable() and h:IsInMeleeRange(10) and aH() > 0 then
        local function bi(aM)
            return aM:DebuffRemains(R.Garrote)
        end
        local function bj(aM)
            if
                not P.WillLoseExsanguinate(aM, R.Garrote) and
                    (aM:PMultiplier(R.Garrote) <= 1 or
                        aM:DebuffRemains(R.Garrote) < 12 / P.ExsanguinatedRate(aM, R.Garrote)) and
                    (aM:FilteredTimeToDie(">", 2, -aM:DebuffRemains(R.Garrote)) or aM:TimeToDieIsNotValid()) and
                    P.CanDoTUnit(aM, a9)
             then
                if aM:GUID() == f("mouseover"):GUID() and Q.Assassination.TargetSwap == "Mouseover" then
                    al = 1703
                    return true
                elseif Q.Assassination.TargetSwap == "AutoSwap" and aM:GUID() ~= h:GUID() and not y then
                    al = 9999
                    return true
                elseif aM:GUID() == h:GUID() then
                    ak = 703
                    return true
                else
                    return true
                end
            end
        end
        local bk = aY("min", bi, bj)
        if bk and bk:GUID() ~= h:GUID() then
            u(bk, R.Garrote)
        end
        if bj(h) then
            if t(R.Garrote, nil, not W) then
                ak = 703
                return "Cast Garrote (Improved Garrote)"
            end
        end
        if R.Exsanguinate:IsAvailable() and _ == 1 and aH() < 1.3 then
            if t(R.Garrote, nil, not W) then
                ak = 703
                return "Pool for Garrote (Exsanguinate Refresh)"
            end
        end
        if
            R.Exsanguinate:IsAvailable() and _ == 1 and not P.WillLoseExsanguinate(h, R.Garrote) and
                (h:DebuffRemains(R.Garrote) < 18 / P.ExsanguinatedRate(h, R.Garrote) or h:PMultiplier(R.Garrote) <= 1) and
                ExsanguinateSyncRemains < 18 and
                aH() < 1.3
         then
            if t(R.Garrote, nil, not W) then
                ak = 703
                return "Pool for Garrote (Exsanguinate Refresh)"
            end
        end
    end
end
local function bl()
    local bm, bn, bo = false, false, false
    if ad then
        bm = _ > 3 and (h:DebuffRemains(R.Garrote) < 6 or ah)
        bn = h:DebuffUp(R.ShivDebuff) and _ > 2 or ah
    end
    if p.CDsON() and h:IsInMeleeRange(10) and R.Exsanguinate:IsAvailable() and ExsanguinateSyncRemains < 2 then
        if
            R.Garrote:IsCastable() and W and _ == 1 and not P.WillLoseExsanguinate(h, R.Garrote) and
                h:PMultiplier(R.Garrote) <= 1 and
                h:FilteredTimeToDie(">", h:DebuffRemains(R.Garrote) * 0.5)
         then
            if t(R.Garrote) then
                ak = 703
                return "Cast Garrote (Pre-Exsanguinate)"
            end
        end
        if
            R.Rupture:IsReady() and W and h:PMultiplier(R.Rupture) <= 1 and not P.WillLoseExsanguinate(h, R.Rupture) and
                (a4 >= b5() and R.Exsanguinate:CooldownRemains() < 1 and
                    h:FilteredTimeToDie(">", h:DebuffRemains(R.Rupture) * 0.5))
         then
            if s(R.Rupture) then
                ak = 1943
                return "Cast Rupture (Pre-Exsanguinate)"
            end
        end
    end
    if R.Garrote:IsCastable() and h:IsInMeleeRange(10) and a5 >= 1 then
        local function bp(aM)
            ac = P.Exsanguinated(aM, R.Garrote) and a3 or a2
            return aL(aM, R.Garrote) and aG() <= 0 and
                (aM:PMultiplier(R.Garrote) <= 1 or _ >= 3 and aM:DebuffRemains(R.Garrote) <= ac) and
                (not P.WillLoseExsanguinate(aM, R.Garrote) or aM:DebuffRemains(R.Garrote) <= ac * (1 + m(_ >= 3)))
        end
        if
            bp(h) and P.CanDoTUnit(h, a9) and
                (h:FilteredTimeToDie(">", 4, -h:DebuffRemains(R.Garrote)) or h:TimeToDieIsNotValid())
         then
            if t(R.Garrote, nil, not W) then
                ak = 703
                return "Pool for Garrote (ST)"
            end
        end
        if not bm then
            aO(R.Garrote, bp, 12, a0)
        end
    end
    if
        R.CrimsonTempest:IsReady() and h:IsInMeleeRange(10) and _ >= 2 and a4 >= 4 and af > 20 and
            (not R.Deathmark:CooldownUp() or h:DebuffUp(R.Rupture))
     then
        for aW, aX in pairs(Z) do
            if aX:DebuffRemains(R.CrimsonTempest) < 2 + 3 * m(_ >= 4) then
                if s(R.CrimsonTempest) then
                    ak = 121411
                    return "Cast Crimson Tempest (AoE)"
                end
            end
        end
    end
    if R.Rupture:IsReady() and h:IsInMeleeRange(10) and a4 >= 4 then
        aa = 4 + m(R.DashingScoundrel:IsAvailable()) * 5 + m(R.Doomblade:IsAvailable()) * 5 + m(ah) * 6
        local function bq(aM)
            ab = P.Exsanguinated(aM, R.Rupture) and a3 or a2
            return aL(aM, R.Rupture, a6) and
                (aM:PMultiplier(R.Rupture) <= 1 or aM:DebuffRemains(R.Rupture) <= ab and _ >= 3) and
                (not P.WillLoseExsanguinate(aM, R.Rupture) or aM:DebuffRemains(R.Rupture) <= ab * (1 + m(_ >= 3))) and
                (aM:FilteredTimeToDie(">", aa, -aM:DebuffRemains(R.Rupture)) or aM:TimeToDieIsNotValid())
        end
        if not bo and bq(h) and P.CanDoTUnit(h, a8) then
            if s(R.Rupture, nil, nil, not W) then
                ak = 1943
                return "Cast Rupture (Refresh)"
            end
        end
        if not bo and not bn and p.AoEON() then
            aO(R.Rupture, bq, aa, a0)
        end
    end
    if p.AoEON() and h:IsInMeleeRange(10) and R.CrimsonTempest:IsReady() and _ >= 2 and a4 >= 4 then
        for aW, aX in pairs(Z) do
            if aX:DebuffRemains(R.CrimsonTempest) < 2 + 3 * m(_ >= 4) then
                if s(R.CrimsonTempest) then
                    ak = 121411
                    return "Cast Crimson Tempest (AoE Fallback)"
                end
            end
        end
    end
    if
        R.CrimsonTempest:IsReady() and X and _ == 1 and not R.DashingScoundrel:IsAvailable() and
            a4 >= P.CPMaxSpend() - 1 and
            aL(h, R.CrimsonTempest, a7) and
            not P.WillLoseExsanguinate(h, R.CrimsonTempest) and
            not h:DebuffUp(R.ShivDebuff) and
            h:DebuffStack(R.AmplifyingPoisonDebuff) < 15 and
            (not R.Kingsbane:IsAvailable() or g:BuffUp(R.Envenom) or not R.Kingsbane:CooldownUp()) and
            (h:FilteredTimeToDie(">", 4, -h:DebuffRemains(R.CrimsonTempest)) or h:TimeToDieIsNotValid()) and
            P.CanDoTUnit(h, a8)
     then
        if s(R.CrimsonTempest) then
            ak = 121411
            return "Cast Crimson Tempest (ST)"
        end
    end
    return false
end
local function br()
    if
        R.Envenom:IsReady() and a4 >= 4 + m(R.DeeperStratagem:IsAvailable()) and
            (h:DebuffUp(R.Deathmark) or h:DebuffUp(R.ShivDebuff) or h:DebuffStack(R.AmplifyingPoisonDebuff) >= 10 or
                g:EnergyDeficit() <= 25 + af or
                not ai or
                a4 > P.CPMaxSpend()) and
            (not R.Exsanguinate:IsAvailable() or ExsanguinateSyncRemains > 2 or not p.CDsON() or
                R.ResoundingClarity:IsAvailable() and (R.EchoingReprimand:IsReady() and g:ComboPoints() > 2 or a4 > 5))
     then
        if s(R.Envenom, nil, nil, not W) then
            ak = 32645
            return "Cast Envenom"
        end
    end
    if not (a5 > 1 or g:EnergyDeficit() <= 25 + af or not ai) then
        return false
    end
    if R.SerratedBoneSpike:IsReady() and h:IsInMeleeRange(10) then
        if not h:DebuffUp(R.SerratedBoneSpikeDebuff) then
            if s(R.SerratedBoneSpike, nil, nil, not X) then
                ak = 328547
                return "Cast Serrated Bone Spike"
            end
        else
            if p.AoEON() then
                if O.CastTargetIf(R.SerratedBoneSpike, Y, "min", bb, bc) then
                    return "Cast Serrated Bone (AoE)"
                end
                if bb(h) and bc(h) then
                    if s(R.SerratedBoneSpike, nil, nil, not X) then
                        ak = 328547
                        return "Cast Serrated Bone (AoE)"
                    end
                end
            end
            if aG() < 0.8 then
                if
                    d.BossFightRemains() <= 5 or
                        R.SerratedBoneSpike:MaxCharges() - R.SerratedBoneSpike:ChargesFractional() <= 0.25
                 then
                    if s(R.SerratedBoneSpike, nil, nil, not X) then
                        ak = 328547
                        return "Cast Serrated Bone Spike (Dump Charge)"
                    end
                elseif not ai and h:DebuffUp(R.ShivDebuff) then
                    if s(R.SerratedBoneSpike, nil, nil, not X) then
                        ak = 328547
                        return "Cast Serrated Bone Spike (Shiv)"
                    end
                end
            end
        end
    end
    if
        r() and h:IsInMeleeRange(10) and R.EchoingReprimand:IsReady() and
            ((not R.Exsanguinate:IsAvailable() or not R.ResoundingClarity:IsAvailable()) and
                (not R.Deathmark:IsAvailable() or R.Deathmark:CooldownRemains() > 10) or
                d.BossFilteredFightRemains("<=", 20))
     then
        if s(R.EchoingReprimand, nil, nil, not W) then
            ak = 323547
            return "Cast Echoing Reprimand"
        end
    end
    if R.FanofKnives:IsCastable() and h:IsInMeleeRange(10) then
        if
            p.AoEON() and _ >= 1 and
                (not ad and _ >= 3 + m(g:StealthUp(true, false)) + m(R.DragonTemperedBlades:IsAvailable()))
         then
            if t(R.FanofKnives) then
                ak = 51723
                return "Cast Fan of Knives"
            end
        end
        if p.AoEON() and g:BuffUp(R.DeadlyPoison) and _ >= 3 then
            for aW, aX in pairs(Z) do
                if
                    not aX:DebuffUp(R.DeadlyPoisonDebuff, true) and
                        (not ad or aX:DebuffUp(R.Garrote) or aX:DebuffUp(R.Rupture))
                 then
                    if t(R.FanofKnives) then
                        ak = 51723
                        return "Cast Fan of Knives (DP Refresh)"
                    end
                end
            end
        end
    end
    if R.Ambush:IsCastable() and h:IsInMeleeRange(10) and (g:StealthUp(true, true) or g:BuffUp(R.BlindsideBuff)) then
        if t(R.Ambush, nil, not W) then
            ak = 8676
            return "Cast Ambush"
        end
    end
    if
        R.Mutilate:IsCastable() and _ == 2 and h:DebuffDown(R.DeadlyPoisonDebuff, true) and
            h:DebuffDown(R.AmplifyingPoisonDebuff, true)
     then
        local aV = h:GUID()
        for aW, aX in pairs(a0) do
            if
                aX:GUID() ~= aV and (aX:DebuffUp(R.Garrote) or aX:DebuffUp(R.Rupture)) and
                    not aX:DebuffUp(R.DeadlyPoisonDebuff, true) and
                    not aX:DebuffUp(R.AmplifyingPoisonDebuff, true)
             then
                if aX:GUID() == f("mouseover"):GUID() and Q.Assassination.TargetSwap == "Mouseover" then
                    al = 11329
                elseif Q.Assassination.TargetSwap == "AutoSwap" and aX:GUID() ~= h:GUID() and not y then
                    al = 9999
                elseif aX:GUID() == h:GUID() then
                    ak = 1329
                end
                u(aX, R.Mutilate)
                break
            end
        end
    end
    if R.Mutilate:IsCastable() and h:IsInMeleeRange(10) then
        if t(R.Mutilate, nil, not W) then
            ak = 1329
            return "Cast Mutilate"
        end
    end
    return false
end
local function bs()
    x = HeroRotationCharDB.Toggles[6]
    v = HeroRotationCharDB.Toggles[4]
    w = HeroRotationCharDB.Toggles[5]
    y = HeroRotationCharDB.Toggles[12]
    z = not HeroRotationCharDB.Toggles[15]
    A = HeroRotationCharDB.Toggles[20]
    B = HeroRotationCharDB.Toggles[21]
    C = HeroRotationCharDB.Toggles[22]
    D = HeroRotationCharDB.Toggles[23]
    E = HeroRotationCharDB.Toggles[24]
    F = HeroRotationCharDB.Toggles[25]
    G = HeroRotationCharDB.Toggles[26]
    H = HeroRotationCharDB.Toggles[27]
    I = HeroRotationCharDB.Toggles[28]
    J = HeroRotationCharDB.Toggles[29]
    K = HeroRotationCharDB.Toggles[30]
    L = HeroRotationCharDB.Toggles[54]
    TopTrinketID = GetInventoryItemID("player", 13)
    BotTrinketID = GetInventoryItemID("player", 14)
    if not Q.Commons.Enabled.TopTrinket and not Q.Commons.Enabled.BotTrinket then
        OnUseExcludes = {TopTrinketID, BotTrinketID, S.CacheOfAcquiredTreasures:ID()}
    elseif not Q.Commons.Enabled.TopTrinket and Q.Commons.Enabled.BotTrinket then
        OnUseExcludes = {TopTrinketID, S.CacheOfAcquiredTreasures:ID()}
    elseif not Q.Commons.Enabled.BotTrinket and Q.Commons.Enabled.TopTrinket then
        OnUseExcludes = {BotTrinketID, S.CacheOfAcquiredTreasures:ID()}
    end
end
local function bt()
    U = R.AcrobaticStrikes:IsAvailable() and 8 or 5
    V = R.AcrobaticStrikes:IsAvailable() and 10 or 13
    W = h:IsInMeleeRange(U)
    X = h:IsInMeleeRange(V)
    if q() then
        Y = g:GetEnemiesInRange(30)
        Z = g:GetEnemiesInMeleeRange(V)
        _ = #Z
        a0 = g:GetEnemiesInMeleeRange(U)
    else
        Y = {}
        Z = {}
        _ = 1
        a0 = {}
    end
    a2, a3 = 2 * g:SpellHaste(), 1 * g:SpellHaste()
    a4 = P.EffectiveComboPoints(g:ComboPoints())
    a5 = g:ComboPointsMax() - a4
    a6 = (4 + a4 * 4) * 0.3
    a7 = (2 + a4 * 2) * 0.3
    a8 = R.Envenom:Damage() * Q.Assassination.EnvenomDMGOffset
    a9 = R.Mutilate:Damage() * Q.Assassination.MutilateDMGOffset
    ad = aJ()
    a1 = bs()
    if a1 then
        return a1
    end
    if al > 0 then
        al = 0
    end
    if ak > 0 then
        ak = 0
    end
    ak = P.ReturnSpell()
    al = P.ReturnSpellMO()
    a1 = P.CrimsonVial()
    if a1 then
        return a1
    end
    a1 = P.Feint()
    if a1 then
        return a1
    end
    local bu = g:AffectingCombat() and 180 or 900
    local bv
    if
        i(8679):IsAvailable() and
            (Q.Assassination.LethalPoison1 == "Wound Poison" or
                R.DragonTemperedBlades:IsAvailable() and Q.Assassination.LethalPoison2 == "Wound Poison")
     then
        bv = g:BuffRemains(i(8679))
        if bv < bu and not g:IsCasting(i(8679)) then
            if p.Cast(i(8679)) then
                ak = 203
                return "Wound Poison Refresh"
            end
        end
    elseif
        i(2823):IsAvailable() and
            (Q.Assassination.LethalPoison1 == "Deadly Poison" or
                R.DragonTemperedBlades:IsAvailable() and Q.Assassination.LethalPoison2 == "Deadly Poison")
     then
        bv = g:BuffRemains(i(2823))
        if bv < bu and not g:IsCasting(i(2823)) then
            if p.Cast(i(2823)) then
                ak = 208
                return "Deadly Poison Refresh"
            end
        end
    elseif
        i(315584):IsAvailable() and
            (Q.Assassination.LethalPoison1 == "Instant Poison" or
                R.DragonTemperedBlades:IsAvailable() and Q.Assassination.LethalPoison2 == "Instant Poison")
     then
        bv = g:BuffRemains(i(315584))
        if bv < bu and not g:IsCasting(i(315584)) then
            if p.Cast(i(315584)) then
                ak = 205
                return "Instant Poison Refresh"
            end
        end
    elseif
        i(381664):IsAvailable() and
            (Q.Assassination.LethalPoison1 == "Amplifying Poison" or
                R.DragonTemperedBlades:IsAvailable() and Q.Assassination.LethalPoison2 == "Amplifying Poison")
     then
        bv = g:BuffRemains(i(381664))
        if bv < bu and not g:IsCasting(i(381664)) then
            if p.Cast(i(381664)) then
                ak = 209
                return "Amplifying Poison Refresh"
            end
        end
    end
    if
        i(381637):IsAvailable() and
            (Q.Assassination.NonLethalPoison1 == "Atrophic Poison" or
                R.DragonTemperedBlades:IsAvailable() and Q.Assassination.NonLethalPoison2 == "Atrophic Poison")
     then
        bv = g:BuffRemains(i(381637))
        if bv < bu and not g:IsCasting(i(381637)) then
            if p.Cast(i(381637)) then
                ak = 381637
                return "Atropic Poison Refresh"
            end
        end
    elseif
        i(5761):IsAvailable() and
            (Q.Assassination.NonLethalPoison1 == "Numbing Poison" or
                R.DragonTemperedBlades:IsAvailable() and Q.Assassination.NonLethalPoison2 == "Numbing Poison")
     then
        bv = g:BuffRemains(i(5761))
        if bv < bu and not g:IsCasting(NumbingPoison) then
            if p.Cast(i(5761)) then
                ak = 204
                return "Numbing Poison Refresh"
            end
        end
    end
    if not g:AffectingCombat() and not g:IsDeadOrGhost() then
        if not g:BuffUp(P.VanishBuffSpell()) then
            a1 = P.Stealth(P.StealthSpell())
            if a1 then
                return a1
            end
        end
        if not g:BuffUp(R.SliceandDice) then
            if R.SliceandDice:IsReady() and a4 >= 2 then
                if s(R.SliceandDice) then
                    ak = 5171
                    return "Cast Slice and Dice"
                end
            end
        end
    end
    P.MfDSniping(R.MarkedforDeath)
    if O.TargetIsValid() and (g:AffectingCombat() and not h:DebuffUp(R.Sap) or x) then
        if a1 then
            return a1
        end
        ae = P.PoisonedBleeds()
        af = g:EnergyRegen() + ae * 6 / (2 * g:SpellHaste())
        ag = g:EnergyDeficit() / af
        ah = af > 35
        ai = _ < 2
        if g:StealthUp(true, false) or aH() > 0 then
            a1 = bh()
            if a1 then
                return a1 .. " (Stealthed)"
            end
        end
        a1 = bf()
        if a1 then
            return a1
        end
        if not g:BuffUp(R.SliceandDice) and h:IsInMeleeRange(10) then
            if
                R.SliceandDice:IsReady() and g:ComboPoints() >= 2 or
                    not R.CutToTheChase:IsAvailable() and g:ComboPoints() >= 4 and
                        g:BuffRemains(R.SliceandDice) < (1 + g:ComboPoints()) * 1.8
             then
                if s(R.SliceandDice) then
                    ak = 5171
                    return "Cast Slice and Dice"
                end
            end
        elseif X and R.CutToTheChase:IsAvailable() then
            if
                R.Envenom:IsReady() and h:IsInMeleeRange(10) and g:BuffRemains(R.SliceandDice) < 5 and
                    g:ComboPoints() >= 4
             then
                if s(R.Envenom, nil, nil, not W) then
                    ak = 32645
                    return "Cast Envenom (CttC)"
                end
            end
        else
            if
                R.PoisonedKnife:IsCastable() and h:IsInRange(30) and not g:StealthUp(true, true) and g:AffectingCombat() and
                    _ == 0 and
                    g:EnergyTimeToMax() <= g:GCD() * 1.5
             then
                if s(R.PoisonedKnife) then
                    ak = 185565
                    return "Cast Poisoned Knife"
                end
            end
        end
        a1 = bl()
        if a1 then
            return a1
        end
        a1 = br()
        if a1 then
            return a1
        end
        if r() and Q.Commons.Enabled.Racials then
            if R.ArcaneTorrent:IsCastable() and h:IsInMeleeRange(8) and g:EnergyDeficitPredicted() > 15 + af then
                if s(R.ArcaneTorrent, nil) then
                    ak = 155145
                    return "Cast Arcane Torrent"
                end
            end
            if R.ArcanePulse:IsCastable() and h:IsInMeleeRange(8) then
                if s(R.ArcanePulse, nil) then
                    ak = 260364
                    return "Cast Arcane Pulse"
                end
            end
            if R.LightsJudgment:IsCastable() and h:IsInMeleeRange(8) then
                if s(R.LightsJudgment, nil) then
                    ak = 255647
                    return "Cast Lights Judgment"
                end
            end
            if R.BagofTricks:IsCastable() and h:IsInMeleeRange(8) then
                if s(R.BagofTricks, nil) then
                    ak = 312411
                    return "Cast Bag of Tricks"
                end
            end
        end
        if R.Mutilate:IsCastable() and X then
            if s(R.PoolEnergy) then
                shadowcast = 9999999999
                return "Normal Pooling"
            end
        end
    end
end
local function bw()
    R.Deathmark:RegisterAuraTracking()
    R.Sepsis:RegisterAuraTracking()
end
function ReturnSpellAss()
    if ak == 0 then
        return 0
    else
        return ak
    end
end
function ReturnSpellMOAss()
    if al == 0 then
        return 0
    else
        return al
    end
end
p.SetAPL(259, bt, bw)
