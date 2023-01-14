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
local m = d.Utils.MergeTableByKey;
local n = HeroRotation;
if not j.Druid then j.Druid = {} end
j.Druid.Commons = { Berserking = j(26297), Shadowmeld = j(58984), Barkskin = j(22812), BearForm = j(5487), CatForm = j(768),
    EntanglingRoots = j(339), FerociousBite = j(22568), MarkoftheWild = j(1126), Moonfire = j(8921), Prowl = j(5215),
    Rebirth = j(20484), Shred = j(5221), Soothe = j(2908), TravelForm = j(783), ConvoketheSpirits = j(391528),
    FrenziedRegeneration = j(22842), HeartoftheWild = j(319454), Innervate = j(29166), Ironfur = j(192081), Maim = j(22570),
    MightyBash = j(5211), MoonkinForm = k(24858, 197625), Rake = j(1822), Rip = j(1079), SkullBash = j(106839),
    Starfire = j(194153), Starsurge = k(78674, 197626), Sunfire = j(93402), SurvivalInstincts = j(61336),
    Swipe = k(213764, 213771), Thrash = k(77758, 106830), WildCharge = k(16979, 49376), FrenziedRegenerationBuff = j(22842),
    HeartoftheWildBuff = j(319454), IronfurBuff = j(192081), MoonfireDebuff = j(164812), RakeDebuff = j(155722),
    RipDebuff = j(1079), SunfireDebuff = j(164815), ThrashDebuff = k(106830, 192090), AdaptiveSwarmCov = j(325727),
    AdaptiveSwarmCovDebuff = j(325733), AdaptiveSwarmCovHeal = j(325748), AstralCommunion = j(202359),
    ConvoketheSpiritsCov = j(323764), EmpowerBond = j(326647), Fleshcraft = j(324631), KindredSpirits = j(326434),
    KindredEmpowermentEnergizeBuff = j(327022), RavenousFrenzy = j(323546), RavenousFrenzyBuff = j(323546),
    RavenousFrenzySHBuff = j(355315), ThrillSeeker = j(331586), ThrillSeekerBuff = j(331939), DeepAllegiance = j(341378),
    PreciseAlignment = j(340706), PustuleEruption = j(351094), SavageCombatant = j(340609), SavageCombatantBuff = j(340613),
    SuddenAmbushBuff = j(340698), TasteForBlood = j(340682), VolatileSolvent = j(323074),
    OathoftheElderDruidBuff = j(338643), AcquiredAxeBuff = j(368656), AcquiredSwordBuff = j(368657),
    AcquiredWandBuff = j(368654), ScarsofFraternalStrifeBuff4 = j(368638), TormentedInsightBuff = j(355321),
    Pool = j(999910) }
j.Druid.Balance = m(j.Druid.Commons,
    { EclipseLunar = j(48518), EclipseSolar = j(48517), Wrath = j(190984), AetherialKindling = j(327541),
        BalanceofAllThings = j(394048), CelestialAlignment = j(383410), ElunesGuidance = j(393991),
        ForceofNature = j(205636), FungalGrowth = j(392999), FuryofElune = j(202770), Incarnation = j(390414),
        IncarnationTalent = j(394013), NaturesBalance = j(202430), OrbitBreaker = j(383197), OrbitalStrike = j(390378),
        PowerofGoldrinn = j(394046), PrimordialArcanicPulsar = j(393960), RattletheStars = j(393954), Solstice = j(343647),
        SouloftheForest = j(114107), Starfall = j(191034), Starlord = j(202345), Starweaver = j(393940),
        StellarFlare = j(202347), TwinMoons = j(279620), UmbralEmbrace = j(393760), WaningTwilight = j(393956),
        WarriorofElune = j(202425), WildMushroom = j(88747), FullMoon = j(274283), HalfMoon = j(274282),
        NewMoon = j(274281), BOATArcaneBuff = j(394050), BOATNatureBuff = j(394049), CABuff = j(383410),
        IncarnationBuff = j(390414), PAPBuff = j(393961), RattledStarsBuff = j(393955), SolsticeBuff = j(343648),
        StarfallBuff = j(191034), StarlordBuff = j(279709), StarweaversWarp = j(393942), StarweaversWeft = j(393944),
        UmbralEmbraceBuff = j(393763), WarriorofEluneBuff = j(202425), FungalGrowthDebuff = j(81281),
        StellarFlareDebuff = j(202347), GatheringStarstuff = j(394412), TouchtheCosmos = j(394414),
        BOATArcaneLegBuff = j(339946), BOATNatureLegBuff = j(339943), OnethsClearVisionBuff = j(339797),
        OnethsPerceptionBuff = j(339800), TimewornDreambinderBuff = j(340049) })
