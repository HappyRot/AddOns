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
local C = HeroRotationCharDB.Toggles[171]
local D = HeroRotationCharDB.Toggles[142]
local E = HeroRotationCharDB.Toggles[17]
local F = { 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 326450, 320703, 320012, 324085, 333241,
    331510 }
local GetTime = GetTime;
local G = m.Commons.Hunter;
local H = j.Hunter.Marksmanship;
local I = l.Hunter.Marksmanship;
local J = { H.SummonPet, H.SummonPet2, H.SummonPet3, H.SummonPet4, H.SummonPet5 }
local K = {}
local L = g:GetEquipment()
local M = L[13] and l(L[13]) or l(0)
local N = L[14] and l(L[14]) or l(0)
local O, P = GetInventoryItemID("player", 13)
local Q, P = GetInventoryItemID("player", 14)
if L[13] then M = l(L[13]) end
if L[14] then N = l(L[14]) end
local R = M:IsEquippedAndReady() or M:CooldownRemains() > 0;
local S = N:IsEquippedAndReady() or N:CooldownRemains() > 0;
local T = { LastCast = 0, Count = 0 }
local U = 11111;
local V = 11111;
local W = 0;
local X = 0;
local Y;
local Z;
local _;
local a0;
local a1 = m.Commons.Everyone;
local a2 = { General = m.GUISettings.General, Commons = m.GUISettings.APL.Hunter.Commons,
    Commons2 = m.GUISettings.APL.Hunter.Commons2, Marksmanship = m.GUISettings.APL.Hunter.Marksmanship }
local a3 = h:HealthPercentage() > 70 and H.CarefulAim:IsAvailable()
d:RegisterForEvent(function() L = g:GetEquipment()
M = L[13] and l(L[13]) or l(0)
N = L[14] and l(L[14]) or l(0)
end, "PLAYER_EQUIPMENT_CHANGED")
d:RegisterForEvent(function() T = { LastCast = 0, Count = 0 }
U = 11111;
V = 11111
end, "PLAYER_REGEN_ENABLED")
d:RegisterForEvent(function() H.SerpentSting:RegisterInFlight() H.SteadyShot:RegisterInFlight() H.AimedShot:
    RegisterInFlight() end, "LEARNED_SPELL_IN_TAB")
H.SerpentSting:RegisterInFlight()
H.SteadyShot:RegisterInFlight()
H.AimedShot:RegisterInFlight()
local function a4(a5) if a5 then return 1 else return 0 end end

local function a6(a5) return a5 ~= 0 end

local function a7() return g:BuffUp(H.TrickShotsBuff) and not g:IsCasting(H.AimedShot) and
    not g:IsChanneling(H.RapidFire) or g:BuffUp(H.VolleyBuff) end

local function a8() if (T.Count == 0 or T.Count == 1) and g:IsCasting(H.SteadyShot) and
    T.LastCast < GetTime() - H.SteadyShot:CastTime() then T.LastCast = GetTime()
T.Count = T.Count + 1
end if not (g:IsCasting(H.SteadyShot) or g:PrevGCDP(1, H.SteadyShot)) then T.Count = 0 end if H.SteadyFocusBuff.LastAppliedOnPlayerTime
    > T.LastCast then T.Count = 0 end end

local function a9(aa) return aa:DebuffRemains(H.SerpentStingDebuff) end

local function ab(aa) return aa:DebuffRemains(H.SerpentStingDebuff) + a4(H.SerpentSting:InFlight()) * 99 end

local function ac(aa) return aa:DebuffStack(H.LatentPoisonDebuff) end

