local e, e = ...
local e = HeroDBC.DBC
local A = HeroLib
local e = HeroCache
local m = A.Unit
local a = m.Player
local t = m.Target
local I = m.Pet
local T = A.Spell
local o = A.Item
local S = A.Action
local d = HeroRotation
local ee = d.AoEON
local z = d.CDsON
local i = d.Cast
local e = d.CastSuggested
local _ = HeroRotationCharDB.Toggles[4]
local Oe = HeroRotationCharDB.Toggles[5]
local R = HeroRotationCharDB.Toggles[6]
local f = HeroRotationCharDB.Toggles[12]
local ue = HeroRotationCharDB.Toggles[15]
local C = HeroRotationCharDB.Toggles[120]
local Y = HeroRotationCharDB.Toggles[121]
local F = HeroRotationCharDB.Toggles[122]
local W = HeroRotationCharDB.Toggles[123]
local P = HeroRotationCharDB.Toggles[124]
local re = HeroRotationCharDB.Toggles[125]
local M = HeroRotationCharDB.Toggles[140]
local x = HeroRotationCharDB.Toggles[141]
local ve = HeroRotationCharDB.Toggles[142]
local e = false
local e = false
local e = false
local e = false
local G = 0
local L = false
local ce = 0
local e = false
local me = { 355782, 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 343470, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426 }
local c = d.Commons.Everyone
local n = { General = d.GUISettings.General, Commons = d.GUISettings.APL.Hunter.Commons, Survival = d.GUISettings.APL.Hunter.Survival }
local e = T.Hunter.Survival
local g = o.Hunter.Survival
local s = { g.DreadfireVessel:ID() }
local q = a:CovenantID()
A:RegisterForEvent(function()
    q = a:CovenantID()
end, "COVENANT_CHOSEN")
A:RegisterForEvent(function(e, ...)
    local e, t, t, t = ...
    if e == 284 then
        L = true
        ce = GetTime()
    end

end, "UI_ERROR_MESSAGE")
local s = a:GetEquipment()
local h = o(0)
local r = o(0)
local B = GetInventoryItemID("player", 13)
local V = GetInventoryItemID("player", 14)
if s[13] then
    h = o(s[13])
end

if s[14] then
    r = o(s[14])
end

local w = a:HasLegendaryEquipped(67)
local H = a:HasLegendaryEquipped(68)
local U = a:HasLegendaryEquipped(79)
local fe = a:HasLegendaryEquipped(253)
A:RegisterForEvent(function()
    s = a:GetEquipment()
    h = o(0)
    r = o(0)
    if s[13] then
        h = o(s[13])
    end

    if s[14] then
        r = o(s[14])
    end

    w = a:HasLegendaryEquipped(67)
    H = a:HasLegendaryEquipped(68)
    U = a:HasLegendaryEquipped(79)
    fe = a:HasLegendaryEquipped(253) or (a:HasUnity() and e.DeathChakram:IsAvailable())
end, "PLAYER_EQUIPMENT_CHANGED")
local j = { e.SummonPet, e.SummonPet2, e.SummonPet3, e.SummonPet4, e.SummonPet5 }
local y, u
local p = ((e.MongooseBite:IsAvailable() and e.MongooseBite:Cost()) or (e.RaptorStrike:Cost()))
local o
local o
local o = 0
local s = 0
A:RegisterForEvent(function()
    p = ((e.MongooseBite:IsAvailable() and e.MongooseBite:Cost()) or (e.RaptorStrike:Cost()))
end, "PLAYER_TALENT_UPDATE")
local l = { { e.Intimidation, "Cast Intimidation (Interrupt)", function()
    return true
end } }
local function l(t, e)
    local e = e or 0
    return (a:Focus() + a:FocusCastRegen(t) + e < a:FocusMax())
end

local function we(e)
    local t = 0
    if e ~= nil then
        for a in pairs(e) do
            local e = e[a]
            if e:IsInMeleeRange(40) and (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285) and e:DebuffUp(T(257284)) then
                t = t + 1
            end

        end

    end

    return t
end

local function E()
    if e.ShrapnelBomb:TimeSinceLastCast() < .5 or e.PheromoneBomb:TimeSinceLastCast() < .5 or e.VolatileBomb:TimeSinceLastCast() < .5 or e.WildfireBomb:TimeSinceLastCast() < .5 or x then
        return true
    else
        return false
    end

end

local function k(t)
    return (t:DebuffRemains(e.SerpentStingDebuff))
end

local function v(t)
    return (t:DebuffRemains(e.BloodseekerDebuff))
end

local function b(t)
    return (t:DebuffStack(e.LatentPoisonDebuff))
end

local function ke(e)
    return (e:HealthPercentage())
end

