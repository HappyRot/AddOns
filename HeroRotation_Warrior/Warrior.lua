local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=HeroRotation;if not j.Warrior then j.Warrior={}end;j.Warrior.Fury={AncestralCall=j(274738),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),Bladestorm=j(46924),BattleShout=j(6673),Charge=j(100),HeroicThrow=j(57755),Pummel=j(6552),Slam=j(1464),VictoryRush=j(34428),DefensiveStance=j(386208),Avatar=j(107574),BerserkerRage=j(18499),BerserkersTorment=j(390123),BloodandThunder=j(384277),DoubleTime=j(103827),CrushingForce=j(382764),FrothingBerserker=j(215571),ImmovableObject=j(394307),IntimidatingShout=j(5246),HeroicLeap=j(6544),ImpendingVictory=j(202168),OverwhelmingRage=j(382767),RallyingCry=j(97462),RumblingEarth=j(275339),Shockwave=j(46968),SonicBoom=j(390725),SpearofBastion=j(376079),SpellReflection=j(23920),StormBolt=j(107570),ThunderousRoar=j(384318),TitanicThrow=j(384090),WreckingThrow=j(384110),AvatarBuff=j(107574),BattleShoutBuff=j(6673),SpearofBastionDebuff=j(376080),AncientAftershock=j(325886),Condemn=k(330325,330334,317485,317349),CondemnDebuff=j(317491),ConquerorsBanner=j(324143),ConquerorsFrenzyBuff=j(343672),ElysianMightBuff=j(311193),Fleshcraft=j(324631),SpearofBastionCov=j(307865),SpearofBastionCovBuff=j(307871),MercilessBonegrinder=j(335260),MercilessBonegrinderBuff=j(346574),Pool=j(999910),Whirlwindbuff=j(85739),EnragedRegeneration=j(184364),IgnorePain=j(190456),Cruelty=j(392931),Massacre=j(206315),Siegebreaker=j(280772),ImprovedWhirlwind=j(12950),SiegebreakerDebuff=j(280773),ViciousContempt=j(337302),WilloftheBerserkerBuff=j(335594),BerserkerStance=j(386196),Bloodbath=j(335096),CrushingBlow=j(335097),Execute=k(5308,280735),Whirlwind=j(190411),AngerManagement=j(152278),Annihilator=j(383916),AshenJuggernaut=j(392536),Bloodthirst=j(23881),ColdSteelHotBlood=j(383959),DancingBlades=j(391683),Frenzy=j(335077),ImprovedWhilwind=j(12950),Massacre=j(206315),MeatCleaver=j(280392),OdynsFury=j(385059),Onslaught=j(315720),RagingBlow=j(85288),Rampage=j(184367),Ravager=j(228920),RecklessAbandon=j(396749),Recklessness=j(1719),StormofSwords=j(388903),SuddenDeath=j(280721),Tenderize=j(388933),TitanicRage=j(394329),TitansTorment=j(390135),WrathandFury=j(392936),AshenJuggernautBuff=j(392537),BloodcrazeBuff=j(393951),DancingBladesBuff=j(391688),EnrageBuff=j(184362),FrenzyBuff=j(335082),FuriousBloodthirstBuff=j(423211),MeatCleaverBuff=j(85739),MercilessAssaultBuff=j(409983),RecklessnessBuff=j(1719),SuddenDeathBuff=j(280776),MarkofFyralathDebuff=j(414532),Pool=j(999910)}j.Warrior.Arms={HeroicThrow=j(57755),Bloodletting=j(383154),Pummel=j(6552),Slam=j(1464),VictoryRush=j(34428),DefensiveStance=j(386208),Avatar=j(107574),BerserkerRage=j(18499),BerserkersTorment=j(390123),BloodandThunder=j(384277),DoubleTime=j(103827),CrushingForce=j(382764),FrothingBerserker=j(215571),ImmovableObject=j(394307),IntimidatingShout=j(5246),HeroicLeap=j(6544),ImpendingVictory=j(202168),OverwhelmingRage=j(382767),RallyingCry=j(97462),RumblingEarth=j(275339),Shockwave=j(46968),SonicBoom=j(390725),SpearofBastion=j(376079),SpellReflection=j(23920),StormBolt=j(107570),ThunderClap=k(6343,396719),ThunderousRoar=j(384318),TitanicThrow=j(384090),WreckingThrow=j(384110),AvatarBuff=j(107574),BattleShoutBuff=j(6673),WarMachineBuff=j(262232),AncestralCall=j(274738),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),Charge=j(100),BattleShout=j(6673),BattleStance=j(386164),Execute=k(163201,281000),Whirlwind=j(1680),AngerManagement=j(152278),Battlelord=j(386630),BlademastersTorment=j(390138),Bladestorm=j(389774),Bloodletting=j(383154),Cleave=j(845),ColossusSmash=j(167105),Dreadnaught=j(262150),ExecutionersPrecision=j(386634),FervorofBattle=j(202316),Hurricane=j(390563),IgnorePain=j(190456),ImprovedSlam=j(400205),Juggernaut=j(383292),Massacre=j(281001),MercilessBonegrinder=j(383317),MortalStrike=j(12294),Overpower=j(7384),Rend=j(772),Skullsplitter=j(260643),StormofSwords=j(385512),SuddenDeath=j(29725),SweepingStrikes=j(260708),TestofMight=j(385008),TideofBlood=j(386357),Unhinged=j(386628),Warbreaker=j(262161),WarlordsTorment=j(390140),BattlelordBuff=j(386631),CrushingAdvanceBuff=j(410138),HurricaneBuff=j(390581),JuggernautBuff=j(383292),MartialProwessBuff=j(7384),MercilessBonegrinderBuff=j(383316),SuddenDeathBuff=j(52437),SweepingStrikesBuff=j(260708),TestofMightBuff=j(385013),ColossusSmashDebuff=j(208086),DeepWoundsDebuff=j(262115),ExecutionersPrecisionDebuff=j(386633),RendDebuff=j(388539),Pool=j(999910)}j.Warrior.Protection={AncestralCall=j(274738),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),Avatar=j(107574),AvatarBuff=j(107574),Charge=j(100),DemoralizingShout=j(1160),Devastate=j(20243),Execute=j(163201),IgnorePain=j(190456),IntimidatingShout=j(5246),LastStand=j(12975),LastStandBuff=j(12975),Pummel=j(6552),Revenge=j(6572),RevengeBuff=j(5302),ShieldBlock=j(2565),ShieldBlockBuff=j(132404),ShieldSlam=j(23922),ThunderClap=j(6343),VictoryRush=j(34428),BoomingVoice=j(202743),DragonRoar=j(118000),ImpendingVictory=j(202168),Ravager=j(228920),StormBolt=j(107570),UnstoppableForce=j(275336),AncientAftershock=j(325886),Condemn=j(317349),CondemnDebuff=j(317491),ConquerorsBanner=j(324143),ConquerorsFrenzyBuff=j(343672),SpearofBastion=j(307865),SpearofBastionBuff=j(307871),Pool=j(999910)}if not l.Warrior then l.Warrior={}end;l.Warrior.Fury={PotionofSpectralStrength=l(171275),Healthstone=l(5512),CosmicHealPot=l(187802),HealPot=l(191380),DDVoracity=l(173087,{13,14}),FlameofBattle=l(181501,{13,14}),GrimCodex=l(178811,{13,14}),InscrutableQuantumDevice=l(179350,{13,14}),InstructorsDivineBell=l(184842,{13,14}),MacabreSheetMusic=l(184024,{13,14}),OverwhelmingPowerCrystal=l(179342,{13,14}),WakenersFrond=l(181457,{13,14}),SinfulGladiatorsBadge=l(175921,{13,14}),UnchainedGladiatorsBadge=l(185197,{13,14})}l.Warrior.Arms={Healthstone=l(5512),CosmicHealPot=l(187802),PotionofSpectralStrength=l(171275),GrimCodex=l(178811,{13,14}),DDVoracity=l(173087,{13,14})}l.Warrior.Protection={PotionofPhantomFire=l(171349)}