local a, b = ...
local c = HeroDBC.DBC
local d = HeroLib
local e = HeroCache
local f = d.Unit
local g = f.Player
local h = f.Target
local i = f.Pet
local j = d.Spell
local k = d.MultiSpell
local l = d.Item
local m = HeroRotation
local n = m.Cast
local o = m.CDsON
local p = m.AoEON
local q = HeroRotationCharDB.Toggles[4]
local r = HeroRotationCharDB.Toggles[5]
local s = not HeroRotationCharDB.Toggles[15]
local t = HeroRotationCharDB.Toggles[12]
local u = HeroRotationCharDB.Toggles[60]
local v = HeroRotationCharDB.Toggles[120]
local w = HeroRotationCharDB.Toggles[121]
local x = HeroRotationCharDB.Toggles[122]
local y = HeroRotationCharDB.Toggles[123]
local z = HeroRotationCharDB.Toggles[124]
local A = HeroRotationCharDB.Toggles[171]
local B = HeroRotationCharDB.Toggles[142]
local C = HeroRotationCharDB.Toggles[17]
local D = m.Commons.Everyone.num
local E = m.Commons.Everyone.bool
local GetTime = GetTime
local F = m.Commons.Hunter
local G = j.Hunter.Marksmanship
local H = l.Hunter.Marksmanship
local I = {G.SummonPet, G.SummonPet2, G.SummonPet3, G.SummonPet4, G.SummonPet5}
local J = {}
local K = g:GetEquipment()
local L = K[13] and l(K[13]) or l(0)
local M = K[14] and l(K[14]) or l(0)
local N, O = GetInventoryItemID("player", 13)
local P, O = GetInventoryItemID("player", 14)
if K[13] then
    L = l(K[13])
end
if K[14] then
    M = l(K[14])
end
local Q = L:IsEquippedAndReady() or L:CooldownRemains() > 0
local R = M:IsEquippedAndReady() or M:CooldownRemains() > 0
local S = {LastCast = 0, Count = 0}
local T
local U = 11111
local V = 11111
local W = 0
local X = 0
local Y
local Z
local _
local a0
local a1 = m.Commons.Everyone
local a2 = {
    General = m.GUISettings.General,
    Commons = m.GUISettings.APL.Hunter.Commons,
    Marksmanship = m.GUISettings.APL.Hunter.Marksmanship
}
local a3 = h:HealthPercentage() > 70 and G.CarefulAim:IsAvailable()
local a4 = {{G.Intimidation, "Cast Intimidation (Interrupt)", function()
            return true
        end}}
d:RegisterForEvent(
    function()
        K = g:GetEquipment()
        L = K[13] and l(K[13]) or l(0)
        M = K[14] and l(K[14]) or l(0)
    end,
    "PLAYER_EQUIPMENT_CHANGED"
)
d:RegisterForEvent(
    function()
        S = {LastCast = 0, Count = 0}
        U = 11111
        V = 11111
    end,
    "PLAYER_REGEN_ENABLED"
)
d:RegisterForEvent(
    function()
        G.SerpentSting:RegisterInFlight()
        G.SteadyShot:RegisterInFlight()
        G.AimedShot:RegisterInFlight()
    end,
    "LEARNED_SPELL_IN_TAB"
)
G.SerpentSting:RegisterInFlight()
G.SteadyShot:RegisterInFlight()
G.AimedShot:RegisterInFlight()
local function a5()
    return g:BuffUp(G.TrickShotsBuff) and not g:IsCasting(G.AimedShot) and not g:IsChanneling(G.RapidFire) or
        g:BuffUp(G.VolleyBuff)
end
local function a6()
    if (S.Count == 0 or S.Count == 1) and g:IsCasting(G.SteadyShot) and S.LastCast < GetTime() - G.SteadyShot:CastTime() then
        S.LastCast = GetTime()
        S.Count = S.Count + 1
    end
    if not (g:IsCasting(G.SteadyShot) or g:PrevGCDP(1, G.SteadyShot)) then
        S.Count = 0
    end
    if G.SteadyFocusBuff.LastAppliedOnPlayerTime > S.LastCast then
        S.Count = 0
    end
end
local function a7(a8)
    return a8:DebuffRemains(G.SerpentStingDebuff)
end
local function a9(a8)
    return a8:DebuffRemains(G.SerpentStingDebuff) + D(G.SerpentSting:InFlight()) * 99
end
local function aa(a8)
    return a8:DebuffStack(G.LatentPoisonDebuff)
