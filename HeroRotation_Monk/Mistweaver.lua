local e, e = ...
local e = HeroDBC.DBC
local s = HeroLib
local e = HeroCache
local e = s.Unit
local i = e.Player
local n = e.Target
local e = e.Pet
local e = s.Spell
local t = s.MultiSpell
local a = s.Item
local t = HeroRotation
local o = t.AoEON
local o = t.CDsON
local o = math.min
local o = pairs
local e = e.Monk.Mistweaver
local o = a.Monk.Mistweaver
local c = {  }
local u
local d
local r
local a, a
local a
local l = { { e.LegSweep, "Cast Leg Sweep (Stun)", function()
    return true
end } }
local a = { { e.Paralysis, "Cast Paralysis (Stun)", function()
    return true
end } }
local h = t.Commons.Everyone
local a = t.Commons.Monk
local a = { General = t.GUISettings.General, Commons = t.GUISettings.APL.Monk.Commons, Mistweaver = t.GUISettings.APL.Monk.Mistweaver }
local m = i:HasLegendaryEquipped(88)
local m = i:HasLegendaryEquipped(86)
local m = i:HasLegendaryEquipped(82)
local m = i:HasLegendaryEquipped(85)
local m = i:HasLegendaryEquipped(83)
local m = i:HasLegendaryEquipped(89)
local m = i:HasLegendaryEquipped(87)
local m = i:HasLegendaryEquipped(84)
s:RegisterForEvent(function()
    VarFoPPreChan = 0
end, "PLAYER_REGEN_ENABLED")
local function m(t)
    if e.TigerPalm:TimeSinceLastCast() <= i:GCD() then
        return true
    end

    return t and n:IsInMeleeRange(t) or n:IsInMeleeRange(5)
end

local function f()
    local e = i:GetUseableTrinkets(c)
    if e then
        if t.Cast(e, nil, a.Commons.TrinketDisplayStyle) then
            return "Generic use_items for " .. e:Name()
        end

    end

end

local function w()
    local o = i:IsTankingAoE(8) or i:IsTanking(n)
    if e.DampenHarm:IsCastable() and a.Mistweaver.ShowDampenHarmCD then
        if t.Cast(e.DampenHarm, a.Mistweaver.GCDasOffGCD.DampenHarm) then
            return "Dampen Harm"
        end

    end

    if e.FortifyingBrew:IsCastable() then
        if t.Cast(e.FortifyingBrew, a.Mistweaver.GCDasOffGCD.FortifyingBrew) then
            return "Fortifying Brew"
        end

    end

end

