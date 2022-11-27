local e, e = ...
local e = HeroDBC.DBC
local r = HeroLib
local e = HeroCache
local l = r.Unit
local a = l.Player
local d = l.Target
local u = l.MouseOver
local e = r.Spell
local t = r.MultiSpell
local t = r.Item
local c = r.Utils.MergeTableByKey
local n = HeroRotation
local w = n.Commons.Everyone
local m = math.min
local f = pairs
local o = {  }
local y = HeroRotationCharDB.Toggles[12]
n.Commons.Rogue = o
local s = { General = n.GUISettings.General, Commons = n.GUISettings.APL.Rogue.Commons, Assassination = n.GUISettings.APL.Rogue.Assassination, Outlaw = n.GUISettings.APL.Rogue.Outlaw, Subtlety = n.GUISettings.APL.Rogue.Subtlety }
local i = 0
local h = 0
if not e.Rogue then
    e.Rogue = {  }
end

e.Rogue.Commons = { AncestralCall = e(274738), ArcanePulse = e(260364), ArcaneTorrent = e(25046), BagofTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), Shadowmeld = e(58984), CloakofShadows = e(31224), CrimsonVial = e(185311), Evasion = e(5277), Feint = e(1966), Blind = e(2094), CheapShot = e(1833), Kick = e(1766), KidneyShot = e(408), Sap = e(6770), Shadowstep = e(36554), Sprint = e(2983), TricksoftheTrade = e(57934), MasterAssassinsMark = e(340094), EchoingReprimand = e(385616):IsAvailable() and e(385616) or e(323547), EchoingReprimand2 = e(323558), EchoingReprimand3 = e(323559), EchoingReprimand4 = e(323560), EchoingReprimand5 = e(354838), Flagellation = e(323654), FlagellationBuff = e(345569), Fleshcraft = e(324631), Sepsis = e(328305), SepsisBuff = e(347037), SerratedBoneSpike = e(328547), SerratedBoneSpikeDebuff = e(324073), EffusiveAnimaAccelerator = e(352188), KevinsOozeling = e(352110), KevinsWrathDebuff = e(352528), LeadbyExample = e(342156), LeadbyExampleBuff = e(342181), MarrowedGemstoneBuff = e(327069), PustuleEruption = e(351094), VolatileSolvent = e(323074), ChaosBaneBuff = e(355829), Alacrity = e(193539), ColdBlood = e(382245), DeeperStratagem = e(193531), Elusiveness = e(79008), FindWeaknessDebuff = e(316220), MarkedforDeath = e(137619), Nightstalker = e(14062), PreyontheWeak = e(131511), PreyontheWeakDebuff = e(255909), ShadowDance = e(185313), ShadowDanceBuff = e(185422), Shadowstep = e(36554), Subterfuge = e(108208), ThistleTea = e(381623), ThistleTeaBuff = e(381623), Vigor = e(112651), AcquiredSword = e(368657), AcquiredAxe = e(368656), AcquiredWand = e(368654), TheFirstRune = e(368635), TheFourthRune = e(368638), TheFinalRune = e(368641), PoolEnergy = e(999910), SinfulRevelationDebuff = e(324260) }
e.Rogue.Assassination = c(e.Rogue.Commons, { Ambush = e(8676), DeadlyPoison = e(2823), DeadlyPoisonDebuff = e(2818), Envenom = e(32645), FanofKnives = e(51723), Garrote = e(703), Mutilate = e(1329), PoisonedKnife = e(185565), Rupture = e(1943), SliceandDice = e(315496), Stealth = e(1784), Stealth2 = e(115191), Vanish = e(1856), VanishBuff = e(11327), Vendetta = e(79140), WoundPoison = e(8679), WoundPoisonDebuff = e(8680), AmplifyingPoison = e(381664), AmplifyingPoisonDebuff = e(383414), BlindsideBuff = e(121153), CrimsonTempest = e(121411), Deathmark = e(360194), DeeperStratagem = e(193531), DragonTemperedBlades = e(381801), Elusiveness = e(79008), Exsanguinate = e(200806), HiddenBladesBuff = e(270070), IndiscriminateCarnage = e(381802), InternalBleeding = e(154953), ImprovedGarrote = e(381632), ImprovedGarroteBuff = e(392403), Kingsbane = e(385627), MasterAssassin = e(255989), MasterAssassinBuff = e(256735), Nightstalker = e(14062), PreyontheWeak = e(131511), PreyontheWeakDebuff = e(255909), Shiv = e(5938), ShivDebuff = e(319504), Subterfuge = e(108208), SubterfugeBuff = e(115192), VenomRush = e(152152), DeathfromAbove = e(269513), Maneuverability = e(197000), Neurotoxin = e(206328), SmokeBomb = e(212182) })
e.Rogue.Outlaw = c(e.Rogue.Commons, { AncestralCall = e(274738), ArcanePulse = e(260364), ArcaneTorrent = e(25046), BagofTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), Shadowmeld = e(58984), AdrenalineRush = e(13750), Ambush = e(8676), BetweentheEyes = e(315341), BladeFlurry = e(13877), Dispatch = e(2098), Elusiveness = e(79008), GrapplingHook = e(195457), Opportunity = e(195627), PistolShot = e(185763), RolltheBones = e(315508), Shiv = e(5938), SinisterStrike = e(193315), SliceandDice = e(315496), Stealth = e(1784), Vanish = e(1856), VanishBuff = e(11327), Audacity = e(381845), AudacityBuff = e(386270), AcrobaticStrikes = e(196924), BladeRush = e(271877), CountTheOdds = e(381982), DeeperStratagem = e(193531), Dreadblades = e(343142), FanTheHammer = e(381846), GhostlyStrike = e(196937), GreenskinsWickers = e(386823), KeepItRolling = e(381989), KillingSpree = e(51690), ImprovedAdrenalineRush = e(395422), LoadedDiceBuff = e(256171), MarkedforDeath = e(137619), PreyontheWeak = e(131511), PreyontheWeakDebuff = e(255909), QuickDraw = e(196938), SwiftSlasher = e(381988), TakeEmBySurpriseBuff = e(385907), Weaponmaster = e(200733), WeaponmasterT = e(200733), CloakofShadows = e(31224), CrimsonVial = e(185311), Evasion = e(5277), Feint = e(1966), Gouge = e(1776), DeathfromAbove = e(269513), Dismantle = e(207777), Maneuverability = e(197000), PlunderArmor = e(198529), SmokeBomb = e(212182), ThickasThieves = e(221622), Broadside = e(193356), BuriedTreasure = e(199600), GrandMelee = e(193358), RuthlessPrecision = e(193357), SkullandCrossbones = e(199603), TrueBearing = e(193359), AmbidexterityConduit = e(341542), CountTheOddsConduit = e(341546), ConcealedBlunderbuss = e(340587), DeathlyShadowsBuff = e(341202), GreenskinsWickersBuff = e(386823):IsAvailable() and e(394131) or e(340573) })
e.Rogue.Subtlety = c(e.Rogue.Commons, { Backstab = e(53), Eviscerate = e(196819), Rupture = e(1943), Shadowstrike = e(185438), Shiv = e(5938), ShurikenStorm = e(197835), ShurikenToss = e(114014), SliceandDice = e(315496), Stealth = e(1784), Stealth2 = e(115191), SymbolsofDeath = e(212283), SymbolsofDeathCrit = e(227151), Vanish = e(1856), VanishBuff = e(11327), VanishBuff2 = e(115193), BlackPowder = e(319175), DarkBrew = e(382504), DarkShadow = e(245687), DanseMacabre = e(382528), DanseMacabreBuff = e(393969), EnvelopingShadows = e(238104), Gloomblade = e(200758), LingeringShadow = e(382524), MasterofShadows = e(196976), Premeditation = e(343160), PremeditationBuff = e(343173), SealFate = e(14190), SecretTechnique = e(280719), SecretStratagem = e(394320), ShadowBlades = e(121471), ShadowFocus = e(108209), ShurikenTornado = e(277925), Weaponmaster = e(193537), CloakofShadows = e(31224), CrimsonVial = e(185311), Evasion = e(5277), Feint = e(1966), Blind = e(2094), CheapShot = e(1833), Kick = e(1766), KidneyShot = e(408), Shadowstep = e(36554), Sprint = e(2983), TricksoftheTrade = e(57934), DeathfromAbove = e(269513), Maneuverability = e(197000), ShadowyDuel = e(207736), SmokeBomb = e(212182), VeilofMidnight = e(198952), DeeperDaggers = e(341549), PerforatedVeins = e(341567), PerforatedVeinsBuff = e(341572), DeathlyShadowsBuff = e(341202), FinalityBlackPowder = e(340603), FinalityEviscerate = e(340600), FinalityRupture = e(340601), TheRottenBuff = e(341134) })
if not t.Rogue then
    t.Rogue = {  }
