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
if not e.Warrior then
    e.Warrior = {  }
end

e.Warrior.Fury = { AncestralCall = e(274738), BagofTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), BattleShout = e(6673), BattleShoutBuff = e(6673), Bloodbath = e(335096), Bloodthirst = e(23881), Charge = e(100), CrushingBlow = e(335097), EnrageBuff = e(184362), Execute = a(5308, 280735), FujiedasFuryBuff = e(207775), IntimidatingShout = e(5246), HeroicLeap = e(6544), MeatCleaverBuff = e(85739), MeatCleaver = e(280392), Pummel = e(6552), RagingBlow = e(85288), Rampage = e(184367), RecklessnessBuff = e(1719), Recklessness = e(1719), VictoryRush = e(34428), SpellReflection = e(23920), Whirlwind = e(190411), Whirlwindbuff = e(85739), EnragedRegeneration = e(184364), RallyingCry = e(97462), IgnorePain = e(190456), AngerManagement = e(152278), Bladestorm = e(46924), Cruelty = e(335070), DragonRoar = e(118000), Frenzy = e(335077), FrenzyBuff = e(335077), FrothingBerserker = e(215571), ImpendingVictory = e(202168), Massacre = e(206315), Onslaught = e(315720), RecklessAbandon = e(202751), Siegebreaker = e(280772), SiegebreakerDebuff = e(280773), StormBolt = e(107570), SuddenDeath = e(280721), SuddenDeathBuff = e(280776), FreshMeat = e(215568), AncientAftershock = e(325886), Condemn = e(330325), CondemnDebuff = e(317491), ConquerorsBanner = e(324143), ConquerorsFrenzyBuff = e(343672), SpearofBastion = e(307865), SpearofBastionBuff = e(307871), WilloftheBerserkerBuff = e(335594), MercilessBonegrinder = e(335260), MercilessBonegrinderBuff = e(346574), ViciousContempt = e(337302), Pool = e(999910) }
e.Warrior.Arms = { AncestralCall = e(274738), ArcaneTorrent = e(50613), BagofTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), BattleShout = e(6673), BattleShoutBuff = e(6673), Bladestorm = e(227847), Charge = e(100), ColossusSmash = e(167105), ColossusSmashDebuff = e(208086), DeepWoundsDebuff = e(262115), Execute = a(163201, 281000), HeroicLeap = e(6544), IntimidatingShout = e(5246), MortalStrike = e(12294), Overpower = e(7384), OverpowerBuff = e(7384), Pummel = e(6552), Slam = e(1464), SweepingStrikes = e(260708), SweepingStrikesBuff = e(260708), VictoryRush = e(34428), Whirlwind = e(1680), AngerManagement = e(152278), Avatar = e(107574), Cleave = e(845), CollateralDamage = e(334779), DeadlyCalm = e(262228), DeadlyCalmBuff = e(262228), Doubletime = e(103827), Dreadnaught = e(262150), FervorofBattle = e(202316), ImpendingVictory = e(202168), Inforthekill = e(248621), Massacre = e(281001), Ravager = e(152277), Rend = e(772), RendDebuff = e(772), Skullsplitter = e(260643), StormBolt = e(107570), SuddenDeathBuff = e(52437), Warbreaker = e(262161), WarMachineBuff = e(262231), AncientAftershock = e(325886), Condemn = a(330325, 317489, 317488), CondemnDebuff = e(317491), ConquerorsBanner = e(324143), ConquerorsFrenzyBuff = e(343672), SpearofBastion = e(307865), SpearofBastionBuff = e(307871), AshenJuggernaut = e(335232), AshenJuggernautBuff = e(335234), BattlelordBuff = e(346369), ExploiterDebuff = e(335452), Pool = e(999910) }
e.Warrior.Protection = { AncestralCall = e(274738), ArcaneTorrent = e(50613), BagofTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), Avatar = e(107574), AvatarBuff = e(107574), Charge = e(100), DemoralizingShout = e(1160), Devastate = e(20243), Execute = e(163201), IgnorePain = e(190456), IntimidatingShout = e(5246), LastStand = e(12975), LastStandBuff = e(12975), Pummel = e(6552), Revenge = e(6572), RevengeBuff = e(5302), ShieldBlock = e(2565), ShieldBlockBuff = e(132404), ShieldSlam = e(23922), ThunderClap = e(6343), VictoryRush = e(34428), BoomingVoice = e(202743), DragonRoar = e(118000), ImpendingVictory = e(202168), Ravager = e(228920), StormBolt = e(107570), UnstoppableForce = e(275336), AncientAftershock = e(325886), Condemn = e(317349), CondemnDebuff = e(317491), ConquerorsBanner = e(324143), ConquerorsFrenzyBuff = e(343672), SpearofBastion = e(307865), SpearofBastionBuff = e(307871), Pool = e(999910) }
if not t.Warrior then
    t.Warrior = {  }
end

t.Warrior.Fury = { PotionofSpectralStrength = t(171275), DDVoracity = t(173087, { 13, 14 }), FlameofBattle = t(181501, { 13, 14 }), GrimCodex = t(178811, { 13, 14 }), InscrutableQuantumDevice = t(179350, { 13, 14 }), InstructorsDivineBell = t(184842, { 13, 14 }), MacabreSheetMusic = t(184024, { 13, 14 }), OverwhelmingPowerCrystal = t(179342, { 13, 14 }), WakenersFrond = t(181457, { 13, 14 }), SinfulGladiatorsBadge = t(175921, { 13, 14 }), UnchainedGladiatorsBadge = t(185197, { 13, 14 }) }
t.Warrior.Arms = { PotionofSpectralStrength = t(171275), GrimCodex = t(178811, { 13, 14 }), DDVoracity = t(173087, { 13, 14 }) }
t.Warrior.Protection = { PotionofPhantomFire = t(171349) }

