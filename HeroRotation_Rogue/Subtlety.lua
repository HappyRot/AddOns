local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=d.Spell;local j=d.MultiSpell;local k=d.Item;local l=d.Utils.BoolToInt;local m=HeroRotation;local n=m.AoEON;local o=m.CDsON;local p=HeroRotationCharDB.Toggles[4]local q=HeroRotationCharDB.Toggles[5]local r=HeroRotationCharDB.Toggles[6]local s=HeroRotationCharDB.Toggles[12]local t=HeroRotationCharDB.Toggles[15]local u=HeroRotationCharDB.Toggles[20]local v=HeroRotationCharDB.Toggles[21]local w=HeroRotationCharDB.Toggles[22]local x=HeroRotationCharDB.Toggles[23]local y=HeroRotationCharDB.Toggles[24]local z=HeroRotationCharDB.Toggles[25]local A=HeroRotationCharDB.Toggles[26]local B=HeroRotationCharDB.Toggles[27]local C=HeroRotationCharDB.Toggles[28]local D=HeroRotationCharDB.Toggles[29]local E=HeroRotationCharDB.Toggles[30]local F={228318,178658,333227,334800,334967,324737,326450,334470,326450,320703,320012,324085,333241,331510}local G=nil;local H=nil;local I=false;local J=false;local K=false;local L=false;local M=false;local N=true;local O=0;local P=0;local Q=GetInventoryItemID("player",13)local R=GetInventoryItemID("player",14)local pairs=pairs;local S=table.insert;local T=math.min;local U=math.max;local V=math.abs;local W=m.Commons.Everyone;local X=m.Commons.Rogue;local Y=i.Rogue.Subtlety;local Z=k.Rogue.Subtlety;local _={Z.MistcallerOcarina:ID()}local a0,a1,a2,a3;local a4;local a5=X.ReturnSpell()local a6=X.ReturnSpellMO()local a7,a8,a9;local aa,ab;local ac,ad;local ae,af,ag;local ah;local ai=g:HasLegendaryEquipped(129)local aj=g:HasLegendaryEquipped(116)local ak=g:HasLegendaryEquipped(127)local al=g:HasLegendaryEquipped(117)local am=g:HasLegendaryEquipped(126)local an=g:HasLegendaryEquipped(229)local ao=g:HasLegendaryEquipped(231)d:RegisterForEvent(function()ai=g:HasLegendaryEquipped(129)aj=g:HasLegendaryEquipped(116)ak=g:HasLegendaryEquipped(127)al=g:HasLegendaryEquipped(117)am=g:HasLegendaryEquipped(126)an=g:HasLegendaryEquipped(229)ao=g:HasLegendaryEquipped(231)end,"PLAYER_EQUIPMENT_CHANGED")local function ap(self,aq,ar,as,at)if ar==UnitGUID("player")then local au,av,aw,ax,ay,az,aA,aB,aC,aD,aE,at,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ=CombatLogGetCurrentEventInfo()if av=="SWING_DAMAGE"and au>P then P=au;O=O+1 elseif av=="SPELL_ENERGIZE"and ax==UnitGUID("player")and at==196911 then P=au;O=0 end end end;local aR=CreateFrame("Frame")aR:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")aR:SetScript("OnEvent",ap)Y.Eviscerate:RegisterDamageFormula(function()return g:AttackPowerDamageMod()*ae*0.176*1.21*(Y.Nightstalker:IsAvailable()and g:StealthUp(true,false)and 1.12 or 1)*(Y.DeeperStratagem:IsAvailable()and 1.05 or 1)*(Y.DarkShadow:IsAvailable()and g:BuffUp(Y.ShadowDanceBuff)and 1.3 or 1)*(not Y.DarkShadow:IsAvailable()and g:BuffUp(Y.ShadowDanceBuff)and 1.15 or 1)*(g:BuffUp(Y.SymbolsofDeath)and 1.15 or 1)*(g:BuffUp(Y.FinalityEviscerate)and 1.25 or 1)*(1+g:MasteryPct()/100)*(1+g:VersatilityDmgPct()/100)*(h:DebuffUp(Y.FindWeaknessDebuff)and 1.5 or 1)*(h:DebuffUp(Y.SinfulRevelationDebuff)and 1.06 or 1)end)Y.Rupture:RegisterPMultiplier(function()return Y.Nightstalker:IsAvailable()and g:StealthUp(true,false)and 1.12 or 1 end)local aS={General=m.GUISettings.General,Commons=m.GUISettings.APL.Rogue.Commons,Subtlety=m.GUISettings.APL.Rogue.Subtlety}local function aT(aU,EnergyThreshold)if not a7 then a7=aU;a8=EnergyThreshold or 0 end end;local function aV(aU)if not a9 then a9=aU end end;local function aW()if aS.Subtlety.BurnShadowDance=="On Bosses not in Dungeons"and g:IsInDungeonArea()then return false elseif aS.Subtlety.BurnShadowDance~="Always"and not h:IsInBossList()then return false else return true end end;local function aX(af)ae=af;if af==2 and g:BuffUp(Y.EchoingReprimand2)or af==3 and g:BuffUp(Y.EchoingReprimand3)or af==4 and g:BuffUp(Y.EchoingReprimand4)or af==5 and g:BuffUp(Y.EchoingReprimand5)then ae=7;return 7 else ae=af;return af end;local aY,aZ=UnitAttackSpeed("unit")local a_=(aY+aZ)/2;local b0=a_/2;local b1=(4-O)*b0;local b2=(5-O)*b0;if ae>af and ag>2 and Y.EchoingReprimand:CooldownRemains()>5 and g:AffectingCombat()then if af==2 and not g:BuffUp(Y.EchoingReprimand3)or af==3 and not g:BuffUp(Y.EchoingReprimand4)or af==4 and not g:BuffUp(Y.EchoingReprimand5)then local b3=b1;if b3==0 then b3=b2 end;if b3<U(g:EnergyTimeToX(35),g:GCDRemains())+0.5 then ae=af end end end end;local function b4()if a2<2 then return false elseif aS.Commons.UsePriorityRotation=="Always"then return true elseif aS.Commons.UsePriorityRotation=="On Bosses"and h:IsInBossList()then return true elseif aS.Commons.UsePriorityRotation=="Auto"then if g:InstanceDifficulty()==16 and h:NPCID()==138967 then return true elseif h:NPCID()==166969 or h:NPCID()==166971 or h:NPCID()==166970 then return true end end;return false end;local function b5(b6,b7,b8,b9)local ba,bb=nil,b8;local bc=h:GUID()for bd,be in pairs(b9)do if be:GUID()~=bc and W.UnitIsCycleValid(be,bb,-be:DebuffRemains(b6))and b7(be)then ba,bb=be,be:TimeToDie()end end;if ba then m.CastLeftNameplate(ba,b6)if ba:GUID()==f("mouseover"):GUID()and aS.Subtlety.TargetSwap=="Mouseover"then if b6==Y.Rupture then a6=11943 elseif b6==Y.SerratedBoneSpike then a6=1328547 end elseif aS.Subtlety.TargetSwap=="AutoSwap"and ba:GUID()~=h:GUID()and not s then a6=9999 end elseif false then ba,bb=nil,b8;for bd,be in pairs(a1)do if be:GUID()~=bc and W.UnitIsCycleValid(be,bb,-be:DebuffRemains(b6))and b7(be)then ba,bb=be,be:TimeToDie()end end;if ba then m.CastLeftNameplate(ba,b6)if ba:GUID()==f("mouseover"):GUID()and aS.Subtlety.TargetSwap=="Mouseover"then if b6==Y.Rupture then a6=11943 elseif b6==Y.SerratedBoneSpike then a6=1328547 end elseif aS.Subtlety.TargetSwap=="AutoSwap"and ba:GUID()~=h:GUID()and not s then a6=9999 end end end end;local function bf(bg)if bg then return 1 else return 0 end end;local function bh(bi)return bi:DebuffRemains(Y.FindWeaknessDebuff)end;local function bj(bi)if not ah and bi:DebuffRemains(Y.FindWeaknessDebuff)<1 and a2<=3 and bi:TimeToDie()>6 and bi:IsInRange(8)and bi:GUID()==f("mouseover"):GUID()and aS.Subtlety.TargetSwap=="Mouseover"then a6=1185438;return true elseif not ah and bi:DebuffRemains(Y.FindWeaknessDebuff)<1 and a2<=3 and bi:TimeToDie()>6 and bi:IsInRange(8)and aS.Subtlety.TargetSwap=="AutoSwap"and bi:GUID()~=h:GUID()and not s then a6=9999;return true elseif not ah and bi:DebuffRemains(Y.FindWeaknessDebuff)<1 and a2<=3 and bi:TimeToDie()>6 and bi:IsInRange(8)and bi:GUID()==h:GUID()then a5=185438;return true elseif not ah and bi:DebuffRemains(Y.FindWeaknessDebuff)<1 and a2<=3 and bi:TimeToDie()>6 and bi:IsInRange(8)then return true end end;local function bk()return 25+bf(Y.Vigor:IsAvailable())*20+bf(Y.MasterofShadows:IsAvailable())*20+bf(Y.ShadowFocus:IsAvailable())*25+bf(Y.Alacrity:IsAvailable())*20+bf(a2>=4)*25 end;local function bl()return Y.ShadowDance:ChargesFractional()>=1.75 end;local function bm()if ah and a2>=4 then return ag<=1 elseif Y.EchoingReprimand:IsAvailable()then return ag>=3 else return ag>=2+bf(g:BuffUp(Y.ShadowBlades))end end;local function bn()return g:BuffUp(Y.SliceandDice)or a2>=6 end;local function bo()return Y.Premeditation:IsAvailable()and a2<5-bf(Y.SerratedBoneSpike:IsAvailable())and not Y.EchoingReprimand:IsAvailable()end;local function bp(bq)return X.MasterAssassinsMarkRemains()>0 or not Y.Nightstalker:IsAvailable()and Y.DarkShadow:IsAvailable()and bq or a2>=4 end;local function br()local bq=g:BuffUp(Y.ShadowDanceBuff)or StealthSpell and StealthSpell:ID()==Y.ShadowDance:ID()af=g:ComboPoints()ae=aX(af)if Y.SliceandDice:IsCastable(BypassRecovery)then if not bo()and a2<6 and not g:BuffUp(Y.ShadowDanceBuff)and d.FilteredFightRemains(a1,">",g:BuffRemains(Y.SliceandDice))and g:BuffRefreshable(Y.SliceandDice)then if Y.SliceandDice:IsReady(BypassRecovery)and m.Cast(Y.SliceandDice)then a5=5171;return"Cast Slice and Dice (not Premed)"end end;if bo()and Y.ShadowDance:ChargesFractional()<1.75 and g:BuffRemains(Y.SliceandDice)<Y.SymbolsofDeath:CooldownRemains()and(Y.ShadowDance:CooldownRemains()<=0 and g:BuffRemains(Y.SymbolsofDeath)-g:BuffRemains(Y.ShadowDanceBuff)<1.2)then if Y.SliceandDice:IsReady(BypassRecovery)and m.Cast(Y.SliceandDice)then a5=5171;return"Cast Slice and Dice (Premed)"end end end;local bs=bp(bq)if(not bs or ah)and Y.Rupture:IsCastable()then if h:IsInMeleeRange(8)and(h:FilteredTimeToDie(">",6,-h:DebuffRemains(Y.Rupture))or h:TimeToDieIsNotValid())and X.CanDoTUnit(h,ad)and h:DebuffRefreshable(Y.Rupture,ac)then if Y.Rupture:IsReady(BypassRecovery)and m.Cast(Y.Rupture)then a5=1943;return"Cast Rupture 1"end end end;if Y.SecretTechnique:IsReady(BypassRecovery)then if m.Cast(Y.SecretTechnique)then a5=280719;return"Cast Secret Technique"end end;if not bs and Y.Rupture:IsCastable(BypassRecovery)then if not bs and not ah and a2>=2 then local function bt(bi)return W.CanDoTUnit(bi,ad)and bi:DebuffRefreshable(Y.Rupture,ac)end;b5(Y.Rupture,bt,5+2*ae,a3)end;if h:IsInMeleeRange(5)and h:DebuffRemains(Y.Rupture)<Y.SymbolsofDeath:CooldownRemains()+10 and(Y.SymbolsofDeath:CooldownRemains()<=5 or not L)and X.CanDoTUnit(h,ad)and h:FilteredTimeToDie(">",5+Y.SymbolsofDeath:CooldownRemains(),-h:DebuffRemains(Y.Rupture))then if Y.Rupture:IsReady(BypassRecovery)and m.Cast(Y.Rupture)then a5=1943;return"Cast Rupture 2"end end end;if Y.BlackPowder:IsCastable(BypassRecovery)and not ah and a2>=3 and not u then if Y.BlackPowder:IsReady(BypassRecovery)and m.Cast(Y.BlackPowder)then a5=319175;return"Cast Black Powder"end end;if Y.Eviscerate:IsCastable()and h:IsInMeleeRange(8)then if Y.Eviscerate:IsReady(BypassRecovery)and m.Cast(Y.Eviscerate)then a5=196819;return"Cast Eviscerate"end end end;local function bu()local bv=g:BuffUp(aa)or StealthSpell and StealthSpell:ID()==aa:ID()local bw=g:BuffUp(ab)or StealthSpell and StealthSpell:ID()==Y.Vanish:ID()local bq=g:BuffUp(Y.ShadowDanceBuff)or StealthSpell and StealthSpell:ID()==Y.ShadowDance:ID()local bx=Y.Shadowstrike:IsCastable()or bv or bw or bq;af=g:ComboPoints()ae=aX(af)if bx and h:IsInMeleeRange(aS.Subtlety.ShadowStrikeRange)and(bv or bw)and(a2<4 or ah)and X.MasterAssassinsMarkRemains()==0 then if m.Cast(Y.Shadowstrike,nil,nil)then a5=185438;return"Cast Shadowstrike (Stealth)"end end;if ae>=X.CPMaxSpend()then return br()end;if g:BuffUp(Y.ShurikenTornado)and ag<=2 then return br()end;if a2>=4 and ae>=4 then return br()end;if ag<=1-bf(Y.DeeperStratagem:IsAvailable()and bw)then return br()end;if bx and h:IsInMeleeRange(aS.Subtlety.ShadowStrikeRange)and not g:StealthUp(true,false)and g:BuffUp(Y.SepsisBuff)and a2<4 then if m.Cast(Y.Shadowstrike,nil,nil)then a5=185438;return"Cast Shadowstrike (Sepsis)"end end;if Y.Shiv:IsReady()and aj and Y.Nightstalker:IsAvailable()and a2<5 then if m.Cast(Y.Shiv)then a5=5938;return"Cast Shiv (TTB NS)"end end;if Y.Shadowstrike:IsCastable()then if not ah and h:DebuffRemains(Y.FindWeaknessDebuff)<1 and a2<=3 and d.BossFilteredFightRemains("<=",5)then if m.Cast(Y.Shadowstrike)then a5=185438;return"Cast Shadowstrike (Prio Rotation)"end end;if W.CastTargetIf(Y.Shadowstrike,MeleeEnemies8y,"min",bh,bj)then return"Find the Weakness/ShadowStrike 26"end end;if bx and h:IsInMeleeRange(aS.Subtlety.ShadowStrikeRange)and ah and(h:DebuffRemains(Y.FindWeaknessDebuff)<1 or Y.Weaponmaster:IsAvailable()and a2<=4)then if m.Cast(Y.Shadowstrike)then a5=185438;return"Cast Shadowstrike (Prio Rotation)"end end;if Y.ShurikenStorm:IsCastable()and ae<X.CPMaxSpend()and a2>=3+bf(g:BuffUp(Y.TheRottenBuff)or ak)and(g:BuffUp(Y.SymbolsofDeathCrit)or not g:BuffUp(Y.PremeditationBuff)or a2>=5 and ae<X.CPMaxSpend())then if m.Cast(Y.ShurikenStorm)then a5=197835;return"Cast Shuriken Storm"end end;if bx and ae<X.CPMaxSpend()and h:IsInMeleeRange(aS.Subtlety.ShadowStrikeRange)and(h:DebuffRemains(Y.FindWeaknessDebuff)<1 or Y.SymbolsofDeath:CooldownRemains()<18 and L and h:DebuffRemains(Y.FindWeaknessDebuff)<Y.SymbolsofDeath:CooldownRemains())then if m.Cast(Y.Shadowstrike)then a5=185438;return"Cast Shadowstrike (FW Refresh)"end end;if bx and ae<X.CPMaxSpend()and h:IsInMeleeRange(aS.Subtlety.ShadowStrikeRange)then if m.Cast(Y.Shadowstrike)then a5=185438;return"Cast Shadowstrike 2"end end end;local function by()local bz=bu(true,StealthSpell)af=g:ComboPoints()ae=aX(af)if StealthSpell==Y.Vanish and(not aS.Subtlety.StealthMacro.Vanish or not bz)and aS.Commons.VanishOffensive and K then if m.Cast(Y.Vanish,nil)then a5=1213;return"Cast Vanish"end;return false elseif StealthSpell==Y.Shadowmeld and(not aS.Subtlety.StealthMacro.Shadowmeld or not bz)then if m.Cast(Y.Shadowmeld,nil)then a5=1214;return"Cast Shadowmeld"end;return false elseif StealthSpell==Y.ShadowDance and(not aS.Subtlety.StealthMacro.ShadowDance or not bz)and J then if m.Cast(Y.ShadowDance,nil)then a5=1212;return"Cast Shadow Dance"end;return false end;local bA={StealthSpell,bz}if EnergyThreshold and g:EnergyPredicted()<EnergyThreshold then return false end;if bA[1]==Y.ShadowDance and bA[2]==Y.DeathfromAbove then a4=m.CastQueue(bA[2],bA[1])if a4 then return"| "..bA[1]:Name()end end;return false end;local function bB()af=g:ComboPoints()ae=aX(af)if g:BuffUp(Y.ShurikenTornado)then if Y.ShadowDance:IsCastable()and J and not g:BuffUp(Y.ShadowDanceBuff)and g:BuffRemains(Y.ShurikenTornado)<=3.5 then if m.Cast(Y.ShadowDance)then a5=185313;return"Cast Shadow Dance (during Tornado)"end end;if Y.SymbolsofDeath:IsCastable()and L and g:BuffRemains(Y.ShurikenTornado)<=3.5 then if m.Cast(Y.SymbolsofDeath)then a5=212283;return"Cast Symbols of Death(during Tornado)"end end end;local bC=bn()if h:IsInMeleeRange(8)then if p and Y.Flagellation:IsReady()and bC and not g:StealthUp(false,false)and g:BuffUp(Y.SymbolsofDeath)and ae>=5 then if m.Cast(Y.Flagellation,nil,nil)then a5=323654;return"Cast Flrgrrlation"end end end;if K and Y.Vanish:IsCastable()and not v and aS.Commons.VanishOffensive and(al and ag<=1-bf(Y.DeeperStratagem:IsAvailable()or ai and ae<1))and g:BuffUp(Y.SymbolsofDeath)and g:BuffUp(Y.ShadowDanceBuff)and X.MasterAssassinsMarkRemains()==0 and g:BuffDown(Y.DeathlyShadowsBuff)then if m.Cast(Y.Vanish,nil,nil)then a5=1856;return"Vanish Macro"end end;if Y.ShurikenTornado:IsAvailable()and M and g:Energy()>=60 and not D and not Y.ShadowFocus:IsAvailable()then if m.CastPooling(Y.ShurikenTornado)then a5=1000;return"Pool for Shuriken Tornado"end end;if Y.ShurikenTornado:IsCastable()and g:Energy()>=60 and bC and Y.SymbolsofDeath:CooldownUp()and Y.ShadowDance:Charges()>=1 and M and(not an or h:DebuffUp(Y.Flagellation)or a2>=1+4*bf(not Y.Nightstalker:IsAvailable()and not Y.DarkShadow:IsAvailable()))and ae<=2 and(not g:BuffUp(Y.PremeditationBuff)or a2>4)and(not Y.Flagellation:IsAvailable()or Y.Flagellation:IsAvailable()and not Y.Flagellation:CooldownUp())then if m.Cast(Y.ShurikenTornado)then a5=277925;return"Cast Shuriken Tornado"end end;if Y.SerratedBoneSpike:IsReady()and(bC or d.BossFilteredFightRemains("<=",5)and a2<3)and not g:BuffUp(Y.PremeditationBuff)and not g:BuffUp(Y.ShurikenTornado)then local function bD(bi)return not bi:DebuffUp(Y.SerratedBoneSpikeDebuff)end;if(h:IsInRange(30)and g:AffectingCombat()or h:IsInRange(20))and bD(h)and h:FilteredTimeToDie(">",21)then if m.Cast(Y.SerratedBoneSpike,nil,nil)then a5=328547;return"Cast Serrated Bone Spike (ST)"end end;if m.AoEON()then b5(Y.SerratedBoneSpike,bD,21,a0)end end;if h:IsInMeleeRange(8)then if p and Y.Sepsis:IsReady()and bC and ag>=1 then if m.Cast(Y.Sepsis,nil,nil)then a5=328305;return"Cast Sepsis"end end;if Y.SymbolsofDeath:IsCastable()and bC and L and(Y.EnvelopingShadows:IsAvailable()or Y.ShadowDance:Charges()>=1)and(not Y.ShurikenTornado:IsAvailable()or Y.ShadowFocus:IsAvailable()or(Y.ShurikenTornado:CooldownRemains()>2 or Y.ShurikenTornado:CooldownUp()or not M))and(not Y.Flagellation:IsAvailable()or(Y.Flagellation:CooldownRemains()>10 or not p)or Y.Flagellation:CooldownUp()and p and ae>=5)then if m.Cast(Y.SymbolsofDeath,nil)then a5=212283;return"Cast Symbols of Death"end end end;if Y.MarkedforDeath:IsCastable()then if h:FilteredTimeToDie("<",ag)then if m.Cast(Y.MarkedforDeath,nil)then a5=137619;return"Cast Marked for Death"end end;if not g:StealthUp(true,true)and ag>=X.CPMaxSpend()then if N then if m.Cast(Y.MarkedforDeath,nil)then a5=137619;return"Cast Marked for Death"end end end;if a2==1 and ag>=X.CPMaxSpend()then if m.Cast(Y.MarkedforDeath,nil)then a5=137619;return"Cast Marked for Death"end end end;if m.CDsON()or not m.CDsON()then if Y.ShadowBlades:IsCastable()and bC and ag>=2 and I and(g:BuffUp(Y.SymbolsofDeath)or d.BossFilteredFightRemains("<=",20))then if m.Cast(Y.ShadowBlades,nil)then a5=121471;return"Cast Shadow Blades"end end;if Y.EchoingReprimand:IsReady()and p and h:IsInMeleeRange(5)and bC and ag>=2 and(ah or a2<=4 or ao)then if m.Cast(Y.EchoingReprimand,nil,nil)then a5=323547;return"Cast Echoing Reprimand"end end;if Y.ShurikenTornado:IsReady()and not D and Y.ShadowFocus:IsAvailable()and bC and g:BuffUp(Y.SymbolsofDeath)and M and ae<=2 and(not g:BuffUp(Y.PremeditationBuff)or a2>4)then if m.Cast(Y.ShurikenTornado)then a5=277925;return"Cast Shuriken Tornado (SF)"end end;if Y.ShadowDance:IsCastable()and(aW()or J)and not g:BuffUp(Y.ShadowDanceBuff)and d.BossFilteredFightRemains("<=",8+bf(Y.Subterfuge:IsAvailable()))then a4=by(Y.ShadowDance)if a4 then return"Shadow Dance Macro (Low TTD) "..a4 end end;if Z.PotionofSpectralAgility:IsReady()and o()and aS.Commons.Enabled.Potions and t and(g:BloodlustUp()or d.BossFilteredFightRemains("<",30)or g:BuffUp(Y.SymbolsofDeath)and(g:BuffUp(Y.ShadowBlades)or Y.ShadowBlades:CooldownRemains()<=10 and I))then if m.Cast(Z.PotionofSpectralAgility,nil)then a5=500;return"potion cooldowns 2"end end;if g:BuffUp(Y.SymbolsofDeath)then if Y.BloodFury:IsCastable()and aS.Commons.Enabled.Racials then if m.Cast(Y.BloodFury,nil)then a5=20572;return"Cast Blood Fury"end end;if Y.Berserking:IsCastable()and aS.Commons.Enabled.Racials then if m.Cast(Y.Berserking,nil)then a5=26297;return"Cast Berserking"end end;if Y.Fireblood:IsCastable()and aS.Commons.Enabled.Racials then if m.Cast(Y.Fireblood,nil)then a5=265221;return"Cast Fireblood"end end;if Y.AncestralCall:IsCastable()and aS.Commons.Enabled.Racials then if m.Cast(Y.AncestralCall,nil)then a5=274738;return"Cast Ancestral Call"end end end;if aS.Commons.Enabled.TopTrinket or aS.Commons.Enabled.BottomTrinket then local bE=g:BuffUp(Y.SymbolsofDeath)or d.BossFilteredFightRemains("<",20)if bE then local bF=g:GetUseableTrinkets(_)if bF then if m.Cast(bF,nil,nil)then if bF:ID()==GetInventoryItemID("player",13)then a5=24;return"Generic use_items for "..bF:Name()elseif bF:ID()==GetInventoryItemID("player",14)then a5=25;return"Generic use_items for "..bF:Name()end end end end end end end;local function bG()af=g:ComboPoints()ae=aX(af)if(m.CDsON()or not m.CDsON())and Y.ShadowDance:TimeSinceLastDisplay()>0.3 and Y.Shadowmeld:TimeSinceLastDisplay()>0.3 then if Y.Vanish:IsCastable()and K and not v and aS.Commons.VanishOffensive and(not bl()or not Y.Nightstalker:IsAvailable()and Y.DarkShadow:IsAvailable())and ag>1 and not al then if m.Cast(Y.Vanish,nil,nil)then a5=1856;return"Vanish Stealth CD"end end;if g:Energy()<40 and Y.Shadowmeld:IsCastable()then if m.CastPooling(Y.Shadowmeld,g:EnergyTimeToX(40))then a5=1000;return"Pool for Shadowmeld"end end;if Y.Shadowmeld:IsCastable()and h:IsInMeleeRange(5)and not g:IsMoving()and g:Energy()>=40 and g:EnergyDeficitPredicted()>=10 and not bl()and ag>1 and h:DebuffRemains(Y.FindWeaknessDebuff)<1 then if m.Cast(Y.Shadowmeld,nil,nil)then a5=58984;return"Shadowmeld Stealth CD"end end end;if bm()and h:IsInMeleeRange(5)and Y.ShadowDance:IsCastable()and J and Y.Vanish:TimeSinceLastDisplay()>0.3 and Y.Shadowmeld:TimeSinceLastDisplay()>0.3 then if(bl()or g:BuffRemains(Y.SymbolsofDeath)>=1.2 or g:BuffUp(i(355829))or a2>=4 and(Y.SymbolsofDeath:CooldownRemains()>10 or not L))and(g:BuffStack(Y.PerforatedVeinsBuff)<4 or a2>2)then if m.Cast(Y.ShadowDance)then a5=185313;return" Shadow Dance Stealth CD"end end;if aW()and(d.BossFilteredFightRemains("<",Y.SymbolsofDeath:CooldownRemains())or not L)and J then if m.Cast(Y.ShadowDance)then a5=185313;return" Shadow Dance Stealth CD"end end end end;local function bH()af=g:ComboPoints()ae=aX(af)local bI=not EnergyThreshold or g:EnergyPredicted()>=EnergyThreshold;if Y.Shiv:IsCastable()and aj and not Y.Nightstalker:IsAvailable()and a2<5 then if m.Cast(Y.Shiv)then a5=5938;return"Cast Shiv (TTB)"end end;if Y.ShurikenStorm:IsCastable()and a2>=2 and(not Y.SerratedBoneSpike:IsAvailable()or Y.SerratedBoneSpike:MaxCharges()-Y.SerratedBoneSpike:ChargesFractional()>=0.25 or a2>=4)and g:BuffStack(Y.PerforatedVeinsBuff)<=4 then if m.Cast(Y.ShurikenStorm)then a5=197835;return"Cast Shuriken Storm"end end;if Y.SerratedBoneSpike:IsCastable()and(Y.SerratedBoneSpike:MaxCharges()-Y.SerratedBoneSpike:ChargesFractional()<=0.25 or Y.LeadbyExample:SoulbindEnabled()and not g:BuffUp(Y.LeadbyExampleBuff)and not d.BossFightRemainsIsNotValid())then if bI and m.Cast(Y.SerratedBoneSpike,nil,nil)then a5=328547;return"Cast Serrated Bone Spike (Capping Filler)"end end;if h:IsInMeleeRange(8)then if Y.Gloomblade:IsCastable()then if bI and m.Cast(Y.Gloomblade)then a5=200758;return"Cast Gloomblade"end elseif Y.Backstab:IsCastable()then if m.Cast(Y.Backstab)then a5=53;return"Cast Backstab"end end end end;local bJ={{Y.Blind,"Cast Blind (Interrupt)",function()return true end},{Y.KidneyShot,"Cast Kidney Shot (Interrupt)",function()return ae>0 end},{Y.CheapShot,"Cast Cheap Shot (Interrupt)",function()return g:StealthUp(true,true)end}}local function bK()r=HeroRotationCharDB.Toggles[6]p=HeroRotationCharDB.Toggles[4]q=HeroRotationCharDB.Toggles[5]s=HeroRotationCharDB.Toggles[12]t=HeroRotationCharDB.Toggles[15]u=HeroRotationCharDB.Toggles[20]v=HeroRotationCharDB.Toggles[21]w=HeroRotationCharDB.Toggles[22]x=HeroRotationCharDB.Toggles[23]y=HeroRotationCharDB.Toggles[24]z=HeroRotationCharDB.Toggles[25]A=HeroRotationCharDB.Toggles[26]B=HeroRotationCharDB.Toggles[27]C=HeroRotationCharDB.Toggles[28]D=HeroRotationCharDB.Toggles[29]E=HeroRotationCharDB.Toggles[30]I=false;J=false;K=false;L=false;N=true;M=false;if aS.Subtlety.IncludedCooldowns.ShadowBlades and o()or aS.Subtlety.IncludedSmallCooldowns.ShadowBlades and(o()or q)or not aS.Subtlety.IncludedSmallCooldowns.ShadowBlades and not aS.Subtlety.IncludedCooldowns.ShadowBlades then I=true end;if aS.Subtlety.IncludedCooldowns.ShadowDance and o()or aS.Subtlety.IncludedSmallCooldowns.ShadowDance and(o()or q)or not aS.Subtlety.IncludedSmallCooldowns.ShadowDance and not aS.Subtlety.IncludedCooldowns.ShadowDance then J=true end;if aS.Subtlety.IncludedCooldowns.Vanish and o()or aS.Subtlety.IncludedSmallCooldowns.Vanish and(o()or q)or not aS.Subtlety.IncludedSmallCooldowns.Vanish and not aS.Subtlety.IncludedCooldowns.Vanish then K=true end;if aS.Subtlety.IncludedCooldowns.SymbolsofDeath and o()or aS.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and(o()or q)or not aS.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and not aS.Subtlety.IncludedCooldowns.SymbolsofDeath then L=true end;if aS.Subtlety.IncludedCooldowns.ShurikenTornado and o()or aS.Subtlety.IncludedSmallCooldowns.ShurikenTornado and(o()or q)or not aS.Subtlety.IncludedSmallCooldowns.ShurikenTornado and not aS.Subtlety.IncludedCooldowns.ShurikenTornado then M=true end;if not aS.Commons.Enabled.TopTrinket then Q=GetInventoryItemID("player",13)else Q=1 end;if not aS.Commons.Enabled.BottomTrinket then R=GetInventoryItemID("player",14)else R=1 end;_={Q,R}end;local function bL()if Y.Subterfuge:IsAvailable()then aa=Y.Stealth2;ab=Y.VanishBuff2 else aa=Y.Stealth;ab=Y.VanishBuff end;a7=nil;a9=nil;a8=0;if n()then a0=g:GetEnemiesInRange(30)MeleeEnemies8y=g:GetEnemiesInMeleeRange(8)a1=g:GetEnemiesInMeleeRange(10)a2=#a1;a3=g:GetEnemiesInMeleeRange(5)else a0={}a1={}a2=0;a3={}end;af=g:ComboPoints()ae=aX(af)ag=g:ComboPointsDeficit()ah=b4()a4=bK()if a4 then return a4 end;if a6>0 then a6=0 end;if a5>0 then a5=0 end;a5=X.ReturnSpell()a6=X.ReturnSpellMO()if m.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then G=GetTime()H=G+m.GUISettings.General.OpenerReset elseif m.GUISettings.General.OpenerReset>0 and H~=nil and GetTime()>H and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]m.ToggleIconFrame:UpdateButtonText(6)m.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if w and Y.CheapShot:IsUsableP()and Y.CheapShot:CooldownRemains(BypassRecovery)<=0 and g:StealthUp(true,true)and not g:PrevGCD(1,Y.CheapShot)then if m.Cast(Y.CheapShot,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Y.CheapShot)then a6=11833;return"queue Cheap Shot MO"else a5=1833;return"queue Cheap Shot"end end elseif(not Y.CheapShot:IsUsableP()or Y.CheapShot:CooldownRemains()>0 or g:PrevGCD(1,Y.CheapShot))and w then HeroRotationCharDB.Toggles[22]=not HeroRotationCharDB.Toggles[22]m.Print("Cheap Shot Queue is now "..(HeroRotationCharDB.Toggles[22]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if x and Y.KidneyShot:IsUsableP()and Y.KidneyShot:CooldownRemains(BypassRecovery)<=0 then if m.Cast(Y.KidneyShot,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Y.KidneyShot)then a6=1408;return"queue Kidney Shot MO"else a5=408;return"queue Kidney Shot"end end elseif g:PrevGCD(1,Y.KidneyShot)and x then HeroRotationCharDB.Toggles[23]=not HeroRotationCharDB.Toggles[23]m.Print("Kidney Shot Queue is now "..(HeroRotationCharDB.Toggles[23]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if y and Y.Blind:IsUsableP()and Y.Blind:CooldownRemains(BypassRecovery)<=0 then if m.Cast(Y.Blind,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Y.Blind)then a6=12094;return"queue Blind MO"end end elseif(not Y.Blind:IsUsableP()or Y.Blind:CooldownRemains()>0)and y then HeroRotationCharDB.Toggles[24]=not HeroRotationCharDB.Toggles[24]m.Print("Blind Queue is now "..(HeroRotationCharDB.Toggles[24]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if z and Y.Sap:IsUsableP()and Y.Sap:CooldownRemains(BypassRecovery)<=0 then if m.Cast(Y.Sap,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Y.Sap)then a6=16770;return"queue Sap MO"else a5=6770;return"queue Sap"end end elseif(not Y.Sap:IsUsableP()or Y.Sap:CooldownRemains()>0)and z then HeroRotationCharDB.Toggles[25]=not HeroRotationCharDB.Toggles[25]m.Print("Sap Queue is now "..(HeroRotationCharDB.Toggles[25]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if A and Y.ShurikenTornado:IsUsableP()and Y.ShurikenTornado:CooldownRemains(BypassRecovery)<=0 then if m.Cast(Y.ShurikenTornado,nil,nil,nil)then a5=277925;return"queue Shuriken Tornado"end elseif(not Y.ShurikenTornado:IsUsableP()or Y.ShurikenTornado:CooldownRemains()>0)and A then HeroRotationCharDB.Toggles[26]=not HeroRotationCharDB.Toggles[26]m.Print("Shuriken Tornado Queue is now "..(HeroRotationCharDB.Toggles[26]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if B and Y.Feint:IsUsableP()and Y.Feint:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if m.Cast(Y.Feint,nil,nil,nil)then a5=202;return"queue Shuriken Tornado"end elseif(not Y.Feint:IsUsableP()or Y.Feint:CooldownRemains()>0 or not g:AffectingCombat())and B then HeroRotationCharDB.Toggles[27]=not HeroRotationCharDB.Toggles[27]m.Print("Feint Queue is now "..(HeroRotationCharDB.Toggles[27]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if C and Y.Flagellation:IsUsableP()and Y.Flagellation:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if m.Cast(Y.Flagellation,nil,nil,nil)then a5=323654;return"queue Flagellation Queue"end elseif(not Y.Flagellation:IsUsableP()or Y.Flagellation:CooldownRemains()>0 or not g:AffectingCombat())and C then HeroRotationCharDB.Toggles[28]=not HeroRotationCharDB.Toggles[28]m.Print("Flagellation Queue is now "..(HeroRotationCharDB.Toggles[28]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if E then if Y.ArcaneTorrent:IsAvailable()and Y.ArcaneTorrent:IsUsableP()and Y.ArcaneTorrent:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if m.Cast(Y.ArcaneTorrent,nil,nil,nil)then a5=155145;return"queue ArcaneTorrent Queue"end elseif Y.LightsJudgment:IsAvailable()and Y.LightsJudgment:IsUsableP()and Y.LightsJudgment:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if m.Cast(Y.LightsJudgment,nil,nil,nil)then a5=255647;return"queue ArcaneTorrent Queue"end elseif Y.BagofTricks:IsAvailable()and Y.BagofTricks:IsUsableP()and Y.BagofTricks:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if m.Cast(Y.BagofTricks,nil,nil,nil)then a5=312411;return"queue ArcaneTorrent Queue"end elseif Y.BloodFury:IsAvailable()and Y.BloodFury:IsUsableP()and Y.BloodFury:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if m.Cast(Y.BloodFury,nil,nil,nil)then a5=20572;return"queue ArcaneTorrent Queue"end elseif Y.Berserking:IsAvailable()and Y.Berserking:IsUsableP()and Y.Berserking:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if m.Cast(Y.Berserking,nil,nil,nil)then a5=26297;return"queue ArcaneTorrent Queue"end elseif Y.Fireblood:IsAvailable()and Y.Fireblood:IsUsableP()and Y.Fireblood:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if m.Cast(Y.Fireblood,nil,nil,nil)then a5=265221;return"queue ArcaneTorrent Queue"end elseif Y.AncestralCall:IsAvailable()and Y.AncestralCall:IsUsableP()and Y.AncestralCall:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if m.Cast(Y.AncestralCall,nil,nil,nil)then a5=274738;return"queue ArcaneTorrent Queue"end elseif(Y.ArcaneTorrent:IsAvailable()and(not Y.ArcaneTorrent:IsUsableP()or Y.ArcaneTorrent:CooldownRemains()>0 or not g:AffectingCombat())or Y.LightsJudgment:IsAvailable()and(not Y.LightsJudgment:IsUsableP()or Y.LightsJudgment:CooldownRemains()>0 or not g:AffectingCombat())or Y.BagofTricks:IsAvailable()and(not Y.BagofTricks:IsUsableP()or Y.BagofTricks:CooldownRemains()>0 or not g:AffectingCombat())or Y.BloodFury:IsAvailable()and(not Y.BloodFury:IsUsableP()or Y.BloodFury:CooldownRemains()>0 or not g:AffectingCombat())or Y.Berserking:IsAvailable()and(not Y.Berserking:IsUsableP()or Y.Berserking:CooldownRemains()>0 or not g:AffectingCombat())or Y.Fireblood:IsAvailable()and(not Y.Fireblood:IsUsableP()or Y.Fireblood:CooldownRemains()>0 or not g:AffectingCombat())or Y.AncestralCall:IsAvailable()and(not Y.AncestralCall:IsUsableP()or Y.AncestralCall:CooldownRemains()>0 or not g:AffectingCombat()))and E then HeroRotationCharDB.Toggles[30]=not HeroRotationCharDB.Toggles[30]m.Print("Arcane Torrent Queue is now "..(HeroRotationCharDB.Toggles[30]and"|cff00ff00on|r."or"|cffff0000off|r."))end end;if g:BuffUp(Y.ShurikenTornado,nil,true)and af<X.CPMaxSpend()then local bM=X.TimeToNextTornado()if bM<=g:GCD()or V(g:GCD()-bM)<0.25 then local bN=a2+bf(g:BuffUp(Y.ShadowBlades))af=T(af+bN,X.CPMaxSpend())ag=U(ag-bN,0)if ae<X.CPMaxSpend()then ae=af end end end;ac=(4+ae*4)*0.3;ad=Y.Eviscerate:Damage()*aS.Subtlety.EviscerateDMGOffset;a4=X.CrimsonVial()if a4 then return a4 end;a4=X.Feint()if a4 then return a4 end;if g:HealthPercentage()<aS.Commons.PhialHP and Z.PhialofSerenity:IsReady()and Z.PhialofSerenity:CooldownRemains()<=0 then if m.Cast(Z.PhialofSerenity,nil)then a5=55;return"PhialofSerenity HP"end end;if g:HealthPercentage()<aS.Commons.HealthstoneHP and Z.Healthstone:IsReady()and Z.Healthstone:CooldownRemains()<=0 then if m.Cast(Z.Healthstone,nil)then a5=40;return"Healthstone HP"end end;if g:HealthPercentage()<aS.Commons.HealPotHP and Z.HealPot:IsReady()and Z.HealPot:CooldownRemains()<=0 then if m.Cast(Z.HealPot,nil)then a5=41;return"HealPot HP"end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if Y.Backstab:IsCastable()and f("mouseover"):IsInMeleeRange(8)then if m.Cast(Y.Backstab,nil)then a6=153;return"explosive MO SWD"end end;if Y.ShurikenToss:IsCastable()and f("mouseover"):IsInMeleeRange(40)and not f("mouseover"):IsInMeleeRange(8)then if m.Cast(Y.ShurikenToss,nil)then a6=1114014;return"explosive MO SWD"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)then if Y.Backstab:IsCastable()and h:IsInMeleeRange(8)then if m.Cast(Y.Backstab,nil)then a5=53;return"explosive  SWD"end end;if Y.ShurikenToss:IsCastable()and h:IsInMeleeRange(40)and not h:IsInMeleeRange(8)then if m.Cast(Y.ShurikenToss,nil)then a5=114014;return"explosive MO SWD"end end end;F={228318,178658,333227,334800,334967,324737,326450,334470,326450,320703,320012,324085,333241,331510}if UnitExists("target")and Y.Shiv:IsReady()then if UnitCanAttack("player","target")and UnitAffectingCombat("target")and UnitIsDead("target")~=true then for bO=0,40 do local bd,bd,bP,type,bd,bd,bd,bd,bd,bQ=UnitBuff("target",bO)for bd,bR in pairs(F)do if bR==bQ then if m.Cast(Y.Shiv,nil)then a5=5938;return"Shiv Enrage"end end end end end end;local bS=g:AffectingCombat()and 180 or 900;local bT;if i(8679):IsAvailable()and aS.Commons.LethalPoison=="Wound Poison"then bT=g:BuffRemains(i(8679))if bT<bS and not g:IsCasting(i(8679))then if m.Cast(i(8679))then a5=203;return"Wound Poison Refresh"end end elseif i(2823):IsAvailable()and aS.Commons.LethalPoison=="Deadly Poison"then bT=g:BuffRemains(i(2823))if bT<bS and not g:IsCasting(i(2823))then if m.Cast(i(2823))then a5=204;return"Deadly Poison Refresh"end end elseif i(315584):IsAvailable()and aS.Commons.LethalPoison=="Instant Poison"then bT=g:BuffRemains(i(315584))if bT<bS and not g:IsCasting(i(315584))then if m.Cast(i(315584))then a5=205;return"Instant Poison Refresh"end end end;bT=g:BuffRemains(i(3408))if i(3408):IsAvailable()and aS.Commons.NonLethalPoison=="Crippling Poison"then if bT<bS and not g:IsCasting(i(3408))then if m.Cast(i(3408))then a5=206;return"Crippling Poison Refresh"end end elseif i(5761):IsAvailable()and aS.Commons.NonLethalPoison=="Numbing Poison"then bT=g:BuffRemains(i(5761))if bT<bS and not g:IsCasting(NumbingPoison)then if m.Cast(i(5761))then a5=204;return"Numbing Poison Refresh"end end end;if g:IsChanneling(i(324631))then if m.Cast(Y.PoolEnergy,nil,nil,nil)then a5=99999;return"channeling Fleashcraft"end end;if not g:AffectingCombat()and not g:IsDeadOrGhost()then if not g:BuffUp(Y.ShadowDanceBuff)and not g:BuffUp(ab)then a4=X.Stealth(aa)if a4 then return a4 end end end;X.MfDSniping(Y.MarkedforDeath)if W.TargetIsValid()and(g:AffectingCombat()or r or(g:BuffUp(ab)or StealthSpell and StealthSpell:ID()==Y.Vanish:ID()))then local bU,bV,bd=GetSpellCooldown(57934)if aS.Commons.AutoToT and g:AffectingCombat()then if bU+bV-GetTime()<=0 and Y.TricksoftheTrade:IsAvailable()and Y.TricksoftheTrade:CooldownRemains(BypassRecovery)<=0 and UnitExists("focus")and(UnitInParty("focus")or UnitInRaid("focus"))and IsItemInRange(32698,"focus")then if m.Cast(Y.TricksoftheTrade)then a5=157934;return"ToT Focus"end end end;a4=bB()if a4 then return"CDs: "..a4 end;if g:StealthUp(true,true)then a4=bu()if a4 then return"Stealthed Rotation: "..a4 end end;if Y.SliceandDice:IsCastable()and a2<6 and d.FilteredFightRemains(a1,">",6)and g:BuffRemains(Y.SliceandDice)<g:GCD()and ae>=4-bf(d.CombatTime()<10)*2 then if Y.SliceandDice:IsReady()and m.Cast(Y.SliceandDice)then a5=5171;return"Cast Slice and Dice (Low Duration)"end end;local ah=b4()if ah then a4=bG()if a4 then return"Stealth CDs: (Priority Rotation)"..a4 end end;if g:EnergyDeficitPredicted()<=bk()then a4=bG()if a4 then return"Stealth CDs: "..a4 end end;if ae>=X.CPMaxSpend()or(ag<=1 or d.BossFilteredFightRemains("<",1)and ae>=3 or g:BuffUp(Y.SymbolsofDeathCrit)and ae>=4)or a2>=4 and ae>=4 then a4=br()if a4 then return"Finish: "..a4 end end;if g:EnergyDeficitPredicted()<=bk()and ae<X.CPMaxSpend()then a4=bH()if a4 then return"Build: "..a4 end end;if m.CDsON()then if Y.ArcaneTorrent:IsReady()and h:IsInMeleeRange(5)and g:EnergyDeficitPredicted()>15+g:EnergyRegen()and aS.Commons.Enabled.Racials then if m.Cast(Y.ArcaneTorrent,nil)then a5=155145;return"Cast Arcane Torrent"end end;if Y.ArcanePulse:IsReady()and h:IsInMeleeRange(5)then if m.Cast(Y.ArcanePulse,nil)then a5=260364;return"Cast Arcane Pulse"end end;if Y.LightsJudgment:IsReady()and aS.Commons.Enabled.Racials then if m.Cast(Y.LightsJudgment,nil)then a5=255647;return"Cast Lights Judgment"end end;if Y.BagofTricks:IsReady()and aS.Commons.Enabled.Racials then if m.Cast(Y.BagofTricks,nil)then a5=312411;return"Cast Bag of Tricks"end end end;if false and h:IsInMeleeRange(5)then if type(a7)=="table"and#a7>1 then if m.CastQueuePooling(g:EnergyTimeToX(a8),unpack(a7))then a5=1000;return"Macro pool towards "..a7[1]:Name().." at "..a8 end elseif a7:IsCastable()then a8=U(a8,a7:Cost())if m.CastPooling(a7,g:EnergyTimeToX(a8))then a5=1000;return"Pool towards: "..a7:Name().." at "..a8 end end end;if m.Cast(Y.PoolEnergy)then a5=1000;return"Stealthed Pooling"end end end;local function bW()end;function ReturnSpell()if a5==0 then return 0 else return a5 end end;function ReturnSpellMO()if a6==0 then return 0 else return a6 end end;m.SetAPL(261,bL,bW)