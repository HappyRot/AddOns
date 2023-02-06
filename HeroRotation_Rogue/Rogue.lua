local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = f.MouseOver;
local j = d.Spell;
local k = d.MultiSpell;
local l = d.Item;
local m = d.Utils.MergeTableByKey;
local n = HeroRotation;
local o = n.Commons.Everyone;
local p = math.min;
local pairs = pairs;
local q = {}
local r = HeroRotationCharDB.Toggles[12]
n.Commons.Rogue = q;
local s = { General = n.GUISettings.General, Commons = n.GUISettings.APL.Rogue.Commons,
    Assassination = n.GUISettings.APL.Rogue.Assassination, Outlaw = n.GUISettings.APL.Rogue.Outlaw,
    Subtlety = n.GUISettings.APL.Rogue.Subtlety }
local t = 0;
local u = 0;
if not j.Rogue then j.Rogue = {} end
j.Rogue.Commons = { AncestralCall = j(274738), ArcanePulse = j(260364), ArcaneTorrent = j(25046), BagofTricks = j(312411),
    Berserking = j(26297), BloodFury = j(20572), Fireblood = j(265221), LightsJudgment = j(255647), Shadowmeld = j(58984),
    CloakofShadows = j(31224), CrimsonVial = j(185311), Evasion = j(5277), Feint = j(1966), Blind = j(2094),
    CheapShot = j(1833), Kick = j(1766), KidneyShot = j(408), Sap = j(6770), Shadowstep = j(36554), Sprint = j(2983),
    TricksoftheTrade = j(57934), MasterAssassinsMark = j(340094), Flagellation = j(384631), FlagellationBuff = j(345569),
    Fleshcraft = j(324631), Sepsis = j(328305), SepsisBuff = j(347037), SerratedBoneSpike = j(385424),
    SerratedBoneSpikeDebuff = j(394036), EffusiveAnimaAccelerator = j(352188), KevinsOozeling = j(352110),
    KevinsWrathDebuff = j(352528), LeadbyExample = j(342156), LeadbyExampleBuff = j(342181),
    MarrowedGemstoneBuff = j(327069), PustuleEruption = j(351094), VolatileSolvent = j(323074), ChaosBaneBuff = j(355829),
    AcrobaticStrikes = j(196924), Alacrity = j(193539), ColdBlood = j(382245), EchoingReprimand = j(385616),
    EchoingReprimand2 = j(323558), EchoingReprimand3 = j(323559), EchoingReprimand4 = j(323560),
    EchoingReprimand5 = j(354838), DeeperStratagem = j(193531), Elusiveness = j(79008), FindWeakness = j(91023),
    FindWeaknessDebuff = j(316220), ImprovedAmbush = j(381620), ResoundingClarity = j(381622), MarkedforDeath = j(137619),
    Nightstalker = j(14062), PreyontheWeak = j(131511), PreyontheWeakDebuff = j(255909), Sepsis = j(385408),
    SepsisBuff = j(375939), ShadowDance = j(185313), ShadowDanceBuff = j(185422), ShadowDanceTalent = j(394930),
    Shadowstep = j(36554), Subterfuge = j(108208), SubterfugeBuff = j(115192), ThistleTea = j(381623),
    ThistleTeaBuff = j(381623), Vigor = j(112651), Stealth = j(108208):IsAvailable() and j(115191) or j(1784),
    Vanish = j(1856), VanishBuff = j(108208):IsAvailable() and j(115193) or j(11327), AcquiredSword = j(368657),
    AcquiredAxe = j(368656), AcquiredWand = j(368654), TheFirstRune = j(368635), TheFourthRune = j(368638),
    TheFinalRune = j(368641), PoolEnergy = j(999910), SinfulRevelationDebuff = j(324260) }
