local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = d.Spell;
local j = d.MultiSpell;
local k = d.Item;
local l = d.Utils.num;
local m = d.Utils.BoolToInt;
local n = d.Utils.IntToBool;
local o = d.Utils.ValueIsInArray;
local p = HeroRotation;
local q = p.AoEON;
local r = p.CDsON;
local s = p.Cast;
local t = p.CastPooling;
local u = p.CastLeftNameplate;
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
local pairs = pairs;
local M = math.floor;
local N = math.max;
local O = p.Commons.Everyone;
local P = p.Commons.Rogue;
local Q = { General = p.GUISettings.General, Commons = p.GUISettings.APL.Rogue.Commons,
    Assassination = p.GUISettings.APL.Rogue.Assassination }
local R = i.Rogue.Assassination;
local S = k.Rogue.Assassination;
local T = {}
local U, V, W, X;
local Y, Z, _, a0;
local a1;
local a2, a3 = 2 * g:SpellHaste(), 1 * g:SpellHaste()
local a4, a5;
local a6, a7, a8, a9, aa, ab, ac;
local ad;
local ae, af, ag, ah, ai;
local aj = 0;
local ak = P.ReturnSpell()
local al = P.ReturnSpellMO()
local am = g:GetEquipment()
local an = g:CovenantID()
local ao, ap, aq, ar = an == 1, an == 2, an == 3, an == 4;
local as = g:HasLegendaryEquipped(118)
local at = g:HasLegendaryEquipped(129)
local au = g:HasLegendaryEquipped(119)
local av = g:HasLegendaryEquipped(121)
local aw = g:HasLegendaryEquipped(117)
local ax = g:HasLegendaryEquipped(229) or g:HasUnity() and ap;
local ay = av and 0.55 or 1.0;
local az = ax and 0.56 or 1.0;
local aA, aB = g:HasTier(28, 2), g:HasTier(28, 4)
local aC = am[13] and k(am[13]) or k(0)
local aD = am[14] and k(am[14]) or k(0)
local function aE() if aC:TrinketHasStatAnyDps() and (not aD:TrinketHasStatAnyDps() or aC:Cooldown() >= aD:Cooldown()) then aj = 1 elseif aD:TrinketHasStatAnyDps() and (not aC:TrinketHasStatAnyDps() or aD:Cooldown() > aC:Cooldown()) then aj = 2 else aj = 0 end end
;
aE()
d:RegisterForEvent(function()
    am = g:GetEquipment()
    aC = am[13] and k(am[13]) or k(0)
    aD = am[14] and k(am[14]) or k(0)
    aE()
end, "PLAYER_EQUIPMENT_CHANGED")
local function l(aF) if aF then return 1 else return 0 end end
;
R.Envenom:RegisterDamageFormula(function() return g:AttackPowerDamageMod() * a4 * 0.22 * 1.0 *
        (h:DebuffUp(R.ShivDebuff) and 1.3 or 1) * (R.DeeperStratagem:IsAvailable() and 1.05 or 1) *
        (1 + g:MasteryPct() / 100) * (1 + g:VersatilityDmgPct() / 100) end)
R.Mutilate:RegisterDamageFormula(function() return (g:AttackPowerDamageMod() + g:AttackPowerDamageMod(true)) * 0.485 *
        1.0 * (1 + g:VersatilityDmgPct() / 100) end)
local function aG()
    if g:BuffRemains(R.MasterAssassinBuff) == 9999 then return g:GCDRemains() + 3 end
    ;
    return g:BuffRemains(R.MasterAssassinBuff)
end
;
local function aH()
    if g:BuffUp(R.ImprovedGarroteAura) then return g:GCDRemains() + 3 end
    ;
    return g:BuffRemains(R.ImprovedGarroteBuff)
end
;
local function aI() return R.ImprovedGarrote:IsAvailable() and aH() > 0 and 1.5 or 1 end
;
R.Garrote:RegisterPMultiplier(aI)
R.Rupture:RegisterPMultiplier(aI)
local function aJ()
    if _ < 2 then return false elseif Q.Commons.UsePriorityRotation == "Always" then return true elseif Q.Commons.UsePriorityRotation == "On Bosses" and h:IsInBossList() then return true elseif Q.Commons.UsePriorityRotation == "Auto" then if g:InstanceDifficulty() == 16 and h:NPCID() == 138967 then return true end end
    ;
    return false
end
;
local function aK(aL, i, aM)
    local aM = aM or i:PandemicThreshold()
    return aL:DebuffRefreshable(i, aM)
