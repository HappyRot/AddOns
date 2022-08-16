local e, e = ...
local e = HeroDBC.DBC
local f = HeroLib
local e = HeroCache
local m = f.Unit
local t = m.Player
local i = m.Target
local e = f.Spell
local a = f.Item
local d = HeroRotation
local o = d.Cast
local I = d.AoEON
local s = d.CDsON
local v = HeroRotationCharDB.Toggles[4]
local O = HeroRotationCharDB.Toggles[5]
local p = HeroRotationCharDB.Toggles[6]
local y = HeroRotationCharDB.Toggles[12]
local j = HeroRotationCharDB.Toggles[15]
local T = GetInventoryItemID("player", 13)
local A = GetInventoryItemID("player", 14)
local e = e.Warrior.Arms
local q = a.Warrior.Arms
local N = {  }
local n
local c
local l
local a = 0
local h = 0
local g = t:HasLegendaryEquipped(183)
local k = t:HasLegendaryEquipped(215)
local w = t:HasLegendaryEquipped(182)
local b = t:HasLegendaryEquipped(181)
local u = d.Commons.Everyone
local r = { General = d.GUISettings.General, Commons = d.GUISettings.APL.Warrior.Commons, Arms = d.GUISettings.APL.Warrior.Arms }
local S = { { e.StormBolt, "Cast Storm Bolt (Interrupt)", function()
    return true
end } }
f:RegisterForEvent(function()
    g = t:HasLegendaryEquipped(183)
    k = t:HasLegendaryEquipped(215)
    w = t:HasLegendaryEquipped(182)
    b = t:HasLegendaryEquipped(181)
end, "PLAYER_EQUIPMENT_CHANGED")
local function f(e)
    if e then
        return 1
    else
        return 0
    end

end

local function f(e)
    return e ~= 0
end

local function f(e)
    return (e:HealthPercentage())
end

local function f(o)
                if ((o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35))) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (o:GUID() == m("mouseover"):GUID() and r.Arms.TargetSwap == "Mouseover") then
        h = 141
        return true
    elseif (o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35)) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (r.Arms.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not y) then
        h = 999
        return true
    elseif (o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35)) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (o:GUID() == i:GUID()) then
        a = 14
        return true
    elseif (o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35)) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) then
        return true
    end

end

local function x(o)
                if ((o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35)) and (t:BuffUp(e.AshenJuggernautBuff) and t:BuffRemains(e.AshenJuggernautBuff) < t:GCD() and e.AshenJuggernaut:ConduitRank() > 1)) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (o:GUID() == m("mouseover"):GUID() and r.Arms.TargetSwap == "Mouseover") then
        h = 141
        return true
    elseif ((o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35)) and (t:BuffUp(e.AshenJuggernautBuff) and t:BuffRemains(e.AshenJuggernautBuff) < t:GCD() and e.AshenJuggernaut:ConduitRank() > 1)) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (r.Arms.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not y) then
        h = 999
        return true
    elseif ((o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35)) and (t:BuffUp(e.AshenJuggernautBuff) and t:BuffRemains(e.AshenJuggernautBuff) < t:GCD() and e.AshenJuggernaut:ConduitRank() > 1)) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (o:GUID() == i:GUID()) then
        a = 14
        return true
    elseif ((o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35)) and (t:BuffUp(e.AshenJuggernautBuff) and t:BuffRemains(e.AshenJuggernautBuff) < t:GCD() and e.AshenJuggernaut:ConduitRank() > 1)) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) then
        return true
    end

end

local function z(o)
                if (o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35)) and (t:BuffUp(e.SweepingStrikesBuff)) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (o:GUID() == m("mouseover"):GUID() and r.Arms.TargetSwap == "Mouseover") then
        h = 141
        return true
    elseif (o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35)) and (t:BuffUp(e.SweepingStrikesBuff)) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (r.Arms.TargetSwap == "AutoSwap" and o:GUID() ~= i:GUID() and not y) then
        h = 999
        return true
    elseif (o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35)) and (t:BuffUp(e.SweepingStrikesBuff)) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (o:GUID() == i:GUID()) then
        a = 14
        return true
    elseif (o:HealthPercentage() < 20 or (e.Massacre:IsAvailable() and o:HealthPercentage() < 35)) and (t:BuffUp(e.SweepingStrikesBuff)) and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) then
        return true
    end