end

t.Rogue.Assassination = { GalecallersBoon = t(159614, { 13, 14 }), LustrousGoldenPlumage = t(159617, { 13, 14 }), ComputationDevice = t(167555, { 13, 14 }), VigorTrinket = t(165572, { 13, 14 }), FontOfPower = t(169314, { 13, 14 }), RazorCoral = t(169311, { 13, 14 }), InscrutableQuantumDevice = t(179350, { 13, 14 }), ShadowgraspTotem = t(179356, { 13, 14 }), OverchargedAnimaBattery = t(180116, { 13, 14 }), CacheOfAcquiredTreasures = t(188265, { 13, 14 }), TheFirstSigil = t(188271, { 13, 14 }), ScarsofFraternalStrife = t(188253, { 13, 14 }) }
t.Rogue.Outlaw = { ComputationDevice = t(167555, { 13, 14 }), VigorTrinket = t(165572, { 13, 14 }), FontOfPower = t(169314, { 13, 14 }), RazorCoral = t(169311, { 13, 14 }), MistcallerOcarina = t(178715, { 13, 14 }), CacheOfAcquiredTreasures = t(188265, { 13, 14 }), PotionofSpectralAgility = t(171270), Healthstone = t(5512), HealPot = t(171267), CosmicHealPot = t(187802), PhialofSerenity = t(177278) }
t.Rogue.Subtlety = { ComputationDevice = t(167555, { 13, 14 }), VigorTrinket = t(165572, { 13, 14 }), FontOfPower = t(169314, { 13, 14 }), RazorCoral = t(169311, { 13, 14 }), MistcallerOcarina = t(178715, { 13, 14 }), CacheOfAcquiredTreasures = t(188265, { 13, 14 }), PotionofSpectralAgility = t(171270), Healthstone = t(5512), HealPot = t(171267), CosmicHealPot = t(187802), PhialofSerenity = t(177278) }
function o.Stealth(t, o)
    h = 0
    i = 0
    if ((s.Commons.StealthOOC == "Always" or (s.Commons.StealthOOC == "w/ Target" and w.TargetIsValid())) and t:IsCastable() and a:StealthDown() and not a:DebuffUp(e(319070))) then
        if n.Cast(t, nil) then
            i = 200
            return "Cast Stealth (OOC)"
        end

    else
        i = 0
    end

    return false