end
;
local function aN(aO, aP, aQ, aR)
    local aS, aT = nil, aQ;
    local aU = h:GUID()
    for aV, aW in pairs(aR) do if aW:GUID() ~= aU and O.UnitIsCycleValid(aW, aT, -aW:DebuffRemains(aO)) and aP(aW) then aS, aT =
                aW, aW:TimeToDie() end end
    ;
    if aS then
        if aS:GUID() == f("mouseover"):GUID() and Q.Assassination.TargetSwap == "Mouseover" then if aO:ID() == 703 then al = 1703 elseif aO:ID() == 1943 then al = 11943 end elseif Q.Assassination.TargetSwap == "AutoSwap" and aS:GUID() ~= h:GUID() and not y then al = 9999 elseif aS:GUID() == h:GUID() then ak =
            aO:ID() end
        ;
        u(aS, aO)
    elseif Q.Commons.RangedMultiDoT then
        aS, aT = nil, aQ;
        for aV, aW in pairs(Z) do if aW:GUID() ~= aU and O.UnitIsCycleValid(aW, aT, -aW:DebuffRemains(aO)) and aP(aW) then aS, aT =
                    aW, aW:TimeToDie() end end
        ;
        if aS then
            if aS:GUID() == f("mouseover"):GUID() and Q.Assassination.TargetSwap == "Mouseover" then if aO:ID() == 703 then al = 1703 elseif aO:ID() == 1943 then al = 11943 end elseif Q.Assassination.TargetSwap == "AutoSwap" and aS:GUID() ~= h:GUID() and not y then al = 9999 elseif aS:GUID() == h:GUID() then ak =
                aO:ID() end
            ;
            u(aS, aO)
        end
    end
end
;
local function aX(aY, aZ, a_)
    local b0 = aZ(h)
    if aY == "first" and b0 ~= 0 then return h end
    ;
    local aS, b1 = nil, 0;
    local function b2(aR) for aV, aW in pairs(aR) do
            local b3 = aZ(aW)
            if not aS and aY == "first" then if b3 ~= 0 then aS, b1 = aW, b3 end elseif aY == "min" then if not aS or b3 < b1 then aS, b1 =
                        aW, b3 end elseif aY == "max" then if not aS or b3 > b1 then aS, b1 = aW, b3 end end
            ;
            if aS and b3 == b1 and aW:TimeToDie() > aS:TimeToDie() then aS, b1 = aW, b3 end
        end end
    ;
    b2(a0)
    if Q.Commons.RangedMultiDoT then b2(Z) end
    ;
    if aS and b1 == b0 and a_(h) then return h end
    ;
    if aS and a_(aS) then return aS end
    ;
    return nil
end
;
local function b4() return R.ResoundingClarity:IsAvailable() and 7 or P.CPMaxSpend() end
;
local function b5(b6, b7, b8)
    local b9 = h:TimeToDie()
    if not d.BossFightRemainsIsNotValid() then b9 = d.BossFightRemains() elseif b9 < b8 then return false end
    ;
    if M((b9 - b8) / b6) > M((b9 - b8 - b7) / b6) then return true end
    ;
    return false
end
;
local function ba(aL)
    if aL:DebuffUp(R.SerratedBoneSpikeDebuff) then return 1000000 end
    ;
    return aL:TimeToDie()
end
;
local function bb(aL) if not aL:DebuffUp(R.SerratedBoneSpikeDebuff) and aL:IsInMeleeRange(10) and aL:GUID() == f("mouseover"):GUID() and Q.Assassination.TargetSwap == "Mouseover" then
        al = 1328547;
        return true
    elseif not aL:DebuffUp(R.SerratedBoneSpikeDebuff) and aL:IsInMeleeRange(10) and Q.Assassination.TargetSwap == "AutoSwap" and aL:GUID() ~= h:GUID() and not y then
        al = 9999;
        return true
    elseif not aL:DebuffUp(R.SerratedBoneSpikeDebuff) and aL:IsInMeleeRange(10) and aL:GUID() == h:GUID() then
        ak = 328547;
        return true
    elseif not aL:DebuffUp(R.SerratedBoneSpikeDebuff) and aL:IsInMeleeRange(10) then return true end end
;
local function bc()
    if R.BloodFury:IsReady() and r() and Q.Commons.Enabled.Racials then if p.Cast(R.BloodFury, nil) then
            ak = 20572;
            return "Cast Blood Fury"
        end end
    ;
    if R.Berserking:IsReady() and r() and Q.Commons.Enabled.Racials then if p.Cast(R.Berserking, nil) then
            ak = 26297;
            return "Cast Berserking"
        end end
    ;
    if R.Fireblood:IsReady() and r() and Q.Commons.Enabled.Racials then if p.Cast(R.Fireblood, nil) then
            ak = 265221;
            return "Cast Fireblood"
        end end
    ;
    if R.AncestralCall:IsReady() and r() and Q.Commons.Enabled.Racials then if p.Cast(R.AncestralCall, nil) then
            ak = 274738;
            return "Cast Ancestral Call"
        end end
