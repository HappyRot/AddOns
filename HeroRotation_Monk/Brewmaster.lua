local e, e = ...
local e = HeroDBC.DBC
local n = HeroLib
local e = HeroCache
local e = n.Unit
local t = e.Player
local o = e.Target
local e = e.Pet
local e = n.Spell
local a = n.MultiSpell
local i = n.Item
local a = HeroRotation
local s = a.AoEON
local s = a.CDsON
local s = math.min
local s = pairs
local e = e.Monk.Brewmaster
local i = i.Monk.Brewmaster
local c = {  }
local y
local d
local h
local i, i
local i
local w = { { e.SpearHandStrike, "Cast Spear Hand Strike (Interrupt)", function()
    return true
end } }
local r = { { e.LegSweep, "Cast Leg Sweep (Stun)", function()
    return true
end } }
local i = { { e.Paralysis, "Cast Paralysis (Stun)", function()
    return true
end } }
local s = a.Commons.Everyone
local i = a.Commons.Monk
local i = { General = a.GUISettings.General, Commons = a.GUISettings.APL.Monk.Commons, Brewmaster = a.GUISettings.APL.Monk.Brewmaster }
local l = t:HasLegendaryEquipped(88)
local f = t:HasLegendaryEquipped(86)
local l = t:HasLegendaryEquipped(82)
local l = t:HasLegendaryEquipped(85)
local l = t:HasLegendaryEquipped(83)
local l = t:HasLegendaryEquipped(89)
local l = t:HasLegendaryEquipped(87)
local l = t:HasLegendaryEquipped(84)
n:RegisterForEvent(function()
    VarFoPPreChan = 0
end, "PLAYER_REGEN_ENABLED")
local function l(a)
    if e.TigerPalm:TimeSinceLastCast() <= t:GCD() then
        return true
    end

    return a and o:IsInMeleeRange(a) or o:IsInMeleeRange(5)
end

local function u()
    local e = t:GetUseableTrinkets(c)
    if e then
        if a.Cast(e, nil, i.Commons.TrinketDisplayStyle) then
            return "Generic use_items for " .. e:Name()
        end

    end

end

local function c()
    return e.PurifyingBrew:ChargesFractional() >= 1.8 and (t:DebuffUp(e.HeavyStagger) or t:DebuffUp(e.ModerateStagger) or t:DebuffUp(e.LightStagger))
end

local function m()
    local o = t:IsTankingAoE(8) or t:IsTanking(o)
    if e.CelestialBrew:IsCastable() and t:BuffStack(e.PurifiedChiBuff) >= 2 then
        if a.Cast(e.CelestialBrew, i.Brewmaster.GCDasOffGCD.CelestialBrew) then
            return "Celestial Brew"
        end

    end

    if e.PurifyingBrew:IsCastable() and c() then
        if a.CastRightSuggested(e.PurifyingBrew) then
            return "Purifying Brew"
        end

    end

    if e.DampenHarm:IsCastable() and t:HealthPercentage() <= 35 then
        if a.CastSuggested(e.DampenHarm) then
            return "Dampen Harm"
        end

    end

    if e.FortifyingBrew:IsCastable() and t:HealthPercentage() <= 25 then
        if a.CastSuggested(e.FortifyingBrew) then
            return "Fortifying Brew"
        end

    end

end