end

do
    local e = e(185311)
    function o.CrimsonVial()
        h = 0
        i = 0
        if e:IsCastable() and a:HealthPercentage() <= s.Commons.CrimsonVialHP then
            if n.Cast(e, nil) then
                i = 201
                return "Cast Crimson Vial (Defensives)"
            end

        end

        return false
    end

end

do
    local e = e(1966)
    function o.Feint()
        h = 0
        i = 0
        if e:IsCastable() and a:BuffDown(e) and a:HealthPercentage() <= s.Commons.FeintHP then
            if n.Cast(e, nil) then
                i = 202
                return "Cast Feint (Defensives)"
            end

        end

    end

end

do
    local e = e(5277)
    function o.Evasion()
        h = 0
        i = 0
        if e:IsCastable() and a:BuffDown(e) and a:HealthPercentage() <= s.Commons.EvasionHP then
            if n.Cast(e, nil) then
                i = 5277
                return "Cast Evasion (Defensives)"
            end

        end

    end

end

do
    local t = e(3408)
    local t = e(2823)
    local t = e(315584)
    local r = e(5761)
    local t = e(8679)
    local t = e(381637)
    function o.Poisons()
        h = 0
        i = 0
        local o = a:AffectingCombat() and 180 or 900
        local t
                        if e(8679):IsAvailable() and s.Commons.LethalPoison == "Wound Poison" then
            t = a:BuffRemains(e(8679))
            if t < o and not a:IsCasting(e(8679)) then
                if n.Cast(e(8679)) then
                    i = 203
                    return "Wound Poison Refresh"
                end

            end

        elseif e(2823):IsAvailable() and s.Commons.LethalPoison == "Deadly Poison" then
            t = a:BuffRemains(e(2823))
            if t < o and not a:IsCasting(e(2823)) then
                if n.Cast(e(2823)) then
                    i = 208
                    return "Deadly Poison Refresh"
                end

            end

        elseif e(315584):IsAvailable() and s.Commons.LethalPoison == "Instant Poison" then
            t = a:BuffRemains(e(315584))
            if t < o and not a:IsCasting(e(315584)) then
                if n.Cast(e(315584)) then
                    i = 205
                    return "Instant Poison Refresh"
                end

            end

        end

                if e(381637):IsAvailable() and s.Commons.NonLethalPoison == "Atrophic Poison" then
            t = a:BuffRemains(e(381637))
            if t < o and not a:IsCasting(e(381637)) then
                if n.Cast(e(381637)) then
                    i = 381637
                    return "Atropic Poison Refresh"
                end

            end

        elseif e(5761):IsAvailable() and s.Commons.NonLethalPoison == "Numbing Poison" then
            t = a:BuffRemains(e(5761))
            if t < o and not a:IsCasting(r) then
                if n.Cast(e(5761)) then
                    i = 204
                    return "Numbing Poison Refresh"
                end

            end

        end

    end

