local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Boss;local j=f.Pet;local k=d.Spell;local l=d.Item;local m=HeroRotation;local n=m.Cast;local o=m.CDsON;local p=m.AoEON;local function q(r)if r then return 1 else return 0 end end;local function s(r)return r~=0 end;local t=table.insert;local GetTime=GetTime;local u=0;local v=0;local w=HeroRotationCharDB.Toggles[5]local x=k.DeathKnight.Unholy;local y=l.DeathKnight.Unholy;local z={}local A=g:GetEquipment()local B=A[13]and l(A[13])or l(0)local C=A[14]and l(A[14])or l(0)local D;local E;local F=m.Commons.Everyone;local G={General=m.GUISettings.General,Commons=m.GUISettings.APL.DeathKnight.Commons,Commons2=m.GUISettings.APL.DeathKnight.Commons2,Unholy=m.GUISettings.APL.DeathKnight.Unholy}local H;local I;local J;local K;local L;local M;local N;local O;local P;local Q,R;local S,T;local U,V;local W=x.ClawingShadows:IsAvailable()and x.ClawingShadows or x.ScourgeStrike;local X=x.Defile:IsAvailable()and x.Defile or x.DeathAndDecay;local Y;local Z=11111;local a0=11111;local a1=d.GhoulTable;local a2,a3;local a4,a5;local a6;local a7={{x.Asphyxiate,"Cast Asphyxiate (Interrupt)",function()return true end}}d:RegisterForEvent(function()A=g:GetEquipment()B=A[13]and l(A[13])or l(0)C=A[14]and l(A[14])or l(0)end,"PLAYER_EQUIPMENT_CHANGED")d:RegisterForEvent(function()Z=11111;a0=11111 end,"PLAYER_REGEN_ENABLED")d:RegisterForEvent(function()W=x.ClawingShadows:IsAvailable()and x.ClawingShadows or x.ScourgeStrike;X=x.Defile:IsAvailable()and x.Defile or x.DeathAndDecay end,"SPELLS_CHANGED","LEARNED_SPELL_IN_TAB")local function a8()if x.ClawingShadows:IsAvailable()then m.Print("CLAWINGSHADOWS")u=207311 else m.Print("anders")u=55090 end end;local function a9()return G.General.SoloMode and(g:HealthPercentage()<G.Commons.UseDeathStrikeHP or g:HealthPercentage()<G.Commons.UseDarkSuccorHP and g:BuffUp(x.DeathStrikeBuff))end;local function aa(ab)local ac=0;for _,ad in pairs(ab)do if ad:DebuffDown(x.VirulentPlagueDebuff)then ac=ac+1 end end;return ac end;local function ae(ab)local af={}for ag in pairs(ab)do if not f:IsInBossList(ab[ag]["UnitNPCID"])then t(af,ab[ag])end end;return d.FightRemains(af)end;local function ah(ai)return ai:DebuffStack(x.FesteringWoundDebuff)end;local function aj(ai)return ai:DebuffRemains(x.SoulReaper)end;local function ak(ai)return x.BurstingSores:IsAvailable()and ai:DebuffUp(x.FesteringWoundDebuff)and(g:BuffDown(x.DeathAndDecayBuff)and x.DeathAndDecay:CooldownDown()and g:Rune()<3 or g:BuffUp(x.DeathAndDecayBuff)and g:Rune()==0)or not x.BurstingSores:IsAvailable()and ai:DebuffStack(x.FesteringWoundDebuff)>=4 end;local function al(ai)return ai:DebuffStack(x.FesteringWoundDebuff)>=4 end;local function am(ai)return ai:DebuffStack(x.FesteringWoundDebuff)<4 end;local function an(ai)if ai:DebuffStack(x.FesteringWoundDebuff)<4 and ai:GUID()==f("mouseover"):GUID()and G.Unholy.TargetSwap=="Mouseover"then v=185948;return true elseif ai:DebuffStack(x.FesteringWoundDebuff)<4 and G.Unholy.TargetSwap=="AutoSwap"and ai:GUID()~=h:GUID()and not StopAutoSwap then v=999;return true elseif ai:DebuffStack(x.FesteringWoundDebuff)<4 and ai:GUID()==h:GUID()then u=85948;return true elseif ai:DebuffStack(x.FesteringWoundDebuff)<4 then return true end end;local function ao(ai)return(ai:TimeToX(35)<5 or ai:HealthPercentage()<=35)and ai:TimeToDie()>ai:DebuffRemains(x.SoulReaper)+5 end;local function ap(ai)if(ai:DebuffStack(x.FesteringWoundDebuff)<=2 or j:BuffUp(x.DarkTransformation))and ai:GUID()==f("mouseover"):GUID()and G.Unholy.TargetSwap=="Mouseover"then v=1207289;return true elseif(ai:DebuffStack(x.FesteringWoundDebuff)<=2 or j:BuffUp(x.DarkTransformation))and G.Unholy.TargetSwap=="AutoSwap"and ai:GUID()~=h:GUID()and not StopAutoSwap then v=999;return true elseif(ai:DebuffStack(x.FesteringWoundDebuff)<=2 or j:BuffUp(x.DarkTransformation))and ai:GUID()==h:GUID()then u=207289;return true elseif ai:DebuffStack(x.FesteringWoundDebuff)<=2 or j:BuffUp(x.DarkTransformation)then return true end end;local function aq(ai)return ai:DebuffStack(x.FesteringWoundDebuff)>=4 and X:CooldownRemains()<3 end;local function ar(ai)return ai:DebuffStack(x.FesteringWoundDebuff)>=1 end;local function as(ai)return ai:TimeToDie()>ai:DebuffRemains(x.VirulentPlagueDebuff)and(ai:DebuffRefreshable(x.VirulentPlagueDebuff)or x.Superstrain:IsAvailable()and(ai:DebuffRefreshable(x.FrostFeverDebuff)or ai:DebuffRefreshable(x.BloodPlagueDebuff)))and(not x.UnholyBlight:IsAvailable()or x.UnholyBlight:IsAvailable()and x.UnholyBlight:CooldownRemains()>15/(q(x.Superstrain:IsAvailable())*3+q(x.Plaguebringer:IsAvailable())*2+q(x.EbonFever:IsAvailable())*2))end;local function at()if x.RaiseDead:IsCastable()then if n(x.RaiseDead,nil,nil)then u=46584;return"raise_dead precombat 2 displaystyle"end end;if x.ArmyoftheDead:IsReady()then if n(x.ArmyoftheDead,nil,nil)then u=42650;return"army_of_the_dead precombat 4"end end;if x.Outbreak:IsReady()then if n(x.Outbreak,nil,nil,not h:IsSpellInRange(x.Outbreak))then u=77575;return"outbreak precombat 6"end end;if x.FesteringStrike:IsReady()then if n(x.FesteringStrike,nil,nil,not h:IsInMeleeRange(5))then u=85948;return"festering_strike precombat 8"end end end;local function au()if x.Epidemic:IsReady()and(not L or a0<10)and not g:IsMoving()then if n(x.Epidemic,nil,nil,not h:IsInRange(30))then u=207317;return"epidemic aoe 2"end end;if W:IsReady()and K then if F.CastTargetIf(W,a2,"max",ah,nil,not h:IsSpellInRange(W))then a8()return"wound_spender aoe 4"end end;if x.FesteringStrike:IsReady()and not K then if F.CastTargetIf(x.FesteringStrike,a2,"max",ah,nil,not h:IsInMeleeRange(5))then u=85948;return"festering_strike aoe 6"end end;if x.DeathCoil:IsReady()and(not L and not x.Epidemic:IsAvailable())then if n(x.DeathCoil,nil,nil,not h:IsSpellInRange(x.DeathCoil))then u=47541;return"death_coil aoe 8"end end end;local function av()if x.Epidemic:IsReady()and((not x.BurstingSores:IsAvailable()or g:Rune()<1 or x.BurstingSores:IsAvailable()and Y==0)and not L and(a3>=6 or g:RunicPowerDeficit()<30 or g:BuffStack(x.FestermightBuff)==20))then if n(x.Epidemic,nil,nil,not h:IsInRange(30))then u=207317;return"epidemic aoe_burst 2"end end;if W:IsReady()then if F.CastTargetIf(W,a2,"max",ah,ar,not h:IsSpellInRange(W))then a8()return"wound_spender aoe_burst 4"end end;if x.Epidemic:IsReady()and(not L or a0<10)then if n(x.Epidemic,nil,nil,not h:IsInRange(30))then u=207317;return"epidemic aoe_burst 6"end end;if x.DeathCoil:IsReady()and(not L and not x.Epidemic:IsAvailable())then if n(x.DeathCoil,nil,nil,not h:IsSpellInRange(x.DeathCoil))then u=47541;return"death_coil aoe_burst 8"end end;if W:IsReady()then if n(W,nil,nil,not h:IsSpellInRange(W))then a8()return"wound_spender aoe_burst 10"end end end;local function aw()if x.VileContagion:IsReady()and X:CooldownRemains()<3 then if F.CastTargetIf(x.VileContagion,a2,"max",ah,aq,not h:IsSpellInRange(x.VileContagion))then u=390279;return"vile_contagion aoe_cooldowns 2"end end;if x.SummonGargoyle:IsReady()then if n(x.SummonGargoyle,nil)then u=49206;return"summon_gargoyle aoe_cooldowns 4"end end;if x.AbominationLimb:IsCastable()and(g:Rune()<2 or Y>10 or not x.Festermight:IsAvailable()or g:BuffUp(x.FestermightBuff)and g:BuffRemains(x.FestermightBuff)<12)then if n(x.AbominationLimb,nil,nil,not h:IsInRange(20))then u=315443;return"abomination_limb aoe_cooldowns 6"end end;if x.Apocalypse:IsReady()then if F.CastTargetIf(x.Apocalypse,a2,"min",ah,ak,not h:IsInMeleeRange(5))then u=275699;return"apocalypse aoe_cooldowns 8"end end;if x.UnholyAssault:IsCastable()then if F.CastTargetIf(x.UnholyAssault,a2,"min",ah,ap,not h:IsInMeleeRange(5),nil)then u=207289;return"unholy_assault aoe_cooldowns 10"end end;if x.RaiseDead:IsCastable()then if n(x.RaiseDead,nil,nil)then u=46584;return"raise_dead aoe_cooldowns 12 displaystyle"end end;if x.DarkTransformation:IsCastable()and(X:CooldownRemains()<10 and x.InfectedClaws:IsAvailable()and(x.FesteringWoundDebuff:AuraActiveCount()<a5 or not x.VileContagion:IsAvailable())or not x.InfectedClaws:IsAvailable())then if n(x.DarkTransformation,nil)then u=63560;return"dark_transformation aoe_cooldowns 14"end end;if x.EmpowerRuneWeapon:IsCastable()and j:BuffUp(x.DarkTransformation)then if n(x.EmpowerRuneWeapon,nil)then u=47568;return"empower_rune_weapon aoe_cooldowns 16"end end;if x.SacrificialPact:IsReady()and(j:BuffDown(x.DarkTransformation)and x.DarkTransformation:CooldownRemains()>6 or a0<g:GCD())then if n(x.SacrificialPact,nil)then u=237574;return"sacrificial_pact aoe_cooldowns 18"end end end;local function ax()if X:IsReady()and(not x.BurstingSores:IsAvailable()or x.FesteringWoundDebuff:AuraActiveCount()==a5 or x.FesteringWoundDebuff:AuraActiveCount()>=8)then if n(X,nil)then u=43265;return"any_dnd aoe_setup 2"end end;if x.FesteringStrike:IsReady()and(x.FesteringWoundDebuff:AuraActiveCount()<a5 and x.BurstingSores:IsAvailable())then if F.CastTargetIf(x.FesteringStrike,a2,"min",ah,nil,not h:IsInMeleeRange(5))then u=85948;return"festering_strike aoe_setup 4"end end;if x.Epidemic:IsReady()and(not L or a0<10)then if n(x.Epidemic,nil,nil,not h:IsInRange(30))then u=207317;return"epidemic aoe_setup 6"end end;if x.FesteringStrike:IsReady()and x.FesteringWoundDebuff:AuraActiveCount()<a5 then if F.CastTargetIf(x.FesteringStrike,a2,"min",ah,nil,not h:IsInMeleeRange(5))then u=85948;return"festering_strike aoe_setup 8"end end;if x.FesteringStrike:IsReady()and x.Apocalypse:CooldownRemains()<I then if F.CastTargetIf(x.FesteringStrike,a2,"max",ah,am,not h:IsInMeleeRange(5))then u=85948;return"festering_strike aoe_setup 10"end end;if x.DeathCoil:IsReady()and(not L and not x.Epidemic:IsAvailable())then if n(x.DeathCoil,nil,nil,not h:IsSpellInRange(x.DeathCoil))then u=47541;return"death_coil aoe_setup 12"end end end;local function ay()if x.SummonGargoyle:IsCastable()and(O or not x.CommanderoftheDead:IsAvailable())then if n(x.SummonGargoyle,nil)then u=49206;return"summon_gargoyle cooldowns 2"end end;if x.RaiseDead:IsCastable()then if n(x.RaiseDead,nil,nil)then u=46584;return"raise_dead cooldowns 4 displaystyle"end end;if x.DarkTransformation:IsCastable()and x.Apocalypse:CooldownRemains()<5 then if n(x.DarkTransformation,nil)then u=63560;return"dark_transformation cooldowns 6"end end;if x.Apocalypse:IsReady()and M then if F.CastTargetIf(x.Apocalypse,a2,"max",ah,al,not h:IsInMeleeRange(5),nil)then u=275699;return"apocalypse cooldowns 8"end end;if x.EmpowerRuneWeapon:IsCastable()and(M and(U and V<=23 or not x.SummonGargoyle:IsAvailable()and x.ArmyoftheDamned:IsAvailable()and S and Q or not x.SummonGargoyle:IsAvailable()and not x.ArmyoftheDamned:IsAvailable()and j:BuffUp(x.DarkTransformation)or not x.SummonGargoyle:IsAvailable()and j:BuffUp(x.DarkTransformation))or a0<=21)then if n(x.EmpowerRuneWeapon,nil)then u=47568;return"empower_rune_weapon cooldowns 10"end end;if x.AbominationLimb:IsCastable()and(g:Rune()<3 and M)then if n(x.AbominationLimb,nil)then u=315443;return"abomination_limb cooldowns 12"end end;if x.UnholyAssault:IsReady()and M then if F.CastTargetIf(x.UnholyAssault,a2,"min",ah,nil,not h:IsInMeleeRange(5),nil)then u=207289;return"unholy_assault cooldowns 14"end end;if x.SoulReaper:IsReady()and(a3==1 and(h:TimeToX(35)<5 or h:HealthPercentage()<=35)and h:TimeToDie()>5)then if n(x.SoulReaper,nil,nil,not h:IsSpellInRange(x.SoulReaper))then u=343294;return"soul_reaper cooldowns 16"end end;if x.SoulReaper:IsReady()and a3>=2 then if F.CastTargetIf(x.SoulReaper,a2,"min",aj,ao,not h:IsSpellInRange(x.SoulReaper))then u=343294;return"soul_reaper cooldowns 18"end end end;local function az()if x.Apocalypse:IsReady()and(Y>=4 and(g:BuffUp(x.CommanderoftheDeadBuff)and V<23 or not x.CommanderoftheDead:IsAvailable()))then if n(x.Apocalypse,nil,nil,not h:IsInMeleeRange(5))then u=275699;return"apocalypse garg_setup 2"end end;if x.ArmyoftheDead:IsReady()and(x.CommanderoftheDead:IsAvailable()and(x.DarkTransformation:CooldownRemains()<3 or g:BuffUp(x.CommanderoftheDeadBuff))or not x.CommanderoftheDead:IsAvailable()and x.UnholyAssault:IsAvailable()and x.UnholyAssault:CooldownRemains()<10 or not x.UnholyAssault:IsAvailable()and not x.CommanderoftheDead:IsAvailable())then if n(x.ArmyoftheDead,nil,nil)then u=42650;return"army_of_the_dead garg_setup 4"end end;if x.SoulReaper:IsReady()and(a3==1 and(h:TimeToX(35)<5 or h:HealthPercentage()<=35)and h:TimeToDie()>5)then if n(x.SoulReaper,nil,nil,not h:IsInMeleeRange(5))then u=343294;return"soul_reaper garg_setup 6"end end;if x.SummonGargoyle:IsCastable()and o()and(g:BuffUp(x.CommanderoftheDeadBuff)or not x.CommanderoftheDead:IsAvailable()and g:RunicPower()>=40)then if n(x.SummonGargoyle,nil)then u=49206;return"summon_gargoyle garg_setup 8"end end;if o()and(U and V<=23)then if x.EmpowerRuneWeapon:IsCastable()then if n(x.EmpowerRuneWeapon,nil)then u=47568;return"empower_rune_weapon garg_setup 10"end end;if x.UnholyAssault:IsCastable()then if n(x.UnholyAssault,nil,nil,not h:IsInMeleeRange(5))then u=207289;return"unholy_assault garg_setup 12"end end end;if G.Commons.Enabled.Potions then local aA=F.PotionSelected()if aA then if aA:IsReady()and(30>=V and U or(not x.SummonGargoyle:IsAvailable()or x.SummonGargoyle:CooldownRemains()>60 or x.SummonGargoyle:CooldownUp())and(j:BuffUp(x.DarkTransformation)and 30>=j:BuffRemains(x.DarkTransformation)or S and T<=30 or Q and R<=30))then if n(aA,nil,G.Commons.DisplayStyle.Potions)then return"potion garg_setup 14"end end end end;if x.DarkTransformation:IsCastable()and(x.CommanderoftheDead:IsAvailable()and g:RunicPower()>40 or not x.CommanderoftheDead:IsAvailable())then if n(x.DarkTransformation,nil)then u=63560;return"dark_transformation garg_setup 16"end end;if X:IsReady()and(g:BuffDown(x.DeathAndDecayBuff)and Y>0)then if n(X,nil)then u=43265;return"any_dnd garg_setup 18"end end;if x.FesteringStrike:IsReady()and(Y==0 or not x.Apocalypse:IsAvailable()or g:RunicPower()<40 and not U)then if n(x.FesteringStrike,nil,nil,not h:IsInMeleeRange(5))then u=85948;return"festering_strike garg_setup 20"end end;if x.DeathCoil:IsReady()and g:Rune()<=1 then if n(x.DeathCoil,nil,nil,not h:IsSpellInRange(x.DeathCoil))then u=47541;return"death_coil garg_setup 22"end end end;local function aB()if x.DeathCoil:IsReady()and(not VarEpidemicPriority and(not L and VarSpendRP or a0<10))then if n(x.DeathCoil,nil,nil,not h:IsSpellInRange(x.DeathCoil))then u=47541;return"death_coil st 2"end end;if x.Epidemic:IsReady()and(VarEpidemicPriority and(not L and VarSpendRP or a0<10))then if n(x.Epidemic,nil,nil,not h:IsInRange(30))then u=207317;return"epidemic st 4"end end;if X:IsReady()and(g:BuffDown(x.DeathAndDecayBuff)and(a3>=2 or x.UnholyGround:IsAvailable()and(Q and R>=13 or U and V>8 or S and T>8 or not K and Y>=4)or x.Defile:IsAvailable()and(U or Q or S or j:BuffUp(x.DarkTransformation)))and(x.FesteringWoundDebuff:AuraActiveCount()==a3 or a3==1))then if n(X,nil)then u=43265;return"any_dnd st 6"end end;if W:IsReady()and(K or a3>=2 and g:BuffUp(x.DeathAndDecayBuff))then if n(W,nil,nil,not h:IsSpellInRange(W))then a8()return"wound_spender st 8"end end;if x.FesteringStrike:IsReady()and not K then if F.CastTargetIf(x.FesteringStrike,a2,"min",ah,an,not h:IsInMeleeRange(5))then u=85948;return"festering_strike st 10"end end;if x.DeathCoil:IsReady()then if n(x.DeathCoil,nil,nil,not h:IsSpellInRange(x.DeathCoil))then u=47541;return"death_coil st 12"end end;if W:IsReady()and not K then if F.CastTargetIf(W,a2,"max",ah,an,not h:IsSpellInRange(W))then a8()return"wound_spender st 14"end end end;local function aC()if G.Commons.Enabled.Potions then local aA=F.PotionSelected()if aA then if aA:IsReady()and(30>=V and U or(not x.SummonGargoyle:IsAvailable()or x.SummonGargoyle:CooldownRemains()>60 or x.SummonGargoyle:CooldownUp())and(j:BuffUp(x.DarkTransformation)and 30>=j:BuffRemains(x.DarkTransformation)or S and T<=30 or Q and R<=30)or a0<=30)then if n(aA,nil,G.Commons.DisplayStyle.Potions)then return"potion high_prio_actions 2"end end end end;if x.ArmyoftheDead:IsReady()and(x.SummonGargoyle:IsAvailable()and x.SummonGargoyle:CooldownRemains()<2 or not x.SummonGargoyle:IsAvailable()or a0<35)then if n(x.ArmyoftheDead,nil,nil)then u=42650;return"army_of_the_dead high_prio_actions 4"end end;if x.DeathCoil:IsReady()and((a3<=3 or not x.Epidemic:IsAvailable())and(U and x.CommanderoftheDead:IsAvailable()and g:BuffUp(x.CommanderoftheDeadBuff)and x.Apocalypse:CooldownRemains()<5 and g:BuffRemains(x.CommanderoftheDeadBuff)>27 or h:DebuffUp(x.DeathRotDebuff)and h:DebuffRemains(x.DeathRotDebuff)<g:GCD()))then if n(x.DeathCoil,nil,nil,not h:IsSpellInRange(x.DeathCoil))then u=47541;return"death_coil high_prio_actions 6"end end;if x.Epidemic:IsReady()and(a5>=4 and(x.CommanderoftheDead:IsAvailable()and g:BuffUp(x.CommanderoftheDeadBuff)and x.Apocalypse:CooldownRemains()<5 or h:DebuffUp(x.DeathRotDebuff)and h:DebuffRemains(x.DeathRotDebuff)<g:GCD()))then if n(x.Epidemic,nil,nil,not h:IsInRange(30))then u=207317;return"epidemic high_prio_actions 8"end end;if W:IsReady()and((x.Apocalypse:CooldownRemains()>I+3 or a3>=3)and x.Plaguebringer:IsAvailable()and(x.Superstrain:IsAvailable()or x.UnholyBlight:IsAvailable())and g:BuffRemains(x.PlaguebringerBuff)<g:GCD())then if n(W,nil,nil,not h:IsSpellInRange(W))then a8()return"wound_spender high_prio_actions 10"end end;if x.UnholyBlight:IsReady()and(M and((not x.Apocalypse:IsAvailable()or x.Apocalypse:CooldownDown())and x.Morbidity:IsAvailable()or not x.Morbidity:IsAvailable())or N or a0<21)then if n(x.UnholyBlight,nil,nil,not h:IsInRange(8))then u=115989;return"unholy_blight high_prio_actions 12"end end;if x.Outbreak:IsReady()then if F.CastCycle(x.Outbreak,a2,as,not h:IsSpellInRange(x.Outbreak))then u=77575;return"outbreak high_prio_actions 14"end end end;local function aD()if x.ArcaneTorrent:IsCastable()and(g:RunicPowerDeficit()>20 and(x.SummonGargoyle:CooldownRemains()<g:GCD()or not x.SummonGargoyle:IsAvailable()or U and g:Rune()<2 and Y<1))then if n(x.ArcaneTorrent,nil,nil,not h:IsInRange(8))then return"arcane_torrent racials 2"end end;if x.BloodFury:IsCastable()and(x.BloodFury:BaseDuration()+3>=V and U or(not x.SummonGargoyle:IsAvailable()or x.SummonGargoyle:CooldownRemains()>60)and(S and T<=x.BloodFury:BaseDuration()+3 or Q and R<=x.BloodFury:BaseDuration()+3 or a3>=2 and g:BuffUp(x.DeathAndDecayBuff))or a0<=x.BloodFury:BaseDuration()+3)then if n(x.BloodFury,nil)then u=20572;return"blood_fury racials 4"end end;if x.Berserking:IsCastable()and(x.Berserking:BaseDuration()+3>=V and U or(not x.SummonGargoyle:IsAvailable()or x.SummonGargoyle:CooldownRemains()>60)and(S and T<=x.Berserking:BaseDuration()+3 or Q and R<=x.Berserking:BaseDuration()+3 or a3>=2 and g:BuffUp(x.DeathAndDecayBuff))or a0<=x.Berserking:BaseDuration()+3)then if n(x.Berserking,nil)then u=26297;return"berserking racials 6"end end;if x.LightsJudgment:IsCastable()and(g:BuffUp(x.UnholyStrengthBuff)and(not x.Festermight:IsAvailable()or g:BuffRemains(x.FestermightBuff)<h:TimeToDie()or g:BuffRemains(x.UnholyStrengthBuff)<h:TimeToDie()))then if n(x.LightsJudgment,nil,nil,not h:IsSpellInRange(x.LightsJudgment))then u=255647;return"lights_judgment racials 8"end end;if x.AncestralCall:IsCastable()and(18>=V and U or(not x.SummonGargoyle:IsAvailable()or x.SummonGargoyle:CooldownRemains()>60)and(S and T<=18 or Q and R<=18 or a3>=2 and g:BuffUp(x.DeathAndDecayBuff))or a0<=18)then if n(x.AncestralCall,nil)then u=274738;return"ancestral_call racials 10"end end;if x.ArcanePulse:IsCastable()and(a3>=2 or g:Rune()<=1 and g:RunicPowerDeficit()>=60)then if n(x.ArcanePulse,nil,nil,not h:IsInRange(8))then u=260364;return"arcane_pulse racials 12"end end;if x.Fireblood:IsCastable()and(x.Fireblood:BaseDuration()+3>=V and U or(not x.SummonGargoyle:IsAvailable()or x.SummonGargoyle:CooldownRemains()>60)and(S and T<=x.Fireblood:BaseDuration()+3 or Q and R<=x.Fireblood:BaseDuration()+3 or a3>=2 and g:BuffUp(x.DeathAndDecayBuff))or a0<=x.Fireblood:BaseDuration()+3)then if n(x.Fireblood,nil)then u=265221;return"fireblood racials 14"end end;if x.BagofTricks:IsCastable()and(a3==1 and(g:BuffUp(x.UnholyStrengthBuff)or d.FilteredFightRemains(a2,"<",5)))then if n(x.BagofTricks,nil,nil,not h:IsSpellInRange(x.BagofTricks))then u=312411;return"bag_of_tricks racials 16"end end end;local function aE()local aF=g:GetUseableTrinkets(z)if aF and o()and(x.Apocalypse:CooldownDown()or j:BuffUp(x.DarkTransformation))then if aF then if m.Cast(aF,nil,nil)then if aF:ID()==GetInventoryItemID("player",13)and G.Commons.Enabled.TopTrinket then u=30;return"Generic use_items for "..aF:Name()elseif aF:ID()==GetInventoryItemID("player",14)and G.Commons.Enabled.BottomTrinket then u=31;return"Generic use_items for "..aF:Name()end end end end end;local function aG()VarEpidemicPriority=x.ImprovedDeathCoil:IsAvailable()and not x.CoilofDevastation:IsAvailable()and a3>=3 or x.CoilofDevastation:IsAvailable()and a3>=4 or not x.ImprovedDeathCoil:IsAvailable()and a3>=2;H=a3>=3 or x.SummonGargoyle:CooldownRemains()>1 and(x.Apocalypse:CooldownRemains()>1 or not x.Apocalypse:IsAvailable())or not x.SummonGargoyle:IsAvailable()or d.CombatTime()>20;I=x.Apocalypse:CooldownRemains()<10 and Y<=4 and x.UnholyAssault:CooldownRemains()>10 and 7 or 2;if not U and x.Festermight:IsAvailable()and g:BuffUp(x.FestermightBuff)and g:BuffRemains(x.FestermightBuff)/(5*g:GCD())>=1 then J=Y>=1 else J=Y>=3-q(x.InfectedClaws:IsAvailable())end;K=(x.Apocalypse:CooldownRemains()>I or not x.Apocalypse:IsAvailable())and(J or Y>=1 and x.UnholyAssault:CooldownRemains()<20 and x.UnholyAssault:IsAvailable()and M or h:DebuffUp(x.RottenTouchDebuff)and Y>=1 or Y>4 or g:HasTier(31,4)and(a1:ApocMagusActive()or a1:ArmyMagusActive())and Y>=1)or a0<5 and Y>=1;L=x.VileContagion:IsAvailable()and x.VileContagion:CooldownRemains()<3 and g:RunicPower()<60 and not M;M=a3==1 or not p()N=a3>=2 and p()VarSpendRP=(not x.RottenTouch:IsAvailable()or x.RottenTouch:IsAvailable()and h:DebuffDown(x.RottenTouchDebuff)or g:RunicPowerDeficit()<20)and(not g:HasTier(31,4)or g:HasTier(31,4)and not(a1:ApocMagusActive()or a1:ArmyMagusActive())or g:RunicPowerDeficit()<20 or g:Rune()<3)and(x.ImprovedDeathCoil:IsAvailable()and(a3==2 or x.CoilofDevastation:IsAvailable())or g:Rune()<3 or U or g:BuffUp(x.SuddenDoomBuff)or x.Apocalypse:CooldownRemains()<10 and Y>3 or not K and Y>=4)end;local function aH()E=not a9()a2=g:GetEnemiesInMeleeRange(8)a4=g:GetEnemiesInMeleeRange(10)TopTrinketID,_=GetInventoryItemID("player",13)BotTrinketID,_=GetInventoryItemID("player",14)if p()then a3=#a2;a5=#a2 else a3=1;a5=1 end;a6=aa(a4)Q=x.Apocalypse:TimeSinceLastCast()<=15;R=Q and 15-x.Apocalypse:TimeSinceLastCast()or 0;S=x.ArmyoftheDead:TimeSinceLastCast()<=30;T=T and 30-x.ArmyoftheDead:TimeSinceLastCast()or 0;if F.TargetIsValid()or g:AffectingCombat()then if IsInRaid()and UnitExists("boss1")then Z=d.BossFightRemains(nil,true)a0=Z;if a0==11111 then a0=d.FightRemains(Enemies10yd,false)end end end;Opener=HeroRotationCharDB.Toggles[6]CovenantsON=HeroRotationCharDB.Toggles[4]SmallCDsOn=HeroRotationCharDB.Toggles[5]HOLDAOTDON=HeroRotationCharDB.Toggles[10]HOLDSacPac=HeroRotationCharDB.Toggles[11]StopAutoSwap=HeroRotationCharDB.Toggles[12]QAMZ=HeroRotationCharDB.Toggles[13]QDeathgrip=HeroRotationCharDB.Toggles[14]UsePots=not HeroRotationCharDB.Toggles[15]QAsphyxiate=HeroRotationCharDB.Toggles[16]HoldWeapon=HeroRotationCharDB.Toggles[17]HoldAbomLimb=HeroRotationCharDB.Toggles[18]shouldpool=false;if not w then v=0;u=0 end;if v>0 then v=0 end;if u>0 then u=0 end end;local function aI()if not w then v=0;u=0 end;if v>0 then v=0 end;if u>0 then u=0 end;E=not a9()a2=g:GetEnemiesInMeleeRange(8)a4=h:GetEnemiesInSplashRange(10)if p()then a3=#a2;a5=h:GetEnemiesInSplashRangeCount(10)else a3=1;a5=1 end;if F.TargetIsValid()or g:AffectingCombat()then Z=d.BossFightRemains()a0=Z;if a0==11111 then a0=d.FightRemains(a2,false)end;a6=aa(a4)Q=x.Apocalypse:TimeSinceLastCast()<=15;R=Q and 15-x.Apocalypse:TimeSinceLastCast()or 0;S=x.ArmyoftheDead:TimeSinceLastCast()<=30;T=S and 30-x.ArmyoftheDead:TimeSinceLastCast()or 0;U=a1:gargactive()V=a1:gargremains()Y=h:DebuffStack(x.FesteringWoundDebuff)end;if F.TargetIsValid()and g:AffectingCombat()then if not g:AffectingCombat()then local D=at()if D then return D end end;if x.DeathStrike:IsReady()and not E then if n(x.DeathStrike)then return"death_strike low hp or proc"end end;if a3==0 then if x.Outbreak:IsReady()and a6>0 then if n(x.Outbreak,nil,nil,not h:IsSpellInRange(x.Outbreak))then u=77575;return"outbreak out_of_range"end end;if x.Epidemic:IsReady()and p()and x.VirulentPlagueDebuff:AuraActiveCount()>1 and not L then if n(x.Epidemic,nil,nil,not h:IsInRange(30))then u=207317;return"epidemic out_of_range"end end;if x.DeathCoil:IsReady()and x.VirulentPlagueDebuff:AuraActiveCount()<2 and not L then if n(x.DeathCoil,nil,nil,not h:IsSpellInRange(x.DeathCoil))then u=10;return"death_coil out_of_range"end end end;aG()local D=aC()if D then return D end;if G.Commons.Enabled.Trinkets or G.Commons.Enabled.Items then local D=aE()if D then return D end end;if o()and not H then local D=az()if D then return D end;if m.CastAnnotated(x.Pool,false,"WAIT")then return"Pool for GargSetup()"end end;if o()and M then local D=ay()if D then return D end end;if p()and o()and N then local D=aw()if D then return D end end;if o()then local D=aD()if D then return D end end;if p()then if N and X:CooldownRemains()<10 and g:BuffDown(x.DeathAndDecayBuff)then local D=ax()if D then return D end end;if a3>=4 and g:BuffUp(x.DeathAndDecayBuff)then local D=av()if D then return D end end;if a3>=4 and(X:CooldownRemains()>10 and g:BuffDown(x.DeathAndDecayBuff)or not N)then local D=au()if D then return D end end end;if a3<=3 then local D=aB()if D then return D end end;if n(x.Pool)then return"pool_resources"end end end;function ReturnSpell()if u==0 then return 0 else return u end end;function ReturnSpellMO()if v==0 then return 0 else return v end end;local function aJ()x.VirulentPlagueDebuff:RegisterAuraTracking()x.FesteringWoundDebuff:RegisterAuraTracking()m.Print("Unholy DK rotation is currently a work in progress, but has been updated for patch 10.1.5.")end;m.SetAPL(252,aI,aJ)