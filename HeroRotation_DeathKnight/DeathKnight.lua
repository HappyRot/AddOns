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
if not e.DeathKnight then
    e.DeathKnight = {  }
end

e.DeathKnight.Commons = { DeathAndDecay = e(43265), DeathCoil = e(47541), DeathPact = e(48743), AbominationLimb = e(383269), Asphyxiate = e(221562), ChainsofIce = e(45524), CleavingStrikes = e(316916), DeathStrike = e(49998), EmpowerRuneWeapon = e(47568), IceboundFortitude = e(48792), IcyTalons = e(194878), RaiseDead = e(46585), RunicAttenuation = e(207104), SacrificialPact = e(327574), SoulReaper = e(343294), UnholyGround = e(374265), AbominationLimbCov = e(315443), AbominationLimbCovBuff = e(315443), DeathsDue = e(324128), Fleshcraft = e(324631), ShackleTheUnworthy = e(312202), SwarmingMist = e(311648), SwarmingMistBuff = e(311648), KevinsOozeling = e(352110), LeadByExample = e(342156), LeadByExampleBuff = e(342181), PustuleEruption = e(351094), VolatileSolvent = e(323074), VolatileSolventHumanBuff = e(323491), AbominationLimbBuff = e(383269), DeathAndDecayBuff = e(188290), DeathsDueBuff = e(324165), DeathStrikeBuff = e(101568), EmpowerRuneWeaponBuff = e(47568), IcyTalonsBuff = e(194879), UnholyStrengthBuff = e(53365), BloodPlagueDebuff = e(55078), FrostFeverDebuff = e(55095), VirulentPlagueDebuff = e(191587), AncestralCall = e(274738), ArcanePulse = e(260364), ArcaneTorrent = e(50613), BagofTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), MindFreeze = e(47528), Pool = e(999910) }
e.DeathKnight.Blood = a(e.DeathKnight.Commons, { AntiMagicShell = e(48707), AntiMagicZone = e(51052), ControlUndead = e(111673), DarkCommand = e(56222), DeathGrip = e(49576), DeathPact = e(48743), Lichborne = e(49039), RaiseAlly = e(61999), ShroudofPurgatory = e(116888), BloodBoil = e(50842), BloodTap = e(221699), Blooddrinker = e(206931), Bonestorm = e(194844), Coagulopathy = e(391477), Consumption = e(274156), DancingRuneWeapon = e(49028), DeathsCaress = e(195292), GorefiendsGrasp = e(108199), HeartStrike = e(206930), Heartbreaker = e(221536), InsatiableBlade = e(377637), Marrowrend = e(195182), RapidDecomposition = e(194662), RelishinBlood = e(317610), RuneTap = e(194679), SanguineGround = e(391458), TighteningGrasp = e(206970), Tombstone = e(219809), VampiricBlood = e(55233), BoneShieldBuff = e(195181), CoagulopathyBuff = e(391481), CrimsonScourgeBuff = e(81141), DancingRuneWeaponBuff = e(81256), HemostasisBuff = e(273947), IceboundFortitudeBuff = e(48792), RuneTapBuff = e(194679), VampiricBloodBuff = e(55233), BloodPlagueDebuff = e(55078) })
e.DeathKnight.Frost = a(e.DeathKnight.Commons, { AntiMagicShell = e(48707), FrostStrike = e(49143), HowlingBlast = e(49184), Lichborne = e(49039), AntiMagicZone = e(51052), DeathGrip = e(49576), ControlUndead = e(111673), RaiseAlly = e(61999), Avalanche = e(207142), BitingCold = e(377056), BreathofSindragosa = e(152279), ChillStreak = e(305392), ColdHeart = e(281208), Frostscythe = e(207230), FrostwyrmsFury = e(279302), GatheringStorm = e(194912), GlacialAdvance = e(194913), HornofWinter = e(57330), Icebreaker = e(392950), Icecap = e(207126), ImprovedObliterate = e(317198), MightoftheFrozenWastes = e(81333), Obliterate = e(49020), Obliteration = e(281238), PillarofFrost = e(51271), RageoftheFrozenChampion = e(377076), RemorselessWinter = e(196770), ShatteringBlade = e(207057), UnleashedFrenzy = e(376905), ColdHeartBuff = e(281209), GatheringStormBuff = e(211805), KillingMachineBuff = e(51124), PillarofFrostBuff = e(51271), RimeBuff = e(59052), UnleashedFrenzyBuff = e(376907), RazoriceDebuff = e(51714), PoolRange = e(999910) })
e.DeathKnight.Unholy = a(e.DeathKnight.Commons, { Apocalypse = e(275699), ArmyoftheDamned = e(276837), ArmyoftheDead = e(42650), Asphyxiate = e(108194), BurstingSores = e(207264), ClawingShadows = e(207311), CoilofDevastation = e(390270), CommanderoftheDead = e(390259), DarkTransformation = e(63560), Defile = e(152280), Epidemic = e(207317), EternalAgony = e(390268), FesteringStrike = e(85948), Festermight = e(377590), GhoulishFrenzy = e(377587), ImprovedDeathCoil = e(377580), InfectedClaws = e(207272), Morbidity = e(377592), Outbreak = e(77575), Pestilence = e(277234), Plaguebringer = e(390175), RottenTouch = e(390275), ScourgeStrike = e(55090), SummonGargoyle = o(49206, 207349), Superstrain = e(390283), UnholyAssault = e(207289), UnholyBlight = e(115989), UnholyCommand = e(316941), UnholyPact = e(319230), VileContagion = e(390279), FestermightBuff = e(377591), PlaguebringerBuff = e(390178), RunicCorruptionBuff = e(51460), SuddenDoomBuff = e(81340), UnholyAssaultBuff = e(207289), DeathStrikeBuff = e(101568), FesteringWoundDebuff = e(194310), UnholyBlightDebuff = e(115994), AntiMagicZone = e(51052), DeathGrip = e(49576), IceboundFortitude = e(48792), AntiMagicShell = e(48707), Lichborne = e(49039), RaiseAlly = e(61999), ControlUndead = e(111673), PoolResources = e(999910) })
if not t.DeathKnight then
    t.DeathKnight = {  }
end

t.DeathKnight.Commons = { PotionofSpectralStrength = t(171275), InscrutableQuantumDevice = t(179350, { 13, 14 }), OverwhelmingPowerCrystal = t(179342, { 13, 14 }), ScarsofFraternalStrife = t(188253, { 13, 14 }), TheFirstSigil = t(188271, { 13, 14 }), GaveloftheFirstArbiter = t(189862), Healthstone = t(5512), HealPot = t(171267), CosmicHealPot = t(187802), PhialofSerenity = t(177278) }
t.DeathKnight.Blood = a(t.DeathKnight.Commons, {  })
t.DeathKnight.Frost = a(t.DeathKnight.Commons, {  })
t.DeathKnight.Unholy = a(t.DeathKnight.Commons, {  })

