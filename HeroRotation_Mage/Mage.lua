local e, e = ...
local e = HeroDBC.DBC
local i = HeroLib
local r = HeroCache
local e = i.Unit
local t = e.Player
local a = e.Target
local e = e.Pet
local e = i.Spell
local n = i.MultiSpell
local a = i.Item
local s = i.Utils.MergeTableByKey
local o = HeroRotation
local h = GetTime
o.Commons.Mage = {  }
local d = o.GUISettings.APL.Mage.Commons
local o = o.Commons.Mage
if not e.Mage then
    e.Mage = {  }
end

e.Mage.Commons = { AncestralCall = e(274738), BagofTricks = e(312411), Berserking = e(26297), BerserkingBuff = e(26297), BloodFury = e(20572), BloodFuryBuff = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), AlterTime = e(108978), ArcaneExplosion = e(1449), ArcaneIntellect = e(1459), ArcaneIntellectBuff = e(1459), Blink = n(1953, 212653), Counterspell = e(2139), Frostbolt = e(116), FrostNova = e(122), IceBlock = e(45438), Invisibility = e(66), MirrorImage = e(55342), RemoveCurse = e(475), SlowFall = e(130), SpellSteal = e(30449), TimeWarp = e(80353), FocusMagic = e(321358), RingOfFrost = e(113724), RuneofPower = e(116011), RuneofPowerBuff = e(116014), Deathborne = e(324220), DeathborneBuff = e(324220), DoorofShadows = e(300728), Fleshcraft = e(324631), MirrorsofTorment = e(314793), RadiantSpark = e(307443), RadiantSparkDebuff = e(307443), RadiantSparkVulnerability = e(307454), ShiftingPower = e(314791), Soulshape = e(310143), CombatMeditation = e(328266), EffusiveAnimaAccelerator = e(352188), FieldOfBlossoms = e(319191), GroveInvigoration = e(322721), WastelandPropriety = e(333251), ArcaneProdigy = e(336873), IcyPropulsion = e(336522), IreOfTheAscended = e(337058), PustuleEruption = e(351094), ShiveringCore = e(336472), SiphonedMalice = e(337090), VolatileSolvent = e(323074), DisciplinaryCommandBuff = e(327371), ExpandedPotentialBuff = e(327495), ScarsofFraternalStrifeBuff4 = e(368638), SoulIgnitionBuff = e(345211), TomeofMonstruousConstructionsBuff = e(357163) }
e.Mage.Arcane = s(e.Mage.Commons, { AncestralCall = e(274738), BagofTricks = e(312411), Berserking = e(26297), BerserkingBuff = e(26297), BloodFury = e(20572), BloodFuryBuff = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), ArcaneBarrage = e(44425), ArcaneBlast = e(30451), ArcaneMissiles = e(5143), ArcaneExplosion = e(1449), ArcaneIntellect = e(1459), ArcanePower = e(12042), Blink = n(1953, 212653), ClearcastingBuff = e(263725), Counterspell = e(2139), Evocation = e(12051), FireBlast = e(319836), MirrorImage = e(55342), PresenceofMind = e(205025), TouchoftheMagi = e(321507), Frostbolt = e(116), ConjureManaHem = e(759), FrostNova = e(122), TimeWarp = e(80353), AlterTime = e(108978), SpellSteal = e(30449), RemoveCurse = e(475), Invisibility = e(66), SlowFall = e(130), IceBlock = e(45438), PrismaticBarrier = e(235450), GreaterInvisibility = e(110959), Amplification = e(236628), RuleofThrees = e(264354), RuleofThreesBuff = e(264774), ArcaneFamiliar = e(205022), ArcaneFamiliarBuff = e(210126), Slipstream = e(236457), RuneofPower = e(116011), RuneofPowerBuff = e(116014), Resonance = e(205028), ArcaneEcho = e(342231), NetherTempest = e(114923), ArcaneOrb = e(153626), Supernova = e(157980), Overpowered = e(155147), Enlightened = e(321387), FocusMagic = e(321358), RingOfFrost = e(113724), RadiantSpark = e(307443), RadiantSparkVulnerability = e(307454), MirrorsofTorment = e(314793), Deathborne = e(324220), Fleshcraft = e(324631), ShiftingPower = e(314791), FieldOfBlossoms = e(319191), ArcaneProdigy = e(336873), VolatileSolvent = e(323074), PustuleEruption = e(351094), ExpandedPotentialBuff = e(327495), SiphonStormBuff = e(332928), DisciplinaryCommandBuff = e(327371), ArcaneHarmonyBuff = e(332777), SoulIgniterBuff = e(345211), TomeofMonstruousConstructionsBuff = e(357163) })
e.Mage.Fire = s(e.Mage.Commons, { AncestralCall = e(274738), BagofTricks = e(312411), Berserking = e(26297), BerserkingBuff = e(26297), BloodFury = e(20572), BloodFuryBuff = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), ArcaneIntellect = e(1459), ArcaneIntellectBuff = e(1459), ArcaneExplosion = e(1449), Blink = n(1953, 212653), Frostbolt = e(116), TimeWarp = e(80353), MirrorImage = e(55342), Pyroblast = e(11366), Combustion = e(190319), CombustionBuff = e(190319), FireBlast = e(108853), Fireball = e(133), Scorch = e(2948), HeatingUpBuff = e(48107), HotStreakBuff = e(48108), PhoenixFlames = e(257541), DragonsBreath = e(31661), Flamestrike = e(2120), Counterspell = e(2139), FrostNova = e(122), Ignite = e(12654), AlterTime = e(108978), SpellSteal = e(30449), RemoveCurse = e(475), Invisibility = e(66), SlowFall = e(130), IceBlock = e(45438), BlazingBarrier = e(235313), Firestarter = e(205026), SearingTouch = e(269644), RuneofPower = e(116011), RuneofPowerBuff = e(116014), FlameOn = e(205029), AlexstraszasFury = e(235870), FromTheAshes = e(342344), FlamePatch = e(205037), LivingBomb = e(44457), Kindling = e(155148), Pyroclasm = e(269650), PyroclasmBuff = e(269651), Meteor = e(153561), FocusMagic = e(321358), RingOfFrost = e(113724), BlastWave = e(157981), Deathborne = e(324220), DeathborneBuff = e(324220), DoorofShadows = e(300728), Fleshcraft = e(324631), MirrorsofTorment = e(314793), RadiantSpark = e(307443), RadiantSparkDebuff = e(307443), RaidantSparkVulnerability = e(307454), ShiftingPower = e(314791), Soulshape = e(310143), WastelandPropriety = e(333251), SiphonedMalice = e(337090), GroveInvigoration = e(322721), FieldOfBlossoms = e(319191), IreOfTheAscended = e(337058), FlameAccretion = e(337224), InfernalCascade = e(336821), InfernalCascadeBuff = e(336832), FirestormBuff = e(333100), SunKingsBlessingBuff = e(333314), SunKingsBlessingBuffReady = e(333315), GrislyIcicleBuff = e(333393), GrislyIcicleDebuff = e(348007), DisciplinaryCommandBuff = e(327371), SoulIgnitionBuff = e(345211), TomeofMonstruousConstructionsBuff = e(357163), Pool = e(999910) })
e.Mage.Frost = s(e.Mage.Commons, { Blizzard = e(190356), BrainFreezeBuff = e(190446), ConeofCold = e(120), FingersofFrostBuff = e(44544), Flurry = e(44614), FrozenOrb = n(84714, 198149), IceLance = e(30455), IciclesBuff = e(205473), IcyVeins = e(12472), SummonWaterElemental = e(31687), WintersChillDebuff = e(228358), FireBlast = e(319836), Frostbite = e(198121), Freeze = e(33395), TemporalDisplacement = e(80354), SpellSteal = e(30449), RemoveCurse = e(475), IceBarrier = e(11426), IceBlock = e(45438), BoneChilling = e(205027), ChainReaction = e(278309), IceNova = e(157997), IceFloes = e(108839), IncantersFlow = e(1463), IncantersFlowBuff = e(116267), FocusMagic = e(321358), RuneofPower = e(116011), RuneofPowerBuff = e(116014), Ebonbolt = e(257537), FreezingRain = e(270233), FreezingRainBuff = e(270232), SplittingIce = e(56377), CometStorm = e(153595), RayofFrost = e(205021), GlacialSpike = e(199786), GlacialSpikeBuff = e(199844), RingOfFrost = e(113724), CombatMeditation = e(328266), Deathborne = e(324220), DoorofShadows = e(300728), Fleshcraft = e(324631), MirrorsofTorment = e(314793), RadiantSpark = e(307443), RadiantSparkDebuff = e(307443), RaidantSparkVulnerability = e(307454), ShiftingPower = e(314791), Soulshape = e(310143), WastelandPropriety = e(333251), SiphonedMalice = e(337090), GroveInvigoration = e(322721), FieldOfBlossoms = e(319191), IreOfTheAscended = e(337058), FreezingWindsBuff = e(327364), SlickIceBuff = e(327508), ExpandedPotentialBuff = e(327495), DisciplinaryCommandBuff = e(327371), TomeofMonstruousConstructionsBuff = e(357163), Pool = e(999910) })
if not a.Mage then
    a.Mage = {  }
