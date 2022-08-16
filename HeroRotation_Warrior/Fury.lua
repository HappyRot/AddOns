local e, e = ...
local e = HeroDBC.DBC
local z = HeroLib
local e = HeroCache
local v = z.Unit
local o = v.Player
local t = v.Target
local e = z.Spell
local a = z.Item
local w = HeroRotation
local i = w.Cast
local d = w.CDsON
local F = w.AoEON
local y = HeroRotationCharDB.Toggles[4]
local C = HeroRotationCharDB.Toggles[5]
local T = HeroRotationCharDB.Toggles[6]
local M = HeroRotationCharDB.Toggles[15]
local k = HeroRotationCharDB.Toggles[12]
local f = GetInventoryItemID("player", 13)
local m = GetInventoryItemID("player", 14)
local x
local b
local e = e.Warrior.Fury
local n = a.Warrior.Fury
local U = { n.FlameofBattle:ID(), n.InscrutableQuantumDevice:ID(), n.InstructorsDivineBell:ID(), n.MacabreSheetMusic:ID(), n.OverwhelmingPowerCrystal:ID(), n.WakenersFrond:ID(), n.SinfulGladiatorsBadge:ID(), n.UnchainedGladiatorsBadge:ID() }
local r
local g
local L
local c = 0
local a = 0
local q, u
local s
local l = { 0, 0, 0, 0, 0, 0, 0 }
local p = o:HasLegendaryEquipped(181)
local _ = o:HasLegendaryEquipped(189)
local E = o:HasLegendaryEquipped(263)
local O = o:HasLegendaryEquipped(215)
local j = w.Commons.Everyone
local h = { General = w.GUISettings.General, Commons = w.GUISettings.APL.Warrior.Commons, Fury = w.GUISettings.APL.Warrior.Fury }
local A = { { e.StormBolt, "Cast Storm Bolt (Interrupt)", function()
    return true
end } }
function addToSet(e, t)
    e[t] = true
end

function removeFromSet(t, e)
    t[e] = nil
end

function setContains(t, e)
    for a, t in ipairs(t) do
        if t == e then
            return true
        end

    end

    return false
end

z:RegisterForEvent(function()
    p = o:HasLegendaryEquipped(181)
    _ = o:HasLegendaryEquipped(189)
    E = o:HasLegendaryEquipped(263) or (o:HasUnity() and e.SpearofBastion:IsAvailable())
    O = o:HasLegendaryEquipped(215)
end, "PLAYER_EQUIPMENT_CHANGED")
local D = 0
local A = 0
local z = { 335114, 335304, 326430, 328890, 329742, 331573, 342321, 330968, 347350, 327773, 326851, 320008, 332678, 332707, 332705, 332605, 334076, 332196, 328707, 333250, 332234, 333711, 323544, 323569, 328322, 323538, 338003, 325876, 325872, 325700, 326891, 326829, 323057, 326319, 322767, 322557, 325021, 325223, 325224, 325418, 326092, 322486, 322487, 329110, 328002, 328180, 328094, 334926, 320512, 322554, 328593, 334660, 326712, 321249, 326827, 346537, 326837, 326952, 321038, 323195, 324608, 317661, 323804, 333602, 320171, 320788, 334748, 320462, 333479, 320120, 320300, 319669, 324079, 324589, 330784, 330700, 330703, 330784, 333299, 330875, 345245, 332550, 330810, 340678, 330926, 161355, 161354, 161353, 126819, 61780, 161372, 61721, 61305, 28272, 28271, 277792, 77787, 51514, 211015, 211010, 211004, 210873, 269352, 277778, 277784, 20066, 209753, 33786, 116858, 264106, 203286, 274283, 323673, 323764, 337433, 167385 }
local function I(a, a, e, t, a)
    if e and t then
        if UnitIsUnit(e .. "target", "player") then
            local o, o, o, o, a, o, o, o, t = UnitCastingInfo(e)
            if setContains(z, t) then
                sourceName = e
                A = a
            end

        end

    end

end

local z = CreateFrame("Frame")
z:RegisterEvent("UNIT_SPELLCAST_START")
z:SetScript("OnEvent", I)
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

local function z(e)
    return setcontains(l, e:GUID())
end

local function z(e)
    return (e:HealthPercentage())
end

local function I(t)
    local e = 0
    for a in pairs(t) do
        local t = t[a]
        if setContains(l, t:GUID()) then
            e = e + 1
        end

    end

    return e
end