local function c()
    m()
    u = i:GetEnemiesInMeleeRange(5)
    d = i:GetEnemiesInMeleeRange(8)
    r = #d
    if not i:AffectingCombat() and h.TargetIsValid() then
        if o.PotionofPhantomFire:IsReady() and a.Commons.UsePotions then
            if t.CastSuggested(o.PotionofPhantomFire) then
                return "Potion of Phantom Fire"
            end

        end

        if o.PotionofSpectralIntellect:IsReady() and a.Commons.UsePotions then
            if t.CastSuggested(o.PotionofSpectralIntellect) then
                return "Potion of Spectral Intellect"
            end

        end

        if o.PotionofDeathlyFixation:IsReady() and a.Commons.UsePotions then
            if t.CastSuggested(o.PotionofDeathlyFixation) then
                return "Potion of Deathly Fixation"
            end

        end

        if o.PotionofEmpoweredExorcisms:IsReady() and a.Commons.UsePotions then
            if t.CastSuggested(o.PotionofEmpoweredExorcisms) then
                return "Potion of Empowered Exorcisms"
            end

        end

        if o.PotionofHardenedShadows:IsReady() and a.Commons.UsePotions then
            if t.CastSuggested(o.PotionofHardenedShadows) then
                return "Potion of Hardened Shadows"
            end

        end

        if o.PotionofSpectralStamina:IsReady() and a.Commons.UsePotions then
            if t.CastSuggested(o.PotionofSpectralStamina) then
                return "Potion of Spectral Stamina"
            end

        end

        if e.ChiBurst:IsCastable() then
            if t.Cast(e.ChiBurst, nil, nil, not n:IsInRange(40)) then
                return "Chi Burst"
            end

        end

        if e.ChiWave:IsCastable() then
            if t.Cast(e.ChiWave, nil, nil, not n:IsInRange(40)) then
                return "Chi Wave"
            end

        end

    end

    if h.TargetIsValid() then
        local d = h.Interrupt(5, e.LegSweep, a.Commons.GCDasOffGCD.LegSweep, l)
        if d and a.General.InterruptWithStun then
            return d
        end

        local h = h.Interrupt(5, e.Paralysis, a.Commons.GCDasOffGCD.Paralysis, l)
        if h and a.General.InterruptWithStun then
            return h
        end

        if t.CDsON() then
            if o.PotionofPhantomFire:IsReady() and a.Commons.UsePotions then
                if t.CastSuggested(o.PotionofPhantomFire) then
                    return "Potion of Phantom Fire 2"
                end

            end

            if o.PotionofSpectralIntellect:IsReady() and a.Commons.UsePotions then
                if t.CastSuggested(o.PotionofSpectralIntellect) then
                    return "Potion of Spectral Intellect 2"
                end

            end

            if o.PotionofDeathlyFixation:IsReady() and a.Commons.UsePotions then
                if t.CastSuggested(o.PotionofDeathlyFixation) then
                    return "Potion of Deathly Fixation 2"
                end

            end

            if o.PotionofEmpoweredExorcisms:IsReady() and a.Commons.UsePotions then
                if t.CastSuggested(o.PotionofEmpoweredExorcisms) then
                    return "Potion of Empowered Exorcisms 2"
                end

            end

            if o.PotionofHardenedShadows:IsReady() and a.Commons.UsePotions then
                if t.CastSuggested(o.PotionofHardenedShadows) then
                    return "Potion of Hardened Shadows 2"
                end

            end

            if o.PotionofSpectralStamina:IsReady() and a.Commons.UsePotions then
                if t.CastSuggested(o.PotionofSpectralStamina) then
                    return "Potion of Spectral Stamina 2"
                end

            end

            if e.BloodFury:IsCastable() then
                if t.Cast(e.BloodFury, a.Commons.OffGCDasOffGCD.Racials) then
                    return "Blood Fury"
                end

            end

            if e.Berserking:IsCastable() then
                if t.Cast(e.Berserking, a.Commons.OffGCDasOffGCD.Racials) then
                    return "Berserking"
                end

            end

            if e.LightsJudgment:IsCastable() then
                if t.Cast(e.LightsJudgment, a.Commons.OffGCDasOffGCD.Racials, not n:IsInRange(40)) then
                    return "Lights Judgment"
                end

            end

            if e.Fireblood:IsCastable() then
                if t.Cast(e.Fireblood, a.Commons.OffGCDasOffGCD.Racials) then
                    return "Fireblood"
                end

            end

            if e.AncestralCall:IsCastable() then
                if t.Cast(e.AncestralCall, a.Commons.OffGCDasOffGCD.Racials) then
                    return "Ancestral Call"
                end

            end

            if e.BagOfTricks:IsCastable() then
                if t.Cast(e.BagOfTricks, a.Commons.OffGCDasOffGCD.Racials, not n:IsInRange(40)) then
                    return "Bag of Tricks"
                end

            end

            if e.WeaponsOfOrder:IsCastable() then
                if t.Cast(e.WeaponsOfOrder, nil, a.Commons.CovenantDisplayStyle) then
                    return "Weapons Of Order"
                end

            end

            if e.FaelineStomp:IsCastable() then
                if t.Cast(e.FaelineStomp, nil, a.Commons.CovenantDisplayStyle) then
                    return "Faeline Stomp"
                end

            end

            if e.FallenOrder:IsCastable() then
                if t.Cast(e.FallenOrder, nil, a.Commons.CovenantDisplayStyle) then
                    return "Fallen Order"
                end

            end

            if e.BonedustBrew:IsCastable() then
                if t.Cast(e.BonedustBrew, nil, a.Commons.CovenantDisplayStyle) then
                    return "Bonedust Brew"
                end

            end

            if e.SummonJadeSerpentStatue:IsCastable() and e.SummonJadeSerpentStatue:TimeSinceLastCast() >= 900 then
                if t.Cast(e.SummonJadeSerpentStatue, a.Mistweaver.GCDasOffGCD.SummonJadeSerpentStatue) then
                    return "Summon Jade Serpent Statue"
                end

            end

            if e.InvokeYulonTheJadeSerpent:IsCastable() and s.BossFilteredFightRemains(">", 25) then
                if t.Cast(e.InvokeYulonTheJadeSerpent, a.Mistweaver.GCDasOffGCD.InvokeYulonTheJadeSerpent) then
                    return "Invoke Yu'lon the Jade Serpent"
                end

            end

            if e.InvokeChiJiTheRedCrane:IsCastable() and s.BossFilteredFightRemains(">", 25) then
                if t.Cast(e.InvokeChiJiTheRedCrane, a.Mistweaver.GCDasOffGCD.InvokeChiJiTheRedCrane) then
                    return "Invoke Chi-Ji the Red Crane"
                end

            end

            if e.ThunderFocusTea:IsCastable() and r < 3 then
                if t.Cast(e.ThunderFocusTea, a.Mistweaver.OffGCDasOffGCD.ThunderFocusTea) then
                    return "Thunder Focus Tea"
                end

            end

            if e.RenewingMist:IsCastable() then
                if t.Cast(e.RenewingMist, a.Mistweaver.GCDasOffGCD.RenewingMist) then
                    return "Renewing Mist"
                end

            end

            h = w()
            if h then
                return h
            end

            if (a.Commons.UseTrinkets) then
                if (true) then
                    local e = f()
                    if e then
                        return e
                    end

                end

            end

        end

        if (t.AoEON() and (r >= 3)) then
            if e.SpinningCraneKick:IsCastable() then
                if t.Cast(e.SpinningCraneKick, nil, nil, not n:IsInMeleeRange(8)) then
                    return "Spinning Crane Kick 1"
                end

            end

            if e.ChiBurst:IsCastable() then
                if t.Cast(e.ChiBurst, nil, nil, not n:IsInRange(40)) then
                    return "Chi Burst AoE"
                end

            end

            if e.ChiWave:IsCastable() then
                if t.Cast(e.ChiWave, nil, nil, not n:IsInRange(40)) then
                    return "Chi Wave AoE"
                end

            end

        end

        if r < 3 or (not t.AoEON()) then
            if e.RisingSunKick:IsCastable() then
                if t.Cast(e.RisingSunKick, nil, nil, not n:IsSpellInRange(e.RisingSunKick)) then
                    return "Rising Sun Kick"
                end

            end

            if e.BlackoutKick:IsCastable() and i:BuffStack(e.TeachingsOfTheMonasteryBuff) >= 1 and e.RisingSunKick:CooldownRemains() < 12 then
                if t.Cast(e.BlackoutKick, nil, nil, not n:IsSpellInRange(e.BlackoutKick)) then
                    return "Blackout Kick"
                end

            end

            if e.ChiBurst:IsCastable() then
                if t.Cast(e.ChiBurst, nil, nil, not n:IsInRange(40)) then
                    return "Chi Burst Single Target"
                end

            end

            if e.ChiWave:IsCastable() then
                if t.Cast(e.ChiWave, nil, nil, not n:IsInRange(40)) then
                    return "Chi Wave Single Target"
                end

            end

            if e.TigerPalm:IsCastable() and i:BuffStack(e.TeachingsOfTheMonasteryBuff) < 3 or i:BuffRemains(e.TeachingsOfTheMonasteryBuff) < 2 then
                if t.Cast(e.TigerPalm, nil, nil, not n:IsSpellInRange(e.TigerPalm)) then
                    return "Tiger Palm 1"
                end

            end

        end

        if t.Cast(e.PoolEnergy) and not a.Mistweaver.NoMistweaverPooling then
            return "Pool Energy"
        end

    end

end

local function e()
end

t.SetAPL(270, c, e)

