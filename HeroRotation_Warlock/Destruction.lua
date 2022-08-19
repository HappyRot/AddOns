local e, e = ...
local e = HeroDBC.DBC
local u = HeroLib
local e = HeroCache
local m = u.Unit
local a = m.Player
local E = m.Pet
local t = m.Target
local h = u.Spell
local e = u.MultiSpell
local n = u.Item
local s = HeroRotation
local O = s.AoEON
local x = s.CDsON
local o = s.Cast
local d = HeroRotationCharDB.Toggles[4]
local H = HeroRotationCharDB.Toggles[5]
local _ = HeroRotationCharDB.Toggles[6]
local D = not HeroRotationCharDB.Toggles[15]
local T = HeroRotationCharDB.Toggles[12]
local U = HeroRotationCharDB.Toggles[60]
local S = HeroRotationCharDB.Toggles[150]
local c = false
local R = 0
local p = false
local w = false
local y = false
local f = false
local A = s.Commons.Everyone
local e = s.Commons.Warlock
local i = { General = s.GUISettings.General, Commons = s.GUISettings.APL.Warlock.Commons, Destruction = s.GUISettings.APL.Warlock.Destruction }
local e = h.Warlock.Destruction
local k = GetInventoryItemID("player", 13)
local g = GetInventoryItemID("player", 14)
local n = n.Warlock.Destruction
local F = { n.ScarsofFraternalStrife:ID(), n.ShadowedOrbofTorment:ID(), n.TomeofMonstrousConstructions:ID(), n.SoleahsSecretTechnique:ID() }
local v, b, r
local z
local L
local G
local q
local l = 11111
local j = 11111
u:RegisterForEvent(function()
    l = 11111
    j = 11111
end, "PLAYER_REGEN_ENABLED")
e.SummonInfernal:RegisterInFlight()
e.ChaosBolt:RegisterInFlight()
e.Incinerate:RegisterInFlight()
local M = a:HasLegendaryEquipped(174)
u:RegisterForEvent(function()
    M = a:HasLegendaryEquipped(174)
end, "PLAYER_EQUIPMENT_CHANGED")
local l = a:CovenantID()
u:RegisterForEvent(function()
    l = a:CovenantID()
end, "COVENANT_CHOSEN")
local function I(t, t, t, e)
    if e == ERR_OUT_OF_RANGE then
        c = true
        R = GetTime()
    end

end

local l = CreateFrame("Frame")
l:RegisterEvent("UI_ERROR_MESSAGE")
l:SetScript("OnEvent", I)
local function I(e)
    if e then
        return 1
    else
        return 0
    end

end

local function l(e)
    return e ~= 0
end

local function V(t)
    if t ~= nil then
        for a in pairs(t) do
            local t = t[a]
            if t:DebuffUp(e.Havoc) then
                return true, t:GUID(), t:DebuffRemains(e.Havoc)
            end

        end

        return false
    end

end

local function N(e)
    local t = 0
    if e ~= nil then
        for a in pairs(e) do
            local e = e[a]
            if e:DebuffUp(h(111673)) or e:DebuffUp(h(217832)) or e:DebuffUp(h(339)) or e:DebuffUp(h(102359)) or e:DebuffUp(h(3355)) or e:DebuffUp(h(118)) or e:DebuffUp(h(115078)) or e:DebuffUp(h(20066)) or e:DebuffUp(h(9484)) or e:DebuffUp(h(2094)) or e:DebuffUp(h(6770)) or e:DebuffUp(h(51514)) or e:DebuffUp(h(710)) or e:DebuffUp(h(118699)) then
                t = t + 1
            end

        end

    end

    return t
end

local function l()
    return u.GuardiansTable.InfernalDuration or (e.SummonInfernal:InFlight() and 30) or 0
end

local function K()
    return u.GuardiansTable.BlasphemyDuration or 0
end

local function u()
    if IsAddOnLoaded("Bartender4") and BT4Button10:GetAttribute("checkselfcast") and s.GUISettings.General.AutoGroundCast and not p and not a:AffectingCombat() then
        if not a:AffectingCombat() then
            BT4Button10:SetAttribute("checkselfcast", false)
            BT4Button9:SetAttribute("checkselfcast", false)
            BT4Button8:SetAttribute("checkselfcast", false)
            BT4Button7:SetAttribute("checkselfcast", false)
            p = true
        end

    end

    if s.GUISettings.General.AutoGroundCast and not w and not a:AffectingCombat() then
        if not a:AffectingCombat() then
            ActionButton10:SetAttribute("checkselfcast", false)
            ActionButton9:SetAttribute("checkselfcast", false)
            ActionButton8:SetAttribute("checkselfcast", false)
            ActionButton7:SetAttribute("checkselfcast", false)
            w = true
        end

    end

    if IsAddOnLoaded("ElvUI") and not IsAddOnLoaded("Bartender4") and s.GUISettings.General.AutoGroundCast and not f and not a:AffectingCombat() then
        if not a:AffectingCombat() then
            ElvUI_Bar1Button10:SetAttribute("checkselfcast", false)
            ElvUI_Bar1Button9:SetAttribute("checkselfcast", false)
            ElvUI_Bar1Button8:SetAttribute("checkselfcast", false)
            ElvUI_Bar1Button7:SetAttribute("checkselfcast", false)
            f = true
        end

    end

    if not a:AffectingCombat() and not y then
        PickupSpell(30283)
        PlaceAction(10)
        ClearCursor()
        PickupSpell(1122)
        PlaceAction(9)
        ClearCursor()
        PickupSpell(5740)
        PlaceAction(8)
        ClearCursor()
        PickupSpell(152108)
        PlaceAction(7)
        ClearCursor()
        SetBinding("CTRL-0")
        SetBinding("CTRL-9")
        SetBinding("CTRL-8")
        SetBinding("CTRL-7")
        SetBinding("0", "ACTIONBUTTON10")
        SetBinding("9", "ACTIONBUTTON9")
        SetBinding("8", "ACTIONBUTTON8")
        SetBinding("7", "ACTIONBUTTON7")
        GetModifiedClick('SELFCAST')
        SetModifiedClick('SELFCAST', "CTRL")
        SetCVar("autoSelfCast", "0")
        SaveBindings(GetCurrentBindingSet())
        y = true
    end

