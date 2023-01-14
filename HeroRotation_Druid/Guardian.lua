local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Pet;
local i = f.Target;
local j = d.Spell;
local k = d.MultiSpell;
local l = d.Item;
local m = HeroRotation;
local n = m.AoEON;
local o = m.CDsON;
local p = m.Cast;
local q = HeroRotationCharDB.Toggles[4] and select(8, GetInstanceInfo()) ~= 1698;
local r = HeroRotationCharDB.Toggles[5]
local s = HeroRotationCharDB.Toggles[6]
local t = HeroRotationCharDB.Toggles[15]
local u = HeroRotationCharDB.Toggles[12]
local v = HeroRotationCharDB.Toggles[70]
local w = HeroRotationCharDB.Toggles[71]
local x = HeroRotationCharDB.Toggles[72]
local y = HeroRotationCharDB.Toggles[73]
local z = HeroRotationCharDB.Toggles[74]
local A = HeroRotationCharDB.Toggles[75]
local B = HeroRotationCharDB.Toggles[76]
local C = HeroRotationCharDB.Toggles[77]
local D = HeroRotationCharDB.Toggles[78]
local E = HeroRotationCharDB.Toggles[79]
local F = false;
local G = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241,
    331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668 }
local H = { 325552, 326836, 326092, 334926, 328395, 330725, 333299, 323831, 328494, 322968, 334496, 334493, 319603 }
local I = m.Commons.Everyone;
local J = { General = m.GUISettings.General, Commons = m.GUISettings.APL.Druid.Commons,
    Guardian = m.GUISettings.APL.Druid.Guardian, Guardian2 = m.GUISettings.APL.Druid.Guardian2 }
local K = j.Druid.Guardian;
local L = l.Druid.Guardian;
local M = {}
local N = g:GetEquipment()
local O = l(0)
local P = l(0)
if N[13] then O = l(N[13]) end
if N[14] then P = l(N[14]) end
local Q;
local R;
local S;
local T = 0;
local U = 0;
local V = 0;
local W;
local X, Y;
local Z = g:HasLegendaryEquipped(58)
local _ = g:HasLegendaryEquipped(49)
local a0 = g:HasLegendaryEquipped(48)
local a1 = g:HasLegendaryEquipped(60)
local a2 = g:CovenantID()
d:RegisterForEvent(function() a2 = g:CovenantID() end, "COVENANT_CHOSEN")
d:RegisterForEvent(function() N = g:GetEquipment()
O = l(0)
P = l(0)
if N[13] then O = l(N[13]) end if N[14] then P = l(N[14]) end Z = g:HasLegendaryEquipped(58)
_ = g:HasLegendaryEquipped(49)
a0 = g:HasLegendaryEquipped(48)
a1 = g:HasLegendaryEquipped(60)
end, "PLAYER_EQUIPMENT_CHANGED")
d:RegisterForEvent(function() K.AdaptiveSwarmCov:RegisterInFlight() end, "LEARNED_SPELL_IN_TAB")
K.AdaptiveSwarmCov:RegisterInFlight()
local function a3(a4) if a4 then return 1 else return 0 end end

local function a5(a4) return a4 ~= 0 end

local function a6(a7) local a8 = 0; for a9 in pairs(a7) do local aa = a7[a9] if aa:IsChanneling(j(240784)) then a8 = a8 +
    1 end end return a8 end

local function ab(a7) local ac = 0; for a9 in pairs(a7) do local aa = a7[a9] if aa:CastRemains() <= g:GCD() + 0.25 and
    aa:IsCasting(j(240784)) then ac = ac + 1 end end return ac end

local function ad(a7) local ae = 0; for a9 in pairs(a7) do local aa = a7[a9] if aa:NPCID() == 118044 then ae = ae + 1 end end return ae end

local function af(a7) local ag = 0; for a9 in pairs(a7) do local aa = a7[a9] if aa:NPCID() == 118065 or
    aa:NPCID() == 118032 then ag = ag + 1 end end return ag end

