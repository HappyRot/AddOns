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
local o = l.Cast;
local p = l.Commons.Everyone.num;
local q = l.Commons.Everyone.bool;
local r = math.min;
local s;
local t;
local u = l.Commons.Everyone;
local v = l.Commons.Paladin;
local w = { General = l.GUISettings.General, Commons = l.GUISettings.APL.Paladin.Commons,
  Retribution = l.GUISettings.APL.Paladin.Retribution }
local x = j.Paladin.Retribution;
local y = k.Paladin.Retribution;
local z = { y.AlgetharPuzzleBox:ID() }
local A;
local B;
local C;
local D = 11111;
local E = 11111;
local F;
local G;
local H = x.FinalVerdict:IsLearned() and x.FinalVerdict or x.TemplarsVerdict;
d:RegisterForEvent(function()
  D = 11111;
  E = 11111
end, "PLAYER_REGEN_ENABLED")
d:RegisterForEvent(function() H = x.FinalVerdict:IsAvailable() and x.FinalVerdict or x.TemplarsVerdict end,
  "PLAYER_TALENT_UPDATE")
local I = { { x.HammerofJustice, "Cast Hammer of Justice (Interrupt)", function() return true end } }
local function J()
  local K = g:GCDRemains()
  local L = r(x.CrusaderStrike:CooldownRemains(), x.BladeofJustice:CooldownRemains(), x.Judgment:CooldownRemains(),
    x.HammerofWrath:IsUsable() and x.HammerofWrath:CooldownRemains() or 10, x.WakeofAshes:CooldownRemains())
  if K > L then return K end
  ;
  return L
end
;
local function M() return g:BuffDown(x.RetributionAura) and g:BuffDown(x.DevotionAura) and
      g:BuffDown(x.ConcentrationAura) and g:BuffDown(x.CrusaderAura) end
;
local function N()
  if x.RetributionAura:IsCastable() and M() then if o(x.RetributionAura) then
      s = 183435;
      return "retribution_aura precombat 2"
    end end
  ;
  if x.ArcaneTorrent:IsCastable() and h:IsInRange(8) and (x.FinalReckoning:IsAvailable() and x.Seraphim:IsAvailable()) then if o(x.ArcaneTorrent, nil) then
      s = 50613;
      return "arcane_torrent precombat 4"
    end end
  ;
  if x.ShieldofVengeance:IsCastable() then if o(x.ShieldofVengeance, nil) then
      s = 184662;
      return "shield_of_vengeance precombat 6"
    end end
  ;
  if g:HolyPower() >= 4 and h:IsInMeleeRange(5) then
    if x.DivineStorm:IsReady() and C >= 2 then if o(x.DivineStorm) then
        s = 53385;
        return "divine_storm precombat 8"
      end end
    ;
    if H:IsReady() and C < 2 and h:IsInMeleeRange(5) then if o(H) then
        s = 000000;
        return "either verdict precombat 10"
      end end
  end
  ;
  if x.BladeofJustice:IsCastable() then if o(x.BladeofJustice, nil, nil, not h:IsSpellInRange(x.BladeofJustice)) then
      s = 184575;
      return "blade_of_justice precombat 12"
    end end
  ;
  if x.HammerofWrath:IsReady() then if o(x.HammerofWrath, nil, nil, not h:IsSpellInRange(x.HammerofWrath)) then
      s = 24275;
      return "hammer_of_wrath precombat 14"
    end end
  ;
  if x.Judgment:IsCastable() then if o(x.Judgment, nil, nil, not h:IsSpellInRange(x.Judgment)) then
      s = 20271;
      return "judgment precombat 16"
    end end
  ;
  if x.CrusaderStrike:IsCastable() then if o(x.CrusaderStrike, nil, nil, not h:IsInMeleeRange(5)) then
      s = 35395;
      return "crusader_strike 18"
    end end
