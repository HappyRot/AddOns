local e, e = ...
local e = HeroDBC.DBC
local t = HeroLib
local e = HeroCache
local e = t.Unit
local a = e.Player
local a = e.Target
local e = e.Pet
local e = t.Spell
local a = t.MultiSpell
local t = t.Item
local o = HeroRotation
if not e.Priest then
    e.Priest = {  }
end

e.Priest.Shadow = { AncestralCall = e(274738), ArcaneTorrent = e(50613), BagofTricks = e(312411), Berserking = e(26297), Fireblood = e(265221), LightsJudgment = e(255647), DarkThoughtBuff = e(341207), DesperatePrayer = e(19236), DevouringPlague = e(335467), DevouringPlagueDebuff = e(335467), Dispersion = e(47585), MassDispell = e(32375), Mindbender = e(200174), MindBlast = e(8092), MindFlay = e(15407), MindSear = e(48045), PowerInfusion = e(10060), PowerInfusionBuff = e(10060), PowerWordShield = e(17), Shadowform = e(232698), ShadowformBuff = e(232698), Shadowfiend = e(34433), ShadowWordDeath = e(32379), ShadowWordPain = e(589), ShadowWordPainDebuff = e(589), Silence = e(15487), VampiricTouch = e(34914), VampiricTouchDebuff = e(34914), VoidBolt = e(205448), VoidEruption = e(228260), VoidformBuff = e(194249), WeakenedSoul = e(6788), Damnation = e(341374), DarkAscension = e(391109), DarkVoid = e(263346), DeathspeakerBuff = e(392511), FortressOfTheMind = e(193195), HungeringVoid = e(345218), HungeringVoidDebuff = e(345219), InescapableTorment = e(373427), MindFlayInsanityBuff = e(391404), MindSpike = e(73510), Misery = e(238558), PsychicLink = e(199484), SearingNightmare = e(341385), ScreamsoftheVoid = e(375767), ShadowCrash = e(205385), ShadowyInsight = e(375888), ShadowyInsightBuff = e(375981), SurgeofDarkness = e(87160), SurrenderToMadness = e(319952), TwistofFate = e(109142), UnfurlingDarkness = e(341273), UnfurlingDarknessBuff = e(341282), VoidTorrent = e(263165), ScarsofFraternalStrifeBuff4 = e(368638), AscendedBlast = e(325283), AscendedNova = e(325020), BoonoftheAscended = e(325013), BoonoftheAscendedBuff = e(325013), FaeGuardians = e(327661), FaeGuardiansBuff = e(327661), Fleshcraft = e(324631), Mindgames = e(323673), UnholyNova = e(324724), WrathfulFaerieDebuff = e(342132), MindDevourerBuff = e(373204), CombatMeditation = e(328266), DissonantEchoes = e(338342), DissonantEchoesBuff = e(343144), FieldofBlossoms = e(319191), GroveInvigoration = e(322721), PustuleEruption = e(351094), RedirectedAnimaBuff = e(342814), VolatileSolvent = e(323074), VolatileSolventHumanBuff = e(323491), LivingShadowBuff = e(363578), Pool = e(999910) }
e.Priest.Discipline = { AncestralCall = e(274738), ArcaneTorrent = e(50613), BagofTricks = e(312411), Berserking = e(26297), BerserkingBuff = e(26297), BloodFury = e(20572), BloodFuryBuff = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), MindBlast = e(8092), Smite = e(585), ShadowWordPain = e(589), ShadowWordPainDebuff = e(589), ShadowWordDeath = e(32379), HolyNova = e(132157), MindSear = e(48045), Penance = e(47540), PowerInfusion = e(10060), PowerWordRadiance = e(194509), PowerWordFortitude = e(21562), Schism = e(214621), Mindbender = a(123040, 34433), PowerWordSolace = e(129250), ShadowCovenant = e(314867), ShadowCovenantBuff = e(322105), PurgeTheWicked = e(204197), PurgeTheWickedDebuff = e(204213), DivineStar = e(110744), Halo = e(120517), AscendedBlast = e(325315), AscendedNova = e(325020), BoonoftheAscended = e(325013), BoonoftheAscendedBuff = e(325013), FaeGuardians = e(327661), FaeGuardiansBuff = e(327661), WrathfulFaerieDebuff = e(342132), Mindgames = e(323673), UnholyNova = e(324724), Pool = e(999910) }
e.Priest.Holy = { AncestralCall = e(274738), ArcanePulse = e(260364), ArcaneTorrent = e(50613), BagofTricks = e(312411), Berserking = e(26297), BerserkingBuff = e(26297), BloodFury = e(20572), BloodFuryBuff = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), HolyFire = e(14914), HolyFireDebuff = e(14914), HolyNova = e(132157), HolyWordChastise = e(88625), Smite = e(585), Apotheosis = e(200183), DivineStar = e(110744), Halo = e(120517), Pool = e(999910) }
if not t.Priest then
    t.Priest = {  }
end

t.Priest.Shadow = { PotionofPhantomFire = t(171349), PotionofSpectralIntellect = t(171352), ArchitectsIngenuityCore = t(188268, { 13, 14 }), DarkmoonDeckPutrescence = t(173069, { 13, 14 }), DreadfireVessel = t(184030, { 13, 14 }), EmpyrealOrdinance = t(180117, { 13, 14 }), GlyphofAssimilation = t(184021, { 13, 14 }), InscrutableQuantumDevice = t(179350, { 13, 14 }), MacabreSheetMusic = t(184024, { 13, 14 }), ScarsofFraternalStrife = t(188253, { 13, 14 }), ShadowedOrbofTorment = t(186428, { 13, 14 }), SinfulGladiatorsBadgeofFerocity = t(175921, { 13, 14 }), SoullettingRuby = t(178809, { 13, 14 }), SunbloodAmethyst = t(178826, { 13, 14 }), TheFirstSigil = t(188271, { 13, 14 }), Healthstone = t(5512), HealPot = t(171267), CosmicHealPot = t(187802), PhialofSerenity = t(177278) }
t.Priest.Discipline = {  }
t.Priest.Holy = {  }

