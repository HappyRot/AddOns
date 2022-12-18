local e, e = ...
local e = HeroDBC.DBC
local b = HeroLib
local e = HeroCache
local r = b.Unit
local t = r.Player
local e = r.Pet
local i = r.Target
local h = b.Spell
local e = b.MultiSpell
local p = b.Item
local s = HeroRotation
local F = s.AoEON
local m = s.CDsON
local o = s.Cast
local c = HeroRotationCharDB.Toggles[4] and (select(8, GetInstanceInfo())) ~= 1698
local X = HeroRotationCharDB.Toggles[5]
local Y = HeroRotationCharDB.Toggles[6]
local S = HeroRotationCharDB.Toggles[15]
local H = HeroRotationCharDB.Toggles[12]
local N = HeroRotationCharDB.Toggles[70]
local A = HeroRotationCharDB.Toggles[71]
local x = HeroRotationCharDB.Toggles[72]
local D = HeroRotationCharDB.Toggles[73]
local O = HeroRotationCharDB.Toggles[74]
local I = HeroRotationCharDB.Toggles[75]
local R = HeroRotationCharDB.Toggles[76]
local U = HeroRotationCharDB.Toggles[77]
local M = HeroRotationCharDB.Toggles[78]
local L = HeroRotationCharDB.Toggles[79]
local g = false
local E = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668 }
local e = { 325552, 326836, 326092, 334926, 328395, 330725, 333299, 323831, 328494, 322968, 334496, 334493, 319603 }
local v = s.Commons.Everyone
local n = { General = s.GUISettings.General, Commons = s.GUISettings.APL.Druid.Commons, Guardian = s.GUISettings.APL.Druid.Guardian, Guardian2 = s.GUISettings.APL.Druid.Guardian2 }
local e = h.Druid.Guardian
local u = p.Druid.Guardian
local k = {  }
local y = t:GetEquipment()
local C = p(0)
local T = p(0)
if y[13] then
    C = p(y[13])
end

if y[14] then
    T = p(y[14])
end

local J
local j
local q
local l = 0
local a = 0
local d = 0
local W
local w, d
local _ = t:HasLegendaryEquipped(58)
local V = t:HasLegendaryEquipped(49)
local P = t:HasLegendaryEquipped(48)
local z = t:HasLegendaryEquipped(60)
local f = t:CovenantID()
b:RegisterForEvent(function()
    f = t:CovenantID()
end, "COVENANT_CHOSEN")
b:RegisterForEvent(function()
    y = t:GetEquipment()
    C = p(0)
    T = p(0)
    if y[13] then
        C = p(y[13])
    end

    if y[14] then
        T = p(y[14])
    end

    _ = t:HasLegendaryEquipped(58)
    V = t:HasLegendaryEquipped(49)
    P = t:HasLegendaryEquipped(48)
    z = t:HasLegendaryEquipped(60)
end, "PLAYER_EQUIPMENT_CHANGED")
b:RegisterForEvent(function()
    e.AdaptiveSwarmCov:RegisterInFlight()
end, "LEARNED_SPELL_IN_TAB")
e.AdaptiveSwarmCov:RegisterInFlight()
local function y(e)
    if e then
        return 1
    else
        return 0
    end

end

local function y(e)
    return e ~= 0
end

local function K(t)
    local e = 0
    for a in pairs(t) do
        local t = t[a]
        if t:IsChanneling(h(240784)) then
            e = e + 1
        end

    end

    return e
end

local function B(a)
    local e = 0
    for o in pairs(a) do
        local a = a[o]
        if (a:CastRemains() <= t:GCD() + .25 and a:IsCasting(h(240784))) then
            e = e + 1
        end

    end

    return e
end

local function G(t)
    local e = 0
    for a in pairs(t) do
        local t = t[a]
        if (t:NPCID() == 118044) then
            e = e + 1
        end

    end

    return e
end

local function Z(t)
    local e = 0
    for a in pairs(t) do
        local t = t[a]
        if (t:NPCID() == 118065 or t:NPCID() == 118032) then
            e = e + 1
        end

    end

    return e
end

local function b(t)
                if ((t:DebuffRefreshable(e.MoonfireDebuff) and t:TimeToDie() > 12) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == r("mouseover"):GUID() and (n.Guardian.TargetSwap == "Mouseover") and t:NPCID() ~= 118044) then
        l = 18921
        return true
    elseif ((t:DebuffRefreshable(e.MoonfireDebuff) and t:TimeToDie() > 12) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and n.Guardian.TargetSwap == "AutoSwap" and t:GUID() ~= i:GUID() and not H and t:NPCID() ~= 118044) then
        l = 9999
                if l == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif l > 0 and endtime ~= nil and GetTime() > endtime then
            l = 0
        end

        return true
    elseif ((t:DebuffRefreshable(e.MoonfireDebuff) and t:TimeToDie() > 12) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == i:GUID() and t:NPCID() ~= 118044) then
        a = 8921
        return true
    elseif ((t:DebuffRefreshable(e.MoonfireDebuff) and t:TimeToDie() > 12) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:NPCID() ~= 118044) then
        return true
    end

end

local function Q(e)
            if ((not t:IsTanking(e) and x) and (e:AffectingCombat()) and e:GUID() == r("mouseover"):GUID() and e:NPCID() ~= 118044) then
        l = 16795
        return true
    elseif ((not t:IsTanking(e) and x) and (e:AffectingCombat()) and e:GUID() == i:GUID() and e:NPCID() ~= 118044) then
        a = 6795
        return true
    elseif ((not t:IsTanking(e) and x) and (e:AffectingCombat()) and e:NPCID() ~= 118044) then
        return true
    end

end

local function T(t)
            if ((t:DebuffRefreshable(e.MoonfireDebuff) and (t:NPCID() == 118032 or t:NPCID() == 118065)) and t:GUID() == r("mouseover"):GUID() and t:NPCID() ~= 118044) then
        l = 18921
        return true
    elseif ((t:DebuffRefreshable(e.MoonfireDebuff) and (t:NPCID() == 118032 or t:NPCID() == 118065)) and t:GUID() == r("target"):GUID() and t:NPCID() ~= 118044) then
        a = 8921
        return true
    elseif ((t:DebuffRefreshable(e.MoonfireDebuff) and (t:NPCID() == 118032 or t:NPCID() == 118065))) then
        return true
    end

end

local function V(t)
            if ((t:DebuffRefreshable(e.SunfireDebuff) and t:NPCID() == 118065) and t:GUID() == r("mouseover"):GUID() and t:NPCID() ~= 118044) then
        l = 2197630
        return true
    elseif ((t:DebuffRefreshable(e.SunfireDebuff) and t:NPCID() == 118065) and t:GUID() == r("target"):GUID() and t:NPCID() ~= 118044) then
        a = 197630
        return true
    elseif ((t:DebuffRefreshable(e.SunfireDebuff) and t:NPCID() == 118065)) then
        return true
    end

end

