local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=HeroRotation;local m=l.AoEON;local n=l.CDsON;local o=l.Cast;local p=l.CastSuggested;local q=l.CastAnnotated;local r=l.Commons.Everyone.num;local s=l.Commons.Everyone.bool;local t=l.Commons.DemonHunter;local GetTime=GetTime;local u=math.max;local v=math.min;local w=table.insert;local x=j.DemonHunter.Vengeance;local y=k.DemonHunter.Vengeance;local z={}local A=l.Commons.Everyone;local B={General=l.GUISettings.General,Commons=l.GUISettings.APL.DemonHunter.Commons,Vengeance=l.GUISettings.APL.DemonHunter.Vengeance}local C,D,E;local F=x.SoulSigils:IsAvailable()and 4 or 3;local G,H;local I;local J;local K;local L;local M,N,O,P,Q,R;local S=11111;local T=11111;local U,V;local W=0;local X=0;local Y=not HeroRotationCharDB.Toggles[167]local Z=not HeroRotationCharDB.Toggles[168]local _=not HeroRotationCharDB.Toggles[169]local a0=HeroRotationCharDB.Toggles[72]d:RegisterForEvent(function()S=11111;T=11111 end,"PLAYER_REGEN_ENABLED")d:RegisterForEvent(function()F=x.SoulSigils:IsAvailable()and 4 or 3 end,"SPELLS_CHANGED","LEARNED_SPELL_IN_TAB")local function a1()if x.Felblade:TimeSinceLastCast()<g:GCD()or x.InfernalStrike:TimeSinceLastCast()<g:GCD()then G=true;H=true;return end;G=h:IsInMeleeRange(5)H=G or L>0 end;local function a2(a3)return a3:DebuffRemains(x.FieryBrandDebuff)end;local function a4(a3)return a3:DebuffUp(x.FieryBrandDebuff)end;local function a5(a6)local a7=0;if a6~=nil then for a8,a9 in pairs(a6)do if not g:IsTanking(a9)and a9:GUID()~=h:GUID()and a9:AffectingCombat()then a7=a7+1 end end end;return a7 end;local function aa()if x.SigilofFlame:IsCastable()then if o(x.SigilofFlame,nil,nil,not h:IsInRange(30))then X=389810;return"sigil_of_flame precombat 2"end end;if x.Felblade:IsCastable()and not G then if o(x.Felblade,nil,nil,not h:IsInRange(15))then X=232893;return"felblade precombat 5"end end;if x.ImmolationAura:IsCastable()then if o(x.ImmolationAura)then X=258920;return"immolation_aura precombat 4"end end;if x.Fracture:IsCastable()and G then if o(x.Fracture)then X=263642;return"fracture precombat 8"end end;if x.Shear:IsCastable()and G then if o(x.Shear)then X=203782;return"shear precombat 10"end end end;local function ab()if x.DemonSpikes:IsCastable()and g:BuffDown(x.DemonSpikesBuff)and g:BuffDown(x.MetamorphosisBuff)and(L==1 and g:BuffDown(x.FieryBrandDebuff)or L>1)then if x.DemonSpikes:ChargesFractional()>1.9 then if o(x.DemonSpikes,nil,nil)then X=203720;return"demon_spikes defensives (Capped)"end elseif I or g:HealthPercentage()<=B.Vengeance.DemonSpikesHealthThreshold then if o(x.DemonSpikes,nil,nil)then X=203720;return"demon_spikes defensives (Danger)"end end end;if x.Metamorphosis:IsCastable()and g:HealthPercentage()<=B.Vengeance.MetamorphosisHealthThreshold and(g:BuffDown(x.MetamorphosisBuff)or h:TimeToDie()<15)then if o(x.Metamorphosis,nil,nil)then X=187827;return"metamorphosis defensives"end end;if x.FieryBrand:IsCastable()and(I or g:HealthPercentage()<=B.Vengeance.FieryBrandHealthThreshold)then if o(x.FieryBrand,nil,nil,not h:IsSpellInRange(x.FieryBrand))then X=204021;return"fiery_brand defensives"end end end;local function ac()if x.FieryBrand:IsCastable()and(x.FieryBrandDebuff:AuraActiveCount()==0 and(x.SigilofFlame:CooldownRemains()<=x.FieryBrand:ExecuteTime()+g:GCDRemains()or x.SoulCarver:CooldownRemains()<x.FieryBrand:ExecuteTime()+g:GCDRemains()or x.FelDevastation:CooldownRemains()<x.FieryBrand:ExecuteTime()+g:GCDRemains())or x.DowninFlames:IsAvailable()and x.FieryBrand:FullRechargeTime()<x.FieryBrand:ExecuteTime()+g:GCDRemains())then if o(x.FieryBrand,nil,nil,not h:IsSpellInRange(x.FieryBrand))then X=204021;return"fiery_brand maintenance 2"end end;if x.SigilofFlame:IsCastable()and(x.AscendingFlame:IsAvailable()or x.SigilofFlameDebuff:AuraActiveCount()==0)then if o(x.SigilofFlame,nil,nil,not h:IsInRange(30))then X=389810;return"sigil_of_flame maintenance 4"end end;if x.ImmolationAura:IsCastable()then if o(x.ImmolationAura)then X=258920;return"immolation_aura maintenance 6"end end;if x.BulkExtraction:IsCastable()and(5-C<=L and C<=2)then if o(x.BulkExtraction,nil,nil,not h:IsInMeleeRange(8))then X=320341;return"bulk_extraction maintenance 8"end end;if VarNoMaintCleave and not R then if q(x.Pool,false,"WAIT")then return"Wait for Spirit Bomb"end end;if x.SpiritBomb:IsReady()and R then if o(x.SpiritBomb,nil,nil,not h:IsInMeleeRange(8))then X=247454;return"spirit_bomb maintenance 10"end end;if x.Felblade:IsReady()and(g:FuryDeficit()>=40 and L==1 or x.FelDevastation:CooldownRemains()<=x.Felblade:ExecuteTime()+g:GCDRemains()and g:Fury()<50)then if o(x.Felblade,nil,nil,not h:IsSpellInRange(x.Felblade))then X=232893;return"felblade maintenance 12"end end;if x.Fracture:IsCastable()and(x.FelDevastation:CooldownRemains()<=x.Fracture:ExecuteTime()+g:GCDRemains()and g:Fury()<50)then if o(x.Fracture,nil,nil,not G)then X=263642;return"fracture maintenance 14"end end;if x.Shear:IsCastable()and(x.FelDevastation:CooldownRemains()<=x.Fracture:ExecuteTime()+g:GCDRemains()and g:Fury()<50)then if o(x.Shear,nil,nil,not G)then X=203782;return"shear maintenance 16"end end;if g:FuryDeficit()<=30 and L>1 and D>=4 and C<4 then if q(x.Pool,false,"WAIT")then return"Wait for Spirit Bomb"end end;if x.SpiritBomb:IsReady()and(g:FuryDeficit()<=30 and L>1 and C>=4)then if o(x.SpiritBomb,nil,nil,not h:IsInMeleeRange(8))then X=247454;return"spirit_bomb maintenance 18"end end;if x.SoulCleave:IsReady()and not VarNoMaintCleave and g:FuryDeficit()<=40 then if o(x.SoulCleave,nil,nil,not G)then X=228477;return"soul_cleave maintenance 20"end end end;local function ad()if x.ImmolationAura:IsCastable()then if o(x.ImmolationAura)then X=258920;return"immolation_aura fiery_demise 2"end end;if x.SigilofFlame:IsCastable()then if o(x.SigilofFlame,nil,nil,not h:IsInRange(30))then X=389810;return"sigil_of_flame fiery_demise 4"end end;if x.Felblade:IsReady()and(x.FelDevastation:CooldownRemains()<=x.Felblade:ExecuteTime()+g:GCDRemains()and g:Fury()<50)then if o(x.Felblade,nil,nil,not h:IsSpellInRange(x.Felblade))then X=232893;return"felblade fiery_demise 6"end end;if x.FelDevastation:IsReady()then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then X=212084;return"fel_devastation fiery_demise 8"end end;if x.SoulCarver:IsCastable()and D<3 then if o(x.SoulCarver,nil,nil,not G)then X=214743;return"soul_carver fiery_demise 10"end end;if x.TheHunt:IsCastable()then if o(x.TheHunt,nil,nil,not h:IsInRange(50))then X=323639;return"the_hunt fiery_demise 12"end end;if x.ElysianDecree:IsCastable()and x.ElysianDecree:TimeSinceLastCast()>=1.85 and g:Fury()>=40 then if o(x.ElysianDecree,nil,nil,not h:IsInRange(30))then X=389815;return"elysian_decree fiery_demise 14"end end;if VarNoMaintCleave and not R then if q(x.Pool,false,"WAIT")then return"Wait for Spirit Bomb"end end;if x.SpiritBomb:IsReady()and R then if o(x.SpiritBomb,nil,nil,not h:IsInMeleeRange(8))then X=247454;return"spirit_bomb fiery_demise 16"end end end;local function ae()if x.SigilofChains:IsCastable()and x.CycleofBinding:IsAvailable()then if o(x.SigilofChains,nil,nil,not h:IsInRange(30))then return"sigil_of_chains filler 2"end end;if x.SigilofMisery:IsCastable()and x.CycleofBinding:IsAvailable()then if o(x.SigilofMisery,nil,nil,not h:IsInRange(30))then return"sigil_of_misery filler 4"end end;if x.SigilofSilence:IsCastable()and x.CycleofBinding:IsAvailable()then if o(x.SigilofSilence,nil,nil,not h:IsInRange(30))then return"sigil_of_silence filler 6"end end;if x.Felblade:IsReady()then if o(x.Felblade,nil,nil,not h:IsSpellInRange(x.Felblade))then X=232893;return"felblade filler 8"end end;if x.ThrowGlaive:IsCastable()then if o(x.ThrowGlaive,nil,nil,not h:IsSpellInRange(x.ThrowGlaive))then X=204157;return"throw_glaive filler 10"end end end;local function af()if x.TheHunt:IsCastable()then if o(x.TheHunt,nil,nil,not h:IsInRange(50))then X=323639;return"the_hunt single_target 2"end end;if x.SoulCarver:IsCastable()then if o(x.SoulCarver,nil,nil,not G)then X=214743;return"soul_carver single_target 4"end end;if x.FelDevastation:IsReady()and(x.CollectiveAnguish:IsAvailable()or x.StoketheFlames:IsAvailable()and x.BurningBlood:IsAvailable())then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then X=212084;return"fel_devastation single_target 6"end end;if x.ElysianDecree:IsCastable()then if o(x.ElysianDecree,nil,nil,not h:IsInRange(30))then X=389815;return"elysian_decree single_target 8"end end;if x.FelDevastation:IsReady()then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then X=212084;return"fel_devastation single_target 10"end end;if x.SoulCleave:IsReady()and not M then if o(x.SoulCleave,nil,nil,not G)then X=228477;return"soul_cleave single_target 12"end end;if x.Fracture:IsCastable()then if o(x.Fracture,nil,nil,not G)then X=263642;return"fracture single_target 14"end end;if x.Shear:IsCastable()then if o(x.Shear,nil,nil,not G)then X=203782;return"shear single_target 16"end end;local ag=ae()if ag then return ag end end;local function ah()if x.TheHunt:IsCastable()then if o(x.TheHunt,nil,nil,not h:IsInRange(50))then X=323639;return"the_hunt small_aoe 2"end end;if x.FelDevastation:IsReady()and(x.CollectiveAnguish:IsAvailable()or x.StoketheFlames:IsAvailable()and x.BurningBlood:IsAvailable())then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then X=212084;return"fel_devastation small_aoe 4"end end;if x.ElysianDecree:IsCastable()and x.ElysianDecree:TimeSinceLastCast()>=1.85 and(g:Fury()>=40 and(D<=1 or D>=4))then if o(x.ElysianDecree,nil,nil,not h:IsInRange(30))then X=389815;return"elysian_decree small_aoe 6"end end;if x.FelDevastation:IsReady()then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then X=212084;return"fel_devastation small_aoe 8"end end;if x.SoulCarver:IsCastable()and D<3 then if o(x.SoulCarver,nil,nil,not G)then X=214743;return"soul_carver small_aoe 10"end end;if x.SoulCleave:IsReady()and(C<=1 and not M)then if o(x.SoulCleave,nil,nil,not G)then X=228477;return"soul_cleave small_aoe 14"end end;if x.Fracture:IsCastable()then if o(x.Fracture,nil,nil,not G)then X=263642;return"fracture small_aoe 16"end end;if x.Shear:IsCastable()then if o(x.Shear,nil,nil,not G)then X=203782;return"shear small_aoe 18"end end;local ag=ae()if ag then return ag end end;local function ai()if x.FelDevastation:IsReady()and(x.CollectiveAnguish:IsAvailable()or x.StoketheFlames:IsAvailable())then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then X=212084;return"fel_devastation big_aoe 2"end end;if x.TheHunt:IsCastable()then if o(x.TheHunt,nil,nil,not h:IsInRange(50))then X=323639;return"the_hunt big_aoe 4"end end;if x.ElysianDecree:IsCastable()and x.ElysianDecree:TimeSinceLastCast()>=1.85 and(g:Fury()>=40 and(D<=1 or D>=4))then if o(x.ElysianDecree,nil,nil,not h:IsInRange(30))then X=389815;return"elysian_decree big_aoe 6"end end;if x.FelDevastation:IsReady()then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then X=212084;return"fel_devastation big_aoe 8"end end;if x.SoulCarver:IsCastable()and D<3 then if o(x.SoulCarver,nil,nil,not G)then X=214743;return"soul_carver big_aoe 10"end end;if D>=4 and C<4 then if q(x.Pool,false,"WAIT")then return"Wait for Spirit Bomb"end end;if x.SpiritBomb:IsReady()and C>=4 then if o(x.SpiritBomb,nil,nil,not h:IsInMeleeRange(8))then X=247454;return"spirit_bomb big_aoe 12"end end;if x.Fracture:IsCastable()then if o(x.Fracture,nil,nil,not G)then X=263642;return"fracture big_aoe 14"end end;if x.Shear:IsCastable()then if o(x.Shear,nil,nil,not G)then X=203782;return"shear big_aoe 16"end end;if x.SoulCleave:IsReady()and not M then if o(x.SoulCleave,nil,nil,not G)then X=228477;return"soul_cleave big_aoe 18"end end;local ag=ae()if ag then return ag end end;local function aj()end;local function ak()Y=not HeroRotationCharDB.Toggles[167]Z=not HeroRotationCharDB.Toggles[168]_=not HeroRotationCharDB.Toggles[169]end;local function al()if not V then MOshouldcast=0;X=0 end;if MOshouldcast>0 then MOshouldcast=0 end;if X>0 then X=0 end;K=g:GetEnemiesInMeleeRange(8)if m()then L=#K>0 and#K or 1 else L=1 end;if g:IsChanneling(x.FelDevestation)then if l.CastAnnotated(x.Pool,false,"WAIT")then X=99999;return"Pool During FelDevestation"end end;ak()if A.TargetIsValid()or g:AffectingCombat()then S=d.BossFightRemains()T=S;if T==11111 then T=d.FightRemains(K,false)end;C=t.Souls.AuraSouls;E=t.Souls.IncomingSouls;D=C+E;a1()I=g:ActiveMitigationNeeded()J=g:IsTankingAoE(8)or g:IsTanking(h)end;if A.TargetIsValid()then if not g:AffectingCombat()then local ag=aa()if ag then return ag end end;N=x.FieryBrand:IsAvailable()and x.FieryDemise:IsAvailable()and x.FieryBrandDebuff:AuraActiveCount()>0;O=L==1;P=L>=2 and L<=5;Q=L>=6;M=x.FelDevastation:CooldownRemains()<=x.SoulCleave:ExecuteTime()+g:GCDRemains()and g:Fury()<80 or(E>1 or D>=5)and not O;if N then R=O and C>=5 or P and C>=4 or Q and C>=3 else R=P and C>=5 or Q and C>=4 end;if N then VarNoMaintCleave=O and D>=5 or P and D>=4 or Q and D>=3 else VarNoMaintCleave=P and D>=5 or Q and D>=4 end;local ag=A.Interrupt(10,x.Disrupt,B.Commons.OffGCDasOffGCD.Disrupt,false)if ag then return ag end;if J then local ag=ab()if ag then return ag end end;U=a5(EnemiesMeleeCount)if A.TargetIsValid()then if x.Torment:IsReady()and g:AffectingCombat()and(not g:IsTanking(h)and a0)then if o(x.Torment,nil)then X=185245;return"Torment bear 3"end end end;if x.Metamorphosis:IsCastable()and g:BuffDown(x.MetamorphosisBuff)then if o(x.Metamorphosis,nil,nil)then X=187827;return"metamorphosis main 4"end end;if B.Commons.Enabled.Potions then local am=A.PotionSelected()if am then if am:IsReady()and n()and UsePots and(g:BloodlustUp()and l.GUISettings.General.HoldPotforBL or not l.GUISettings.General.HoldPotforBL)then if o(am,nil)then X=50;return"potion cooldowns 6"end end end end;if B.Commons.Enabled.Trinkets then local an=g:GetUseableTrinkets(z,13)if an then if o(an,nil,nil)then X=30;return"trinket1 main 10"end end;local ao=g:GetUseableTrinkets(z,14)if ao then if o(ao,nil,nil)then X=40;return"trinket2 main 12"end end end;if x.FieryBrand:IsAvailable()and x.FieryDemise:IsAvailable()and x.FieryBrandDebuff:AuraActiveCount()>0 then local ag=ad()if ag then return ag end end;local ag=ac()if ag then return ag end;if O then local ag=af()if ag then return ag end;if q(x.Pool,false,"WAIT")then return"Wait for SingleTarget()"end end;if P then local ag=ah()if ag then return ag end;if q(x.Pool,false,"WAIT")then return"Wait for SmallAoE()"end end;if Q then local ag=ai()if ag then return ag end;if q(x.Pool,false,"WAIT")then return"Wait for BigAoE()"end end;if q(x.Pool,false,"WAIT")then return"Wait/Pool Resources"end end end;function ReturnSpellVen()if X==0 then return 0 else return X end end;function ReturnSpellVenMO()if MOshouldcast==0 then return 0 else return MOshouldcast end end;local function ap()x.FieryBrandDebuff:RegisterAuraTracking()x.SigilofFlameDebuff:RegisterAuraTracking()l.Print("Vengeance Demon Hunter rotation has been updated for patch 10.2.0.")end;l.SetAPL(581,al,ap)