end
;
local function bd()
    if R.Vanish:IsCastable() and r() and not B and h:IsInMeleeRange(10) and not g:IsTanking(h) then
        if R.ImprovedGarrote:IsAvailable() and R.Garrote:CooldownUp() and not P.Exsanguinated(h, R.Garrote) and h:PMultiplier(R.Garrote) <= 1 then
            if (R.Deathmark:AnyDebuffUp() or R.Deathmark:CooldownRemains() < 4) and a5 >= math.min(_, 4) then
                if Q.Commons.ShowPooling and g:EnergyPredicted() < 45 then if s(R.PoolEnergy) then
                        ak = 999999;
                        return "Pool for Vanish (Garrote Deathmark)"
                    end end
                ;
                if s(R.Vanish, nil) then
                    ak = 1856;
                    return "Cast Vanish (Garrote Deathmark)"
                end
            end
            ;
            if _ > 3 - m(R.IndiscriminateCarnage:IsAvailable()) and (not R.IndiscriminateCarnage:IsAvailable() or R.IndiscriminateCarnage:CooldownUp()) then
                if Q.Commons.ShowPooling and g:EnergyPredicted() < 45 then if s(R.PoolEnergy) then
                        ak = 999999;
                        return "Pool for Vanish (Garrote)"
                    end end
                ;
                if s(R.Vanish, nil) then
                    ak = 1856;
                    return "Cast Vanish (Garrote)"
                end
            end
        end
        ;
        if not R.ImprovedGarrote:IsAvailable() and R.MasterAssassin:IsAvailable() and not aK(h, R.Rupture) and h:DebuffRemains(R.Garrote) > 3 and h:DebuffUp(R.Deathmark) and (h:DebuffUp(R.ShivDebuff) or h:DebuffRemains(R.Deathmark) < 4 or h:DebuffUp(R.Sepsis)) and h:DebuffRemains(R.Sepsis) < 3 then if s(R.Vanish, nil) then
                ak = 1856;
                return "Cast Vanish (Master Assassin)"
            end end
    end
    ;
    if R.ShadowDance:IsCastable() and h:IsInMeleeRange(10) then
        if R.ImprovedGarrote:IsAvailable() and R.Garrote:CooldownUp() and not P.Exsanguinated(h, R.Garrote) and h:PMultiplier(R.Garrote) <= 1 and (R.Deathmark:AnyDebuffUp() or R.Deathmark:CooldownRemains() < 4 or R.Deathmark:CooldownRemains() > 60) and a5 >= math.min(_, 4) then if s(R.ShadowDance, nil) then
                ak = 185313;
                return "Cast Shadow Dance (Garrote)"
            end end
        ;
        if not R.ImprovedGarrote:IsAvailable() and R.MasterAssassin:IsAvailable() and not aK(h, R.Rupture) and h:DebuffRemains(R.Garrote) > 3 and (h:DebuffUp(R.Deathmark) or R.Deathmark:CooldownRemains() > 60) and (h:DebuffUp(R.ShivDebuff) or h:DebuffRemains(R.Deathmark) < 4 or h:DebuffUp(R.Sepsis)) and h:DebuffRemains(R.Sepsis) < 3 then if s(R.ShadowDance, nil) then
                ak = 185313;
                return "Cast Shadow Dance (Master Assassin)"
            end end
    end