end

local function E()
    if u.TargetIsValid() and not t:AffectingCombat() and p then
        if e.BattleShout:IsCastable() and (t:BuffRemains(e.BattleShoutBuff, true) < 60) then
            if o(e.BattleShout, r.Arms.GCDasOffGCD.BattleShout) then
                a = 1
                return "battle_shout precombat 2"
            end

        end

        if n then
            if e.Skullsplitter:IsCastable() then
                if o(e.Skullsplitter) then
                    a = 2
                    return "skullsplitter precombat 6"
                end

            end

            if e.ColossusSmash:IsCastable() and s() then
                if o(e.ColossusSmash) then
                    a = 3
                    return "colossus_smash precombat 8"
                end

            end

            if e.Warbreaker:IsCastable() and s() and i:IsInRange(8) then
                if o(e.Warbreaker) then
                    a = 4
                    return "warbreaker precombat 10"
                end

            end

            if e.Overpower:IsCastable() then
                if o(e.Overpower) then
                    a = 5
                    return "overpower precombat 12"
                end

            end

        end

    end

end

local function _()
    if e.Skullsplitter:IsCastable() and (t:Rage() < 60 and t:BuffDown(e.DeadlyCalmBuff)) then
        if o(e.Skullsplitter, nil, nil, not n) then
            a = 2
            return "skullsplitter hac 2"
        end

    end

    if s() then
        if e.ConquerorsBanner:IsCastable() and v then
            if o(e.ConquerorsBanner, nil, nil) then
                a = 6
                return "conquerors_banner hac 4"
            end

        end

        if e.Avatar:IsCastable() and (e.ColossusSmash:CooldownRemains() < 1) and i:IsInRange(8) then
            if o(e.Avatar, nil) then
                a = 7
                return "avatar hac 6"
            end

        end

    end

    if e.Warbreaker:IsCastable() and i:IsInRange(8) and s() then
        if o(e.Warbreaker, nil, nil, not i:IsInRange(8)) then
            a = 4
            return "warbreaker hac 8"
        end

    end

    if e.ColossusSmash:IsCastable() and n and s() then
        if o(e.ColossusSmash, nil, nil, not n) then
            a = 3
            return "colossus_smash hac 10"
        end

    end

    if e.Cleave:IsReady() and (i:DebuffRemains(e.DeepWoundsDebuff) < t:GCD()) and i:IsInRange(8) then
        if o(e.Cleave, nil, nil, not i:IsInRange(8)) then
            a = 8
            return "cleave hac 12"
        end

    end

    if e.Bladestorm:IsCastable() and s() and i:IsInRange(8) then
        if o(e.Bladestorm, nil, nil, not i:IsInRange(8)) then
            a = 9
            return "bladestorm hac 14"
        end

    end

    if e.Ravager:IsCastable() and s() then
        if o(e.Ravager, nil, nil, not i:IsSpellInRange(e.Ravager)) then
            a = 10
            return "ravager hac 16"
        end

    end

    if e.Rend:IsReady() and (i:DebuffRefreshable(e.RendDebuff) and t:BuffUp(e.SweepingStrikesBuff)) then
        if o(e.Rend, nil, nil, not n) then
            a = 11
            return "rend hac 18"
        end

    end

    if e.Cleave:IsReady() and i:IsInRange(8) then
        if o(e.Cleave, nil, nil, not i:IsInRange(8)) then
            a = 8
            return "cleave hac 20"
        end

    end

    if e.MortalStrike:IsReady() and (t:BuffUp(e.SweepingStrikesBuff) or i:DebuffRemains(e.DeepWoundsDebuff) < t:GCD() and not e.Cleave:IsAvailable()) then
        if o(e.MortalStrike, nil, nil, not n) then
            a = 12
            return "mortal_strike hac 22"
        end

    end

    if e.Overpower:IsCastable() and (e.Dreadnaught:IsAvailable()) then
        if o(e.Overpower, nil, nil, not n) then
            a = 5
            return "overpower hac 24"
        end

    end

    if e.Condemn:IsCastable() and e.Condemn:IsUsable() then
        if o(e.Condemn, nil, nil, not n) then
            a = 13
            return "condemn hac 26"
        end

    end

    if e.Execute:IsCastable() and e.Execute:IsUsable() and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (t:BuffUp(e.SweepingStrikesBuff)) then
        if o(e.Execute, nil, nil, not n) then
            a = 14
            return "execute hac 28"
        end

    else
        if u.CastCycle(e.Execute, c, z) then
            return "execute hac 28"
        end

    end

    if e.Overpower:IsCastable() then
        if o(e.Overpower, nil, nil, not n) then
            a = 5
            return "overpower hac 30"
        end

    end

    if e.Whirlwind:IsReady() and i:IsInRange(8) then
        if o(e.Whirlwind, nil, nil, not i:IsInRange(8)) then
            a = 15
            return "whirlwind hac 32"
        end

    end