end

local function B(a)
                if ((a:DebuffRefreshable(e.ImmolateDebuff) and ((not e.Cataclysm:IsAvailable()) or e.Cataclysm:CooldownRemains() > a:DebuffRemains(e.ImmolateDebuff))) and not a:DebuffUp(e.Havoc) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == m("mouseover"):GUID()) then
        if a:DebuffUp(e.Havoc) then
            MOshouldcast = 6353
        else
            MOshouldcast = 16353
        end

        return true
    elseif ((a:DebuffRefreshable(e.ImmolateDebuff) and ((not e.Cataclysm:IsAvailable()) or e.Cataclysm:CooldownRemains() > a:DebuffRemains(e.ImmolateDebuff))) and not a:DebuffUp(e.Havoc) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and i.Destruction.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not T) then
        if a:DebuffUp(e.Havoc) then
            MOshouldcast = 6353
        else
            MOshouldcast = 999
        end

        return true
    elseif ((a:DebuffRefreshable(e.ImmolateDebuff) and ((not e.Cataclysm:IsAvailable()) or e.Cataclysm:CooldownRemains() > a:DebuffRemains(e.ImmolateDebuff))) and not a:DebuffUp(e.Havoc) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == t:GUID()) then
        shouldcast = 6353
        return true
    elseif ((a:DebuffRefreshable(e.ImmolateDebuff) and ((not e.Cataclysm:IsAvailable()) or e.Cataclysm:CooldownRemains() > a:DebuffRemains(e.ImmolateDebuff))) and not a:DebuffUp(e.Havoc) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285)) then
        return true
    end

end

local function P(n)
                if ((n:DebuffRefreshable(e.ImmolateDebuff) and (not e.Cataclysm:IsAvailable() or e.Cataclysm:CooldownRemains() > n:DebuffRemains(e.ImmolateDebuff))) and not n:DebuffUp(e.Havoc) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285) and n:GUID() == m("mouseover"):GUID()) then
        if n:DebuffUp(e.Havoc) then
            if o(e.Immolate, nil, nil, not t:IsSpellInRange(e.Immolate)) then
                shouldcast = 348
                return "immolate main 10"
            end

        else
            MOshouldcast = 1348
        end

        return true
    elseif ((n:DebuffRefreshable(e.ImmolateDebuff) and (not e.Cataclysm:IsAvailable() or e.Cataclysm:CooldownRemains() > n:DebuffRemains(e.ImmolateDebuff))) and not n:DebuffUp(e.Havoc) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285) and i.Destruction.TargetSwap == "AutoSwap" and n:GUID() ~= t:GUID() and not T) then
        if n:DebuffUp(e.Havoc) then
            MOshouldcast = 348
        else
            MOshouldcast = 999
        end

        return true
    elseif ((n:DebuffRefreshable(e.ImmolateDebuff) and (not e.Cataclysm:IsAvailable() or e.Cataclysm:CooldownRemains() > n:DebuffRemains(e.ImmolateDebuff))) and not n:DebuffUp(e.Havoc) and not a:IsCasting(e.Immolate) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285) and n:GUID() == t:GUID()) then
        shouldcast = 348
        return true
    elseif ((n:DebuffRefreshable(e.ImmolateDebuff) and (not e.Cataclysm:IsAvailable() or e.Cataclysm:CooldownRemains() > n:DebuffRemains(e.ImmolateDebuff))) and not n:DebuffUp(e.Havoc) and (n:AffectingCombat() or n:IsDummy() or n:NPCID() == 153285)) then
        return true
    end

end

