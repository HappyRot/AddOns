local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=HeroRotation;if not j.Monk then j.Monk={}end;j.Monk.Windwalker={AncestralCall=j(274738),ArcaneTorrent=j(25046),BagOfTricks=j(312411),Berserking=j(26297),BloodFury=j(33697),Bloodlust=j(2825),GiftoftheNaaru=j(59547),Fireblood=j(265221),LightsJudgment=j(255647),QuakingPalm=j(107079),Shadowmeld=j(58984),BlackoutKick=j(100784),BlackoutKickBuff=j(116768),CracklingJadeLightning=j(117952),ExpelHarm=j(322101),FistsOfFury=j(113656),FlyingSerpentKick=j(101545),FlyingSerpentKickActionBarReplacement=j(115057),InvokeXuenTheWhiteTiger=j(123904),RisingSunKick=j(107428),SpinningCraneKick=j(101546),StormEarthAndFire=j(137639),StormEarthAndFireBuff=j(137639),StormEarthAndFireFixate=j(221771),TigerPalm=j(100780),TouchOfDeath=j(322109),MarkOfTheCraneDebuff=j(228287),Celerity=j(115173),ChiWave=j(115098),ChiBurst=j(123986),DanceOfChijiBuff=j(325202),EyeOfTheTiger=j(196607),FistOfTheWhiteTiger=j(261947),GoodKarma=j(280195),HitCombo=j(196740),HitComboBuff=j(196741),InnerStrengthBuff=j(261769),RushingJadeWind=j(116847),RushingJadeWindBuff=j(116847),WhirlingDragonPunch=j(152175),WhirlingDragonPunchBuff=j(196742),Serenity=j(152173),SerenityBuff=j(152173),SpiritualFocus=j(280197),DampenHarm=j(122278),DampenHarmBuff=j(122278),DiffuseMagic=j(122783),FortifyingBrew=j(243435),HealingElixir=j(122281),TouchOfKarma=j(122470),ChiTorpedo=j(115008),Detox=j(218164),Disable=j(116095),EnergizingElixir=j(115288),LegSweep=j(119381),Paralysis=j(115078),Provoke=j(115546),Resuscitate=j(115178),RingOfPeace=j(116844),Roll=j(109132),SpearHandStrike=j(116705),TigersLust=j(116841),TigerTailSweep=j(264348),Transcendence=j(101643),TranscendenceTransfer=j(119996),Vivify=j(116670),AcquiredAxeBuff=j(368656),AcquiredWandBuff=j(368654),BonedustBrew=j(325216),FaelineStomp=j(327104),FaelineStompBuff=j(347480),FaelineStompDebuff=j(327257),FallenOrder=j(326860),Fleshcraft=j(324631),WeaponsOfOrder=j(310454),WeaponsOfOrderChiBuff=j(311054),WeaponsOfOrderDebuff=j(312106),FortifyingIngrediencesBuff=j(336874),GroveInvigoration=j(322721),PustuleEruption=j(351094),VolatileSolvent=j(323074),ChiEnergyBuff=j(337571),InvokersDelight=j(338321),InvokersDelightBuff=j(338321),KeefersSkyreachDebuff=j(344021),RecentlyRushingTigerPalm=j(337341),SkyreachExhaustion=j(337341),TheEmperorsCapacitor=j(337291),InnerFury=j(336452),CalculatedStrikes=j(336526),CoordinatedOffensive=j(336598),InnerFury=j(336452),PrimordialPotentialBuff=j(363911),PrimordialPowerBuff=j(368685),PoolEnergy=j(999910)}j.Monk.Brewmaster={AncestralCall=j(274738),ArcaneTorrent=j(50613),BagOfTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),BlackoutKick=j(205523),BreathOfFire=j(115181),Clash=j(324312),CracklingJadeLightning=j(117952),ExpelHarm=j(322101),InvokeNiuzaoTheBlackOx=j(132578),KegSmash=j(121253),SpinningCraneKick=j(322729),TigerPalm=j(100780),TouchOfDeath=j(322109),BreathOfFireDotDebuff=j(123725),BlackoutCombo=j(196736),BlackoutComboBuff=j(228563),BlackOxBrew=j(115399),BobAndWeave=j(280515),Celerity=j(115173),CelestialFlames=j(325177),ChiBurst=j(123986),ChiWave=j(115098),EyeOfTheTiger=j(196607),ExplodingKeg=j(214326),LightBrewing=j(325093),RushingJadeWind=j(116847),SpecialDelivery=j(196730),Spitfire=j(242580),SummonBlackOxStatue=j(115315),CelestialBrew=j(322507),DampenHarm=j(122278),DampenHarmBuff=j(122278),ElusiveBrawlerBuff=j(195630),FortifyingBrew=j(115203),FortifyingBrewBuff=j(115203),HighTolerance=j(196737),PurifyingBrew=j(119582),PurifiedChiBuff=j(325092),Shuffle=j(215479),ChiTorpedo=j(115008),Detox=j(218164),Disable=j(116095),LegSweep=j(119381),Paralysis=j(115078),Provoke=j(115546),Resuscitate=j(115178),RingOfPeace=j(116844),Roll=j(109132),SpearHandStrike=j(116705),TigersLust=j(116841),TigerTailSweep=j(264348),Transcendence=j(101643),TranscendenceTransfer=j(119996),Vivify=j(116670),WeaponsOfOrder=j(310454),WeaponsOfOrderDebuff=j(312106),BonedustBrew=j(325216),FaelineStomp=j(327104),FaelineStompBuff=j(347480),FaelineStompDebuff=j(327257),FallenOrder=j(326860),CharredPassions=j(338140),InvokersDelight=j(338321),KeefersSkyreach=j(344021),MightyPour=j(337994),RecentlyRushingTigerPalm=j(337341),HeavyStagger=j(124273),ModerateStagger=j(124274),LightStagger=j(124275),PoolEnergy=j(999910)}j.Monk.Mistweaver={AncestralCall=j(274738),ArcaneTorrent=j(25046),BagOfTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Bloodlust=j(2825),GiftoftheNaaru=j(59547),Fireblood=j(265221),LightsJudgment=j(255647),QuakingPalm=j(107079),Shadowmeld=j(58984),BlackoutKick=j(100784),CracklingJadeLightning=j(117952),EnvelopingMist=j(124682),EssenceFont=j(191837),EssenceFontBuff=j(191840),ExpelHarm=j(322101),InvokeYulonTheJadeSerpent=j(123904),LifeCocoon=j(116849),RenewingMist=j(115151),Revival=j(115310),RisingSunKick=j(107428),SoothingMist=j(115175),SpinningCraneKick=j(101546),TeachingsOfTheMonasteryBuff=j(202090),ThunderFocusTea=j(116680),TigerPalm=j(100780),TouchOfDeath=j(322109),Celerity=j(115173),ChiWave=j(115098),ChiBurst=j(123986),EyeOfTheTiger=j(196607),GoodKarma=j(280195),InnerStrengthBuff=j(261769),InvokeChiJiTheRedCrane=j(325197),LifecyclesEnvelopingMistBuff=j(197919),LifecyclesVivifyBuff=j(197916),ManaTea=j(197908),RefreshingJadeWind=j(196725),SummonJadeSerpentStatue=j(115313),DampenHarm=j(122278),DampenHarmBuff=j(122278),DiffuseMagic=j(122783),FortifyingBrew=j(243435),HealingElixir=j(122281),ChiTorpedo=j(115008),Detox=j(218164),Disable=j(116095),EnergizingElixir=j(115288),LegSweep=j(119381),Paralysis=j(115078),Provoke=j(115546),Reawaken=j(212051),Resuscitate=j(115178),RingOfPeace=j(116844),Roll=j(109132),SongOfChiJi=j(198898),SpearHandStrike=j(116705),TigersLust=j(116841),TigerTailSweep=j(264348),Transcendence=j(101643),TranscendenceTransfer=j(119996),Vivify=j(116670),WeaponsOfOrder=j(310454),WeaponsOfOrderChiBuff=j(311054),WeaponsOfOrderDebuff=j(312106),BonedustBrew=j(325216),FaelineStomp=j(327104),FaelineStompDebuff=j(327257),FallenOrder=j(326860),FortifyingIngrediencesBuff=j(336874),ChiEnergyBuff=j(337571),InvokersDelight=j(338321),KeefersSkyreachDebuff=j(344021),RecentlyRushingTigerPalm=j(337341),TheEmperorsCapacitor=j(337291),PoolEnergy=j(999910)}if not l.Monk then l.Monk={}end;l.Monk.Windwalker={PotionofPhantomFire=l(171349),PotionofSpectralAgility=l(171270),PotionofDeathlyFixation=l(171351),PotionofEmpoweredExorcisms=l(171352),PotionofHardenedShadows=l(171271),PotionofSpectralStamina=l(171274),Jotungeirr=l(186404),CacheofAcquiredTreasures=l(188265,{13,14}),GladiatorsBadgeCosmic=l(186866,{13,14}),GladiatorsBadgeSinful=l(175921,{13,14}),GladiatorsBadgeUnchained=l(185197,{13,14}),InscrutibleQuantumDevice=l(179350,{13,14}),OverchargedAnimaBattery=l(180116,{13,14}),ShadowgraspTotem=l(179356,{13,14}),TheFirstSigil=l(188271,{13,14}),Wrathstone=l(156000,{13,14}),Healthstone=l(5512),HealPot=l(171267),PhialofSerenity=l(177278)}l.Monk.Brewmaster={PotionofPhantomFire=l(171349),PotionofSpectralAgility=l(171270),PotionofDeathlyFixation=l(171351),PotionofEmpoweredExorcisms=l(171352),PotionofHardenedShadows=l(171271),PotionofSpectralStamina=l(171274)}l.Monk.Mistweaver={PotionofPhantomFire=l(171349),PotionofSpectralIntellect=l(171273),PotionofDeathlyFixation=l(171351),PotionofEmpoweredExorcisms=l(171352),PotionofHardenedShadows=l(171271),PotionofSpectralStamina=l(171274)}