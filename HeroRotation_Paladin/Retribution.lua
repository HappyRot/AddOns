local a, b = ...
local c = HeroDBC.DBC
local d = HeroLib
local e = HeroCache
local f = d.Unit
local g = f.Player
local h = f.Target
local i = f.Pet
local j = d.Spell
local k = d.Item
local l = HeroRotation
local m = l.AoEON
local n = l.CDsON
local o = l.Cast
local p = l.Commons.Everyone.num
local q = l.Commons.Everyone.bool
local r = math.min
local s = l.Commons.Everyone
local t = l.Commons.Paladin
local u = g:GetEquipment()
local v = u[13] and k(u[13]) or k(0)
local w = u[14] and k(u[14]) or k(0)
local x = GetInventoryItemID("player", 13)
local y = GetInventoryItemID("player", 14)
local z = {
  General = l.GUISettings.General,
  Commons = l.GUISettings.APL.Paladin.Commons,
  Retribution = l.GUISettings.APL.Paladin.Retribution
}
local A = j.Paladin.Retribution
local B = k.Paladin.Retribution
local C = {B.AlgetharPuzzleBox:ID()}
local D = 0
local E = 0
local F
local G
local H
local I = 11111
local J = 11111
local K
local L = 0
local M = 0
local N
local O = A.FinalVerdict:IsLearned() and A.FinalVerdict or A.TemplarsVerdict
d:RegisterForEvent(
  function()
    I = 11111
    J = 11111
  end,
  "PLAYER_REGEN_ENABLED"
)
d:RegisterForEvent(
  function()
    O = A.FinalVerdict:IsLearned() and A.FinalVerdict or A.TemplarsVerdict
  end,
  "SPELLS_CHANGED",
  "LEARNED_SPELL_IN_TAB"
)
local function P()
  local Q = g:GCDRemains()
  local R =
    r(
    A.CrusaderStrike:CooldownRemains(),
    A.BladeofJustice:CooldownRemains(),
    A.Judgment:CooldownRemains(),
    A.HammerofWrath:IsUsable() and A.HammerofWrath:CooldownRemains() or 10,
    A.WakeofAshes:CooldownRemains()
  )
  if Q > R then
    return Q
  end
  return R
end
local function S()
  return g:BuffDown(A.RetributionAura) and g:BuffDown(A.DevotionAura) and g:BuffDown(A.ConcentrationAura) and
    g:BuffDown(A.CrusaderAura)
end
local function T()
  if A.ShieldofVengeance:IsCastable() then
    if o(A.ShieldofVengeance, nil) then
      D = 184662
      return "shield_of_vengeance precombat 6"
    end
  end
  if O:IsReady() and L >= 4 and h:IsInMeleeRange(5) then
    if o(O) then
      D = 383328
      return "either verdict precombat 2"
    end
  end
  if A.BladeofJustice:IsCastable() then
    if o(A.BladeofJustice, nil, nil, not h:IsSpellInRange(A.BladeofJustice)) then
      D = 184575
      return "blade_of_justice precombat 4"
    end
  end
  if A.Judgment:IsCastable() then
    if o(A.Judgment, nil, nil, not h:IsSpellInRange(A.Judgment)) then
      D = 275773
      return "judgment precombat 6"
    end
  end
  if A.HammerofWrath:IsReady() then
    if o(A.HammerofWrath, nil, nil, not h:IsSpellInRange(A.HammerofWrath)) then
      D = 24275
      return "hammer_of_wrath precombat 8"
    end
  end
  if A.CrusaderStrike:IsCastable() then
    if o(A.CrusaderStrike, nil, nil, not h:IsInMeleeRange(5)) then
      D = 35395
      return "crusader_strike 10"
    end
  end
