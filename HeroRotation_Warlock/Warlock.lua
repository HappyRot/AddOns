local e, e = ...
local e = HeroDBC.DBC
local a = HeroLib
local e = HeroCache
local e = a.Unit
local t = e.Player
local t = e.Target
local e = e.Pet
local e = a.Spell
local t = a.MultiSpell
local t = a.Item
local a = a.Utils.MergeTableByKey
local o = HeroRotation
if not e.Warlock then
    e.Warlock = {  }
end

e.Warlock.Commons = { Berserking = e(26297), BloodFury = e(33702), Fireblood = e(265221), ShadowBolt = e(686), SummonDarkglare = e(205180), GrimoireofSacrifice = e(108503), GrimoireofSacrificeBuff = e(196099), SoulConduit = e(215941), DecimatingBolt = e(325289), DecimatingBoltBuff = e(325299), DoorofShadows = e(300728), Fleshcraft = e(324631), ImpendingCatastrophe = e(321792), ScouringTithe = e(312321), SoulRot = e(325640), CombatMeditation = e(328266), CorruptingLeer = e(339455), FieldofBlossoms = e(319191), ForgeborneReveries = e(326514), GroveInvigoration = e(322721), KevinsOozeling = e(352110), LeadByExample = e(342156), RefinedPalate = e(336243), VolatileSolvent = e(323074), VolatileSolventHumanBuff = e(323491), WildHuntTactics = e(325066), BalespidersBuff = e(337161), ImplosivePotentialBuff = e(337139), MaleficWrathBuff = e(337125), ShardofAnnihilationBuff = e(356342), ScarsofFraternalStrifeBuff4 = e(368638), Pool = e(999910) }
e.Warlock.Demonology = a(e.Warlock.Commons, { AxeToss = e(119914), CallDreadstalkers = e(104316), Demonbolt = e(264178), DemonicCoreBuff = e(264173), Felstorm = e(89751), HandofGuldan = e(105174), Implosion = e(196277), SpellLock = e(119910), SummonDemonicTyrant = e(265187), SummonPet = e(30146), UnendingResolve = e(104773), BilescourgeBombers = e(267211), DemonicCalling = e(205145), DemonicCallingBuff = e(205146), DemonicConsumption = e(267215), DemonicPowerBuff = e(265273), DemonicStrength = e(267171), Doom = e(603), DoomDebuff = e(603), FromtheShadows = e(267170), FromtheShadowsDebuff = e(270569), GrimoireFelguard = e(111898), InnerDemons = e(267216), NetherPortal = e(267217), NetherPortalBuff = e(267218), PowerSiphon = e(264130), SacrificedSouls = e(267214), SoulStrike = e(264057), SummonVilefiend = e(264119) })
e.Warlock.Affliction = a(e.Warlock.Commons, { Agony = e(980), AgonyDebuff = e(980), Corruption = e(172), CorruptionDebuff = e(146739), DrainLife = e(234153), MaleficRapture = e(324536), SeedofCorruption = e(27243), SeedofCorruptionDebuff = e(27243), SummonPet = e(688), UnstableAffliction = e(316099), UnstableAfflictionDebuff = e(316099), AbsoluteCorruption = e(196103), DarkSoulMisery = e(113860), DrainSoul = e(198590), Haunt = e(48181), HauntDebuff = e(48181), InevitableDemise = e(334319), InevitableDemiseBuff = e(334320), Nightfall = e(108558), PhantomSingularity = e(205179), PhantomSingularityDebuff = e(205179), ShadowEmbrace = e(32388), ShadowEmbraceDebuff = e(32390), SiphonLife = e(63106), SiphonLifeDebuff = e(63106), SowtheSeeds = e(196226), VileTaint = e(278350), VileTaintDebuff = e(278350), WritheinAgony = e(196102), CalamitousCrescendo = e(364322) })
e.Warlock.Destruction = a(e.Warlock.Commons, { Backdraft = e(117828), ChaosBolt = e(116858), Conflagrate = e(17962), Havoc = e(80240), Immolate = e(348), ImmolateDebuff = e(157736), Incinerate = e(29722), RainofFire = e(5740), Shadowfury = e(30283), SummonInfernal = e(1122), SummonImp = e(688), SummonVoidwalker = e(697), SummonFelhunter = e(691), SummonSuccubus = e(366222), DarkPact = e(108416), MortalCoil = e(6789), UnendingResolve = e(104773), Cataclysm = e(152108), ChannelDemonfire = e(196447), DarkSoulInstability = e(113858), Eradication = e(196412), EradicationDebuff = e(196414), FireandBrimstone = e(196408), Flashover = e(267115), Inferno = e(270545), InternalCombustion = e(266134), RainofChaos = e(266086), RainofChaosBuff = e(266087), ReverseEntropy = e(205148), RoaringBlaze = e(205184), RoaringBlazeDebuff = e(265931), Shadowburn = e(17877), SoulFire = e(6353), HealthFunnel = e(755), RitualofRuinBuff = e(364349) })
if not t.Warlock then
    t.Warlock = {  }