end
;
local function O()
  if w.Commons.Enabled.Potions and (g:BuffUp(x.AvengingWrathBuff) or g:BuffUp(x.CrusadeBuff) and g:BuffStack(x.CrusadeBuff) == 10 or E < 25) then
    local P = u.PotionSelected()
    if P and P:IsReady() then if o(P, nil) then
        s = 000000;
        return "potion cooldowns 2"
      end end
  end
  ;
  if x.LightsJudgment:IsCastable() then if o(x.LightsJudgment, nil, nil, not h:IsInRange(40)) then
      s = 255647;
      return "lights_judgment cooldowns 4"
    end end
  ;
  if x.Fireblood:IsCastable() and ((g:BuffUp(x.AvengingWrathBuff) or g:BuffUp(x.Crusade) and g:BuffStack(x.Crusade) == 10) and not x.ExecutionSentence:IsAvailable()) then if o(x.Fireblood, nil) then
      s = 265221;
      return "fireblood cooldowns 6"
    end end
  ;
  if w.Commons.Enabled.Trinkets then
    local Q = g:GetUseableTrinkets(z)
    if Q then if o(Q, nil) then
        s = 250;
        return "Generic use_items for " .. Q:Name()
      end end
  end
  ;
  if x.ShieldofVengeance:IsCastable() and ((not x.ExecutionSentence:IsAvailable() or x.ExecutionSentence:CooldownRemains() < 52) and E > 15) then if o(x.ShieldofVengeance, nil) then
      s = 184662;
      return "shield_of_vengeance cooldowns 10"
    end end
  ;
  if x.AvengingWrath:IsCastable() and ((g:HolyPower() >= 4 and d.CombatTime() < 5 or g:HolyPower() >= 3 and d.CombatTime() > 5 or x.HolyAvenger:IsAvailable() and x.HolyAvenger:CooldownUp()) and (not x.Seraphim:IsAvailable() or not x.FinalReckoning:IsAvailable() or x.Seraphim:CooldownDown())) then if o(x.AvengingWrath, nil) then
      s = 31884;
      return "avenging_wrath cooldowns 12"
    end end
  ;
  if x.Crusade:IsCastable() and (g:HolyPower() >= 4 and d.CombatTime() < 5 or g:HolyPower() >= 3 and d.CombatTime() >= 5) then if o(x.Crusade, nil) then
      s = 231895;
      return "crusade cooldowns 14"
    end end
  ;
  if x.HolyAvenger:IsCastable() and (F <= g:GCDRemains() and g:HolyPower() <= 2 and (g:BuffUp(x.AvengingWrath) or x.Crusade:IsAvailable() and (x.Crusade:CooldownUp() or g:BuffUp(x.CrusadeBuff)) or E < 20)) then if o(x.HolyAvenger) then
      s = 105809;
      return "holy_avenger cooldowns 16"
    end end
  ;
  if x.FinalReckoning:IsCastable() and ((g:HolyPower() >= 4 and d.CombatTime() < 8 or g:HolyPower() >= 3 and d.CombatTime() >= 8) and (x.AvengingWrath:CooldownRemains() > g:GCD() or x.Crusade:CooldownDown() and (g:BuffDown(x.CrusadeBuff) or g:BuffStack(x.CrusadeBuff) >= 10)) and (F > 0 or g:HolyPower() == 5) and (not x.Seraphim:IsAvailable() or g:BuffUp(x.Seraphim)) and (g:BuffDown(x.AvengingWrathBuff) or g:HolyPower() == 5 or x.HammerofWrath:CooldownDown())) then if o(x.FinalReckoning) then
      s = 343721;
      return "final_reckoning cooldowns 18"
    end end
