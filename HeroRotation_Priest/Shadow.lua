local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=HeroRotation;local m=l.AoEON;local n=l.CDsON;local o=l.Cast;local p=l.CastSuggested;local q=HeroRotationCharDB.Toggles[4]local r=HeroRotationCharDB.Toggles[5]local s=HeroRotationCharDB.Toggles[6]local t=not HeroRotationCharDB.Toggles[15]local u=HeroRotationCharDB.Toggles[12]local v=HeroRotationCharDB.Toggles[60]local w=HeroRotationCharDB.Toggles[61]local x=false;local y=false;local z=false;local A=false;local B=false;local C=0;local D=math.min;local E=j.Priest.Shadow;local F=k.Priest.Shadow;local G={F.DarkmoonDeckPutrescence:ID(),F.DreadfireVessel:ID(),F.EmpyrealOrdinance:ID(),F.GlyphofAssimilation:ID(),F.InscrutableQuantumDevice:ID(),F.MacabreSheetMusic:ID(),F.ShadowedOrbofTorment:ID(),F.SinfulGladiatorsBadgeofFerocity:ID(),F.SoullettingRuby:ID(),F.SunbloodAmethyst:ID()}local H=g:GetEquipment()local I=k(0)local J=k(0)local K,L=GetInventoryItemID("player",13)local M,L=GetInventoryItemID("player",14)if H[13]then I=k(H[13])end;if H[14]then J=k(H[14])end;local N;local O,P,Q,R;local S,T;local U;local V;local W=0;local X=0;local Y=0;local Z=l.Commons.Everyone;local _={General=l.GUISettings.General,Commons=l.GUISettings.APL.Priest.Commons,Shadow=l.GUISettings.APL.Priest.Shadow}local a0=false;local a1=false;local a2=1;local a3=false;local a4=false;local a5=g:HasLegendaryEquipped(202)local a6=g:HasLegendaryEquipped(161)local a7=g:HasLegendaryEquipped(158)local a8=g:HasLegendaryEquipped(159)local a9=j(200174)d:RegisterForEvent(function()a0=false;a1=false;a2=1;a3=false;a4=false end,"PLAYER_REGEN_ENABLED")d:RegisterForEvent(function()a5=g:HasLegendaryEquipped(202)a6=g:HasLegendaryEquipped(161)a7=g:HasLegendaryEquipped(158)a8=g:HasLegendaryEquipped(159)end,"PLAYER_EQUIPMENT_CHANGED")d:RegisterForEvent(function()E.ShadowCrash:RegisterInFlight()end,"LEARNED_SPELL_IN_TAB")E.ShadowCrash:RegisterInFlight()local function aa(ab)if ab then return 1 else return 0 end end;local function ac(ab)return ab~=0 end;local function ad(ae,af)if af then return ae:DebuffUp(E.ShadowWordPainDebuff)and ae:DebuffUp(E.VampiricTouchDebuff)and ae:DebuffUp(E.DevouringPlagueDebuff)else return ae:DebuffUp(E.ShadowWordPainDebuff)and ae:DebuffUp(E.VampiricTouchDebuff)end end;local function ag(ah)local ai=0;for aj in pairs(ah)do local ak=ah[aj]if ak:DebuffDown(E.ShadowWordPainDebuff)then ai=ai+1 end end;return ai end;local function al(ah)local am=0;for aj in pairs(ah)do local ak=ah[aj]if ak:DebuffRefreshable(E.ShadowWordPainDebuff)then am=am+1 end end;return am end;local function an(ao)return not ad(ao,true)end;local function ap(ao)if(ao:HealthPercentage()<20 and T<4 or a9:TimeSinceLastCast()<=15 and a8)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==f("mouseover"):GUID()and _.Shadow.TargetSwap=="Mouseover"then W=1136149;return true elseif(ao:HealthPercentage()<20 and T<4 or a9:TimeSinceLastCast()<=15 and a8)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and _.Shadow.TargetSwap=="AutoSwap"and ao:GUID()~=h:GUID()and not u then W=999;if W==999 then starttime=GetTime()endtime=starttime+0.25 elseif W>0 and endtime~=nil and GetTime()>endtime then W=0 end;return true elseif(ao:HealthPercentage()<20 and T<4 or a9:TimeSinceLastCast()<=15 and a8)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==h:GUID()then X=136149;return true elseif(ao:HealthPercentage()<20 and T<4 or a9:TimeSinceLastCast()<=15 and a8)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)then return true end end;local function aq(ao)if ao:TimeToDie()<20 and g:BuffDown(E.VoidformBuff)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==f("mouseover"):GUID()and _.Shadow.TargetSwap=="Mouseover"then W=1319952;return true elseif ao:TimeToDie()<20 and g:BuffDown(E.VoidformBuff)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and _.Shadow.TargetSwap=="AutoSwap"and ao:GUID()~=h:GUID()and not u then W=999;if W==999 then starttime=GetTime()endtime=starttime+0.25 elseif W>0 and endtime~=nil and GetTime()>endtime then W=0 end;return true elseif ao:TimeToDie()<20 and g:BuffDown(E.VoidformBuff)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==h:GUID()then X=319952;return true elseif ao:TimeToDie()<20 and g:BuffDown(E.VoidformBuff)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)then return true end end;local function ar(ao)if ad(ao,false)and ao:TimeToDie()>3 and(g:BuffDown(E.VoidformBuff)or g:BuffRemains(E.VoidformBuff)<E.VoidBolt:CooldownRemains()-0.5)and E.VampiricTouchDebuff:AuraActiveCount()>=T and T<5+6*aa(E.TwistofFate:IsAvailable())and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==f("mouseover"):GUID()and _.Shadow.TargetSwap=="Mouseover"then W=1263165;return true elseif ad(ao,false)and ao:TimeToDie()>3 and(g:BuffDown(E.VoidformBuff)or g:BuffRemains(E.VoidformBuff)<E.VoidBolt:CooldownRemains()-0.5)and E.VampiricTouchDebuff:AuraActiveCount()>=T and T<5+6*aa(E.TwistofFate:IsAvailable())and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and _.Shadow.TargetSwap=="AutoSwap"and ao:GUID()~=h:GUID()and not u then W=999;if W==999 then starttime=GetTime()endtime=starttime+0.25 elseif W>0 and endtime~=nil and GetTime()>endtime then W=0 end;return true elseif ad(ao,false)and ao:TimeToDie()>3 and(g:BuffDown(E.VoidformBuff)or g:BuffRemains(E.VoidformBuff)<E.VoidBolt:CooldownRemains()-0.5)and E.VampiricTouchDebuff:AuraActiveCount()>=T and T<5+6*aa(E.TwistofFate:IsAvailable())and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==h:GUID()then X=263165;return true elseif ad(ao,false)and ao:TimeToDie()>3 and(g:BuffDown(E.VoidformBuff)or g:BuffRemains(E.VoidformBuff)<E.VoidBolt:CooldownRemains()-0.5)and E.VampiricTouchDebuff:AuraActiveCount()>=T and T<5+6*aa(E.TwistofFate:IsAvailable())and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)then return true end end;local function as(ao)if(ao:DebuffRefreshable(E.VampiricTouchDebuff)and(ao:TimeToDie()>8 or ao:IsDummy())or E.Misery:IsAvailable()and ao:DebuffRefreshable(E.ShadowWordPainDebuff)or g:BuffUp(E.UnfurlingDarknessBuff))and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==f("mouseover"):GUID()and _.Shadow.TargetSwap=="Mouseover"then W=134914;return true elseif(ao:DebuffRefreshable(E.VampiricTouchDebuff)and(ao:TimeToDie()>8 or ao:IsDummy())or E.Misery:IsAvailable()and ao:DebuffRefreshable(E.ShadowWordPainDebuff)or g:BuffUp(E.UnfurlingDarknessBuff))and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and _.Shadow.TargetSwap=="AutoSwap"and ao:GUID()~=h:GUID()and not u then W=999;if W==999 then starttime=GetTime()endtime=starttime+0.25 elseif W>0 and endtime~=nil and GetTime()>endtime then W=0 end;return true elseif(ao:DebuffRefreshable(E.VampiricTouchDebuff)and(ao:TimeToDie()>8 or ao:IsDummy())or E.Misery:IsAvailable()and ao:DebuffRefreshable(E.ShadowWordPainDebuff)or g:BuffUp(E.UnfurlingDarknessBuff))and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==h:GUID()then X=34914;return true elseif(ao:DebuffRefreshable(E.VampiricTouchDebuff)and(ao:TimeToDie()>8 or ao:IsDummy())or E.Misery:IsAvailable()and ao:DebuffRefreshable(E.ShadowWordPainDebuff)or g:BuffUp(E.UnfurlingDarknessBuff))and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)then return true end end;local function at(ao)if ao:DebuffRefreshable(E.ShadowWordPainDebuff)and ao:TimeToDie()>4 and not E.Misery:IsAvailable()and not(E.SearingNightmare:IsAvailable()and T>a2)and(not E.PsychicLink:IsAvailable()or E.PsychicLink:IsAvailable()and T<=2)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==f("mouseover"):GUID()and _.Shadow.TargetSwap=="Mouseover"then W=1589;return true elseif ao:DebuffRefreshable(E.ShadowWordPainDebuff)and ao:TimeToDie()>4 and not E.Misery:IsAvailable()and not(E.SearingNightmare:IsAvailable()and T>a2)and(not E.PsychicLink:IsAvailable()or E.PsychicLink:IsAvailable()and T<=2)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and _.Shadow.TargetSwap=="AutoSwap"and ao:GUID()~=h:GUID()and not u then W=999;if W==999 then starttime=GetTime()endtime=starttime+0.25 elseif W>0 and endtime~=nil and GetTime()>endtime then W=0 end;return true elseif ao:DebuffRefreshable(E.ShadowWordPainDebuff)and ao:TimeToDie()>4 and not E.Misery:IsAvailable()and not(E.SearingNightmare:IsAvailable()and T>a2)and(not E.PsychicLink:IsAvailable()or E.PsychicLink:IsAvailable()and T<=2)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==h:GUID()then X=589;return true elseif ao:DebuffRefreshable(E.ShadowWordPainDebuff)and ao:TimeToDie()>4 and not E.Misery:IsAvailable()and not(E.SearingNightmare:IsAvailable()and T>a2)and(not E.PsychicLink:IsAvailable()or E.PsychicLink:IsAvailable()and T<=2)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)then return true end end;local function au(ao)if E.SearingNightmare:IsAvailable()and ao:DebuffRefreshable(E.ShadowWordPainDebuff)and T>2 and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==f("mouseover"):GUID()and _.Shadow.TargetSwap=="Mouseover"then W=148045;return true elseif E.SearingNightmare:IsAvailable()and ao:DebuffRefreshable(E.ShadowWordPainDebuff)and T>2 and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and _.Shadow.TargetSwap=="AutoSwap"and ao:GUID()~=h:GUID()and not u then W=999;if W==999 then starttime=GetTime()endtime=starttime+0.25 elseif W>0 and endtime~=nil and GetTime()>endtime then W=0 end;return true elseif E.SearingNightmare:IsAvailable()and ao:DebuffRefreshable(E.ShadowWordPainDebuff)and T>2 and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==h:GUID()then X=48045;return true elseif E.SearingNightmare:IsAvailable()and ao:DebuffRefreshable(E.ShadowWordPainDebuff)and T>2 and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)then return true end end;local function av(ao)if g:Insanity()<90 and(ad(ao,true)and(not E.VoidEruption:CooldownUp()or not y or not E.HungeringVoid:IsAvailable())or g:BuffUp(E.VoidformBuff))and(not E.HungeringVoid:IsAvailable()or ao:DebuffUp(E.HungeringVoidDebuff)or g:BuffDown(E.VoidformBuff))and(not E.SearingNightmare:IsAvailable()or T<5)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==f("mouseover"):GUID()and _.Shadow.TargetSwap=="Mouseover"then W=1323673;return true elseif g:Insanity()<90 and(ad(ao,true)and(not E.VoidEruption:CooldownUp()or not y or not E.HungeringVoid:IsAvailable())or g:BuffUp(E.VoidformBuff))and(not E.HungeringVoid:IsAvailable()or ao:DebuffUp(E.HungeringVoidDebuff)or g:BuffDown(E.VoidformBuff))and(not E.SearingNightmare:IsAvailable()or T<5)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and _.Shadow.TargetSwap=="AutoSwap"and ao:GUID()~=h:GUID()and not u then W=999;if W==999 then starttime=GetTime()endtime=starttime+0.25 elseif W>0 and endtime~=nil and GetTime()>endtime then W=0 end;return true elseif g:Insanity()<90 and(ad(ao,true)and(not E.VoidEruption:CooldownUp()or not y or not E.HungeringVoid:IsAvailable())or g:BuffUp(E.VoidformBuff))and(not E.HungeringVoid:IsAvailable()or ao:DebuffUp(E.HungeringVoidDebuff)or g:BuffDown(E.VoidformBuff))and(not E.SearingNightmare:IsAvailable()or T<5)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==h:GUID()then X=323673;return true elseif g:Insanity()<90 and(ad(ao,true)and(not E.VoidEruption:CooldownUp()or not y or not E.HungeringVoid:IsAvailable())or g:BuffUp(E.VoidformBuff))and(not E.HungeringVoid:IsAvailable()or ao:DebuffUp(E.HungeringVoidDebuff)or g:BuffDown(E.VoidformBuff))and(not E.SearingNightmare:IsAvailable()or T<5)and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)then return true end end;local function aw(ao)return ao:HealthPercentage()end;local function ax(ao)if(g:BuffUp(E.PowerInfusionBuff)or not _.Shadow.SelfPI or F.ShadowedOrbofTorment:IsEquipped())and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==f("mouseover"):GUID()and _.Shadow.TargetSwap=="Mouseover"then if F.SoullettingRuby:ID()==GetInventoryItemID("player",13)then W=241;return true elseif F.SoullettingRuby:ID()==GetInventoryItemID("player",14)then W=251;return true end elseif(g:BuffUp(E.PowerInfusionBuff)or not _.Shadow.SelfPI or F.ShadowedOrbofTorment:IsEquipped())and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and _.Shadow.TargetSwap=="AutoSwap"and ao:GUID()~=h:GUID()and not u then W=999;return true elseif(g:BuffUp(E.PowerInfusionBuff)or not _.Shadow.SelfPI or F.ShadowedOrbofTorment:IsEquipped())and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)and ao:GUID()==h:GUID()then if F.SoullettingRuby:ID()==GetInventoryItemID("player",13)then W=241;return true elseif F.SoullettingRuby:ID()==GetInventoryItemID("player",14)then W=251;return true end elseif(g:BuffUp(E.PowerInfusionBuff)or not _.Shadow.SelfPI or F.ShadowedOrbofTorment:IsEquipped())and(ao:AffectingCombat()or ao:IsDummy()or ao:NPCID()==153285)then return true end end;local function ay()if Z.TargetIsValid()and not g:IsDeadOrGhost()and not g:AffectingCombat()and s and not g:IsMoving()then if E.ArcaneTorrent:IsCastable()and n()then if o(E.ArcaneTorrent,nil,nil,not h:IsSpellInRange(E.ArcaneTorrent))then X=28730;return"arcane_torrent 6"end end;if _.Commons.Enabled.Trinkets and F.ShadowedOrbofTorment:IsEquippedAndReady()and(C==0 or C>2)then if o(F.ShadowedOrbofTorment,nil,nil)then if F.ShadowedOrbofTorment:ID()==K then X=24;return"top trinket 1"elseif F.ShadowedOrbofTorment:ID()==M then X=30;return"top trinket 2"end end end;a2=2;if E.VampiricTouch:IsCastable()then if o(E.VampiricTouch,nil,nil,not h:IsSpellInRange(E.VampiricTouch))then X=34914;return"vampiric_touch 10"end end;if E.MindBlast:IsCastable()and(C==0 or C>E.MindBlast:CastTime()+0.5)and(E.Misery:IsAvailable()and(not a6 or not E.VoidTorrent:IsAvailable()))then if o(E.MindBlast,nil,nil,not h:IsSpellInRange(E.MindBlast))then X=8092;return"mind_blast 12"end end;if E.VoidTorrent:IsCastable()and(C==0 or C>3+0.5)and z and(E.Misery:IsAvailable()and a6)then if o(E.VoidTorrent,nil,nil,not h:IsSpellInRange(E.VoidTorrent))then X=263165;return"void_torrent 14"end end;if E.MindFlay:IsCastable()and(C==0 or C>1)and not g:IsChanneling(E.MindFlay)and(E.Misery:IsAvailable()and a6 and not E.VoidTorrent:IsAvailable())then if o(E.MindFlay,nil,nil,not h:IsSpellInRange(E.MindFlay))then X=15407;return"mind_flay 15"end end;if E.ShadowWordPain:IsCastable()and not E.Misery:IsAvailable()then if o(E.ShadowWordPain,nil,nil,not h:IsSpellInRange(E.ShadowWordPain))then X=589;return"shadow_word_pain 16"end end end end;local function az()if F.DarkmoonDeckPutrescence:IsEquippedAndReady()then if o(F.DarkmoonDeckPutrescence,nil,nil,not h:IsInRange(40))then if F.DarkmoonDeckPutrescence:ID()==K then X=24;return"top trinket 1"elseif F.DarkmoonDeckPutrescence:ID()==M then X=30;return"top trinket 2"end end end;if F.SunbloodAmethyst:IsEquippedAndReady()then if o(F.SunbloodAmethyst,nil,nil,not h:IsInRange(40))then if F.SunbloodAmethyst:ID()==K then X=24;return"top trinket 1"elseif F.SunbloodAmethyst:ID()==M then X=30;return"top trinket 2"end end end;if F.GlyphofAssimilation:IsEquippedAndReady()then if o(F.GlyphofAssimilation,nil,nil,not h:IsInRange(50))then if F.GlyphofAssimilation:ID()==K then X=24;return"top trinket 1"elseif F.GlyphofAssimilation:ID()==M then X=30;return"top trinket 2"end end end;if F.DreadfireVessel:IsEquippedAndReady()then if o(F.DreadfireVessel,nil,nil,not h:IsInRange(50))then if F.DreadfireVessel:ID()==K then X=24;return"top trinket 1"elseif F.DreadfireVessel:ID()==M then X=30;return"top trinket 2"end end end end;local function aA()if F.EmpyrealOrdinance:IsEquippedAndReady()and(E.VoidEruption:CooldownRemains()<=12 and y or(E.VoidEruption:CooldownRemains()>27 or not y))then if o(F.EmpyrealOrdinance,nil,nil,not h:IsInRange(40))then if F.EmpyrealOrdinance:ID()==K then X=24;return"top trinket 1"elseif F.EmpyrealOrdinance:ID()==M then X=30;return"top trinket 2"end end end;if F.InscrutableQuantumDevice:IsEquippedAndReady()and(g:BuffUp(E.VoidformBuff)and g:BuffUp(E.PowerInfusionBuff)or d.BossFilteredFightRemains("<=",20)or g:BuffUp(E.PowerInfusionBuff)and(d.BossFilteredFightRemains("<",E.VoidEruption:CooldownRemains()+15)or not y)or g:BuffUp(E.VoidformBuff)and(d.BossFilteredFightRemains("<",E.PowerInfusion:CooldownRemains()+15)or not x)or(E.PowerInfusion:CooldownRemains()>=10 or not x)and(E.VoidEruption:CooldownRemains()>=10 or not y)and d.BossFilteredFightRemains(">=",190))then if o(F.InscrutableQuantumDevice,nil,nil)then if F.InscrutableQuantumDevice:ID()==K then X=24;return"top trinket 1"elseif F.InscrutableQuantumDevice:ID()==M then X=30;return"top trinket 2"end end end;if F.MacabreSheetMusic:IsEquippedAndReady()and(E.VoidEruption:CooldownRemains()>10 or not y)then if o(F.MacabreSheetMusic,nil,nil)then if F.MacabreSheetMusic:ID()==K then X=24;return"top trinket 1"elseif F.MacabreSheetMusic:ID()==M then X=30;return"top trinket 2"end end end;if F.SoullettingRuby:IsEquippedAndReady()and(g:BuffUp(E.PowerInfusionBuff)or not _.Shadow.SelfPI or F.ShadowedOrbofTorment:IsEquipped())then if o(F.SoullettingRuby,nil,nil)then if F.SoullettingRuby:ID()==K then X=24;return"top trinket 1"elseif F.SoullettingRuby:ID()==M then X=30;return"top trinket 2"end end end;if F.SinfulGladiatorsBadgeofFerocity:IsEquippedAndReady()and(E.VoidEruption:CooldownRemains()>=10 or not y)then if o(F.SinfulGladiatorsBadgeofFerocity,nil,nil)then if F.SinfulGladiatorsBadgeofFerocity:ID()==K then X=24;return"top trinket 1"elseif F.SinfulGladiatorsBadgeofFerocity:ID()==M then X=30;return"top trinket 2"end end end;if F.ShadowedOrbofTorment:IsEquippedAndReady()and(C==0 or C>2.5)and(g:BuffDown(E.VoidformBuff)or g:PrevGCD(1,E.VoidBolt))then if o(F.ShadowedOrbofTorment,nil,nil)then if F.ShadowedOrbofTorment:ID()==K then X=24;return"top trinket 1"elseif F.ShadowedOrbofTorment:ID()==M then X=30;return"top trinket 2"end end end;if(not E.HungeringVoid:IsAvailable()or h:DebuffUp(E.HungeringVoidDebuff))and(g:BuffUp(E.VoidformBuff)or(E.VoidEruption:CooldownRemains()>10 or not y))then local N=az()if N then return N end end;if g:BuffUp(E.VoidformBuff)or g:BuffUp(E.PowerInfusionBuff)or(E.VoidEruption:CooldownRemains()>10 or not y)then local aB=g:GetUseableTrinkets(G)if aB then if o(aB,nil,nil)then if aB:ID()==K then X=24;return"top trinket 1"elseif aB:ID()==M then X=30;return"top trinket 2"end end end end end;local function aC()if E.PowerInfusion:IsCastable()and x and not g:IsMoving()and(_.Shadow.SelfPI and(g:BuffUp(E.VoidformBuff)or g:Covenant()~="Kyrian"and(E.VoidEruption:CooldownRemains()>=10 or not y)or(d.BossFilteredFightRemains("<",E.VoidEruption:CooldownRemains())or not y))and(d.BossFilteredFightRemains(">=",E.VoidEruption:CooldownRemains()+15)and y and(E.VoidEruption:CooldownRemains()<=g:GCD()*4 and y)or d.BossFilteredFightRemains(">",E.PowerInfusion:Cooldown())and x or(d.BossFilteredFightRemains("<",E.VoidEruption:CooldownRemains()+15)or not y)or g:Covenant()=="Kyrian"or g:BloodlustUp()))then if o(E.PowerInfusion,nil)then X=10060;return"power_infusion 50"end end;if E.FaeGuardians:IsReady()and q and(g:BuffDown(E.VoidformBuff)and(not E.VoidTorrent:CooldownUp()or not z or not E.VoidTorrent:IsAvailable())and(a0 and T==1 or E.VampiricTouchDebuff:AuraActiveCount()==T and T>1)or g:BuffUp(E.VoidformBuff)and(E.GroveInvigoration:IsAvailable()or E.FieldofBlossoms:IsAvailable()))then if o(E.FaeGuardians,nil)then X=327661;return"fae_guardians 52"end end;if E.Mindgames:IsReady()and(C==0 or C>E.Mindgames:CastTime()+0.5)and not g:IsMoving()and q then if g:Insanity()<90 and(ad(h,true)and(not E.VoidEruption:CooldownUp()or not y or not E.HungeringVoid:IsAvailable())or g:BuffUp(E.VoidformBuff))and(not E.HungeringVoid:IsAvailable()or h:DebuffUp(E.HungeringVoidDebuff)or g:BuffDown(E.VoidformBuff))and(not E.SearingNightmare:IsAvailable()or T<5)then if o(E.Mindgames,nil,nil,not h:IsSpellInRange(E.Mindgames))then X=323673;return"mindgames 54"end end end;if E.UnholyNova:IsReady()and q and((g:BuffUp(E.PowerInfusionBuff)or(E.PowerInfusion:CooldownRemains()>=10 or not x)or not _.Shadow.SelfPI)and(not E.HungeringVoid:IsAvailable()or h:DebuffUp(E.HungeringVoidDebuff)or g:BuffDown(E.VoidformBuff)))then if o(E.UnholyNova,nil,nil,not h:IsSpellInRange(E.UnholyNova))then X=324724;return"Shadow_nova 56"end end;if E.BoonoftheAscended:IsCastable()and(C==0 or C>E.BoonoftheAscended:CastTime()+0.5)and q and(g:BuffDown(E.VoidformBuff)and(not E.VoidEruption:CooldownUp()or not y)and T>1 and not E.SearingNightmare:IsAvailable()or g:BuffUp(E.VoidformBuff)and T<2 and not E.SearingNightmare:IsAvailable()and(g:PrevGCD(1,E.VoidBolt)and(not F.EmpyrealOrdinance:IsEquipped()or not E.HungeringVoid:IsAvailable())or F.EmpyrealOrdinance:IsEquipped()and F.EmpyrealOrdinance:CooldownRemains()<=162 and h:DebuffUp(E.HungeringVoidDebuff))or g:BuffUp(E.VoidformBuff)and E.SearingNightmare:IsAvailable())then if o(E.BoonoftheAscended,nil)then X=325013;return"boon_of_the_ascended 58"end end;if _.Commons.Enabled.Trinkets then local N=aA()if N then return N end end end;local function aD()if E.AscendedBlast:IsReady()and T<=3 then if o(E.AscendedBlast,nil,nil,not h:IsSpellInRange(E.AscendedBlast))then X=235283;return"ascended_blast 70"end end;if E.AscendedNova:IsReady()and(#O>1 and T>1+aa(E.SearingNightmare:IsAvailable()))then if o(E.AscendedNova,nil,nil,not h:IsInRange(8))then X=325020;return"ascended_nova 72"end end end;local function aE()if E.SearingNightmare:IsReady()and g:IsChanneling(E.MindSear)and(a3 and not a4 or V>0 and T>1)then if o(E.SearingNightmare,nil,nil,not h:IsInRange(40))then X=341385;return"searing_nightmare 80"end end;if E.SearingNightmare:IsReady()and g:IsChanneling(E.MindSear)and(V>0 and T>2)then if o(E.SearingNightmare,nil,nil,not h:IsInRange(40))then X=341385;return"searing_nightmare 82"end end;if E.MindBlast:IsCastable()and(g:BuffUp(E.DarkThoughtBuff)and(g:IsChanneling(E.MindFlay)or g:IsChanneling(E.MindSear)))then if o(E.MindBlast,nil,nil,not h:IsSpellInRange(E.MindBlast))then X=8092;return"mind_blast 84"end end end;local function aF()if g:BuffUp(E.BoonoftheAscendedBuff)then local N=aD()if N then return N end end;if E.VoidBolt:CooldownUp()and g:BuffUp(E.DissonantEchoesBuff)then if o(E.VoidBolt,nil,nil,not h:IsInRange(40))then X=214771;return"void_bolt 90"end end;if E.VoidEruption:IsReady()and(C==0 or C>E.VoidEruption:CastTime()+0.5)and y and not g:IsMoving()and(a4 and(g:Insanity()>=40 or a9:TimeSinceLastCast()<=15 and a8 and(not E.MindBlast:CooldownUp()and not E.ShadowWordDeath:CooldownUp()or T>=4)and(g:Insanity()<=85 or E.SearingNightmare:IsAvailable()and a3)and(not a9:CooldownUp()or not B)and(not E.MindBlast:CooldownUp()or T>2)))then if o(E.VoidEruption,nil,nil,not h:IsSpellInRange(E.VoidEruption))then X=228260;return"void_eruption 92"end end;if E.ShadowWordPain:IsCastable()and(g:BuffUp(E.FaeGuardiansBuff)and h:DebuffDown(E.WrathfulFaerieDebuff)and T<4)then if E.Misery:IsAvailable()and h:TimeToDie()>=6 then if o(E.VampiricTouch,nil,nil,not h:IsSpellInRange(E.VampiricTouch))then X=34914;return"vampiric_touch 94"end else if o(E.ShadowWordPain,nil,nil,not h:IsSpellInRange(E.ShadowWordPain))then X=589;return"shadow_word_pain 94"end end end;if true then local N=aC()if N then return N end end;if E.MindSear:IsCastable()and(C==0 or C>1)and not g:IsMoving()and not g:IsChanneling(E.MindSear)and(E.SearingNightmare:IsAvailable()and T>a2 and U>0 and(not a9:CooldownUp()or not B))then if o(E.MindSear,nil,nil,not h:IsSpellInRange(E.MindSear))then X=48045;return"mind_sear 97"end end;if E.Damnation:IsCastable()then if Z.CastCycle(E.Damnation,Q,an,not h:IsSpellInRange(E.Damnation))then X=341374;return"damnation 98"end end;if E.ShadowWordDeath:IsReady()and(a9:TimeSinceLastCast()<=15 and a8 and 15-a9:TimeSinceLastCast()<=g:GCD()+0.5)then if o(E.ShadowWordDeath,nil,nil,not h:IsSpellInRange(E.ShadowWordDeath))then X=136149;return"shadow_word_death 99"end end;if E.MindBlast:IsCastable()and(C==0 or C>E.MindBlast:CastTime()+0.5)and not g:IsMoving()and T<4 and((E.MindBlast:Charges()>=1 and(h:DebuffUp(E.HungeringVoidDebuff)or not E.HungeringVoid:IsAvailable())or 15-a9:TimeSinceLastCast()<=E.MindBlast:CastTime()+g:GCD()+0.5)and a9:TimeSinceLastCast()<=15 and a8 and 15-a9:TimeSinceLastCast()>E.MindBlast:CastTime())then if o(E.MindBlast,nil,nil,not h:IsSpellInRange(E.MindBlast))then X=8092;return"mind_blast 100"end end;if E.VoidBolt:IsCastable()and(T<4 or E.HungeringVoid:IsAvailable()and T<=6)and(g:Insanity()<=85 and E.HungeringVoid:IsAvailable()and E.SearingNightmare:IsAvailable()and T<=6 or(E.HungeringVoid:IsAvailable()and not E.SearingNightmare:IsAvailable()or T==1))then if o(E.VoidBolt,nil,nil,not h:IsInRange(40))then X=214771;return"void_bolt 101"end end;if E.DevouringPlague:IsReady()and(T<3 or g:BuffUp(E.VoidformBuff))and((h:DebuffRefreshable(E.DevouringPlagueDebuff)or g:Insanity()>75)and(not a4 or g:Insanity()>=85)and(not E.SearingNightmare:IsAvailable()or E.SearingNightmare:IsAvailable()and not a3))then if o(E.DevouringPlague,nil,nil,not h:IsSpellInRange(E.DevouringPlague))then X=335467;return"devouring_plague 102"end end;if E.VoidBolt:IsCastable()and(T<4 or E.HungeringVoid:IsAvailable()and T<=6)and(T<4+aa(E.DissonantEchoes:ConduitEnabled())and g:Insanity()<=85 and E.SearingNightmare:IsAvailable()or not E.SearingNightmare:IsAvailable())then if o(E.VoidBolt,nil,nil,not h:IsInRange(40))then X=214771;return"void_bolt 103"end end;if E.ShadowWordDeath:IsReady()and h:IsSpellInRange(E.ShadowWordDeath)and(h:HealthPercentage()<20 and T<4 or a9:TimeSinceLastCast()<=15 and a8)then if o(E.ShadowWordDeath,nil)then X=136149;return"shadow_word_death 104"end end;if E.ShadowWordDeath:IsReady()and T<4 then if Z.CastCycle(E.ShadowWordDeath,Q,ap,not h:IsSpellInRange(E.ShadowWordDeath),nil)then return"shadow_word_death 104"end end;if E.SurrenderToMadness:IsCastable()then if Z.CastCycle(E.SurrenderToMadness,Q,aq,not h:IsSpellInRange(E.SurrenderToMadness),_.Shadow.OffGCDasOffGCD.SurrenderToMadness)then return"surrender_to_madness 106"end end;if E.VoidTorrent:IsCastable()and(C==0 or C>3+0.5)and z and not g:IsMoving()and T<4 then if ad(h,false)and h:TimeToDie()>3 and(g:BuffDown(E.VoidformBuff)or g:BuffRemains(E.VoidformBuff)<E.VoidBolt:CooldownRemains()-0.5)and E.VampiricTouchDebuff:AuraActiveCount()>=T and T<5+6*aa(E.TwistofFate:IsAvailable())then if o(E.VoidTorrent,nil)then X=263165;return"void_torrent 107"end end end;if a9:IsCastable()and B and(h:DebuffUp(E.VampiricTouchDebuff)and(E.SearingNightmare:IsAvailable()and T>a2 or h:DebuffUp(E.ShadowWordPainDebuff))and(not a8 or E.VampiricTouchDebuff:AuraActiveCount()>=T))then if o(E.Mindbender,nil,nil,not h:IsSpellInRange(E.Mindbender))then X=200174;return"shadowfiend/mindbender 108"end end;if E.ShadowWordDeath:IsReady()and(a7 and a0 and h:TimeToX(20)>E.ShadowWordDeath:Cooldown()+g:GCD())then if o(E.ShadowWordDeath,nil,nil,not h:IsSpellInRange(E.ShadowWordDeath))then X=136149;return"shadow_word_death 112"end end;if E.ShadowCrash:IsCastable()and A then if o(E.ShadowCrash,nil,nil,not h:IsInRange(40))then X=205385;return"shadow_crash 114"end end;if E.MindSear:IsCastable()and(C==0 or C>1)and not g:IsMoving()and not g:IsChanneling(E.MindSear)and(T>a2 and g:BuffUp(E.DarkThoughtBuff))then if o(E.MindSear,nil,nil,not h:IsSpellInRange(E.MindSear))then X=48045;return"mind_sear 118"end end;if E.MindFlay:IsCastable()and(C==0 or C>1)and not g:IsMoving()and not g:IsCasting(E.MindFlay)and(g:BuffUp(E.DarkThoughtBuff)and not(g:BuffUp(E.VoidformBuff)and E.VoidBolt:CooldownRemains()<=g:GCD())and a0)then if o(E.MindFlay,nil,nil,not h:IsSpellInRange(E.MindFlay))then X=15407;return"mind_flay 120"end end;if E.DevouringPlague:IsReady()and(T<3 or g:BuffUp(E.VoidformBuff))and T<4 and(a6 and a0 and not a1)then if o(E.DevouringPlague,nil,nil,not h:IsSpellInRange(E.DevouringPlague))then X=335467;return"devouring_plague 121"end end;if E.MindBlast:IsCastable()and(C==0 or C>E.MindBlast:CastTime()+0.5)and not g:IsMoving()and(a0 and T<4+2*aa(E.Misery:IsAvailable())+E.VampiricTouchDebuff:AuraActiveCount()*aa(E.PsychicLink:IsAvailable())+D(5,T)*aa(a9:TimeSinceLastCast()<=15 and a8)and(not a8 or(not a9:CooldownUp()or not B)and a8 or E.VampiricTouchDebuff:AuraActiveCount()==T))then if o(E.MindBlast,nil,nil,not h:IsSpellInRange(E.MindBlast))then X=8092;return"mind_blast 122"end end;if E.VampiricTouch:IsCastable()and(C==0 or C>E.VampiricTouch:CastTime()+0.5)and not g:IsMoving()and(h:DebuffRefreshable(E.VampiricTouchDebuff)and not g:IsCasting(E.VampiricTouch)and h:IsSpellInRange(E.VampiricTouch)and(h:TimeToDie()>8 or h:IsDummy()or h:NPCID()==153285)or E.Misery:IsAvailable()and h:DebuffRefreshable(E.ShadowWordPainDebuff)or g:BuffUp(E.UnfurlingDarknessBuff))then if o(E.VampiricTouch,nil)then X=34914;return"vampiric_touch 124"end end;if E.VampiricTouch:IsCastable()and(C==0 or C>E.VampiricTouch:CastTime()+0.5)and not g:IsMoving()and(T<4 or T<7 and g:Insanity()<30 and g:BuffDown(E.DarkThoughtBuff))then if Z.CastCycle(E.VampiricTouch,Q,as,not h:IsSpellInRange(E.VampiricTouch))then return"vampiric_touch 124"end end;if E.ShadowWordPain:IsCastable()and T<4 and(h:DebuffRefreshable(E.ShadowWordPainDebuff)and h:TimeToDie()>4 and not E.Misery:IsAvailable()and E.PsychicLink:IsAvailable()and T>2)then if o(E.ShadowWordPain,nil,nil,not h:IsSpellInRange(E.ShadowWordPain))then X=589;return"shadow_word_pain 126"end end;if E.ShadowWordPain:IsCastable()and(h:DebuffRefreshable(E.ShadowWordPainDebuff)and h:IsSpellInRange(E.ShadowWordPain)and(h:TimeToDie()>4 or h:IsDummy()or h:NPCID()==153285)and not E.Misery:IsAvailable()and not(E.SearingNightmare:IsAvailable()and T>a2)and(not E.PsychicLink:IsAvailable()or E.PsychicLink:IsAvailable()and T<=2))then if o(E.ShadowWordPain,nil)then X=589;return"shadow_word_pain 128"end end;if E.ShadowWordPain:IsCastable()and T<4 and not E.Misery:IsAvailable()then if Z.CastCycle(E.ShadowWordPain,Q,at,not h:IsSpellInRange(E.ShadowWordPain))then return"shadow_word_pain 128"end end;if E.MindSear:IsCastable()and(C==0 or C>1)and not g:IsMoving()and not g:IsChanneling(E.MindSear)and T>a2 and(E.VoidBolt:CooldownRemains()>=g:GCD()or not g:BuffUp(E.VoidformBuff)or T>6)then if o(E.MindSear,nil,nil,not h:IsSpellInRange(E.MindSear))then X=48045;return"mind_sear 130"end end;if E.MindFlay:IsCastable()and(C==0 or C>1)and not g:IsMoving()and not g:IsChanneling(E.MindFlay)and T<=a2 and(E.VoidBolt:CooldownRemains()>=g:GCD()or not g:BuffUp(E.VoidformBuff))then if o(E.MindFlay,nil,nil,not h:IsSpellInRange(E.MindFlay))then X=15407;return"mind_flay 132"end end;if E.ShadowWordDeath:IsReady()and g:IsMoving()then if o(E.ShadowWordDeath,nil,nil,not h:IsSpellInRange(E.ShadowWordDeath))then X=136149;return"shadow_word_death 133"end end;if E.ShadowWordPain:IsCastable()and g:IsMoving()then if o(E.ShadowWordPain,nil,nil,not h:IsSpellInRange(E.ShadowWordPain))then X=589;return"shadow_word_pain 134"end end end;local function aG()s=HeroRotationCharDB.Toggles[6]q=HeroRotationCharDB.Toggles[4]r=HeroRotationCharDB.Toggles[5]u=HeroRotationCharDB.Toggles[12]t=not HeroRotationCharDB.Toggles[15]v=HeroRotationCharDB.Toggles[60]w=HeroRotationCharDB.Toggles[61]x=false;y=false;z=false;A=false;B=false;if _.Shadow.IncludedCooldowns.PowerInfusion and n()or _.Shadow.IncludedSmallCooldowns.PowerInfusion and(n()or r)or not _.Shadow.IncludedSmallCooldowns.PowerInfusion and not _.Shadow.IncludedCooldowns.PowerInfusion then x=true end;if _.Shadow.IncludedCooldowns.VoidErruption and n()or _.Shadow.IncludedSmallCooldowns.VoidErruption and(n()or r)or not _.Shadow.IncludedSmallCooldowns.VoidErruption and not _.Shadow.IncludedCooldowns.VoidErruption then y=true end;if _.Shadow.IncludedCooldowns.VoidTorrent and n()or _.Shadow.IncludedSmallCooldowns.VoidTorrent and(n()or r)or not _.Shadow.IncludedSmallCooldowns.VoidTorrent and not _.Shadow.IncludedCooldowns.VoidTorrent then z=true end;if _.Shadow.IncludedCooldowns.ShadowCrash and n()or _.Shadow.IncludedSmallCooldowns.ShadowCrash and(n()or r)or not _.Shadow.IncludedSmallCooldowns.ShadowCrash and not _.Shadow.IncludedCooldowns.ShadowCrash then A=true end;if _.Shadow.IncludedCooldowns.MindBender and n()or _.Shadow.IncludedSmallCooldowns.MindBender and(n()or r)or not _.Shadow.IncludedSmallCooldowns.MindBender and not _.Shadow.IncludedCooldowns.MindBender then B=true end;C=0;for aH=1,20 do if select(10,UnitDebuff("player",aH))==240447 then if select(6,UnitDebuff("player",aH))~=nil then C=select(6,UnitDebuff("player",aH))-GetTime()end end end end;local function aI()O=g:GetEnemiesInMeleeRange(8)P=g:GetEnemiesInRange(30)Q=g:GetEnemiesInRange(40)R=h:GetEnemiesInSplashRange(15)K,L=GetInventoryItemID("player",13)M,L=GetInventoryItemID("player",14)if m()and _.Commons.AoeMode=="Conservative"then S=h:GetEnemiesInSplashRangeCount(8)T=h:GetEnemiesInSplashRangeCount(15)elseif m()and _.Commons.AoeMode=="Aggresive"then local aJ=0;for aK=1,20 do local aL="nameplate"..aK;if UnitExists(aL)then if UnitCanAttack("player",aL)then if UnitCanAttack("player",aL)and UnitAffectingCombat("target")and IsItemInRange(32698,aL)and UnitDetailedThreatSituation("player",aL)~=nil or f(aL):IsDummy()or string.find(UnitGUID(aL),153285)or string.find(UnitGUID(aL),31146)or string.find(UnitGUID(aL),176581)or string.find(UnitGUID(aL),179124)or string.find(UnitGUID(aL),179010)or string.find(UnitGUID(aL),180323)or string.find(UnitGUID(aL),179010)or string.find(UnitGUID(aL),179942)or string.find(UnitGUID(aL),176521)or string.find(UnitGUID(aL),177594)or string.find(UnitGUID(aL),177117)or string.find(UnitGUID(aL),176581)or string.find(UnitGUID(aL),180840)or string.find(UnitGUID(aL),176605)or UnitName(aL)=="Glacial Spike"or string.find(UnitGUID(aL),180473)or string.find(UnitGUID(aL),180474)or string.find(UnitGUID(aL),176929)or string.find(UnitGUID(aL),176920)or string.find(UnitGUID(aL),177154)or string.find(UnitGUID(aL),177787)or string.find(UnitGUID(aL),177889)or string.find(UnitGUID(aL),177891)or string.find(UnitGUID(aL),177892)or string.find(UnitGUID(aL),168326)then aJ=aJ+1 end end end end;S=aJ;T=aJ end;if not m()then S=1;T=1 end;if v then T=10;S=10 end;U=ag(R)V=al(R)if not BotOn then W=0;X=0 end;if W>0 then W=0 end;if X>0 then X=0 end;N=aG()if j(200174):IsAvailable()then a9=j(200174)else a9=j(132603)end;if l.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then starttime=GetTime()endtime=starttime+l.GUISettings.General.OpenerReset elseif l.GUISettings.General.OpenerReset>0 and endtime~=nil and GetTime()>endtime and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]l.ToggleIconFrame:UpdateButtonText(6)l.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if w and E.MassDispell:IsUsableP()and E.MassDispell:CooldownRemains(BypassRecovery)<=0 then if l.Cast(E.MassDispell,nil,nil,nil)then X=327830;return"queue RingOfPeace"end elseif(not E.MassDispell:IsUsableP()or E.MassDispell:CooldownRemains(BypassRecovery)>0)and w then HeroRotationCharDB.Toggles[61]=not HeroRotationCharDB.Toggles[61]l.Print("Mass Dispel Queue is now "..(HeroRotationCharDB.Toggles[61]and"|cff00ff00on|r."or"|cffff0000off|r."))end;local aM=select(1,UnitCastingInfo("player"))if C~=0 and C<0.5 and(g:IsChanneling(E.MindSear)or g:IsChanneling(E.MindFlay))then if o(E.Pool,nil)then X=1999;return"Quaking Stope"end end;if g:IsChanneling(j(355321))then if o(E.Pool,nil)then X=999;return"Trinket Channel"end end;if E.Shadowform:IsCastable()and g:BuffDown(E.ShadowformBuff)then if o(E.Shadowform,nil)then X=232698;return"shadowform 4"end end;if E.PowerWordShield:IsCastable()and g:DebuffDown(E.WeakenedSoul)and not g:IsChanneling()and not g:IsCasting()and(_.Shadow.PWS=="Moving"and g:IsMoving()or _.Shadow.PWS=="Always"or _.Shadow.PWS=="OOC Moving"and g:IsMoving()and not g:AffectingCombat())then if o(E.PowerWordShield,nil)then X=17;return"PW:S Settings"end end;if g:IsChanneling(E.VoidTorrent)then if o(E.Pool,nil)then X=99999;return"channeling 4"end end;if not g:AffectingCombat()and Z.TargetIsValid()and s then local N=ay()if N then return N end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if E.ShadowWordDeath:IsCastable()then if o(E.ShadowWordDeath,nil)then W=1136149;return"explosive MO SWD"end end;if E.ShadowWordPain:IsCastable()then if o(E.ShadowWordPain,nil)then W=1589;return"explosive MO SWP"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)then if E.ShadowWordDeath:IsCastable()then if o(E.ShadowWordDeath,nil)then X=136149;return"explosive  SWD"end end;if E.ShadowWordPain:IsCastable()then if o(E.ShadowWordPain,nil)then X=589;return"explosive  SWP"end end end;if Z.TargetIsValid()and g:AffectingCombat()and(h:AffectingCombat()or h:IsDummy()or h:NPCID()==153285 or h:NPCID()==168326 or h:NPCID()==176581 or h:NPCID()==176920)and not g:IsDeadOrGhost()then if E.Dispersion:IsCastable()and g:HealthPercentage()<_.Shadow.DispersionHP then if o(E.Dispersion,nil)then X=47585;return"dispersion low_hp"end end;if F.PotionofPhantomFire:IsReady()and _.Commons.Enabled.Potions and t and(g:BuffUp(E.VoidformBuff)or g:BuffUp(E.PowerInfusionBuff))then if o(F.PotionofPhantomFire,nil,nil)then X=50;return"potion_of_spectral_intellect 2"end end;a0=ad(h,false)a1=ad(h,true)a3=T>2+aa(g:BuffUp(E.VoidformBuff))a4=E.VoidEruption:CooldownUp()and y and(T==1 or T>=4 or E.HungeringVoid:IsAvailable()or g:Covenant()=="Kyrian")if n()then if E.Fireblood:IsCastable()and g:BuffUp(E.VoidformBuff)then if o(E.Fireblood,nil)then X=265221;return"fireblood 22"end end;if E.Berserking:IsCastable()and g:BuffUp(E.VoidformBuff)then if o(E.Berserking,nil)then X=26297;return"berserking 24"end end;if E.LightsJudgment:IsCastable()and T>=2 then if o(E.LightsJudgment,nil,nil,not h:IsSpellInRange(E.LightsJudgment))then X=255647;return"lights_judgment 26"end end;if E.AncestralCall:IsCastable()and g:BuffUp(E.VoidformBuff)then if o(E.AncestralCall,nil)then X=274738;return"ancestral_call 28"end end;if E.BagofTricks:IsCastable()then if o(E.BagofTricks,nil,nil,not h:IsSpellInRange(E.BagofTricks))then X=312411;return"bag_of_tricks 30"end end end;if true then local N=aE()if N then return N end end;if true then local N=aF()if N then return N end end end;if Z.TargetIsValid()and not UnitIsFriend("target","player")and g:AffectingCombat()and(not h:AffectingCombat()and not h:IsDummy()and h:NPCID()~=153285)and not u then W=999 end end;local function aN()E.VampiricTouchDebuff:RegisterAuraTracking()end;function ReturnSpell()if X==0 then return 0 else return X end end;function ReturnSpellMO()if W==0 then return 0 else return W end end;l.SetAPL(258,aI,aN)