j.Rogue.Assassination = m(j.Rogue.Commons,
    { Ambush = j(8676), AmplifyingPoison = j(381664), AmplifyingPoisonDebuff = j(383414),
        AmplifyingPoisonDebuffDeathmark = j(394328), CripplingPoisonDebuff = j(3409), DeadlyPoison = j(2823),
        DeadlyPoisonDebuff = j(2818), DeadlyPoisonDebuffDeathmark = j(394324), Envenom = j(32645), FanofKnives = j(51723),
        Garrote = j(703), GarroteDeathmark = j(360830), Mutilate = j(1329), PoisonedKnife = j(185565), Rupture = j(1943),
        RuptureDeathmark = j(360826), SliceandDice = j(315496), WoundPoison = j(8679), WoundPoisonDebuff = j(8680),
        AtrophicPoisonDebuff = j(392388), BlindsideBuff = j(121153), CrimsonTempest = j(121411), CutToTheChase = j(51667),
        DashingScoundrel = j(381797), Deathmark = j(360194), Doomblade = j(381673), DragonTemperedBlades = j(381801),
        Elusiveness = j(79008), Exsanguinate = j(200806), ImprovedGarrote = j(381632), ImprovedGarroteBuff = j(392401),
        ImprovedGarroteAura = j(392403), IndiscriminateCarnage = j(381802), InternalBleeding = j(154953),
        Kingsbane = j(385627), MasterAssassin = j(255989), MasterAssassinBuff = j(256735), PreyontheWeak = j(131511),
        PreyontheWeakDebuff = j(255909), SerratedBoneSpike = j(385424), SerratedBoneSpikeDebuff = j(394036), Shiv = j(5938),
        ShivDebuff = j(319504), VenomRush = j(152152), Vendetta = j(79140) })
j.Rogue.Outlaw = m(j.Rogue.Commons,
    { AdrenalineRush = j(13750), Ambush = j(8676), BetweentheEyes = j(315341), BladeFlurry = j(13877), Dispatch = j(2098),
        Elusiveness = j(79008), GrapplingHook = j(195457), Opportunity = j(195627), PistolShot = j(185763),
        RolltheBones = j(315508), Shiv = j(5938), SinisterStrike = j(193315), SliceandDice = j(315496),
        Audacity = j(381845), AudacityBuff = j(386270), BladeRush = j(271877), CountTheOdds = j(381982),
        DeeperStratagem = j(193531), Dreadblades = j(343142), FanTheHammer = j(381846), GhostlyStrike = j(196937),
        GreenskinsWickers = j(386823), GreenskinsWickersBuff = j(394131), HiddenOpportunity = j(383281),
        ImprovedBetweentheEyes = j(235484), ImprovedAdrenalineRush = j(395422), KeepItRolling = j(381989),
        KillingSpree = j(51690), LoadedDiceBuff = j(256171), LoadedDice = j(256170), MarkedforDeath = j(137619),
        PreyontheWeak = j(131511), PreyontheWeakDebuff = j(255909), QuickDraw = j(196938), SwiftSlasher = j(381988),
        TakeEmBySurpriseBuff = j(385907), Weaponmaster = j(200733), SummarilyDispatched = j(381990), Gouge = j(1776),
        Broadside = j(193356), BuriedTreasure = j(199600), GrandMelee = j(193358), RuthlessPrecision = j(193357),
        SkullandCrossbones = j(199603), TrueBearing = j(193359) })