end
local function ab(a8)
    if
        a8:DebuffRefreshable(G.SerpentStingDebuff) and not G.SerpentstalkersTrickery:IsAvailable() and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == f("mouseover"):GUID() and
            a2.Marksmanship.TargetSwap == "Mouseover"
     then
        X = 1271788
        return true
    elseif
        a8:DebuffRefreshable(G.SerpentStingDebuff) and not G.SerpentstalkersTrickery:IsAvailable() and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a2.Marksmanship.TargetSwap == "AutoSwap" and
            a8:GUID() ~= h:GUID() and
            not t
     then
        X = 999
        return true
    elseif
        a8:DebuffRefreshable(G.SerpentStingDebuff) and not G.SerpentstalkersTrickery:IsAvailable() and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == h:GUID()
     then
        W = 271788
        return true
    elseif a8:DebuffRefreshable(G.SerpentStingDebuff) and not G.SerpentstalkersTrickery:IsAvailable() then
        return true
    end
end
local function ac(a8)
    if
        a8:DebuffRefreshable(G.SerpentStingDebuff) and G.HydrasBite:IsAvailable() and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == f("mouseover"):GUID() and
            a2.Marksmanship.TargetSwap == "Mouseover"
     then
        X = 1271788
        return true
    elseif
        a8:DebuffRefreshable(G.SerpentStingDebuff) and G.HydrasBite:IsAvailable() and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a2.Marksmanship.TargetSwap == "AutoSwap" and
            a8:GUID() ~= h:GUID() and
            not t
     then
        X = 999
        return true
    elseif
        a8:DebuffRefreshable(G.SerpentStingDebuff) and G.HydrasBite:IsAvailable() and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == h:GUID()
     then
        W = 271788
        return true
    elseif a8:DebuffRefreshable(G.SerpentStingDebuff) and G.HydrasBite:IsAvailable() then
        return true
    end
end
local function ad(a8)
    if
        a8:DebuffRefreshable(G.SerpentStingDebuff) and G.PoisonInjection:IsAvailable() and
            not G.SerpentstalkersTrickery:IsAvailable() and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == f("mouseover"):GUID() and
            a2.Marksmanship.TargetSwap == "Mouseover"
     then
        X = 1271788
        return true
    elseif
        a8:DebuffRefreshable(G.SerpentStingDebuff) and G.PoisonInjection:IsAvailable() and
            not G.SerpentstalkersTrickery:IsAvailable() and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a2.Marksmanship.TargetSwap == "AutoSwap" and
            a8:GUID() ~= h:GUID() and
            not t
     then
        X = 999
        return true
    elseif
        a8:DebuffRefreshable(G.SerpentStingDebuff) and G.PoisonInjection:IsAvailable() and
            not G.SerpentstalkersTrickery:IsAvailable() and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == h:GUID()
     then
        W = 271788
        return true
    elseif
        a8:DebuffRefreshable(G.SerpentStingDebuff) and G.PoisonInjection:IsAvailable() and
            not G.SerpentstalkersTrickery:IsAvailable()
     then
        return true
    end
