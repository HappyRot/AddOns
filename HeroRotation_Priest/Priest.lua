local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=HeroRotation;if not j.Priest then j.Priest={}end;j.Priest.Shadow={AncestralCall=j(274738),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),Fireblood=j(265221),LightsJudgment=j(255647),DarkThoughtBuff=j(341207),DevouringPlague=j(335467),DevouringPlagueDebuff=j(335467),Dispersion=j(47585),Mindbender=k(200174,34433),MindBlast=j(8092),MindFlay=j(15407),MindSear=j(48045),PowerInfusion=j(10060),PowerInfusionBuff=j(10060),Shadowform=j(232698),ShadowformBuff=j(232698),ShadowWordDeath=j(32379),ShadowWordPain=j(589),ShadowWordPainDebuff=j(589),Silence=j(15487),VampiricTouch=j(34914),VampiricTouchDebuff=j(34914),VoidBolt=j(205448),VoidEruption=j(228260),VoidformBuff=j(194249),Damnation=j(341374),FortressOfTheMind=j(193195),HungeringVoid=j(345218),HungeringVoidDebuff=j(345219),Misery=j(238558),PsychicLink=j(199484),SearingNightmare=j(341385),ShadowCrash=j(205385),SurrenderToMadness=j(319952),TwistofFate=j(109142),UnfurlingDarkness=j(341273),UnfurlingDarknessBuff=j(341282),VoidTorrent=j(263165),AscendedBlast=j(325283),AscendedNova=j(325020),BoonoftheAscended=j(325013),BoonoftheAscendedBuff=j(325013),FaeGuardians=j(327661),FaeGuardiansBuff=j(327661),Fleshcraft=j(324631),Mindgames=j(323673),UnholyNova=j(324724),WrathfulFaerieDebuff=j(342132),CombatMeditation=j(328266),DissonantEchoes=j(338342),DissonantEchoesBuff=j(343144),FieldofBlossoms=j(319191),GroveInvigoration=j(322721),RedirectedAnimaBuff=j(342814),VolatileSolvent=j(323074),VolatileSolventHumanBuff=j(323491),Pool=j(999910)}j.Priest.Discipline={AncestralCall=j(274738),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),BerserkingBuff=j(26297),BloodFury=j(20572),BloodFuryBuff=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),MindBlast=j(8092),Smite=j(585),ShadowWordPain=j(589),ShadowWordPainDebuff=j(589),ShadowWordDeath=j(32379),HolyNova=j(132157),MindSear=j(48045),Penance=j(47540),PowerInfusion=j(10060),PowerWordRadiance=j(194509),PowerWordFortitude=j(21562),Schism=j(214621),Mindbender=k(123040,34433),PowerWordSolace=j(129250),ShadowCovenant=j(314867),ShadowCovenantBuff=j(322105),PurgeTheWicked=j(204197),PurgeTheWickedDebuff=j(204213),DivineStar=j(110744),Halo=j(120517),AscendedBlast=j(325315),AscendedNova=j(325020),BoonoftheAscended=j(325013),BoonoftheAscendedBuff=j(325013),FaeGuardians=j(327661),FaeGuardiansBuff=j(327661),WrathfulFaerieDebuff=j(342132),Mindgames=j(323673),UnholyNova=j(324724),Pool=j(999910)}j.Priest.Holy={AncestralCall=j(274738),ArcanePulse=j(260364),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),BerserkingBuff=j(26297),BloodFury=j(20572),BloodFuryBuff=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),HolyFire=j(14914),HolyFireDebuff=j(14914),HolyNova=j(132157),HolyWordChastise=j(88625),Smite=j(585),Apotheosis=j(200183),DivineStar=j(110744),Halo=j(120517),Pool=j(999910)}if not l.Priest then l.Priest={}end;l.Priest.Shadow={PotionofPhantomFire=l(171349),DarkmoonDeckPutrescence=l(173069,{13,14}),DreadfireVessel=l(184030,{13,14}),EmpyrealOrdinance=l(180117,{13,14}),GlyphofAssimilation=l(184021,{13,14}),InscrutableQuantumDevice=l(179350,{13,14}),MacabreSheetMusic=l(184024,{13,14}),ShadowedOrbofTorment=l(186428,{13,14}),SinfulGladiatorsBadgeofFerocity=l(175921,{13,14}),SoullettingRuby=l(178809,{13,14}),SunbloodAmethyst=l(178826,{13,14})}l.Priest.Discipline={}l.Priest.Holy={}