j.Rogue.Subtlety = m(j.Rogue.Commons,
    { Backstab = j(53), Eviscerate = j(196819), Rupture = j(1943), Shadowstrike = j(185438), Shiv = j(5938),
        ShurikenStorm = j(197835), ShurikenToss = j(114014), SliceandDice = j(315496), Stealth = j(1784),
        Stealth2 = j(115191), SymbolsofDeath = j(212283), SymbolsofDeathCrit = j(227151), Vanish = j(1856),
        VanishBuff = j(11327), VanishBuff2 = j(115193), BlackPowder = j(319175), DarkBrew = j(382504),
        DarkShadow = j(245687), DanseMacabre = j(382528), DanseMacabreBuff = j(393969), EnvelopingShadows = j(238104),
        Gloomblade = j(200758), LingeringShadow = j(382524), MasterofShadows = j(196976), Premeditation = j(343160),
        PremeditationBuff = j(343173), SealFate = j(14190), SecretTechnique = j(280719), SecretStratagem = j(394320),
        ShadowBlades = j(121471), ShadowFocus = j(108209), ShurikenTornado = j(277925), SilentStorm = j(385727),
        Weaponmaster = j(193537), CloakofShadows = j(31224), CrimsonVial = j(185311), Evasion = j(5277), Feint = j(1966),
        Blind = j(2094), CheapShot = j(1833), Kick = j(1766), KidneyShot = j(408), Shadowstep = j(36554), Sprint = j(2983),
        TricksoftheTrade = j(57934), DeathfromAbove = j(269513), Maneuverability = j(197000), ShadowyDuel = j(207736),
        SmokeBomb = j(212182), VeilofMidnight = j(198952), DeeperDaggers = j(341549), PerforatedVeins = j(341567),
        PerforatedVeinsBuff = j(341572), DeathlyShadowsBuff = j(341202), FinalityBlackPowder = j(340603),
        FinalityEviscerate = j(340600), FinalityRupture = j(340601), TheRottenBuff = j(341134) })
if not l.Rogue then l.Rogue = {} end
l.Rogue.Assassination = { GalecallersBoon = l(159614, { 13, 14 }), LustrousGoldenPlumage = l(159617, { 13, 14 }),
    ComputationDevice = l(167555, { 13, 14 }), VigorTrinket = l(165572, { 13, 14 }), FontOfPower = l(169314, { 13, 14 }),
    RazorCoral = l(169311, { 13, 14 }), InscrutableQuantumDevice = l(179350, { 13, 14 }),
    ShadowgraspTotem = l(179356, { 13, 14 }), OverchargedAnimaBattery = l(180116, { 13, 14 }),
    CacheOfAcquiredTreasures = l(188265, { 13, 14 }), TheFirstSigil = l(188271, { 13, 14 }),
    ScarsofFraternalStrife = l(188253, { 13, 14 }) }
l.Rogue.Outlaw = { PotionofSpectralAgility = l(171270), Healthstone = l(5512), HealPotL = l(191378), HealPotM = l(191379),
    HealPotH = l(191380), CosmicHealPot = l(187802), PhialofSerenity = l(177278), ManicGrieftorch = l(194308, { 13, 14 }),
    AlgetharPuzzleBox = l(193701, { 13, 14 }) }
l.Rogue.Subtlety = { ComputationDevice = l(167555, { 13, 14 }), VigorTrinket = l(165572, { 13, 14 }),
    FontOfPower = l(169314, { 13, 14 }), RazorCoral = l(169311, { 13, 14 }), MistcallerOcarina = l(178715, { 13, 14 }),
    CacheOfAcquiredTreasures = l(188265, { 13, 14 }), PotionofSpectralAgility = l(171270), Healthstone = l(5512),
    HealPot = l(191380), CosmicHealPot = l(187802), PhialofSerenity = l(177278) }
function q.StealthSpell() return j.Rogue.Commons.Subterfuge:IsAvailable() and j.Rogue.Commons.Stealth2 or
    j.Rogue.Commons.Stealth end

function q.VanishBuffSpell() return j.Rogue.Commons.Subterfuge:IsAvailable() and j.Rogue.Commons.VanishBuff2 or
    j.Rogue.Commons.VanishBuff end

function q.Stealth(v, w) u = 0;
t = 0;
if (s.Commons.StealthOOC == "Always" or s.Commons.StealthOOC == "w/ Target" and o.TargetIsValid()) and v:IsCastable() and
    g:StealthDown() and not g:DebuffUp(j(319070)) then if n.Cast(v, nil) then t = 200; return "Cast Stealth (OOC)" end else t = 0 end return false end

