local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=d.Spell;local j=d.MultiSpell;local k=d.Item;local l=HeroRotation;local m=l.AoEON;local n=l.CDsON;local o=HeroRotationCharDB.Toggles[4]local p=HeroRotationCharDB.Toggles[5]local q=HeroRotationCharDB.Toggles[12]local r=not HeroRotationCharDB.Toggles[15]local s=HeroRotationCharDB.Toggles[21]local t=HeroRotationCharDB.Toggles[52]local u=HeroRotationCharDB.Toggles[22]local v=HeroRotationCharDB.Toggles[23]local w=HeroRotationCharDB.Toggles[24]local x=HeroRotationCharDB.Toggles[25]local y=HeroRotationCharDB.Toggles[27]local z=HeroRotationCharDB.Toggles[50]local A=HeroRotationCharDB.Toggles[51]local B=HeroRotationCharDB.Toggles[53]local C=HeroRotationCharDB.Toggles[30]local D=HeroRotationCharDB.Toggles[54]local E=0;local F=g:GetEquipment()local G=k(0)local H=k(0)local I=GetInventoryItemID("player",13)local J=GetInventoryItemID("player",14)if F[13]then G=k(F[13])end;if F[14]then H=k(F[14])end;local K={324736,228318,178658,333227,334800,334967,324737,326450,334470,320703,320012,324085,333241,331510,344739,368477,368396,355057,356133,342139,353706,355782,327155,158337}local L=math.min;local M=math.max;local N=math.abs;local O=nil;local P=nil;local I=GetInventoryItemID("player",13)local J=GetInventoryItemID("player",14)local Q=l.Commons.Everyone;local R=l.Commons.Rogue;local S={General=l.GUISettings.General,Commons=l.GUISettings.APL.Rogue.Commons,Commons2=l.GUISettings.APL.Rogue.Commons2,Outlaw=l.GUISettings.APL.Rogue.Outlaw}local T=i.Rogue.Outlaw;local U=k.Rogue.Outlaw;local V={U.ManicGrieftorch:ID(),U.DragonfireBombDispenser:ID(),U.BeaconToTheBeyond:ID()}local W,X,Y;local Z;local _=6;local a0;local a1,a2,a3;local a4,a5,a6,a7,a8;local a9={{T.Blind,"Cast Blind (Interrupt)",function()return true end}}local aa=R.ReturnSpell()local ab=R.ReturnSpellMO()local ac=0;local function ad(ae)if ae then return 1 else return 0 end end;local function af()return g:BuffUp(T.SliceandDice)or g:BuffUp(T.AdrenalineRush)end;local ag,ah=0,0;local function ai(aj)local ak=g:EnergyTimeToMaxPredicted(nil,aj)if ak<ag or ak-ag>0.5 then ag=ak end;return ag end;local function al()local am=g:EnergyPredicted()if am>ah or am-ah>9 then ah=am end;return ah end;local an={T.Broadside,T.BuriedTreasure,T.GrandMelee,T.RuthlessPrecision,T.SkullandCrossbones,T.TrueBearing}local function ao()if not e.APLVar.RtB_Buffs then e.APLVar.RtB_Buffs={}e.APLVar.RtB_Buffs.Total=0;e.APLVar.RtB_Buffs.Normal=0;e.APLVar.RtB_Buffs.Shorter=0;e.APLVar.RtB_Buffs.Longer=0;local ap=R.RtBRemains()for aq=1,#an do local ar=g:BuffRemains(an[aq])if ar>0 then e.APLVar.RtB_Buffs.Total=e.APLVar.RtB_Buffs.Total+1;if ar==ap then e.APLVar.RtB_Buffs.Normal=e.APLVar.RtB_Buffs.Normal+1 elseif ar>ap then e.APLVar.RtB_Buffs.Longer=e.APLVar.RtB_Buffs.Longer+1 else e.APLVar.RtB_Buffs.Shorter=e.APLVar.RtB_Buffs.Shorter+1 end end end end;return e.APLVar.RtB_Buffs.Total end;local function as()if not e.APLVar.RtB_Reroll then if S.Outlaw.RolltheBonesLogic=="1+ Buff"then e.APLVar.RtB_Reroll=ao()<=0 and true or false elseif S.Outlaw.RolltheBonesLogic=="Broadside"then e.APLVar.RtB_Reroll=not g:BuffUp(T.Broadside)and true or false elseif S.Outlaw.RolltheBonesLogic=="Buried Treasure"then e.APLVar.RtB_Reroll=not g:BuffUp(T.BuriedTreasure)and true or false elseif S.Outlaw.RolltheBonesLogic=="Grand Melee"then e.APLVar.RtB_Reroll=not g:BuffUp(T.GrandMelee)and true or false elseif S.Outlaw.RolltheBonesLogic=="Skull and Crossbones"then e.APLVar.RtB_Reroll=not g:BuffUp(T.SkullandCrossbones)and true or false elseif S.Outlaw.RolltheBonesLogic=="Ruthless Precision"then e.APLVar.RtB_Reroll=not g:BuffUp(T.RuthlessPrecision)and true or false elseif S.Outlaw.RolltheBonesLogic=="True Bearing"then e.APLVar.RtB_Reroll=not g:BuffUp(T.TrueBearing)and true or false else e.APLVar.RtB_Reroll=false;ao()if ao()<=2 and g:BuffUp(T.BuriedTreasure)and g:BuffDown(T.GrandMelee)and Y<2 then e.APLVar.RtB_Reroll=true end;if T.Crackshot:IsAvailable()and T.HiddenOpportunity:IsAvailable()and not g:HasTier(31,4)and(not g:BuffUp(T.TrueBearing)and T.HiddenOpportunity:IsAvailable()or not g:BuffUp(T.Broadside)and not T.HiddenOpportunity:IsAvailable())and ao()<=1 then e.APLVar.RtB_Reroll=true end;if T.Crackshot:IsAvailable()and g:HasTier(31,4)and ao()<=1+ad(g:BuffUp(T.LoadedDiceBuff))and(T.HiddenOpportunity:IsAvailable()or g:BuffDown(T.Broadside))then e.APLVar.RtB_Reroll=true end;if not T.Crackshot:IsAvailable()and T.HiddenOpportunity:IsAvailable()and not g:BuffUp(T.SkullandCrossbones)and(ao()<2+ad(g:BuffUp(T.GrandMelee))and Y<2)then e.APLVar.RtB_Reroll=true end;if e.APLVar.RtB_Reroll or e.APLVar.RtB_Buffs.Normal==0 and e.APLVar.RtB_Buffs.Longer>=1 and ao()<5 and R.RtBRemains()<=39 then e.APLVar.RtB_Reroll=true end;if h:FilteredTimeToDie("<",12)or d.BossFilteredFightRemains("<",12)then e.APLVar.RtB_Reroll=false end end end;return e.APLVar.RtB_Reroll end;local function at()return a1>=R.CPMaxSpend()-1-ad(g:StealthUp(true,true)and T.Crackshot:IsAvailable())end;local function au()return(T.HiddenOpportunity:IsAvailable()or a3>=2+ad(T.ImprovedAmbush:IsAvailable())+ad(g:BuffUp(T.Broadside)))and a4>=50 end;local function av()return S.Commons.VanishOffensive and n()and not(Q.IsSoloMode()and g:IsTanking(h))end;local function aw()return not T.ShadowDanceTalent:IsAvailable()and T.FanTheHammer:TalentRank()+ad(T.QuickDraw:IsAvailable())+ad(T.Audacity:IsAvailable())<ad(T.CountTheOdds:IsAvailable())+ad(T.KeepItRolling:IsAvailable())end;local function ax()return g:BuffUp(T.BetweentheEyes)and(not T.HiddenOpportunity:IsAvailable()or g:BuffDown(T.AudacityBuff)and(T.FanTheHammer:TalentRank()<2 or g:BuffDown(T.Opportunity)))and not T.Crackshot:IsAvailable()end;local function ay()if not s and S.Commons.VanishOffensive and T.Vanish:IsCastable()and av()and T.HiddenOpportunity:IsAvailable()and not T.Crackshot:IsAvailable()and not g:BuffUp(T.Audacity)and(aw()or g:BuffStack(T.Opportunity)<6)and au()then if l.Cast(T.Vanish,nil)then aa=1856;return"Cast Vanish (HO)"end end;if T.Vanish:IsCastable()and av()and(not T.HiddenOpportunity:IsAvailable()or T.Crackshot:IsAvailable())and at()then if l.Cast(T.Vanish,nil)then aa=1856;return"Cast Vanish (Finish)"end end;if T.ShadowDance:IsAvailable()and T.ShadowDance:IsCastable()and T.Crackshot:IsAvailable()and at()and T.Vanish:CooldownRemains()>=6 and o then if l.Cast(T.ShadowDance,nil)then aa=185313;return"Cast Shadow Dance"end end;if T.ShadowDance:IsAvailable()and T.ShadowDance:IsCastable()and not T.KeepItRolling:IsAvailable()and ax()and g:BuffUp(T.SliceandDice)and(at()or T.HiddenOpportunity:IsAvailable())and(not T.HiddenOpportunity:IsAvailable()or not T.Vanish:IsReady())then if l.Cast(T.ShadowDance,nil)then aa=185313;return"Cast Shadow Dance"end end;if T.ShadowDance:IsAvailable()and T.ShadowDance:IsCastable()and T.KeepItRolling:IsAvailable()and ax()and(T.KeepItRolling:CooldownRemains()<=30 or T.KeepItRolling:CooldownRemains()>=120 and(at()or T.HiddenOpportunity:IsAvailable()))then if l.Cast(T.ShadowDance,nil)then aa=185313;return"Cast Shadow Dance"end end;if T.Shadowmeld:IsAvailable()and T.Shadowmeld:IsReady()and S.Commons.Racials then if T.Crackshot:IsAvailable()and at()or not T.Crackshot:IsAvailable()and(T.CountTheOdds:IsAvailable()and at()or T.HiddenOpportunity:IsAvailable())then if l.Cast(T.Shadowmeld,nil)then aa=58984;return"Cast Shadowmeld"end end end end;local function az()if n()and T.AdrenalineRush:IsCastable()and(not g:BuffUp(T.AdrenalineRush)or g:StealthUp(true,true)and T.Crackshot:IsAvailable()and T.ImprovedAdrenalineRush:IsAvailable())and(a2<=2 or not T.ImprovedAdrenalineRush:IsAvailable())then if l.Cast(T.AdrenalineRush,nil)then aa=13750;return"Cast Adrenaline Rush"end end;if T.BladeFlurry:IsReady()then local aA=Y+ad(g:BuffUp(T.Broadside))if Y>=2-ad(T.UnderhandedUpperhand:IsAvailable())and not g:StealthUp(true,false)and g:BuffRemains(T.BladeFlurry)<g:GCDRemains()or T.DeftManeuvers:IsAvailable()and Y>=3 and aA>=a3 and not at()then if l.Cast(T.BladeFlurry)then aa=13877;return"Cast Blade Flurry"end end end;if T.RolltheBones:IsReady()then local aB=not g:StealthUp(true,true)or not T.Crackshot:IsAvailable()if aB and(as()or R.RtBRemains()<=ad(g:HasTier(31,4))+ad(T.ShadowDance:CooldownRemains()<=1 or T.Vanish:CooldownRemains()<=1)*6)then if l.Cast(T.RolltheBones)then aa=315508;return"Cast Roll the Bones"end end end;if T.KeepItRolling:IsReady()and not as()and ao()>=3+ad(g:HasTier(31,4))and(g:BuffDown(T.ShadowDance)or ao()>=6)then if l.Cast(T.KeepItRolling,nil)then aa=381989;return"Cast Keep it Rolling"end end;if T.GhostlyStrike:IsAvailable()and T.GhostlyStrike:IsReady()then if l.Cast(T.GhostlyStrike,nil)then aa=196937;return"Cast Ghostly Strike"end end;if n()and T.Sepsis:IsAvailable()and T.Sepsis:IsReady()then if T.Crackshot:IsAvailable()and T.BetweentheEyes:IsReady()and at()and not g:StealthUp(true,true)or not T.Crackshot:IsAvailable()and h:FilteredTimeToDie(">",11)and g:BuffUp(T.BetweentheEyes)or d.BossFilteredFightRemains("<",11)then if l.Cast(T.Sepsis,nil)then aa=328305;return"Cast Sepsis"end end end;if T.BladeRush:IsReady()and a7>4 and not g:StealthUp(true,true)then if l.Cast(T.BladeRush,nil)then aa=271877;return"Cast Blade Rush"end end;if not g:StealthUp(true,true,true)then Z=ay()if Z then return Z end end;if n()and T.ThistleTea:IsCastable()and not g:BuffUp(T.ThistleTea)and(a6>=100 or d.BossFilteredFightRemains("<",T.ThistleTea:Charges()*6))then if l.Cast(T.ThistleTea,nil)then aa=381623;return"Cast Thistle Tea"end end;if S.Commons.Enabled.Potions then local aC=Q.PotionSelected()if aC then if aC:IsReady()and n()and r and(g:BloodlustUp()and l.GUISettings.General.HoldPotforBL or(g:BloodlustUp()or d.BossFightRemains()<=60 or g:BuffUp(T.AdrenalineRush))and not l.GUISettings.General.HoldPotforBL)then if l.Cast(aC,nil)then aa=50;return"potion cooldowns 2"end end end end;if T.BloodFury:IsCastable()then if l.Cast(T.BloodFury,nil)then aa=20572;return"Cast Blood Fury"end end;if T.Berserking:IsCastable()then if l.Cast(T.Berserking,nil)then aa=26297;return"Cast Berserking"end end;if T.Fireblood:IsCastable()then if l.Cast(T.Fireblood,nil)then aa=265221;return"Cast Fireblood"end end;if T.AncestralCall:IsCastable()then if l.Cast(T.AncestralCall,nil)then aa=274738;return"Cast Ancestral Call"end end;if S.Commons.Enabled.BottomTrinket or S.Commons.Enabled.TopTrinket then if U.ManicGrieftorch:IsEquippedAndReady()then if g:GCDRemains()>g:GCD()-0.1 and not g:StealthUp(true,true)and g:BuffUp(T.BetweentheEyes)or d.BossFilteredFightRemains("<=",5)then if l.Cast(U.ManicGrieftorch,nil,nil)then if U.BalefireBranch:ID()==I then aa=24;return"Manic Grieftorch top"elseif U.ManicGrieftorch:ID()==J then aa=30;return"Manic Grieftorch bop"end end end end;if U.DragonfireBombDispenser:IsEquippedAndReady()then if not G:ID()==U.DragonfireBombDispenser:ID()and G:CooldownRemains()>10 or H:CooldownRemains()>10 or d.BossFilteredFightRemains("<",20)or not H:HasCooldown()or not G:HasCooldown()then if l.Cast(U.DragonfireBombDispenser,nil,nil)then if U.DragonfireBombDispenser:ID()==I then aa=24;return"Dragonfire Bomb Dispenser top"elseif U.DragonfireBombDispenser:ID()==J then aa=30;return"Dragonfire Bomb Dispenser bop"end end end end;if U.BeaconToTheBeyond:IsEquippedAndReady()then if not g:StealthUp(true,true)and g:BuffUp(T.BetweentheEyes)or d.BossFilteredFightRemains("<",5)then if l.Cast(U.DragonfireBombDispenser,nil,nil)then if U.DragonfireBombDispenser:ID()==I then aa=24;return"Beacon top"elseif U.DragonfireBombDispenser:ID()==J then aa=30;return"Beacon bop"end end end end;local aD=g:GetUseableTrinkets(V)if aD and n()and not g:StealthUp(true,true)or d.BossFilteredFightRemains("<",10)then if aD then if l.Cast(aD,nil,nil)then if aD:ID()==GetInventoryItemID("player",13)and S.Commons.Enabled.TopTrinket then aa=24;return"Generic use_items for "..aD:Name()elseif aD:ID()==GetInventoryItemID("player",14)and S.Commons.Enabled.BottomTrinket then aa=25;return"Generic use_items for "..aD:Name()end end end end end end;local function aE()if T.BladeFlurry:IsReady()and T.BladeFlurry:IsCastable()and m()and T.Subterfuge:IsAvailable()and T.HiddenOpportunity:IsAvailable()and Y>=2 and g:BuffRemains(T.BladeFlurry)<=g:GCDRemains()then if l.Cast(T.BladeFlurry)then aa=13877;return"Cast Blade Flurry"end end;if T.ColdBlood:IsCastable()and g:BuffDown(T.ColdBlood)and h:IsSpellInRange(T.Dispatch)and at()then if l.Cast(T.ColdBlood,nil)then aa=382245;return"Cast Cold Blood"end end;if T.BetweentheEyes:IsCastable()and h:IsSpellInRange(T.BetweentheEyes)and at()and T.Crackshot:IsAvailable()then if l.CastPooling(T.BetweentheEyes)then aa=315341;return"Cast Between the Eyes"end end;if T.Dispatch:IsCastable()and h:IsSpellInRange(T.Dispatch)and at()then if l.CastPooling(T.Dispatch)then aa=2098;return"Cast Dispatch"end end;if T.PistolShot:IsCastable()and h:IsSpellInRange(T.PistolShot)and T.Crackshot:IsAvailable()and T.FanTheHammer:TalentRank()>=2 and g:BuffStack(T.Opportunity)>=6 and(g:BuffUp(T.Broadside)and a2<=1 or g:BuffUp(T.GreenskinsWickersBuff))then if l.CastPooling(T.PistolShot)then aa=185763;return"Cast Pistol Shot"end end;if T.Ambush:IsCastable()and h:IsSpellInRange(T.Ambush)and T.HiddenOpportunity:IsAvailable()then if l.CastPooling(T.Ambush)then aa=8676;return"Cast Ambush"end end end;local function aF()if T.BetweentheEyes:IsCastable()and h:IsSpellInRange(T.BetweentheEyes)and not T.Crackshot:IsAvailable()and(g:BuffRemains(T.BetweentheEyes)<4 or T.ImprovedBetweenTheEyes:IsAvailable()or T.GreenskinsWickers:IsAvailable()or g:HasTier(30,4))and g:BuffDown(T.GreenskinsWickers)then if l.CastPooling(T.BetweentheEyes)then aa=315341;return"Cast Between the Eyes"end end;if T.BetweentheEyes:IsCastable()and h:IsSpellInRange(T.BetweentheEyes)and T.Crackshot:IsAvailable()and(T.Vanish:CooldownRemains()>45 and T.ShadowDance:CooldownRemains()>12)then if l.CastPooling(T.BetweentheEyes)then aa=315341;return"Cast Between the Eyes"end end;if T.SliceandDice:IsCastable()and(d.FilteredFightRemains(X,">",g:BuffRemains(T.SliceandDice),true)or g:BuffRemains(T.SliceandDice)==0)and g:BuffRemains(T.SliceandDice)<(1+a2)*1.8 then if l.CastPooling(T.SliceandDice)then aa=315496;return"Cast Slice and Dice"end end;if T.KillingSpree:IsCastable()and h:IsSpellInRange(T.KillingSpree)and(h:DebuffUp(T.GhostlyStrike)or not T.GhostlyStrike:IsAvailable())then if l.Cast(T.KillingSpree)then aa=51690;return"Cast Killing Spree"end end;if T.ColdBlood:IsCastable()and g:BuffDown(T.ColdBlood)and h:IsSpellInRange(T.Dispatch)then if l.Cast(T.ColdBlood,nil)then aa=382245;return"Cast Cold Blood"end end;if T.Dispatch:IsCastable()and h:IsSpellInRange(T.Dispatch)then if l.CastPooling(T.Dispatch)then aa=2098;return"Cast Dispatch"end end end;local function aG()if n()and T.EchoingReprimand:IsReady()then if l.Cast(T.EchoingReprimand,nil,nil)then aa=323547;return"Cast Echoing Reprimand"end end;if T.Ambush:IsCastable()and T.HiddenOpportunity:IsAvailable()and g:BuffUp(T.AudacityBuff)then if l.CastPooling(T.Ambush)then aa=8676;return"Cast Ambush (High-Prio Buffed)"end end;if T.FanTheHammer:IsAvailable()and T.Audacity:IsAvailable()and T.HiddenOpportunity:IsAvailable()and g:BuffUp(T.Opportunity)and g:BuffDown(T.AudacityBuff)then if l.CastPooling(T.PistolShot)then aa=185763;return"Cast Pistol Shot (Audacity)"end end;if g:BuffUp(T.GreenskinsWickersBuff)and(not T.FanTheHammer:IsAvailable()and g:BuffUp(T.Opportunity)or g:BuffRemains(T.GreenskinsWickersBuff)<1.5)then if l.CastPooling(T.PistolShot)then aa=185763;return"Cast Pistol Shot (GSW Dump)"end end;if T.FanTheHammer:IsAvailable()and g:BuffUp(T.Opportunity)and(g:BuffStack(T.Opportunity)>=6 or g:BuffRemains(T.Opportunity)<2)then if l.CastPooling(T.PistolShot)then aa=185763;return"Cast Pistol Shot (FtH Dump)"end end;if T.FanTheHammer:IsAvailable()and g:BuffUp(T.Opportunity)and a3>1+ad(T.QuickDraw:IsAvailable())*T.FanTheHammer:TalentRank()and(not T.Vanish:IsReady()and not T.ShadowDance:IsReady()or g:StealthUp(true,true)or not T.Crackshot:IsAvailable()or T.FanTheHammer:TalentRank()<=1)then if l.CastPooling(T.PistolShot)then aa=185763;return"Cast Pistol Shot"end end;if not T.FanTheHammer:IsAvailable()and g:BuffUp(T.Opportunity)and(a7>1.5 or a3<=1+ad(g:BuffUp(T.Broadside))or T.QuickDraw:IsAvailable()or T.Audacity:IsAvailable()and g:BuffDown(T.AudacityBuff))then if l.CastPooling(T.PistolShot)then aa=185763;return"Cast Pistol Shot"end end;if T.SinisterStrike:IsCastable()and h:IsSpellInRange(T.SinisterStrike)then if l.CastPooling(T.SinisterStrike)then aa=193315;return"Cast Sinister Strike"end end end;local function aH()p=HeroRotationCharDB.Toggles[5]o=HeroRotationCharDB.Toggles[4]q=HeroRotationCharDB.Toggles[12]r=not HeroRotationCharDB.Toggles[15]s=HeroRotationCharDB.Toggles[21]u=HeroRotationCharDB.Toggles[22]v=HeroRotationCharDB.Toggles[23]w=HeroRotationCharDB.Toggles[24]x=HeroRotationCharDB.Toggles[25]y=HeroRotationCharDB.Toggles[27]z=HeroRotationCharDB.Toggles[50]A=HeroRotationCharDB.Toggles[51]t=HeroRotationCharDB.Toggles[52]B=HeroRotationCharDB.Toggles[53]C=HeroRotationCharDB.Toggles[30]D=HeroRotationCharDB.Toggles[54]I=GetInventoryItemID("player",13)J=GetInventoryItemID("player",14)if not S.Commons.Enabled.TopTrinket and not S.Commons.Enabled.BottomTrinket then V={I,J}elseif not S.Commons.Enabled.TopTrinket and S.Commons.Enabled.BottomTrinket then V={I}elseif not S.Commons.Enabled.BottomTrinket and S.Commons.Enabled.TopTrinket then V={J}end;E=0;for aq=1,20 do if select(10,UnitDebuff("player",aq))==240447 then if select(6,UnitDebuff("player",aq))~=nil then E=select(6,UnitDebuff("player",aq))-GetTime()end end end end;X=g:GetEnemiesInRange(_,T.SinisterStrike)local function aI()_=T.AcrobaticStrikes:IsAvailable()and 10 or 6;a2=g:ComboPoints()a1=R.EffectiveComboPoints(a2)a3=g:ComboPointsDeficit()a8=g:BuffUp(T.AdrenalineRush,nil,true)and-50 or 0;a4=al()a5=g:EnergyRegen()a7=ai(a8)a6=g:EnergyDeficitPredicted(nil,a8)if m()then W=g:GetEnemiesInRange(30)X=g:GetEnemiesInRange(_)Y=#X else Y=1 end;Z=aH()if l.QueuedCast()then aa=l.QueuedCast()return"Custom Queue "..i(aa):ID()end;if Z then return Z end;if ab>0 then ab=0 end;if aa>0 then aa=0 end;aa=R.ReturnSpell()ab=R.ReturnSpellMO()if l.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then O=GetTime()P=O+l.GUISettings.General.OpenerReset elseif l.GUISettings.General.OpenerReset>0 and P~=nil and GetTime()>P and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]l.ToggleIconFrame:UpdateButtonText(6)l.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if B and T.GrapplingHook:IsUsableP()and T.GrapplingHook:CooldownRemains(BypassRecovery)<=0 then if l.Cast(T.GrapplingHook,nil,nil,nil)then aa=195457;return"queue Grappling Hook"end elseif(not T.GrapplingHook:IsUsableP()or T.GrapplingHook:CooldownRemains()>0)and B then HeroRotationCharDB.Toggles[53]=not HeroRotationCharDB.Toggles[53]l.Print("Gouge Queue is now "..(HeroRotationCharDB.Toggles[53]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if u and T.CheapShot:IsUsableP()and T.CheapShot:CooldownRemains(BypassRecovery)<=0 and(g:StealthUp(true,true)or g:BuffUp(T.VanishBuff))and(h:IsInRange(8)or f("mouseover"):IsInRange(8))then if l.Cast(T.CheapShot,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(T.CheapShot)then ab=18335;return"queue Cheap Shot MO"else aa=1833;return"queue Cheap Shot"end end elseif(not T.CheapShot:IsUsableP()or T.CheapShot:CooldownRemains()>0)and u then HeroRotationCharDB.Toggles[22]=not HeroRotationCharDB.Toggles[22]l.Print("Cheap Shot Queue is now "..(HeroRotationCharDB.Toggles[22]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if v and T.KidneyShot:IsUsableP()and T.KidneyShot:CooldownRemains(BypassRecovery)<=0 and(h:IsInRange(8)or f("mouseover"):IsInRange(8))then if l.Cast(T.KidneyShot,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(T.KidneyShot)then ab=4085;return"queue Kidney Shot MO"else aa=408;return"queue Kidney Shot"end end elseif(not T.KidneyShot:IsUsableP()or T.KidneyShot:CooldownRemains()>0)and v then HeroRotationCharDB.Toggles[23]=not HeroRotationCharDB.Toggles[23]l.Print("Kidney Shot Queue is now "..(HeroRotationCharDB.Toggles[23]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if w and T.Blind:IsUsableP()and T.Blind:CooldownRemains(BypassRecovery)<=0 and(h:IsInRange(15)or f("mouseover"):IsInRange(15))then if l.Cast(T.Blind,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(T.Blind)then ab=20945;return"queue Blind MO"end end elseif(not T.Blind:IsUsableP()or T.Blind:CooldownRemains()>0)and w then HeroRotationCharDB.Toggles[24]=not HeroRotationCharDB.Toggles[24]l.Print("Blind Queue is now "..(HeroRotationCharDB.Toggles[24]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if x and T.Sap:IsUsableP()and T.Sap:CooldownRemains(BypassRecovery)<=0 and g:StealthUp(true,true)and(h:IsInRange(10)or f("mouseover"):IsInRange(10))then if l.Cast(T.Sap,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(T.Sap)then ab=67705;return"queue Sap MO"else aa=6770;return"queue Sap"end end elseif(not T.Sap:IsUsableP()or T.Sap:CooldownRemains()>0 or not g:StealthUp(true,true))and x then HeroRotationCharDB.Toggles[25]=not HeroRotationCharDB.Toggles[25]l.Print("Sap Queue is now "..(HeroRotationCharDB.Toggles[25]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if y and T.Feint:IsUsableP()and T.Feint:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()and T.Feint:Charges()>2 then if l.Cast(T.Feint,nil,nil,nil)then aa=202;return"queue Feint"end elseif(not T.Feint:IsUsableP()or T.Feint:CooldownRemains()>0 or not g:AffectingCombat())and y then HeroRotationCharDB.Toggles[27]=not HeroRotationCharDB.Toggles[27]l.Print("Feint Queue is now "..(HeroRotationCharDB.Toggles[27]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if A and T.BladeRush:IsUsableP()and T.BladeRush:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(T.BladeRush,nil,nil,nil)then aa=271877;return"queue BladeRush"end elseif(not T.BladeRush:IsUsableP()or T.BladeRush:CooldownRemains()>0 or not g:AffectingCombat())and A then HeroRotationCharDB.Toggles[51]=not HeroRotationCharDB.Toggles[51]l.Print("BladeRush que is now "..(HeroRotationCharDB.Toggles[51]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if z and T.Gouge:IsUsableP()and T.Gouge:CooldownRemains(BypassRecovery)<=0 then if l.Cast(T.Gouge,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(T.Gouge)then ab=17765;return"queue Gouge MO"elseif f("target"):IsSpellInRange(T.Gouge)then aa=1776;return"queue Gouge"end end elseif(not T.Gouge:IsUsableP()or T.Gouge:CooldownRemains()>0 or not g:AffectingCombat())and z then HeroRotationCharDB.Toggles[50]=not HeroRotationCharDB.Toggles[50]l.Print("Gouge Queue is now "..(HeroRotationCharDB.Toggles[50]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if C then if T.ArcaneTorrent:IsAvailable()and T.ArcaneTorrent:IsUsableP()and T.ArcaneTorrent:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(T.ArcaneTorrent,nil,nil,nil)then aa=155145;return"queue ArcaneTorrent Queue"end elseif T.LightsJudgment:IsAvailable()and T.LightsJudgment:IsUsableP()and T.LightsJudgment:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(T.LightsJudgment,nil,nil,nil)then aa=255647;return"queue LightsJudgment Queue"end elseif T.BagofTricks:IsAvailable()and T.BagofTricks:IsUsableP()and T.BagofTricks:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(T.BagofTricks,nil,nil,nil)then aa=312411;return"queue BagofTricks Queue"end elseif T.BloodFury:IsAvailable()and T.BloodFury:IsUsableP()and T.BloodFury:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(T.BloodFury,nil,nil,nil)then aa=20572;return"queue BloodFury Queue"end elseif T.Berserking:IsAvailable()and T.Berserking:IsUsableP()and T.Berserking:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(T.Berserking,nil,nil,nil)then aa=26297;return"queue Berserking Queue"end elseif T.Fireblood:IsAvailable()and T.Fireblood:IsUsableP()and T.Fireblood:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(T.Fireblood,nil,nil,nil)then aa=265221;return"queue Fireblood Queue"end elseif T.AncestralCall:IsAvailable()and T.AncestralCall:IsUsableP()and T.AncestralCall:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(T.AncestralCall,nil,nil,nil)then aa=274738;return"queue AncestralCall Queue"end elseif(T.ArcaneTorrent:IsAvailable()and(not T.ArcaneTorrent:IsUsableP()or T.ArcaneTorrent:CooldownRemains()>0 or not g:AffectingCombat())or T.LightsJudgment:IsAvailable()and(not T.LightsJudgment:IsUsableP()or T.LightsJudgment:CooldownRemains()>0 or not g:AffectingCombat())or T.BagofTricks:IsAvailable()and(not T.BagofTricks:IsUsableP()or T.BagofTricks:CooldownRemains()>0 or not g:AffectingCombat())or T.BloodFury:IsAvailable()and(not T.BloodFury:IsUsableP()or T.BloodFury:CooldownRemains()>0 or not g:AffectingCombat())or T.Berserking:IsAvailable()and(not T.Berserking:IsUsableP()or T.Berserking:CooldownRemains()>0 or not g:AffectingCombat())or T.Fireblood:IsAvailable()and(not T.Fireblood:IsUsableP()or T.Fireblood:CooldownRemains()>0 or not g:AffectingCombat())or T.AncestralCall:IsAvailable()and(not T.AncestralCall:IsUsableP()or T.AncestralCall:CooldownRemains()>0 or not g:AffectingCombat()))and C then HeroRotationCharDB.Toggles[30]=not HeroRotationCharDB.Toggles[30]l.Print("Arcane Torrent Queue is now "..(HeroRotationCharDB.Toggles[30]and"|cff00ff00on|r."or"|cffff0000off|r."))end end;if g:IsChanneling(i(324631))then if l.Cast(T.PoolEnergy,nil,nil,nil)then aa=99999;return"channeling Fleashcraft"end end;Z=R.CrimsonVial()if Z then return Z end;Z=R.Feint()if Z then return Z end;Z=R.Evasion()if Z then return Z end;if g:HealthPercentage()<S.Commons.PhialHP and U.PhialofSerenity:IsReady()and U.PhialofSerenity:CooldownRemains()<=0 then if l.Cast(U.PhialofSerenity,nil)then aa=55;return"PhialofSerenity HP"end end;if g:HealthPercentage()<S.Commons.HealthstoneHP and U.Healthstone:IsReady()and U.Healthstone:CooldownRemains()<=0 then if l.Cast(U.Healthstone,nil)then aa=40;return"Healthstone HP"end end;if g:HealthPercentage()<S.Commons.HealPotHP and U.CosmicHealPot:IsReady()and U.CosmicHealPot:CooldownRemains()<=0 then if l.Cast(U.CosmicHealPot,nil)then aa=45;return"CosmicHealPot HP"end end;if g:HealthPercentage()<S.Commons.HealPotHP and U.HealPotL:IsReady()and U.HealPotL:CooldownRemains()<=0 then if l.Cast(U.HealPotL,nil)then aa=41;return"HealPot LOW HP"end end;if g:HealthPercentage()<S.Commons.HealPotHP and U.HealPotM:IsReady()and U.HealPotM:CooldownRemains()<=0 then if l.Cast(U.HealPotM,nil)then aa=41;return"HealPot MEDIUM HP"end end;if g:HealthPercentage()<S.Commons.HealPotHP and U.HealPotH:IsReady()and U.HealPotH:CooldownRemains()<=0 then if l.Cast(U.HealPotH,nil)then aa=41;return"HealPot HIGH HP"end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if T.PistolShot:IsCastable()and f("mouseover"):IsInMeleeRange(20)then if l.Cast(T.PistolShot,nil)then ab=1185763;return"explosive MO Pistol"end end end;if T.PistolShot:IsCastable()and f("target"):IsInMeleeRange(40)and string.find(UnitGUID("target"),120651)then if l.Cast(T.PistolShot,nil)then aa=185763;return"explosive Tar Pistol"end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),408801)then if T.Blind:IsCastable()and f("mouseover"):IsInMeleeRange(20)then if l.Cast(T.Blind,nil)then ab=20945;return"blind MO incorporeal affix"end end end;K={324736,228318,178658,333227,334800,334967,324737,326450,334470,320703,320012,324085,333241,331510,344739,368477,368396,355057,356133,342139,353706,355782,327155,359668,158337,412695,355782,333875,344739,228318,332158,321764,324914,326046,324776,340544,324736,328015,257260,322433,334324,317936,327332,328288,343470,333293,320272,342139,355888,349933,356549,355934,353706,347775,357284,335141,327155,178658,333227,334800,334967,324737,326450,334470,320703,320012,324085,333241,344739,368477,368396,355057,356133,158337,164426,382555}if UnitExists("target")and T.Shiv:IsReady()and not D then if UnitCanAttack("player","target")and UnitAffectingCombat("target")and UnitIsDead("target")~=true then for aq=0,10 do local aJ,aJ,aK,aL,aM,aN,aJ,aJ,aJ,aO=UnitBuff("target",aq)for aJ,aP in pairs(K)do if aP==aO and aN-aM+500/1000<=GetTime()then if l.Cast(T.Shiv,nil)then aa=5938;return"Shiv Enrage"end end end end end end;local aQ=g:AffectingCombat()and 180 or 900;local aR;if not g:AffectingCombat()then if i(8679):IsAvailable()and S.Commons.LethalPoison=="Wound Poison"then aR=g:BuffRemains(i(8679))if aR<aQ and not g:IsCasting(i(8679))then if l.Cast(i(8679))then aa=203;return"Wound Poison Refresh"end end elseif i(2823):IsAvailable()and S.Commons.LethalPoison=="Deadly Poison"then aR=g:BuffRemains(i(2823))if aR<aQ and not g:IsCasting(i(2823))then if l.Cast(i(2823))then aa=208;return"Deadly Poison Refresh"end end elseif i(315584):IsAvailable()and S.Commons.LethalPoison=="Instant Poison"then aR=g:BuffRemains(i(315584))if aR<aQ and not g:IsCasting(i(315584))then if l.Cast(i(315584))then aa=205;return"Instant Poison Refresh"end end end end;aR=g:BuffRemains(i(381637))if i(381637):IsAvailable()and S.Commons.NonLethalPoison=="Atrophic Poison"then if aR<aQ and not g:IsCasting(i(381637))then if l.Cast(i(381637))then aa=381637;return"Antropic Poison Refresh"end end elseif i(5761):IsAvailable()and S.Commons.NonLethalPoison=="Numbing Poison"then aR=g:BuffRemains(i(5761))if aR<aQ and not g:IsCasting(NumbingPoison)then if l.Cast(i(5761))then aa=204;return"Numbing Poison Refresh"end end elseif i(3408):IsAvailable()and S.Commons.NonLethalPoison=="Crippling Poison"then aR=g:BuffRemains(i(3408))if aR<aQ and not g:IsCasting(NumbingPoison)then if l.Cast(i(3408))then aa=206;return"Crippling Poison Refresh"end end end;if not g:BuffUp(T.VanishBuff)and not g:AffectingCombat()and not g:StealthUp(true,true)then Z=R.Stealth(T.Stealth)if Z then return Z end end;if not g:AffectingCombat()and T.Vanish:TimeSinceLastCast()>1 then if T.BladeFlurry:IsReady()and g:BuffDown(T.BladeFlurry)and T.UnderhandedUpperhand:IsAvailable()and not g:StealthUp(true,true)and af()then if l.Cast(T.BladeFlurry)then aa=13877;return"Blade Flurry (Opener)"end end;if not g:StealthUp(true,false)then Z=R.Stealth(R.StealthSpell())if Z then return Z end end;if Q.TargetIsValid()and(not g:AffectingCombat()and p)then if n()and T.MarkedforDeath:IsCastable()and a3>=R.CPMaxSpend()-1 and h:NPCID()~=170234 then if S.Commons.STMfDAsDPSCD then if l.Cast(T.MarkedforDeath,nil)then aa=137619;return"Cast Marked for Death (OOC)"end else if l.Cast(T.MarkedforDeath,nil)then aa=137619;return"Cast Marked for Death (OOC)"end end end;if T.AdrenalineRush:IsReady()and T.ImprovedAdrenalineRush:IsAvailable()and a2<=2 and not T.LoadedDiceBuff:IsAvailable()then if l.Cast(T.AdrenalineRush)then aa=13750;return"Cast Adrenaline Rush (Opener)"end end;if T.RolltheBones:IsReady()and not g:DebuffUp(T.Dreadblades)and(ao()==0 or as())then if l.Cast(T.RolltheBones)then aa=315508;return"Cast Roll the Bones (Opener)"end end;if T.AdrenalineRush:IsReady()and T.ImprovedAdrenalineRush:IsAvailable()and a2<=2 and T.LoadedDiceBuff:IsAvailable()then if l.Cast(T.AdrenalineRush)then aa=13750;return"Cast Adrenaline Rush (Opener)"end end;if T.SliceandDice:IsReady()and g:BuffRemains(T.SliceandDice)<(1+a2)*1.8 then if l.CastPooling(T.SliceandDice)then aa=315496;return"Cast Slice and Dice (Opener)"end end;if g:StealthUp(true,false)or g:BuffUp(T.VanishBuff)then Z=aE()if Z then return"Stealth (Opener): "..Z end;if T.KeepItRolling:IsAvailable()and T.GhostlyStrike:IsReady()and T.EchoingReprimand:IsAvailable()then if l.Cast(T.GhostlyStrike)then aa=196937;return"Cast Ghostly Strike KiR (Opener)"end end;if T.Ambush:IsCastable()then if l.Cast(T.Ambush)then aa=8676;return"Cast Ambush (Opener)"end end elseif at()then Z=aF()if Z then return"Finish (Opener): "..Z end end;if T.SinisterStrike:IsCastable()then if l.Cast(T.SinisterStrike)then aa=193315;return"Cast Sinister Strike (Opener)"end end end;return end;if T.FanTheHammer:IsAvailable()and T.PistolShot:TimeSinceLastCast()<g:GCDRemains()then a2=M(a2,R.FanTheHammerCP())a1=R.EffectiveComboPoints(a2)a3=g:ComboPointsDeficit()end;if Q.TargetIsValid()and(g:AffectingCombat()or p or g:BuffUp(T.VanishBuff))and not h:DebuffUp(i(1776))and not h:DebuffUp(i(6770))then if g:BuffUp(T.Stealth)or g:BuffUp(T.VanishBuff)or g:BuffUp(T.Shadowmeld)then Z=aE()if Z then return"Stealth: "..Z end end;local aS,aT,aJ=GetSpellCooldown(57934)if S.Commons.AutoToT then if aS+aT-GetTime()<=0 and T.TricksoftheTrade:IsAvailable()and T.TricksoftheTrade:CooldownRemains(BypassRecovery)<=0 and UnitExists("focus")and(UnitInParty("focus")or UnitInRaid("focus"))then if l.Cast(T.TricksoftheTrade)then aa=207;return"ToT Focus"end end end;Z=az()if Z then return"CDs: "..Z end;if g:StealthUp(true,true)then Z=aE()if Z then return"Stealth: "..Z end end;if at()then Z=aF()if Z then return"Finish: "..Z end;l.Cast(T.PoolEnergy)return"Finish Pooling"end;Z=aG()if Z then return"Build: "..Z end;if T.ArcaneTorrent:IsCastable()and S.Commons.Enabled.Racials and n()and h:IsSpellInRange(T.SinisterStrike)and a6>15+a5 then if l.Cast(T.ArcaneTorrent,nil)then aa=155145;return"Cast Arcane Torrent"end end;if T.ArcanePulse:IsCastable()and S.Commons.Enabled.Racials and n()and h:IsSpellInRange(T.SinisterStrike)then if l.Cast(T.ArcanePulse)then aa=260364;return"Cast Arcane Pulse"end end;if T.LightsJudgment:IsCastable()and S.Commons.Enabled.Racials and n()and h:IsInMeleeRange(5)then if l.Cast(T.LightsJudgment,nil)then aa=255647;return"Cast Lights Judgment"end end;if T.BagofTricks:IsCastable()and S.Commons.Enabled.Racials and n()and h:IsInMeleeRange(5)then if l.Cast(T.BagofTricks,nil)then aa=312411;return"Cast Bag of Tricks"end end;if T.PistolShot:IsCastable()and h:IsSpellInRange(T.PistolShot)and not h:IsInRange(_)and not g:StealthUp(true,true)and a6<25 and(a3>=1 or a7<=1.2)then if l.Cast(T.PistolShot)then aa=185763;return"Cast Pistol Shot (OOR)"end end end end;local function aU()if HeroRotationCharDB.Toggles[5]then HeroRotationCharDB.Toggles[5]=not HeroRotationCharDB.Toggles[5]l.ToggleIconFrame:UpdateButtonText(5)end end;function ReturnSpellOut()if aa==0 then return 0 else return aa end end;function ReturnSpellMOOut()if ab==0 then return 0 else return ab end end;l.SetAPL(260,aI,aU)