end
;
local function R()
  G = C >= 2 and m() or
      g:BuffUp(x.EmpyreanPowerBuff) and h:DebuffDown(x.JudgmentDebuff) and g:BuffDown(x.DivinePurposeBuff) or
      g:BuffUp(x.CrusadeBuff) and g:BuffStack(x.CrusadeBuff) < 10 and g:BuffUp(x.EmpyreanLegacyBuff) and
      not x.JusticarsVengeance:IsAvailable()
  if x.Seraphim:IsReady() and ((x.AvengingWrath:CooldownRemains() > 15 or x.Crusade:CooldownRemains() > 15) and not x.FinalReckoning:IsAvailable() and (not x.ExecutionSentence:IsAvailable() or C >= 5) or E < 15 and E > 5 or g:BuffUp(x.CrusadeBuff) and g:BuffStack(x.CrusadeBuff) < 10) then if o(x.Seraphim, nil) then
      s = 152262;
      return "seraphim finishers 2"
    end end
  ;
  if x.ExecutionSentence:IsReady() and ((g:BuffDown(x.CrusadeBuff) and x.Crusade:CooldownRemains() > 10 or g:BuffStack(x.CrusadeBuff) >= 3 or x.AvengingWrath:CooldownRemains() > 10) and (not x.FinalReckoning:IsAvailable() or x.FinalReckoning:CooldownRemains() > 10) and h:TimeToDie() > 8 and (C < 5 or x.ExecutionersWrath:IsAvailable())) then if o(x.ExecutionSentence, w.Retribution.GCDasOffGCD.ExecutionSentence, nil, not h:IsSpellInRange(x.ExecutionSentence)) then
      s = 343527;
      return "execution_sentence finishers 4"
    end end
  ;
  if x.RadiantDecree:IsReady() and ((g:BuffDown(x.CrusadeBuff) and x.Crusade:CooldownRemains() > 5 or g:BuffStack(x.CrusadeBuff) >= 3 or x.AvengingWrath:CooldownRemains() > 5) and (not x.FinalReckoning:IsAvailable() or x.FinalReckoning:CooldownRemains() > 5)) then if o(x.RadiantDecree, nil, nil, not h:IsInMeleeRange(12)) then
      s = 383469;
      return "radiant_decree finishers 6"
    end end
  ;
  if x.DivineStorm:IsReady() and (G and (g:BuffDown(x.EmpyreanLegacyBuff) or g:BuffUp(x.CrusadeBuff) and g:BuffStack(x.CrusadeBuff) < 10) and ((not x.Crusade:IsAvailable() or x.Crusade:CooldownRemains() > g:GCD() * 3) and (not x.ExecutionSentence or x.ExecutionSentence:CooldownRemains() > g:GCD() * 6 or x.ExecutionSentence:CooldownRemains() > g:GCD() * 4 and g:HolyPower() >= 4 or h:TimeToDie() < 8 or C >= 5 or not x.Seraphim:IsAvailable() and x.ExecutionSentence:CooldownRemains() > g:GCD() * 2) and (not x.FinalReckoning:IsAvailable() or x.FinalReckoning:CooldownRemains() > g:GCD() * 6 or x.FinalReckoning:CooldownRemains() > g:GCD() * 4 and g:HolyPower() >= 4 or not x.Seraphim:IsAvailable() and x.FinalReckoning:CooldownRemains() > g:GCD() * 2) or x.HolyAvenger:IsAvailable() and x.HolyAvenger:CooldownRemains() < g:GCD() * 3 or g:BuffUp(x.HolyAvenger) or g:BuffUp(x.CrusadeBuff) and g:BuffStack(x.CrusadeBuff) < 10)) then if o(x.DivineStorm, nil, nil, not h:IsInRange(8)) then
      s = 53385;
      return "divine_storm finishers 8"
    end end
  ;
  if x.JusticarsVengeance:IsReady() and (((not x.Crusade:IsAvailable() or x.Crusade:CooldownRemains() > g:GCD() * 3) and (not x.ExecutionSentence:IsAvailable() or x.ExecutionSentence:CooldownRemains() > g:GCD() * 6 or x.ExecutionSentence:CooldownRemains() > g:GCD() * 4 and g:HolyPower() >= 4 or h:TimeToDie() < 8 or not x.Seraphim:IsAvailable() and x.ExecutionSentence:CooldownRemains() > g:GCD() * 2) and (not x.FinalReckoning:IsAvailable() or x.FinalReckoning:CooldownRemains() > g:GCD() * 6 or x.FinalReckoning:CooldownRemains() > g:GCD() * 4 and g:HolyPower() >= 4 or not x.Seraphim:IsAvailable() and x.FinalReckoning:CooldownRemains() > g:GCD() * 2) or x.HolyAvenger:IsAvailable() and x.HolyAvenger:CooldownRemains() < g:GCD() * 3 or g:BuffUp(x.HolyAvenger) or g:BuffUp(x.CrusadeBuff) and g:BuffStack(x.CrusadeBuff) < 10) and g:BuffDown(x.EmpyreanLegacyBuff)) then if o(x.JusticarsVengeance, nil, nil, not h:IsInMeleeRange(5)) then
      s = 215661;
      return "justicars_vengeance finishers 10"
    end end
  ;
  if H:IsReady() and ((not x.Crusade:IsAvailable() or x.Crusade:CooldownRemains() > g:GCD() * 3) and (not x.ExecutionSentence:IsAvailable() or x.ExecutionSentence:CooldownRemains() > g:GCD() * 6 or x.ExecutionSentence:CooldownRemains() > g:GCD() * 4 and g:HolyPower() >= 4 or h:TimeToDie() < 8 or not x.Seraphim:IsAvailable() and x.ExecutionSentence:CooldownRemains() > g:GCD() * 2) and (not x.FinalReckoning:IsAvailable() or x.FinalReckoning:CooldownRemains() > g:GCD() * 6 or x.FinalReckoning:CooldownRemains() > g:GCD() * 4 and g:HolyPower() >= 4 or not x.Seraphim:IsAvailable() and x.FinalReckoning:CooldownRemains() > g:GCD() * 2) or x.HolyAvenger:IsAvailable() and x.HolyAvenger:CooldownRemains() < g:GCD() * 3 or g:BuffUp(x.HolyAvenger) or g:BuffUp(x.CrusadeBuff) and g:BuffStack(x.CrusadeBuff) < 10) then if o(H, nil, nil, not h:IsInMeleeRange(5)) then
      s = 000000;
      return "either verdict finishers 12"
    end end
