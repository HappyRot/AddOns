local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=HeroRotation;local m=l.Cast;local n=l.CDsON;local o=l.AoEON;local p=HeroRotationCharDB.Toggles[4]local q=HeroRotationCharDB.Toggles[5]local r=HeroRotationCharDB.Toggles[12]local s=HeroRotationCharDB.Toggles[13]local t=HeroRotationCharDB.Toggles[14]local u=not HeroRotationCharDB.Toggles[15]local v=HeroRotationCharDB.Toggles[16]local w=HeroRotationCharDB.Toggles[80]local x=HeroRotationCharDB.Toggles[81]local y=HeroRotationCharDB.Toggles[82]local z=HeroRotationCharDB.Toggles[84]local A=HeroRotationCharDB.Toggles[17]local B=HeroRotationCharDB.Toggles[85]local C=HeroRotationCharDB.Toggles[18]local D=HeroRotationCharDB.Toggles[83]local E=not HeroRotationCharDB.Toggles[183]local F=HeroRotationCharDB.Toggles[72]local G;local H=false;local I=0;local J=math.min;local K=j.DeathKnight.Blood;local L=k.DeathKnight.Blood;local M={}local N;local O;local P;local Q;local R;local S;local T;local U;local V;local W=d.GhoulTable;local X;local Y;local Z=2;local a0=999999;local a1=2;local a2=l.Commons.Everyone;local a3={General=l.GUISettings.General,Commons=l.GUISettings.APL.DeathKnight.Commons,Blood=l.GUISettings.APL.DeathKnight.Blood}local a4={{K.Asphyxiate,"Cast Asphyxiate (Interrupt)",function()return true end}}local a5=0;local a6=0;local a7=g:HasLegendaryEquipped(30)local a8=g:HasLegendaryEquipped(31)local a9=g:HasLegendaryEquipped(45)local aa=g:HasLegendaryEquipped(35)d:RegisterForEvent(function()equip=g:GetEquipment()trinket1=k(0)trinket2=k(0)if equip[13]then trinket1=k(equip[13])end;if equip[14]then trinket2=k(equip[14])end;a7=g:HasLegendaryEquipped(30)a8=g:HasLegendaryEquipped(31)a9=g:HasLegendaryEquipped(45)aa=g:HasLegendaryEquipped(35)end,"PLAYER_EQUIPMENT_CHANGED")local ab={5,8,10,30,40,100}local ac={}local function ad()for _,ae in ipairs(ab)do if ae==8 or 5 then ac[ae]=h:IsInMeleeRange(ae)end;ac[ae]=h:IsInRange(ae)end end;local function af(ag)if ag then return 1 else return 0 end end;local function ah(ag)return ag~=0 end;local function ai(aj)local ak=0;if aj~=nil then for _,al in pairs(aj)do if not g:IsTanking(al)and al:GUID()~=h:GUID()and al:AffectingCombat()then ak=ak+1 end end end;return ak end;local function am(aj)local an=0;if aj~=nil then for _,al in pairs(aj)do if not al:DebuffUp(K.BloodPlagueDebuff)then an=an+1 end end end;return an end;local function ao(ap)return ap:DebuffRemains(K.SoulReaperDebuff)end;local function aq(ap)if not g:IsTanking(ap)and F and ap:AffectingCombat()and ap:GUID()==f("mouseover"):GUID()and ap:NPCID()~=118044 and ap:IsInMeleeRange(30)then a6=156222;return true elseif not g:IsTanking(ap)and F and ap:AffectingCombat()and ap:GUID()==h:GUID()and ap:NPCID()~=118044 and ap:IsInMeleeRange(30)then a5=56222;return true elseif not g:IsTanking(ap)and F and ap:AffectingCombat()and ap:NPCID()~=118044 and ap:IsInMeleeRange(30)then return true end end;local function ar(ap)if ap:TimeToX(35)<35 and ap:TimeToDie()>ap:DebuffRemains(K.SoulReaperDebuff)+5 and ap:AffectingCombat()and ap:GUID()==f("mouseover"):GUID()and ap:NPCID()~=118044 and ap:IsInMeleeRange(30)then a6=1343294;return true elseif ap:TimeToX(35)<35 and ap:TimeToDie()>ap:DebuffRemains(K.SoulReaperDebuff)+5 and ap:AffectingCombat()and ap:GUID()==h:GUID()and ap:NPCID()~=118044 and ap:IsInMeleeRange(30)then a5=343294;return true elseif ap:TimeToX(35)<35 and ap:TimeToDie()>ap:DebuffRemains(K.SoulReaperDebuff)+5 and ap:AffectingCombat()and ap:NPCID()~=118044 and ap:IsInMeleeRange(30)then return true end end;local function as()if a2.TargetIsValid()then if K.Marrowrend:IsReady()and G then if m(K.Marrowrend)then a5=195182;return"marrowrend precombat 4"end end;if K.BloodBoil:IsCastable()and G then if m(K.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then a5=50842;return"blood_boil precombat 6"end end end end;local function at()if K.DeathStrike:IsReady()and a3.Commons.UseDefensives and G and not Y and g:HealthPercentage()<a3.Commons.UseDeathStrikeHP then if m(K.DeathStrike,nil,nil,not h:IsSpellInRange(K.DeathStrike))then a5=49998;return"death_strike defensives 4"end end;if g:HealthPercentage()<a3.Commons.PhialHP and a3.Commons.UseDefensives and L.PhialofSerenity:IsReady()and L.PhialofSerenity:CooldownRemains()<=0 and g:BuffDown(K.ShroudofPurgatory)then if l.Cast(L.PhialofSerenity,nil)then a5=55;return"PhialofSerenity HP"end end;if g:HealthPercentage()<a3.Commons.HealthstoneHP and a3.Commons.UseDefensives and L.Healthstone:IsReady()and L.Healthstone:CooldownRemains()<=0 and g:BuffDown(K.ShroudofPurgatory)then if l.Cast(L.Healthstone,nil)then a5=40;return"Healthstone HP"end end;if g:HealthPercentage()<a3.Commons.HealPotHP and a3.Commons.UseDefensives and L.CosmicHealPot:IsReady()and L.CosmicHealPot:CooldownRemains()<=0 and g:BuffDown(K.ShroudofPurgatory)then if l.Cast(L.CosmicHealPot,nil)then a5=45;return"CosmicHealPot HP"end end;if g:HealthPercentage()<a3.Commons.HealPotHP and a3.Commons.UseDefensives and L.HealPot:IsReady()and L.HealPot:CooldownRemains()<=0 and g:BuffDown(K.ShroudofPurgatory)then if l.Cast(L.HealPot,nil)then a5=41;return"HealPot HP"end end;if K.AntiMagicShell:IsReady()and a3.Commons.UseDefensives and g:HealthPercentage()<=a3.Commons.AntiMagicShellHP and E then if m(K.AntiMagicShell,nil,nil)then a5=48707;return"AntiMagic Shell defensives 18"end end;if K.RuneTap:IsReady()and a3.Commons.UseDefensives and R and g:HealthPercentage()<=a3.Blood.RuneTapThreshold and g:Rune()>=3 and K.RuneTap:Charges()>=1 and g:BuffDown(K.RuneTapBuff)then if m(K.RuneTap,nil)then a5=194679;return"rune_tap defensives 2"end end;if a2.ActiveMitigationNeeded()and G and K.Marrowrend:TimeSinceLastCast()>0.5 and K.DeathStrike:TimeSinceLastCast()>0.5 then if K.DeathStrike:IsReady()and a3.Commons.UseDefensives and not Y and g:BuffStack(K.BoneShieldBuff)>7 then if m(K.DeathStrike,nil,nil,not h:IsSpellInRange(K.DeathStrike))then a5=49998;return"death_strike defensives 4"end end;if K.Marrowrend:IsReady()and G and g:BuffStack(K.BoneShieldBuff)>=8 then if m(K.Marrowrend,nil,nil,not h:IsSpellInRange(K.Marrowrend))then a5=195182;return"marrowrend defensives 6"end end;if K.DeathStrike:IsReady()and a3.Commons.UseDefensives and G and not Y then if m(K.DeathStrike,nil,nil,not h:IsSpellInRange(K.DeathStrike))then a5=49998;return"death_strike defensives 10"end end end;if K.Marrowrend:IsReady()and G and(g:BuffRemains(K.BoneShieldBuff)<=6 or h:TimeToDie()<5 and g:BuffRemains(K.BoneShieldBuff)<10 and T==1)then if m(K.Marrowrend,nil,nil,not h:IsSpellInRange(K.Marrowrend))then a5=195182;return"marrowrend defensives 12"end end;if K.VampiricBlood:IsCastable()and a3.Commons.UseDefensives and R and g:HealthPercentage()<=a3.Blood.VampiricBloodThreshold and g:BuffDown(K.IceboundFortitudeBuff)then if m(K.VampiricBlood,nil)then a5=55233;return"vampiric_blood defensives 14"end end;if K.Lichborne:IsReady()and a3.Commons.UseDefensives and g:HealthPercentage()<=a3.Commons.LichborneHP then if m(K.Lichborne,nil,nil)then a5=49039;return"Lichborne defensives 18"end end;if K.DeathPact:IsAvailable()and a3.Commons.UseDefensives and K.DeathPact:IsReady()and g:HealthPercentage()<=a3.Commons.DeathPactHP then if m(K.DeathPact,nil,nil)then a5=48743;return"DeathPact defensives 18"end end;if K.IceboundFortitude:IsCastable()and a3.Commons.UseDefensives and R and g:HealthPercentage()<=a3.Blood.IceboundFortitudeThreshold and g:BuffDown(K.VampiricBloodBuff)then if m(K.IceboundFortitude,nil)then a5=48792;return"icebound_fortitude defensives 16"end end;if K.DeathStrike:IsReady()and a3.Commons.UseDefensives and G and not Y and g:HealthPercentage()<=50+(g:RunicPower()>90 and 20 or 0)and not g:HealingAbsorbed()then if m(K.DeathStrike,nil,nil,not h:IsSpellInRange(K.DeathStrike))then a5=49998;return"death_strike defensives 18"end end end;local function au()if K.BloodFury:IsCastable()and G and a3.Commons.Enabled.Racials and n()and((K.DancingRuneWeapon:CooldownUp()or y)and(not K.Blooddrinker:IsReady()or not K.Blooddrinker:IsAvailable()))then if m(K.BloodFury,nil)then a5=20572;return"blood_fury main 2"end end;if K.Berserking:IsCastable()and G and a3.Commons.Enabled.Racials and n()then if m(K.Berserking,nil)then a5=26297;return"berserking main 4"end end;if K.ArcanePulse:IsCastable()and G and a3.Commons.Enabled.Racials and n()and(T>=2 or g:Rune()<1 and g:RunicPowerDeficit()>60)then if m(K.ArcanePulse,nil,nil,not h:IsInRange(10))then a5=260364;return"arcane_pulse main 6"end end;if K.LightsJudgment:IsCastable()and G and a3.Commons.Enabled.Racials and n()and g:BuffUp(K.UnholyStrengthBuff)then if m(K.LightsJudgment,nil,nil,not h:IsSpellInRange(K.LightsJudgment))then a5=255647;return"lights_judgment main 8"end end;if K.AncestralCall:IsCastable()and G and a3.Commons.Enabled.Racials and n()then if m(K.AncestralCall,nil)then a5=274738;return"ancestral_call main 10"end end;if K.Fireblood:IsCastable()and G and a3.Commons.Enabled.Racials and n()then if m(K.Fireblood,nil)then a5=265221;return"fireblood main 12"end end;if K.BagofTricks:IsCastable()and G and a3.Commons.Enabled.Racials and n()then if m(K.BagofTricks,nil,nil,not h:IsSpellInRange(K.BagofTricks))then a5=312411;return"bag_of_tricks main 14"end end;if K.ArcaneTorrent:IsCastable()and G and a3.Commons.Enabled.Racials and n()and g:RunicPowerDeficit()>20 then if m(K.ArcaneTorrent,nil,nil,nil)then a5=155145;return"ArcaneTorrent main 14"end end end;local function av()if K.Tombstone:IsReady()and p and G and(g:BuffStack(K.BoneShieldBuff)>5 and g:Rune()>=2 and g:RunicPowerDeficit()>=30 and(K.ShatteringBone:IsAvailable()and g:BuffUp(K.DeathAndDecayBuff)or not K.ShatteringBone:IsAvailable()))then if m(K.Tombstone,nil)then a5=219808;return"tombstone drw_up 2"end end;if K.EmpowerRuneWeapon:IsReady()and n()and(g:Rune()<6 and g:RunicPowerDeficit()>5)then if m(K.EmpowerRuneWeapon,nil,nil,not h:IsInRange(10))then a5=47568;return"EmpowerRuneWeapon drw_up 11"end end;if K.AbominationLimb:IsCastable()and G and n()and not C and not a3.Blood.UseAbomLimbDefensive then if m(K.AbominationLimb,nil,nil,not h:IsInRange(10))then a5=315443;return"abomination_limb standard 16"end end;if K.Marrowrend:IsReady()and G and(g:BuffStack(K.BoneShieldBuff)<5 and g:BuffRemains(K.DancingRuneWeaponBuff)<g:GCD())then if m(K.Marrowrend,nil,nil,not h:IsSpellInRange(K.Marrowrend))then a5=195182;return"marrowrend drw_up 2"end end;if K.Marrowrend:IsReady()and G and((g:BuffRemains(K.BoneShieldBuff)<=g:RuneTimeToX(3)or g:BuffStack(K.BoneShieldBuff)<2 and g:BuffUp(K.AbominationLimbBuff))and g:RunicPowerDeficit()>20)then if m(K.Marrowrend,nil,nil,not G)then return"marrowrend drw_up 6"end end;if K.DeathsCaress:IsReady()and not G and(g:BuffRemains(K.BoneShieldBuff)<=g:RuneTimeToX(3)and g:Rune()<=1)then if m(K.DeathsCaress,nil,nil,not h:IsSpellInRange(K.DeathsCaress))then a5=195292;return"deaths_caress drw_up 2"end end;if K.DeathStrike:IsReady()and G and g:RunicPower()>=a3.Blood.MinimumRP+45 and not Y and not X and(g:BuffRemains(K.CoagulopathyBuff)<=g:GCD()or g:BuffRemains(K.IcyTalonsBuff)<=g:GCD())then if m(K.DeathStrike,nil,nil,not h:IsSpellInRange(K.DeathStrike))then a5=49998;return"death_strike drw_up 6"end end;if K.SoulReaper:IsReady()and(T==1 and h:TimeToX(35)<5 and h:TimeToDie()>h:DebuffRemains(K.SoulReaperDebuff)+5)then if m(K.SoulReaper,nil,nil,not G)then a5=343294;return"soul_reaper drw_up 12"end end;if K.SoulReaper:IsReady()and T>=2 then if a2.CastTargetIf(K.SoulReaper,S,"min",ao,ar,not G)then return"soul_reaper drw_up 14"end end;if K.DeathAndDecay:IsCastable()and G and not D and not g:IsMoving()and(g:BuffDown(K.DeathAndDecayBuff)and(K.SanguineGround:IsAvailable()or K.UnholyGround:IsAvailable()))then if m(K.DeathAndDecay,nil,nil,not h:IsInRange(30))then a5=43265;return"death_and_decay drw_up 14"end end;if K.BloodBoil:IsCastable()and(T>2 and K.BloodBoil:ChargesFractional()>=1.1)then if m(K.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then a5=50842;return"blood_boil drw_up 4"end end;Q=25+U*af(K.Heartbreaker:IsAvailable())*2;if K.DeathStrike:IsReady()and G and g:RunicPower()>=a3.Blood.MinimumRP+45 and not Y and not X and g:RunicPowerDeficit()<=Q then if m(K.DeathStrike,nil,nil,not h:IsSpellInRange(K.DeathStrike))then a5=49998;return"death_strike drw_up 6"end end;if K.Consumption:IsCastable()and G then if m(K.Consumption,nil,nil,not h:IsSpellInRange(K.Consumption))then a5=274156;return"consumption standard 24"end end;if K.DeathAndDecay:IsCastable()and G and not D and not g:IsMoving()and(g:BuffDown(K.DeathAndDecayBuff)and(T==3 and g:BuffUp(K.CrimsonScourgeBuff)or T>=4))then if m(K.DeathAndDecay,nil,nil,not h:IsInRange(30))then a5=43265;return"death_and_decay drw_up 18"end end;if K.BloodBoil:IsReady()and(K.BloodBoil:ChargesFractional()>=1.1 and g:BuffStack(K.HemostasisBuff)<5)then if m(K.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then a5=50842;return"blood_boil drw_up 24"end end;if K.HeartStrike:IsReady()and G and(g:RuneTimeToX(2)<g:GCD()or g:RunicPowerDeficit()>=Q)then if m(K.HeartStrike,nil,nil,not h:IsSpellInRange(K.HeartStrike))then a5=206930;return"heart_strike drw_up 18"end end end;local function aw()if K.Tombstone:IsCastable()and p and(g:BuffStack(K.BoneShieldBuff)>5 and g:Rune()>=2 and g:RunicPowerDeficit()>=30 and(K.ShatteringBone:IsAvailable()and g:BuffUp(K.DeathAndDecayBuff)or not K.ShatteringBone:IsAvailable()))then if m(K.Tombstone,nil)then a5=219808;return"tombstone standard 1"end end;if K.AbominationLimb:IsCastable()and G and n()and not C and(a3.Blood.UseAbomLimbDefensive and g:BuffStack(K.BoneShieldBuff)<6 or not a3.Blood.UseAbomLimbDefensive)then if m(K.AbominationLimb,nil,nil,not h:IsInRange(10))then a5=315443;return"abomination_limb standard 16"end end;if K.Marrowrend:IsReady()and G and(g:BuffRemains(K.BoneShieldBuff)<=g:RuneTimeToX(3)or g:BuffRemains(K.BoneShieldBuff)<=g:GCD()+af(K.Blooddrinker:CooldownUp())*af(K.Blooddrinker:IsAvailable())*4 or g:BuffStack(K.BoneShieldBuff)<6 and g:RunicPowerDeficit()>20 and not(K.InsatiableBlade:IsAvailable()and K.DancingRuneWeapon:CooldownRemains()<g:BuffRemains(K.BoneShieldBuff)))then if m(K.Marrowrend,nil,nil,not h:IsSpellInRange(K.Marrowrend))then a5=195182;return"marrowrend standard 6"end end;if K.DeathsCaress:IsReady()and not G and(g:BuffRemains(K.BoneShieldBuff)<=g:RuneTimeToX(3)and g:Rune()<=1)then if m(K.DeathsCaress,nil,nil,not h:IsSpellInRange(K.DeathsCaress))then a5=195292;return"deaths_caress standard 2"end end;if K.DeathStrike:IsReady()and G and g:RunicPower()>=a3.Blood.MinimumRP+45 and not Y and not X and(g:BuffRemains(K.CoagulopathyBuff)<=g:GCD()or g:BuffRemains(K.IcyTalonsBuff)<=g:GCD())then if m(K.DeathStrike,nil,nil,not h:IsSpellInRange(K.DeathStrike))then a5=49998;return"death_strike standard 8"end end;if K.DeathAndDecay:IsCastable()and G and not D and not g:IsMoving()and(g:BuffDown(K.DeathAndDecayBuff)and(K.SanguineGround:IsAvailable()or K.UnholyGround:IsAvailable()))then if m(K.DeathAndDecay,nil,nil,not h:IsInRange(30))then a5=43265;return"death_and_decay drw_up 14"end end;if K.Bonestorm:IsReady()and G and not Y and g:RunicPower()>=a3.Blood.BonestormPower and p then if m(K.Bonestorm,nil,nil,not h:IsInRange(10))then a5=194844;return"bonestorm standard 14"end end;if K.SoulReaper:IsReady()and(T==1 and h:TimeToX(35)<5 and h:TimeToDie()>h:DebuffRemains(K.SoulReaperDebuff)+5)then if m(K.SoulReaper,nil,nil,not G)then a5=343294;return"soul_reaper standard 12"end end;if K.SoulReaper:IsReady()and T>=2 then if a2.CastTargetIf(K.SoulReaper,S,"min",ao,ar,not G)then return"soul_reaper standard 14"end end;if K.DeathStrike:IsReady()and G and not Y and not X and g:RunicPower()>=a3.Blood.MinimumRP+45 and(g:RunicPowerDeficit()<=O and not(K.Bonestorm:IsAvailable()and K.Bonestorm:CooldownRemains()<2))then if m(K.DeathStrike,nil,nil,not h:IsSpellInRange(K.DeathStrike))then a5=49998;return"death_strike standard 16"end end;if K.BloodBoil:IsCastable()and(K.BloodBoil:ChargesFractional()>=1.8 and(g:BuffStack(K.HemostasisBuff)<=5-T or T>2))then if m(K.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then a5=50842;return"blood_boil standard 10"end end;if K.DeathAndDecay:IsReady()and G and not D and not g:IsMoving()and g:BuffDown(K.DeathAndDecayBuff)and(g:BuffUp(K.CrimsonScourgeBuff)and K.RelishinBlood:IsAvailable()and g:RunicPowerDeficit()>10)then if m(K.DeathAndDecay,nil,nil,not h:IsInRange(30))then a5=43265;return"death_and_decay standard 12"end end;P=15+T*af(K.Heartbreaker:IsAvailable())*2;if K.DeathStrike:IsReady()and G and g:RunicPower()>=a3.Blood.MinimumRP+45 and not Y and not X and(g:RunicPowerDeficit()<=P or h:TimeToDie()<10)then if m(K.DeathStrike,nil,nil,not h:IsSpellInRange(K.DeathStrike))then a5=49998;return"death_strike standard 28"end end;if K.DeathAndDecay:IsReady()and G and not D and not g:IsMoving()and g:BuffDown(K.DeathAndDecayBuff)and T>=3 then if m(K.DeathAndDecay,nil,nil,not h:IsInRange(30))then a5=43265;return"death_and_decay standard 18"end end;if K.HeartStrike:IsReady()and G and g:RuneTimeToX(4)<g:GCD()then if m(K.HeartStrike,nil,nil,not h:IsSpellInRange(K.HeartStrike))then a5=206930;return"heart_strike standard 2"end end;if K.Consumption:IsCastable()and G then if m(K.Consumption,nil,nil,not h:IsSpellInRange(K.Consumption))then a5=274156;return"consumption standard 24"end end;if K.DeathAndDecay:IsReady()and G and not D and not g:IsMoving()and g:BuffDown(K.DeathAndDecayBuff)and(g:BuffUp(K.CrimsonScourgeBuff)or K.RapidDecomposition:IsAvailable())then if m(K.DeathAndDecay,nil,nil,not h:IsInRange(30))then a5=43265;return"death_and_decay standard 22"end end;if K.BloodBoil:IsCastable()and K.BloodBoil:ChargesFractional()>=1.1 then if m(K.BloodBoil,nil,nil,not h:IsInMeleeRange(10))then a5=50842;return"blood_boil standard 26"end end;if K.HeartStrike:IsReady()and G and(g:Rune()>1 and(g:RuneTimeToX(3)<g:GCD()or g:BuffStack(K.BoneShieldBuff)>7))then if m(K.HeartStrike,nil,nil,not h:IsSpellInRange(K.HeartStrike))then a5=206930;return"heart_strike standard 20"end end end;local function ax()q=HeroRotationCharDB.Toggles[5]p=HeroRotationCharDB.Toggles[4]r=HeroRotationCharDB.Toggles[12]s=HeroRotationCharDB.Toggles[13]t=HeroRotationCharDB.Toggles[14]u=not HeroRotationCharDB.Toggles[15]v=HeroRotationCharDB.Toggles[16]w=HeroRotationCharDB.Toggles[80]x=HeroRotationCharDB.Toggles[81]y=HeroRotationCharDB.Toggles[82]F=HeroRotationCharDB.Toggles[72]D=HeroRotationCharDB.Toggles[83]z=HeroRotationCharDB.Toggles[84]A=HeroRotationCharDB.Toggles[17]B=HeroRotationCharDB.Toggles[85]C=HeroRotationCharDB.Toggles[18]E=not HeroRotationCharDB.Toggles[183]X=false;Y=false;if K.Bonestorm:IsAvailable()and n()and K.Bonestorm:CooldownRemains()<=0 and K.Bonestorm:IsCastable()then X=true end;I=0;for ae=1,20 do if select(10,UnitDebuff("player",ae))==240447 then if select(6,UnitDebuff("player",ae))~=nil then I=select(6,UnitDebuff("player",ae))-GetTime()end end end end;local function ay()G=h:IsSpellInRange(K.HeartStrike)S=g:GetEnemiesInMeleeRange(10)if o()then T=#S;Enemies40y=g:GetEnemiesInRange(40,K.DarkCommand)else T=1 end;V=am(S)U=J(T,g:BuffUp(K.DeathAndDecayBuff)and 5 or 2)R=g:IsTankingAoE(8)or g:IsTanking(h)TopTrinketID,_=GetInventoryItemID("player",13)BotTrinketID,_=GetInventoryItemID("player",14)ActiveMitigationNeeded=g:ActiveMitigationNeeded()MissingAggro=ai(S)if not BotOn then a6=0;a5=0 end;if a6>0 then a6=0 end;if a5>0 then a5=0 end;N=ax()if l.QueuedCast()then a5=l.QueuedCast()return"Custom Queue "..j(a5):ID()end;if l.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then starttime=GetTime()endtime=starttime+l.GUISettings.General.OpenerReset elseif l.GUISettings.General.OpenerReset>0 and endtime~=nil and GetTime()>endtime and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]l.ToggleIconFrame:UpdateButtonText(6)l.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if g:IsChanneling(j(324631))then if l.CastAnnotated(K.Pool,false,"WAIT")then a5=99999;return"Pool During Blooddrinker"end end;if not g:AffectingCombat()then H=false end;if not g:AffectingCombat()and a2.TargetIsValid()and q then local N=as()if N then return N end end;if not UnitIsEnemy("player","mouseover")and UnitIsPlayer("mouseover")and UnitIsDead("mouseover")and not B then if K.RaiseAlly:IsCastable()and g:RunicPower()>=30 then if m(K.RaiseAlly,nil)then a6=161999;return"RaiseAlly MO"end elseif K.RaiseAlly:CooldownRemains(BypassRecovery)<=0 and g:RunicPower()<30 then Y=true end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)and f("mouseover"):IsInMeleeRange(10)then if K.HeartStrike:IsCastable()then if m(K.HeartStrike,nil)then a6=1206930;return"explosive MO HeartStrike"end end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)and f("mouseover"):IsInMeleeRange(10)then if K.DeathStrike:IsCastable()then if m(K.DeathStrike,nil)then a6=149998;return"explosive MO DeathStrike"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)and G then if K.HeartStrike:IsCastable()then if m(K.HeartStrike,nil)then a5=206930;return"explosive  HeartStrike"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)and G then if K.DeathStrike:IsCastable()then if m(K.DeathStrike,nil)then a5=49998;return"explosive  DeathStrike"end end end;if a2.TargetIsValid()then if K.DarkCommand:IsReady()and g:AffectingCombat()and(not g:IsTanking(h)and F)then if m(K.DarkCommand,nil)then a5=56222;return"DarkCommand bear 3"end end;if K.DarkCommand:IsReady()then if a2.CastCycle(K.DarkCommand,Enemies40y,aq,not h:IsSpellInRange(K.DarkCommand))then return"DarkCommand 4"end end end;if v and K.Asphyxiate:IsUsableP()and K.Asphyxiate:CooldownRemains(BypassRecovery)<=0 then if l.Cast(K.Asphyxiate,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(K.Asphyxiate)then a6=1221562;return"queue Asphyxiate MO"else a5=221562;return"queue Asphyxiate"end end elseif(not K.Asphyxiate:IsUsableP()or K.Asphyxiate:CooldownRemains()>0)and v then HeroRotationCharDB.Toggles[16]=not HeroRotationCharDB.Toggles[16]l.Print("Asphyxiate Queue is now "..(HeroRotationCharDB.Toggles[16]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if z and K.BloodBoil:IsUsableP()and K.BloodBoil:CooldownRemains(BypassRecovery)<=0 and not g:PrevGCD(1,K.BloodBoil)then if l.Cast(K.BloodBoil,nil,nil,nil)then a5=50842;return"queue BloodBoil"end elseif(not K.BloodBoil:IsUsableP()or K.BloodBoil:CooldownRemains()>0 or g:PrevGCD(1,K.BloodBoil))and z then HeroRotationCharDB.Toggles[84]=not HeroRotationCharDB.Toggles[84]l.Print("Blood Boil Queue is now "..(HeroRotationCharDB.Toggles[84]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if t and K.DeathGrip:IsUsableP()and K.DeathGrip:CooldownRemains(BypassRecovery)<=0 then if l.Cast(K.DeathGrip,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(K.DeathGrip)then a6=149576;return"queue DeathGrip MO"else a5=49576;return"queue DeathGrip"end end elseif(not K.DeathGrip:IsUsableP()or K.DeathGrip:CooldownRemains()>0)and t then HeroRotationCharDB.Toggles[14]=not HeroRotationCharDB.Toggles[14]l.Print("DeathGrip Queue is now "..(HeroRotationCharDB.Toggles[14]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if w and K.GorefiendsGrasp:IsUsableP()and K.GorefiendsGrasp:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(K.GorefiendsGrasp,nil,nil,nil)then a5=108199;return"queue Gorefiends Grasp"end elseif(not K.GorefiendsGrasp:IsUsableP()or K.GorefiendsGrasp:CooldownRemains()>0 or not g:AffectingCombat())and w then HeroRotationCharDB.Toggles[80]=not HeroRotationCharDB.Toggles[80]l.Print("Gorefiend's Grasp Queue is now "..(HeroRotationCharDB.Toggles[80]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if s and K.AntiMagicZone:IsUsableP()and K.AntiMagicZone:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(K.AntiMagicZone,nil,nil,nil)then a5=51052;return"queue Anti Magic Zone"end elseif(not K.AntiMagicZone:IsUsableP()or K.AntiMagicZone:CooldownRemains()>0 or not g:AffectingCombat())and s then HeroRotationCharDB.Toggles[13]=not HeroRotationCharDB.Toggles[13]l.Print("Anti-Magic Zone Queue is now "..(HeroRotationCharDB.Toggles[13]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if x and K.ControlUndead:IsUsableP()and K.ControlUndead:CooldownRemains(BypassRecovery)<=0 and not g:PrevGCD(1,K.ControlUndead)then if l.Cast(K.ControlUndead,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsInRange(30)then a6=1111673;return"queue ControlUndead MO"else a5=111673;return"queue ControlUndead"end end elseif(not K.ControlUndead:IsUsableP()or K.ControlUndead:CooldownRemains()>0 or g:PrevGCD(1,K.ControlUndead))and x then HeroRotationCharDB.Toggles[81]=not HeroRotationCharDB.Toggles[81]l.Print("Control Undead Queue is now "..(HeroRotationCharDB.Toggles[81]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if a2.TargetIsValid()and g:AffectingCombat()then if true then local N=at()if N then return N end end;if g:IsChanneling(K.Blooddrinker)and g:BuffUp(K.BoneShieldBuff)and V==0 and not g:ShouldStopCasting()and g:CastRemains()>0.2 then if l.CastAnnotated(K.Pool,false,"WAIT")then a5=99999;return"Pool During Blooddrinker"end end;O=70;if a3.Commons.Enabled.Potions then local az=a2.PotionSelected()if az then if az:IsReady()and n()and u and(g:BloodlustUp()and l.GUISettings.General.HoldPotforBL or not l.GUISettings.General.HoldPotforBL and g:BuffUp(K.DancingRuneWeaponBuff))then if m(az,nil)then a5=50;return"potion cooldowns 2"end end end end;if a3.Commons.Enabled.TopTrinket or a3.Commons.Enabled.BottomTrinket then local aA=g:GetUseableTrinkets(M)if aA then if m(aA,nil,nil)then if aA:ID()==TopTrinketID and a3.Commons.Enabled.TopTrinket and(a3.Blood.TopTrinketHP<=0 and n()or a3.Blood.TopTrinketHP>g:HealthPercentage())then a5=24;return"top trinket 1"elseif aA:ID()==BotTrinketID and a3.Commons.Enabled.BottomTrinket and(a3.Blood.BotTrinketHP<=0 and n()or a3.Blood.BotTrinketHP>g:HealthPercentage())then a5=30;return"top trinket 2"end end end end;if L.GaveloftheFirstArbiter:IsEquippedAndReady()and h:IsInRange(30)and n()and not A then if m(L.GaveloftheFirstArbiter,nil,nil,not h:IsInRange(30))then a5=16;return"gavel_of_the_first_arbiter trinkets 4"end end;if K.BloodBoil:IsCastable()and G and not UnitExists("boss1")and MissingAggro>0 then if m(K.BloodBoil)then a5=50842;return"blood_boil for aggro 6"end end;if n()and not i:DebuffUp(j(111673))and K.RaiseDead:IsCastable()then if m(K.RaiseDead,nil,nil)then a5=46585;return"raise_dead main 24"end end;if K.DeathsCaress:IsReady()and not G and g:BuffDown(K.BoneShieldBuff)then if m(K.DeathsCaress,nil,nil,not h:IsSpellInRange(K.DeathsCaress))then a5=195292;return"deaths_caress drw_up 2"end end;if K.Blooddrinker:IsReady()and g:BuffDown(K.DancingRuneWeaponBuff)then if m(K.Blooddrinker,nil,nil,not h:IsSpellInRange(K.Blooddrinker))then a5=206931;return"blooddrinker main 20"end end;if true then local N=au()if N then return N end end;if K.SacrificialPact:IsReady()and K.RaiseDead:TimeSinceLastCast()<=60 and W.active()and(g:BuffDown(K.DancingRuneWeaponBuff)and(W.remains()<2 or h:TimeToDie()<g:GCD()))then if m(K.SacrificialPact,nil)then a5=237574;return"sacrificial_pact covenants 8"end end;if K.BloodTap:IsCastable()and(g:Rune()<=2 and g:RuneTimeToX(4)>g:GCD()and K.BloodTap:ChargesFractional()>=1.8 or g:RuneTimeToX(3)>g:GCD())then if m(K.BloodTap)then a5=221699;return"blood_tap main 12"end end;if K.Marrowrend:IsReady()and G and g:BuffRemains(K.BoneShieldBuff)<g:GCD()+0.5 then if m(K.Marrowrend)then a5=195182;return"marrowrend main 14"end end;if K.DeathsCaress:IsReady()and not G and(g:BuffRemains(K.BoneShieldBuff)<g:GCD()+0.5 or g:BuffDown(K.BoneShieldBuff))then if m(K.DeathsCaress,nil,nil,not h:IsSpellInRange(K.DeathsCaress))then a5=195292;return"deaths_caress main 16"end end;if K.DancingRuneWeapon:IsCastable()and G and not y and n()and g:BuffDown(K.DancingRuneWeaponBuff)then if m(K.DancingRuneWeapon,nil)then a5=49028;return"dancing_rune_weapon main 14"end end;if g:BuffUp(K.DancingRuneWeaponBuff)then local N=av()if N then return N end end;if true then local N=aw()if N then return N end end;if l.CastAnnotated(K.Pool,false,"WAIT")then return"Wait/Pool Resources"end end end;local function aB()if HeroRotationCharDB.Toggles[5]then HeroRotationCharDB.Toggles[5]=not HeroRotationCharDB.Toggles[5]l.ToggleIconFrame:UpdateButtonText(5)end end;function ReturnSpell1()if a5==0 then return 0 else return a5 end end;function ReturnSpellMO1()if a6==0 then return 0 else return a6 end end;l.SetAPL(250,ay,aB)