end
local function U()
  if
    z.Commons.Enabled.Potions and
      (g:BuffUp(A.AvengingWrathBuff) or g:BuffUp(A.CrusadeBuff) and g:BuffStack(A.CrusadeBuff) == 10 or J < 25)
   then
    local V = s.PotionSelected()
    if V and V:IsReady() then
      if l.Cast(V, nil, nil) then
        D = 10
        return "potion cooldowns 2"
      end
    end
  end
  if A.LightsJudgment:IsCastable() then
    if o(A.LightsJudgment, z.Commons.OffGCDasOffGCD.Racials, nil, not h:IsInRange(40)) then
      D = 255647
      return "lights_judgment cooldowns 4"
    end
  end
  if
    A.Fireblood:IsCastable() and
      (g:BuffUp(A.AvengingWrathBuff) or g:BuffUp(A.CrusadeBuff) and g:BuffStack(A.CrusadeBuff) == 10)
   then
    if o(A.Fireblood, z.Commons.OffGCDasOffGCD.Racials) then
      D = 265221
      return "fireblood cooldowns 6"
    end
  end
  if (z.Commons.Enabled.TopTrinket or z.Commons.Enabled.BottomTrinket) and n() then
    local W = g:GetUseableTrinkets(C)
    if W and J < 20 then
      if l.Cast(W, nil, nil) then
        if W:ID() == x and z.Commons.Enabled.TopTrinket then
          D = 13
          return "Generic use_items for " .. W:Name()
        elseif W:ID() == y and z.Commons.Enabled.BottomTrinket then
          D = 14
          return "Generic use_items for " .. W:Name()
        end
      end
    end
  end
  if A.ShieldofVengeance:IsCastable() and J > 15 then
    if o(A.ShieldofVengeance, nil) then
      D = 184662
      return "shield_of_vengeance cooldowns 10"
    end
  end
  if
    A.AvengingWrath:IsCastable() and
      (L >= 4 and d.CombatTime() < 5 or L >= 3 and d.CombatTime() > 5 or
        L >= 2 and A.DivineAuxiliary:IsAvailable() and
          (A.ExecutionSentence:CooldownUp() or A.FinalReckoning:CooldownUp()))
   then
    if o(A.AvengingWrath, nil) then
      D = 31884
      return "avenging_wrath cooldowns 12"
    end
  end
  if A.Crusade:IsCastable() and (L >= 4 and d.CombatTime() < 5 or L >= 3 and d.CombatTime() >= 5) then
    if o(A.Crusade, nil) then
      D = 231895
      return "crusade cooldowns 14"
    end
  end
  if
    A.ExecutionSentence:IsCastable() and
      ((g:BuffDown(A.CrusadeBuff) and A.Crusade:CooldownRemains() > 10 or g:BuffStack(A.CrusadeBuff) == 1 or
        A.AvengingWrath:CooldownRemains() > 10) and
        (L >= 3 or L >= 2 and A.DivineAuxiliary:IsAvailable()) and
        J > 8)
   then
    if o(A.ExecutionSentence, nil, nil, not h:IsSpellInRange(A.ExecutionSentence)) then
      D = 343527
      return "execution_sentence cooldowns 16"
    end
  end
  if
    A.FinalReckoning:IsCastable() and
      ((L >= 4 and d.CombatTime() < 8 or L >= 3 and d.CombatTime() >= 8 or L >= 2 and A.DivineAuxiliary:IsAvailable()) and
        (A.AvengingWrath:CooldownRemains() > M or
          A.Crusade:CooldownDown() and (g:BuffDown(A.CrusadeBuff) or g:BuffStack(A.CrusadeBuff) >= 10)) and
        (K > 0 or L == 5 or L >= 2 and A.DivineAuxiliary:IsAvailable()))
   then
    if o(A.FinalReckoning, nil, nil, not h:IsSpellInRange(A.FinalReckoning)) then
      D = 343721
      return "final_reckoning cooldowns 18"
    end
  end