end

do
    local e = { Counter = 0, LastMH = 0, LastOH = 0 }
    function o.TimeToSht(i)
        if e.Counter >= i then
            return 0
        end

        local o, a = UnitAttackSpeed("player")
        local s = mathmax(e.LastMH + o, GetTime())
        local n = mathmax(e.LastOH + a, GetTime())
        local t = {  }
        for e = 0, 2 do
            tableinsert(t, s + e * o)
            tableinsert(t, n + e * a)
        end

        table.sort(t)
        local e = m(5, mathmax(1, i - e.Counter))
        return t[e] - GetTime()
    end

    r:RegisterForSelfCombatEvent(function()
        e.Counter = 0
        e.LastMH = GetTime()
        e.LastOH = GetTime()
    end, "PLAYER_ENTERING_WORLD")
    r:RegisterForSelfCombatEvent(function(a, a, a, a, a, a, a, a, a, a, a, t)
        if t == 196911 then
            e.Counter = 0
        end

    end, "SPELL_ENERGIZE")
    r:RegisterForSelfCombatEvent(function(a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, t)
        e.Counter = e.Counter + 1
        if t then
            e.LastOH = GetTime()
        else
            e.LastMH = GetTime()
        end

    end, "SWING_DAMAGE")
    r:RegisterForSelfCombatEvent(function(a, a, a, a, a, a, a, a, a, a, a, a, a, a, a, t)
        if t then
            e.LastOH = GetTime()
        else
            e.LastMH = GetTime()
        end

    end, "SWING_MISSED")
end

function o.MfDSniping(c)
    h = 0
    i = 0
    if c:IsCastable() and (a:AffectingCombat() or HeroRotationCharDB.Toggles[6]) then
        local e, i = nil, 60
        local r = u:IsInRange(30) and u:TimeToDie() or 11111
        for t, o in f(a:GetEnemiesInRange(30)) do
            local t = o:TimeToDie()
            if not o:IsMfDBlacklisted() and t < a:ComboPointsDeficit() * 1.5 and t < i then
                if r - t > 1 then
                    e, i = o, t
                else
                    e, i = u, r
                end

            end

        end

        if e and e:GUID() ~= d:GUID() then
            n.CastLeftNameplate(e, c)
                        if e:GUID() == l("mouseover"):GUID() and s.Subtlety.TargetSwap == "Mouseover" then
                h = 1117
            elseif s.Subtlety.TargetSwap == "AutoSwap" and e:GUID() ~= d:GUID() and not y then
                h = 999
            end

        end

    end