end
;
local function S()
  if g:HolyPower() >= 5 or (h:DebuffUp(x.JudgmentDebuff) or g:HolyPower() == 4) and g:BuffUp(x.DivineResonanceBuff) or g:BuffUp(x.HolyAvenger) then
    local T = R()
    if T then return T end
  end
  ;
  if x.HammerofWrath:IsReady() and x.ZealotsParagon:IsAvailable() then if o(x.HammerofWrath, nil, nil, not h:IsSpellInRange(x.HammerofWrath)) then
      s = 24275;
      return "hammer_of_wrath generators 2"
    end end
  ;
  if x.WakeofAshes:IsCastable() and (g:HolyPower() <= 2 and x.AshestoDust:IsAvailable() and (x.AvengingWrath:CooldownDown() or x.Crusade:CooldownDown())) then if o(x.WakeofAshes, nil, nil, not h:IsInRange(12)) then
      s = 255937;
      return "wake_of_ashes generators 4"
    end end
  ;
  if x.DivineToll:IsCastable() and (g:HolyPower() <= 2 and h:DebuffDown(x.JudgmentDebuff) and (not x.Seraphim:IsAvailable() or g:BuffUp(x.SeraphimBuff)) and not x.FinalReckoning:IsAvailable() and (not x.ExecutionSentence or E < 8 or C >= 5) and (x.AvengingWrath:CooldownRemains() > 15 or x.Crusade:CooldownRemains() > 15 or E < 8)) then if o(x.DivineToll, nil, nil, not h:IsInRange(30)) then
      s = 375576;
      return "divine_toll generators 6"
    end end
  ;
  if x.Judgment:IsCastable() and (h:DebuffDown(x.JudgmentDebuff) and g:HolyPower() >= 2) then if o(x.Judgment, nil, nil, not h:IsSpellInRange(x.Judgment)) then
      s = 20271;
      return "judgment generators 8"
    end end
  ;
  if x.WakeofAshes:IsCastable() and ((g:HolyPower() == 0 or g:HolyPower() <= 2 and x.BladeofJustice:CooldownRemains() > g:GCD() * 2) and (not x.Seraphim:IsAvailable() or x.Seraphim:CooldownRemains() > 5) and (not x.ExecutionSentence:IsAvailable() or x.ExecutionSentence:CooldownRemains() > 15 or h:TimeToDie() < 8 or C >= 5) and (not x.FinalReckoning:IsAvailable() or x.FinalReckoning:CooldownRemains() > 15 or E < 8) and (x.AvengingWrath:CooldownDown() or x.Crusade:CooldownDown())) then if o(x.WakeofAshes, nil, nil, not h:IsInRange(12)) then
      s = 255937;
      return "wake_of_ashes generators 10"
    end end
  ;
  if g:HolyPower() >= 3 and g:BuffUp(x.CrusadeBuff) and g:BuffStack(x.CrusadeBuff) < 10 then
    local T = R()
    if T then return T end
  end
  ;
  if x.Exorcism:IsCastable() then if o(x.Exorcism, nil, nil, not h:IsSpellInRange(x.Exorcism)) then
      s = 383185;
      return "exorcism generators 12"
    end end
  ;
  if x.Judgment:IsCastable() and h:DebuffDown(x.JudgmentDebuff) then if o(x.Judgment, nil, nil, not h:IsSpellInRange(x.Judgment)) then
      s = 20271;
      return "judgment generators 14"
    end end
  ;
  if x.HammerofWrath:IsReady() then if o(x.HammerofWrath, nil, nil, not h:IsSpellInRange(x.HammerofWrath)) then
      s = 24275;
      return "hammer_of_wrath generators 16"
    end end
  ;
  if x.BladeofJustice:IsCastable() and g:HolyPower() <= 3 then if o(x.BladeofJustice, nil, nil, not h:IsSpellInRange(x.BladeofJustice)) then
      s = 184575;
      return "blade_of_justice generators 18"
    end end
  ;
  if h:HealthPercentage() <= 20 or g:BuffUp(x.AvengingWrathBuff) or g:BuffUp(x.CrusadeBuff) or g:BuffUp(x.EmpyreanPowerBuff) then
    local T = R()
    if T then return T end
  end
  ;
  if x.Consecration:IsCastable() and (h:DebuffDown(x.ConsecrationDebuff) and C >= 2) then if o(x.Consecration, nil, nil, not h:IsInMeleeRange(8)) then
      s = 26573;
      return "consecration generators 20"
    end end
  ;
  if x.CrusaderStrike:IsCastable() and (x.CrusaderStrike:ChargesFractional() >= 1.75 and (g:HolyPower() <= 2 or g:HolyPower() <= 3 and x.BladeofJustice:CooldownRemains() > g:GCD() * 2 or g:HolyPower() == 4 and x.BladeofJustice:CooldownRemains() > g:GCD() * 2 and x.Judgment:CooldownRemains() > g:GCD() * 2)) then if o(x.CrusaderStrike, nil, nil, not h:IsInMeleeRange(5)) then
      s = 35395;
      return "crusader_strike generators 22"
    end end
  ;
  local T = R()
  if T then return T end
  ;
  if x.Consecration:IsCastable() and h:DebuffDown(x.ConsecrationDebuff) then if o(x.Consecration, nil, nil, not h:IsInMeleeRange(8)) then
      s = 26573;
      return "consecration generators 24"
    end end
  ;
  if x.CrusaderStrike:IsCastable() then if o(x.CrusaderStrike, nil, nil, not h:IsInMeleeRange(5)) then
      s = 35395;
      return "crusader_strike generators 26"
    end end
  ;
  if x.ArcaneTorrent:IsCastable() then if o(x.ArcaneTorrent, nil, nil, not h:IsInRange(8)) then
      s = 50613;
      return "arcane_torrent generators 28"
    end end
  ;
  if x.Consecration:IsCastable() then if o(x.Consecration, nil, nil, not h:IsInMeleeRange(8)) then
      s = 26573;
      return "consecration generators 30"
    end end