local function H(i)
                if (i:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and i:HealthPercentage() < 35)) and e.Execute:CooldownRemains() <= 0 and o:Covenant() ~= "Venthyr" and (i:GUID() == v("mouseover"):GUID()) then
        c = 1280735
        return true
    elseif (i:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and i:HealthPercentage() < 35)) and e.Execute:CooldownRemains() <= 0 and o:Covenant() ~= "Venthyr" and h.Fury.TargetSwap == "AutoSwap" and (i:GUID() ~= t:GUID() and not k) then
        c = 999
        return true
    elseif (i:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and i:HealthPercentage() < 35)) and e.Execute:CooldownRemains() <= 0 and o:Covenant() ~= "Venthyr" and (i:GUID() == t:GUID()) then
        a = 280735
        return true
    elseif (i:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and i:HealthPercentage() < 35)) and e.Execute:CooldownRemains() <= 0 and o:Covenant() ~= "Venthyr" and (o:Rage() > 20 or o:BuffUp(e.SuddenDeathBuff)) then
        return true
    end

end

local function z(o)
                if (e.Bloodthirst:IsCastable() and o:IsInRange(8) and ((not r) or e.ViciousContempt:ConduitRank() > 5 and o:HealthPercentage() < 35) and not setContains(l, o:GUID())) and (o:GUID() == v("mouseover"):GUID()) then
        c = 123881
        b = o:GUID()
        return true
    elseif (e.Bloodthirst:IsCastable() and o:IsInRange(8) and ((not r) or e.ViciousContempt:ConduitRank() > 5 and o:HealthPercentage() < 35) and not setContains(l, o:GUID())) and h.Fury.TargetSwap == "AutoSwap" and (o:GUID() ~= t:GUID() and not k) then
        c = 999
        return true
    elseif (e.Bloodthirst:IsCastable() and o:IsInRange(8) and ((not r) or e.ViciousContempt:ConduitRank() > 5 and o:HealthPercentage() < 35) and not setContains(l, o:GUID())) and e.Execute:CooldownRemains() <= 0 and (o:GUID() == t:GUID()) then
        a = 23881
        return true
    elseif (e.Bloodthirst:IsCastable() and o:IsInRange(8) and ((not r) or e.ViciousContempt:ConduitRank() > 5 and o:HealthPercentage() < 35) and not setContains(l, o:GUID())) then
        return true
    end

end

local function N(o)
                if (e.Bloodthirst:IsCastable() and o:IsInRange(8) and not setContains(l, o:GUID())) and (o:GUID() == v("mouseover"):GUID()) then
        c = 123881
        b = o:GUID()
        return true
    elseif (e.Bloodthirst:IsCastable() and o:IsInRange(8) and not setContains(l, o:GUID())) and h.Fury.TargetSwap == "AutoSwap" and (o:GUID() ~= t:GUID() and not k) then
        c = 999
        return true
    elseif (e.Bloodthirst:IsCastable() and o:IsInRange(8) and not setContains(l, o:GUID())) and e.Execute:CooldownRemains() <= 0 and (o:GUID() == t:GUID()) then
        a = 23881
        return true
    elseif (e.Bloodthirst:IsCastable() and o:IsInRange(8) and not setContains(l, o:GUID())) then
        return true
    end

end

local function R()
    if j.TargetIsValid() then
        if e.BattleShout:IsCastable() and (o:BuffRemains(e.BattleShoutBuff, true) < 60) then
            if i(e.BattleShout, nil) then
                a = 6673
                return "battle_shout precombat 2"
            end

        end

        if e.Recklessness:IsCastable() and t:IsInMeleeRange(10) and d() and (not p) then
            if i(e.Recklessness, nil) then
                a = 1719
                return "recklessness precombat 4"
            end

        end

        if e.Charge:IsCastable() and t:IsInMeleeRange(25) and h.Fury.UseCharge then
            if i(e.Charge, nil, nil, not t:IsSpellInRange(e.Charge)) then
                a = 100
                return "charge precombat 6"
            end

        end

        if e.Bloodthirst:IsCastable() and t:IsInMeleeRange(8) then
            if i(e.Bloodthirst, nil, nil, not s) then
                a = 23881
                return "bloodthirst precombat 8"
            end

        end

    end

end