end

a.Mage.Arcane = { ManaGem = a(36799), PotionofSpectralIntellect = a(171273), DarkmoonDeckPutrescence = a(173069), DreadfireVessel = a(184030), EmpyrealOrdnance = a(180117), FlameofBattle = a(181501), GlyphofAssimilation = a(184021), InscrutableQuantumDevice = a(179350), MacabreSheetMusic = a(184024), SinfulGladiatorsBadge = a(175921), SoulIgniter = a(184019), SoullettingRuby = a(178809), SunbloodAmethyst = a(178826), WakenersFrond = a(181457), ShadowedOrbofTorment = a(186428), TomeofMonstruousConstructions = a(186422) }
a.Mage.Fire = { PotionofSpectralIntellect = a(171273), DreadfireVessel = a(184030), EmpyrealOrdnance = a(180117), FlameofBattle = a(181501), GlyphofAssimilation = a(184021), InscrutableQuantumDevice = a(179350), InstructorsDivineBell = a(184842), MacabreSheetMusic = a(184024), SinfulAspirantsBadge = a(175884), SinfulGladiatorsBadge = a(175921), SoulIgniter = a(184019), SunbloodAmethyst = a(178826), WakenersFrond = a(181457), ShadowedOrbofTorment = a(186428), TomeofMonstruousConstructions = a(186422) }
a.Mage.Frost = { PotionofSpectralIntellect = a(171273), ShadowedOrbofTorment = a(186428), TomeofMonstruousConstructions = a(186422), Healthstone = a(5512), HealPot = a(171267), CosmicHealPot = a(187802), PhialofSerenity = a(177278) }
o.IFST = { CurrStacks = 0, CurrStacksTime = 0, OldStacks = 0, OldStacksTime = 0, Direction = 0 }
local a = {  }
a.IncantersFlowBuff = e(116267)
i:RegisterForEvent(function()
    o.IFST.CurrStacks = 0
    o.IFST.CurrStacksTime = 0
    o.IFST.OldStacks = 0
    o.IFST.OldStacksTime = 0
    o.IFST.Direction = 0
end, "PLAYER_REGEN_ENABLED")
function o.IFTracker()
    if i.CombatTime() == 0 then
        return 
    end

    local s = o.IFST.CurrStacksTime - o.IFST.OldStacksTime
    local e = o.IFST.CurrStacks
    local n = o.IFST.CurrStacksTime
    local h = o.IFST.OldStacks
    if (t:BuffUp(a.IncantersFlowBuff)) then
        if (t:BuffStack(a.IncantersFlowBuff) ~= e or (t:BuffStack(a.IncantersFlowBuff) == e and s > 1)) then
            o.IFST.OldStacks = e
            o.IFST.OldStacksTime = n
        end

        o.IFST.CurrStacks = t:BuffStack(a.IncantersFlowBuff)
        o.IFST.CurrStacksTime = i.CombatTime()
                if o.IFST.CurrStacks > o.IFST.OldStacks then
            if o.IFST.CurrStacks == 5 then
                o.IFST.Direction = 0
            else
                o.IFST.Direction = 1
            end

        elseif o.IFST.CurrStacks < o.IFST.OldStacks then
            if o.IFST.CurrStacks == 1 then
                o.IFST.Direction = 0
            else
                o.IFST.Direction = -1
            end

        else
            if o.IFST.CurrStacks == 1 then
                o.IFST.Direction = 1
            else
                o.IFST.Direction = -1
            end

        end

    else
        o.IFST.OldStacks = 0
        o.IFST.OldStacksTime = 0
        o.IFST.CurrStacks = 0
        o.IFST.CurrStacksTime = 0
        o.IFST.Direction = 0
    end

