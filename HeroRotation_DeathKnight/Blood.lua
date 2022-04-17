local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=HeroRotation;local m=l.Cast;local n=l.CDsON;local o=l.AoEON;local p=HeroRotationCharDB.Toggles[4]local q=HeroRotationCharDB.Toggles[5]local r=HeroRotationCharDB.Toggles[6]local s=HeroRotationCharDB.Toggles[12]local t=HeroRotationCharDB.Toggles[13]local u=HeroRotationCharDB.Toggles[14]local v=HeroRotationCharDB.Toggles[15]local w=HeroRotationCharDB.Toggles[16]local x=HeroRotationCharDB.Toggles[80]local y=HeroRotationCharDB.Toggles[81]local z=HeroRotationCharDB.Toggles[82]local A=HeroRotationCharDB.Toggles[72]local B=HeroRotationCharDB.Toggles[83]local C=false;local D=0;local E=math.min;local F=j.DeathKnight.Blood;local G=k.DeathKnight.Blood;local H={}local I;local J;local K;local L;local M;local N;local O;local P;local Q;local R;local S;local T=d.GhoulTable;local U;local V;local W=2;local X=999999;local Y=2;local Z=g:CovenantID()d:RegisterForEvent(function()Z=g:CovenantID()end,"COVENANT_CHOSEN")local a0=l.Commons.Everyone;local a1={General=l.GUISettings.General,Commons=l.GUISettings.APL.DeathKnight.Commons,Blood=l.GUISettings.APL.DeathKnight.Blood}local a2={{F.Asphyxiate,"Cast Asphyxiate (Interrupt)",function()return true end}}local a3=0;local a4=0;local a5=g:HasLegendaryEquipped(30)local a6=g:HasLegendaryEquipped(31)local a7=g:HasLegendaryEquipped(45)local a8=g:HasLegendaryEquipped(35)d:RegisterForEvent(function()equip=g:GetEquipment()trinket1=k(0)trinket2=k(0)if equip[13]then trinket1=k(equip[13])end;if equip[14]then trinket2=k(equip[14])end;a5=g:HasLegendaryEquipped(30)a6=g:HasLegendaryEquipped(31)a7=g:HasLegendaryEquipped(45)a8=g:HasLegendaryEquipped(35)end,"PLAYER_EQUIPMENT_CHANGED")local a9={5,8,10,30,40,100}local aa={}local function ab()for _,ac in ipairs(a9)do if ac==8 or 5 then aa[ac]=h:IsInMeleeRange(ac)end;aa[ac]=h:IsInRange(ac)end end;local function ad(ae)if ae then return 1 else return 0 end end;local function af(ae)return ae~=0 end;local function ag(ah)local ai=0;if ah~=nil then for _,aj in pairs(ah)do if not aj:DebuffUp(F.BloodPlagueDebuff)then ai=ai+1 end end end;return ai end;local function ak(al)if not g:IsTanking(al)and A and al:AffectingCombat()and al:GUID()==f("mouseover"):GUID()and al:NPCID()~=118044 then a4=156222;return true elseif not g:IsTanking(al)and A and al:AffectingCombat()and al:GUID()==h:GUID()and al:NPCID()~=118044 then a3=56222;return true elseif not g:IsTanking(al)and A and al:AffectingCombat()and al:NPCID()~=118044 then return true end end;local function am()if a0.TargetIsValid()then if F.Fleshcraft:IsCastable()and(D==0 or D>F.Fleshcraft:ExecuteTime())and p and not g:IsMoving()then if m(F.Fleshcraft,nil,nil)then a3=324631;return"fleshcraft precombat 1"end end;if F.DeathsCaress:IsReady()and not h:IsInMeleeRange(5)then if m(F.DeathsCaress,nil,nil,not h:IsSpellInRange(F.DeathsCaress))then a3=195292;return"deaths_caress precombat 2"end end;if F.Marrowrend:IsReady()and h:IsInMeleeRange(5)then if m(F.Marrowrend)then a3=195182;return"marrowrend precombat 4"end end;if F.BloodBoil:IsCastable()and h:IsInMeleeRange(10)then if m(F.BloodBoil)then a3=50842;return"blood_boil precombat 6"end end end end;local function an()if F.DeathStrike:IsReady()and not V and g:HealthPercentage()<a1.Commons.UseDeathStrikeHP then if m(F.DeathStrike,nil,nil,not h:IsSpellInRange(F.DeathStrike))then a3=49998;return"death_strike defensives 4"end end;if g:HealthPercentage()<a1.Commons.PhialHP and G.PhialofSerenity:IsReady()and G.PhialofSerenity:CooldownRemains()<=0 and g:BuffDown(F.ShroudofPurgatory)then if l.Cast(G.PhialofSerenity,nil)then a3=55;return"PhialofSerenity HP"end end;if g:HealthPercentage()<a1.Commons.HealthstoneHP and G.Healthstone:IsReady()and G.Healthstone:CooldownRemains()<=0 and g:BuffDown(F.ShroudofPurgatory)then if l.Cast(G.Healthstone,nil)then a3=40;return"Healthstone HP"end end;if g:HealthPercentage()<a1.Commons.HealPotHP and G.CosmicHealPot:IsReady()and G.CosmicHealPot:CooldownRemains()<=0 and g:BuffDown(F.ShroudofPurgatory)then if l.Cast(G.CosmicHealPot,nil)then a3=45;return"CosmicHealPot HP"end end;if g:HealthPercentage()<a1.Commons.HealPotHP and G.HealPot:IsReady()and G.HealPot:CooldownRemains()<=0 and g:BuffDown(F.ShroudofPurgatory)then if l.Cast(G.HealPot,nil)then a3=41;return"HealPot HP"end end;if F.AntiMagicShell:IsReady()and W>0 and g:HealthPercentage()<=a1.Commons.AntiMagicShellHP then if m(F.AntiMagicShell,nil,nil)then a3=48707;return"AntiMagic Shell defensives 18"end end;if F.RuneTap:IsReady()and O and g:HealthPercentage()<=a1.Blood.RuneTapThreshold and g:Rune()>=3 and F.RuneTap:Charges()>=1 and g:BuffDown(F.RuneTapBuff)then if m(F.RuneTap,nil)then a3=194679;return"rune_tap defensives 2"end end;if a0.ActiveMitigationNeeded()and F.Marrowrend:TimeSinceLastCast()>2.5 and F.DeathStrike:TimeSinceLastCast()>2.5 then if F.DeathStrike:IsReady()and not V and g:BuffStack(F.BoneShieldBuff)>7 then if m(F.DeathStrike,nil,nil,not h:IsSpellInRange(F.DeathStrike))then a3=49998;return"death_strike defensives 4"end end;if F.Marrowrend:IsReady()then if m(F.Marrowrend,nil,nil,not h:IsSpellInRange(F.Marrowrend))then a3=195182;return"marrowrend defensives 6"end end;if F.DeathStrike:IsReady()and not V then if m(F.DeathStrike,nil,nil,not h:IsSpellInRange(F.DeathStrike))then a3=49998;return"death_strike defensives 10"end end end;if F.Marrowrend:IsReady()and(g:BuffRemains(F.BoneShieldBuff)<=6 or h:TimeToDie()<5 and g:BuffRemains(F.BoneShieldBuff)<10 and Q==1)then if m(F.Marrowrend,nil,nil,not h:IsSpellInRange(F.Marrowrend))then a3=195182;return"marrowrend defensives 12"end end;if F.VampiricBlood:IsCastable()and O and g:HealthPercentage()<=a1.Blood.VampiricBloodThreshold and g:BuffDown(F.IceboundFortitudeBuff)then if m(F.VampiricBlood,nil)then a3=55233;return"vampiric_blood defensives 14"end end;if F.Lichborne:IsReady()and g:HealthPercentage()<=a1.Commons.LichborneHP then if m(F.Lichborne,nil,nil)then a3=49039;return"Lichborne defensives 18"end end;if F.DeathPact:IsAvailable()and F.DeathPact:IsReady()and g:HealthPercentage()<=a1.Commons.DeathPactHP then if m(F.DeathPact,nil,nil)then a3=48743;return"DeathPact defensives 18"end end;if F.IceboundFortitude:IsCastable()and O and g:HealthPercentage()<=a1.Blood.IceboundFortitudeThreshold and g:BuffDown(F.VampiricBloodBuff)then if m(F.IceboundFortitude,nil)then a3=48792;return"icebound_fortitude defensives 16"end end;if F.DeathStrike:IsReady()and not V and g:HealthPercentage()<=50+(g:RunicPower()>90 and 20 or 0)and not g:HealingAbsorbed()then if m(F.DeathStrike,nil,nil,not h:IsSpellInRange(F.DeathStrike))then a3=49998;return"death_strike defensives 18"end end end;local function ao()if F.BloodFury:IsCastable()and a1.Commons.Enabled.Racials and((F.DancingRuneWeapon:CooldownUp()or z)and(not F.Blooddrinker:IsReady()or not F.Blooddrinker:IsAvailable()))then if m(F.BloodFury,nil)then a3=20572;return"blood_fury main 2"end end;if F.Berserking:IsCastable()and a1.Commons.Enabled.Racials then if m(F.Berserking,nil)then a3=26297;return"berserking main 4"end end;if F.ArcanePulse:IsCastable()and a1.Commons.Enabled.Racials and(Q>=2 or g:Rune()<1 and g:RunicPowerDeficit()>60)then if m(F.ArcanePulse,nil,nil,not h:IsInRange(8))then a3=260364;return"arcane_pulse main 6"end end;if F.LightsJudgment:IsCastable()and a1.Commons.Enabled.Racials and g:BuffUp(F.UnholyStrengthBuff)then if m(F.LightsJudgment,nil,nil,not h:IsSpellInRange(F.LightsJudgment))then a3=255647;return"lights_judgment main 8"end end;if F.AncestralCall:IsCastable()and a1.Commons.Enabled.Racials then if m(F.AncestralCall,nil)then a3=274738;return"ancestral_call main 10"end end;if F.Fireblood:IsCastable()and a1.Commons.Enabled.Racials then if m(F.Fireblood,nil)then a3=265221;return"fireblood main 12"end end;if F.BagofTricks:IsCastable()and a1.Commons.Enabled.Racials then if m(F.BagofTricks,nil,nil,not h:IsSpellInRange(F.BagofTricks))then a3=312411;return"bag_of_tricks main 14"end end;if F.ArcaneTorrent:IsCastable()and a1.Commons.Enabled.Racials and g:RunicPowerDeficit()>20 then if m(F.ArcaneTorrent,nil,nil,nil)then a3=155145;return"ArcaneTorrent main 14"end end end;local function ap()if F.DeathsDue:IsReady()and p and(g:BuffDown(F.DeathAndDecayBuff)or g:BuffRemains(F.DeathAndDecayBuff)<4 or g:BuffUp(F.CrimsonScourgeBuff))then if m(F.DeathsDue,nil,nil,not h:IsSpellInRange(F.DeathsDue))then a3=324128;return"deaths_due covenants 6"end end;if F.SwarmingMist:IsCastable()and p and(F.DancingRuneWeapon:CooldownRemains()>3 and g:RunicPower()>=90-Q*3)then if m(F.SwarmingMist,nil,nil)then a3=311648;return"swarming_mist covenants 7"end end;if F.AbominationLimb:IsCastable()and p and g:BuffDown(F.DancingRuneWeaponBuff)then if m(F.AbominationLimb,nil,nil,not h:IsInRange(8))then a3=315443;return"abomination_limb covenants 16"end end;if F.Fleshcraft:IsCastable()and(D==0 or D>F.Fleshcraft:ExecuteTime())and not g:IsMoving()and p and g:BuffDown(F.DancingRuneWeaponBuff)and(F.PustuleEruption:SoulbindEnabled()or F.VolatileSolvent:SoulbindEnabled()and g:BuffDown(F.VolatileSolventHumanBuff))then if m(F.Fleshcraft,nil,nil)then a3=324631;return"fleshcraft covenants 20"end end;if F.ShackleTheUnworthy:IsCastable()and p and(g:Rune()<3 and g:RunicPower()<100)then if m(F.ShackleTheUnworthy,nil,nil,not h:IsSpellInRange(F.ShackleTheUnworthy))then a3=312202;return"shackle_the_unworthy covenants 18"end end end;local function aq()if F.DeathAndDecay:IsCastable()and not B and EnemiesCount10y>=3 and not F.DeathsDue:IsAvailable()then if m(F.DeathAndDecay,nil,nil,not h:IsInRange(30))then a3=43265;return"death_and_decay drw_up 14"end end;if F.HeartStrike:IsReady()and g:HasTier(28,2)then if m(F.HeartStrike,nil,nil,not h:IsSpellInRange(F.HeartStrike))then a3=206930;return"heart_strike drw_up 18"end end;if F.Tombstone:IsReady()and(g:BuffStack(F.BoneShieldBuff)>=5 and g:Rune()>=2 and g:RunicPowerDeficit()>=30 and a8)then if m(F.Tombstone,nil)then a3=219808;return"tombstone drw_up 2"end end;if F.Marrowrend:IsReady()and((g:BuffRemains(F.BoneShieldBuff)<=g:RuneTimeToX(3)or g:BuffRemains(F.BoneShieldBuff)<=g:GCD()+ad(F.Blooddrinker:CooldownUp())*ad(F.Blooddrinker:IsAvailable())*4 or g:BuffStack(F.BoneShieldBuff)<2 and(Z~=4 or g:BuffUp(F.AbominationLimb)))and g:RunicPowerDeficit()>20)then if m(F.Marrowrend,nil,nil,not h:IsSpellInRange(F.Marrowrend))then a3=195182;return"marrowrend drw_up 2"end end;if F.BloodBoil:IsCastable()and h:IsInRange(10)and(F.BloodBoil:Charges()>=2 and g:Rune()<=1)then if m(F.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then a3=50842;return"blood_boil drw_up 4"end end;M=15+ad(g:BuffUp(F.DancingRuneWeaponBuff))*10+R*ad(F.Heartbreaker:IsAvailable())*2;if F.DeathStrike:IsReady()and g:RunicPower()>=a1.Blood.MinimumRP+45 and not V and not U and(g:RunicPowerDeficit()<=M and not(F.Bonestorm:IsAvailable()and F.Bonestorm:CooldownRemains()<2))then if m(F.DeathStrike,nil,nil,not h:IsSpellInRange(F.DeathStrike))then a3=49998;return"death_strike drw_up 6"end end;if F.Bonestorm:IsReady()and not V and g:RunicPower()>=a1.Blood.BonestormPower then if m(F.Bonestorm,nil,nil,not h:IsInRange(8))then a3=194844;return"bonestorm drw_up 10"end end;if F.HeartStrike:IsReady()and(g:RuneTimeToX(2)<g:GCD()or g:RunicPowerDeficit()>=M)then if m(F.HeartStrike,nil,nil,not h:IsSpellInRange(F.HeartStrike))then a3=206930;return"heart_strike drw_up 8"end end;if F.DeathAndDecay:IsCastable()and not B and EnemiesCount10y>=3 then if m(F.DeathAndDecay,nil,nil,not h:IsInRange(30))then a3=43265;return"death_and_decay drw_up 14"end end end;local function ar()if F.HeartStrike:IsReady()and(Z==3 and g:BuffUp(F.DeathAndDecayBuff)and(g:BuffUp(F.DeathAndDecayBuff)and g:BuffRemains(F.DeathAndDecayBuff)<6))then if m(F.HeartStrike,nil,nil,not h:IsSpellInRange(F.HeartStrike))then a3=206930;return"heart_strike standard 2"end end;if F.DeathAndDecay:IsCastable()and not B and EnemiesCount10y>=3 and not F.DeathsDue:IsAvailable()then if m(F.DeathAndDecay,nil,nil,not h:IsInRange(30))then a3=43265;return"death_and_decay drw_up 14"end end;if F.Tombstone:IsCastable()and(g:BuffStack(F.BoneShieldBuff)>=5 and g:Rune()>=2 and g:RunicPowerDeficit()>=30)then if m(F.Tombstone,nil)then a3=219808;return"tombstone standard 4"end end;if F.Marrowrend:IsReady()and((g:BuffRemains(F.BoneShieldBuff)<=g:RuneTimeToX(3)or g:BuffRemains(F.BoneShieldBuff)<=g:GCD()+ad(F.Blooddrinker:CooldownUp())*ad(F.Blooddrinker:IsAvailable())*4 or g:BuffStack(F.BoneShieldBuff)<6 or(Z~=3 or g:BuffRemains(F.DeathAndDecayBuff)>5 and Z==3)and g:BuffRemains(F.BoneShieldBuff)<7)and g:RunicPowerDeficit()>20)then if m(F.Marrowrend,nil,nil,not h:IsSpellInRange(F.Marrowrend))then a3=195182;return"marrowrend standard 6"end end;if F.DeathStrike:IsReady()and g:RunicPower()>=a1.Blood.MinimumRP+45 and not V and not U and(g:RunicPowerDeficit()<=J and not(F.Bonestorm:IsAvailable()and F.Bonestorm:CooldownRemains()<2)and not(Z==2 and F.SwarmingMist:CooldownRemains()<3))then if m(F.DeathStrike,nil,nil,not h:IsSpellInRange(F.DeathStrike))then a3=49998;return"death_strike standard 8"end end;if F.BloodBoil:IsCastable()and h:IsInRange(10)and(F.BloodBoil:ChargesFractional()>=1.8 and(g:BuffStack(F.HemostasisBuff)<=5-EnemiesCount10y or EnemiesCount10y>2))then if m(F.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then a3=50842;return"blood_boil standard 10"end end;if F.DeathAndDecay:IsReady()and not B and(g:BuffUp(F.CrimsonScourgeBuff)and g:RunicPowerDeficit()>10)then if m(F.DeathAndDecay,nil,nil,not h:IsInRange(30))then a3=43265;return"death_and_decay standard 12"end end;if F.Bonestorm:IsReady()and not V and g:RunicPower()>=a1.Blood.BonestormPower then if m(F.Bonestorm,nil,nil,not h:IsInRange(8))then a3=194844;return"bonestorm standard 14"end end;if Z==3 and g:BuffUp(F.DeathAndDecayBuff)then L=15+Q*ad(F.Heartbreaker:IsAvailable())*2 else L=(15+Q*ad(F.Heartbreaker:IsAvailable())*2)*1.2 end;if F.DeathStrike:IsReady()and g:RunicPower()>=a1.Blood.MinimumRP+45 and not V and not U and(g:RunicPowerDeficit()<=L or h:TimeToDie()<10)then if m(F.DeathStrike,nil,nil,not h:IsSpellInRange(F.DeathStrike))then a3=49998;return"death_strike standard 16"end end;if F.DeathAndDecay:IsReady()and not B and Q>=3 then if m(F.DeathAndDecay,nil,nil,not h:IsInRange(30))then a3=43265;return"death_and_decay standard 18"end end;if F.DeathAndDecay:IsReady()and not B and(g:BuffUp(F.CrimsonScourgeBuff)or F.RapidDecomposition:IsAvailable())then if m(F.DeathAndDecay,nil,nil,not h:IsInRange(30))then a3=43265;return"death_and_decay standard 22"end end;if F.HeartStrike:IsReady()and g:RuneTimeToX(4)<g:GCD()then if m(F.HeartStrike,nil,nil,not h:IsSpellInRange(F.HeartStrike))then a3=206930;return"heart_strike standard 20"end end;if F.Consumption:IsCastable()then if m(F.Consumption,nil,nil,not h:IsSpellInRange(F.Consumption))then a3=274156;return"consumption standard 24"end end;if F.BloodBoil:IsCastable()and h:IsInRange(10)and F.BloodBoil:ChargesFractional()>=1.1 then if m(F.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then a3=50842;return"blood_boil standard 26"end end;if F.HeartStrike:IsReady()and(g:Rune()>1 and(g:RuneTimeToX(3)<g:GCD()or g:BuffStack(F.BoneShieldBuff)>7))then if m(F.HeartStrike,nil,nil,not h:IsSpellInRange(F.HeartStrike))then a3=206930;return"heart_strike standard 28"end end end;local function as()r=HeroRotationCharDB.Toggles[6]p=HeroRotationCharDB.Toggles[4]q=HeroRotationCharDB.Toggles[5]s=HeroRotationCharDB.Toggles[12]t=HeroRotationCharDB.Toggles[13]u=HeroRotationCharDB.Toggles[14]v=HeroRotationCharDB.Toggles[15]w=HeroRotationCharDB.Toggles[16]x=HeroRotationCharDB.Toggles[80]y=HeroRotationCharDB.Toggles[81]z=HeroRotationCharDB.Toggles[82]A=HeroRotationCharDB.Toggles[72]B=HeroRotationCharDB.Toggles[83]U=false;V=false;if F.Bonestorm:IsAvailable()and n()and F.Bonestorm:CooldownRemains()<=0 and F.Bonestorm:IsCastable()then U=true end;D=0;for ac=1,20 do if select(10,UnitDebuff("player",ac))==240447 then if select(6,UnitDebuff("player",ac))~=nil then D=select(6,UnitDebuff("player",ac))-GetTime()end end end end;local function at()Enemies10y=g:GetEnemiesInRange(10)if o()then P=g:GetEnemiesInMeleeRange(8)Q=#P;EnemiesCount10y=#Enemies10y;Enemies40y=g:GetEnemiesInRange(40)else Q=1;EnemiesCount10y=1 end;S=ag(Enemies10y)R=E(Q,g:BuffUp(F.DeathAndDecayBuff)and 5 or 2)S=ag(Enemies10y)O=g:IsTankingAoE(8)or g:IsTanking(h)TopTrinketID,_=GetInventoryItemID("player",13)BotTrinketID,_=GetInventoryItemID("player",14)ActiveMitigationNeeded=g:ActiveMitigationNeeded()if not BotOn then a4=0;a3=0 end;if a4>0 then a4=0 end;if a3>0 then a3=0 end;I=as()if l.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then starttime=GetTime()endtime=starttime+l.GUISettings.General.OpenerReset elseif l.GUISettings.General.OpenerReset>0 and endtime~=nil and GetTime()>endtime and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]l.ToggleIconFrame:UpdateButtonText(6)l.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if g:IsChanneling(j(324631))then if l.CastAnnotated(F.Pool,false,"WAIT")then a3=99999;return"Pool During Blooddrinker"end end;if not g:AffectingCombat()then C=false end;if not g:AffectingCombat()and a0.TargetIsValid()and r then local I=am()if I then return I end end;if not UnitIsEnemy("player","mouseover")and UnitIsPlayer("mouseover")and UnitIsDead("mouseover")then if F.RaiseAlly:IsCastable()and g:RunicPower()>=30 then if m(F.RaiseAlly,nil)then a4=161999;return"RaiseAlly MO"end elseif F.RaiseAlly:CooldownRemains(BypassRecovery)<=0 and g:RunicPower()<30 then V=true end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if F.HeartStrike:IsCastable()then if m(F.HeartStrike,nil)then a4=1206930;return"explosive MO HeartStrike"end end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if F.DeathStrike:IsCastable()then if m(F.DeathStrike,nil)then a4=149998;return"explosive MO DeathStrike"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)then if F.HeartStrike:IsCastable()then if m(F.HeartStrike,nil)then a3=206930;return"explosive  HeartStrike"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)then if F.DeathStrike:IsCastable()then if m(F.DeathStrike,nil)then a3=49998;return"explosive  DeathStrike"end end end;if a0.TargetIsValid()then if F.DarkCommand:IsReady()and g:AffectingCombat()and(not g:IsTanking(h)and A)then if m(F.DarkCommand,nil)then a3=56222;return"DarkCommand bear 3"end end;if F.DarkCommand:IsReady()then if a0.CastCycle(F.DarkCommand,Enemies40y,ak,not h:IsSpellInRange(F.DarkCommand))then return"DarkCommand 4"end end end;if w and F.Asphyxiate:IsUsableP()and F.Asphyxiate:CooldownRemains(BypassRecovery)<=0 then if l.Cast(F.Asphyxiate,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(F.Asphyxiate)then a4=1221562;return"queue Asphyxiate MO"else a3=221562;return"queue Asphyxiate"end end elseif(not F.Asphyxiate:IsUsableP()or F.Asphyxiate:CooldownRemains()>0)and w then HeroRotationCharDB.Toggles[16]=not HeroRotationCharDB.Toggles[16]l.Print("Asphyxiate Queue is now "..(HeroRotationCharDB.Toggles[16]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if u and F.DeathGrip:IsUsableP()and F.DeathGrip:CooldownRemains(BypassRecovery)<=0 then if l.Cast(F.DeathGrip,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(F.DeathGrip)then a4=149576;return"queue DeathGrip MO"else a3=49576;return"queue DeathGrip"end end elseif(not F.DeathGrip:IsUsableP()or F.DeathGrip:CooldownRemains()>0)and u then HeroRotationCharDB.Toggles[14]=not HeroRotationCharDB.Toggles[14]l.Print("DeathGrip Queue is now "..(HeroRotationCharDB.Toggles[14]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if x and F.GorefiendsGrasp:IsUsableP()and F.GorefiendsGrasp:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(F.GorefiendsGrasp,nil,nil,nil)then a3=108199;return"queue Gorefiends Grasp"end elseif(not F.GorefiendsGrasp:IsUsableP()or F.GorefiendsGrasp:CooldownRemains()>0 or not g:AffectingCombat())and x then HeroRotationCharDB.Toggles[80]=not HeroRotationCharDB.Toggles[80]l.Print("Gorefiend's Grasp Queue is now "..(HeroRotationCharDB.Toggles[80]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if t and F.AntiMagicZone:IsUsableP()and F.AntiMagicZone:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(F.AntiMagicZone,nil,nil,nil)then a3=51052;return"queue Anti Magic Zone"end elseif(not F.AntiMagicZone:IsUsableP()or F.AntiMagicZone:CooldownRemains()>0 or not g:AffectingCombat())and t then HeroRotationCharDB.Toggles[13]=not HeroRotationCharDB.Toggles[13]l.Print("Anti-Magic Zone Queue is now "..(HeroRotationCharDB.Toggles[13]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if y and F.ControlUndead:IsUsableP()and F.ControlUndead:CooldownRemains(BypassRecovery)<=0 and not g:PrevGCD(1,F.ControlUndead)then if l.Cast(F.ControlUndead,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsInRange(30)then a4=1111673;return"queue ControlUndead MO"else a3=111673;return"queue ControlUndead"end end elseif(not F.ControlUndead:IsUsableP()or F.ControlUndead:CooldownRemains()>0 or g:PrevGCD(1,F.ControlUndead))and y then HeroRotationCharDB.Toggles[81]=not HeroRotationCharDB.Toggles[81]l.Print("Control Undead Queue is now "..(HeroRotationCharDB.Toggles[81]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if a0.TargetIsValid()and g:AffectingCombat()then if a1.Commons.UseDefensives then local I=an()if I then return I end end;if g:IsChanneling(F.Blooddrinker)and g:BuffUp(F.BoneShieldBuff)and S==0 and not g:ShouldStopCasting()and g:CastRemains()>0.2 then if l.CastAnnotated(F.Pool,false,"WAIT")then a3=99999;return"Pool During Blooddrinker"end end;J=Z==3 and g:BuffRemains(F.DeathAndDecayBuff)>6 and 70 or 55;if G.PotionofPhantomFire:IsReady()and a1.Commons.Enabled.Potions and g:BuffUp(F.DancingRuneWeaponBuff)then if m(G.PotionofPhantomFire,nil,nil)then a3=37;return"potion main 16"end end;if a1.Commons.Enabled.TopTrinket or a1.Commons.Enabled.BottomTrinket then local au=g:GetUseableTrinkets(H)if au then if m(au,nil,nil)then if au:ID()==TopTrinketID and a1.Commons.Enabled.TopTrinket and(a1.Blood.TopTrinketHP<=0 and n()or a1.Blood.TopTrinketHP>g:HealthPercentage())then a3=24;return"top trinket 1"elseif au:ID()==BotTrinketID and a1.Commons.Enabled.BottomTrinket and(a1.Blood.BotTrinketHP<=0 and n()or a1.Blood.BotTrinketHP>g:HealthPercentage())then a3=30;return"top trinket 2"end end end end;if n()and not i:DebuffUp(j(111673))and F.RaiseDead:IsCastable()then if m(F.RaiseDead,nil,nil)then a3=46585;return"raise_dead main 24"end end;if F.Blooddrinker:IsReady()and(D==0 or D>3)and(g:BuffDown(F.DancingRuneWeaponBuff)and(Z~=3 or Z==3 and g:BuffRemains(F.DeathAndDecayBuff)>7))then if m(F.Blooddrinker,nil,nil,not h:IsSpellInRange(F.Blooddrinker))then a3=206931;return"blooddrinker main 20"end end;if true then local I=ao()if I then return I end end;if F.RaiseDead:TimeSinceLastCast()<=60 and T.active()and((Z~=3 or Z==3 and g:BuffRemains(F.DeathAndDecayBuff)>6)and g:BuffRemains(F.DancingRuneWeaponBuff)>4 and(T.remains()<2 or h:TimeToDie()<g:GCD()))then if m(F.SacrificialPact,nil)then a3=237574;return"sacrificial_pact covenants 8"end end;if true then local I=ap()if I then return I end end;if F.BloodTap:IsCastable()and(g:Rune()<=2 and g:RuneTimeToX(4)>g:GCD()and F.BloodTap:ChargesFractional()>=1.8 or g:RuneTimeToX(3)>g:GCD())then if m(F.BloodTap)then a3=221699;return"blood_tap main 12"end end;if F.DancingRuneWeapon:IsCastable()and not z and n()and g:BuffDown(F.DancingRuneWeaponBuff)then if m(F.DancingRuneWeapon,nil)then a3=49028;return"dancing_rune_weapon main 14"end end;if g:BuffUp(F.DancingRuneWeaponBuff)then local I=aq()if I then return I end end;if true then local I=ar()if I then return I end end;if l.CastAnnotated(F.Pool,false,"WAIT")then return"Wait/Pool Resources"end end end;local function av()end;function ReturnSpell1()if a3==0 then return 0 else return a3 end end;function ReturnSpellMO1()if a4==0 then return 0 else return a4 end end;l.SetAPL(250,at,av)