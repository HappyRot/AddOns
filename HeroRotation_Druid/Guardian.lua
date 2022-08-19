local e, e = ...
local e = HeroDBC.DBC
local q = HeroLib
local e = HeroCache
local r = q.Unit
local t = r.Player
local e = r.Pet
local i = r.Target
local h = q.Spell
local e = q.MultiSpell
local v = q.Item
local s = HeroRotation
local Y = s.AoEON
local w = s.CDsON
local o = s.Cast
local m = HeroRotationCharDB.Toggles[4] and (select(8, GetInstanceInfo())) ~= 1698
local X = HeroRotationCharDB.Toggles[5]
local W = HeroRotationCharDB.Toggles[6]
local U = HeroRotationCharDB.Toggles[15]
local C = HeroRotationCharDB.Toggles[12]
local f = HeroRotationCharDB.Toggles[70]
local L = HeroRotationCharDB.Toggles[71]
local x = HeroRotationCharDB.Toggles[72]
local S = HeroRotationCharDB.Toggles[73]
local R = HeroRotationCharDB.Toggles[74]
local T = HeroRotationCharDB.Toggles[75]
local I = HeroRotationCharDB.Toggles[76]
local N = HeroRotationCharDB.Toggles[77]
local P = HeroRotationCharDB.Toggles[78]
local D = HeroRotationCharDB.Toggles[79]
local g = false
local H = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668 }
local e = { 325552, 326836, 326092, 334926, 328395, 330725, 333299, 323831, 328494, 322968, 334496, 334493, 319603 }
local b = s.Commons.Everyone
local n = { General = s.GUISettings.General, Commons = s.GUISettings.APL.Druid.Commons, Guardian = s.GUISettings.APL.Druid.Guardian, Guardian2 = s.GUISettings.APL.Druid.Guardian2 }
local e = h.Druid.Guardian
local c = v.Druid.Guardian
local j = {  }
local p = t:GetEquipment()
local F = v(0)
local M = v(0)
if p[13] then
    F = v(p[13])
end

if p[14] then
    M = v(p[14])
end

local Z
local z
local k
local l = 0
local a = 0
local d = 0
local V
local y, d
local _ = t:HasLegendaryEquipped(58)
local E = t:HasLegendaryEquipped(49)
local A = t:HasLegendaryEquipped(48)
local O = t:HasLegendaryEquipped(60)
local u = t:CovenantID()
q:RegisterForEvent(function()
    u = t:CovenantID()
end, "COVENANT_CHOSEN")
q:RegisterForEvent(function()
    p = t:GetEquipment()
    F = v(0)
    M = v(0)
    if p[13] then
        F = v(p[13])
    end

    if p[14] then
        M = v(p[14])
    end

    _ = t:HasLegendaryEquipped(58)
    E = t:HasLegendaryEquipped(49)
    A = t:HasLegendaryEquipped(48)
    O = t:HasLegendaryEquipped(60)
end, "PLAYER_EQUIPMENT_CHANGED")
q:RegisterForEvent(function()
    e.AdaptiveSwarm:RegisterInFlight()
end, "LEARNED_SPELL_IN_TAB")
e.AdaptiveSwarm:RegisterInFlight()
local function p(e)
    if e then
        return 1
    else
        return 0
    end

end

local function p(e)
    return e ~= 0
end

local function J(t)
    local e = 0
    for a in pairs(t) do
        local t = t[a]
        if t:IsChanneling(h(240784)) then
            e = e + 1
        end

    end

    return e
end

local function Q(a)
    local e = 0
    for o in pairs(a) do
        local a = a[o]
        if (a:CastRemains() <= t:GCD() + .25 and a:IsCasting(h(240784))) then
            e = e + 1
        end

    end

    return e
end

local function B(t)
    local e = 0
    for a in pairs(t) do
        local t = t[a]
        if (t:NPCID() == 118044) then
            e = e + 1
        end

    end

    return e
end

local function te(t)
    local e = 0
    for a in pairs(t) do
        local t = t[a]
        if (t:NPCID() == 118065 or t:NPCID() == 118032) then
            e = e + 1
        end

    end

    return e
end

local function q(t)
                if ((t:DebuffRefreshable(e.MoonfireDebuff) and t:TimeToDie() > 12) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == r("mouseover"):GUID() and (n.Guardian.TargetSwap == "Mouseover") and t:NPCID() ~= 118044) then
        l = 18921
        return true
    elseif ((t:DebuffRefreshable(e.MoonfireDebuff) and t:TimeToDie() > 12) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and n.Guardian.TargetSwap == "AutoSwap" and t:GUID() ~= i:GUID() and not C and t:NPCID() ~= 118044) then
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

local function oe(e)
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

local function v(t)
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

local function ee(t)
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