end

local function z()
    if e.DeadlyCalm:IsCastable() and s() then
        if o(e.DeadlyCalm, nil) then
            a = 16
            return "deadly_calm execute 2"
        end

    end

    if s() and e.ConquerorsBanner:IsCastable() then
        if o(e.ConquerorsBanner, nil, nil) then
            a = 6
            return "conquerors_banner execute 4"
        end

    end

    if e.Avatar:IsCastable() and s() and i:IsInRange(8) then
        if o(e.Avatar, nil) then
            a = 7
            return "avatar execute 6"
        end

    end

    if e.Condemn:IsCastable() and (t:BuffUp(e.AshenJuggernautBuff) and t:BuffRemains(e.AshenJuggernautBuff) < t:GCD() and e.AshenJuggernaut:ConduitRank() > 1) then
        if o(e.Condemn, nil, nil, not n) then
            a = 13
            return "condemn execute 8"
        end

    end

    if e.Execute:IsCastable() and e.Execute:IsUsable() and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (t:BuffUp(e.AshenJuggernautBuff) and t:BuffRemains(e.AshenJuggernautBuff) < t:GCD() and e.AshenJuggernaut:ConduitRank() > 1) then
        if o(e.Execute, nil, nil, not n) then
            a = 14
            return "execute execute 10"
        end

    else
        if u.CastCycle(e.Execute, c, x) then
            return "execute execute 10"
        end

    end

    if s() and e.Ravager:IsCastable() then
        if o(e.Ravager, nil, nil, not i:IsSpellInRange(e.Ravager)) then
            a = 10
            return "ravager execute 12"
        end

    end

    if e.Rend:IsReady() and (i:DebuffRemains(e.RendDebuff) <= t:GCD() and (not e.Warbreaker:IsAvailable() and e.ColossusSmash:CooldownRemains() < 4 or e.Warbreaker:IsAvailable() and e.Warbreaker:CooldownRemains() < 4) and i:TimeToDie() > 12) then
        if o(e.Rend, nil, nil, not n) then
            a = 11
            return "rend execute 14"
        end

    end

    if e.Warbreaker:IsCastable() and s() and i:IsInRange(8) then
        if o(e.Warbreaker, nil, nil, not i:IsInRange(8)) then
            a = 4
            return "warbreaker execute 16"
        end

    end

    if e.ColossusSmash:IsCastable() and s() then
        if o(e.ColossusSmash, nil, nil, not n) then
            a = 3
            return "colossus_smash execute 18"
        end

    end

    if s() then
        if e.AncientAftershock:IsCastable() and (i:DebuffUp(e.ColossusSmashDebuff)) then
            if o(e.AncientAftershock, nil, nil, not n) then
                a = 17
                return "ancient_aftershock execute 20"
            end

        end

        if e.SpearofBastion:IsCastable() and v and i:IsInRange(5) then
            if o(e.SpearofBastion, nil, nil, not i:IsSpellInRange(e.SpearofBastion)) then
                a = 18
                return "spear_of_bastion execute 22"
            end

        end

    end

    if e.Condemn:IsCastable() and (b and (t:RageDeficit() < 25 or i:DebuffUp(e.ColossusSmashDebuff) and t:Rage() > 40 or t:BuffUp(e.SuddenDeathBuff) or t:BuffUp(e.DeadlyCalmBuff))) then
        if o(e.Condemn, nil, nil, not n) then
            a = 13
            return "condemn execute 24"
        end

    end

    if e.Overpower:IsCastable() and (e.Overpower:Charges() == 2) then
        if o(e.Overpower, nil, nil, not n) then
            a = 5
            return "overpower execute 26"
        end

    end

    if e.Cleave:IsReady() and (l > 1 and i:DebuffRemains(e.DeepWoundsDebuff) < t:GCD()) then
        if o(e.Cleave, nil, nil, not n) then
            a = 8
            return "cleave execute 28"
        end

    end

    if e.MortalStrike:IsReady() and (i:DebuffRemains(e.DeepWoundsDebuff) <= t:GCD() or w or t:BuffStack(e.OverpowerBuff) == 2 and i:DebuffStack(e.ExploiterDebuff) == 2 or t:BuffUp(e.BattlelordBuff)) then
        if o(e.MortalStrike, nil, nil, not n) then
            a = 12
            return "mortal_strike execute 30"
        end

    end

    if e.Condemn:IsCastable() and (t:RageDeficit() < 25 or t:BuffUp(e.DeadlyCalmBuff)) then
        if o(e.Condemn, nil, nil, not n) then
            a = 13
            return "condemn execute 32"
        end

    end

    if e.Skullsplitter:IsCastable() and (t:Rage() < 45) then
        if o(e.Skullsplitter, nil, nil, not n) then
            a = 2
            return "skullsplitter execute 34"
        end

    end

    if s() and e.Bladestorm:IsCastable() and (t:BuffDown(e.DeadlyCalmBuff) and (t:Rage() < 20 or not k and t:Rage() < 50)) and i:IsInRange(8) then
        if o(e.Bladestorm, nil, nil, not n) then
            a = 9
            return "bladestorm execute 36"
        end

    end

    if e.Overpower:IsCastable() then
        if o(e.Overpower, nil, nil, not n) then
            a = 5
            return "overpower execute 38"
        end

    end

    if e.Condemn:IsCastable() and e.Condemn:IsUsable() then
        if o(e.Condemn, nil, nil, not n) then
            a = 13
            return "condemn execute 40"
        end

    end

    if e.Execute:IsCastable() and e.Execute:IsUsable() and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) then
        if o(e.Execute, nil, nil, not n) then
            a = 14
            return "execute execute 42"
        end

    else
        if u.CastCycle(e.Execute, c, f) then
            return "execute hac 42"
        end

    end