end
local function X()
  N = H >= 2 or g:BuffUp(A.EmpyreanPowerBuff)
  if
    A.DivineStorm:IsReady() and
      (N and g:BuffDown(A.EmpyreanLegacyBuff) and
        not (g:BuffUp(A.DivineArbiterBuff) and g:BuffStack(A.DivineArbiterBuff) > 24) and
        ((not A.Crusade:IsAvailable() or A.Crusade:CooldownRemains() > M * 3) and
          (not A.ExecutionSentence:IsAvailable() or A.DivineAuxiliary:IsAvailable() or J < 8 or
            A.ExecutionSentence:CooldownRemains() > M * 2) and
          (not A.FinalReckoning:IsAvailable() or A.DivineAuxiliary or A.FinalReckoning:CooldownRemains() > M * 2) or
          g:BuffUp(A.CrusadeBuff) and g:BuffStack(A.CrusadeBuff) < 10))
   then
    if o(A.DivineStorm, nil, nil, not h:IsInRange(8)) then
      D = 53385
      return "divine_storm finishers 2"
    end
  end
  if
    A.JusticarsVengeance:IsReady() and
      ((not A.Crusade:IsAvailable() or A.Crusade:CooldownRemains() > M * 3) and
        (not A.ExecutionSentence:IsAvailable() or A.DivineAuxiliary:IsAvailable() or J < 8 or
          A.ExecutionSentence:CooldownRemains() > M * 2) and
        (not A.FinalReckoning:IsAvailable() or A.DivineAuxiliary:IsAvailable() or
          A.FinalReckoning:CooldownRemains() > M * 2) or
        g:BuffUp(A.CrusadeBuff) and g:BuffStack(A.CrusadeBuff) < 10)
   then
    if o(A.JusticarsVengeance, nil, nil, not h:IsInMeleeRange(5)) then
      D = 215661
      return "justicars_vengeance finishers 4"
    end
  end
  if
    O:IsReady() and
      ((not A.Crusade:IsAvailable() or A.Crusade:CooldownRemains() > M * 3) and
        (not A.ExecutionSentence:IsAvailable() or A.DivineAuxiliary:IsAvailable() or J < 8 or
          A.ExecutionSentence:CooldownRemains() > M * 2) and
        (not A.FinalReckoning:IsAvailable() or A.DivineAuxiliary:IsAvailable() or
          A.FinalReckoning:CooldownRemains() > M * 2) or
        g:BuffUp(A.CrusadeBuff) and g:BuffStack(A.CrusadeBuff) < 10)
   then
    if o(O, nil, nil, not h:IsInMeleeRange(5)) then
      D = 383328
      return "either verdict finishers 6"
    end
  end
  ::Y::
  if z.Retribution.DisableFinisherCDCheck or not n() then
    if
      A.DivineStorm:IsReady() and
        (N and g:BuffDown(A.EmpyreanLegacyBuff) and
          not (g:BuffUp(A.DivineArbiterBuff) and g:BuffStack(A.DivineArbiterBuff) > 24))
     then
      if o(A.DivineStorm, nil, nil, not h:IsInMeleeRange(8)) then
        return "divine_storm no_cds finishers 8"
      end
    end
    if A.JusticarsVengeance:IsReady() then
      if o(A.JusticarsVengeance, nil, nil, not h:IsSpellInRange(A.JusticarsVengeance)) then
        return "justicars_vengeance no_cds finishers 10"
      end
    end
    if O:IsReady() then
      if o(O, nil, nil, not h:IsSpellInRange(O)) then
        return "either verdict no_cds finishers 12"
      end
    end
  end
