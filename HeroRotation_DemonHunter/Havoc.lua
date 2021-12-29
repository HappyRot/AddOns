local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=HeroRotation;local m=l.AoEON;local n=l.CDsON;local o=HeroRotationCharDB.Toggles[4]local p=HeroRotationCharDB.Toggles[5]local q=HeroRotationCharDB.Toggles[6]local r=HeroRotationCharDB.Toggles[12]local s=not HeroRotationCharDB.Toggles[15]local t=HeroRotationCharDB.Toggles[40]local u=HeroRotationCharDB.Toggles[42]local v=HeroRotationCharDB.Toggles[43]local w=HeroRotationCharDB.Toggles[41]local x=false;local y=false;local z=false;local A=false;local B=l.Cast;local C=l.CastSuggested;local D=string.match;local E=j.DemonHunter.Havoc;local F=k.DemonHunter.Havoc;local G={}local H=g:GetEquipment()local I=k(0)local J=k(0)local K,L=GetInventoryItemID("player",13)local M,L=GetInventoryItemID("player",14)if H[13]then I=k(H[13])end;if H[14]then J=k(H[14])end;local N;local O,P;local Q,R;local S=g:HasLegendaryEquipped(20)local T=g:HasLegendaryEquipped(23)local U=g:HasLegendaryEquipped(25)local V=l.Commons.Everyone;local W={General=l.GUISettings.General,Commons=l.GUISettings.APL.DemonHunter.Commons,Havoc=l.GUISettings.APL.DemonHunter.Havoc}local X={{E.FelEruption,"Cast Fel Eruption (Interrupt)",function()return true end},{E.ChaosNova,"Cast Chaos Nova (Interrupt)",function()return true end}}local Y=0;local Z=0;local _=false;local a0=false;local a1=false;local a2=false;local a3=false;local a4=false;local a5=false;local a6=0;local a7=false;d:RegisterForEvent(function()a0=false;a1=false;a2=false;a3=false;a4=false;a5=false end,"PLAYER_REGEN_ENABLED")d:RegisterForEvent(function()H=g:GetEquipment()I=k(0)J=k(0)if H[13]then I=k(H[13])end;if H[14]then J=k(H[14])end;S=g:HasLegendaryEquipped(20)T=g:HasLegendaryEquipped(23)U=g:HasLegendaryEquipped(25)end,"PLAYER_EQUIPMENT_CHANGED")local function a8(a9)if a9 then return 1 else return 0 end end;local function aa(a9)return a9~=0 end;local function ab(ac)if E.Felblade:TimeSinceLastCast()<=g:GCD()then return true elseif E.VengefulRetreat:TimeSinceLastCast()<1.0 and E.VengefulRetreat:TimeSinceLastCast()>0.25 or E.FelRush:TimeSinceLastCast()<1.0 then return false end;return ac and h:IsInMeleeRange(ac)or h:IsInMeleeRange(5)end;local function ad()return true end;local function ae(af)local ag=0;for ah in pairs(af)do local ai=af[ah]if ai:DebuffDown(E.BurningWoundDebuff)then ag=ag+1 end end;return ag end;local function aj(ak)return ak:DebuffRemains(E.BurningWoundDebuff)end;local function al(ak)if U and ak:DebuffRemains(E.BurningWoundDebuff)<4 and ak:IsInRange(8)and ak:GUID()==f("mouseover"):GUID()and W.Havoc.TargetSwap=="Mouseover"then Z=111;return true elseif U and ak:DebuffRemains(E.BurningWoundDebuff)<4 and ak:IsInRange(8)and W.Havoc.TargetSwap=="AutoSwap"and ak:GUID()~=h:GUID()and not r then Z=999;return true elseif U and ak:DebuffRemains(E.BurningWoundDebuff)<4 and ak:GUID()==h:GUID()and h:IsInRange(8)then Y=162243;return true elseif U and ak:DebuffRemains(E.BurningWoundDebuff)<4 then return true end end;local function am(ak)return ak:DebuffRemains(E.BurningWoundDebuff)end;local function an(ak)if U and ak:DebuffRemains(E.BurningWoundDebuff)<4 and ak:IsInRange(8)and ak:GUID()==f("mouseover"):GUID()and W.Havoc.TargetSwap=="Mouseover"then Z=111;return true elseif U and ak:DebuffRemains(E.BurningWoundDebuff)<4 and ak:IsInRange(8)and W.Havoc.TargetSwap=="AutoSwap"and ak:GUID()~=h:GUID()and not r then Z=999;return true elseif U and ak:DebuffRemains(E.BurningWoundDebuff)<4 and ak:IsInRange(8)and ak:GUID()==h:GUID()then Y=162243;return true elseif U and ak:DebuffRemains(E.BurningWoundDebuff)<4 then return true end end;local function ao()if I:TrinketHasStatAnyDps()and not J:TrinketHasStatAnyDps()then a6=1 end;if J:TrinketHasStatAnyDps()and not I:TrinketHasStatAnyDps()then a6=2 end;if I:TrinketHasStatAnyDps()and J:TrinketHasStatAnyDps()or not(I:TrinketHasStatAnyDps()and J:TrinketHasStatAnyDps())then a6=0 end;a7=E.BlindFury:IsAvailable()and(S or E.DemonBlades:IsAvailable())if not h:IsInMeleeRange(5)and E.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and h:IsInRange(15)and E.FelRush:IsCastable()and x then if B(E.FelRush,nil,nil,not h:IsInRange(15))then Y=195072;return"fel_rush precombat 2"end end;if h:IsInMeleeRange(5)and(E.DemonsBite:IsCastable()or E.DemonBlades:IsAvailable())then if B(E.DemonsBite,nil,nil,not h:IsInMeleeRange(5))then Y=162243;return"demons_bite or demon_blades precombat 4"end end end;local function ap()if E.Metamorphosis:IsCastable()and z and h:IsInRange(8)and(not E.Demonic:IsAvailable()and(E.EyeBeam:CooldownRemains()>20 or not A)and(not E.SinfulBrand:IsAvailable()or h:DebuffDown(E.SinfulBrandDebuff))or d.BossFilteredFightRemains("<",25))then if B(E.Metamorphosis,nil,nil,not h:IsInRange(40))then Y=191427;return"metamorphosis cooldown 2"end end;if E.Metamorphosis:IsCastable()and z and h:IsInRange(8)and(E.Demonic:IsAvailable()and((E.EyeBeam:CooldownRemains()>20 or not A)and(not a1 or E.BladeDance:CooldownRemains()>g:GCD()))and(not E.SinfulBrand:IsAvailable()or h:DebuffDown(E.SinfulBrandDebuff))or d.BossFilteredFightRemains("<",25))then if B(E.Metamorphosis,nil,nil,not h:IsInRange(40))then Y=191427;return"metamorphosis cooldown 4"end end;if(F.PotionofPhantomFire:IsReady()or F.PotionofSpectralAgility:IsReady())and h:IsInMeleeRange(8)and l.CDsON()and s and W.Commons.Enabled.Potions and(g:BuffRemains(E.MetamorphosisBuff)>25 or d.BossFilteredFightRemains("<",60))then if B(F.PotionofPhantomFire,nil,nil)then Y=4;return"potion cooldown 6"end end;if I:IsReady()and h:IsInRange(10)and W.Commons.Enabled.TopTrinket and l.CDsON()and(a6==1 and(g:BuffUp(E.MetamorphosisBuff)or not E.Demonic:IsAvailable()and(E.Metamorphosis:CooldownRemains()>d.FightRemains(P)or not z)or d.BossFilteredFightRemains("<=",20))or a6==2 and not J:IsReady()or a6==0)then if B(I,nil,nil)then if I:ID()==K then Y=20;return"top trinket 1"elseif I:ID()==M then Y=25;return"bot trinket 1"end end end;if J:IsReady()and h:IsInRange(10)and W.Commons.Enabled.BottomTrinket and l.CDsON()and(a6==2 and(g:BuffUp(E.MetamorphosisBuff)or not E.Demonic:IsAvailable()and(E.Metamorphosis:CooldownRemains()>d.FightRemains(P)or not z)or d.BossFilteredFightRemains("<=",20))or a6==1 and not I:IsReady()or a6==0)then if B(J,nil,nil)then if J:ID()==K then Y=20;return"top trinket 1"elseif J:ID()==M then Y=25;return"bot trinket 1"end end end;if E.SinfulBrand:IsCastable()and h:IsInMeleeRange(30)and o and h:DebuffDown(E.SinfulBrandDebuff)then if B(E.SinfulBrand,nil,nil,not h:IsSpellInRange(E.SinfulBrand))then Y=317009;return"sinful_brand cooldown 12"end end;if E.TheHunt:IsCastable()and h:IsInRange(40)and o and(not E.Demonic:IsAvailable()and not a5 and not a0 or g:BuffUp(E.FuriousGazeBuff))then if B(E.TheHunt,nil,nil,not h:IsSpellInRange(E.TheHunt))then Y=323639;return"the_hunt cooldown 14"end end;if E.ElysianDecree:IsCastable()and h:IsInRange(30)and o and Q>0 then if B(E.ElysianDecree,nil,nil,not h:IsInRange(30))then Y=306830;return"elysian_decree cooldown 16"end end end;local function aq()if E.FelRush:IsCastable()and h:IsInRange(15)and E.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(E.UnboundChaos:IsAvailable()and g:BuffUp(E.UnboundChaosBuff)and E.FelRush:Charges()==2)and x then if B(E.FelRush,nil,nil)then Y=195072;return"fel_rush demonic 2"end end;if E.DeathSweep:IsReady()and E.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and a1 then if B(E.DeathSweep,nil,nil,not ab(8))then Y=210152;return"death_sweep demonic 4"end end;if E.GlaiveTempest:IsReady()and h:IsInMeleeRange(8)and Q>0 then if B(E.GlaiveTempest,nil,nil,not h:IsInMeleeRange(8))then Y=342817;return"glaive_tempest demonic 6"end end;if E.ThrowGlaive:IsCastable()and h:IsInMeleeRange(30)and E.VengefulRetreat:TimeSinceLastCast()>1 and(E.SerratedGlaive:ConduitEnabled()and(E.EyeBeam:CooldownRemains()<6 and A)and g:BuffDown(E.MetamorphosisBuff)and h:DebuffDown(E.ExposedWoundDebuff))then if B(E.ThrowGlaive,nil,nil,not h:IsSpellInRange(E.ThrowGlaive))then Y=185123;return"throw_glaive demonic 8"end end;if E.EyeBeam:IsReady()and A and not h:IsCasting(j(355806))and h:IsInMeleeRange(10)and E.VengefulRetreat:TimeSinceLastCast()>=1 and(Q>0 and(not a7 or Q>1 or g:Fury()<70))then if B(E.EyeBeam,nil,nil,not h:IsInRange(20))then Y=198013;return"eye_beam demonic 10"end end;if E.BladeDance:IsReady()and E.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and(a1 and not E.Metamorphosis:CooldownUp()and(E.EyeBeam:CooldownRemains()>5 or not A))then if B(E.BladeDance,nil,nil,not ab(8))then Y=188499;return"blade_dance demonic 12"end end;if E.ImmolationAura:IsCastable()and not u and E.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and g:BuffDown(E.ImmolationAuraBuff)then if B(E.ImmolationAura,nil,nil,not ab(8))then Y=258920;return"immolation_aura demonic 14"end end;if E.Annihilation:IsReady()and h:IsInRange(8)and h:IsInMeleeRange(8)and not a2 then if B(E.Annihilation,nil,nil,not h:IsSpellInRange(E.Annihilation))then Y=201427;return"annihilation demonic 16"end end;if E.Felblade:IsCastable()and not v and h:IsInRange(15)and(h:IsInRange(8)or not t)and g:FuryDeficit()>=40 and(not ab()or E.VengefulRetreat:TimeSinceLastCast()>=1.0)then if B(E.Felblade,nil,nil,not h:IsSpellInRange(E.Felblade))then Y=183226;return"felblade demonic 18"end end;if E.EssenceBreak:IsCastable()and h:IsInMeleeRange(10)and E.VengefulRetreat:TimeSinceLastCast()>1 then if B(E.EssenceBreak,nil,nil,not ab(10))then Y=258860;return"essence_break demonic 20"end end;if E.ChaosStrike:IsReady()and h:IsInMeleeRange(8)and(not a2 and not a3)then if B(E.ChaosStrike,nil,nil,not h:IsSpellInRange(E.ChaosStrike))then Y=162794;return"chaos_strike demonic 22"end end;if E.FelRush:IsCastable()and h:IsInRange(15)and E.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(E.DemonBlades:IsAvailable()and not E.EyeBeam:CooldownUp()and ad())and x then if B(E.FelRush,nil,nil)then Y=195072;return"fel_rush demonic 24"end end;if E.DemonsBite:IsCastable()then if U and(h:DebuffRemains(E.BurningWoundDebuff)<4 or(UnitsWithoutBWCount==0 or not m()))then if B(E.DemonsBite,nil,nil,not h:IsSpellInRange(E.DemonsBite))then Y=162243;return"demons_bite 26T"end end;if V.CastTargetIf(E.DemonsBite,O,"min",am,an)then return"demons_bite demonic 26"end end;if E.FelRush:IsCastable()and h:IsInRange(15)and E.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(not E.DemonBlades:IsAvailable()and Q>1 and E.FelRush:Charges()==2)and x then if B(E.FelRush,nil,nil)then Y=195072;return"fel_rush demonic 28"end end;if E.DemonsBite:IsCastable()and h:IsInMeleeRange(8)and not U then if B(E.DemonsBite,nil,nil,not h:IsSpellInRange(E.DemonsBite))then Y=162243;return"demons_bite demonic 30"end end;if E.ThrowGlaive:IsCastable()and h:IsInRange(30)and not ab()then if B(E.ThrowGlaive,nil,nil,not h:IsSpellInRange(E.ThrowGlaive))then Y=185123;return"throw_glaive demonic 32"end end;if E.FelRush:IsCastable()and h:IsInRange(15)and E.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(not ab()and ad())and x then if B(E.FelRush,nil,nil)then Y=195072;return"fel_rush demonic 34"end end;if E.VengefulRetreat:IsCastable()and E.EyeBeam:TimeSinceLastCast()>1 and h:IsInRange(5)and y and not t and not ab()then if B(E.VengefulRetreat,nil)then Y=198793;return"vengeful_retreat demonic 36"end end;if E.ThrowGlaive:IsCastable()and h:IsInRange(30)and E.DemonBlades:IsAvailable()then if B(E.ThrowGlaive,nil,nil,not h:IsSpellInRange(E.ThrowGlaive))then Y=185123;return"throw_glaive demonic 38"end end end;local function ar()if E.VengefulRetreat:IsCastable()and E.EyeBeam:TimeSinceLastCast()>1 and h:IsInRange(5)and y and not t and(E.Momentum:IsAvailable()and g:BuffDown(E.PreparedBuff)and d.CombatTime()>1)then if B(E.VengefulRetreat,nil)then Y=198793;return"vengeful_retreat normal 2"end end;if E.FelRush:IsCastable()and h:IsInRange(15)and E.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and((g:BuffUp(E.UnboundChaosBuff)or a5 and(not E.UnboundChaos:IsAvailable()or not E.ImmolationAura:CooldownUp()))and ad())and x then if B(E.FelRush,nil,nil)then Y=195072;return"fel_rush demonic 34"end end;if E.FelBarrage:IsCastable()and E.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInMeleeRange(8)and Q>1 then if B(E.FelBarrage,nil,nil,not ab(8))then Y=211053;return"fel_barrage normal 6"end end;if E.DeathSweep:IsReady()and E.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and a1 then if B(E.DeathSweep,nil,nil,not ab(8))then Y=210152;return"death_sweep normal 8"end end;if E.ImmolationAura:IsCastable()and not u and E.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and g:BuffDown(E.ImmolationAuraBuff)then if B(E.ImmolationAura,nil,nil,not ab(8))then Y=258920;return"immolation_aura normal 10"end end;if E.GlaiveTempest:IsReady()and E.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInMeleeRange(8)and(not a5 and Q>0)then if B(E.GlaiveTempest,nil)then Y=342817;return"glaive_tempest normal 12"end end;if E.ThrowGlaive:IsCastable()and E.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInRange(30)and(E.SerratedGlaive:ConduitEnabled()and(E.EyeBeam:CooldownRemains()<6 and A)and g:BuffDown(E.MetamorphosisBuff)and h:DebuffDown(E.ExposedWoundDebuff))then if B(E.ThrowGlaive,nil,nil,not h:IsSpellInRange(E.ThrowGlaive))then Y=185123;return"throw_glaive normal 14"end end;if E.EyeBeam:IsReady()and A and not h:IsCasting(j(355806))and h:IsInMeleeRange(10)and E.VengefulRetreat:TimeSinceLastCast()>=1 and(not a5 and(R>0 and(not a7 or Q>1 or g:Fury()<70)))then if B(E.EyeBeam,nil,nil,not ab(20))then Y=198013;return"eye_beam normal 16"end end;if E.BladeDance:IsReady()and E.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and a1 then if B(E.BladeDance,nil,nil,not ab(8))then Y=188499;return"blade_dance normal 18"end end;if E.Felblade:IsCastable()and not v and h:IsInMeleeRange(15)and(h:IsInRange(8)or not t)and g:FuryDeficit()>=40 and(not ab()or E.VengefulRetreat:TimeSinceLastCast()>=1.0)then if B(E.Felblade,nil,nil,not h:IsSpellInRange(E.Felblade))then Y=183226;return"felblade normal 20"end end;if E.EssenceBreak:IsCastable()and h:IsInMeleeRange(10)and E.VengefulRetreat:TimeSinceLastCast()>1 then if B(E.EssenceBreak,nil,nil,not ab(10))then Y=258860;return"essence_break normal 22"end end;if E.Annihilation:IsReady()and E.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInMeleeRange(8)and((E.DemonBlades:IsAvailable()or not a5 or g:FuryDeficit()<30 or g:BuffRemains(E.MetamorphosisBuff)<5)and not a2)then if B(E.Annihilation,nil,nil,not h:IsSpellInRange(E.Annihilation))then Y=201427;return"annihilation normal 24"end end;if E.ChaosStrike:IsReady()and E.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInMeleeRange(8)and((E.DemonBlades:IsAvailable()or not a5 or g:FuryDeficit()<30)and not a0 and not a2)then if B(E.ChaosStrike,nil,nil,not h:IsSpellInRange(E.ChaosStrike))then Y=162794;return"chaos_strike normal 26"end end;if E.EyeBeam:IsReady()and A and not h:IsCasting(j(355806))and h:IsInMeleeRange(10)and E.VengefulRetreat:TimeSinceLastCast()>=1 and E.BlindFury:IsAvailable()then if B(E.EyeBeam,nil,nil,not h:IsInRange(20))then Y=198013;return"eye_beam normal 28"end end;if E.DemonsBite:IsCastable()and E.VengefulRetreat:TimeSinceLastCast()>1 then if U and(h:DebuffRemains(E.BurningWoundDebuff)<4 or(UnitsWithoutBWCount==0 or not m()))then if B(E.DemonsBite,nil,nil,not h:IsSpellInRange(E.DemonsBite))then Y=162243;return"demons_bite 26T"end end;if V.CastTargetIf(E.DemonsBite,O,"min",aj,al)then return"demons_bite normal 28"end end;if E.DemonsBite:IsCastable()and E.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInMeleeRange(8)and not U then if B(E.DemonsBite,nil,nil,not h:IsSpellInRange(E.DemonsBite))then Y=162243;return"demons_bite normal 30"end end;if E.FelRush:IsCastable()and h:IsInRange(15)and E.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(not E.Momentum:IsAvailable()and E.DemonBlades:IsAvailable()and ad())and x then if B(E.FelRush,nil,nil)then Y=195072;return"fel_rush demonic 34"end end;if E.Felblade:IsCastable()and not v and h:IsInRange(15)and(not ab()and not t)then if B(E.Felblade,nil,nil,not h:IsSpellInRange(E.Felblade))then Y=183226;return"felblade normal 34"end end;if E.FelRush:IsCastable()and h:IsInRange(15)and E.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(not ab()and not E.Momentum:IsAvailable()and ad())and x then if B(E.FelRush,nil,nil)then Y=195072;return"fel_rush demonic 34"end end;if E.VengefulRetreat:IsCastable()and E.EyeBeam:TimeSinceLastCast()>1 and h:IsInRange(5)and y and not t and not ab()then if B(E.VengefulRetreat,nil)then Y=198793;return"vengeful_retreat normal 38"end end;if E.ThrowGlaive:IsCastable()and E.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInRange(30)and E.DemonBlades:IsAvailable()then if B(E.ThrowGlaive,nil,nil,not h:IsSpellInRange(E.ThrowGlaive))then Y=185123;return"throw_glaive normal 40"end end end;local function as()if m()then O=g:GetEnemiesInMeleeRange(8)P=g:GetEnemiesInMeleeRange(20)Q=#O;R=#P else Q=1;R=1 end;UnitsWithoutBWCount=ae(O)q=HeroRotationCharDB.Toggles[6]o=HeroRotationCharDB.Toggles[4]p=HeroRotationCharDB.Toggles[5]r=HeroRotationCharDB.Toggles[12]s=not HeroRotationCharDB.Toggles[15]t=HeroRotationCharDB.Toggles[40]w=HeroRotationCharDB.Toggles[41]u=HeroRotationCharDB.Toggles[42]v=HeroRotationCharDB.Toggles[43]x=W.Havoc.FelRushMode=="All In"or W.Havoc.FelRushMode=="Safe"and E.Felblade:CooldownRemains(BypassRecovery)<=0 or W.Havoc.FelRushMode=="w/ Gap Closer"and(E.Felblade:CooldownRemains(BypassRecovery)<=0 or E.Metamorphosis:CooldownRemains(BypassRecovery)<=0 and z or E.FelRush:Charges()==2 or E.TheHunt:CooldownRemains(BypassRecovery)<=0 and o)y=W.Havoc.VengefulRetreatMode=="All In"or W.Havoc.VengefulRetreatMode=="Safe"and E.Felblade:CooldownRemains(BypassRecovery)<=0 or W.Havoc.VengefulRetreatMode=="w/ Gap Closer"and(E.Felblade:CooldownRemains(BypassRecovery)<=0 or E.Metamorphosis:CooldownRemains(BypassRecovery)<=0 and z or E.FelRush:CooldownRemains(BypassRecovery)<=0 or E.TheHunt:CooldownRemains(BypassRecovery)<=0 and o)z=false;A=false;if W.Havoc.IncludedCooldowns.Metamorphosis and l.CDsON()or W.Havoc.IncludedSmallCooldowns.Metamorphosis and(l.CDsON()or p)or not W.Havoc.IncludedSmallCooldowns.Metamorphosis and not W.Havoc.IncludedCooldowns.Metamorphosis then z=true end;if W.Havoc.IncludedCooldowns.EyeBeam and l.CDsON()or W.Havoc.IncludedSmallCooldowns.EyeBeam and(l.CDsON()or p)or not W.Havoc.IncludedSmallCooldowns.EyeBeam and not W.Havoc.IncludedCooldowns.EyeBeam then A=true end;if not BotOn then Z=0;Y=0 end;if Z>0 then Z=0 end;if Y>0 then Y=0 end;_=false;if g:IsChanneling(E.EyeBeam)then if B(E.Pool)then Y=9999;return"casting EB"end end;if w and E.Imprison:IsUsableP()and E.Imprison:CooldownRemains(BypassRecovery)<=0 and f("mouseover"):GUID()~=nil then if B(E.Imprison,nil,nil,nil)then Z=231;return"queue Imprison MO"end elseif w and E.Imprison:IsUsableP()and E.Imprison:CooldownRemains(BypassRecovery)<=0 and V.TargetIsValid()then if B(E.Imprison,nil,nil,nil)then Y=217832;return"queue Imprison"end elseif(not E.Imprison:IsUsableP()or E.Imprison:CooldownRemains()>0 or not V.TargetIsValid())and w then HeroRotationCharDB.Toggles[41]=not HeroRotationCharDB.Toggles[41]l.Print("Imprison Queue is now "..(HeroRotationCharDB.Toggles[41]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if g:FuryDeficit()>=35 and not g:IsChanneling(E.EyeBeam)or not g:AffectingCombat()then _=true end;if V.TargetIsValid()then if not g:AffectingCombat()and q then local N=ao()if N then return N end end;if not T and not S then a1=E.FirstBlood:IsAvailable()or Q>=3-a8(E.TrailofRuin:IsAvailable())end;if T then a1=g:BuffDown(E.ChaosTheoryBuff)or E.FirstBlood:IsAvailable()and Q>=2-a8(E.TrailofRuin:IsAvailable())or not E.CycleofHatred:IsAvailable()and Q>=4-a8(E.TrailofRuin:IsAvailable())end;if S then a1=E.FirstBlood:IsAvailable()or(g:BuffUp(E.MetamorphosisBuff)or E.TrailofRuin:IsAvailable()or h:DebuffUp(E.EssenceBreakDebuff))and Q>=3-a8(E.TrailofRuin:IsAvailable())or not E.Demonic:IsAvailable()and Q>=4 end;if E.EssenceBreak:IsAvailable()and E.EssenceBreak:CooldownUp()then a1=false end;a0=not E.Demonic:IsAvailable()and(E.Metamorphosis:CooldownRemains()<6 and z)and g:FuryDeficit()>30;a2=a1 and g:Fury()<75-a8(E.FirstBlood:IsAvailable())*20;a3=E.Demonic:IsAvailable()and not E.BlindFury:IsAvailable()and(E.EyeBeam:CooldownRemains()<g:GCD()*2 and A)and g:FuryDeficit()>20;a5=E.Momentum:IsAvailable()and g:BuffDown(E.MomentumBuff)and not t;local N=V.Interrupt(10,E.Disrupt,W.Commons.OffGCDasOffGCD.Disrupt,X)if N then return N end;if n()or o and g:AffectingCombat()then local N=ap()if N then return N end end;if E.Blur:IsCastable()and g:HealthPercentage()<=W.Havoc.BlurHealthThreshold and g:AffectingCombat()then if B(E.Blur,nil)then Y=198589;return"Blur defensives (Danger)"end end;if E.ThrowGlaive:IsCastable()and E.VengefulRetreat:TimeSinceLastCast()>1 and g:AffectingCombat()and(g:BuffStack(E.FelBombardmentBuff)==5 and(g:BuffUp(E.ImmolationAuraBuff)or g:BuffDown(E.MetamorphosisBuff)))then if B(E.ThrowGlaive,nil,nil,not h:IsSpellInRange(E.ThrowGlaive))then Y=185123;return"throw_glaive fel_bombardment"end end;if E.Demonic:IsAvailable()and g:AffectingCombat()then local N=aq()if N then return N end end;if true and g:AffectingCombat()then local N=ar()if N then return N end end end end;local function at()end;function ReturnSpell()if Y==0 then return 0 else return Y end end;function ReturnSpellMO()if Z==0 then return 0 else return Z end end;function ShouldOrb()return _ end;l.SetAPL(577,as,at)