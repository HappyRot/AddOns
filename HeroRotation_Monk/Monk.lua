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
if not e.Monk then
    e.Monk = {  }
end

e.Monk.Commons = { AncestralCall = e(274738), ArcaneTorrent = e(25046), BagofTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), GiftoftheNaaru = e(59547), Fireblood = e(265221), LightsJudgment = e(255647), QuakingPalm = e(107079), Shadowmeld = e(58984), CracklingJadeLightning = e(117952), ExpelHarm = e(322101), LegSweep = e(119381), Provoke = e(115546), Resuscitate = e(115178), RisingSunKick = e(107428), Roll = e(109132), TigerPalm = e(100780), TouchofDeath = e(322109), Transcendence = e(101643), TranscendenceTransfer = e(119996), Vivify = e(116670), BonedustBrew = e(386276), Celerity = e(115173), ChiBurst = e(123986), ChiTorpedo = e(115008), ChiWave = e(115098), DampenHarm = e(122278), Detox = e(218164), Disable = e(116095), DiffuseMagic = e(122783), EyeoftheTiger = e(196607), FastFeet = e(388809), InnerStrengthBuff = e(261769), Paralysis = e(115078), RingofPeace = e(116844), RushingJadeWind = e(116847), SpearHandStrike = e(116705), SummonWhiteTigerStatue = e(388686), TigerTailSweep = e(264348), TigersLust = e(116841), DampenHarm = e(122278), DampenHarmBuff = e(122278), DiffuseMagic = e(122783), FortifyingBrew = e(243435), HealingElixir = e(122281), TouchOfKarma = e(122470), Detox = e(218164), Disable = e(116095), LegSweep = e(119381), Paralysis = e(115078), Provoke = e(115546), RingOfPeace = e(116844), Transcendence = e(101643), TranscendenceTransfer = e(119996), BonedustBrewBuff = e(386276), DampenHarmBuff = e(122278), RushingJadeWindBuff = e(116847), TheEmperorsCapacitorBuff = e(235054), PoolEnergy = e(999910), StopFoF = e(363653) }
e.Monk.Windwalker = a(e.Monk.Commons, { BlackoutKick = e(100784), FlyingSerpentKick = e(101545), FlyingSerpentKickLand = e(115057), SpinningCraneKick = e(101546), BonedustBrew = e(386276), CraneVortex = e(388848), FaelineHarmony = e(391412), FaelineStomp = e(388193), FistsofFury = e(113656), HitCombo = e(196740), InvokeXuenTheWhiteTiger = e(123904), MarkoftheCrane = e(220357), Serenity = e(152173), ShadowboxingTreads = e(392982), StormEarthAndFire = e(137639), StormEarthAndFireFixate = e(221771), StrikeoftheWindlord = e(392983), TeachingsoftheMonastery = e(116645), Thunderfist = e(392985), WhirlingDragonPunch = e(152175), XuensBattlegear = e(392993), FortifyingBrew = e(243435), TouchofKarma = e(122470), BlackoutKickBuff = e(116768), DanceofChijiBuff = e(325202), HitComboBuff = e(196741), PowerStrikesBuff = e(129914), SerenityBuff = e(152173), StormEarthAndFireBuff = e(137639), TeachingsoftheMonasteryBuff = e(202090), WhirlingDragonPunchBuff = e(196742), MarkoftheCraneDebuff = e(228287), SkyreachExhaustionDebuff = e(393050), KicksofFlowingMomentumBuff = e(394944), FistsofFlowingMomentumBuff = e(394949) })
e.Monk.Brewmaster = a(e.Monk.Commons, { BlackoutKick = e(205523), BreathOfFire = e(115181), Clash = e(324312), InvokeNiuzaoTheBlackOx = e(132578), KegSmash = e(121253), SpinningCraneKick = e(322729), BreathOfFireDotDebuff = e(123725), BlackoutCombo = e(196736), BlackoutComboBuff = e(228563), BlackOxBrew = e(115399), BobAndWeave = e(280515), CelestialFlames = e(325177), ExplodingKeg = e(325153), HighTolerance = e(196737), LightBrewing = e(325093), SpecialDelivery = e(196730), Spitfire = e(242580), SummonBlackOxStatue = e(115315), CelestialBrew = e(322507), ElusiveBrawlerBuff = e(195630), FortifyingBrew = e(115203), FortifyingBrewBuff = e(115203), PurifyingBrew = e(119582), PurifiedChiBuff = e(325092), Shuffle = e(215479), CharredPassions = e(338140), MightyPour = e(337994), HeavyStagger = e(124273), ModerateStagger = e(124274), LightStagger = e(124275) })
e.Monk.Mistweaver = a(e.Monk.Commons, { BlackoutKick = e(100784), EnvelopingMist = e(124682), EssenceFont = e(191837), EssenceFontBuff = e(191840), InvokeYulonTheJadeSerpent = e(123904), LifeCocoon = e(116849), RenewingMist = e(115151), Revival = e(115310), SoothingMist = e(115175), SpinningCraneKick = e(101546), TeachingsOfTheMonasteryBuff = e(202090), ThunderFocusTea = e(116680), InvokeChiJiTheRedCrane = e(325197), LifecyclesEnvelopingMistBuff = e(197919), LifecyclesVivifyBuff = e(197916), ManaTea = e(197908), RefreshingJadeWind = e(196725), SongOfChiJi = e(198898), SummonJadeSerpentStatue = e(115313), FortifyingBrew = e(243435), Reawaken = e(212051) })
if not t.Monk then
    t.Monk = {  }
end

t.Monk.Commons = { Healthstone = t(5512) }
t.Monk.Windwalker = a(t.Monk.Commons, {  })
t.Monk.Brewmaster = a(t.Monk.Commons, {  })
t.Monk.Mistweaver = a(t.Monk.Commons, {  })

