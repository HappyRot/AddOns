local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = d.Spell;
local j = d.MultiSpell;
local k = d.Item;
local l = HeroRotation;
local m = l.AoEON;
local n = l.CDsON;
local o = HeroRotationCharDB.Toggles[4]
local p = HeroRotationCharDB.Toggles[5]
local q = HeroRotationCharDB.Toggles[6]
local r = HeroRotationCharDB.Toggles[12]
local s = not HeroRotationCharDB.Toggles[15]
local t = HeroRotationCharDB.Toggles[21]
local u = HeroRotationCharDB.Toggles[52]
local v = HeroRotationCharDB.Toggles[22]
local w = HeroRotationCharDB.Toggles[23]
local x = HeroRotationCharDB.Toggles[24]
local y = HeroRotationCharDB.Toggles[25]
local z = HeroRotationCharDB.Toggles[27]
local A = HeroRotationCharDB.Toggles[50]
local B = HeroRotationCharDB.Toggles[51]
local C = HeroRotationCharDB.Toggles[53]
local D = HeroRotationCharDB.Toggles[30]
local E = HeroRotationCharDB.Toggles[54]
local F = 0;
local G = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241,
  331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 158337 }
local H = math.min;
local I = math.abs;
local J = math.max;
local K = nil;
local L = nil;
local M = GetInventoryItemID("player", 13)
local N = GetInventoryItemID("player", 14)
local O = l.Commons.Everyone;
local P = l.Commons.Rogue;
local Q = { General = l.GUISettings.General, Commons = l.GUISettings.APL.Rogue.Commons,
  Commons2 = l.GUISettings.APL.Rogue.Commons2, Outlaw = l.GUISettings.APL.Rogue.Outlaw }
local R = i.Rogue.Outlaw;
local S = k.Rogue.Outlaw;
local T = { S.ManicGrieftorch:ID() }
R.Dispatch:RegisterDamageFormula(function() return g:AttackPowerDamageMod() * P.CPSpend() * 0.3 * 1.0 *
    (1 + g:VersatilityDmgPct() / 100) * (h:DebuffUp(R.GhostlyStrike) and 1.1 or 1) end)
local U, V, W;
local X;
local Y = 6;
local Z;
local _, a0, a1;
local a2, a3, a4, a5, a6;
local a7 = { { R.Blind, "Cast Blind (Interrupt)", function() return true end } }
local a8 = P.ReturnSpell()
local a9 = P.ReturnSpellMO()
local function aa(ab) if ab then return 1 else return 0 end end

local ac, ad = 0, 0;
local function ae(af) local ag = g:EnergyTimeToMaxPredicted(nil, af) if ag < ac or ag - ac > 0.5 then ac = ag end return ac end

local function ah() local ai = g:EnergyPredicted() if ai > ad or ai - ad > 9 then ad = ai end return ad end

local aj = { R.Broadside, R.BuriedTreasure, R.GrandMelee, R.RuthlessPrecision, R.SkullandCrossbones, R.TrueBearing }
local function ak(al, am) if not e.APLVar.RtB_List then e.APLVar.RtB_List = {} end if not e.APLVar.RtB_List[al] then e.APLVar
    .RtB_List[al] = {} end local an = table.concat(am) if al == "All" then if not e.APLVar.RtB_List[al][an] then local ao = 0; for ap = 1, #
    am do if g:BuffUp(aj[am[ap]]) then ao = ao + 1 end end e.APLVar.RtB_List[al][an] = ao == #am and true or false end else if not
    e.APLVar.RtB_List[al][an] then e.APLVar.RtB_List[al][an] = false; for ap = 1, #am do if g:BuffUp(aj[am[ap]]) then e.APLVar
    .RtB_List[al][an] = true; break end end end end return e.APLVar.RtB_List[al][an] end

local function aq() if not e.APLVar.RtB_Buffs then e.APLVar.RtB_Buffs = {}
e.APLVar.RtB_Buffs.Total = 0;
e.APLVar.RtB_Buffs.Normal = 0;
e.APLVar.RtB_Buffs.Shorter = 0;
e.APLVar.RtB_Buffs.Longer = 0;
local ar = P.RtBRemains()
for ap = 1, #aj do local as = g:BuffRemains(aj[ap]) if as > 0 then e.APLVar.RtB_Buffs.Total = e.APLVar.RtB_Buffs.Total +
    1; if as == ar then e.APLVar.RtB_Buffs.Normal = e.APLVar.RtB_Buffs.Normal + 1 elseif as > ar then e.APLVar.RtB_Buffs
    .Longer = e.APLVar.RtB_Buffs.Longer + 1 else e.APLVar.RtB_Buffs.Shorter = e.APLVar.RtB_Buffs.Shorter + 1 end end end end return e
    .APLVar.RtB_Buffs.Total end

