local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Pet;local i=f.Target;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=HeroRotation;local n=m.Cast;local o=m.AoEON;local p=m.CDsON;local q=HeroRotationCharDB.Toggles[4]local r=HeroRotationCharDB.Toggles[5]local s=HeroRotationCharDB.Toggles[6]local t=not HeroRotationCharDB.Toggles[15]local u=HeroRotationCharDB.Toggles[12]local v=HeroRotationCharDB.Toggles[60]local w=HeroRotationCharDB.Toggles[90]local UnitPower=UnitPower;local x=Enum.PowerType.Maelstrom;local y=j.Shaman.Elemental;local z=l.Shaman.Elemental;local A={}local B=g:GetEquipment()local C=l(0)local D=l(0)local E,F=GetInventoryItemID("player",13)local G,F=GetInventoryItemID("player",14)local H;local I,J,K,L;local M,N;local O;local P;local Q=0;local R=0;local S=0;local T=m.Commons.Everyone;local U=m.Commons.Shaman;local V={General=m.GUISettings.General,Commons=m.GUISettings.APL.Shaman.Commons,Elemental=m.GUISettings.APL.Shaman.Elemental}local W=g:HasLegendaryEquipped(131)local X=g:HasLegendaryEquipped(134)local Y=g:HasLegendaryEquipped(135)local Z=g:HasLegendaryEquipped(136)local _=g:HasLegendaryEquipped(137)local a0=y.CallOfFlame:ConduitEnabled()local a1=g:HasLegendaryEquipped(246)d:RegisterForEvent(function()W=g:HasLegendaryEquipped(131)X=g:HasLegendaryEquipped(134)Y=g:HasLegendaryEquipped(135)Z=g:HasLegendaryEquipped(136)_=g:HasLegendaryEquipped(137)a0=y.CallOfFlame:ConduitEnabled()end,"PLAYER_EQUIPMENT_CHANGED")d:RegisterForEvent(function()y.PrimordialWave:RegisterInFlightEffect(327162)y.PrimordialWave:RegisterInFlight()y.LavaBurst:RegisterInFlight()end,"LEARNED_SPELL_IN_TAB")y.PrimordialWave:RegisterInFlightEffect(327162)y.PrimordialWave:RegisterInFlight()y.LavaBurst:RegisterInFlight()local function a2(a3)if a3 then return 1 else return 0 end end;local function a4(a3)return a3~=0 end;local a5;local a6;local a7;local a8;local a9;local aa;local ab;local ac;local ad;local ae;local function af()a5=0;a6=0;a7=0;a8=0;a9=0;ac={}aa=nil;ab=nil;local ag=999;local ah=0;if o()then for F,ai in pairs(g:GetEnemiesInRange(40))do if ai:AffectingCombat()or ai:IsDummy()or ai:NPCID()==153285 then a5=a5+1;local aj=ai:DebuffRemains(y.FlameShockDebuff)if aj>0 then a7=a7+1 end;if aj<5 then a8=a8+1 end;if aj<ag then ag=aj;ab=ai end;if aj==0 and ai:Health()>ah then ah=ai:Health()ab=ai end;local ak=ai:GetEnemiesInSplashRange(10)local al={}for F,am in pairs(ak)do local an=false;for F,ao in pairs(al)do if am:GUID()==ao:GUID()then an=true;break end end;if not an then table.insert(al,am)end end;ac[ai]=al;if#al>a6 then a6=#al;aa=ai end;if not ai:TimeToDieIsNotValid()and not ai:IsUserCycleBlacklisted()then a9=math.max(a9,ai:TimeToDie())end end end else a5=1;local aj=i:DebuffRemains(y.FlameShockDebuff)if aj>0 then a7=1 end;if aj<5 then a8=1 end;ab=i;a6=1;aa=i;if not i:TimeToDieIsNotValid()and not i:IsUserCycleBlacklisted()then a9=i:TimeToDie()end end end;local function ap()ad=false;ae=false;local aq=h:IsActive()local ar=h:NPCID()if aq then if ar==77942 then ad=true elseif ar==61029 then ae=true end end end;local function as(at)if at==nil then return nil end;local au=at:IsCastable()and at:IsReady()if at==y.Stormkeeper or at==y.ElementalBlast or at==y.Icefury then local av=not g:IsMoving()or g:BuffUp(y.SpiritwalkersGraceBuff)return au and av and not g:IsCasting(at)elseif at==y.LightningBolt or at==y.ChainLightning then local av=not g:IsMoving()or g:BuffUp(y.StormkeeperBuff)or g:BuffUp(y.SpiritwalkersGraceBuff)return au and av elseif at==y.LavaBurst then local av=not g:IsMoving()or g:BuffUp(y.LavaSurgeBuff)or g:BuffUp(y.SpiritwalkersGraceBuff)local aw=g:BuffUp(y.LavaSurgeBuff)local ax=not g:IsCasting(y.LavaBurst)and y.LavaBurst:Charges()>=1;local ay=g:IsCasting(y.LavaBurst)and y.LavaBurst:Charges()==2;return au and av and(aw or ax or ay)elseif at==y.PrimordialWave then return au and not g:BuffUp(y.PrimordialWaveBuff)and not g:BuffUp(y.LavaSurgeBuff)else return au end end;local function az(aA)return aA:DebuffRemains(y.FlameShockDebuff)end;local function aB(aA)return aA:DebuffDown(y.FlameShockDebuff)end;local function aC(aA)if g:BuffDown(y.PrimordialWaveBuff)and(not ad or N<3 and g:BuffStack(y.WindGustBuff)<20 or y.LeadByExample:SoulbindEnabled())and(N<5 or y.MasterOfTheElements:IsAvailable()or X or y.LeadByExample:SoulbindEnabled())and aA:GUID()==f("mouseover"):GUID()and V.Elemental.TargetSwap=="Mouseover"then Q=1326059;return true elseif g:BuffDown(y.PrimordialWaveBuff)and(not ad or N<3 and g:BuffStack(y.WindGustBuff)<20 or y.LeadByExample:SoulbindEnabled())and(N<5 or y.MasterOfTheElements:IsAvailable()or X or y.LeadByExample:SoulbindEnabled())and V.Elemental.TargetSwap=="AutoSwap"and aA:GUID()~=i:GUID()and not u then Q=999;return true elseif g:BuffDown(y.PrimordialWaveBuff)and(not ad or N<3 and g:BuffStack(y.WindGustBuff)<20 or y.LeadByExample:SoulbindEnabled())and(N<5 or y.MasterOfTheElements:IsAvailable()or X or y.LeadByExample:SoulbindEnabled())and aA:GUID()==i:GUID()then R=326059;return true elseif g:BuffDown(y.PrimordialWaveBuff)and(not ad or N<3 and g:BuffStack(y.WindGustBuff)<20 or y.LeadByExample:SoulbindEnabled())and(N<5 or y.MasterOfTheElements:IsAvailable()or X or y.LeadByExample:SoulbindEnabled())then return true end end;local function aD(aA)if aA:DebuffDown(y.FlameShockDebuff)and(not ad or N<3 and g:BuffStack(y.WindGustBuff)<20)and(N<3 or y.MasterOfTheElements:IsAvailable()or X)and aA:GUID()==f("mouseover"):GUID()and V.Elemental.TargetSwap=="Mouseover"then Q=1188389;return true elseif aA:DebuffDown(y.FlameShockDebuff)and(not ad or N<3 and g:BuffStack(y.WindGustBuff)<20)and(N<3 or y.MasterOfTheElements:IsAvailable()or X)and V.Elemental.TargetSwap=="AutoSwap"and aA:GUID()~=i:GUID()and not u then Q=999;return true elseif aA:DebuffDown(y.FlameShockDebuff)and(not ad or N<3 and g:BuffStack(y.WindGustBuff)<20)and(N<3 or y.MasterOfTheElements:IsAvailable()or X)and aA:GUID()==i:GUID()then R=188389;return true elseif aA:DebuffDown(y.FlameShockDebuff)and(not ad or N<3 and g:BuffStack(y.WindGustBuff)<20)and(N<3 or y.MasterOfTheElements:IsAvailable()or X)then return true end end;local function aE(aA)if(aA:DebuffRefreshable(y.FlameShockDebuff)or aA:DebuffDown(y.FlameShockDebuff))and aA:GUID()==f("mouseover"):GUID()and V.Elemental.TargetSwap=="Mouseover"then Q=1188389;return true elseif(aA:DebuffRefreshable(y.FlameShockDebuff)or aA:DebuffDown(y.FlameShockDebuff))and V.Elemental.TargetSwap=="AutoSwap"and aA:GUID()~=i:GUID()and not u then Q=999;return true elseif(aA:DebuffRefreshable(y.FlameShockDebuff)or aA:DebuffDown(y.FlameShockDebuff))and aA:GUID()==i:GUID()then R=188389;return true elseif aA:DebuffRefreshable(y.FlameShockDebuff)or aA:DebuffDown(y.FlameShockDebuff)then return true end end;local function aF(aA)if(aA:DebuffDown(y.FlameShockDebuff)or aA:DebuffRemains(y.FlameShockDebuff)<=g:GCD()or y.Ascendance:IsAvailable()and aA:DebuffRemains(y.FlameShockDebuff)<y.Ascendance:CooldownRemains()+g:BuffRemains(y.AscendanceBuff)and y.Ascendance:CooldownRemains()<4)and(g:BuffUp(y.LavaSurgeBuff)or not g:BloodlustUp())and aA:GUID()==f("mouseover"):GUID()and V.Elemental.TargetSwap=="Mouseover"then Q=1188389;return true elseif(aA:DebuffDown(y.FlameShockDebuff)or aA:DebuffRemains(y.FlameShockDebuff)<=g:GCD()or y.Ascendance:IsAvailable()and aA:DebuffRemains(y.FlameShockDebuff)<y.Ascendance:CooldownRemains()+g:BuffRemains(y.AscendanceBuff)and y.Ascendance:CooldownRemains()<4)and(g:BuffUp(y.LavaSurgeBuff)or not g:BloodlustUp())and V.Elemental.TargetSwap=="AutoSwap"and aA:GUID()~=i:GUID()and not u then Q=999;return true elseif(aA:DebuffDown(y.FlameShockDebuff)or aA:DebuffRemains(y.FlameShockDebuff)<=g:GCD()or y.Ascendance:IsAvailable()and aA:DebuffRemains(y.FlameShockDebuff)<y.Ascendance:CooldownRemains()+g:BuffRemains(y.AscendanceBuff)and y.Ascendance:CooldownRemains()<4)and(g:BuffUp(y.LavaSurgeBuff)or not g:BloodlustUp())and aA:GUID()==i:GUID()then R=188389;return true elseif(aA:DebuffDown(y.FlameShockDebuff)or aA:DebuffRemains(y.FlameShockDebuff)<=g:GCD()or y.Ascendance:IsAvailable()and aA:DebuffRemains(y.FlameShockDebuff)<y.Ascendance:CooldownRemains()+g:BuffRemains(y.AscendanceBuff)and y.Ascendance:CooldownRemains()<4)and(g:BuffUp(y.LavaSurgeBuff)or not g:BloodlustUp())then return true end end;local function aG(aA)if aA:DebuffRemains(y.FlameShock)>y.LavaBurst:CastTime()and aA:GUID()==f("mouseover"):GUID()and V.Elemental.TargetSwap=="Mouseover"then Q=151505;return true elseif aA:DebuffRemains(y.FlameShock)>y.LavaBurst:CastTime()and V.Elemental.TargetSwap=="AutoSwap"and aA:GUID()~=i:GUID()and not u then Q=999;return true elseif aA:DebuffRemains(y.FlameShock)>y.LavaBurst:CastTime()and aA:GUID()==i:GUID()then R=51505;return true elseif aA:DebuffRemains(y.FlameShock)>y.LavaBurst:CastTime()then return true end end;local function aH()local aI=UnitPower("player",x)if not g:IsCasting()then return aI else if g:IsCasting(y.ElementalBlast)then return aI+30 elseif g:IsCasting(y.Icefury)then return aI+25 elseif g:IsCasting(y.LightningBolt)then return aI+8 elseif g:IsCasting(y.LavaBurst)then return aI+10*(1+a2(g:BuffUp(y.PrimordialWaveBuff))*a7)elseif g:IsCasting(y.ChainLightning)then return aI+4*a5 else return aI end end end;local function aJ()if not y.MasterOfTheElements:IsAvailable()then return false end;local aK=g:BuffUp(y.MasterOfTheElementsBuff)if not g:IsCasting()then return aK else if g:IsCasting(y.LavaBurst)then return true elseif g:IsCasting(y.ElementalBlast)then return false elseif g:IsCasting(y.Icefury)then return false elseif g:IsCasting(y.LightningBolt)then return false elseif g:IsCasting(y.ChainLightning)then return false else return aK end end end;local function aL()if not y.Stormkeeper:IsAvailable()then return false end;local aM=g:BuffUp(y.StormkeeperBuff)if not g:IsCasting()then return aM else if g:IsCasting(y.Stormkeeper)then return true else return aM end end end;local function aN()if not y.Icefury:IsAvailable()then return false end;local aO=g:BuffUp(y.IcefuryBuff)if not g:IsCasting()then return aO else if g:IsCasting(y.Icefury)then return true else return aO end end end;local function aP()if as(y.EarthElemental)and not w and i:IsSpellInRange(y.LightningBolt)and not y.PrimalElementalist:IsAvailable()and p()then if n(y.EarthElemental,nil,nil)then R=198103;return"Precombat Earth Ele"end end;if as(y.Stormkeeper)and i:IsSpellInRange(y.LightningBolt)and y.Stormkeeper:IsAvailable()and r then if n(y.Stormkeeper,nil)then R=191634;return"Precombat Stormkeeper"end end;if as(y.FireElemental)and i:IsSpellInRange(y.ElementalBlast)and not y.StormElemental:IsAvailable()then if n(y.FireElemental,nil,nil)then R=198067;return"Precombat FireElemental"end end;if as(y.ElementalBlast)and i:IsSpellInRange(y.LightningBolt)and y.ElementalBlast:IsAvailable()and N<3 then if n(y.ElementalBlast,nil,nil,not i:IsSpellInRange(y.ElementalBlast))then R=117014;return"Precombat Elemental Blast"end end;if as(y.LavaBurst)and i:IsInRange(40)and not g:IsCasting(y.LavaBurst)and(not y.ElementalBlast:IsAvailable()and M<3 or aL())then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Precombat Lavaburst"end end;if as(y.ChainLightning)and i:IsInRange(40)and not y.ElementalBlast:IsAvailable()and M>=3 and not aL()then if n(y.ChainLightning,nil)then R=188443;return"Precombat ChaimLightning"end end end;local function aQ()if as(y.StormElemental)and i:IsInRange(40)and y.StormElemental:IsAvailable()and p()then if n(y.StormElemental,nil)then R=192249;return"Storm Elemental 1"end end;if as(y.Earthquake)and i:IsInRange(40)and g:BuffUp(y.EchoingShockBuff)then if n(y.Earthquake,nil)then R=61882;return"EQ 1"end end;if as(y.ChainHarvest)and i:IsInRange(40)and q then if n(y.ChainHarvest,nil)then R=320674;return"Chain Harvest 1"end end;if as(y.Stormkeeper)and i:IsInRange(40)and y.Stormkeeper:IsAvailable()and r then if n(y.Stormkeeper,nil)then R=191634;return"AoE Stormkeeper 1"end end;if as(y.FlameShock)and i:IsInRange(40)and(a7<2 and N<=3 and y.PrimordialWave:CooldownRemains()<16 and y.PrimordialWave:IsAvailable()and not ad or a7<1 and N>=4 and not ad and y.MasterOfTheElements:IsAvailable()or X and not ad)and i:DebuffRefreshable(y.FlameShockDebuff)then if n(y.FlameShock,nil)then R=188389;return"Flameshock aoe 1"end end;if as(y.FlameShock)and i:IsInRange(40)and(a7<2 and N<=3 and y.PrimordialWave:CooldownRemains()<16 and y.PrimordialWave:IsAvailable()and not ad or a7<1 and N>=4 and not ad and y.MasterOfTheElements:IsAvailable()or X and not ad)then if T.CastCycle(y.FlameShock,K,aE,not i:IsSpellInRange(y.FlameShock),nil)then return"FlameShock aoe 104"end end;if as(y.FlameShock)and i:IsInRange(40)and i:DebuffDown(y.FlameShockDebuff)and not ad and(y.MasterOfTheElements:IsAvailable()or X)then if n(y.FlameShock,nil)then R=188389;return"Flameshock aoe 2"end end;if as(y.EchoingShock)and i:IsInRange(40)and r and y.EchoingShock:IsAvailable()and aH()>=60 and(Z and g:BuffUp(y.EchoesofGreatSunderingBuff)or not Z)then if n(y.EchoingShock,nil)then R=320125;return"Echoing Shock aoe 2"end end;if as(y.Ascendance)and i:IsInRange(40)and p()and y.Ascendance:IsAvailable()and not ad and(not y.Icefury:IsAvailable()or not aN()and not y.Icefury:CooldownUp(y.Icefury))then if n(y.Ascendance,nil)then R=114050;return"Ascendance aoe 2"end end;if as(y.LiquidMagmaTotem)and i:IsInRange(40)and r and y.LiquidMagmaTotem:IsAvailable()then if n(y.LiquidMagmaTotem,nil)then R=192222;return"LiquidMagmaTotem aoe 2"end end;if as(y.ChainLightning)and i:IsInRange(40)and N<4 and aJ()and aH()<50 then if n(y.ChainLightning,nil)then R=188443;return"ChainLightning aoe 1"end end;if as(y.EarthShock)and i:IsInRange(40)and Z and not g:BuffUp(y.EchoesofGreatSunderingBuff)then if n(y.EarthShock,nil)then R=8042;return"EarthShock aoe 1"end end;if as(y.LavaBurst)and N<4 and not ad and(g:BuffUp(y.LavaSurgeBuff)and not aJ()and y.MasterOfTheElements:IsAvailable())then if T.CastTargetIf(y.LavaBurst,K,"max",az,aG)then return"Lava Burst aoe 108"end;if az(i)and aG(i)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"LavaBurst aoe 1"end end end;if as(y.Earthquake)and i:IsInRange(40)and N>=2 and not Z and(y.MasterOfTheElements:IsAvailable()and aH()>=50 and not aJ())then if n(y.Earthquake,nil)then R=61882;return"EQ aoe 2"end end;if as(y.LavaBurst)and g:BuffUp(y.LavaSurgeBuff)and g:BuffUp(y.PrimordialWaveBuff)then if T.CastTargetIf(y.LavaBurst,K,"max",az,aG)then return"Lava Burst aoe 208"end;if az(i)and aG(i)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"LavaBurst aoe 2"end end end;if as(y.LavaBurst)and N<4 and X and g:BuffUp(y.LavaSurgeBuff)and y.MasterOfTheElements:IsAvailable()and not aJ()and aH()>=50 then if T.CastTargetIf(y.LavaBurst,K,"max",az,aG)then return"Lava Burst aoe 308"end;if az(i)and aG(i)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"LavaBurst aoe 3"end end end;if as(y.LavaBurst)and(N<4 and X and y.MasterOfTheElements:IsAvailable()or y.MasterOfTheElements:IsAvailable()and aH()>=50 and not aJ()and(not Z or g:BuffUp(y.EchoesofGreatSunderingBuff))and not X)then if T.CastTargetIf(y.LavaBurst,K,"max",az,aG)then return"Lava Burst aoe 408"end;if az(i)and aG(i)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"LavaBurst aoe 4"end end end;if as(y.LavaBurst)and(N==4 and X and g:BuffUp(y.LavaSurgeBuff)and y.MasterOfTheElements:IsAvailable()and not aJ()and aH()>=50)then if T.CastTargetIf(y.LavaBurst,K,"max",az,aG)then return"Lava Burst aoe 508"end;if az(i)and aG(i)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"LavaBurst aoe 5"end end end;if as(y.Earthquake)and i:IsInRange(40)and N>=2 then if n(y.Earthquake,nil)then R=61882;return"EQ aoe 3"end end;if as(y.ChainLightning)and i:IsInRange(40)and(aL()or g:BuffRemains(y.StormkeeperBuff)<3*g:GCD()*g:BuffStack(y.StormkeeperBuff))then if n(y.ChainLightning,nil)then R=188443;return"ChainLightning aoe 2"end end;if as(y.LavaBurst)and i:IsInRange(40)and g:BuffUp(y.LavaSurgeBuff)and N<4 and not ad and i:DebuffUp(y.FlameShockDebuff)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst aoe 6"end end;if as(y.ElementalBlast)and i:IsInRange(40)and y.ElementalBlast:IsAvailable()and N<5 and not ad then if n(y.ElementalBlast,nil,nil,not i:IsSpellInRange(y.ElementalBlast))then R=117014;return"Elemental Blast aoe 1"end end;if as(y.LavaBeam)and i:IsInRange(40)and y.Ascendance:IsAvailable()then if n(y.LavaBeam,nil,nil,not i:IsSpellInRange(y.LavaBeam))then R=117014;return"LavaBeam aoe 1"end end;if as(y.ChainLightning)and i:IsInRange(40)then if n(y.ChainLightning,nil)then R=188443;return"ChainLightning aoe 1"end end;if as(y.LavaBurst)and i:IsInRange(40)and g:BuffUp(y.LavaSurgeBuff)and g:IsMoving()then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst aoe 6"end end;if as(y.FlameShock)and i:IsInRange(40)and i:DebuffRefreshable(y.FlameShockDebuff)and g:IsMoving()then if n(y.FlameShock,nil)then R=188389;return"Flameshock aoe 2"end end;if as(y.FlameShock)and g:IsMoving()then if T.CastCycle(y.FlameShock,K,aE,not i:IsSpellInRange(y.FlameShock),nil)then return"FlameShock aoe 204"end end;if as(y.FrostShock)and i:IsInRange(40)and g:IsMoving()then if n(y.FrostShock,nil)then R=196840;return"FrostShock aoe 1"end end end;local function aR()if as(y.LightningBolt)and i:IsInRange(40)and g:BuffRemains(y.StormkeeperBuff)<1.1*g:GCD()*g:BuffStack(y.StormkeeperBuff)then if n(y.LightningBolt,nil)then R=188196;return"LightningBolt st 1"end end;if as(y.FrostShock)and i:IsInRange(40)and y.Icefury:IsAvailable()and aN()and g:BuffRemains(y.IcefuryBuff)<1.1*g:GCD()*g:BuffStack(y.IcefuryBuff)then if n(y.FrostShock,nil)then R=196840;return"FrostShock st 1"end end;if as(y.FlameShock)and i:IsInRange(40)and((i:DebuffDown(y.FlameShockDebuff)or i:DebuffRemains(y.FlameShockDebuff)<=g:GCD()or y.Ascendance:IsAvailable()and i:DebuffRemains(y.FlameShockDebuff)<y.Ascendance:CooldownRemains()+g:BuffRemains(y.AscendanceBuff)and y.Ascendance:CooldownRemains()<4)and(g:BuffUp(y.LavaSurgeBuff)or not g:BloodlustUp()))then if n(y.FlameShock,nil)then R=188389;return"Flameshock st 2"end end;if as(y.FlameShock)and g:IsMoving()then if T.CastCycle(y.FlameShock,K,aF,not i:IsSpellInRange(y.FlameShock),nil)then return"FlameShock st 204"end end;if as(y.FlameShock)and g:BuffUp(y.PrimordialWaveBuff)then if T.CastTargetIf(y.FlameShock,K,"min",az,aE)then return"FlameShock st 204"end;if az(i)and aE(i)then if n(y.FlameShock,nil,nil,not i:IsSpellInRange(y.FlameShock))then R=188389;return"FlameShock st 204"end end end;if as(y.Ascendance)and i:IsInRange(40)and p()and y.Ascendance:IsAvailable()and(g:CombatTime()>=60 or g:BloodlustUp())and y.LavaBurst:CooldownRemains()>0 and(not y.Icefury:IsAvailable()or not aN()and not y.Icefury:CooldownUp())then if n(y.Ascendance,nil)then R=114050;return"Ascendance st 1"end end;if as(y.LavaBurst)and i:IsInRange(40)and g:BuffUp(y.LavaSurgeBuff)and(_ or not aJ()and y.MasterOfTheElements:IsAvailable())then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst st 1"end end;if as(y.ElementalBlast)and i:IsInRange(40)and y.ElementalBlast:IsAvailable()and aH()<70 then if n(y.ElementalBlast,nil,nil,not i:IsSpellInRange(y.ElementalBlast))then R=117014;return"Elemental Blast st 1"end end;if as(y.Stormkeeper)and i:IsInRange(40)and y.Stormkeeper:IsAvailable()and aH()<44 and r then if n(y.Stormkeeper,nil)then R=191634;return"st Stormkeeper 1"end end;if as(y.EchoingShock)and i:IsInRange(40)and r and y.EchoingShock:IsAvailable()and y.LavaBurst:CooldownRemains()<=g:GCD()then if n(y.EchoingShock,nil)then R=320125;return"Echoing Shock st 1"end end;if as(y.LavaBurst)and i:IsInRange(40)and y.EchoingShock:IsAvailable()and g:BuffUp(y.EchoingShockBuff)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst st 2"end end;if as(y.LiquidMagmaTotem)and i:IsInRange(40)and r and y.LiquidMagmaTotem:IsAvailable()then if n(y.LiquidMagmaTotem,nil)then R=192222;return"LiquidMagmaTotem st 2"end end;if as(y.Earthquake)and i:IsInRange(40)and g:BuffUp(y.EchoesofGreatSunderingBuff)and y.MasterOfTheElements:IsAvailable()and aJ()then if n(y.Earthquake,nil)then R=61882;return"EQ st 1"end end;if as(y.LightningBolt)and i:IsInRange(40)and aL()and aJ()and aH()<60 then if n(y.LightningBolt,nil)then R=188196;return"LightningBolt st 1"end end;if as(y.Earthquake)and i:IsInRange(40)and g:BuffUp(y.EchoesofGreatSunderingBuff)and(y.MasterOfTheElements:IsAvailable()or y.LavaBurst:CooldownRemains()>0 and aH()>=92 or N<2 and aL()and y.LavaBurst:CooldownRemains()<=g:GCD()or not y.MasterOfTheElements:IsAvailable()or y.ElementalBlast:CooldownRemains()<=1.1*g:GCD()*2)then if n(y.Earthquake,nil)then R=61882;return"EQ st 2"end end;if as(y.Earthquake)and i:IsInRange(40)and N>1 and not i:DebuffRefreshable(y.FlameShockDebuff)and not Z and(not y.MasterOfTheElements:IsAvailable()or aJ()or y.LavaBurst:CooldownRemains()>0 and aH()>=92)then if n(y.Earthquake,nil)then R=61882;return"EQ st 3"end end;if as(y.LavaBurst)and i:IsInRange(40)and not aJ()and aN()then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst st 3"end end;if as(y.LavaBurst)and i:IsInRange(40)and y.LavaBurst:Charges()>a2(y.EchoOfTheElements:IsAvailable())and not aN()then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst st 4"end end;if as(y.LavaBurst)and i:IsInRange(40)and y.EchoOfTheElements:IsAvailable()and not aJ()and aH()>=50 and g:BuffDown(y.EchoesofGreatSunderingBuff)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst st 5"end end;if as(y.EarthShock)and i:IsInRange(40)and(Z or N<2)and(y.MasterOfTheElements:IsAvailable()and g:BuffDown(y.EchoesofGreatSunderingBuff)and(aJ()or aH()>=92 or N<2 and aL()and y.LavaBurst:CooldownRemains()<=g:GCD())or(not y.MasterOfTheElements:IsAvailable()or y.ElementalBlast:CooldownRemains()<=1.1*g:GCD()*2))then if n(y.EarthShock,nil)then R=8042;return"EarthShock st 1"end end;if as(y.FrostShock)and i:IsInRange(40)and y.Icefury:IsAvailable()and y.MasterOfTheElements:IsAvailable()and aN()and aJ()then if n(y.FrostShock,nil)then R=196840;return"FrostShock st 2"end end;if as(y.LavaBurst)and i:IsInRange(40)and g:BuffUp(y.AscendanceBuff)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst st 6"end end;if as(y.LavaBurst)and i:IsInRange(40)and not y.MasterOfTheElements:IsAvailable()then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst st 7"end end;if as(y.Icefury)and y.Icefury:IsAvailable()and not(aH()>35 and y.LavaBurst:CooldownRemains()<=0)then if n(y.Icefury,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=210714;return"Icefury st 1"end end;if as(y.FrostShock)and i:IsInRange(40)and y.Icefury:IsAvailable()and aN()and(g:BuffRemains(y.IcefuryBuff)<g:GCD()*4*g:BuffStack(y.IcefuryBuff)or aL()or not y.MasterOfTheElements:IsAvailable())then if n(y.FrostShock,nil)then R=196840;return"FrostShock st 3"end end;if as(y.LavaBurst)and i:IsInRange(40)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst st 8"end end;if as(y.FlameShock)and i:IsInRange(40)and i:DebuffRefreshable(y.FlameShockDebuff)then if n(y.FlameShock,nil)then R=188389;return"Flameshock st 4"end end;if as(y.FlameShock)then if T.CastCycle(y.FlameShock,K,aE,not i:IsSpellInRange(y.FlameShock),nil)then return"FlameShock st 304"end end;if as(y.FrostShock)and i:IsInRange(40)and Y and g:BuffDown(y.ElementalEquilibriumBuff)and not y.ElementalBlast:IsAvailable()and not y.EchoingShock:IsAvailable()then if n(y.FrostShock,nil)then R=196840;return"FrostShock st 5"end end;if as(y.ChainHarvest)and i:IsInRange(40)and q then if n(y.ChainHarvest,nil)then R=320674;return"Chain Harvest st 1"end end;if as(y.FrostShock)and i:IsInRange(40)and y.Icefury:IsAvailable()and aN()then if n(y.FrostShock,nil)then R=196840;return"FrostShock st 6"end end;if as(y.StaticDischarge)and y.StaticDischarge:IsAvailable()and r then if n(y.StaticDischarge,nil,nil)then R=342243;return"st StaticDischarge"end end;if as(y.EarthElemental)and p()and not w and(not y.PrimalElementalist:IsAvailable()or not ae)then if n(y.EarthElemental,nil,nil)then R=198103;return"st Earth Ele"end end;if as(y.ChainLightning)and i:IsInRange(40)and N>1 then if n(y.ChainLightning,nil)then R=188443;return"ChainLightning st 1"end end;if as(y.LightningBolt)and i:IsInRange(40)then if n(y.LightningBolt,nil)then R=188196;return"LightningBolt st 2"end end;if as(y.FlameShock)and i:IsInRange(40)and i:DebuffRefreshable(y.FlameShockDebuff)and g:IsMoving()then if n(y.FlameShock,nil)then R=188389;return"Flameshock st 2"end end;if as(y.FlameShock)and g:IsMoving()then if T.CastCycle(y.FlameShock,K,aE,not i:IsSpellInRange(y.FlameShock),nil)then return"FlameShock st 204"end end;if as(y.FrostShock)and i:IsInRange(40)and g:IsMoving()then if n(y.FrostShock,nil)then R=196840;return"FrostShock st 7"end end;if as(y.FrostShock)and i:IsInRange(40)and y.Icefury:IsAvailable()and aN()and g:BuffRemains(y.IcefuryBuff)<1.1*g:GCD()*g:BuffStack(y.IcefuryBuff)then if n(y.FrostShock,nil)then R=196840;return"FrostShock st 7"end end end;local function aS()if as(y.StormElemental)and i:IsInRange(40)and y.StormElemental:IsAvailable()and p()then if n(y.StormElemental,nil)then R=192249;return"Storm Elemental sest 1"end end;if as(y.FrostShock)and i:IsInRange(40)and y.Icefury:IsAvailable()and aN()and g:BuffRemains(y.IcefuryBuff)<1.1*g:GCD()*g:BuffStack(y.IcefuryBuff)and g:BuffStack(y.WindGustBuff)<18 then if n(y.FrostShock,nil)then R=196840;return"FrostShock sest 1"end end;if as(y.ElementalBlast)and i:IsInRange(40)and y.ElementalBlast:IsAvailable()then if n(y.ElementalBlast,nil,nil,not i:IsSpellInRange(y.ElementalBlast))then R=117014;return"Elemental Blast sest 1"end end;if as(y.Stormkeeper)and i:IsInRange(40)and y.Stormkeeper:IsAvailable()and r then if n(y.Stormkeeper,nil)then R=191634;return"sest Stormkeeper 1"end end;if as(y.EchoingShock)and i:IsInRange(40)and r and y.EchoingShock:IsAvailable()and(y.LavaBurst:CooldownRemains()<=g:GCD()and N<2 or aH()>=60 and N>=2 and(not Z or g:BuffUp(y.EchoesofGreatSunderingBuff))or N<2 and g:BuffStack(y.WindGustBuff)>=18 and(not Z or g:BuffUp(y.EchoesofGreatSunderingBuff))and aH()>=60)then if n(y.EchoingShock,nil)then R=320125;return"Echoing Shock sest 2"end end;if as(y.LavaBurst)and i:IsInRange(40)and(g:BuffStack(y.WindGustBuff)<18 and not g:BloodlustUp()or g:BuffUp(y.LavaSurgeBuff))then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst sest 6"end end;if as(y.LavaBurst)and i:IsInRange(40)and y.EchoingShock:IsAvailable()and g:BuffUp(y.EchoingShockBuff)and N<2 then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst sest 6"end end;if as(y.Earthquake)and i:IsInRange(40)and y.EchoingShock:IsAvailable()and g:BuffUp(y.EchoingShockBuff)and N>=2 then if n(y.Earthquake,nil)then R=61882;return"EQ sest 1"end end;if as(y.LightningBolt)and i:IsInRange(40)and aL()then if n(y.LightningBolt,nil)then R=188196;return"LightningBolt sest 1"end end;if as(y.Earthquake)and i:IsInRange(40)and g:BuffUp(y.EchoesofGreatSunderingBuff)then if n(y.Earthquake,nil)then R=61882;return"EQ sest 2"end end;if as(y.EarthShock)and i:IsInRange(40)and N<2 and aH()>=60 and(g:BuffStack(y.WindGustBuff)<20 or aH()>90 or Z and not g:BuffUp(y.EchoesofGreatSunderingBuff))then if n(y.EarthShock,nil)then R=8042;return"EarthShock sest 2"end end;if as(y.Earthquake)and i:IsInRange(40)and N>1 and not i:DebuffRefreshable(y.FlameShockDebuff)then if n(y.Earthquake,nil)then R=61882;return"EQ sest 3"end end;if as(y.ChainLightning)and i:IsInRange(40)and N>1 and ad and g:BloodlustUp()then if n(y.ChainLightning,nil)then R=188443;return"ChainLightning sest 1"end end;if as(y.LightningBolt)and i:IsInRange(40)and ad and g:BloodlustUp()then if n(y.LightningBolt,nil)then R=188196;return"LightningBolt sest 1"end end;if as(y.LavaBurst)and i:IsInRange(40)and g:BuffUp(y.AscendanceBuff)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst sest 6"end end;if as(y.LavaBurst)and i:IsInRange(40)then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst sest 7"end end;if as(y.LavaBurst)and i:IsInRange(40)and y.LavaBurst:SpellCharges()>a2(y.EchoOfTheElements:IsAvailable())then if n(y.LavaBurst,nil,nil,not i:IsSpellInRange(y.LavaBurst))then R=51505;return"Lavaburst sest 8"end end;if as(y.FrostShock)and i:IsInRange(40)and y.Icefury:IsAvailable()and aN()then if n(y.FrostShock,nil)then R=196840;return"FrostShock SEST 1"end end;if as(y.ChainHarvest)and i:IsInRange(40)and q then if n(y.ChainHarvest,nil)then R=320674;return"Chain Harvest SEST 1"end end;if as(y.StaticDischarge)and y.StaticDischarge:IsAvailable()and r then if n(y.StaticDischarge,nil,nil)then R=342243;return"SEST StaticDischarge"end end;if as(y.EarthElemental)and p()and not w and i:IsSpellInRange(y.LightningBolt)and(not y.PrimalElementalist:IsAvailable()or y.PrimalElementalist:IsAvailable()and not ad)then if n(y.EarthElemental,nil,nil)then R=198103;return"sest Earth Ele"end end;if as(y.ChainLightning)and i:IsInRange(40)and N>1 then if n(y.ChainLightning,nil)then R=188443;return"ChainLightning sest 2"end end;if as(y.LightningBolt)and i:IsInRange(40)then if n(y.LightningBolt,nil)then R=188196;return"LightningBolt sest 2"end end;if as(y.FlameShock)and i:IsInRange(40)and i:DebuffRefreshable(y.FlameShockDebuff)and g:IsMoving()then if n(y.FlameShock,nil)then R=188389;return"Flameshock sest 2"end end;if as(y.FlameShock)and g:IsMoving()then if T.CastCycle(y.FlameShock,K,aE,not i:IsSpellInRange(y.FlameShock),nil)then return"FlameShock sest 204"end end;if as(y.FrostShock)and i:IsInRange(40)and g:IsMoving()then if n(y.FrostShock,nil)then R=196840;return"FrostShock aoe 1"end end end;local function aT()s=HeroRotationCharDB.Toggles[6]q=HeroRotationCharDB.Toggles[4]r=HeroRotationCharDB.Toggles[5]u=HeroRotationCharDB.Toggles[12]t=not HeroRotationCharDB.Toggles[15]v=HeroRotationCharDB.Toggles[60]p=m.CDsON;w=HeroRotationCharDB.Toggles[90]end;local function aU()I=g:GetEnemiesInMeleeRange(8)J=g:GetEnemiesInRange(30)K=g:GetEnemiesInRange(40)L=i:GetEnemiesInSplashRange(15)E,F=GetInventoryItemID("player",13)G,F=GetInventoryItemID("player",14)if o()and V.Commons.AoeMode=="Conservative"then M=i:GetEnemiesInSplashRangeCount(8)N=i:GetEnemiesInSplashRangeCount(15)elseif o()and V.Commons.AoeMode=="Aggresive"then local aV=0;for aW=1,20 do local aX="nameplate"..aW;if UnitExists(aX)then if UnitCanAttack("player",aX)then if UnitCanAttack("player",aX)and UnitAffectingCombat("target")and IsItemInRange(32698,aX)and UnitDetailedThreatSituation("player",aX)~=nil or f(aX):IsDummy()or string.find(UnitGUID(aX),153285)or string.find(UnitGUID(aX),31146)or string.find(UnitGUID(aX),176581)or string.find(UnitGUID(aX),179124)or string.find(UnitGUID(aX),179010)or string.find(UnitGUID(aX),180323)or string.find(UnitGUID(aX),179010)or string.find(UnitGUID(aX),179942)or string.find(UnitGUID(aX),176521)or string.find(UnitGUID(aX),177594)or string.find(UnitGUID(aX),177117)or string.find(UnitGUID(aX),176581)or string.find(UnitGUID(aX),180840)or string.find(UnitGUID(aX),176605)or UnitName(aX)=="Glacial Spike"or string.find(UnitGUID(aX),180473)or string.find(UnitGUID(aX),180474)or string.find(UnitGUID(aX),176929)or string.find(UnitGUID(aX),176920)or string.find(UnitGUID(aX),177154)or string.find(UnitGUID(aX),177787)or string.find(UnitGUID(aX),177889)or string.find(UnitGUID(aX),177891)or string.find(UnitGUID(aX),177892)or string.find(UnitGUID(aX),168326)then aV=aV+1 end end end end;M=aV;N=aV end;if not o()then M=1;N=1 end;if v then N=10;M=10 end;af()ap()if not BotOn then Q=0;R=0 end;if Q>0 then Q=0 end;if R>0 then R=0 end;H=aT()if m.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then starttime=GetTime()endtime=starttime+m.GUISettings.General.OpenerReset elseif m.GUISettings.General.OpenerReset>0 and endtime~=nil and GetTime()>endtime and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]m.ToggleIconFrame:UpdateButtonText(6)m.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if V.Elemental.PreferEarthShield and y.EarthShield:IsCastable()and(g:BuffDown(y.EarthShield)or not g:AffectingCombat()and g:BuffStack(y.EarthShield)<5)then if n(y.EarthShield,nil)then R=974;return"Earth Shield Refresh"end elseif y.LightningShield:IsCastable()and g:BuffDown(y.LightningShield)and(V.Elemental.PreferEarthShield and g:BuffDown(y.EarthShield)or not V.Elemental.PreferEarthShield)then if n(y.LightningShield,nil)then R=192106;return"Lightning Shield Refresh"end end;if g:IsChanneling()or g:IsChanneling(y.FaeTransfusion)then if n(y.Pool,nil)then R=99999;return"Trinket Channel"end end;if not g:AffectingCombat()and T.TargetIsValid()and s then local H=aP()if H then return H end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if y.FrostShock:IsCastable()then if n(y.FrostShock,nil)then Q=1196840;return"explosive MO FS"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)then if y.FrostShock:IsCastable()then if n(y.FrostShock,nil)then R=196840;return"explosive  FS"end end end;if T.TargetIsValid()and g:AffectingCombat()and(i:AffectingCombat()or i:IsDummy()or i:NPCID()==153285 or i:NPCID()==168326 or i:NPCID()==176581 or i:NPCID()==176920)and not g:IsDeadOrGhost()then if ad and y.EyeOfTheStorm:CooldownRemains()<=0 and h:BuffUp(y.CallLightningBuff)then if n(y.EyeOfTheStorm,nil)then R=157375;return"EyeOfTheStorm  Pet"end end;if ae and y.Meteor:CooldownRemains()<=0 then if n(y.Meteor,nil)then R=117588;return"Meteor  Pet"end end;if z.PotionofSpectralIntellect:IsReady()and V.Commons.Enabled.Potions then if n(z.PotionofSpectralIntellect,nil,nil)then R=50;return"potion main 16"end end;if(V.Commons.Enabled.TopTrinket or V.Commons.Enabled.BottomTrinket)and p()then local aY=g:GetUseableTrinkets(A)if aY then if n(aY,nil,nil)then if aY:ID()==E and V.Commons.Enabled.TopTrinket then R=24;return"top trinket 1"elseif aY:ID()==G and V.Commons.Enabled.BottomTrinket then R=30;return"Bot trinket 2"end end end end;if as(y.FlameShock)and i:IsInRange(40)and not y.ElementalBlast:IsAvailable()and i:DebuffDown(y.FlameShockDebuff)and not ad and(N<3 or y.MasterOfTheElements:IsAvailable()or X)then if n(y.FlameShock,nil)then R=188389;return"Flameshock 1"end end;if as(y.PrimordialWave)and q then if T.CastTargetIf(y.PrimordialWave,K,"min",az,aC)then return"Primo Wave 108"end;if az(i)and aC(i)then if n(y.PrimordialWave,nil,nil,not i:IsSpellInRange(y.PrimordialWave))then R=326059;return"PrimordialWave 108"end end end;if as(y.FlameShock)then if T.CastTargetIf(y.FlameShock,K,"min",az,aD)then return"Flame Shock 108"end;if az(i)and aD(i)then if n(y.FlameShock,nil,nil,not i:IsSpellInRange(y.FlameShock))then R=188389;return"FlameShock 108"end end end;if as(y.FireElemental)and p()and not y.StormElemental:IsAvailable()then if n(y.FireElemental,nil)then R=198067;return"Fire Elemental 1"end end;if p()then if y.BloodFury:IsCastable()and p()and i:IsInRange(8)and(not y.Ascendance:IsAvailable()or g:BuffUp(y.Ascendance)or y.Ascendance:CooldownRemains()>50)then if m.Cast(y.BloodFury,nil)then R=20572;return"Blood Fury 420"end end;if y.Berserking:IsCastable()and p()and i:IsInRange(8)and(not y.Ascendance:IsAvailable()or g:BuffUp(y.Ascendance))then if m.Cast(y.Berserking,nil)then R=26297;return"Berserking 422"end end;if y.Fireblood:IsCastable()and p()and i:IsInRange(8)and(not y.Ascendance:IsAvailable()or g:BuffUp(y.Ascendance)or y.Ascendance:CooldownRemains()>50)then if m.Cast(y.Fireblood,nil)then R=265221;return"Fireblood 426"end end;if y.AncestralCall:IsCastable()and p()and i:IsInRange(8)and(not y.Ascendance:IsAvailable()or g:BuffUp(y.Ascendance)or y.Ascendance:CooldownRemains()>50)then if m.Cast(y.AncestralCall,nil)then R=274738;return"Ancestral Call 428"end end;if y.BagofTricks:IsCastable()and p()and i:IsInRange(8)and(not y.Ascendance:IsAvailable()or g:BuffUp(y.Ascendance))then if m.Cast(y.BagofTricks,nil,nil,not i:IsInRange(40))then R=312411;return"Bag of Tricks 430"end end end;if as(y.VesperTotem)and q and i:IsInRange(40)and y.VesperTotem:IsAvailable()then if n(y.VesperTotem,nil)then R=324386;return"VesperTotem 1"end end;if as(y.FaeTransfusion)and q and y.FaeTransfusion:IsAvailable()and not a1 and(not y.MasterOfTheElements:IsAvailable()or aJ())and N<3 then if n(y.FaeTransfusion,nil)then R=328923;return"FaeTransfusion 1"end end;if as(y.FaeTransfusion)and q and y.FaeTransfusion:IsAvailable()and a1 and(not y.MasterOfTheElements:IsAvailable()or aJ()or N>=3)and(y.FireElemental:CooldownRemains()>20 and not y.StormElemental:IsAvailable()or y.StormElemental:CooldownRemains()>20 and y.StormElemental:IsAvailable())then if n(y.FaeTransfusion,nil)then R=328923;return"FaeTransfusion 1"end end;if N>2 then local H=aQ()if H then return H end end;if not y.StormElemental:IsAvailable()and N<=2 then local H=aR()if H then return H end end;if y.StormElemental:IsAvailable()and N<=2 then local H=aS()if H then return H end end;m.CastAnnotated(y.Pool,false,"ERR")end end;local function aZ()end;function ReturnSpell1()if R==0 then return 0 else return R end end;function ReturnSpellMO1()if Q==0 then return 0 else return Q end end;m.SetAPL(262,aU,aZ)