end
local function ae(a8)
    if
        G.SerpentstalkersTrickery:IsAvailable() and
            (g:BuffDown(G.PreciseShotsBuff) or
                (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
                    (not G.ChimaeraShot:IsAvailable() or _ < 2) or
                g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and _ > 1) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == f("mouseover"):GUID() and
            a2.Marksmanship.TargetSwap == "Mouseover"
     then
        X = 119434
        return true
    elseif
        G.SerpentstalkersTrickery:IsAvailable() and
            (g:BuffDown(G.PreciseShotsBuff) or
                (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
                    (not G.ChimaeraShot:IsAvailable() or _ < 2) or
                g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and _ > 1) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a2.Marksmanship.TargetSwap == "AutoSwap" and
            a8:GUID() ~= h:GUID() and
            not t
     then
        X = 999
        return true
    elseif
        G.SerpentstalkersTrickery:IsAvailable() and
            (g:BuffDown(G.PreciseShotsBuff) or
                (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
                    (not G.ChimaeraShot:IsAvailable() or _ < 2) or
                g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and _ > 1) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == h:GUID()
     then
        W = 19434
        return true
    elseif
        G.SerpentstalkersTrickery:IsAvailable() and
            (g:BuffDown(G.PreciseShotsBuff) or
                (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
                    (not G.ChimaeraShot:IsAvailable() or _ < 2) or
                g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and _ > 1)
     then
        return true
    end
end
local function af(a8)
    if
        (g:BuffDown(G.PreciseShotsBuff) or
            (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
                (not G.ChimaeraShot:IsAvailable() or _ < 2) or
            g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and _ > 1) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == f("mouseover"):GUID() and
            a2.Marksmanship.TargetSwap == "Mouseover"
     then
        X = 119434
        return true
    elseif
        (g:BuffDown(G.PreciseShotsBuff) or
            (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
                (not G.ChimaeraShot:IsAvailable() or _ < 2) or
            g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and _ > 1) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a2.Marksmanship.TargetSwap == "AutoSwap" and
            a8:GUID() ~= h:GUID() and
            not t
     then
        X = 999
        return true
    elseif
        (g:BuffDown(G.PreciseShotsBuff) or
            (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
                (not G.ChimaeraShot:IsAvailable() or _ < 2) or
            g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and _ > 1) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == h:GUID()
     then
        W = 19434
        return true
    elseif
        g:BuffDown(G.PreciseShotsBuff) or
            (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
                (not G.ChimaeraShot:IsAvailable() or _ < 2) or
            g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and _ > 1
     then
        return true
    end
end
local function ag(a8)
    if
        G.SerpentstalkersTrickery:IsAvailable() and
            (g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
                (g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
                    G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD())) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == f("mouseover"):GUID() and
            a2.Marksmanship.TargetSwap == "Mouseover"
     then
        X = 119434
        return true
    elseif
        G.SerpentstalkersTrickery:IsAvailable() and
            (g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
                (g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
                    G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD())) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a2.Marksmanship.TargetSwap == "AutoSwap" and
            a8:GUID() ~= h:GUID() and
            not t
     then
        X = 999
        return true
    elseif
        G.SerpentstalkersTrickery:IsAvailable() and
            (g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
                (g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
                    G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD())) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == h:GUID()
     then
        W = 19434
        return true
    elseif
        G.SerpentstalkersTrickery:IsAvailable() and
            (g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
                (g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
                    G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD()))
     then
        return true
    end
end
local function ah(a8)
    if
        g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
            (g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
                G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD()) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == f("mouseover"):GUID() and
            a2.Marksmanship.TargetSwap == "Mouseover"
     then
        X = 119434
        return true
    elseif
        g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
            (g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
                G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD()) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a2.Marksmanship.TargetSwap == "AutoSwap" and
            a8:GUID() ~= h:GUID() and
            not t
     then
        X = 999
        return true
    elseif
        g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
            (g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
                G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD()) and
            (a8:AffectingCombat() or a8:IsDummy() or a8:NPCID() == 153285) and
            a8:GUID() == h:GUID()
     then
        W = 19434
        return true
    elseif
        g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
            (g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
                G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD())
     then
        return true
    end
end
local function ai()
    if G.Salvo:IsCastable() then
        if n(G.Salvo, nil) then
            W = 400456
            return "salvo precombat 3"
        end
    end
    if G.AimedShot:IsReady() and not g:IsCasting(G.AimedShot) and (_ < 3 and (not G.Volley:IsAvailable() or _ < 2)) then
        if n(G.AimedShot, nil, nil, not a0) then
            W = 19434
            return "aimed_shot precombat 6"
        end
    end
    if G.WailingArrow:IsReady() and not g:IsCasting(G.WailingArrow) and (_ > 2 or not G.SteadyFocus:IsAvailable()) then
        if n(G.WailingArrow, nil, nil, not a0) then
            W = 355589
            return "wailing_arrow precombat 8"
        end
    end
    if G.SteadyShot:IsCastable() and (_ > 2 or G.Volley:IsAvailable() and _ == 2) then
        if n(G.SteadyShot, nil, nil, not a0) then
            W = 56641
            return "steady_shot precombat 10"
        end
    end
end
local function aj()
    if G.Berserking:IsReady() and (g:BuffUp(G.TrueshotBuff) or V < 13) and a2.Commons.Enabled.Racials then
        if n(G.Berserking, nil) then
            W = 137096
            return "berserking cds 2"
        end
    end
    if
        G.BloodFury:IsReady() and (g:BuffUp(G.TrueshotBuff) or G.Trueshot:CooldownRemains() > 30 or V < 16) and
            a2.Commons.Enabled.Racials
     then
        if n(G.BloodFury, nil) then
            W = 20572
            return "blood_fury cds 4"
        end
    end
    if
        G.AncestralCall:IsReady() and (g:BuffUp(G.TrueshotBuff) or G.Trueshot:CooldownRemains() > 30 or V < 16) and
            a2.Commons.Enabled.Racials
     then
        if n(G.AncestralCall, nil) then
            W = 274738
            return "ancestral_call cds 6"
        end
    end
    if
        G.Fireblood:IsReady() and (g:BuffUp(G.TrueshotBuff) or G.Trueshot:CooldownRemains() > 30 or V < 9) and
            a2.Commons.Enabled.Racials
     then
        if n(G.Fireblood, nil) then
            W = 273104
            return "fireblood cds 8"
        end
    end
    if G.LightsJudgment:IsReady() and g:BuffDown(G.TrueshotBuff) and a2.Commons.Enabled.Racials then
        if n(G.LightsJudgment, nil, nil, not h:IsSpellInRange(G.LightsJudgment)) then
            W = 255647
            return "lights_judgment cds 10"
        end
    end
    if
        a2.Commons.Enabled.Potions and o() and s and
            (g:BuffUp(G.TrueshotBuff) and not m.GUISettings.General.HoldPotforBL or
                m.GUISettings.General.HoldPotforBL and g:BloodlustUp())
     then
        local ak = a1.PotionSelected()
        if ak and ak:IsReady() then
            if n(ak, nil, nil) then
                W = 12
                return "potion cds 12"
            end
        end
    end
    if G.Salvo:IsCastable() and (_ > 2 or G.Volley:CooldownRemains() < 10) then
        if n(G.Salvo, nil) then
            W = 400456
            return "salvo cds 14"
        end
    end
end
local function al()
    if
        G.SteadyShot:IsCastable() and
            (G.SteadyFocus:IsAvailable() and
                (S.Count == 1 and g:BuffRemains(G.SteadyFocusBuff) < 5 or
                    g:BuffDown(G.SteadyFocusBuff) and g:BuffDown(G.TrueshotBuff) and S.Count ~= 2))
     then
        if n(G.SteadyShot, nil, nil, not a0) then
            W = 56641
            return "steady_shot st 2"
        end
    end
    if
        G.AimedShot:IsReady() and
            (g:BuffUp(G.TrueshotBuff) and G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime() and
                G.LegacyoftheWindrunners:IsAvailable() and
                G.WindrunnersGuidance:IsAvailable())
     then
        if n(G.AimedShot, nil, nil, not a0) then
            W = 19434
            return "aimed_shot st 4"
        end
    end
    if G.KillShot:IsReady() and g:BuffDown(G.TrueshotBuff) then
        if n(G.KillShot, nil, nil, not a0) then
            W = 53351
            return "kill_shot st 6"
        end
    end
    if G.Volley:IsReady() and g:BuffUp(G.SalvoBuff) then
        if n(G.Volley, nil, nil, not a0) then
            W = 260243
            return "volley st 8"
        end
    end
    if G.SteelTrap:IsCastable() and g:BuffDown(G.TrueshotBuff) then
        if n(G.SteelTrap, nil, nil, not h:IsInRange(40)) then
            W = 162488
            return "steel_trap st 10"
        end
    end
    if G.SerpentSting:IsReady() and g:BuffDown(G.TrueshotBuff) then
        if a1.CastTargetIf(G.SerpentSting, Y, "min", a7, ab, not a0) then
            return "serpent_sting st 12"
        end
    end
    if G.ExplosiveShot:IsReady() then
        if n(G.ExplosiveShot, nilt, nil, not a0) then
            W = 212431
            return "explosive_shot st 14"
        end
    end
    if G.Stampede:IsCastable() then
        if n(G.Stampede, nil, nil, not h:IsInRange(30)) then
            W = 201430
            return "stampede st 16"
        end
    end
    if G.DeathChakram:IsReady() and q then
        if n(G.DeathChakram, nil, nil, not a0) then
            W = 325028
            return "dark_chakram st 18"
        end
    end
    if G.WailingArrow:IsReady() and _ > 1 then
        if n(G.WailingArrow, nil, nil, not a0) then
            W = 355589
            return "wailing_arrow st 20"
        end
    end
    if G.RapidFire:IsCastable() and G.SurgingShots:IsAvailable() then
        if n(G.RapidFire, nil, nil, not a0) then
            W = 257044
            return "rapid_fire st 22"
        end
    end
    if G.KillShot:IsReady() then
        if n(G.KillShot, nil, nil, not a0) then
            W = 53351
            return "kill_shot st 24"
        end
    end
    if G.Trueshot:IsReady() and o() and (T and (g:BuffDown(G.TrueshotBuff) or g:BuffRemains(G.TrueshotBuff) < 5)) then
        if n(G.Trueshot, nil) then
            W = 288613
            return "trueshot st 26"
        end
    end
    if G.MultiShot:IsReady() and (g:BuffUp(G.SalvoBuff) and not G.Volley:IsAvailable()) then
        if n(G.MultiShot, nil, nil, not a0) then
            W = 257620
            return "multishot st 28"
        end
    end
    if G.AimedShot:IsReady() then
        if a1.CastTargetIf(G.AimedShot, Y, "min", a9, ae, not a0) then
            return "aimed_shot st 30"
        end
    end
    if G.AimedShot:IsReady() then
        if a1.CastTargetIf(G.AimedShot, Y, "max", aa, af, not a0) then
            return "aimed_shot st 32"
        end
    end
    if G.Volley:IsReady() then
        if n(G.Volley, nil) then
            W = 260243
            return "volley trickshots 36"
        end
    end
    if G.RapidFire:IsCastable() then
        if n(G.RapidFire, nil, nil, not a0) then
            W = 257044
            return "rapid_fire st 38"
        end
    end
    if G.WailingArrow:IsReady() and g:BuffDown(G.TrueshotBuff) then
        if n(G.WailingArrow, nil, nil, not a0) then
            W = 355589
            return "wailing_arrow st 40"
        end
    end
    if G.KillCommand:IsCastable() and g:BuffDown(G.TrueshotBuff) then
        if n(G.KillCommand, nil, nil, not h:IsInRange(50)) then
            W = 34026
            return "kill_command st 42"
        end
    end
    if
        G.ChimaeraShot:IsReady() and
            (g:BuffUp(G.PreciseShotsBuff) or g:FocusPredicted() > G.ChimaeraShot:Cost() + G.AimedShot:Cost())
     then
        if n(G.ChimaeraShot, nil, nil, not a0) then
            W = 342049
            return "chimaera_shot st 44"
        end
    end
    if
        G.ArcaneShot:IsReady() and
            (g:BuffUp(G.PreciseShotsBuff) or g:FocusPredicted() > G.ArcaneShot:Cost() + G.AimedShot:Cost())
     then
        if n(G.ArcaneShot, nil, nil, not a0) then
            W = 185358
            return "arcane_shot st 46"
        end
    end
    if G.BagofTricks:IsReady() then
        if n(G.BagofTricks, nil, nil, not h:IsSpellInRange(G.BagofTricks)) then
            W = 312411
            return "bag_of_tricks st 48"
        end
    end
    if G.SteadyShot:IsCastable() then
        if n(G.SteadyShot, nil, nil, not a0) then
            W = 56641
            return "steady_shot st 50"
        end
    end
end
local function am()
    if
        G.SteadyShot:IsCastable() and
            (G.SteadyFocus:IsAvailable() and S.Count == 1 and g:BuffRemains(G.SteadyFocusBuff) < 8)
     then
        if n(G.SteadyShot, nil, nil, not a0) then
            W = 56641
            return "steady_shot trickshots 2"
        end
    end
    if G.KillShot:IsReady() and g:BuffUp(G.RazorFragmentsBuff) then
        if n(G.KillShot, nil, nil, not a0) then
            W = 53351
            return "kill_shot trickshots 4"
        end
    end
    if G.ExplosiveShot:IsReady() then
        if n(G.ExplosiveShot, nil, nil, not a0) then
            W = 212431
            return "explosive_shot trickshots 8"
        end
    end
    if G.DeathChakram:IsReady() and q then
        if n(G.DeathChakram, nil, nil, not a0) then
            W = 325028
            return "death_chakram trickshots 10"
        end
    end
    if G.Stampede:IsReady() then
        if n(G.Stampede, nil, nil, not h:IsInRange(30)) then
            W = 201430
            return "stampede trickshots 12"
        end
    end
    if G.WailingArrow:IsReady() then
        if n(G.WailingArrow, nil, nil, not a0) then
            W = 355589
            return "wailing_arrow trickshots 14"
        end
    end
    if G.SerpentSting:IsReady() then
        if a1.CastTargetIf(G.SerpentSting, Y, "min", a7, ac, not a0) then
            return "serpent_sting trickshots 16"
        end
    end
    if G.Barrage:IsReady() and _ > 7 then
        if n(G.Barrage, nil, nil, not a0) then
            W = 120360
            return "barrage trickshots 18"
        end
    end
    if G.Volley:IsReady() then
        if n(G.Volley, nil) then
            W = 260243
            return "volley trickshots 20"
        end
    end
    if G.Trueshot:IsReady() and o() then
        if n(G.Trueshot, nil, nil, not a0) then
            W = 288613
            return "trueshot trickshots 22"
        end
    end
    if
        G.RapidFire:IsCastable() and
            (g:BuffRemains(G.TrickShotsBuff) >= G.RapidFire:ExecuteTime() and G.SurgingShots:IsAvailable())
     then
        if n(G.RapidFire, nil, nil, not a0) then
            W = 257044
            return "rapid_fire trickshots 24"
        end
    end
    if G.AimedShot:IsReady() then
        if a1.CastTargetIf(G.AimedShot, Y, "min", a9, ag, not a0) then
            return "aimed_shot trickshots 26"
        end
    end
    if G.AimedShot:IsReady() then
        if a1.CastTargetIf(G.AimedShot, Y, "max", aa, ah, not a0) then
            return "aimed_shot trickshots 28"
        end
    end
    if G.RapidFire:IsCastable() and g:BuffRemains(G.TrickShotsBuff) >= G.RapidFire:ExecuteTime() then
        if n(G.RapidFire, nil, nil, not a0) then
            W = 257044
            return "rapid_fire trickshots 30"
        end
    end
    if
        G.ChimaeraShot:IsReady() and
            (g:BuffUp(G.TrickShotsBuff) and g:BuffUp(G.PreciseShotsBuff) and
                g:FocusPredicted() > G.ChimaeraShot:Cost() + G.AimedShot:Cost() and
                _ < 4)
     then
        if n(G.ChimaeraShot, nil, nil, not a0) then
            W = 342049
            return "chimaera_shot trickshots 32"
        end
    end
    if
        G.MultiShot:IsReady() and
            (not a5() or
                (g:BuffUp(G.PreciseShotsBuff) or g:BuffStack(G.BulletstormBuff) == 10) and
                    g:FocusPredicted() > G.MultiShot:Cost() + G.AimedShot:Cost())
     then
        if n(G.MultiShot, nil, nil, not a0) then
            W = 257620
            return "multishot trickshots 34"
        end
    end
    if G.SerpentSting:IsReady() then
        if a1.CastTargetIf(G.SerpentSting, Y, "min", a7, ad, not a0) then
            return "serpent_sting trickshots 36"
        end
    end
    if G.SteelTrap:IsCastable() and g:BuffDown(G.TrueshotBuff) then
        if n(G.SteelTrap, nil, nil, not h:IsInRange(40)) then
            W = 312411
            return "steel_trap trickshots 38"
        end
    end
    if G.KillShot:IsReady() and g:FocusPredicted() > G.KillShot:Cost() + G.AimedShot:Cost() then
        if n(G.KillShot, nil, nil, not a0) then
            W = 53351
            return "kill_shot trickshots 40"
        end
    end
    if G.MultiShot:IsReady() and g:FocusPredicted() > G.MultiShot:Cost() + G.AimedShot:Cost() then
        if n(G.MultiShot, nil, nil, not a0) then
            W = 257620
            return "multishot trickshots 42"
        end
    end
    if G.BagofTricks:IsReady() and g:BuffDown(G.Trueshot) then
        if n(G.BagofTricks, nil, nil, not h:IsSpellInRange(G.BagofTricks)) then
            W = 312411
            return "bag_of_tricks trickshots 44"
        end
    end
    if G.SteadyShot:IsCastable() then
        if n(G.SteadyShot, nil, nil, not a0) then
            W = 56641
            return "steady_shot trickshots 46"
        end
    end
end
local function an()
    local ao = g:GetUseableTrinkets(J, 13)
    if ao and (not ao:TrinketHasUseBuff() or g:BuffUp(G.TrueshotBuff)) then
        if n(ao, nil, nil) then
            W = 24
            return "trinket1 main 2"
        end
    end
    local ap = g:GetUseableTrinkets(J, 14)
    if ap and a2.Commons.Enabled.BottomTrinket and (not ap:TrinketHasUseBuff() or g:BuffUp(G.TrueshotBuff)) then
        if n(ap, nil, nil) then
            W = 25
            return "trinket2 main 4"
        end
    end
    if ao or ap then
        local aq = ao or ap
        if m.Cast(aq, nil, nil) then
            if aq:ID() == N and a2.Commons.Enabled.TopTrinket then
                W = 24
                return "Generic use_items for " .. aq:Name()
            elseif aq:ID() == P and a2.Commons.Enabled.BottomTrinket then
                W = 25
                return "Generic use_items for " .. aq:Name()
            end
        end
    end
end
local function ar()
    a0 = h:IsSpellInRange(G.AimedShot)
    Y = g:GetEnemiesInRange(G.AimedShot.MaximumRange)
    Z = h:GetEnemiesInSplashRange(10)
    if p() then
        _ = h:GetEnemiesInSplashRangeCount(10)
    else
        _ = 1
    end
    if a1.TargetIsValid() or g:AffectingCombat() then
        U = d.BossFightRemains(nil, true)
        V = U
        if V == 11111 then
            V = d.FightRemains(Z, false)
        end
    end
    local function as()
        r = HeroRotationCharDB.Toggles[5]
        q = HeroRotationCharDB.Toggles[4]
        t = HeroRotationCharDB.Toggles[12]
        s = not HeroRotationCharDB.Toggles[15]
        u = HeroRotationCharDB.Toggles[60]
        v = HeroRotationCharDB.Toggles[120]
        w = HeroRotationCharDB.Toggles[121]
        x = HeroRotationCharDB.Toggles[122]
        y = HeroRotationCharDB.Toggles[123]
        z = HeroRotationCharDB.Toggles[124]
        A = HeroRotationCharDB.Toggles[171]
        HoldMD = HeroRotationCharDB.Toggles[125]
        B = HeroRotationCharDB.Toggles[142]
        C = HeroRotationCharDB.Toggles[17]
        N = GetInventoryItemID("player", 13)
        P = GetInventoryItemID("player", 14)
        if not a2.Commons.Enabled.TopTrinket and not a2.Commons.Enabled.BotTrinket then
            J = {N, P}
        elseif not a2.Commons.Enabled.TopTrinket and a2.Commons.Enabled.BotTrinket then
            J = {N}
        elseif not a2.Commons.Enabled.BotTrinket and a2.Commons.Enabled.TopTrinket then
            J = {P}
        elseif not a2.Commons.Enabled.BotTrinket and not a2.Commons.Enabled.TopTrinket then
            J = {}
        end
    end
    local function ar()
        a0 = h:IsSpellInRange(G.AimedShot)
        Y = g:GetEnemiesInRange(G.AimedShot.MaximumRange)
        Z = h:GetEnemiesInSplashRange(10)
        if p() then
            _ = h:GetEnemiesInSplashRangeCount(10)
        else
            _ = 1
        end
        if u then
            _ = 10
        end
        if a1.TargetIsValid() or g:AffectingCombat() then
            U = d.BossFightRemains(nil, true)
            V = U
            if V == 11111 then
                V = d.FightRemains(Z, false)
            end
        end
        if not BotOn then
            X = 0
            W = 0
        end
        if X > 0 then
            X = 0
        end
        if W > 0 then
            W = 0
        end
        as()
        if m.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
            starttime = GetTime()
            endtime = starttime + m.GUISettings.General.OpenerReset
        elseif
            m.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and
                HeroRotationCharDB.Toggles[6]
         then
            HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
            m.ToggleIconFrame:UpdateButtonText(6)
            m.Print(
                "Opener is now " ..
                    (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r.")
            )
        end
        if g:BuffUp(j(5384)) then
            return false
        end
        if m.QueuedCast() then
            W = m.QueuedCast()
            return "Custom Queue " .. j(W):ID()
        end
        if v and G.Bindingshot:IsAvailable() and G.Bindingshot:CooldownRemains(BypassRecovery) <= 0 then
            if m.Cast(G.Bindingshot, nil, nil, nil) then
                W = 109248
                return "queue Binding Shot"
            end
        elseif (not G.Bindingshot:IsUsableP() or G.Bindingshot:CooldownRemains() > 0) and v then
            HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
            m.Print(
                "Binding Shot Queue is now " ..
                    (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r.")
            )
        end
        if w and G.FreezingTrap:IsAvailable() and G.FreezingTrap:CooldownRemains(BypassRecovery) <= 0 then
            if m.Cast(G.FreezingTrap, nil, nil, nil) then
                W = 187650
                return "queue Freezing Trap"
            end
        elseif (not G.FreezingTrap:IsUsableP() or G.FreezingTrap:CooldownRemains() > 0) and w then
            HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
            m.Print(
                "Freezing Trap Queue is now " ..
                    (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r.")
            )
        end
        if y and G.Flare:IsAvailable() and G.Flare:CooldownRemains(BypassRecovery) <= 0 then
            if m.Cast(G.Flare, nil, nil, nil) then
                W = 1543
                return "queue Flare"
            end
        elseif (not G.Flare:IsUsableP() or G.Flare:CooldownRemains() > 0) and y then
            HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123]
            m.Print(
                "Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r.")
            )
        end
        if z and G.TarTrap:IsAvailable() and G.TarTrap:CooldownRemains(BypassRecovery) <= 0 then
            if m.Cast(G.TarTrap, nil, nil, nil) then
                W = 187698
                return "queue TarTrap"
            end
        elseif (not G.TarTrap:IsUsableP() or G.TarTrap:CooldownRemains() > 0) and z then
            HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124]
            m.Print(
                "Tar Trap Queue is now " ..
                    (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r.")
            )
        end
        if A and G.DeathChakram:IsAvailable() and G.DeathChakram:CooldownRemains(BypassRecovery) <= 0 then
            if m.Cast(G.DeathChakram, nil, nil, nil) then
                W = 325028
                return "queue Death Chakram"
            end
        elseif (not G.DeathChakram:IsUsableP() or G.DeathChakram:CooldownRemains() > 0) and A then
            HeroRotationCharDB.Toggles[171] = not HeroRotationCharDB.Toggles[171]
            m.Print(
                "Death Chakram Queue is now " ..
                    (HeroRotationCharDB.Toggles[171] and "|cff00ff00on|r." or "|cffff0000off|r.")
            )
        end
        if G.Exhilaration:IsCastable() and g:HealthPercentage() <= a2.Commons.ExhilarationHP then
            if n(G.Exhilaration, nil) then
                W = 109304
                return "Exhilaration"
            end
        end
        if
            g:HealthPercentage() < a2.Commons.HealthstoneHP and H.Healthstone:IsReady() and
                H.Healthstone:CooldownRemains() <= 0
         then
            if m.Cast(H.Healthstone, nil) then
                W = 40
                return "Healthstone HP"
            end
        end
        if
            g:HealthPercentage() < a2.Commons.HealPotHP and H.CosmicHealPot:IsReady() and
                H.CosmicHealPot:CooldownRemains() <= 0
         then
            if m.Cast(H.CosmicHealPot, nil) then
                W = 45
                return "CosmicHealPot HP"
            end
        end
        if g:HealthPercentage() < a2.Commons.HealPotHP and H.HealPot:IsReady() and H.HealPot:CooldownRemains() <= 0 then
            if m.Cast(H.HealPot, nil) then
                W = 41
                return "HealPot HP"
            end
        end
        if G.AspectoftheTurtle:IsCastable() and g:HealthPercentage() <= a2.Commons.TurtleHP then
            if n(G.AspectoftheTurtle, nil) then
                W = 186265
                return "AspectoftheTurtle"
            end
        end
        if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
            if G.ArcaneShot:IsCastable() and f("mouseover"):IsInMeleeRange(8) then
                if n(G.ArcaneShot, nil) then
                    X = 1185358
                    return "explosive MO AS"
                end
            end
        end
        if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
            if G.ArcaneShot:IsCastable() and h:IsInMeleeRange(8) then
                if n(G.ArcaneShot, nil) then
                    W = 185358
                    return "explosive  SWD"
                end
            end
        end
        if a1.TargetIsValid() then
            a6()
            if not g:AffectingCombat() and r then
                local at = ai()
                if at then
                    return at
                end
            end
            T = G.Trueshot:CooldownUp()
            if o() then
                local at = aj()
                if at then
                    return at
                end
            end
            local at = an()
            if at then
                return at
            end
            if _ < 3 or not G.TrickShots:IsAvailable() then
                local at = al()
                if at then
                    return at
                end
            end
            if _ > 2 then
                local at = am()
                if at then
                    return at
                end
            end
            if m.CastAnnotated(G.PoolFocus, false, "WAIT") then
                return "Pooling Focus"
            end
        end
    end
    if a1.TargetIsValid() then
        a6()
        if not g:AffectingCombat() and r then
            local at = ai()
            if at then
                return at
            end
        end
        T = G.Trueshot:CooldownUp()
        if o() then
            local at = aj()
            if at then
                return at
            end
        end
        local at = an()
        if at then
            return at
        end
        if _ < 3 or not G.TrickShots:IsAvailable() then
            local at = al()
            if at then
                return at
            end
        end
        if _ > 2 then
            local at = am()
            if at then
                return at
            end
        end
        if m.CastAnnotated(G.PoolFocus, false, "WAIT") then
            return "Pooling Focus"
        end
    end
end
function ReturnSpell()
    if W == 0 then
        return 0
    else
        return W
    end
end
function ReturnSpellMO()
    if X == 0 then
        return 0
    else
        return X
    end
end
local function au()
    m.Print("Marksmanship Hunter rotation is currently a work in progress, but has been updated for patch 10.0.")
end
m.SetAPL(254, ar, au)