end
local function Z()
  if A.DivineToll:IsCastable() and g:BuffUp(A.AvengingWrathBuff) then
    if o(A.DivineToll, nil, nil, not h:IsInRange(30)) then
      D = 375576
      return "divine_toll generators 0"
    end
  end
  if L >= 5 or (h:DebuffUp(A.JudgmentDebuff) or L == 4) and g:BuffUp(A.DivineResonanceBuff) then
    local ShouldReturn = X()
    if ShouldReturn then
      return ShouldReturn
    end
  end
  if
    A.WakeofAshes:IsCastable() and
      (L <= 2 and (A.AvengingWrath:CooldownDown() or A.Crusade:CooldownDown()) and
        (not A.ExecutionSentence:IsAvailable() or A.ExecutionSentence:CooldownRemains() > 4 or J < 8))
   then
    if o(A.WakeofAshes, nil, nil, not h:IsInMeleeRange(12)) then
      D = 255937
      return "wake_of_ashes generators 2"
    end
  end
  if
    A.DivineToll:IsCastable() and
      (L <= 2 and h:DebuffDown(A.JudgmentDebuff) and (not A.Seraphim:IsAvailable() or g:BuffUp(A.SeraphimBuff)) and
        not A.FinalReckoning:IsAvailable() and
        (not A.ExecutionSentence or J < 8 or H >= 5) and
        (A.AvengingWrath:CooldownRemains() > 15 or A.Crusade:CooldownRemains() > 15 or J < 8))
   then
    if o(A.DivineToll, nil, nil, not h:IsInRange(30)) then
      D = 375576
      return "divine_toll generators 6"
    end
  end
  if L >= 3 and g:BuffUp(A.CrusadeBuff) and g:BuffStack(A.CrusadeBuff) < 10 then
    local ShouldReturn = X()
    if ShouldReturn then
      return ShouldReturn
    end
  end
  if A.TemplarSlash:IsReady() and (A.TemplarStrike:TimeSinceLastCast() + M < 4 and H >= 2) then
    if o(A.TemplarSlash, nil, nil, not h:IsInMeleeRange(9)) then
      D = 406647
      return "templar_slash generators 8"
    end
  end
  if
    A.Judgment:IsReady() and
      (h:DebuffDown(A.JudgmentDebuff) and (L <= 3 or not A.BoundlessJudgment:IsAvailable()) and H >= 2)
   then
    if o(A.Judgment, nil, nil, not h:IsSpellInRange(A.Judgment)) then
      D = 275773
      return "judgment generators 10"
    end
  end
  if A.BladeofJustice:IsCastable() and ((L <= 3 or not A.HolyBlade:IsAvailable()) and H >= 2) then
    if o(A.BladeofJustice, nil, nil, not h:IsSpellInRange(A.BladeofJustice)) then
      D = 184575
      return "blade_of_justice generators 12"
    end
  end
  if
    A.HammerofWrath:IsReady() and
      ((H < 2 or not A.BlessedChampion:IsAvailable()) and
        (L <= 3 or h:HealthPercentage() > 20 or not A.VanguardsMomentum:IsAvailable()))
   then
    if o(A.HammerofWrath, nil, nil, not h:IsSpellInRange(A.HammerofWrath)) then
      D = 24275
      return "hammer_of_wrath generators 14"
    end
  end
  if A.TemplarSlash:IsReady() and A.TemplarStrike:TimeSinceLastCast() + M < 4 then
    if o(A.TemplarSlash, nil, nil, not h:IsInMeleeRange(9)) then
      D = 406647
      return "templar_slash generators 16"
    end
  end
  ::Y::
  if
    A.Judgment:IsReady() and
      (g:BuffDown(A.AvengingWrathBuff) and (g:HolyPower() <= 3 or not A.BoundlessJudgment:IsAvailable()) and
        A.CrusadingStrikes:IsAvailable())
   then
    if o(A.Judgment, nil, nil, not h:IsSpellInRange(A.Judgment)) then
      return "judgment generators 17"
    end
  end
  if A.BladeofJustice:IsCastable() and (L <= 3 or not A.HolyBlade:IsAvailable()) then
    if o(A.BladeofJustice, nil, nil, not h:IsSpellInRange(A.BladeofJustice)) then
      D = 184575
      return "blade_of_justice generators 18"
    end
  end
  if A.Judgment:IsReady() and (h:DebuffDown(A.JudgmentDebuff) and (L <= 3 or not A.BoundlessJudgment:IsAvailable())) then
    if o(A.Judgment, nil, nil, not h:IsSpellInRange(A.Judgment)) then
      D = 275773
      return "judgment generators 20"
    end
  end
  if
    h:HealthPercentage() <= 20 or g:BuffUp(A.AvengingWrathBuff) or g:BuffUp(A.CrusadeBuff) or
      g:BuffUp(A.EmpyreanPowerBuff)
   then
    local ShouldReturn = X()
    if ShouldReturn then
      return ShouldReturn
    end
  end
  if A.Consecration:IsCastable() and (h:DebuffDown(A.ConsecrationDebuff) and H >= 2) then
    if o(A.Consecration, nil, nil, not h:IsInMeleeRange(8)) then
      D = 111111
      return "consecration generators 22"
    end
  end
  if A.DivineHammer:IsCastable() and H >= 2 then
    if o(A.DivineHammer, nil, nil, not h:IsInMeleeRange(8)) then
      D = 198034
      return "divine_hammer generators 24"
    end
  end
  if
    A.CrusaderStrike:IsCastable() and
      (A.CrusaderStrike:ChargesFractional() >= 1.75 and
        (L <= 2 or L <= 3 and A.BladeofJustice:CooldownRemains() > M * 2 or
          L == 4 and A.BladeofJustice:CooldownRemains() > M * 2 and A.Judgment:CooldownRemains() > M * 2))
   then
    if o(A.CrusaderStrike, nil, nil, not h:IsInMeleeRange(5)) then
      D = 35395
      return "crusader_strike generators 26"
    end
  end
  local ShouldReturn = X()
  if ShouldReturn then
    return ShouldReturn
  end
  if A.TemplarSlash:IsReady() then
    if o(A.TemplarSlash, nil, nil, not h:IsInMeleeRange(9)) then
      D = 406647
      return "templar_slash generators 28"
    end
  end
  if A.TemplarStrike:IsReady() then
    if o(A.TemplarStrike, nil, nil, not h:IsInMeleeRange(9)) then
      D = 407480
      return "templar_strike generators 30"
    end
  end
  if A.Judgment:IsReady() and (L <= 3 or not A.BoundlessJudgment:IsAvailable()) then
    if o(A.Judgment, nil, nil, not h:IsSpellInRange(A.Judgment)) then
      D = 275773
      return "judgment generators 32"
    end
  end
  if A.HammerofWrath:IsReady() and (L <= 3 or h:HealthPercentage() > 20 or not A.VanguardsMomentum:IsAvailable()) then
    if o(A.HammerofWrath, nil, nil, not h:IsSpellInRange(A.HammerofWrath)) then
      D = 24275
      return "hammer_of_wrath generators 34"
    end
  end
  if A.CrusaderStrike:IsCastable() then
    if o(A.CrusaderStrike, nil, nil, not h:IsInMeleeRange(5)) then
      D = 407480
      return "crusader_strike generators 26"
    end
  end
  if A.ArcaneTorrent:IsCastable() then
    if o(A.ArcaneTorrent, nil, nil, not h:IsInRange(8)) then
      D = 50613
      return "arcane_torrent generators 28"
    end
  end
  if A.Consecration:IsCastable() then
    if o(A.Consecration, nil, nil, not h:IsInMeleeRange(8)) then
      D = 111111
      return "consecration generators 30"
    end
  end
  if A.DivineHammer:IsCastable() then
    if o(A.DivineHammer, nil, nil, not h:IsInMeleeRange(8)) then
      D = 198034
      return "divine_hammer generators 32"
    end
  end