end
;
local function U()
  if x.Fireblood:IsCastable() then if o(x.Fireblood, nil) then
      s = 265221;
      return "fireblood es_fr_active 2"
    end end
  ;
  if g:HolyPower() == 5 or h:DebuffUp(x.JudgmentDebuff) or h:DebuffUp(x.FinalReckoning) and (h:DebuffRemains(x.FinalReckoning) < g:GCD() + 0.5 or C >= 2 and not x.ExecutionSentence:IsAvailable()) or h:DebuffUp(x.ExecutionSentence) and h:DebuffRemains(x.ExecutionSentence) < g:GCD() + 0.5 then
    local T = R()
    if T then return T end
  end
  ;
  if x.DivineToll:IsCastable() and g:HolyPower() <= 2 then if o(x.DivineToll, nil, nil, not h:IsInRange(30)) then
      s = 375576;
      return "divine_toll es_fr_active 4"
    end end
  ;
  if x.WakeofAshes:IsCastable() and (g:HolyPower() <= 2 and (h:DebuffUp(x.FinalReckoning) and h:DebuffRemains(x.FinalReckoning) < g:GCD() * 2 and not x.DivineResonance:IsAvailable() or h:DebuffUp(x.ExecutionSentence) and h:DebuffRemains(x.ExecutionSentence) < g:GCD() or C >= 5 and x.DivineResonance:IsAvailable() and x.ExecutionSentence:IsAvailable())) then if o(x.WakeofAshes, nil, nil, not h:IsInRange(12)) then
      s = 255937;
      return "wake_of_ashes es_fr_active 6"
    end end
  ;
  if x.BladeofJustice:IsCastable() and (x.Expurgation:IsAvailable() and (not x.DivineResonance:IsAvailable() and g:HolyPower() <= 3 or g:HolyPower() <= 2)) then if o(x.BladeofJustice, nil, nil, not h:IsSpellInRange(x.BladeofJustice)) then
      s = 184575;
      return "blade_of_justice es_fr_active 8"
    end end
  ;
  if x.Judgment:IsCastable() and (h:DebuffDown(x.JudgmentDebuff) and g:HolyPower() >= 2) then if o(x.Judgment, nil, nil, not h:IsSpellInRange(x.Judgment)) then
      s = 20271;
      return "judgment es_fr_active 10"
    end end
  ;
  local T = R()
  if T then return T end
  ;
  if x.WakeofAshes:IsCastable() and g:HolyPower() <= 2 then if o(x.WakeofAshes, nil, nil, not h:IsInRange(12)) then
      s = 255937;
      return "wake_of_ashes es_fr_active 12"
    end end
  ;
  if x.BladeofJustice:IsCastable() and g:HolyPower() <= 3 then if o(x.BladeofJustice, nil, nil, not h:IsSpellInRange(x.BladeofJustice)) then
      s = 184575;
      return "blade_of_justice es_fr_active 14"
    end end
  ;
  if x.Judgment:IsCastable() and h:DebuffDown(x.Judgment) then if o(x.Judgment, nil, nil, not h:IsSpellInRange(x.Judgment)) then
      s = 20271;
      return "judgment es_fr_active 16"
    end end
  ;
  if x.HammerofWrath:IsReady() then if o(x.HammerofWrath, nil, nil, not h:IsSpellInRange(x.HammerofWrath)) then
      s = 24275;
      return "hammer_of_wrath es_fr_active 18"
    end end
  ;
  if x.CrusaderStrike:IsCastable() then if o(x.CrusaderStrike, nil, nil, not h:IsInMeleeRange(5)) then
      s = 35395;
      return "crusader_strike es_fr_active 20"
    end end
  ;
  if x.ArcaneTorrent:IsCastable() then if o(x.ArcaneTorrent, nil, nil, not h:IsInRange(8)) then
      s = 50613;
      return "arcane_torrent es_fr_active 22"
    end end
  ;
  if x.Exorcism:IsCastable() then if o(x.Exorcism, nil, nil, not h:IsSpellInRange(x.Exorcism)) then
      s = 383185;
      return "exorcism es_fr_active 24"
    end end
  ;
  if x.Consecration:IsCastable() then if o(x.Consecration, nil, nil, not h:IsInMeleeRange(8)) then
      s = 26573;
      return "consecration es_fr_active 26"
    end end
