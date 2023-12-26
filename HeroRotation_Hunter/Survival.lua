local a, b = ...
local c = HeroLib; local d = HeroCache; local e = c.Unit; local f = e.Player; local g = e.Target; local h = e.Pet; local i =
c.Spell; local j = c.MultiSpell; local k = c.Item; local l = HeroRotation; local m = l.AoEON; local n = l.CDsON; local o =
l.Cast; local p = l.CastSuggested; local q = HeroRotationCharDB.Toggles[4]
local r = HeroRotationCharDB.Toggles[5]
local s = HeroRotationCharDB.Toggles[12]
local t = not HeroRotationCharDB.Toggles[15]
local u = HeroRotationCharDB.Toggles[120]
local v = HeroRotationCharDB.Toggles[121]
local w = HeroRotationCharDB.Toggles[122]
local x = HeroRotationCharDB.Toggles[123]
local y = HeroRotationCharDB.Toggles[124]
local z = HeroRotationCharDB.Toggles[125]
local A = HeroRotationCharDB.Toggles[140]
local B = HeroRotationCharDB.Toggles[141]
local C = HeroRotationCharDB.Toggles[142]
local D = false; local E = false; local F = false; local G = false; local H = 0; local I = false; local J = 0; local K = false; local L = { 355782, 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 343470, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426 }
local M = f:GetEquipment()
local N = k(0)
local O = k(0)
local P = GetInventoryItemID("player", 13)
local Q = GetInventoryItemID("player", 14)
if M[13] then N = k(M[13]) end; if M[14] then O = k(M[14]) end; local R = l.Commons.Everyone; local S = { General = l
.GUISettings.General, Commons = l.GUISettings.APL.Hunter.Commons, Commons2 = l.GUISettings.APL.Hunter.Commons2, Survival =
l.GUISettings.APL.Hunter.Survival }
local T = i.Hunter.Survival; local U = k.Hunter.Survival; local V = { U.AlgetharPuzzleBox:ID(), U.Djaruun:ID(), U
    .ManicGrieftorch:ID() }
local W = { T.SummonPet, T.SummonPet2, T.SummonPet3, T.SummonPet4, T.SummonPet5 }
local X, Y; local Z = T.MongooseBite:IsAvailable() and T.MongooseBite:Cost() or T.RaptorStrike:Cost()
local _; local a0; local a1 = 0; local a2 = 0; local W = { T.SummonPet, T.SummonPet2, T.SummonPet3, T.SummonPet4, T
    .SummonPet5 }
local X, Y; local a3 = 11111; local a4 = 11111; local Z = T.MongooseBite:IsAvailable() and T.MongooseBite:Cost() or
T.RaptorStrike:Cost()
local a5 = 5; c:RegisterForEvent(
function() Z = T.MongooseBite:IsAvailable() and T.MongooseBite:Cost() or T.RaptorStrike:Cost() end, "SPELLS_CHANGED",
    "LEARNED_SPELL_IN_TAB")
c:RegisterForEvent(function()
    a3 = 11111; a4 = 11111
end, "PLAYER_REGEN_ENABLED")
local a6 = { { T.Intimidation, "Cast Intimidation (Interrupt)", function() return true end } }
local a7 = { T.WildfireBomb, T.ShrapnelBomb, T.PheromoneBomb, T.VolatileBomb }
local a8 = { T.WildfireBombDebuff, T.ShrapnelBombDebuff, T.PheromoneBombDebuff, T.VolatileBombDebuff }
local function a9(aa)
    local a9 = 0; if aa ~= nil then for ab in pairs(aa) do
            local ac = aa[ab]
            if ac:IsInMeleeRange(40) and (ac:AffectingCombat() or ac:IsDummy() or ac:NPCID() == 153285) and ac:DebuffUp(i(257284)) then a9 =
                a9 + 1 end
        end end; return a9
