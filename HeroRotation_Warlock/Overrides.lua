local a=HeroLib;local b=HeroCache;local c=a.Unit;local d=c.Player;local e=c.Pet;local f=c.Target;local g=a.Spell;local h=a.Item;local i=HeroRotation;local j=g.Warlock.Affliction;local k=g.Warlock.Demonology;local l=g.Warlock.Destruction;local m=math.min;local n=math.max;local o=math.floor;local p={Commons=i.GUISettings.APL.Warlock.Commons}a.AddCoreOverride("Player.SoulShardsP",function()local q=d:SoulShards()if not d:IsCasting()then return q else if d:IsCasting(j.MaleficRapture)or d:IsCasting(j.SeedofCorruption)or d:IsCasting(j.VileTaint)or d:IsCasting(j.SummonPet)then return q-1 else return q end end end,265)local r;r=a.AddCoreOverride("Spell.IsCastable",function(self,s,t,u,v,w)local x=true;if t then local y=v or f;x=y:IsInRange(t,u)end;local z=r(self,s,t,u,v,w)if self==j.SummonPet then return z and not p.Commons.HidePetSummon and d:SoulShardsP()>0 and not d:IsCasting(self)and not(e:IsActive()or d:BuffUp(j.GrimoireofSacrificeBuff))elseif self==j.GrimoireofSacrifice then return z and d:BuffDown(j.GrimoireofSacrificeBuff)else return z end end,265)local A;A=a.AddCoreOverride("Spell.IsReady",function(self,t,u,v,s,w)local x=true;if t then local y=v or f;x=y:IsInRange(t,u)end;local z=A(self,t,u,v,s,w)if self==j.VileTaint or self==j.SoulRot then return z and not d:IsCasting(self)elseif self==j.UnstableAffliction then return z and j.UnstableAfflictionDebuff:AuraActiveCount()==0 and not d:IsCasting(self)elseif self==j.SeedofCorruption or self==j.Haunt then return z and not d:IsCasting(self)and not self:InFlight()else return z end end,265)a.AddCoreOverride("Player.SoulShardsP",function()local q=d:SoulShards()q=o(q)if not d:IsCasting()then return q else if d:IsCasting(k.SummonDemonicTyrant)and k.SoulboundTyrant:IsAvailable()then return m(q+3,5)elseif d:IsCasting(k.Demonbolt)then return m(q+2,5)elseif d:IsCasting(k.ShadowBolt)or d:IsCasting(k.SoulStrike)then return m(q+1,5)elseif d:IsCasting(k.HandofGuldan)then return n(q-3,0)elseif d:IsCasting(k.CallDreadstalkers)then return q-2 elseif d:IsCasting(k.SummonVilefiend)or d:IsCasting(k.SummonPet)or d:IsCasting(k.NetherPortal)then return q-1 else return q end end end,266)local B;B=a.AddCoreOverride("Spell.IsCastable",function(self,s,t,u,v,w)local x=true;if t then local y=v or f;x=y:IsInRange(t,u)end;local z=B(self,s,t,u,v,w)if self==k.SummonPet then return z and not p.Commons.HidePetSummon and not e:IsActive()and d:SoulShardsP()>0 and not d:IsCasting(self)elseif self==k.SummonDemonicTyrant then return z and not d:IsCasting(self)else return z end end,266)local C;C=a.AddCoreOverride("Spell.IsReady",function(self,t,u,v,s,w)local x=true;if t then local y=v or f;x=y:IsInRange(t,u)end;local z=C(self,t,u,v,s,w)if self==k.SummonVilefiend or k.GrimoireFelguard or self==k.NetherPortal or self==k.Soulburn then return z and d:SoulShardsP()>=1 and not d:IsCasting(self)elseif self==k.CallDreadstalkers then return z and(d:SoulShardsP()>=2 or d:BuffUp(k.DemonicCallingBuff))and not d:IsCasting(self)elseif self==k.SummonSoulkeeper then return z and not d:IsCasting(self)elseif self==k.HandofGuldan then return z and d:SoulShardsP()>=1 else return z end end,266)a.AddCoreOverride("Player.SoulShardsP",function()local q=d:SoulShards()if not d:IsCasting()then return q else if d:IsCasting(l.ChaosBolt)then return q-2 elseif d:IsCasting(l.RainofFire)then return q-3 elseif d:IsCasting(l.Incinerate)then return m(q+0.2,5)elseif d:IsCasting(l.Conflagrate)then return m(q+0.5,5)elseif d:IsCasting(l.SoulFire)then return m(q+1,5)else return q end end end,267)local D;D=a.AddCoreOverride("Spell.IsCastable",function(self,s,t,u,v,w)local x=true;if t then local y=v or f;x=y:IsInRange(t,u)end;local z=D(self,s,t,u,v,w)if self==l.SummonPet then return z and not p.Commons.HidePetSummon and d:SoulShardsP()>0 and not d:IsCasting(self)and not(e:IsActive()or d:BuffUp(l.GrimoireofSacrificeBuff))elseif self==l.Immolate or self==l.Cataclysm or self==l.SoulRot or self==l.SummonSoulkeeper then return z and not d:IsCasting(self)else return z end end,267)local E;E=a.AddCoreOverride("Spell.IsReady",function(self,t,u,v,s,w)local x=true;if t then local y=v or f;x=y:IsInRange(t,u)end;local z=E(self,t,u,v,s,w)if self==l.GrimoireofSacrifice then return z and d:BuffDown(l.GrimoireofSacrificeBuff)elseif self==l.ChannelDemonfire then return z and not d:IsCasting(self)else return z end end,267)local F;F=a.AddCoreOverride("Player.AffectingCombat",function(self)return l.Incinerate:InFlight()or d:IsCasting(l.SoulFire)or F(self)end,267)