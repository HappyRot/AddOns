local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = f.Pet;
local j = d.Spell;
local k = d.Item;
local l = HeroRotation;
local m = l.AoEON;
local n = l.CDsON;
local o = math.floor;
local GetTotemInfo = GetTotemInfo;
local GetTime = GetTime;
local p = j.Paladin.Holy;
local q = k.Paladin.Holy;
local r = "player"
local s = "targettarget"
local t = "target"
local u = "mouseover"
local v = "focustarget"
local w = "focus"
local x = {}
local y = { { p.HammerofJustice, "Cast Hammer of Justice (Interrupt)", function() return true end } }
local z, A;
local B, C;
local D = l.Commons.Everyone;
local E = { General = l.GUISettings.General, Commons = l.GUISettings.APL.Paladin.Commons,
  Holy = l.GUISettings.APL.Paladin.Holy }
local function F(G) return G:DebuffRefreshable(p.JudgmentDebuff) end
;
local function H()
  if d.CombatTime() == 0 then return end
  ;
  local I;
  if UnitIsEnemy("mouseover", "player") then I = "mouseover" elseif UnitIsEnemy("target", "player") then I = "target" end
  ;
  if p.DivineShield:IsCastable() and d.CombatTime() > 0 and not g:DebuffUp(p.Forbearance) and g:HealthPercentage() < 20 and g:TimeToDieX(20) < 3 then if Cast(p.DivineShield, nil, nil) then
      shouldcast = 642;
      return "Self DivineShield"
    end end
  ;
  if p.BlessingofProtection:IsCastable() and d.CombatTime() > 0 and not p.DivineShield:IsCastable() and f(r):HealthPercentage() < 30 and f(r):TimeToDieX(20) < 3 and not f(r):DebuffUp(p.Forbearance) and UnitIsUnit("target", r) then if Cast(p.BlessingofProtection, nil, nil) then
      shouldcast = 1022;
      return "Self BoP"
    end end
  ;
  if p.DivineProtection:IsCastable() and f(r):HealthPercentage() < 60 and f(r):TimeToDieX(20) < 10 then if Cast(p.DivineProtection, nil, nil) then
      shouldcast = 498;
      return "Self Divine Protection"
    end end
  ;
  for J = 0, 40 do
    local K, K, L, M, K, K, K, K, K, N = UnitDebuff("player", J)
    if p.Stoneform:IsCastable() and UnitIsDead("player") ~= true and (M == "Poison" or M == "Curse" or M == "Disease" or M == "Magic" or M == "Bleed") then if Cast(p.Stoneform, nil) then
        shouldcast = 20594;
        return "Stoneform"
      end end
  end
end
;
local function O()
  if p.DevotionAura:IsCastable() and g:BuffDown(p.DevotionAuraBuff) then if l.Cast(p.DevotionAura) then return
      "devotion aura" end end
  ;
  if p.Consecration:IsCastable() and h:IsInMeleeRange(9) then if l.Cast(p.Consecration) then return
      "pre-combat consecrate" end end
  ;
  if p.Judgment:IsReady() then if l.Cast(p.Judgment, nil, nil, not h:IsSpellInRange(p.Judgment)) then return
      "pre-combat judgment" end end
end
;
local function P()
  if p.LayonHands:IsCastable() and g:HealthPercentage() <= 10 then if l.CastRightSuggested(p.LayonHands) then return
      "lay on hands" end end
  ;
  if p.DivineProtection:IsCastable() and g:HealthPercentage() <= 40 then if l.CastRightSuggested(p.DivineProtection) then return
      "divine protection" end end
  ;
  if p.WordofGlory:IsReady() and g:HealthPercentage() <= 60 and not g:HealingAbsorbed() then if l.CastRightSuggested(p.WordofGlory) then return
      "WOG self" end end
end
;
local function Q()
  if p.Seraphim:IsReady() then if l.Cast(p.Seraphim, true) then return "seraphim 35" end end
  ;
  if p.AvengingWrath:IsCastable() then if l.Cast(p.AvengingWrath, true) then return "avenging_wrath 37" end end
  ;
  if p.HolyAvenger:IsCastable() and (g:BuffUp(p.AvengingWrathBuff) or p.AvengingWrath:CooldownRemains() > 61) then if l.Cast(p.HolyAvenger, true) then return
      "holy_avenger 39" end end
  ;
  if g:BuffUp(p.SeraphimBuff) or not p.Seraphim:IsAvailable() then
    local R = g:GetUseableTrinkets(x)
    if R then if l.Cast(R, nil, E.Commons.TrinketDisplayStyle) then return "Generic use_items for " .. R:Name() end end
  end
end
;
local function S()
  for T = 1, 4 do
    local K, U, V, W = GetTotemInfo(T)
    if U == p.Consecration:Name() then return o(V + W - GetTime() + 0.5) or 0 end
  end
  ;
  return 0
end
;
local function X(G) return G:DebuffRefreshable(p.GlimmerofLightDebuff) end
;
local function Y()
  if p.Consecration:IsCastable() and S() <= 0 and h:IsInMeleeRange(9) then if l.Cast(p.Consecration) then return
      "consecrate" end end
  ;
  if g:HolyPower() >= 3 or g:BuffUp(p.DivinePurposeBuff) then if l.CastRightSuggested(p.ShieldoftheRighteous) then return
      "dump" end end
  ;
  if p.HammerofWrath:IsCastable() and p.HammerofWrath:IsUsable() then if l.Cast(p.HammerofWrath) then return "execute" end end
  ;
  if p.Judgment:IsCastable() then if l.Cast(p.Judgment) then return "judgment" end end
  ;
  if p.HolyShock:IsCastable() then if D.CastCycle(p.HolyShock, A, X, not h:IsSpellInRange(p.HolyShock)) then return
      "holy shock" end end
  ;
  if p.CrusaderStrike:IsCastable() and (p.HolyShock:CooldownRemains() > 1.5 + g:GCD() and p.CrusaderStrike:Charges() == 1 and p.CrusaderStrike:CooldownRemains() <= g:GCD()) or p.HolyShock:CooldownRemains() > 0 and p.CrusaderStrike:Charges() == 2 then if l.Cast(p.CrusaderStrike) then return
      "crusader strike" end end
  ;
  if p.Consecration:IsCastable() and S() <= 0 and p.HolyShock:CooldownRemains() > g:GCD() and h:IsInMeleeRange(9) then if l.Cast(p.Consecration) then return
      "consecration application" end end
  ;
  if p.CrusaderStrike:IsCastable() and p.HolyShock:CooldownRemains() > 1.5 + g:GCD() then if l.Cast(p.CrusaderStrike) then return
      "crusader strike" end end
  ;
  if p.Consecration:IsCastable() and p.HolyShock:CooldownRemains() > g:GCD() and h:IsInMeleeRange(9) then if l.Cast(p.Consecration) then return
      "filler consecrate refresh" end end
end
;
local function Z()
  z = g:GetEnemiesInMeleeRange(8)
  A = g:GetEnemiesInRange(30)
  B = #z;
  C = #A;
  if D.TargetIsValid() then
    if not g:AffectingCombat() then
      local _ = O()
      if _ then return _ end
    end
    ;
    local _ = P()
    if _ then return _ end
    ;
    local _ = Q()
    if _ then return _ end
    ;
    local _ = Y()
    if _ then return _ end
    ;
    if l.CastAnnotated(p.Pool, false, "WAIT") then return "Wait/Pool Resources" end
  end
end
;
local function a0()
end
;
l.SetAPL(65, Z, a0)