end

local function b()
    if e.Rend:IsReady() and (i:DebuffRemains(e.RendDebuff) <= t:GCD()) then
        if o(e.Rend, nil, nil, not n) then
            a = 11
            return "rend single_target 2"
        end

    end

    if s() and e.ConquerorsBanner:IsCastable() and (i:TimeToDie() > 140) then
        if o(e.ConquerorsBanner, nil, nil) then
            a = 6
            return "conquerors_banner single_target 4"
        end

    end

    if s() and e.Avatar:IsCastable() and i:IsInRange(8) then
        if o(e.Avatar, nil) then
            a = 7
            return "avatar single_target 6"
        end

    end

    if e.Ravager:IsCastable() then
        if o(e.Ravager, nil, nil, not i:IsInRange(40)) then
            a = 10
            return "ravager single_target 8"
        end

    end

    if e.Warbreaker:IsCastable() and s() and i:IsInRange(8) then
        if o(e.Warbreaker, nil, nil, not i:IsInRange(8)) then
            a = 4
            return "warbreaker single_target 10"
        end

    end

    if e.ColossusSmash:IsCastable() and s() then
        if o(e.ColossusSmash, nil, nil, not n) then
            a = 3
            return "colossus_smash single_target 12"
        end

    end

    if s() then
        if e.AncientAftershock:IsCastable() and (i:DebuffUp(e.ColossusSmashDebuff)) then
            if o(e.AncientAftershock, nil, nil, not n) then
                a = 17
                return "ancient_aftershock single_target 14"
            end

        end

        if e.SpearofBastion:IsCastable() and i:IsInRange(5) then
            if o(e.SpearofBastion, nil, nil, not i:IsSpellInRange(e.SpearofBastion)) then
                a = 18
                return "spear_of_bastion single_target 16"
            end

        end

    end

    if e.Overpower:IsCastable() and (e.Overpower:Charges() == 2) then
        if o(e.Overpower, nil, nil, not n) then
            a = 5
            return "overpower single_target 18"
        end

    end

    if e.MortalStrike:IsReady() and (w or g or t:BuffStack(e.OverpowerBuff) >= 2) then
        if o(e.MortalStrike, nil, nil, not n) then
            a = 12
            return "mortal_strike single_target 20"
        end

    end

    if e.Condemn:IsCastable() and e.Condemn:IsUsable() and (t:BuffUp(e.SuddenDeathBuff)) then
        if o(e.Condemn, nil, nil, not n) then
            a = 13
            return "condemn single_target 22"
        end

    end

    if e.Execute:IsCastable() and e.Execute:IsUsable() and (t:Rage() > 20 or t:BuffUp(e.SuddenDeathBuff)) and (t:BuffUp(e.SuddenDeathBuff)) then
        if o(e.Execute, nil, nil, not n) then
            a = 14
            return "execute single_target 24"
        end

    else
        if u.CastCycle(e.Execute, c, f) then
            return "execute hac 24"
        end

    end

    if e.Skullsplitter:IsCastable() and (t:RageDeficit() > 45 and t:BuffDown(e.DeadlyCalmBuff)) then
        if o(e.Skullsplitter, nil, nil, not n) then
            a = 2
            return "skullsplitter single_target 26"
        end

    end

    if s() and e.Bladestorm:IsCastable() and (t:BuffDown(e.DeadlyCalmBuff) and t:Rage() < 30) and i:IsInRange(8) then
        if o(e.Bladestorm, nil, nil, not i:IsInRange(8)) then
            a = 9
            return "bladestorm single_target 28"
        end

    end

    if s() and e.DeadlyCalm:IsCastable() then
        if o(e.DeadlyCalm, nil) then
            a = 16
            return "deadly_calm single_target 30"
        end

    end

    if e.Overpower:IsCastable() then
        if o(e.Overpower, nil, nil, not n) then
            a = 5
            return "overpower single_target 32"
        end

    end

    if e.MortalStrike:IsReady() then
        if o(e.MortalStrike, nil, nil, not n) then
            a = 12
            return "mortal_strike single_target 34"
        end

    end

    if e.Rend:IsReady() and (i:DebuffRefreshable(e.RendDebuff)) then
        if o(e.Rend, nil, nil, not n) then
            a = 11
            return "rend single_target 36"
        end

    end

    if e.Cleave:IsReady() and (l > 1) then
        if o(e.Cleave, nil, nil, not n) then
            a = 8
            return "cleave single_target 38"
        end

    end

    if e.Whirlwind:IsReady() and (e.FervorofBattle:IsAvailable() or l > 4 or l > 2 and t:BuffDown(e.SweepingStrikesBuff)) and i:IsInRange(8) then
        if o(e.Whirlwind, nil, nil, not i:IsInRange(8)) then
            a = 15
            return "whirlwind single_target 40"
        end

    end

    if e.Slam:IsReady() and (not e.FervorofBattle:IsAvailable() and (t:Rage() > 50 or i:DebuffUp(e.ColossusSmashDebuff) or not w)) then
        if o(e.Slam, nil, nil, not n) then
            a = 19
            return "slam single_target 42"
        end

    end

