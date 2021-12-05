local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.MouseOver;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=HeroRotation;local n=m.Commons.Everyone;local o=math.min;local pairs=pairs;local p={}local q=HeroRotationCharDB.Toggles[12]m.Commons.Rogue=p;local r={General=m.GUISettings.General,Commons=m.GUISettings.APL.Rogue.Commons,Assassination=m.GUISettings.APL.Rogue.Assassination,Outlaw=m.GUISettings.APL.Rogue.Outlaw,Subtlety=m.GUISettings.APL.Rogue.Subtlety}local s=0;local t=0;if not j.Rogue then j.Rogue={}end;j.Rogue.Assassination={AncestralCall=j(274738),ArcanePulse=j(260364),ArcaneTorrent=j(25046),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),Shadowmeld=j(58984),Ambush=j(8676),DeadlyPoison=j(2823),DeadlyPoisonDebuff=j(2818),Envenom=j(32645),FanofKnives=j(51723),Garrote=j(703),Mutilate=j(1329),PoisonedKnife=j(185565),Rupture=j(1943),SliceandDice=j(315496),Stealth=j(1784),Stealth2=j(115191),Vanish=j(1856),VanishBuff=j(11327),Vendetta=j(79140),WoundPoison=j(8679),WoundPoisonDebuff=j(8680),BlindsideBuff=j(121153),CrimsonTempest=j(121411),DeeperStratagem=j(193531),Elusiveness=j(79008),Exsanguinate=j(200806),HiddenBladesBuff=j(270070),InternalBleeding=j(154953),MarkedforDeath=j(137619),MasterAssassin=j(255989),MasterAssassinBuff=j(256735),Nightstalker=j(14062),PreyontheWeak=j(131511),PreyontheWeakDebuff=j(255909),Shiv=j(5938),ShivDebuff=j(319504),Subterfuge=j(108208),SubterfugeBuff=j(115192),VenomRush=j(152152),CloakofShadows=j(31224),CrimsonVial=j(185311),Evasion=j(5277),Feint=j(1966),Blind=j(2094),CheapShot=j(1833),Kick=j(1766),KidneyShot=j(408),Sap=j(6770),Shadowstep=j(36554),Sprint=j(2983),TricksoftheTrade=j(57934),DeathfromAbove=j(269513),Maneuverability=j(197000),Neurotoxin=j(206328),SmokeBomb=j(212182),EchoingReprimand=j(323547),Flagellation=j(323654),FlagellationBuff=j(345569),Sepsis=j(328305),SepsisBuff=j(347037),SerratedBoneSpike=j(328547),SerratedBoneSpikeDebuff=j(324073),LeadbyExample=j(342156),LeadbyExampleBuff=j(342181),MarrowedGemstoneBuff=j(327069),PoolEnergy=j(999910)}j.Rogue.Outlaw={AncestralCall=j(274738),ArcanePulse=j(260364),ArcaneTorrent=j(25046),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),Shadowmeld=j(58984),AdrenalineRush=j(13750),Ambush=j(8676),BetweentheEyes=j(315341),BladeFlurry=j(13877),Dispatch=j(2098),Elusiveness=j(79008),Opportunity=j(195627),PistolShot=j(185763),RolltheBones=j(315508),Shiv=j(5938),SinisterStrike=j(193315),SliceandDice=j(315496),Stealth=j(1784),Vanish=j(1856),VanishBuff=j(11327),AcrobaticStrikes=j(196924),BladeRush=j(271877),DeeperStratagem=j(193531),Dreadblades=j(343142),GhostlyStrike=j(196937),KillingSpree=j(51690),LoadedDiceBuff=j(256171),MarkedforDeath=j(137619),PreyontheWeak=j(131511),PreyontheWeakDebuff=j(255909),QuickDraw=j(196938),CloakofShadows=j(31224),CrimsonVial=j(185311),Evasion=j(5277),Feint=j(1966),Blind=j(2094),CheapShot=j(1833),Gouge=j(1776),GrapplingHook=j(195457),Kick=j(1766),KidneyShot=j(408),Sap=j(6770),Sprint=j(2983),TricksoftheTrade=j(57934),DeathfromAbove=j(269513),Dismantle=j(207777),Maneuverability=j(197000),PlunderArmor=j(198529),SmokeBomb=j(212182),ThickasThieves=j(221622),Broadside=j(193356),BuriedTreasure=j(199600),GrandMelee=j(193358),RuthlessPrecision=j(193357),SkullandCrossbones=j(199603),TrueBearing=j(193359),EchoingReprimand=j(323547),Flagellation=j(323654),FlagellationBuff=j(345569),Sepsis=j(328305),SepsisBuff=j(347037),SerratedBoneSpike=j(328547),SerratedBoneSpikeDebuff=j(324073),Ambidexterity=j(341542),CountTheOdds=j(341546),ConcealedBlunderbuss=j(340587),DeathlyShadowsBuff=j(341202),GreenskinsWickers=j(340573),MasterAssassinsMark=j(340094),PoolEnergy=j(999910),SinfulRevelationDebuff=j(324260)}j.Rogue.Subtlety={AncestralCall=j(274738),ArcanePulse=j(260364),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),Shadowmeld=j(58984),Backstab=j(53),BlackPowder=j(319175),Elusiveness=j(79008),Eviscerate=j(196819),FindWeaknessDebuff=j(316220),Rupture=j(1943),ShadowBlades=j(121471),ShadowDance=j(185313),ShadowDanceBuff=j(185422),Shadowstrike=j(185438),Shiv=j(5938),ShurikenStorm=j(197835),ShurikenToss=j(114014),SliceandDice=j(315496),Stealth=j(1784),Stealth2=j(115191),SymbolsofDeath=j(212283),SymbolsofDeathCrit=j(227151),Vanish=j(1856),VanishBuff=j(11327),VanishBuff2=j(115193),Alacrity=j(193539),DarkShadow=j(245687),DeeperStratagem=j(193531),EnvelopingShadows=j(238104),Gloomblade=j(200758),MarkedforDeath=j(137619),MasterofShadows=j(196976),Nightstalker=j(14062),PreyontheWeak=j(131511),PreyontheWeakDebuff=j(255909),Premeditation=j(343160),PremeditationBuff=j(343173),SecretTechnique=j(280719),ShadowFocus=j(108209),ShurikenTornado=j(277925),Subterfuge=j(108208),Vigor=j(14983),Weaponmaster=j(193537),CloakofShadows=j(31224),CrimsonVial=j(185311),Evasion=j(5277),Feint=j(1966),Blind=j(2094),CheapShot=j(1833),Kick=j(1766),KidneyShot=j(408),Sap=j(6770),Shadowstep=j(36554),Sprint=j(2983),TricksoftheTrade=j(57934),ColdBlood=j(213981),DeathfromAbove=j(269513),Maneuverability=j(197000),ShadowyDuel=j(207736),SmokeBomb=j(212182),VeilofMidnight=j(198952),EchoingReprimand=j(323547),Flagellation=j(323654),FlagellationBuff=j(345569),Sepsis=j(328305),SepsisBuff=j(347037),SerratedBoneSpike=j(328547),SerratedBoneSpikeDebuff=j(324073),DeeperDaggers=j(341549),LeadbyExample=j(342156),LeadbyExampleBuff=j(342181),DeathlyShadowsBuff=j(341202),FinalityBlackPowder=j(340603),FinalityEviscerate=j(340600),FinalityRupture=j(340601),TheRottenBuff=j(341134),PoolEnergy=j(999910),SinfulRevelationDebuff=j(324260)}if not l.Rogue then l.Rogue={}end;l.Rogue.Assassination={GalecallersBoon=l(159614,{13,14}),LustrousGoldenPlumage=l(159617,{13,14}),ComputationDevice=l(167555,{13,14}),VigorTrinket=l(165572,{13,14}),FontOfPower=l(169314,{13,14}),RazorCoral=l(169311,{13,14})}l.Rogue.Outlaw={ComputationDevice=l(167555,{13,14}),VigorTrinket=l(165572,{13,14}),FontOfPower=l(169314,{13,14}),RazorCoral=l(169311,{13,14}),MistcallerOcarina=l(178715,{13,14}),PotionofSpectralAgility=l(171270),Healthstone=l(5512),HealPot=l(171267),PhialofSerenity=l(177278)}l.Rogue.Subtlety={ComputationDevice=l(167555,{13,14}),VigorTrinket=l(165572,{13,14}),FontOfPower=l(169314,{13,14}),RazorCoral=l(169311,{13,14}),MistcallerOcarina=l(178715,{13,14}),PotionofSpectralAgility=l(171270),Healthstone=l(5512),HealPot=l(171267),PhialofSerenity=l(177278)}function p.Stealth(u,v)t=0;s=0;if r.Commons.StealthOOC and u:IsCastable()and g:StealthDown()and not g:DebuffUp(j(319070))then if m.Cast(u,nil)then s=200;return"Cast Stealth (OOC)"end else s=0 end;return false end;do local w=j(185311)function p.CrimsonVial()t=0;s=0;if w:IsCastable()and g:HealthPercentage()<=r.Commons.CrimsonVialHP then if m.Cast(w,nil)then s=201;return"Cast Crimson Vial (Defensives)"end end;return false end end;do local x=j(1966)function p.Feint()t=0;s=0;if x:IsCastable()and g:BuffDown(x)and g:HealthPercentage()<=r.Commons.FeintHP then if m.Cast(x,nil)then s=202;return"Cast Feint (Defensives)"end end end end;do local y=j(3408)local z=j(2823)local A=j(315584)local B=j(5761)local C=j(8679)function p.Poisons()t=0;s=0;local D=g:AffectingCombat()and 180 or 900;local E;E=g:BuffRemains(C)if E>0 then if E<D then if m.Cast(C)then s=203;return"Wound Poison Refresh"end end else if z:IsAvailable()then E=g:BuffRemains(z)if E<D then if m.Cast(z)then s=204;return"Deadly Poison Refresh"end end else E=g:BuffRemains(A)if E<D then if m.Cast(A)then s=205;return"Instant Poison Refresh"end end end end;E=g:BuffRemains(y)if E>0 then if E<D then if m.Cast(y)then s=206;return"Crippling Poison Refresh"end end else E=g:BuffRemains(B)if E<D then if m.Cast(B)then s=204;return"Numbing Poison Refresh"end end end end end;function p.MfDSniping(F)t=0;s=0;if F:IsCastable()and(g:AffectingCombat()or HeroRotationCharDB.Toggles[6])then local G,H=nil,60;local I=i:IsInRange(30)and i:TimeToDie()or 11111;for J,K in pairs(g:GetEnemiesInRange(30))do local L=K:TimeToDie()if not K:IsMfDBlacklisted()and L<g:ComboPointsDeficit()*1.5 and L<H then if I-L>1 then G,H=K,L else G,H=i,I end end end;if G and G:GUID()~=h:GUID()then m.CastLeftNameplate(G,F)if G:GUID()==f("mouseover"):GUID()and r.Subtlety.TargetSwap=="Mouseover"then t=1117 elseif r.Subtlety.TargetSwap=="AutoSwap"and G:GUID()~=h:GUID()and not q then t=999 end end end end;function p.CanDoTUnit(K,M)return n.CanDoTUnit(K,M)end;do local N=j(193531)function p.CPMaxSpend()return N:IsAvailable()and 6 or 5 end end;function p.CPSpend()return o(g:ComboPoints(),p.CPMaxSpend())end;do local O=j(323558)local P=j(323559)local Q=j(323560)function p.AnimachargedCP()if g:BuffUp(O)then return 2 elseif g:BuffUp(P)then return 3 elseif g:BuffUp(Q)then return 4 end;return-1 end;function p.EffectiveComboPoints(R)if p.AnimachargedCP()==R then return 7 end;return R end end;do local S=j.Rogue.Assassination.DeadlyPoisonDebuff;local T=j.Rogue.Assassination.WoundPoisonDebuff;function p.Poisoned(K)return(K:DebuffUp(S)or K:DebuffUp(T))and true or false end end;do local S=j.Rogue.Assassination.DeadlyPoisonDebuff;local T=j.Rogue.Assassination.WoundPoisonDebuff;function p.PoisonRemains(K)return K:DebuffUp(S)and K:DebuffRemains(S)or K:DebuffUp(T)and K:DebuffRemains(T)or 0 end end;do local U=j.Rogue.Assassination.Garrote;local V=j.Rogue.Assassination.Rupture;local W=j.Rogue.Assassination.CrimsonTempest;local X=j.Rogue.Assassination.InternalBleeding;function p.Bleeds()return(h:DebuffUp(U)and 1 or 0)+(h:DebuffUp(V)and 1 or 0)+(h:DebuffUp(W)and 1 or 0)+(h:DebuffUp(X)and 1 or 0)end end;do local U=j.Rogue.Assassination.Garrote;local X=j.Rogue.Assassination.InternalBleeding;local V=j.Rogue.Assassination.Rupture;local Y=0;function p.PoisonedBleeds()Y=0;for J,K in pairs(g:GetEnemiesInRange(50))do if p.Poisoned(K)then if K:DebuffUp(U)then Y=Y+1 end;if K:DebuffUp(X)then Y=Y+1 end;if K:DebuffUp(V)then Y=Y+1 end end end;return Y end end;do local Z,_=j(340094),4;function p.MasterAssassinsMarkRemains()if g:BuffRemains(Z)<0 then return g:GCDRemains()+_ else return g:BuffRemains(Z)end end end;function p.ReturnSpell()if s==0 then return 0 else return s end end;function p.ReturnSpellMO()if t==0 then return 0 else return t end end