end
;
local function be()
    if R.MarkedforDeath:IsCastable() and h:IsInMeleeRange(10) then
        if h:FilteredTimeToDie("<", g:ComboPointsDeficit() * 1.5) then if s(R.MarkedforDeath, nil) then
                ak = 137619;
                return "Cast Marked for Death"
            end end
        ;
        if p.CDsON() then if s(R.MarkedforDeath, nil) then
                ak = 137619;
                return "Cast Marked for Death"
            end end
    end
    ;
    if not X or not p.CDsON() then return end
    ;
    if not g:StealthUp(true, false) then
        if R.Sepsis:IsReady() and h:DebuffUp(R.Garrote) and (h:FilteredTimeToDie(">", 10) or d.BossFilteredFightRemains("<=", 10)) then if s(R.Sepsis, nil, nil) then
                ak = 328305;
                return "Cast Sepsis"
            end end
        ;
        if aC:IsReady() and not o(T, aC:ID()) and (aj == 1 and (R.Deathmark:AnyDebuffUp() or d.BossFilteredFightRemains("<", 20)) or aj == 2 and (not aD:IsReady() or R.Deathmark:CooldownRemains() > 20) or aj == 0) then if aC:ID() == TopTrinketID and Q.Commons.Enabled.TopTrinket then
                ak = 24;
                return "Generic use_items for " .. aC:Name()
            elseif aC:ID() == BotTrinketID and Q.Commons.Enabled.BottomTrinket then
                ak = 25;
                return "Generic use_items for " .. aC:Name()
            end elseif aD:IsReady() and not o(T, aD:ID()) and (aj == 2 and (R.Deathmark:AnyDebuffUp() or d.BossFilteredFightRemains("<", 20)) or aj == 1 and (not aC:IsReady() or R.Deathmark:CooldownRemains() > 20) or aj == 0) then if aD:ID() == TopTrinketID and Q.Commons.Enabled.TopTrinket then
                ak = 24;
                return "Generic use_items for " .. aD:Name()
            elseif aD:ID() == BotTrinketID and Q.Commons.Enabled.BottomTrinket then
                ak = 25;
                return "Generic use_items for " .. aD:Name()
            end end
        ;
        if R.Deathmark:IsCastable() then if h:DebuffUp(R.Rupture) and not R.Deathmark:AnyDebuffUp() and (not R.Exsanguinate:IsAvailable() or R.Exsanguinate:CooldownRemains() > 15 or P.Exsanguinated(h, R.Rupture) or P.Exsanguinated(h, R.Garrote)) and (not R.MasterAssassin:IsAvailable() or h:DebuffUp(R.Garrote)) then if s(R.Deathmark, nil) then
                    ak = 360194;
                    return "Cast Deathmark"
                end end end
        ;
        if R.Kingsbane:IsReady() and (h:DebuffUp(R.ShivDebuff) or R.Shiv:CooldownRemains() < 6) and g:BuffUp(R.Envenom) and (R.Deathmark:CooldownRemains() >= 50 or h:DebuffUp(R.Deathmark)) then if s(R.Kingsbane, nil) then
                ak = 385627;
                a1 = "Cast Kingsbane"
            end end
        ;
        if R.Exsanguinate:IsAvailable() then if aH() == 0 and h:DebuffDown(R.Deathmark) and h:FilteredTimeToDie(">", R.Exsanguinate:CooldownRemains() + 4) then
                if R.ResoundingClarity:IsAvailable() and R.EchoingReprimand:IsReady() and g:ComboPoints() <= 2 and R.Exsanguinate:CooldownRemains() <= 2 and not aK(h, R.Garrote) and h:DebuffRemains(R.Rupture) > 9.6 then if s(R.EchoingReprimand, nil, nil, not W) then
                        ak = 323547;
                        return "Cast Echoing Reprimand (Exsang Sync)"
                    end end
                ;
                if R.Exsanguinate:IsReady() and not aK(h, R.Garrote) and h:DebuffRemains(R.Rupture) > 4 + 4 * b4() or h:FilteredTimeToDie("<", h:DebuffRemains(R.Rupture) * 0.5) then if s(R.Exsanguinate, nil) then
                        ak = 200806;
                        a1 = "Cast Exsanguinate"
                    end end
            elseif R.ResoundingClarity:IsAvailable() and R.EchoingReprimand:IsReady() and R.Exsanguinate:CooldownRemains() > 40 then if s(R.EchoingReprimand, nil, nil, not W) then
                    ak = 323547;
                    return "Cast Echoing Reprimand (Exsang Desync)"
                end end end
    end
    ;
    if R.Shiv:IsCastable() and not h:DebuffUp(R.ShivDebuff) and h:DebuffUp(R.Garrote) and h:DebuffUp(R.Rupture) then if R.Kingsbane:IsAvailable() then if h:DebuffUp(R.Kingsbane) and (not R.CrimsonTempest:IsAvailable() or ai or h:DebuffUp(R.CrimsonTempest)) then if s(R.Shiv, nil) then
                    ak = 5938;
                    a1 = "Cast Shiv (Kingsbane)"
                end end elseif R.Sepsis:IsAvailable() then if m(R.Sepsis:CooldownUp() or R.Sepsis:CooldownRemains() > 12) + m(R.Deathmark:CooldownUp() or R.Deathmark:CooldownRemains() > 12) == 2 then if s(R.Shiv, nil) then
                    ak = 5938;
                    a1 = "Cast Shiv (Sepsis)"
                end end else if not R.CrimsonTempest:IsAvailable() or ai or h:DebuffUp(R.CrimsonTempest) then if s(R.Shiv, nil) then
                    ak = 5938;
                    a1 = "Cast Shiv"
                end end end end
    ;
    if R.ThistleTea:IsCastable() and not g:BuffUp(R.ThistleTea) and (g:EnergyDeficit() >= 100 + af or R.ThistleTea:Charges() == 3 and (h:DebuffUp(R.Kingsbane) or R.Deathmark:AnyDebuffUp()) or d.BossFilteredFightRemains("<", R.ThistleTea:Charges() * 6)) then if p.Cast(R.ThistleTea, nil) then
            ak = 381623;
            return "Cast Thistle Tea"
        end end
    ;
    if R.IndiscriminateCarnage:IsReady() and _ > 1 and (not R.ImprovedGarrote:IsAvailable() or R.Vanish:CooldownRemains() > 45) then if s(R.IndiscriminateCarnage, nil) then
            ak = 381802;
            return "Cast Indiscriminate Carnage"
        end end
    ;
    if Q.Commons.Enabled.Potions and r() and z and ((g:BloodlustUp() or d.BossFightRemains() <= 30 or h:DebuffUp(R.Deathmark)) and not p.GUISettings.General.HoldPotforBL or p.GUISettings.General.HoldPotforBL and g:BloodlustUp()) then
        local bf = O.PotionSelected()
        if bf and bf:IsReady() then if s(bf, nil, nil) then
                ak = 37;
                return "potion cooldowns 2"
            end end
    end
    ;
    if R.Deathmark:AnyDebuffUp() then if a1 then bc() else a1 = bc() end end
    ;
    if not g:StealthUp(true, true) and aH() <= 0 and aG() <= 0 then if a1 then bd() else a1 = bd() end end
    ;
    return a1