end
;
local function V()
  if x.Seraphim:IsReady() and (g:HolyPower() == 5 and (not x.FinalReckoning:IsAvailable() or x.FinalReckoning:CooldownRemains() <= g:GCD() * 3) and (not x.ExecutionSentence:IsAvailable() or x.ExecutionSentence:CooldownRemains() <= g:GCD() * 3 or x.FinalReckoning:IsAvailable())) then if o(x.Seraphim, nil) then
      s = 152262;
      return "seraphim es_fr_pooling 2"
    end end
  ;
  if g:HolyPower() == 5 or h:DebuffUp(x.FinalReckoning) or g:BuffUp(x.CrusadeBuff) and g:BuffStack(x.CrusadeBuff) < 10 then
    local T = R()
    if T then return T end
  end
  ;
  if x.HammerofWrath:IsReady() and x.VanguardsMomentum:IsAvailable() then if o(x.HammerofWrath, nil, nil, not h:IsSpellInRange(x.HammerofWrath)) then
      s = 24275;
      return "hammer_of_wrath es_fr_pooling 4"
    end end
  ;
  if x.WakeofAshes:IsCastable() and (g:HolyPower() <= 2 and x.AshestoDust:IsAvailable() and (x.Crusade:CooldownDown() or x.AvengingWrath:CooldownDown())) then if o(x.WakeofAshes, nil, nil, not h:IsInRange(12)) then
      s = 255937;
      return "wake_of_ashes es_fr_pooling 6"
    end end
  ;
  if x.BladeofJustice:IsCastable() and g:HolyPower() <= 3 then if o(x.BladeofJustice, nil, nil, not h:IsSpellInRange(x.BladeofJustice)) then
      s = 184575;
      return "blade_of_justice es_fr_pooling 8"
    end end
  ;
  if x.Judgment:IsCastable() and h:DebuffDown(x.JudgmentDebuff) then if o(x.Judgment, nil, nil, not h:IsSpellInRange(x.Judgment)) then
      s = 20271;
      return "judgment es_fr_pooling 10"
    end end
  ;
  if x.HammerofWrath:IsReady() then if o(x.HammerofWrath, nil, nil, not h:IsSpellInRange(x.HammerofWrath)) then
      s = 24275;
      return "hammer_of_wrath es_fr_pooling 12"
    end end
  ;
  if x.CrusaderStrike:IsCastable() and (x.CrusaderStrike:ChargesFractional() >= 1.75 and (g:HolyPower() <= 2 or g:HolyPower() <= 3 and x.BladeofJustice:CooldownRemains() > g:GCD() * 2 or g:HolyPower() == 4 and x.BladeofJustice:CooldownRemains() > g:GCD() * 2 and x.Judgment:CooldownRemains() > g:GCD() * 2)) then if o(x.CrusaderStrike, nil, nil, not h:IsInMeleeRange(5)) then
      s = 35395;
      return "crusader_strike es_fr_pooling 14"
    end end
  ;
  if x.Seraphim:IsReady() and (not x.FinalReckoning:IsAvailable() and x.ExecutionSentence:CooldownRemains() <= g:GCD() * 3) then if o(x.Seraphim, nil) then
      s = 152262;
      return "seraphim es_fr_pooling 16"
    end end
  ;
  local T = R()
  if T then return T end
  ;
  if x.CrusaderStrike:IsCastable() then if o(x.CrusaderStrike, nil, nil, not h:IsInMeleeRange(5)) then
      s = 35395;
      return "crusader_strike es_fr_pooling 18"
    end end
  ;
  if x.ArcaneTorrent:IsCastable() and g:HolyPower() <= 4 then if o(x.ArcaneTorrent, nil, nil, not h:IsInRange(8)) then
      s = 50613;
      return "arcane_torrent es_fr_pooling 20"
    end end
  ;
  if x.Exorcism:IsCastable() then if o(x.Exorcism, nil, nil, not h:IsSpellInRange(x.Exorcism)) then
      s = 383185;
      return "exorcism es_fr_pooling 22"
    end end
  ;
  if x.Seraphim:IsReady() and ((not x.FinalReckoning:IsAvailable() or x.FinalReckoning:CooldownRemains() <= g:GCD() * 3) and (not x.ExecutionSentence:IsAvailable() or x.ExecutionSentence:CooldownRemains() <= g:GCD() * 3 or x.FinalReckoning:IsAvailable())) then if o(x.Seraphim, nil) then
      s = 152262;
      return "seraphim es_fr_pooling 24"
    end end
  ;
  if x.Consecration:IsCastable() then if o(x.Consecration, nil, nil, not h:IsInMeleeRange(8)) then
      s = 26573;
      return "consecration es_fr_pooling 26"
    end end
