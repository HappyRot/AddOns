local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = d.Spell;
local j = d.Item;
local k = HeroRotation;
local l = k.Cast;
local m = k.CDsON;
local n = k.AoEON;
local o = HeroRotationCharDB.Toggles[4]
local p = HeroRotationCharDB.Toggles[5]
local q = HeroRotationCharDB.Toggles[6]
local r = HeroRotationCharDB.Toggles[15]
local s = HeroRotationCharDB.Toggles[12]
local t = GetInventoryItemID("player", 13)
local u = GetInventoryItemID("player", 14)
local v = i.Warrior.Fury;
local w = j.Warrior.Fury;
local x = {}
local y;
local z = 0;
local A = 0;
local B, C, D;
local E;
local F = k.Commons.Everyone;
local G = { General = k.GUISettings.General, Commons = k.GUISettings.APL.Warrior.Commons,
    Fury = k.GUISettings.APL.Warrior.Fury }
local H = { { v.StormBolt, "Cast Storm Bolt (Interrupt)", function() return true end } }
local function I(J) if J then return 1 else return 0 end end
;
local function K(J) return J ~= 0 end
;
local function L()
    if v.BerserkerStance:IsCastable() and g:BuffDown(v.BerserkerStance, true) then if l(v.BerserkerStance) then
            A = v.BerserkerStance:ID()
            return "berserker_stance precombat 2"
        end end
    ;
    if v.Charge:IsReady() and q and not E then if l(v.Charge, nil) then
            A = v.Charge:ID()
            return "charge precombat 12"
        end end
    ;
    if v.Avatar:IsCastable() and not v.TitansTorment:IsAvailable() then if l(v.Avatar, nil) then
            A = v.Avatar:ID()
            return "avatar precombat 6"
        end end
    ;
    if v.Recklessness:IsCastable() and not v.RecklessAbandon:IsAvailable() then if l(v.Recklessness, nil) then
            A = v.Recklessness:ID()
            return "recklessness precombat 8"
        end end
    ;
    if v.Bloodthirst:IsCastable() and E then if l(v.Bloodthirst, nil, nil, not E) then
            A = v.Bloodthirst:ID()
            return "bloodthirst precombat 10"
        end end
