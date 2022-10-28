local e, e = ...
local e = HeroDBC.DBC
local o = HeroLib
local e = HeroCache
local d = o.Unit
local t = d.Player
local r = d.Target
local l = d.MouseOver
local e = o.Spell
local a = o.MultiSpell
local a = o.Item
local u = o.Utils.MergeTableByKey
local n = HeroRotation
local c = n.Commons.Everyone
local w = math.min
local m = pairs
local o = {  }
local f = HeroRotationCharDB.Toggles[12]
n.Commons.Rogue = o
local h = { General = n.GUISettings.General, Commons = n.GUISettings.APL.Rogue.Commons, Assassination = n.GUISettings.APL.Rogue.Assassination, Outlaw = n.GUISettings.APL.Rogue.Outlaw, Subtlety = n.GUISettings.APL.Rogue.Subtlety }
local i = 0
local s = 0
if not e.Rogue then
    e.Rogue = {  }
end

e.Rogue.Commons = { AncestralCall = e(274738), ArcanePulse = e(260364), ArcaneTorrent = e(25046), BagofTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), Shadowmeld = e(58984), CloakofShadows = e(31224), CrimsonVial = e(185311), Evasion = e(5277), Feint = e(1966), Blind = e(2094), CheapShot = e(1833), Kick = e(1766), KidneyShot = e(408), Sap = e(6770), Shadowstep = e(36554), Sprint = e(2983), TricksoftheTrade = e(57934), MasterAssassinsMark = e(340094), EchoingReprimand = e(323547), EchoingReprimand2 = e(323558), EchoingReprimand3 = e(323559), EchoingReprimand4 = e(323560), EchoingReprimand5 = e(354838), Flagellation = e(323654), FlagellationBuff = e(345569), Fleshcraft = e(324631), Sepsis = e(328305), SepsisBuff = e(347037), SerratedBoneSpike = e(328547), SerratedBoneSpikeDebuff = e(324073), EffusiveAnimaAccelerator = e(352188), KevinsOozeling = e(352110), KevinsWrathDebuff = e(352528), LeadbyExample = e(342156), LeadbyExampleBuff = e(342181), MarrowedGemstoneBuff = e(327069), PustuleEruption = e(351094), VolatileSolvent = e(323074), ChaosBaneBuff = e(355829), ThistleTea = e(381623), ColdBlood = e(382245), ShadowDance = e(185313), AcquiredSword = e(368657), AcquiredAxe = e(368656), AcquiredWand = e(368654), PoolEnergy = e(999910), SinfulRevelationDebuff = e(324260) }
e.Rogue.Assassination = u(e.Rogue.Commons, { Ambush = e(8676), DeadlyPoison = e(2823), DeadlyPoisonDebuff = e(2818), Envenom = e(32645), FanofKnives = e(51723), Garrote = e(703), Mutilate = e(1329), PoisonedKnife = e(185565), Rupture = e(1943), SliceandDice = e(315496), Stealth = e(1784), Stealth2 = e(115191), Vanish = e(1856), VanishBuff = e(11327), Vendetta = e(79140), WoundPoison = e(8679), WoundPoisonDebuff = e(8680), BlindsideBuff = e(121153), CrimsonTempest = e(121411), DeeperStratagem = e(193531), Elusiveness = e(79008), Exsanguinate = e(200806), HiddenBladesBuff = e(270070), InternalBleeding = e(154953), MarkedforDeath = e(137619), MasterAssassin = e(255989), MasterAssassinBuff = e(256735), Nightstalker = e(14062), PreyontheWeak = e(131511), PreyontheWeakDebuff = e(255909), Shiv = e(5938), ShivDebuff = e(319504), Subterfuge = e(108208), SubterfugeBuff = e(115192), VenomRush = e(152152), DeathfromAbove = e(269513), Maneuverability = e(197000), Neurotoxin = e(206328), SmokeBomb = e(212182) })
e.Rogue.Outlaw = u(e.Rogue.Commons, { AncestralCall = e(274738), ArcanePulse = e(260364), ArcaneTorrent = e(25046), BagofTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), Shadowmeld = e(58984), AdrenalineRush = e(13750), Ambush = e(8676), BetweentheEyes = e(315341), BladeFlurry = e(13877), Dispatch = e(2098), Elusiveness = e(79008), Opportunity = e(195627), PistolShot = e(185763), RolltheBones = e(315508), Shiv = e(5938), SinisterStrike = e(193315), SliceandDice = e(315496), Stealth = e(1784), Vanish = e(1856), VanishBuff = e(11327), AcrobaticStrikes = e(196924), BladeRush = e(271877), DeeperStratagem = e(193531), Dreadblades = e(343142), GhostlyStrike = e(196937), KillingSpree = e(51690), LoadedDiceBuff = e(256171), MarkedforDeath = e(137619), PreyontheWeak = e(131511), PreyontheWeakDebuff = e(255909), QuickDraw = e(196938), KeepitRolling = e(381989), AntropicPoison = e(381637), FantheHammer = e(381846), CountTheOdds = e(381982), TakeEmBySurprise = e(382742), ImprovedAdrenalineRush = e(395422), GreenskinsWickersT = e(386823), SwiftSlasher = e(381988), WeaponmasterT = e(200733), Audacity = e(381845), CloakofShadows = e(31224), CrimsonVial = e(185311), Evasion = e(5277), Feint = e(1966), Blind = e(2094), CheapShot = e(1833), Gouge = e(1776), GrapplingHook = e(195457), Kick = e(1766), KidneyShot = e(408), Sap = e(6770), Sprint = e(2983), TricksoftheTrade = e(57934), DeathfromAbove = e(269513), Dismantle = e(207777), Maneuverability = e(197000), PlunderArmor = e(198529), SmokeBomb = e(212182), ThickasThieves = e(221622), Broadside = e(193356), BuriedTreasure = e(199600), GrandMelee = e(193358), RuthlessPrecision = e(193357), SkullandCrossbones = e(199603), TrueBearing = e(193359), EchoingReprimand = e(385616), Flagellation = e(323654), FlagellationBuff = e(345569), Sepsis = e(385408), SepsisBuff = e(347037), SerratedBoneSpike = e(328547), SerratedBoneSpikeDebuff = e(324073), Ambidexterity = e(341542), CountTheOdds = e(341546), ConcealedBlunderbuss = e(340587), DeathlyShadowsBuff = e(341202), GreenskinsWickers = e(340573), MasterAssassinsMark = e(340094), TornadoTriggerBuff = e(364556), PoolEnergy = e(999910), SinfulRevelationDebuff = e(324260) })
e.Rogue.Subtlety = u(e.Rogue.Commons, { AncestralCall = e(274738), ArcanePulse = e(260364), ArcaneTorrent = e(25046), BagofTricks = e(312411), Berserking = e(26297), BloodFury = e(20572), Fireblood = e(265221), LightsJudgment = e(255647), Shadowmeld = e(58984), Backstab = e(53), BlackPowder = e(319175), Elusiveness = e(79008), Eviscerate = e(196819), FindWeaknessDebuff = e(316220), Rupture = e(1943), ShadowBlades = e(121471), ShadowDance = e(185313), ShadowDanceBuff = e(185422), Shadowstrike = e(185438), Shiv = e(5938), ShurikenStorm = e(197835), ShurikenToss = e(114014), SliceandDice = e(315496), Stealth = e(1784), Stealth2 = e(115191), SymbolsofDeath = e(212283), SymbolsofDeathCrit = e(227151), Vanish = e(1856), VanishBuff = e(11327), VanishBuff2 = e(115193), Alacrity = e(193539), DarkShadow = e(245687), DeeperStratagem = e(193531), EnvelopingShadows = e(238104), Gloomblade = e(200758), MarkedforDeath = e(137619), MasterofShadows = e(196976), Nightstalker = e(14062), PreyontheWeak = e(131511), PreyontheWeakDebuff = e(255909), Premeditation = e(343160), PremeditationBuff = e(343173), SecretTechnique = e(280719), ShadowFocus = e(108209), ShurikenTornado = e(277925), Subterfuge = e(108208), Vigor = e(14983), Weaponmaster = e(193537), CloakofShadows = e(31224), CrimsonVial = e(185311), Evasion = e(5277), Feint = e(1966), Blind = e(2094), CheapShot = e(1833), Kick = e(1766), KidneyShot = e(408), Sap = e(6770), Shadowstep = e(36554), Sprint = e(2983), TricksoftheTrade = e(57934), ColdBlood = e(213981), DeathfromAbove = e(269513), Maneuverability = e(197000), ShadowyDuel = e(207736), SmokeBomb = e(212182), VeilofMidnight = e(198952), EchoingReprimand = e(323547), EchoingReprimand2 = e(323558), EchoingReprimand3 = e(323559), EchoingReprimand4 = e(323560), EchoingReprimand5 = e(354838), Flagellation = e(323654), FlagellationBuff = e(345569), Sepsis = e(328305), SepsisBuff = e(347037), SerratedBoneSpike = e(328547), SerratedBoneSpikeDebuff = e(324073), DeeperDaggers = e(341549), PerforatedVeinsBuff = e(341572), LeadbyExample = e(342156), LeadbyExampleBuff = e(342181), DeathlyShadowsBuff = e(341202), FinalityBlackPowder = e(340603), FinalityEviscerate = e(340600), FinalityRupture = e(340601), TheRottenBuff = e(341134), PoolEnergy = e(999910), SinfulRevelationDebuff = e(324260) })
if not a.Rogue then
    a.Rogue = {  }