end

function o.CanDoTUnit(t, e)
    return w.CanDoTUnit(t, e)
end

do
    local e = e(193531)
    function o.CPMaxSpend()
        return e:IsAvailable() and 6 or 5
    end

end

function o.CPSpend()
    return m(a:ComboPoints(), o.CPMaxSpend())
end

do
    function o.AnimachargedCP()
                                if a:BuffUp(e.Rogue.Commons.EchoingReprimand2) then
            return 2
        elseif a:BuffUp(e.Rogue.Commons.EchoingReprimand3) then
            return 3
        elseif a:BuffUp(e.Rogue.Commons.EchoingReprimand4) then
            return 4
        elseif a:BuffUp(e.Rogue.Commons.EchoingReprimand5) then
            return 5
        end

        return -1
    end

    function o.EffectiveComboPoints(t)
        if t == 2 and a:BuffUp(e.Rogue.Commons.EchoingReprimand2) or t == 3 and a:BuffUp(e.Rogue.Commons.EchoingReprimand3) or t == 4 and a:BuffUp(e.Rogue.Commons.EchoingReprimand4) or t == 5 and a:BuffUp(e.Rogue.Commons.EchoingReprimand5) then
            return 7
        end

        return t
    end

end

do
    local t = e.Rogue.Assassination.DeadlyPoisonDebuff
    local a = e.Rogue.Assassination.WoundPoisonDebuff
    function o.Poisoned(e)
        return (e:DebuffUp(t) or e:DebuffUp(a)) and true or false
    end

end

do
    local a = e.Rogue.Assassination.DeadlyPoisonDebuff
    local t = e.Rogue.Assassination.WoundPoisonDebuff
    function o.Poisoned(e)
        return (e:DebuffUp(a) or e:DebuffUp(t)) and true or false
    end

end

do
    local t = e.Rogue.Assassination.DeadlyPoisonDebuff
    local a = e.Rogue.Assassination.WoundPoisonDebuff
    function o.PoisonRemains(e)
        return (e:DebuffUp(t) and e:DebuffRemains(t)) or (e:DebuffUp(a) and e:DebuffRemains(a)) or 0
    end

end

do
    local a = e.Rogue.Assassination.Garrote
    local i = e.Rogue.Assassination.Rupture
    local t = e.Rogue.Assassination.CrimsonTempest
    local e = e.Rogue.Assassination.InternalBleeding
    function o.Bleeds()
        return (d:DebuffUp(a) and 1 or 0) + (d:DebuffUp(i) and 1 or 0) + (d:DebuffUp(t) and 1 or 0) + (d:DebuffUp(e) and 1 or 0)
    end

end

do
    local n = e.Rogue.Assassination.Garrote
    local i = e.Rogue.Assassination.InternalBleeding
    local s = e.Rogue.Assassination.Rupture
    local e = 0
    function o.PoisonedBleeds()
        e = 0
        for a, t in f(a:GetEnemiesInRange(50)) do
            if o.Poisoned(t) then
                if t:DebuffUp(n) then
                    e = e + 1
                end

                if t:DebuffUp(i) then
                    e = e + 1
                end

                if t:DebuffUp(s) then
                    e = e + 1
                end

            end

        end

        return e
    end

end

do
    local e, t = e(340094), 4
    function o.MasterAssassinsMarkRemains()
        if a:BuffRemains(e) < 0 then
            return a:GCDRemains() + t
        else
            return a:BuffRemains(e)
        end

    end

end

function o.ReturnSpell()
    if i == 0 then
        return 0
    else
        return i
    end

end

function o.ReturnSpellMO()
    if h == 0 then
        return 0
    else
        return h
    end

end