local function at() if not e.APLVar.RtB_Reroll then if Q.Outlaw.RolltheBonesLogic == "1+ Buff" then e.APLVar.RtB_Reroll = aq()
    <= 0 and true or false elseif Q.Outlaw.RolltheBonesLogic == "Broadside" then e.APLVar.RtB_Reroll = not
    g:BuffUp(R.Broadside) and true or false elseif Q.Outlaw.RolltheBonesLogic == "Buried Treasure" then e.APLVar.RtB_Reroll = not
    g:BuffUp(R.BuriedTreasure) and true or false elseif Q.Outlaw.RolltheBonesLogic == "Grand Melee" then e.APLVar.RtB_Reroll = not
    g:BuffUp(R.GrandMelee) and true or false elseif Q.Outlaw.RolltheBonesLogic == "Skull and Crossbones" then e.APLVar.RtB_Reroll = not
    g:BuffUp(R.SkullandCrossbones) and true or false elseif Q.Outlaw.RolltheBonesLogic == "Ruthless Precision" then e.APLVar
    .RtB_Reroll = not g:BuffUp(R.RuthlessPrecision) and true or false elseif Q.Outlaw.RolltheBonesLogic == "True Bearing" then e
    .APLVar.RtB_Reroll = not g:BuffUp(R.TrueBearing) and true or false else if R.HiddenOpportunity:IsAvailable() then aq() if (
    g:BuffDown(R.SkullandCrossbones) or g:BuffRemains(R.SkullandCrossbones) > P.RtBRemains()) and
    e.APLVar.RtB_Buffs.Normal + e.APLVar.RtB_Buffs.Shorter -
    aa(g:BuffUp(R.GrandMelee) and g:BuffRemains(R.GrandMelee) <= P.RtBRemains()) < 2 + aa(g:BuffUp(R.LoadedDiceBuff)) then e
    .APLVar.RtB_Reroll = true else e.APLVar.RtB_Reroll = false end else if aq() == 2 then if g:BuffUp(R.BuriedTreasure)
    and g:BuffUp(R.GrandMelee) then e.APLVar.RtB_Reroll = true elseif g:BuffUp(R.LoadedDiceBuff) and
    not g:BuffUp(R.Broadside) and not g:BuffUp(R.TrueBearing) then e.APLVar.RtB_Reroll = true end elseif aq() < 2 and
    (
    not g:BuffUp(R.Broadside) and (not R.FanTheHammer:IsAvailable() or not g:BuffUp(R.SkullandCrossbones)) and
        not g:BuffUp(R.TrueBearing) or g:BuffUp(R.LoadedDiceBuff)) then e.APLVar.RtB_Reroll = true else e.APLVar.RtB_Reroll = false end end end if O
    .IsSoloMode() then if g:BuffUp(R.GrandMelee) then if g:IsTanking(h) or
    g:HealthPercentage() < H(Q.Outlaw.RolltheBonesLeechKeepHP, Q.Outlaw.RolltheBonesLeechRerollHP) then e.APLVar.RtB_Reroll = false end elseif g
    :HealthPercentage() < Q.Outlaw.RolltheBonesLeechRerollHP then e.APLVar.RtB_Reroll = true end end end return e.APLVar
    .RtB_Reroll end

local function au() if not e.APLVar.RtB_KiR_Reroll then if not R.KeepItRolling:IsAvailable() and
    not R.CountTheOdds:IsAvailable() then e.APLVar.RtB_KiR_Reroll = false else aq() if e.APLVar.RtB_Buffs.Normal == 0 and
    e.APLVar.RtB_Buffs.Longer > 0 and
    not (g:BuffUp(R.Broadside) and g:BuffUp(R.TrueBearing) and g:BuffUp(R.SkullandCrossbones)) and
    not
    (
    g:BuffRemains(R.Broadside) > 39 or g:BuffRemains(R.TrueBearing) > 39 or g:BuffRemains(R.RuthlessPrecision) > 39 or
        g:BuffRemains(R.SkullandCrossbones) > 39) then e.APLVar.RtB_KiR_Reroll = true else e.APLVar.RtB_KiR_Reroll = false end end end return e
    .APLVar.RtB_KiR_Reroll end

local function av(BypassRecovery) return R.CountTheOdds:IsAvailable() and
    (
    g:BuffUp(P.StealthSpell(), nil, BypassRecovery) or g:BuffUp(P.VanishBuffSpell(), nil, BypassRecovery) or
        g:BuffUp(R.Shadowmeld, nil, BypassRecovery) or g:BuffUp(R.ShadowDanceBuff, nil, BypassRecovery)) end

local function aw() if R.BetweentheEyes:CooldownUp() and _ < 5 then return false end return a0 >=
    P.CPMaxSpend() - aa(g:BuffUp(R.Broadside)) -
    aa(g:BuffUp(R.Opportunity) and (R.QuickDraw:IsAvailable() or R.FanTheHammer:IsAvailable())) or _ >= P.CPMaxSpend() end

local function ax() return a1 >= 2 + aa(R.ImprovedAmbush:IsAvailable()) + aa(g:BuffUp(R.Broadside)) and _ <
    P.CPMaxSpend() and a2 >= 50 and (not R.CountTheOdds:IsAvailable() or P.RtBRemains() > 10) end

local function ay() return not m() or W < 2 or g:BuffRemains(R.BladeFlurry) > 1 + aa(R.KillingSpree:IsAvailable()) end

local function az() return Q.Commons.VanishOffensive and n() and not (O.IsSoloMode() and g:IsTanking(h)) end

local function aA(aB) return aB:TimeToDie() end

local function aC(aB) if (aB:FilteredTimeToDie("<", a1 * 1.5) or not g:StealthUp(true, false) and a1 >= P.CPMaxSpend() -
    1) and not g:DebuffUp(R.Dreadblades) and aB:GUID() == f("mouseover"):GUID() and aB:NPCID() ~= 170234 and
    Q.Outlaw.TargetSwap == "Mouseover" then a9 = 1376195; return true elseif (
    aB:FilteredTimeToDie("<", a1 * 1.5) or not g:StealthUp(true, false) and a1 >= P.CPMaxSpend() - 1) and
    not g:DebuffUp(R.Dreadblades) and Q.Outlaw.TargetSwap == "AutoSwap" and aB:GUID() ~= h:GUID() and aB:NPCID() ~=
    170234 and not r then a9 = 999; return true elseif (
    aB:FilteredTimeToDie("<", a1 * 1.5) or not g:StealthUp(true, false) and a1 >= P.CPMaxSpend() - 1) and
    not g:DebuffUp(R.Dreadblades) and aB:GUID() == h:GUID() and aB:NPCID() ~= 170234 then a8 = 137619; return true elseif (
    aB:FilteredTimeToDie("<", a1 * 1.5) or not g:StealthUp(true, false) and a1 >= P.CPMaxSpend() - 1) and
    not g:DebuffUp(R.Dreadblades) and aB:NPCID() ~= 170234 then return true end end