local function ah(ai) if ai:DebuffRefreshable(K.MoonfireDebuff) and ai:TimeToDie() > 12 and
    (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == f("mouseover"):GUID() and
    J.Guardian.TargetSwap == "Mouseover" and ai:NPCID() ~= 118044 then T = 18921; return true elseif ai:
    DebuffRefreshable(K.MoonfireDebuff) and ai:TimeToDie() > 12 and
    (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and J.Guardian.TargetSwap == "AutoSwap" and
    ai:GUID() ~= i:GUID() and not u and ai:NPCID() ~= 118044 then T = 9999; if T == 999 then starttime = GetTime()
endtime = starttime + 0.25
elseif T > 0 and endtime ~= nil and GetTime() > endtime then T = 0 end return true elseif ai:DebuffRefreshable(K.MoonfireDebuff)
    and ai:TimeToDie() > 12 and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == i:GUID()
    and ai:NPCID() ~= 118044 then U = 8921; return true elseif ai:DebuffRefreshable(K.MoonfireDebuff) and
    ai:TimeToDie() > 12 and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:NPCID() ~= 118044 then return true end end

local function aj(ai) if not g:IsTanking(ai) and x and ai:AffectingCombat() and ai:GUID() == f("mouseover"):GUID() and
    ai:NPCID() ~= 118044 then T = 16795; return true elseif not g:IsTanking(ai) and x and ai:AffectingCombat() and
    ai:GUID() == i:GUID() and ai:NPCID() ~= 118044 then U = 6795; return true elseif not g:IsTanking(ai) and x and
    ai:AffectingCombat() and ai:NPCID() ~= 118044 then return true end end

local function ak(ai) if ai:DebuffRefreshable(K.MoonfireDebuff) and (ai:NPCID() == 118032 or ai:NPCID() == 118065) and
    ai:GUID() == f("mouseover"):GUID() and ai:NPCID() ~= 118044 then T = 18921; return true elseif ai:DebuffRefreshable(K
    .MoonfireDebuff) and (ai:NPCID() == 118032 or ai:NPCID() == 118065) and ai:GUID() == f("target"):GUID() and
    ai:NPCID() ~= 118044 then U = 8921; return true elseif ai:DebuffRefreshable(K.MoonfireDebuff) and
    (ai:NPCID() == 118032 or ai:NPCID() == 118065) then return true end end

local function al(ai) if ai:DebuffRefreshable(K.SunfireDebuff) and ai:NPCID() == 118065 and
    ai:GUID() == f("mouseover"):GUID() and ai:NPCID() ~= 118044 then T = 2197630; return true elseif ai:
    DebuffRefreshable(K.SunfireDebuff) and ai:NPCID() == 118065 and ai:GUID() == f("target"):GUID() and
    ai:NPCID() ~= 118044 then U = 197630; return true elseif ai:DebuffRefreshable(K.SunfireDebuff) and ai:NPCID() ==
    118065 then return true end end

local function am(ai) return ai:DebuffRefreshable(K.ThrashDebuff) or ai:DebuffStack(K.ThrashDebuff) < 3 or
    ai:DebuffStack(K.ThrashDebuff) < 4 and Z or Y >= 4 or
    g:BuffUp(K.BerserkBuff) and g:BuffRemains(K.BerserkBuff) <= g:GCD() + 0.5 end

local function an(ai) if ai:DebuffStack(K.ThrashDebuff) > 2 and
    (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == f("mouseover"):GUID() and
    J.Guardian.TargetSwap == "Mouseover" then T = 180313; return true elseif ai:DebuffStack(K.ThrashDebuff) > 2 and
    (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and J.Guardian.TargetSwap == "AutoSwap" and
    ai:GUID() ~= i:GUID() and not u then T = 9999; if T == 999 then starttime = GetTime()
endtime = starttime + 0.25
elseif T > 0 and endtime ~= nil and GetTime() > endtime then T = 0 end return true elseif ai:DebuffStack(K.ThrashDebuff)
    > 2 and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) and ai:GUID() == i:GUID() then U = 80313; return true elseif ai
    :DebuffStack(K.ThrashDebuff) > 2 and (ai:AffectingCombat() or ai:IsDummy() or ai:NPCID() == 153285) then return true end return ai
    :DebuffStack(K.ThrashDebuff) > 2 end

local function ao() if g:HealthPercentage() < J.Guardian2.FrenziedRegenHP and K.FrenziedRegeneration:IsReady() and
    g:BuffDown(K.FrenziedRegenerationBuff) and g:BuffUp(K.BearForm) then if p(K.FrenziedRegeneration, nil, nil) then U = 22842; return "frenzied_regeneration defensive 2" end end if K
    .Ironfur:IsCastable() and not F and g:BuffUp(K.BearForm) and K.ConvoketheSpirits:TimeSinceLastDisplay() > 1 and
    (
    g:Rage() >= K.Ironfur:Cost() + 1 and (R or i:IsDummy() or i:NPCID() == 153285) and
        (g:BuffDown(K.IronfurBuff) or g:BuffStack(K.IronfurBuff) < 2 and g:BuffRefreshable(K.Ironfur) or g:Rage() >= 90)
    ) then if p(K.Ironfur, nil, nil) then U = 192081; return "ironfur defensive 4" end end local ap = g:
    GetUseableTrinkets(M) if ap then if p(ap, nil, nil) then if ap:ID() == TopTrinketID and J.Commons.Enabled.TopTrinket
    and J.Commons.TopTrinketHP > g:HealthPercentage() then U = 24; return "top trinket 1 defensive" elseif ap:ID() ==
    BotTrinketID and J.Commons.Enabled.BotTrinket and J.Commons.BotTrinketHP > g:HealthPercentage() then U = 30; return "bot trinket 1 defensive" end end end if K
    .Renewal:IsCastable() and g:HealthPercentage() < J.Guardian2.RenewalHP then if p(K.Renewal, nil, nil) then U = 108238; return "Renewal defensive 4" end end if K
    .Barkskin:IsCastable() and select(8, GetInstanceInfo()) ~= 1698 and g:HealthPercentage() < J.Guardian2.BarkskinHP then if p(K
    .Barkskin, nil, nil) then U = 22812; return "barkskin defensive 6" end end if K.SurvivalInstincts:IsCastable() and
    g:HealthPercentage() < J.Guardian2.SurvivalInstinctsHP then if p(K.SurvivalInstincts, nil, nil) then U = 61336; return "survival_instincts defensive 8" end end if K
    .BristlingFur:IsCastable() and g:Rage() < J.Guardian2.BristlingFurRage then if p(K.BristlingFur, nil, nil) then U = 155835; return "bristling_fur defensive 10" end end if g
    :HealthPercentage() < J.Guardian2.PhialHP and L.PhialofSerenity:IsReady() and L.PhialofSerenity:CooldownRemains() <=
    0 then if m.Cast(L.PhialofSerenity, nil) then U = 55; return "PhialofSerenity HP" end end if g:HealthPercentage() <
    J.Guardian2.HealthstoneHP and L.Healthstone:IsReady() and L.Healthstone:CooldownRemains() <= 0 then if m.Cast(L.Healthstone
    , nil) then U = 40; return "Healthstone HP" end end if g:HealthPercentage() < J.Guardian2.HealPotHP and
    L.CosmicHealPot:IsReady() and L.CosmicHealPot:CooldownRemains() <= 0 then if m.Cast(L.CosmicHealPot, nil) then U = 45; return "CosmicHealPot HP" end end if g
    :HealthPercentage() < J.Guardian2.HealPotHP and L.HealPot:IsReady() and L.HealPot:CooldownRemains() <= 0 then if m.Cast(L
    .HealPot, nil) then U = 41; return "HealPot HP" end end end

local function aq() if K.BearForm:IsCastable() and g:BuffDown(K.BearForm) and not select(8, GetInstanceInfo()) == 1698 then if p(K
    .BearForm) then U = 5487; return "bear_form precombat 2" end end if K.Wrath:IsCastable() and
    (v or select(8, GetInstanceInfo()) == 1698) and g:BuffUp(K.MoonkinForm) and
    (a2 ~= 3 or select(8, GetInstanceInfo()) == 1698) then if p(K.Wrath) then U = 5176; return "cat_form precombat 2" end end if K
    .Starfire:IsCastable() and (v or select(8, GetInstanceInfo()) == 1698) and g:BuffUp(K.MoonkinForm) and a2 == 3 then if p(K
    .Starfire) then U = 197628; return "cat_form precombat 2" end end if K.Fleshcraft:IsCastable() and q and
    not g:IsMoving() and (K.PustuleEruption:SoulbindEnabled() or K.VolatileSolvent:SoulbindEnabled()) then if p(K.Fleshcraft
    , nil, nil) then U = 324631; return "fleshcraft precombat 3" end end if K.WildCharge:IsCastable() and
    (i:IsInRange(25) and not i:IsInRange(8)) and not select(8, GetInstanceInfo()) == 1698 then if p(K.WildCharge) then U = 102401; return "wild_charge precombat 4" end end if K
    .Rake:IsCastable() and g:BuffUp(K.Prowl) and not select(8, GetInstanceInfo()) == 1698 then if p(K.Rake) then U = 1822; return "Rake cat 2" end end if K
    .Mangle:IsCastable() and i:IsInMeleeRange(5) and g:BuffUp(K.BearForm) and not select(8, GetInstanceInfo()) == 1698 then if p(K
    .Mangle) then U = 33917; return "mangle precombat 6" end end if K.Thrash:IsCastable() and i:IsInMeleeRange(8) and
    g:BuffUp(K.BearForm) and not select(8, GetInstanceInfo()) == 1698 then if p(K.Thrash) then U = 77758; return "thrash precombat 8" end end if K
    .Moonfire:IsCastable() and i:NPCID() ~= 118044 then if p(K.Moonfire, nil, nil, not i:IsSpellInRange(K.Moonfire)) then U = 8921; return "moonfire precombat 10" end end end

local function ar() if K.MoonkinForm:IsCastable() and g:BuffDown(K.MoonkinForm) then if p(K.MoonkinForm) then U = 197625; return "MoonkinForm lycara 2" end end end

local function as() if K.CatForm:IsCastable() and g:BuffDown(K.CatForm) then if p(K.CatForm) then U = 768; return "catform lycara 2" end end end

local function at() if K.MoonkinForm:IsCastable() and g:BuffDown(K.MoonkinForm) then if p(K.MoonkinForm) then U = 197625; return "owl_form owl 2" end end if K
    .HeartoftheWild:IsCastable() and o() and K.HeartoftheWild:IsAvailable() and g:BuffDown(K.HeartoftheWild) then if p(K
    .HeartoftheWild) then U = 319454; return "HOTW owl 2" end end if K.ConvoketheSpirits:IsCastable() and
    g:BuffUp(K.MoonkinForm) and q and (K.FirstStrike:SoulbindEnabled() and g:BuffUp(K.FirstStrike)) then if p(K.ConvoketheSpirits) then U = 323764; return "Convoke owl 2" end end if K
    .ConvoketheSpirits:IsCastable() and q and g:BuffUp(K.MoonkinForm) and
    (
    K.HeartoftheWild:IsAvailable() and (g:BuffUp(K.HeartoftheWild) or K.HeartoftheWild:CooldownRemains() > 15) or
        not K.HeartoftheWild:IsAvailable() or not o()) then if p(K.ConvoketheSpirits) then U = 323764; return "Convoke owlvoke 2" end end end

local function au() if K.CatForm:IsCastable() and g:BuffDown(K.CatForm) then if p(K.CatForm) then U = 768; return "catform catvoke 2" end end if K
    .HeartoftheWild:IsCastable() and o() and K.HeartoftheWild:IsAvailable() and g:BuffDown(K.HeartoftheWild) then if p(K
    .HeartoftheWild) then U = 319454; return "HOTW catvoke 2" end end if K.ConvoketheSpirits:IsCastable() and q and
    g:BuffUp(K.CatForm) and
    (
    K.FirstStrike:SoulbindEnabled() and g:BuffUp(K.FirstStrikeBuff) or
        K.HeartoftheWild:IsAvailable() and (g:BuffUp(K.HeartoftheWild) or K.HeartoftheWild:CooldownRemains() > 15) or
        not K.HeartoftheWild:IsAvailable() or not o()) then if p(K.ConvoketheSpirits) then U = 323764; return "Convoke catvoke 2" end end end

local function av() if K.BearForm:IsCastable() and g:BuffDown(K.BearForm) then if p(K.BearForm) then U = 5487; return "bear_form bear 2" end end if K
    .Growl:IsReady() and g:AffectingCombat() and (not g:IsTanking(i) and x) then if p(K.Growl, nil) then U = 6795; return "Growl bear 3" end end if K
    .Growl:IsReady() then if I.CastCycle(K.Growl, Enemies40y, aj, not i:IsSpellInRange(K.Growl)) then return "Growl bear 4" end end if K
    .HeartoftheWild:IsCastable() and o() and i:IsInMeleeRange(8) and v and K.BalanceAffinity:IsAvailable() then if p(K.HeartoftheWild
    , nil) then U = 319454; return "heart_of_the_wild bear 3" end end if K.Moonfire:IsReady() and
    not g:BuffUp(K.RavenousFrenzyBuff) then if ah(i) then if p(K.Moonfire) then U = 8921; return "Moonfire bear 4" end end if I
    .CastCycle(K.Moonfire, X, ah, not i:IsSpellInRange(K.Moonfire)) then return "moonfire bear 4" end end if K.Berserking
    :IsCastable() and i:IsInMeleeRange(8) and (g:BuffUp(K.BerserkBuff) or g:BuffUp(K.IncarnationBuff)) then if p(K.Berserking
    , nil) then U = 26297; return "berserking bear 15" end end if K.ConvoketheSpirits:IsReady() and o() then if p(K.ConvoketheSpirits) then U = 391528; return "Convoke Spirits Bear" end end if K
    .Ironfur:IsCastable() and K.ConvoketheSpirits:TimeSinceLastDisplay() > 1 and g:Rage() >= K.Ironfur:Cost() + 1 and
    not S and (g:BuffUp(K.IncarnationBuff) or g:BuffUp(K.BerserkBuff)) then if p(K.Ironfur, nil, nil) then U = 192081; return "ironfur Zerk 1" end end if K
    .Berserking:IsCastable() and i:IsInMeleeRange(8) and (g:BuffUp(K.BerserkBuff) or g:BuffUp(K.IncarnationBuff)) then if p(K
    .Berserking, nil) then U = 26297; return "berserking bear 15" end end if a2 == 2 and i:IsInMeleeRange(8) then local ap = g
    :GetUseableTrinkets(M) if ap then if p(ap, nil, nil) then if ap:ID() == TopTrinketID and J.Commons.Enabled.TopTrinket
    and (J.Commons.TopTrinketHP <= 0 and o() or J.Commons.TopTrinketHP > g:HealthPercentage()) then U = 24; return "top trinket 1" elseif ap
    :ID() == BotTrinketID and J.Commons.Enabled.BotTrinket and
    (J.Commons.BotTrinketHP <= 0 and o() or J.Commons.BotTrinketHP > g:HealthPercentage()) then U = 30; return "top trinket 2" end end end end if K
    .Thrash:IsCastable(BypassRecovery) and i:IsInMeleeRange(8) and (a1 or g:BuffUp(K.IncarnationBuff) and Y > 3) and
    select(8, GetInstanceInfo()) ~= 1698 then if p(K.Thrash) then U = 77758; return "thrash bear 30" end end if K.Mangle
    :IsCastable() and i:IsInMeleeRange(8) and not a1 and (g:BuffUp(K.IncarnationBuff) and Y <= 3) and
    (i:DebuffStack(K.ThrashDebuff) == 3 and i:DebuffRemains(K.ThrashDebuff) >= 3) and
    i:DebuffRemains(K.MoonfireDebuff) >= 3 then if p(K.Mangle, nil, nil, not i:IsInMeleeRange(5)) then U = 33917; return "mangle bear 134" end end if K
    .RavenousFrenzy:IsCastable() and q and i:IsInMeleeRange(8) then if p(K.RavenousFrenzy, nil, nil) then U = 323546; return "ravenous_frenzy bear 7" end end if L
    .Jotungeirr:IsEquippedAndReady() and a2 == 2 and i:IsInMeleeRange(8) then if p(L.Jotungeirr, nil, nil) then U = 16; return "jotungeirr_destinys_call bear 8" end end if J
    .Commons.Enabled.Potions and t and i:IsInMeleeRange(8) and L.PotionofPhantomFire:IsReady() and
    (
    a2 == 2 and g:BuffRemains(K.IncarnationBuff) >= 23 and g:BuffRemains(K.IncarnationBuff) <= 26 and
        not m.GUISettings.General.HoldPotforBL or m.GUISettings.General.HoldPotforBL and g:BloodlustUp()) then if p(L.PotionofPhantomFire
    , nil, nil) then U = 50; return "potion bear 11" end end if K.ConvoketheSpirits:IsCastable() and q and
    i:IsInMeleeRange(8) then if p(K.ConvoketheSpirits, nil, nil, not i:IsInMeleeRange(5)) then U = 323764; return "convoke_the_spirits bear 12" end end if K
    .Berserk:IsCastable() and not w and i:IsInMeleeRange(8) and o() and (R or i:IsDummy() or i:NPCID() == 153285) and
    (g:BuffUp(K.RavenousFrenzyBuff) or a2 ~= 2) then if p(K.Berserk, nil) then U = 50334; return "berserk bear 13" end end if K
    .Incarnation:IsCastable() and not w and i:IsInMeleeRange(8) and o() and
    g:HealthPercentage() < J.Guardian2.IGuardianOfUrsoc and (R or i:IsDummy() or i:NPCID() == 153285) then if p(K.Incarnation
    , nil) then U = 102558; return "incarnation bear 14" end end if K.Berserking:IsCastable() and i:IsInMeleeRange(8) and
    (g:BuffUp(K.BerserkBuff) or g:BuffUp(K.IncarnationBuff)) then if p(K.Berserking, nil) then U = 26297; return "berserking bear 15" end end if K
    .Barkskin:IsCastable() and (R or i:IsDummy() or i:NPCID() == 153285) and not J.Guardian.UseBarkskinDefensively and
    K.Brambles:IsAvailable() and select(8, GetInstanceInfo()) ~= 1698 then if p(K.Barkskin, nil, nil) then U = 22812; return "barkskin bear 17" end end if K
    .AdaptiveSwarmCov:IsCastable() and i:IsInMeleeRange(8) and q and
    (
    i:DebuffDown(K.AdaptiveSwarmCovDebuff) and K.AdaptiveSwarmCov:TimeSinceLastCast() > 0.3 and
        i:DebuffDown(K.AdaptiveSwarmCovDebuff) or g:BuffRemains(K.AdaptiveSwarmCovHeal) > 3 or
        i:DebuffStack(K.AdaptiveSwarmCovDebuff) < 3 and i:DebuffRemains(K.AdaptiveSwarmCovDebuff) < 5 and
        i:DebuffUp(K.AdaptiveSwarmCovDebuff)) then if p(K.AdaptiveSwarmCov, nil, nil,
    not i:IsSpellInRange(K.AdaptiveSwarmCov)) then U = 325727; return "adaptive_swarm bear 18" end end if K.RageoftheSleeper
    :IsCastable() and R and
    (
    g:BuffDown(K.IncarnationBuff) and K.Incarnation:CooldownRemains() > 60 or g:BuffUp(K.IncarnationBuff) or
        K.ConvoketheSpirits:IsAvailable()) and o() then if p(K.RageoftheSleeper, nil) then U = 200851; return "RageoftheSleeper bear 16" end end if K
    .Moonfire:IsCastable() and g:BuffUp(K.GalacticGuardianBuff) and select(8, GetInstanceInfo()) == 1698 and
    f("boss1"):NPCID() == 117933 and f("boss1"):IsInRange(40) then if p(K.Moonfire) then U = 118921; return "Moonfire owl Boss 2" end end if K
    .Moonfire:IsReady() and (g:BuffUp(K.GalacticGuardianBuff) and Y < 3) and not g:BuffUp(K.RavenousFrenzyBuff) then if p(K
    .Moonfire, nil, nil, not i:IsSpellInRange(K.Moonfire)) then U = 8921; return "moonfire bear 19" end end if K.Thrash:
    IsCastable() and i:IsInMeleeRange(8) and
    (
    i:DebuffRefreshable(K.ThrashDebuff) or i:DebuffStack(K.ThrashDebuff) < 3 or i:DebuffStack(K.ThrashDebuff) < 4 and Z
        or Y <= 4) then if p(K.Thrash) then U = 77758; return "thrash bear 20" end end if K.Fleshcraft:IsCastable() and q
    and
    (
    K.PustuleEruption:SoulbindEnabled() and
        (
        K.Thrash:CooldownRemains() > 0 and K.Mangle:CooldownRemains() > 0 and i:DebuffRemains(K.MoonfireDebuff) >= 3 and
            (g:BuffDown(K.IncarnationBuff) and g:BuffDown(K.BerserkBuff) and g:BuffDown(K.GalacticGuardianBuff))) or
        K.VolatileSolvent:SoulbindEnabled()) then if p(K.Fleshcraft, nil, nil) then U = 324631; return "fleshcraft bear 27" end end if K
    .Swipe:IsCastable() and i:IsInMeleeRange(8) and (g:BuffDown(K.IncarnationBuff) and g:BuffDown(K.BerserkBuff) and Y >=
        4) then if p(K.Swipe, nil, nil, not i:IsInMeleeRange(8)) then U = 213771; return "swipe bear 28" end end if K.Maul
    :IsReady() and i:IsInMeleeRange(8) and S and not F and
    (
    g:BuffUp(K.IncarnationBuff) and Y < 3 and g:BuffStack(K.ToothandClawBuff) >= 2 or
        g:BuffUp(K.ToothandClawBuff) and g:BuffRemains(K.ToothandClawBuff) < 1.5 or Y < 3) then if p(K.Maul, nil, nil,
    not i:IsInMeleeRange(5)) then U = 6807; return "maul bear 30" end end if K.Maul:IsReady() and not F and Y >= 3 and
    Y < 3 and not K.ViciousCycle:IsAvailable() and S then if p(K.Maul, nil, nil, not i:IsInMeleeRange(5)) then U = 6807; return "maul bear 32" end end if K
    .Mangle:IsCastable() and i:IsInMeleeRange(8) and
    (
    g:BuffUp(K.IncarnationBuff) and Y <= 3 or g:Rage() < 90 and Y < 3 or
        g:Rage() < 85 and Y < 3 and K.SouloftheForest:IsAvailable() or g:BuffUp(K.GoreBuff)) then if p(K.Mangle, nil, nil
    , not i:IsInMeleeRange(5)) then U = 33917; return "mangle bear 34" end end if K.Thrash:IsCastable() and
    i:IsInMeleeRange(8) and Y > 1 then if p(K.Thrash, nil, nil, not i:IsInMeleeRange(8)) then U = 77758; return "thrash bear 38" end end if K
    .Pulverize:IsReady() and i:IsInMeleeRange(8) then if I.CastCycle(K.Pulverize, X, an, not i:IsInMeleeRange(5)) then return "pulverize bear 42" end end if K
    .Thrash:IsCastable() and i:IsInMeleeRange(8) then if p(K.Thrash, nil, nil, not i:IsInMeleeRange(8)) then U = 77758; return "thrash bear 44" end end if K
    .Maul:IsReady() and i:IsInMeleeRange(8) and S and not F and Y < 3 then if p(K.Maul, nil, nil, not i:IsInMeleeRange(5)) then U = 6807; return "maul bear 46" end end if K
    .Swipe:IsCastable() and i:IsInMeleeRange(8) then if p(K.Swipe, nil, nil, not i:IsInMeleeRange(8)) then U = 213771; return "swipe bear 48" end end end

local function aw() if K.CatForm:IsCastable() and g:BuffDown(K.CatForm) then if p(K.CatForm) then U = 768; return "cat_form cat 2" end end if K
    .Rake:IsCastable() and g:BuffUp(K.Prowl) then if p(K.Rake) then U = 1822; return "Rake cat 2" end end if K.HeartoftheWild
    :IsCastable() and K.HeartoftheWild:IsAvailable() and g:BuffDown(K.HeartoftheWild) and o() then if p(K.HeartoftheWild) then U = 319454; return "HOTW cat 2" end end if K
    .Rake:IsCastable() and (i:DebuffRefreshable(K.RakeDebuff) or g:Energy() < 45) then if p(K.Rake) then U = 1822; return "Rake cat 3" end end if K
    .Rip:IsCastable() and i:DebuffRefreshable(K.Rip) and g:ComboPoints() >= 1 then if p(K.Rip) then U = 1079; return "Rip cat 2" end end if K
    .ConvoketheSpirits:IsCastable() and q then if p(K.ConvoketheSpirits) then U = 323764; return "Convoke cat 2" end end if K
    .FerociousBite:IsCastable() and g:ComboPoints() >= 4 and g:Energy() > 50 then if p(K.FerociousBite) then U = 22568; return "FB cat 2" end end if K
    .AdaptiveSwarmCov:IsCastable() and q and
    (
    i:DebuffDown(K.AdaptiveSwarmCovDebuff) and K.AdaptiveSwarmCov:TimeSinceLastCast() > 0.3 or
        i:DebuffStack(K.AdaptiveSwarmCovDebuff) < 3 and i:DebuffRemains(K.AdaptiveSwarmCovDebuff) < 5 and
        i:DebuffUp(K.AdaptiveSwarmCovDebuff)) then if p(K.AdaptiveSwarmCov) then U = 325727; return "Adaptive Swarm cat 2" end end if K
    .Fleshcraft:IsCastable() and q and not g:IsMoving() and
    (K.PustuleEruption:SoulbindEnabled() and g:Energy() < 35 or K.VolatileSolvent:SoulbindEnabled()) then if p(K.Fleshcraft
    , nil, nil) then U = 324631; return "fleshcraft precombat 3" end end if true then if p(K.Swipe) then U = 213771; return "Swipe cat 2" end end end

local function ax() if K.MoonkinForm:IsCastable() and g:BuffDown(K.MoonkinForm) then if p(K.MoonkinForm) then U = 197625; return "owl_form owl 2" end end if K
    .HeartoftheWild:IsCastable() and o() and K.HeartoftheWild:IsAvailable() and g:BuffDown(K.HeartoftheWild) then if p(K
    .HeartoftheWild) then U = 319454; return "HOTW owl 2" end end if K.Starsurge:IsCastable() and not g:IsMoving() then if p(K
    .Starsurge) then U = 197626; return "Starsurge owl 2" end end if K.ConvoketheSpirits:IsCastable() and q and
    K.FirstStrike:SoulbindEnabled() then if p(K.ConvoketheSpirits) then U = 323764; return "Convoke owl 2" end end if K.AdaptiveSwarmCov
    :IsCastable() and q and
    (
    i:DebuffDown(K.AdaptiveSwarmCovDebuff) and K.AdaptiveSwarmCov:TimeSinceLastCast() > 0.3 or
        i:DebuffStack(K.AdaptiveSwarmCovDebuff) < 3 and i:DebuffRemains(K.AdaptiveSwarmCovDebuff) < 5 and
        i:DebuffUp(K.AdaptiveSwarmCovDebuff)) then if p(K.AdaptiveSwarmCov) then U = 325727; return "Adaptive Swarm cat 2" end end if K
    .Sunfire:IsCastable() and i:DebuffRefreshable(K.SunfireDebuff) then if p(K.Sunfire) then U = 197630; return "Sunfire owl 2" end end if K
    .Sunfire:IsCastable() then if I.CastCycle(K.Sunfire, Enemies40y, al, not i:IsSpellInRange(K.Sunfire)) then return "Sunfire Owl 3" end end if K
    .Moonfire:IsCastable() and g:BuffUp(K.GalacticGuardianBuff) and select(8, GetInstanceInfo()) == 1698 and
    f("boss1"):NPCID() == 117933 and f("boss1"):IsInRange(40) then if p(K.Moonfire) then U = 118921; return "Moonfire owl Boss 2" end end if K
    .Moonfire:IsCastable() and (i:DebuffRefreshable(K.MoonfireDebuff) or g:BuffUp(K.GalacticGuardianBuff)) then if p(K.Moonfire) then U = 8921; return "Moonfire owl 2" end end if K
    .Starfire:IsCastable() and EclipseAnyNext and a2 == 3 and not g:IsMoving() then if p(K.Starfire) then U = 197628; return "Starfire owl 2" end end if K
    .Wrath:IsCastable() and EclipseAnyNext and a2 ~= 3 and not g:IsMoving() then if p(K.Wrath) then U = 5176; return "Wrath owl 2" end end if K
    .ConvoketheSpirits:IsCastable() and q and (g:BuffUp(K.EclipseLunar) or g:BuffUp(K.EclipseSolar)) then if p(K.ConvoketheSpirits) then U = 323764; return "Convoke owl 2" end end if K
    .Starfire:IsCastable() and not g:IsMoving() and
    (
    EclipseInLunar or EclipseSolarNext or
        EclipseInLunar and g:BuffUp(K.EclipseLunar) and K.Starsurge:TimeSinceLastCast() < 14) then if p(K.Starfire) then U = 197628; return "Starfire owl 2" end end if K
    .Wrath:IsCastable() and not g:IsMoving() then if p(K.Wrath) then U = 5176; return "Wrath owl 2" end end if K.Moonfire
    :IsCastable() and g:IsMoving() then if p(K.Moonfire) then U = 8921; return "Moonfire owl 2" end end end

local function ay() s = HeroRotationCharDB.Toggles[6]
q = HeroRotationCharDB.Toggles[4] and select(8, GetInstanceInfo()) ~= 1698;
r = HeroRotationCharDB.Toggles[5]
u = HeroRotationCharDB.Toggles[12]
t = HeroRotationCharDB.Toggles[15]
v = HeroRotationCharDB.Toggles[70]
w = HeroRotationCharDB.Toggles[71]
x = HeroRotationCharDB.Toggles[72]
y = HeroRotationCharDB.Toggles[73]
z = HeroRotationCharDB.Toggles[74]
A = HeroRotationCharDB.Toggles[75]
B = HeroRotationCharDB.Toggles[76]
C = HeroRotationCharDB.Toggles[77]
D = HeroRotationCharDB.Toggles[78]
E = HeroRotationCharDB.Toggles[79]
F = false
end

local function az() EclipseInAny = g:BuffUp(K.EclipseSolar) or g:BuffUp(K.EclipseLunar)
EclipseInBoth = g:BuffUp(K.EclipseSolar) and g:BuffUp(K.EclipseLunar)
EclipseInLunar = g:BuffUp(K.EclipseLunar) and g:BuffDown(K.EclipseSolar)
EclipseInSolar = g:BuffUp(K.EclipseSolar) and g:BuffDown(K.EclipseLunar)
EclipseLunarNext = not EclipseInAny and (K.Starfire:Count() == 0 and K.Wrath:Count() > 0 or g:IsCasting(K.Wrath)) or
    EclipseInSolar;
EclipseSolarNext = not EclipseInAny and (K.Wrath:Count() == 0 and K.Starfire:Count() > 0 or g:IsCasting(K.Starfire)) or
    EclipseInLunar;
EclipseAnyNext = not EclipseInAny and K.Wrath:Count() > 0 and K.Starfire:Count() > 0
end

local function aA() if n() then X = g:GetEnemiesInMeleeRange(8)
Y = #X;
W = g:GetEnemiesInMeleeRange(5)
Enemies40y = g:GetEnemiesInRange(40)
else X = g:GetEnemiesInMeleeRange(8) if #X >= 1 then Y = 1 else Y = 0 end W = g:GetEnemiesInMeleeRange(5) end TopTrinketID = GetInventoryItemID("player"
    , 13)
BotTrinketID = GetInventoryItemID("player", 14)
if not J.Commons.Enabled.TopTrinket and not J.Commons.Enabled.BotTrinket then M = { TopTrinketID, BotTrinketID } elseif not
    J.Commons.Enabled.TopTrinket then M = { TopTrinketID } elseif not J.Commons.Enabled.BotTrinket then M = { BotTrinketID } end Q = g
    :ActiveMitigationNeeded()
R = g:IsTankingAoE(8) or g:IsTanking(i)
UnitsCastinNetherStormCount = a6(X)
UnitsCastinNetherStormCount2 = ab(X)
UnitsCastinNetherStormCount3 = ad(X)
MTNegligableMeleeCount = af(X)
if n() then if MTNegligableMeleeCount > 0 then Y = Y - MTNegligableMeleeCount end end S = true; if not
    J.Guardian.UseRageDefensively then S = true end if not BotOn then T = 0;
U = 0
end if T > 0 then T = 0 end if U > 0 then U = 0 end ShouldReturn = ay() if m.QueuedCast() then U = m.QueuedCast() return "Custom Queue "
    .. j(U):ID() end az() if m.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then starttime = GetTime()
endtime = starttime + m.GUISettings.General.OpenerReset
elseif m.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6
    ] then HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6] m.ToggleIconFrame:UpdateButtonText(6) m.Print("Opener is now "
    .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r.")) end if y and
    K.UrsolsVortex:IsUsableP() and K.RestorationAffinity:IsAvailable() and
    K.UrsolsVortex:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if m.Cast(K.UrsolsVortex, nil, nil,
    nil) then U = 102793; return "UrsolsVortex Queue" end elseif (
    not K.UrsolsVortex:IsUsableP() or K.UrsolsVortex:CooldownRemains() > 0 or not g:AffectingCombat() or
        not K.RestorationAffinity:IsAvailable()) and y then HeroRotationCharDB.Toggles[73] = not
    HeroRotationCharDB.Toggles[73] m.Print("Ursols Vortex Queue is now " ..
    (HeroRotationCharDB.Toggles[73] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if z and K.Typhoon:IsUsableP() and
    K.BalanceAffinity:IsAvailable() and K.Typhoon:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if m
    .Cast(K.Typhoon, nil, nil, nil) then U = 132469; return "Typhoon Queue" end elseif (
    not K.Typhoon:IsUsableP() or K.Typhoon:CooldownRemains() > 0 or not g:AffectingCombat() or
        not K.BalanceAffinity:IsAvailable()) and z then HeroRotationCharDB.Toggles[74] = not
    HeroRotationCharDB.Toggles[74] m.Print("Typhoon Queue is now " ..
    (HeroRotationCharDB.Toggles[74] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if A and
    K.StampedingRoar:IsUsableP() and K.StampedingRoar:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if m
    .Cast(K.StampedingRoar, nil, nil, nil) then U = 106898; return "StampedingRoar Queue" end elseif (
    not K.StampedingRoar:IsUsableP() or K.StampedingRoar:CooldownRemains() > 0 or not g:AffectingCombat()) and A then HeroRotationCharDB
    .Toggles[75] = not HeroRotationCharDB.Toggles[75] m.Print("Stampeding Roar Queue is now " ..
    (HeroRotationCharDB.Toggles[75] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if B and
    K.IncapacitatingRoar:IsUsableP() and K.IncapacitatingRoar:CooldownRemains(BypassRecovery) <= 0 and
    g:AffectingCombat() then if m.Cast(K.IncapacitatingRoar, nil, nil, nil) then U = 99; return "IncapacitatingRoar Queue" end elseif (
    not K.IncapacitatingRoar:IsUsableP() or K.IncapacitatingRoar:CooldownRemains() > 0 or not g:AffectingCombat()) and B then HeroRotationCharDB
    .Toggles[76] = not HeroRotationCharDB.Toggles[76] m.Print("Incapacitating Roar Queue is now " ..
    (HeroRotationCharDB.Toggles[76] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if C and K.MightyBash:IsAvailable()
    and K.MightyBash:IsUsableP() and K.MightyBash:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if m
    .Cast(K.MightyBash, nil, nil, nil) then U = 5211; return "MightyBash Queue" end elseif (
    not K.MightyBash:IsUsableP() or K.MightyBash:CooldownRemains() > 0 or not g:AffectingCombat() or
        not K.MightyBash:IsAvailable()) and C then HeroRotationCharDB.Toggles[77] = not HeroRotationCharDB.Toggles[77] m
    .Print("Mighty Bash Queue is now " .. (HeroRotationCharDB.Toggles[77] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if E
    and K.EntanglingRoots:IsUsableP() and K.EntanglingRoots:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat()
    and not g:PrevGCD(1, K.EntanglingRoots) and not g:IsCasting() then if m.Cast(K.EntanglingRoots, nil, nil, nil) then if f("mouseover")
    :GUID() ~= nil and f("mouseover"):IsSpellInRange(K.EntanglingRoots) then T = 1339; return "Entangling Roots Queue" end end elseif (
    not K.EntanglingRoots:IsUsableP() or K.EntanglingRoots:CooldownRemains() > 0 or not g:AffectingCombat() or
        g:PrevGCD(1, K.EntanglingRoots) or g:IsCasting(K.EntanglingRoots) and g:CastRemains() <= 0.5) and E then HeroRotationCharDB
    .Toggles[79] = not HeroRotationCharDB.Toggles[79] m.Print("Entangling Roots Queue Queue is now " ..
    (HeroRotationCharDB.Toggles[79] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if g:IsChanneling(j(323764)) then if p(K
    .Pool) then U = 999999; return "channeling" end return false end if g:BuffUp(K.TravelForm) and IsFlyableArea() then return false end if D then if g
    :BuffUp(K.TravelForm) and K.WildCharge:IsAvailable() and K.WildCharge:CooldownRemains() <= 0 and
    not g:BuffUp(K.Sprint) and not IsFlyableArea() then if p(K.WildCharge, nil) then U = 102417; return "Zoom Zoom Jump" end end if not
    g:BuffUp(K.TravelForm) and
    (
    K.WildCharge:IsAvailable() and K.TravelForm:CooldownRemains() <= 0 and not g:BuffUp(K.Sprint) and
        g:BuffDown(K.SoulShape) and not IsFlyableArea() and not IsIndoors() or IsFlyableArea() and not IsIndoors()) then if p(K
    .TravelForm, nil) then U = 783; return "Travel Form for Jump" end end if K.StampedingRoar:CooldownRemains() <= 0 and
    g:BuffDown(K.SoulShape) and IsIndoors() and g:BuffDown(K.TravelForm) then if p(K.StampedingRoar, nil) then U = 106898; return "StampedingRoar" end end if K
    .Flicker:IsCastable() and g:BuffUp(K.SoulShape) then if p(K.Flicker, nil) then U = 324701; return "Flicker" end end if K
    .SoulShape:IsAvailable() and K.SoulShape:IsCastable() and not g:BuffUp(K.SoulShape) and
    not g:BuffUp(K.StampedingRoar) and not g:BuffUp(K.Sprint) then if p(K.SoulShape, nil) then U = 310143; return "zoom zoom soulshape" end end if K
    .Sprint:IsAvailable() and K.Sprint:IsCastable() and not g:BuffUp(K.SoulShape) and IsIndoors() and
    not g:BuffUp(K.StampedingRoar) then if p(K.Sprint, nil) then U = 1850; return "Zoom zoom Sprint" end end if K.CatForm
    :IsCastable() and not g:BuffUp(K.CatForm) and not g:BuffUp(K.SoulShape) and IsIndoors() then if p(K.CatForm, nil) then U = 768; return "Zoom zoom CatForm" end end end if I
    .TargetIsValid() then if select(8, GetInstanceInfo()) == 1698 then if UnitsCastinNetherStormCount > 0 and
    j(99):IsReady() then if p(j(99), nil) then U = 99; return "Shout Interrupt MT 1" end end if UnitsCastinNetherStormCount2
    > 0 and j(99):IsReady() and g:BuffUp(K.BearForm) then if p(K.Pool, nil) then U = 99999; return "Pool for Shout Interrupt MT 1" end end if UnitsCastinNetherStormCount3
    > 0 and K.Barkskin:IsReady() and f("boss1"):NPCID() == 117933 and f("boss1"):TimeToDie() > 60 then if p(K.Barkskin,
    nil, nil) then U = 22812; return "barkskin defensive MT 6" end end if i:IsInRange(28) and not i:IsInRange(8) and
    K.WildCharge:IsReady() and g:BuffUp(K.BearForm) and f("target"):NPCID() ~= 117933 and f("target"):NPCID() ~= 118032 then if p(j(102401)
    , nil) then U = 102401; return "Wild Charge Back" end end if true then local ShouldReturn = ao() if ShouldReturn then return ShouldReturn end end if (
    select(8, UnitChannelInfo("target")) == 234676 or select(9, UnitCastingInfo("target")) == 234676) and
    f("target"):IsInRange(20) then if g:BuffUp(K.BearForm) or g:BuffUp(K.CatForm) then if p(j(106839), nil) then U = 11106839; return "interrupt boss MT" end else if p(K
    .BearForm, nil) then U = 5487; return "Bear for interrupt" end end end if f("boss1"):NPCID() == 117933 then if (
    select(8, UnitChannelInfo("boss1")) == 234423 or select(9, UnitCastingInfo("boss1")) == 234423) and
    f("boss1"):IsInRange(20) then if g:BuffUp(K.MoonkinForm) and j(132469):CooldownRemains() <= 0 and
    UnitsCastinNetherStormCount2 == 0 and UnitsCastinNetherStormCount == 0 then if p(j(132469), nil) then U = 132469; return "typhoon interrupt boss MT" end elseif g
    :BuffUp(K.BearForm) or g:BuffUp(K.CatForm) then if p(j(106839), nil) then U = 11106839; return "interrupt boss MT" end elseif (
    not g:BuffUp(K.BearForm) or g:BuffUp(K.CatForm)) and j(132469):CooldownRemains() >= 0 then if p(K.BearForm, nil) then U = 5487; return "Bear for interrupt" end end end if K
    .Moonfire:IsReady() then if I.CastCycle(K.Moonfire, g:GetEnemiesInMeleeRange(40), ak,
    not i:IsSpellInRange(K.Moonfire)) then return "moonfire MT 4" end end if Y == 0 then if g:BuffUp(K.MoonkinForm) then if (
    g:HealthPercentage() < J.Guardian2.MTRegrowth - 20 and not g:IsCasting(j(8936)) or
        g:HealthPercentage() < J.Guardian2.MTRegrowth - 20) and j(8936):IsReady() and not g:IsMoving() then if p(j(8936)
    , nil) then U = 8936; return "Regrowth phase 1" end elseif true then local ShouldReturn = ax() if ShouldReturn then return ShouldReturn end end else if p(K
    .MoonkinForm, nil) then U = 197625; return "Moonkin phase 1" end end else if UnitsCastinNetherStormCount > 0 and
    j(99):IsCastable() and g:BuffUp(K.BearForm) then if p(j(99), nil) then U = 99; return "Shout Interrupt MT 1" end elseif g
    :BuffUp(K.BearForm) then local ShouldReturn = av() if ShouldReturn then return ShouldReturn end elseif g:BuffDown(K.BearForm) then if p(K
    .BearForm, nil) then U = 5487; return "Bear for melee" end end end end if f("boss1"):NPCID() == 117198 then if (
    select(8, UnitChannelInfo("boss1")) == 234676 or select(9, UnitCastingInfo("boss1")) == 234676) and
    f("boss1"):IsInRange(20) then if (g:BuffUp(K.BearForm) or g:BuffUp(K.CatForm)) and j(106839):CooldownRemains() <= 0 then if p(j(106839)
    , nil) then U = 11106839; return "interrupt boss MT" end elseif g:BuffUp(K.BearForm) and
    j(132469):CooldownRemains() <= 0 then if p(j(132469), nil) then U = 132469; return "interrupt boss MT" end elseif not
    g:BuffUp(K.BearForm) then if p(K.BearForm, nil) then U = 5487; return "Bear for interrupt" end end end if (
    select(8, UnitChannelInfo("boss1")) == 236572 or select(9, UnitCastingInfo("boss1")) == 236572) and
    f("boss1"):IsInRange(8) and j(5211):IsAvailable() and j(5211):IsReady() then if p(j(5211), nil) then U = g:
    DebuffStack(j(236572)) return "interrupt boss bash MT" end end if (
    select(8, UnitChannelInfo("boss1")) == 236572 or select(9, UnitCastingInfo("boss1")) == 236572) and
    g:BuffUp(K.BearForm) then for aB = 1, 40 do local aC, aC, aD, aC, aC, aC, aC, aC, aC, aE, aC, aC, aC, aC, aC, aC = UnitDebuff("player"
    , aB) if aE ~= nil and aE == 236572 and aD ~= nil and aD >= 2 and K.SurvivalInstincts:IsCastable() then if p(K.SurvivalInstincts
    , nil, nil) then U = 61336; return "survival_instincts defensive 8" end end if aE ~= nil and aE == 236572 and aD ~=
    nil and aD >= 1 and K.Barkskin:IsCastable() then if p(K.Barkskin, nil, nil) then U = 22812; return "barkskin defensive 6" end end if aE
    ~= nil and aE == 236572 and aD ~= nil and aD >= 0 and K.Ironfur:IsCastable() and
    (
    g:Rage() >= K.Ironfur:Cost() + 1 and
        (g:BuffDown(K.IronfurBuff) or g:BuffStack(K.IronfurBuff) < 2 and g:BuffRefreshable(K.Ironfur) or g:Rage() >= 90)
    ) then if p(K.Ironfur, nil, nil) then U = 192081; return "ironfur defensive 4" end end end end if K.Moonfire:IsReady() then if I
    .CastCycle(K.Moonfire, g:GetEnemiesInMeleeRange(40), ak, not i:IsSpellInRange(K.Moonfire)) then return "moonfire MT 4" end end if Y
    >= 0 then if UnitsCastinNetherStormCount > 0 and j(99):IsCastable() and g:BuffUp(K.BearForm) then if p(j(99), nil) then U = 99; return "Shout Interrupt MT 1" end elseif g
    :BuffUp(K.BearForm) then local ShouldReturn = av() if ShouldReturn then return ShouldReturn end elseif g:BuffDown(K.BearForm) then if p(K
    .BearForm, nil) then U = 5487; return "Bear for melee" end end end end end if not g:AffectingCombat() and s then local ShouldReturn = aq() if ShouldReturn then return ShouldReturn end end if not
    UnitIsEnemy("player", "mouseover") and UnitIsDead("mouseover") then if K.Rebirth:IsCastable() and
    (g:Rage() >= 30 and g:BuffUp(K.BearForm) or g:BuffDown(K.BearForm) and not g:IsMoving()) then if p(K.Rebirth, nil) then U = 20484; return "Rebirth MO" end elseif K
    .Rebirth:CooldownRemains(BypassRecovery) <= 0 and (g:Rage() < 30 and g:BuffUp(K.BearForm)) then F = true end end if UnitExists("mouseover")
    and string.find(UnitGUID("mouseover"), 120651) then if K.Moonfire:IsCastable() then if p(K.Moonfire, nil) then T = 18921; return "explosive MO SWD" end end end if UnitExists("target")
    and string.find(UnitGUID("target"), 120651) then if K.Moonfire:IsCastable() then if p(K.Moonfire, nil) then U = 8921; return "explosive  SWD" end end end local aF = UnitThreatSituation("player"
    , "target")
G = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510,
    344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 158337 }
if UnitExists("target") and K.Soothe:IsCastable() then if UnitCanAttack("player", "target") and
    UnitAffectingCombat("target") and UnitIsDead("target") ~= true then for aB = 0, 40 do local aC, aC, aG, aH, aC, aC, aC, aC, aC, aI = UnitBuff("target"
    , aB) for aC, aJ in pairs(G) do if aJ == aI then if p(K.Soothe, nil) then U = 2908; return "Southe Enrage" end end end end end end if UnitExists("mouseover")
    and K.Soothe:IsCastable() then if UnitCanAttack("player", "mouseover") and UnitAffectingCombat("mouseover") and
    UnitIsDead("mouseover") ~= true then for aB = 0, 40 do local aC, aC, aG, aH, aC, aC, aC, aC, aC, aI = UnitBuff("mouseover"
    , aB) for aC, aJ in pairs(G) do if aJ == aI then if p(K.Soothe, nil) then T = 12908; return "Southe Enrage mouseover" end end end end end end for aB = 0, 40 do local aC, aC, aG, aH, aC, aC, aC, aC, aC, aI = UnitDebuff("mouseover"
    , aB) if K.RemoveCorruption:IsCastable() and UnitIsDead("mouseover") ~= true and
    UnitCanAttack("player", "mouseover") ~= true and IsItemInRange(34471, "mouseover") and (aH == "Poison" or aH ==
        "Curse") then if p(K.RemoveCorruption, nil) then U = 2782; return "Remove Corruption MO" end end end if true then local ShouldReturn = ao() if ShouldReturn then return ShouldReturn end end if L
    .Jotungeirr:IsEquippedAndReady() and a2 ~= 2 and o() then if p(L.Jotungeirr, nil, nil) then U = 16; return "jotungeirr_destinys_call main" end end if a2
    ~= 2 and o() then local ap = g:GetUseableTrinkets(M) if ap then if p(ap, nil, nil) then if ap:ID() == TopTrinketID
    and J.Commons.Enabled.TopTrinket and
    (J.Commons.TopTrinketHP <= 0 and o() or J.Commons.TopTrinketHP > g:HealthPercentage()) then U = 24; return "top trinket 1" elseif ap
    :ID() == BotTrinketID and J.Commons.Enabled.BotTrinket and
    (J.Commons.BotTrinketHP <= 0 and o() or J.Commons.BotTrinketHP > g:HealthPercentage()) then U = 30; return "bot trinket 1" end end end end if J
    .Commons.Enabled.Potions and t and L.PotionofPhantomFire:IsReady() and
    (
    a2 ~= 2 and (g:BuffUp(K.BerserkBuff) or g:BuffUp(K.Incarnation)) and g:BuffRemains(K.IncarnationBuff) <= 26 and
        not m.GUISettings.General.HoldPotforBL or m.GUISettings.General.HoldPotforBL and g:BloodlustUp()) then if p(L.PotionofPhantomFire
    , nil, nil) then U = 50; return "potion main" end end if true then local ShouldReturn = av() if ShouldReturn then return ShouldReturn end end if true then if m
    .CastAnnotated(K.Pool, false, "WAIT") then return "Wait/Pool Resources" end end end end

local function aK() if HeroRotationCharDB.Toggles[6] then HeroRotationCharDB.Toggles[6] = not
    HeroRotationCharDB.Toggles[6] m.ToggleIconFrame:UpdateButtonText(6) end end

function ReturnSpell() if U == 0 then return 0 else return U end end

function ReturnSpellMO() if T == 0 then return 0 else return T end end

m.SetAPL(104, aA, aK)