local function S()
    if e.LightsJudgment:IsCastable() and t:IsInRange(8) and (o:BuffDown(e.RecklessnessBuff) and t:DebuffDown(e.SiegebreakerDebuff)) then
        if i(e.LightsJudgment, nil, nil, not t:IsSpellInRange(e.LightsJudgment)) then
            a = 255647
            return "lights_judgment"
        end

    end

    if e.BagofTricks:IsCastable() and t:IsInRange(8) and (o:BuffDown(e.RecklessnessBuff) and t:DebuffDown(e.SiegebreakerDebuff) and r) then
        if i(e.BagofTricks, nil, nil, not t:IsSpellInRange(e.BagofTricks)) then
            a = 312411
            return "bag_of_tricks"
        end

    end

    if e.Berserking:IsCastable() and t:IsInRange(8) and (o:BuffUp(e.RecklessnessBuff)) then
        if i(e.Berserking, nil) then
            a = 26297
            return "berserking"
        end

    end

    if e.BloodFury:IsCastable() and t:IsInRange(8) then
        if i(e.BloodFury, nil) then
            a = 20572
            return "blood_fury"
        end

    end

    if e.Fireblood:IsCastable() and t:IsInRange(8) then
        if i(e.Fireblood, nil) then
            a = 265221
            return "fireblood"
        end

    end

    if e.AncestralCall:IsCastable() and t:IsInRange(8) then
        if i(e.AncestralCall, nil) then
            a = 274738
            return "ancestral_call"
        end

    end

    if e.Rampage:IsReady() and e.Rampage:IsCastable() and o:Rage() > 79 and t:IsInRange(8) and o:BuffDown(e.Whirlwindbuff) and u > 1 then
        if i(e.Whirlwind, nil, nil, not t:IsInRange(8)) then
            a = 190411
            return "Force WW Before Rampage"
        end

    end

    if o:BuffUp(e.Recklessness) and d() and t:IsInMeleeRange(8) and o:Rage() > 79 and o:BuffDown(e.MercilessBonegrinderBuff) and o:BuffDown(e.Whirlwindbuff) and e.Rampage:IsCastable() and e.Bladestorm:IsCastable() then
        if i(e.Rampage, nil, nil, not s) then
            a = 184367
            return "Forced Whirlwind Rampage"
        end

    end

    if e.Rampage:IsReady() and e.Rampage:IsCastable() and t:IsInRange(8) and o:BuffUp(e.Whirlwindbuff) and not r and o:BuffUp(e.MercilessBonegrinderBuff) then
        if i(e.Rampage, nil, nil, not s) then
            a = 184367
            return "Refresh Enrage During Bonegrinder"
        end

    end

    if e.Rampage:IsReady() and e.Rampage:IsCastable() and t:IsInRange(8) and o:BuffUp(e.Whirlwindbuff) then
        if i(e.Rampage, nil, nil, not s) then
            a = 184367
            return "Rampage"
        end

    end

    if e.SpearofBastion:IsCastable() and y and t:IsInMeleeRange(8) and r and p and o:BuffRemains(e.EnrageBuff) > o:GCD() then
        if i(e.SpearofBastion, nil, nil, not t:IsInRange(25)) then
            a = 307865
            return "Double Leggo Spear"
        end

    end

    if e.ConquerorsBanner:IsCastable() and y and t:IsInRange(8) then
        if i(e.ConquerorsBanner, nil) then
            a = 324143
            return "Conqueror's Banner"
        end

    end

    if e.Recklessness:IsCastable() and e.SpearofBastion:IsCastable() and d() and t:IsInMeleeRange(8) and r and p and o:BuffDown(e.MercilessBonegrinderBuff) then
        if i(e.Recklessness, nil) then
            a = 19283
            return "Double Legendary Recklessness"
        end

    end

    if e.Recklessness:IsCastable() and d() and t:IsInMeleeRange(8) and o:Rage() < 79 and r and p and o:BuffDown(e.MercilessBonegrinderBuff) then
        if i(e.Recklessness, nil) then
            a = 1719
            return "recklessness Signet AOE"
        end

    end

    if e.Recklessness:IsCastable() and d() and t:IsInMeleeRange(8) and not p then
        if i(e.Recklessness, nil) then
            a = 1719
            return "recklessness AOE"
        end

    end

    if e.SpearofBastion:IsCastable() and y and t:IsInMeleeRange(8) and r and o:Rage() < 70 and o:BuffRemains(e.EnrageBuff) > o:GCD() then
        if i(e.SpearofBastion, nil, nil, not t:IsInRange(25)) then
            a = 307865
            return "AOE Spear"
        end

    end

    if y and t:IsInMeleeRange(12) and e.AncientAftershock:IsCastable() and r then
        if i(e.AncientAftershock, nil, nil, not t:IsInMeleeRange(12)) then
            a = 325886
            return "ancient_aftershock aoe 2"
        end

    end

    if e.Bladestorm:IsCastable() and t:IsInRange(8) and d() and r and o:Rage() < 25 and (u == 1) then
        if i(e.Bladestorm, nil, nil, not t:IsInRange(8)) then
            a = 46924
            return "bladestorm single_target 22"
        end

    end

    if d() and t:IsInRange(8) and e.Bladestorm:IsCastable() and r and u > 1 and o:BuffDown(e.MercilessBonegrinderBuff) and o:BuffRemains(e.EnrageBuff) > o:GCD() then
        if i(e.Bladestorm, nil, nil, not t:IsInRange(8)) then
            a = 46924
            return "AOE Bladestorm"
        end

    end

    if e.Siegebreaker:IsCastable() and d() and t:IsInRange(8) and o:BuffUp(e.Whirlwindbuff) and (u > 1) then
        if i(e.Siegebreaker, nil, nil, not s) then
            a = 280772
            return "siegebreaker aoe 10"
        end

    end

    if e.Whirlwind:IsCastable() and t:IsInRange(8) and o:BuffUp(e.MercilessBonegrinderBuff) and u > 5 then
        if i(e.Whirlwind, nil, nil, not t:IsInRange(8)) then
            a = 190411
            return "whirlwind 5+ Target"
        end

    end

    if e.Execute:IsCastable() and o:Covenant() ~= "Venthyr" and e.Execute:IsUsable() and t:IsInRange(8) and o:BuffUp(e.Whirlwindbuff) then
        if i(e.Execute, nil, nil, not s) then
            a = 280735
            return "Execute 3 Targets"
        end

    end

    if e.Whirlwind:IsCastable() and t:IsInRange(8) and o:BuffUp(e.MercilessBonegrinderBuff) and u > 3 then
        if i(e.Whirlwind, nil, nil, not t:IsInRange(8)) then
            a = 190411
            return "whirlwind 3+ Target"
        end

    end

    if e.Condemn:IsCastable() and t:IsInRange(8) and o:BuffUp(e.Whirlwindbuff) and g then
        if i(e.Condemn, nil, nil, not s) then
            a = 330325
            return "condemn single_target 8"
        end

    end

    if e.Whirlwind:IsCastable() and t:IsInRange(8) and o:BuffDown(e.Whirlwindbuff) and (u > 1) then
        if i(e.Whirlwind, nil, nil, not t:IsInRange(8)) then
            a = 190411
            return "WW Buff AOE"
        end

    end