local function aD() if not t and Q.Commons.VanishOffensive and R.Vanish:IsCastable() and az() then if R.HiddenOpportunity
    :IsAvailable() or not R.ShadowDance:IsAvailable() or not R.ShadowDance:IsCastable() then if R.FindWeakness:
    IsAvailable() and not R.Audacity:IsAvailable() and h:DebuffDown(R.FindWeaknessDebuff) and ax() then if l.Cast(R.Vanish
  , nil) then a8 = 1856; return "Cast Vanish (FW)" end return end if R.HiddenOpportunity:IsAvailable() then local aE = not
    R.ShadowDance:IsAvailable() and
    R.FanTheHammer:TalentRank() + aa(R.QuickDraw:IsAvailable()) + aa(R.Audacity:IsAvailable()) <
    aa(R.CountTheOdds:IsAvailable()) + aa(R.KeepItRolling:IsAvailable()) if g:BuffDown(R.AudacityBuff) and
    (aE or g:BuffStack(R.Opportunity) < (R.FanTheHammer:IsAvailable() and 6 or 1)) and ax() then if l.Cast(R.Vanish, nil) then a8 = 1856; return "Cast Vanish (HO)" end return end end if (
    not R.FindWeakness:IsAvailable() or not R.Audacity:IsAvailable()) and not R.HiddenOpportunity:IsAvailable() and aw() then if l
    .Cast(R.Vanish, nil) then a8 = 1856; return "Cast Vanish (Finish)" end return end end end if R.ShadowDance:
    IsCastable() and p then if h:DebuffUp(R.BetweentheEyes) and
    (not R.GhostlyStrike:IsAvailable() or h:DebuffUp(R.GhostlyStrike)) and
    (not R.Dreadblades:IsAvailable() or not R.Dreadblades:IsCastable()) and
    (
    not R.HiddenOpportunity:IsAvailable() or
        g:BuffDown(R.AudacityBuff) and (R.FanTheHammer:TalentRank() < 2 or g:BuffDown(R.Opportunity))) then if R.KeepItRolling
    :IsAvailable() then if R.KeepItRolling:CooldownRemains() <= 30 or
    R.KeepItRolling:CooldownRemains() > 120 and (aw() or R.HiddenOpportunity:IsAvailable()) then if l.Cast(R.ShadowDance
  , nil) then a8 = 185313; return "Cast Shadow Dance (KiR)" end return end else if g:BuffUp(R.SliceandDice) and
    (aw() or R.HiddenOpportunity:IsAvailable()) and
    (not R.HiddenOpportunity:IsAvailable() or not R.Vanish:CooldownUp() or not az()) then if l.Cast(R.ShadowDance, nil) then a8 = 185313; return "Cast Shadow Dance" end return end end end end end

local function aF() if n() and R.AdrenalineRush:IsCastable() and not g:BuffUp(R.AdrenalineRush) and
    (not R.ImprovedAdrenalineRush:IsAvailable() or a0 <= 2) then if l.Cast(R.AdrenalineRush, nil) then a8 = 13750; return "Cast Adrenaline Rush" end end if R
    .BladeFlurry:IsReady() and m() and W >= 2 and g:BuffRemains(R.BladeFlurry) < (g:BuffUp(R.AdrenalineRush) and 0.8 or 1
    ) then if l.Cast(R.BladeFlurry) then a8 = 13877; return "Cast Blade Flurry" end end if R.RolltheBones:IsReady() and
    not g:DebuffUp(R.Dreadblades) and (aq() == 0 or at() or au()) then if l.Cast(R.RolltheBones) then a8 = 315508; return "Cast Roll the Bones" end end if n()
    and R.KeepItRolling:IsReady() and not at() and
    aa(g:BuffUp(R.Broadside)) + aa(g:BuffUp(R.TrueBearing)) + aa(g:BuffUp(R.SkullandCrossbones)) +
    aa(g:BuffUp(R.RuthlessPrecision)) > 2 and (g:BuffDown(R.ShadowDanceBuff) or aq() >= 6) then if l.Cast(R.KeepItRolling) then a8 = 381989; return "Cast KeepItRolling" end end if R
    .BladeRush:IsCastable() and h:IsSpellInRange(R.BladeRush) and ay() and not g:DebuffUp(R.Dreadblades) then if l.Cast(R
  .BladeRush, nil) then a8 = 271877; return "Cast Blade Rush" end end if h:IsSpellInRange(R.SinisterStrike) then if not
    g:StealthUp(true, true, true) or R.CountTheOdds:IsAvailable() and not av() then X = aD() if X then return X end end if R
    .Dreadblades:IsReady() and n() and h:IsSpellInRange(R.Dreadblades) and not g:StealthUp(true, true) and a0 <= 2 and
    (not R.MarkedforDeath:IsAvailable() or not R.MarkedforDeath:CooldownUp()) and h:FilteredTimeToDie(">=", 10) then if l
    .Cast(R.Dreadblades, nil) then a8 = 343142; return "Cast Dreadblades" end end end if R.ThistleTea:IsCastable() and
    n() and not g:BuffUp(R.ThistleTea) and (a4 >= 100 or d.BossFilteredFightRemains("<", R.ThistleTea:Charges() * 6)) then if l
    .Cast(R.ThistleTea, nil) then a8 = 381623; return "Cast Thistle Tea" end end if n() and R.KillingSpree:IsCastable()
    and h:IsSpellInRange(R.KillingSpree) and ay() and not g:StealthUp(true, false) and h:DebuffUp(R.BetweentheEyes) and
    a5 > 4 then if l.Cast(R.KillingSpree, nil) then a8 = 51690; return "Cast Killing Spree" end end if h:IsSpellInRange(R
  .SinisterStrike) then if R.Shadowmeld:IsCastable() and Q.Commons.Enabled.Racials and n() and
    (R.CountTheOdds:IsAvailable() and aw() or not R.Weaponmaster:IsAvailable() and ax()) then if l.Cast(R.Shadowmeld, nil) then a8 = 58984; return "Cast Shadowmeld" end end if Q
    .Commons.Enabled.Potions then local aG = O.PotionSelected() if aG then if aG:IsReady() and n() and s and
    (
    g:BloodlustUp() and l.GUISettings.General.HoldPotforBL or
        (g:BloodlustUp() or d.BossFightRemains() <= 60 or g:BuffUp(R.AdrenalineRush)) and
        not l.GUISettings.General.HoldPotforBL) then if l.Cast(aG, nil) then a8 = 50; return "potion cooldowns 2" end end end end if R
    .BloodFury:IsCastable() and Q.Commons.Enabled.Racials and n() then if l.Cast(R.BloodFury, nil) then a8 = 20572; return "Cast Blood Fury" end end if R
    .Berserking:IsCastable() and Q.Commons.Enabled.Racials and n() then if l.Cast(R.Berserking, nil) then a8 = 26297; return "Cast Berserking" end end if R
    .Fireblood:IsCastable() and Q.Commons.Enabled.Racials and n() then if l.Cast(R.Fireblood, nil) then a8 = 265221; return "Cast Fireblood" end end if R
    .AncestralCall:IsCastable() and Q.Commons.Enabled.Racials and n() then if l.Cast(R.AncestralCall, nil) then a8 = 274738; return "Cast Ancestral Call" end end local TrinketToUse = g
    :GetUseableTrinkets(T) if TrinketToUse and n() and
    (h:DebuffUp(R.BetweentheEyes) or d.BossFilteredFightRemains("<", 20) or TrinketToUse:TrinketHasStatAnyDps()) then if TrinketToUse then if l
    .Cast(TrinketToUse, nil, nil) then if TrinketToUse:ID() == GetInventoryItemID("player", 13) and
    Q.Commons.Enabled.TopTrinket then a8 = 24; if g.Cast:IsChanneling(TrinketToUse:ID() ==
  GetInventoryItemID("player", 13)) then if g.Cast(R.Pool) then a8 = 9999; return "POOL" end end return "Generic use_items for "
    .. TrinketToUse:Name() elseif TrinketToUse:ID() == GetInventoryItemID("player", 14) and
    Q.Commons.Enabled.BottomTrinket then a8 = 25; if g:IsChanneling(TrinketToUse:ID() == GetInventoryItemID("player", 13)) then if g
    .Cast(R.Pool) then a8 = 99999; return "POOL" end end return "Generic use_items for " .. TrinketToUse:Name() end end end end end if g
    :IsChanneling(TrinketToUse) then if l.Cast(R.Pool) then a8 = 99999; return "casting MANICGRIEFTORCH" end end end

