local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=HeroRotation;local m=l.Cast;local n=l.CDsON;local o=l.AoEON;local p=HeroRotationCharDB.Toggles[4]local q=HeroRotationCharDB.Toggles[5]local r=HeroRotationCharDB.Toggles[6]local s=HeroRotationCharDB.Toggles[12]local t=HeroRotationCharDB.Toggles[13]local u=HeroRotationCharDB.Toggles[14]local v=HeroRotationCharDB.Toggles[15]local w=HeroRotationCharDB.Toggles[16]local x=j.DeathKnight.Blood;local y=k.DeathKnight.Blood;local z={}local A;local B;local C;local D;local E;local F=d.GhoulTable;local G;local H;local I=0;local J=999999;local K=0;local L=g:CovenantID()d:RegisterForEvent(function()L=g:CovenantID()end,"COVENANT_CHOSEN")local M=l.Commons.Everyone;local N={General=l.GUISettings.General,Commons=l.GUISettings.APL.DeathKnight.Commons,Blood=l.GUISettings.APL.DeathKnight.Blood}local O={{x.Asphyxiate,"Cast Asphyxiate (Interrupt)",function()return true end}}local P=0;local Q=0;d:RegisterForEvent(function()equip=g:GetEquipment()trinket1=k(0)trinket2=k(0)if equip[13]then trinket1=k(equip[13])end;if equip[14]then trinket2=k(equip[14])end;SuperstrainEquipped=g:HasLegendaryEquipped(30)PhearomonesEquipped=g:HasLegendaryEquipped(31)DeadliestCoilEquipped=g:HasLegendaryEquipped(45)end,"PLAYER_EQUIPMENT_CHANGED")local R={5,8,10,30,40,100}local S={}local function T()for _,U in ipairs(R)do if U==8 or 5 then S[U]=h:IsInMeleeRange(U)end;S[U]=h:IsInRange(U)end end;local function V(W)if W then return 1 else return 0 end end;local function X(W)return W~=0 end;local function Y(Z)local a0=0;for _,a1 in pairs(Z)do if not a1:DebuffUp(x.BloodPlagueDebuff)then a0=a0+1 end end;return a0 end;local function a2()if M.TargetIsValid()then if x.Fleshcraft:IsCastable()and p then if m(x.Fleshcraft,nil,nil)then P=324631;return"fleshcraft precombat 1"end end;if x.DeathsCaress:IsReady()and not h:IsInMeleeRange(5)then if m(x.DeathsCaress,nil,nil,not h:IsSpellInRange(x.DeathsCaress))then P=195292;return"deaths_caress precombat 2"end end;if x.Marrowrend:IsReady()and h:IsInMeleeRange(5)then if m(x.Marrowrend)then P=195182;return"marrowrend precombat 4"end end;if x.BloodBoil:IsCastable()and h:IsInMeleeRange(10)then if m(x.BloodBoil)then P=50842;return"blood_boil precombat 6"end end end end;local function a3()if x.AntiMagicShell:IsReady()and I>0 and g:HealthPercentage()<=N.Commons.AntiMagicShellHP then if m(x.AntiMagicShell,nil,nil)then P=48707;return"AntiMagic Shell defensives 18"end end;if x.RuneTap:IsReady()and B and g:HealthPercentage()<=N.Blood.RuneTapThreshold and g:Rune()>=3 and x.RuneTap:Charges()>=1 and g:BuffDown(x.RuneTapBuff)then if m(x.RuneTap,nil)then P=194679;return"rune_tap defensives 2"end end;if M.ActiveMitigationNeeded()and x.Marrowrend:TimeSinceLastCast()>2.5 and x.DeathStrike:TimeSinceLastCast()>2.5 then if x.DeathStrike:IsReady()and not H and g:BuffStack(x.BoneShieldBuff)>7 then if m(x.DeathStrike,nil,nil,not h:IsSpellInRange(x.DeathStrike))then P=49998;return"death_strike defensives 4"end end;if x.Marrowrend:IsReady()then if m(x.Marrowrend,nil,nil,not h:IsSpellInRange(x.Marrowrend))then P=195182;return"marrowrend defensives 6"end end;if x.Tombstone:IsReady()and g:BuffStack(x.BoneShieldBuff)>=7 then if m(x.Tombstone,nil)then P=219808;return"tombstone defensives 8"end end;if x.DeathStrike:IsReady()and not H then if m(x.DeathStrike,nil,nil,not h:IsSpellInRange(x.DeathStrike))then P=49998;return"death_strike defensives 10"end end end;if x.Marrowrend:IsReady()and(g:BuffRemains(x.BoneShieldBuff)<=6 or h:TimeToDie()<5 and g:BuffRemains(x.BoneShieldBuff)<10 and D==1)then if m(x.Marrowrend,nil,nil,not h:IsSpellInRange(x.Marrowrend))then P=195182;return"marrowrend defensives 12"end end;if x.VampiricBlood:IsCastable()and B and g:HealthPercentage()<=N.Blood.VampiricBloodThreshold and g:BuffDown(x.IceboundFortitudeBuff)then if m(x.VampiricBlood,nil)then P=55233;return"vampiric_blood defensives 14"end end;if x.Lichborne:IsReady()and g:HealthPercentage()<=N.Commons.LichborneHP then if m(x.Lichborne,nil,nil)then P=49039;return"Lichborne defensives 18"end end;if x.DeathPact:IsAvailable()and x.DeathPact:IsReady()and g:HealthPercentage()<=N.Commons.DeathPactHP then if m(x.DeathPact,nil,nil)then P=48743;return"DeathPact defensives 18"end end;if x.IceboundFortitude:IsCastable()and B and g:HealthPercentage()<=N.Blood.IceboundFortitudeThreshold and g:BuffDown(x.VampiricBloodBuff)then if m(x.IceboundFortitude,nil)then P=48792;return"icebound_fortitude defensives 16"end end;if x.DeathStrike:IsReady()and not H and g:HealthPercentage()<=50+(g:RunicPower()>90 and 20 or 0)and not g:HealingAbsorbed()then if m(x.DeathStrike,nil,nil,not h:IsSpellInRange(x.DeathStrike))then P=49998;return"death_strike defensives 18"end end end;local function a4()if x.BloodTap:IsCastable()and(g:Rune()<=2 and g:RuneTimeToX(4)>g:GCD()and x.BloodTap:ChargesFractional()>=1.8)then if m(x.BloodTap)then P=221699;return"blood_tap standard 2"end end;if x.DancingRuneWeapon:IsCastable()and n()and(not x.Blooddrinker:IsAvailable()or not x.Blooddrinker:CooldownUp())then if m(x.DancingRuneWeapon,nil)then P=49028;return"dancing_rune_weapon standard 4"end end;if x.Marrowrend:IsReady()and((L~=4 or g:BuffUp(x.AbominationLimbBuff))and(g:BuffRemains(x.BoneShieldBuff)<=g:RuneTimeToX(3)or g:BuffRemains(x.BoneShieldBuff)<=g:GCD()+V(x.Blooddrinker:CooldownUp())*V(x.Blooddrinker:IsAvailable())*2 or g:BuffStack(x.BoneShieldBuff)<3)and g:RunicPowerDeficit()>=20)then if m(x.Marrowrend,nil,nil,not h:IsSpellInRange(x.Marrowrend))then P=195182;return"marrowrend standard 8"end end;if x.DeathStrike:IsReady()and not H and not G and g:RunicPowerDeficit()<=70 then if m(x.DeathStrike,nil,nil,not h:IsSpellInRange(x.DeathStrike))then P=49998;return"death_strike standard 10"end end;if x.Marrowrend:IsReady()and(g:BuffStack(x.BoneShieldBuff)<6 and g:RunicPowerDeficit()>=15 and(L~=3 or g:BuffRemains(x.DeathsDueBuff)>5))then if m(x.Marrowrend,nil,nil,not h:IsSpellInRange(x.Marrowrend))then P=195182;return"marrowrend standard 12"end end;if x.HeartStrike:IsReady()and(not x.Blooddrinker:IsAvailable()and g:BuffRemains(x.DeathAndDecayBuff)<5 and g:RunicPowerDeficit()<=15+V(g:BuffUp(x.DancingRuneWeaponBuff))*5+D*V(x.Heartbreaker:IsAvailable())*2)then if m(x.HeartStrike,nil,nil,not h:IsSpellInRange(x.HeartStrike))then P=206930;return"heart_strike standard 14"end end;if x.BloodBoil:IsCastable()and(x.BloodBoil:ChargesFractional()>=1.8 and(g:BuffStack(x.HemostasisBuff)<=5-EnemiesCount10y or EnemiesCount10y>2))then if m(x.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then P=50842;return"blood_boil standard 16"end end;if x.DeathAndDecay:IsReady()and(g:BuffUp(x.CrimsonScourgeBuff)and x.RelishinBlood:IsAvailable()and g:RunicPowerDeficit()>10)then if m(x.DeathAndDecay,nil,nil,not h:IsInRange(30))then P=43265;return"death_and_decay standard 18"end end;if x.Bonestorm:IsReady()and not H and(g:RunicPower()>=N.Blood.BonestormPower and g:BuffDown(x.DancingRuneWeaponBuff))then if m(x.Bonestorm,nil,nil,not h:IsInRange(8))then P=194844;return"bonestorm standard 20"end end;if x.DeathStrike:IsReady()and not H and not G and(g:RunicPowerDeficit()<=15+V(g:BuffUp(x.DancingRuneWeaponBuff))*5+D*V(x.Heartbreaker:IsAvailable())*2 or h:TimeToDie()<10)then if m(x.DeathStrike,nil,nil,not h:IsSpellInRange(x.DeathStrike))then P=49998;return"death_strike standard 22"end end;if x.DeathAndDecay:IsReady()and D>=3 then if m(x.DeathAndDecay,nil,nil,not h:IsInRange(30))then P=43265;return"death_and_decay standard 24"end end;if x.HeartStrike:IsReady()and(g:BuffUp(x.DancingRuneWeaponBuff)or g:RuneTimeToX(4)<g:GCD())then if m(x.HeartStrike,nil,nil,not h:IsSpellInRange(x.HeartStrike))then P=206930;return"heart_strike standard 26"end end;if x.BloodBoil:IsCastable()and g:BuffUp(x.DancingRuneWeaponBuff)then if m(x.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then P=50842;return"blood_boil standard 28"end end;if x.BloodTap:IsCastable()and g:RuneTimeToX(3)>g:GCD()then if m(x.BloodTap)then P=221699;return"blood_tap standard 30"end end;if x.DeathAndDecay:IsReady()and(g:BuffUp(x.CrimsonScourgeBuff)or x.RapidDecomposition:IsAvailable()or D>=2)then if m(x.DeathAndDecay,nil,nil,not h:IsInRange(30))then P=43265;return"death_and_decay standard 32"end end;if x.Consumption:IsCastable()then if m(x.Consumption,nil,nil,not h:IsSpellInRange(x.Consumption))then P=274156;return"consumption standard 34"end end;if x.BloodBoil:IsCastable()and x.BloodBoil:ChargesFractional()>=1.1 then if m(x.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then P=50842;return"blood_boil standard 36"end end;if x.HeartStrike:IsReady()and(g:Rune()>1 and(g:RuneTimeToX(3)<g:GCD()or g:BuffStack(x.BoneShieldBuff)>7))then if m(x.HeartStrike,nil,nil,not h:IsSpellInRange(x.HeartStrike))then P=206930;return"heart_strike standard 38"end end;if x.ArcaneTorrent:IsCastable()and n()and g:RunicPowerDeficit()>20 then if m(x.ArcaneTorrent,nil,nil,not h:IsInMeleeRange(8))then P=155145;return"arcane_torrent standard 40"end end end;local function a5()if x.DeathStrike:IsReady()and not H and not G and(L==3 and g:BuffRemains(x.DeathsDueBuff)>6 and g:RunicPower()>70)then if m(x.DeathStrike,nil,nil,not h:IsSpellInRange(x.DeathStrike))then P=49998;return"death_strike covenants 2"end end;if x.HeartStrike:IsReady()and(L==3 and g:BuffUp(x.DeathAndDecayBuff)and((g:BuffUp(x.DeathsDueBuff)or g:BuffUp(x.DancingRuneWeaponBuff))and g:BuffRemains(x.DeathsDueBuff)))then if m(x.HeartStrike,nil,nil,not h:IsSpellInRange(x.HeartStrike))then P=206930;return"heart_strike covenants 4"end end;if x.DeathsDue:IsReady()and p and(g:BuffDown(x.DeathsDueBuff)or g:BuffRemains(x.DeathsDueBuff)<4 or g:BuffUp(x.CrimsonScourgeBuff))then if m(x.DeathsDue,nil,nil,not h:IsSpellInRange(x.DeathsDue))then P=324128;return"deaths_due covenants 6"end end;if F.active()and x.SacrificialPact:IsReady()and((L~=3 or g:BuffRemains(x.DeathsDueBuff)>6)and g:BuffDown(x.DancingRuneWeaponBuff)and(F.remains()<10 or d.FilteredFightRemains(Enemies10y,"<",g:GCD())))then if m(x.SacrificialPact,nil)then P=237574;return"sacrificial_pact covenants 8"end end;if x.DeathStrike:IsReady()and not H and not G and(L==2 and g:RunicPower()>70 and x.SwarmingMist:CooldownRemains()<3)then if m(x.DeathStrike,nil,nil,not h:IsSpellInRange(x.DeathStrike))then P=49998;return"death_strike covenants 10"end end;if x.SwarmingMist:IsReady()and p and g:BuffDown(x.DancingRuneWeaponBuff)then if m(x.SwarmingMist,nil,nil)then P=311648;return"swarming_mist covenants 12"end end;if x.Marrowrend:IsReady()and(L==4 and g:BuffDown(x.BoneShieldBuff))then if m(x.Marrowrend,nil,nil,not h:IsSpellInRange(x.Marrowrend))then P=195182;return"marrowrend covenants 14"end end;if x.AbominationLimb:IsCastable()and p and g:BuffDown(x.DancingRuneWeaponBuff)then if m(x.AbominationLimb,nil,nil,not h:IsInRange(8))then P=315443;return"abomination_limb covenants 16"end end;if x.ShackleTheUnworthy:IsCastable()and p and(x.DancingRuneWeapon:CooldownRemains()<3 or g:BuffDown(x.DancingRuneWeaponBuff))then if m(x.ShackleTheUnworthy,nil,nil,not h:IsSpellInRange(x.ShackleTheUnworthy))then P=312202;return"shackle_the_unworthy covenants 18"end end;if x.Fleshcraft:IsCastable()and p and(x.PustuleEruption:SoulbindEnabled()or x.VolatileSolvent:SoulbindEnabled())then if m(x.Fleshcraft,nil,nil)then P=324631;return"fleshcraft covenants 20"end end end;local function a6()r=HeroRotationCharDB.Toggles[6]p=HeroRotationCharDB.Toggles[4]q=HeroRotationCharDB.Toggles[5]s=HeroRotationCharDB.Toggles[12]t=HeroRotationCharDB.Toggles[13]u=HeroRotationCharDB.Toggles[14]v=HeroRotationCharDB.Toggles[15]w=HeroRotationCharDB.Toggles[16]G=false;H=false;if x.Bonestorm:IsAvailable()and n()and x.Bonestorm:CooldownRemains()<=0 and x.Bonestorm:IsCastable()then G=true end;if GetTime()-J>=5 then I=0 end end;local function a7(self,a8)local a9,aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,K,an,ao,ap,aq,ar,as,at,au,av=CombatLogGetCurrentEventInfo()if ag==UnitGUID("player")then if string.match(aa,"_DAMAGE")then if aa~="SWING_DAMAGE"and am~=1 then J=GetTime()I=K end end end end;local aw=CreateFrame("Frame")aw:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")aw:SetScript("OnEvent",a7)local function ax()Enemies10y=g:GetEnemiesInRange(10)if o()then C=g:GetEnemiesInMeleeRange(8)D=#C;EnemiesCount10y=#Enemies10y else D=1;EnemiesCount10y=1 end;E=Y(Enemies10y)TopTrinketID,_=GetInventoryItemID("player",13)BotTrinketID,_=GetInventoryItemID("player",14)ActiveMitigationNeeded=g:ActiveMitigationNeeded()B=g:IsTankingAoE(8)or g:IsTanking(h)if not BotOn then Q=0;P=0 end;if Q>0 then Q=0 end;if P>0 then P=0 end;A=a6()if l.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then starttime=GetTime()endtime=starttime+l.GUISettings.General.OpenerReset elseif l.GUISettings.General.OpenerReset>0 and endtime~=nil and GetTime()>endtime and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]l.ToggleIconFrame:UpdateButtonText(6)l.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if g:IsChanneling(j(324631))then if l.CastAnnotated(x.Pool,false,"WAIT")then P=99999;return"Pool During Blooddrinker"end end;if not g:AffectingCombat()and M.TargetIsValid()and r then local A=a2()if A then return A end end;if not UnitIsEnemy("player","mouseover")and UnitIsDead("mouseover")then if x.RaiseAlly:IsCastable()and g:RunicPower()>=30 then if m(x.RaiseAlly,nil)then Q=161999;return"RaiseAlly MO"end elseif x.RaiseAlly:CooldownRemains(BypassRecovery)<=0 and g:RunicPower()<30 then H=true end end;if M.TargetIsValid()and g:AffectingCombat()then if N.Commons.UseDefensives then local A=a3()if A then return A end end;if g:IsChanneling(x.Blooddrinker)and g:BuffUp(x.BoneShieldBuff)and E==0 and not g:ShouldStopCasting()and g:CastRemains()>0.2 then if l.CastAnnotated(x.Pool,false,"WAIT")then P=99999;return"Pool During Blooddrinker"end end;if n()then if x.BloodFury:IsCastable()and(x.DancingRuneWeapon:CooldownUp()and(not x.Blooddrinker:IsReady()or not x.Blooddrinker:IsAvailable()))then if m(x.BloodFury,nil)then P=20572;return"blood_fury main 2"end end;if x.Berserking:IsCastable()then if m(x.Berserking,nil)then P=26297;return"berserking main 4"end end;if x.ArcanePulse:IsCastable()and(D>=2 or g:Rune()<1 and g:RunicPowerDeficit()>60)then if m(x.ArcanePulse,nil,nil,not h:IsInRange(8))then P=260364;return"arcane_pulse main 6"end end;if x.LightsJudgment:IsCastable()and g:BuffUp(x.UnholyStrengthBuff)then if m(x.LightsJudgment,nil,nil,not h:IsSpellInRange(x.LightsJudgment))then P=255647;return"lights_judgment main 8"end end;if x.AncestralCall:IsCastable()then if m(x.AncestralCall,nil)then P=274738;return"ancestral_call main 10"end end;if x.Fireblood:IsCastable()then if m(x.Fireblood,nil)then P=265221;return"fireblood main 12"end end;if x.BagofTricks:IsCastable()then if m(x.BagofTricks,nil,nil,not h:IsSpellInRange(x.BagofTricks))then P=312411;return"bag_of_tricks main 14"end end end;if y.PotionofPhantomFire:IsReady()and N.Commons.Enabled.Potions and g:BuffUp(x.DancingRuneWeaponBuff)then if m(y.PotionofPhantomFire,nil,nil)then P=37;return"potion main 16"end end;if N.Commons.Enabled.Trinkets and n()then local ay=g:GetUseableTrinkets(z)if ay then if m(ay,nil,nil)then if ay:ID()==TopTrinketID then P=24;return"top trinket 1"elseif ay:ID()==BotTrinketID then P=30;return"top trinket 2"end end end end;if x.Blooddrinker:IsReady()and(g:BuffDown(x.DancingRuneWeaponBuff)and(L~=3 or g:BuffRemains(x.DeathsDueBuff)>7))then if m(x.Blooddrinker,nil,nil,not h:IsSpellInRange(x.Blooddrinker))then P=206931;return"blooddrinker main 20"end end;if x.BloodBoil:IsCastable()and(x.BloodBoil:Charges()>=2 and(L==1 or g:BuffUp(x.DancingRuneWeaponBuff)))then if m(x.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then P=50842;return"blood_boil main 22"end end;if n()and x.RaiseDead:IsCastable()then if m(x.RaiseDead,nil,nil)then P=46585;return"raise_dead main 24"end end;if x.DeathStrike:IsReady()and not G and not H and d.FilteredFightRemains(Enemies10y,"<",3)then if m(x.DeathStrike,nil,nil,not h:IsSpellInRange(x.DeathStrike))then P=49998;return"death_strike main 26"end end;if true then local A=a5()if A then return A end end;if true then local A=a4()if A then return A end end;if l.CastAnnotated(x.Pool,false,"WAIT")then return"Wait/Pool Resources"end end end;local function az()end;function ReturnSpell1()if P==0 then return 0 else return P end end;function ReturnSpellMO1()if Q==0 then return 0 else return Q end end;l.SetAPL(250,ax,az)