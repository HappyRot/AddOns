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
local o = j.Paladin.Protection;
local p = k.Paladin.Protection;
local q = {}
local r = { { o.HammerofJustice, "Cast Hammer of Justice (Interrupt)", function() return true end } }
local s;
local t;
local u, v;
local w, x;
local y = l.Commons.Everyone;
local z = { General = l.GUISettings.General, Commons = l.GUISettings.APL.Paladin.Commons,
  Protection = l.GUISettings.APL.Paladin.Protection }
local function A(B) return B:DebuffRefreshable(o.JudgmentDebuff) end
;
local function C(B) return B:HealthPercentage() < 20 or g:BuffUp(o.AvengingWrathBuff) end
;
local function D()
  if o.DevotionAura:IsCastable() and g:BuffDown(o.DevotionAuraBuff) then if l.Cast(o.DevotionAura) then return
      "devotion_aura" end end
  ;
  if p.PotionofUnbridledFury:IsReady() and z.Commons.UsePotions then if l.CastRightSuggested(p.PotionofUnbridledFury) then return
      "potion 2" end end
  ;
  if o.Consecration:IsCastable() and h:IsInMeleeRange(8) then if l.Cast(o.Consecration) then return "consecration 4" end end
  ;
  if o.LightsJudgment:IsCastable() then if l.Cast(o.LightsJudgment, nil, nil, not h:IsSpellInRange(o.LightsJudgment)) then return
      "lights_judgment 6" end end
  ;
  if o.AvengersShield:IsCastable() then if l.Cast(o.AvengersShield, nil, nil, not h:IsSpellInRange(o.AvengersShield)) then return
      "avengers_shield 8" end end
  ;
  if o.Judgment:IsReady() then if l.Cast(o.Judgment, nil, nil, not h:IsSpellInRange(o.Judgment)) then return
      "judgment 10" end end
end
;
local function E()
  if g:HealthPercentage() <= 15 and o.LayonHands:IsCastable() then if l.CastRightSuggested(o.LayonHands) then return
      "LOH" end end
  ;
  if o.GuardianofAncientKings:IsCastable() and (g:HealthPercentage() <= z.Protection.GoAKHP and g:BuffDown(o.ArdentDefenderBuff)) then if l.CastRightSuggested(o.GuardianofAncientKings) then return
      "guardian_of_ancient_kings defensive" end end
  ;
  if o.ArdentDefender:IsCastable() and (g:HealthPercentage() <= z.Protection.ArdentDefenderHP and g:BuffDown(o.GuardianofAncientKingsBuff)) then if l.CastRightSuggested(o.ArdentDefender) then return
      "ardent_defender defensive" end end
  ;
  if o.WordofGlory:IsReady() and (g:HealthPercentage() <= z.Protection.WordofGloryHP and not g:HealingAbsorbed()) then if g:BuffRemains(o.ShieldoftheRighteousBuff) >= 5 or g:BuffUp(o.DivinePurposeBuff) or g:BuffUp(o.ShiningLightFreeBuff) then if l.Cast(o.WordofGlory) then return
        "word_of_glory defensive" end else if l.CastAnnotated(o.WordofGlory, false, "KITE") then return
        "word_of_glory defensive" end end end
  ;
  if o.ShieldoftheRighteous:IsReady() and (g:BuffRefreshable(o.ShieldoftheRighteousBuff) and (s or g:HealthPercentage() <= z.Protection.ShieldoftheRighteousHP)) then if l.CastSuggested(o.ShieldoftheRighteous) then return
      "shield_of_the_righteous defensive" end end
end
;
local function F()
  if o.Fireblood:IsCastable() and g:BuffUp(o.AvengingWrathBuff) then if l.Cast(o.Fireblood, z.Commons.OffGCDasOffGCD.Racials) then return
      "fireblood 32" end end
  ;
  if o.Seraphim:IsReady() then if l.Cast(o.Seraphim, z.Protection.GCDasOffGCD.Seraphim) then return "seraphim 34" end end
  ;
  if o.AvengingWrath:IsCastable() then if l.Cast(o.AvengingWrath, z.Protection.GCDasOffGCD.AvengingWrath) then return
      "avenging_wrath 36" end end
  ;
  if o.HolyAvenger:IsCastable() and (g:BuffUp(o.AvengingWrathBuff) or o.AvengingWrath:CooldownRemains() > 60) then if l.Cast(o.HolyAvenger) then return
      "holy_avenger 38" end end
  ;
  if o.AshenHallow:IsReady() then if l.Cast(o.AshenHallow, nil, z.Commons.CovenantDisplayStyle) then return
      "ashen_hallow 84" end end
  ;
  if o.DivineToll:IsReady() then if l.Cast(o.DivineToll, nil, z.Commons.CovenantDisplayStyle, not h:IsSpellInRange(o.DivineToll)) then return
      "divine_toll 80" end end
  ;
  if p.PotionofUnbridledFury:IsReady() and z.Commons.UsePotions and g:BuffUp(o.AvengingWrathBuff) then if l.CastRightSuggested(p.PotionofUnbridledFury) then return
      "potion 40" end end
  ;
  if g:BuffUp(o.SeraphimBuff) or not o.Seraphim:IsAvailable() then
    local G = g:GetUseableTrinkets(q)
    if G then if l.Cast(G, nil, z.Commons.TrinketDisplayStyle) then return "Generic use_items for " .. G:Name() end end
  end
  ;
  if o.MomentofGlory:IsCastable() and (g:PrevGCD(1, o.AvengersShield) and not o.AvengersShield:CooldownUp()) then if l.Cast(o.MomentofGlory, z.Protection.OffGCDasOffGCD.MomentOfGlory) then return
      "moment_of_glory 42" end end
