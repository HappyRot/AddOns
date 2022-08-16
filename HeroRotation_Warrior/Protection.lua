local e, e = ...
local e = HeroDBC.DBC
local s = HeroLib
local e = s.Unit
local a = e.Player
local i = e.Target
local e = s.Spell
local o = s.Item
local h = HeroRotation
local t = h.Cast
local k = h.AoEON
local m = h.CDsON
local e = e.Warrior.Protection
local w = o.Warrior.Protection
local q = {  }
local n
local f
local d
local u = a:HasLegendaryEquipped(193)
local c = h.Commons.Everyone
local o = { General = h.GUISettings.General, Commons = h.GUISettings.APL.Warrior.Commons, Protection = h.GUISettings.APL.Warrior.Protection }
local j = { { e.IntimidatingShout, "Cast Intimidating Shout (Interrupt)", function()
    return true
end } }
s:RegisterForEvent(function()
    u = a:HasLegendaryEquipped(193)
end, "PLAYER_EQUIPMENT_CHANGED")
local function s(e)
    if e then
        return 1
    else
        return 0
    end

end

local function s(e)
    return e ~= 0
end

local function l()
    return a:IsTankingAoE(16) or a:IsTanking(i)
end

local function s()
    if a:BuffUp(e.IgnorePain) then
        local t = a:AttackPowerDamageMod() * 3.5 * (1 + a:VersatilityDmgPct() / 100)
        local a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, e = a:AuraInfo(e.IgnorePain, nil, true)
        return e < (.5 * math.floor(t * 1.3))
    else
        return true
    end

end

local function r()
    return l() and e.ShieldBlock:IsReady() and ((a:BuffDown(e.ShieldBlockBuff) or a:BuffRemains(e.ShieldBlockBuff) <= 1.5 * a:GCD()) and a:BuffDown(e.LastStandBuff) and a:Rage() >= 30)
end

local function s(s)
    local n = 80
    local i = false
    if a:Rage() >= 40 and e.IgnorePain:IsReady() and not r() then
        i = (a:Rage() + s >= n) or i
    end

    if a:Rage() >= 40 and e.DemoralizingShout:IsReady() and not r() then
        i = true
    end

    if i then
        if t(e.IgnorePain, nil, o.Protection.DisplayStyle.Defensive) then
            return "rage capped"
        end

    end

end

local function b()
    if i:IsInMeleeRange(12) then
        if e.ThunderClap:IsCastable() then
            if t(e.ThunderClap) then
                return "thunder_clap precombat"
            end

        end

    else
        if e.Charge:IsCastable() then
            if t(e.Charge, nil, nil, not i:IsSpellInRange(e.Charge)) then
                return "charge precombat"
            end

        end

    end

end

local function v()
    if r() then
        if t(e.ShieldBlock, nil, o.Protection.DisplayStyle.Defensive) then
            return "shield_block defensive"
        end

    end

    if e.LastStand:IsCastable() and (a:BuffDown(e.ShieldBlockBuff) and e.ShieldBlock:Recharge() > 1) then
        if t(e.LastStand, nil, o.Protection.DisplayStyle.Defensive) then
            return "last_stand defensive"
        end

    end

    if a:HealthPercentage() < o.Commons.VictoryRushHP then
        if e.VictoryRush:IsCastable() and e.VictoryRush:IsUsable() then
            if t(e.VictoryRush) then
                return "victory_rush defensive"
            end

        end

        if e.ImpendingVictory:IsReady() and e.ImpendingVictory:IsUsable() then
            if t(e.ImpendingVictory) then
                return "impending_victory defensive"
            end

        end

    end

end

