local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = f.Pet;
local j = d.Spell;
local k = d.MultiSpell;
local l = d.Item;
local m = HeroRotation;
local n = m.AoEON;
local o = m.CDsON;
local p = m.Cast;
local q = m.CastSuggested;
local r = HeroRotationCharDB.Toggles[4]
local s = HeroRotationCharDB.Toggles[5]
local t = HeroRotationCharDB.Toggles[6]
local u = not HeroRotationCharDB.Toggles[15]
local v = HeroRotationCharDB.Toggles[12]
local w = HeroRotationCharDB.Toggles[60]
local x = HeroRotationCharDB.Toggles[120]
local y = HeroRotationCharDB.Toggles[121]
local z = HeroRotationCharDB.Toggles[122]
local A = HeroRotationCharDB.Toggles[123]
local B = HeroRotationCharDB.Toggles[124]
local C = HeroRotationCharDB.Toggles[142]
local D = HeroRotationCharDB.Toggles[17]
local E = { 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 326450, 320703, 320012, 324085, 333241,
    331510 }
local GetTime = GetTime;
local F = m.Commons.Hunter;
local G = j.Hunter.Marksmanship;
local H = l.Hunter.Marksmanship;
local I = { G.SummonPet, G.SummonPet2, G.SummonPet3, G.SummonPet4, G.SummonPet5 }
local J = {}
local K = g:GetEquipment()
local L = K[13] and l(K[13]) or l(0)
local M = K[14] and l(K[14]) or l(0)
local N, O = GetInventoryItemID("player", 13)
local P, O = GetInventoryItemID("player", 14)
if K[13] then L = l(K[13]) end
if K[14] then M = l(K[14]) end
local Q = L:IsEquippedAndReady() or L:CooldownRemains() > 0;
local R = M:IsEquippedAndReady() or M:CooldownRemains() > 0;
local S = { LastCast = 0, Count = 0 }
local T = 11111;
local U = 11111;
local V = 0;
local W = 0;
local X;
local Y;
local Z;
local _;
local a0 = m.Commons.Everyone;
local a1 = { General = m.GUISettings.General, Commons = m.GUISettings.APL.Hunter.Commons,
    Commons2 = m.GUISettings.APL.Hunter.Commons2, Marksmanship = m.GUISettings.APL.Hunter.Marksmanship }
local a2 = h:HealthPercentage() > 70 and G.CarefulAim:IsAvailable()
d:RegisterForEvent(function() K = g:GetEquipment()
L = K[13] and l(K[13]) or l(0)
M = K[14] and l(K[14]) or l(0)
end, "PLAYER_EQUIPMENT_CHANGED")
d:RegisterForEvent(function() S = { LastCast = 0, Count = 0 }
T = 11111;
U = 11111
end, "PLAYER_REGEN_ENABLED")
d:RegisterForEvent(function() G.SerpentSting:RegisterInFlight() G.SteadyShot:RegisterInFlight() G.AimedShot:
    RegisterInFlight() end, "LEARNED_SPELL_IN_TAB")
G.SerpentSting:RegisterInFlight()
G.SteadyShot:RegisterInFlight()
G.AimedShot:RegisterInFlight()
local function a3(a4) if a4 then return 1 else return 0 end end

local function a5(a4) return a4 ~= 0 end

local function a6() return g:BuffUp(G.TrickShotsBuff) and not g:IsCasting(G.AimedShot) and
    not g:IsChanneling(G.RapidFire) or g:BuffUp(G.VolleyBuff) end

local function a7() if (S.Count == 0 or S.Count == 1) and g:IsCasting(G.SteadyShot) and
    S.LastCast < GetTime() - G.SteadyShot:CastTime() then S.LastCast = GetTime()
S.Count = S.Count + 1
end if not (g:IsCasting(G.SteadyShot) or g:PrevGCDP(1, G.SteadyShot)) then S.Count = 0 end if G.SteadyFocusBuff.LastAppliedOnPlayerTime
    > S.LastCast then S.Count = 0 end end

local function a8(a9) return a9:DebuffRemains(G.SerpentStingDebuff) end