local function pe(i)
                if (((i:DebuffDown(e.SerpentStingDebuff) and i:TimeToDie() > 7) or (a:BuffUp(e.VipersVenomBuff) and a:BuffRemains(e.VipersVenomBuff) < a:GCD())) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif (((i:DebuffDown(e.SerpentStingDebuff) and i:TimeToDie() > 7) or (a:BuffUp(e.VipersVenomBuff) and a:BuffRemains(e.VipersVenomBuff) < a:GCD())) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif (((i:DebuffDown(e.SerpentStingDebuff) and i:TimeToDie() > 7) or (a:BuffUp(e.VipersVenomBuff) and a:BuffRemains(e.VipersVenomBuff) < a:GCD())) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif ((i:DebuffDown(e.SerpentStingDebuff) and i:TimeToDie() > 7) or (a:BuffUp(e.VipersVenomBuff) and a:BuffRemains(e.VipersVenomBuff) < a:GCD())) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function xe(i)
                if (((i:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > 7) or a:BuffUp(e.VipersVenomBuff)) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif (((i:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > 7) or a:BuffUp(e.VipersVenomBuff)) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif (((i:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > 7) or a:BuffUp(e.VipersVenomBuff)) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif ((i:DebuffRefreshable(e.SerpentStingDebuff) and i:TimeToDie() > 7) or a:BuffUp(e.VipersVenomBuff)) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function ye(a)
                if ((a:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable() and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == m("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable() and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable() and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif (a:DebuffRefreshable(e.SerpentStingDebuff) and e.HydrasBite:IsAvailable() and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function be(a)
                if ((a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == m("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif ((a:DebuffRefreshable(e.SerpentStingDebuff) and a:TimeToDie() > 8) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not f) then
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
                if ((e.KillCommand:FullRechargeTime() < a:GCD() and l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((e.KillCommand:FullRechargeTime() < a:GCD() and l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((e.KillCommand:FullRechargeTime() < a:GCD() and l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (e.KillCommand:FullRechargeTime() < a:GCD() and l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function N(i)
                if ((e.KillCommand:FullRechargeTime() < a:GCD() and l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((e.KillCommand:FullRechargeTime() < a:GCD() and l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((e.KillCommand:FullRechargeTime() < a:GCD() and l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (e.KillCommand:FullRechargeTime() < a:GCD() and l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function je(a)
                if ((l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == m("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (l(e.KillCommand:ExecuteTime(), 15) and (TargetInRangePet30y)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function D(e)
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and e:GUID() == m("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and e:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function de(i)
                if ((a:BuffStack(e.TipoftheSpearBuff) == 3 or i:DebuffUp(e.ShrapnelBombDebuff)) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1186270
        return true
    elseif ((a:BuffStack(e.TipoftheSpearBuff) == 3 or i:DebuffUp(e.ShrapnelBombDebuff)) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
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
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and e:GUID() == m("mouseover"):GUID()) then
        s = 1259387
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and n.Survival.KillCommandTargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not f) then
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
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and e:GUID() == m("mouseover"):GUID()) then
        s = 1186270
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and n.Survival.KillCommandTargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and e:GUID() == t:GUID()) then
        o = 186270
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) then
        return true
    end

end

local function te(e)
                if ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and e:GUID() == m("mouseover"):GUID()) then
        s = 1324149
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and n.Survival.KillCommandTargetSwap == "AutoSwap" and e:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) and e:GUID() == t:GUID()) then
        o = 324149
        return true
    elseif (e:AffectingCombat() or e:IsDummy() or e:NPCID() == 153285 or e:NPCID() == 168326 or UnitExists("boss1")) and (e:IsInMeleeRange(8) or (EagleUp and e:IsInMeleeRange(15))) then
        return true
    end

end

local function ne(i)
                if ((e.AlphaPredator:IsAvailable() and ((a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (p - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD() and i:DebuffDown(e.WildSpiritsDebuff)) or (a:BuffRemains(e.MongooseFuryBuff) and e.PheromoneBomb:IsCastable()))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259387
        return true
    elseif ((e.AlphaPredator:IsAvailable() and ((a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (p - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD() and i:DebuffDown(e.WildSpiritsDebuff)) or (a:BuffRemains(e.MongooseFuryBuff) and e.PheromoneBomb:IsCastable()))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((e.AlphaPredator:IsAvailable() and ((a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (p - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD() and i:DebuffDown(e.WildSpiritsDebuff)) or (a:BuffRemains(e.MongooseFuryBuff) and e.PheromoneBomb:IsCastable()))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259387
        return true
    elseif (e.AlphaPredator:IsAvailable() and ((a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (p - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD() and i:DebuffDown(e.WildSpiritsDebuff)) or (a:BuffRemains(e.MongooseFuryBuff) and e.PheromoneBomb:IsCastable()))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function K(i)
                if ((a:BuffUp(e.MongooseFuryBuff) or (a:Focus() + a:FocusCastRegen(e.MongooseBite:ExecuteTime()) > a:FocusMax() - 15) or (i:DebuffUp(e.ShrapnelBombDebuff)) or (i:DebuffRemains(e.WildSpiritsDebuff))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259387
        return true
    elseif ((a:BuffUp(e.MongooseFuryBuff) or (a:Focus() + a:FocusCastRegen(e.MongooseBite:ExecuteTime()) > a:FocusMax() - 15) or (i:DebuffUp(e.ShrapnelBombDebuff)) or (i:DebuffRemains(e.WildSpiritsDebuff))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((a:BuffUp(e.MongooseFuryBuff) or (a:Focus() + a:FocusCastRegen(e.MongooseBite:ExecuteTime()) > a:FocusMax() - 15) or (i:DebuffUp(e.ShrapnelBombDebuff)) or (i:DebuffRemains(e.WildSpiritsDebuff))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259387
        return true
    elseif (a:BuffUp(e.MongooseFuryBuff) or (a:Focus() + a:FocusCastRegen(e.MongooseBite:ExecuteTime()) > a:FocusMax() - 15) or (i:DebuffUp(e.ShrapnelBombDebuff)) or (i:DebuffRemains(e.WildSpiritsDebuff))) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function oe(i)
                if ((a:BuffUp(e.VipersVenomBuff) and (a:BuffRemains(e.VipersVenomBuff) < a:GCD() or i:DebuffRefreshable(e.SerpentStingDebuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif ((a:BuffUp(e.VipersVenomBuff) and (a:BuffRemains(e.VipersVenomBuff) < a:GCD() or i:DebuffRefreshable(e.SerpentStingDebuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((a:BuffUp(e.VipersVenomBuff) and (a:BuffRemains(e.VipersVenomBuff) < a:GCD() or i:DebuffRefreshable(e.SerpentStingDebuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif (a:BuffUp(e.VipersVenomBuff) and (a:BuffRemains(e.VipersVenomBuff) < a:GCD() or i:DebuffRefreshable(e.SerpentStingDebuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function Q(i)
                if ((l(e.KillCommand:ExecuteTime(), 15) and a:BuffUp(e.NessingwarysTrappingBuff) or a:Focus() + a:FocusCastRegen(e.KillCommand:ExecuteTime()) < a:FocusMax() + 10 and a:BuffUp(e.NessingwarysTrappingBuff) and a:BuffRemains(e.NessingwarysTrappingBuff) < a:GCD()) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((l(e.KillCommand:ExecuteTime(), 15) and a:BuffUp(e.NessingwarysTrappingBuff) or a:Focus() + a:FocusCastRegen(e.KillCommand:ExecuteTime()) < a:FocusMax() + 10 and a:BuffUp(e.NessingwarysTrappingBuff) and a:BuffRemains(e.NessingwarysTrappingBuff) < a:GCD()) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((l(e.KillCommand:ExecuteTime(), 15) and a:BuffUp(e.NessingwarysTrappingBuff) or a:Focus() + a:FocusCastRegen(e.KillCommand:ExecuteTime()) < a:FocusMax() + 10 and a:BuffUp(e.NessingwarysTrappingBuff) and a:BuffRemains(e.NessingwarysTrappingBuff) < a:GCD()) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (l(e.KillCommand:ExecuteTime(), 15) and a:BuffUp(e.NessingwarysTrappingBuff) or a:Focus() + a:FocusCastRegen(e.KillCommand:ExecuteTime()) < a:FocusMax() + 10 and a:BuffUp(e.NessingwarysTrappingBuff) and a:BuffRemains(e.NessingwarysTrappingBuff) < a:GCD()) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function he(i)
                if ((l(e.KillCommand:ExecuteTime(), 15) and (not w or a:Focus() < p)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((l(e.KillCommand:ExecuteTime(), 15) and (not w or a:Focus() < p)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((l(e.KillCommand:ExecuteTime(), 15) and (not w or a:Focus() < p)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (l(e.KillCommand:ExecuteTime(), 15) and (not w or a:Focus() < p)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function se(i)
    local r = l(e.KillCommand:ExecuteTime(), 15)
    local u = a:FocusCastRegen(e.KillCommand:ExecuteTime())
    local h = a:Focus()
    local l = a:GCD()
    local h = e.FreezingTrap:CooldownRemains() > (a:Focus() / (p - u) * l)
    local d = e.TarTrap:CooldownRemains() > (a:Focus() / (p - u) * l)
    local a = e.SteelTrap:IsAvailable() and (e.SteelTrap:CooldownRemains() > (a:Focus() / (p - u) * l))
                if ((r and w and h and d and (not e.SteelTrap:IsAvailable() or a)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((r and w and h and d and (not e.SteelTrap:IsAvailable() or a)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((r and w and h and d and (not e.SteelTrap:IsAvailable() or a)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (r and w and h and d and (not e.SteelTrap:IsAvailable() or a)) and ((TargetInRangePet30y) or not PetRangeAbility) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function ie(i)
                if ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1186270
        return true
    elseif ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 186270
        return true
    elseif (a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function J(i)
                if ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259387
        return true
    elseif ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259387
        return true
    elseif (a:BuffUp(e.CoordinatedAssault) and a:BuffRemains(e.CoordinatedAssault) < 1.5 * a:GCD()) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function X(i)
                if ((e.AlphaPredator:IsAvailable() and (a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (p - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD())) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259387
        return true
    elseif ((e.AlphaPredator:IsAvailable() and (a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (p - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD())) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((e.AlphaPredator:IsAvailable() and (a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (p - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD())) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259387
        return true
    elseif (e.AlphaPredator:IsAvailable() and (a:BuffUp(e.MongooseFuryBuff) and a:BuffRemains(e.MongooseFuryBuff) < a:Focus() / (p - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD())) and (i:IsInMeleeRange(8) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function Z(i)
                if (((i:DebuffRefreshable(e.SerpentStingDebuff) and a:BuffDown(e.CoordinatedAssault)) or (e.AlphaPredator:IsAvailable() and i:DebuffRefreshable(e.SerpentStingDebuff) and not a:BuffUp(e.MongooseFuryBuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif (((i:DebuffRefreshable(e.SerpentStingDebuff) and a:BuffDown(e.CoordinatedAssault)) or (e.AlphaPredator:IsAvailable() and i:DebuffRefreshable(e.SerpentStingDebuff) and not a:BuffUp(e.MongooseFuryBuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif (((i:DebuffRefreshable(e.SerpentStingDebuff) and a:BuffDown(e.CoordinatedAssault)) or (e.AlphaPredator:IsAvailable() and i:DebuffRefreshable(e.SerpentStingDebuff) and not a:BuffUp(e.MongooseFuryBuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif ((i:DebuffRefreshable(e.SerpentStingDebuff) and a:BuffDown(e.CoordinatedAssault)) or (e.AlphaPredator:IsAvailable() and i:DebuffRefreshable(e.SerpentStingDebuff) and not a:BuffUp(e.MongooseFuryBuff))) and (i:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and i:IsInMeleeRange(15))) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function le(i)
                if ((l(e.KillCommand:ExecuteTime(), 15) and e.KillCommand:FullRechargeTime() < a:GCD() and ((w and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not w)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((l(e.KillCommand:ExecuteTime(), 15) and e.KillCommand:FullRechargeTime() < a:GCD() and ((w and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not w)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((l(e.KillCommand:ExecuteTime(), 15) and e.KillCommand:FullRechargeTime() < a:GCD() and ((w and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not w)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (l(e.KillCommand:ExecuteTime(), 15) and e.KillCommand:FullRechargeTime() < a:GCD() and ((w and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not w)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function ae(i)
                if ((i:DebuffUp(e.PheromoneBombDebuff) and a:HasTier(28, 2)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == m("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((i:DebuffUp(e.PheromoneBombDebuff) and a:HasTier(28, 2)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and i:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((i:DebuffUp(e.PheromoneBombDebuff) and a:HasTier(28, 2)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) and i:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (i:DebuffUp(e.PheromoneBombDebuff) and a:HasTier(28, 2)) and (i:AffectingCombat() or i:IsDummy() or i:NPCID() == 153285 or i:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function ge(a)
                if ((l(e.KillCommand:ExecuteTime(), 15) and ((w and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not w)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == m("mouseover"):GUID()) then
        s = 1259489
        return true
    elseif ((l(e.KillCommand:ExecuteTime(), 15) and ((w and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not w)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.KillCommandTargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((l(e.KillCommand:ExecuteTime(), 15) and ((w and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not w)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == t:GUID()) then
        o = 259489
        return true
    elseif (l(e.KillCommand:ExecuteTime(), 15) and ((w and not e.FreezingTrap:CooldownUp() and not e.TarTrap:CooldownUp()) or not w)) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function qe(a)
                if ((a:DebuffDown(e.SerpentStingDebuff) and a:TimeToDie() > 15) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == m("mouseover"):GUID()) then
        s = 1259491
        return true
    elseif ((a:DebuffDown(e.SerpentStingDebuff) and a:TimeToDie() > 15) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and n.Survival.SerpantStingTargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not f) then
        s = 999
        return true
    elseif ((a:DebuffDown(e.SerpentStingDebuff) and a:TimeToDie() > 15) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) and a:GUID() == t:GUID()) then
        o = 259491
        return true
    elseif (a:DebuffDown(e.SerpentStingDebuff) and a:TimeToDie() > 15) and (a:IsInMeleeRange(n.Survival.SerpantStingRange) or (EagleUp and a:IsInMeleeRange(15))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285 or a:NPCID() == 168326 or UnitExists("boss1")) then
        return true
    end

end

local function _e()
    if T(257284):IsCastable() and T(339264):ConduitEnabled() and t:DebuffDown(T(257284)) and we(Enemies40y) <= 0 and (UnitName("target") == "Nalthor the Rimebinder" or UnitName("target") == "Tirnenn Villager" or UnitName("target") == "Drust Boughbreaker" or UnitName("target") == "Ingra Maloch" or UnitName("target") == "Mistveil Stalker" or UnitName("target") == "Mistcaller" or UnitName("target") == "Blightbone" or UnitName("target") == "Rotspew" or UnitName("target") == "Amarth" or UnitName("target") == "Surgeon Stitchflesh" or UnitName("target") == "Lubricator" or UnitName("target") == "Tred'ova" or UnitName("target") == "Azules" or UnitName("target") == "Ventunax" or UnitName("target") == "Oryphion" or UnitName("target") == "Astronos" or UnitName("target") == "Lakesis" or UnitName("target") == "Klotos" or UnitName("target") == "Devos" or UnitName("target") == "Halkias" or UnitName("target") == "High Adjudicator Aleez" or UnitName("target") == "Wo Drifter" or UnitName("target") == "Lord Chamberlain" or UnitName("target") == "Enraged Spirit" or UnitName("target") == "Hakkar The Soulflayer" or UnitName("target") == "Sentient Oil" or UnitName("target") == "Millhouse Manastorm" or UnitName("target") == "Millificent Manastorm" or UnitName("target") == "Dealer Xy’exa" or UnitName("target") == "Mueh'zala" or UnitName("target") == "Fungi Stormer" or UnitName("target") == "Globgrog" or UnitName("target") == "Slime Tentacle" or UnitName("target") == "Virulax Blightweaver" or UnitName("target") == "Doctor Ickus" or UnitName("target") == "Domina Venomblade" or UnitName("target") == "Margrave Stradama" or UnitName("target") == "Dreadful Huntmaster" or UnitName("target") == "Insatiable Brute" or UnitName("target") == "Kryxis the Voracious" or UnitName("target") == "Grand Overseer" or UnitName("target") == "Research Scribe" or UnitName("target") == "Executor Tarvold" or UnitName("target") == "Grand Proctor Beryllia" or UnitName("target") == "General Kaal" or UnitName("target") == "Paceran the Virulent" or UnitName("target") == "Shard of Halkias" or UnitName("target") == "Shambling Arbalest" or UnitName("target") == "Nekthara the Mangler" or UnitName("target") == "Harugia the Bloodthirtsy" or UnitName("target") == "Heavin the Breaker" or UnitName("target") == "Echelon" or UnitName("target") == "Advent Nevermore" or UnitName("target") == "Xav the Unfallen" or UnitName("target") == "Portal Guardian" or UnitName("target") == "Kul'Tharok" or UnitName("target") == "Gorechop" or UnitName("target") == "Mordretha, the Endless Empress" or UnitName("target") == "Gatewarden Zo'mazz" or UnitName("target") == "Zophex" or UnitName("target") == "Alcruux" or UnitName("target") == "Achillite" or UnitName("target") == "Venza Goldfuse" or UnitName("target") == "Zo'gron" or UnitName("target") == "P.O.S.T Master" or UnitName("target") == "So'azmi" or UnitName("target") == "Portalmancer Zo'dahh" or (IsInRaid() and UnitName("boss1") == UnitName("boss1"))) then
        if i(e.HuntersMark, nil) then
            o = 257284
            return "HuntersMark M+ open"
        end

    end

    if (I:IsActive() and select(2, GetStablePetInfo(n.Commons.SummonPetSlot)) ~= select(1, UnitName("pet"))) and n.Commons.SummonPetSlot ~= 0 and not a:IsMoving() and not a:PrevGCD(1, e.DismissPet) and not a:IsCasting(e.DismissPet) then
        if i(e.DismissPet, nil) then
            o = 2641
            return "Dismiss Pet"
        end

    end

    if e.SummonPet:IsCastable() and (not I:IsActive() or (I:IsActive() and select(2, GetStablePetInfo(n.Commons.SummonPetSlot)) ~= select(1, UnitName("pet")))) and n.Commons.SummonPetSlot ~= 0 then
                                        if n.Commons.SummonPetSlot == 1 then
            if i(j[n.Commons.SummonPetSlot], nil) then
                o = 883
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 2 then
            if i(j[n.Commons.SummonPetSlot], nil) then
                o = 83242
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 3 then
            if i(j[n.Commons.SummonPetSlot], nil) then
                o = 83243
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 4 then
            if i(j[n.Commons.SummonPetSlot], nil) then
                o = 83244
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 5 then
            if i(j[n.Commons.SummonPetSlot], nil) then
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

local function ze()
    VarSyncUp = (t:DebuffUp(e.ResonatingArrowDebuff) or a:BuffUp(e.CoordinatedAssault))
    VarStrongSyncUp = ((q == 1 and t:DebuffUp(e.ResonatingArrowDebuff) and a:BuffUp(e.CoordinatedAssault)) or (q ~= 1 and a:BuffUp(e.CoordinatedAssault)))
    if (a:BuffDown(e.CoordinatedAssault)) then
        if (q == 1) then
            VarStrongSyncRemains = (e.ResonatingArrow:CooldownRemains() < e.CoordinatedAssault:CooldownRemains()) and e.ResonatingArrow:CooldownRemains() or e.CoordinatedAssault:CooldownRemains()
        else
            VarStrongSyncRemains = e.CoordinatedAssault:CooldownRemains()
        end

    end

    if (a:BuffUp(e.CoordinatedAssault)) then
        if (q == 1) then
            VarStrongSyncRemains = e.ResonatingArrow:CooldownRemains()
        else
            VarStrongSyncRemains = e.CoordinatedAssault:CooldownRemains()
        end

    end

    if (q == 1) then
        VarSyncRemains = (e.ResonatingArrow:CooldownRemains() > e.CoordinatedAssault:CooldownRemains()) and e.ResonatingArrow:CooldownRemains() or e.CoordinatedAssault:CooldownRemains()
    else
        VarSyncRemains = e.CoordinatedAssault:CooldownRemains()
    end

    if h:IsReady() and z() and h:ID() ~= g.MistcallerOcarina:ID() and (n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (((h:TrinketHasUseBuff() or q == 1 and h:HasCooldown()) and (VarStrongSyncUp and (q ~= 1 and (not r:TrinketHasUseBuff()) or q == 1 and (not r:HasCooldown()) or r:CooldownRemains() > 0 or h:TrinketHasUseBuff() and ((not r:TrinketHasUseBuff()) or h:Cooldown() >= r:Cooldown()) or h:HasCooldown() and (not r:TrinketHasUseBuff()) and h:Cooldown() >= r:Cooldown()) or (not VarStrongSyncUp) and ((not r:TrinketHasUseBuff()) and (h:Cooldown() - 5 < VarSyncRemains or VarSyncRemains > h:Cooldown() / 2) or r:TrinketHasUseBuff() and (h:TrinketHasUseBuff() and h:Cooldown() >= r:Cooldown() and (h:Cooldown() - 5 < VarSyncRemains or VarSyncRemains > h:Cooldown() / 2) or ((not h:TrinketHasUseBuff()) or r:Cooldown() >= h:Cooldown()) and (r:IsReady() and r:Cooldown() - 5 > VarSyncRemains and VarSyncRemains < r:Cooldown() / 2 or (not r:IsReady()) and (r:CooldownRemains() - 5 < VarStrongSyncRemains and VarStrongSyncRemains > 20 and (h:Cooldown() - 5 < VarSyncRemains or r:CooldownRemains() - 5 < VarSyncRemains and r:Cooldown() - 10 + VarSyncRemains < VarStrongSyncRemains or VarSyncRemains > h:Cooldown() / 2 or VarSyncUp) or r:CooldownRemains() - 5 > VarStrongSyncRemains and (h:Cooldown() - 5 < VarStrongSyncRemains or h:Cooldown() < FightRemains and VarStrongSyncRemains + h:Cooldown() > FightRemains or (not h:TrinketHasUseBuff()) and (VarSyncRemains > h:Cooldown() / 2 or VarSyncUp)))))) or t:TimeToDie() < VarSyncRemains) or (not h:TrinketHasUseBuff()) and q ~= 1 and (r:TrinketHasUseBuff() and (((not VarSyncUp) or r:CooldownRemains() > 5) and (VarSyncRemains > 20 or r:CooldownRemains() - 5 > VarSyncRemains)) or (not r:TrinketHasUseBuff()) and ((not r:HasCooldown()) or r:CooldownRemains() > 0 or r:Cooldown() >= h:Cooldown()))) and (h:ID() ~= g.CacheofAcquiredTreasures:ID() or y < 2 and a:BuffUp(e.AcquiredWandBuff) or y > 1 and a:BuffDown(e.AcquiredWandBuff))) then
        if i(h, nil, nil) then
                        if h:ID() == B and n.Commons.Enabled.TopTrinket then
                o = 24
                return "Top trinket1 trinkets 4"
            elseif h:ID() == V and n.Commons.Enabled.BottomTrinket then
                o = 30
                return " Bot trinket1 trinkets 4"
            end

        end

    end

    if r:IsReady() and r:ID() ~= g.MistcallerOcarina:ID() and z() and (n.Commons.Enabled.TopTrinket or n.Commons.Enabled.BottomTrinket) and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (((r:TrinketHasUseBuff() or q == 1 and r:HasCooldown()) and (VarStrongSyncUp and (q ~= 1 and (not h:TrinketHasUseBuff()) or q == 1 and (not h:HasCooldown()) or h:CooldownRemains() > 0 or r:TrinketHasUseBuff() and ((not h:TrinketHasUseBuff()) or r:Cooldown() >= h:Cooldown()) or r:HasCooldown() and (not h:TrinketHasUseBuff()) and r:Cooldown() >= h:Cooldown()) or (not VarStrongSyncUp) and ((not h:TrinketHasUseBuff()) and (r:Cooldown() - 5 < VarSyncRemains or VarSyncRemains > r:Cooldown() / 2) or h:TrinketHasUseBuff() and (r:TrinketHasUseBuff() and r:Cooldown() >= h:Cooldown() and (r:Cooldown() - 5 < VarSyncRemains or VarSyncRemains > r:Cooldown() / 2) or ((not r:TrinketHasUseBuff()) or h:Cooldown() >= r:Cooldown()) and (h:IsReady() and h:Cooldown() - 5 > VarSyncRemains and VarSyncRemains < h:Cooldown() / 2 or (not h:IsReady()) and (h:CooldownRemains() - 5 < VarStrongSyncRemains and VarStrongSyncRemains > 20 and (r:Cooldown() - 5 < VarSyncRemains or h:CooldownRemains() - 5 < VarSyncRemains and h:Cooldown() - 10 + VarSyncRemains < VarStrongSyncRemains or VarSyncRemains > r:Cooldown() / 2 or VarSyncUp) or h:CooldownRemains() - 5 > VarStrongSyncRemains and (r:Cooldown() - 5 < VarStrongSyncRemains or r:Cooldown() < FightRemains and VarStrongSyncRemains + r:Cooldown() > FightRemains or (not r:TrinketHasUseBuff()) and (VarSyncRemains > r:Cooldown() / 2 or VarSyncUp)))))) or t:TimeToDie() < VarSyncRemains) or (not r:TrinketHasUseBuff()) and q ~= 1 and (h:TrinketHasUseBuff() and (((not VarSyncUp) or h:CooldownRemains() > 5) and (VarSyncRemains > 20 or h:CooldownRemains() - 5 > VarSyncRemains)) or (not h:TrinketHasUseBuff()) and ((not h:HasCooldown()) or h:CooldownRemains() > 0 or h:Cooldown() >= r:Cooldown()))) and (r:ID() ~= g.CacheofAcquiredTreasures:ID() or y < 2 and a:BuffUp(e.AcquiredWandBuff) or y > 1 and a:BuffDown(e.AcquiredWandBuff))) then
        if i(r, nil, nil) then
                        if r:ID() == B and n.Commons.Enabled.TopTrinket then
                o = 24
                return "Top trinket2 trinkets 6"
            elseif r:ID() == V and n.Commons.Enabled.BottomTrinket then
                o = 30
                return " Bot trinket2 trinkets 6"
            end

        end

    end

    if g.Jotungeirr:IsEquippedAndReady() and z() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if i(g.Jotungeirr, nil, nil) then
            o = 16
            return "jotungeirr_destinys_call trinkets 6"
        end

    end

end

local function Te()
    if (a:BuffUp(e.CoordinatedAssault)) and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if e.BloodFury:IsCastable() and z() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.BloodFury, nil) then
                o = 20572
                return "blood_fury cds 6"
            end

        end

        if e.AncestralCall:IsCastable() and z() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.AncestralCall, nil) then
                o = 274738
                return "ancestral_call cds 8"
            end

        end

        if e.Fireblood:IsCastable() and z() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.Fireblood, nil) then
                o = 265221
                return "fireblood cds 10"
            end

        end

    end

    if e.LightsJudgment:IsCastable() and z() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if i(e.LightsJudgment, nil, nil, not t:IsSpellInRange(e.LightsJudgment)) then
            o = 255647
            return "lights_judgment cds 12"
        end

    end

    if e.BagofTricks:IsCastable() and z() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (e.KillCommand:FullRechargeTime() > a:GCD()) then
        if i(e.BagofTricks, nil, nil, not t:IsSpellInRange(e.BagofTricks)) then
            o = 312411
            return "bag_of_tricks cds 14"
        end

    end

    if e.Berserking:IsCastable() and z() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (a:BuffUp(e.CoordinatedAssault) or t:TimeToDie() < 13) then
        if i(e.Berserking, nil) then
            o = 26297
            return "berserking cds 16"
        end

    end

    if g.PotionOfSpectralAgility:IsReady() and ue and z and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (((t:TimeToDie() < 25 or a:BuffUp(e.CoordinatedAssault)) and not d.GUISettings.General.HoldPotforBL) or (a:BloodlustUp() and d.GUISettings.General.HoldPotforBL)) then
        if i(g.PotionOfSpectralAgility, nil, nil) then
            o = 50
            return "potion cds 18"
        end

    end

    if e.TarTrap:IsCastable() and (l(e.TarTrap:ExecuteTime()) and H and t:DebuffDown(e.SoulforgeEmbersDebuff) and (y > 1 or y == 1 and t:TimeToDie() > 5 * a:GCD())) then
        if i(e.TarTrap, nil, nil, not t:IsInRange(40)) then
            o = 187698
            return "tar_trap cds 20"
        end

    end

    if e.Flare:IsCastable() and (l(e.Flare:ExecuteTime()) and H and t:TimeToDie() > 4 * a:GCD()) then
        if i(e.Flare, nil) then
            o = 1543
            return "flare cds 22"
        end

    end

    if e.KillShot:IsReady() and (y == 1 and t:TimeToDie() < a:Focus() / (p - a:FocusCastRegen(e.KillShot:ExecuteTime())) * a:GCD()) then
        if i(e.KillShot, nil, nil, not t:IsSpellInRange(e.KillShot)) then
            o = 320976
            return "kill_shot cds 24"
        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (y == 1 and t:TimeToDie() < a:Focus() / (p - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD()) then
        if i(e.MongooseBite, nil, nil, not t:IsSpellInRange(e.MongooseBite)) then
            o = 259387
            return "mongoose_bite cds 26"
        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (y == 1 and t:TimeToDie() < a:Focus() / (p - a:FocusCastRegen(e.MongooseBite:ExecuteTime())) * a:GCD()) then
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

local function Ee()
    if _ and e.DeathChakram:IsCastable() and (l(e.DeathChakram:ExecuteTime())) then
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
        if c.CastTargetIf(e.SerpentSting, u, "min", k, pe, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting st 4"
        end

        if k(t) and pe(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting st 4"
            end

        end

    end

    if true then
        if e.FlayedShot:IsCastable() and _ then
            if i(e.FlayedShot, nil, nil, not t:IsSpellInRange(e.FlayedShot)) then
                o = 324149
                return "flayed_shot st 6"
            end

        end

        if e.ResonatingArrow:IsCastable() and _ and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.ResonatingArrow, nil, nil, not t:IsInRange(40)) then
                o = 308491
                return "resonating_arrow st 8"
            end

        end

        if e.WildSpirits:IsCastable() and _ and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.WildSpirits, nil, nil, not t:IsInRange(40)) then
                o = 328231
                return "wild_spirits st 10"
            end

        end

        if e.CoordinatedAssault:IsCastable() and z() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
            if i(e.CoordinatedAssault, nil) then
                o = 266779
                return "coordinated_assault st 12"
            end

        end

    end

    if e.FlankingStrike:IsCastable() and (t:IsInMeleeRange(15)) and (l(e.FlankingStrike:ExecuteTime())) then
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

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and ((e.WildfireBomb:FullRechargeTime() < 2 * a:GCD() and a:HasTier(28, 2)) or (a:BuffUp(e.MadBombardierBuff)) or (not a:HasTier(28, 2) and (e.WildfireBomb:FullRechargeTime() < a:GCD() or ((l(e.WildfireBomb:ExecuteTime()) and ((e.VolatileBomb:IsReady() and t:DebuffUp(e.SerpentStingDebuff) and t:DebuffRefreshable(e.SerpentStingDebuff)) or (e.PheromoneBomb:IsReady() and a:BuffDown(e.MongooseFuryBuff) and a:Focus() + a:FocusCastRegen(e.WildfireBomb:ExecuteTime()) < a:FocusMax() - a:FocusCastRegen(e.KillCommand:ExecuteTime()) * 3))) or t:TimeToDie() < 10)))) then
        if e.WildfireInfusion:IsAvailable() then
            if e.ShrapnelBomb:IsCastable() then
                if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                    o = 259495
                    return "shrapnel_bomb cleave 8"
                end

            end

            if e.PheromoneBomb:IsCastable() then
                if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                    o = 259495
                    return "pheromone_bomb cleave 8"
                end

            end

            if e.VolatileBomb:IsCastable() then
                if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                    o = 259495
                    return "volatile_bomb cleave 8"
                end

            end

        else
            if e.WildfireBomb:IsCastable() then
                if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
                    o = 259495
                    return "wildfire_bomb cleave 8"
                end

            end

        end

    end

    if e.KillCommand:IsReady() and (a:HasTier(28, 2) and a:BuffDown(e.MadBombardierBuff)) then
        if c.CastTargetIf(e.KillCommand, u, "min", v, D, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 23"
        end

        if v(t) and D(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command st 23"
            end

        end

    end

    if e.KillCommand:IsCastable() and e.AlphaPredator:IsAvailable() then
        if c.CastTargetIf(e.KillCommand, u, "min", v, N, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 32a"
        end

        if v(t) and N(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command st 32"
            end

        end

    end

    if e.Carve:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (y > 1 and not U) then
        if i(e.Carve, nil, nil, not t:IsInRange(8)) then
            o = 187708
            return "carve st 24"
        end

    end

    if e.Butchery:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (y > 1 and not U and e.WildfireBomb:FullRechargeTime() > y and (e.Butchery:ChargesFractional() > 2.5 or t:DebuffUp(e.ShrapnelBombDebuff))) then
        if i(e.Butchery, nil, nil, not t:IsInRange(8)) then
            o = 212436
            return "butchery st 26"
        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.MongooseBite, u, "max", b, ne, not t:IsSpellInRange(e.MongooseBite)) then
            return "mongoose_bite st 30"
        end

        if b(t) and ne(t) then
            if i(e.MongooseBite, nil, nil, not t:IsInRange(40)) then
                o = 259387
                return "mongoose_bite st 30"
            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", v, N, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 33a"
        end

        if v(t) and N(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command st 33"
            end

        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.RaptorStrike, u, "max", b, de, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike st 34"
        end

        if b(t) and de(t) then
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
        if c.CastTargetIf(e.SerpentSting, u, "min", k, xe, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting st 38"
        end

        if k(t) and xe(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting st 38"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and e.ShrapnelBomb:IsCastable() and (a:Focus() > p * 2 and t:DebuffRemains(e.SerpentStingDebuff) > 5 * a:GCD() and not a:HasTier(28, 2)) then
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
        if c.CastTargetIf(e.KillCommand, u, "min", v, je, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 44"
        end

        if v(t) and je(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command st 44"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and U then
        if e.ShrapnelBomb:IsCastable() then
            if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                o = 259495
                return "shrapnel_bomb st 46"
            end

        end

        if e.PheromoneBomb:IsCastable() then
            if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                o = 259495
                return "pheromone_bomb st 48"
            end

        end

        if e.VolatileBomb:IsCastable() then
            if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                o = 259495
                return "volatile_bomb st 50"
            end

        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.MongooseBite, u, "max", b, K, not t:IsSpellInRange(e.MongooseBite)) then
            return "mongoose_bite st 52"
        end

        if b(t) and K(t) then
            if i(e.MongooseBite, nil, nil, not t:IsInRange(40)) then
                o = 259387
                return "mongoose_bite st 52"
            end

        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.RaptorStrike, u, "max", b, O, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike st 54"
        end

        if b(t) and O(t) then
            if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
                o = 186270
                return "raptor_strike st 54"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and e.VolatileBomb:IsCastable() and (t:DebuffUp(e.SerpentStingDebuff)) and not a:HasTier(28, 2) then
        if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
            o = 259495
            return "volatile_bomb st 56"
        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and e.PheromoneBomb:IsCastable() and not a:HasTier(28, 2) then
        if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
            o = 259495
            return "pheromone_bomb st 58"
        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and e.ShrapnelBomb:IsCastable() and (a:Focus() > 50) and not a:HasTier(28, 2) then
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

local function U()
    if e.SerpentSting:IsReady() then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, oe, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting bop 2"
        end

        if k(t) and oe(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting bop 2"
            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", v, Q, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command bop 6"
        end

        if v(t) and Q(t) and TargetInRangePet30y then
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

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and e.WildfireBomb:IsCastable() and ((l(e.WildfireBomb:ExecuteTime()) and t:DebuffDown(e.WildfireBombDebuff) and e.WildfireBomb:FullRechargeTime() < a:GCD()) or (a:BuffUp(e.MadBombardierBuff))) then
        if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
            o = 259495
            return "wildfire_bomb bop 8"
        end

    end

    if e.FlankingStrike:IsCastable() and (t:IsInMeleeRange(15)) and (l(e.FlankingStrike:ExecuteTime())) then
        if i(e.FlankingStrike, nil, nil, not t:IsSpellInRange(e.FlankingStrike)) then
            o = 269751
            return "flanking_strike bop 10"
        end

    end

    if _ and e.FlayedShot:IsCastable() then
        if i(e.FlayedShot, nil, nil, not t:IsSpellInRange(e.FlayedShot)) then
            o = 324149
            return "flayed_shot bop 12"
        end

    end

    if (w and a:Focus() < p) then
        local e = h()
        if e then
            return e
        end

    end

    if _ and e.DeathChakram:IsCastable() and (l(e.DeathChakram:ExecuteTime())) then
        if i(e.DeathChakram, nil, nil, not t:IsSpellInRange(e.DeathChakram)) then
            o = 325028
            return "death_chakram bop 14"
        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.RaptorStrike, u, "max", b, ie, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike bop 16"
        end

        if b(t) and ie(t) then
            if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
                o = 186270
                return "raptor_strike bop 16"
            end

        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.MongooseBite, u, "max", b, J, not t:IsSpellInRange(e.MongooseBite)) then
            return "mongoose_bite bop 18"
        end

        if b(t) and J(t) then
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
        if c.CastTargetIf(e.RaptorStrike, u, "max", b, O, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike bop 22"
        end

        if b(t) and O(t) then
            if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
                o = 186270
                return "raptor_strike bop 22"
            end

        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.MongooseBite, u, "max", b, X, not t:IsSpellInRange(e.MongooseBite)) then
            return "mongoose_bite bop 18"
        end

        if b(t) and X(t) then
            if i(e.MongooseBite, nil, nil, not t:IsInRange(40)) then
                o = 259387
                return "mongoose_bite bop 18"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and e.WildfireBomb:IsCastable() and (l(e.WildfireBomb:ExecuteTime()) and t:DebuffDown(e.WildfireBombDebuff) and (e.WildfireBomb:FullRechargeTime() < a:GCD() or t:DebuffDown(e.WildfireBombDebuff) and a:BuffRemains(e.MongooseFuryBuff) > e.WildfireBomb:FullRechargeTime() - a:GCD() or t:DebuffDown(e.WildfireBombDebuff) and a:BuffDown(e.MongooseFuryBuff)) or t:TimeToDie() < 18 and t:DebuffDown(e.WildfireBombDebuff)) then
        if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
            o = 259495
            return "wildfire_bomb bop 24"
        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", v, he, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command bop 26"
        end

        if v(t) and he(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command bop 26"
            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", v, se, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command bop 28"
        end

        if v(t) and se(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command bop 28"
            end

        end

    end

    if e.SerpentSting:IsReady() then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, Z, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting bop 34"
        end

        if k(t) and Z(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting bop 34"
            end

        end

    end

    if true then
        if e.ResonatingArrow:IsCastable() and _ and (t:IsInMeleeRange(8)) then
            if i(e.ResonatingArrow, nil, nil, not t:IsInRange(40)) then
                o = 308491
                return "resonating_arrow bop 36"
            end

        end

        if e.WildSpirits:IsCastable() and _ and (t:IsInMeleeRange(8)) then
            if i(e.WildSpirits, nil, nil, not t:IsInRange(40)) then
                o = 328231
                return "wild_spirits bop 38"
            end

        end

        if e.CoordinatedAssault:IsCastable() and z() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
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
        if c.CastTargetIf(e.RaptorStrike, u, "max", b, O, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike bop 44"
        end

        if b(t) and O(t) then
            if i(e.RaptorStrike, nil, nil, not t:IsInRange(40)) then
                o = 186270
                return "raptor_strike bop 44"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and e.WildfireBomb:IsCastable() and (t:DebuffRefreshable(e.WildfireBombDebuff)) then
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

local function H()
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
        if e.WildSpirits:IsCastable() and _ and (t:IsInMeleeRange(8)) then
            if i(e.WildSpirits, nil, nil, not t:IsInRange(40)) then
                o = 328231
                return "wild_spirits cleave 4"
            end

        end

        if e.ResonatingArrow:IsCastable() and _ and (t:IsInMeleeRange(8)) then
            if i(e.ResonatingArrow, nil, nil, not t:IsInRange(40)) then
                o = 308491
                return "resonating_arrow cleave 6"
            end

        end

    end

    if e.CoordinatedAssault:IsReady() and z() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if i(e.CoordinatedAssault, nil) then
            o = 266779
            return "coordinated_assault cleave 18"
        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and (e.WildfireBomb:FullRechargeTime() < a:GCD() or (a:BuffUp(e.MadBombardierBuff) and a:HasTier(28, 2))) then
        if e.WildfireInfusion:IsAvailable() then
            if e.ShrapnelBomb:IsCastable() then
                if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                    o = 259495
                    return "shrapnel_bomb cleave 8"
                end

            end

            if e.PheromoneBomb:IsCastable() then
                if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                    o = 259495
                    return "pheromone_bomb cleave 8"
                end

            end

            if e.VolatileBomb:IsCastable() then
                if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                    o = 259495
                    return "volatile_bomb cleave 8"
                end

            end

        else
            if e.WildfireBomb:IsCastable() then
                if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
                    o = 259495
                    return "wildfire_bomb cleave 8"
                end

            end

        end

    end

    if e.KillCommand:IsReady() and (a:HasTier(28, 2) and a:BuffDown(e.MadBombardierBuff)) and n.Survival.KCFish then
        if c.CastTargetIf(e.KillCommand, u, "min", v, D, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 23"
        end

        if v(t) and D(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command st 23"
            end

        end

    end

    if e.DeathChakram:IsCastable() and _ and (l(e.DeathChakram:ExecuteTime()) and not fe) then
        if i(e.DeathChakram, nil, nil, not t:IsSpellInRange(e.DeathChakram)) then
            o = 325028
            return "death_chakram cleave 16"
        end

    end

    if (w and a:Focus() < p) then
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

    if e.Butchery:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (e.Butchery:ChargesFractional() > 2.5 and e.WildfireBomb:FullRechargeTime() > (y / 2)) then
        if i(e.Butchery, nil, nil, not t:IsInRange(8)) then
            o = 212436
            return "butchery cleave 20"
        end

    end

    if e.FlankingStrike:IsCastable() and (t:IsInMeleeRange(15)) and (l(e.FlankingStrike:ExecuteTime())) then
        if i(e.FlankingStrike, nil, nil, not t:IsSpellInRange(e.FlankingStrike)) then
            o = 269751
            return "flanking_strike cleave 22"
        end

    end

    if e.Carve:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and (e.WildfireBomb:FullRechargeTime() > y / 2) then
        if i(e.Carve, nil, nil, not t:IsInRange(8)) then
            o = 187708
            return "carve cleave 24"
        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and e.WildfireBomb:IsCastable() and (a:BuffUp(e.MadBombardierBuff)) then
        if e.WildfireInfusion:IsAvailable() then
            if e.ShrapnelBomb:IsCastable() then
                if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                    o = 259495
                    return "shrapnel_bomb cleave 28"
                end

            end

            if e.PheromoneBomb:IsCastable() then
                if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                    o = 259495
                    return "pheromone_bomb cleave 28"
                end

            end

            if e.VolatileBomb:IsCastable() then
                if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                    o = 259495
                    return "volatile_bomb cleave 28"
                end

            end

        else
            if e.WildfireBomb:IsCastable() then
                if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
                    o = 259495
                    return "wildfire_bomb cleave 28"
                end

            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", v, ae, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command cleave 26"
        end

        if v(t) and ae(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command cleave 26"
            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", v, N, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command st 34a"
        end

        if v(t) and N(t) and TargetInRangePet30y then
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

    if _ and e.FlayedShot:IsCastable() then
        if c.CastTargetIf(e.FlayedShot, u, "max", ke, te, not t:IsSpellInRange(e.FlayedShot)) then
            return "flayed_shot cleave 28"
        end

        if ke(t) and te(t) then
            if i(e.FlayedShot, nil, nil, not t:IsInRange(40)) then
                o = 324149
                return "flayed_shot cleave 28"
            end

        end

    end

    if e.SerpentSting:IsReady() and (e.VolatileBomb:IsCastable() and a:Focus() + a:FocusCastRegen(e.SerpentSting:ExecuteTime()) > 35 and y <= 4) then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, qe, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting cleave 28.5"
        end

        if k(t) and qe(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting cleave 28.5"
            end

        end

    end

    if e.KillCommand:IsCastable() then
        if c.CastTargetIf(e.KillCommand, u, "min", v, le, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command cleave 26"
        end

        if v(t) and le(t) and TargetInRangePet30y then
            if i(e.KillCommand, nil, nil, not t:IsInRange(40)) then
                o = 259489
                return "kill_command cleave 26"
            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and e.WildfireBomb:IsCastable() and ((t:DebuffDown(e.WildfireBombDebuff) and not a:HasTier(28, 2)) or e.WildfireBomb:ChargesFractional() > 1.3) then
        if e.WildfireInfusion:IsAvailable() then
            if e.ShrapnelBomb:IsCastable() then
                if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                    o = 259495
                    return "shrapnel_bomb cleave 28"
                end

            end

            if e.PheromoneBomb:IsCastable() then
                if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                    o = 259495
                    return "pheromone_bomb cleave 28"
                end

            end

            if e.VolatileBomb:IsCastable() then
                if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                    o = 259495
                    return "volatile_bomb cleave 28"
                end

            end

        else
            if e.WildfireBomb:IsCastable() then
                if i(e.WildfireBomb, nil, nil, not t:IsSpellInRange(e.WildfireBomb)) then
                    o = 259495
                    return "wildfire_bomb cleave 28"
                end

            end

        end

    end

    if t:IsInMeleeRange(n.Survival.BombRange) and not E() and not x and e.WildfireInfusion:IsAvailable() then
        if e.ShrapnelBomb:IsCastable() then
            if i(e.ShrapnelBomb, nil, nil, not t:IsSpellInRange(e.ShrapnelBomb)) then
                o = 259495
                return "shrapnel_bomb cleave 28"
            end

        end

        if e.PheromoneBomb:IsCastable() then
            if i(e.PheromoneBomb, nil, nil, not t:IsSpellInRange(e.PheromoneBomb)) then
                o = 259495
                return "pheromone_bomb cleave 28"
            end

        end

        if e.VolatileBomb:IsCastable() then
            if i(e.VolatileBomb, nil, nil, not t:IsSpellInRange(e.VolatileBomb)) then
                o = 259495
                return "volatile_bomb cleave 28"
            end

        end

    end

    if e.Butchery:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) and ((not e.ShrapnelBomb:IsCastable() or not e.WildfireInfusion:IsAvailable()) and e.WildfireBomb:FullRechargeTime() > y / 2) then
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
        if c.CastTargetIf(e.SerpentSting, u, "min", k, ye, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting cleave 42"
        end

        if k(t) and ye(t) then
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
        if c.CastCycle(e.KillCommand, u, ge, not t:IsSpellInRange(e.KillCommand)) then
            return "kill_command cleave 46"
        end

        if ge(t) and TargetInRangePet30y then
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

    if e.SerpentSting:IsReady() and ((a:Focus() >= 35) or y <= 4) then
        if c.CastTargetIf(e.SerpentSting, u, "min", k, be, not t:IsSpellInRange(e.SerpentSting)) then
            return "serpent_sting cleave 48"
        end

        if k(t) and be(t) then
            if i(e.SerpentSting, nil, nil, not t:IsInRange(40)) then
                o = 259491
                return "serpent_sting cleave 48"
            end

        end

    end

    if e.MongooseBite:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.MongooseBite, u, "max", b, O, not t:IsSpellInRange(e.MongooseBite)) then
            return "mongoose_bite cleave 50"
        end

        if b(t) and Ae(t) then
            if i(e.MongooseBite, nil, nil, not t:IsInRange(40)) then
                o = 259387
                return "mongoose_bite cleave 50"
            end

        end

    end

    if e.RaptorStrike:IsReady() and (t:IsInMeleeRange(8) or (EagleUp and t:IsInMeleeRange(40))) then
        if c.CastTargetIf(e.RaptorStrike, u, "max", b, O, not t:IsSpellInRange(e.RaptorStrike)) then
            return "raptor_strike cleave 52"
        end

        if b(t) and O(t) then
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

local function l()
    R = HeroRotationCharDB.Toggles[6]
    _ = HeroRotationCharDB.Toggles[4]
    Oe = HeroRotationCharDB.Toggles[5] or z()
    f = HeroRotationCharDB.Toggles[12]
    ue = HeroRotationCharDB.Toggles[15]
    C = HeroRotationCharDB.Toggles[120]
    Y = HeroRotationCharDB.Toggles[121]
    F = HeroRotationCharDB.Toggles[122]
    W = HeroRotationCharDB.Toggles[123]
    P = HeroRotationCharDB.Toggles[124]
    re = HeroRotationCharDB.Toggles[125]
    M = HeroRotationCharDB.Toggles[140]
    x = HeroRotationCharDB.Toggles[141]
    ve = HeroRotationCharDB.Toggles[142]
    G = GetTime()
    B = GetInventoryItemID("player", 13)
    V = GetInventoryItemID("player", 14)
end

local function m()
    Enemies40y = a:GetEnemiesInRange(40)
    local r = (e.BloodBolt:IsPetKnown() and S.FindBySpellID(e.BloodBolt:ID()) and e.BloodBolt) or (e.Bite:IsPetKnown() and S.FindBySpellID(e.Bite:ID()) and e.Bite) or (e.Claw:IsPetKnown() and S.FindBySpellID(e.Claw:ID()) and e.Claw) or (e.Smack:IsPetKnown() and S.FindBySpellID(e.Smack:ID()) and e.Smack) or nil
    local h = (e.Growl:IsPetKnown() and S.FindBySpellID(e.Growl:ID()) and e.Growl) or nil
    if ee() then
        if EagleUp and not t:IsInMeleeRange(8) then
            Enemies40y = a:GetEnemiesInRange(40)
            PetEnemiesMixedyCount = (r and #a:GetEnemiesInSpellActionRange(r)) or t:GetEnemiesInSplashRangeCount(8)
        else
            y = #a:GetEnemiesInRange(8)
        end

    else
        Enemies40y = {  }
        PetEnemiesMixedyCount = 0
    end

    TargetInRange40y = t:IsInRange(40)
    TargetInRange30y = t:IsInRange(30)
    TargetInRangePet30y = (h and t:IsSpellInActionRange(h)) or (not h and t:IsInRange(30))
    FightRemains = A.FightRemains(Enemies8y, false)
    local h = a:BuffUp(e.AspectoftheEagle)
    if ee() then
        if h and not t:IsInMeleeRange(8) then
            y = t:GetEnemiesInSplashRangeCount(8)
        else
            y = #a:GetEnemiesInRange(8)
        end

    else
        y = 1
    end

    l()
    if d.QueuedCast() then
        o = d.QueuedCast()
        return "Custom Queue " .. T(o):ID()
    end

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

    if a:BuffUp(T(5384)) then
        return false
    end

    if e.Exhilaration:IsCastable() and a:HealthPercentage() <= n.Commons.ExhilarationHP then
        if i(e.Exhilaration, nil) then
            o = 109304
            return "Exhilaration"
        end

    end

    if a:HealthPercentage() < n.Commons.HealthstoneHP and g.Healthstone:IsReady() and g.Healthstone:CooldownRemains() <= 0 then
        if d.Cast(g.Healthstone, nil) then
            o = 40
            return "Healthstone HP"
        end

    end

    if a:HealthPercentage() < n.Commons.HealPotHP and g.HealPot:IsReady() and g.HealPot:CooldownRemains() <= 0 then
        if d.Cast(g.HealPot, nil) then
            o = 41
            return "HealPot HP"
        end

    end

    if a:HealthPercentage() < n.Commons.HealPotHP and g.CosmicHealPot:IsReady() and g.CosmicHealPot:CooldownRemains() <= 0 then
        if d.Cast(g.CosmicHealPot, nil) then
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

    if not t:IsInMeleeRange(10) and not h and not e.Harpoon:IsCastable() and #u > 0 and n.Survival.TargetSwap == "AutoSwap" and not f then
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

    me = { 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324, 317936, 327332, 328288, 195181, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426 }
    if UnitExists("target") and e.TranqualizingShot:IsCastable() and not ve then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true and e.TranqualizingShot:IsCastable() and e.TranqualizingShot:CooldownRemains(BypassRecovery) <= 0 then
            for t = 0, 40 do
                local t, t, t, t, t, t, t, t, t, a = UnitBuff("target", t)
                for i, t in pairs(me) do
                    if t == a then
                        if d.Cast(e.TranqualizingShot, nil) then
                            o = 19801
                            return "Tranq Enrage"
                        end

                    end

                end

            end

        end

    end

        if d.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        G = GetTime()
        endtime = G + (d.GUISettings.General.OpenerReset)
    elseif d.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        d.ToggleIconFrame:UpdateButtonText(6)
        d.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (C and e.Bindingshot:IsAvailable() and e.Bindingshot:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.Bindingshot, nil, nil, nil) then
            o = 109248
            return "queue Binding Shot"
        end

    elseif ((not e.Bindingshot:IsAvailable() or e.Bindingshot:CooldownRemains(BypassRecovery) > 0) and C) then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
        d.Print("Binding Shot Queue is now " .. (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (Y and e.FreezingTrap:IsAvailable() and e.FreezingTrap:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.FreezingTrap, nil, nil, nil) then
            o = 187650
            return "queue Freezing Trap"
        end

    elseif ((not e.FreezingTrap:IsUsableP() or e.FreezingTrap:CooldownRemains() > 0) and Y) then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
        d.Print("Freezing Trap Queue is now " .. (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (F and e.Intimidation:IsAvailable() and e.Intimidation:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.Intimidation, nil, nil, nil) then
            o = 19577
            return "queue Intimidation"
        end

    elseif ((not e.Intimidation:IsUsableP() or e.Intimidation:CooldownRemains() > 0) and F) then
        HeroRotationCharDB.Toggles[122] = not HeroRotationCharDB.Toggles[122]
        d.Print("Intimidation Queue is now " .. (HeroRotationCharDB.Toggles[122] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (W and e.Flare:IsAvailable() and e.Flare:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.Flare, nil, nil, nil) then
            o = 1543
            return "queue Flare"
        end

    elseif ((not e.Flare:IsUsableP() or e.Flare:CooldownRemains() > 0) and W) then
        HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123]
        d.Print("Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (P and e.TarTrap:IsAvailable() and e.TarTrap:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.TarTrap, nil, nil, nil) then
            o = 187698
            return "queue TarTrap"
        end

    elseif ((not e.TarTrap:IsUsableP() or e.TarTrap:CooldownRemains() > 0) and P) then
        HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124]
        d.Print("Tar Trap Queue is now " .. (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (M and e.HuntersMark:IsAvailable() and e.HuntersMark:CooldownRemains(BypassRecovery) <= 0) then
        if d.Cast(e.HuntersMark, nil, nil, nil) then
            o = 257284
            return "queue HuntersMark"
        end

    elseif ((not e.HuntersMark:IsUsableP() or e.HuntersMark:CooldownRemains() > 0) and M) then
        HeroRotationCharDB.Toggles[140] = not HeroRotationCharDB.Toggles[140]
        d.Print("Hunter's Mark Quaue is now " .. (HeroRotationCharDB.Toggles[140] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if a:IsCasting(e.RevivePet) and not a:IsDeadOrGhost() then
        if i(e.PoolFocus) then
            o = 999999
            return "Pooling Focus"
        end

    end

    if L and ce + 1 < GetTime() then
        L = false
    end

    if (I:IsActive() and select(2, GetStablePetInfo(n.Commons.SummonPetSlot)) ~= select(1, UnitName("pet"))) and n.Commons.SummonPetSlot ~= 0 and not a:IsMoving() and not a:PrevGCD(1, e.DismissPet) and not a:IsCasting(e.DismissPet) then
        if i(e.DismissPet, nil) then
            o = 2641
            return "Dismiss Pet"
        end

    end

    if e.SummonPet:IsCastable() and not a:IsDeadOrGhost() and not I:IsActive() and n.Commons.SummonPetSlot ~= 0 then
                                        if n.Commons.SummonPetSlot == 1 and not a:PrevGCD(1, j[n.Commons.SummonPetSlot]) then
            if i(j[n.Commons.SummonPetSlot], nil) then
                o = 883
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 2 and not a:PrevGCD(1, j[n.Commons.SummonPetSlot]) then
            if i(j[n.Commons.SummonPetSlot], nil) then
                o = 83242
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 3 and not a:PrevGCD(1, j[n.Commons.SummonPetSlot]) then
            if i(j[n.Commons.SummonPetSlot], nil) then
                o = 83243
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 4 and not a:PrevGCD(1, j[n.Commons.SummonPetSlot]) then
            if i(j[n.Commons.SummonPetSlot], nil) then
                o = 83244
                return "Summon Pet"
            end

        elseif n.Commons.SummonPetSlot == 5 and not a:PrevGCD(1, j[n.Commons.SummonPetSlot]) then
            if i(j[n.Commons.SummonPetSlot], nil) then
                o = 83245
                return "Summon Pet"
            end

        end

    end

    if (I:IsDeadOrGhost() or not UnitExists("pet")) and not a:IsDeadOrGhost() and e.RevivePet:IsCastable() and not a:IsMoving() and n.Commons.SummonPetSlot ~= 0 and not L then
        if i(e.RevivePet, nil) then
            o = 982
            return "Revive Pet"
        end

    end

    local r, l, u = GetSpellCooldown(34477)
    if a:AffectingCombat() and n.Commons.AutoMisdirect and not a:IsDeadOrGhost() and not re then
        if (r + l - GetTime()) <= 0 and e.Misdirection:IsAvailable() and e.Misdirection:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus") or UnitIsUnit("focus", "pet")) and IsItemInRange(32698, "focus") then
            if d.Cast(e.Misdirection) then
                s = 134477
                return "MD Focus"
            end

        end

    end

    if not I:IsDeadOrGhost() and not a:IsDeadOrGhost() and UnitExists("pet") and e.MendPet:IsCastable() and I:HealthPercentage() <= n.Commons.MendPetHighHP and not a:PrevGCD(1, e.MendPet) then
        if i(e.MendPet) then
            o = 1982
            return "Mend Pet High Priority"
        end

    end

    if not a:AffectingCombat() and not a:IsDeadOrGhost() and ((R) or (n.Survival.DBMSupport and ((d.BossMods:GetPullTimer() < a:GCD() and d.BossMods:GetPullTimer() > 0) or d.BossMods:GetPullTimer() < .5 and d.BossMods:GetPullTimer() > 0))) and (c.TargetIsValid() or t:NPCID() == 179733) then
        local e = _e()
        if e then
            return e
        end

    end

    if a:BuffUp(T(310143)) or a:BuffUp(T(5384)) then
        return false
    end

    if c.TargetIsValid() and (a:AffectingCombat() or R) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326 or t:NPCID() == 176581 or t:NPCID() == 176920 or t:NPCID() == 177892 or t:NPCID() == 182778 or t:NPCID() == 185402 or t:NPCID() == 183945 or t:NPCID() == 182074 or t:NPCID() == 184737 or t:NPCID() == 179733 or t:NPCID() == 115402 or t:NPCID() == 115406 or t:NPCID() == 115395 or UnitExists("boss1") or t:NPCID() == 115388 or R) and not a:IsDeadOrGhost() then
        if T(257284):IsCastable() and T(339264):ConduitEnabled() and t:DebuffDown(T(257284)) and (we(Enemies40y) <= 0 or UnitName("target") == "Fleeting Manifestation") and (UnitName("target") == "Nalthor the Rimebinder" or UnitName("target") == "Tirnenn Villager" or UnitName("target") == "Drust Boughbreaker" or UnitName("target") == "Ingra Maloch" or UnitName("target") == "Mistveil Stalker" or UnitName("target") == "Mistcaller" or UnitName("target") == "Blightbone" or UnitName("target") == "Rotspew" or UnitName("target") == "Amarth" or UnitName("target") == "Surgeon Stitchflesh" or UnitName("target") == "Lubricator" or UnitName("target") == "Tred'ova" or UnitName("target") == "Azules" or UnitName("target") == "Ventunax" or UnitName("target") == "Oryphion" or UnitName("target") == "Astronos" or UnitName("target") == "Lakesis" or UnitName("target") == "Klotos" or UnitName("target") == "Devos" or UnitName("target") == "Halkias" or UnitName("target") == "High Adjudicator Aleez" or UnitName("target") == "Wo Drifter" or UnitName("target") == "Lord Chamberlain" or UnitName("target") == "Enraged Spirit" or UnitName("target") == "Hakkar The Soulflayer" or UnitName("target") == "Sentient Oil" or UnitName("target") == "Millhouse Manastorm" or UnitName("target") == "Millificent Manastorm" or UnitName("target") == "Dealer Xy’exa" or UnitName("target") == "Mueh'zala" or UnitName("target") == "Fungi Stormer" or UnitName("target") == "Globgrog" or UnitName("target") == "Slime Tentacle" or UnitName("target") == "Virulax Blightweaver" or UnitName("target") == "Doctor Ickus" or UnitName("target") == "Domina Venomblade" or UnitName("target") == "Margrave Stradama" or UnitName("target") == "Dreadful Huntmaster" or UnitName("target") == "Insatiable Brute" or UnitName("target") == "Kryxis the Voracious" or UnitName("target") == "Grand Overseer" or UnitName("target") == "Research Scribe" or UnitName("target") == "Executor Tarvold" or UnitName("target") == "Grand Proctor Beryllia" or UnitName("target") == "General Kaal" or UnitName("target") == "Paceran the Virulent" or UnitName("target") == "Shard of Halkias" or UnitName("target") == "Shambling Arbalest" or UnitName("target") == "Nekthara the Mangler" or UnitName("target") == "Harugia the Bloodthirtsy" or UnitName("target") == "Heavin the Breaker" or UnitName("target") == "Echelon" or UnitName("target") == "Advent Nevermore" or UnitName("target") == "Xav the Unfallen" or UnitName("target") == "Portal Guardian" or UnitName("target") == "Kul'Tharok" or UnitName("target") == "Gorechop" or UnitName("target") == "Mordretha, the Endless Empress" or UnitName("target") == "Gatewarden Zo'mazz" or UnitName("target") == "Zophex" or UnitName("target") == "Alcruux" or UnitName("target") == "Achillite" or UnitName("target") == "Venza Goldfuse" or UnitName("target") == "Zo'gron" or UnitName("target") == "P.O.S.T Master" or UnitName("target") == "So'azmi" or UnitName("target") == "Portalmancer Zo'dahh" or UnitName("target") == "4.RF-4.RF" or UnitName("target") == "Inquisitor Sigar" or UnitName("target") == "Fleeting Manifestation" or UnitName("target") == "Corpse Harvester" or UnitName("target") == "Zolramus Necromancer" or UnitName("target") == "Nar'zudah" or UnitName("target") == "Raging Bloodhorn" or UnitName("target") == "Harugia the Bloodthirsty" or UnitName("target") == "Portalmancer Zo'honn" or UnitName("target") == "Enraged Direhorn" or UnitName("target") == "Coastwalker Goliath" or UnitName("target") == "Adorned Starseer" or UnitName("target") == "Wandering Pulsar" or (IsInRaid() and UnitName("target") == UnitName("boss1"))) then
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

        if ((q == 1 and e.CoordinatedAssault:CooldownRemains() > 0 and e.ResonatingArrow:CooldownRemains() > 0) or (q ~= 1 and e.CoordinatedAssault:CooldownRemains() > 0)) then
            local e = ze()
            if e then
                return e
            end

        end

        if (true) then
            local e = Te()
            if e then
                return e
            end

        end

        if (y < 3 and e.BirdsofPrey:IsAvailable()) then
            local e = U()
            if e then
                return e
            end

        end

        if (y < 3 and not e.BirdsofPrey:IsAvailable()) then
            local e = Ee()
            if e then
                return e
            end

        end

        if (y > 2) then
            local e = H()
            if e then
                return e
            end

        end

        if e.ArcaneTorrent:IsCastable() and (t:IsInMeleeRange(8)) and z() then
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
    d.Print("Survival can use pet abilities to better determine AoE, makes sure you have Growl and Blood Bolt / Bite / Claw / Smack in your player action bars.")
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        d.ToggleIconFrame:UpdateButtonText(6)
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

d.SetAPL(255, m, e)