end
;
local function H()
  if o.ShieldoftheRighteous:IsReady() and (h:DebuffUp(o.JudgmentDebuff) and (h:DebuffUp(o.VengefulShockDebuff) or not o.VengefulShock:ConduitEnabled())) then if l.CastSuggested(o.ShieldoftheRighteous) then return
      "shield_of_the_righteous 62" end end
  ;
  if o.ShieldoftheRighteous:IsReady() and (g:HolyPower() == 5 or g:BuffUp(o.HolyAvengerBuff) or g:HolyPower() == 4 and o.SanctifiedWrath:IsAvailable() and g:BuffUp(o.AvengingWrathBuff)) then if l.CastSuggested(o.ShieldoftheRighteous) then return
      "shield_of_the_righteous 64" end end
  ;
  if o.AvengersShield:IsCastable() and #g:GetEnemiesInMeleeRange(8) >= 3 then if l.Cast(o.AvengersShield, nil, nil, not h:IsSpellInRange(o.AvengersShield)) then return
      "avengers_shield 68" end end
  ;
  if o.Judgment:IsReady() and (o.Judgment:Charges() == 2 or not o.CrusadersJudgment:IsAvailable()) then if y.CastCycle(o.Judgment, v, A, not h:IsSpellInRange(o.Judgment)) then return
      "judgment 66" end end
  ;
  if o.AvengersShield:IsCastable() and (h:DebuffDown(o.VengefulShockDebuff) and o.VengefulShock:ConduitEnabled()) then if l.Cast(o.AvengersShield, nil, nil, not h:IsSpellInRange(o.AvengersShield)) then return
      "avengers_shield 68" end end
  ;
  if o.HammerofWrath:IsReady() and o.HammerofWrath:IsUsable() then if y.CastCycle(o.HammerofWrath, v, C, not h:IsSpellInRange(o.HammerofWrath)) then return
      "hammer of wrath" end end
  ;
  if o.AvengersShield:IsCastable() then if l.Cast(o.AvengersShield, nil, nil, not h:IsSpellInRange(o.AvengersShield)) then return
      "avengers_shield 72" end end
  ;
  if o.Judgment:IsReady() then if y.CastCycle(o.Judgment, v, A, not h:IsSpellInRange(o.Judgment)) then return
      "judgment 74" end end
  ;
  if o.Consecration:IsCastable() and g:BuffDown(o.ConsecrationBuff) then if l.Cast(o.Consecration) then return
      "consecration 78" end end
  ;
  if o.VanquishersHammer:IsReady() then if l.Cast(o.VanquishersHammer, nil, z.Commons.CovenantDisplayStyle, not h:IsSpellInRange(o.VanquishersHammer)) then return
      "vanquishers_hammer 76" end end
  ;
  if o.BlessedHammer:IsCastable() and o.BlessedHammer:Charges() == 3 then if l.Cast(o.BlessedHammer, nil, nil, not h:IsInMeleeRange(5)) then return
      "blessed_hammer 82" end end
  ;
  if o.HammeroftheRighteous:IsCastable() and o.HammeroftheRighteous:Charges() == 2 then if l.Cast(o.HammeroftheRighteous, nil, nil, not h:IsInMeleeRange(5)) then return
      "hammer_of_the_righteous 86" end end
  ;
  if o.WordofGlory:IsReady() and g:BuffUp(o.VanquishersHammerBuff) then if l.Cast(o.WordofGlory) then return
      "word_of_glory 88" end end
  ;
  if o.BlessedHammer:IsCastable() then if l.Cast(o.BlessedHammer, nil, nil, not h:IsInMeleeRange(5)) then return
      "blessed_hammer 90" end end
  ;
  if o.HammeroftheRighteous:IsCastable() then if l.Cast(o.HammeroftheRighteous, nil, nil, not h:IsInMeleeRange(5)) then return
      "hammer_of_the_righteous 92" end end
  ;
  if o.LightsJudgment:IsCastable() then if l.Cast(o.LightsJudgment, z.Commons.OffGCDasOffGCD.Racials, nil, not h:IsSpellInRange(o.LightsJudgment)) then return
      "lights_judgment 94" end end
  ;
  if o.ArcaneTorrent:IsCastable() then if l.Cast(o.ArcaneTorrent) then return "arcane_torrent 96" end end
  ;
  if o.Consecration:IsCastable() then if l.Cast(o.Consecration) then return "consecration 98" end end
  ;
  if o.WordofGlory:IsReady() and (g:BuffUp(o.ShiningLightFreeBuff) and not o.VanquishersHammer:IsAvailable()) then if l.CastAnnotated(o.WordofGlory, false, "OTHER") then return
      "word_of_glory 100" end end
end
;
local function I()
  u = g:GetEnemiesInMeleeRange(8)
  v = g:GetEnemiesInRange(30)
  if m() then
    w = #u;
    x = #v
  else
    w = 1;
    x = 1
  end
  ;
  s = g:ActiveMitigationNeeded()
  t = g:IsTankingAoE(8) or g:IsTanking(h)
  if y.TargetIsValid() then
    if not g:AffectingCombat() then
      local J = D()
      if J then return J end
    end
    ;
    local J = y.Interrupt(5, o.Rebuke, z.Commons.OffGCDasOffGCD.Rebuke, r)
    if J then return J end
    ;
    if t then
      local J = E()
      if J then return J end
    end
    ;
    if n() then
      local J = F()
      if J then return J end
    end
    ;
    if true then
      local J = H()
      if J then return J end
    end
    ;
    if l.CastAnnotated(o.Pool, false, "WAIT") then return "Wait/Pool Resources" end
  end
end
;
local function K() l.Print("Protection Paladin rotation is currently a work in progress.") end
;
l.SetAPL(66, I, K)
