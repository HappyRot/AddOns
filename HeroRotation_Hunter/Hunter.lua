local e, e = ...
local e = HeroDBC.DBC
local a = HeroLib
local e = HeroCache
local e = a.Unit
local t = e.Player
local t = e.Target
local e = e.Pet
local e = a.Spell
local o = a.MultiSpell
local t = a.Item
local a = a.Utils.MergeTableByKey
local i = HeroRotation
if not e.Hunter then
    e.Hunter = {  }
end

e.Hunter.Commons = { AncestralCall = e(274738), ArcanePulse = e(260364), ArcaneTorrent = e(50613), BagofTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), ArcaneShot = e(185358), AspectoftheTurtle = e(186265), Exhilaration = e(109304), Flare = e(1543), FreezingTrap = e(187650), HuntersMark = e(257284), DeathChakram = e(375891), FlayedShot = e(324149), FlayersMark = e(324156), Fleshcraft = e(324631), ResonatingArrow = e(308491), ResonatingArrowDebuff = e(308498), WildSpirits = e(328231), WildSpiritsDebuff = e(328275), Bite = e(17253, "pet"), BloodBolt = e(288962, "pet"), Claw = e(16827, "pet"), Growl = e(2649, "pet"), Smack = e(49966, "pet"), MendPet = e(136), RevivePet = e(982), SummonPet = e(883), SummonPet2 = e(83242), SummonPet3 = e(83243), SummonPet4 = e(83244), SummonPet5 = e(83245), AlphaPredator = e(269737), Barrage = e(120360), BeastMaster = e(378007), CounterShot = e(147362), DeathChakram = e(375891), ExplosiveShot = e(212431), HydrasBite = e(260241), Intimidation = e(19577), KillCommand = o(34026, 259489), KillShot = o(53351, 320976), KillerInstinct = e(273887), Muzzle = e(187707), PoisonInjection = e(378014), ScareBeast = e(1513), SerpentSting = e(271788), Stampede = e(201430), SteelTrap = e(162488), TarTrap = e(187698), WailingArrow = e(392060), BerserkingBuff = e(26297), BloodFuryBuff = e(20572), HuntersMarkDebuff = e(257284), LatentPoisonDebuff = e(336903), SerpentStingDebuff = e(271788), TarTrapDebuff = e(135299), PoolFocus = e(999910) }
e.Hunter.BeastMastery = a(e.Hunter.Commons, { BloodBolt = e(288962, "pet"), Bite = e(17253, "pet"), BloodBolt = e(288962, "pet"), Claw = e(16827, "pet"), Growl = e(2649, "pet"), Smack = e(49966, "pet"), AMurderofCrows = e(131894), AnimalCompanion = e(267116), AspectoftheWild = e(193530), BarbedShot = e(217200), BeastCleave = e(115939), BestialWrath = e(19574), Bloodshed = e(321530), CalloftheWild = e(359844), CobraShot = e(193455), DireBeast = e(120679), KillCleave = e(378207), MultiShot = e(2643), OneWithThePack = e(199528), ScentofBlood = e(193532), Stomp = e(199530), WildCall = e(185789), WildInstincts = e(378442), AspectoftheWildBuff = e(193530), BeastCleavePetBuff = e(118455, "pet"), BeastCleaveBuff = e(268877), BestialWrathBuff = e(19574), BestialWrathPetBuff = e(186254, "pet"), CalloftheWildBuff = e(359844), FrenzyPetBuff = e(272790, "pet"), BarbedShotDebuff = e(217200), Exhilaration = e(109304), Flare = e(1543), FreezingTrap = e(187650), HuntersMark = e(257284), Intimidation = e(19577), Misdirection = e(34477), TarTrap = e(187698), TranqualizingShot = e(19801), Bindingshot = e(109248), PoolFocus = e(999910) })
e.Hunter.Marksmanship = a(e.Hunter.Commons, { Bindingshot = e(109248), HuntersMark = e(257284), SteadyShot = e(56641), TarTrap = e(187698), Flare = e(1543), AimedShot = e(19434), BurstingShot = e(186387), CarefulAim = e(260228), ChimaeraShot = e(342049), DoubleTap = e(260402), MultiShot = e(257620), RapidFire = e(257044), Salvo = e(384791), SerpentstalkersTrickery = e(378888), SteadyFocus = e(193533), Streamline = e(260367), SurgingShots = e(391559), TrickShots = e(257621), Trueshot = e(288613), Volley = e(260243), BombardmentBuff = e(386875), BulletstormBuff = e(389020), DoubleTapBuff = e(260402), PreciseShotsBuff = e(260242), SteadyFocusBuff = e(193534), TrickShotsBuff = e(257622), TrueshotBuff = e(288613), VolleyBuff = e(260243), EagletalonsTrueFocusBuff = e(336851) })
e.Hunter.Survival = a(e.Hunter.Commons, { Flare = e(1543), Intimidation = e(19577), Misdirection = e(34477), TranqualizingShot = e(19801), Bindingshot = e(109248), PheromoneBomb = e(270323), ShrapnelBomb = e(270335), VolatileBomb = e(271045), WildfireBomb = e(259495), AMurderofCrows = e(131894), AspectoftheEagle = e(186289), Butchery = e(212436), BirdsofPrey = e(260331), Carve = e(187708), Chakrams = e(259391), CoordinatedAssault = e(360952), CoordinatedKill = e(385739), FlankingStrike = e(269751), FuryoftheEagle = e(203415), Harpoon = e(190925), MongooseBite = e(259387), Ranger = e(385695), RaptorStrike = e(259387), ResonatingArrow = e(308491), Spearhead = e(360966), TermsofEngagement = e(265895), TipoftheSpear = e(260285), VipersVenom = e(268501), WildfireInfusion = e(271014), BloodseekerBuff = e(260249), CoordinatedAssaultBuff = e(361738), DeadlyDuoBuff = e(397568), MongooseFuryBuff = e(259388), SpearheadBuff = e(360966), SteelTrapDebuff = e(162487), TipoftheSpearBuff = e(260286), MadBombardierBuff = o(364490, 363805), BloodseekerDebuff = e(259277), InternalBleedingDebuff = e(270343), PheromoneBombDebuff = e(270332), ShrapnelBombDebuff = e(270339), VolatileBombDebuff = e(271049), WildfireBombDebuff = e(269747), FreezingTrap = e(187650), SteelTrap = e(162488), SteelTrapDebuff = e(162487), TarTrap = e(187698), TarTrapDebuff = e(135299), PoolFocus = e(999910) })
if not t.Hunter then
    t.Hunter = {  }
end

t.Hunter.Commons = { PotionOfSpectralAgility = t(171270), Healthstone = t(5512), HealPot = t(171267), CosmicHealPot = t(187802), CacheofAcquiredTreasures = t(188265, { 13, 14 }), DreadfireVessel = t(184030, { 13, 14 }), MistcallerOcarina = t(178715, { 13, 14 }), Jotungeirr = t(186404) }
t.Hunter.BeastMastery = a(t.Hunter.Commons, {  })
t.Hunter.Marksmanship = a(t.Hunter.Commons, {  })
t.Hunter.Survival = a(t.Hunter.Commons, {  })