end

local function N()
    if e.LightsJudgment:IsCastable() and t:IsInRange(8) and (o:BuffDown(e.RecklessnessBuff) and t:DebuffDown(e.SiegebreakerDebuff)) then
        if i(e.LightsJudgment, nil, nil, not t:IsSpellInRange(e.LightsJudgment)) then
            a = 255647
            return "lights_judgment"
        end

    end

    if e.BagofTricks:IsCastable() and t:IsInRange(8) and (o:BuffDown(e.RecklessnessBuff) and t:DebuffDown(e.SiegebreakerDebuff) and r) then
        if i(e.BagofTricks, nil, nil, not t:IsSpellInRange(e.BagofTricks)) then
            a = 312411
            return "bag_of_tricks"
        end

    end

    if e.Berserking:IsCastable() and t:IsInRange(8) and (o:BuffUp(e.RecklessnessBuff)) then
        if i(e.Berserking, nil) then
            a = 26297
            return "berserking"
        end

    end

    if e.BloodFury:IsCastable() and t:IsInRange(8) then
        if i(e.BloodFury, nil) then
            a = 20572
            return "blood_fury"
        end

    end

    if e.Fireblood:IsCastable() and t:IsInRange(8) then
        if i(e.Fireblood, nil) then
            a = 265221
            return "fireblood"
        end

    end

    if e.AncestralCall:IsCastable() and t:IsInRange(8) then
        if i(e.AncestralCall, nil) then
            a = 274738
            return "ancestral_call"
        end

    end

    if e.Siegebreaker:IsCastable() and d() and t:IsInRange(8) then
        if i(e.Siegebreaker, nil, nil, not s) then
            a = 280772
            return "siegebreaker single target"
        end

    end

    if e.Rampage:IsReady() and e.Rampage:IsCastable() and t:IsInRange(8) then
        if i(e.Rampage, nil, nil, not s) then
            a = 184367
            return "Rampage Single Target"
        end

    end

    if e.ConquerorsBanner:IsCastable() and y and t:IsInRange(8) then
        if i(e.ConquerorsBanner, nil) then
            a = 324143
            return "Conqueror's Banner"
        end

    end

    if e.Recklessness:IsCastable() and e.SpearofBastion:IsCastable() and d() and t:IsInMeleeRange(8) and o:Rage() < 70 and r and p and o:BuffDown(e.MercilessBonegrinderBuff) then
        if i(e.Recklessness, nil) then
            a = 19283
            return "Double Legendary Recklessness"
        end

    end

    if e.Recklessness:IsCastable() and d() and t:IsInMeleeRange(8) and o:Rage() < 79 and r and p and o:BuffDown(e.MercilessBonegrinderBuff) then
        if i(e.Recklessness, nil) then
            a = 1719
            return "recklessness Signet"
        end

    end

    if e.Recklessness:IsCastable() and d() and t:IsInMeleeRange(8) and not p then
        if i(e.Recklessness, nil) then
            a = 1719
            return "recklessness"
        end

    end

    if e.SpearofBastion:IsCastable() and y and t:IsInMeleeRange(8) and r and o:Rage() < 70 then
        if i(e.SpearofBastion, nil, nil, not t:IsInRange(25)) then
            a = 307865
            return "Spear"
        end

    end

    if d() and t:IsInRange(12) and y and e.AncientAftershock:IsCastable() and r then
        if i(e.AncientAftershock, nil, nil, not t:IsInRange(12)) then
            a = 325886
            return "AA"
        end

    end

    if e.CrushingBlow:IsCastable() and t:IsInRange(8) and o:HasTier(28, 4) and not e.FreshMeat:IsAvailable() then
        if i(e.CrushingBlow, nil, nil, not s) then
            a = 335097
            return "Crushing Blow 4p"
        end

    end

    if e.Execute:IsCastable() and o:Covenant() ~= "Venthyr" and e.Execute:IsUsable() and t:IsInRange(8) then
        if i(e.Execute, nil, nil, not s) then
            a = 280735
            return "Execute"
        end

    else
        if j.CastCycle(e.Execute, q, H) then
            return "Execute Mouse Over"
        end

    end

    if e.CrushingBlow:IsCastable() and t:IsInRange(8) and (_ and o:BuffRemains(e.WilloftheBerserkerBuff) < o:GCD()) then
        if i(e.CrushingBlow, nil, nil, not s) then
            a = 335097
            return "Crushing Blow WOTB"
        end

    end

    if e.RagingBlow:IsCastable() and t:IsInRange(8) and o:HasTier(28, 2) and e.RagingBlow:Charges() == 3 and not e.FreshMeat:IsAvailable() then
        if i(e.RagingBlow, nil, nil, not s) then
            a = 85288
            return "Raging Blow 3 Charges"
        end

    end

    if e.DragonRoar:IsCastable() and d() and t:IsInRange(8) and o:BuffRemains(e.EnrageBuff) > o:GCD() then
        if i(e.DragonRoar, nil, nil, not t:IsInRange(12)) then
            a = 118000
            return "Dragon Roar"
        end

    end

    if e.RagingBlow:IsCastable() and t:IsInRange(8) and (_ and o:BuffRemains(e.WilloftheBerserkerBuff) < o:GCD()) then
        if i(e.RagingBlow, nil, nil, not s) then
            a = 85288
            return "Raging Blow WOTB"
        end

    end

    if e.CrushingBlow:IsCastable() and t:IsInRange(8) and (_ and o:BuffRemains(e.WilloftheBerserkerBuff) < o:GCD()) then
        if i(e.CrushingBlow, nil, nil, not s) then
            a = 335097
            return "Crushing Blow WOTB"
        end

    end

    if e.Condemn:IsCastable() and t:IsInRange(8) and g then
        if i(e.Condemn, nil, nil, not s) then
            a = 330325
            return "Condemn"
        end

    end

    if e.Condemn:IsCastable() and t:IsInRange(8) and g then
        if i(e.Condemn, nil, nil, not s) then
            a = 330325
            return "Condemn"
        end

    end

    if e.CrushingBlow:IsCastable() and t:IsInRange(8) and o:HasTier(28, 2) and not e.FreshMeat:IsAvailable() then
        if i(e.CrushingBlow, nil, nil, not s) then
            a = 335097
            return "Crushing Blow Tier Set"
        end

    end

    if e.RagingBlow:IsCastable() and t:IsInRange(8) and o:HasTier(28, 2) and not e.FreshMeat:IsAvailable() then
        if i(e.RagingBlow, nil, nil, not s) then
            a = 85288
            return "Raging Blow Tier Set"
        end

    end

    if d() then
        if e.SpearofBastion:IsCastable() and t:IsInRange(8) and y and (E and r and e.Recklessness:CooldownRemains() > 5 and (o:BuffUp(e.RecklessnessBuff) or t:TimeToDie() < 20 or t:DebuffUp(e.SiegebreakerDebuff) or not e.Siegebreaker:IsAvailable() and t:TimeToDie() > 68)) then
            if i(e.SpearofBastion, nil, nil, not t:IsInRange(25)) then
                a = 307865
                return "spear_of_bastion single_target 20"
            end

        end

        if e.SpearofBastion:IsCastable() and t:IsInRange(8) and y and (r and e.Recklessness:CooldownRemains() > 5 and (o:BuffUp(e.RecklessnessBuff) or t:TimeToDie() < 20 or t:DebuffUp(e.SiegebreakerDebuff) or not e.Siegebreaker:IsAvailable() and t:TimeToDie() > 68)) then
            if i(e.SpearofBastion, nil, nil, not t:IsInRange(25)) then
                a = 307865
                return "spear_of_bastion single_target 23"
            end

        end

        if e.Bladestorm:IsCastable() and t:IsInRange(8) and d() and r and o:Rage() < 25 and (u == 1) then
            if i(e.Bladestorm, nil, nil, not t:IsInRange(8)) then
                a = 46924
                return "bladestorm single_target 22"
            end

        end

    end

    if e.Bloodthirst:IsCastable() and t:IsInRange(8) and ((not r) or e.ViciousContempt:ConduitRank() > 5 and t:HealthPercentage() < 35) and (not setContains(l, t:GUID()) or FreshMeatAvailable == u or not e.FreshMeat:IsAvailable() or k) then
        x = t:GUID()
        if i(e.Bloodthirst, nil, nil, not s) then
            a = 23881
            return "Bloodthirst Single Target"
        end

    else
        if j.CastCycle(e.Bloodthirst, q, z) then
            return "Bloodthirst Single Target Mouseover"
        end

    end

    if e.CrushingBlow:IsCastable() and t:IsInRange(8) and o:HasTier(28, 2) then
        if i(e.CrushingBlow, nil, nil, not s) then
            a = 335097
            return "Crushing Blow Tier Set"
        end

    end

    if e.Bloodbath:IsCastable() and t:IsInRange(8) and ((not r) or e.ViciousContempt:ConduitRank() > 5 and t:HealthPercentage() < 35 and not e.Cruelty:IsAvailable()) then
        if i(e.Bloodbath, nil, nil, not s) then
            a = 335096
            return "Bloodbath"
        end

    end

    if e.Onslaught:IsCastable() and t:IsInRange(8) and e.Onslaught:IsUsable() then
        if i(e.Onslaught, nil, nil, not s) then
            a = 315720
            return "Onslaught"
        end

    end

    if e.CrushingBlow:IsCastable() and t:IsInRange(8) and (e.CrushingBlow:Charges() == 2 or o:BuffUp(e.RecklessnessBuff) and g and e.Massacre:IsAvailable()) then
        if i(e.CrushingBlow, nil, nil, not s) then
            a = 335097
            return "Crushing Blow 2 Charges"
        end

    end

    if e.RagingBlow:IsCastable() and t:IsInRange(8) and (e.RagingBlow:Charges() == 2 or o:BuffUp(e.RecklessnessBuff) and g and r and e.Massacre:IsAvailable()) then
        if i(e.RagingBlow, nil, nil, not s) then
            a = 85288
            return "Raging Blow 2 Charges"
        end

    end

    if e.Bloodthirst:IsCastable() and t:IsInRange(8) and (not setContains(l, t:GUID()) or FreshMeatAvailable == u or not e.FreshMeat:IsAvailable() or k) then
        x = t:GUID()
        if i(e.Bloodthirst, nil, nil, not s) then
            a = 23881
            return "Bloodthirst Single Target"
        end

    else
        if j.CastCycle(e.Bloodthirst, q, z) then
            return "Bloodthirst Single Target Mouseover"
        end

    end

    if e.Bloodbath:IsCastable() and t:IsInRange(8) then
        if i(e.Bloodbath, nil, nil, not s) then
            a = 335096
            return "Blooodbath"
        end

    end

    if e.RagingBlow:IsCastable() and t:IsInRange(8) and o:HasTier(28, 2) and e.RagingBlow:Charges() == 1 then
        if i(e.RagingBlow, nil, nil, not s) then
            a = 85288
            return "Raging Blow Tier Set"
        end

    end

    if e.RagingBlow:IsCastable() and t:IsInRange(8) then
        if i(e.RagingBlow, nil, nil, not s) then
            a = 85288
            return "Raging Blow"
        end

    end

    if e.CrushingBlow:IsCastable() and t:IsInRange(8) then
        if i(e.CrushingBlow, nil, nil, not s) then
            a = 335097
            return "Crushing Blow"
        end

    end

    if e.Whirlwind:IsCastable() and t:IsInRange(8) then
        if i(e.Whirlwind, nil, nil, not t:IsInRange(8)) then
            a = 190411
            return "Filler Whirlwind"
        end

    end