end

local function m()
    p = HeroRotationCharDB.Toggles[6]
    v = HeroRotationCharDB.Toggles[4]
    O = HeroRotationCharDB.Toggles[5]
    y = HeroRotationCharDB.Toggles[12]
    j = HeroRotationCharDB.Toggles[15]
end

local function f()
    if I() then
        c = t:GetEnemiesInMeleeRange(8)
        l = #c
    else
        l = 1
    end

    n = i:IsInMeleeRange(5)
    if not BotOn then
        h = 0
        a = 0
    end

    if h > 0 then
        h = 0
    end

    if a > 0 then
        a = 0
    end

    ShouldReturn = m()
    if t:BuffUp(e.Bladestorm) then
        if d.CastAnnotated(e.Pool, false, "WAIT") then
            a = 999
            return "Wait/Pool Resources"
        end

    end

    if not t:AffectingCombat() and p then
        local e = E()
        if e then
            return e
        end

    end

    if u.TargetIsValid() and t:AffectingCombat() then
        local h = u.Interrupt(5, e.Pummel, r.Commons.OffGCDasOffGCD.Pummel, S)
        if h then
            return h
        end

        if t:HealthPercentage() < r.Commons.VictoryRushHP then
            if e.VictoryRush:IsCastable() and e.VictoryRush:IsUsable() then
                if o(e.VictoryRush, nil, nil, not n) then
                    a = 20
                    return "victory_rush heal"
                end

            end

            if e.ImpendingVictory:IsReady() and e.VictoryRush:IsUsable() then
                if o(e.ImpendingVictory, nil, nil, not n) then
                    a = 21
                    return "impending_victory heal"
                end

            end

        end

        if q.PotionofSpectralStrength:IsReady() and r.Commons.Enabled.Potions and j and (i:DebuffRemains(e.ColossusSmashDebuff) > 8 or i:TimeToDie() < 25) then
            if o(q.PotionofSpectralStrength, nil, nil) then
                return "potion main 4"
            end

        end

        if s() then
            if e.ArcaneTorrent:IsCastable() and (e.MortalStrike:CooldownRemains() > 1.5 and t:Rage() < 50) then
                if o(e.ArcaneTorrent, nil, nil, not i:IsInRange(8)) then
                    a = 23
                    return "arcane_torrent main 6"
                end

            end

            if e.LightsJudgment:IsCastable() and (i:DebuffDown(e.ColossusSmashDebuff) and not e.MortalStrike:CooldownUp()) then
                if o(e.LightsJudgment, nil, nil, not i:IsSpellInRange(e.LightsJudgment)) then
                    a = 24
                    return "lights_judgment main 8"
                end

            end

            if e.BagofTricks:IsCastable() and (i:DebuffDown(e.ColossusSmashDebuff) and not e.MortalStrike:CooldownUp()) then
                if o(e.BagofTricks, nil, nil, not i:IsSpellInRange(e.BagofTricks)) then
                    a = 25
                    return "bag_of_tricks main 10"
                end

            end

            if e.Berserking:IsCastable() and (i:DebuffRemains(e.ColossusSmashDebuff) > 6) then
                if o(e.Berserking, nil) then
                    a = 26
                    return "berserking main 12"
                end

            end

            if e.BloodFury:IsCastable() and (i:DebuffUp(e.ColossusSmashDebuff)) then
                if o(e.BloodFury, nil) then
                    a = 27
                    return "blood_fury main 14"
                end

            end

            if e.Fireblood:IsCastable() and (i:DebuffUp(e.ColossusSmashDebuff)) then
                if o(e.Fireblood, nil) then
                    a = 28
                    return "fireblood main 16"
                end

            end

            if e.AncestralCall:IsCastable() and (i:DebuffUp(e.ColossusSmashDebuff)) then
                if o(e.AncestralCall, nil) then
                    a = 29
                    return "ancestral_call main 18"
                end

            end

        end

        if (r.Commons.Enabled.Trinkets and s()) then
            local e = t:GetUseableTrinkets(N)
            if e then
                if o(e, nil, nil) then
                                        if e:ID() == T then
                        a = 30
                        return "top trinket 1"
                    elseif e:ID() == A then
                        a = 31
                        return "top trinket 2"
                    end

                end

            end

        end

        if e.SweepingStrikes:IsCastable() and (l > 1 and (e.Bladestorm:CooldownRemains() > 15 or e.Ravager:IsAvailable())) then
            if o(e.SweepingStrikes, nil, nil, not i:IsInRange(8)) then
                a = 32
                return "sweeping_strikes main 20"
            end

        end

        if (l >= 3) then
            local e = _()
            if e then
                return e
            end

        end

        if ((e.Massacre:IsAvailable() and i:HealthPercentage() < 35) or i:HealthPercentage() < 20 or (i:HealthPercentage() > 80 and t:Covenant() == "Venthyr")) then
            local e = z()
            if e then
                return e
            end

        end

        if (true) then
            local e = b()
            if e then
                return e
            end

        end

        if d.CastAnnotated(e.Pool, false, "WAIT") then
            a = 999
            return "Wait/Pool Resources"
        end

    end

end

local function e()
end

function ReturnSpell()
    if a == 0 then
        return 0
    else
        return a
    end

end

function ReturnSpellMO()
    if h == 0 then
        return 0
    else
        return h
    end

end

d.SetAPL(71, f, e)