end

t.Warlock.Commons = { PotionofSpectralIntellect = t(307096), ArchitectsIngenuityCore = t(188268, { 13, 14 }), CosmicAspirantsBadgeofFerocity = t(186906, { 13, 14 }), CosmicGladiatorsBadgeofFerocity = t(186866, { 13, 14 }), CosmicGladiatorsResonator = t(188766, { 13, 14 }), DarkmoonDeckPutrescence = t(173069, { 13, 14 }), DreadfireVessel = t(184030, { 13, 14 }), EbonsoulVise = t(186431, { 13, 14 }), EmpyrealOrdnance = t(180117, { 13, 14 }), FigureheadoftheNaglfar = t(137329, { 13, 14 }), FlameofBattle = t(181501, { 13, 14 }), GlyphofAssimilation = t(184021, { 13, 14 }), GrimEclipse = t(188254, { 13, 14 }), HornofValor = t(133642, { 13, 14 }), InscrutableQuantumDevice = t(179350, { 13, 14 }), InstructorsDivineBell = t(184842, { 13, 14 }), MacabreSheetMusic = t(184024, { 13, 14 }), MoonlitPrism = t(137541, { 13, 14 }), MrrgriasFavor = t(142160, { 13, 14 }), ObeliskoftheVoid = t(137433, { 13, 14 }), OverflowingAnimaCage = t(178849, { 13, 14 }), ResonantReservoir = t(188272, { 13, 14 }), ScarsofFraternalStrife = t(188253, { 13, 14 }), ShadowedOrbofTorment = t(186428, { 13, 14 }), SinfulAspirantsBadgeofFerocity = t(175884, { 13, 14 }), SinfulAspirantsEmblem = t(178334, { 13, 14 }), SinfulGladiatorsBadgeofFerocity = t(175921, { 13, 14 }), SinfulGladiatorsEmblem = t(178447, { 13, 14 }), SoleahsSecretTechnique = t(185818, { 13, 14 }), SoulIgniter = t(184019, { 13, 14 }), SoullettingRuby = t(178809, { 13, 14 }), SunbloodAmethyst = t(178826, { 13, 14 }), TabletofDespair = t(181357, { 13, 14 }), TheFirstSigil = t(188271, { 13, 14 }), ToeKneesPromise = t(142164, { 13, 14 }), TomeofMonstrousConstructions = t(186422, { 13, 14 }), UnchainedGladiatorsShackles = t(186980, { 13, 14 }), WakenersFrond = t(181457, { 13, 14 }) }
t.Warlock.Affliction = a(t.Warlock.Commons, {  })
t.Warlock.Demonology = a(t.Warlock.Commons, {  })
t.Warlock.Destruction = a(t.Warlock.Commons, { Healthstone = t(5512), HealPot = t(171267), PhialofSerenity = t(177278), CosmicHealPot = t(187802) })

