local e, e = ...
local e = HeroDBC.DBC
local I = HeroLib
local e = HeroCache
local f = I.Unit
local a = f.Player
local t = f.Target
local N = f.Pet
local A = I.Spell
local o = I.Item
local R = I.Action
local l = HeroRotation
local le = l.AoEON
local _ = l.CDsON
local i = l.Cast
local e = l.CastSuggested
local T = HeroRotationCharDB.Toggles[4]
local Oe = HeroRotationCharDB.Toggles[5]
local L = HeroRotationCharDB.Toggles[6]
local w = HeroRotationCharDB.Toggles[12]
local ie = HeroRotationCharDB.Toggles[15]
local F = HeroRotationCharDB.Toggles[120]
local M = HeroRotationCharDB.Toggles[121]
local B = HeroRotationCharDB.Toggles[122]
local P = HeroRotationCharDB.Toggles[123]
local V = HeroRotationCharDB.Toggles[124]
local Q = HeroRotationCharDB.Toggles[125]
local W = HeroRotationCharDB.Toggles[140]
local z = HeroRotationCharDB.Toggles[141]
local we = HeroRotationCharDB.Toggles[142]
local m = false
local e = false
local e = false
local e = false
local e = false
local Y = 0
local U = false
local ye = 0
local e = false
local ve = { 355782, 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 343470, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133 }
local c = l.Commons.Everyone
local n = { General = l.GUISettings.General, Commons = l.GUISettings.APL.Hunter.Commons, Survival = l.GUISettings.APL.Hunter.Survival }
local e = A.Hunter.Survival
local q = o.Hunter.Survival
local s = { q.DreadfireVessel:ID() }
local j = a:CovenantID()
I:RegisterForEvent(function()
    j = a:CovenantID()
end, "COVENANT_CHOSEN")
I:RegisterForEvent(function(e, ...)
    local e, t, t, t = ...
    if e == 284 then
        U = true
        ye = GetTime()
    end

end, "UI_ERROR_MESSAGE")
local s = a:GetEquipment()
local h = o(0)
local r = o(0)
local K = GetInventoryItemID("player", 13)
local G = GetInventoryItemID("player", 14)
if s[13] then
    h = o(s[13])
end

if s[14] then
    r = o(s[14])
end

local y = a:HasLegendaryEquipped(67)
local H = a:HasLegendaryEquipped(68)
local C = a:HasLegendaryEquipped(79)
local ee = a:HasLegendaryEquipped(253)
I:RegisterForEvent(function()
    s = a:GetEquipment()
    h = o(0)
    r = o(0)
    if s[13] then
        h = o(s[13])
    end

    if s[14] then
        r = o(s[14])
    end

    y = a:HasLegendaryEquipped(67)
    H = a:HasLegendaryEquipped(68)
    C = a:HasLegendaryEquipped(79)
    ee = a:HasLegendaryEquipped(253) or (a:HasUnity() and e.DeathChakram:IsAvailable())
end, "PLAYER_EQUIPMENT_CHANGED")
local x = { e.SummonPet, e.SummonPet2, e.SummonPet3, e.SummonPet4, e.SummonPet5 }
local p, u
local g = ((e.MongooseBite:IsAvailable() and e.MongooseBite:Cost()) or (e.RaptorStrike:Cost()))
local o
local o
local o = 0
local s = 0
I:RegisterForEvent(function()
    g = ((e.MongooseBite:IsAvailable() and e.MongooseBite:Cost()) or (e.RaptorStrike:Cost()))
end, "PLAYER_TALENT_UPDATE")
local d = { { e.Intimidation, "Cast Intimidation (Interrupt)", function()
    return true
end } }
local function d(t, e)
    local e = e or 0
    return (a:Focus() + a:FocusCastRegen(t) + e < a:FocusMax())
end

local function qe(e)
    local t = 0
    if e ~= nil then
        for a in pairs(e) do
            local e = e[a]
            if e:IsInMeleeRange(40) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) and e:DebuffUp(A(257284)) then
                t = t + 1
            end

        end

    end

    return t
end

local function E()
    if e.ShrapnelBomb:TimeSinceLastCast() < .5 or e.PheromoneBomb:TimeSinceLastCast() < .5 or e.VolatileBomb:TimeSinceLastCast() < .5 or e.WildfireBomb:TimeSinceLastCast() < .5 or z then
        return true
    else
        return false
    end

end

local function k(t)
    return (t:DebuffRemains(e.SerpentStingDebuff))
end

local function b(t)
    return (t:DebuffRemains(e.BloodseekerDebuff))
end

local function v(t)
    return (t:DebuffStack(e.LatentPoisonDebuff))
end

local function ke(e)
    return (e:HealthPercentage())
end