end

function o.IFTimeToX(t, n)
    local a
    local i
    local e
    if o.IFST.Direction == -1 or (o.IFST.Direction == 0 and o.IFST.CurrStacks == 0) then
        e = 10 - o.IFST.CurrStacks + 1
    else
        e = o.IFST.CurrStacks
    end

        if n == "up" then
        a = t
        i = t
    elseif n == "down" then
        a = 10 - t + 1
        i = 10 - t + 1
    else
        a = t
        i = 10 - t + 1
    end

    if a == e or i == e then
        return 0
    end

    local t = (10 + a - e) % 10
    local e = (10 + i - e) % 10
    return (o.IFST.CurrStacksTime - o.IFST.OldStacksTime) + math.min(t, e) - 1
end

o.DC = { Arcane = 0, ArcaneTime = 0, Fire = 0, FireTime = 0, Frost = 0, FrostTime = 0 }
function o.DCCheck()
    local n = h()
    local i = r.Persistent.Player.Spec[1]
    local a
            if i == 62 then
        a = e.Mage.Arcane
    elseif i == 63 then
        a = e.Mage.Fire
    elseif i == 64 then
        a = e.Mage.Frost
    end

    local o = o.DC
    local s = 30 - a.DisciplinaryCommandBuff:TimeSinceLastAppliedOnPlayer()
    if t:BuffDown(a.DisciplinaryCommandBuff) and s <= 0 then
        if o.Arcane == 0 then
            if t:PrevOffGCD(1, a.Counterspell) or t:PrevGCD(1, a.ArcaneExplosion) or t:PrevGCD(1, a.RuneofPower) or t:PrevOffGCD(1, e(212653)) or t:PrevOffGCD(1, e(1953)) or t:PrevGCD(1, a.ArcaneIntellect) or t:PrevGCD(1, a.AlterTime) or t:PrevGCD(1, a.SpellSteal) or t:PrevGCD(1, a.RemoveCurse) or t:PrevGCD(1, a.MirrorImage) or t:PrevGCD(1, a.Invisibility) or t:PrevGCD(1, a.SlowFall) or t:PrevGCD(1, a.FocusMagic) or t:PrevOffGCD(1, a.TimeWarp) or (a.RuneofPower:IsAvailable() and ((i == 64 and t:PrevOffGCD(1, a.IcyVeins)) or (i == 63 and t:PrevOffGCD(1, a.Combustion)) or (i == 62 and t:PrevOffGCD(1, a.ArcanePower)))) or (i == 62 and (t:PrevGCD(1, a.ArcaneBarrage) or t:PrevGCD(1, a.ArcaneBlast) or t:PrevGCD(1, a.ArcaneMissiles) or t:PrevGCD(1, a.ArcaneOrb) or t:PrevOffGCD(1, a.ArcanePower) or t:PrevGCD(1, a.Evocation) or t:PrevGCD(1, a.PresenceofMind) or t:PrevGCD(1, a.GreaterInvisibility) or t:PrevGCD(1, a.PrismaticBarrier) or t:PrevGCD(1, a.TouchoftheMagi) or t:PrevGCD(1, a.ArcaneFamiliar) or t:PrevGCD(1, a.NetherTempest) or t:PrevGCD(1, a.Supernova))) then
                o.Arcane = 1
                o.ArcaneTime = n
            end

        end

        if o.Fire == 0 then
            if t:PrevGCD(1, a.FireBlast) or (i == 63 and (t:PrevOffGCD(1, a.FireBlast) or t:PrevGCD(1, a.Fireball) or t:PrevGCD(1, a.Scorch) or t:PrevGCD(1, a.Pyroblast) or t:PrevGCD(1, a.Flamestrike) or t:PrevGCD(1, a.BlazingBarrier) or t:PrevOffGCD(1, a.Combustion) or t:PrevGCD(1, a.DragonsBreath) or t:PrevGCD(1, a.PhoenixFlames) or t:PrevGCD(1, a.BlastWave) or t:PrevGCD(1, a.LivingBomb) or t:PrevGCD(1, a.Meteor))) then
                o.Fire = 1
                o.FireTime = n
            end

        end

        if o.Frost == 0 then
            if t:PrevGCD(1, a.Frostbolt) or t:PrevGCD(1, a.FrostNova) or t:PrevGCD(1, a.IceBlock) or t:PrevGCD(1, a.RingOfFrost) or (i == 64 and (t:PrevGCD(1, a.IceLance) or t:PrevGCD(1, a.Flurry) or t:PrevGCD(1, a.Blizzard) or t:PrevGCD(1, a.ConeofCold) or t:PrevGCD(1, a.FrozenOrb) or t:PrevGCD(1, a.IceBarrier) or t:PrevOffGCD(1, a.IcyVeins) or t:PrevGCD(1, a.RayofFrost) or t:PrevGCD(1, a.GlacialSpike) or t:PrevGCD(1, a.CometStorm) or t:PrevGCD(1, a.Ebonbolt) or t:PrevOffGCD(1, a.IceFloes) or t:PrevOffGCD(1, a.IceNova) or t:PrevOffGCD(1, a.SummonWaterElemental))) then
                o.Frost = 1
                o.FrostTime = n
            end

        end

    end

    if t:BuffUp(a.DisciplinaryCommandBuff) and (o.Arcane == 1 or o.Fire == 1 or o.Frost == 1) then
        o.Arcane = 0
        o.Fire = 0
        o.Frost = 0
    end

    if o.Arcane == 1 and o.ArcaneTime < n - 10 then
        o.Arcane = 0
    end

    if o.Fire == 1 and o.FireTime < n - 10 then
        o.Fire = 0
    end

    if o.Frost == 1 and o.FrostTime < n - 10 then
        o.Frost = 0
    end

end


