local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=d.Utils.MergeTableByKey;local n=HeroRotation;if not j.Hunter then j.Hunter={}end;j.Hunter.Commons={AncestralCall=j(274738),ArcanePulse=j(260364),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),ArcaneShot=j(185358),AspectoftheTurtle=j(186265),Exhilaration=j(109304),Flare=j(1543),FreezingTrap=j(187650),HuntersMark=j(257284),DeathChakram=j(375891),FlayedShot=j(324149),FlayersMark=j(324156),Fleshcraft=j(324631),ResonatingArrow=j(308491),ResonatingArrowDebuff=j(308498),WildSpirits=j(328231),WildSpiritsDebuff=j(328275),Bite=j(17253,"pet"),BloodBolt=j(288962,"pet"),Claw=j(16827,"pet"),Growl=j(2649,"pet"),Smack=j(49966,"pet"),MendPet=j(136),RevivePet=j(982),SummonPet=j(883),SummonPet2=j(83242),SummonPet3=j(83243),SummonPet4=j(83244),SummonPet5=j(83245),AlphaPredator=j(269737),Barrage=j(120360),BeastMaster=j(378007),CounterShot=j(147362),DeathChakram=j(375891),Savagery=j(424557),ExplosiveShot=j(212431),HydrasBite=j(260241),Intimidation=j(19577),KillCommand=k(34026,259489),KillShot=k(53351,320976),KillerInstinct=j(273887),Muzzle=j(187707),PoisonInjection=j(378014),ScareBeast=j(1513),SerpentSting=j(271788),Stampede=j(201430),SteelTrap=j(162488),TarTrap=j(187698),WailingArrow=j(392060),BerserkingBuff=j(26297),BloodFuryBuff=j(20572),HuntersMarkDebuff=j(257284),LatentPoisonDebuff=j(336903),SerpentStingDebuff=j(271788),TarTrapDebuff=j(135299),VipersVenomBuff=j(2685010),PoolFocus=j(999910)}j.Hunter.BeastMastery=m(j.Hunter.Commons,{Bite=j(17253,"pet"),BloodBolt=j(288962,"pet"),Claw=j(16827,"pet"),Growl=j(2649,"pet"),Smack=j(49966,"pet"),AMurderofCrows=j(131894),AnimalCompanion=j(267116),AspectoftheWild=j(193530),BarbedShot=j(217200),BeastCleave=j(115939),BestialWrath=j(19574),Bloodshed=j(321530),CalloftheWild=j(359844),BloodyFrenzy=j(407412),CobraShot=j(193455),DireBeast=j(120679),KillCleave=j(378207),MultiShot=j(2643),OneWithThePack=j(199528),ScentofBlood=j(193532),Stomp=j(199530),WildCall=j(185789),WildInstincts=j(378442),AspectoftheWildBuff=j(193530),BeastCleavePetBuff=j(118455,"pet"),BeastCleaveBuff=j(268877),BestialWrathBuff=j(19574),BestialWrathPetBuff=j(186254,"pet"),CalloftheWildBuff=j(359844),FrenzyPetBuff=j(272790,"pet"),BarbedShotDebuff=j(217200),Exhilaration=j(109304),Flare=j(1543),FreezingTrap=j(187650),HuntersMark=j(257284),Intimidation=j(19577),Misdirection=j(34477),TarTrap=j(187698),TranqualizingShot=j(19801),Bindingshot=j(109248),PoolFocus=j(999910)})j.Hunter.Marksmanship=m(j.Hunter.Commons,{Bindingshot=j(109248),HuntersMark=j(257284),SteadyShot=j(56641),TarTrap=j(187698),Flare=j(1543),AimedShot=j(19434),BurstingShot=j(186387),CarefulAim=j(260228),ChimaeraShot=j(342049),DoubleTap=j(260402),MultiShot=j(257620),RapidFire=j(257044),Salvo=j(384791),SerpentstalkersTrickery=j(378888),SteadyFocus=j(193533),Streamline=j(260367),SurgingShots=j(391559),TrickShots=j(257621),Trueshot=j(288613),Volley=j(260243),LoneWolf=j(155228),BombardmentBuff=j(386875),BulletstormBuff=j(389020),DoubleTapBuff=j(260402),PreciseShotsBuff=j(260242),RazorFragmentsBuff=j(388998),SteadyFocusBuff=j(193534),TrickShotsBuff=j(257622),TrueshotBuff=j(288613),VolleyBuff=j(260243),SteadyShot=j(56641),AimedShot=j(19434),BurstingShot=j(186387),CarefulAim=j(260228),ChimaeraShot=j(342049),DoubleTap=j(260402),InTheRhythm=j(407404),LegacyoftheWindrunners=j(406425),LoneWolf=j(155228),MultiShot=j(257620),RapidFire=j(257044),Salvo=j(400456),SerpentstalkersTrickery=j(378888),SteadyFocus=j(193533),Streamline=j(260367),SurgingShots=j(391559),TrickShots=j(257621),Trueshot=j(288613),Volley=j(260243),WindrunnersGuidance=j(378905),BombardmentBuff=j(386875),BulletstormBuff=j(389020),DoubleTapBuff=j(260402),InTheRhythmBuff=j(407405),LockandLoadBuff=j(194594),PreciseShotsBuff=j(260242),RazorFragmentsBuff=j(388998),SalvoBuff=j(400456),SteadyFocusBuff=j(193534),TrickShotsBuff=j(257622),TrueshotBuff=j(288613),VolleyBuff=j(260243),EagletalonsTrueFocusBuff=j(336851),EagletalonsTrueFocusBuff=j(336851)})j.Hunter.Survival=m(j.Hunter.Commons,{Flare=j(1543),Intimidation=j(19577),Misdirection=j(34477),TranqualizingShot=j(19801),Bindingshot=j(109248),PheromoneBomb=j(270323),ShrapnelBomb=j(270335),VolatileBomb=j(271045),WildfireBomb=j(259495),AMurderofCrows=j(131894),AspectoftheEagle=j(186289),Butchery=j(212436),BirdsofPrey=j(260331),Carve=j(187708),Chakrams=j(259391),CoordinatedAssault=j(360952),CoordinatedKill=j(385739),FlankingStrike=j(269751),FuryoftheEagle=j(203415),Harpoon=j(190925),MongooseBite=j(259387),Ranger=j(385695),RaptorStrike=j(259387),ResonatingArrow=j(308491),Spearhead=j(360966),TermsofEngagement=j(265895),TipoftheSpear=j(260285),VipersVenom=j(268501),WildfireInfusion=j(271014),BloodseekerBuff=j(260249),CoordinatedAssaultBuff=j(361738),DeadlyDuoBuff=j(397568),MongooseFuryBuff=j(259388),SpearheadBuff=j(360966),SteelTrapDebuff=j(162487),TipoftheSpearBuff=j(260286),MadBombardierBuff=k(364490,363805),NessingwarysTrappingBuff=j(336743),BloodseekerDebuff=j(259277),InternalBleedingDebuff=j(270343),PheromoneBombDebuff=j(270332),ShrapnelBombDebuff=j(270339),VolatileBombDebuff=j(271049),WildfireBombDebuff=j(269747),FreezingTrap=j(187650),SteelTrap=j(162488),SteelTrapDebuff=j(162487),TarTrap=j(187698),TarTrapDebuff=j(135299),PoolFocus=j(999910)})if not l.Hunter then l.Hunter={}end;l.Hunter.Commons={PotionOfSpectralAgility=l(171270),Healthstone=l(5512),HealPot=l(171267),CosmicHealPot=l(187802),CacheofAcquiredTreasures=l(188265,{13,14}),DreadfireVessel=l(184030,{13,14}),MistcallerOcarina=l(178715,{13,14}),Jotungeirr=l(186404)}l.Hunter.BeastMastery=m(l.Hunter.Commons,{})l.Hunter.Marksmanship=m(l.Hunter.Commons,{})l.Hunter.Survival=m(l.Hunter.Commons,{})