end

local function _()
end

local function z()
    T = HeroRotationCharDB.Toggles[6]
    y = HeroRotationCharDB.Toggles[4]
    C = HeroRotationCharDB.Toggles[5]
    k = HeroRotationCharDB.Toggles[12]
    M = HeroRotationCharDB.Toggles[15]
    if e.SpellReflection:CooldownRemains() > 0 then
        D = 0
        A = 0
    end

    if h.Commons.Enabled.TopTrinket then
        f = GetInventoryItemID("player", 13)
    else
        f = 1
    end

    if h.Commons.Enabled.BottomTrinket then
        m = GetInventoryItemID("player", 14)
    else
        m = 1
    end

end

local function y()
    if not BotOn then
        c = 0
        a = 0
        shouldcastfocus = 0
    end

    if F() then
        q = o:GetEnemiesInMeleeRange(8)
        u = #q
        FreshMeatAvailable = I(q)
    else
        u = 1
        FreshMeatAvailable = 1
    end

    r = o:BuffUp(e.EnrageBuff)
    s = t:IsInMeleeRange(5)
    if c > 0 then
        c = 0
    end

    if a > 0 then
        a = 0
    end

    if shouldcastfocus > 0 then
        shouldcastfocus = 0
    end

    ShouldReturn = z()
    if not UnitAffectingCombat("player") then
        for e = 1, #l do
            l[e] = nil
        end

    end

    if e.Bloodthirst:TimeSinceLastCast() < 1 and t:GUID() == x then
        table.insert(l, x)
    end

    if o:PrevGCD(1, e.Bloodthirst) and v("mouseover"):GUID() == b and b ~= nil then
        table.insert(l, b)
        b = nil
    end

    x = nil
    if (h.Fury.UseDefensives and o:AffectingCombat()) then
        if e.EnragedRegeneration:IsReady() and o:HealthPercentage() < h.Fury.EnragedRegneration then
            if w.Cast(e.EnragedRegeneration, nil, nil, nil) then
                a = 184364
                return "Enraged Regeneration 100"
            end

        end

        if e.RallyingCry:IsReady() and o:HealthPercentage() < h.Fury.RallyingCry then
            if w.Cast(e.RallyingCry, nil, nil, nil) then
                a = 97462
                return "RallyingCry 100"
            end

        end

        if e.IgnorePain:IsReady() and o:HealthPercentage() < h.Fury.IgnorePain then
            if w.Cast(e.IgnorePain, nil, nil, nil) then
                a = 190456
                return "IgnorePain 100"
            end

        end

    end

    if not o:AffectingCombat() and not o:IsDeadOrGhost() and T then
        local e = R()
        if e then
            return e
        end

    end

    if o:BuffUp(e.Bladestorm) and u == 1 and (o:Rage() > 80) then
        if i(e.Bladestorm, nil, nil, not s) then
            a = 1202168
            return "cancel bladestorm"
        end

    end

    if j.TargetIsValid() and not o:IsDeadOrGhost() and (o:AffectingCombat() or T) then
        if e.Charge:IsCastable() and h.Fury.UseCharge and t:IsInRange(25) then
            if i(e.Charge, nil, nil, not t:IsSpellInRange(e.Charge)) then
                a = 100
                return "charge main 2"
            end

        end

        if o:HealthPercentage() < h.Commons.VictoryRushHP then
            if e.VictoryRush:IsCastable() and e.VictoryRush:IsUsable() then
                if i(e.VictoryRush, nil, nil, not s) then
                    a = 34428
                    return "victory_rush heal"
                end

            end

            if e.ImpendingVictory:IsReady() and e.VictoryRush:IsUsable() then
                if i(e.ImpendingVictory, nil, nil, not s) then
                    a = 202168
                    return "impending_victory heal"
                end

            end

        end

        g = ((e.Massacre:IsAvailable() and t:HealthPercentage() < 35) or (t:HealthPercentage() < 20) or (t:HealthPercentage() > 80 and o:Covenant() == "Venthyr") or (o:BuffUp(e.SuddenDeathBuff)))
        L = (p or O or E)
        if (not t:IsInMeleeRange(8)) then
            local e = _()
            if e then
                return e
            end

        end

        if n.PotionofSpectralStrength:IsReady() and h.Commons.Enabled.Potions and t:IsInMeleeRange(8) then
            if i(n.PotionofSpectralStrength, nil, nil) then
                a = 20
                return "potion main 6"
            end

        end

        if e.Rampage:IsReady() and (e.Recklessness:CooldownRemains() < 3 and e.RecklessAbandon:IsAvailable()) and t:IsInMeleeRange(8) then
            if i(e.Rampage, nil, nil, not s) then
                a = 184367
                return "rampage main 10"
            end

        end

        if ((h.Commons.Enabled.TopTrinket or h.Commons.Enabled.BottomTrinket) and d()) then
            if n.InscrutableQuantumDevice:IsEquippedAndReady() and (e.Recklessness:CooldownRemains() > 10 and (o:BuffUp(e.RecklessnessBuff) or t:TimeToDie() < 21 or t:TimeToDie() > 190 or o:BloodlustUp())) then
                if i(n.InscrutableQuantumDevice) then
                                        if n.InscrutableQuantumDevice:ID() == f and h.Commons.Enabled.TopTrinket then
                        a = 30
                        return "inscrutable_quantum_device trinkets main"
                    elseif n.InscrutableQuantumDevice:ID() == m and h.Commons.Enabled.BottomTrinket then
                        a = 40
                        return "inscrutable_quantum_device trinkets main"
                    end

                end

            end

            if n.WakenersFrond:IsEquippedAndReady() and (e.Recklessness:CooldownRemains() > 10 and (o:BuffUp(e.RecklessnessBuff) or t:TimeToDie() < 13 or t:TimeToDie() > 130)) then
                if i(n.WakenersFrond) then
                                        if n.WakenersFrond:ID() == f and h.Commons.Enabled.TopTrinket then
                        a = 30
                        return "WakenersFrond trinkets main"
                    elseif n.WakenersFrond:ID() == m and h.Commons.Enabled.BottomTrinket then
                        a = 40
                        return "WakenersFrond trinkets main"
                    end

                end

            end

            if n.MacabreSheetMusic:IsEquippedAndReady() and (e.Recklessness:CooldownRemains() > 10 and (o:BuffUp(e.RecklessnessBuff) or t:TimeToDie() < 25 or t:TimeToDie() > 110)) then
                if i(n.MacabreSheetMusic) then
                                        if n.MacabreSheetMusic:ID() == f and h.Commons.Enabled.TopTrinket then
                        a = 30
                        return "MacabreSheetMusic trinkets main"
                    elseif n.MacabreSheetMusic:ID() == m and h.Commons.Enabled.BottomTrinket then
                        a = 40
                        return "MacabreSheetMusic trinkets main"
                    end

                end

            end

            if n.OverwhelmingPowerCrystal:IsEquippedAndReady() and e.Recklessness:IsCastable() and t:IsInRange(8) then
                if i(n.OverwhelmingPowerCrystal) then
                                        if n.OverwhelmingPowerCrystal:ID() == f and h.Commons.Enabled.TopTrinket then
                        a = 30
                        return "OverwhelmingPowerCrystal trinkets main"
                    elseif n.OverwhelmingPowerCrystal:ID() == m and h.Commons.Enabled.BottomTrinket then
                        a = 40
                        return "OverwhelmingPowerCrystal trinkets main"
                    end

                end

            end

            if n.InstructorsDivineBell:IsEquippedAndReady() and (e.Recklessness:CooldownRemains() > 10 and (o:BuffUp(e.RecklessnessBuff) or t:TimeToDie() < 10 or t:TimeToDie() > 95)) then
                if i(n.InstructorsDivineBell) then
                                        if n.InstructorsDivineBell:ID() == f and h.Commons.Enabled.TopTrinket then
                        a = 30
                        return "InstructorsDivineBell trinkets main"
                    elseif n.InstructorsDivineBell:ID() == m and h.Commons.Enabled.BottomTrinket then
                        a = 40
                        return "InstructorsDivineBell trinkets main"
                    end

                end

            end

            if n.FlameofBattle:IsEquippedAndReady() and (e.Recklessness:CooldownRemains() > 10 and (o:BuffUp(e.RecklessnessBuff) or t:TimeToDie() < 11 or t:TimeToDie() > 100)) then
                if i(n.FlameofBattle) then
                                        if n.FlameofBattle:ID() == f and h.Commons.Enabled.TopTrinket then
                        a = 30
                        return "FlameofBattle trinkets main"
                    elseif n.FlameofBattle:ID() == m and h.Commons.Enabled.BottomTrinket then
                        a = 40
                        return "FlameofBattle trinkets main"
                    end

                end

            end

            if n.SinfulGladiatorsBadge:IsEquippedAndReady() and (e.Recklessness:CooldownRemains() > 10 and (o:BuffUp(e.RecklessnessBuff) or t:TimeToDie() < 11 or t:TimeToDie() > 65)) then
                if i(n.SinfulGladiatorsBadge) then
                                        if n.SinfulGladiatorsBadge:ID() == f and h.Commons.Enabled.TopTrinket then
                        a = 30
                        return "SinfulGladiatorsBadge trinkets main"
                    elseif n.SinfulGladiatorsBadge:ID() == m and h.Commons.Enabled.BottomTrinket then
                        a = 40
                        return "SinfulGladiatorsBadge trinkets main"
                    end

                end

            end

            if n.UnchainedGladiatorsBadge:IsEquippedAndReady() and (e.Recklessness:CooldownRemains() > 10 and (o:BuffUp(e.RecklessnessBuff) or t:TimeToDie() < 11 or t:TimeToDie() > 65)) then
                if i(n.UnchainedGladiatorsBadge) then
                                        if n.UnchainedGladiatorsBadge:ID() == f and h.Commons.Enabled.TopTrinket then
                        a = 30
                        return "UnchainedGladiatorsBadge trinkets main"
                    elseif n.UnchainedGladiatorsBadge:ID() == m and h.Commons.Enabled.BottomTrinket then
                        a = 40
                        return "UnchainedGladiatorsBadge trinkets main"
                    end

                end

            end

            local e = o:GetUseableTrinkets(U)
            if e then
                if i(e, nil, nil) then
                                        if e:ID() == f and h.Commons.Enabled.TopTrinket then
                        a = 30
                        return "top trinket 1"
                    elseif e:ID() == m and h.Commons.Enabled.BottomTrinket then
                        a = 40
                        return "Bot trinket 1"
                    end

                end

            end

        end

        if d() then
        end

        if (true) then
            local e = S()
            if e then
                return e
            end

        end

        if (true) then
            local e = N()
            if e then
                return e
            end

        end

    end

end

function ReturnSpellFury()
    if a == 0 then
        return 0
    else
        return a
    end

end

function ReturnSpellMOFury()
    if c == 0 then
        return 0
    else
        return c
    end

end

local function e()
end

w.SetAPL(72, y, e)