do local x = j(185311) function q.CrimsonVial() u = 0;
t = 0;
if x:IsCastable() and g:HealthPercentage() <= s.Commons.CrimsonVialHP then if n.Cast(x, nil) then t = 201; return "Cast Crimson Vial (Defensives)" end end return false end end
do local y = j(1966) function q.Feint() u = 0;
t = 0;
if y:IsCastable() and g:BuffDown(y) and g:HealthPercentage() <= s.Commons.FeintHP then if n.Cast(y, nil) then t = 202; return "Cast Feint (Defensives)" end end end end
do local z = j(5277) function q.Evasion() u = 0;
t = 0;
if z:IsCastable() and g:BuffDown(z) and g:HealthPercentage() <= s.Commons.EvasionHP then if n.Cast(z, nil) then t = 5277; return "Cast Evasion (Defensives)" end end end end
do local A = j(3408)
local B = j(2823)
local C = j(315584)
local D = j(5761)
local E = j(8679)
local F = j(381637)
function q.Poisons() u = 0;
t = 0;
local G = g:AffectingCombat() and 180 or 900;
local H;
if j(8679):IsAvailable() and s.Commons.LethalPoison == "Wound Poison" then H = g:BuffRemains(j(8679)) if H < G and
    not g:IsCasting(j(8679)) then if n.Cast(j(8679)) then t = 203; return "Wound Poison Refresh" end end elseif j(2823):
    IsAvailable() and s.Commons.LethalPoison == "Deadly Poison" then H = g:BuffRemains(j(2823)) if H < G and
    not g:IsCasting(j(2823)) then if n.Cast(j(2823)) then t = 208; return "Deadly Poison Refresh" end end elseif j(315584)
    :IsAvailable() and s.Commons.LethalPoison == "Instant Poison" then H = g:BuffRemains(j(315584)) if H < G and
    not g:IsCasting(j(315584)) then if n.Cast(j(315584)) then t = 205; return "Instant Poison Refresh" end end end if j(381637)
    :IsAvailable() and s.Commons.NonLethalPoison == "Atrophic Poison" then H = g:BuffRemains(j(381637)) if H < G and
    not g:IsCasting(j(381637)) then if n.Cast(j(381637)) then t = 381637; return "Atropic Poison Refresh" end end elseif j(5761)
    :IsAvailable() and s.Commons.NonLethalPoison == "Numbing Poison" then H = g:BuffRemains(j(5761)) if H < G and
    not g:IsCasting(D) then if n.Cast(j(5761)) then t = 204; return "Numbing Poison Refresh" end end end end end
do local I = { Counter = 0, LastMH = 0, LastOH = 0 } function q.TimeToSht(J) if I.Counter >= J then return 0 end local K, L = UnitAttackSpeed("player")
local M = mathmax(I.LastMH + K, GetTime())
local N = mathmax(I.LastOH + L, GetTime())
local O = {}
for P = 0, 2 do tableinsert(O, M + P * K) tableinsert(O, N + P * L) end table.sort(O) local Q = p(5,
    mathmax(1, J - I.Counter)) return O[Q] - GetTime() end d:RegisterForSelfCombatEvent(function() I.Counter = 0;
I.LastMH = GetTime()
I.LastOH = GetTime()
end, "PLAYER_ENTERING_WORLD") d:RegisterForSelfCombatEvent(function(R, R, R, R, R, R, R, R, R, R, R, S) if S == 196911 then I
    .Counter = 0 end end, "SPELL_ENERGIZE") d:RegisterForSelfCombatEvent(function(R, R, R, R, R, R, R, R, R, R, R, R, R,
                                                                                  R, R, R, R, R, R, R, R, R, R, T) I.Counter = I
    .Counter + 1; if T then I.LastOH = GetTime() else I.LastMH = GetTime() end end, "SWING_DAMAGE") d:
    RegisterForSelfCombatEvent(function(R, R, R, R, R, R, R, R, R, R, R, R, R, R, R, T) if T then I.LastOH = GetTime() else I
        .LastMH = GetTime() end end, "SWING_MISSED") end