end
;
local function bg()
    if R.IndiscriminateCarnage:IsReady() and w and h:IsInMeleeRange(10) and _ > 1 then if s(R.IndiscriminateCarnage, Q.Assassination.OffGCDasOffGCD.IndiscriminateCarnage) then
            ak = 381802;
            return "Cast Indiscriminate Carnage"
        end end
    ;
    if R.Garrote:IsCastable() and h:IsInMeleeRange(10) and aH() > 0 then
        local function bh(aL) return aL:DebuffRemains(R.Garrote) end
        ;
        local function bi(aL) if not P.WillLoseExsanguinate(aL, R.Garrote) and (aL:PMultiplier(R.Garrote) <= 1 or aL:DebuffRemains(R.Garrote) < 12 / P.ExsanguinatedRate(aL, R.Garrote)) and (aL:FilteredTimeToDie(">", 2, -aL:DebuffRemains(R.Garrote)) or aL:TimeToDieIsNotValid()) and P.CanDoTUnit(aL, a9) then if aL:GUID() == f("mouseover"):GUID() and Q.Assassination.TargetSwap == "Mouseover" then
                    al = 1703;
                    return true
                elseif Q.Assassination.TargetSwap == "AutoSwap" and aL:GUID() ~= h:GUID() and not y then
                    al = 9999;
                    return true
                elseif aL:GUID() == h:GUID() then
                    ak = 703;
                    return true
                else return true end end end
        ;
        local bj = aX("min", bh, bi)
        if bj and bj:GUID() ~= h:GUID() then u(bj, R.Garrote) end
        ;
        if bi(h) then if t(R.Garrote, nil, not W) then
                ak = 703;
                return "Cast Garrote (Improved Garrote)"
            end end
        ;
        if R.Exsanguinate:IsAvailable() and _ == 1 and aH() < 1.3 then if t(R.Garrote, nil, not W) then
                ak = 703;
                return "Pool for Garrote (Exsanguinate Refresh)"
            end end
    end
end
;
local function bk()
    local bl, bm, bn = false, false, false;
    if ad then
        bl = _ > 3 and (h:DebuffRemains(R.Garrote) < 6 or ah)
        bm = h:DebuffUp(R.ShivDebuff) and _ > 2 or ah
    end
    ;
    if p.CDsON() and h:IsInMeleeRange(10) and R.Exsanguinate:IsAvailable() and R.Exsanguinate:CooldownRemains() < 2 then
        if R.Garrote:IsCastable() and W and _ == 1 and not P.WillLoseExsanguinate(h, R.Garrote) and h:PMultiplier(R.Garrote) <= 1 and h:FilteredTimeToDie(">", h:DebuffRemains(R.Garrote) * 0.5) then if t(R.Garrote) then
                ak = 703;
                return "Cast Garrote (Pre-Exsanguinate)"
            end end
        ;
        if R.Rupture:IsReady() and W and h:PMultiplier(R.Rupture) <= 1 and not P.WillLoseExsanguinate(h, R.Rupture) and (a4 >= b4() and R.Exsanguinate:CooldownRemains() < 1 and h:FilteredTimeToDie(">", h:DebuffRemains(R.Rupture) * 0.5)) then if s(R.Rupture) then
                ak = 1943;
                return "Cast Rupture (Pre-Exsanguinate)"
            end end
    end
    ;
    if R.Garrote:IsCastable() and h:IsInMeleeRange(10) and a5 >= 1 then
        local function bo(aL)
            ac = P.Exsanguinated(aL, R.Garrote) and a3 or a2;
            return aK(aL, R.Garrote) and aG() <= 0 and
                (aL:PMultiplier(R.Garrote) <= 1 or _ >= 3 and aL:DebuffRemains(R.Garrote) <= ac) and
                (not P.WillLoseExsanguinate(aL, R.Garrote) or aL:DebuffRemains(R.Garrote) <= ac * (1 + m(_ >= 3)))
        end
        ;
        if bo(h) and P.CanDoTUnit(h, a9) and (h:FilteredTimeToDie(">", 4, -h:DebuffRemains(R.Garrote)) or h:TimeToDieIsNotValid()) then if t(R.Garrote, nil, not W) then
                ak = 703;
                return "Pool for Garrote (ST)"
            end end
        ;
        if not bl then aN(R.Garrote, bo, 12, a0) end
    end
    ;
    if R.CrimsonTempest:IsReady() and h:IsInMeleeRange(10) and _ >= 2 and a4 >= 4 and af > 20 and (not R.Deathmark:CooldownUp() or h:DebuffUp(R.Rupture)) then for aV, aW in pairs(Z) do if aW:DebuffRemains(R.CrimsonTempest) < 2 + 3 * m(_ >= 4) then if s(R.CrimsonTempest) then
                    ak = 121411;
                    return "Cast Crimson Tempest (AoE)"
                end end end end
    ;
    if R.Rupture:IsReady() and h:IsInMeleeRange(10) and a4 >= 4 then
        aa = 4 + m(R.DashingScoundrel:IsAvailable()) * 5 + m(R.Doomblade:IsAvailable()) * 5 + m(ah) * 6;
        local function bp(aL)
            ab = P.Exsanguinated(aL, R.Rupture) and a3 or a2;
            return aK(aL, R.Rupture, a6) and (aL:PMultiplier(R.Rupture) <= 1 or aL:DebuffRemains(R.Rupture) <= ab and _ >= 3) and
                (not P.WillLoseExsanguinate(aL, R.Rupture) or aL:DebuffRemains(R.Rupture) <= ab * (1 + m(_ >= 3))) and
                (aL:FilteredTimeToDie(">", aa, -aL:DebuffRemains(R.Rupture)) or aL:TimeToDieIsNotValid())
        end
        ;
        if not bn and bp(h) and P.CanDoTUnit(h, a8) then if s(R.Rupture, nil, nil, not W) then
                ak = 1943;
                return "Cast Rupture (Refresh)"
            end end
        ;
        if not bn and not bm and p.AoEON() then aN(R.Rupture, bp, aa, a0) end
    end
    ;
    if p.AoEON() and h:IsInMeleeRange(10) and R.CrimsonTempest:IsReady() and _ >= 2 and a4 >= 4 then for aV, aW in pairs(Z) do if aW:DebuffRemains(R.CrimsonTempest) < 2 + 3 * m(_ >= 4) then if s(R.CrimsonTempest) then
                    ak = 121411;
                    return "Cast Crimson Tempest (AoE Fallback)"
                end end end end
    ;
    if R.CrimsonTempest:IsReady() and X and _ == 1 and not R.DashingScoundrel:IsAvailable() and a4 >= P.CPMaxSpend() - 1 and aK(h, R.CrimsonTempest, a7) and not P.WillLoseExsanguinate(h, R.CrimsonTempest) and not h:DebuffUp(R.ShivDebuff) and h:DebuffStack(R.AmplifyingPoisonDebuff) < 15 and (h:FilteredTimeToDie(">", 4, -h:DebuffRemains(R.CrimsonTempest)) or h:TimeToDieIsNotValid()) and P.CanDoTUnit(h, a8) then if s(R.CrimsonTempest) then
            ak = 121411;
            return "Cast Crimson Tempest (ST)"
        end end
    ;
    return false
