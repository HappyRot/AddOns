local a,b=...local wipe=wipe;if not HeroCacheDB then _G.HeroCacheDB={}HeroCacheDB.Enabled=true end;HeroCache=b;b.APLVar={}b.Enemies={ItemAction={},Melee={},Ranged={},Spell={},SpellAction={}}b.GUIDInfo={}b.MiscInfo={}b.SpellInfo={}b.ItemInfo={}b.UnitInfo={}b.Persistent={Equipment={},Player={Class={UnitClass("player")},Spec={}},BookIndex={Pet={},Player={}},SpellLearned={Pet={},Player={}},RangeSpells={RangeIndex={},SpellIDs={},MinRangeSpells={}},Texture={Spell={},Item={},Custom={}},ElvUIPaging={PagingString,PagingStrings={},PagingBars={}},Talents={Rank}}b.HasBeenReset=false;function b.Reset()if not b.HasBeenReset then wipe(b.APLVar)wipe(b.Enemies.ItemAction)wipe(b.Enemies.Melee)wipe(b.Enemies.Ranged)wipe(b.Enemies.Spell)wipe(b.Enemies.SpellAction)wipe(b.GUIDInfo)wipe(b.MiscInfo)wipe(b.SpellInfo)wipe(b.ItemInfo)wipe(b.UnitInfo)b.HasBeenReset=true end end;local c;do local select=select;local function d(e)local f={}for g=1,e do f[g]=string.format("a%d",g)end;return f end;local function h(f,i)local e=#f;local j={}for g=i,e-1 do j[#j+1]='['..f[g]..'] = { 'end;j[#j+1]='['..f[e]..'] = val'for g=i,e-1 do j[#j+1]=' }'end;return table.concat(j)end;local function k(e)if e==1 then return"return function(arg) return cache[arg] end"end;local f=d(e)local l={}for g=1,e-1 do l[g]=string.format("local c%d = c%d[%s] if not c%d then return nil end",g,g-1,f[g],g)end;return string.format([=[
return function(%s)
  local c0 = cache
  %s
  return c%d[%s]
end]=],table.concat(f,','),table.concat(l,'\n  '),e-1,f[#f])end;local function m(e)if e==1 then return"return function(val, arg) cache[arg] = val return val end"end;local f=d(e)local n={}for g=1,e-1 do n[g]=string.format("local c%d = c%d[%s] if not c%d then c%d[%s] = { %s } return val end",g,g-1,f[g],g,g-1,f[g],h(f,g+1))end;return string.format([=[
return function(val, %s)
  local c0 = cache
  %s
  c%d[%s] = val
  return val
end]=],table.concat(f,','),table.concat(n,'\n  '),e-1,f[#f])end;local function o(e)local f=d(e)local n={}for g=1,e-1 do n[g]=string.format("local c%d = c%d[%s] if not c%d then local val = func() c%d[%s] = { %s } return val end",g,g-1,f[g],g,g-1,f[g],h(f,g+1))end;return string.format([=[
return function(func, %s)
  local c0 = cache
  %s
  local val = c%d[%s]
  if val == nil then
    val = func()
    c%d[%s] = val
  end
  return val
end]=],table.concat(f,','),table.concat(n,'\n  '),e-1,f[#f],e-1,f[#f])end;local function p(q)return setmetatable({},{__index=function(r,s)r[s]=loadstring(q(s))return r[s]end})end;local t=p(k)local u=p(m)local v=p(o)c=function(w)local function x(y)local function z(e)local q=y[e]setfenv(q,{['cache']=w})return select(2,pcall(q))end;local A={}for g=1,7 do A[#A+1]=z(g)end;return setmetatable(A,{__index=function(r,s)r[s]=z(s)return r[s]end})end;local B=x(t)local C=x(u)local D=x(v)return{Get=function(...)return B[select('#',...)](...)end,Set=function(...)local e=select('#',...)assert(e>1,"setter expects at least 2 parameters")return C[e-1](select(e,...),...)end,GetSet=function(...)local e=select('#',...)local E=select(e,...)if e>1 and type(E)=='function'then return D[e-1](E,...)else return B[e](...)end end}end end;local F=c(b)function b.Get(...)if HeroCacheDB.Enabled then return F.GetSet(...)else local E=select(select('#',...),...)if type(E)=='function'then return E()else return nil end end end;function b.Set(...)return HeroCacheDB.Enabled and F.Set(...)or select(select('#',...),...)end