local function aa(a9) return a9:DebuffRemains(G.SerpentStingDebuff) + a3(G.SerpentSting:InFlight()) * 99 end

local function ab(a9) return a9:DebuffStack(G.LatentPoisonDebuff) end

local function ac(a9) if a9:DebuffRefreshable(G.SerpentStingDebuff) and not G.SerpentstalkersTrickery:IsAvailable() and
    (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == f("mouseover"):GUID() and
    a1.Marksmanship.TargetSwap == "Mouseover" then W = 1271788; return true elseif a9:DebuffRefreshable(G.SerpentStingDebuff)
    and not G.SerpentstalkersTrickery:IsAvailable() and (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285)
    and a1.Marksmanship.TargetSwap == "AutoSwap" and a9:GUID() ~= h:GUID() and not v then W = 999; return true elseif a9
    :DebuffRefreshable(G.SerpentStingDebuff) and not G.SerpentstalkersTrickery:IsAvailable() and
    (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == h:GUID() then V = 271788; return true elseif a9
    :DebuffRefreshable(G.SerpentStingDebuff) and not G.SerpentstalkersTrickery:IsAvailable() then return true end end

local function ad(a9) if a9:DebuffRefreshable(G.SerpentStingDebuff) and G.HydrasBite:IsAvailable() and
    (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == f("mouseover"):GUID() and
    a1.Marksmanship.TargetSwap == "Mouseover" then W = 1271788; return true elseif a9:DebuffRefreshable(G.SerpentStingDebuff)
    and G.HydrasBite:IsAvailable() and (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and
    a1.Marksmanship.TargetSwap == "AutoSwap" and a9:GUID() ~= h:GUID() and not v then W = 999; return true elseif a9:
    DebuffRefreshable(G.SerpentStingDebuff) and G.HydrasBite:IsAvailable() and
    (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == h:GUID() then V = 271788; return true elseif a9
    :DebuffRefreshable(G.SerpentStingDebuff) and G.HydrasBite:IsAvailable() then return true end end

local function ae(a9) if a9:DebuffRefreshable(G.SerpentStingDebuff) and G.PoisonInjection:IsAvailable() and
    not G.SerpentstalkersTrickery:IsAvailable() and (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and
    a9:GUID() == f("mouseover"):GUID() and a1.Marksmanship.TargetSwap == "Mouseover" then W = 1271788; return true elseif a9
    :DebuffRefreshable(G.SerpentStingDebuff) and G.PoisonInjection:IsAvailable() and
    not G.SerpentstalkersTrickery:IsAvailable() and (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and
    a1.Marksmanship.TargetSwap == "AutoSwap" and a9:GUID() ~= h:GUID() and not v then W = 999; return true elseif a9:
    DebuffRefreshable(G.SerpentStingDebuff) and G.PoisonInjection:IsAvailable() and
    not G.SerpentstalkersTrickery:IsAvailable() and (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and
    a9:GUID() == h:GUID() then V = 271788; return true elseif a9:DebuffRefreshable(G.SerpentStingDebuff) and
    G.PoisonInjection:IsAvailable() and not G.SerpentstalkersTrickery:IsAvailable() then return true end end

local function af(a9) if G.SerpentstalkersTrickery:IsAvailable() and
    (
    g:BuffDown(G.PreciseShotsBuff) or
        (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
        (not G.ChimaeraShot:IsAvailable() or Z < 2) or g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and
        Z > 1) and (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == f("mouseover"):GUID()
    and a1.Marksmanship.TargetSwap == "Mouseover" then W = 119434; return true elseif G.SerpentstalkersTrickery:
    IsAvailable() and
    (
    g:BuffDown(G.PreciseShotsBuff) or
        (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
        (not G.ChimaeraShot:IsAvailable() or Z < 2) or g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and
        Z > 1) and (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and
    a1.Marksmanship.TargetSwap == "AutoSwap" and a9:GUID() ~= h:GUID() and not v then W = 999; return true elseif G.SerpentstalkersTrickery
    :IsAvailable() and
    (
    g:BuffDown(G.PreciseShotsBuff) or
        (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
        (not G.ChimaeraShot:IsAvailable() or Z < 2) or g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and
        Z > 1) and (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == h:GUID() then V = 19434; return true elseif G
    .SerpentstalkersTrickery:IsAvailable() and
    (
    g:BuffDown(G.PreciseShotsBuff) or
        (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
        (not G.ChimaeraShot:IsAvailable() or Z < 2) or g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and
        Z > 1) then return true end end

local function ag(a9) if (
    g:BuffDown(G.PreciseShotsBuff) or
        (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
        (not G.ChimaeraShot:IsAvailable() or Z < 2) or g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and
        Z > 1) and (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == f("mouseover"):GUID()
    and a1.Marksmanship.TargetSwap == "Mouseover" then W = 119434; return true elseif (
    g:BuffDown(G.PreciseShotsBuff) or
        (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
        (not G.ChimaeraShot:IsAvailable() or Z < 2) or g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and
        Z > 1) and (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and
    a1.Marksmanship.TargetSwap == "AutoSwap" and a9:GUID() ~= h:GUID() and not v then W = 999; return true elseif (
    g:BuffDown(G.PreciseShotsBuff) or
        (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
        (not G.ChimaeraShot:IsAvailable() or Z < 2) or g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and
        Z > 1) and (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == h:GUID() then V = 19434; return true elseif g
    :BuffDown(G.PreciseShotsBuff) or
    (g:BuffUp(G.TrueshotBuff) or G.AimedShot:FullRechargeTime() < g:GCD() + G.AimedShot:CastTime()) and
    (not G.ChimaeraShot:IsAvailable() or Z < 2) or g:BuffRemains(G.TrickShotsBuff) > G.AimedShot:ExecuteTime() and Z > 1 then return true end end

local function ah(a9) if G.SerpentstalkersTrickery:IsAvailable() and
    (
    g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
        (
        g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
            G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD())) and
    (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == f("mouseover"):GUID() and
    a1.Marksmanship.TargetSwap == "Mouseover" then W = 119434; return true elseif G.SerpentstalkersTrickery:IsAvailable()
    and
    (
    g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
        (
        g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
            G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD())) and
    (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a1.Marksmanship.TargetSwap == "AutoSwap" and
    a9:GUID() ~= h:GUID() and not v then W = 999; return true elseif G.SerpentstalkersTrickery:IsAvailable() and
    (
    g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
        (
        g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
            G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD())) and
    (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == h:GUID() then V = 19434; return true elseif G
    .SerpentstalkersTrickery:IsAvailable() and
    (
    g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
        (
        g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
            G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD())) then return true end end

local function ai(a9) if g:BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
    (
    g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
        G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD()) and
    (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == f("mouseover"):GUID() and
    a1.Marksmanship.TargetSwap == "Mouseover" then W = 119434; return true elseif g:BuffRemains(G.TrickShotsBuff) >=
    G.AimedShot:ExecuteTime() and
    (
    g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
        G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD()) and
    (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a1.Marksmanship.TargetSwap == "AutoSwap" and
    a9:GUID() ~= h:GUID() and not v then W = 999; return true elseif g:BuffRemains(G.TrickShotsBuff) >=
    G.AimedShot:ExecuteTime() and
    (
    g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
        G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD()) and
    (a9:AffectingCombat() or a9:IsDummy() or a9:NPCID() == 153285) and a9:GUID() == h:GUID() then V = 19434; return true elseif g
    :BuffRemains(G.TrickShotsBuff) >= G.AimedShot:ExecuteTime() and
    (
    g:BuffDown(G.PreciseShotsBuff) or g:BuffUp(G.TrueshotBuff) or
        G.AimedShot:FullRechargeTime() < G.AimedShot:CastTime() + g:GCD()) then return true end end

local function aj() if a0.TargetIsValid() then if G.DoubleTap:IsReady() and o() then if p(G.DoubleTap, nil) then V = 260402; return "double_tap opener" end end if G
    .AimedShot:IsReady() and not g:IsCasting(G.AimedShot) and (Z < 3 and (not G.Volley:IsAvailable() or Z < 2)) then if p(G
    .AimedShot, nil, nil, not _) then V = 19434; return "aimed_shot opener" end end if G.WailingArrow:IsReady() and o()
    and not g:IsCasting(G.WailingArrow) and (Z > 2 or not G.SteadyFocus:IsAvailable()) then if p(G.WailingArrow, nil, nil
    , not _) then V = 355589; return "wailing_arrow opener" end end if G.SteadyShot:IsCastable() and
    (Z > 2 or G.Volley:IsAvailable() and Z == 2) then if p(G.SteadyShot, nil, nil, not _) then V = 56641; return "steady_shot opener" end end end end

local function ak() if G.Berserking:IsReady() and a1.Commons.Enabled.Racials and o() and U < 13 then if p(G.Berserking,
    nil) then V = 137096; return "berserking cds 2" end end if G.BloodFury:IsReady() and a1.Commons.Enabled.Racials and
    o() and (g:BuffUp(G.TrueshotBuff) or G.Trueshot:CooldownRemains() > 30 or U < 16) then if p(G.BloodFury, nil) then V = 20572; return "blood_fury cds 4" end end if G
    .AncestralCall:IsReady() and a1.Commons.Enabled.Racials and o() and
    (g:BuffUp(G.TrueshotBuff) or G.Trueshot:CooldownRemains() > 30 or U < 16) then if p(G.AncestralCall, nil) then V = 274738; return "ancestral_call cds 6" end end if G
    .Fireblood:IsReady() and a1.Commons.Enabled.Racials and o() and
    (g:BuffUp(G.TrueshotBuff) or G.Trueshot:CooldownRemains() > 30 or U < 9) then if p(G.Fireblood, nil) then V = 273104; return "fireblood cds 8" end end if G
    .LightsJudgment:IsReady() and a1.Commons.Enabled.Racials and o() and g:BuffDown(G.TrueshotBuff) then if p(G.LightsJudgment
    , nil, nil, not h:IsSpellInRange(G.LightsJudgment)) then V = 255647; return "lights_judgment cds 10" end end if a1.Commons
    .Enabled.Potions and o() and u and
    (
    g:BuffUp(G.TrueshotBuff) and not m.GUISettings.General.HoldPotforBL or
        m.GUISettings.General.HoldPotforBL and g:BloodlustUp()) then local al = a0.PotionSelected() if al and
    al:IsReady() then if p(al, nil, nil) then V = 12; return "potion cds 12" end end end end

local function am() if G.SteadyShot:IsCastable() and
    (
    G.SteadyFocus:IsAvailable() and
        (
        S.Count == 1 and g:BuffRemains(G.SteadyFocusBuff) < 5 or
            g:BuffDown(G.SteadyFocusBuff) and g:BuffDown(G.TrueshotBuff) and S.Count ~= 2)) then if p(G.SteadyShot, nil,
    nil, not _) then V = 56641; return "steady_shot st 2" end end if G.KillShot:IsReady() then if p(G.KillShot, nil, nil
    , not _) then V = 53351; return "KillShot st 4" end end if G.SerpentSting:IsReady() and g:BuffDown(G.TrueshotBuff) then if a0
    .CastTargetIf(G.SerpentSting, X, "min", a8, ac, not _) then return "serpent_sting st 8" end end if G.ExplosiveShot:
    IsReady() then if p(G.ExplosiveShot, nil, nil, not _) then V = 212431; return "explosive_shot 10" end end if G.DoubleTap
    :IsReady() and (G.RapidFire:CooldownRemains() < g:GCD() or h:HealthPercentage() > 70 or
        not G.Streamline:IsAvailable()) then if p(G.DoubleTap, nil) then V = 260402; return "double_tap st 12" end end if G
    .Stampede:IsCastable() then if p(G.Stampede, nil, nil, not h:IsInRange(30)) then V = 201430; return "stampede st 14" end end if G
    .DeathChakram:IsReady() and s then if p(G.DeathChakram, nil, nil, not _) then V = 325028; return "dark_chakram st 16" end end if G
    .WailingArrow:IsReady() and o() and Z > 1 then if p(G.WailingArrow, nil, nil, not _) then V = 355589; return "wailing_arrow st 18" end end if G
    .Volley:IsReady() then if p(G.Volley, nil, nil, not _) then V = 260243; return "volley st 20 " end end if G.RapidFire
    :IsCastable() and
    (G.SurgingShots:IsAvailable() or g:BuffUp(G.DoubleTapBuff) and G.Streamline:IsAvailable() and h:HealthPercentage() <
        70) then if p(G.RapidFire, nil, nil, not _) then V = 257044; return "rapid_fire st 22" end end if G.Trueshot:
    IsReady() and o() then if p(G.Trueshot, nil) then V = 288613; return "trueshot st 24" end end if G.MultiShot:IsReady()
    and (g:BuffUp(G.BombardmentBuff) and not a6() and Z > 1 or G.Salvo:IsAvailable() and not G.Volley:IsAvailable()) then if p(G
    .MultiShot, nil, nil, not _) then V = 257620; return "MultiShot trickshots 26" end end if G.AimedShot:IsReady() then if a0
    .CastTargetIf(G.AimedShot, X, "min", aa, af, not _) then return "aimed_shot st 28" end end if G.AimedShot:IsReady() then if a0
    .CastTargetIf(G.AimedShot, X, "max", ab, ag, not _) then return "aimed_shot st 30" end end if G.SteadyShot:
    IsCastable() and (G.SteadyFocus:IsAvailable() and g:BuffRemains(G.SteadyFocusBuff) < G.SteadyShot:ExecuteTime() * 2)
    and S.Count ~= 2 then if p(G.SteadyShot, nil, nil, not _) then V = 56641; return "steady_shot st 32" end end if G.RapidFire
    :IsCastable() then if p(G.RapidFire, nil, nil, not _) then V = 257044; return "rapid_fire st 34" end end if G.WailingArrow
    :IsReady() and g:BuffDown(G.TrueshotBuff) then if p(G.WailingArrow, nil, nil, not _) then V = 355589; return "wailing_arrow st 36" end end if G
    .ChimaeraShot:IsReady() and
    (g:BuffUp(G.PreciseShotsBuff) or g:FocusPredicted() > G.ChimaeraShot:Cost() + G.AimedShot:Cost()) then if p(G.ChimaeraShot
    , nil, nil, not _) then V = 342049; return "chimaera_shot st 38" end end if G.ArcaneShot:IsReady() and
    (g:BuffUp(G.PreciseShotsBuff) or g:FocusPredicted() > G.ArcaneShot:Cost() + G.AimedShot:Cost()) then if p(G.ArcaneShot
    , nil, nil, not _) then V = 185358; return "arcane_shot st 40" end end if G.BagofTricks:IsReady() and o() and
    a1.Commons.Enabled.Racials and g:BuffDown(G.Trueshot) then if p(G.BagofTricks, nil, nil,
    not h:IsSpellInRange(G.BagofTricks)) then V = 312411; return "bag_of_tricks st 42" end end if G.SteadyShot:
    IsCastable() then if p(G.SteadyShot, nil, nil, not _) then V = 56641; return "steady_shot st 44" end end end

local function an() if G.SteadyShot:IsCastable() and
    (G.SteadyFocus:IsAvailable() and S.Count == 1 and g:BuffRemains(G.SteadyFocusBuff) < 8) then if p(G.SteadyShot, nil,
    nil, not _) then V = 56641; return "steady_shot trickshots 2" end end if G.KillShot:IsReady() and
    g:BuffUp(G.RazorFragmentsBuff) then if p(G.KillShot, nil, nil, not _) then V = 53351; return "KillShot Razor trickshots 2" end end if G
    .DoubleTap:IsReady() and
    (G.RapidFire:CooldownRemains() < g:GCD() or h:HealthPercentage() > 70 or not G.Streamline:IsAvailable()) then if p(G
    .DoubleTap, nil) then V = 260402; return "double_tap trickshots 4" end end if G.ExplosiveShot:IsReady() then if p(G.ExplosiveShot
    , nil, nil, not _) then V = 212431; return "explosive_shot trickshots 10" end end if G.FlayedShot:IsReady() and
    PouchofRazorFragmentsEquiped then if p(G.FlayedShot, nil, nil, not _) then V = 324149; return "Flayed Razor trickshots 2" end end if G
    .TarTrap:IsReady() and
    (SoulForgeEmbersEquipped and G.TarTrap:TimeSinceLastCast() > 60 - g:GCD() - 0.5 and G.Flare:CooldownRemains() <
        g:GCD()) then if p(G.TarTrap, nil, nil, not h:IsInRange(40)) then V = 187698; return "tar_trap soulforge_embers equipped trickshots 6" end end if G
    .Flare:IsReady() and not G.TarTrap:CooldownUp() and SoulForgeEmbersEquipped then if p(G.Flare, nil) then V = 1543; return "flare trickshots 8" end end if G
    .DeathChakram:IsReady() and s then if p(G.DeathChakram, nil, nil) then V = 325028; return "dark_chakram trickshots 26" end end if G
    .Stampede:IsReady() then if p(G.Stampede, nil, nil, not h:IsInRange(30)) then V = 201430; return "stampede trickshots 12" end end if G
    .WailingArrow:IsReady() then if p(G.WailingArrow, nil, nil, not _) then V = 355589; return "wailing_arrow trickshots 13" end end if G
    .SerpentSting:IsReady() then if a0.CastTargetIf(G.SerpentSting, X, "min", a8, ad, not _) then return "serpent_sting trickshots 16" end end if G
    .Barrage:IsReady() and Z > 7 then if p(G.Barrage, nil, nil, not _) then V = 120360; return "barrage trickshots 18" end end if G
    .Volley:IsReady() then if p(G.Volley, nil) then V = 260243; return "volley trickshots 16" end end if G.Trueshot:
    IsReady() and o() then if p(G.Trueshot, nil, nil, not _) then V = 288613; return "trueshot trickshots 20" end end if G
    .RapidFire:IsCastable() and
    (
    g:BuffRemains(G.TrickShotsBuff) >= G.RapidFire:ExecuteTime() and
        (
        G.SurgingShots:IsAvailable() or
            g:BuffUp(G.DoubleTapBuff) and G.Streamline:IsAvailable() and h:HealthPercentage() < 70)) then if p(G.RapidFire
    , nil, nil, not _) then V = 257044; return "rapid_fire trickshots 22" end end if G.AimedShot:IsReady() then if a0.CastTargetIf(G
    .AimedShot, X, "min", aa, ah, not _) then return "aimed_shot trickshots 26" end end if G.AimedShot:IsReady() then if a0
    .CastTargetIf(G.AimedShot, X, "max", ab, ai, not _) then return "aimed_shot trickshots 28" end end if G.RapidFire:
    IsCastable() and g:BuffRemains(G.TrickShotsBuff) >= G.RapidFire:ExecuteTime() then if p(G.RapidFire, nil, nil, not _) then V = 257044; return "rapid_fire trickshots 28" end end if G
    .ChimaeraShot:IsReady() and
    (
    g:BuffUp(G.TrickShotsBuff) and g:BuffUp(G.PreciseShotsBuff) and
        g:FocusPredicted() > G.ChimaeraShot:Cost() + G.AimedShot:Cost() and Z < 4) then if p(G.ChimaeraShot, nil, nil,
    not _) then V = 342049; return "chimaera_shot trickshots 32" end end if G.MultiShot:IsReady() and
    (
    not a6() or
        (g:BuffUp(G.PreciseShotsBuff) or g:BuffStack(G.BulletstormBuff) == 10) and
        g:FocusPredicted() > G.MultiShot:Cost() + G.AimedShot:Cost()) then if p(G.MultiShot, nil, nil, not _) then V = 257620; return "MultiShot trickshots 30" end end if G
    .SerpentSting:IsReady() then if a0.CastTargetIf(G.SerpentSting, X, "min", a8, ae, not _) then return "serpent_sting trickshots 36" end end if G
    .KillShot:IsReady() and g:FocusPredicted() > G.KillShot:Cost() + G.AimedShot:Cost() then if p(G.KillShot, nil, nil,
    not _) then V = 53351; return "kill_shot trickshots 35" end end if G.MultiShot:IsReady() and
    g:FocusPredicted() > G.MultiShot:Cost() + G.AimedShot:Cost() then if p(G.MultiShot, nil, nil, not _) then V = 257620; return "MultiShot trickshots 42" end end if G
    .BagofTricks:IsReady() and o() and a1.Commons.Enabled.Racials and g:BuffDown(G.Trueshot) then if p(G.BagofTricks, nil
    , nil, not h:IsSpellInRange(G.BagofTricks)) then V = 312411; return "bag_of_tricks st 42" end end if G.SteadyShot:
    IsCastable() then if p(G.SteadyShot, nil, nil, not _) then V = 56641; return "steady_shot trickshots 46" end end end

local function ao() t = HeroRotationCharDB.Toggles[6]
r = HeroRotationCharDB.Toggles[4]
s = HeroRotationCharDB.Toggles[5]
v = HeroRotationCharDB.Toggles[12]
u = not HeroRotationCharDB.Toggles[15]
w = HeroRotationCharDB.Toggles[60]
x = HeroRotationCharDB.Toggles[120]
y = HeroRotationCharDB.Toggles[121]
z = HeroRotationCharDB.Toggles[122]
A = HeroRotationCharDB.Toggles[123]
B = HeroRotationCharDB.Toggles[124]
HoldMD = HeroRotationCharDB.Toggles[125]
C = HeroRotationCharDB.Toggles[142]
D = HeroRotationCharDB.Toggles[17]
N = GetInventoryItemID("player", 13)
P = GetInventoryItemID("player", 14)
if not a1.Commons.Enabled.TopTrinket and not a1.Commons.Enabled.BotTrinket then J = { N, P } elseif not
    a1.Commons.Enabled.TopTrinket and a1.Commons.Enabled.BotTrinket then J = { N } elseif not
    a1.Commons.Enabled.BotTrinket and a1.Commons.Enabled.TopTrinket then J = { P } elseif not
    a1.Commons.Enabled.BotTrinket and not a1.Commons.Enabled.TopTrinket then J = {} end end

local function ap() _ = h:IsSpellInRange(G.AimedShot)
X = g:GetEnemiesInRange(G.AimedShot.MaximumRange)
Y = h:GetEnemiesInSplashRange(10)
N, O = GetInventoryItemID("player", 13)
P, O = GetInventoryItemID("player", 14)
if n() then Z = #Y else Z = 1 end if w then Z = 10 end if a0.TargetIsValid() or g:AffectingCombat() then T = d.BossFightRemains(nil
    , true)
U = T;
if U == 11111 then U = d.FightRemains(Y, false) end end if not BotOn then W = 0;
V = 0
end if W > 0 then W = 0 end if V > 0 then V = 0 end ao() if m.GUISettings.General.OpenerReset > 0 and
    not HeroRotationCharDB.Toggles[6] then starttime = GetTime()
endtime = starttime + m.GUISettings.General.OpenerReset
elseif m.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6
    ] then HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6] m.ToggleIconFrame:UpdateButtonText(6) m.Print("Opener is now "
    .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r.")) end if g:BuffUp(j(5384)) then return false end if m
    .QueuedCast() then V = m.QueuedCast() return "Custom Queue " .. j(V):ID() end if x and G.Bindingshot:IsAvailable()
    and G.Bindingshot:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(G.Bindingshot, nil, nil, nil) then V = 109248; return "queue Binding Shot" end elseif (
    not G.Bindingshot:IsUsableP() or G.Bindingshot:CooldownRemains() > 0) and x then HeroRotationCharDB.Toggles[120] = not
    HeroRotationCharDB.Toggles[120] m.Print("Binding Shot Queue is now " ..
    (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if y and
    G.FreezingTrap:IsAvailable() and G.FreezingTrap:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(G.FreezingTrap,
    nil, nil, nil) then V = 187650; return "queue Freezing Trap" end elseif (
    not G.FreezingTrap:IsUsableP() or G.FreezingTrap:CooldownRemains() > 0) and y then HeroRotationCharDB.Toggles[121] = not
    HeroRotationCharDB.Toggles[121] m.Print("Freezing Trap Queue is now " ..
    (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if A and G.Flare:IsAvailable() and
    G.Flare:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(G.Flare, nil, nil, nil) then V = 1543; return "queue Flare" end elseif (
    not G.Flare:IsUsableP() or G.Flare:CooldownRemains() > 0) and A then HeroRotationCharDB.Toggles[123] = not
    HeroRotationCharDB.Toggles[123] m.Print("Flare Queue is now " ..
    (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if B and G.TarTrap:IsAvailable()
    and G.TarTrap:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(G.TarTrap, nil, nil, nil) then V = 187698; return "queue TarTrap" end elseif (
    not G.TarTrap:IsUsableP() or G.TarTrap:CooldownRemains() > 0) and B then HeroRotationCharDB.Toggles[124] = not
    HeroRotationCharDB.Toggles[124] m.Print("Tar Trap Queue is now " ..
    (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if G.Exhilaration:IsCastable() and
    g:HealthPercentage() <= a1.Commons.ExhilarationHP then if p(G.Exhilaration, nil) then V = 109304; return "Exhilaration" end end if g
    :HealthPercentage() < a1.Commons.HealthstoneHP and H.Healthstone:IsReady() and H.Healthstone:CooldownRemains() <= 0 then if m
    .Cast(H.Healthstone, nil) then V = 40; return "Healthstone HP" end end if g:HealthPercentage() < a1.Commons.HealPotHP
    and H.CosmicHealPot:IsReady() and H.CosmicHealPot:CooldownRemains() <= 0 then if m.Cast(H.CosmicHealPot, nil) then V = 45; return "CosmicHealPot HP" end end if g
    :HealthPercentage() < a1.Commons.HealPotHP and H.HealPot:IsReady() and H.HealPot:CooldownRemains() <= 0 then if m.Cast(H
    .HealPot, nil) then V = 41; return "HealPot HP" end end if G.AspectoftheTurtle:IsCastable() and
    g:HealthPercentage() <= a1.Commons.TurtleHP then if p(G.AspectoftheTurtle, nil) then V = 186265; return "AspectoftheTurtle" end end if UnitExists("mouseover")
    and string.find(UnitGUID("mouseover"), 120651) then if G.ArcaneShot:IsCastable() and f("mouseover"):IsInMeleeRange(8) then if p(G
    .ArcaneShot, nil) then W = 1185358; return "explosive MO AS" end end end if UnitExists("target") and
    string.find(UnitGUID("target"), 120651) then if G.ArcaneShot:IsCastable() and h:IsInMeleeRange(8) then if p(G.ArcaneShot
    , nil) then V = 185358; return "explosive  SWD" end end end if not g:AffectingCombat() and a0.TargetIsValid() and t then local aq = aj() if aq then return aq end end if a0
    .TargetIsValid() and g:AffectingCombat() and (h:AffectingCombat() or h:IsDummy() or h:NPCID() == 153285) then a7() local ar = g
    :GetUseableTrinkets(J, 13) if ar and (not ar:TrinketHasUseBuff() or g:BuffUp(G.TrueshotBuff)) then if p(ar, nil, nil) then V = 24; return "trinket1 main 2" end end local as = g
    :GetUseableTrinkets(J, 14) if as and a1.Commons.Enabled.BottomTrinket and
    (not as:TrinketHasUseBuff() or g:BuffUp(G.TrueshotBuff)) then if p(as, nil, nil) then V = 25; return "trinket2 main 4" end end if ar
    or as then local at = ar or as; if m.Cast(at, nil, nil) then if at:ID() == N and a1.Commons.Enabled.TopTrinket then V = 24; return "Generic use_items for "
    .. at:Name() elseif at:ID() == P and a1.Commons.Enabled.BottomTrinket then V = 25; return "Generic use_items for " ..
    at:Name() end end end if true then local aq = ak() if aq then return aq end end if Z < 3 or
    not G.TrickShots:IsAvailable() then local aq = am() if aq then return aq end end if Z > 2 then local aq = an() if aq then return aq end end if m
    .CastAnnotated(G.PoolFocus, false, "WAIT") then V = 9999999; return "Pooling Focus" end end end

local function au() m.Print("Marksmanship Hunter rotation is currently a work in progress.") end

function ReturnSpell() if V == 0 then return 0 else return V end end

function ReturnSpellMO() if W == 0 then return 0 else return W end end

m.SetAPL(254, ap, au)