end
;
local function bq()
    if R.Envenom:IsReady() and h:IsInMeleeRange(10) and a4 >= 4 + m(R.DeeperStratagem:IsAvailable()) and (h:DebuffUp(R.Deathmark) or h:DebuffUp(R.ShivDebuff) or h:DebuffStack(R.AmplifyingPoisonDebuff) >= 10 or g:EnergyDeficit() <= 25 + af or not ai or a4 > P.CPMaxSpend()) and (not R.Exsanguinate:IsAvailable() or R.Exsanguinate:CooldownRemains() > 2 or not p.CDsON() or R.ResoundingClarity:IsAvailable() and (R.EchoingReprimand:IsReady() and g:ComboPoints() > 2 or a4 > 5)) then if s(R.Envenom, nil, nil, not W) then
            ak = 32645;
            return "Cast Envenom"
        end end
    ;
    if not (a5 > 1 or g:EnergyDeficit() <= 25 + af or not ai) then return false end
    ;
    if R.SerratedBoneSpike:IsReady() and h:IsInMeleeRange(10) then if not h:DebuffUp(R.SerratedBoneSpikeDebuff) then if s(R.SerratedBoneSpike, nil, nil, not X) then
                ak = 328547;
                return "Cast Serrated Bone Spike"
            end else
            if p.AoEON() then
                if O.CastTargetIf(R.SerratedBoneSpike, Y, "min", ba, bb) then return "Cast Serrated Bone (AoE)" end
                ;
                if ba(h) and bb(h) then if s(R.SerratedBoneSpike, nil, nil, not X) then
                        ak = 328547;
                        return "Cast Serrated Bone (AoE)"
                    end end
            end
            ;
            if aG() < 0.8 then if d.BossFightRemains() <= 5 or R.SerratedBoneSpike:MaxCharges() - R.SerratedBoneSpike:ChargesFractional() <= 0.25 then if s(R.SerratedBoneSpike, nil, nil, not X) then
                        ak = 328547;
                        return "Cast Serrated Bone Spike (Dump Charge)"
                    end elseif not ai and h:DebuffUp(R.ShivDebuff) then if s(R.SerratedBoneSpike, nil, nil, not X) then
                        ak = 328547;
                        return "Cast Serrated Bone Spike (Shiv)"
                    end end end
        end end
    ;
    if R.FanofKnives:IsCastable() and h:IsInMeleeRange(10) then
        if p.AoEON() and _ >= 1 and (not ad and _ >= 3 + m(g:StealthUp(true, false)) + m(R.DragonTemperedBlades:IsAvailable())) then if t(R.FanofKnives) then
                ak = 51723;
                return "Cast Fan of Knives"
            end end
        ;
        if p.AoEON() and g:BuffUp(R.DeadlyPoison) and _ >= 3 then for aV, aW in pairs(Z) do if not aW:DebuffUp(R.DeadlyPoisonDebuff, true) and (not ad or aW:DebuffUp(R.Garrote) or aW:DebuffUp(R.Rupture)) then if t(R.FanofKnives) then
                        ak = 51723;
                        return "Cast Fan of Knives (DP Refresh)"
                    end end end end
    end
    ;
    if r() and h:IsInMeleeRange(10) and R.EchoingReprimand:IsReady() and ((not R.Exsanguinate:IsAvailable() or not R.ResoundingClarity:IsAvailable()) and (not R.Deathmark:IsAvailable() or R.Deathmark:CooldownRemains() > 10) or d.BossFilteredFightRemains("<=", 20)) then if s(R.EchoingReprimand, nil, nil, not W) then
            ak = 323547;
            return "Cast Echoing Reprimand"
        end end
    ;
    if R.Ambush:IsCastable() and h:IsInMeleeRange(10) and (g:StealthUp(true, true) or g:BuffUp(R.BlindsideBuff)) then if t(R.Ambush, nil, not W) then
            ak = 8676;
            return "Cast Ambush"
        end end
    ;
    if R.Mutilate:IsCastable() and h:IsInMeleeRange(10) and _ == 2 and h:DebuffUp(R.DeadlyPoisonDebuff, true) then
        local aU = h:GUID()
        for aV, aW in pairs(a0) do if aW:GUID() ~= aU and (aW:DebuffUp(R.Garrote) or aW:DebuffUp(R.Rupture)) and not aW:DebuffUp(R.DeadlyPoisonDebuff, true) and not aW:DebuffUp(R.AmplifyingPoisonDebuff, true) then
                if aW:GUID() == f("mouseover"):GUID() and Q.Assassination.TargetSwap == "Mouseover" then al = 11329 elseif Q.Assassination.TargetSwap == "AutoSwap" and aW:GUID() ~= h:GUID() and not y then al = 9999 elseif aW:GUID() == h:GUID() then ak = 1329 end
                ;
                u(aW, R.Mutilate)
                break
            end end
    end
    ;
    if R.Mutilate:IsCastable() and h:IsInMeleeRange(10) then if t(R.Mutilate, nil, not W) then
            ak = 1329;
            return "Cast Mutilate"
        end end
    ;
    return false