local function p()
    if e.Ravager:IsCastable() then
        s(10)
        if t(e.Ravager, nil, nil, not i:IsSpellInRange(e.Ravager)) then
            return "ravager aoe 2"
        end

    end

    if e.DragonRoar:IsCastable() then
        s(20)
        if t(e.DragonRoar, o.Protection.GCDasOffGCD.DragonRoar, nil, not i:IsInMeleeRange(12)) then
            return "dragon_roar aoe 4"
        end

    end

    if e.ThunderClap:IsCastable() then
        s(5)
        if t(e.ThunderClap, nil, nil, not i:IsInMeleeRange(12)) then
            return "thunder_clap aoe 6"
        end

    end

    if e.Revenge:IsReady() and not r() then
        if t(e.Revenge, nil, nil, not n) then
            return "revenge aoe 8"
        end

    end

    if e.ShieldSlam:IsCastable() then
        s(15)
        if t(e.ShieldSlam, nil, nil, not n) then
            return "shield_slam aoe 10"
        end

    end

end

local function y()
    if e.Ravager:IsCastable() then
        if t(e.Ravager, nil, nil, not i:IsSpellInRange(e.Ravager)) then
            return "ravager generic 2"
        end

    end

    if e.DragonRoar:IsCastable() then
        s(20)
        if t(e.DragonRoar, o.Protection.GCDasOffGCD.DragonRoar, nil, not i:IsInMeleeRange(12)) then
            return "dragon_roar generic 4"
        end

    end

    if e.ShieldSlam:IsCastable() and (a:BuffUp(e.ShieldBlockBuff)) then
        s(15)
        if t(e.ShieldSlam, nil, nil, not n) then
            return "shield_slam generic 6"
        end

    end

    if e.ThunderClap:IsCastable() and ((d > 1 or not e.ShieldSlam:CooldownUp()) and e.UnstoppableForce:IsAvailable() and a:BuffUp(e.AvatarBuff)) then
        s(5)
        if t(e.ThunderClap, nil, nil, not i:IsInMeleeRange(12)) then
            return "thunder_clap generic 8"
        end

    end

    if e.ShieldSlam:IsCastable() then
        s(15)
        if t(e.ShieldSlam, nil, nil, not n) then
            return "shield_slam generic 10"
        end

    end

    if e.Condemn:IsCastable() and e.Condemn:IsUsable() then
        if t(e.Condemn, nil, o.Commons.DisplayStyle.Covenant, not n) then
            return "condemn generic 12"
        end

    end

    if e.Execute:IsCastable() and e.Execute:IsUsable() then
        if t(e.Execute, nil, nil, not n) then
            return "execute generic 14"
        end

    end

    if e.Revenge:IsReady() and (a:Rage() >= 70) then
        if t(e.Revenge, nil, nil, not n) then
            return "revenge generic 16"
        end

    end

    if e.ThunderClap:IsCastable() then
        s(5)
        if t(e.ThunderClap, nil, nil, not i:IsInMeleeRange(12)) then
            return "thunder_clap generic 18"
        end

    end

    if e.Revenge:IsReady() and not r() then
        if t(e.Revenge, nil, nil, not n) then
            return "revenge generic 20"
        end

    end

    if e.Devastate:IsCastable() then
        if t(e.Devastate, nil, nil, not n) then
            return "devastate generic 22"
        end

    end

    if e.StormBolt:IsCastable() then
        if t(e.StormBolt, nil, nil, not i:IsSpellInRange(e.StormBolt)) then
            return "storm_bolt generic 24"
        end

    end

end