local function ad(aa) if aa:DebuffRefreshable(H.SerpentStingDebuff) and not H.SerpentstalkersTrickery:IsAvailable() and
    (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == f("mouseover"):GUID() and
    a2.Marksmanship.TargetSwap == "Mouseover" then X = 1271788; return true elseif aa:DebuffRefreshable(H.SerpentStingDebuff)
    and not H.SerpentstalkersTrickery:IsAvailable() and (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285)
    and a2.Marksmanship.TargetSwap == "AutoSwap" and aa:GUID() ~= h:GUID() and not v then X = 999; return true elseif aa
    :DebuffRefreshable(H.SerpentStingDebuff) and not H.SerpentstalkersTrickery:IsAvailable() and
    (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == h:GUID() then W = 271788; return true elseif aa
    :DebuffRefreshable(H.SerpentStingDebuff) and not H.SerpentstalkersTrickery:IsAvailable() then return true end end

local function ae(aa) if aa:DebuffRefreshable(H.SerpentStingDebuff) and H.HydrasBite:IsAvailable() and
    (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == f("mouseover"):GUID() and
    a2.Marksmanship.TargetSwap == "Mouseover" then X = 1271788; return true elseif aa:DebuffRefreshable(H.SerpentStingDebuff)
    and H.HydrasBite:IsAvailable() and (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and
    a2.Marksmanship.TargetSwap == "AutoSwap" and aa:GUID() ~= h:GUID() and not v then X = 999; return true elseif aa:
    DebuffRefreshable(H.SerpentStingDebuff) and H.HydrasBite:IsAvailable() and
    (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == h:GUID() then W = 271788; return true elseif aa
    :DebuffRefreshable(H.SerpentStingDebuff) and H.HydrasBite:IsAvailable() then return true end end

local function af(aa) if aa:DebuffRefreshable(H.SerpentStingDebuff) and H.PoisonInjection:IsAvailable() and
    not H.SerpentstalkersTrickery:IsAvailable() and (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and
    aa:GUID() == f("mouseover"):GUID() and a2.Marksmanship.TargetSwap == "Mouseover" then X = 1271788; return true elseif aa
    :DebuffRefreshable(H.SerpentStingDebuff) and H.PoisonInjection:IsAvailable() and
    not H.SerpentstalkersTrickery:IsAvailable() and (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and
    a2.Marksmanship.TargetSwap == "AutoSwap" and aa:GUID() ~= h:GUID() and not v then X = 999; return true elseif aa:
    DebuffRefreshable(H.SerpentStingDebuff) and H.PoisonInjection:IsAvailable() and
    not H.SerpentstalkersTrickery:IsAvailable() and (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and
    aa:GUID() == h:GUID() then W = 271788; return true elseif aa:DebuffRefreshable(H.SerpentStingDebuff) and
    H.PoisonInjection:IsAvailable() and not H.SerpentstalkersTrickery:IsAvailable() then return true end end

local function ag(aa) if H.SerpentstalkersTrickery:IsAvailable() and
    (
    g:BuffDown(H.PreciseShotsBuff) or
        (g:BuffUp(H.TrueshotBuff) or H.AimedShot:FullRechargeTime() < g:GCD() + H.AimedShot:CastTime()) and
        (not H.ChimaeraShot:IsAvailable() or _ < 2) or g:BuffRemains(H.TrickShotsBuff) > H.AimedShot:ExecuteTime() and
        _ > 1) and (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == f("mouseover"):GUID()
    and a2.Marksmanship.TargetSwap == "Mouseover" then X = 119434; return true elseif H.SerpentstalkersTrickery:
    IsAvailable() and
    (
    g:BuffDown(H.PreciseShotsBuff) or
        (g:BuffUp(H.TrueshotBuff) or H.AimedShot:FullRechargeTime() < g:GCD() + H.AimedShot:CastTime()) and
        (not H.ChimaeraShot:IsAvailable() or _ < 2) or g:BuffRemains(H.TrickShotsBuff) > H.AimedShot:ExecuteTime() and
        _ > 1) and (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and
    a2.Marksmanship.TargetSwap == "AutoSwap" and aa:GUID() ~= h:GUID() and not v then X = 999; return true elseif H.SerpentstalkersTrickery
    :IsAvailable() and
    (
    g:BuffDown(H.PreciseShotsBuff) or
        (g:BuffUp(H.TrueshotBuff) or H.AimedShot:FullRechargeTime() < g:GCD() + H.AimedShot:CastTime()) and
        (not H.ChimaeraShot:IsAvailable() or _ < 2) or g:BuffRemains(H.TrickShotsBuff) > H.AimedShot:ExecuteTime() and
        _ > 1) and (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == h:GUID() then W = 19434; return true elseif H
    .SerpentstalkersTrickery:IsAvailable() and
    (
    g:BuffDown(H.PreciseShotsBuff) or
        (g:BuffUp(H.TrueshotBuff) or H.AimedShot:FullRechargeTime() < g:GCD() + H.AimedShot:CastTime()) and
        (not H.ChimaeraShot:IsAvailable() or _ < 2) or g:BuffRemains(H.TrickShotsBuff) > H.AimedShot:ExecuteTime() and
        _ > 1) then return true end end

local function ah(aa) if (
    g:BuffDown(H.PreciseShotsBuff) or
        (g:BuffUp(H.TrueshotBuff) or H.AimedShot:FullRechargeTime() < g:GCD() + H.AimedShot:CastTime()) and
        (not H.ChimaeraShot:IsAvailable() or _ < 2) or g:BuffRemains(H.TrickShotsBuff) > H.AimedShot:ExecuteTime() and
        _ > 1) and (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == f("mouseover"):GUID()
    and a2.Marksmanship.TargetSwap == "Mouseover" then X = 119434; return true elseif (
    g:BuffDown(H.PreciseShotsBuff) or
        (g:BuffUp(H.TrueshotBuff) or H.AimedShot:FullRechargeTime() < g:GCD() + H.AimedShot:CastTime()) and
        (not H.ChimaeraShot:IsAvailable() or _ < 2) or g:BuffRemains(H.TrickShotsBuff) > H.AimedShot:ExecuteTime() and
        _ > 1) and (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and
    a2.Marksmanship.TargetSwap == "AutoSwap" and aa:GUID() ~= h:GUID() and not v then X = 999; return true elseif (
    g:BuffDown(H.PreciseShotsBuff) or
        (g:BuffUp(H.TrueshotBuff) or H.AimedShot:FullRechargeTime() < g:GCD() + H.AimedShot:CastTime()) and
        (not H.ChimaeraShot:IsAvailable() or _ < 2) or g:BuffRemains(H.TrickShotsBuff) > H.AimedShot:ExecuteTime() and
        _ > 1) and (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == h:GUID() then W = 19434; return true elseif g
    :BuffDown(H.PreciseShotsBuff) or
    (g:BuffUp(H.TrueshotBuff) or H.AimedShot:FullRechargeTime() < g:GCD() + H.AimedShot:CastTime()) and
    (not H.ChimaeraShot:IsAvailable() or _ < 2) or g:BuffRemains(H.TrickShotsBuff) > H.AimedShot:ExecuteTime() and _ > 1 then return true end end

local function ai(aa) if H.SerpentstalkersTrickery:IsAvailable() and
    (
    g:BuffRemains(H.TrickShotsBuff) >= H.AimedShot:ExecuteTime() and
        (
        g:BuffDown(H.PreciseShotsBuff) or g:BuffUp(H.TrueshotBuff) or
            H.AimedShot:FullRechargeTime() < H.AimedShot:CastTime() + g:GCD())) and
    (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == f("mouseover"):GUID() and
    a2.Marksmanship.TargetSwap == "Mouseover" then X = 119434; return true elseif H.SerpentstalkersTrickery:IsAvailable()
    and
    (
    g:BuffRemains(H.TrickShotsBuff) >= H.AimedShot:ExecuteTime() and
        (
        g:BuffDown(H.PreciseShotsBuff) or g:BuffUp(H.TrueshotBuff) or
            H.AimedShot:FullRechargeTime() < H.AimedShot:CastTime() + g:GCD())) and
    (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and a2.Marksmanship.TargetSwap == "AutoSwap" and
    aa:GUID() ~= h:GUID() and not v then X = 999; return true elseif H.SerpentstalkersTrickery:IsAvailable() and
    (
    g:BuffRemains(H.TrickShotsBuff) >= H.AimedShot:ExecuteTime() and
        (
        g:BuffDown(H.PreciseShotsBuff) or g:BuffUp(H.TrueshotBuff) or
            H.AimedShot:FullRechargeTime() < H.AimedShot:CastTime() + g:GCD())) and
    (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == h:GUID() then W = 19434; return true elseif H
    .SerpentstalkersTrickery:IsAvailable() and
    (
    g:BuffRemains(H.TrickShotsBuff) >= H.AimedShot:ExecuteTime() and
        (
        g:BuffDown(H.PreciseShotsBuff) or g:BuffUp(H.TrueshotBuff) or
            H.AimedShot:FullRechargeTime() < H.AimedShot:CastTime() + g:GCD())) then return true end end

local function aj(aa) if g:BuffRemains(H.TrickShotsBuff) >= H.AimedShot:ExecuteTime() and
    (
    g:BuffDown(H.PreciseShotsBuff) or g:BuffUp(H.TrueshotBuff) or
        H.AimedShot:FullRechargeTime() < H.AimedShot:CastTime() + g:GCD()) and
    (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == f("mouseover"):GUID() and
    a2.Marksmanship.TargetSwap == "Mouseover" then X = 119434; return true elseif g:BuffRemains(H.TrickShotsBuff) >=
    H.AimedShot:ExecuteTime() and
    (
    g:BuffDown(H.PreciseShotsBuff) or g:BuffUp(H.TrueshotBuff) or
        H.AimedShot:FullRechargeTime() < H.AimedShot:CastTime() + g:GCD()) and
    (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and a2.Marksmanship.TargetSwap == "AutoSwap" and
    aa:GUID() ~= h:GUID() and not v then X = 999; return true elseif g:BuffRemains(H.TrickShotsBuff) >=
    H.AimedShot:ExecuteTime() and
    (
    g:BuffDown(H.PreciseShotsBuff) or g:BuffUp(H.TrueshotBuff) or
        H.AimedShot:FullRechargeTime() < H.AimedShot:CastTime() + g:GCD()) and
    (aa:AffectingCombat() or aa:IsDummy() or aa:NPCID() == 153285) and aa:GUID() == h:GUID() then W = 19434; return true elseif g
    :BuffRemains(H.TrickShotsBuff) >= H.AimedShot:ExecuteTime() and
    (
    g:BuffDown(H.PreciseShotsBuff) or g:BuffUp(H.TrueshotBuff) or
        H.AimedShot:FullRechargeTime() < H.AimedShot:CastTime() + g:GCD()) then return true end end

local function ak() if a1.TargetIsValid() then if H.DoubleTap:IsReady() and o() then if p(H.DoubleTap, nil) then W = 260402; return "double_tap opener" end end if H
    .AimedShot:IsReady() and not g:IsCasting(H.AimedShot) and (_ < 3 and (not H.Volley:IsAvailable() or _ < 2)) then if p(H
    .AimedShot, nil, nil, not a0) then W = 19434; return "aimed_shot opener" end end if H.WailingArrow:IsReady() and o()
    and not g:IsCasting(H.WailingArrow) and (_ > 2 or not H.SteadyFocus:IsAvailable()) then if p(H.WailingArrow, nil, nil
    , not a0) then W = 355589; return "wailing_arrow opener" end end if H.SteadyShot:IsCastable() and
    (_ > 2 or H.Volley:IsAvailable() and _ == 2) then if p(H.SteadyShot, nil, nil, not a0) then W = 56641; return "steady_shot opener" end end end end

local function al() if H.Berserking:IsReady() and a2.Commons.Enabled.Racials and o() and V < 13 then if p(H.Berserking,
    nil) then W = 137096; return "berserking cds 2" end end if H.BloodFury:IsReady() and a2.Commons.Enabled.Racials and
    o() and (g:BuffUp(H.TrueshotBuff) or H.Trueshot:CooldownRemains() > 30 or V < 16) then if p(H.BloodFury, nil) then W = 20572; return "blood_fury cds 4" end end if H
    .AncestralCall:IsReady() and a2.Commons.Enabled.Racials and o() and
    (g:BuffUp(H.TrueshotBuff) or H.Trueshot:CooldownRemains() > 30 or V < 16) then if p(H.AncestralCall, nil) then W = 274738; return "ancestral_call cds 6" end end if H
    .Fireblood:IsReady() and a2.Commons.Enabled.Racials and o() and
    (g:BuffUp(H.TrueshotBuff) or H.Trueshot:CooldownRemains() > 30 or V < 9) then if p(H.Fireblood, nil) then W = 273104; return "fireblood cds 8" end end if H
    .LightsJudgment:IsReady() and a2.Commons.Enabled.Racials and o() and g:BuffDown(H.TrueshotBuff) then if p(H.LightsJudgment
    , nil, nil, not h:IsSpellInRange(H.LightsJudgment)) then W = 255647; return "lights_judgment cds 10" end end if a2.Commons
    .Enabled.Potions and o() and u and
    (
    g:BuffUp(H.TrueshotBuff) and not m.GUISettings.General.HoldPotforBL or
        m.GUISettings.General.HoldPotforBL and g:BloodlustUp()) then local am = a1.PotionSelected() if am and
    am:IsReady() then if p(am, nil, nil) then W = 12; return "potion cds 12" end end end end

local function an() if H.SteadyShot:IsCastable() and
    (
    H.SteadyFocus:IsAvailable() and
        (
        T.Count == 1 and g:BuffRemains(H.SteadyFocusBuff) < 5 or
            g:BuffDown(H.SteadyFocusBuff) and g:BuffDown(H.TrueshotBuff) and T.Count ~= 2)) then if p(H.SteadyShot, nil,
    nil, not a0) then W = 56641; return "steady_shot st 2" end end if H.KillShot:IsReady() then if p(H.KillShot, nil, nil
    , not a0) then W = 53351; return "KillShot st 4" end end if H.SerpentSting:IsReady() and g:BuffDown(H.TrueshotBuff) then if a1
    .CastTargetIf(H.SerpentSting, Y, "min", a9, ad, not a0) then return "serpent_sting st 8" end end if H.ExplosiveShot:
    IsReady() then if p(H.ExplosiveShot, nil, nil, not a0) then W = 212431; return "explosive_shot 10" end end if H.DoubleTap
    :IsReady() and (H.RapidFire:CooldownRemains() < g:GCD() or h:HealthPercentage() > 70 or
        not H.Streamline:IsAvailable()) then if p(H.DoubleTap, nil) then W = 260402; return "double_tap st 12" end end if H
    .Stampede:IsCastable() then if p(H.Stampede, nil, nil, not h:IsInRange(30)) then W = 201430; return "stampede st 14" end end if H
    .DeathChakram:IsReady() and a2.Marksmanship.DeathChakram and s then if p(H.DeathChakram, nil, nil, not a0) then W = 325028; return "dark_chakram st 16" end end if H
    .WailingArrow:IsReady() and o() and _ > 1 then if p(H.WailingArrow, nil, nil, not a0) then W = 355589; return "wailing_arrow st 18" end end if H
    .Volley:IsReady() then if p(H.Volley, nil, nil, not a0) then W = 260243; return "volley st 20 " end end if H.RapidFire
    :IsCastable() and
    (H.SurgingShots:IsAvailable() or g:BuffUp(H.DoubleTapBuff) and H.Streamline:IsAvailable() and h:HealthPercentage() <
        70) then if p(H.RapidFire, nil, nil, not a0) then W = 257044; return "rapid_fire st 22" end end if H.Trueshot:
    IsReady() and o() then if p(H.Trueshot, nil) then W = 288613; return "trueshot st 24" end end if H.MultiShot:IsReady()
    and (g:BuffUp(H.BombardmentBuff) and not a7() and _ > 1 or H.Salvo:IsAvailable() and not H.Volley:IsAvailable()) then if p(H
    .MultiShot, nil, nil, not a0) then W = 257620; return "MultiShot trickshots 26" end end if H.AimedShot:IsReady() then if a1
    .CastTargetIf(H.AimedShot, Y, "min", ab, ag, not a0) then return "aimed_shot st 28" end end if H.AimedShot:IsReady() then if a1
    .CastTargetIf(H.AimedShot, Y, "max", ac, ah, not a0) then return "aimed_shot st 30" end end if H.SteadyShot:
    IsCastable() and (H.SteadyFocus:IsAvailable() and g:BuffRemains(H.SteadyFocusBuff) < H.SteadyShot:ExecuteTime() * 2)
    and T.Count ~= 2 then if p(H.SteadyShot, nil, nil, not a0) then W = 56641; return "steady_shot st 32" end end if H.RapidFire
    :IsCastable() then if p(H.RapidFire, nil, nil, not a0) then W = 257044; return "rapid_fire st 34" end end if H.WailingArrow
    :IsReady() and g:BuffDown(H.TrueshotBuff) then if p(H.WailingArrow, nil, nil, not a0) then W = 355589; return "wailing_arrow st 36" end end if H
    .ChimaeraShot:IsReady() and
    (g:BuffUp(H.PreciseShotsBuff) or g:FocusPredicted() > H.ChimaeraShot:Cost() + H.AimedShot:Cost()) then if p(H.ChimaeraShot
    , nil, nil, not a0) then W = 342049; return "chimaera_shot st 38" end end if H.ArcaneShot:IsReady() and
    (g:BuffUp(H.PreciseShotsBuff) or g:FocusPredicted() > H.ArcaneShot:Cost() + H.AimedShot:Cost()) then if p(H.ArcaneShot
    , nil, nil, not a0) then W = 185358; return "arcane_shot st 40" end end if H.BagofTricks:IsReady() and o() and
    a2.Commons.Enabled.Racials and g:BuffDown(H.Trueshot) then if p(H.BagofTricks, nil, nil,
    not h:IsSpellInRange(H.BagofTricks)) then W = 312411; return "bag_of_tricks st 42" end end if H.SteadyShot:
    IsCastable() then if p(H.SteadyShot, nil, nil, not a0) then W = 56641; return "steady_shot st 44" end end end

local function ao() if H.SteadyShot:IsCastable() and
    (H.SteadyFocus:IsAvailable() and T.Count == 1 and g:BuffRemains(H.SteadyFocusBuff) < 8) then if p(H.SteadyShot, nil,
    nil, not a0) then W = 56641; return "steady_shot trickshots 2" end end if H.KillShot:IsReady() and
    g:BuffUp(H.RazorFragmentsBuff) then if p(H.KillShot, nil, nil, not a0) then W = 53351; return "KillShot Razor trickshots 2" end end if H
    .DoubleTap:IsReady() and
    (H.RapidFire:CooldownRemains() < g:GCD() or h:HealthPercentage() > 70 or not H.Streamline:IsAvailable()) then if p(H
    .DoubleTap, nil) then W = 260402; return "double_tap trickshots 4" end end if H.ExplosiveShot:IsReady() then if p(H.ExplosiveShot
    , nil, nil, not a0) then W = 212431; return "explosive_shot trickshots 10" end end if H.FlayedShot:IsReady() and
    PouchofRazorFragmentsEquiped then if p(H.FlayedShot, nil, nil, not a0) then W = 324149; return "Flayed Razor trickshots 2" end end if H
    .TarTrap:IsReady() and
    (SoulForgeEmbersEquipped and H.TarTrap:TimeSinceLastCast() > 60 - g:GCD() - 0.5 and H.Flare:CooldownRemains() <
        g:GCD()) then if p(H.TarTrap, nil, nil, not h:IsInRange(40)) then W = 187698; return "tar_trap soulforge_embers equipped trickshots 6" end end if H
    .Flare:IsReady() and not H.TarTrap:CooldownUp() and SoulForgeEmbersEquipped then if p(H.Flare, nil) then W = 1543; return "flare trickshots 8" end end if H
    .DeathChakram:IsReady() and a2.Marksmanship.DeathChakram and s then if p(H.DeathChakram, nil, nil) then W = 325028; return "dark_chakram trickshots 26" end end if H
    .Stampede:IsReady() then if p(H.Stampede, nil, nil, not h:IsInRange(30)) then W = 201430; return "stampede trickshots 12" end end if H
    .WailingArrow:IsReady() then if p(H.WailingArrow, nil, nil, not a0) then W = 355589; return "wailing_arrow trickshots 13" end end if H
    .SerpentSting:IsReady() then if a1.CastTargetIf(H.SerpentSting, Y, "min", a9, ae, not a0) then return "serpent_sting trickshots 16" end end if H
    .Barrage:IsReady() and _ > 7 then if p(H.Barrage, nil, nil, not a0) then W = 120360; return "barrage trickshots 18" end end if H
    .Volley:IsReady() then if p(H.Volley, nil) then W = 260243; return "volley trickshots 16" end end if H.Trueshot:
    IsReady() and o() then if p(H.Trueshot, nil, nil, not a0) then W = 288613; return "trueshot trickshots 20" end end if H
    .RapidFire:IsCastable() and
    (
    g:BuffRemains(H.TrickShotsBuff) >= H.RapidFire:ExecuteTime() and
        (
        H.SurgingShots:IsAvailable() or
            g:BuffUp(H.DoubleTapBuff) and H.Streamline:IsAvailable() and h:HealthPercentage() < 70)) then if p(H.RapidFire
    , nil, nil, not a0) then W = 257044; return "rapid_fire trickshots 22" end end if H.AimedShot:IsReady() then if a1.CastTargetIf(H
    .AimedShot, Y, "min", ab, ai, not a0) then return "aimed_shot trickshots 26" end end if H.AimedShot:IsReady() then if a1
    .CastTargetIf(H.AimedShot, Y, "max", ac, aj, not a0) then return "aimed_shot trickshots 28" end end if H.RapidFire:
    IsCastable() and g:BuffRemains(H.TrickShotsBuff) >= H.RapidFire:ExecuteTime() then if p(H.RapidFire, nil, nil, not a0) then W = 257044; return "rapid_fire trickshots 28" end end if H
    .ChimaeraShot:IsReady() and
    (
    g:BuffUp(H.TrickShotsBuff) and g:BuffUp(H.PreciseShotsBuff) and
        g:FocusPredicted() > H.ChimaeraShot:Cost() + H.AimedShot:Cost() and _ < 4) then if p(H.ChimaeraShot, nil, nil,
    not a0) then W = 342049; return "chimaera_shot trickshots 32" end end if H.MultiShot:IsReady() and
    (
    not a7() or
        (g:BuffUp(H.PreciseShotsBuff) or g:BuffStack(H.BulletstormBuff) == 10) and
        g:FocusPredicted() > H.MultiShot:Cost() + H.AimedShot:Cost()) then if p(H.MultiShot, nil, nil, not a0) then W = 257620; return "MultiShot trickshots 30" end end if H
    .SerpentSting:IsReady() then if a1.CastTargetIf(H.SerpentSting, Y, "min", a9, af, not a0) then return "serpent_sting trickshots 36" end end if H
    .KillShot:IsReady() and g:FocusPredicted() > H.KillShot:Cost() + H.AimedShot:Cost() then if p(H.KillShot, nil, nil,
    not a0) then W = 53351; return "kill_shot trickshots 35" end end if H.MultiShot:IsReady() and
    g:FocusPredicted() > H.MultiShot:Cost() + H.AimedShot:Cost() then if p(H.MultiShot, nil, nil, not a0) then W = 257620; return "MultiShot trickshots 42" end end if H
    .BagofTricks:IsReady() and o() and a2.Commons.Enabled.Racials and g:BuffDown(H.Trueshot) then if p(H.BagofTricks, nil
    , nil, not h:IsSpellInRange(H.BagofTricks)) then W = 312411; return "bag_of_tricks st 42" end end if H.SteadyShot:
    IsCastable() then if p(H.SteadyShot, nil, nil, not a0) then W = 56641; return "steady_shot trickshots 46" end end end

local function ap() t = HeroRotationCharDB.Toggles[6]
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
C = HeroRotationCharDB.Toggles[171]
HoldMD = HeroRotationCharDB.Toggles[125]
D = HeroRotationCharDB.Toggles[142]
E = HeroRotationCharDB.Toggles[17]
O = GetInventoryItemID("player", 13)
Q = GetInventoryItemID("player", 14)
if not a2.Commons.Enabled.TopTrinket and not a2.Commons.Enabled.BotTrinket then K = { O, Q } elseif not
    a2.Commons.Enabled.TopTrinket and a2.Commons.Enabled.BotTrinket then K = { O } elseif not
    a2.Commons.Enabled.BotTrinket and a2.Commons.Enabled.TopTrinket then K = { Q } elseif not
    a2.Commons.Enabled.BotTrinket and not a2.Commons.Enabled.TopTrinket then K = {} end end

local function aq() a0 = h:IsSpellInRange(H.AimedShot)
Y = g:GetEnemiesInRange(H.AimedShot.MaximumRange)
Z = h:GetEnemiesInSplashRange(10)
O, P = GetInventoryItemID("player", 13)
Q, P = GetInventoryItemID("player", 14)
if n() then _ = #Z else _ = 1 end if w then _ = 10 end if a1.TargetIsValid() or g:AffectingCombat() then U = d.BossFightRemains(nil
    , true)
V = U;
if V == 11111 then V = d.FightRemains(Z, false) end end if not BotOn then X = 0;
W = 0
end if X > 0 then X = 0 end if W > 0 then W = 0 end ap() if m.GUISettings.General.OpenerReset > 0 and
    not HeroRotationCharDB.Toggles[6] then starttime = GetTime()
endtime = starttime + m.GUISettings.General.OpenerReset
elseif m.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6
    ] then HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6] m.ToggleIconFrame:UpdateButtonText(6) m.Print("Opener is now "
    .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r.")) end if g:BuffUp(j(5384)) then return false end if m
    .QueuedCast() then W = m.QueuedCast() return "Custom Queue " .. j(W):ID() end if x and H.Bindingshot:IsAvailable()
    and H.Bindingshot:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(H.Bindingshot, nil, nil, nil) then W = 109248; return "queue Binding Shot" end elseif (
    not H.Bindingshot:IsUsableP() or H.Bindingshot:CooldownRemains() > 0) and x then HeroRotationCharDB.Toggles[120] = not
    HeroRotationCharDB.Toggles[120] m.Print("Binding Shot Queue is now " ..
    (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if y and
    H.FreezingTrap:IsAvailable() and H.FreezingTrap:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(H.FreezingTrap,
    nil, nil, nil) then W = 187650; return "queue Freezing Trap" end elseif (
    not H.FreezingTrap:IsUsableP() or H.FreezingTrap:CooldownRemains() > 0) and y then HeroRotationCharDB.Toggles[121] = not
    HeroRotationCharDB.Toggles[121] m.Print("Freezing Trap Queue is now " ..
    (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if A and H.Flare:IsAvailable() and
    H.Flare:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(H.Flare, nil, nil, nil) then W = 1543; return "queue Flare" end elseif (
    not H.Flare:IsUsableP() or H.Flare:CooldownRemains() > 0) and A then HeroRotationCharDB.Toggles[123] = not
    HeroRotationCharDB.Toggles[123] m.Print("Flare Queue is now " ..
    (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if B and H.TarTrap:IsAvailable()
    and H.TarTrap:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(H.TarTrap, nil, nil, nil) then W = 187698; return "queue TarTrap" end elseif (
    not H.TarTrap:IsUsableP() or H.TarTrap:CooldownRemains() > 0) and B then HeroRotationCharDB.Toggles[124] = not
    HeroRotationCharDB.Toggles[124] m.Print("Tar Trap Queue is now " ..
    (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if C and
    H.DeathChakram:IsAvailable() and H.DeathChakram:CooldownRemains(BypassRecovery) <= 0 then if m.Cast(H.DeathChakram,
    nil, nil, nil) then W = 325028; return "queue Death Chakram" end elseif (
    not H.DeathChakram:IsUsableP() or H.DeathChakram:CooldownRemains() > 0) and C then HeroRotationCharDB.Toggles[171] = not
    HeroRotationCharDB.Toggles[171] m.Print("Death Chakram Queue is now " ..
    (HeroRotationCharDB.Toggles[171] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if H.Exhilaration:IsCastable() and
    g:HealthPercentage() <= a2.Commons.ExhilarationHP then if p(H.Exhilaration, nil) then W = 109304; return "Exhilaration" end end if g
    :HealthPercentage() < a2.Commons.HealthstoneHP and I.Healthstone:IsReady() and I.Healthstone:CooldownRemains() <= 0 then if m
    .Cast(I.Healthstone, nil) then W = 40; return "Healthstone HP" end end if g:HealthPercentage() < a2.Commons.HealPotHP
    and I.CosmicHealPot:IsReady() and I.CosmicHealPot:CooldownRemains() <= 0 then if m.Cast(I.CosmicHealPot, nil) then W = 45; return "CosmicHealPot HP" end end if g
    :HealthPercentage() < a2.Commons.HealPotHP and I.HealPot:IsReady() and I.HealPot:CooldownRemains() <= 0 then if m.Cast(I
    .HealPot, nil) then W = 41; return "HealPot HP" end end if H.AspectoftheTurtle:IsCastable() and
    g:HealthPercentage() <= a2.Commons.TurtleHP then if p(H.AspectoftheTurtle, nil) then W = 186265; return "AspectoftheTurtle" end end if UnitExists("mouseover")
    and string.find(UnitGUID("mouseover"), 120651) then if H.ArcaneShot:IsCastable() and f("mouseover"):IsInMeleeRange(8) then if p(H
    .ArcaneShot, nil) then X = 1185358; return "explosive MO AS" end end end if UnitExists("target") and
    string.find(UnitGUID("target"), 120651) then if H.ArcaneShot:IsCastable() and h:IsInMeleeRange(8) then if p(H.ArcaneShot
    , nil) then W = 185358; return "explosive  SWD" end end end if not g:AffectingCombat() and a1.TargetIsValid() and t then local ar = ak() if ar then return ar end end if a1
    .TargetIsValid() and g:AffectingCombat() and (h:AffectingCombat() or h:IsDummy() or h:NPCID() == 153285) then a8() local as = g
    :GetUseableTrinkets(K, 13) if as and (not as:TrinketHasUseBuff() or g:BuffUp(H.TrueshotBuff)) then if p(as, nil, nil) then W = 24; return "trinket1 main 2" end end local at = g
    :GetUseableTrinkets(K, 14) if at and a2.Commons.Enabled.BottomTrinket and
    (not at:TrinketHasUseBuff() or g:BuffUp(H.TrueshotBuff)) then if p(at, nil, nil) then W = 25; return "trinket2 main 4" end end if as
    or at then local au = as or at; if m.Cast(au, nil, nil) then if au:ID() == O and a2.Commons.Enabled.TopTrinket then W = 24; return "Generic use_items for "
    .. au:Name() elseif au:ID() == Q and a2.Commons.Enabled.BottomTrinket then W = 25; return "Generic use_items for " ..
    au:Name() end end end if true then local ar = al() if ar then return ar end end if _ < 3 or
    not H.TrickShots:IsAvailable() then local ar = an() if ar then return ar end end if _ > 2 then local ar = ao() if ar then return ar end end if m
    .CastAnnotated(H.PoolFocus, false, "WAIT") then W = 9999999; return "Pooling Focus" end end end

local function av() m.Print("Marksmanship Hunter rotation is currently a work in progress.") end

function ReturnSpell() if W == 0 then return 0 else return W end end

function ReturnSpellMO() if X == 0 then return 0 else return X end end

m.SetAPL(254, aq, av)