end
;
local function br()
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
    if not Q.Commons.Enabled.TopTrinket and not Q.Commons.Enabled.BotTrinket then OnUseExcludes = { TopTrinketID,
            BotTrinketID, S.CacheOfAcquiredTreasures:ID() } elseif not Q.Commons.Enabled.TopTrinket and Q.Commons.Enabled.BotTrinket then OnUseExcludes = {
            TopTrinketID, S.CacheOfAcquiredTreasures:ID() } elseif not Q.Commons.Enabled.BotTrinket and Q.Commons.Enabled.TopTrinket then OnUseExcludes = {
            BotTrinketID, S.CacheOfAcquiredTreasures:ID() } end
end
;
local function bs()
    U = R.AcrobaticStrikes:IsAvailable() and 8 or 5;
    V = R.AcrobaticStrikes:IsAvailable() and 10 or 13;
    W = h:IsInMeleeRange(U)
    X = h:IsInMeleeRange(V)
    if q() then
        Y = g:GetEnemiesInRange(30)
        Z = g:GetEnemiesInMeleeRange(V)
        _ = #Z;
        a0 = g:GetEnemiesInMeleeRange(U)
    else
        Y = {}
        Z = {}
        _ = 1;
        a0 = {}
    end
    ;
    a2, a3 = 2 * g:SpellHaste(), 1 * g:SpellHaste()
    a4 = P.EffectiveComboPoints(g:ComboPoints())
    a5 = g:ComboPointsMax() - a4;
    a6 = (4 + a4 * 4) * 0.3;
    a7 = (2 + a4 * 2) * 0.3;
    a8 = R.Envenom:Damage() * Q.Assassination.EnvenomDMGOffset;
    a9 = R.Mutilate:Damage() * Q.Assassination.MutilateDMGOffset;
    ad = aJ()
    a1 = br()
    if a1 then return a1 end
    ;
    if al > 0 then al = 0 end
    ;
    if ak > 0 then ak = 0 end
    ;
    ak = P.ReturnSpell()
    al = P.ReturnSpellMO()
    a1 = P.CrimsonVial()
    if a1 then return a1 end
    ;
    a1 = P.Feint()
    if a1 then return a1 end
    ;
    local bt = g:AffectingCombat() and 180 or 900;
    local bu;
    if i(8679):IsAvailable() and (Q.Assassination.LethalPoison1 == "Wound Poison" or R.DragonTemperedBlades:IsAvailable() and Q.Assassination.LethalPoison2 == "Wound Poison") then
        bu = g:BuffRemains(i(8679))
        if bu < bt and not g:IsCasting(i(8679)) then if p.Cast(i(8679)) then
                ak = 203;
                return "Wound Poison Refresh"
            end end
    elseif i(2823):IsAvailable() and (Q.Assassination.LethalPoison1 == "Deadly Poison" or R.DragonTemperedBlades:IsAvailable() and Q.Assassination.LethalPoison2 == "Deadly Poison") then
        bu = g:BuffRemains(i(2823))
        if bu < bt and not g:IsCasting(i(2823)) then if p.Cast(i(2823)) then
                ak = 208;
                return "Deadly Poison Refresh"
            end end
    elseif i(315584):IsAvailable() and (Q.Assassination.LethalPoison1 == "Instant Poison" or R.DragonTemperedBlades:IsAvailable() and Q.Assassination.LethalPoison2 == "Instant Poison") then
        bu = g:BuffRemains(i(315584))
        if bu < bt and not g:IsCasting(i(315584)) then if p.Cast(i(315584)) then
                ak = 205;
                return "Instant Poison Refresh"
            end end
    elseif i(381664):IsAvailable() and (Q.Assassination.LethalPoison1 == "Amplifying Poison" or R.DragonTemperedBlades:IsAvailable() and Q.Assassination.LethalPoison2 == "Amplifying Poison") then
        bu = g:BuffRemains(i(381664))
        if bu < bt and not g:IsCasting(i(381664)) then if p.Cast(i(381664)) then
                ak = 209;
                return "Amplifying Poison Refresh"
            end end
    end
    ;
    if i(381637):IsAvailable() and (Q.Assassination.NonLethalPoison1 == "Atrophic Poison" or R.DragonTemperedBlades:IsAvailable() and Q.Assassination.NonLethalPoison2 == "Atrophic Poison") then
        bu = g:BuffRemains(i(381637))
        if bu < bt and not g:IsCasting(i(381637)) then if p.Cast(i(381637)) then
                ak = 381637;
                return "Atropic Poison Refresh"
            end end
    elseif i(5761):IsAvailable() and (Q.Assassination.NonLethalPoison1 == "Numbing Poison" or R.DragonTemperedBlades:IsAvailable() and Q.Assassination.NonLethalPoison2 == "Numbing Poison") then
        bu = g:BuffRemains(i(5761))
        if bu < bt and not g:IsCasting(NumbingPoison) then if p.Cast(i(5761)) then
                ak = 204;
                return "Numbing Poison Refresh"
            end end
    end
    ;
    if not g:AffectingCombat() and not g:IsDeadOrGhost() then
        if not g:BuffUp(P.VanishBuffSpell()) then
            a1 = P.Stealth(P.StealthSpell())
            if a1 then return a1 end
        end
        ;
        if not g:BuffUp(R.SliceandDice) then if R.SliceandDice:IsReady() and a4 >= 2 then if s(R.SliceandDice) then
                    ak = 5171;
                    return "Cast Slice and Dice"
                end end end
    end
    ;
    P.MfDSniping(R.MarkedforDeath)
    if O.TargetIsValid() and (g:AffectingCombat() and not h:DebuffUp(R.Sap) or x) then
        if a1 then return a1 end
        ;
        ae = P.PoisonedBleeds()
        af = g:EnergyRegen() + ae * 6 / (2 * g:SpellHaste())
        ag = g:EnergyDeficit() / af;
        ah = af > 35;
        ai = _ < 2;
        if g:StealthUp(true, false) or aH() > 0 then
            a1 = bg()
            if a1 then return a1 .. " (Stealthed)" end
        end
        ;
        a1 = be()
        if a1 then return a1 end
        ;
        if not g:BuffUp(R.SliceandDice) and h:IsInMeleeRange(10) then if R.SliceandDice:IsReady() and g:ComboPoints() >= 2 or not R.CutToTheChase:IsAvailable() and g:ComboPoints() >= 4 and g:BuffRemains(R.SliceandDice) < (1 + g:ComboPoints()) * 1.8 then if s(R.SliceandDice) then
                    ak = 5171;
                    return "Cast Slice and Dice"
                end end elseif X and R.CutToTheChase:IsAvailable() then if R.Envenom:IsReady() and h:IsInMeleeRange(10) and g:BuffRemains(R.SliceandDice) < 5 and g:ComboPoints() >= 4 then if s(R.Envenom, nil, nil, not W) then
                    ak = 32645;
                    return "Cast Envenom (CttC)"
                end end else if R.PoisonedKnife:IsCastable() and h:IsInRange(30) and not g:StealthUp(true, true) and g:AffectingCombat() and _ == 0 and g:EnergyTimeToMax() <= g:GCD() * 1.5 then if s(R.PoisonedKnife) then
                    ak = 185565;
                    return "Cast Poisoned Knife"
                end end end
        ;
        a1 = bk()
        if a1 then return a1 end
        ;
        a1 = bq()
        if a1 then return a1 end
        ;
        if r() and Q.Commons.Enabled.Racials then
            if R.ArcaneTorrent:IsCastable() and h:IsInMeleeRange(8) and g:EnergyDeficitPredicted() > 15 + af then if s(R.ArcaneTorrent, nil) then
                    ak = 155145;
                    return "Cast Arcane Torrent"
                end end
            ;
            if R.ArcanePulse:IsCastable() and h:IsInMeleeRange(8) then if s(R.ArcanePulse, nil) then
                    ak = 260364;
                    return "Cast Arcane Pulse"
                end end
            ;
            if R.LightsJudgment:IsCastable() and h:IsInMeleeRange(8) then if s(R.LightsJudgment, nil) then
                    ak = 255647;
                    return "Cast Lights Judgment"
                end end
            ;
            if R.BagofTricks:IsCastable() and h:IsInMeleeRange(8) then if s(R.BagofTricks, nil) then
                    ak = 312411;
                    return "Cast Bag of Tricks"
                end end
        end
        ;
        if R.Mutilate:IsCastable() and X then if s(R.PoolEnergy) then
                shadowcast = 9999999999;
                return "Normal Pooling"
            end end
    end
end
;
local function bv()
    R.Deathmark:RegisterAuraTracking()
    R.Sepsis:RegisterAuraTracking()
end
;
function ReturnSpellAss() if ak == 0 then return 0 else return ak end end

;
function ReturnSpellMOAss() if al == 0 then return 0 else return al end end

;
p.SetAPL(259, bs, bv)