end; local function ad() if T.ShrapnelBomb:TimeSinceLastCast() < 0.5 or T.PheromoneBomb:TimeSinceLastCast() < 0.5 or T.VolatileBomb:TimeSinceLastCast() < 0.5 or T.WildfireBomb:TimeSinceLastCast() < 0.5 or B then return true else return false end end; local function ae(
    af) return af:DebuffRemains(T.SerpentStingDebuff) end; local function ag(af) return af:DebuffRemains(T
    .BloodseekerDebuff) end; local function ah(af) return af:DebuffStack(T.LatentPoisonDebuff) end; local function ai(af) return
    af:HealthPercentage() end; local function aj(af) if (af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff) and f:BuffRemains(T.VipersVenomBuff) < f:GCD()) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259491; return true
    elseif (af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff) and f:BuffRemains(T.VipersVenomBuff) < f:GCD()) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.SerpantStingTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff) and f:BuffRemains(T.VipersVenomBuff) < f:GCD()) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259491; return true
    elseif (af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff) and f:BuffRemains(T.VipersVenomBuff) < f:GCD()) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function ak(
    af) if (af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259491; return true
    elseif (af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.SerpantStingTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259491; return true
    elseif (af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function al(
    af) if af:DebuffRefreshable(T.SerpentStingDebuff) and T.HydrasBite:IsAvailable() and af:TimeToDie() > 8 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259491; return true
    elseif af:DebuffRefreshable(T.SerpentStingDebuff) and T.HydrasBite:IsAvailable() and af:TimeToDie() > 8 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.SerpantStingTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif af:DebuffRefreshable(T.SerpentStingDebuff) and T.HydrasBite:IsAvailable() and af:TimeToDie() > 8 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259491; return true
    elseif af:DebuffRefreshable(T.SerpentStingDebuff) and T.HydrasBite:IsAvailable() and af:TimeToDie() > 8 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function am(
    af) if af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 8 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259491; return true
    elseif af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 8 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.SerpantStingTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 8 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259491; return true
    elseif af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 8 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function an(
    af) if T.KillCommand:FullRechargeTime() < f:GCD() and CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259489; return true
    elseif T.KillCommand:FullRechargeTime() < f:GCD() and CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif T.KillCommand:FullRechargeTime() < f:GCD() and CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259489; return true
    elseif T.KillCommand:FullRechargeTime() < f:GCD() and CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function ao(
    af) if T.KillCommand:FullRechargeTime() < f:GCD() and CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259489; return true
    elseif T.KillCommand:FullRechargeTime() < f:GCD() and CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif T.KillCommand:FullRechargeTime() < f:GCD() and CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259489; return true
    elseif T.KillCommand:FullRechargeTime() < f:GCD() and CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function ap(
    af) if CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259489; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259489; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and TargetInRangePet30y and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function aq(
    af) if (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259489; return true
    elseif (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259489; return true
    elseif af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1") then return true end end; local function ar(
    af) if (f:BuffStack(T.TipoftheSpearBuff) == 3 or af:DebuffUp(T.ShrapnelBombDebuff)) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1186270; return true
    elseif (f:BuffStack(T.TipoftheSpearBuff) == 3 or af:DebuffUp(T.ShrapnelBombDebuff)) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (f:BuffStack(T.TipoftheSpearBuff) == 3 or af:DebuffUp(T.ShrapnelBombDebuff)) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 186270; return true
    elseif (f:BuffStack(T.TipoftheSpearBuff) == 3 or af:DebuffUp(T.ShrapnelBombDebuff)) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function as(
    af) if (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259387; return true
    elseif (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and af:GUID() == g:GUID() then
        a1 = 259387; return true
    elseif (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) then return true end end; local function at(
    af) if (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1186270; return true
    elseif (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and af:GUID() == g:GUID() then
        a1 = 186270; return true
    elseif (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) then return true end end; local function au(
    af) if (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1324149; return true
    elseif (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and af:GUID() == g:GUID() then
        a1 = 324149; return true
    elseif (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) then return true end end; local function av(
    af) if T.AlphaPredator:IsAvailable() and (f:BuffUp(T.MongooseFuryBuff) and f:BuffRemains(T.MongooseFuryBuff) < f:Focus() / (Z - f:FocusCastRegen(T.MongooseBite:ExecuteTime())) * f:GCD() and af:DebuffDown(T.WildSpiritsDebuff) or f:BuffRemains(T.MongooseFuryBuff) and T.PheromoneBomb:IsCastable()) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259387; return true
    elseif T.AlphaPredator:IsAvailable() and (f:BuffUp(T.MongooseFuryBuff) and f:BuffRemains(T.MongooseFuryBuff) < f:Focus() / (Z - f:FocusCastRegen(T.MongooseBite:ExecuteTime())) * f:GCD() and af:DebuffDown(T.WildSpiritsDebuff) or f:BuffRemains(T.MongooseFuryBuff) and T.PheromoneBomb:IsCastable()) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif T.AlphaPredator:IsAvailable() and (f:BuffUp(T.MongooseFuryBuff) and f:BuffRemains(T.MongooseFuryBuff) < f:Focus() / (Z - f:FocusCastRegen(T.MongooseBite:ExecuteTime())) * f:GCD() and af:DebuffDown(T.WildSpiritsDebuff) or f:BuffRemains(T.MongooseFuryBuff) and T.PheromoneBomb:IsCastable()) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259387; return true
    elseif T.AlphaPredator:IsAvailable() and (f:BuffUp(T.MongooseFuryBuff) and f:BuffRemains(T.MongooseFuryBuff) < f:Focus() / (Z - f:FocusCastRegen(T.MongooseBite:ExecuteTime())) * f:GCD() and af:DebuffDown(T.WildSpiritsDebuff) or f:BuffRemains(T.MongooseFuryBuff) and T.PheromoneBomb:IsCastable()) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function aw(
    af) if (f:BuffUp(T.MongooseFuryBuff) or f:Focus() + f:FocusCastRegen(T.MongooseBite:ExecuteTime()) > f:FocusMax() - 15 or af:DebuffUp(T.ShrapnelBombDebuff) or af:DebuffRemains(T.WildSpiritsDebuff)) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259387; return true
    elseif (f:BuffUp(T.MongooseFuryBuff) or f:Focus() + f:FocusCastRegen(T.MongooseBite:ExecuteTime()) > f:FocusMax() - 15 or af:DebuffUp(T.ShrapnelBombDebuff) or af:DebuffRemains(T.WildSpiritsDebuff)) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (f:BuffUp(T.MongooseFuryBuff) or f:Focus() + f:FocusCastRegen(T.MongooseBite:ExecuteTime()) > f:FocusMax() - 15 or af:DebuffUp(T.ShrapnelBombDebuff) or af:DebuffRemains(T.WildSpiritsDebuff)) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259387; return true
    elseif (f:BuffUp(T.MongooseFuryBuff) or f:Focus() + f:FocusCastRegen(T.MongooseBite:ExecuteTime()) > f:FocusMax() - 15 or af:DebuffUp(T.ShrapnelBombDebuff) or af:DebuffRemains(T.WildSpiritsDebuff)) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function ax(
    af) if f:BuffUp(T.VipersVenomBuff) and (f:BuffRemains(T.VipersVenomBuff) < f:GCD() or af:DebuffRefreshable(T.SerpentStingDebuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259491; return true
    elseif f:BuffUp(T.VipersVenomBuff) and (f:BuffRemains(T.VipersVenomBuff) < f:GCD() or af:DebuffRefreshable(T.SerpentStingDebuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.SerpantStingTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif f:BuffUp(T.VipersVenomBuff) and (f:BuffRemains(T.VipersVenomBuff) < f:GCD() or af:DebuffRefreshable(T.SerpentStingDebuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259491; return true
    elseif f:BuffUp(T.VipersVenomBuff) and (f:BuffRemains(T.VipersVenomBuff) < f:GCD() or af:DebuffRefreshable(T.SerpentStingDebuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function ay(
    af) if (CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and f:BuffUp(T.NessingwarysTrappingBuff) or f:Focus() + f:FocusCastRegen(T.KillCommand:ExecuteTime()) < f:FocusMax() + 10 and f:BuffUp(T.NessingwarysTrappingBuff) and f:BuffRemains(T.NessingwarysTrappingBuff) < f:GCD()) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259489; return true
    elseif (CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and f:BuffUp(T.NessingwarysTrappingBuff) or f:Focus() + f:FocusCastRegen(T.KillCommand:ExecuteTime()) < f:FocusMax() + 10 and f:BuffUp(T.NessingwarysTrappingBuff) and f:BuffRemains(T.NessingwarysTrappingBuff) < f:GCD()) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and f:BuffUp(T.NessingwarysTrappingBuff) or f:Focus() + f:FocusCastRegen(T.KillCommand:ExecuteTime()) < f:FocusMax() + 10 and f:BuffUp(T.NessingwarysTrappingBuff) and f:BuffRemains(T.NessingwarysTrappingBuff) < f:GCD()) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259489; return true
    elseif (CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and f:BuffUp(T.NessingwarysTrappingBuff) or f:Focus() + f:FocusCastRegen(T.KillCommand:ExecuteTime()) < f:FocusMax() + 10 and f:BuffUp(T.NessingwarysTrappingBuff) and f:BuffRemains(T.NessingwarysTrappingBuff) < f:GCD()) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function az(
    af) if CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and (not NessingwarysTrappingEquipped or f:Focus() < Z) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259489; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and (not NessingwarysTrappingEquipped or f:Focus() < Z) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and (not NessingwarysTrappingEquipped or f:Focus() < Z) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259489; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and (not NessingwarysTrappingEquipped or f:Focus() < Z) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function aA(
    af)
    local aB = CheckFocusCap(T.KillCommand:ExecuteTime(), 15)
    local aC = f:FocusCastRegen(T.KillCommand:ExecuteTime())
    local aD = f:Focus()
    local aE = f:GCD()
    local aF = T.FreezingTrap:CooldownRemains() > f:Focus() / (Z - aC) * aE; local aG = T.TarTrap:CooldownRemains() >
    f:Focus() / (Z - aC) * aE; local aH = T.SteelTrap:IsAvailable() and T.SteelTrap:CooldownRemains() >
    f:Focus() / (Z - aC) * aE; if aB and NessingwarysTrappingEquipped and aF and aG and (not T.SteelTrap:IsAvailable() or aH) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259489; return true
    elseif aB and NessingwarysTrappingEquipped and aF and aG and (not T.SteelTrap:IsAvailable() or aH) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif aB and NessingwarysTrappingEquipped and aF and aG and (not T.SteelTrap:IsAvailable() or aH) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259489; return true
    elseif aB and NessingwarysTrappingEquipped and aF and aG and (not T.SteelTrap:IsAvailable() or aH) and (TargetInRangePet30y or not PetRangeAbility) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end
end; local function aI(af) if f:BuffUp(T.CoordinatedAssault) and f:BuffRemains(T.CoordinatedAssault) < 1.5 * f:GCD() and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1186270; return true
    elseif f:BuffUp(T.CoordinatedAssault) and f:BuffRemains(T.CoordinatedAssault) < 1.5 * f:GCD() and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif f:BuffUp(T.CoordinatedAssault) and f:BuffRemains(T.CoordinatedAssault) < 1.5 * f:GCD() and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 186270; return true
    elseif f:BuffUp(T.CoordinatedAssault) and f:BuffRemains(T.CoordinatedAssault) < 1.5 * f:GCD() and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function aJ(
    af) if f:BuffUp(T.CoordinatedAssault) and f:BuffRemains(T.CoordinatedAssault) < 1.5 * f:GCD() and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259387; return true
    elseif f:BuffUp(T.CoordinatedAssault) and f:BuffRemains(T.CoordinatedAssault) < 1.5 * f:GCD() and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif f:BuffUp(T.CoordinatedAssault) and f:BuffRemains(T.CoordinatedAssault) < 1.5 * f:GCD() and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259387; return true
    elseif f:BuffUp(T.CoordinatedAssault) and f:BuffRemains(T.CoordinatedAssault) < 1.5 * f:GCD() and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function aK(
    af) if T.AlphaPredator:IsAvailable() and (f:BuffUp(T.MongooseFuryBuff) and f:BuffRemains(T.MongooseFuryBuff) < f:Focus() / (Z - f:FocusCastRegen(T.MongooseBite:ExecuteTime())) * f:GCD()) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259387; return true
    elseif T.AlphaPredator:IsAvailable() and (f:BuffUp(T.MongooseFuryBuff) and f:BuffRemains(T.MongooseFuryBuff) < f:Focus() / (Z - f:FocusCastRegen(T.MongooseBite:ExecuteTime())) * f:GCD()) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif T.AlphaPredator:IsAvailable() and (f:BuffUp(T.MongooseFuryBuff) and f:BuffRemains(T.MongooseFuryBuff) < f:Focus() / (Z - f:FocusCastRegen(T.MongooseBite:ExecuteTime())) * f:GCD()) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259387; return true
    elseif T.AlphaPredator:IsAvailable() and (f:BuffUp(T.MongooseFuryBuff) and f:BuffRemains(T.MongooseFuryBuff) < f:Focus() / (Z - f:FocusCastRegen(T.MongooseBite:ExecuteTime())) * f:GCD()) and (af:IsInMeleeRange(8) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function aL(
    af) if (af:DebuffRefreshable(T.SerpentStingDebuff) and f:BuffDown(T.CoordinatedAssault) or T.AlphaPredator:IsAvailable() and af:DebuffRefreshable(T.SerpentStingDebuff) and not f:BuffUp(T.MongooseFuryBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259491; return true
    elseif (af:DebuffRefreshable(T.SerpentStingDebuff) and f:BuffDown(T.CoordinatedAssault) or T.AlphaPredator:IsAvailable() and af:DebuffRefreshable(T.SerpentStingDebuff) and not f:BuffUp(T.MongooseFuryBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.SerpantStingTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (af:DebuffRefreshable(T.SerpentStingDebuff) and f:BuffDown(T.CoordinatedAssault) or T.AlphaPredator:IsAvailable() and af:DebuffRefreshable(T.SerpentStingDebuff) and not f:BuffUp(T.MongooseFuryBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259491; return true
    elseif (af:DebuffRefreshable(T.SerpentStingDebuff) and f:BuffDown(T.CoordinatedAssault) or T.AlphaPredator:IsAvailable() and af:DebuffRefreshable(T.SerpentStingDebuff) and not f:BuffUp(T.MongooseFuryBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function aM(
    af) if CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and T.KillCommand:FullRechargeTime() < f:GCD() and (NessingwarysTrappingEquipped and not T.FreezingTrap:CooldownUp() and not T.TarTrap:CooldownUp() or not NessingwarysTrappingEquipped) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259489; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and T.KillCommand:FullRechargeTime() < f:GCD() and (NessingwarysTrappingEquipped and not T.FreezingTrap:CooldownUp() and not T.TarTrap:CooldownUp() or not NessingwarysTrappingEquipped) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and T.KillCommand:FullRechargeTime() < f:GCD() and (NessingwarysTrappingEquipped and not T.FreezingTrap:CooldownUp() and not T.TarTrap:CooldownUp() or not NessingwarysTrappingEquipped) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259489; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and T.KillCommand:FullRechargeTime() < f:GCD() and (NessingwarysTrappingEquipped and not T.FreezingTrap:CooldownUp() and not T.TarTrap:CooldownUp() or not NessingwarysTrappingEquipped) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function aN(
    af) if af:DebuffUp(T.PheromoneBombDebuff) and f:HasTier(28, 2) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259489; return true
    elseif af:DebuffUp(T.PheromoneBombDebuff) and f:HasTier(28, 2) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif af:DebuffUp(T.PheromoneBombDebuff) and f:HasTier(28, 2) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259489; return true
    elseif af:DebuffUp(T.PheromoneBombDebuff) and f:HasTier(28, 2) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function aO(
    af) if CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and (NessingwarysTrappingEquipped and not T.FreezingTrap:CooldownUp() and not T.TarTrap:CooldownUp() or not NessingwarysTrappingEquipped) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259489; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and (NessingwarysTrappingEquipped and not T.FreezingTrap:CooldownUp() and not T.TarTrap:CooldownUp() or not NessingwarysTrappingEquipped) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.KillCommandTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and (NessingwarysTrappingEquipped and not T.FreezingTrap:CooldownUp() and not T.TarTrap:CooldownUp() or not NessingwarysTrappingEquipped) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259489; return true
    elseif CheckFocusCap(T.KillCommand:ExecuteTime(), 15) and (NessingwarysTrappingEquipped and not T.FreezingTrap:CooldownUp() and not T.TarTrap:CooldownUp() or not NessingwarysTrappingEquipped) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function aP(
    af) if af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 15 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259491; return true
    elseif af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 15 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.SerpantStingTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 15 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259491; return true
    elseif af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 15 and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function CheckFocusCap(
    aQ, aR)
    local aS = aR or 0; return f:Focus() + f:FocusCastRegen(aQ) + aS < f:FocusMax()
end; local function ae(af) return af:DebuffRemains(T.SerpentStingDebuff) end; local function aT(af) return af
    :DebuffRemains(T.BloodseekerDebuff) end; local function aU(af) return af:DebuffStack(T.LatentPoisonDebuff) end; local function ap(
    af) return T.KillCommand:FullRechargeTime() < f:GCD() and CheckFocusCap(T.KillCommand:ExecuteTime(), 21) and
    (T.FlankingStrike:CooldownDown() or not T.FlankingStrike:IsAvailable()) end; local function aV(af) return af
    :DebuffStack(T.LatentPoisonDebuff) > 8 end; local function aj(af) if (af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff) and f:BuffRemains(T.VipersVenomBuff) < f:GCD()) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259491; return true
    elseif (af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff) and f:BuffRemains(T.VipersVenomBuff) < f:GCD()) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.SerpantStingTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff) and f:BuffRemains(T.VipersVenomBuff) < f:GCD()) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259491; return true
    elseif (af:DebuffDown(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff) and f:BuffRemains(T.VipersVenomBuff) < f:GCD()) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function ak(
    af) if (af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == e("mouseover"):GUID() then
        a2 = 1259491; return true
    elseif (af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and S.Survival.SerpantStingTargetSwap == "AutoSwap" and af:GUID() ~= g:GUID() and not s then
        a2 = 999; return true
    elseif (af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) and af:GUID() == g:GUID() then
        a1 = 259491; return true
    elseif (af:DebuffRefreshable(T.SerpentStingDebuff) and af:TimeToDie() > 7 or f:BuffUp(T.VipersVenomBuff)) and (af:IsInMeleeRange(S.Survival.SerpantStingRange) or EagleUp and af:IsInMeleeRange(15)) and (af:AffectingCombat() or af:IsDummy() or af:NPCID() == 153285 or af:NPCID() == 168326 or UnitExists("boss1")) then return true end end; local function aW()
    if T.Harpoon:IsCastable() and (f:BuffDown(T.AspectoftheEagle) or not g:IsInRange(30)) then if o(T.Harpoon, nil, nil, not g:IsSpellInRange(T.Harpoon)) then
            a1 = 190925; return "harpoon precombat 6"
        end end; if g:IsInMeleeRange(a5) or f:BuffUp(T.AspectoftheEagle) and g:IsInRange(40) then if T.MongooseBite:IsReady() then if o(T.MongooseBite) then
                a1 = 259387; return "mongoose_bite precombat 8"
            end elseif T.RaptorStrike:IsReady() then if o(T.RaptorStrike) then
                a1 = 186270; return "raptor_strike precombat 10"
            end end end
end; local function aX()
    if T.BloodFury:IsCastable() and (f:BuffUp(T.CoordinatedAssaultBuff) or f:BuffUp(T.SpearheadBuff) or not T.Spearhead:IsAvailable() and not T.CoordinatedAssault:IsAvailable()) then if o(T.BloodFury, nil) then
            a1 = 20572; return "blood_fury cds 2"
        end end; if T.Harpoon:IsCastable() and (T.TermsofEngagement:IsAvailable() and f:Focus() < f:FocusMax()) then if o(T.Harpoon, nil, nil, not g:IsSpellInRange(T.Harpoon)) then
            a1 = 190925; return "harpoon cds 4"
        end end; if f:BuffUp(T.CoordinatedAssaultBuff) or f:BuffUp(T.SpearheadBuff) or not T.Spearhead:IsAvailable() and not T.CoordinatedAssault:IsAvailable() then
        if T.AncestralCall:IsCastable() then if o(T.AncestralCall, nil) then
                a1 = 274738; return "ancestral_call cds 6"
            end end; if T.Fireblood:IsCastable() then if o(T.Fireblood, nil) then
                a1 = 265221; return "fireblood cds 8"
            end end
    end; if T.LightsJudgment:IsCastable() then if o(T.LightsJudgment, nil, nil, not g:IsSpellInRange(T.LightsJudgment)) then
            a1 = 255647; return "lights_judgment cds 10"
        end end; if T.BagofTricks:IsCastable() and T.KillCommand:FullRechargeTime() > f:GCD() then if o(T.BagofTricks, nil, nil, not g:IsSpellInRange(T.BagofTricks)) then
            a1 = 312411; return "bag_of_tricks cds 12"
        end end; if T.Berserking:IsCastable() and (f:BuffUp(T.CoordinatedAssaultBuff) or f:BuffUp(T.SpearheadBuff) or not T.Spearhead:IsAvailable() and not T.CoordinatedAssault:IsAvailable() or a4 < 13) then if o(T.Berserking, nil) then
            a1 = 26297; return "berserking cds 14"
        end end; if S.Commons.Enabled.Potions and n() and t and ((a4 < 30 or f:BuffUp(T.CoordinatedAssault) or f:BuffUp(T.SpearheadBuff) or not T.Spearhead:IsAvailable() and not T.CoordinatedAssault:IsAvailable()) and not l.GUISettings.General.HoldPotforBL or l.GUISettings.General.HoldPotforBL and f:BloodlustUp()) then
        local aY = R.PotionSelected()
        if aY and aY:IsReady() then if o(aY, nil, nil) then
                a1 = 50; return "potion cooldowns 2"
            end end
    end; local aZ = f:GetUseableTrinkets(V, 13)
    if aZ and (not aZ:TrinketHasUseBuff() or f:BuffUp(T.TrueshotBuff)) then if o(aZ, nil, nil) then
            a1 = 24; return "trinket1 main 2"
        end end; local a_ = f:GetUseableTrinkets(V, 14)
    if a_ and S.Commons.Enabled.BottomTrinket and (not a_:TrinketHasUseBuff() or f:BuffUp(T.TrueshotBuff)) then if o(a_, nil, nil) then
            a1 = 25; return "trinket2 main 4"
        end end; if aZ or a_ then
        local b0 = aZ or a_; if l.Cast(b0, nil, nil) then if b0:ID() == P and S.Commons.Enabled.TopTrinket then
                a1 = 24; return "Generic use_items for " .. b0:Name()
            elseif b0:ID() == Q and S.Commons.Enabled.BottomTrinket then
                a1 = 60; return "Generic use_items for " .. b0:Name()
            end end
    end; if T.AspectoftheEagle:IsCastable() and S.Survival.AspectOfTheEagle and not g:IsInRange(a5) then if o(T.AspectoftheEagle, nil) then
            a1 = 186289; return "aspect_of_the_eagle cds 22"
        end end
end; local function b1()
    if T.KillShot:IsReady() and ((f:BuffUp(T.CoordinatedAssaultEmpowerBuff) or S.Survival.CAKSMacro and f:BuffUp(T.CoordinatedAssaultBuff) and (T.Bite:IsReady() or T.Claw:IsReady() or T.Smack:IsReady())) and T.BirdsofPrey:IsAvailable()) then if o(T.KillShot, nil, nil, not g:IsSpellInRange(T.KillShot)) then
            a1 = 320976; return "kill_shot cleave 2"
        end end; if T.DeathChakram:IsCastable() then if o(T.DeathChakram, nil, nil, not g:IsSpellInRange(T.DeathChakram)) then
            a1 = 325028; return "death_chakram cleave 4"
        end end; for b2, b3 in pairs(a7) do if b3:IsCastable() then if o(b3, nil, nil, not g:IsSpellInRange(b3)) then
                a1 = 259495; return "wildfire_bomb cleave 6"
            end end end; if T.Stampede:IsCastable() and n() then if o(T.Stampede, nil, nil, not g:IsSpellInRange(T.Stampede)) then
            a1 = 201430; return "stampede cleave 8"
        end end; if T.CoordinatedAssault:IsCastable() and n() and (T.FuryoftheEagle:CooldownDown() or not T.FuryoftheEagle:IsAvailable()) then if o(T.CoordinatedAssault, nil, nil, not g:IsSpellInRange(T.CoordinatedAssault)) then
            a1 = 266779; return "coordinated_assault cleave 10"
        end end; if T.ExplosiveShot:IsReady() then if o(T.ExplosiveShot, nil, nil, not g:IsSpellInRange(T.ExplosiveShot)) then
            a1 = 212431; return "explosive shot cleave 12"
        end end; if T.Carve:IsReady() and T.WildfireBomb:FullRechargeTime() > X / 2 then if o(T.Carve, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 187708; return "carve cleave 14"
        end end; if T.FuryoftheEagle:IsCastable() then if o(T.FuryoftheEagle, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 203415; return "fury_of_the_eagle cleave 18"
        end end; if T.Butchery:IsReady() then if o(T.Butchery, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 212436; return "butchery cleave 20"
        end end; if T.Butchery:IsReady() and (T.Butchery:FullRechargeTime() < f:GCD() or g:DebuffUp(T.ShrapnelBombDebuff) and (g:DebuffStack(T.InternalBleedingDebuff) < 2 or g:DebuffRemains(T.ShrapnelBombDebuff) < f:GCD())) then if o(T.Butchery, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 212436; return "butchery cleave 22"
        end end; if T.FuryoftheEagle:IsCastable() then if o(T.FuryoftheEagle, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 203415; return "fury_of_the_eagle cleave 22"
        end end; if T.Carve:IsReady() and g:DebuffUp(T.ShrapnelBombDebuff) then if o(T.Carve, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 187708; return "carve cleave 24"
        end end; if T.Butchery:IsReady() and (not T.ShrapnelBomb:IsCastable() or not T.WildfireInfusion:IsAvailable()) then if o(T.Butchery, nil, nil, not g:IsInMeleeRange(8)) then
            a1 = 212436; return "butchery cleave 26"
        end end; if T.MongooseBite:IsReady() then if R.CastTargetIf(T.MongooseBite, Y, "max", aU, aV, not g:IsInMeleeRange(a5)) then
            a1 = 259387; return "mongoose_bite cleave 28"
        end end; if T.RaptorStrike:IsReady() then if R.CastTargetIf(T.RaptorStrike, Y, "max", aU, aV, not g:IsInMeleeRange(a5)) then
            a1 = 186270; return "raptor_strike cleave 30"
        end end; if T.KillCommand:IsCastable() and (CheckFocusCap(T.KillCommand:ExecuteTime()) and T.KillCommand:FullRechargeTime() < f:GCD()) then if R.CastTargetIf(T.KillCommand, Y, "min", aT, nil, not g:IsSpellInRange(T.KillCommand)) then
            a1 = 259489; return "kill_command cleave 32"
        end end; if T.FlankingStrike:IsCastable() and CheckFocusCap(T.FlankingStrike:ExecuteTime(), 30) then if o(T.FlankingStrike, nil, nil, not g:IsSpellInRange(T.FlankingStrike)) then
            a1 = 269751; return "flanking_strike cleave 34"
        end end; if T.Carve:IsReady() then if o(T.Carve, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 187708; return "carve cleave 36"
        end end; if T.KillShot:IsReady() and f:BuffDown(T.CoordinatedAssaultBuff) then if o(T.KillShot, nil, nil, not g:IsSpellInRange(T.KillShot)) then
            a1 = 320976; return "kill_shot cleave 38"
        end end; if T.Spearhead:IsCastable() and n() then if o(T.Spearhead, nil, nil, not g:IsSpellInRange(T.Spearhead)) then
            a1 = 360966; return "spearhead cleave 42"
        end end; if T.MongooseBite:IsReady() and f:BuffUp(T.SpearheadBuff) then if R.CastTargetIf(T.MongooseBite, Y, "min", ae, nil, not g:IsInMeleeRange(a5)) then
            a1 = 259387; return "mongoose_bite cleave 44"
        end end; if T.SerpentSting:IsReady() then if R.CastTargetIf(T.SerpentSting, Y, "min", ae, al, not g:IsSpellInRange(T.SerpentSting)) then return
            "serpent_sting cleave 46" end end; if T.MongooseBite:IsReady() then if R.CastTargetIf(T.MongooseBite, Y, "min", ae, nil, not g:IsInMeleeRange(a5)) then
            a1 = 259387; return "mongoose_bite cleave 48"
        end end; if T.RaptorStrike:IsReady() then if R.CastTargetIf(T.RaptorStrike, Y, "min", ae, nil, not g:IsInMeleeRange(a5)) then
            a1 = 186270; return "raptor_strike cleave 50"
        end end
end; local function b4()
    if T.KillShot:IsReady() and (f:BuffUp(T.CoordinatedAssaultEmpowerBuff) or S.Survival.CAKSMacro and f:BuffUp(T.CoordinatedAssaultBuff) and (T.Bite:IsReady() or T.Claw:IsReady() or T.Smack:IsReady())) then if o(T.KillShot, nil, nil, not g:IsSpellInRange(T.KillShot)) then
            a1 = 320976; return "kill_shot st 2"
        end end; if T.Spearhead:IsAvailable() and T.Spearhead:CooldownRemains() < 2 * f:GCD() and T.WildfireBomb:FullRechargeTime() < f:GCD() or T.Bombardier:IsAvailable() and (T.CoordinatedAssault:CooldownRemains() < f:GCD() and T.FuryoftheEagle:CooldownDown() or f:BuffUp(T.CoordinatedAssaultBuff) and f:BuffRemains(T.CoordinatedAssaultBuff) < 2 * f:GCD()) or T.WildfireBomb:FullRechargeTime() < f:GCD() or f:PrevGCD(1, T.FuryoftheEagle) and f:HasTier(31, 2) or f:BuffUp(T.ContainedExplosionBuff) and (T.PheromoneBomb:IsCastable() and g:DebuffRefreshable(T.PheromoneBombDebuff) or T.VolatileBomb:IsCastable() and g:DebuffRefreshable(T.VolatileBombDebuff) or T.ShrapnelBomb:IsCastable() and g:DebuffRefreshable(T.ShrapnelBombDebuff)) or T.FuryoftheEagle:CooldownRemains() < f:GCD() and T.WildfireBomb:FullRechargeTime() < f:GCD() and f:HasTier(31, 2) or T.FuryoftheEagle:CooldownRemains() < f:GCD() and T.RuthlessMarauder:IsAvailable() and f:HasTier(31, 2) then for b2, b3 in pairs(a7) do if b3:IsCastable() then if o(b3, nil, nil, not g:IsSpellInRange(b3)) then
                    a1 = 259495; return "wildfire_bomb st 4"
                end end end end; if T.DeathChakram:IsCastable() and (CheckFocusCap(T.DeathChakram:ExecuteTime()) or T.Spearhead:IsAvailable() and T.Spearhead:CooldownUp() and T.FuryoftheEagle:CooldownDown() or T.Bombardier:IsAvailable() and T.FuryoftheEagle:CooldownUp()) then if o(T.DeathChakram, nil, nil, not g:IsSpellInRange(T.DeathChakram)) then
            a1 = 325028; return "death_chakram st 6"
        end end; if T.MongooseBite:IsReady() and f:PrevGCD(1, T.FuryoftheEagle) then if o(T.MongooseBite, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 259387; return "mongoose_bite st 8"
        end end; if T.FuryoftheEagle:IsCastable() and f:HasTier(31, 2) then if o(T.FuryoftheEagle, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 203415; return "fury_of_the_eagle st 12"
        end end; if T.Spearhead:IsCastable() and n() and (f:Focus() + f:FocusCastRegen(T.KillCommand:ExecuteTime()) + 21 > f:FocusMax() - 10 and (T.DeathChakram:CooldownDown() or not T.DeathChakram:IsAvailable())) then if o(T.Spearhead, nil, nil, not g:IsSpellInRange(T.Spearhead)) then
            a1 = 360966; return "spearhead st 14"
        end end; if T.KillCommand:IsCastable() and (T.KillCommand:FullRechargeTime() < f:GCD() and CheckFocusCap(T.KillCommand:ExecuteTime(), 21) and (f:BuffStack(T.DeadlyDuoBuff) > 2 or T.FlankersAdvantage:IsAvailable() and f:BuffStack(T.DeadlyDuoBuff) > 1 or f:BuffUp(T.SpearheadBuff) and g:DebuffRemains(T.PheromoneBombDebuff))) then if R.CastTargetIf(T.KillCommand, Y, "min", aT, nil, not g:IsSpellInRange(T.KillCommand)) then
            a1 = 259489; return "kill_command st 16"
        end end; if T.MongooseBite:IsReady() and (X == 1 and g:TimeToDie() < f:Focus() / (Z - f:FocusCastRegen(T.MongooseBite:ExecuteTime())) * f:GCD() or f:BuffUp(T.MongooseFuryBuff) and f:BuffRemains(T.MongooseFuryBuff) < f:GCD() or f:BuffUp(T.SpearheadBuff)) then if o(T.MongooseBite, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 259387; return "mongoose_bite st 18"
        end end; if T.KillShot:IsReady() and (f:BuffDown(T.CoordinatedAssaultEmpowerBuff) and f:BuffDown(T.SpearheadBuff)) then if o(T.KillShot, nil, nil, not g:IsSpellInRange(T.KillShot)) then
            a1 = 320976; return "kill_shot st 20"
        end end; if T.KillCommand:IsCastable() and (T.KillCommand:FullRechargeTime() < f:GCD() and CheckFocusCap(T.KillCommand:ExecuteTime(), 21) and g:DebuffUp(T.PheromoneBombDebuff) and T.FuryoftheEagle:IsAvailable() and T.FuryoftheEagle:CooldownRemains() > f:GCD()) then if R.CastTargetIf(T.KillCommand, Y, "min", aT, nil, not g:IsSpellInRange(T.KillCommand)) then
            a1 = 259489; return "kill_command st 22"
        end end; if T.RaptorStrike:IsReady() and (X == 1 and g:TimeToDie() < f:Focus() / (Z - f:FocusCastRegen(T.RaptorStrike:ExecuteTime())) * f:GCD()) then if o(T.RaptorStrike, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 186270; return "raptor_strike st 24"
        end end; if T.SerpentSting:IsReady() and not T.VipersVenom:IsAvailable() then if R.CastTargetIf(T.SerpentSting, Y, "min", ae, aj, not g:IsSpellInRange(T.SerpentSting)) then
            a1 = 259491; return "serpent_sting st 26"
        end end; if T.FuryoftheEagle:IsCastable() and (U.Djaruun:IsEquipped() and f:BuffUp(T.SeethingRageBuff) and f:BuffRemains(T.SeethingRageBuff) < 3 * f:GCD()) then if o(T.FuryoftheEagle, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 203415; return "fury_of_the_eagle st 28"
        end end; if T.MongooseBite:IsReady() and (T.AlphaPredator:IsAvailable() and f:BuffUp(T.MongooseFuryBuff) and f:BuffRemains(T.MongooseFuryBuff) < f:Focus() / (Z - f:FocusCastRegen(T.MongooseBite:ExecuteTime())) * f:GCD() or U.Djaruun:IsEquipped() and f:BuffUp(T.SeethingRageBuff) and X == 1 or T.PheromoneBomb:IsCastable() and T.WildfireBomb:CooldownRemains() < f:Focus() / (Z - f:FocusCastRegen(T.MongooseBite:ExecuteTime())) * f:GCD() and f:HasTier(31, 2)) then if o(T.MongooseBite, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 259387; return "mongoose_bite st 32"
        end end; if T.FlankingStrike:IsCastable() and CheckFocusCap(T.FlankingStrike:ExecuteTime(), 30) then if o(T.FlankingStrike, nil, nil, not g:IsSpellInRange(T.FlankingStrike)) then
            a1 = 269751; return "flanking_strike st 34"
        end end; if T.Stampede:IsCastable() and n() then if o(T.Stampede, nil, nil, not g:IsSpellInRange(T.Stampede)) then
            a1 = 201430; return "stampede st 36"
        end end; if T.CoordinatedAssault:IsCastable() and n() and (not T.CoordinatedKill:IsAvailable() and g:HealthPercentage() < 20 and (f:BuffDown(T.SpearheadBuff) and T.Spearhead:CooldownDown() or not T.Spearhead:IsAvailable()) or T.CoordinatedKill:IsAvailable() and (f:BuffDown(T.SpearheadBuff) and T.Spearhead:CooldownDown() or not T.Spearhead:IsAvailable())) then if o(T.CoordinatedAssault, nil, nil, not g:IsSpellInRange(T.CoordinatedAssault)) then
            a1 = 266779; return "coordinated_assault st 38"
        end end; if T.PheromoneBomb:IsCastable() and (f:Focus() < Z and f:HasTier(31, 2)) then if o(T.PheromoneBomb, nil, nil, not g:IsSpellInRange(T.PheromoneBomb)) then
            a1 = 259495; return "wildfire_bomb (pheromone) st 40"
        end end; if T.KillCommand:IsCastable() then if R.CastTargetIf(T.KillCommand, Y, "min", aT, ap, not g:IsSpellInRange(T.KillCommand)) then
            a1 = 259489; return "kill_command st 42"
        end end; if T.SerpentSting:IsReady() and not T.VipersVenom:IsAvailable() then if R.CastTargetIf(T.SerpentSting, Y, "min", ae, ak, not g:IsSpellInRange(T.SerpentSting)) then return
            "serpent_sting st 44" end end; if T.MongooseBite:IsReady() and g:DebuffUp(T.ShrapnelBombDebuff) then if o(T.MongooseBite, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 259387; return "mongoose_bite st 46"
        end end; if g:DebuffDown(T.WildfireBombDebuff) and CheckFocusCap(T.WildfireBomb:ExecuteTime()) or X > 1 then for b2, b3 in pairs(a7) do if b3:IsCastable() then if o(b3, nil, nil, not g:IsSpellInRange(b3)) then
                    a1 = 259495; return "wildfire_bomb st 48"
                end end end end; if T.MongooseBite:IsReady() and f:BuffUp(T.MongooseFuryBuff) then if R.CastTargetIf(T.MongooseBite, Y, "max", aU, nil, not g:IsInMeleeRange(a5)) then
            a1 = 259387; return "mongoose_bite st 50"
        end end; if T.ExplosiveShot:IsReady() and T.Ranger:IsAvailable() then if o(T.ExplosiveShot, nil, nil, not g:IsSpellInRange(T.ExplosiveShot)) then
            a1 = 212431; return "explosive shot st 54"
        end end; if T.FuryoftheEagle:IsCastable() then if o(T.FuryoftheEagle, nil, nil, not g:IsInMeleeRange(a5)) then
            a1 = 203415; return "fury_of_the_eagle st 56"
        end end; if T.MongooseBite:IsReady() then if R.CastTargetIf(T.MongooseBite, Y, "max", aU, nil, not g:IsInMeleeRange(a5)) then
            a1 = 259387; return "mongoose_bite st 58"
        end end; if T.RaptorStrike:IsReady() then if R.CastTargetIf(T.RaptorStrike, Y, "max", aU, nil, not g:IsInMeleeRange(a5)) then
            a1 = 186270; return "raptor_strike st 60"
        end end; if T.KillCommand:IsCastable() and CheckFocusCap(T.KillCommand:ExecuteTime(), 21) then if R.CastTargetIf(T.KillCommand, Y, "min", aT, nil, not g:IsSpellInRange(T.KillCommand)) then
            a1 = 259489; return "kill_command st 62"
        end end; if T.CoordinatedAssault:IsCastable() and (not T.CoordinatedKill:IsAvailable() and g:TimeToDie() > 140) then if o(T.CoordinatedAssault, nil, nil, not g:IsSpellInRange(T.CoordinatedAssault)) then
            a1 = 266779; return "coordinated_assault st 64"
        end end
end; local function b5()
    r = HeroRotationCharDB.Toggles[5]
    q = HeroRotationCharDB.Toggles[4] or n()
    s = HeroRotationCharDB.Toggles[12]
    t = not HeroRotationCharDB.Toggles[15]
    u = HeroRotationCharDB.Toggles[120]
    v = HeroRotationCharDB.Toggles[121]
    w = HeroRotationCharDB.Toggles[122]
    x = HeroRotationCharDB.Toggles[123]
    y = HeroRotationCharDB.Toggles[124]
    z = HeroRotationCharDB.Toggles[125]
    A = HeroRotationCharDB.Toggles[140]
    B = HeroRotationCharDB.Toggles[141]
    C = HeroRotationCharDB.Toggles[142]
    H = GetTime()
    P = GetInventoryItemID("player", 13)
    Q = GetInventoryItemID("player", 14)
end; local function b6()
    local EagleUp = f:BuffUp(T.AspectoftheEagle)
    a5 = EagleUp and 40 or 5; if m() then if EagleUp and not g:IsInMeleeRange(8) then X = g:GetEnemiesInSplashRangeCount(8) else X = #
            f:GetEnemiesInRange(8) end else X = 1 end; if EagleUp then Y = f:GetEnemiesInRange(40) else Y = f
        :GetEnemiesInRange(8) end; if R.TargetIsValid() or f:AffectingCombat() then
        a3 = c.BossFightRemains()
        a4 = a3; if a4 == 11111 then a4 = c.FightRemains(Y, false) end
    end; b5()
    if l.QueuedCast() then
        a1 = l.QueuedCast()
        return "Custom Queue " .. i(a1):ID()
    end; if a2 > 0 then a2 = 0 end; if a1 > 0 then a1 = 0 end; if EagleUp then Y = f:GetEnemiesInRange(40) else Y = f
        :GetEnemiesInRange(5) end; if f:BuffUp(i(5384)) then return false end; if T.Exhilaration:IsCastable() and f:HealthPercentage() <= S.Commons.ExhilarationHP then if o(T.Exhilaration, nil) then
            a1 = 109304; return "Exhilaration"
        end end; if f:HealthPercentage() < S.Commons.HealthstoneHP and U.Healthstone:IsReady() and U.Healthstone:CooldownRemains() <= 0 then if l.Cast(U.Healthstone, nil) then
            a1 = 40; return "Healthstone HP"
        end end; if f:HealthPercentage() < S.Commons.HealPotHP and U.HealPot:IsReady() and U.HealPot:CooldownRemains() <= 0 then if l.Cast(U.HealPot, nil) then
            a1 = 41; return "HealPot HP"
        end end; if f:HealthPercentage() < S.Commons.HealPotHP and U.CosmicHealPot:IsReady() and U.CosmicHealPot:CooldownRemains() <= 0 then if l.Cast(U.CosmicHealPot, nil) then
            a1 = 45; return "CosmicHealPot HP"
        end end; if T.AspectoftheTurtle:IsCastable() and f:HealthPercentage() <= S.Commons.TurtleHP then if o(T.AspectoftheTurtle, nil) then
            a1 = 186265; return "AspectoftheTurtle"
        end end; if not g:IsInMeleeRange(10) and not EagleUp and not T.Harpoon:IsCastable() and #Y > 0 and S.Survival.TargetSwap == "AutoSwap" and not s then a2 = 999 end; if UnitExists("target") and string.find(UnitGUID("target"), 120651) then if T.SerpentSting:IsCastable() and T.SerpentSting:IsAvailable() and TargetInRange40y then if o(T.SerpentSting, nil) then
                a1 = 259491; return "explosive  SS"
            end elseif T.ArcaneShot:IsCastable() and T.ArcaneShot:IsAvailable() and TargetInRange40y then if o(T.ArcaneShot, nil) then
                a1 = 185358; return "explosive ArcaneShot"
            end end end; L = { 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 195181, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426 }
    if UnitExists("target") and T.TranqualizingShot:IsCastable() and not C then if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true and T.TranqualizingShot:IsCastable() and T.TranqualizingShot:CooldownRemains(BypassRecovery) <= 0 then for b7 = 0, 40 do
                local b2, b2, b8, b9, b2, b2, b2, b2, b2, ba = UnitBuff("target", b7)
                for b2, bb in pairs(L) do if bb == ba then if l.Cast(T.TranqualizingShot, nil) then
                            a1 = 19801; return "Tranq Enrage"
                        end end end
            end end end; if l.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[5] then
        H = GetTime()
        endtime = H + l.GUISettings.General.OpenerReset
    elseif l.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[5] then
        HeroRotationCharDB.Toggles[5] = not HeroRotationCharDB.Toggles[5]
        l.ToggleIconFrame:UpdateButtonText(5)
        l.Print("Opener is now " .. (HeroRotationCharDB.Toggles[5] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end; if u and T.Bindingshot:IsAvailable() and T.Bindingshot:CooldownRemains(BypassRecovery) <= 0 then if l.Cast(T.Bindingshot, nil, nil, nil) then
            a1 = 109248; return "queue Binding Shot"
        end elseif (not T.Bindingshot:IsAvailable() or T.Bindingshot:CooldownRemains(BypassRecovery) > 0) and u then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
        l.Print("Binding Shot Queue is now " .. (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end; if v and T.FreezingTrap:IsAvailable() and T.FreezingTrap:CooldownRemains(BypassRecovery) <= 0 then if l.Cast(T.FreezingTrap, nil, nil, nil) then
            a1 = 187650; return "queue Freezing Trap"
        end elseif (not T.FreezingTrap:IsUsableP() or T.FreezingTrap:CooldownRemains() > 0) and v then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
        l.Print("Freezing Trap Queue is now " ..
        (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end; if w and T.Intimidation:IsAvailable() and T.Intimidation:CooldownRemains(BypassRecovery) <= 0 then if l.Cast(T.Intimidation, nil, nil, nil) then
            a1 = 19577; return "queue Intimidation"
        end elseif (not T.Intimidation:IsUsableP() or T.Intimidation:CooldownRemains() > 0) and w then
        HeroRotationCharDB.Toggles[122] = not HeroRotationCharDB.Toggles[122]
        l.Print("Intimidation Queue is now " .. (HeroRotationCharDB.Toggles[122] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end; if x and T.Flare:IsAvailable() and T.Flare:CooldownRemains(BypassRecovery) <= 0 then if l.Cast(T.Flare, nil, nil, nil) then
            a1 = 1543; return "queue Flare"
        end elseif (not T.Flare:IsUsableP() or T.Flare:CooldownRemains() > 0) and x then
        HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123]
        l.Print("Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end; if y and T.TarTrap:IsAvailable() and T.TarTrap:CooldownRemains(BypassRecovery) <= 0 then if l.Cast(T.TarTrap, nil, nil, nil) then
            a1 = 187698; return "queue TarTrap"
        end elseif (not T.TarTrap:IsUsableP() or T.TarTrap:CooldownRemains() > 0) and y then
        HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124]
        l.Print("Tar Trap Queue is now " .. (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end; if A and T.HuntersMark:IsAvailable() and T.HuntersMark:CooldownRemains(BypassRecovery) <= 0 then if l.Cast(T.HuntersMark, nil, nil, nil) then
            a1 = 257284; return "queue HuntersMark"
        end elseif (not T.HuntersMark:IsUsableP() or T.HuntersMark:CooldownRemains() > 0) and A then
        HeroRotationCharDB.Toggles[140] = not HeroRotationCharDB.Toggles[140]
        l.Print("Hunter's Mark Quaue is now " ..
        (HeroRotationCharDB.Toggles[140] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end; if f:IsCasting(T.RevivePet) and not f:IsDeadOrGhost() then if o(T.PoolFocus) then
            a1 = 999999; return "Pooling Focus"
        end end; if I and J + 1 < GetTime() then I = false end; if h:IsActive() and select(2, GetStablePetInfo(S.Commons.SummonPetSlot)) ~= select(1, UnitName("pet")) and S.Commons.SummonPetSlot ~= 0 and not f:IsMoving() and not f:PrevGCD(1, T.DismissPet) and not f:IsCasting(T.DismissPet) then if o(T.DismissPet, nil) then
            a1 = 2641; return "Dismiss Pet"
        end end; if T.SummonPet:IsCastable() and not f:IsDeadOrGhost() and not h:IsActive() and S.Commons.SummonPetSlot ~= 0 then if S.Commons.SummonPetSlot == 1 and not f:PrevGCD(1, W[S.Commons.SummonPetSlot]) then if o(W[S.Commons.SummonPetSlot], nil) then
                a1 = 883; return "Summon Pet"
            end elseif S.Commons.SummonPetSlot == 2 and not f:PrevGCD(1, W[S.Commons.SummonPetSlot]) then if o(W[S.Commons.SummonPetSlot], nil) then
                a1 = 83242; return "Summon Pet"
            end elseif S.Commons.SummonPetSlot == 3 and not f:PrevGCD(1, W[S.Commons.SummonPetSlot]) then if o(W[S.Commons.SummonPetSlot], nil) then
                a1 = 83243; return "Summon Pet"
            end elseif S.Commons.SummonPetSlot == 4 and not f:PrevGCD(1, W[S.Commons.SummonPetSlot]) then if o(W[S.Commons.SummonPetSlot], nil) then
                a1 = 83244; return "Summon Pet"
            end elseif S.Commons.SummonPetSlot == 5 and not f:PrevGCD(1, W[S.Commons.SummonPetSlot]) then if o(W[S.Commons.SummonPetSlot], nil) then
                a1 = 83245; return "Summon Pet"
            end end end; if (h:IsDeadOrGhost() or not UnitExists("pet")) and not f:IsDeadOrGhost() and T.RevivePet:IsCastable() and not f:IsMoving() and S.Commons.SummonPetSlot ~= 0 and not I then if o(T.RevivePet, nil) then
            a1 = 982; return "Revive Pet"
        end end; local bc, bd, b2 = GetSpellCooldown(34477)
    if f:AffectingCombat() and S.Commons.AutoMisdirect and not f:IsDeadOrGhost() and not z then if bc + bd - GetTime() <= 0 and T.Misdirection:IsAvailable() and T.Misdirection:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus") or UnitIsUnit("focus", "pet")) and IsItemInRange(32698, "focus") then if l.Cast(T.Misdirection) then
                a2 = 134477; return "MD Focus"
            end end end; if not h:IsDeadOrGhost() and not f:IsDeadOrGhost() and UnitExists("pet") and T.MendPet:IsCastable() and h:HealthPercentage() <= S.Commons.MendPetHighHP and not f:PrevGCD(1, T.MendPet) then if o(T.MendPet) then
            a1 = 1982; return "Mend Pet High Priority"
        end end; if not f:AffectingCombat() and not f:IsDeadOrGhost() and (r or S.Survival.DBMSupport and (l.BossMods:GetPullTimer() < f:GCD() and l.BossMods:GetPullTimer() > 0 or l.BossMods:GetPullTimer() < 0.5 and l.BossMods:GetPullTimer() > 0)) and (R.TargetIsValid() or g:NPCID() == 179733) then
        local _ = aW()
        if _ then return _ end
    end; if f:BuffUp(i(310143)) or f:BuffUp(i(5384)) then return false end; if R.TargetIsValid() and (f:AffectingCombat() or r) and (g:AffectingCombat() or g:IsDummy() or g:NPCID() == 153285 or g:NPCID() == 168326 or g:NPCID() == 176581 or g:NPCID() == 176920 or g:NPCID() == 177892 or g:NPCID() == 182778 or g:NPCID() == 185402 or g:NPCID() == 183945 or g:NPCID() == 182074 or g:NPCID() == 184737 or g:NPCID() == 179733 or g:NPCID() == 115402 or g:NPCID() == 115406 or g:NPCID() == 115395 or UnitExists("boss1") or g:NPCID() == 115388 or r) and not f:IsDeadOrGhost() then
        if i(257284):IsCastable() and i(339264):ConduitEnabled() and g:DebuffDown(i(257284)) and (a9(Enemies40y) <= 0 or UnitName("target") == "Fleeting Manifestation") and (UnitName("target") == "Nalthor the Rimebinder" or UnitName("target") == "Tirnenn Villager" or UnitName("target") == "Drust Boughbreaker" or UnitName("target") == "Ingra Maloch" or UnitName("target") == "Mistveil Stalker" or UnitName("target") == "Mistcaller" or UnitName("target") == "Blightbone" or UnitName("target") == "Rotspew" or UnitName("target") == "Amarth" or UnitName("target") == "Surgeon Stitchflesh" or UnitName("target") == "Lubricator" or UnitName("target") == "Tred'ova" or UnitName("target") == "Azules" or UnitName("target") == "Ventunax" or UnitName("target") == "Oryphion" or UnitName("target") == "Astronos" or UnitName("target") == "Lakesis" or UnitName("target") == "Klotos" or UnitName("target") == "Devos" or UnitName("target") == "Halkias" or UnitName("target") == "High Adjudicator Aleez" or UnitName("target") == "Wo Drifter" or UnitName("target") == "Lord Chamberlain" or UnitName("target") == "Enraged Spirit" or UnitName("target") == "Hakkar The Soulflayer" or UnitName("target") == "Sentient Oil" or UnitName("target") == "Millhouse Manastorm" or UnitName("target") == "Millificent Manastorm" or UnitName("target") == "Dealer Xy’exa" or UnitName("target") == "Mueh'zala" or UnitName("target") == "Fungi Stormer" or UnitName("target") == "Globgrog" or UnitName("target") == "Slime Tentacle" or UnitName("target") == "Virulax Blightweaver" or UnitName("target") == "Doctor Ickus" or UnitName("target") == "Domina Venomblade" or UnitName("target") == "Margrave Stradama" or UnitName("target") == "Dreadful Huntmaster" or UnitName("target") == "Insatiable Brute" or UnitName("target") == "Kryxis the Voracious" or UnitName("target") == "Grand Overseer" or UnitName("target") == "Research Scribe" or UnitName("target") == "Executor Tarvold" or UnitName("target") == "Grand Proctor Beryllia" or UnitName("target") == "General Kaal" or UnitName("target") == "Paceran the Virulent" or UnitName("target") == "Shard of Halkias" or UnitName("target") == "Shambling Arbalest" or UnitName("target") == "Nekthara the Mangler" or UnitName("target") == "Harugia the Bloodthirtsy" or UnitName("target") == "Heavin the Breaker" or UnitName("target") == "Echelon" or UnitName("target") == "Advent Nevermore" or UnitName("target") == "Xav the Unfallen" or UnitName("target") == "Portal Guardian" or UnitName("target") == "Kul'Tharok" or UnitName("target") == "Gorechop" or UnitName("target") == "Mordretha, the Endless Empress" or UnitName("target") == "Gatewarden Zo'mazz" or UnitName("target") == "Zophex" or UnitName("target") == "Alcruux" or UnitName("target") == "Achillite" or UnitName("target") == "Venza Goldfuse" or UnitName("target") == "Zo'gron" or UnitName("target") == "P.O.S.T Master" or UnitName("target") == "So'azmi" or UnitName("target") == "Portalmancer Zo'dahh" or UnitName("target") == "4.RF-4.RF" or UnitName("target") == "Inquisitor Sigar" or UnitName("target") == "Fleeting Manifestation" or UnitName("target") == "Corpse Harvester" or UnitName("target") == "Zolramus Necromancer" or UnitName("target") == "Nar'zudah" or UnitName("target") == "Raging Bloodhorn" or UnitName("target") == "Harugia the Bloodthirsty" or UnitName("target") == "Portalmancer Zo'honn" or UnitName("target") == "Enraged Direhorn" or UnitName("target") == "Coastwalker Goliath" or UnitName("target") == "Adorned Starseer" or UnitName("target") == "Wandering Pulsar" or IsInRaid() and UnitName("target") == UnitName("boss1")) then if o(T.HuntersMark, nil) then
                a1 = 257284; return "HuntersMark M+"
            end end; if not f:AffectingCombat() then
            local _ = aW()
            if _ then return _ end
        end; if T.Exhilaration:IsCastable() and f:HealthPercentage() <= S.Commons2.ExhilarationHP then if o(T.Exhilaration, nil) then
                a1 = 109304; return "Exhilaration"
            end end; local _ = R.Interrupt(5, T.Muzzle, S.Survival.OffGCDasOffGCD.Muzzle, a6)
        if _ then return _ end; if not EagleUp and not g:IsInMeleeRange(8) then
            if T.AspectoftheEagle:IsCastable() then if o(T.AspectoftheEagle, nil) then
                    a1 = 186289; return "aspect_of_the_eagle oor"
                end end; if T.Harpoon:IsCastable() then if o(T.Harpoon, nil, nil, not g:IsSpellInRange(T.Harpoon)) then
                    a1 = 190925; return "harpoon oor"
                end end
        end; if n() then
            local _ = aX()
            if _ then return _ end
        end; if X < 3 then
            local _ = b4()
            if _ then return _ end
        end; if X > 2 then
            local _ = b1()
            if _ then return _ end
        end; if T.ArcaneTorrent:IsCastable() and n() then if o(T.ArcaneTorrent, nil, nil, not g:IsInRange(8)) then
                a1 = 155145; return "arcane_torrent main"
            end end; if l.CastAnnotated(T.PoolFocus, false, "WAIT") then return "Pooling Focus" end
    end
end; local function be()
    l.Print("Survival Hunter rotation has been updated for patch 10.2.0.")
    if HeroRotationCharDB.Toggles[5] then
        HeroRotationCharDB.Toggles[5] = not HeroRotationCharDB.Toggles[5]
        l.ToggleIconFrame:UpdateButtonText(5)
    end
end; function ReturnSpell3() if a1 == 0 then return 0 else return a1 end end; function ReturnSpellMO3() if a2 == 0 then return 0 else return
        a2 end end; l.SetAPL(255, b6, be)