end
;
local function M()
    if m() and v.Recklessness:IsCastable() and (D > 1 or d.FightRemains() < 12) then if l(v.Recklessness, nil) then
            A = v.Recklessness:ID()
            return "recklessness multi_target 2"
        end end
    ;
    if m() and v.OdynsFury:IsCastable() and D > 1 and v.TitanicRage:IsAvailable() and (g:BuffDown(v.MeatCleaverBuff) or g:BuffUp(v.AvatarBuff) or g:BuffUp(v.RecklessnessBuff)) then if l(v.OdynsFury, nil, nil, not h:IsInMeleeRange(12)) then
            A = v.OdynsFury:ID()
            return "odyns_fury multi_target 4"
        end end
    ;
    if v.Whirlwind:IsCastable() and D > 1 and v.ImprovedWhilwind:IsAvailable() and g:BuffDown(v.MeatCleaverBuff) then if l(v.Whirlwind, nil, nil, not h:IsInMeleeRange(8)) then
            A = v.Whirlwind:ID()
            return "whirlwind multi_target 6"
        end end
    ;
    if v.Execute:IsReady() and g:BuffUp(v.AshenJuggernautBuff) and g:BuffRemains(v.AshenJuggernautBuff) < g:GCD() then if l(v.Execute, nil, nil, not E) then A =
            v.Execute:ID() "execute multi_target 8" end end
    ;
    if m() and v.ThunderousRoar:IsCastable() and y then if l(v.ThunderousRoar, nil, nil, not h:IsInMeleeRange(12)) then
            A = v.ThunderousRoar.ID()
            return "thunderous_roar multi_target 10"
        end end
    ;
    if m() and v.OdynsFury:IsCastable() and D > 1 and y then if l(v.OdynsFury, nil, nil, not h:IsInMeleeRange(12)) then
            A = v.OdynsFury:ID()
            return "odyns_fury multi_target 12"
        end end
    ;
    if v.CrushingBlow:IsCastable() and v.WrathandFury:IsAvailable() and y then if l(v.CrushingBlow, nil, nil, not E) then
            A = v.CrushingBlow:ID()
            return "crushing_blow multi_target 14"
        end end
    ;
    if v.Execute:IsReady() and y then if l(v.Execute, nil, nil, not E) then
            A = 280735;
            return "execute multi_target 16"
        end end
    ;
    if m() and v.OdynsFury:IsCastable() and y then if l(v.OdynsFury, nil, nil, not h:IsInMeleeRange(12)) then
            A = v.OdynsFury:ID()
            return "odyns_fury multi_target 18"
        end end
    ;
    if v.Rampage:IsReady() and (g:BuffUp(v.RecklessnessBuff) or g:BuffRemains(v.EnrageBuff) < g:GCD() or g:Rage() > 110 and v.OverwhelmingRage:IsAvailable() or g:Rage() > 80 and not v.OverwhelmingRage:IsAvailable()) then if l(v.Rampage, nil, nil, not E) then
            A = v.Rampage:ID()
            return "rampage multi_target 20"
        end end
    ;
    if v.Execute:IsReady() then if l(v.Execute, nil, nil, not E) then
            A = 280735;
            return "execute multi_target 22"
        end end
    ;
    if v.Bloodbath:IsCastable() and y and v.RecklessAbandon:IsAvailable() and not v.WrathandFury:IsAvailable() then if l(v.Bloodbath, nil, nil, not E) then A =
            v.Bloodbath:ID() "bloodbath multi_target 24" end end
    ;
    if v.Bloodthirst:IsCastable() and (not y or v.Annihilator:IsAvailable() and g:BuffDown(v.RecklessnessBuff)) then if l(v.Bloodthirst, nil, nil, not E) then
            A = v.Bloodthirst:ID()
            return "bloodthirst multi_target 26"
        end end
    ;
    if v.Onslaught:IsReady() and (not v.Annihilator:IsAvailable() and y or v.Tenderize:IsAvailable()) then if l(v.Onslaught, nil, nil, not E) then
            A = v.Onslaught:ID()
            return "onslaught multi_target 28"
        end end
    ;
    if v.RagingBlow:IsCastable() and v.RagingBlow:Charges() > 1 and v.WrathandFury:IsAvailable() then if l(v.RagingBlow, nil, nil, not E) then
            A = v.RagingBlow:ID()
            return "raging_blow multi_target 30"
        end end
    ;
    if v.CrushingBlow:IsCastable() and v.CrushingBlow:Charges() > 1 and v.WrathandFury:IsAvailable() then if l(v.CrushingBlow, nil, nil, not E) then
            A = v.CrushingBlow:ID()
            return "crushing_blow multi_target 32"
        end end
    ;
    if v.Bloodbath:IsCastable() and (not y or not v.WrathandFury:IsAvailable()) then if l(v.Bloodbath, nil, nil, not E) then A =
            v.Bloodbath:ID() "bloodbath multi_target 34" end end
    ;
    if v.CrushingBlow:IsCastable() and y and v.RecklessAbandon:IsAvailable() then if l(v.CrushingBlow, nil, nil, not E) then
            A = v.CrushingBlow:ID()
            return "crushing_blow multi_target 36"
        end end
    ;
    if v.Bloodthirst:IsCastable() and not v.WrathandFury:IsAvailable() then if l(v.Bloodthirst, nil, nil, not E) then
            A = v.Bloodthirst:ID()
            return "bloodthirst multi_target 38"
        end end
    ;
    if v.RagingBlow:IsCastable() and v.RagingBlow:Charges() > 1 then if l(v.RagingBlow, nil, nil, not E) then
            A = v.RagingBlow:ID()
            return "raging_blow multi_target 40"
        end end
    ;
    if v.Rampage:IsReady() then if l(v.Rampage, nil, nil, not E) then
            A = v.Rampage:ID()
            return "rampage multi_target 42"
        end end
    ;
    if v.Slam:IsReady() and v.Annihilator:IsAvailable() then if l(v.Slam, nil, nil, not E) then
            A = v.Slam:ID()
            return "slam multi_target 44"
        end end
    ;
    if v.Bloodbath:IsCastable() then if l(v.Bloodbath, nil, nil, not E) then A = v.Bloodbath:ID() "bloodbath multi_target 46" end end
    ;
    if v.RagingBlow:IsCastable() then if l(v.RagingBlow, nil, nil, not E) then
            A = v.RagingBlow:ID()
            return "raging_blow multi_target 48"
        end end
    ;
    if v.CrushingBlow:IsCastable() then if l(v.CrushingBlow, nil, nil, not E) then
            A = v.CrushingBlow:ID()
            return "crushing_blow multi_target 50"
        end end
    ;
    if v.Whirlwind:IsCastable() then if l(v.Whirlwind, nil, nil, not h:IsInMeleeRange(8)) then
            A = v.Whirlwind:ID()
            return "whirlwind multi_target 52"
        end end