local function c()
    l()
    y = t:GetEnemiesInMeleeRange(5)
    d = t:GetEnemiesInMeleeRange(8)
    h = #d
    if not t:AffectingCombat() and s.TargetIsValid() then
        if e.RushingJadeWind:IsCastable() then
            if a.Cast(e.RushingJadeWind, nil, nil, not o:IsInMeleeRange(8)) then
                return "Rushing Jade Wind"
            end

        end

        if e.ChiBurst:IsCastable() then
            if a.Cast(e.ChiBurst, nil, nil, not o:IsInRange(40)) then
                return "Chi Burst"
            end

        end

        if e.KegSmash:IsCastable() then
            if a.Cast(e.KegSmash, nil, nil, not o:IsInRange(40)) then
                return "Keg Smash"
            end

        end

        if e.ChiWave:IsCastable() then
            if a.Cast(e.ChiWave, nil, nil, not o:IsInRange(40)) then
                return "Chi Wave"
            end

        end

    end

    if s.TargetIsValid() then
        local d = s.Interrupt(5, e.SpearHandStrike, i.Commons.OffGCDasOffGCD.SpearHandStrike, w)
        if d then
            return d
        end

        local d = s.Interrupt(5, e.LegSweep, i.Commons.GCDasOffGCD.LegSweep, r)
        if d and i.General.InterruptWithStun then
            return d
        end

        local s = s.Interrupt(5, e.Paralysis, i.Commons.GCDasOffGCD.Paralysis, r)
        if s and i.General.InterruptWithStun then
            return s
        end

        s = m()
        if s then
            return s
        end

        if a.CDsON() then
            if e.BloodFury:IsCastable() then
                if a.Cast(e.BloodFury, i.Commons.OffGCDasOffGCD.Racials) then
                    return "Blood Fury"
                end

            end

            if e.Berserking:IsCastable() then
                if a.Cast(e.Berserking, i.Commons.OffGCDasOffGCD.Racials) then
                    return "Berserking"
                end

            end

            if e.LightsJudgment:IsCastable() then
                if a.Cast(e.LightsJudgment, i.Commons.OffGCDasOffGCD.Racials, not o:IsInRange(40)) then
                    return "Lights Judgment"
                end

            end

            if e.Fireblood:IsCastable() then
                if a.Cast(e.Fireblood, i.Commons.OffGCDasOffGCD.Racials) then
                    return "Fireblood"
                end

            end

            if e.AncestralCall:IsCastable() then
                if a.Cast(e.AncestralCall, i.Commons.OffGCDasOffGCD.Racials) then
                    return "Ancestral Call"
                end

            end

            if e.BagOfTricks:IsCastable() then
                if a.Cast(e.BagOfTricks, i.Commons.OffGCDasOffGCD.Racials, not o:IsInRange(40)) then
                    return "Bag of Tricks"
                end

            end

            if e.WeaponsOfOrder:IsCastable() and (not e.KegSmash:CooldownUp()) then
                if a.Cast(e.WeaponsOfOrder, nil, i.Commons.CovenantDisplayStyle) then
                    return "Weapons Of Order cd 1"
                end

            end

            if e.FallenOrder:IsCastable() then
                if a.Cast(e.FallenOrder, nil, i.Commons.CovenantDisplayStyle) then
                    return "Fallen Order cd 1"
                end

            end

            if e.BonedustBrew:IsCastable() then
                if a.Cast(e.BonedustBrew, nil, i.Commons.CovenantDisplayStyle) then
                    return "Bonedust Brew cd 1"
                end

            end

            if e.InvokeNiuzaoTheBlackOx:IsCastable() and n.BossFilteredFightRemains(">", 25) then
                if a.Cast(e.InvokeNiuzaoTheBlackOx, i.Brewmaster.GCDasOffGCD.InvokeNiuzaoTheBlackOx) then
                    return "Invoke Niuzao the Black Ox"
                end

            end

            if e.BlackOxBrew:IsCastable() and e.PurifyingBrew:ChargesFractional() < .5 then
                if a.Cast(e.BlackOxBrew, i.Brewmaster.OffGCDasOffGCD.BlackOxBrew) then
                    return "Black Ox Brew"
                end

            end

            if e.BlackOxBrew:IsCastable() and (t:Energy() + (t:EnergyRegen() * e.KegSmash:CooldownRemains())) < 40 and t:BuffDown(e.BlackoutComboBuff) and e.KegSmash:CooldownUp() then
                if a.Cast(e.BlackOxBrew, i.Brewmaster.OffGCDasOffGCD.BlackOxBrew) then
                    return "Black Ox Brew 2"
                end

            end

            if (i.Commons.UseTrinkets) then
                if (true) then
                    local e = u()
                    if e then
                        return e
                    end

                end

            end

        end

        if e.KegSmash:IsCastable() and h >= 2 then
            if a.Cast(e.KegSmash, nil, nil, not o:IsSpellInRange(e.KegSmash)) then
                return "Keg Smash 1"
            end

        end

        if e.FaelineStomp:IsCastable() and h >= 2 then
            if a.Cast(e.FaelineStomp, nil, i.Commons.CovenantDisplayStyle) then
                return "Faeline Stomp cd 1"
            end

        end

        if e.KegSmash:IsCastable() and t:BuffUp(e.WeaponsOfOrder) then
            if a.Cast(e.KegSmash, nil, nil, not o:IsSpellInRange(e.KegSmash)) then
                return "Keg Smash 2"
            end

        end

        if e.BlackoutKick:IsCastable() and (not t:HasLegendaryEquipped(86)) then
            if a.Cast(e.BlackoutKick, nil, nil, not o:IsSpellInRange(e.BlackoutKick)) then
                return "Blackout Kick"
            end

        end

        if e.KegSmash:IsReady() and (not t:HasLegendaryEquipped(86)) then
            if a.Cast(e.KegSmash, nil, nil, not o:IsSpellInRange(e.KegSmash)) then
                return "Keg Smash 3"
            end

        end

        if e.KegSmash:IsReady() and (t:HasLegendaryEquipped(86) and t:BuffUp(e.CharredPassions) and not e.BlackoutKick:CooldownUp()) then
            if a.Cast(e.KegSmash, nil, nil, not o:IsSpellInRange(e.KegSmash)) then
                return "Keg Smash 3"
            end

        end

        if e.KegSmash:IsReady() and (t:HasLegendaryEquipped(86) and t:BuffDown(e.CharredPassions)) then
            if a.Cast(e.KegSmash, nil, nil, not o:IsSpellInRange(e.KegSmash)) then
                return "Keg Smash 3"
            end

        end

        if e.BlackoutKick:IsCastable() and (t:HasLegendaryEquipped(86) and t:BuffUp(e.CharredPassions) and t:BuffDown(e.Shuffle)) then
            if a.Cast(e.BlackoutKick, nil, nil, not o:IsSpellInRange(e.BlackoutKick)) then
                return "Blackout Kick"
            end

        end

        if e.BlackoutKick:IsCastable() and (e.BreathOfFire:CooldownRemains() >= 4 and t:BuffDown(e.CharredPassions) and t:HasLegendaryEquipped(86)) then
            if a.Cast(e.BlackoutKick, nil, nil, not o:IsSpellInRange(e.BlackoutKick)) then
                return "Blackout Kick"
            end

        end

        if e.BlackoutKick:IsCastable() and (e.BreathOfFire:IsCastable() and t:HasLegendaryEquipped(86) and t:BuffUp(e.Shuffle)) then
            if a.Cast(e.BreathOfFire, nil, nil, not o:IsInMeleeRange(8)) then
                return "Breath of Fire 2"
            end

        end

        if e.BlackoutKick:IsCastable() and (t:HasLegendaryEquipped(86) and t:BuffUp(e.CharredPassions)) then
            if a.Cast(e.BlackoutKick, nil, nil, not o:IsSpellInRange(e.BlackoutKick)) then
                return "Blackout Kick"
            end

        end

        if not e.BlackoutKick:IsCastable() and (t:HasLegendaryEquipped(86) and e.BlackoutKick:CooldownRemains() >= 1.3 and e.SpinningCraneKick:IsReady() and t:BuffUp(e.CharredPassions)) then
            if a.Cast(e.SpinningCraneKick, nil, nil, not o:IsInMeleeRange(8)) then
                return "Spinning Crane Kick 2"
            end

        end

        if e.FaelineStomp:IsCastable() then
            if a.Cast(e.FaelineStomp, nil, i.Commons.CovenantDisplayStyle) then
                return "Faeline Stomp cd 2"
            end

        end

        if e.ExpelHarm:IsReady() and e.ExpelHarm:Count() >= 3 and t:BuffUp(e.CelestialBrew) then
            if a.Cast(e.ExpelHarm, nil, nil, not o:IsInMeleeRange(8)) then
                return "Expel Harm 2"
            end

        end

        if e.TouchOfDeath:IsReady() and o:Health() < UnitHealthMax("player") then
            if a.CastSuggested(e.TouchOfDeath) then
                return "Touch Of Death 1"
            end

        end

        if e.RushingJadeWind:IsCastable() and t:BuffDown(e.RushingJadeWind) then
            if a.Cast(e.RushingJadeWind, nil, nil, not o:IsInMeleeRange(8)) then
                return "Rushing Jade Wind"
            end

        end

        if e.BreathOfFire:IsCastable(10, true) and (t:BuffDown(e.BlackoutComboBuff) and (t:BloodlustDown() or (t:BloodlustUp() and o:BuffRefreshable(e.BreathOfFireDotDebuff)))) then
            if a.Cast(e.BreathOfFire, nil, nil, not o:IsInMeleeRange(8)) then
                return "Breath of Fire 2"
            end

        end

        if e.ChiBurst:IsCastable() then
            if a.Cast(e.ChiBurst, nil, nil, not o:IsInRange(40)) then
                return "Chi Burst 2"
            end

        end

        if e.ChiWave:IsCastable() then
            if a.Cast(e.ChiWave, nil, nil, not o:IsInRange(40)) then
                return "Chi Wave 2"
            end

        end

        if e.SpinningCraneKick:IsCastable() and (h >= 3 and e.KegSmash:CooldownRemains() > t:GCD() and ((t:Energy() + (t:EnergyRegen() * (e.KegSmash:CooldownRemains() + e.SpinningCraneKick:ExecuteTime())) >= 65)) and (not e.Spitfire:IsAvailable() or not f)) then
            if a.Cast(e.SpinningCraneKick, nil, nil, not o:IsInMeleeRange(8)) then
                return "Spinning Crane Kick 2"
            end

        end

        if e.TigerPalm:IsCastable() and (not e.BlackoutCombo:IsAvailable() and e.KegSmash:CooldownRemains() > t:GCD() and ((t:Energy() + (t:EnergyRegen() * (e.KegSmash:CooldownRemains() + t:GCD()))) >= 65)) then
            if a.Cast(e.TigerPalm, nil, nil, not o:IsSpellInRange(e.TigerPalm)) then
                return "Tiger Palm 3"
            end

        end

        if e.RushingJadeWind:IsCastable() then
            if a.Cast(e.RushingJadeWind, nil, nil, not o:IsInMeleeRange(8)) then
                return "Rushing Jade Wind 2"
            end

        end

        if a.Cast(e.PoolEnergy) and not i.Brewmaster.NoBrewmasterPooling then
            return "Pool Energy"
        end

    end

end

local function e()
end

a.SetAPL(268, c, e)