local function aH() if R.BladeFlurry:IsReady() and m() and W >= 2 and R.Subterfuge:IsAvailable() and
    R.HiddenOpportunity:IsAvailable() and not g:BuffUp(R.BladeFlurry) then if l.Cast(R.BladeFlurry) then a8 = 13877; return "Cast Blade Flurry" end end if R
    .Dispatch:IsCastable() and h:IsSpellInRange(R.Dispatch) and aw() then if l.CastPooling(R.Dispatch) then a8 = 2098; return "Cast Dispatch" end end if R
    .Ambush:IsReady() and h:IsSpellInRange(R.Ambush) and
    (
    av() or R.HiddenOpportunity:IsAvailable() or
        (g:BuffUp(R.Stealth) or g:BuffUp(R.VanishBuff)) and R.FindWeakness:IsAvailable() and
        not h:DebuffUp(R.FindWeaknessDebuff)) then if l.CastPooling(R.Ambush) then a8 = 8676; return "Cast Ambush" end end end

local function aI() if R.BetweentheEyes:IsCastable() and h:IsSpellInRange(R.BetweentheEyes) and
    (h:FilteredTimeToDie(">", 4) or h:TimeToDieIsNotValid()) and P.CanDoTUnit(h, Z) and
    (
    h:DebuffRemains(R.BetweentheEyes) < 4 or R.GreenskinsWickers:IsAvailable() and not g:BuffUp(R.GreenskinsWickersBuff)
        or not R.GreenskinsWickers:IsAvailable() and g:BuffUp(R.RuthlessPrecision)) then if R.ColdBlood:IsReady() and
    R.ImprovedBetweentheEyes:IsAvailable() then if l.Cast(R.ColdBlood) then a8 = 382245; return "Cast ColdBlood" end end if l
    .CastPooling(R.BetweentheEyes) then a8 = 315341; return "Cast Between the Eyes" end end if R.SliceandDice:IsCastable()
    and (d.FilteredFightRemains(V, ">", g:BuffRemains(R.SliceandDice), true) or g:BuffRemains(R.SliceandDice) == 0) and
    g:BuffRemains(R.SliceandDice) < (1 + a0) * 1.8 and (not R.SwiftSlasher:IsAvailable() or a1 == 0) then if l.CastPooling(R
  .SliceandDice) then a8 = 315496; return "Cast Slice and Dice" end end if R.ColdBlood:IsReady() and
    R.ColdBlood:IsCastable() and not R.ImprovedBetweentheEyes:IsAvailable() then if l.Cast(R.ColdBlood) then a8 = 382245; return "Cast ColdBlood" end end if R
    .Dispatch:IsCastable() and h:IsSpellInRange(R.Dispatch) then if l.CastPooling(R.Dispatch) then a8 = 2098; return "Cast Dispatch" end end end

