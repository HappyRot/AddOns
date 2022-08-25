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
local t = HeroRotation
if not e.Monk then
    e.Monk = {  }
end

e.Monk.Windwalker = { AncestralCall = e(274738), ArcaneTorrent = e(25046), BagOfTricks = e(312411), Berserking = e(26297), BloodFury = e(33697), Bloodlust = e(2825), GiftoftheNaaru = e(59547), Fireblood = e(265221), LightsJudgment = e(255647), QuakingPalm = e(107079), Shadowmeld = e(58984), BlackoutKick = e(100784), BlackoutKickBuff = e(116768), CracklingJadeLightning = e(117952), ExpelHarm = e(322101), FistsOfFury = e(113656), FlyingSerpentKick = e(101545), FlyingSerpentKickActionBarReplacement = e(115057), InvokeXuenTheWhiteTiger = e(123904), RisingSunKick = e(107428), SpinningCraneKick = e(101546), StormEarthAndFire = e(137639), StormEarthAndFireBuff = e(137639), StormEarthAndFireFixate = e(221771), TigerPalm = e(100780), TouchOfDeath = e(322109), MarkOfTheCraneDebuff = e(228287), Celerity = e(115173), ChiWave = e(115098), ChiBurst = e(123986), DanceOfChijiBuff = e(325202), EyeOfTheTiger = e(196607), FistOfTheWhiteTiger = e(261947), GoodKarma = e(280195), HitCombo = e(196740), HitComboBuff = e(196741), InnerStrengthBuff = e(261769), RushingJadeWind = e(116847), RushingJadeWindBuff = e(116847), WhirlingDragonPunch = e(152175), WhirlingDragonPunchBuff = e(196742), Serenity = e(152173), SerenityBuff = e(152173), SpiritualFocus = e(280197), DampenHarm = e(122278), DampenHarmBuff = e(122278), DiffuseMagic = e(122783), FortifyingBrew = e(243435), HealingElixir = e(122281), TouchOfKarma = e(122470), ChiTorpedo = e(115008), Detox = e(218164), Disable = e(116095), EnergizingElixir = e(115288), LegSweep = e(119381), Paralysis = e(115078), Provoke = e(115546), Resuscitate = e(115178), RingOfPeace = e(116844), Roll = e(109132), SpearHandStrike = e(116705), TigersLust = e(116841), TigerTailSweep = e(264348), Transcendence = e(101643), TranscendenceTransfer = e(119996), Vivify = e(116670), AcquiredAxeBuff = e(368656), AcquiredWandBuff = e(368654), BonedustBrew = e(325216), FaelineStomp = e(327104), FaelineStompBuff = e(347480), FaelineStompDebuff = e(327257), FallenOrder = e(326860), Fleshcraft = e(324631), WeaponsOfOrder = e(310454), WeaponsOfOrderChiBuff = e(311054), WeaponsOfOrderDebuff = e(312106), FortifyingIngrediencesBuff = e(336874), GroveInvigoration = e(322721), PustuleEruption = e(351094), VolatileSolvent = e(323074), VolatileSolventBuff = e(323491), LeadByExample = e(342156), CarversEye = e(350899), CarversEyeDebuff = e(351414), FirstStrikeBuff = e(325381), ChiEnergyBuff = e(337571), InvokersDelight = e(338321), InvokersDelightBuff = e(338321), KeefersSkyreachDebuff = e(344021), RecentlyRushingTigerPalm = e(337341), SkyreachExhaustion = e(337341), TheEmperorsCapacitor = e(337291), InnerFury = e(336452), CalculatedStrikes = e(336526), CoordinatedOffensive = e(336598), InnerFury = e(336452), PrimordialPotentialBuff = e(363911), PrimordialPowerBuff = e(368685), PoolEnergy = e(999910), CosmicGladiatorsBadgeBuff = e(345228) }
e.Monk.Brewmaster = { AncestralCall = e(274738), ArcaneTorrent = e(50613), BagOfTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), BlackoutKick = e(205523), BreathOfFire = e(115181), Clash = e(324312), CracklingJadeLightning = e(117952), ExpelHarm = e(322101), InvokeNiuzaoTheBlackOx = e(132578), KegSmash = e(121253), SpinningCraneKick = e(322729), TigerPalm = e(100780), TouchOfDeath = e(322109), BreathOfFireDotDebuff = e(123725), BlackoutCombo = e(196736), BlackoutComboBuff = e(228563), BlackOxBrew = e(115399), BobAndWeave = e(280515), Celerity = e(115173), CelestialFlames = e(325177), ChiBurst = e(123986), ChiWave = e(115098), EyeOfTheTiger = e(196607), ExplodingKeg = e(214326), LightBrewing = e(325093), RushingJadeWind = e(116847), SpecialDelivery = e(196730), Spitfire = e(242580), SummonBlackOxStatue = e(115315), CelestialBrew = e(322507), DampenHarm = e(122278), DampenHarmBuff = e(122278), ElusiveBrawlerBuff = e(195630), FortifyingBrew = e(115203), FortifyingBrewBuff = e(115203), HighTolerance = e(196737), PurifyingBrew = e(119582), PurifiedChiBuff = e(325092), Shuffle = e(215479), ChiTorpedo = e(115008), Detox = e(218164), Disable = e(116095), LegSweep = e(119381), Paralysis = e(115078), Provoke = e(115546), Resuscitate = e(115178), RingOfPeace = e(116844), Roll = e(109132), SpearHandStrike = e(116705), TigersLust = e(116841), TigerTailSweep = e(264348), Transcendence = e(101643), TranscendenceTransfer = e(119996), Vivify = e(116670), WeaponsOfOrder = e(310454), WeaponsOfOrderDebuff = e(312106), BonedustBrew = e(325216), FaelineStomp = e(327104), FaelineStompBuff = e(347480), FaelineStompDebuff = e(327257), FallenOrder = e(326860), CharredPassions = e(338140), InvokersDelight = e(338321), KeefersSkyreach = e(344021), MightyPour = e(337994), RecentlyRushingTigerPalm = e(337341), HeavyStagger = e(124273), ModerateStagger = e(124274), LightStagger = e(124275), PoolEnergy = e(999910) }
e.Monk.Mistweaver = { AncestralCall = e(274738), ArcaneTorrent = e(25046), BagOfTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Bloodlust = e(2825), GiftoftheNaaru = e(59547), Fireblood = e(265221), LightsJudgment = e(255647), QuakingPalm = e(107079), Shadowmeld = e(58984), BlackoutKick = e(100784), CracklingJadeLightning = e(117952), EnvelopingMist = e(124682), EssenceFont = e(191837), EssenceFontBuff = e(191840), ExpelHarm = e(322101), InvokeYulonTheJadeSerpent = e(123904), LifeCocoon = e(116849), RenewingMist = e(115151), Revival = e(115310), RisingSunKick = e(107428), SoothingMist = e(115175), SpinningCraneKick = e(101546), TeachingsOfTheMonasteryBuff = e(202090), ThunderFocusTea = e(116680), TigerPalm = e(100780), TouchOfDeath = e(322109), Celerity = e(115173), ChiWave = e(115098), ChiBurst = e(123986), EyeOfTheTiger = e(196607), GoodKarma = e(280195), InnerStrengthBuff = e(261769), InvokeChiJiTheRedCrane = e(325197), LifecyclesEnvelopingMistBuff = e(197919), LifecyclesVivifyBuff = e(197916), ManaTea = e(197908), RefreshingJadeWind = e(196725), SummonJadeSerpentStatue = e(115313), DampenHarm = e(122278), DampenHarmBuff = e(122278), DiffuseMagic = e(122783), FortifyingBrew = e(243435), HealingElixir = e(122281), ChiTorpedo = e(115008), Detox = e(218164), Disable = e(116095), EnergizingElixir = e(115288), LegSweep = e(119381), Paralysis = e(115078), Provoke = e(115546), Reawaken = e(212051), Resuscitate = e(115178), RingOfPeace = e(116844), Roll = e(109132), SongOfChiJi = e(198898), SpearHandStrike = e(116705), TigersLust = e(116841), TigerTailSweep = e(264348), Transcendence = e(101643), TranscendenceTransfer = e(119996), Vivify = e(116670), WeaponsOfOrder = e(310454), WeaponsOfOrderChiBuff = e(311054), WeaponsOfOrderDebuff = e(312106), BonedustBrew = e(325216), FaelineStomp = e(327104), FaelineStompDebuff = e(327257), FallenOrder = e(326860), FortifyingIngrediencesBuff = e(336874), ChiEnergyBuff = e(337571), InvokersDelight = e(338321), KeefersSkyreachDebuff = e(344021), RecentlyRushingTigerPalm = e(337341), TheEmperorsCapacitor = e(337291), PoolEnergy = e(999910) }
local e, e = ...
local t = HeroRotation
local e = HeroLib
local e = e.GUI
local n = e.CreateChildPanel
local e = e.CreatePanelOption
local a = t.GUI.CreateARPanelOption
local i = t.GUI.CreateARPanelOptions
t.GUISettings.APL.Monk = { Commons = { UseDefensives = true, HealthstoneHP = 50, HealPotHP = 0, PhialHP = 60, FortifyingBrew = 20, TouchofKarma = 0, Enabled = { Potions = false, TopTrinket = true, BottomTrinket = true }, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Brewmaster = { NoBrewmasterPooling = false, ShowCelestialBrewCD = true, ShowDampenHarmCD = true, Purify = { Enabled = true, Low = true, Medium = true, High = true }, GCDasOffGCD = { CelestialBrew = true, DampenHarm = true, FortifyingBrew = true, InvokeNiuzaoTheBlackOx = true, TouchOfDeath = true }, OffGCDasOffGCD = { BlackOxBrew = true, PurifyingBrew = true } }, Windwalker = { TargetSwap = "Mouseover", ShowFortifyingBrewCD = false, IgnoreFSK = true, PoolBeforeBurst = false, ToDExecute = false, SEFEcoCharge = 1.75, CastCancelFC = true, GCDasOffGCD = {  }, OffGCDasOffGCD = {  }, UHCooldowns = 0, IncludedCooldowns = { Xuen = true, SEFFull = true, SEFEco = false }, UHSmallCooldowns = 0, IncludedSmallCooldowns = { Xuen = false, SEFFull = false, SEFEco = true } }, Mistweaver = { ShowFortifyingBrewCD = false, NoMistweaverPooling = false, GCDasOffGCD = { InvokeYulonTheJadeSerpent = true, InvokeChiJiTheRedCrane = true, SummonJadeSerpentStatue = true, RenewingMist = true, TouchOfDeath = true, FortifyingBrew = true }, OffGCDasOffGCD = { ThunderFocusTea = true } } }
t.GUI.LoadSettingsRecursively(t.GUISettings)
local t = t.GUI.Panel
local a = n(t, "Monk")
local t = n(a, "Windwalker")
local o = n(a, "Brewmaster")
local n = n(a, "Mistweaver")
i(a, "APL.Monk.Commons")
e("Slider", a, "APL.Monk.Commons.FortifyingBrew", { 0, 100, 1 }, "Fortifying Brew HP %", "Set the HP threshold to use Fortifying Brew")
e("Slider", a, "APL.Monk.Commons.TouchofKarma", { 0, 100, 1 }, "TouchofKarma HP %", "Set the HP threshold to use Touch of Karma")
e("Slider", a, "APL.Monk.Commons.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP %", "Set the HP threshold to use Healthstone")
e("Slider", a, "APL.Monk.Commons.HealPotHP", { 0, 100, 1 }, "Healing Potion HP %", "Set the HP threshold to use Healing Potion")
e("Slider", a, "APL.Monk.Commons.PhialHP", { 0, 100, 1 }, "Phial of Serenity HP %", "Set the HP threshold to use Phial of Serenity")
i(t, "APL.Monk.Windwalker")
e("Dropdown", t, "APL.Monk.Windwalker.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("CheckButton", t, "APL.Monk.Windwalker.IgnoreFSK", "Ignore Flying Serpent Kick", "Enable this setting to allow you to ignore Flying Serpent Kick without stalling the rotation. (NOTE: Flying Serpent Kick will never be suggested if this is enabled)")
e("CheckButton", t, "APL.Monk.Windwalker.ToDExecute", "ToD Execute Only", "only Use ToD to Execute the target")
e("CheckButton", t, "APL.Monk.Windwalker.CastCancelFC", "Cast/Cancel Fleshcraft", "Will cast and cancel fleshcraft to keep up the soulbind buffs")
e("Slider", t, "APL.Monk.Windwalker.SEFEcoCharge", { 1, 2, .1 }, "SEF Eco Charges", "Set the Storm, Earth and Fire Eco Charge threshold.")
e("Slider", t, "APL.Monk.Windwalker.UHCooldowns", { 0, 0, 0 }, "--Spells to include in Cooldowns--", "This slider does nothing, select spells below")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedCooldowns.Xuen", "Invoke Xuen", "Include Invoke Xuen in Cooldowns")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedCooldowns.SEFFull", "Storm, Earth and Fire Full", "Use all SEF charges in Cooldowns")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedCooldowns.SEFEco", "Storm, Earth and Fire Eco Mode", "Use only SEF Eco charges in Cooldowns")
e("Slider", t, "APL.Monk.Windwalker.UHSmallCooldowns", { 0, 0, 0 }, "--Spells to include in SmallCooldowns--", "This slider does nothing, select spells below")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedSmallCooldowns.Xuen", "Invoke Xuen", "Include Invoke Xuen in Small Cooldowns")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedSmallCooldowns.SEFFull", "Storm, Earth and Fire Full", "Use all SEF charges in Small Cooldowns")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedSmallCooldowns.SEFEco", "Storm, Earth and Fire Eco", "Use SEF Eco charges in Small Cooldowns")
i(o, "APL.Monk.Brewmaster")
e("CheckButton", o, "APL.Monk.Brewmaster.NoBrewmasterPooling", "No Pooling", "If you want to ignore energy pooling.")
e("CheckButton", o, "APL.Monk.Brewmaster.ShowCelestialBrewCD", "Celestial Brew", "Enable or disable Celestial Brew recommendations.")
e("CheckButton", o, "APL.Monk.Brewmaster.ShowDampenHarmCD", "Dampen Harm", "Enable or disable Dampen Harmrecommendations.")
e("CheckButton", o, "APL.Monk.Brewmaster.Purify.Enabled", "Purify", "Enable or disable Purify recommendations.")
i(n, "APL.Monk.Mistweaver")