local function p(a)
    return (a:DebuffRefreshable(e.ThrashDebuff) or a:DebuffStack(e.ThrashDebuff) < 3 or (a:DebuffStack(e.ThrashDebuff) < 4 and _) or d >= 4 or t:BuffUp(e.BerserkBuff) and t:BuffRemains(e.BerserkBuff) <= t:GCD() + .5)
end

local function ae(t)
                if ((t:DebuffStack(e.ThrashDebuff) > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and t:GUID() == r("mouseover"):GUID() and n.Guardian.TargetSwap == "Mouseover") then
        l = 180313
        return true
    elseif ((t:DebuffStack(e.ThrashDebuff) > 2) and (t:AffectingCombat() or t:IsDummy() or t:NPCID() == 153285) and n.Guardian.TargetSwap == "AutoSwap" and t:GUID() ~= i:GUID() and not C) then
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

local function M()
    if t:HealthPercentage() < n.Guardian2.FrenziedRegenHP and e.FrenziedRegeneration:IsReady() and t:BuffDown(e.FrenziedRegenerationBuff) and t:BuffUp(e.BearForm) then
        if o(e.FrenziedRegeneration, nil, nil) then
            a = 22842
            return "frenzied_regeneration defensive 2"
        end

    end

    if e.Ironfur:IsCastable() and not g and t:BuffUp(e.BearForm) and e.ConvoketheSpirits:TimeSinceLastDisplay() > 1 and (t:Rage() >= e.Ironfur:Cost() + 1 and (z or i:IsDummy() or i:NPCID() == 153285) and (t:BuffDown(e.IronfurBuff) or t:BuffStack(e.IronfurBuff) < 2 and t:BuffRefreshable(e.Ironfur) or t:Rage() >= 90)) then
        if o(e.Ironfur, nil, nil) then
            a = 192081
            return "ironfur defensive 4"
        end

    end

    local i = t:GetUseableTrinkets(j)
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

    if t:HealthPercentage() < n.Guardian2.PhialHP and c.PhialofSerenity:IsReady() and c.PhialofSerenity:CooldownRemains() <= 0 then
        if s.Cast(c.PhialofSerenity, nil) then
            a = 55
            return "PhialofSerenity HP"
        end

    end

    if t:HealthPercentage() < n.Guardian2.HealthstoneHP and c.Healthstone:IsReady() and c.Healthstone:CooldownRemains() <= 0 then
        if s.Cast(c.Healthstone, nil) then
            a = 40
            return "Healthstone HP"
        end

    end

    if t:HealthPercentage() < n.Guardian2.HealPotHP and c.CosmicHealPot:IsReady() and c.CosmicHealPot:CooldownRemains() <= 0 then
        if s.Cast(c.CosmicHealPot, nil) then
            a = 45
            return "CosmicHealPot HP"
        end

    end

    if t:HealthPercentage() < n.Guardian2.HealPotHP and c.HealPot:IsReady() and c.HealPot:CooldownRemains() <= 0 then
        if s.Cast(c.HealPot, nil) then
            a = 41
            return "HealPot HP"
        end

    end

end

local function ie()
    if e.CatForm:IsCastable() and f and e.FeralAffinity:IsAvailable() and not t:BuffUp(e.CatForm) and not (select(8, GetInstanceInfo())) == 1698 then
        if o(e.CatForm) then
            a = 768
            return "cat_form precombat 2"
        end

    end

    if e.MoonkinForm:IsCastable() and (f or (select(8, GetInstanceInfo())) == 1698) and e.BalanceAffinity:IsAvailable() and not t:BuffUp(e.MoonkinForm) then
        if o(e.MoonkinForm) then
            a = 197625
            return "moonkin_form precombat 2"
        end

    end

    if e.HeartoftheWild:IsCastable() and w() and i:IsInMeleeRange(8) and f and (e.BalanceAffinity:IsAvailable() or e.FeralAffinity:IsAvailable()) and not (select(8, GetInstanceInfo())) == 1698 then
        if o(e.HeartoftheWild, nil) then
            a = 319454
            return "heart_of_the_wild bear Precombat "
        end

    end

    if e.Prowl:IsCastable() and f and e.FeralAffinity:IsAvailable() and t:BuffDown(e.Prowl) and not (select(8, GetInstanceInfo())) == 1698 then
        if o(e.Prowl, nil) then
            a = 5215
            return "Prowl Precombat"
        end

    end

    if e.BearForm:IsCastable() and (t:BuffDown(e.BearForm)) and (not f or (not e.FeralAffinity:IsAvailable() and not e.BalanceAffinity:IsAvailable())) and not (select(8, GetInstanceInfo())) == 1698 then
        if o(e.BearForm) then
            a = 5487
            return "bear_form precombat 2"
        end

    end

    if e.Wrath:IsCastable() and (f or (select(8, GetInstanceInfo())) == 1698) and t:BuffUp(e.MoonkinForm) and (u ~= 3 or (select(8, GetInstanceInfo())) == 1698) then
        if o(e.Wrath) then
            a = 5176
            return "cat_form precombat 2"
        end

    end

    if e.Starfire:IsCastable() and (f or (select(8, GetInstanceInfo())) == 1698) and t:BuffUp(e.MoonkinForm) and u == 3 then
        if o(e.Starfire) then
            a = 197628
            return "cat_form precombat 2"
        end

    end

    if e.Fleshcraft:IsCastable() and m and not t:IsMoving() and (e.PustuleEruption:SoulbindEnabled() or e.VolatileSolvent:SoulbindEnabled()) then
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

    if e.Moonfire:IsCastable() and i:NPCID() ~= 118044 and not (select(8, GetInstanceInfo())) == 1698 then
        if o(e.Moonfire, nil, nil, not i:IsSpellInRange(e.Moonfire)) then
            a = 8921
            return "moonfire precombat 10"
        end

    end

end

local function ne()
    if e.MoonkinForm:IsCastable() and t:BuffDown(e.MoonkinForm) then
        if o(e.MoonkinForm) then
            a = 197625
            return "MoonkinForm lycara 2"
        end

    end

end

local function G()
    if e.CatForm:IsCastable() and t:BuffDown(e.CatForm) then
        if o(e.CatForm) then
            a = 768
            return "catform lycara 2"
        end

    end

end

local function K()
    if e.MoonkinForm:IsCastable() and t:BuffDown(e.MoonkinForm) then
        if o(e.MoonkinForm) then
            a = 197625
            return "owl_form owl 2"
        end

    end

    if e.HeartoftheWild:IsCastable() and w() and e.HeartoftheWild:IsAvailable() and t:BuffDown(e.HeartoftheWild) then
        if o(e.HeartoftheWild) then
            a = 319454
            return "HOTW owl 2"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and t:BuffUp(e.MoonkinForm) and m and (e.FirstStrike:SoulbindEnabled() and t:BuffUp(e.FirstStrike)) then
        if o(e.ConvoketheSpirits) then
            a = 323764
            return "Convoke owl 2"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and m and t:BuffUp(e.MoonkinForm) and ((e.HeartoftheWild:IsAvailable() and (t:BuffUp(e.HeartoftheWild) or e.HeartoftheWild:CooldownRemains() > 15)) or (not e.HeartoftheWild:IsAvailable()) or (not w())) then
        if o(e.ConvoketheSpirits) then
            a = 323764
            return "Convoke owlvoke 2"
        end

    end

end

local function F()
    if e.CatForm:IsCastable() and t:BuffDown(e.CatForm) then
        if o(e.CatForm) then
            a = 768
            return "catform catvoke 2"
        end

    end

    if e.HeartoftheWild:IsCastable() and w() and e.HeartoftheWild:IsAvailable() and t:BuffDown(e.HeartoftheWild) then
        if o(e.HeartoftheWild) then
            a = 319454
            return "HOTW catvoke 2"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and m and t:BuffUp(e.CatForm) and ((e.FirstStrike:SoulbindEnabled() and t:BuffUp(e.FirstStrikeBuff)) or (e.HeartoftheWild:IsAvailable() and (t:BuffUp(e.HeartoftheWild) or e.HeartoftheWild:CooldownRemains() > 15)) or (not e.HeartoftheWild:IsAvailable()) or (not w())) then
        if o(e.ConvoketheSpirits) then
            a = 323764
            return "Convoke catvoke 2"
        end

    end

end

local function p()
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
        if b.CastCycle(e.Growl, Enemies40y, oe, not i:IsSpellInRange(e.Growl)) then
            return "Growl bear 4"
        end

    end

    if e.HeartoftheWild:IsCastable() and w() and i:IsInMeleeRange(8) and f and (e.BalanceAffinity:IsAvailable() and u == 2) then
        if o(e.HeartoftheWild, nil) then
            a = 319454
            return "heart_of_the_wild bear 3"
        end

    end

    if e.Ironfur:IsCastable() and e.ConvoketheSpirits:TimeSinceLastDisplay() > 1 and t:Rage() >= e.Ironfur:Cost() + 1 and not k and (t:BuffUp(e.IncarnationBuff) or t:BuffUp(e.BerserkBuff)) then
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

    if (u == 2) and i:IsInMeleeRange(8) then
        local e = t:GetUseableTrinkets(j)
        if e then
            if o(e, nil, nil) then
                                if e:ID() == TopTrinketID and n.Commons.Enabled.TopTrinket and ((n.Commons.TopTrinketHP <= 0 and w()) or n.Commons.TopTrinketHP > t:HealthPercentage()) then
                    a = 24
                    return "top trinket 1"
                elseif e:ID() == BotTrinketID and n.Commons.Enabled.BotTrinket and ((n.Commons.BotTrinketHP <= 0 and w()) or n.Commons.BotTrinketHP > t:HealthPercentage()) then
                    a = 30
                    return "top trinket 2"
                end

            end

        end

    end

    if e.Thrash:IsCastable(BypassRecovery) and i:IsInMeleeRange(8) and (O or (t:BuffUp(e.IncarnationBuff) and d > 3)) and (select(8, GetInstanceInfo())) ~= 1698 then
        if o(e.Thrash) then
            a = 77758
            return "thrash bear 30"
        end

    end

    if e.Mangle:IsCastable() and i:IsInMeleeRange(8) and not O and (t:BuffUp(e.IncarnationBuff) and d <= 3) and (i:DebuffStack(e.ThrashDebuff) == 3 and i:DebuffRemains(e.ThrashDebuff) >= 3) and i:DebuffRemains(e.MoonfireDebuff) >= 3 then
        if o(e.Mangle, nil, nil, not i:IsInMeleeRange(5)) then
            a = 33917
            return "mangle bear 134"
        end

    end

    if e.Moonfire:IsReady() and not t:BuffUp(e.RavenousFrenzyBuff) then
        if q(i) then
            if o(e.Moonfire) then
                a = 8921
                return "Moonfire bear 4"
            end

        end

        if b.CastCycle(e.Moonfire, y, q, not i:IsSpellInRange(e.Moonfire)) then
            return "moonfire bear 4"
        end

    end

    if e.RavenousFrenzy:IsCastable() and m and i:IsInMeleeRange(8) then
        if o(e.RavenousFrenzy, nil, nil) then
            a = 323546
            return "ravenous_frenzy bear 7"
        end

    end

    if c.Jotungeirr:IsEquippedAndReady() and (u == 2) and i:IsInMeleeRange(8) then
        if o(c.Jotungeirr, nil, nil) then
            a = 16
            return "jotungeirr_destinys_call bear 8"
        end

    end

    if n.Commons.Enabled.Potions and U and i:IsInMeleeRange(8) and c.PotionofPhantomFire:IsReady() and (((u == 2 and t:BuffRemains(e.IncarnationBuff) >= 23 and t:BuffRemains(e.IncarnationBuff) <= 26) and not s.GUISettings.General.HoldPotforBL) or (s.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
        if o(c.PotionofPhantomFire, nil, nil) then
            a = 50
            return "potion bear 11"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and m and i:IsInMeleeRange(8) then
        if o(e.ConvoketheSpirits, nil, nil, not i:IsInMeleeRange(5)) then
            a = 323764
            return "convoke_the_spirits bear 12"
        end

    end

    if e.Berserk:IsCastable() and not L and i:IsInMeleeRange(8) and w() and (z or i:IsDummy() or i:NPCID() == 153285) and (t:BuffUp(e.RavenousFrenzyBuff) or u ~= 2) then
        if o(e.Berserk, nil) then
            a = 50334
            return "berserk bear 13"
        end

    end

    if e.Incarnation:IsCastable() and not L and i:IsInMeleeRange(8) and w() and (z or i:IsDummy() or i:NPCID() == 153285) and (t:BuffUp(e.RavenousFrenzyBuff) or u ~= 2) then
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

    if e.Barkskin:IsCastable() and (z or i:IsDummy() or i:NPCID() == 153285) and not n.Guardian.UseBarkskinDefensively and e.Brambles:IsAvailable() and (select(8, GetInstanceInfo())) ~= 1698 then
        if o(e.Barkskin, nil, nil) then
            a = 22812
            return "barkskin bear 17"
        end

    end

    if e.AdaptiveSwarm:IsCastable() and i:IsInMeleeRange(8) and m and ((i:DebuffDown(e.AdaptiveSwarmDebuff) and e.AdaptiveSwarm:TimeSinceLastCast() > .3 and (i:DebuffDown(e.AdaptiveSwarmDebuff)) or t:BuffRemains(e.AdaptiveSwarmHeal) > 3) or (i:DebuffStack(e.AdaptiveSwarmDebuff) < 3 and i:DebuffRemains(e.AdaptiveSwarmDebuff) < 5 and i:DebuffUp(e.AdaptiveSwarmDebuff))) then
        if o(e.AdaptiveSwarm, nil, nil, not i:IsSpellInRange(e.AdaptiveSwarm)) then
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

    if e.Fleshcraft:IsCastable() and m and (e.PustuleEruption:SoulbindEnabled() and ((e.Thrash:CooldownRemains() > 0 and e.Mangle:CooldownRemains() > 0) and (i:DebuffRemains(e.MoonfireDebuff) >= 3) and (t:BuffDown(e.IncarnationBuff) and t:BuffDown(e.BerserkBuff) and t:BuffDown(e.GalacticGuardianBuff))) or e.VolatileSolvent:SoulbindEnabled()) then
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

    if e.Maul:IsReady() and i:IsInMeleeRange(8) and k and not g and (t:BuffUp(e.IncarnationBuff) and d < 3 and t:BuffStack(e.ToothandClawBuff) >= 2 or t:BuffUp(e.ToothandClawBuff) and t:BuffRemains(e.ToothandClawBuff) < 1.5 or t:BuffStack(e.SavageCombatantBuff) >= 3 or t:BuffUp(e.BerserkBuff) and d < 3) then
        if o(e.Maul, nil, nil, not i:IsInMeleeRange(5)) then
            a = 6807
            return "maul bear 30"
        end

    end

    if e.Maul:IsReady() and i:IsInMeleeRange(8) and k and not g and (t:BuffStack(e.SavageCombatantBuff) >= 1 and t:BuffUp(e.ToothandClawBuff) and t:BuffUp(e.IncarnationBuff) and d == 2) then
        if o(e.Maul, nil, nil, not i:IsInMeleeRange(5)) then
            a = 6807
            return "maul bear 32"
        end

    end

    if e.Mangle:IsCastable() and i:IsInMeleeRange(8) and (t:BuffUp(e.IncarnationBuff) and d <= 3) then
        if o(e.Mangle, nil, nil, not i:IsInMeleeRange(5)) then
            a = 33917
            return "mangle bear 34"
        end

    end

    if e.Maul:IsReady() and i:IsInMeleeRange(8) and k and not g and ((t:BuffStack(e.ToothandClawBuff) >= 2 or (t:BuffUp(e.ToothandClawBuff) and t:BuffRemains(e.ToothandClawBuff) < 1.5) or t:BuffStack(e.SavageCombatantBuff) >= 3) and d < 3) then
        if o(e.Maul, nil, nil, not i:IsInMeleeRange(5)) then
            a = 6807
            return "maul bear 36"
        end

    end

    if e.Thrash:IsCastable() and i:IsInMeleeRange(8) and (d > 1) then
        if o(e.Thrash, nil, nil, not i:IsInMeleeRange(8)) then
            a = 77758
            return "thrash bear 38"
        end

    end

    if e.Mangle:IsCastable() and i:IsInMeleeRange(8) and ((t:Rage() < 90 and d < 3) or (t:Rage() < 85 and d < 3 and e.SouloftheForest:IsAvailable())) then
        if o(e.Mangle, nil, nil, not i:IsInMeleeRange(5)) then
            a = 33917
            return "mangle bear 40"
        end

    end

    if e.Pulverize:IsReady() and i:IsInMeleeRange(8) then
        if b.CastCycle(e.Pulverize, y, ae, not i:IsInMeleeRange(5)) then
            return "pulverize bear 42"
        end

    end

    if e.Thrash:IsCastable() and i:IsInMeleeRange(8) then
        if o(e.Thrash, nil, nil, not i:IsInMeleeRange(8)) then
            a = 77758
            return "thrash bear 44"
        end

    end

    if e.Maul:IsReady() and i:IsInMeleeRange(8) and k and not g and (d < 3) then
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

local function q()
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

    if e.HeartoftheWild:IsCastable() and e.HeartoftheWild:IsAvailable() and t:BuffDown(e.HeartoftheWild) and w() then
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

    if e.ConvoketheSpirits:IsCastable() and m then
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

    if e.AdaptiveSwarm:IsCastable() and m and ((i:DebuffDown(e.AdaptiveSwarmDebuff) and e.AdaptiveSwarm:TimeSinceLastCast() > .3) or (i:DebuffStack(e.AdaptiveSwarmDebuff) < 3 and i:DebuffRemains(e.AdaptiveSwarmDebuff) < 5 and i:DebuffUp(e.AdaptiveSwarmDebuff))) then
        if o(e.AdaptiveSwarm) then
            a = 325727
            return "Adaptive Swarm cat 2"
        end

    end

    if e.Fleshcraft:IsCastable() and m and not t:IsMoving() and ((e.PustuleEruption:SoulbindEnabled() and t:Energy() < 35) or e.VolatileSolvent:SoulbindEnabled()) then
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

local function _()
    if e.MoonkinForm:IsCastable() and t:BuffDown(e.MoonkinForm) then
        if o(e.MoonkinForm) then
            a = 197625
            return "owl_form owl 2"
        end

    end

    if e.HeartoftheWild:IsCastable() and w() and e.HeartoftheWild:IsAvailable() and t:BuffDown(e.HeartoftheWild) then
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

    if e.ConvoketheSpirits:IsCastable() and m and e.FirstStrike:SoulbindEnabled() then
        if o(e.ConvoketheSpirits) then
            a = 323764
            return "Convoke owl 2"
        end

    end

    if e.AdaptiveSwarm:IsCastable() and m and ((i:DebuffDown(e.AdaptiveSwarmDebuff) and e.AdaptiveSwarm:TimeSinceLastCast() > .3) or (i:DebuffStack(e.AdaptiveSwarmDebuff) < 3 and i:DebuffRemains(e.AdaptiveSwarmDebuff) < 5 and i:DebuffUp(e.AdaptiveSwarmDebuff))) then
        if o(e.AdaptiveSwarm) then
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
        if b.CastCycle(e.Sunfire, Enemies40y, ee, not i:IsSpellInRange(e.Sunfire)) then
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

    if e.Starfire:IsCastable() and EclipseAnyNext and u == 3 and not t:IsMoving() then
        if o(e.Starfire) then
            a = 197628
            return "Starfire owl 2"
        end

    end

    if e.Wrath:IsCastable() and EclipseAnyNext and u ~= 3 and not t:IsMoving() then
        if o(e.Wrath) then
            a = 5176
            return "Wrath owl 2"
        end

    end

    if e.ConvoketheSpirits:IsCastable() and m and (t:BuffUp(e.EclipseLunar) or t:BuffUp(e.EclipseSolar)) then
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

local function O()
    W = HeroRotationCharDB.Toggles[6]
    m = HeroRotationCharDB.Toggles[4] and (select(8, GetInstanceInfo())) ~= 1698
    X = HeroRotationCharDB.Toggles[5]
    C = HeroRotationCharDB.Toggles[12]
    U = HeroRotationCharDB.Toggles[15]
    f = HeroRotationCharDB.Toggles[70]
    L = HeroRotationCharDB.Toggles[71]
    x = HeroRotationCharDB.Toggles[72]
    S = HeroRotationCharDB.Toggles[73]
    R = HeroRotationCharDB.Toggles[74]
    T = HeroRotationCharDB.Toggles[75]
    I = HeroRotationCharDB.Toggles[76]
    N = HeroRotationCharDB.Toggles[77]
    P = HeroRotationCharDB.Toggles[78]
    D = HeroRotationCharDB.Toggles[79]
    g = false
end

local function L()
    EclipseInAny = (t:BuffUp(e.EclipseSolar) or t:BuffUp(e.EclipseLunar))
    EclipseInBoth = (t:BuffUp(e.EclipseSolar) and t:BuffUp(e.EclipseLunar))
    EclipseInLunar = (t:BuffUp(e.EclipseLunar) and t:BuffDown(e.EclipseSolar))
    EclipseInSolar = (t:BuffUp(e.EclipseSolar) and t:BuffDown(e.EclipseLunar))
    EclipseLunarNext = (not EclipseInAny and (e.Starfire:Count() == 0 and e.Wrath:Count() > 0 or t:IsCasting(e.Wrath))) or EclipseInSolar
    EclipseSolarNext = (not EclipseInAny and (e.Wrath:Count() == 0 and e.Starfire:Count() > 0 or t:IsCasting(e.Starfire))) or EclipseInLunar
    EclipseAnyNext = (not EclipseInAny and e.Wrath:Count() > 0 and e.Starfire:Count() > 0)
end

local function x()
    if Y() then
        y = t:GetEnemiesInMeleeRange(8)
        d = #y
        V = t:GetEnemiesInMeleeRange(5)
        Enemies40y = t:GetEnemiesInRange(40)
    else
        y = t:GetEnemiesInMeleeRange(8)
        if #y >= 1 then
            d = 1
        else
            d = 0
        end

        V = t:GetEnemiesInMeleeRange(5)
    end

    TopTrinketID = GetInventoryItemID("player", 13)
    BotTrinketID = GetInventoryItemID("player", 14)
            if not n.Commons.Enabled.TopTrinket and not n.Commons.Enabled.BotTrinket then
        j = { TopTrinketID, BotTrinketID }
    elseif not n.Commons.Enabled.TopTrinket then
        j = { TopTrinketID }
    elseif not n.Commons.Enabled.BotTrinket then
        j = { BotTrinketID }
    end

    Z = t:ActiveMitigationNeeded()
    z = t:IsTankingAoE(8) or t:IsTanking(i)
    UnitsCastinNetherStormCount = J(y)
    UnitsCastinNetherStormCount2 = Q(y)
    UnitsCastinNetherStormCount3 = B(y)
    MTNegligableMeleeCount = te(y)
    if Y() then
        if MTNegligableMeleeCount > 0 then
            d = d - MTNegligableMeleeCount
        end

    end

    k = false
    if (not n.Guardian.UseRageDefensively) then
        k = true
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

    ShouldReturn = O()
    if s.QueuedCast() then
        a = s.QueuedCast()
        return "Custom Queue " .. h(a):ID()
    end

    L()
        if s.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (s.GUISettings.General.OpenerReset)
    elseif s.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        s.ToggleIconFrame:UpdateButtonText(6)
        s.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

        if (S and e.UrsolsVortex:IsUsableP() and e.RestorationAffinity:IsAvailable() and e.UrsolsVortex:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.UrsolsVortex, nil, nil, nil) then
            a = 102793
            return "UrsolsVortex Queue"
        end

    elseif ((not e.UrsolsVortex:IsUsableP() or e.UrsolsVortex:CooldownRemains() > 0 or not t:AffectingCombat() or not e.RestorationAffinity:IsAvailable()) and S) then
        HeroRotationCharDB.Toggles[73] = not HeroRotationCharDB.Toggles[73]
        s.Print("Ursols Vortex Queue is now " .. (HeroRotationCharDB.Toggles[73] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (R and e.Typhoon:IsUsableP() and e.BalanceAffinity:IsAvailable() and e.Typhoon:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.Typhoon, nil, nil, nil) then
            a = 132469
            return "Typhoon Queue"
        end

    elseif ((not e.Typhoon:IsUsableP() or e.Typhoon:CooldownRemains() > 0 or not t:AffectingCombat() or not e.BalanceAffinity:IsAvailable()) and R) then
        HeroRotationCharDB.Toggles[74] = not HeroRotationCharDB.Toggles[74]
        s.Print("Typhoon Queue is now " .. (HeroRotationCharDB.Toggles[74] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (T and e.StampedingRoar:IsUsableP() and e.StampedingRoar:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.StampedingRoar, nil, nil, nil) then
            a = 106898
            return "StampedingRoar Queue"
        end

    elseif ((not e.StampedingRoar:IsUsableP() or e.StampedingRoar:CooldownRemains() > 0 or not t:AffectingCombat()) and T) then
        HeroRotationCharDB.Toggles[75] = not HeroRotationCharDB.Toggles[75]
        s.Print("Stampeding Roar Queue is now " .. (HeroRotationCharDB.Toggles[75] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (I and e.IncapacitatingRoar:IsUsableP() and e.IncapacitatingRoar:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.IncapacitatingRoar, nil, nil, nil) then
            a = 99
            return "IncapacitatingRoar Queue"
        end

    elseif ((not e.IncapacitatingRoar:IsUsableP() or e.IncapacitatingRoar:CooldownRemains() > 0 or not t:AffectingCombat()) and I) then
        HeroRotationCharDB.Toggles[76] = not HeroRotationCharDB.Toggles[76]
        s.Print("Incapacitating Roar Queue is now " .. (HeroRotationCharDB.Toggles[76] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (N and e.MightyBash:IsAvailable() and e.MightyBash:IsUsableP() and e.MightyBash:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat()) then
        if s.Cast(e.MightyBash, nil, nil, nil) then
            a = 5211
            return "MightyBash Queue"
        end

    elseif ((not e.MightyBash:IsUsableP() or e.MightyBash:CooldownRemains() > 0 or not t:AffectingCombat() or not e.MightyBash:IsAvailable()) and N) then
        HeroRotationCharDB.Toggles[77] = not HeroRotationCharDB.Toggles[77]
        s.Print("Mighty Bash Queue is now " .. (HeroRotationCharDB.Toggles[77] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (D and e.EntanglingRoots:IsUsableP() and e.EntanglingRoots:CooldownRemains(BypassRecovery) <= 0 and t:AffectingCombat() and not t:PrevGCD(1, e.EntanglingRoots) and not t:IsCasting()) then
        if s.Cast(e.EntanglingRoots, nil, nil, nil) then
            if r("mouseover"):GUID() ~= nil and r("mouseover"):IsSpellInRange(e.EntanglingRoots) then
                l = 1339
                return "Entangling Roots Queue"
            end

        end

    elseif ((not e.EntanglingRoots:IsUsableP() or e.EntanglingRoots:CooldownRemains() > 0 or not t:AffectingCombat() or t:PrevGCD(1, e.EntanglingRoots) or (t:IsCasting(e.EntanglingRoots) and t:CastRemains() <= .5)) and D) then
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

    if P then
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

    if b.TargetIsValid() then
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
                local e = M()
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
                    if b.CastCycle(e.Moonfire, t:GetEnemiesInMeleeRange(40), v, not i:IsSpellInRange(e.Moonfire)) then
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
                            local e = _()
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
                        local e = p()
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
                    if b.CastCycle(e.Moonfire, t:GetEnemiesInMeleeRange(40), v, not i:IsSpellInRange(e.Moonfire)) then
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
                        local e = p()
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

        if not t:AffectingCombat() and W then
            local e = ie()
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

        local h = UnitThreatSituation("player", "target")
        H = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668 }
        if UnitExists("target") and e.Soothe:IsCastable() then
            if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
                for t = 0, 40 do
                    local i, i, i, i, i, i, i, i, i, t = UnitBuff("target", t)
                    for n, i in pairs(H) do
                        if i == t then
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
                    for i, a in pairs(H) do
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
            local e = M()
            if e then
                return e
            end

        end

        if c.Jotungeirr:IsEquippedAndReady() and (u ~= 2) and w() then
            if o(c.Jotungeirr, nil, nil) then
                a = 16
                return "jotungeirr_destinys_call main"
            end

        end

        if (u ~= 2) and w() then
            local e = t:GetUseableTrinkets(j)
            if e then
                if o(e, nil, nil) then
                                        if e:ID() == TopTrinketID and n.Commons.Enabled.TopTrinket and ((n.Commons.TopTrinketHP <= 0 and w()) or n.Commons.TopTrinketHP > t:HealthPercentage()) then
                        a = 24
                        return "top trinket 1"
                    elseif e:ID() == BotTrinketID and n.Commons.Enabled.BotTrinket and ((n.Commons.BotTrinketHP <= 0 and w()) or n.Commons.BotTrinketHP > t:HealthPercentage()) then
                        a = 30
                        return "bot trinket 1"
                    end

                end

            end

        end

        if n.Commons.Enabled.Potions and U and c.PotionofPhantomFire:IsReady() and (((u ~= 2 and (t:BuffUp(e.BerserkBuff) or t:BuffUp(e.Incarnation)) and t:BuffRemains(e.IncarnationBuff) <= 26) and not s.GUISettings.General.HoldPotforBL) or (s.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
            if o(c.PotionofPhantomFire, nil, nil) then
                a = 50
                return "potion main"
            end

        end

        if (f and e.FeralAffinity:IsAvailable() and u ~= 2 and t:BuffDown(e.IncarnationBuff) and ((e.Thrash:CooldownRemains() > 0 and e.Mangle:CooldownRemains() > 0 and i:DebuffRemains(e.MoonfireDebuff) >= (t:GCD() + .5) and t:Rage() < 40 and t:BuffDown(e.IncarnationBuff) and t:BuffDown(e.BerserkBuff) and t:BuffDown(e.GalacticGuardianBuff)) or (t:BuffUp(e.CatForm) and t:Energy() > 25) or (i:DebuffRefreshable(e.RakeDebuff) and i:DebuffRefreshable(e.Rip)) or (E and t:BuffDown(e.OathofElderDruidBuff) and (t:BuffUp(e.CatForm) and t:Energy() > 20) and t:BuffRemins(e.HeartoftheWild) <= 10) or (u == 1 and e.EmpowerBond:CooldownRemains() <= 1 and d < 2) or (t:BuffUp(e.HeartoftheWild) and t:Energy() > 90))) then
            local e = q()
            if e then
                return e
            end

        end

        if (f and e.FeralAffinity:IsAvailable() and u == 2 and ((e.Thrash:CooldownRemains() > 0 and e.Mangle:CooldownRemains() > 0 and i:DebuffRemains(e.MoonfireDebuff) >= (t:GCD() + .5) and t:Rage() < 40 and t:BuffDown(e.IncarnationBuff) and t:BuffDown(e.BerserkBuff) and t:BuffDown(e.GalacticGuardianBuff)) or (t:BuffUp(e.CatForm) and t:Energy() > 25) or (i:DebuffRefreshable(e.RakeDebuff) and i:DebuffRefreshable(e.Rip) and t:Rage() < 40 and t:BuffDown(e.IncarnationBuff) and t:BuffDown(e.BerserkBuff) and t:BuffDown(e.GalacticGuardianBuff)))) then
            local e = q()
            if e then
                return e
            end

        end

        if (f and e.BalanceAffinity:IsAvailable() and ((e.Thrash:CooldownRemains() > 0 and e.Mangle:CooldownRemains() > 0 and t:Rage() < 15 and t:BuffDown(e.IncarnationBuff) and t:BuffDown(e.BerserkBuff) and t:BuffDown(e.GalacticGuardianBuff)) or (t:BuffUp(e.MoonkinForm) and i:DebuffRefreshable(e.SunfireDebuff)) or (t:BuffUp(e.MoonkinForm) and t:BuffUp(e.HeartoftheWild)) or (E and t:BuffDown(e.OathofElderDruidBuff)) or (u == 3 and e.ConvoketheSpirits:CooldownRemains() <= 1) or (u == 1 and e.EmpowerBond:CooldownRemains() <= 1 and d < 2))) then
            local e = _()
            if e then
                return e
            end

        end

        if f and ((A) and (e.BalanceAffinity:IsAvailable()) and (t:BuffUp(e.LycarasFleetingGlimpse)) and (t:BuffRemains(e.LycarasFleetingGlimpse) <= 2)) then
            local e = ne()
            if e then
                return e
            end

        end

        if f and ((A) and (e.FeralAffinity:IsAvailable()) and (t:BuffUp(e.LycarasFleetingGlimpse)) and (t:BuffRemains(e.LycarasFleetingGlimpse) <= 2)) then
            local e = G()
            if e then
                return e
            end

        end

        if n.Guardian.SwapForConvoke and m and ((e.BalanceAffinity:IsAvailable()) and not f and (u == 3 and e.ConvoketheSpirits:CooldownRemains() <= 1)) then
            local e = K()
            if e then
                return e
            end

        end

        if n.Guardian.SwapForConvoke and m and ((e.FeralAffinity:IsAvailable()) and not f and (u == 3 and e.ConvoketheSpirits:CooldownRemains() <= 1)) then
            local e = F()
            if e then
                return e
            end

        end

        if (true) then
            local e = p()
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

s.SetAPL(104, x, e)

