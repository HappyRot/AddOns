local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=d.Utils.MergeTableByKey;local n=HeroRotation;if not j.Warlock then j.Warlock={}end;j.Warlock.Commons={AncestralCall=j(274738),Berserking=j(26297),BloodFury=j(33702),Fireblood=j(265221),ShadowBolt=j(686),SummonDarkglare=j(205180),UnendingResolve=j(104773),GrimoireofSacrifice=j(108503),GrimoireofSacrificeBuff=j(196099),SoulConduit=j(215941),SummonSoulkeeper=j(386256),InquisitorsGaze=j(386344),InquisitorsGazeBuff=j(388068),Soulburn=j(385899),AxeToss=j(119914),Seduction=j(119909),ShadowBulwark=j(119907),SingeMagic=j(119905),SpellLock=j(119910)}j.Warlock.Demonology=m(j.Warlock.Commons,{Felstorm=j(89751),HandofGuldan=j(105174),ShadowBoltLineCD=j(686),SummonPet=j(30146),BilescourgeBombers=j(267211),CallDreadstalkers=j(104316),Demonbolt=j(264178),DemonicCalling=j(205145),DemonicStrength=j(267171),Doom=j(603),GrandWarlocksDesign=j(387084),GrimoireFelguard=j(111898),Guillotine=j(386833),Implosion=j(196277),InnerDemons=j(267216),NetherPortal=j(267217),PowerSiphon=j(264130),ReignofTyranny=j(427684),SacrificedSouls=j(267214),SoulboundTyrant=j(334585),SoulStrike=j(428344),SummonDemonicTyrant=j(265187),SummonVilefiend=j(264119),TheExpendables=j(387600),DemonicCallingBuff=j(205146),DemonicCoreBuff=j(264173),DemonicPowerBuff=j(265273),NetherPortalBuff=j(267218),RiteofRuvaraadBuff=j(409725),DoomDebuff=j(603),DoomBrandDebuff=j(423583),FromtheShadowsDebuff=j(270569)})j.Warlock.Affliction=m(j.Warlock.Commons,{Agony=j(980),Corruption=j(172),DrainLife=j(234153),SummonPet=j(688),AbsoluteCorruption=j(196103),DoomBlossom=j(389764),DrainSoul=j(198590),DreadTouch=j(389775),Haunt=j(48181),InevitableDemise=j(334319),MaleficAffliction=j(389761),MaleficRapture=j(324536),Nightfall=j(108558),PhantomSingularity=j(205179),SowTheSeeds=j(196226),SeedofCorruption=j(27243),ShadowEmbrace=j(27243),SiphonLife=j(63106),SoulRot=j(386997),SoulSwap=j(386951),SoulTap=j(387073),SouleatersGluttony=j(389630),SowtheSeeds=j(196226),TormentedCrescendo=j(387075),UnstableAffliction=j(316099),VileTaint=j(278350),InevitableDemiseBuff=j(334320),NightfallBuff=j(264571),MaleficAfflictionBuff=j(389845),TormentedCrescendoBuff=j(387079),UmbrafireKindlingBuff=j(423765),AgonyDebuff=j(980),CorruptionDebuff=j(146739),HauntDebuff=j(48181),PhantomSingularityDebuff=j(205179),SeedofCorruptionDebuff=j(27243),SiphonLifeDebuff=j(63106),UnstableAfflictionDebuff=j(316099),VileTaintDebuff=j(386931),SoulRotDebuff=j(386997),DreadTouchDebuff=j(389868),ShadowEmbraceDebuff=j(32390)})j.Warlock.Destruction=m(j.Warlock.Commons,{Immolate=j(348),Incinerate=j(29722),SummonPet=j(688),AshenRemains=j(387252),AvatarofDestruction=j(387159),Backdraft=j(196406),BurntoAshes=j(387153),Cataclysm=j(152108),ChannelDemonfire=j(196447),ChaosBolt=j(116858),ChaosIncarnate=j(387275),Chaosbringer=j(422057),Conflagrate=j(17962),CrashingChaos=j(417234),CryHavoc=j(387522),DiabolicEmbers=j(387173),DimensionalRift=j(387976),Eradication=j(196412),FireandBrimstone=j(196408),Havoc=j(80240),Inferno=j(270545),InternalCombustion=j(266134),MadnessoftheAzjAqir=j(387400),Mayhem=j(387506),RagingDemonfire=j(387166),RainofChaos=j(266086),RainofFire=j(5740),RoaringBlaze=j(205184),Ruin=j(387103),SoulFire=j(6353),SummonInfernal=j(1122),BackdraftBuff=j(117828),MadnessCBBuff=j(387409),MadnessRoFBuff=j(387413),MadnessSBBuff=j(387414),RainofChaosBuff=j(266087),RitualofRuinBuff=j(387157),BurntoAshesBuff=j(387154),ConflagrateDebuff=j(265931),EradicationDebuff=j(196414),HavocDebuff=j(80240),ImmolateDebuff=j(157736),PyrogenicsDebuff=j(387096),RoaringBlazeDebuff=j(265931)})if not l.Warlock then l.Warlock={}end;l.Warlock.Commons={BeacontotheBeyond=l(203963,{13,14}),BelorrelostheSuncaller=l(207172,{13,14}),ConjuredChillglobe=l(194300,{13,14}),DesperateInvokersCodex=l(194310,{13,14}),EruptingSpearFragment=l(193769,{13,14}),IcebloodDeathsnare=l(194304,{13,14}),IrideusFragment=l(193743,{13,14}),NeltharionsCallToDominance=l(204202,{13,14}),NymuesUnravelingSpindle=l(208615,{13,14}),RotcrustedVoodooDoll=l(159624,{13,14}),SpoilsofNeltharus=l(193773,{13,14}),TimeThiefsGambit=l(207579,{13,14}),TimebreachingTalon=l(193791,{13,14}),VoidmendersShadowgem=l(110007,{13,14}),Iridal=l(208321,{16})}l.Warlock.Affliction=m(l.Warlock.Commons,{})l.Warlock.Demonology=m(l.Warlock.Commons,{})l.Warlock.Destruction=m(l.Warlock.Commons,{})