local function aJ() if n() and R.Sepsis:IsReady() and h:IsSpellInRange(R.Sepsis) and
    (h:FilteredTimeToDie(">", 11) and h:DebuffUp(R.BetweentheEyes) or d.BossFilteredFightRemains("<", 11)) then if l.Cast(R
  .Sepsis, nil, nil) then a8 = 328305; return "Cast Sepsis" end end if R.GhostlyStrike:IsReady() and
    h:IsSpellInRange(R.GhostlyStrike) and h:DebuffRemains(R.GhostlyStrike) <= 3 and (W <= 2 or g:BuffUp(R.Dreadblades))
    and g:BuffDown(R.SubterfugeBuff) and h:FilteredTimeToDie(">=", 5) then if l.Cast(R.GhostlyStrike, nil) then a8 = 196937; return "Cast Ghostly Strike" end end if R
    .EchoingReprimand:IsReady() and n() and h:IsSpellInRange(R.EchoingReprimand) and not g:DebuffUp(R.Dreadblades) then if l
    .Cast(R.EchoingReprimand, nil, nil) then a8 = 323547; return "Cast Echoing Reprimand" end end if R.Ambush:IsReady()
    and h:IsSpellInRange(R.Ambush) and
    (
    R.HiddenOpportunity:IsAvailable() and g:BuffUp(R.AudacityBuff) or
        R.FindWeakness:IsAvailable() and not h:DebuffUp(R.FindWeaknessDebuff)) then if l.Cast(R.Ambush) then a8 = 8676; return "Cast Ambush" end end if R
    .PistolShot:IsCastable() and h:IsSpellInRange(R.PistolShot) then if g:BuffUp(R.GreenskinsWickersBuff) and
    (not R.FanTheHammer:IsAvailable() and g:BuffUp(R.Opportunity)) then if l.CastPooling(R.PistolShot) then a8 = 185763; return "Cast Pistol Shot (Buffed)" end elseif g
    :BuffUp(R.GreenskinsWickersBuff) and g:BuffRemains(R.GreenskinsWickersBuff) < 1.5 then if l.CastPooling(R.PistolShot) then a8 = 185763; return "Cast Pistol Shot (GSW Dump)" end end if R
    .FanTheHammer:IsAvailable() and g:BuffUp(R.Opportunity) then if R.Audacity:IsAvailable() and
    R.HiddenOpportunity:IsAvailable() and g:BuffDown(R.AudacityBuff) and g:BuffDown(R.SubterfugeBuff) and
    g:BuffDown(R.ShadowDanceBuff) then if l.CastPooling(R.PistolShot) then a8 = 185763; return "Cast Pistol Shot (Audacity)" end elseif g
    :BuffStack(R.Opportunity) >= 6 or g:BuffRemains(R.Opportunity) < 2 then if l.CastPooling(R.PistolShot) then a8 = 185763; return "Cast Pistol Shot (FtH Dump)" end elseif a1
    > 1 + aa(R.QuickDraw:IsAvailable()) * R.FanTheHammer:TalentRank() and not g:DebuffUp(R.Dreadblades) and
    (not R.HiddenOpportunity:IsAvailable() or not g:BuffUp(R.SubterfugeBuff) and not g:BuffUp(R.ShadowDanceBuff)) then if l
    .CastPooling(R.PistolShot) then a8 = 185763; return "Cast Pistol Shot (FtH)" end end end end if R.Ambush:IsReady()
    and (g:BuffUp(R.AudacityBuff) or g:StealthUp(true, true)) and
    (R.HiddenOpportunity:IsAvailable() or R.FindWeakness:IsAvailable() and not h:DebuffUp(R.FindWeaknessDebuff)) then if l
    .CastPooling(R.Ambush) then a8 = 8676; return "Cast Ambush (Pooling)" end end if not R.FanTheHammer:IsAvailable() and
    R.PistolShot:IsCastable() and h:IsSpellInRange(R.PistolShot) and g:BuffUp(R.Opportunity) then if a5 > 1.5 or
    R.QuickDraw:IsAvailable() or R.Audacity:IsAvailable() and not g:BuffUp(R.AudacityBuff) or
    not R.Weaponmaster:IsAvailable() and a1 <= 1 + aa(g:BuffUp(R.Broadside)) then if l.CastPooling(R.PistolShot) then a8 = 185763; return "Cast Pistol Shot" end end end if R
    .SinisterStrike:IsCastable() and h:IsSpellInRange(R.SinisterStrike) then if l.CastPooling(R.SinisterStrike) then a8 = 193315; return "Cast Sinister Strike" end end end

local function aK() q = HeroRotationCharDB.Toggles[6]
o = HeroRotationCharDB.Toggles[4]
p = HeroRotationCharDB.Toggles[5]
r = HeroRotationCharDB.Toggles[12]
s = not HeroRotationCharDB.Toggles[15]
t = HeroRotationCharDB.Toggles[21]
v = HeroRotationCharDB.Toggles[22]
w = HeroRotationCharDB.Toggles[23]
x = HeroRotationCharDB.Toggles[24]
y = HeroRotationCharDB.Toggles[25]
z = HeroRotationCharDB.Toggles[27]
A = HeroRotationCharDB.Toggles[50]
B = HeroRotationCharDB.Toggles[51]
u = HeroRotationCharDB.Toggles[52]
C = HeroRotationCharDB.Toggles[53]
D = HeroRotationCharDB.Toggles[30]
E = HeroRotationCharDB.Toggles[54]
M = GetInventoryItemID("player", 13)
N = GetInventoryItemID("player", 14)
if not Q.Commons.Enabled.TopTrinket and not Q.Commons.Enabled.BottomTrinket then T = { M, N } elseif not
    Q.Commons.Enabled.TopTrinket and Q.Commons.Enabled.BottomTrinket then T = { M } elseif not
    Q.Commons.Enabled.BottomTrinket and Q.Commons.Enabled.TopTrinket then T = { N } end F = 0; for ap = 1, 20 do if select(10
  , UnitDebuff("player", ap)) == 240447 then if select(6, UnitDebuff("player", ap)) ~= nil then F = select(6,
  UnitDebuff("player", ap)) - GetTime() end end end end

local function aL() Y = R.AcrobaticStrikes:IsAvailable() and 9 or 6;
Z = R.Dispatch:Damage() * 1.25;
a0 = g:ComboPoints()
_ = P.EffectiveComboPoints(a0)
a1 = g:ComboPointsDeficit()
a6 = g:BuffUp(R.AdrenalineRush, nil, true) and -50 or 0;
a2 = ah()
a3 = g:EnergyRegen()
a5 = ae(a6)
a4 = g:EnergyDeficitPredicted(nil, a6)
if m() then U = g:GetEnemiesInRange(30)
V = g:GetEnemiesInRange(Y)
W = #V
else W = 1 end X = aK() if l.QueuedCast() then a8 = l.QueuedCast() return "Custom Queue " .. i(a8):ID() end if X then return X end if a9
    > 0 then a9 = 0 end if a8 > 0 then a8 = 0 end a8 = P.ReturnSpell()