local function g()
    if k() then
        f = a:GetEnemiesInMeleeRange(8)
        d = #f
    else
        d = 1
    end

    n = i:IsInMeleeRange(5)
    if c.TargetIsValid() then
        if not a:AffectingCombat() then
            local e = b()
            if e then
                return e
            end

        end

        if l() then
            local e = v()
            if e then
                return e
            end

        end

        local r = c.Interrupt(5, e.Pummel, o.Commons.OffGCDasOffGCD.Pummel, j)
        if r then
            return r
        end

        if e.Charge:IsCastable() and (not n) then
            if t(e.Charge, nil, o.Commons.DisplayStyle.Charge, not i:IsSpellInRange(e.Charge)) then
                return "charge main 2"
            end

        end

        if (o.Commons.Enabled.Trinkets and (e.Avatar:CooldownRemains() <= a:GCD() or a:BuffUp(e.AvatarBuff))) then
            local e = a:GetUseableTrinkets(q)
            if e then
                if t(e, nil, o.Commons.DisplayStyle.Trinkets) then
                    return "Generic use_items for " .. e:Name()
                end

            end

        end

        if (m()) then
            if e.BloodFury:IsCastable() then
                if t(e.BloodFury, o.Commons.OffGCDasOffGCD.Racials) then
                    return "blood_fury racial"
                end

            end

            if e.Berserking:IsCastable() then
                if t(e.Berserking, o.Commons.OffGCDasOffGCD.Racials) then
                    return "berserking racial"
                end

            end

            if e.ArcaneTorrent:IsCastable() then
                if t(e.ArcaneTorrent, o.Commons.OffGCDasOffGCD.Racials, nil, 8) then
                    return "arcane_torrent racial"
                end

            end

            if e.LightsJudgment:IsCastable() then
                if t(e.LightsJudgment, o.Commons.OffGCDasOffGCD.Racials, nil, 40) then
                    return "lights_judgment racial"
                end

            end

            if e.Fireblood:IsCastable() then
                if t(e.Fireblood, o.Commons.OffGCDasOffGCD.Racials) then
                    return "fireblood racial"
                end

            end

            if e.AncestralCall:IsCastable() then
                if t(e.AncestralCall, o.Commons.OffGCDasOffGCD.Racials) then
                    return "ancestral_call racial"
                end

            end

            if e.BagofTricks:IsCastable() then
                if t(e.BagofTricks, o.Commons.OffGCDasOffGCD.Racials, nil, 40) then
                    return "bag_of_tricks racial"
                end

            end

        end

        if w.PotionofPhantomFire:IsReady() and o.Commons.Enabled.Potions and (a:BuffUp(e.AvatarBuff) or i:TimeToDie() < 25) then
            if t(w.PotionofPhantomFire, nil, o.Commons.DisplayStyle.Potions) then
                return "potion main 4"
            end

        end

        if e.Charge:IsCastable() and (a:Rage() < 60 and a:BuffDown(e.RevengeBuff) and u) then
            if t(e.Charge, nil, o.Commons.DisplayStyle.Charge, not i:IsSpellInRange(e.Charge)) then
                return "charge for reprisal"
            end

        end

        if e.DemoralizingShout:IsCastable() and (e.BoomingVoice:IsAvailable()) then
            if e.BoomingVoice:IsAvailable() then
                s(40)
            end

            if t(e.DemoralizingShout, o.Protection.GCDasOffGCD.DemoralizingShout, not i:IsInRange(10)) then
                return "demoralizing_shout main 8"
            end

        end

        if m() then
            if e.Avatar:IsCastable() and (a:BuffDown(e.AvatarBuff)) then
                s(20)
                if t(e.Avatar, o.Protection.GCDasOffGCD.Avatar) then
                    return "avatar main 10"
                end

            end

            if e.AncientAftershock:IsCastable() then
                if t(e.AncientAftershock, nil, o.Commons.DisplayStyle.Covenant, not n) then
                    return "ancient_aftershock main 12"
                end

            end

            if e.SpearofBastion:IsCastable() then
                if t(e.SpearofBastion, nil, o.Commons.DisplayStyle.Covenant, not i:IsSpellInRange(e.SpearofBastion)) then
                    return "spear_of_bastion main 14"
                end

            end

            if e.ConquerorsBanner:IsCastable() then
                if t(e.ConquerorsBanner, nil, o.Commons.DisplayStyle.Covenant) then
                    return "conquerors_banner main 16"
                end

            end

        end

        if (d >= 3) then
            return p()
        end

        if (true) then
            local e = y()
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
    h.Print("Protection Warrior rotation is currently a work in progress.")
end

h.SetAPL(73, g, e)