end
;
local function N()
    if v.Whirlwind:IsCastable() and D > 1 and v.ImprovedWhilwind:IsAvailable() and g:BuffDown(v.MeatCleaverBuff) then if l(v.Whirlwind, nil, nil, not h:IsInMeleeRange(8)) then
            A = v.Whirlwind:ID()
            return "whirlwind single_target 2"
        end end
    ;
    if v.Execute:IsReady() and g:BuffUp(v.AshenJuggernautBuff) and g:BuffRemains(v.AshenJuggernautBuff) < g:GCD() then if l(v.Execute, nil, nil, not E) then
            A = v.Execute:ID()
            return "execute single_target 4"
        end end
    ;
    if m() and v.ThunderousRoar:IsCastable() and y then if l(v.ThunderousRoar, nil, nil, not h:IsInMeleeRange(12)) then
            A = v.ThunderousRoar:ID()
            return "thunderous_roar single_target 6"
        end end
    ;
    if m() and v.OdynsFury:IsCastable() and y and (v.DancingBlades:IsAvailable() and g:BuffRemains(v.DancingBladesBuff) < 5 or not v.DancingBlades:IsAvailable()) then if l(v.OdynsFury, nil, nil, not h:IsInMeleeRange(12)) then
            A = v.OdynsFury:ID()
            return "odyns_fury single_target 8"
        end end
    ;
    if v.Rampage:IsReady() and v.AngerManagement:IsAvailable() and (g:BuffUp(v.RecklessnessBuff) or g:BuffRemains(v.EnrageBuff) < g:GCD() or g:RagePercentage() > 85) then if l(v.Rampage, nil, nil, not E) then
            A = v.Rampage:ID()
            return "rampage single_target 10"
        end end
    ;
    if v.Execute:IsReady() and y then if l(v.Execute, nil, nil, not E) then
            A = v.Execute:ID()
            return "execute single_target 12"
        end end
    ;
    if v.Onslaught:IsReady() and (y or v.Tenderize:IsAvailable()) then if l(v.Onslaught, nil, nil, not E) then
            A = v.Onslaught:ID()
            return "onslaught single_target 14"
        end end
    ;
    if v.CrushingBlow:IsCastable() and v.WrathandFury:IsAvailable() and y then if l(v.CrushingBlow, nil, nil, not E) then
            A = v.CrushingBlow:ID()
            return "crushing_blow single_target 16"
        end end
    ;
    if v.Rampage:IsReady() and v.RecklessAbandon:IsAvailable() and (g:BuffUp(v.RecklessnessBuff) or g:BuffRemains(v.EnrageBuff) < g:GCD() or g:RagePercentage() > 85) then if l(v.Rampage, nil, nil, not E) then
            A = v.Rampage:ID()
            return "rampage single_target 18"
        end end
    ;
    if v.Rampage:IsReady() and v.AngerManagement:IsAvailable() then if l(v.Rampage, nil, nil, not E) then
            A = v.Rampage:ID()
            return "rampage single_target 20"
        end end
    ;
    if v.Execute:IsReady() then if l(v.Execute, nil, nil, not E) then A = v.Execute:ID() "execute single_target 22" end end
    ;
    if v.Bloodbath:IsCastable() and y and v.RecklessAbandon:IsAvailable() and not v.WrathandFury:IsAvailable() then if l(v.Bloodbath, nil, nil, not E) then
            A = v.Bloodbath:ID()
            return "bloodbath single_target 24"
        end end
    ;
    if v.Bloodthirst:IsCastable() and (not y or v.Annihilator:IsAvailable() and g:BuffDown(v.RecklessnessBuff)) then if l(v.Bloodthirst, nil, nil, not E) then
            A = v.Bloodthirst:ID()
            return "bloodthirst single_target 26"
        end end
    ;
    if v.RagingBlow:IsCastable() and v.RagingBlow:Charges() > 1 and v.WrathandFury:IsAvailable() then if l(v.RagingBlow, nil, nil, not E) then
            A = v.RagingBlow:ID()
            return "raging_blow single_target 28"
        end end
    ;
    if v.CrushingBlow:IsCastable() and v.CrushingBlow:Charges() > 1 and v.WrathandFury:IsAvailable() then if l(v.CrushingBlow, nil, nil, not E) then
            A = v.CrushingBlow:ID()
            return "crushing_blow single_target 30"
        end end
    ;
    if v.Bloodbath:IsCastable() and (not y or not v.WrathandFury:IsAvailable()) then if l(v.Bloodbath, nil, nil, not E) then A =
            v.Bloodbath:ID() "bloodbath single_target 32" end end
    ;
    if v.CrushingBlow:IsCastable() and y and v.RecklessAbandon:IsAvailable() then if l(v.CrushingBlow, nil, nil, not E) then
            A = v.CrushingBlow:ID()
            return "crushing_blow single_target 34"
        end end
    ;
    if v.Bloodthirst:IsCastable() and not v.WrathandFury:IsAvailable() then if l(v.Bloodthirst, nil, nil, not E) then
            A = v.Bloodthirst:ID()
            return "bloodthirst single_target 36"
        end end
    ;
    if v.RagingBlow:IsCastable() and v.RagingBlow:Charges() > 1 then if l(v.RagingBlow, nil, nil, not E) then
            A = v.RagingBlow:ID()
            return "raging_blow single_target 38"
        end end
    ;
    if v.Rampage:IsReady() then if l(v.Rampage, nil, nil, not E) then
            A = v.Rampage:ID()
            return "rampage single_target 40"
        end end
    ;
    if v.Slam:IsReady() and v.Annihilator:IsAvailable() then if l(v.Slam, nil, nil, not E) then
            A = v.Slam:ID()
            return "slam single_target 42"
        end end
    ;
    if v.Bloodbath:IsCastable() then if l(v.Bloodbath, nil, nil, not E) then A = v.Bloodbath:ID() "bloodbath single_target 44" end end
    ;
    if v.RagingBlow:IsCastable() then if l(v.RagingBlow, nil, nil, not E) then
            A = v.RagingBlow:ID()
            return "raging_blow single_target 46"
        end end
    ;
    if v.CrushingBlow:IsCastable() then if l(v.CrushingBlow, nil, nil, not E) then
            A = v.CrushingBlow:ID()
            return "crushing_blow single_target 48"
        end end
    ;
    if v.Bloodthirst:IsCastable() then if l(v.Bloodthirst, nil, nil, not E) then
            A = v.Bloodthirst:ID()
            return "bloodthirst single_target 50"
        end end
    ;
    if n() and v.Whirlwind:IsCastable() then if l(v.Whirlwind, nil, nil, not h:IsInMeleeRange(8)) then
            A = v.Whirlwind:ID()
            return "whirlwind single_target 52"
        end end
    ;
    if v.WreckingThrow:IsCastable() then if l(v.WreckingThrow, nil, nil, not h:IsInRange(30)) then
            A = v.WreckingThrow:ID()
            return "wrecking_throw single_target 54"
        end end
    ;
    if v.StormBolt:IsCastable() then if l(v.StormBolt, nil, nil, not E) then
            A = v.StormBolt:ID()
            return "storm_bolt single_target 56"
        end end
