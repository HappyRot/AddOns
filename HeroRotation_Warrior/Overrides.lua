local a=HeroLib;local b=HeroCache;local c=a.Unit;local d=c.Player;local e=c.Pet;local f=c.Target;local g=a.Spell;local h=a.Item;local i=HeroRotation;local j=g.Warrior.Fury;local k=g.Warrior.Arms;local l=g.Warrior.Protection;local m;m=a.AddCoreOverride("Spell.IsCastable",function(self,n,o,p,q,r)local s=m(self,n,o,p,q,r)if self==k.Charge then return s and(self:Charges()>=1 and(d:AffectingCombat()and not f:IsInRange(8)and f:IsInRange(25)or not d:AffectingCombat()))else return s end end,71)local t;t=a.AddCoreOverride("Spell.IsCastable",function(self,n,o,p,q,r)local s=t(self,n,o,p,q,r)if self==j.Charge then return s and(self:Charges()>=1 and(d:AffectingCombat()and not f:IsInRange(8)and f:IsInRange(25)or not d:AffectingCombat()))else return s end end,72)local u;u=a.AddCoreOverride("Spell.IsReady",function(self,o,p,q,n,r)local s=u(self,o,p,q,n,r)if self==j.Rampage then if d:PrevGCDP(1,j.Bladestorm)then return self:IsCastable()and d:Rage()>=self:Cost()else return s end else return s end end,72)local v;v=a.AddCoreOverride("Spell.IsCastable",function(self,n,o,p,q,r)local s=v(self,n,o,p,q,r)if self==l.Charge then return s and(self:Charges()>=1 and not f:IsInRange(8))elseif self==l.HeroicThrow or self==l.TitanicThrow then return s and not f:IsInRange(8)elseif self==l.Avatar then return s and d:BuffDown(l.AvatarBuff)elseif self==l.Intervene then return s and(d:IsInParty()or d:IsInRaid())else return s end end,73)