end
;
local function W()
  if m() then
    B = g:GetEnemiesInMeleeRange(8)
    C = #B;
    A = g:GetEnemiesInMeleeRange(5)
  else
    B = {}
    C = 1;
    A = {}
  end
  ;
  F = J()
  if u.TargetIsValid() or g:AffectingCombat() then
    D = d.BossFightRemains(nil, true)
    E = D;
    if E == 11111 then E = d.FightRemains(B, false) end
  end
  ;
  if u.TargetIsValid() then
    if not g:AffectingCombat() then
      local T = N()
      if T then return T end
    end
    ;
    local T = u.Interrupt(5, x.Rebuke, w.Commons.OffGCDasOffGCD.Rebuke, I)
    if T then return "Interrupts: " .. T end
    ;
    if n() then
      local T = O()
      if T then return "Cooldowns: " .. T end
    end
    ;
    if (x.ExecutionSentence:IsAvailable() and x.ExecutionSentence:CooldownRemains() < 9 and C < 5 or x.FinalReckoning:IsAvailable() and x.FinalReckoning:CooldownRemains() < 9) and (g:BuffDown(x.CrusadeBuff) or g:BuffStack(x.CrusadeBuff) == 10) and h:TimeToDie() > 8 then
      local T = V()
      if T then return T end
    end
    ;
    if h:DebuffUp(x.ExecutionSentence) or h:DebuffUp(x.FinalReckoning) then
      local T = U()
      if T then return T end
    end
    ;
    local T = S()
    if T then return "Generators: " .. T end
    ;
    if o(x.Pool) then return "Wait/Pool Resources" end
  end
end
;
local function X() l.Print(
    "Retribution Paladin rotation is currently a work in progress, but has been updated for patch 10.0.") end
;
function ReturnSpellOut() if s == 0 then return 0 else return s end end

;
function ReturnSpellMOOut() if t == 0 then return 0 else return t end end

;
l.SetAPL(70, W, X)