end
;
local function O()
end
;
local function P()
    q = HeroRotationCharDB.Toggles[6]
    o = HeroRotationCharDB.Toggles[4]
    p = HeroRotationCharDB.Toggles[5]
    s = HeroRotationCharDB.Toggles[12]
    r = HeroRotationCharDB.Toggles[15]
    if G.Commons.Enabled.TopTrinket then t = GetInventoryItemID("player", 13) else t = 1 end
    ;
    if G.Commons.Enabled.BottomTrinket then u = GetInventoryItemID("player", 14) else u = 1 end
end
;
local function Q()
    if not BotOn then
        z = 0;
        A = 0
    end
    ;
    if n() then
        B = g:GetEnemiesInMeleeRange(8)
        D = #B
    else D = 1 end
    ;
    y = g:BuffUp(v.EnrageBuff)
    E = h:IsInMeleeRange(5)
    local R = g:AffectingCombat() and 180 or 900;
    local S;
    if i(6673):IsAvailable() then
        S = g:BuffRemains(i(6673))
        if S < R then if l(v.BattleShout, nil) then
                A = v.BattleShout:ID()
                return "battle_shout refresh"
            end end
        ;
        if G.Fury.UseDefensives and g:AffectingCombat() then
            if v.EnragedRegeneration:IsReady() and g:HealthPercentage() < G.Fury.EnragedRegneration then if k.Cast(v.EnragedRegeneration, nil, nil, nil) then
                    A = 184364;
                    return "Enraged Regeneration 100"
                end end
            ;
            if v.RallyingCry:IsReady() and g:HealthPercentage() < G.Fury.RallyingCry then if k.Cast(v.RallyingCry, nil, nil, nil) then
                    A = 97462;
                    return "RallyingCry 100"
                end end
        end
    end
    ;
    if F.TargetIsValid() then
        if v.BattleShout:IsCastable() and (g:BuffDown(v.BattleShoutBuff, true) or F.GroupBuffMissing(v.BattleShoutBuff)) then if l(v.BattleShout, nil) then
                A = v.BattleShout:ID()
                return "battle_shout precombat"
            end end
        ;
        if not g:AffectingCombat() then
            local T = L()
            if T then return T end
        end
        ;
        if v.Charge:IsCastable() then if l(v.Charge, nil, nil, not h:IsSpellInRange(v.Charge)) then
                A = v.Charge:ID()
                return "charge main 2"
            end end
        ;
        if m() and G.Commons.Enabled.Potions then
            local U = F.PotionSelected()
            if U and U:IsReady() then if l(U, nil, G.Commons.DisplayStyle.Potions) then return "potion main 6" end end
        end
        ;
        local T = F.Interrupt(5, v.Pummel, G.Commons.OffGCDasOffGCD.Pummel, H)
        if T then return T end
        ;
        if g:HealthPercentage() < G.Commons.VictoryRushHP then
            if v.VictoryRush:IsReady() then if l(v.VictoryRush, nil, nil, not E) then
                    A = v.VictoryRush:ID()
                    return "victory_rush heal"
                end end
            ;
            if v.ImpendingVictory:IsReady() then if l(v.ImpendingVictory, nil, nil, not E) then
                    A = v.ImpendingVictory:ID()
                    return "impending_victory heal"
                end end
        end
        ;
        if m() then
            local V = g:GetUseableTrinkets(x)
            if V then if l(V, nil, nil) then if V:ID() == GetInventoryItemID("player", 13) and G.Commons.Enabled.TopTrinket then
                        A = 30;
                        return "top trinket 1"
                    elseif V:ID() == GetInventoryItemID("player", 14) and G.Commons.Enabled.BottomTrinket then
                        A = 40;
                        return "Bot trinket 1"
                    end end end
            ;
            if v.BloodFury:IsCastable() then if l(v.BloodFury, nil) then
                    A = v.BloodFury:ID()
                    return "blood_fury main 12"
                end end
            ;
            if v.Berserking:IsCastable() and g:BuffUp(v.RecklessnessBuff) then if l(v.Berserking, nil) then
                    A = v.Berserking:ID()
                    return "berserking main 14"
                end end
            ;
            if v.LightsJudgment:IsCastable() and g:BuffDown(v.RecklessnessBuff) then if l(v.LightsJudgment, nil, nil, not h:IsSpellInRange(v.LightsJudgment)) then return
                    "lights_judgment main 16" end end
            ;
            if v.Fireblood:IsCastable() then if l(v.Fireblood, nil) then
                    A = v.Fireblood:ID()
                    return "fireblood main 18"
                end end
            ;
            if v.AncestralCall:IsCastable() then if l(v.AncestralCall, nil) then
                    A = v.AncestralCall:ID()
                    return "ancestral_call main 20"
                end end
            ;
            if v.Avatar:IsCastable() and (v.TitansTorment:IsAvailable() and y or not v.TitansTorment:IsAvailable() and (g:BuffUp(v.RecklessnessBuff) or d.FightRemains() < 20)) then if l(v.Avatar, nil) then
                    A = v.Avatar:ID()
                    return "avatar main 24"
                end end
            ;
            if v.Recklessness:IsCastable() and (v.Annihilator:IsAvailable() and v.Avatar:CooldownRemains() < 1 or v.Avatar:CooldownRemains() > 40 or not v.Avatar:IsAvailable() or d.FightRemains() < 12) then if l(v.Recklessness, nil) then
                    A = v.Recklessness:ID()
                    return "recklessness main 26"
                end end
            ;
            if v.Recklessness:IsCastable() and (not v.Annihilator:IsAvailable() or d.FightRemains() < 12) then if l(v.Recklessness, nil) then
                    A = v.Recklessness:ID()
                    return "recklessness main 28"
                end end
            ;
            if v.SpearofBastion:IsCastable() and (y and (g:BuffUp(v.RecklessnessBuff) or g:BuffUp(v.AvatarBuff) or d.FightRemains() < 20 or D > 1)) then if l(v.SpearofBastion, nil, nil, not h:IsInRange(25)) then
                    A = v.SpearofBastion:ID()
                    return "spear_of_bastion main 30"
                end end
            ;
            if v.Ravager:IsCastable() and (v.Avatar:CooldownRemains() < 3 or g:BuffUp(v.RecklessnessBuff) or d.FightRemains() < 10) then if l(v.Ravager, nil, nil, not E) then
                    A = v.Ravager:ID()
                    return "ravager main 10"
                end end
        end
        ;
        if n() and D > 2 then
            local T = M()
            if T then return T end
        end
        ;
        local T = N()
        if T then return T end
        ;
        if k.CastAnnotated(v.Pool, false, "WAIT") then return "Wait/Pool Resources" end
    end
end
;
function ReturnSpell() if A == 0 then return 0 else return A end end

;
function ReturnSpellMO() if z == 0 then return 0 else return z end end

;
local function W()
end
;
k.SetAPL(72, Q, W)
