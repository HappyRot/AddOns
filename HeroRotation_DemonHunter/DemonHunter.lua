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
if not e.DemonHunter then
    e.DemonHunter = {  }
end

e.DemonHunter.Vengeance = { FelDevastation = e(212084), Frailty = e(247456), ImmolationAura = e(258920), ImmolationAuraBuff = e(258920), InfernalStrike = e(189110), Shear = e(203782), SigilofFlame = a(204596, 204513), SigilofFlameDebuff = e(204598), SoulCleave = e(228477), SoulFragments = e(203981), ThrowGlaive = e(204157), DemonSpikes = e(203720), DemonSpikesBuff = e(203819), FieryBrand = e(204021), FieryBrandDebuff = e(207771), Torment = e(185245), AgonizingFlames = e(207548), BulkExtraction = e(320341), BurningAlive = e(207739), CharredFlesh = e(336639), ConcentratedSigils = e(207666), Demonic = e(321453), Felblade = e(232893), Fracture = e(263642), SoulBarrier = e(263648), SpiritBomb = e(247454), SpiritBombDebuff = e(247456), Disrupt = e(183752), Metamorphosis = e(187827), MetamorphosisBuff = e(187827), DoorofShadows = e(300728), ElysianDecree = e(306830), Fleshcraft = e(324631), SinfulBrand = e(317009), SinfulBrandDebuff = e(317009), Soulshape = e(310143), SummonSteward = e(324739), TheHunt = e(323639), FelBombardmentBuff = e(337849), EnduringGloom = e(319978), Pool = e(999910) }
e.DemonHunter.Havoc = { Annihilation = e(201427), BladeDance = e(188499), ChaosNova = e(179057), ChaosStrike = e(162794), ConsumeMagic = e(278326), Darkness = e(196718), DeathSweep = e(210152), DemonsBite = e(162243), Disrupt = e(183752), EyeBeam = e(198013), FelRush = e(195072), FuriousGazeBuff = e(343312), ImmolationAura = e(258920), ImmolationAuraBuff = e(258920), Metamorphosis = e(191427), MetamorphosisBuff = e(162264), SadisticGleeDebuff = e(353466), ThrowGlaive = e(185123), VengefulRetreat = e(198793), Blur = e(198589), SigilofFlame = a(204596, 204513), SigilofFlameDebuff = e(204598), BlindFury = e(203550), CycleofHatred = e(258887), DemonBlades = e(203555), Demonic = e(213410), EssenceBreak = e(258860), EssenceBreakDebuff = e(320338), FelBarrage = e(258925), FelEruption = e(211881), Felblade = e(232893), FirstBlood = e(206416), GlaiveTempest = e(342817), Momentum = e(206476), MomentumBuff = e(208628), PreparedBuff = e(203650), TrailofRuin = e(258881), UnboundChaos = e(275144), UnboundChaosBuff = e(337313), Detainment = e(205596), ElysianDecree = e(306830), SinfulBrand = e(317009), SinfulBrandDebuff = e(317009), TheHunt = e(323639), TheHuntTalent = e(370965), ChaosTheoryBuff = e(337567), FelBombardmentBuff = e(337849), BurningWoundDebuff = e(346278), ExposedWoundDebuff = e(339229), SerratedGlaive = e(339230), Imprison = e(217832), Imprison2 = e(221527), AcquiredAxeBuff = e(368656), Pool = e(999910) }
if not t.DemonHunter then
    t.DemonHunter = {  }
end

t.DemonHunter.Vengeance = { PotionofPhantomFire = t(171349), PulsatingStoneheart = t(178825, { 13, 14 }), DarkmoonDeckIndomitable = t(173096, { 13, 14 }) }
t.DemonHunter.Havoc = { PotionofPhantomFire = t(171349), PotionofSpectralAgility = t(171270), CruciformVeinripper = t(186388), Healthstone = t(5512), HealPot = t(171267), CosmicHealPot = t(187802), PhialofSerenity = t(177278), CacheofAcquiredTreasures = t(188265, { 13, 14 }), PulsatingStoneheart = t(178825, { 13, 14 }), DarkmoonDeckIndomitable = t(173096, { 13, 14 }) }