local function y(a)
    return (a:DebuffRefreshable(e.ThrashDebuff) or a:DebuffStack(e.ThrashDebuff) < 3 or (a:DebuffStack(e.ThrashDebuff) < 4 and _) or d >= 4 or t:BuffUp(e.BerserkBuff) and t:BuffRemains(e.BerserkBuff) <= t:GCD() + .5)
end

local function P(t)
                if ((t:DebuffStack(e.ThrashDebuff) > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == r("mouseover"):GUID() and n.Guardian.TargetSwap == "Mouseover") then
        l = 180313
        return true
    elseif ((t:DebuffStack(e.ThrashDebuff) > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and n.Guardian.TargetSwap == "AutoSwap" and t:GUID() ~= i:GUID() and not H) then
        l = 9999
                if l == 999 then
            starttime = GetTime()
            endtime = starttime + .25
        elseif l > 0 and endtime ~= nil and GetTime() > endtime then
            l = 0
        end

        return true
    elseif ((t:DebuffStack(e.ThrashDebuff) > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == i:GUID()) then
        a = 80313
        return true
    elseif ((t:DebuffStack(e.ThrashDebuff) > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285)) then
        return true
    end

    return (t:DebuffStack(e.ThrashDebuff) > 2)
end

local function p()
    if t:HealthPercentage() < n.Guardian2.FrenziedRegenHP and e.FrenziedRegeneration:IsReady() and t:BuffDown(e.FrenziedRegenerationBuff) and t:BuffUp(e.BearForm) then
        if o(e.FrenziedRegeneration, nil, nil) then
            a = 22842
            return "frenzied_regeneration defensive 2"
        end

    end

    if e.Ironfur:IsCastable() and not g and t:BuffUp(e.BearForm) and e.ConvoketheSpirits:TimeSinceLastDisplay() > 1 and (t:Rage() >= e.Ironfur:Cost() + 1 and (j or i:IsDummy() or i:NPCID() == 153285) and (t:BuffDown(e.IronfurBuff) or t:BuffStack(e.IronfurBuff) < 2 and t:BuffRefreshable(e.Ironfur) or t:Rage() >= 90)) then
        if o(e.Ironfur, nil, nil) then
            a = 192081
            return "ironfur defensive 4"
        end

    end

    local i = t:GetUseableTrinkets(k)
    if i then
        if o(i, nil, nil) then
                        if i:ID() == TopTrinketID and n.Commons.Enabled.TopTrinket and (n.Commons.TopTrinketHP > t:HealthPercentage()) then
                a = 24
                return "top trinket 1 defensive"
            elseif i:ID() == BotTrinketID and n.Commons.Enabled.BotTrinket and (n.Commons.BotTrinketHP > t:HealthPercentage()) then
                a = 30
                return "bot trinket 1 defensive"
            end

        end

    end

    if e.Renewal:IsCastable() and (t:HealthPercentage() < n.Guardian2.RenewalHP) then
        if o(e.Renewal, nil, nil) then
            a = 108238
            return "Renewal defensive 4"
        end

    end

    if e.Barkskin:IsCastable() and (select(8, GetInstanceInfo())) ~= 1698 and (t:HealthPercentage() < n.Guardian2.BarkskinHP) then
        if o(e.Barkskin, nil, nil) then
            a = 22812
            return "barkskin defensive 6"
        end

    end

    if e.SurvivalInstincts:IsCastable() and (t:HealthPercentage() < n.Guardian2.SurvivalInstinctsHP) then
        if o(e.SurvivalInstincts, nil, nil) then
            a = 61336
            return "survival_instincts defensive 8"
        end

    end

    if e.BristlingFur:IsCastable() and (t:Rage() < n.Guardian2.BristlingFurRage) then
        if o(e.BristlingFur, nil, nil) then
            a = 155835
            return "bristling_fur defensive 10"
        end

    end

    if t:HealthPercentage() < n.Guardian2.PhialHP and u.PhialofSerenity:IsReady() and u.PhialofSerenity:CooldownRemains() <= 0 then
        if s.Cast(u.PhialofSerenity, nil) then
            a = 55
            return "PhialofSerenity HP"
        end

    end

    if t:HealthPercentage() < n.Guardian2.HealthstoneHP and u.Healthstone:IsReady() and u.Healthstone:CooldownRemains() <= 0 then
        if s.Cast(u.Healthstone, nil) then
            a = 40
            return "Healthstone HP"
        end

    end

    if t:HealthPercentage() < n.Guardian2.HealPotHP and u.CosmicHealPot:IsReady() and u.CosmicHealPot:CooldownRemains() <= 0 then
        if s.Cast(u.CosmicHealPot, nil) then
            a = 45
            return "CosmicHealPot HP"
        end

    end

    if t:HealthPercentage() < n.Guardian2.HealPotHP and u.HealPot:IsReady() and u.HealPot:CooldownRemains() <= 0 then
        if s.Cast(u.HealPot, nil) then
            a = 41
            return "HealPot HP"
        end

    end

end

local function C()
    if e.BearForm:IsCastable() and (t:BuffDown(e.BearForm)) and not (select(8, GetInstanceInfo())) == 1698 then
        if o(e.BearForm) then
            a = 5487
            return "bear_form precombat 2"
        end

    end

    if e.Wrath:IsCastable() and (N or (select(8, GetInstanceInfo())) == 1698) and t:BuffUp(e.MoonkinForm) and (f ~= 3 or (select(8, GetInstanceInfo())) == 1698) then
        if o(e.Wrath) then
            a = 5176
            return "cat_form precombat 2"
        end

    end

    if e.Starfire:IsCastable() and (N or (select(8, GetInstanceInfo())) == 1698) and t:BuffUp(e.MoonkinForm) and f == 3 then
        if o(e.Starfire) then
            a = 197628
            return "cat_form precombat 2"
        end

    end

    if e.Fleshcraft:IsCastable() and c and not t:IsMoving() and (e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled()) then
        if o(e.Fleshcraft, nil, nil) then
            a = 324631
            return "fleshcraft precombat 3"
        end

    end

    if e.WildCharge:IsCastable() and (i:IsInRange(25) and not i:IsInRange(8)) and not (select(8, GetInstanceInfo())) == 1698 then
        if o(e.WildCharge) then
            a = 102401
            return "wild_charge precombat 4"
        end

    end

    if e.Rake:IsCastable() and t:BuffUp(e.Prowl) and not (select(8, GetInstanceInfo())) == 1698 then
        if o(e.Rake) then
            a = 1822
            return "Rake cat 2"
        end

    end

    if e.Mangle:IsCastable() and i:IsInMeleeRange(5) and t:BuffUp(e.BearForm) and not (select(8, GetInstanceInfo())) == 1698 then
        if o(e.Mangle) then
            a = 33917
            return "mangle precombat 6"
        end

    end

    if e.Thrash:IsCastable() and i:IsInMeleeRange(8) and t:BuffUp(e.BearForm) and not (select(8, GetInstanceInfo())) == 1698 then
        if o(e.Thrash) then
            a = 77758
            return "thrash precombat 8"
        end

    end

    if e.Moonfire:IsCastable() and i:NPCID() ~= 118044 then
        if o(e.Moonfire, nil, nil, not i:IsSpellInRange(e.Moonfire)) then
            a = 8921
            return "moonfire precombat 10"
        end

    end

end

local function y()
    if e.MoonkinForm:IsCastable() and t:BuffDown(e.MoonkinForm) then
        if o(e.MoonkinForm) then
            a = 197625
            return "MoonkinForm lycara 2"
        end

    end

end

local function y()
    if e.CatForm:IsCastable() and t:BuffDown(e.CatForm) then
        if o(e.CatForm) then
            a = 768
            return "catform lycara 2"
        end

    end

end

local function y()
    if e.MoonkinForm:IsCastable() and t:BuffDown(e.MoonkinForm) then
        if o(e.MoonkinForm) then
            a = 197625
            return "owl_form owl 2"
        end

    end

    if e.HeartoftheWild:IsCastable() and m() and e.HeartoftheWild:IsAvailable() and t:BuffDown(e.HeartoftheWild) then
        if o(e.HeartoftheWild) then
            a = 319454
            return "HOTW owl 2"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and t:BuffUp(e.MoonkinForm) and c and (e.FirstStrike:SoulbindEnabled() and t:BuffUp(e.FirstStrike)) then
        if o(e.ConvoketheSpirits) then
            a = 323764
            return "Convoke owl 2"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and c and t:BuffUp(e.MoonkinForm) and ((e.HeartoftheWild:IsAvailable() and (t:BuffUp(e.HeartoftheWild) or e.HeartoftheWild:CooldownRemains() > 15)) or (not e.HeartoftheWild:IsAvailable()) or (not m())) then
        if o(e.ConvoketheSpirits) then
            a = 323764
            return "Convoke owlvoke 2"
        end

    end

end

local function y()
    if e.CatForm:IsCastable() and t:BuffDown(e.CatForm) then
        if o(e.CatForm) then
            a = 768
            return "catform catvoke 2"
        end

    end

    if e.HeartoftheWild:IsCastable() and m() and e.HeartoftheWild:IsAvailable() and t:BuffDown(e.HeartoftheWild) then
        if o(e.HeartoftheWild) then
            a = 319454
            return "HOTW catvoke 2"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and c and t:BuffUp(e.CatForm) and ((e.FirstStrike:SoulbindEnabled() and t:BuffUp(e.FirstStrikeBuff)) or (e.HeartoftheWild:IsAvailable() and (t:BuffUp(e.HeartoftheWild) or e.HeartoftheWild:CooldownRemains() > 15)) or (not e.HeartoftheWild:IsAvailable()) or (not m())) then
        if o(e.ConvoketheSpirits) then
            a = 323764
            return "Convoke catvoke 2"
        end

    end

end

local function y()
    if e.BearForm:IsCastable() and (t:BuffDown(e.BearForm)) then
        if o(e.BearForm) then
            a = 5487
            return "bear_form bear 2"
        end

    end

    if e.Growl:IsReady() and t:AffectingCombat() and (not t:IsTanking(i) and x) then
        if o(e.Growl, nil) then
            a = 6795
            return "Growl bear 3"
        end

    end

    if e.Growl:IsReady() then
        if v.CastCycle(e.Growl, Enemies40y, Q, not i:IsSpellInRange(e.Growl)) then
            return "Growl bear 4"
        end

    end

    if e.Ironfur:IsCastable() and e.ConvoketheSpirits:TimeSinceLastDisplay() > 1 and t:Rage() >= e.Ironfur:Cost() + 1 and not q and (t:BuffUp(e.IncarnationBuff) or t:BuffUp(e.BerserkBuff)) then
        if o(e.Ironfur, nil, nil) then
            a = 192081
            return "ironfur Zerk 1"
        end

    end

    if e.Berserking:IsCastable() and i:IsInMeleeRange(8) and (t:BuffUp(e.BerserkBuff) or t:BuffUp(e.IncarnationBuff)) then
        if o(e.Berserking, nil) then
            a = 26297
            return "berserking bear 15"
        end

    end

    if (f == 2) and i:IsInMeleeRange(8) then
        local e = t:GetUseableTrinkets(k)
        if e then
            if o(e, nil, nil) then
                                if e:ID() == TopTrinketID and n.Commons.Enabled.TopTrinket and ((n.Commons.TopTrinketHP <= 0 and m()) or n.Commons.TopTrinketHP > t:HealthPercentage()) then
                    a = 24
                    return "top trinket 1"
                elseif e:ID() == BotTrinketID and n.Commons.Enabled.BotTrinket and ((n.Commons.BotTrinketHP <= 0 and m()) or n.Commons.BotTrinketHP > t:HealthPercentage()) then
                    a = 30
                    return "top trinket 2"
                end

            end

        end

    end

    if e.Thrash:IsCastable(BypassRecovery) and i:IsInMeleeRange(8) and (z or (t:BuffUp(e.IncarnationBuff) and d > 3)) and (select(8, GetInstanceInfo())) ~= 1698 then
        if o(e.Thrash) then
            a = 77758
            return "thrash bear 30"
        end

    end

    if e.Mangle:IsCastable() and i:IsInMeleeRange(8) and not z and (t:BuffUp(e.IncarnationBuff) and d <= 3) and (i:DebuffStack(e.ThrashDebuff) == 3 and i:DebuffRemains(e.ThrashDebuff) >= 3) and i:DebuffRemains(e.MoonfireDebuff) >= 3 then
        if o(e.Mangle, nil, nil, not i:IsInMeleeRange(5)) then
            a = 33917
            return "mangle bear 134"
        end

    end

    if e.Moonfire:IsReady() and not t:BuffUp(e.RavenousFrenzyBuff) then
        if b(i) then
            if o(e.Moonfire) then
                a = 8921
                return "Moonfire bear 4"
            end

        end

        if v.CastCycle(e.Moonfire, w, b, not i:IsSpellInRange(e.Moonfire)) then
            return "moonfire bear 4"
        end

    end

    if e.RavenousFrenzy:IsCastable() and c and i:IsInMeleeRange(8) then
        if o(e.RavenousFrenzy, nil, nil) then
            a = 323546
            return "ravenous_frenzy bear 7"
        end

    end

    if u.Jotungeirr:IsEquippedAndReady() and (f == 2) and i:IsInMeleeRange(8) then
        if o(u.Jotungeirr, nil, nil) then
            a = 16
            return "jotungeirr_destinys_call bear 8"
        end

    end

    if n.Commons.Enabled.Potions and S and i:IsInMeleeRange(8) and u.PotionofPhantomFire:IsReady() and (((f == 2 and t:BuffRemains(e.IncarnationBuff) >= 23 and t:BuffRemains(e.IncarnationBuff) <= 26) and not s.GUISettings.General.HoldPotforBL) or (s.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
        if o(u.PotionofPhantomFire, nil, nil) then
            a = 50
            return "potion bear 11"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and c and i:IsInMeleeRange(8) then
        if o(e.ConvoketheSpirits, nil, nil, not i:IsInMeleeRange(5)) then
            a = 323764
            return "convoke_the_spirits bear 12"
        end

    end

    if e.Berserk:IsCastable() and not A and i:IsInMeleeRange(8) and m() and (j or i:IsDummy() or i:NPCID() == 153285) and (t:BuffUp(e.RavenousFrenzyBuff) or f ~= 2) then
        if o(e.Berserk, nil) then
            a = 50334
            return "berserk bear 13"
        end

    end

    if e.Incarnation:IsCastable() and not A and i:IsInMeleeRange(8) and m() and (j or i:IsDummy() or i:NPCID() == 153285) then
        if o(e.Incarnation, nil) then
            a = 102558
            return "incarnation bear 14"
        end

    end

    if e.Berserking:IsCastable() and i:IsInMeleeRange(8) and (t:BuffUp(e.BerserkBuff) or t:BuffUp(e.IncarnationBuff)) then
        if o(e.Berserking, nil) then
            a = 26297
            return "berserking bear 15"
        end

    end

    if e.Barkskin:IsCastable() and (j or i:IsDummy() or i:NPCID() == 153285) and not n.Guardian.UseBarkskinDefensively and e.Brambles:IsAvailable() and (select(8, GetInstanceInfo())) ~= 1698 then
        if o(e.Barkskin, nil, nil) then
            a = 22812
            return "barkskin bear 17"
        end

    end

    if e.AdaptiveSwarmCov:IsCastable() and i:IsInMeleeRange(8) and c and ((i:DebuffDown(e.AdaptiveSwarmCovDebuff) and e.AdaptiveSwarmCov:TimeSinceLastCast() > .3 and (i:DebuffDown(e.AdaptiveSwarmCovDebuff)) or t:BuffRemains(e.AdaptiveSwarmCovHeal) > 3) or (i:DebuffStack(e.AdaptiveSwarmCovDebuff) < 3 and i:DebuffRemains(e.AdaptiveSwarmCovDebuff) < 5 and i:DebuffUp(e.AdaptiveSwarmCovDebuff))) then
        if o(e.AdaptiveSwarmCov, nil, nil, not i:IsSpellInRange(e.AdaptiveSwarmCov)) then
            a = 325727
            return "adaptive_swarm bear 18"
        end

    end

    if e.Moonfire:IsCastable() and t:BuffUp(e.GalacticGuardianBuff) and (select(8, GetInstanceInfo())) == 1698 and r("boss1"):NPCID() == 117933 and r("boss1"):IsInRange(40) then
        if o(e.Moonfire) then
            a = 118921
            return "Moonfire owl Boss 2"
        end

    end

    if e.Moonfire:IsReady() and (t:BuffUp(e.GalacticGuardianBuff) and d < 3) and not t:BuffUp(e.RavenousFrenzyBuff) then
        if o(e.Moonfire, nil, nil, not i:IsSpellInRange(e.Moonfire)) then
            a = 8921
            return "moonfire bear 19"
        end

    end

    if e.Thrash:IsCastable() and i:IsInMeleeRange(8) and ((i:DebuffRefreshable(e.ThrashDebuff)) or (i:DebuffStack(e.ThrashDebuff) < 3) or (i:DebuffStack(e.ThrashDebuff) < 4 and _) or (d <= 4)) then
        if o(e.Thrash) then
            a = 77758
            return "thrash bear 20"
        end

    end

    if e.Fleshcraft:IsCastable() and c and (e.PustuleEruption:SoulbindEnabled() and ((e.Thrash:CooldownRemains() > 0 and e.Mangle:CooldownRemains() > 0) and (i:DebuffRemains(e.MoonfireDebuff) >= 3) and (t:BuffDown(e.IncarnationBuff) and t:BuffDown(e.BerserkBuff) and t:BuffDown(e.GalacticGuardianBuff))) or e.VolatileSolvent:SoulbindEnabled()) then
        if o(e.Fleshcraft, nil, nil) then
            a = 324631
            return "fleshcraft bear 27"
        end

    end

    if e.Swipe:IsCastable() and i:IsInMeleeRange(8) and (t:BuffDown(e.IncarnationBuff) and t:BuffDown(e.BerserkBuff) and d >= 4) then
        if o(e.Swipe, nil, nil, not i:IsInMeleeRange(8)) then
            a = 213771
            return "swipe bear 28"
        end

    end

    if e.Maul:IsReady() and i:IsInMeleeRange(8) and q and not g and ((t:BuffUp(e.IncarnationBuff) and d < 3 and t:BuffStack(e.ToothandClawBuff) >= 2) or (t:BuffUp(e.ToothandClawBuff) and t:BuffRemains(e.ToothandClawBuff) < 1.5) or d < 3) then
        if o(e.Maul, nil, nil, not i:IsInMeleeRange(5)) then
            a = 6807
            return "maul bear 30"
        end

    end

    if e.Maul:IsReady() and i:IsInMeleeRange(8) and q and not g and ((d < 3 and t:BuffStack(e.ViciousCycleMaulBuff) >= 3) or (d < 3 and not e.ViciousCycle:IsAvailable())) then
        if o(e.Maul, nil, nil, not i:IsInMeleeRange(5)) then
            a = 6807
            return "maul bear 32"
        end

    end

    if e.Mangle:IsCastable() and i:IsInMeleeRange(8) and ((t:BuffUp(e.IncarnationBuff) and d <= 3) or ((t:Rage() < 90) and d < 3) or (t:Rage() < 85 and d < 3 and e.SouloftheForest:IsAvailable()) or (t:BuffUp(e.GoreBuff))) then
        if o(e.Mangle, nil, nil, not i:IsInMeleeRange(5)) then
            a = 33917
            return "mangle bear 34"
        end

    end

    if e.Thrash:IsCastable() and i:IsInMeleeRange(8) and (d > 1) then
        if o(e.Thrash, nil, nil, not i:IsInMeleeRange(8)) then
            a = 77758
            return "thrash bear 38"
        end

    end

    if e.Pulverize:IsReady() and i:IsInMeleeRange(8) then
        if v.CastCycle(e.Pulverize, w, P, not i:IsInMeleeRange(5)) then
            return "pulverize bear 42"
        end

    end

    if e.Thrash:IsCastable() and i:IsInMeleeRange(8) then
        if o(e.Thrash, nil, nil, not i:IsInMeleeRange(8)) then
            a = 77758
            return "thrash bear 44"
        end

    end

    if e.Maul:IsReady() and i:IsInMeleeRange(8) and q and not g and (d < 3) then
        if o(e.Maul, nil, nil, not i:IsInMeleeRange(5)) then
            a = 6807
            return "maul bear 46"
        end

    end

    if e.Swipe:IsCastable() and i:IsInMeleeRange(8) then
        if o(e.Swipe, nil, nil, not i:IsInMeleeRange(8)) then
            a = 213771
            return "swipe bear 48"
        end

    end

end

local function b()
    if e.CatForm:IsCastable() and t:BuffDown(e.CatForm) then
        if o(e.CatForm) then
            a = 768
            return "cat_form cat 2"
        end

    end

    if e.Rake:IsCastable() and t:BuffUp(e.Prowl) then
        if o(e.Rake) then
            a = 1822
            return "Rake cat 2"
        end

    end

    if e.HeartoftheWild:IsCastable() and e.HeartoftheWild:IsAvailable() and t:BuffDown(e.HeartoftheWild) and m() then
        if o(e.HeartoftheWild) then
            a = 319454
            return "HOTW cat 2"
        end

    end

    if e.Rake:IsCastable() and (i:DebuffRefreshable(e.RakeDebuff) or t:Energy() < 45) then
        if o(e.Rake) then
            a = 1822
            return "Rake cat 3"
        end

    end

    if e.Rip:IsCastable() and i:DebuffRefreshable(e.Rip) and t:ComboPoints() >= 1 then
        if o(e.Rip) then
            a = 1079
            return "Rip cat 2"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and c then
        if o(e.ConvoketheSpirits) then
            a = 323764
            return "Convoke cat 2"
        end

    end

    if e.FerociousBite:IsCastable() and t:ComboPoints() >= 4 and t:Energy() > 50 then
        if o(e.FerociousBite) then
            a = 22568
            return "FB cat 2"
        end

    end

    if e.AdaptiveSwarmCov:IsCastable() and c and ((i:DebuffDown(e.AdaptiveSwarmCovDebuff) and e.AdaptiveSwarmCov:TimeSinceLastCast() > .3) or (i:DebuffStack(e.AdaptiveSwarmCovDebuff) < 3 and i:DebuffRemains(e.AdaptiveSwarmCovDebuff) < 5 and i:DebuffUp(e.AdaptiveSwarmCovDebuff))) then
        if o(e.AdaptiveSwarmCov) then
            a = 325727
            return "Adaptive Swarm cat 2"
        end

    end

    if e.Fleshcraft:IsCastable() and c and not t:IsMoving() and ((e.PustuleEruption:SoulbindEnabled() and t:Energy() < 35) or e.VolatileSolvent:SoulbindEnabled()) then
        if o(e.Fleshcraft, nil, nil) then
            a = 324631
            return "fleshcraft precombat 3"
        end

    end

    if (true) then
        if o(e.Swipe) then
            a = 213771
            return "Swipe cat 2"
        end

    end

end

local function z()
    if e.MoonkinForm:IsCastable() and t:BuffDown(e.MoonkinForm) then
        if o(e.MoonkinForm) then
            a = 197625
            return "owl_form owl 2"
        end

    end

    if e.HeartoftheWild:IsCastable() and m() and e.HeartoftheWild:IsAvailable() and t:BuffDown(e.HeartoftheWild) then
        if o(e.HeartoftheWild) then
            a = 319454
            return "HOTW owl 2"
        end

    end

    if e.Starsurge:IsCastable() and not t:IsMoving() then
        if o(e.Starsurge) then
            a = 197626
            return "Starsurge owl 2"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and c and e.FirstStrike:SoulbindEnabled() then
        if o(e.ConvoketheSpirits) then
            a = 323764
            return "Convoke owl 2"
        end

    end

    if e.AdaptiveSwarmCov:IsCastable() and c and ((i:DebuffDown(e.AdaptiveSwarmCovDebuff) and e.AdaptiveSwarmCov:TimeSinceLastCast() > .3) or (i:DebuffStack(e.AdaptiveSwarmCovDebuff) < 3 and i:DebuffRemains(e.AdaptiveSwarmCovDebuff) < 5 and i:DebuffUp(e.AdaptiveSwarmCovDebuff))) then
        if o(e.AdaptiveSwarmCov) then
            a = 325727
            return "Adaptive Swarm cat 2"
        end

    end

    if e.Sunfire:IsCastable() and i:DebuffRefreshable(e.SunfireDebuff) then
        if o(e.Sunfire) then
            a = 197630
            return "Sunfire owl 2"
        end

    end

    if e.Sunfire:IsCastable() then
        if v.CastCycle(e.Sunfire, Enemies40y, V, not i:IsSpellInRange(e.Sunfire)) then
            return "Sunfire Owl 3"
        end

    end

    if e.Moonfire:IsCastable() and t:BuffUp(e.GalacticGuardianBuff) and (select(8, GetInstanceInfo())) == 1698 and r("boss1"):NPCID() == 117933 and r("boss1"):IsInRange(40) then
        if o(e.Moonfire) then
            a = 118921
            return "Moonfire owl Boss 2"
        end

    end

    if e.Moonfire:IsCastable() and (i:DebuffRefreshable(e.MoonfireDebuff) or t:BuffUp(e.GalacticGuardianBuff)) then
        if o(e.Moonfire) then
            a = 8921
            return "Moonfire owl 2"
        end

    end

    if e.Starfire:IsCastable() and EclipseAnyNext and f == 3 and not t:IsMoving() then
        if o(e.Starfire) then
            a = 197628
            return "Starfire owl 2"
        end

    end

    if e.Wrath:IsCastable() and EclipseAnyNext and f ~= 3 and not t:IsMoving() then
        if o(e.Wrath) then
            a = 5176
            return "Wrath owl 2"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and c and (t:BuffUp(e.EclipseLunar) or t:BuffUp(e.EclipseSolar)) then
        if o(e.ConvoketheSpirits) then
            a = 323764
            return "Convoke owl 2"
        end

    end

    if e.Starfire:IsCastable() and not t:IsMoving() and ((EclipseInLunar or EclipseSolarNext) or (EclipseInLunar and t:BuffUp(e.EclipseLunar) and e.Starsurge:TimeSinceLastCast() < 14)) then
        if o(e.Starfire) then
            a = 197628
            return "Starfire owl 2"
        end

    end

    if e.Wrath:IsCastable() and not t:IsMoving() then
        if o(e.Wrath) then
            a = 5176
            return "Wrath owl 2"
        end

    end

    if e.Moonfire:IsCastable() and t:IsMoving() then
        if o(e.Moonfire) then
            a = 8921
            return "Moonfire owl 2"
        end

    end

end

local function b()
    Y = HeroRotationCharDB.Toggles[6]
    c = HeroRotationCharDB.Toggles[4] and (select(8, GetInstanceInfo())) ~= 1698
    X = HeroRotationCharDB.Toggles[5]
    H = HeroRotationCharDB.Toggles[12]
    S = HeroRotationCharDB.Toggles[15]
    N = HeroRotationCharDB.Toggles[70]
    A = HeroRotationCharDB.Toggles[71]
    x = HeroRotationCharDB.Toggles[72]
    D = HeroRotationCharDB.Toggles[73]
    O = HeroRotationCharDB.Toggles[74]
    I = HeroRotationCharDB.Toggles[75]
    R = HeroRotationCharDB.Toggles[76]
    U = HeroRotationCharDB.Toggles[77]
    M = HeroRotationCharDB.Toggles[78]
    L = HeroRotationCharDB.Toggles[79]
    g = false
end

local function x()
    EclipseInAny = (t:BuffUp(e.EclipseSolar) or t:BuffUp(e.EclipseLunar))
    EclipseInBoth = (t:BuffUp(e.EclipseSolar) and t:BuffUp(e.EclipseLunar))
    EclipseInLunar = (t:BuffUp(e.EclipseLunar) and t:BuffDown(e.EclipseSolar))
    EclipseInSolar = (t:BuffUp(e.EclipseSolar) and t:BuffDown(e.EclipseLunar))
    EclipseLunarNext = (not EclipseInAny and (e.Starfire:Count() == 0 and e.Wrath:Count() > 0 or t:IsCasting(e.Wrath))) or EclipseInSolar
    EclipseSolarNext = (not EclipseInAny and (e.Wrath:Count() == 0 and e.Starfire:Count() > 0 or t:IsCasting(e.Starfire))) or EclipseInLunar
    EclipseAnyNext = (not EclipseInAny and e.Wrath:Count() > 0 and e.Starfire:Count() > 0)
end

local function c()
    if F() then
        w = t:GetEnemiesInMeleeRange(8)
        d = #w
        W = t:GetEnemiesInMeleeRange(5)
        Enemies40y = t:GetEnemiesInRange(40)
    else
        w = t:GetEnemiesInMeleeRange(8)
        if #w >= 1 then
            d = 1
        else
            d = 0
        end

        W = t:GetEnemiesInMeleeRange(5)
    end

    TopTrinketID = GetInventoryItemID("player", 13)
    BotTrinketID = GetInventoryItemID("player", 14)
            if not n.Commons.Enabled.TopTrinket and not n.Commons.Enabled.BotTrinket then
        k = { TopTrinketID, BotTrinketID }
    elseif not n.Commons.Enabled.TopTrinket then
        k = { TopTrinketID }
    elseif not n.Commons.Enabled.BotTrinket then
        k = { BotTrinketID }
    end

    J = t:ActiveMitigationNeeded()
    j = t:IsTankingAoE(8) or t:IsTanking(i)
    UnitsCastinNetherStormCount = K(w)
    UnitsCastinNetherStormCount2 = B(w)
    UnitsCastinNetherStormCount3 = G(w)
    MTNegligableMeleeCount = Z(w)
    if F() then
        if MTNegligableMeleeCount > 0 then
            d = d - MTNegligableMeleeCount
        end

    end

    q = true
    if (not n.Guardian.UseRageDefensively) then
        q = true
    end

    if not BotOn then
        l = 0
        a = 0
    end

    if l > 0 then
        l = 0
    end

    if a > 0 then
        a = 0
    end

    ShouldReturn = b()
    if s.QueuedCast() then
        a = s.QueuedCast()
        return "Custom Queue " .. h(a):ID()
    end

    x()
        if s.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (s.GUISettings.General.OpenerReset)
    elseif s.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        s.ToggleIconFrame:UpdateButtonText(6)
        s.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (D and e.UrsolsVortex:IsUsableP() and e.RestorationAffinity:IsAvailable() and e.UrsolsVortex:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.UrsolsVortex, nil, nil, nil) then
            a = 102793
            return "UrsolsVortex Queue"
        end

    elseif ((not e.UrsolsVortex:IsUsableP() or e.UrsolsVortex:CooldownRemains() > 0 or not t:AffectingCombat() or not e.RestorationAffinity:IsAvailable()) and D) then
        HeroRotationCharDB.Toggles[73] = not HeroRotationCharDB.Toggles[73]
        s.Print("Ursols Vortex Queue is now " .. (HeroRotationCharDB.Toggles[73] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (O and e.Typhoon:IsUsableP() and e.BalanceAffinity:IsAvailable() and e.Typhoon:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.Typhoon, nil, nil, nil) then
            a = 132469
            return "Typhoon Queue"
        end

    elseif ((not e.Typhoon:IsUsableP() or e.Typhoon:CooldownRemains() > 0 or not t:AffectingCombat() or not e.BalanceAffinity:IsAvailable()) and O) then
        HeroRotationCharDB.Toggles[74] = not HeroRotationCharDB.Toggles[74]
        s.Print("Typhoon Queue is now " .. (HeroRotationCharDB.Toggles[74] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (I and e.StampedingRoar:IsUsableP() and e.StampedingRoar:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.StampedingRoar, nil, nil, nil) then
            a = 106898
            return "StampedingRoar Queue"
        end

    elseif ((not e.StampedingRoar:IsUsableP() or e.StampedingRoar:CooldownRemains() > 0 or not t:AffectingCombat()) and I) then
        HeroRotationCharDB.Toggles[75] = not HeroRotationCharDB.Toggles[75]
        s.Print("Stampeding Roar Queue is now " .. (HeroRotationCharDB.Toggles[75] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (R and e.IncapacitatingRoar:IsUsableP() and e.IncapacitatingRoar:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.IncapacitatingRoar, nil, nil, nil) then
            a = 99
            return "IncapacitatingRoar Queue"
        end

    elseif ((not e.IncapacitatingRoar:IsUsableP() or e.IncapacitatingRoar:CooldownRemains() > 0 or not t:AffectingCombat()) and R) then
        HeroRotationCharDB.Toggles[76] = not HeroRotationCharDB.Toggles[76]
        s.Print("Incapacitating Roar Queue is now " .. (HeroRotationCharDB.Toggles[76] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (U and e.MightyBash:IsAvailable() and e.MightyBash:IsUsableP() and e.MightyBash:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.MightyBash, nil, nil, nil) then
            a = 5211
            return "MightyBash Queue"
        end

    elseif ((not e.MightyBash:IsUsableP() or e.MightyBash:CooldownRemains() > 0 or not t:AffectingCombat() or not e.MightyBash:IsAvailable()) and U) then
        HeroRotationCharDB.Toggles[77] = not HeroRotationCharDB.Toggles[77]
        s.Print("Mighty Bash Queue is now " .. (HeroRotationCharDB.Toggles[77] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (L and e.EntanglingRoots:IsUsableP() and e.EntanglingRoots:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat() and not t:PrevGCD(1, e.EntanglingRoots) and not t:IsCasting()) then
        if s.Cast(e.EntanglingRoots, nil, nil, nil) then
            if r("mouseover"):GUID() ~= nil and r("mouseover"):IsSpellInRange(e.EntanglingRoots) then
                l = 1339
                return "Entangling Roots Queue"
            end

        end

    elseif ((not e.EntanglingRoots:IsUsableP() or e.EntanglingRoots:CooldownRemains() > 0 or not t:AffectingCombat() or t:PrevGCD(1, e.EntanglingRoots) or (t:IsCasting(e.EntanglingRoots) and t:CastRemains() <= .5)) and L) then
        HeroRotationCharDB.Toggles[79] = not HeroRotationCharDB.Toggles[79]
        s.Print("Entangling Roots Queue Queue is now " .. (HeroRotationCharDB.Toggles[79] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if t:IsChanneling(h(323764)) then
        if o(e.Pool) then
            a = 999999
            return "channeling"
        end

        return false
    end

    if t:BuffUp(e.TravelForm) and IsFlyableArea() then
        return false
    end

    if M then
        if t:BuffUp(e.TravelForm) and e.WildCharge:IsAvailable() and e.WildCharge:CooldownRemains() <= 0 and not t:BuffUp(e.Sprint) and not IsFlyableArea() then
            if o(e.WildCharge, nil) then
                a = 102417
                return "Zoom Zoom Jump"
            end

        end

        if not t:BuffUp(e.TravelForm) and ((e.WildCharge:IsAvailable() and e.TravelForm:CooldownRemains() <= 0 and not t:BuffUp(e.Sprint) and t:BuffDown(e.SoulShape) and not IsFlyableArea() and not IsIndoors()) or (IsFlyableArea() and not IsIndoors())) then
            if o(e.TravelForm, nil) then
                a = 783
                return "Travel Form for Jump"
            end

        end

        if e.StampedingRoar:CooldownRemains() <= 0 and t:BuffDown(e.SoulShape) and IsIndoors() and t:BuffDown(e.TravelForm) then
            if o(e.StampedingRoar, nil) then
                a = 106898
                return "StampedingRoar"
            end

        end

        if e.Flicker:IsCastable() and t:BuffUp(e.SoulShape) then
            if o(e.Flicker, nil) then
                a = 324701
                return "Flicker"
            end

        end

        if e.SoulShape:IsAvailable() and e.SoulShape:IsCastable() and not t:BuffUp(e.SoulShape) and not t:BuffUp(e.StampedingRoar) and not t:BuffUp(e.Sprint) then
            if o(e.SoulShape, nil) then
                a = 310143
                return "zoom zoom soulshape"
            end

        end

        if e.Sprint:IsAvailable() and e.Sprint:IsCastable() and not t:BuffUp(e.SoulShape) and IsIndoors() and not t:BuffUp(e.StampedingRoar) then
            if o(e.Sprint, nil) then
                a = 1850
                return "Zoom zoom Sprint"
            end

        end

        if e.CatForm:IsCastable() and not t:BuffUp(e.CatForm) and not t:BuffUp(e.SoulShape) and IsIndoors() then
            if o(e.CatForm, nil) then
                a = 768
                return "Zoom zoom CatForm"
            end

        end

    end

    if v.TargetIsValid() then
        if (select(8, GetInstanceInfo())) == 1698 then
            if UnitsCastinNetherStormCount > 0 and h(99):IsReady() then
                if o(h(99), nil) then
                    a = 99
                    return "Shout Interrupt MT 1"
                end

            end

            if UnitsCastinNetherStormCount2 > 0 and h(99):IsReady() and t:BuffUp(e.BearForm) then
                if o(e.Pool, nil) then
                    a = 99999
                    return "Pool for Shout Interrupt MT 1"
                end

            end

            if UnitsCastinNetherStormCount3 > 0 and e.Barkskin:IsReady() and r("boss1"):NPCID() == 117933 and r("boss1"):TimeToDie() > 60 then
                if o(e.Barkskin, nil, nil) then
                    a = 22812
                    return "barkskin defensive MT 6"
                end

            end

            if (i:IsInRange(28) and not i:IsInRange(8) and e.WildCharge:IsReady() and t:BuffUp(e.BearForm)) and r("target"):NPCID() ~= 117933 and r("target"):NPCID() ~= 118032 then
                if o(h(102401), nil) then
                    a = 102401
                    return "Wild Charge Back"
                end

            end

            if (true) then
                local e = p()
                if e then
                    return e
                end

            end

            if ((select(8, UnitChannelInfo("target"))) == 234676 or (select(9, UnitCastingInfo("target"))) == 234676) and r("target"):IsInRange(20) then
                if t:BuffUp(e.BearForm) or t:BuffUp(e.CatForm) then
                    if o(h(106839), nil) then
                        a = 11106839
                        return "interrupt boss MT"
                    end

                else
                    if o(e.BearForm, nil) then
                        a = 5487
                        return "Bear for interrupt"
                    end

                end

            end

            if r("boss1"):NPCID() == 117933 then
                if ((select(8, UnitChannelInfo("boss1"))) == 234423 or (select(9, UnitCastingInfo("boss1"))) == 234423) and r("boss1"):IsInRange(20) then
                                                            if t:BuffUp(e.MoonkinForm) and h(132469):CooldownRemains() <= 0 and UnitsCastinNetherStormCount2 == 0 and UnitsCastinNetherStormCount == 0 then
                        if o(h(132469), nil) then
                            a = 132469
                            return "typhoon interrupt boss MT"
                        end

                    elseif t:BuffUp(e.BearForm) or t:BuffUp(e.CatForm) then
                        if o(h(106839), nil) then
                            a = 11106839
                            return "interrupt boss MT"
                        end

                    elseif (not t:BuffUp(e.BearForm) or t:BuffUp(e.CatForm)) and h(132469):CooldownRemains() >= 0 then
                        if o(e.BearForm, nil) then
                            a = 5487
                            return "Bear for interrupt"
                        end

                    end

                end

                if e.Moonfire:IsReady() then
                    if v.CastCycle(e.Moonfire, t:GetEnemiesInMeleeRange(40), T, not i:IsSpellInRange(e.Moonfire)) then
                        return "moonfire MT 4"
                    end

                end

                if d == 0 then
                    if (t:BuffUp(e.MoonkinForm)) then
                                                if ((t:HealthPercentage() < n.Guardian2.MTRegrowth - 20 and not t:IsCasting(h(8936))) or t:HealthPercentage() < n.Guardian2.MTRegrowth - 20) and h(8936):IsReady() and not t:IsMoving() then
                            if o(h(8936), nil) then
                                a = 8936
                                return "Regrowth phase 1"
                            end

                        elseif true then
                            local e = z()
                            if e then
                                return e
                            end

                        end

                    else
                        if o(e.MoonkinForm, nil) then
                            a = 197625
                            return "Moonkin phase 1"
                        end

                    end

                else
                                                            if UnitsCastinNetherStormCount > 0 and h(99):IsCastable() and t:BuffUp(e.BearForm) then
                        if o(h(99), nil) then
                            a = 99
                            return "Shout Interrupt MT 1"
                        end

                    elseif t:BuffUp(e.BearForm) then
                        local e = y()
                        if e then
                            return e
                        end

                    elseif t:BuffDown(e.BearForm) then
                        if o(e.BearForm, nil) then
                            a = 5487
                            return "Bear for melee"
                        end

                    end

                end

            end

            if r("boss1"):NPCID() == 117198 then
                if ((select(8, UnitChannelInfo("boss1"))) == 234676 or (select(9, UnitCastingInfo("boss1"))) == 234676) and r("boss1"):IsInRange(20) then
                                                            if (t:BuffUp(e.BearForm) or t:BuffUp(e.CatForm)) and h(106839):CooldownRemains() <= 0 then
                        if o(h(106839), nil) then
                            a = 11106839
                            return "interrupt boss MT"
                        end

                    elseif (t:BuffUp(e.BearForm)) and h(132469):CooldownRemains() <= 0 then
                        if o(h(132469), nil) then
                            a = 132469
                            return "interrupt boss MT"
                        end

                    elseif not t:BuffUp(e.BearForm) then
                        if o(e.BearForm, nil) then
                            a = 5487
                            return "Bear for interrupt"
                        end

                    end

                end

                if ((select(8, UnitChannelInfo("boss1"))) == 236572 or (select(9, UnitCastingInfo("boss1"))) == 236572) and r("boss1"):IsInRange(8) and h(5211):IsAvailable() and h(5211):IsReady() then
                    if o(h(5211), nil) then
                        a = t:DebuffStack(h(236572))
                        return "interrupt boss bash MT"
                    end

                end

                if (((select(8, UnitChannelInfo("boss1"))) == 236572 or (select(9, UnitCastingInfo("boss1"))) == 236572) and t:BuffUp(e.BearForm)) then
                    for i = 1, 40 do
                        local s, s, i, s, s, s, s, s, s, n, s, s, s, s, s, s = UnitDebuff("player", i)
                        if n ~= nil and n == 236572 and i ~= nil and i >= 2 and e.SurvivalInstincts:IsCastable() then
                            if o(e.SurvivalInstincts, nil, nil) then
                                a = 61336
                                return "survival_instincts defensive 8"
                            end

                        end

                        if n ~= nil and n == 236572 and i ~= nil and i >= 1 and e.Barkskin:IsCastable() then
                            if o(e.Barkskin, nil, nil) then
                                a = 22812
                                return "barkskin defensive 6"
                            end

                        end

                        if n ~= nil and n == 236572 and i ~= nil and i >= 0 and e.Ironfur:IsCastable() and (t:Rage() >= e.Ironfur:Cost() + 1 and (t:BuffDown(e.IronfurBuff) or t:BuffStack(e.IronfurBuff) < 2 and t:BuffRefreshable(e.Ironfur) or t:Rage() >= 90)) then
                            if o(e.Ironfur, nil, nil) then
                                a = 192081
                                return "ironfur defensive 4"
                            end

                        end

                    end

                end

                if e.Moonfire:IsReady() then
                    if v.CastCycle(e.Moonfire, t:GetEnemiesInMeleeRange(40), T, not i:IsSpellInRange(e.Moonfire)) then
                        return "moonfire MT 4"
                    end

                end

                if d >= 0 then
                                                            if UnitsCastinNetherStormCount > 0 and h(99):IsCastable() and t:BuffUp(e.BearForm) then
                        if o(h(99), nil) then
                            a = 99
                            return "Shout Interrupt MT 1"
                        end

                    elseif t:BuffUp(e.BearForm) then
                        local e = y()
                        if e then
                            return e
                        end

                    elseif t:BuffDown(e.BearForm) then
                        if o(e.BearForm, nil) then
                            a = 5487
                            return "Bear for melee"
                        end

                    end

                end

            end

        end

        if not t:AffectingCombat() and Y then
            local e = C()
            if e then
                return e
            end

        end

        if (not UnitIsEnemy("player", "mouseover") and UnitIsDead("mouseover")) then
                        if e.Rebirth:IsCastable() and ((t:Rage() >= 30 and t:BuffUp(e.BearForm)) or (t:BuffDown(e.BearForm) and not t:IsMoving())) then
                if o(e.Rebirth, nil) then
                    a = 20484
                    return "Rebirth MO"
                end

            elseif e.Rebirth:CooldownRemains(BypassRecovery) <= 0 and (t:Rage() < 30 and t:BuffUp(e.BearForm)) then
                g = true
            end

        end

        if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
            if e.Moonfire:IsCastable() then
                if o(e.Moonfire, nil) then
                    l = 18921
                    return "explosive MO SWD"
                end

            end

        end

        if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
            if e.Moonfire:IsCastable() then
                if o(e.Moonfire, nil) then
                    a = 8921
                    return "explosive  SWD"
                end

            end

        end

        local i = UnitThreatSituation("player", "target")
        E = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 158337 }
        if UnitExists("target") and e.Soothe:IsCastable() then
            if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
                for t = 0, 40 do
                    local t, t, t, t, t, t, t, t, t, i = UnitBuff("target", t)
                    for n, t in pairs(E) do
                        if t == i then
                            if o(e.Soothe, nil) then
                                a = 2908
                                return "Southe Enrage"
                            end

                        end

                    end

                end

            end

        end

        if UnitExists("mouseover") and e.Soothe:IsCastable() then
            if UnitCanAttack("player", "mouseover") and UnitAffectingCombat("mouseover") and UnitIsDead("mouseover") ~= true then
                for t = 0, 40 do
                    local a, a, a, a, a, a, a, a, a, t = UnitBuff("mouseover", t)
                    for i, a in pairs(E) do
                        if a == t then
                            if o(e.Soothe, nil) then
                                l = 12908
                                return "Southe Enrage mouseover"
                            end

                        end

                    end

                end

            end

        end

        for t = 0, 40 do
            local i, i, i, t, i, i, i, i, i, i = UnitDebuff("mouseover", t)
            if e.RemoveCorruption:IsCastable() and UnitIsDead("mouseover") ~= true and UnitCanAttack("player", "mouseover") ~= true and IsItemInRange(34471, "mouseover") and ((t == "Poison") or (t == "Curse")) then
                if o(e.RemoveCorruption, nil) then
                    a = 2782
                    return "Remove Corruption MO"
                end

            end

        end

        if (true) then
            local e = p()
            if e then
                return e
            end

        end

        if u.Jotungeirr:IsEquippedAndReady() and (f ~= 2) and m() then
            if o(u.Jotungeirr, nil, nil) then
                a = 16
                return "jotungeirr_destinys_call main"
            end

        end

        if (f ~= 2) and m() then
            local e = t:GetUseableTrinkets(k)
            if e then
                if o(e, nil, nil) then
                                        if e:ID() == TopTrinketID and n.Commons.Enabled.TopTrinket and ((n.Commons.TopTrinketHP <= 0 and m()) or n.Commons.TopTrinketHP > t:HealthPercentage()) then
                        a = 24
                        return "top trinket 1"
                    elseif e:ID() == BotTrinketID and n.Commons.Enabled.BotTrinket and ((n.Commons.BotTrinketHP <= 0 and m()) or n.Commons.BotTrinketHP > t:HealthPercentage()) then
                        a = 30
                        return "bot trinket 1"
                    end

                end

            end

        end

        if n.Commons.Enabled.Potions and S and u.PotionofPhantomFire:IsReady() and (((f ~= 2 and (t:BuffUp(e.BerserkBuff) or t:BuffUp(e.Incarnation)) and t:BuffRemains(e.IncarnationBuff) <= 26) and not s.GUISettings.General.HoldPotforBL) or (s.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if o(u.PotionofPhantomFire, nil, nil) then
                a = 50
                return "potion main"
            end

        end

        if (true) then
            local e = y()
            if e then
                return e
            end

        end

        if (true) then
            if s.CastAnnotated(e.Pool, false, "WAIT") then
                return "Wait/Pool Resources"
            end

        end

    end

end

local function e()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        s.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpell()
    if a == 0 then
        return 0
    else
        return a
    end

end

function ReturnSpellMO()
    if l == 0 then
        return 0
    else
        return l
    end

end

s.SetAPL(104, c, e)