a9 = P.ReturnSpellMO()
if l.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then K = GetTime()
L = K + l.GUISettings.General.OpenerReset
elseif l.GUISettings.General.OpenerReset > 0 and L ~= nil and GetTime() > L and HeroRotationCharDB.Toggles[6] then HeroRotationCharDB
    .Toggles[6] = not HeroRotationCharDB.Toggles[6] l.ToggleIconFrame:UpdateButtonText(6) l.Print("Opener is now " ..
  (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r.")) end if C and
    R.GrapplingHook:IsUsableP() and R.GrapplingHook:CooldownRemains(BypassRecovery) <= 0 then if l.Cast(R.GrapplingHook,
  nil, nil, nil) then a8 = 195457; return "queue Grappling Hook" end elseif (
    not R.GrapplingHook:IsUsableP() or R.GrapplingHook:CooldownRemains() > 0) and C then HeroRotationCharDB.Toggles[53] = not
    HeroRotationCharDB.Toggles[53] l.Print("Gouge Queue is now " ..
  (HeroRotationCharDB.Toggles[53] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if v and R.CheapShot:IsUsableP() and
    R.CheapShot:CooldownRemains(BypassRecovery) <= 0 and (g:StealthUp(true, true) or g:BuffUp(R.VanishBuff)) and
    (h:IsInRange(8) or f("mouseover"):IsInRange(8)) then if l.Cast(R.CheapShot, nil, nil, nil) then if f("mouseover"):
    GUID() ~= nil and f("mouseover"):IsSpellInRange(R.CheapShot) then a9 = 18335; return "queue Cheap Shot MO" else a8 = 1833; return "queue Cheap Shot" end end elseif (
    not R.CheapShot:IsUsableP() or R.CheapShot:CooldownRemains() > 0) and v then HeroRotationCharDB.Toggles[22] = not
    HeroRotationCharDB.Toggles[22] l.Print("Cheap Shot Queue is now " ..
  (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if w and R.KidneyShot:IsUsableP() and
    R.KidneyShot:CooldownRemains(BypassRecovery) <= 0 and (h:IsInRange(8) or f("mouseover"):IsInRange(8)) then if l.Cast(R
  .KidneyShot, nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(R.KidneyShot) then a9 = 4085; return "queue Kidney Shot MO" else a8 = 408; return "queue Kidney Shot" end end elseif (
    not R.KidneyShot:IsUsableP() or R.KidneyShot:CooldownRemains() > 0) and w then HeroRotationCharDB.Toggles[23] = not
    HeroRotationCharDB.Toggles[23] l.Print("Kidney Shot Queue is now " ..
  (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if x and R.Blind:IsUsableP() and
    R.Blind:CooldownRemains(BypassRecovery) <= 0 and (h:IsInRange(15) or f("mouseover"):IsInRange(15)) then if l.Cast(R.Blind
  , nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(R.Blind) then a9 = 20945; return "queue Blind MO" end end elseif (
    not R.Blind:IsUsableP() or R.Blind:CooldownRemains() > 0) and x then HeroRotationCharDB.Toggles[24] = not
    HeroRotationCharDB.Toggles[24] l.Print("Blind Queue is now " ..
  (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if y and R.Sap:IsUsableP() and
    R.Sap:CooldownRemains(BypassRecovery) <= 0 and g:StealthUp(true, true) and
    (h:IsInRange(10) or f("mouseover"):IsInRange(10)) then if l.Cast(R.Sap, nil, nil, nil) then if f("mouseover"):GUID()
    ~= nil and f("mouseover"):IsSpellInRange(R.Sap) then a9 = 67705; return "queue Sap MO" else a8 = 6770; return "queue Sap" end end elseif (
    not R.Sap:IsUsableP() or R.Sap:CooldownRemains() > 0 or not g:StealthUp(true, true)) and y then HeroRotationCharDB.Toggles
    [25] = not HeroRotationCharDB.Toggles[25] l.Print("Sap Queue is now " ..
  (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if z and R.Feint:IsUsableP() and
    R.Feint:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(R.Feint, nil, nil, nil) then a8 = 202; return "queue Shuriken Tornado" end elseif (
    not R.Feint:IsUsableP() or R.Feint:CooldownRemains() > 0 or not g:AffectingCombat()) and z then HeroRotationCharDB.Toggles
    [27] = not HeroRotationCharDB.Toggles[27] l.Print("Feint Queue is now " ..
  (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if A and R.Gouge:IsUsableP() and
    R.Gouge:CooldownRemains(BypassRecovery) <= 0 then if l.Cast(R.Gouge, nil, nil, nil) then if f("mouseover"):GUID() ~=
    nil and f("mouseover"):IsSpellInRange(R.Gouge) then a9 = 17765; return "queue Gouge MO" elseif f("target"):
    IsSpellInRange(R.Gouge) then a8 = 1776; return "queue Gouge" end end elseif (
    not R.Gouge:IsUsableP() or R.Gouge:CooldownRemains() > 0 or not g:AffectingCombat()) and A then HeroRotationCharDB.Toggles
    [50] = not HeroRotationCharDB.Toggles[50] l.Print("Gouge Queue is now " ..
  (HeroRotationCharDB.Toggles[50] and "|cff00ff00on|r." or "|cffff0000off|r.")) end if D then if R.ArcaneTorrent:
    IsAvailable() and R.ArcaneTorrent:IsUsableP() and R.ArcaneTorrent:CooldownRemains(BypassRecovery) <= 0 and
    g:AffectingCombat() then if l.Cast(R.ArcaneTorrent, nil, nil, nil) then a8 = 155145; return "queue ArcaneTorrent Queue" end elseif R
    .LightsJudgment:IsAvailable() and R.LightsJudgment:IsUsableP() and
    R.LightsJudgment:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(R.LightsJudgment, nil,
  nil, nil) then a8 = 255647; return "queue ArcaneTorrent Queue" end elseif R.BagofTricks:IsAvailable() and
    R.BagofTricks:IsUsableP() and R.BagofTricks:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(R
  .BagofTricks, nil, nil, nil) then a8 = 312411; return "queue ArcaneTorrent Queue" end elseif R.BloodFury:IsAvailable()
    and R.BloodFury:IsUsableP() and R.BloodFury:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l.Cast(R
  .BloodFury, nil, nil, nil) then a8 = 20572; return "queue ArcaneTorrent Queue" end elseif R.Berserking:IsAvailable()
    and R.Berserking:IsUsableP() and R.Berserking:CooldownRemains(BypassRecovery) <= 0 and g:AffectingCombat() then if l
    .Cast(R.Berserking, nil, nil, nil) then a8 = 26297; return "queue ArcaneTorrent Queue" end elseif R.Fireblood:
    IsAvailable() and R.Fireblood:IsUsableP() and R.Fireblood:CooldownRemains(BypassRecovery) <= 0 and
    g:AffectingCombat() then if l.Cast(R.Fireblood, nil, nil, nil) then a8 = 265221; return "queue ArcaneTorrent Queue" end elseif R
    .AncestralCall:IsAvailable() and R.AncestralCall:IsUsableP() and R.AncestralCall:CooldownRemains(BypassRecovery) <= 0
    and g:AffectingCombat() then if l.Cast(R.AncestralCall, nil, nil, nil) then a8 = 274738; return "queue ArcaneTorrent Queue" end elseif (
    R.ArcaneTorrent:IsAvailable() and
        (not R.ArcaneTorrent:IsUsableP() or R.ArcaneTorrent:CooldownRemains() > 0 or not g:AffectingCombat()) or
        R.LightsJudgment:IsAvailable() and
        (not R.LightsJudgment:IsUsableP() or R.LightsJudgment:CooldownRemains() > 0 or not g:AffectingCombat()) or
        R.BagofTricks:IsAvailable() and
        (not R.BagofTricks:IsUsableP() or R.BagofTricks:CooldownRemains() > 0 or not g:AffectingCombat()) or
        R.BloodFury:IsAvailable() and
        (not R.BloodFury:IsUsableP() or R.BloodFury:CooldownRemains() > 0 or not g:AffectingCombat()) or
        R.Berserking:IsAvailable() and
        (not R.Berserking:IsUsableP() or R.Berserking:CooldownRemains() > 0 or not g:AffectingCombat()) or
        R.Fireblood:IsAvailable() and
        (not R.Fireblood:IsUsableP() or R.Fireblood:CooldownRemains() > 0 or not g:AffectingCombat()) or
        R.AncestralCall:IsAvailable() and
        (not R.AncestralCall:IsUsableP() or R.AncestralCall:CooldownRemains() > 0 or not g:AffectingCombat())) and D then HeroRotationCharDB
    .Toggles[30] = not HeroRotationCharDB.Toggles[30] l.Print("Arcane Torrent Queue is now " ..
  (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r.")) end end if g:IsChanneling(i(324631)) then if l
    .Cast(R.PoolEnergy, nil, nil, nil) then a8 = 99999; return "channeling Fleashcraft" end end X = P.CrimsonVial() if X then return X end X = P
    .Feint() if X then return X end X = P.Evasion() if X then return X end if g:HealthPercentage() < Q.Commons.PhialHP
    and S.PhialofSerenity:IsReady() and S.PhialofSerenity:CooldownRemains() <= 0 then if l.Cast(S.PhialofSerenity, nil) then a8 = 55; return "PhialofSerenity HP" end end if g
    :HealthPercentage() < Q.Commons.HealthstoneHP and S.Healthstone:IsReady() and S.Healthstone:CooldownRemains() <= 0 then if l
    .Cast(S.Healthstone, nil) then a8 = 40; return "Healthstone HP" end end if g:HealthPercentage() < Q.Commons.HealPotHP
    and S.CosmicHealPot:IsReady() and S.CosmicHealPot:CooldownRemains() <= 0 then if l.Cast(S.CosmicHealPot, nil) then a8 = 45; return "CosmicHealPot HP" end end if g
    :HealthPercentage() < Q.Commons.HealPotHP and S.HealPot:IsReady() and S.HealPot:CooldownRemains() <= 0 then if l.Cast(S
  .HealPot, nil) then a8 = 41; return "HealPot HP" end end if UnitExists("mouseover") and
    string.find(UnitGUID("mouseover"), 120651) then if R.PistolShot:IsCastable() and f("mouseover"):IsInMeleeRange(20) then if l
    .Cast(R.PistolShot, nil) then a9 = 1185763; return "explosive MO Pistol" end end end if R.PistolShot:IsCastable() and
    f("target"):IsInMeleeRange(40) and string.find(UnitGUID("target"), 120651) then if l.Cast(R.PistolShot, nil) then a8 = 185763; return "explosive Tar Pistol" end end G = { 324736,
  228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477,
  368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 158337 } if UnitExists("target") and R.Shiv:IsReady()
    and not E then if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~=
    true then for ap = 0, 10 do local aM, aM, aN, aO, aP, aQ, aM, aM, aM, aR = UnitBuff("target", ap) for aM, aS in pairs(G) do if aS
    == aR and aQ - aP + 500 / 1000 <= GetTime() then if l.Cast(R.Shiv, nil) then a8 = 5938; return "Shiv Enrage" end end end end end end local aT = g
    :AffectingCombat() and 180 or 900;
local aU;
if i(8679):IsAvailable() and Q.Commons.LethalPoison == "Wound Poison" then aU = g:BuffRemains(i(8679)) if aU < aT and
    not g:IsCasting(i(8679)) then if l.Cast(i(8679)) then a8 = 203; return "Wound Poison Refresh" end end elseif i(2823)
    :IsAvailable() and Q.Commons.LethalPoison == "Deadly Poison" then aU = g:BuffRemains(i(2823)) if aU < aT and
    not g:IsCasting(i(2823)) then if l.Cast(i(2823)) then a8 = 208; return "Deadly Poison Refresh" end end elseif i(315584)
    :IsAvailable() and Q.Commons.LethalPoison == "Instant Poison" then aU = g:BuffRemains(i(315584)) if aU < aT and
    not g:IsCasting(i(315584)) then if l.Cast(i(315584)) then a8 = 205; return "Instant Poison Refresh" end end end aU = g
    :BuffRemains(i(381637)) if i(381637):IsAvailable() and Q.Commons.NonLethalPoison == "Atrophic Poison" then if aU < aT
    and not g:IsCasting(i(381637)) then if l.Cast(i(381637)) then a8 = 381637; return "Antropic Poison Refresh" end end elseif i(5761)
    :IsAvailable() and Q.Commons.NonLethalPoison == "Numbing Poison" then aU = g:BuffRemains(i(5761)) if aU < aT and
    not g:IsCasting(NumbingPoison) then if l.Cast(i(5761)) then a8 = 204; return "Numbing Poison Refresh" end end elseif i(3408)
    :IsAvailable() and Q.Commons.NonLethalPoison == "Crippling Poison" then aU = g:BuffRemains(i(3408)) if aU < aT and
    not g:IsCasting(NumbingPoison) then if l.Cast(i(3408)) then a8 = 206; return "Crippling Poison Refresh" end end end if not
    g:BuffUp(R.VanishBuff) and not g:AffectingCombat() and not g:StealthUp(true, true) then X = P.Stealth(R.Stealth) if X then return X end end if not
    g:AffectingCombat() and q then if O.TargetIsValid() and (not g:AffectingCombat() and q) then if n() and
    R.MarkedforDeath:IsCastable() and a1 >= P.CPMaxSpend() - 1 and h:NPCID() ~= 170234 then if Q.Commons.STMfDAsDPSCD then if l
    .Cast(R.MarkedforDeath, nil) then a8 = 137619; return "Cast Marked for Death (OOC)" end else if l.Cast(R.MarkedforDeath
  , nil) then a8 = 137619; return "Cast Marked for Death (OOC)" end end end if R.RolltheBones:IsReady() and
    not g:DebuffUp(R.Dreadblades) and (aq() == 0 or at() or au()) and g:BuffUp(R.AdrenalineRush) then if l.Cast(R.RolltheBones) then a8 = 315508; return "Cast Roll the Bones (Opener)" end end if R
    .SliceandDice:IsReady() and g:BuffRemains(R.SliceandDice) < (1 + a0) * 1.8 then if l.CastPooling(R.SliceandDice) then a8 = 315496; return "Cast Slice and Dice (Opener)" end end if g
    :StealthUp(true, false) or g:BuffUp(R.VanishBuff) then X = aH() if X then return "Stealth (Opener): " .. X end if R.Ambush
    :IsReady() then if l.Cast(R.Ambush) then a8 = 8676; return "Cast Ambush (Opener)" end end elseif aw() then X = aI() if X then return "Finish (Opener): "
    .. X end end if R.SinisterStrike:IsCastable() then if l.Cast(R.SinisterStrike) then a8 = 193315; return "Cast Sinister Strike (Opener)" end end end return end if R
    .MarkedforDeath:IsCastable() and (g:AffectingCombat() or q or g:BuffUp(R.VanishBuff)) then if W > 1 and
    O.CastTargetIf(R.MarkedforDeath, U, "min", aA, aC, nil, nil) then return "Cast Marked for Death (Cycle)" elseif W ==
    1 and not g:StealthUp(true, false) and a1 >= P.CPMaxSpend() - 1 and not g:DebuffUp(R.Dreadblades) and
    h:NPCID() ~= 170234 then if l.Cast(R.MarkedforDeath, nil) then a8 = 137619; return "Cast Marked for Death (ST)" end end end if O
    .TargetIsValid() and (g:AffectingCombat() or q or g:BuffUp(R.VanishBuff)) and not h:DebuffUp(i(1776)) and
    not h:DebuffUp(i(6770)) then if g:BuffUp(R.Stealth) or g:BuffUp(R.VanishBuff) or g:BuffUp(R.Shadowmeld) then X = aH() if X then return "Stealth: "
    .. X end end local aV, aW, aM = GetSpellCooldown(57934) if Q.Commons.AutoToT then if aV + aW - GetTime() <= 0 and
    R.TricksoftheTrade:IsAvailable() and R.TricksoftheTrade:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus")
    and (UnitInParty("focus") or UnitInRaid("focus")) and IsItemInRange(32698, "focus") then if l.Cast(R.TricksoftheTrade) then a8 = 207; return "ToT Focus" end end end X = aF() if X then return "CDs: "
    .. X end if av() then X = aH() if X then return "Stealth CtO: " .. X end end if aw() then X = aI() if X then return "Finish: "
    .. X end l.Cast(R.PoolEnergy) return "Finish Pooling" end X = aJ() if X then return "Build: " .. X end if R.ArcaneTorrent
    :IsCastable() and Q.Commons.Enabled.Racials and n() and h:IsSpellInRange(R.SinisterStrike) and a4 > 15 + a3 then if l
    .Cast(R.ArcaneTorrent, nil) then a8 = 155145; return "Cast Arcane Torrent" end end if R.ArcanePulse:IsCastable() and
    Q.Commons.Enabled.Racials and n() and h:IsSpellInRange(R.SinisterStrike) then if l.Cast(R.ArcanePulse) then a8 = 260364; return "Cast Arcane Pulse" end end if R
    .LightsJudgment:IsCastable() and Q.Commons.Enabled.Racials and n() and h:IsInMeleeRange(5) then if l.Cast(R.LightsJudgment
  , nil) then a8 = 255647; return "Cast Lights Judgment" end end if R.BagofTricks:IsCastable() and
    Q.Commons.Enabled.Racials and n() and h:IsInMeleeRange(5) then if l.Cast(R.BagofTricks, nil) then a8 = 312411; return "Cast Bag of Tricks" end end if R
    .PistolShot:IsCastable() and h:IsSpellInRange(R.PistolShot) and not h:IsInRange(Y) and not g:StealthUp(true, true)
    and a4 < 25 and (a1 >= 1 or a5 <= 1.2) then if l.Cast(R.PistolShot) then a8 = 185763; return "Cast Pistol Shot (OOR)" end end end end

local function aX() end

function ReturnSpellOut() if a8 == 0 then return 0 else return a8 end end

function ReturnSpellMOOut() if a9 == 0 then return 0 else return a9 end end

l.SetAPL(260, aL, aX)