end
local function _()
  if ShouldReturn then
    return ShouldReturn
  end
  if E > 0 then
    E = 0
  end
  if D > 0 then
    D = 0
  end
  if ShouldReturn then
    return ShouldReturn
  end
  if g:HealthPercentage() < z.Commons.HealthstoneHP and B.Healthstone:IsReady() and B.Healthstone:CooldownRemains() <= 0 then
    if l.Cast(B.Healthstone, nil) then
      D = 12
      return "Healthstone HP"
    end
  end
  if g:HealthPercentage() < z.Commons.HealPotHP and B.CosmicHealPot:IsReady() and B.CosmicHealPot:CooldownRemains() <= 0 then
    if l.Cast(B.CosmicHealPot, nil) then
      D = 11
      return "CosmicHealPot HP"
    end
  end
  if
    g:HealthPercentage() < z.Commons.HealPotHP and B.HealPot:IsReady() and not B.CosmicHealPot:IsReady() and
      B.HealPot:CooldownRemains() <= 0
   then
    if l.Cast(B.HealPot, nil) then
      D = 11
      return "HealPot HP"
    end
  end
  if m() then
    G = g:GetEnemiesInMeleeRange(8)
    H = #G
    F = g:GetEnemiesInMeleeRange(5)
  else
    G = {}
    H = 1
    F = {}
  end
  K = P()
  if s.TargetIsValid() or g:AffectingCombat() then
    I = d.BossFightRemains(nil, true)
    J = I
    if J == 11111 then
      J = d.FightRemains(G, false)
    end
    M = g:GCD()
    L = g:HolyPower()
  end
  if s.TargetIsValid() then
    if not g:AffectingCombat() then
      local ShouldReturn = T()
      if ShouldReturn then
        return ShouldReturn
      end
    end
    local ShouldReturn = s.Interrupt(5, A.Rebuke, z.Commons.OffGCDasOffGCD.Rebuke, Interrupts)
    if ShouldReturn then
      return ShouldReturn
    end
    if n() then
      local ShouldReturn = U()
      if ShouldReturn then
        return ShouldReturn
      end
    end
    local ShouldReturn = Z()
    if ShouldReturn then
      return ShouldReturn
    end
    if o(A.Pool) then
      return "Wait/Pool Resources"
    end
  end
end
function ReturnSpell()
  if D == 0 then
    return 0
  else
    return D
  end
end
function ReturnSpellMO()
  if E == 0 then
    return 0
  else
    return E
  end
end
local function a0()
  l.Print("Retribution Paladin rotation is currently a work in progress, but has been updated for patch 10.0.7.")
end
l.SetAPL(70, _, a0)