end

a.Rogue.Assassination = { GalecallersBoon = a(159614, { 13, 14 }), LustrousGoldenPlumage = a(159617, { 13, 14 }), ComputationDevice = a(167555, { 13, 14 }), VigorTrinket = a(165572, { 13, 14 }), FontOfPower = a(169314, { 13, 14 }), RazorCoral = a(169311, { 13, 14 }) }
a.Rogue.Outlaw = { ComputationDevice = a(167555, { 13, 14 }), VigorTrinket = a(165572, { 13, 14 }), FontOfPower = a(169314, { 13, 14 }), RazorCoral = a(169311, { 13, 14 }), MistcallerOcarina = a(178715, { 13, 14 }), CacheOfAcquiredTreasures = a(188265, { 13, 14 }), PotionofSpectralAgility = a(171270), Healthstone = a(5512), HealPot = a(171267), CosmicHealPot = a(187802), PhialofSerenity = a(177278) }
a.Rogue.Subtlety = { ComputationDevice = a(167555, { 13, 14 }), VigorTrinket = a(165572, { 13, 14 }), FontOfPower = a(169314, { 13, 14 }), RazorCoral = a(169311, { 13, 14 }), MistcallerOcarina = a(178715, { 13, 14 }), CacheOfAcquiredTreasures = a(188265, { 13, 14 }), PotionofSpectralAgility = a(171270), Healthstone = a(5512), HealPot = a(171267), CosmicHealPot = a(187802), PhialofSerenity = a(177278) }
function o.Stealth(a, o)
    s = 0
    i = 0
    if ((h.Commons.StealthOOC == "Always" or (h.Commons.StealthOOC == "w/ Target" and c.TargetIsValid())) and a:IsCastable() and t:StealthDown() and not t:DebuffUp(e(319070))) then
        if n.Cast(a, nil) then
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
        s = 0
        i = 0
        if e:IsCastable() and t:HealthPercentage() <= h.Commons.CrimsonVialHP then
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
        s = 0
        i = 0
        if e:IsCastable() and t:BuffDown(e) and t:HealthPercentage() <= h.Commons.FeintHP then
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
        s = 0
        i = 0
        if e:IsCastable() and t:BuffDown(e) and t:HealthPercentage() <= h.Commons.EvasionHP then
            if n.Cast(e, nil) then
                i = 5277
                return "Cast Evasion (Defensives)"
            end

        end

    end