local function u(a)
                if ((a:DebuffRemains(e.ImmolateDebuff) < 5 and (not e.Cataclysm:IsAvailable() or e.Cataclysm:CooldownRemains() > a:DebuffRemains(e.ImmolateDebuff))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == m("mouseover"):GUID()) then
        if a:DebuffUp(e.Havoc) then
            MOshouldcast = 348
        else
            MOshouldcast = 1348
        end

        return true
    elseif ((a:DebuffRemains(e.ImmolateDebuff) < 5 and (not e.Cataclysm:IsAvailable() or e.Cataclysm:CooldownRemains() > a:DebuffRemains(e.ImmolateDebuff))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and i.Destruction.TargetSwap == "AutoSwap" and a:GUID() ~= t:GUID() and not T) then
        if a:DebuffUp(e.Havoc) then
            MOshouldcast = 348
        else
            MOshouldcast = 999
        end

        return true
    elseif ((a:DebuffRemains(e.ImmolateDebuff) < 5 and (not e.Cataclysm:IsAvailable() or e.Cataclysm:CooldownRemains() > a:DebuffRemains(e.ImmolateDebuff))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285) and a:GUID() == t:GUID()) then
        shouldcast = 348
        return true
    elseif ((a:DebuffRemains(e.ImmolateDebuff) < 5 and (not e.Cataclysm:IsAvailable() or e.Cataclysm:CooldownRemains() > a:DebuffRemains(e.ImmolateDebuff))) and (a:AffectingCombat() or a:IsDummy() or a:NPCID() == 153285)) then
        return true
    end

end

local function Y()
    if (i.Commons.Enabled.TopTrinket or i.Commons.Enabled.BottomTrinket) and n.ShadowedOrbofTorment:IsEquippedAndReady() and (QuakingR == 0 or QuakingR > 2) then
        if n.TomeofMonstrousConstructions:IsEquippedAndReady() then
                        if n.TomeofMonstrousConstructions:ID() == k and i.Commons.Enabled.TopTrinket then
                shouldcast = 24
                return "tome_of_monstrous_constructions precombat 2"
            elseif n.TomeofMonstrousConstructions:ID() == g and i.Commons.Enabled.BottomTrinket then
                shouldcast = 30
                return "tome_of_monstrous_constructions precombat 2"
            end

        end

    end

    if e.GrimoireofSacrifice:IsReady() and a:BuffDown(e.GrimoireofSacrificeBuff) then
        if o(e.GrimoireofSacrifice, nil) then
            shouldcast = 108503
            return "grimoire_of_sacrifice precombat 6"
        end

    end

    if e.Fleshcraft:IsCastable() and d then
        if o(e.Fleshcraft, nil, nil) then
            shouldcast = 324631
            return "fleshcraft precombat 8"
        end

    end

    if (i.Commons.Enabled.TopTrinket or i.Commons.Enabled.BottomTrinket) and n.ShadowedOrbofTorment:IsEquippedAndReady() and (QuakingR == 0 or QuakingR > 2) then
        if n.ShadowedOrbofTorment:IsEquippedAndReady() then
                        if n.ShadowedOrbofTorment:ID() == k and i.Commons.Enabled.TopTrinket then
                shouldcast = 24
                return "ShadowedOrbofTorment precombat 2"
            elseif n.ShadowedOrbofTorment:ID() == g and i.Commons.Enabled.BottomTrinket then
                shouldcast = 30
                return "ShadowedOrbofTorment precombat 2"
            end

        end

    end

    if e.SoulFire:IsReady() and (not a:IsCasting(e.SoulFire)) then
        if o(e.SoulFire, nil, nil, not t:IsSpellInRange(e.SoulFire)) then
            shouldcast = 6353
            return "soul_fire precombat 12"
        end

    end

    if e.Incinerate:IsCastable() and (not a:IsCasting(e.Incinerate)) then
        if o(e.Incinerate, nil, nil, not t:IsSpellInRange(e.Incinerate)) then
            shouldcast = 29722
            return "incinerate precombat 14"
        end

    end

    if e.Conflagrate:IsCastable() and (e.RoaringBlaze:IsAvailable()) then
        if o(e.Conflagrate, nil, nil, not t:IsSpellInRange(e.Conflagrate)) then
            shouldcast = 17962
            return "conflagrate precombat 16"
        end

    end

    if e.Cataclysm:IsCastable() and H and t:IsInMeleeRange(40) then
        if o(e.Cataclysm, nil, nil, not t:IsInRange(40)) then
            if s.GUISettings.General.AutoGroundCast and t:NPCID() ~= 169769 and t:NPCID() ~= 168326 and t:NPCID() ~= 180018 and not c and y and (f or p or w) then
                shouldcast = 1152108
                return "cataclysm precombat 18"
            else
                shouldcast = 152108
                return "cataclysm precombat 18"
            end

        end

    end

    if e.Immolate:IsCastable() and e.Immolate:TimeSinceLastCast() > (e.Immolate:CastTime() + .25) and not a:IsCasting(e.Immolate) then
        if o(e.Immolate, nil, nil, not t:IsSpellInRange(e.Immolate)) then
            shouldcast = 348
            return "immolate precombat 20"
        end

    end

end

local function C()
    if (i.Commons.Enabled.TopTrinket or i.Commons.Enabled.BottomTrinket) and n.ShadowedOrbofTorment:IsEquippedAndReady() and (QuakingR == 0 or QuakingR > 2) and (e.SummonInfernal:CooldownRemains() < 3 or j < 42) then
        if n.ShadowedOrbofTorment:IsEquippedAndReady() then
                        if n.ShadowedOrbofTorment:ID() == k and i.Commons.Enabled.TopTrinket then
                shouldcast = 24
                return "ShadowedOrbofTorment precombat 2"
            elseif n.ShadowedOrbofTorment:ID() == g and i.Commons.Enabled.BottomTrinket then
                shouldcast = 30
                return "ShadowedOrbofTorment precombat 2"
            end

        end

    end

    if e.SummonInfernal:IsCastable() and x() and t:IsInMeleeRange(30) then
        if o(e.SummonInfernal, nil) then
            if s.GUISettings.General.AutoGroundCast and t:NPCID() ~= 169769 and t:NPCID() ~= 168326 and t:NPCID() ~= 180018 and not c and y and (f or p or w) then
                shouldcast = 11122
                return "summon_infernal cds 1"
            else
                shouldcast = 1122
                return "summon_infernal cds 1"
            end

        end

    end

    if e.DarkSoulInstability:IsCastable() and x() and (l() > 0 or e.SummonInfernal:CooldownRemains() > j) then
        if o(e.DarkSoulInstability, nil) then
            shouldcast = 113858
            return "dark_soul_instability cds 2"
        end

    end

    if n.PotionofSpectralIntellect:IsReady() and x() and i.Commons.Enabled.Potions and D and ((a:BloodlustUp() and s.GUISettings.General.HoldPotforBL) or (l > 0 and not s.GUISettings.General.HoldPotforBL)) then
        if o(n.PotionofSpectralIntellect, nil, nil) then
            shouldcast = 50
            return "potion cd 2"
        end

    end

    if e.Berserking:IsCastable() and l() > 0 and x() then
        if o(e.Berserking, nil) then
            shouldcast = 26297
            return "berserking cds 4"
        end

    end

    if e.BloodFury:IsCastable() and l() > 0 and x() then
        if o(e.BloodFury, nil) then
            shouldcast = 20572
            return "blood_fury cds 5"
        end

    end

    if e.Fireblood:IsCastable() and l() > 0 and x() then
        if o(e.Fireblood, nil) then
            shouldcast = 265221
            return "fireblood cds 6"
        end

    end

    if (i.Commons.Enabled.TopTrinket or i.Commons.Enabled.BottomTrinket) and n.ScarsofFraternalStrife:IsEquippedAndReady() then
        if n.ScarsofFraternalStrife:IsEquippedAndReady() and (a:BuffDown(e.ScarsofFraternalStrifeBuff4) or (a:BuffUp(e.ScarsofFraternalStrifeBuff4) and l() > 0)) then
                        if n.ScarsofFraternalStrife:ID() == k and i.Commons.Enabled.TopTrinket then
                shouldcast = 24
                return "ScarsofFraternalStrife precombat 2"
            elseif n.ScarsofFraternalStrife:ID() == g and i.Commons.Enabled.BottomTrinket then
                shouldcast = 30
                return "ScarsofFraternalStrife precombat 2"
            end

        end

    end

    if (i.Commons.Enabled.TopTrinket or i.Commons.Enabled.BottomTrinket) and n.ShadowedOrbofTorment:IsEquippedAndReady() and (QuakingR == 0 or QuakingR > 2) then
        if n.ShadowedOrbofTorment:IsEquippedAndReady() and (e.SummonInfernal:CooldownRemains() < 3 or t:TimeToDie() < 42) then
                        if n.ShadowedOrbofTorment:ID() == k and i.Commons.Enabled.TopTrinket then
                shouldcast = 24
                return "ShadowedOrbofTorment precombat 2"
            elseif n.ShadowedOrbofTorment:ID() == g and i.Commons.Enabled.BottomTrinket then
                shouldcast = 30
                return "ShadowedOrbofTorment precombat 2"
            end

        end

    end

    if l() > 0 then
        local e = a:GetUseableTrinkets(F)
        if e then
            if o(e, nil, nil) then
                                if e:ID() == k and i.Commons.Enabled.TopTrinket then
                    shouldcast = 24
                    return "top trinket 1"
                elseif e:ID() == g and i.Commons.Enabled.BottomTrinket then
                    shouldcast = 30
                    return "top trinket 2"
                end

            end

        end

    end

end

local function F()
    if e.RainofFire:IsReady() and t:IsInMeleeRange(40) and a:SoulShardsP() >= 3 and (l() > 0 and (e.Havoc:CooldownRemains() > 0 or r > 3)) then
        if o(e.RainofFire, nil, nil, not t:IsSpellInRange(e.Conflagrate)) then
            if s.GUISettings.General.AutoGroundCast and t:NPCID() ~= 169769 and t:NPCID() ~= 168326 and t:NPCID() ~= 180018 and not c and y and (f or p or w) then
                shouldcast = 15740
                return "rain_of_fire aoe 2"
            else
                shouldcast = 5740
                return "rain_of_fire aoe 2"
            end

        end

    end

    if e.SoulRot:IsCastable() and d then
        if o(e.SoulRot, nil, nil, not t:IsSpellInRange(e.SoulRot)) then
            shouldcast = 325640
            return "soul_rot aoe 4"
        end

    end

    if e.ImpendingCatastrophe:IsCastable() then
        if o(e.ImpendingCatastrophe, nil, nil, not t:IsSpellInRange(e.ImpendingCatastrophe)) then
            shouldcast = 321792
            return "impending_catastrophe aoe 6"
        end

    end

    if e.ChannelDemonfire:IsCastable() and (t:DebuffRemains(e.ImmolateDebuff) > e.ChannelDemonfire:CastTime()) then
        if o(e.ChannelDemonfire, nil, nil, not t:IsInRange(40)) then
            shouldcast = 23144
            return "channel_demonfire aoe 8"
        end

    end

    if e.Immolate:IsCastable() and (b < 5) and not a:IsCasting(e.Immolate) then
                if e.Immolate:TimeSinceLastCast() > (e.Immolate:CastTime() + .25) and not a:IsCasting(e.Immolate) and (t:DebuffRemains(e.ImmolateDebuff) < 5 and (not e.Cataclysm:IsAvailable() or e.Cataclysm:CooldownRemains() > t:DebuffRemains(e.ImmolateDebuff))) then
            if o(e.Immolate, nil, nil, not t:IsInRange(40)) then
                shouldcast = 348
                return "immolate aoe 110"
            end

        elseif A.CastCycle(e.Immolate, v, u, not t:IsSpellInRange(e.Immolate)) then
            return "immolate aoe 10"
        end

    end

    if true then
        local e = C()
        if e then
            return e
        end

    end

    if e.Havoc:IsCastable() and (r < 4) and N() <= 0 then
        local i = t:GUID()
        for n, a in pairs(v) do
            if a:GUID() ~= i and not a:IsFacingBlacklisted() and not a:IsUserCycleBlacklisted() then
                if o(e.Havoc, nil, nil, not t:IsSpellInRange(e.Havoc)) then
                    shouldcast = 180240
                    return "havoc"
                end

                break
            end

        end

    end

    if e.RainofFire:IsReady() and t:IsInMeleeRange(40) and a:SoulShardsP() >= 3 then
        if o(e.RainofFire, nil, nil, not t:IsSpellInRange(e.Conflagrate)) then
            if s.GUISettings.General.AutoGroundCast and t:NPCID() ~= 169769 and t:NPCID() ~= 168326 and t:NPCID() ~= 180018 and not c and y and (f or p or w) then
                shouldcast = 15740
                return "rain_of_fire aoe 12"
            else
                shouldcast = 5740
                return "rain_of_fire aoe 12"
            end

        end

    end

    if e.Havoc:IsCastable() and N() <= 0 and r > 1 then
        local i = t:GUID()
        for n, a in pairs(v) do
            if a:GUID() ~= i and not a:IsFacingBlacklisted() and not a:IsUserCycleBlacklisted() then
                if o(e.Havoc, nil, nil, not t:IsSpellInRange(e.Havoc)) then
                    shouldcast = 180240
                    return "havoc"
                end

                break
            end

        end

    end

    if e.DecimatingBolt:IsCastable() and d then
        if o(e.DecimatingBolt, nil, nil, not t:IsSpellInRange(e.DecimatingBolt)) then
            shouldcast = 325289
            return "decimating_bolt aoe 14"
        end

    end

    if e.Incinerate:IsCastable() and (e.FireandBrimstone:IsAvailable() and a:BuffUp(e.Backdraft) and a:SoulShardsP() < 5 - .2 * r) then
        if o(e.Incinerate, nil, nil, not t:IsSpellInRange(e.Incinerate)) then
            shouldcast = 29722
            return "incinerate aoe 16"
        end

    end

    if e.SoulFire:IsCastable() then
        if o(e.SoulFire, nil, nil, not t:IsSpellInRange(e.SoulFire)) then
            shouldcast = 6353
            return "soul_fire aoe 18"
        end

    end

    if e.Conflagrate:IsCastable() and (a:BuffDown(e.Backdraft)) then
        if o(e.Conflagrate, nil, nil, not t:IsSpellInRange(e.Conflagrate)) then
            shouldcast = 17962
            return "conflagrate aoe 20"
        end

    end

    if e.Shadowburn:IsReady() and (t:HealthPercentage() < 20) then
        if o(e.Shadowburn, nil, nil, not t:IsSpellInRange(e.Shadowburn)) then
            shouldcast = 17877
            return "shadowburn aoe 22"
        end

    end

    if e.Immolate:IsCastable() and e.Immolate:TimeSinceLastCast() > (e.Immolate:CastTime() + .25) and not a:IsCasting(e.Immolate) and (t:DebuffRefreshable(e.ImmolateDebuff)) then
        if o(e.Immolate, nil, nil, not t:IsSpellInRange(e.Immolate)) then
            shouldcast = 348
            return "immolate aoe 24"
        end

    end

    if e.ScouringTithe:IsCastable() and d then
        if o(e.ScouringTithe, nil, nil, not t:IsSpellInRange(e.ScouringTithe)) then
            shouldcast = 312321
            return "ScouringTithe aoe 26"
        end

    end

    if e.Incinerate:IsCastable() then
        if o(e.Incinerate, nil, nil, not t:IsSpellInRange(e.Incinerate)) then
            shouldcast = 29722
            return "incinerate aoe 28"
        end

    end

end

local function W()
    if e.Conflagrate:IsCastable() and (a:BuffDown(e.Backdraft) and a:SoulShardsP() > 1 and a:SoulShardsP() <= 4) then
        if o(e.Conflagrate, nil, nil, not t:IsSpellInRange(e.Conflagrate)) then
            shouldcast = 17962
            return "conflagrate havoc 2"
        end

    end

    if e.SoulFire:IsCastable() and (e.SoulFire:CastTime() < q) then
        if o(e.SoulFire, nil, nil, not t:IsSpellInRange(e.SoulFire)) then
            shouldcast = 6353
            return "soul_fire havoc 4"
        end

    end

    if e.DecimatingBolt:IsCastable() and d and (e.DecimatingBolt:CastTime() < q and e.LeadByExample:SoulbindEnabled()) then
        if o(e.DecimatingBolt, nil, nil, not t:IsSpellInRange(e.DecimatingBolt)) then
            shouldcast = 325289
            return "decimating_bolt havoc 6"
        end

    end

    if e.ScouringTithe:IsCastable() and d and (e.ScouringTithe:CastTime() < q) then
        if o(e.ScouringTithe, nil, nil, not t:IsSpellInRange(e.ScouringTithe)) then
            shouldcast = 312321
            return "decimating_bolt havoc 8"
        end

    end

    if e.Immolate:IsCastable() and e.Immolate:TimeSinceLastCast() > (e.Immolate:CastTime() + .25) and not a:IsCasting(e.Immolate) and (e.InternalCombustion:IsAvailable() and t:DebuffRemains(e.ImmolateDebuff) < e.ImmolateDebuff:BaseDuration() * .5 or (not e.InternalCombustion:IsAvailable()) and t:DebuffRefreshable(e.ImmolateDebuff)) then
        if o(e.Immolate, nil, nil, not t:IsSpellInRange(e.Immolate)) then
            shouldcast = 348
            return "immolate havoc 10"
        end

    end

    if e.ChaosBolt:IsReady() and (a:SoulShardsP() >= 2 or a:BuffUp(e.RitualofRuinBuff)) and (e.ChaosBolt:CastTime() < q) then
        if o(e.ChaosBolt, nil, nil, not t:IsSpellInRange(e.ChaosBolt)) then
            shouldcast = 116858
            return "chaos_bolt havoc 12"
        end

    end

    if e.Shadowburn:IsReady() then
        if o(e.Shadowburn, nil, nil, not t:IsSpellInRange(e.Shadowburn)) then
            shouldcast = 17877
            return "shadowburn havoc 14"
        end

    end

    if e.Incinerate:IsCastable() and (e.Incinerate:CastTime() < q) then
        if o(e.Incinerate, nil, nil, not t:IsSpellInRange(e.Incinerate)) then
            shouldcast = 29722
            return "incinerate havoc 16"
        end

    end

end

local function x()
    _ = HeroRotationCharDB.Toggles[6]
    d = HeroRotationCharDB.Toggles[4]
    H = HeroRotationCharDB.Toggles[5]
    T = HeroRotationCharDB.Toggles[12]
    D = not HeroRotationCharDB.Toggles[15]
    U = HeroRotationCharDB.Toggles[60]
    S = HeroRotationCharDB.Toggles[150]
    k = GetInventoryItemID("player", 13)
    g = GetInventoryItemID("player", 14)
    QuakingR = 0
    for e = 1, 20 do
        if select(10, UnitDebuff("player", e)) == 240447 then
            if select(6, UnitDebuff("player", e)) ~= nil then
                QuakingR = (select(6, UnitDebuff("player", e)) - (GetTime()))
            end

        end

    end

end

local function g()
    v = a:GetEnemiesInRange(40)
        if O() and i.Commons.AoeMode == "Conservative" then
        r = t:GetEnemiesInSplashRangeCount(8)
        EnemiesCount10ySplash = t:GetEnemiesInSplashRangeCount(15)
        b = t:GetEnemiesInSplashRangeCount(40)
    elseif O() and i.Commons.AoeMode == "Aggresive" then
        local t = 0
        for e = 1, 20 do
            local e = "nameplate" .. e
            if UnitExists(e) then
                if UnitCanAttack("player", e) then
                    if (UnitCanAttack("player", e) and UnitAffectingCombat(e) and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil) or m(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) or string.find(UnitGUID(e), 182778) or string.find(UnitGUID(e), 183945) then
                        t = (t + 1)
                    end

                end

            end

        end

        r = t
        b = t
    end

    local u = 0
    for e = 1, 20 do
        local e = "nameplate" .. e
        if UnitExists(e) then
            if UnitCanAttack("player", e) then
                if (UnitCanAttack("player", e) and UnitAffectingCombat(e) and IsItemInRange(32698, e) and UnitDetailedThreatSituation("player", e) ~= nil and m(e):TimeToDie() >= 12) or m(e):IsDummy() or string.find(UnitGUID(e), 153285) or string.find(UnitGUID(e), 31146) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 179124) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 180323) or string.find(UnitGUID(e), 179010) or string.find(UnitGUID(e), 179942) or string.find(UnitGUID(e), 176521) or string.find(UnitGUID(e), 177594) or string.find(UnitGUID(e), 177117) or string.find(UnitGUID(e), 176581) or string.find(UnitGUID(e), 180840) or string.find(UnitGUID(e), 176605) or UnitName(e) == "Glacial Spike" or string.find(UnitGUID(e), 180473) or string.find(UnitGUID(e), 180474) or string.find(UnitGUID(e), 176929) or string.find(UnitGUID(e), 176920) or string.find(UnitGUID(e), 177154) or string.find(UnitGUID(e), 177787) or string.find(UnitGUID(e), 177889) or string.find(UnitGUID(e), 177891) or string.find(UnitGUID(e), 177892) or string.find(UnitGUID(e), 168326) or string.find(UnitGUID(e), 182778) or string.find(UnitGUID(e), 183945) then
                    u = (u + 1)
                end

            end

        end

    end

    if not O() then
        b = 1
        r = 1
    end

    if U then
        b = 10
        r = 10
    end

    if not BotOn then
        MOshouldcast = 0
        shouldcast = 0
    end

    MOshouldcast = 0
    shouldcast = 0
    if GetTime() > R + 1 and c then
        c = false
    end

    ShouldReturn = x()
    L, G, q = V(v)
    if a:IsDeadOrGhost() then
        MOshouldcast = 999
    end

    if a:IsChanneling(h(355321)) or a:IsCasting(e.ChannelDemonfire) or a:IsChanneling(e.ChannelDemonfire) or a:IsChanneling(e.HealthFunnel) then
        if o(e.Pool, nil) then
            shouldcast = 99999
            return "Trinket Channel"
        end

    end

    if a:IsChanneling(h(324631)) then
                if a:AffectingCombat() and i.Destruction.CastCancelFC then
            shouldcast = 1999
        elseif s.CastAnnotated(e.Pool, false, "WAIT") then
            shouldcast = 99999
            return "Pool During Fleshcraft"
        end

    end

    local h = nil
    local u = 0
                if i.Commons.SummonPetSlot == 1 then
        h = e.SummonImp
        u = 416
    elseif i.Commons.SummonPetSlot == 2 then
        h = e.SummonVoidwalker
        u = 1860
    elseif i.Commons.SummonPetSlot == 3 then
        h = e.SummonFelhunter
        u = 417
    elseif i.Commons.SummonPetSlot == 4 then
        h = e.SummonSuccubus
        u = 184600
    end

    if h ~= nil and h:IsCastable() and not a:IsMoving() and not a:PrevGCD(1, h) and not a:IsCasting(h) and h:TimeSinceLastCast() > 1 and ((not E:IsActive()) or (E:IsActive() and u ~= E:NPCID())) then
                                if i.Commons.SummonPetSlot == 1 and not a:PrevGCD(1, h) then
            if o(h, nil) then
                shouldcast = 688
                return "Summon Pet"
            end

        elseif i.Commons.SummonPetSlot == 2 and not a:PrevGCD(1, h) then
            if o(h, nil) then
                shouldcast = 697
                return "Summon Pet"
            end

        elseif i.Commons.SummonPetSlot == 3 and not a:PrevGCD(1, h) then
            if o(h, nil) then
                shouldcast = 691
                return "Summon Pet"
            end

        elseif i.Commons.SummonPetSlot == 4 and not a:PrevGCD(1, h) then
            if o(h, nil) then
                shouldcast = 366222
                return "Summon Pet"
            end

        end

    end

    if A.TargetIsValid() and (a:AffectingCombat() or _) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285 or t:NPCID() == 168326 or t:NPCID() == 176581 or t:NPCID() == 176920 or t:NPCID() == 177892 or t:NPCID() == 182778 or t:NPCID() == 185402 or t:NPCID() == 183945 or t:NPCID() == 182074 or t:NPCID() == 184737 or t:NPCID() == 179733 or t:NPCID() == 115402 or t:NPCID() == 115406 or t:NPCID() == 115395 or UnitExists("boss1") or t:NPCID() == 115388 or _) and not a:IsDeadOrGhost() then
        if not a:AffectingCombat() and ((_)) and A.TargetIsValid() and not a:IsMoving() then
            local e = Y()
            if e then
                return e
            end

        end

        if e.UnendingResolve:IsCastable() and a:HealthPercentage() <= i.Destruction.UnendingResolveHP then
            if o(e.UnendingResolve, nil) then
                shouldcast = 104773
                return "UnendingResolve"
            end

        end

        if e.DarkPact:IsCastable() and a:HealthPercentage() <= i.Destruction.DarkPactHP then
            if o(e.DarkPact, nil) then
                shouldcast = 108416
                return "DarkPact"
            end

        end

        if e.MortalCoil:IsCastable() and a:HealthPercentage() <= i.Destruction.MortalCoilHP then
            if o(e.MortalCoil, nil) then
                shouldcast = 6789
                return "DarkPact"
            end

        end

        if a:HealthPercentage() < i.Commons.HealthstoneHP and n.Healthstone:IsReady() and n.Healthstone:CooldownRemains() <= 0 then
            if s.Cast(n.Healthstone, nil) then
                shouldcast = 40
                return "Healthstone HP"
            end

        end

        if a:HealthPercentage() < i.Commons.HealPotHP and n.HealPot:IsReady() and n.HealPot:CooldownRemains() <= 0 then
            if s.Cast(n.HealPot, nil) then
                shouldcast = 41
                return "HealPot HP"
            end

        end

        if a:HealthPercentage() < i.Commons.HealPotHP and n.CosmicHealPot:IsReady() and n.CosmicHealPot:CooldownRemains() <= 0 then
            if s.Cast(n.CosmicHealPot, nil) then
                shouldcast = 45
                return "CosmicHealPot HP"
            end

        end

                if (S and e.Shadowfury:IsAvailable() and e.Shadowfury:CooldownRemains(BypassRecovery) <= 0) then
            if s.Cast(e.Shadowfury, nil, nil, nil) then
                if s.GUISettings.General.AutoGroundCast and t:NPCID() ~= 169769 and t:NPCID() ~= 168326 and t:NPCID() ~= 180018 and not c and y and (f or p or w) then
                    shouldcast = 130283
                    return "queue Shadowfury"
                else
                    shouldcast = 30283
                    return "queue Shadowfury"
                end

            end

        elseif ((not e.Shadowfury:IsUsableP() or e.Shadowfury:CooldownRemains() > 0) and S) then
            HeroRotationCharDB.Toggles[150] = not HeroRotationCharDB.Toggles[150]
            s.Print("Shadowfury Queue is now " .. (HeroRotationCharDB.Toggles[150] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

        if a:AffectingCombat() or ((_)) then
            if t:DebuffUp(e.Havoc) and not T and r > 1 then
                MOshouldcast = 999
                return true
            end

            if not E:IsDeadOrGhost() and UnitExists("pet") and e.HealthFunnel:IsCastable() and a:HealthPercentage() >= 35 and E:HealthPercentage() <= i.Commons.HealthFunnelHP and not a:PrevGCD(1, e.HealthFunnel) then
                if o(e.HealthFunnel) then
                    shouldcast = 755
                    return "HealthFunnel Pet High Priority"
                end

            end

            if L and b > 1 and b < 5 - I(e.Inferno:IsAvailable()) + I(e.Inferno:IsAvailable() and e.InternalCombustion:IsAvailable()) then
                local e = W()
                if e then
                    return e
                end

            end

            if e.Fleshcraft:IsCastable() and (e.VolatileSolvent:SoulbindEnabled() and a:BuffDown(e.VolatileSolventHumanBuff)) then
                if o(e.Fleshcraft, nil, nil) then
                    shouldcast = 324631
                    return "fleshcraft main 1"
                end

            end

            if e.Conflagrate:IsReady() and (e.RoaringBlaze:IsAvailable() and t:DebuffRemains(e.RoaringBlazeDebuff) < 1.5) then
                if o(e.Conflagrate, nil, nil, not t:IsSpellInRange(e.Conflagrate)) then
                    shouldcast = 17962
                    return "conflagrate main 2"
                end

            end

            if e.Cataclysm:IsReady() and t:IsInMeleeRange(40) and H then
                if o(e.Cataclysm, nil, nil, not t:IsInRange(40)) then
                    if s.GUISettings.General.AutoGroundCast and t:NPCID() ~= 169769 and t:NPCID() ~= 168326 and t:NPCID() ~= 180018 and not c and y and (f or p or w) then
                        shouldcast = 1152108
                        return "cataclysm main 3"
                    else
                        shouldcast = 152108
                        return "cataclysm main 3"
                    end

                end

            end

            if r > 2 then
                local e = F()
                if e then
                    return e
                end

            end

            if e.SoulFire:IsCastable() and a:SoulShardsP() <= 4 then
                                if (t:DebuffRefreshable(e.ImmolateDebuff) and ((not e.Cataclysm:IsAvailable()) or e.Cataclysm:CooldownRemains() > t:DebuffRemains(e.ImmolateDebuff))) then
                    if o(e.SoulFire, nil, nil, not t:IsSpellInRange(e.SoulFire)) then
                        shouldcast = 6353
                        return "SoulFire main 5"
                    end

                elseif A.CastCycle(e.SoulFire, v, B, not t:IsSpellInRange(e.SoulFire)) then
                    return "soul_fire main 5"
                end

            end

            if e.Immolate:IsCastable() and not a:IsCasting(e.Immolate) then
                                if e.Immolate:TimeSinceLastCast() > (e.Immolate:CastTime() + .25) and not a:IsCasting(e.Immolate) and (t:DebuffRefreshable(e.ImmolateDebuff) and (not e.Cataclysm:IsAvailable() or e.Cataclysm:CooldownRemains() > t:DebuffRemains(e.ImmolateDebuff))) then
                    if o(e.Immolate, nil, nil, not t:IsSpellInRange(e.Immolate)) then
                        shouldcast = 348
                        return "Immolate main 6"
                    end

                elseif A.CastCycle(e.Immolate, v, P, not t:IsSpellInRange(e.Immolate)) then
                    return "immolate main 6"
                end

            end

            if e.Immolate:IsCastable() and (e.InternalCombustion:IsAvailable() and e.ChaosBolt:InFlight() and t:DebuffRemains(e.ImmolateDebuff) < e.Immolate:BaseDuration() * .5) then
                if o(e.Immolate, nil, nil, not t:IsSpellInRange(e.Immolate)) then
                    shouldcast = 348
                    return "immolate main 7"
                end

            end

            if e.ChaosBolt:IsReady() and (a:SoulShardsP() >= 2 or a:BuffUp(e.RitualofRuinBuff)) and ((l() > 0 or K() > 0) and a:SoulShardsP() >= 4) then
                if o(e.ChaosBolt, nil, nil, not t:IsSpellInRange(e.ChaosBolt)) then
                    shouldcast = 116858
                    return "chaos_bolt main 14"
                end

            end

            if true then
                local e = C()
                if e then
                    return e
                end

            end

            if e.ChannelDemonfire:IsCastable() and t:DebuffRemains(e.ImmolateDebuff) > 0 then
                if o(e.ChannelDemonfire, nil, nil, not t:IsInRange(40)) then
                    shouldcast = 196447
                    return "channel_demonfire main 9"
                end

            end

            if e.ScouringTithe:IsCastable() and d then
                if o(e.ScouringTithe, nil, nil, not t:IsSpellInRange(e.ScouringTithe)) then
                    shouldcast = 312321
                    return "scouring_tithe main 10"
                end

            end

            if e.DecimatingBolt:IsCastable() and d then
                if o(e.DecimatingBolt, nil, nil, not t:IsSpellInRange(e.DecimatingBolt)) then
                    shouldcast = 325289
                    return "decimating_bolt main 11"
                end

            end

            if e.Havoc:IsCastable() and O() and N() <= 0 and r > 1 then
                local i = t:GUID()
                for n, a in pairs(v) do
                    if a:GUID() ~= i and not a:IsFacingBlacklisted() and not a:IsUserCycleBlacklisted() and (a:DebuffRemains(e.ImmolateDebuff) > e.Immolate:BaseDuration() * .5 or not e.InternalCombustion:IsAvailable()) then
                        if o(e.Havoc, nil, nil, not t:IsSpellInRange(e.Havoc)) then
                            shouldcast = 180240
                            return "havoc"
                        end

                        break
                    end

                end

            end

            if e.ImpendingCatastrophe:IsCastable() and d then
                if o(e.ImpendingCatastrophe, nil, nil, not t:IsSpellInRange(e.ImpendingCatastrophe)) then
                    shouldcast = 321792
                    return "impending_catastrophe main 13"
                end

            end

            if e.SoulRot:IsCastable() and d then
                if o(e.SoulRot, nil, nil, not t:IsSpellInRange(e.SoulRot)) then
                    shouldcast = 325640
                    return "soul_rot main 14"
                end

            end

            if e.Havoc:IsCastable() and M and r > 1 then
                if o(e.Havoc, nil, nil, not t:IsSpellInRange(e.Havoc)) then
                    shouldcast = 80240
                    return "havoc main 15"
                end

            end

            z = (r > 1 and e.Havoc:CooldownRemains() <= 10 or a:BuffUp(e.RitualofRuinBuff) and e.RainofChaos:IsAvailable())
            if e.Conflagrate:IsCastable() and (a:BuffDown(e.Backdraft) and a:SoulShardsP() >= 1.5 - .3 * I(e.Flashover:IsAvailable()) and (not z)) then
                if o(e.Conflagrate, nil, nil, not t:IsSpellInRange(e.Conflagrate)) then
                    shouldcast = 17962
                    return "conflagrate main 17"
                end

            end

            if e.ChaosBolt:IsReady() and (a:SoulShardsP() >= 2 or a:BuffUp(e.RitualofRuinBuff)) and (l() > 0 or a:BuffRemains(e.RainofChaosBuff) > e.ChaosBolt:CastTime()) then
                if o(e.ChaosBolt, nil, nil, not t:IsSpellInRange(e.ChaosBolt)) then
                    shouldcast = 116858
                    return "chaos_bolt main 18"
                end

            end

            if e.ChaosBolt:IsReady() and (a:SoulShardsP() >= 2 or a:BuffUp(e.RitualofRuinBuff)) and (a:BuffUp(e.Backdraft) and not z) then
                if o(e.ChaosBolt, nil, nil, not t:IsSpellInRange(e.ChaosBolt)) then
                    shouldcast = 116858
                    return "chaos_bolt main 19"
                end

            end

            if e.ChaosBolt:IsReady() and (a:SoulShardsP() >= 2 or a:BuffUp(e.RitualofRuinBuff)) and (e.Eradication:IsAvailable() and (not z) and t:DebuffRemains(e.EradicationDebuff) < e.ChaosBolt:CastTime()) then
                if o(e.ChaosBolt, nil, nil, not t:IsSpellInRange(e.ChaosBolt)) then
                    shouldcast = 116858
                    return "chaos_bolt main 20"
                end

            end

            if e.Shadowburn:IsReady() and ((not z) or a:SoulShardsP() >= 4.5) then
                if o(e.Shadowburn, nil, nil, not t:IsSpellInRange(e.Shadowburn)) then
                    shouldcast = 17877
                    return "shadowburn main 21"
                end

            end

            if e.ChaosBolt:IsReady() and (a:SoulShardsP() >= 3.5) then
                if o(e.ChaosBolt, nil, nil, not t:IsSpellInRange(e.ChaosBolt)) then
                    shouldcast = 116858
                    return "chaos_bolt main 22"
                end

            end

            if e.ChaosBolt:IsReady() and (j < 5.5 and j > e.ChaosBolt:CastTime() + e.ChaosBolt:TravelTime()) then
                if o(e.ChaosBolt, nil, nil, not t:IsSpellInRange(e.ChaosBolt)) then
                    shouldcast = 116858
                    return "chaos_bolt main 39"
                end

            end

            if e.Conflagrate:IsCastable() and (e.Conflagrate:Charges() > 1 or j < a:GCD() + .5) then
                if o(e.Conflagrate, nil, nil, not t:IsSpellInRange(e.Conflagrate)) then
                    shouldcast = 17962
                    return "conflagrate main 23"
                end

            end

            if e.Incinerate:IsCastable() then
                if o(e.Incinerate, nil, nil, not t:IsSpellInRange(e.Incinerate)) then
                    shouldcast = 29722
                    return "incinerate main 24"
                end

            end

            return 
        end

    end

end

local function e()
    s.Print("Destruction Warlock rotation is currently a work in progress.")
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        s.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpell()
    if shouldcast == 0 then
        return 0
    else
        return shouldcast
    end

end

function ReturnSpellMO()
    if MOshouldcast == 0 then
        return 0
    else
        return MOshouldcast
    end

end

s.SetAPL(267, g, e)