j.Druid.Feral = m(j.Druid.Commons,
    { AdaptiveSwarm = j(391888), ApexPredatorsCraving = j(391881), Berserk = j(106951), Bloodtalons = j(319439),
        BrutalSlash = j(202028), FeralFrenzy = j(274837), Incarnation = j(102543), LunarInspiration = j(155580),
        LIMoonfire = j(155625), Predator = j(202021), PrimalWrath = j(285381), RipandTear = j(391347),
        Sabertooth = j(202031), SouloftheForest = j(158476), TearOpenWounds = j(391785), TigersFury = j(5217),
        ApexPredatorsCravingBuff = j(391882), BloodtalonsBuff = j(145152), Clearcasting = j(135700),
        AdaptiveSwarmDebuff = j(391889), AdaptiveSwarmHeal = j(391891), LIMoonfireDebuff = j(155625) })
j.Druid.Guardian = m(j.Druid.Commons,
    { Mangle = j(33917), EclipseLunar = j(48518), EclipseSolar = j(48517), Growl = j(6795), RemoveCorruption = j(2782),
        Wrath = j(190984), BalanceAffinity = j(197488), Berserk = j(50334), Brambles = j(203953), BristlingFur = j(155835),
        Maul = j(6807), Incarnation = j(102558), IncapacitatingRoar = j(99), MightyBash = j(5211), Pulverize = j(80313),
        RageoftheSleeper = j(200851), RestorationAffinity = j(197492), Renewal = j(108238), SouloftheForest = j(158477),
        StampedingRoar = j(106898), Typhoon = j(132469), UrsolsVortex = j(102793), ViciousCycle = j(371999),
        IncarnationGuardianOfUrsoc = j(394786), BerserkBuff = j(50334), GalacticGuardianBuff = j(213708),
        GoreBuff = j(93622), IncarnationBuff = j(102558), ToothandClawBuff = j(135286), ViciousCycleMaulBuff = j(372015),
        ViciousCycleMangleBuff = j(372019), ToothandClawDebuff = j(135601) })
j.Druid.Restoration = m(j.Druid.Commons,
    { EclipseLunar = j(48518), EclipseSolar = j(48517), Starfire = j(197628), Starsurge = j(197626), Sunfire = j(93402),
        SunfireDebuff = j(164815), Swipe = j(106785), Wrath = j(5176), BalanceAffinity = j(197632),
        FeralAffinity = j(197490) })
if not l.Druid then l.Druid = {} end
l.Druid.Commons = { PotionofPhantomFire = l(171349), PotionofSpectralAgility = l(171270),
    PotionofSpectralIntellect = l(171273), CacheofAcquiredTreasures = l(188265, { 13, 14 }),
    EmpyrealOrdinance = l(180117, { 13, 14 }), InscrutableQuantumDevice = l(179350, { 13, 14 }),
    InstructorsDivineBell = l(184842, { 13, 14 }), ScarsofFraternalStrife = l(188253, { 13, 14 }),
    ShadowedOrbofTorment = l(186428, { 13, 14 }), SoullettingRuby = l(178809, { 13, 14 }),
    TheFirstSigil = l(188271, { 13, 14 }), GaveloftheFirstArbiter = l(189862), Jotungeirr = l(186404),
    RingofCollapsingFutures = l(142173), WrapsofElectrostaticPotential = l(169069) }
l.Druid.Balance = m(l.Druid.Commons, {})
l.Druid.Feral = m(l.Druid.Commons, {})
l.Druid.Guardian = m(l.Druid.Commons,
    { PotionofPhantomFire = l(171349), Jotungeirr = l(186404), Healthstone = l(5512), HealPot = l(171267),
        CosmicHealPot = l(187802), PhialofSerenity = l(177278) })
l.Druid.Restoration = m(l.Druid.Commons, {})