end

do
    local l = e(3408)
    local h = e(2823)
    local u = e(315584)
    local d = e(5761)
    local r = e(8679)
    local e = e(381637)
    function o.Poisons()
        s = 0
        i = 0
        local a = t:AffectingCombat() and 180 or 900
        local e
        e = t:BuffRemains(r)
        if e > 0 then
            if e < a then
                if n.Cast(r) then
                    i = 203
                    return "Wound Poison Refresh"
                end

            end

        else
            if h:IsAvailable() then
                e = t:BuffRemains(h)
                if e < a then
                    if n.Cast(h) then
                        i = 204
                        return "Deadly Poison Refresh"
                    end

                end

            else
                e = t:BuffRemains(u)
                if e < a then
                    if n.Cast(u) then
                        i = 205
                        return "Instant Poison Refresh"
                    end

                end

            end

        end

        e = t:BuffRemains(l)
        if e > 0 then
            if e < a then
                if n.Cast(l) then
                    i = 206
                    return "Crippling Poison Refresh"
                end

            end

        else
            e = t:BuffRemains(d)
            if e < a then
                if n.Cast(d) then
                    i = 204
                    return "Numbing Poison Refresh"
                end

            end

        end

    end

end

function o.MfDSniping(u)
    s = 0
    i = 0
    if u:IsCastable() and (t:AffectingCombat() or HeroRotationCharDB.Toggles[6]) then
        local e, o = nil, 60
        local c = l:IsInRange(30) and l:TimeToDie() or 11111
        for a, i in m(t:GetEnemiesInRange(30)) do
            local a = i:TimeToDie()
            if not i:IsMfDBlacklisted() and a < t:ComboPointsDeficit() * 1.5 and a < o then
                if c - a > 1 then
                    e, o = i, a
                else
                    e, o = l, c
                end

            end

        end

        if e and e:GUID() ~= r:GUID() then
            n.CastLeftNameplate(e, u)
                        if e:GUID() == d("mouseover"):GUID() and h.Subtlety.TargetSwap == "Mouseover" then
                s = 1117
            elseif h.Subtlety.TargetSwap == "AutoSwap" and e:GUID() ~= r:GUID() and not f then
                s = 999
            end

        end

    end