function q.MfDSniping(U) u = 0;
t = 0;
if U:IsCastable() and (g:AffectingCombat() or HeroRotationCharDB.Toggles[6]) then local V, W = nil, 60;
local X = i:IsInRange(30) and i:TimeToDie() or 11111;
for R, Y in pairs(g:GetEnemiesInRange(30)) do local Z = Y:TimeToDie() if not Y:IsMfDBlacklisted() and
    Z < g:ComboPointsDeficit() * 1.5 and Z < W then if X - Z > 1 then V, W = Y, Z else V, W = i, X end end end if V and
    V:GUID() ~= h:GUID() then n.CastLeftNameplate(V, U) if V:GUID() == f("mouseover"):GUID() and
    s.Subtlety.TargetSwap == "Mouseover" then u = 1117 elseif s.Subtlety.TargetSwap == "AutoSwap" and V:GUID() ~=
    h:GUID() and not r then u = 999 end end end end

function q.CanDoTUnit(Y, _) return o.CanDoTUnit(Y, _) end

do local a0 = j(193531)
local a1 = j(394321)
local a2 = j(394320)
function q.CPMaxSpend() return 5 + (a0:IsAvailable() and 1 or 0) + (a1:IsAvailable() and 1 or 0) +
    (a2:IsAvailable() and 1 or 0) end end
function q.CPSpend() return p(g:ComboPoints(), q.CPMaxSpend()) end

do function q.AnimachargedCP() if g:BuffUp(j.Rogue.Commons.EchoingReprimand2) then return 2 elseif g:BuffUp(j.Rogue.Commons
    .EchoingReprimand3) then return 3 elseif g:BuffUp(j.Rogue.Commons.EchoingReprimand4) then return 4 elseif g:BuffUp(j
    .Rogue.Commons.EchoingReprimand5) then return 5 end return -1 end function q.EffectiveComboPoints(a3) if a3 == 2 and
    g:BuffUp(j.Rogue.Commons.EchoingReprimand2) or a3 == 3 and g:BuffUp(j.Rogue.Commons.EchoingReprimand3) or
    a3 == 4 and g:BuffUp(j.Rogue.Commons.EchoingReprimand4) or a3 == 5 and g:BuffUp(j.Rogue.Commons.EchoingReprimand5) then return 7 end return a3 end end
do local a4 = j.Rogue.Assassination.DeadlyPoisonDebuff;
local a5 = j.Rogue.Assassination.WoundPoisonDebuff;
local a6 = j.Rogue.Assassination.AmplifyingPoisonDebuff;
local a7 = j.Rogue.Assassination.CripplingPoisonDebuff;
local a8 = j.Rogue.Assassination.AtrophicPoisonDebuff;
function q.Poisoned(Y) return (Y:DebuffUp(a4) or Y:DebuffUp(a6) or Y:DebuffUp(a7) or Y:DebuffUp(a5) or Y:DebuffUp(a8))
    and true or false end end
do local a9 = j.Rogue.Assassination.Garrote;
local aa = j.Rogue.Assassination.GarroteDeathmark;
local ab = j.Rogue.Assassination.Rupture;
local ac = j.Rogue.Assassination.RuptureDeathmark;
local ad = j.Rogue.Assassination.InternalBleeding;
local ae = 0;
function q.PoisonedBleeds() ae = 0; for R, Y in pairs(g:GetEnemiesInRange(50)) do if q.Poisoned(Y) then if Y:DebuffUp(a9) then ae = ae
    + 1; if Y:DebuffUp(aa) then ae = ae + 1 end end if Y:DebuffUp(ab) then ae = ae + 1; if Y:DebuffUp(ac) then ae = ae +
    1 end end if Y:DebuffUp(ad) then ae = ae + 1 end end end return ae end end
do local af, ag = j(340094), 4; function q.MasterAssassinsMarkRemains() if g:BuffRemains(af) < 0 then return g:
    GCDRemains() + ag else return g:BuffRemains(af) end end end
function q.ReturnSpell() if t == 0 then return 0 else return t end end

function q.ReturnSpellMO() if u == 0 then return 0 else return u end end