local function be(i)
                if (((i:DebuffDown(e.SerpentStingDebuff) and i:TimeToDie() > 7) or (a:BuffUp(e.VipersVenomBuff) and a:BuffRemains(e.VipersVenomBuff) < a:GCD())) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif (((i:DebuffDown(e.SerpentStingDebuff) and i:TimeToDie() > 7) or (a:BuffUp(e.VipersVenomBuff) and a:BuffRemains(e.VipersVenomBuff) < a:GCD())) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif (((i:DebuffDown(e.SerpentStingDebuff) and i:TimeToDie() > 7) or (a:BuffUp(e.VipersVenomBuff) and a:BuffRemains(e.VipersVenomBuff) < a:GCD())) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif ((i:DebuffDown(e.SerpentStingDebuff) and i:TimeToDie() > 7) or (a:BuffUp(e.VipersVenomBuff) and a:BuffRemains(e.VipersVenomBuff) < a:GCD())) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function pe(i)
                if (((i:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > 7) or a:BuffUp(e.VipersVenomBuff)) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif (((i:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > 7) or a:BuffUp(e.VipersVenomBuff)) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif (((i:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > 7) or a:BuffUp(e.VipersVenomBuff)) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif ((i:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > 7) or a:BuffUp(e.VipersVenomBuff)) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function me(a)
                if ((a:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable() and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == f("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable() and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable() and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif (a:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable() and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function fe(a)
                if ((a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == f("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif (a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function O(i)
                if ((e.KillCommand:FullRechargeTime() < a:GCD() and d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((e.KillCommand:FullRechargeTime() < a:GCD() and d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((e.KillCommand:FullRechargeTime() < a:GCD() and d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (e.KillCommand:FullRechargeTime() < a:GCD() and d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function S(i)
                if ((e.KillCommand:FullRechargeTime() < a:GCD() and d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        print((TargetInRangePet30y), (not PetRangeAbility))
        s = 1259489
        return true
    elseif ((e.KillCommand:FullRechargeTime() < a:GCD() and d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        print((TargetInRangePet30y), (not PetRangeAbility))
        return true
    elseif ((e.KillCommand:FullRechargeTime() < a:GCD() and d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        print((TargetInRangePet30y), (not PetRangeAbility))
        return true
    elseif (e.KillCommand:FullRechargeTime() < a:GCD() and d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function xe(a)
                if ((d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == f("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (d(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function D(e)
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and e:GUID() == f("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and e:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function ze(i)
                if ((a:BuffStack(e.TipoftheSpearBuff) == 3 or i:DebuffUp(e.ShrapnelBombDebuff)) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1186270
        return true
    elseif ((a:BuffStack(e.TipoftheSpearBuff) == 3 or i:DebuffUp(e.ShrapnelBombDebuff)) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((a:BuffStack(e.TipoftheSpearBuff) == 3 or i:DebuffUp(e.ShrapnelBombDebuff)) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 186270
        return true
    elseif (a:BuffStack(e.TipoftheSpearBuff) == 3 or i:DebuffUp(e.ShrapnelBombDebuff)) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function Ae(e)
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and e:GUID() == f("mouseover"):GUID()) then
        s = 1259387
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and n.Survival.KillCommandTargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and e:GUID() == t:GUID()) then
        o = 259387
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) then
        return true
    end

end

local function O(e)
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and e:GUID() == f("mouseover"):GUID()) then
        s = 1186270
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and n.Survival.KillCommandTargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and e:GUID() == t:GUID()) then
        o = 186270
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) then
        return true
    end

end

local function ue(e)
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and e:GUID() == f("mouseover"):GUID()) then
        s = 1324149
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and n.Survival.KillCommandTargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and e:GUID() == t:GUID()) then
        o = 324149
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) then
        return true
    end

end

local function ce(i)
                if ((e.AlphaPredator:IsAvailable() and ((a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (g - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD() and i:DebuffDown(e.WildSpiritsDebuff)) or (a:BuffRemains(e.MongooseFuryBuff) and e.PheromoneBomb:IsCastable()))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259387
        return true
    elseif ((e.AlphaPredator:IsAvailable() and ((a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (g - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD() and i:DebuffDown(e.WildSpiritsDebuff)) or (a:BuffRemains(e.MongooseFuryBuff) and e.PheromoneBomb:IsCastable()))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((e.AlphaPredator:IsAvailable() and ((a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (g - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD() and i:DebuffDown(e.WildSpiritsDebuff)) or (a:BuffRemains(e.MongooseFuryBuff) and e.PheromoneBomb:IsCastable()))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259387
        return true
    elseif (e.AlphaPredator:IsAvailable() and ((a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (g - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD() and i:DebuffDown(e.WildSpiritsDebuff)) or (a:BuffRemains(e.MongooseFuryBuff) and e.PheromoneBomb:IsCastable()))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function J(i)
                if ((a:BuffUp(e.MongooseFuryBuff) or (a:Focus() + a:FocusCastRegen(e.MongooseBite:ExecuteTime()) > a:FocusMax() - 15) or (i:DebuffUp(e.ShrapnelBombDebuff)) or (i:DebuffRemains(e.WildSpiritsDebuff))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259387
        return true
    elseif ((a:BuffUp(e.MongooseFuryBuff) or (a:Focus() + a:FocusCastRegen(e.MongooseBite:ExecuteTime()) > a:FocusMax() - 15) or (i:DebuffUp(e.ShrapnelBombDebuff)) or (i:DebuffRemains(e.WildSpiritsDebuff))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((a:BuffUp(e.MongooseFuryBuff) or (a:Focus() + a:FocusCastRegen(e.MongooseBite:ExecuteTime()) > a:FocusMax() - 15) or (i:DebuffUp(e.ShrapnelBombDebuff)) or (i:DebuffRemains(e.WildSpiritsDebuff))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259387
        return true
    elseif (a:BuffUp(e.MongooseFuryBuff) or (a:Focus() + a:FocusCastRegen(e.MongooseBite:ExecuteTime()) > a:FocusMax() - 15) or (i:DebuffUp(e.ShrapnelBombDebuff)) or (i:DebuffRemains(e.WildSpiritsDebuff))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function X(i)
                if ((a:BuffUp(e.VipersVenomBuff) and (a:BuffRemains(e.VipersVenomBuff) < a:GCD() or i:DebuffRefreshable(e.SerpentStingDebuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif ((a:BuffUp(e.VipersVenomBuff) and (a:BuffRemains(e.VipersVenomBuff) < a:GCD() or i:DebuffRefreshable(e.SerpentStingDebuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((a:BuffUp(e.VipersVenomBuff) and (a:BuffRemains(e.VipersVenomBuff) < a:GCD() or i:DebuffRefreshable(e.SerpentStingDebuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif (a:BuffUp(e.VipersVenomBuff) and (a:BuffRemains(e.VipersVenomBuff) < a:GCD() or i:DebuffRefreshable(e.SerpentStingDebuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function ae(i)
                if ((d(e.KillCommand:ExecuteTime(), 15) and a:BuffUp(e.NessingwarysTrappingBuff) or a:Focus() + a:FocusCastRegen(e.KillCommand:ExecuteTime()) < a:FocusMax() + 10 and a:BuffUp(e.NessingwarysTrappingBuff) and a:BuffRemains(e.NessingwarysTrappingBuff) < a:GCD()) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((d(e.KillCommand:ExecuteTime(), 15) and a:BuffUp(e.NessingwarysTrappingBuff) or a:Focus() + a:FocusCastRegen(e.KillCommand:ExecuteTime()) < a:FocusMax() + 10 and a:BuffUp(e.NessingwarysTrappingBuff) and a:BuffRemains(e.NessingwarysTrappingBuff) < a:GCD()) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((d(e.KillCommand:ExecuteTime(), 15) and a:BuffUp(e.NessingwarysTrappingBuff) or a:Focus() + a:FocusCastRegen(e.KillCommand:ExecuteTime()) < a:FocusMax() + 10 and a:BuffUp(e.NessingwarysTrappingBuff) and a:BuffRemains(e.NessingwarysTrappingBuff) < a:GCD()) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (d(e.KillCommand:ExecuteTime(), 15) and a:BuffUp(e.NessingwarysTrappingBuff) or a:Focus() + a:FocusCastRegen(e.KillCommand:ExecuteTime()) < a:FocusMax() + 10 and a:BuffUp(e.NessingwarysTrappingBuff) and a:BuffRemains(e.NessingwarysTrappingBuff) < a:GCD()) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function te(i)
                if ((d(e.KillCommand:ExecuteTime(), 15) and (not y or a:Focus() < g)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((d(e.KillCommand:ExecuteTime(), 15) and (not y or a:Focus() < g)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((d(e.KillCommand:ExecuteTime(), 15) and (not y or a:Focus() < g)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (d(e.KillCommand:ExecuteTime(), 15) and (not y or a:Focus() < g)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function Z(i)
    local d = d(e.KillCommand:ExecuteTime(), 15)
    local u = a:FocusCastRegen(e.KillCommand:ExecuteTime())
    local h = a:Focus()
    local l = a:GCD()
    local r = e.FreezingTrap:CooldownRemains() > (a:Focus() / (g - u) * l)
    local h = e.TarTrap:CooldownRemains() > (a:Focus() / (g - u) * l)
    local a = e.SteelTrap:IsAvailable() and (e.SteelTrap:CooldownRemains() > (a:Focus() / (g - u) * l))
                if ((d and y and r and h and (not e.SteelTrap:IsAvailable() or a)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((d and y and r and h and (not e.SteelTrap:IsAvailable() or a)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((d and y and r and h and (not e.SteelTrap:IsAvailable() or a)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (d and y and r and h and (not e.SteelTrap:IsAvailable() or a)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function re(i)
                if ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1186270
        return true
    elseif ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 186270
        return true
    elseif (a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function de(i)
                if ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259387
        return true
    elseif ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259387
        return true
    elseif (a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function ne(i)
                if ((e.AlphaPredator:IsAvailable() and (a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (g - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD())) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259387
        return true
    elseif ((e.AlphaPredator:IsAvailable() and (a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (g - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD())) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((e.AlphaPredator:IsAvailable() and (a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (g - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD())) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259387
        return true
    elseif (e.AlphaPredator:IsAvailable() and (a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (g - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD())) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function se(i)
                if (((i:DebuffRefreshable(e.SerpentStingDebuff) and a:BuffDown(e.CoordinatedAssault)) or (e.AlphaPredator:IsAvailable() and i:DebuffRefreshable(e.SerpentStingDebuff) and not a:BuffUp(e.MongooseFuryBuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif (((i:DebuffRefreshable(e.SerpentStingDebuff) and a:BuffDown(e.CoordinatedAssault)) or (e.AlphaPredator:IsAvailable() and i:DebuffRefreshable(e.SerpentStingDebuff) and not a:BuffUp(e.MongooseFuryBuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif (((i:DebuffRefreshable(e.SerpentStingDebuff) and a:BuffDown(e.CoordinatedAssault)) or (e.AlphaPredator:IsAvailable() and i:DebuffRefreshable(e.SerpentStingDebuff) and not a:BuffUp(e.MongooseFuryBuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif ((i:DebuffRefreshable(e.SerpentStingDebuff) and a:BuffDown(e.CoordinatedAssault)) or (e.AlphaPredator:IsAvailable() and i:DebuffRefreshable(e.SerpentStingDebuff) and not a:BuffUp(e.MongooseFuryBuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function he(i)
                if ((d(e.KillCommand:ExecuteTime(), 15) and e.KillCommand:FullRechargeTime() < a:GCD() and ((y and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((d(e.KillCommand:ExecuteTime(), 15) and e.KillCommand:FullRechargeTime() < a:GCD() and ((y and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((d(e.KillCommand:ExecuteTime(), 15) and e.KillCommand:FullRechargeTime() < a:GCD() and ((y and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (d(e.KillCommand:ExecuteTime(), 15) and e.KillCommand:FullRechargeTime() < a:GCD() and ((y and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function oe(i)
                if ((i:DebuffUp(e.PheromoneBombDebuff) and a:HasTier(28, 2)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == f("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((i:DebuffUp(e.PheromoneBombDebuff) and a:HasTier(28, 2)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((i:DebuffUp(e.PheromoneBombDebuff) and a:HasTier(28, 2)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (i:DebuffUp(e.PheromoneBombDebuff) and a:HasTier(28, 2)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function je(a)
                if ((d(e.KillCommand:ExecuteTime(), 15) and ((y and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == f("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((d(e.KillCommand:ExecuteTime(), 15) and ((y and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((d(e.KillCommand:ExecuteTime(), 15) and ((y and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (d(e.KillCommand:ExecuteTime(), 15) and ((y and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function ge(a)
                if ((a:DebuffDown(e.SerpentStingDebuff) and a:TimeToDie() > 15) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == f("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif ((a:DebuffDown(e.SerpentStingDebuff) and a:TimeToDie() > 15) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not w) then
        s = 999
        return true
    elseif ((a:DebuffDown(e.SerpentStingDebuff) and a:TimeToDie() > 15) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif (a:DebuffDown(e.SerpentStingDebuff) and a:TimeToDie() > 15) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function Te()
    if A(257284):IsCastable() and A(339264):ConduitEnabled() and t:DebuffDown(A(257284)) and qe(Enemies40y) <= 0 and (UnitName("target") == "Nalthor the Rimebinder" or UnitName("target") == "Tirnenn Villager" or UnitName("target") == "Drust Boughbreaker" or UnitName("target") == "Ingra Maloch" or UnitName("target") == "Mistveil Stalker" or UnitName("target") == "Mistcaller" or UnitName("target") == "Blightbone" or UnitName("target") == "Rotspew" or UnitName("target") == "Amarth" or UnitName("target") == "Surgeon Stitchflesh" or UnitName("target") == "Lubricator" or UnitName("target") == "Tred'ova" or UnitName("target") == "Azules" or UnitName("target") == "Ventunax" or UnitName("target") == "Oryphion" or UnitName("target") == "Astronos" or UnitName("target") == "Lakesis" or UnitName("target") == "Klotos" or UnitName("target") == "Devos" or UnitName("target") == "Halkias" or UnitName("target") == "High Adjudicator Aleez" or UnitName("target") == "Wo Drifter" or UnitName("target") == "Lord Chamberlain" or UnitName("target") == "Enraged Spirit" or UnitName("target") == "Hakkar The Soulflayer" or UnitName("target") == "Sentient Oil" or UnitName("target") == "Millhouse Manastorm" or UnitName("target") == "Millificent Manastorm" or UnitName("target") == "Dealer Xy’exa" or UnitName("target") == "Mueh'zala" or UnitName("target") == "Fungi Stormer" or UnitName("target") == "Globgrog" or UnitName("target") == "Slime Tentacle" or UnitName("target") == "Virulax Blightweaver" or UnitName("target") == "Doctor Ickus" or UnitName("target") == "Domina Venomblade" or UnitName("target") == "Margrave Stradama" or UnitName("target") == "Dreadful Huntmaster" or UnitName("target") == "Insatiable Brute" or UnitName("target") == "Kryxis the Voracious" or UnitName("target") == "Grand Overseer" or UnitName("target") == "Research Scribe" or UnitName("target") == "Executor Tarvold" or UnitName("target") == "Grand Proctor Beryllia" or UnitName("target") == "General Kaal" or UnitName("target") == "Paceran the Virulent" or UnitName("target") == "Shard of Halkias" or UnitName("target") == "Shambling Arbalest" or UnitName("target") == "Nekthara the Mangler" or UnitName("target") == "Harugia the Bloodthirtsy" or UnitName("target") == "Heavin the Breaker" or UnitName("target") == "Echelon" or UnitName("target") == "Advent Nevermore" or UnitName("target") == "Xav the Unfallen" or UnitName("target") == "Portal Guardian" or UnitName("target") == "Kul'Tharok" or UnitName("target") == "Gorechop" or UnitName("target") == "Mordretha, the Endless Empress" or UnitName("target") == "Gatewarden Zo'mazz" or UnitName("target") == "Zophex" or UnitName("target") == "Alcruux" or UnitName("target") == "Achillite" or UnitName("target") == "Venza Goldfuse" or UnitName("target") == "Zo'gron" or UnitName("target") == "P.O.S.T Master" or UnitName("target") == "So'azmi" or UnitName("target") == "Portalmancer Zo'dahh" or (IsInRaid() and UnitName("boss1") == UnitName("boss1"))) then
        if i(e.HuntersMark, nil) then
            o = 257284
            return "HuntersMark M+ open"
        end

    end

    if (N:IsActive() and select(2, GetStablePetInfo(n.Commons.SummonPetSlot)) ~= select(1, UnitName("pet"))) and n.Commons.SummonPetSlot ~= 0 and not a:IsMoving() and not a:PrevGCD(1, e.DismissPet) and not a:IsCasting(e.DismissPet) then
        if i(e.DismissPet, nil) then
            o = 2641
            return "Dismiss Pet"
        end

    end

    if e.SummonPet:IsCastable() and (not N:IsActive() or (N:IsActive() and select(2, GetStablePetInfo(n.Commons.SummonPetSlot)) ~= select(1, UnitName("pet")))) and n.Commons.SummonPetSlot ~= 0 then
                                        if n.Commons.SummonPetSlot == 1 then
            if i(x[n.Commons.SummonPetSlot], nil) then
                o = 883
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 2 then
            if i(x[n.Commons.SummonPetSlot], nil) then
                o = 83242
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 3 then
            if i(x[n.Commons.SummonPetSlot], nil) then
                o = 83243
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 4 then
            if i(x[n.Commons.SummonPetSlot], nil) then
                o = 83244
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 5 then
            if i(x[n.Commons.SummonPetSlot], nil) then
                o = 83245
                return "Summon Pet"
            end

        end

    end

    if (c.TargetIsValid() or t:NPCID() == 179733) then
        if e.KillShot:IsReady() then
            if i(e.KillShot, nil, nil, not t:IsSpellInRange(e.KillShot)) then
                o = 320976
                return "kill_shot precombat 4"
            end

        end

        if e.TarTrap:IsCastable() and (H) then
            if i(e.TarTrap, nil, nil, not t:IsInRange(40)) then
                o = 187698
                return "tar_trap precombat 6"
            end

        end

        if e.Flare:IsCastable() and (H and a:PrevGCD(1, e.TarTrap)) then
            if i(e.Flare, nil) then
                o = 1543
                return "flare precombat 8"
            end

        end

        if t:IsInMeleeRange(5) or (a:BuffUp(e.AspectoftheEagle) and t:IsInRange(40)) then
                        if e.MongooseBite:IsReady() then
                if i(e.MongooseBite) then
                    o = 259387
                    return "mongoose_bite precombat 14"
                end

            elseif e.RaptorStrike:IsReady() then
                if i(e.RaptorStrike) then
                    o = 186270
                    return "raptor_strike precombat 16"
                end

            end

        end

    end

end

local function Ee()
    VarSyncUp = (t:DebuffUp(e.ResonatingArrowDebuff) or a:BuffUp(e.CoordinatedAssault))
    VarStrongSyncUp = ((j == 1 and t:DebuffUp(e.ResonatingArrowDebuff) and a:BuffUp(e.CoordinatedAssault)) or (j ~= 1 and a:BuffUp(e.CoordinatedAssault)))
    if (a:BuffDown(e.CoordinatedAssault)) then
        if (j == 1) then
            VarStrongSyncRemains = (e.ResonatingArrow:CooldownRemains() < e.CoordinatedAssault:CooldownRemains()) and e.ResonatingArrow:CooldownRemains() or e.CoordinatedAssault:CooldownRemains()
        else
            VarStrongSyncRemains = e.CoordinatedAssault:CooldownRemains()
        end

    end

    if (a:BuffUp(e.CoordinatedAssault)) then
        if (j == 1) then
            VarStrongSyncRemains = e.ResonatingArrow:CooldownRemains()
        else
            VarStrongSyncRemains = e.CoordinatedAssault:CooldownRemains()
        end

    end

    if (j == 1) then
        VarSyncRemains = (e.ResonatingArrow:CooldownRemains() > e.CoordinatedAssault:CooldownRemains()) and e.ResonatingArrow:CooldownRemains() or e.CoordinatedAssault:CooldownRemains()
    else
        VarSyncRemains = e.CoordinatedAssault:CooldownRemains()
    end

    if h:IsReady() and _() and h:ID() ~= q.MistcallerOcarina:ID() and (n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (((h:TrinketHasUseBuff() or j == 1 and h:HasCooldown()) and (VarStrongSyncUp and (j ~= 1 and (not r:TrinketHasUseBuff()) or j == 1 and (not r:HasCooldown()) or r:CooldownRemains() > 0 or h:TrinketHasUseBuff() and ((not r:TrinketHasUseBuff()) or h:Cooldown() >= r:Cooldown()) or h:HasCooldown() and (not r:TrinketHasUseBuff()) and h:Cooldown() >= r:Cooldown()) or (not VarStrongSyncUp) and ((not r:TrinketHasUseBuff()) and (h:Cooldown() - 5 < VarSyncRemains or VarSyncRemains > h:Cooldown() / 2) or r:TrinketHasUseBuff() and (h:TrinketHasUseBuff() and h:Cooldown() >= r:Cooldown() and (h:Cooldown() - 5 < VarSyncRemains or VarSyncRemains > h:Cooldown() / 2) or ((not h:TrinketHasUseBuff()) or r:Cooldown() >= h:Cooldown()) and (r:IsReady() and r:Cooldown() - 5 > VarSyncRemains and VarSyncRemains < r:Cooldown() / 2 or (not r:IsReady()) and (r:CooldownRemains() - 5 < VarStrongSyncRemains and VarStrongSyncRemains > 20 and (h:Cooldown() - 5 < VarSyncRemains or r:CooldownRemains() - 5 < VarSyncRemains and r:Cooldown() - 10 + VarSyncRemains < VarStrongSyncRemains or VarSyncRemains > h:Cooldown() / 2 or VarSyncUp) or r:CooldownRemains() - 5 > VarStrongSyncRemains and (h:Cooldown() - 5 < VarStrongSyncRemains or h:Cooldown() < FightRemains and VarStrongSyncRemains + h:Cooldown() > FightRemains or (not h:TrinketHasUseBuff()) and (VarSyncRemains > h:Cooldown() / 2 or VarSyncUp)))))) or t:TimeToDie() < VarSyncRemains) or (not h:TrinketHasUseBuff()) and j ~= 1 and (r:TrinketHasUseBuff() and (((not VarSyncUp) or r:CooldownRemains() > 5) and (VarSyncRemains > 20 or r:CooldownRemains() - 5 > VarSyncRemains)) or (not r:TrinketHasUseBuff()) and ((not r:HasCooldown()) or r:CooldownRemains() > 0 or r:Cooldown() >= h:Cooldown()))) and (h:ID() ~= q.CacheofAcquiredTreasures:ID() or p < 2 and a:BuffUp(e.AcquiredWandBuff) or p > 1 and a:BuffDown(e.AcquiredWandBuff))) then
        if i(h, nil, nil) then
                        if h:ID() == K and n.Commons.Enabled.TopTrinket then
                o = 24
                return "Top trinket1 trinkets 4"
            elseif h:ID() == G and n.Commons.Enabled.BottomTrinket then
                o = 30
                return " Bot trinket1 trinkets 4"
            end

        end

    end

    if r:IsReady() and r:ID() ~= q.MistcallerOcarina:ID() and _() and (n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (((r:TrinketHasUseBuff() or j == 1 and r:HasCooldown()) and (VarStrongSyncUp and (j ~= 1 and (not h:TrinketHasUseBuff()) or j == 1 and (not h:HasCooldown()) or h:CooldownRemains() > 0 or r:TrinketHasUseBuff() and ((not h:TrinketHasUseBuff()) or r:Cooldown() >= h:Cooldown()) or r:HasCooldown() and (not h:TrinketHasUseBuff()) and r:Cooldown() >= h:Cooldown()) or (not VarStrongSyncUp) and ((not h:TrinketHasUseBuff()) and (r:Cooldown() - 5 < VarSyncRemains or VarSyncRemains > r:Cooldown() / 2) or h:TrinketHasUseBuff() and (r:TrinketHasUseBuff() and r:Cooldown() >= h:Cooldown() and (r:Cooldown() - 5 < VarSyncRemains or VarSyncRemains > r:Cooldown() / 2) or ((not r:TrinketHasUseBuff()) or h:Cooldown() >= r:Cooldown()) and (h:IsReady() and h:Cooldown() - 5 > VarSyncRemains and VarSyncRemains < h:Cooldown() / 2 or (not h:IsReady()) and (h:CooldownRemains() - 5 < VarStrongSyncRemains and VarStrongSyncRemains > 20 and (r:Cooldown() - 5 < VarSyncRemains or h:CooldownRemains() - 5 < VarSyncRemains and h:Cooldown() - 10 + VarSyncRemains < VarStrongSyncRemains or VarSyncRemains > r:Cooldown() / 2 or VarSyncUp) or h:CooldownRemains() - 5 > VarStrongSyncRemains and (r:Cooldown() - 5 < VarStrongSyncRemains or r:Cooldown() < FightRemains and VarStrongSyncRemains + r:Cooldown() > FightRemains or (not r:TrinketHasUseBuff()) and (VarSyncRemains > r:Cooldown() / 2 or VarSyncUp)))))) or t:TimeToDie() < VarSyncRemains) or (not r:TrinketHasUseBuff()) and j ~= 1 and (h:TrinketHasUseBuff() and (((not VarSyncUp) or h:CooldownRemains() > 5) and (VarSyncRemains > 20 or h:CooldownRemains() - 5 > VarSyncRemains)) or (not h:TrinketHasUseBuff()) and ((not h:HasCooldown()) or h:CooldownRemains() > 0 or h:Cooldown() >= r:Cooldown()))) and (r:ID() ~= q.CacheofAcquiredTreasures:ID() or p < 2 and a:BuffUp(e.AcquiredWandBuff) or p > 1 and a:BuffDown(e.AcquiredWandBuff))) then
        if i(r, nil, nil) then
                        if r:ID() == K and n.Commons.Enabled.TopTrinket then
                o = 24
                return "Top trinket2 trinkets 6"
            elseif r:ID() == G and n.Commons.Enabled.BottomTrinket then
                o = 30
                return " Bot trinket2 trinkets 6"
            end

        end

    end

    if q.Jotungeirr:IsEquippedAndReady() and _() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if i(q.Jotungeirr, nil, nil) then
            o = 16
            return "jotungeirr_destinys_call trinkets 6"
        end

    end

end

local function f()
    if (a:BuffUp(e.CoordinatedAssault)) and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if e.BloodFury:IsCastable() and _() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.BloodFury, nil) then
                o = 20572
                return "blood_fury cds 6"
            end

        end

        if e.AncestralCall:IsCastable() and _() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.AncestralCall, nil) then
                o = 274738
                return "ancestral_call cds 8"
            end

        end

        if e.Fireblood:IsCastable() and _() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.Fireblood, nil) then
                o = 265221
                return "fireblood cds 10"
            end

        end

    end

    if e.LightsJudgment:IsCastable() and _() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if i(e.LightsJudgment, nil, nil, not t:IsSpellInRange(e.LightsJudgment)) then
            o = 255647
            return "lights_judgment cds 12"
        end

    end

    if e.BagofTricks:IsCastable() and _() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (e.KillCommand:FullRechargeTime() > a:GCD()) then
        if i(e.BagofTricks, nil, nil, not t:IsSpellInRange(e.BagofTricks)) then
            o = 312411
            return "bag_of_tricks cds 14"
        end

    end

    if e.Berserking:IsCastable() and _() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (a:BuffUp(e.CoordinatedAssault) or t:TimeToDie() < 13) then
        if i(e.Berserking, nil) then
            o = 26297
            return "berserking cds 16"
        end

    end

    if q.PotionOfSpectralAgility:IsReady() and ie and _ and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (((t:TimeToDie() < 25 or a:BuffUp(e.CoordinatedAssault)) and not l.GUISettings.General.HoldPotforBL) or (a:BloodlustUp() and l.GUISettings.General.HoldPotforBL)) then
        if i(q.PotionOfSpectralAgility, nil, nil) then
            o = 50
            return "potion cds 18"
        end

    end

    if e.TarTrap:IsCastable() and (d(e.TarTrap:ExecuteTime()) and H and t:DebuffDown(e.SoulforgeEmbersDebuff) and (p > 1 or p == 1 and t:TimeToDie() > 5 * a:GCD())) then
        if i(e.TarTrap, nil, nil, not t:IsInRange(40)) then
            o = 187698
            return "tar_trap cds 20"
        end

    end

    if e.Flare:IsCastable() and (d(e.Flare:ExecuteTime()) and H and t:TimeToDie() > 4 * a:GCD()) then
        if i(e.Flare, nil) then
            o = 1543
            return "flare cds 22"
        end

    end

    if e.KillShot:IsReady() and (p == 1 and t:TimeToDie() < a:Focus() / (g - a:FocusCastRegen(e.KillShot:ExecuteTime())) * a:GCD()) then
        if i(e.KillShot, nil, nil, not t:IsSpellInRange(e.KillShot)) then
            o = 320976
            return "kill_shot cds 24"
        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (p == 1 and t:TimeToDie() < a:Focus() / (g - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD()) then
        if i(e.MongooseBite, nil, nil, not t:IsSpellInRange(e.MongooseBite)) then
            o = 259387
            return "mongoose_bite cds 26"
        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (p == 1 and t:TimeToDie() < a:Focus() / (g - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD()) then
        if i(e.RaptorStrike, nil, nil, not t:IsSpellInRange(e.RaptorStrike)) then
            o = 186270
            return "raptor_strike cds 28"
        end

    end

    if e.AspectoftheEagle:IsCastable() and n.Survival.AspectoftheEagle and not t:IsInMeleeRange(10) and t:IsInMeleeRange(40) and not e.Harpoon:IsCastable() and not a:PrevGCD(1, e.Harpoon) and e.Harpoon:CooldownRemains() < 19 then
        if i(e.AspectoftheEagle, nil) then
            o = 186289
            return "aspect_of_the_eagle cds 30"
        end

    end

end

local function h()
    if e.SteelTrap:IsCastable() then
        if i(e.SteelTrap, nil, nil, not t:IsInRange(40)) then
            o = 162488
            return "steel_trap nta 2"
        end

    end

    if e.FreezingTrap:IsCastable() and (t:DebuffDown(e.WildSpiritsDebuff) or (t:DebuffUp(e.WildSpiritsDebuff) and not e.KillCommand:CooldownUp())) then
        if i(e.FreezingTrap, nil, nil, not t:IsInRange(40)) then
            o = 187650
            return "freezing_trap nta 4"
        end

    end

    if e.TarTrap:IsCastable() and (t:DebuffDown(e.WildSpiritsDebuff) or (t:DebuffUp(e.WildSpiritsDebuff) and not e.KillCommand:CooldownUp())) then
        if i(e.TarTrap, nil, nil, not t:IsInRange(40)) then
            o = 187698
            return "tar_trap nta 6"
        end

    end

end

local function _e()
    if T and e.DeathChakram:IsCastable() and (d(e.DeathChakram:ExecuteTime())) then
        if i(e.DeathChakram, nil, nil, not t:IsSpellInRange(e.DeathChakram)) then
            o = 325028
            return "death_chakram st 2"
        end

    end

    if e.KillShot:IsReady() then
        if i(e.KillShot, nil, nil, not t:IsSpellInRange(e.KillShot)) then
            o = 320976
            return "kill_shot st 14"
        end

    end

    if e.SerpentSting:IsReady() then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, be, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting st 4"
        end

        if k(t) and be(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting st 4"
            end

        end

    end

    if true then
        if e.FlayedShot:IsCastable() and T then
            if i(e.FlayedShot, nil, nil, not t:IsSpellInRange(e.FlayedShot)) then
                o = 324149
                return "flayed_shot st 6"
            end

        end

        if e.ResonatingArrow:IsCastable() and T and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.ResonatingArrow, nil, nil, not t:IsInRange(40)) then
                o = 308491
                return "resonating_arrow st 8"
            end

        end

        if e.WildSpirits:IsCastable() and T and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.WildSpirits, nil, nil, not t:IsInRange(40)) then
                o = 328231
                return "wild_spirits st 10"
            end

        end

        if e.CoordinatedAssault:IsCastable() and _() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.CoordinatedAssault, nil) then
                o = 266779
                return "coordinated_assault st 12"
            end

        end

    end

    if e.FlankingStrike:IsCastable() and (t:IsInMeleeRange(15)) and (d(e.FlankingStrike:ExecuteTime())) then
        if i(e.FlankingStrike, nil, nil, not t:IsSpellInRange(e.FlankingStrike)) then
            o = 269751
            return "flanking_strike st 16"
        end

    end

    if e.AMurderofCrows:IsReady() then
        if i(e.AMurderofCrows, nil, nil, not t:IsSpellInRange(e.AMurderofCrows)) then
            o = 131894
            return "a_murder_of_crows st 18"
        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and ((e.WildfireBomb:FullRechargeTime() < 2 * a:GCD() and a:HasTier(28, 2)) or (a:BuffUp(e.MadBombardierBuff)) or (not a:HasTier(28, 2) and (e.WildfireBomb:FullRechargeTime() < a:GCD() or ((d(e.WildfireBomb:ExecuteTime()) and ((e.VolatileBomb:IsReady() and t:DebuffUp(e.SerpentStingDebuff) and t:DebuffRefreshable(e.SerpentStingDebuff)) or (e.PheromoneBomb:IsReady() and a:BuffDown(e.MongooseFuryBuff) and a:Focus() + a:FocusCastRegen(e.WildfireBomb:ExecuteTime()) < a:FocusMax() - a:FocusCastRegen(e.KillCommand:ExecuteTime()) * 3))) or t:TimeToDie() < 10)))) then
        if e.WildfireInfusion:IsAvailable() then
            if e.ShrapnelBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                    o = 259495
                    return "shrapnel_bomb cleave 8"
                end

            end

            if e.PheromoneBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                    o = 259495
                    return "pheromone_bomb cleave 8"
                end

            end

            if e.VolatileBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                    o = 259495
                    return "volatile_bomb cleave 8"
                end

            end

        else
            if e.WildfireBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
                    o = 259495
                    return "wildfire_bomb cleave 8"
                end

            end

        end

    end

    if e.KillCommand:IsReady() and (a:HasTier(28, 2) and a:BuffDown(e.MadBombardierBuff)) then
        if c.CastTargetIf(e.KillCommand, u, "min", b, D, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 23"
        end

        if b(t) and D(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command st 23"
            end

        end

    end

    if e.KillCommand:IsCastable() and e.AlphaPredator:IsAvailable() then
        if c.CastTargetIf(e.KillCommand, u, "min", b, S, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 32a"
        end

        if b(t) and S(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command st 32"
            end

        end

    end

    if e.Carve:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (p > 1 and not C) then
        if i(e.Carve, nil, nil, not t:IsInRange(8)) then
            o = 187708
            return "carve st 24"
        end

    end

    if e.Butchery:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (p > 1 and not C and e.WildfireBomb:FullRechargeTime() > p and (e.Butchery:ChargesFractional() > 2.5 or t:DebuffUp(e.ShrapnelBombDebuff))) then
        if i(e.Butchery, nil, nil, not t:IsInRange(8)) then
            o = 212436
            return "butchery st 26"
        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.MongooseBite, u, "max", v, ce, not t:IsSpellInRange(e.MongooseBite)) then
            return "mongoose_bite st 30"
        end

        if v(t) and ce(t) then
            if i(e.MongooseBite, nil, nil, not t:IsInRange(40)) then
                o = 259387
                return "mongoose_bite st 30"
            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", b, S, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 33a"
        end

        if b(t) and S(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command st 33"
            end

        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.RaptorStrike, u, "max", v, ze, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike st 34"
        end

        if v(t) and ze(t) then
            if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
                o = 186270
                return "raptor_strike st 34"
            end

        end

    end

    if e.MongooseBite:IsReady() and (t:DebuffUp(e.ShrapnelBombDebuff)) and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if i(e.MongooseBite, nil, nil, not t:IsSpellInRange(e.MongooseBite)) then
            o = 259387
            return "mongoose_bite st 36"
        end

    end

    if e.SerpentSting:IsReady() then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, pe, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting st 38"
        end

        if k(t) and pe(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting st 38"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and e.ShrapnelBomb:IsCastable() and (a:Focus() > g * 2 and t:DebuffRemains(e.SerpentStingDebuff) > 5 * a:GCD() and not a:HasTier(28, 2)) then
        if m then
            s = 9999
        end

        if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
            o = 259495
            return "shrapnel_bomb st 40"
        end

    end

    if e.Chakrams:IsReady() then
        if i(e.Chakrams, nil, nil, not t:IsSpellInRange(e.Chakrams)) then
            o = 259391
            return "chakrams st 42"
        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", b, xe, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 44"
        end

        if b(t) and xe(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command st 44"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and C then
        if e.ShrapnelBomb:IsCastable() then
            if m then
                s = 9999
            end

            if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                o = 259495
                return "shrapnel_bomb st 46"
            end

        end

        if e.PheromoneBomb:IsCastable() then
            if m then
                s = 9999
            end

            if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                o = 259495
                return "pheromone_bomb st 48"
            end

        end

        if e.VolatileBomb:IsCastable() then
            if m then
                s = 9999
            end

            if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                o = 259495
                return "volatile_bomb st 50"
            end

        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.MongooseBite, u, "max", v, J, not t:IsSpellInRange(e.MongooseBite)) then
            return "mongoose_bite st 52"
        end

        if v(t) and J(t) then
            if i(e.MongooseBite, nil, nil, not t:IsInRange(40)) then
                o = 259387
                return "mongoose_bite st 52"
            end

        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.RaptorStrike, u, "max", v, O, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike st 54"
        end

        if v(t) and O(t) then
            if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
                o = 186270
                return "raptor_strike st 54"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and e.VolatileBomb:IsCastable() and (t:DebuffUp(e.SerpentStingDebuff)) and not a:HasTier(28, 2) then
        if m then
            s = 9999
        end

        if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
            o = 259495
            return "volatile_bomb st 56"
        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and e.PheromoneBomb:IsCastable() and not a:HasTier(28, 2) then
        if m then
            s = 9999
        end

        if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
            o = 259495
            return "pheromone_bomb st 58"
        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and e.ShrapnelBomb:IsCastable() and (a:Focus() > 50) and not a:HasTier(28, 2) then
        if m then
            s = 9999
        end

        if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
            o = 259495
            return "shrapnel_bomb st 60"
        end

    end

    if e.RaptorStrike:IsReady() and (EagleUp and t:IsInMeleeRange(40)) and not t:IsInMeleeRange(8) then
        if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
            o = 186270
            return "raptor_strike st 53"
        end

    end

end

local function H()
    if e.SerpentSting:IsReady() then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, X, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting bop 2"
        end

        if k(t) and X(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting bop 2"
            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", b, ae, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command bop 6"
        end

        if b(t) and ae(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command bop 6"
            end

        end

    end

    if e.KillShot:IsReady() then
        if i(e.KillShot, nil, nil, not t:IsSpellInRange(e.KillShot)) then
            o = 320976
            return "kill_shot bop 4"
        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and e.WildfireBomb:IsCastable() and ((d(e.WildfireBomb:ExecuteTime()) and t:DebuffDown(e.WildfireBombDebuff) and e.WildfireBomb:FullRechargeTime() < a:GCD()) or (a:BuffUp(e.MadBombardierBuff))) then
        if m then
            s = 9999
        end

        if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
            o = 259495
            return "wildfire_bomb bop 8"
        end

    end

    if e.FlankingStrike:IsCastable() and (t:IsInMeleeRange(15)) and (d(e.FlankingStrike:ExecuteTime())) then
        if i(e.FlankingStrike, nil, nil, not t:IsSpellInRange(e.FlankingStrike)) then
            o = 269751
            return "flanking_strike bop 10"
        end

    end

    if T and e.FlayedShot:IsCastable() then
        if i(e.FlayedShot, nil, nil, not t:IsSpellInRange(e.FlayedShot)) then
            o = 324149
            return "flayed_shot bop 12"
        end

    end

    if (y and a:Focus() < g) then
        local e = h()
        if e then
            return e
        end

    end

    if T and e.DeathChakram:IsCastable() and (d(e.DeathChakram:ExecuteTime())) then
        if i(e.DeathChakram, nil, nil, not t:IsSpellInRange(e.DeathChakram)) then
            o = 325028
            return "death_chakram bop 14"
        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.RaptorStrike, u, "max", v, re, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike bop 16"
        end

        if v(t) and re(t) then
            if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
                o = 186270
                return "raptor_strike bop 16"
            end

        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.MongooseBite, u, "max", v, de, not t:IsSpellInRange(e.MongooseBite)) then
            return "mongoose_bite bop 18"
        end

        if v(t) and de(t) then
            if i(e.MongooseBite, nil, nil, not t:IsInRange(40)) then
                o = 259387
                return "mongoose_bite bop 18"
            end

        end

    end

    if e.AMurderofCrows:IsReady() then
        if i(e.AMurderofCrows, nil, nil, not t:IsSpellInRange(e.AMurderofCrows)) then
            o = 131894
            return "a_murder_of_crows bop 20"
        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (a:BuffStack(e.TipoftheSpearBuff) == 3) then
        if c.CastTargetIf(e.RaptorStrike, u, "max", v, O, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike bop 22"
        end

        if v(t) and O(t) then
            if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
                o = 186270
                return "raptor_strike bop 22"
            end

        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.MongooseBite, u, "max", v, ne, not t:IsSpellInRange(e.MongooseBite)) then
            return "mongoose_bite bop 18"
        end

        if v(t) and ne(t) then
            if i(e.MongooseBite, nil, nil, not t:IsInRange(40)) then
                o = 259387
                return "mongoose_bite bop 18"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and e.WildfireBomb:IsCastable() and (d(e.WildfireBomb:ExecuteTime()) and t:DebuffDown(e.WildfireBombDebuff) and (e.WildfireBomb:FullRechargeTime() < a:GCD() or t:DebuffDown(e.WildfireBombDebuff) and a:BuffRemains(e.MongooseFuryBuff) > e.WildfireBomb:FullRechargeTime() - a:GCD() or t:DebuffDown(e.WildfireBombDebuff) and a:BuffDown(e.MongooseFuryBuff)) or t:TimeToDie() < 18 and t:DebuffDown(e.WildfireBombDebuff)) then
        if m then
            s = 9999
        end

        if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
            o = 259495
            return "wildfire_bomb bop 24"
        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", b, te, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command bop 26"
        end

        if b(t) and te(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command bop 26"
            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", b, Z, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command bop 28"
        end

        if b(t) and Z(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command bop 28"
            end

        end

    end

    if e.SerpentSting:IsReady() then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, se, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting bop 34"
        end

        if k(t) and se(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting bop 34"
            end

        end

    end

    if true then
        if e.ResonatingArrow:IsCastable() and T and (t:IsInMeleeRange(8)) then
            if i(e.ResonatingArrow, nil, nil, not t:IsInRange(40)) then
                o = 308491
                return "resonating_arrow bop 36"
            end

        end

        if e.WildSpirits:IsCastable() and T and (t:IsInMeleeRange(8)) then
            if i(e.WildSpirits, nil, nil, not t:IsInRange(40)) then
                o = 328231
                return "wild_spirits bop 38"
            end

        end

        if e.CoordinatedAssault:IsCastable() and _() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.CoordinatedAssault, nil) then
                o = 266779
                return "coordinated_assault bop 40"
            end

        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (a:BuffUp(e.MongooseFuryBuff) or a:Focus() + a:FocusCastRegen(e.KillCommand:ExecuteTime()) > a:FocusMax() or a:BuffUp(e.CoordinatedAssault)) then
        if i(e.MongooseBite, nil, nil, not t:IsSpellInRange(e.MongooseBite)) then
            o = 259387
            return "mongoose_bite bop 42"
        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.RaptorStrike, u, "max", v, O, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike bop 44"
        end

        if v(t) and O(t) then
            if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
                o = 186270
                return "raptor_strike bop 44"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and e.WildfireBomb:IsCastable() and (t:DebuffRefreshable(e.WildfireBombDebuff)) then
        if m then
            s = 9999
        end

        if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
            o = 259495
            return "wildfire_bomb bop 46"
        end

    end

    if e.SerpentSting:IsReady() and (a:BuffUp(e.VipersVenomBuff)) then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, nil, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting bop 48"
        end

        if k(t) and t:DebuffDown(e.SerpentSting) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting bop 34"
            end

        end

    end

end

local function C()
    if e.SerpentSting:IsReady() and (e.HydrasBite:IsAvailable() and a:BuffUp(e.VipersVenomBuff) and a:BuffRemains(e.VipersVenomBuff) < a:GCD()) then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, nil, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting cleave 2"
        end

        if k(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting bop 34"
            end

        end

    end

    if true then
        if e.WildSpirits:IsCastable() and T and (t:IsInMeleeRange(8)) then
            if i(e.WildSpirits, nil, nil, not t:IsInRange(40)) then
                o = 328231
                return "wild_spirits cleave 4"
            end

        end

        if e.ResonatingArrow:IsCastable() and T and (t:IsInMeleeRange(8)) then
            if i(e.ResonatingArrow, nil, nil, not t:IsInRange(40)) then
                o = 308491
                return "resonating_arrow cleave 6"
            end

        end

    end

    if e.CoordinatedAssault:IsReady() and _() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if i(e.CoordinatedAssault, nil) then
            o = 266779
            return "coordinated_assault cleave 18"
        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and (e.WildfireBomb:FullRechargeTime() < a:GCD() or (a:BuffUp(e.MadBombardierBuff) and a:HasTier(28, 2))) then
        if e.WildfireInfusion:IsAvailable() then
            if e.ShrapnelBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                    o = 259495
                    return "shrapnel_bomb cleave 8"
                end

            end

            if e.PheromoneBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                    o = 259495
                    return "pheromone_bomb cleave 8"
                end

            end

            if e.VolatileBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                    o = 259495
                    return "volatile_bomb cleave 8"
                end

            end

        else
            if e.WildfireBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
                    o = 259495
                    return "wildfire_bomb cleave 8"
                end

            end

        end

    end

    if e.KillCommand:IsReady() and (a:HasTier(28, 2) and a:BuffDown(e.MadBombardierBuff)) and n.Survival.KCFish then
        if c.CastTargetIf(e.KillCommand, u, "min", b, D, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 23"
        end

        if b(t) and D(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command st 23"
            end

        end

    end

    if e.DeathChakram:IsCastable() and T and (d(e.DeathChakram:ExecuteTime()) and not ee) then
        if i(e.DeathChakram, nil, nil, not t:IsSpellInRange(e.DeathChakram)) then
            o = 325028
            return "death_chakram cleave 16"
        end

    end

    if (y and a:Focus() < g) then
        local e = h()
        if e then
            return e
        end

    end

    if e.Chakrams:IsReady() then
        if i(e.Chakrams, nil, nil, not t:IsSpellInRange(e.Chakrams)) then
            o = 259391
            return "chakrams cleave 10"
        end

    end

    if e.Butchery:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (t:DebuffUp(e.ShrapnelBombDebuff) and (t:DebuffStack(e.InternalBleedingDebuff) < 2 or t:DebuffRemains(e.ShrapnelBombDebuff) < a:GCD())) then
        if i(e.Butchery, nil, nil, not t:IsInRange(8)) then
            o = 212436
            return "butchery cleave 12"
        end

    end

    if e.Carve:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (t:DebuffUp(e.ShrapnelBombDebuff) and not a:HasTier(28, 2)) then
        if i(e.Carve, nil, nil, not t:IsInRange(8)) then
            o = 187708
            return "carve cleave 14"
        end

    end

    if e.Butchery:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (e.Butchery:ChargesFractional() > 2.5 and e.WildfireBomb:FullRechargeTime() > (p / 2)) then
        if i(e.Butchery, nil, nil, not t:IsInRange(8)) then
            o = 212436
            return "butchery cleave 20"
        end

    end

    if e.FlankingStrike:IsCastable() and (t:IsInMeleeRange(15)) and (d(e.FlankingStrike:ExecuteTime())) then
        if i(e.FlankingStrike, nil, nil, not t:IsSpellInRange(e.FlankingStrike)) then
            o = 269751
            return "flanking_strike cleave 22"
        end

    end

    if e.Carve:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (e.WildfireBomb:FullRechargeTime() > p / 2) then
        if i(e.Carve, nil, nil, not t:IsInRange(8)) then
            o = 187708
            return "carve cleave 24"
        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and e.WildfireBomb:IsCastable() and (a:BuffUp(e.MadBombardierBuff)) then
        if e.WildfireInfusion:IsAvailable() then
            if e.ShrapnelBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                    o = 259495
                    return "shrapnel_bomb cleave 28"
                end

            end

            if e.PheromoneBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                    o = 259495
                    return "pheromone_bomb cleave 28"
                end

            end

            if e.VolatileBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                    o = 259495
                    return "volatile_bomb cleave 28"
                end

            end

        else
            if e.WildfireBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
                    o = 259495
                    return "wildfire_bomb cleave 28"
                end

            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", b, oe, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command cleave 26"
        end

        if b(t) and oe(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command cleave 26"
            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", b, S, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 34a"
        end

        if b(t) and S(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command st 34"
            end

        end

    end

    if e.KillShot:IsReady() and a:BuffUp(e.FlayersMark) then
        if i(e.KillShot, nil, nil, not t:IsSpellInRange(e.KillShot)) then
            o = 320976
            return "kill_shot cleave 34"
        end

    end

    if T and e.FlayedShot:IsCastable() then
        if c.CastTargetIf(e.FlayedShot, u, "max", ke, ue, not t:IsSpellInRange(e.FlayedShot)) then
            return "flayed_shot cleave 28"
        end

        if ke(t) and ue(t) then
            if i(e.FlayedShot, nil, nil, not t:IsInRange(40)) then
                o = 324149
                return "flayed_shot cleave 28"
            end

        end

    end

    if e.SerpentSting:IsReady() and (e.VolatileBomb:IsCastable() and a:Focus() + a:FocusCastRegen(e.SerpentSting:ExecuteTime()) > 35 and p <= 4) then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, ge, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting cleave 28.5"
        end

        if k(t) and ge(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting cleave 28.5"
            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", b, he, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command cleave 26"
        end

        if b(t) and he(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command cleave 26"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and e.WildfireBomb:IsCastable() and ((t:DebuffDown(e.WildfireBombDebuff) and not a:HasTier(28, 2)) or e.WildfireBomb:ChargesFractional() > 1.3) then
        if e.WildfireInfusion:IsAvailable() then
            if e.ShrapnelBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                    o = 259495
                    return "shrapnel_bomb cleave 28"
                end

            end

            if e.PheromoneBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                    o = 259495
                    return "pheromone_bomb cleave 28"
                end

            end

            if e.VolatileBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                    o = 259495
                    return "volatile_bomb cleave 28"
                end

            end

        else
            if e.WildfireBomb:IsCastable() then
                if m then
                    s = 9999
                end

                if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
                    o = 259495
                    return "wildfire_bomb cleave 28"
                end

            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not z and e.WildfireInfusion:IsAvailable() then
        if e.ShrapnelBomb:IsCastable() then
            if m then
                s = 9999
            end

            if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                o = 259495
                return "shrapnel_bomb cleave 28"
            end

        end

        if e.PheromoneBomb:IsCastable() then
            if m then
                s = 9999
            end

            if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                o = 259495
                return "pheromone_bomb cleave 28"
            end

        end

        if e.VolatileBomb:IsCastable() then
            if m then
                s = 9999
            end

            if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                o = 259495
                return "volatile_bomb cleave 28"
            end

        end

    end

    if e.Butchery:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and ((not e.ShrapnelBomb:IsCastable() or not e.WildfireInfusion:IsAvailable()) and e.WildfireBomb:FullRechargeTime() > p / 2) then
        if i(e.Butchery, nil, nil, not t:IsInRange(8)) then
            o = 212436
            return "butchery cleave 30"
        end

    end

    if e.AMurderofCrows:IsReady() then
        if i(e.AMurderofCrows, nil, nil, not t:IsSpellInRange(e.AMurderofCrows)) then
            o = 131894
            return "a_murder_of_crows cleave 38"
        end

    end

    if e.SerpentSting:IsReady() then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, me, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting cleave 42"
        end

        if k(t) and me(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting bop 34"
            end

        end

    end

    if e.Carve:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if i(e.Carve, nil, nil, not t:IsInRange(8)) then
            o = 187708
            return "carve cleave 44"
        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastCycle(e.KillCommand, u, je, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command cleave 46"
        end

        if je(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command cleave 46"
            end

        end

    end

    if e.KillShot:IsReady() then
        if i(e.KillShot, nil, nil, not t:IsSpellInRange(e.KillShot)) then
            o = 320976
            return "kill_shot cleave 34"
        end

    end

    if e.SerpentSting:IsReady() and ((a:Focus() >= 35) or p <= 4) then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, fe, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting cleave 48"
        end

        if k(t) and fe(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting cleave 48"
            end

        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.MongooseBite, u, "max", v, O, not t:IsSpellInRange(e.MongooseBite)) then
            return "mongoose_bite cleave 50"
        end

        if v(t) and Ae(t) then
            if i(e.MongooseBite, nil, nil, not t:IsInRange(40)) then
                o = 259387
                return "mongoose_bite cleave 50"
            end

        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.RaptorStrike, u, "max", v, O, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike cleave 52"
        end

        if v(t) and O(t) then
            if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
                o = 186270
                return "raptor_strike cleave 52"
            end

        end

    end

    if e.RaptorStrike:IsReady() and (EagleUp and t:IsInMeleeRange(40)) and not t:IsInMeleeRange(8) then
        if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
            o = 186270
            return "raptor_strike cleave 53"
        end

    end

end

local function d()
    L = HeroRotationCharDB.Toggles[6]
    T = HeroRotationCharDB.Toggles[4]
    Oe = HeroRotationCharDB.Toggles[5] or _()
    w = HeroRotationCharDB.Toggles[12]
    ie = HeroRotationCharDB.Toggles[15]
    F = HeroRotationCharDB.Toggles[120]
    M = HeroRotationCharDB.Toggles[121]
    B = HeroRotationCharDB.Toggles[122]
    P = HeroRotationCharDB.Toggles[123]
    V = HeroRotationCharDB.Toggles[124]
    Q = HeroRotationCharDB.Toggles[125]
    W = HeroRotationCharDB.Toggles[140]
    z = HeroRotationCharDB.Toggles[141]
    we = HeroRotationCharDB.Toggles[142]
    m = n.Survival.SmartBombTargeting
    Y = GetTime()
    K = GetInventoryItemID("player", 13)
    G = GetInventoryItemID("player", 14)
end

local function m()
    Enemies40y = a:GetEnemiesInRange(40)
    local r = (e.BloodBolt:IsPetKnown() and R.FindBySpellID(e.BloodBolt:ID()) and e.BloodBolt) or (e.Bite:IsPetKnown() and R.FindBySpellID(e.Bite:ID()) and e.Bite) or (e.Claw:IsPetKnown() and R.FindBySpellID(e.Claw:ID()) and e.Claw) or (e.Smack:IsPetKnown() and R.FindBySpellID(e.Smack:ID()) and e.Smack) or nil
    local h = (e.Growl:IsPetKnown() and R.FindBySpellID(e.Growl:ID()) and e.Growl) or nil
    if le() then
        if EagleUp and not t:IsInMeleeRange(8) then
            Enemies40y = a:GetEnemiesInRange(40)
            PetEnemiesMixedyCount = (r and #a:GetEnemiesInSpellActionRange(r)) or t:GetEnemiesInSplashRangeCount(8)
        else
            p = #a:GetEnemiesInRange(8)
        end

    else
        Enemies40y = {  }
        PetEnemiesMixedyCount = 0
    end

    TargetInRange40y = t:IsInRange(40)
    TargetInRange30y = t:IsInRange(30)
    TargetInRangePet30y = (h and t:IsSpellInActionRange(h)) or (not h and t:IsInRange(30))
    FightRemains = I.FightRemains(Enemies8y, false)
    local h = a:BuffUp(e.AspectoftheEagle)
    if le() then
        if h and not t:IsInMeleeRange(8) then
            p = t:GetEnemiesInSplashRangeCount(8)
        else
            p = #a:GetEnemiesInRange(8)
        end

    else
        p = 1
    end

    d()
    if s > 0 then
        s = 0
    end

    if o > 0 then
        o = 0
    end

    if h then
        u = a:GetEnemiesInRange(40)
    else
        u = a:GetEnemiesInRange(5)
    end

    if a:BuffUp(A(5384)) then
        return false
    end

    if e.Exhilaration:IsCastable() and a:HealthPercentage() <= n.Commons.ExhilarationHP then
        if i(e.Exhilaration, nil) then
            o = 109304
            return "Exhilaration"
        end

    end

    if a:HealthPercentage() < n.Commons.HealthstoneHP and q.Healthstone:IsReady() and q.Healthstone:CooldownRemains() <= 0 then
        if l.Cast(q.Healthstone, nil) then
            o = 40
            return "Healthstone HP"
        end

    end

    if a:HealthPercentage() < n.Commons.HealPotHP and q.HealPot:IsReady() and q.HealPot:CooldownRemains() <= 0 then
        if l.Cast(q.HealPot, nil) then
            o = 41
            return "HealPot HP"
        end

    end

    if a:HealthPercentage() < n.Commons.HealPotHP and q.CosmicHealPot:IsReady() and q.CosmicHealPot:CooldownRemains() <= 0 then
        if l.Cast(q.CosmicHealPot, nil) then
            o = 45
            return "CosmicHealPot HP"
        end

    end

    if e.AspectoftheTurtle:IsCastable() and a:HealthPercentage() <= n.Commons.TurtleHP then
        if i(e.AspectoftheTurtle, nil) then
            o = 186265
            return "AspectoftheTurtle"
        end

    end

    if not t:IsInMeleeRange(10) and not h and not e.Harpoon:IsCastable() and #u > 0 and n.Survival.TargetSwap == "AutoSwap" and not w then
        s = 999
    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.SerpentSting:IsCastable() and TargetInRange40y then
            if i(e.SerpentSting, nil) then
                s = 1259491
                return "explosive MO SWD"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.SerpentSting:IsCastable() and TargetInRange40y then
            if i(e.SerpentSting, nil) then
                o = 259491
                return "explosive  SWD"
            end

        end

    end

    ve = { 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 195181, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133 }
    if UnitExists("target") and e.TranqualizingShot:IsCastable() and not we then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true and e.TranqualizingShot:IsCastable() and e.TranqualizingShot:CooldownRemains(BypassRecovery) <= 0 then
            for t = 0, 40 do
                local t, t, t, t, t, t, t, t, t, a = UnitBuff("target", t)
                for i, t in pairs(ve) do
                    if t == a then
                        if l.Cast(e.TranqualizingShot, nil) then
                            o = 19801
                            return "Tranq Enrage"
                        end

                    end

                end

            end

        end

    end

        if l.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        Y = GetTime()
        endtime = Y + (l.GUISettings.General.OpenerReset)
    elseif l.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        l.ToggleIconFrame:UpdateButtonText(6)
        l.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (F and e.Bindingshot:IsAvailable() and e.Bindingshot:CooldownRemains(BypassRecovery) <= 0) then
        if l.Cast(e.Bindingshot, nil, nil, nil) then
            o = 109248
            return "queue Binding Shot"
        end

    elseif ((not e.Bindingshot:IsAvailable() or e.Bindingshot:CooldownRemains(BypassRecovery) > 0) and F) then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
        l.Print("Binding Shot Queue is now " .. (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (M and e.FreezingTrap:IsAvailable() and e.FreezingTrap:CooldownRemains(BypassRecovery) <= 0) then
        if l.Cast(e.FreezingTrap, nil, nil, nil) then
            o = 187650
            return "queue Freezing Trap"
        end

    elseif ((not e.FreezingTrap:IsUsableP() or e.FreezingTrap:CooldownRemains() > 0) and M) then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
        l.Print("Freezing Trap Queue is now " .. (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (B and e.Intimidation:IsAvailable() and e.Intimidation:CooldownRemains(BypassRecovery) <= 0) then
        if l.Cast(e.Intimidation, nil, nil, nil) then
            o = 19577
            return "queue Intimidation"
        end

    elseif ((not e.Intimidation:IsUsableP() or e.Intimidation:CooldownRemains() > 0) and B) then
        HeroRotationCharDB.Toggles[122] = not HeroRotationCharDB.Toggles[122]
        l.Print("Intimidation Queue is now " .. (HeroRotationCharDB.Toggles[122] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (P and e.Flare:IsAvailable() and e.Flare:CooldownRemains(BypassRecovery) <= 0) then
        if l.Cast(e.Flare, nil, nil, nil) then
            o = 1543
            return "queue Flare"
        end

    elseif ((not e.Flare:IsUsableP() or e.Flare:CooldownRemains() > 0) and P) then
        HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123]
        l.Print("Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (V and e.TarTrap:IsAvailable() and e.TarTrap:CooldownRemains(BypassRecovery) <= 0) then
        if l.Cast(e.TarTrap, nil, nil, nil) then
            o = 187698
            return "queue TarTrap"
        end

    elseif ((not e.TarTrap:IsUsableP() or e.TarTrap:CooldownRemains() > 0) and V) then
        HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124]
        l.Print("Tar Trap Queue is now " .. (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (W and e.HuntersMark:IsAvailable() and e.HuntersMark:CooldownRemains(BypassRecovery) <= 0) then
        if l.Cast(e.HuntersMark, nil, nil, nil) then
            o = 257284
            return "queue HuntersMark"
        end

    elseif ((not e.HuntersMark:IsUsableP() or e.HuntersMark:CooldownRemains() > 0) and W) then
        HeroRotationCharDB.Toggles[140] = not HeroRotationCharDB.Toggles[140]
        l.Print("Hunter's Mark Quaue is now " .. (HeroRotationCharDB.Toggles[140] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if a:IsCasting(e.RevivePet) and not a:IsDeadOrGhost() then
        if i(e.PoolFocus) then
            o = 999999
            return "Pooling Focus"
        end

    end

    if U and ye + 1 < GetTime() then
        U = false
    end

    if (N:IsActive() and select(2, GetStablePetInfo(n.Commons.SummonPetSlot)) ~= select(1, UnitName("pet"))) and n.Commons.SummonPetSlot ~= 0 and not a:IsMoving() and not a:PrevGCD(1, e.DismissPet) and not a:IsCasting(e.DismissPet) then
        if i(e.DismissPet, nil) then
            o = 2641
            return "Dismiss Pet"
        end

    end

    if e.SummonPet:IsCastable() and not a:IsDeadOrGhost() and not N:IsActive() and n.Commons.SummonPetSlot ~= 0 then
                                        if n.Commons.SummonPetSlot == 1 and not a:PrevGCD(1, x[n.Commons.SummonPetSlot]) then
            if i(x[n.Commons.SummonPetSlot], nil) then
                o = 883
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 2 and not a:PrevGCD(1, x[n.Commons.SummonPetSlot]) then
            if i(x[n.Commons.SummonPetSlot], nil) then
                o = 83242
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 3 and not a:PrevGCD(1, x[n.Commons.SummonPetSlot]) then
            if i(x[n.Commons.SummonPetSlot], nil) then
                o = 83243
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 4 and not a:PrevGCD(1, x[n.Commons.SummonPetSlot]) then
            if i(x[n.Commons.SummonPetSlot], nil) then
                o = 83244
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 5 and not a:PrevGCD(1, x[n.Commons.SummonPetSlot]) then
            if i(x[n.Commons.SummonPetSlot], nil) then
                o = 83245
                return "Summon Pet"
            end

        end

    end

    if (N:IsDeadOrGhost() or not UnitExists("pet")) and not a:IsDeadOrGhost() and e.RevivePet:IsCastable() and not a:IsMoving() and n.Commons.SummonPetSlot ~= 0 and not U then
        if i(e.RevivePet, nil) then
            o = 982
            return "Revive Pet"
        end

    end

    local r, d, u = GetSpellCooldown(34477)
    if a:AffectingCombat() and n.Commons.AutoMisdirect and not a:IsDeadOrGhost() and not Q then
        if (r + d - GetTime()) <= 0 and e.Misdirection:IsAvailable() and e.Misdirection:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus") or UnitIsUnit("focus", "pet")) and IsItemInRange(32698, "focus") then
            if l.Cast(e.Misdirection) then
                s = 134477
                return "MD Focus"
            end

        end

    end

    if not N:IsDeadOrGhost() and not a:IsDeadOrGhost() and UnitExists("pet") and e.MendPet:IsCastable() and N:HealthPercentage() <= n.Commons.MendPetHighHP and not a:PrevGCD(1, e.MendPet) then
        if i(e.MendPet) then
            o = 1982
            return "Mend Pet High Priority"
        end

    end

    if not a:AffectingCombat() and not a:IsDeadOrGhost() and ((L) or (n.Survival.DBMSupport and ((l.BossMods:GetPullTimer() < a:GCD() and l.BossMods:GetPullTimer() > 0) or l.BossMods:GetPullTimer() < .5 and l.BossMods:GetPullTimer() > 0))) and (c.TargetIsValid() or t:NPCID() == 179733) then
        local e = Te()
        if e then
            return e
        end

    end

    if a:BuffUp(A(310143)) or a:BuffUp(A(5384)) then
        return false
    end

    if c.TargetIsValid() and (a:AffectingCombat() or L) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326 or t:NPCID() == 176581 or t:NPCID() == 176920 or t:NPCID() == 177892 or t:NPCID() == 182778 or t:NPCID() == 185402 or t:NPCID() == 183945 or t:NPCID() == 182074 or t:NPCID() == 184737 or t:NPCID() == 179733 or t:NPCID() == 115402 or t:NPCID() == 115406 or t:NPCID() == 115395 or UnitExists("boss1") or t:NPCID() == 115388 or L) and not a:IsDeadOrGhost() then
        if A(257284):IsCastable() and A(339264):ConduitEnabled() and t:DebuffDown(A(257284)) and (qe(Enemies40y) <= 0 or UnitName("target") == "Fleeting Manifestation") and (UnitName("target") == "Nalthor the Rimebinder" or UnitName("target") == "Tirnenn Villager" or UnitName("target") == "Drust Boughbreaker" or UnitName("target") == "Ingra Maloch" or UnitName("target") == "Mistveil Stalker" or UnitName("target") == "Mistcaller" or UnitName("target") == "Blightbone" or UnitName("target") == "Rotspew" or UnitName("target") == "Amarth" or UnitName("target") == "Surgeon Stitchflesh" or UnitName("target") == "Lubricator" or UnitName("target") == "Tred'ova" or UnitName("target") == "Azules" or UnitName("target") == "Ventunax" or UnitName("target") == "Oryphion" or UnitName("target") == "Astronos" or UnitName("target") == "Lakesis" or UnitName("target") == "Klotos" or UnitName("target") == "Devos" or UnitName("target") == "Halkias" or UnitName("target") == "High Adjudicator Aleez" or UnitName("target") == "Wo Drifter" or UnitName("target") == "Lord Chamberlain" or UnitName("target") == "Enraged Spirit" or UnitName("target") == "Hakkar The Soulflayer" or UnitName("target") == "Sentient Oil" or UnitName("target") == "Millhouse Manastorm" or UnitName("target") == "Millificent Manastorm" or UnitName("target") == "Dealer Xy’exa" or UnitName("target") == "Mueh'zala" or UnitName("target") == "Fungi Stormer" or UnitName("target") == "Globgrog" or UnitName("target") == "Slime Tentacle" or UnitName("target") == "Virulax Blightweaver" or UnitName("target") == "Doctor Ickus" or UnitName("target") == "Domina Venomblade" or UnitName("target") == "Margrave Stradama" or UnitName("target") == "Dreadful Huntmaster" or UnitName("target") == "Insatiable Brute" or UnitName("target") == "Kryxis the Voracious" or UnitName("target") == "Grand Overseer" or UnitName("target") == "Research Scribe" or UnitName("target") == "Executor Tarvold" or UnitName("target") == "Grand Proctor Beryllia" or UnitName("target") == "General Kaal" or UnitName("target") == "Paceran the Virulent" or UnitName("target") == "Shard of Halkias" or UnitName("target") == "Shambling Arbalest" or UnitName("target") == "Nekthara the Mangler" or UnitName("target") == "Harugia the Bloodthirtsy" or UnitName("target") == "Heavin the Breaker" or UnitName("target") == "Echelon" or UnitName("target") == "Advent Nevermore" or UnitName("target") == "Xav the Unfallen" or UnitName("target") == "Portal Guardian" or UnitName("target") == "Kul'Tharok" or UnitName("target") == "Gorechop" or UnitName("target") == "Mordretha, the Endless Empress" or UnitName("target") == "Gatewarden Zo'mazz" or UnitName("target") == "Zophex" or UnitName("target") == "Alcruux" or UnitName("target") == "Achillite" or UnitName("target") == "Venza Goldfuse" or UnitName("target") == "Zo'gron" or UnitName("target") == "P.O.S.T Master" or UnitName("target") == "So'azmi" or UnitName("target") == "Portalmancer Zo'dahh" or UnitName("target") == "4.RF-4.RF" or UnitName("target") == "Inquisitor Sigar" or UnitName("target") == "Fleeting Manifestation" or UnitName("target") == "Corpse Harvester" or UnitName("target") == "Zolramus Necromancer" or UnitName("target") == "Nar'zudah" or UnitName("target") == "Raging Bloodhorn" or UnitName("target") == "Harugia the Bloodthirsty" or UnitName("target") == "Portalmancer Zo'honn" or UnitName("target") == "Enraged Direhorn" or UnitName("target") == "Coastwalker Goliath" or UnitName("target") == "Adorned Starseer" or UnitName("target") == "Wandering Pulsar" or (IsInRaid() and UnitName("target") == UnitName("boss1"))) then
            if i(e.HuntersMark, nil) then
                o = 257284
                return "HuntersMark M+"
            end

        end

        if not h and n.Survival.AspectoftheEagle and not t:IsInMeleeRange(10) and t:IsInMeleeRange(40) and not e.Harpoon:IsCastable() and not a:PrevGCD(1, e.Harpoon) and e.Harpoon:CooldownRemains() < 19 then
            if e.AspectoftheEagle:IsCastable() then
                if i(e.AspectoftheEagle, nil) then
                    o = 186289
                    return "aspect_of_the_eagle oor"
                end

            end

        end

        if ((j == 1 and e.CoordinatedAssault:CooldownRemains() > 0 and e.ResonatingArrow:CooldownRemains() > 0) or (j ~= 1 and e.CoordinatedAssault:CooldownRemains() > 0)) then
            local e = Ee()
            if e then
                return e
            end

        end

        if (true) then
            local e = f()
            if e then
                return e
            end

        end

        if (p < 3 and e.BirdsofPrey:IsAvailable()) then
            local e = H()
            if e then
                return e
            end

        end

        if (p < 3 and not e.BirdsofPrey:IsAvailable()) then
            local e = _e()
            if e then
                return e
            end

        end

        if (p > 2) then
            local e = C()
            if e then
                return e
            end

        end

        if e.ArcaneTorrent:IsCastable() and (t:IsInMeleeRange(8)) and _() then
            if i(e.ArcaneTorrent, nil, nil, not t:IsInRange(8)) then
                o = 155145
                return "arcane_torrent 888"
            end

        end

        if e.RaptorStrike:IsReady() and (h and t:IsInMeleeRange(40)) and not t:IsInMeleeRange(8) then
            if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
                o = 186270
                return "raptor_strike st 53"
            end

        end

        if i(e.PoolFocus) then
            return "Pooling Focus"
        end

    end

end

local function e()
    l.Print("Survival can use pet abilities to better determine AoE, makes sure you have Growl and Blood Bolt / Bite / Claw / Smack in your player action bars.")
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        l.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpell3()
    if o == 0 then
        return 0
    else
        return o
    end

end

function ReturnSpellMO3()
    if s == 0 then
        return 0
    else
        return s
    end

end

l.SetAPL(255, m, e)

