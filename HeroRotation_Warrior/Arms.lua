local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=d.Spell;local j=d.Item;local k=HeroRotation;local l=k.Cast;local m=k.AoEON;local n=k.CDsON;local o=k.Commons.Everyone.num;local p=k.Commons.Everyone.bool;local q=i.Warrior.Arms;local r=j.Warrior.Arms;local s={}local t=g:GetEquipment()local u=t[13]and j(t[13])or j(0)local v=t[14]and j(t[14])or j(0)local w,x;local y,z;local A,B;local C;local D,E;local F;local G=11111;local H=11111;d:RegisterForEvent(function()G=11111;H=11111 end,"PLAYER_REGEN_ENABLED")d:RegisterForEvent(function()t=g:GetEquipment()u=t[13]and j(t[13])or j(0)v=t[14]and j(t[14])or j(0)end,"PLAYER_EQUIPMENT_CHANGED")local I;local J;local K=281000;local L=6343;local M=0;local N=0;local O;local function o(P)if P then return 1 else return 0 end end;local function p(P)return P~=0 end;local Q=k.Commons.Everyone;local R={General=k.GUISettings.General,Commons=k.GUISettings.APL.Warrior.Commons,Arms=k.GUISettings.APL.Warrior.Arms}local S={{q.StormBolt,"Cast Storm Bolt (Interrupt)",function()return true end}}local function T(U)return U:HealthPercentage()>20 or q.Massacre:IsAvailable()and U:HealthPercentage()<35 end;local function V(U)return U:DebuffStack(q.ExecutionersPrecisionDebuff)==2 or U:DebuffRemains(q.DeepWoundsDebuff)<=g:GCD()or q.Dreadnaught:IsAvailable()and q.Battlelord:IsAvailable()and J<=2 end;local function W(U)return g:BuffUp(q.SuddenDeathBuff)or J<=2 and(U:HealthPercentage()<20 or q.Massacre:IsAvailable()and U:HealthPercentage()<35)or g:BuffUp(q.SweepingStrikes)end;local function X()if F then if q.Skullsplitter:IsCastable()then if l(q.Skullsplitter,nil,nil,not F)then N=q.Skullsplitter:ID()return"skullsplitter precombat 8"end end;if q.ColossusSmash:IsCastable()then if l(q.ColossusSmash,nil,nil,not F)then N=q.ColossusSmash:ID()return"colossus_smash precombat 10"end end;if q.Warbreaker:IsCastable()then if l(q.Warbreaker,nil,nil,not h:IsInMeleeRange(8))then N=q.Warbreaker:ID()return"warbreaker precombat 12"end end;if q.Overpower:IsCastable()then if l(q.Overpower,nil,nil,not F)then N=q.Overpower:ID()return"overpower precombat 14"end end end;if q.Charge:IsCastable()then if l(q.Charge,nil,nil,not h:IsSpellInRange(q.Charge))then N=q.Charge:ID()return"charge precombat 16"end end end;local function Y()if n()and q.SweepingStrikes:IsCastable()and(J>=2 and D)then if l(q.SweepingStrikes,nil,nil,not h:IsInMeleeRange(8))then N=q.SweepingStrikes:ID()return"sweeping_strikes execute 2"end end;if q.Rend:IsReady()and(h:DebuffRemains(q.RendDebuff)<=g:GCD()and not q.Bloodletting:IsAvailable()and(not q.Warbreaker:IsAvailable()and q.ColossusSmash:CooldownRemains()<4 or q.Warbreaker:IsAvailable()and q.Warbreaker:CooldownRemains()<4)and h:TimeToDie()>12)then if l(q.Rend,nil,nil,not F)then N=q.Rend:ID()return"rend execute 4"end end;if n()and q.Avatar:IsCastable()and(q.ColossusSmash:CooldownUp()or h:DebuffUp(q.ColossusSmashDebuff)or H<20)then if l(q.Avatar,nil)then N=q.Avatar:ID()return"avatar execute 6"end end;if n()and q.Warbreaker:IsCastable()then if l(q.Warbreaker,nil,nil,not F)then N=q.Warbreaker:ID()return"warbreaker execute 8"end end;if n()and q.ColossusSmash:IsCastable()then if l(q.ColossusSmash,nil,nil,not F)then N=q.ColossusSmash:ID()return"colossus_smash execute 10"end end;if q.Execute:IsReady()and(g:BuffUp(q.SuddenDeathBuff)and h:DebuffUp(q.DeepWoundsDebuff))then if l(q.Execute,nil,nil,not F)then N=K;return"execute execute 12"end end;if q.Skullsplitter:IsCastable()and(q.TestofMight:IsAvailable()and g:RagePercentage()<=30 or not q.TestofMight:IsAvailable()and(h:DebuffUp(q.ColossusSmashDebuff)or q.ColossusSmash:CooldownRemains()>5)and g:RagePercentage()<=30)then if l(q.Skullsplitter,nil,nil,not h:IsInMeleeRange(8))then N=q.Skullsplitter:ID()return"sweeping_strikes execute 14"end end;if n()and q.ThunderousRoar:IsCastable()and(q.TestofMight:IsAvailable()and g:Rage()<40 or not q.TestofMight:IsAvailable()and(g:BuffUp(q.AvatarBuff)or h:DebuffUp(q.ColossusSmashDebuff))and g:Rage()<70)then if l(q.ThunderousRoar,nil,nil,not h:IsInMeleeRange(12))then N=q.ThunderousRoar:ID()return"thunderous_roar execute 12"end end;if n()and q.SpearofBastion:IsCastable()and(h:DebuffUp(q.ColossusSmashDebuff)or g:BuffUp(q.TestofMightBuff))then if l(q.SpearofBastion,nil,nil,not h:IsSpellInRange(q.SpearofBastion))then N=q.SpearofBastion:ID()return"spear_of_bastion execute 18"end end;if q.Cleave:IsReady()and(J>2 and h:DebuffRemains(q.DeepWoundsDebuff)<g:GCD())then if l(q.Cleave,nil,nil,not F)then N=q.Cleave:ID()return"cleave execute 18"end end;if q.MortalStrike:IsReady()and(h:DebuffStack(q.ExecutionersPrecisionDebuff)==2 and h:DebuffRemains(q.ColossusSmashDebuff)<=g:GCD())then if l(q.MortalStrike,nil,nil,not F)then N=q.MortalStrike:ID()return"mortal_strike execute 22"end end;if q.Overpower:IsCastable()and(g:Rage()<40 and g:BuffStack(q.MartialProwessBuff)<2)then if l(q.Overpower,nil,nil,not F)then N=q.Overpower:ID()return"overpower execute 20"end end;if q.MortalStrike:IsReady()and h:DebuffStack(q.ExecutionersPrecisionDebuff)==2 then if l(q.MortalStrike,nil,nil,not F)then N=q.MortalStrike:ID()return"mortal_strike execute 22"end end;if q.Execute:IsReady()then if l(q.Execute,nil,nil,not F)then N=K;return"execute execute 24"end end;if q.Shockwave:IsCastable()and q.SonicBoom:IsAvailable()then if l(q.Shockwave,nil,nil,not h:IsInMeleeRange(10))then N=q.Shockwave:ID()return"shockwave execute 26"end end;if q.Overpower:IsCastable()then if l(q.Overpower,nil,nil,not F)then N=q.Overpower:ID()return"overpower execute 28"end end;if n()and q.Bladestorm:IsCastable()then if l(q.Bladestorm,nil,nil,not F)then N=q.Bladestorm:ID()return"bladestorm execute 30"end end end;local function Z()if q.Execute:IsReady()and(g:BuffUp(q.JuggernautBuff)and g:BuffRemains(q.JuggernautBuff)<g:GCD())then if l(q.Execute,nil,nil,not F)then N=K;return"execute hac 2"end end;if q.ThunderClap:IsReady()and(J>2 and q.BloodandThunder:IsAvailable()and q.Rend:IsAvailable()and h:DebuffRefreshable(q.RendDebuff))then if l(q.ThunderClap,nil,nil,not F)then N=L;return"thunder_clap hac 4"end end;if q.SweepingStrikes:IsCastable()and(J>=2 and(q.Bladestorm:CooldownRemains()>15 or not q.Bladestorm:IsAvailable()))then if l(q.SweepingStrikes,nil,nil,not h:IsInMeleeRange(8))then N=q.SweepingStrikes:ID()return"sweeping_strikes hac 6"end end;if q.Rend:IsReady()and(J==1 and h:DebuffRemains(q.RendDebuff)<=g:GCD()and(h:HealthPercentage()>20 or q.Massacre:IsAvailable()and h:HealthPercentage()<35)or q.TideofBlood:IsAvailable()and q.Skullsplitter:CooldownRemains()<=g:GCD()and(q.ColossusSmash:CooldownRemains()<g:GCD()or h:DebuffUp(q.ColossusSmashDebuff))and h:DebuffRemains(q.RendDebuff)<21*0.85)then if l(q.Rend,nil,nil,not F)then N=q.Rend:ID()return"rend hac 8"end end;if n()and q.Avatar:IsCastable()and(q.BlademastersTorment:IsAvailable()and J>1 or H<20)then if l(q.Avatar,nil)then N=q.Avatar:ID()return"avatar hac 10"end end;if q.Warbreaker:IsCastable()and J>1 then if l(q.Warbreaker,nil,nil,not F)then N=q.Warbreaker:ID()return"warbreaker hac 12"end end;if n()and q.ColossusSmash:IsCastable()then if Q.CastCycle(q.ColossusSmash,I,T,not F)then N=q.ColossusSmash:ID()return"colossus_smash hac 14"end end;if n()and q.ColossusSmash:IsCastable()then if l(q.ColossusSmash,nil,nil,not F)then N=q.ColossusSmash:ID()return"colossus_smash hac 16"end end;if n()and q.ThunderousRoar:IsCastable()and(g:BuffUp(q.TestofMightBuff)or not q.TestofMight:IsAvailable()and h:DebuffUp(q.ColossusSmashDebuff)or J>1 and h:DebuffRemains(q.DeepWoundsDebuff)>0)then if l(q.ThunderousRoar,nil,nil,not h:IsInMeleeRange(12))then N=q.ThunderousRoar:ID()return"thunderous_roar hac 18"end end;if n()and q.SpearofBastion:IsCastable()and(g:BuffUp(q.TestofMightBuff)or not q.TestofMight:IsAvailable()and h:DebuffUp(q.ColossusSmashDebuff))then if l(q.SpearofBastion,nil,nil,not h:IsSpellInRange(q.SpearofBastion))then N=q.SpearofBastion:ID()return"spear_of_bastion hac 20"end end;if n()and q.Bladestorm:IsCastable()and(q.Unhinged:IsAvailable()and(g:BuffUp(q.TestofMightBuff)or not q.TestofMight:IsAvailable()and h:DebuffUp(q.ColossusSmashDebuff)))then if l(q.Bladestorm,nil,nil,not F)then N=q.Bladestorm:ID()return"bladestorm hac 22"end end;if n()and q.Bladestorm:IsCastable()and(J>1 and(g:BuffUp(q.TestofMightBuff)or not q.TestofMight:IsAvailable()and h:DebuffUp(q.ColossusSmashDebuff))or J>1 and h:DebuffRemains(q.DeepWoundsDebuff)>0)then if l(q.Bladestorm,nil,nil,not F)then N=q.Bladestorm:ID()return"bladestorm hac 24"end end;if q.Cleave:IsReady()and(J>2 or not q.Battlelord:IsAvailable()and g:BuffUp(q.MercilessBonegrinderBuff)and q.MortalStrike:CooldownRemains()>g:GCD())then if l(q.Cleave,nil,nil,not F)then N=q.Cleave:ID()return"cleave hac 26"end end;if q.Whirlwind:IsReady()and(J>2 or q.StormofSwords:IsAvailable()and(g:BuffUp(q.MercilessBonegrinderBuff)or g:BuffUp(q.HurricaneBuff)))then if l(q.Whirlwind,nil,nil,not h:IsInMeleeRange(8))then N=q.Whirlwind:ID()return"whirlwind hac 28"end end;if q.Skullsplitter:IsCastable()and(g:Rage()<40 or q.TideofBlood:IsAvailable()and h:DebuffRemains(q.RendDebuff)>0 and(g:BuffUp(q.SweepingStrikes)and J>2 or h:DebuffUp(q.ColossusSmashDebuff)or g:BuffUp(q.TestofMightBuff)))then if l(q.Skullsplitter,nil,nil,not h:IsInMeleeRange(8))then N=q.Skullsplitter:ID()return"sweeping_strikes execute 30"end end;if q.MortalStrike:IsReady()and(g:BuffUp(q.SweepingStrikes)and g:BuffStack(q.CrushingAdvanceBuff)==3)then if l(q.MortalStrike,nil,nil,not F)then N=q.MortalStrike:ID()return"mortal_strike hac 32"end end;if q.Overpower:IsCastable()and(g:BuffUp(q.SweepingStrikes)and q.Dreadnaught:IsAvailable())then if l(q.Overpower,nil,nil,not F)then N=q.Overpower:ID()return"overpower hac 34"end end;if q.MortalStrike:IsReady()then if Q.CastCycle(q.MortalStrike,I,V,not F)then N=q.MortalStrike:ID()return"mortal_strike hac 36"end end;if q.Execute:IsReady()and(g:BuffUp(q.SuddenDeathBuff)or J<=2 and(h:HealthPercentage()<20 or q.Massacre:IsAvailable()and h:HealthPercentage()<35)or g:BuffUp(q.SweepingStrikes))then if Q.CastCycle(q.Execute,I,W,not F)then N=K;return"execute hac 38"end end;if n()and q.ThunderousRoar:IsCastable()then if l(q.ThunderousRoar,nil,nil,not h:IsInMeleeRange(12))then N=q.ThunderousRoar:ID()return"thunderous_roar hac 40"end end;if q.Shockwave:IsCastable()and(J>2 and q.SonicBoom:IsAvailable())then if l(q.Shockwave,nil,nil,not h:IsInMeleeRange(10))then N=q.Shockwave:ID()return"shockwave hac 42"end end;if q.Overpower:IsCastable()and(J==1 and(q.Overpower:Charges()==2 and not q.Battlelord:IsAvailable()and(h:Debuffdown(q.ColossusSmashDebuff)or g:RagePercentage()<25)or q.Battlelord:IsAvailable()))then if l(q.Overpower,nil,nil,not F)then N=q.Overpower:ID()return"overpower hac 44"end end;if q.Slam:IsReady()and(J==1 and not q.Battlelord:IsAvailable()and g:RagePercentage()>70)then if l(q.Slam,nil,nil,not F)then N=q.Slam()return"slam hac 46"end end;if q.Overpower:IsCastable()and(q.Overpower:Charges()==2 and(not q.TestofMight:IsAvailable()or q.TestofMight:IsAvailable()and h:DebuffUp(q.ColossusSmashDebuff)or q.Battlelord:IsAvailable())or g:Rage()<70)then if l(q.Overpower,nil,nil,not F)then N=q.Overpower:ID()return"overpower hac 48"end end;if q.ThunderClap:IsReady()and J>2 then if l(q.ThunderClap,nil,nil,not F)then N=L;return"thunder_clap hac 50"end end;if q.MortalStrike:IsReady()then if l(q.MortalStrike,nil,nil,not F)then N=q.MortalStrike:ID()return"mortal_strike hac 52"end end;if q.Rend:IsReady()and(J==1 and h:DebuffRefreshable(q.RendDebuff))then if l(q.Rend,nil,nil,not F)then N=q.Rend:ID()return"rend hac 54"end end;if q.Whirlwind:IsReady()and(q.StormofSwords:IsAvailable()or q.FervorofBattle:IsAvailable()and J>1)then if l(q.Whirlwind,nil,nil,not h:IsInMeleeRange(8))then N=q.Whirlwind:ID()return"whirlwind hac 56"end end;if q.Cleave:IsReady()and not q.CrushingForce:IsAvailable()then if l(q.Cleave,nil,nil,not F)then N=q.Cleave:ID()return"cleave hac 58"end end;if q.Slam:IsReady()and(q.CrushingForce:IsAvailable()and g:Rage()>30 and(q.FervorofBattle:IsAvailable()and J==1 or not q.FervorofBattle:IsAvailable()))then if l(q.Slam,nil,nil,not F)then N=q.Slam()return"slam hac 62"end end;if q.Shockwave:IsCastable()and q.SonicBoom:IsAvailable()then if l(q.Shockwave,nil,nil,not h:IsInMeleeRange(10))then N=q.Shockwave:ID()return"shockwave hac 64"end end;if n()and q.Bladestorm:IsCastable()then if l(q.Bladestorm,nil,nil,not F)then N=q.Bladestorm:ID()return"bladestorm hac 66"end end;if q.WreckingThrow:IsCastable()then if l(q.WreckingThrow,nil,nil,not h:IsInRange(30))then N=q.WreckingThrow:ID()return"wrecking_throw hac 68"end end end;local function _()if n()and q.SweepingStrikes:IsCastable()and J>=2 then if l(q.SweepingStrikes,nil,nil,not h:IsInMeleeRange(8))then N=q.SweepingStrikes:ID()return"sweeping_strikes single_target 2"end end;if q.Execute:IsReady()and g:BuffUp(q.SuddenDeathBuff)then if l(q.Execute,nil,nil,not F)then N=K;return"execute single_target 4"end end;if q.MortalStrike:IsReady()then if l(q.MortalStrike,nil,nil,not F)then N=q.MortalStrike:ID()return"mortal_strike single_target 4"end end;if q.ThunderClap:IsReady()and h:DebuffDown(q.RendDebuff)then if l(q.Rend,nil,nil,not F)then N=q.Rend:ID()return"rend single_target 6"end end;if n()and q.Avatar:IsCastable()and(q.WarlordsTorment:IsAvailable()and(q.ColossusSmash:CooldownUp()or h:DebuffUp(q.ColossusSmashDebuff)or g:BuffUp(q.TestofMightBuff))or not q.WarlordsTorment:IsAvailable()and(q.ColossusSmash:CooldownUp()or h:DebuffUp(q.ColossusSmashDebuff)))then if l(q.Avatar,nil)then N=q.Avatar:ID()return"avatar single_target 8"end end;if n()and q.SpearofBastion:IsCastable()and(q.ColossusSmash:CooldownRemains()<=g:GCD()or q.Warbreaker:CooldownRemains()<=g:GCD())then if l(q.SpearofBastion,nil,nil,not h:IsSpellInRange(q.SpearofBastion))then N=q.SpearofBastion:ID()return"spear_of_bastion single_target 10"end end;if n()and q.Warbreaker:IsCastable()then if l(q.Warbreaker,nil,nil,not h:IsInRange(8))then N=q.Warbreaker:ID()return"warbreaker single_target 12"end end;if n()and q.ColossusSmash:IsCastable()then if l(q.ColossusSmash,nil,nil,not F)then N=q.ColossusSmash:ID()return"colossus_smash single_target 16"end end;if q.Skullsplitter:IsCastable()and(not q.TestofMight:IsAvailable()and h:DebuffUp(q.DeepWoundsDebuff)and(h:DebuffUp(q.ColossusSmashDebuff)or q.ColossusSmash:CooldownRemains()>3))then if l(q.Skullsplitter,nil,nil,not F)then N=q.Skullsplitter:ID()return"skullsplitter single_target 18"end end;if q.Skullsplitter:IsCastable()and(q.TestofMight:IsAvailable()and h:DebuffUp(q.DeepWoundsDebuff))then if l(q.Skullsplitter,nil,nil,not F)then N=q.Skullsplitter:ID()return"skullsplitter single_target 20"end end;if n()and q.ThunderousRoar:IsCastable()and(g:BuffUp(q.TestofMightBuff)or h:DebuffUp(q.ColossusSmashDebuff)or q.ColossusSmash:CooldownRemains()<3 or g:BuffUp(q.AvatarBuff))then if l(q.ThunderousRoar,nil,nil,not h:IsInMeleeRange(12))then N=q.ThunderousRoar:ID()return"thunderous_roar single_target 22"end end;if q.Whirlwind:IsReady()and(q.StormofSwords:IsAvailable()and q.TestofMight:IsAvailable()and g:RagePercentage()>80 and h:DebuffUp(q.ColossusSmashDebuff))then if l(q.Whirlwind,nil,nil,not h:IsInMeleeRange(8))then N=q.Whirlwind:ID()return"whirlwind single_target 24"end end;if q.ThunderClap:IsReady()and(h:DebuffRemains(q.RendDebuff)<=g:GCD()and not q.TideofBlood:IsAvailable())then if l(q.ThunderClap,nil,nil,not F)then N=q.ThunderClap:ID()return"thunder_clap single_target 26"end end;if n()and q.Bladestorm:IsCastable()and(q.Hurricane:IsAvailable()and(g:BuffUp(q.TestofMightBuff)or not q.TestofMight:IsAvailable()and h:DebuffUp(q.ColossusSmashDebuff))or q.Unhinged:IsAvailable()and(g:BuffUp(q.TestofMightBuff)or not q.TestofMight:IsAvailable()and h:DebuffUp(q.ColossusSmashDebuff)))then if l(q.Bladestorm,nil,nil,not F)then N=q.Bladestorm:ID()return"bladestorm single_target 18"end end;if q.Shockwave:IsCastable()and q.SonicBoom:IsAvailable()then if l(q.Shockwave,nil,nil,not h:IsInMeleeRange(10))then N=q.Shockwave:ID()return"shockwave single_target 24"end end;if q.Whirlwind:IsReady()and(q.StormofSwords:IsAvailable()and q.TestofMight:IsAvailable()and h:DebuffRemains(q.ColossusSmashDebuff)>g:GCD()*7)then if l(q.Whirlwind,nil,nil,not h:IsInMeleeRange(8))then N=q.Whirlwind:ID()return"whirlwind single_target 28"end end;if q.Overpower:IsCastable()and(q.Overpower:Charges()==2 and not q.Battlelord:IsAvailable()and(h:DebuffUp(q.ColossusSmashDebuff)or g:RagePercentage()<25)or q.Battlelord:IsAvailable())then if l(q.Overpower,nil,nil,not F)then N=q.Overpower:ID()return"overpower single_target 30"end end;if q.Slam:IsReady()and((q.CrushingForce:IsAvailable()and h:DebuffUp(q.ColossusSmashDebuff)and g:Rage()>=60 and q.TestofMight:IsAvailable()or q.ImprovedSlam:IsAvailable())and(not q.FervorofBattle:IsAvailable()or q.FervorofBattle:IsAvailable()and J==1))then if l(q.Slam,nil,nil,not F)then N=q.Slam:ID()return"slam single_target 36"end end;if q.Whirlwind:IsReady()and(q.FervorofBattle:IsAvailable()and J>1)then if l(q.Whirlwind,nil,nil,not h:IsInMeleeRange(8))then N=q.Whirlwind:ID()return"whirlwind single_target 38"end end;if q.Slam:IsReady()and((q.CrushingForce:IsAvailable()or not q.CrushingForce:IsAvailable()and g:Rage()>=30)and(not q.FervorofBattle:IsAvailable()or q.FervorofBattle:IsAvailable()and J==1))then if l(q.Slam,nil,nil,not F)then N=q.Slam:ID()return"slam single_target 40"end end;if q.ThunderClap:IsReady()and(q.Battlelord:IsAvailable()and q.BloodandThunder:IsAvailable())then if l(q.ThunderClap,nil,nil,not F)then N=L;return"thunder_clap single_target 34"end end;if q.Overpower:IsCastable()and(h:DebuffDown(q.ColossusSmashDebuff)and g:RagePercentage()<50 and not q.Battlelord:IsAvailable()or g:RagePercentage()<25)then if l(q.Overpower,nil,nil,not F)then N=q.Overpower:ID()return"overpower single_target 36"end end;if q.Whirlwind:IsReady()and not q.StormofSwords:IsAvailable()then if l(q.Whirlwind,nil,nil,not h:IsInRange(8))then N=q.Whirlwind:ID()return"whirlwind single_target 38"end end;if q.Cleave:IsReady()and(g:HasTier(29,2)and not q.CrushingForce:IsAvailable())then if l(q.Cleave,nil,nil,not F)then N=q.Cleave:ID()return"cleave single_target 40"end end;if n()and q.Bladestorm:IsCastable()then if l(q.Bladestorm,nil,nil,not F)then N=q.Bladestorm:ID()return"bladestorm single_target 44"end end;if q.Cleave:IsReady()then if l(q.Cleave,nil,nil,not F)then N=q.Cleave:ID()return"cleave single_target 48"end end;if q.WreckingThrow:IsCastable()then if l(q.WreckingThrow,nil,nil,not h:IsInRange(30))then N=q.WreckingThrow:ID()return"wrecking_throw single_target 50"end end;if q.Rend:IsReady()and(not q.CrushingForce:IsAvailable()and h:DebuffRefreshable(q.RendDebuff))then if l(q.Rend,nil,nil,not F)then N=q.Rend:ID()return"rend single_target 52"end end end;local function a0()Opener=HeroRotationCharDB.Toggles[5]SmallCDsOn=HeroRotationCharDB.Toggles[4]StopAutoSwap=HeroRotationCharDB.Toggles[12]UsePots=HeroRotationCharDB.Toggles[15]if R.Commons.Enabled.TopTrinket then TopTrinketID=GetInventoryItemID("player",13)else TopTrinketID=1 end;if R.Commons.Enabled.BottomTrinket then BotTrinketID=GetInventoryItemID("player",14)else BotTrinketID=1 end end;local function a1()if not O then M=0;N=0 end;a0()if m()then I=g:GetEnemiesInMeleeRange(8)J=#I else J=1 end;if Q.TargetIsValid()or g:AffectingCombat()then F=h:IsSpellInRange(q.MortalStrike)G=d.BossFightRemains()H=G;if H==11111 then H=d.FightRemains(Enemies10yd,false)end end;if i(386164):IsAvailable()then if not g:BuffUp(q.BattleStance)then if l(q.BattleStance,nil)then N=q.BattleStance:ID()return"Cast Battle Stance"end end end;local a2=g:AffectingCombat()and 180 or 900;local a3;if i(6673):IsAvailable()and R.Arms.UseAutoBattleShout then a3=g:BuffRemains(i(6673))if a3<a2 then if l(q.BattleShout,nil)then N=q.BattleShout:ID()return"battle_shout refresh"end end end;if R.Arms.UseDefensives and g:AffectingCombat()then if q.RallyingCry:IsReady()and g:HealthPercentage()<R.Arms.RallyingCry then if k.Cast(q.RallyingCry,nil,nil,nil)then N=97462;return"RallyingCry 100"end end;if r.Healthstone:IsReady()and r.Healthstone:CooldownRemains()<=0 and g:HealthPercentage()<R.Commons.HealthstoneHP then if k.Cast(r.Healthstone,nil)then N=51;return"Healthstone HP"end end;if g:HealthPercentage()<R.Commons.HealPotHP and r.CosmicHealPot:IsReady()and r.CosmicHealPot:CooldownRemains()<=0 then if k.Cast(r.CosmicHealPot,nil)then N=54;return"HealPot HP"end end end;if Q.TargetIsValid()and g:AffectingCombat()and g:GetEnemiesInMeleeRange(8)then if not g:AffectingCombat()then local a4=X()if a4 then return a4 end end;if q.Charge:IsCastable()and not F and Opener and R.Arms.UseCharge then if l(q.Charge,nil,nil,not h:IsSpellInRange(q.Charge))then N=q.Charge:ID()return"charge main 4"end end;if g:HealthPercentage()<R.Commons.VictoryRushHP then if q.VictoryRush:IsReady()then if l(q.VictoryRush,nil,nil,not F)then N=q.VictoryRush:ID()return"victory_rush heal"end end;if q.ImpendingVictory:IsReady()then if l(q.ImpendingVictory,nil,nil,not F)then N=q.ImpendingVictory:ID()return"impending_victory heal"end end end;if q.Charge:IsCastable()and Opener and R.Arms.UseCharge then if l(q.Charge,nil,nil,not h:IsSpellInRange(q.Charge))then N=q.Charge:ID()return"charge main 2"end end;if n()and R.Commons.Enabled.Potions and UsePots and(h:DebuffRemains(q.ColossusSmashDebuff)>8 or h:TimeToDie()<25)then local a5=Q.PotionSelected()if not k.GUISettings.General.HoldPotforBL or k.GUISettings.General.HoldPotforBL and g:BloodlustUp()then if a5 and a5:IsReady()then if l(a5,nil,nil)then N=52;return"potion main 6"end end end end;local a6=g:GetUseableTrinkets(s)if a6 then if l(a6,nil,nil)then if a6:ID()==GetInventoryItemID("player",13)and R.Commons.Enabled.TopTrinket then N=30;return"top trinket 1"elseif a6:ID()==GetInventoryItemID("player",14)and R.Commons.Enabled.BottomTrinket then N=40;return"Bot trinket 1"end end end;if n()then if q.ArcaneTorrent:IsCastable()and(q.MortalStrike:CooldownRemains()>1.5 and g:Rage()<50)then if l(q.ArcaneTorrent,nil,nil,not h:IsInRange(8))then N=q.ArcaneTorrent:ID()return"arcane_torrent main 18"end end;if q.LightsJudgment:IsCastable()and(h:DebuffDown(q.ColossusSmashDebuff)and not q.MortalStrike:CooldownUp())then if l(q.LightsJudgment,nil,nil,not h:IsSpellInRange(q.LightsJudgment))then N=q.LightsJudgment:ID()return"lights_judgment main 20"end end;if q.BagofTricks:IsCastable()and(h:DebuffDown(q.ColossusSmashDebuff)and not q.MortalStrike:CooldownUp())then if l(q.BagofTricks,nil,nil,not h:IsSpellInRange(q.BagofTricks))then N=q.BagofTricks:ID()return"bag_of_tricks main 22"end end;if q.Berserking:IsCastable()and(h:TimeToDie()>180 and g:BuffUp(q.AvatarBuff)or h:TimeToDie()<180 and(h:HealthPercentage()<35 and q.Massacre:IsAvailable()or h:HealthPercentage()<20)and g:BuffUp(q.AvatarBuff)or h:TimeToDie()<20)then if l(q.Berserking,nil)then N=q.Berserking:ID()return"berserking main 24"end end;if q.BloodFury:IsCastable()and h:DebuffUp(q.ColossusSmashDebuff)then if l(q.BloodFury,nil)then N=q.BloodFury:ID()return"blood_fury main 26"end end;if q.Fireblood:IsCastable()and h:DebuffUp(q.ColossusSmashDebuff)then if l(q.Fireblood,nil)then N=q.Fireblood:ID()return"fireblood main 28"end end;if q.AncestralCall:IsCastable()and h:DebuffUp(q.ColossusSmashDebuff)then if l(q.AncestralCall,nil)then N=q.AncestralCall:ID()return"ancestral_call main 30"end end end;if m()and J>2 then local a4=Z()if a4 then return a4 end end;if q.Massacre:IsAvailable()and h:HealthPercentage()<35 or h:HealthPercentage()<20 then local a4=Y()if a4 then return a4 end end;local a4=_()if a4 then return a4 end;if k.CastAnnotated(q.Pool,false,"WAIT")then return"Wait/Pool Resources"end end end;function ReturnSpellArms()if N==0 then return 0 else return N end end;function ReturnSpellMOArms()if M==0 then return 0 else return M end end;local function a7()if HeroRotationCharDB.Toggles[5]then HeroRotationCharDB.Toggles[5]=not HeroRotationCharDB.Toggles[5]k.ToggleIconFrame:UpdateButtonText(5)end;k.Print("Arms Warrior rotation is currently a work in progress, but has been updated for patch 10.1.5.")end;k.SetAPL(71,a1,a7)