end

function o.CanDoTUnit(e, t)
    return c.CanDoTUnit(e, t)
end

do
    local e = e(193531)
    function o.CPMaxSpend()
        return e:IsAvailable() and 6 or 5
    end

end

function o.CPSpend()
    return w(t:ComboPoints(), o.CPMaxSpend())
end

function o.TimeToNextTornado()
    if t:BuffUp(S.ShurikenTornado) then
                                if t:BuffRemains(S.ShurikenTornado) <= 4 and t:BuffRemains(S.ShurikenTornado) > 3 then
            return t:BuffRemains(S.ShurikenTornado) - 3
        elseif t:BuffRemains(S.ShurikenTornado) <= 3 and t:BuffRemains(S.ShurikenTornado) > 2 then
            return t:BuffRemains(S.ShurikenTornado) - 2
        elseif t:BuffRemains(S.ShurikenTornado) <= 2 and t:BuffRemains(S.ShurikenTornado) > 1 then
            return t:BuffRemains(S.ShurikenTornado) - 1
        elseif t:BuffRemains(S.ShurikenTornado) <= 1 then
            return t:BuffRemains(S.ShurikenTornado)
        end

    end

end

do
    local i = e(323558)
    local a = e(323559)
    local a = e(323560)
    function o.AnimachargedCP()
                                if t:BuffUp(e.Rogue.Commons.EchoingReprimand2) then
            return 2
        elseif t:BuffUp(e.Rogue.Commons.EchoingReprimand3) then
            return 3
        elseif t:BuffUp(e.Rogue.Commons.EchoingReprimand4) then
            return 4
        elseif t:BuffUp(e.Rogue.Commons.EchoingReprimand5) then
            return 5
        end

        return -1
    end

    function o.EffectiveComboPoints(a)
        if ((a == 2 and t:BuffUp(i)) or (a == 3 and t:BuffUp(e.Rogue.Commons.EchoingReprimand3)) or (a == 4 and t:BuffUp(e.Rogue.Commons.EchoingReprimand4)) or (a == 5 and t:BuffUp(e.Rogue.Commons.EchoingReprimand5))) then
            return 7
        else
            return a
        end

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
    local i = e.Rogue.Assassination.Garrote
    local a = e.Rogue.Assassination.Rupture
    local t = e.Rogue.Assassination.CrimsonTempest
    local e = e.Rogue.Assassination.InternalBleeding
    function o.Bleeds()
        return (r:DebuffUp(i) and 1 or 0) + (r:DebuffUp(a) and 1 or 0) + (r:DebuffUp(t) and 1 or 0) + (r:DebuffUp(e) and 1 or 0)
    end

end

do
    local a = e.Rogue.Assassination.Garrote
    local i = e.Rogue.Assassination.InternalBleeding
    local n = e.Rogue.Assassination.Rupture
    local e = 0
    function o.PoisonedBleeds()
        e = 0
        for s, t in m(t:GetEnemiesInRange(50)) do
            if o.Poisoned(t) then
                if t:DebuffUp(a) then
                    e = e + 1
                end

                if t:DebuffUp(i) then
                    e = e + 1
                end

                if t:DebuffUp(n) then
                    e = e + 1
                end

            end

        end

        return e
    end

end

do
    local e, a = e(340094), 4
    function o.MasterAssassinsMarkRemains()
        if t:BuffRemains(e) < 0 then
            return t:GCDRemains() + a
        else
            return t:BuffRemains(e)
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
    if s == 0 then
        return 0
    else
        return s
    end

end


