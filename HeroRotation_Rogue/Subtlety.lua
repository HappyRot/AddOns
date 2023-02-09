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
local l = d.Utils.BoolToInt;
local m = HeroRotation;
local n = m.AoEON;
local o = m.CDsON;
local p = HeroRotationCharDB.Toggles[4]
local q = HeroRotationCharDB.Toggles[5]
local r = HeroRotationCharDB.Toggles[6]
local s = HeroRotationCharDB.Toggles[12]
local t = not HeroRotationCharDB.Toggles[15]
local u = HeroRotationCharDB.Toggles[20]
local v = HeroRotationCharDB.Toggles[21]
local w = HeroRotationCharDB.Toggles[22]
local x = HeroRotationCharDB.Toggles[23]
local y = HeroRotationCharDB.Toggles[24]
local z = HeroRotationCharDB.Toggles[25]
local A = HeroRotationCharDB.Toggles[26]
local B = HeroRotationCharDB.Toggles[27]
local C = HeroRotationCharDB.Toggles[28]
local D = HeroRotationCharDB.Toggles[29]
local E = HeroRotationCharDB.Toggles[30]
local F = HeroRotationCharDB.Toggles[54]
local G = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241,
    331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 321220, 158337 }
local H = nil;
local I = nil;
local J = 0;
local K = 0;
local pairs = pairs;
local L = table.insert;
local M = math.min;
local N = math.max;
local O = math.abs;
local P = m.Commons.Everyone;
local Q = m.Commons.Rogue;
local R = i.Rogue.Subtlety;
local S = k.Rogue.Subtlety;
local T = { General = m.GUISettings.General, Commons = m.GUISettings.APL.Rogue.Commons,
    Subtlety = m.GUISettings.APL.Rogue.Subtlety }
local U = g:GetEquipment()
local V = U[13] and k(U[13]) or k(0)
local W = U[14] and k(U[14]) or k(0)
local X = GetInventoryItemID("player", 13)
local Y = GetInventoryItemID("player", 14)
local Z = {}
d:RegisterForEvent(function()
    U = g:GetEquipment()
    V = U[13] and k(U[13]) or k(0)
    W = U[14] and k(U[14]) or k(0)
end, "PLAYER_EQUIPMENT_CHANGED")
local _, a0, a1, a2;
local a3, a4, a5, a6;
local a7;
local a8 = Q.ReturnSpell()
local a9 = Q.ReturnSpellMO()
local aa, ab, ac;
local ad, ae;
local af, ag;
local ah = 11111;
local ai = 11111;
local aj, ak, al;
local am;
local an;
local ao;
local ap;
local aq;
local ar;
local as;
local at;
local au;
local av;
local aw;
local ax = g:CovenantID()
d:RegisterForEvent(function() ax = g:CovenantID() end, "COVENANT_CHOSEN")
d:RegisterForEvent(function()
    ah = 11111;
    ai = 11111
end, "PLAYER_REGEN_ENABLED")
local function ay(az) if az then return 1 else return 0 end end
;
local function aA() return 25 + ay(R.Vigor:IsAvailable()) * 20 + ay(R.MasterofShadows:IsAvailable()) * 20 +
        ay(R.ShadowFocus:IsAvailable()) * 25 + ay(R.Alacrity:IsAvailable()) * 20 + ay(a1 >= 4) * 25 end
;
local function aB() return R.ShadowDance:ChargesFractional() >= 0.75 + l(R.ShadowDanceTalent:IsAvailable()) end
;
local function aC() if a1 == 4 then return true elseif a1 > 4 - 2 * l(R.ShurikenTornado:IsAvailable()) or am and a1 >= 4 then return
            al <= 1 elseif a1 == 3 then return al >= 2 else return ak <= 1 end end
;
local function av() return g:BuffUp(R.SliceandDice) or a1 >= Q.CPMaxSpend() end
;
local function aD(ShadowDanceBuff) return g:BuffUp(R.ThistleTea) and a1 == 1 or
        ShadowDanceBuff and (a1 == 1 or h:DebuffUp(R.Rupture) and a1 >= 2) end
;
local function aE(aF)
    local aG = 0;
    for aH in pairs(aF) do
        local aI = aF[aH]
        if aI:DebuffUp(R.Rupture) then aG = aG + 1 end
    end
    ;
    return aG
end
;
local function aJ(aK) return aK:DebuffRemains(R.FindWeaknessDebuff) end
;
local function aL(aK) return aK:TimeToDie() end
;
local function aM(aK) return aK:DebuffRemains(R.Rupture) end
;
local function aN(aK) if (aK:DebuffRemains(R.FindWeaknessDebuff) < 1 or R.SymbolsofDeath:CooldownRemains() < 18 and aK:DebuffRemains(R.FindWeaknessDebuff) < R.SymbolsofDeath:CooldownRemains()) and aK:GUID() == f("mouseover"):GUID() and T.Subtlety.TargetSwap == "Mouseover" then
        a9 = 1185438;
        return true
    elseif (aK:DebuffRemains(R.FindWeaknessDebuff) < 1 or R.SymbolsofDeath:CooldownRemains() < 18 and aK:DebuffRemains(R.FindWeaknessDebuff) < R.SymbolsofDeath:CooldownRemains()) and T.Subtlety.TargetSwap == "AutoSwap" and aK:GUID() ~= h:GUID() and not s then
        a9 = 9999;
        return true
    elseif (aK:DebuffRemains(R.FindWeaknessDebuff) < 1 or R.SymbolsofDeath:CooldownRemains() < 18 and aK:DebuffRemains(R.FindWeaknessDebuff) < R.SymbolsofDeath:CooldownRemains()) and aK:GUID() == h:GUID() then
        a8 = 185438;
        return true
    elseif aK:DebuffRemains(R.FindWeaknessDebuff) < 1 or R.SymbolsofDeath:CooldownRemains() < 18 and aK:DebuffRemains(R.FindWeaknessDebuff) < R.SymbolsofDeath:CooldownRemains() then return true end end
;
local function aO(aK) if aK:IsInRange(8) and aK:TimeToDie() > 10 and aK:GUID() == f("mouseover"):GUID() and T.Subtlety.TargetSwap == "Mouseover" then
        a9 = 1323654;
        return true
    elseif aK:IsInRange(8) and aK:TimeToDie() > 10 and T.Subtlety.TargetSwap == "AutoSwap" and aK:GUID() ~= h:GUID() and not s then
        a9 = 9999;
        return true
    elseif aK:IsInRange(8) and aK:TimeToDie() > 10 and aK:GUID() == h:GUID() then
        a8 = 323654;
        return true
    elseif aK:IsInRange(8) and aK:TimeToDie() > 10 then return true end end
;
local function aP(aK) if (aK:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= Q.CPMaxSpend()) and aK:GUID() == f("mouseover"):GUID() and T.Subtlety.TargetSwap == "Mouseover" then
        a9 = 1137619;
        return true
    elseif (aK:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= Q.CPMaxSpend()) and T.Subtlety.TargetSwap == "AutoSwap" and aK:GUID() ~= h:GUID() and not s then
        a9 = 9999;
        return true
    elseif (aK:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= Q.CPMaxSpend()) and aK:GUID() == h:GUID() then
        a8 = 137619;
        return true
    elseif aK:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= Q.CPMaxSpend() then return true end end
;
local function aQ(aK) if aK:FilteredTimeToDie(">=", 2 * ak) and aK:DebuffRefreshable(R.Rupture) and aK:GUID() == f("mouseover"):GUID() and T.Subtlety.TargetSwap == "Mouseover" then
        a9 = 11943;
        return true
    elseif aK:FilteredTimeToDie(">=", 2 * ak) and aK:DebuffRefreshable(R.Rupture) and T.Subtlety.TargetSwap == "AutoSwap" and aK:GUID() ~= h:GUID() and not s then
        a9 = 9999;
        return true
    elseif aK:FilteredTimeToDie(">=", 2 * ak) and aK:DebuffRefreshable(R.Rupture) and aK:GUID() == h:GUID() then
        a8 = 1943;
        return true
    elseif aK:FilteredTimeToDie(">=", 2 * ak) and aK:DebuffRefreshable(R.Rupture) then return true end end
;
local function aR()
    if R.ShurikenStorm:IsReady() and a1 >= 2 + ay(g:BuffUp(R.LingeringShadow) or g:BuffUp(R.PerforatedVeinsBuff)) then if m.Cast(R.ShurikenStorm) then
            a8 = 197835;
            return "Cast Shuriken Storm"
        end end
    ;
    an = not R.EchoingReprimand:IsAvailable() or not (ap and (Q.TimeToSht(3) < 0.5 or Q.TimeToSht(4) < 1) and g:Energy() < 60)
    if R.Gloomblade:IsReady() and an then if m.Cast(R.Gloomblade) then
            a8 = 200758;
            return "Cast Gloomblade"
        end end
    ;
    if R.Backstab:IsReady() and an then if m.Cast(R.Backstab) then
            a8 = 53;
            return "Cast Backstab"
        end end
end
;
local function aS()
    if R.ShadowDance:IsReady() and SDReady and not g:BuffUp(R.ShadowDanceBuff) and g:BuffUp(R.ShurikenTornado) and g:BuffRemains(R.ShurikenTornado) <= 3.5 then if m.Cast(R.ShadowDance) then
            a8 = 185313;
            return "Cast Shadow Dance (during Tornado)"
        end end
    ;
    if R.SymbolsofDeath:IsReady() and SoDReady and g:BuffUp(R.ShurikenTornado) and g:BuffRemains(R.ShurikenTornado) <= 3.5 then if m.Cast(R.SymbolsofDeath) then
            a8 = 212283;
            return "Cast Symbols of Death(during Tornado)"
        end end
    ;
    if R.ColdBlood:IsReady() and q and ((not R.DanseMacabre:IsAvailable() or not R.SecretTechnique:IsAvailable()) and ak >= 5) then if m.Cast(R.ColdBlood) then
            a8 = 382245;
            return "Cast ColdBlood 1"
        end end
    ;
    if R.ColdBlood:IsReady() and q and R.SecretTechnique:IsAvailable() then if m.Cast(R.ColdBlood) then
            a8 = 382245;
            return "Cast ColdBlood 2"
        end end
    ;
    if R.Flagellation:IsReady() and o() and (av() and ak >= 5) then if P.CastTargetIf(R.Flagellation, a0, "max", aL, aO, not h:IsInMeleeRange(8)) then return
            "Cast Flagellation" end end
    ;
    if R.ShurikenTornado:IsCastable() and a1 <= 1 and av() and R.SymbolsofDeath:CooldownUp() and R.ShadowDance:Charges() >= 1 and (not R.Flagellation:IsAvailable() or g:BuffUp(R.Flagellation) or a1 >= 5) and ak <= 2 and not g:BuffUp(R.PremeditationBuff) then if g:Energy() >= 60 then if m.Cast(R.ShurikenTornado, T.Subtlety.GCDasOffGCD.ShurikenTornado) then
                a8 = 277925;
                return "Cast Shuriken Tornado"
            end elseif not R.ShadowFocus:IsAvailable() then if m.CastPooling(R.ShurikenTornado) then
                a8 = 277925;
                return "Pool for Shuriken Tornado"
            end end end
    ;
    if R.Sepsis:IsReady() and o() and av() and al >= 1 and h:FilteredTimeToDie(">=", 16) then if m.Cast(R.Sepsis, nil, nil) then
            a8 = 328305;
            return "Cast Sepsis"
        end end
    ;
    if R.SymbolsofDeath:IsReady() and SoDReady and (av() and (not R.Flagellation:IsAvailable() or (R.Flagellation:CooldownRemains() > 10 or not o()) or R.Flagellation:CooldownUp() and ak >= 5)) then if m.Cast(R.SymbolsofDeath, nil) then
            a8 = 212283;
            return "Cast Symbols of Death"
        end end
    ;
    if R.MarkedforDeath:IsReady() then if P.CastTargetIf(R.MarkedforDeath, a0, "min", aL, aP, not h:IsInMeleeRange(8)) then return
            "Cast Marked for Death" end end
    ;
    if R.MarkedforDeath:IsReady() and (UnitIsUnit("target", "boss1") or UnitIsUnit("target", "boss2") or UnitIsUnit("target", "boss3") or UnitIsUnit("target", "boss4")) and al >= Q.CPMaxSpend() then if m.Cast(R.MarkedforDeath, nil) then
            a8 = 137619;
            return "Cast Marked for Death boss"
        end end
    ;
    if R.ShadowBlades:IsReady() and SBReady and (av() and al >= 2) then if m.Cast(R.ShadowBlades, nil) then
            a8 = 121471;
            return "Cast Shadow Blades"
        end end
    ;
    if R.EchoingReprimand:IsReady() and o() and (av() and al >= 3 and (ar or a1 <= 4 or R.ResoundingClarity:IsAvailable()) and (g:BuffUp(R.ShadowDanceBuff) or not R.DanseMacabre:IsAvailable())) then if m.Cast(R.EchoingReprimand, nil, nil) then
            a8 = 323547;
            return "Cast Echoing Reprimand"
        end end
    ;
    if R.ShurikenTornado:IsReady() and STReady and not D and (av() and g:BuffUp(R.SymbolsofDeath) and ak <= 2 and (not g:BuffUp(R.PremeditationBuff) or a1 > 4)) then if m.Cast(R.ShurikenTornado) then
            a8 = 277925;
            return "Cast Shuriken Tornado (SF)"
        end end
    ;
    if R.ShadowDance:IsReady() and SDReady and (not g:BuffUp(R.ShadowDanceBuff) and ai <= 8 + ay(R.Subterfuge:IsAvailable())) then if m.Cast(R.ShadowDance) then
            a8 = 185313;
            return "Cast Shadow Dance"
        end end
    ;
    if R.ThistleTea:IsReady() and o() and (R.SymbolsofDeath:CooldownRemains() >= 3 and not g:BuffUp(R.ThistleTeaBuff) and (g:EnergyDeficitPredicted() >= 100 or R.ThistleTea:ChargesFractional() >= 2.75 and g:EnergyDeficitPredicted() >= 40)) then if m.Cast(R.ThistleTea) then
            a8 = 381623;
            return "Cast ThistleTea"
        end end
    ;
    if T.Commons.Enabled.Potions and o() and t and ((g:BloodlustUp() or ai < 30 or g:BuffUp(R.SymbolsofDeath) and (g:BuffUp(R.ShadowBlades) or R.ShadowBlades:CooldownRemains() <= 10)) and not m.GUISettings.General.HoldPotforBL or m.GUISettings.General.HoldPotforBL and g:BloodlustUp()) then
        local aT = P.PotionSelected()
        if aT and aT:IsReady() then if m.Cast(aT, nil, nil) then
                a8 = 37;
                return "potion cooldowns 2"
            end end
    end
    ;
    if g:BuffUp(R.SymbolsofDeath) and o() then
        if R.BloodFury:IsReady() and T.Commons.Enabled.Racials then if m.Cast(R.BloodFury, nil) then
                a8 = 20572;
                return "Cast Blood Fury"
            end end
        ;
        if R.Berserking:IsReady() and T.Commons.Enabled.Racials then if m.Cast(R.Berserking, nil) then
                a8 = 26297;
                return "Cast Berserking"
            end end
        ;
        if R.Fireblood:IsReady() and T.Commons.Enabled.Racials then if m.Cast(R.Fireblood, nil) then
                a8 = 265221;
                return "Cast Fireblood"
            end end
        ;
        if R.AncestralCall:IsReady() and T.Commons.Enabled.Racials then if m.Cast(R.AncestralCall, nil) then
                a8 = 274738;
                return "Cast Ancestral Call"
            end end
    end
    ;
    if (T.Commons.Enabled.TopTrinket or T.Commons.Enabled.BottomTrinket) and o() then
        local aU = g:GetUseableTrinkets(Z)
        if S.CacheOfAcquiredTreasures:IsEquippedAndReady() then if g:BuffUp(R.AcquiredAxe) and a1 > 1 then if S.CacheOfAcquiredTreasures:ID() == X and T.Commons.Enabled.TopTrinket then
                    a8 = 24;
                    return "top trinket Cache Axe for AoE"
                elseif S.CacheOfAcquiredTreasures:ID() == Y and T.Commons.Enabled.BottomTrinket then
                    a8 = 25;
                    return "bot trinket Cache Axe for AoE"
                end elseif g:BuffUp(R.AcquiredWand) and (a1 == 1 and h:IsInBossList() or d.BossFilteredFightRemains("<", 20)) then if S.CacheOfAcquiredTreasures:ID() == X and T.Commons.Enabled.TopTrinket then
                    a8 = 24;
                    return "top trinket Cache Wand for ST"
                elseif S.CacheOfAcquiredTreasures:ID() == Y and T.Commons.Enabled.BottomTrinket then
                    a8 = 25;
                    return "bot trinket Cache Wand for ST"
                end end end
        ;
        local aV = g:BuffUp(R.SymbolsofDeath) or d.BossFilteredFightRemains("<", 20)
        if aV then if aU and (g:BuffUp(R.SymbolsofDeath) or ai < 20) then if m.Cast(aU, nil, nil) then if aU:ID() == X and T.Commons.Enabled.TopTrinket then
                        a8 = 24;
                        return "Generic use_items for " .. aU:Name()
                    elseif aU:ID() == Y and T.Commons.Enabled.BottomTrinket then
                        a8 = 25;
                        return "Generic use_items for " .. aU:Name()
                    end end end end
    end
end
;
local function aW()
    aq = R.Premeditation:IsAvailable() and a1 < 5;
    if R.SliceandDice:IsReady() and (not aq and a1 < 6 and not g:BuffUp(R.ShadowDanceBuff) and g:BuffRemains(R.SliceandDice) < ai and g:BuffRefreshable(R.SliceandDice)) then if R.SliceandDice:IsReady() and m.Cast(R.SliceandDice) then
            a8 = 5171;
            return "Cast Slice and Dice (not Premed)"
        end end
    ;
    if R.SliceandDice:IsReady() and aq and R.ShadowDance:ChargesFractional() < 1.75 and g:BuffRemains(R.SliceandDice) < R.SymbolsofDeath:CooldownRemains() and (R.ShadowDance:CooldownRemains() <= 0 and g:BuffRemains(R.SymbolsofDeath) - g:BuffRemains(R.ShadowDanceBuff) < 1.2) then if R.SliceandDice:IsReady() and m.Cast(R.SliceandDice) then
            a8 = 5171;
            return "Cast Slice and Dice (Premed)"
        end end
    ;
    au = aD(ShadowDanceBuff)
    if R.Rupture:IsReady() and ((not au or ar) and not g:StealthUp(true, true) and h:FilteredTimeToDie(">", 6) and h:DebuffRefreshable(R.Rupture)) then if R.Rupture:IsReady() and m.Cast(R.Rupture) then
            a8 = 1943;
            return "Cast Rupture 1"
        end end
    ;
    if R.SecretTechnique:IsReady() and (g:BuffUp(R.ShadowDanceBuff) and (g:BuffStack(R.DanseMacabreBuff) >= 3 or not R.DanseMacabre:IsAvailable())) then if m.Cast(R.SecretTechnique) then
            a8 = 280719;
            return "Cast Secret Technique"
        end end
    ;
    if R.Rupture:IsReady() and not au and not ar and a1 >= 2 and a1 <= 3 then if P.CastTargetIf(R.Rupture, a0, "min", aM, aQ, not h:IsInMeleeRange(8)) then return
            "Cast Rupture 2" end end
    ;
    if R.Rupture:IsReady() and (not au and h:DebuffRemains(R.Rupture) < R.SymbolsofDeath:CooldownRemains() + 10 and R.SymbolsofDeath:CooldownRemains() <= 5 and h:FilteredTimeToDie(">", R.SymbolsofDeath:CooldownRemains() + 5, -h:DebuffRemains(R.Rupture))) then if R.Rupture:IsReady() and m.Cast(R.Rupture) then
            a8 = 1943;
            return "Cast Rupture 3"
        end end
    ;
    if R.BlackPowder:IsReady() and not u and not am and a1 >= 3 - ay(R.DarkBrew:IsAvailable()) then if R.BlackPowder:IsReady() and m.Cast(R.BlackPowder) then
            a8 = 319175;
            return "Cast Black Powder"
        end end
    ;
    if R.Eviscerate:IsReady() then if R.Eviscerate:IsReady() and m.Cast(R.Eviscerate) then
            a8 = 196819;
            return "Cast Eviscerate"
        end end
end
;
local function aX()
    at = aB()
    if R.Vanish:IsReady() and VanishReady and not v and T.Commons.VanishOffensive and not g:StealthUp(true, true, true) and (not at and al > 1) then if m.Cast(R.Vanish, nil, nil) then
            a8 = 1856;
            return "Vanish Stealth CD"
        end end
    ;
    if g:Energy() < 40 and R.Shadowmeld:IsReady() then if m.CastPooling(R.Shadowmeld, g:EnergyTimeToX(40)) then
            a8 = 1000;
            return "Pool for Shadowmeld"
        end end
    ;
    if R.Shadowmeld:IsReady() and not g:IsMoving() and T.Commons.Enabled.Racials and g:Energy() >= 40 and g:EnergyDeficitPredicted() >= 10 and not at and al > 4 then if m.Cast(R.Shadowmeld, nil, nil) then
            a8 = 58984;
            return "Shadowmeld Stealth CD"
        end end
    ;
    as = aC()
    if R.ShadowDance:IsReady() and SDReady and ((as and (g:BuffRemains(R.SymbolsofDeath) >= 2.2 - ay(R.Flagellation:IsAvailable()) or at) or g:BuffUp(R.Flagellation) or g:BuffRemains(R.Flagellation) >= 6 or a1 >= 4 and R.SymbolsofDeath:CooldownRemains() > 10) and not g:BuffUp(R.TheRottenBuff)) then if m.Cast(R.ShadowDance) then
            a8 = 185313;
            return " Shadow Dance Stealth CD"
        end end
    ;
    if R.ShadowDance:IsReady() and SDReady and (as and ai < R.SymbolsofDeath:CooldownRemains() or not R.ShadowDance:IsAvailable() and aE(a0) > 0 and a1 <= 4) then if m.Cast(R.ShadowDance) then
            a8 = 185313;
            return "Shadow Dance Stealth CD 2"
        end end
end
;
local function aY()
    if R.Shadowstrike:IsReady() and ShadowstrikeIsReady and h:IsInMeleeRange(T.Subtlety.ShadowStrikeRange) and ((g:StealthUp(true, true) or g:BuffUp(R.VanishBuff)) and (a1 < 4 or ar)) then if m.Cast(R.Shadowstrike, nil, nil) then
            a8 = 185438;
            return "Cast Shadowstrike (Stealth)"
        end end
    ;
    ao = g:BuffStack(R.DanseMacabreBuff) < 5 and (al == 2 or al == 3) and
        (g:BuffUp(R.PremeditationBuff) or EffectiveComboPoints < 7)
    if R.ShurikenStorm:IsReady() and (ao and g:BuffUp(R.SilentStorm) and h:DebuffDown(R.FindWeaknessDebuff)) then if m.Cast(R.ShurikenStorm) then
            a8 = 197835;
            return "Cast Shuriken Storm"
        end end
    ;
    if R.Gloomblade:IsReady() and ao then if m.Cast(R.Gloomblade) then
            a8 = 200758;
            return "Cast Gloomblade"
        end end
    ;
    if R.Backstab:IsReady() and ao and R.DanseMacabre:IsAvailable() and g:BuffStack(R.DanseMacabreBuff) <= 2 then if m.Cast(R.Backstab) then
            a8 = 53;
            return "Cast Backstab (Stealth)"
        end end
    ;
    if aj >= Q.CPMaxSpend() and h:IsInMeleeRange(8) then return aW() end
    ;
    if g:BuffUp(R.ShurikenTornado) and al <= 2 and h:IsInMeleeRange(8) then return aW() end
    ;
    if a1 >= 4 - ay(R.SealFate:IsAvailable()) and aj >= 4 and h:IsInMeleeRange(8) then return aW() end
    ;
    if al <= 1 + ay(R.SealFate:IsAvailable() or R.DeeperStratagem:IsAvailable() or R.SecretStratagem:IsAvailable()) and h:IsInMeleeRange(8) then return
            aW() end
    ;
    if R.Gloomblade:IsReady() and g:BuffStack(R.PerforatedVeinsBuff) >= 5 and a1 < 3 then if m.Cast(R.Gloomblade) then
            a8 = 200758;
            return "Cast Gloomblade"
        end end
    ;
    if R.Backstab:IsReady() and (g:BuffStack(R.PerforatedVeinsBuff) >= 5 and g:BuffRemains(R.ShadowDanceBuff) < 3) then if m.Cast(R.Backstab) then
            a8 = 53;
            return "Cast Backstab (Stealth PV)"
        end end
    ;
    if R.Shadowstrike:IsReady() and ShadowstrikeIsReady and h:IsInMeleeRange(T.Subtlety.ShadowStrikeRange) and (not g:StealthUp(true, false) and g:BuffUp(R.SepsisBuff) and a1 < 4) then if m.Cast(R.Shadowstrike, nil, nil) then
            a8 = 185438;
            return "Cast Shadowstrike (Sepsis)"
        end end
    ;
    if R.ShurikenStorm:IsReady() and (a1 >= 3 + ay(g:BuffUp(R.TheRottenBuff)) and (not g:BuffUp(R.PremeditationBuff) or a1 >= 7)) then if m.Cast(R.ShurikenStorm) then
            a8 = 197835;
            return "Cast Shuriken Storm"
        end end
    ;
    if R.Shadowstrike:IsReady() then
        if h:DebuffRemains(R.FindWeaknessDebuff) < 1 or R.SymbolsofDeath:CooldownRemains() < 18 and h:DebuffRemains(R.FindWeaknessDebuff) < R.SymbolsofDeath:CooldownRemains() then if m.Cast(R.Shadowstrike) then
                a8 = 185438;
                return "Cast Shadowstrike (Prio Rotation)"
            end end
        ;
        if P.CastTargetIf(R.Shadowstrike, a0, "min", aJ, aN) then return "Find the Weakness/ShadowStrike 26" end
    end
end
;
local function aZ()
    aa = nil;
    ac = nil;
    ab = 0;
    a3 = R.AcrobaticStrikes:IsAvailable() and 8 or 5;
    a4 = R.AcrobaticStrikes:IsAvailable() and 10 or 13;
    a5 = h:IsInMeleeRange(a3)
    a6 = h:IsInMeleeRange(a4)
    r = HeroRotationCharDB.Toggles[6]
    p = HeroRotationCharDB.Toggles[4]
    q = HeroRotationCharDB.Toggles[5]
    s = HeroRotationCharDB.Toggles[12]
    t = not HeroRotationCharDB.Toggles[15]
    u = HeroRotationCharDB.Toggles[20]
    v = HeroRotationCharDB.Toggles[21]
    w = HeroRotationCharDB.Toggles[22]
    x = HeroRotationCharDB.Toggles[23]
    y = HeroRotationCharDB.Toggles[24]
    z = HeroRotationCharDB.Toggles[25]
    A = HeroRotationCharDB.Toggles[26]
    B = HeroRotationCharDB.Toggles[27]
    C = HeroRotationCharDB.Toggles[28]
    D = HeroRotationCharDB.Toggles[29]
    E = HeroRotationCharDB.Toggles[30]
    F = HeroRotationCharDB.Toggles[54]
    SBReady = false;
    SDReady = false;
    VanishReady = false;
    SoDReady = false;
    MfDReady = true;
    STReady = false;
    if T.Subtlety.IncludedCooldowns.ShadowBlades and o() or T.Subtlety.IncludedSmallCooldowns.ShadowBlades and (o() or q) or not T.Subtlety.IncludedSmallCooldowns.ShadowBlades and not T.Subtlety.IncludedCooldowns.ShadowBlades then SBReady = true end
    ;
    if T.Subtlety.IncludedCooldowns.ShadowDance and o() or T.Subtlety.IncludedSmallCooldowns.ShadowDance and (o() or q) or not T.Subtlety.IncludedSmallCooldowns.ShadowDance and not T.Subtlety.IncludedCooldowns.ShadowDance then SDReady = true end
    ;
    if T.Subtlety.IncludedCooldowns.Vanish and o() or T.Subtlety.IncludedSmallCooldowns.Vanish and (o() or q) or not T.Subtlety.IncludedSmallCooldowns.Vanish and not T.Subtlety.IncludedCooldowns.Vanish then VanishReady = true end
    ;
    if T.Subtlety.IncludedCooldowns.SymbolsofDeath and o() or T.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and (o() or q) or not T.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and not T.Subtlety.IncludedCooldowns.SymbolsofDeath then SoDReady = true end
    ;
    if T.Subtlety.IncludedCooldowns.ShurikenTornado and o() or T.Subtlety.IncludedSmallCooldowns.ShurikenTornado and (o() or q) or not T.Subtlety.IncludedSmallCooldowns.ShurikenTornado and not T.Subtlety.IncludedCooldowns.ShurikenTornado then STReady = true end
    ;
    X = GetInventoryItemID("player", 13)
    Y = GetInventoryItemID("player", 14)
    if not T.Commons.Enabled.TopTrinket and not T.Commons.Enabled.BotTrinket then Z = { X, Y, S.MistcallerOcarina:ID(),
            S.CacheOfAcquiredTreasures:ID() } elseif not T.Commons.Enabled.TopTrinket and T.Commons.Enabled.BotTrinket then Z = {
            X, S.MistcallerOcarina:ID(), S.CacheOfAcquiredTreasures:ID() } elseif not T.Commons.Enabled.BotTrinket and T.Commons.Enabled.TopTrinket then Z = {
            Y, S.MistcallerOcarina:ID(), S.CacheOfAcquiredTreasures:ID() } end
end
;
local function a_()
    if R.Subterfuge:IsAvailable() then
        ad = R.Stealth2;
        ae = R.VanishBuff2
    else
        ad = R.Stealth;
        ae = R.VanishBuff
    end
    ;
    a7 = aZ()
    if n() then
        _ = g:GetEnemiesInRange(30)
        a0 = g:GetEnemiesInMeleeRange(a4)
        a1 = #a0;
        a2 = g:GetEnemiesInMeleeRange(a3)
    else
        _ = {}
        a0 = {}
        a1 = 0;
        a2 = {}
    end
    ;
    ak = g:ComboPoints()
    EffectiveComboPoints = Q.EffectiveComboPoints(ak)
    al = g:ComboPointsDeficit()
    am = false;
    StealthEnergyRequired = g:EnergyMax() - aA()
    if P.TargetIsValid() or g:AffectingCombat() then if IsInRaid() and UnitExists("boss1") then
            ah = d.BossFightRemains(nil, true)
            ai = ah;
            if ai == 11111 then ai = d.FightRemains(Enemies10yd, false) end
        end end
    ;
    if EffectiveComboPoints > ak and al > 2 and g:AffectingCombat() then if ak == 2 and not g:BuffUp(R.EchoingReprimand3) or ak == 3 and not g:BuffUp(R.EchoingReprimand4) or ak == 4 and not g:BuffUp(R.EchoingReprimand5) then
            local b0 = Q.TimeToSht(4)
            if b0 == 0 then b0 = Q.TimeToSht(5) end
            ;
            if b0 < N(g:EnergyTimeToX(35), g:GCDRemains()) + 0.5 then EffectiveComboPoints = ak end
        end end
    ;
    if g:BuffUp(R.ShurikenTornado, nil, true) and ak < Q.CPMaxSpend() then
        local b1 = Q.TimeToNextTornado()
        if b1 <= g:GCDRemains() or O(g:GCDRemains() - b1) < 0.25 then
            local b2 = a1 + ay(g:BuffUp(R.ShadowBlades))
            ak = M(ak + b2, Q.CPMaxSpend())
            al = N(al - b2, 0)
            if EffectiveComboPoints < Q.CPMaxSpend() then EffectiveComboPoints = ak end
        end
    end
    ;
    aj = EffectiveComboPoints;
    aw = aA()
    af = (4 + EffectiveComboPoints * 4) * 0.3;
    ag = R.Eviscerate:Damage() * T.Subtlety.EviscerateDMGOffset;
    if a7 then return a7 end
    ;
    if a9 > 0 then a9 = 0 end
    ;
    if a8 > 0 then a8 = 0 end
    ;
    a8 = Q.ReturnSpell()
    a9 = Q.ReturnSpellMO()
    if m.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        H = GetTime()
        I = H + m.GUISettings.General.OpenerReset
    elseif m.GUISettings.General.OpenerReset > 0 and I ~= nil and GetTime() > I and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        m.ToggleIconFrame:UpdateButtonText(6)
        m.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end
    ;
    if m.QueuedCast() then
        a8 = m.QueuedCast()
        return "Custom Queue " .. i(a8):ID()
    end
    ;
    if w and R.CheapShot:IsUsableP() and R.CheapShot:CooldownRemains() <= 0 and g:StealthUp(true, true) and not g:PrevGCD(1, R.CheapShot) then if m.Cast(R.CheapShot, nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(R.CheapShot) then
                a9 = 11833;
                return "queue Cheap Shot MO"
            else
                a8 = 1833;
                return "queue Cheap Shot"
            end end elseif (not R.CheapShot:IsUsableP() or R.CheapShot:CooldownRemains() > 0 or g:PrevGCD(1, R.CheapShot)) and w then
        HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
        m.Print("Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    ;
    if x and R.KidneyShot:IsUsableP() and R.KidneyShot:CooldownRemains() <= 0 then if m.Cast(R.KidneyShot, nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(R.KidneyShot) then
                a9 = 1408;
                return "queue Kidney Shot MO"
            else
                a8 = 408;
                return "queue Kidney Shot"
            end end elseif g:PrevGCD(1, R.KidneyShot) and x then
        HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
        m.Print("Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    ;
    if y and R.Blind:IsUsableP() and R.Blind:CooldownRemains() <= 0 then if m.Cast(R.Blind, nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(R.Blind) then
                a9 = 12094;
                return "queue Blind MO"
            else
                a8 = 2094;
                return "queue Blind"
            end end elseif (not R.Blind:IsUsableP() or R.Blind:CooldownRemains() > 0) and y then
        HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
        m.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    ;
    if z and R.Sap:IsUsableP() and R.Sap:CooldownRemains() <= 0 then if m.Cast(R.Sap, nil, nil, nil) then if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(R.Sap) then
                a9 = 16770;
                return "queue Sap MO"
            else
                a8 = 6770;
                return "queue Sap"
            end end elseif (not R.Sap:IsUsableP() or R.Sap:CooldownRemains() > 0) and z then
        HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
        m.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    ;
    if A and R.ShurikenTornado:IsUsableP() and R.ShurikenTornado:CooldownRemains() <= 0 then if m.Cast(R.ShurikenTornado, nil, nil, nil) then
            a8 = 277925;
            return "queue Shuriken Tornado"
        end elseif (not R.ShurikenTornado:IsUsableP() or R.ShurikenTornado:CooldownRemains() > 0) and A then
        HeroRotationCharDB.Toggles[26] = not HeroRotationCharDB.Toggles[26]
        m.Print("Shuriken Tornado Queue is now " ..
        (HeroRotationCharDB.Toggles[26] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    ;
    if B and R.Feint:IsUsableP() and R.Feint:CooldownRemains() <= 0 and g:AffectingCombat() then if m.Cast(R.Feint, nil, nil, nil) then
            a8 = 202;
            return "queue Shuriken Tornado"
        end elseif (not R.Feint:IsUsableP() or R.Feint:CooldownRemains() > 0 or not g:AffectingCombat()) and B then
        HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27]
        m.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    ;
    if C and R.Flagellation:IsUsableP() and R.Flagellation:CooldownRemains() <= 0 and g:AffectingCombat() then if m.Cast(R.Flagellation, nil, nil, nil) then
            a8 = 323654;
            return "queue Flagellation Queue"
        end elseif (not R.Flagellation:IsUsableP() or R.Flagellation:CooldownRemains() > 0 or not g:AffectingCombat()) and C then
        HeroRotationCharDB.Toggles[28] = not HeroRotationCharDB.Toggles[28]
        m.Print("Flagellation Queue is now " .. (HeroRotationCharDB.Toggles[28] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    ;
    if E then if R.ArcaneTorrent:IsAvailable() and R.ArcaneTorrent:IsUsableP() and R.ArcaneTorrent:CooldownRemains() <= 0 and g:AffectingCombat() then if m.Cast(R.ArcaneTorrent, nil, nil, nil) then
                a8 = 155145;
                return "queue ArcaneTorrent Queue"
            end elseif R.LightsJudgment:IsAvailable() and R.LightsJudgment:IsUsableP() and R.LightsJudgment:CooldownRemains() <= 0 and g:AffectingCombat() then if m.Cast(R.LightsJudgment, nil, nil, nil) then
                a8 = 255647;
                return "queue ArcaneTorrent Queue"
            end elseif R.BagofTricks:IsAvailable() and R.BagofTricks:IsUsableP() and R.BagofTricks:CooldownRemains() <= 0 and g:AffectingCombat() then if m.Cast(R.BagofTricks, nil, nil, nil) then
                a8 = 312411;
                return "queue ArcaneTorrent Queue"
            end elseif R.BloodFury:IsAvailable() and R.BloodFury:IsUsableP() and R.BloodFury:CooldownRemains() <= 0 and g:AffectingCombat() then if m.Cast(R.BloodFury, nil, nil, nil) then
                a8 = 20572;
                return "queue ArcaneTorrent Queue"
            end elseif R.Berserking:IsAvailable() and R.Berserking:IsUsableP() and R.Berserking:CooldownRemains() <= 0 and g:AffectingCombat() then if m.Cast(R.Berserking, nil, nil, nil) then
                a8 = 26297;
                return "queue ArcaneTorrent Queue"
            end elseif R.Fireblood:IsAvailable() and R.Fireblood:IsUsableP() and R.Fireblood:CooldownRemains() <= 0 and g:AffectingCombat() then if m.Cast(R.Fireblood, nil, nil, nil) then
                a8 = 265221;
                return "queue ArcaneTorrent Queue"
            end elseif R.AncestralCall:IsAvailable() and R.AncestralCall:IsUsableP() and R.AncestralCall:CooldownRemains() <= 0 and g:AffectingCombat() then if m.Cast(R.AncestralCall, nil, nil, nil) then
                a8 = 274738;
                return "queue ArcaneTorrent Queue"
            end elseif (R.ArcaneTorrent:IsAvailable() and (not R.ArcaneTorrent:IsUsableP() or R.ArcaneTorrent:CooldownRemains() > 0 or not g:AffectingCombat()) or R.LightsJudgment:IsAvailable() and (not R.LightsJudgment:IsUsableP() or R.LightsJudgment:CooldownRemains() > 0 or not g:AffectingCombat()) or R.BagofTricks:IsAvailable() and (not R.BagofTricks:IsUsableP() or R.BagofTricks:CooldownRemains() > 0 or not g:AffectingCombat()) or R.BloodFury:IsAvailable() and (not R.BloodFury:IsUsableP() or R.BloodFury:CooldownRemains() > 0 or not g:AffectingCombat()) or R.Berserking:IsAvailable() and (not R.Berserking:IsUsableP() or R.Berserking:CooldownRemains() > 0 or not g:AffectingCombat()) or R.Fireblood:IsAvailable() and (not R.Fireblood:IsUsableP() or R.Fireblood:CooldownRemains() > 0 or not g:AffectingCombat()) or R.AncestralCall:IsAvailable() and (not R.AncestralCall:IsUsableP() or R.AncestralCall:CooldownRemains() > 0 or not g:AffectingCombat())) and E then
            HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30]
            m.Print("Arcane Torrent Queue is now " ..
            (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end end
    ;
    a7 = Q.CrimsonVial()
    if a7 then return a7 end
    ;
    a7 = Q.Feint()
    if a7 then return a7 end
    ;
    a7 = Q.Evasion()
    if a7 then return a7 end
    ;
    if g:HealthPercentage() < T.Commons.PhialHP and S.PhialofSerenity:IsReady() and S.PhialofSerenity:CooldownRemains() <= 0 then if m.Cast(S.PhialofSerenity, nil) then
            a8 = 55;
            return "PhialofSerenity HP"
        end end
    ;
    if g:HealthPercentage() < T.Commons.HealthstoneHP and S.Healthstone:IsReady() and S.Healthstone:CooldownRemains() <= 0 then if m.Cast(S.Healthstone, nil) then
            a8 = 40;
            return "Healthstone HP"
        end end
    ;
    if g:HealthPercentage() < T.Commons.HealPotHP and S.CosmicHealPot:IsReady() and S.CosmicHealPot:CooldownRemains() <= 0 then if m.Cast(S.CosmicHealPot, nil) then
            a8 = 45;
            return "CosmicHealPot HP"
        end end
    ;
    if g:HealthPercentage() < T.Commons.HealPotHP and S.HealPot:IsReady() and not S.CosmicHealPot:IsReady() and S.HealPot:CooldownRemains() <= 0 then if m.Cast(S.HealPot, nil) then
            a8 = 41;
            return "HealPot HP"
        end end
    ;
    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if R.Backstab:IsReady() and f("mouseover"):IsInMeleeRange(8) then if m.Cast(R.Backstab, nil) then
                a9 = 153;
                return "explosive MO SWD"
            end end
        ;
        if R.ShurikenToss:IsReady() and f("mouseover"):IsInMeleeRange(40) and not f("mouseover"):IsInMeleeRange(8) then if m.Cast(R.ShurikenToss, nil) then
                a9 = 1114014;
                return "explosive MO SWD"
            end end
    end
    ;
    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if R.Backstab:IsReady() and h:IsInMeleeRange(8) then if m.Cast(R.Backstab, nil) then
                a8 = 53;
                return "explosive  SWD"
            end end
        ;
        if R.ShurikenToss:IsReady() and h:IsInMeleeRange(40) and not h:IsInMeleeRange(8) then if m.Cast(R.ShurikenToss, nil) then
                a8 = 114014;
                return "explosive MO SWD"
            end end
    end
    ;
    G = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510,
        344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 321220, 158337 }
    if UnitExists("target") and R.Shiv:IsReady() and not F then if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then for b3 = 0, 40 do
                local b4, b4, b5, b6, b4, b4, b4, b4, b4, b7 = UnitBuff("target", b3)
                for b4, b8 in pairs(G) do if b8 == b7 then if m.Cast(R.Shiv, nil) then
                            a8 = 5938;
                            return "Shiv Enrage"
                        end end end
            end end end
    ;
    local b9 = g:AffectingCombat() and 180 or 900;
    local ba;
    if i(8679):IsAvailable() and T.Commons.LethalPoison == "Wound Poison" then
        ba = g:BuffRemains(i(8679))
        if ba < b9 and not g:IsCasting(i(8679)) then if m.Cast(i(8679)) then
                a8 = 203;
                return "Wound Poison Refresh"
            end end
    elseif i(2823):IsAvailable() and T.Commons.LethalPoison == "Deadly Poison" then
        ba = g:BuffRemains(i(2823))
        if ba < b9 and not g:IsCasting(i(2823)) then if m.Cast(i(2823)) then
                a8 = 208;
                return "Deadly Poison Refresh"
            end end
    elseif i(315584):IsAvailable() and T.Commons.LethalPoison == "Instant Poison" then
        ba = g:BuffRemains(i(315584))
        if ba < b9 and not g:IsCasting(i(315584)) then if m.Cast(i(315584)) then
                a8 = 205;
                return "Instant Poison Refresh"
            end end
    end
    ;
    if i(381637):IsAvailable() and T.Commons.NonLethalPoison == "Atrophic Poison" then
        ba = g:BuffRemains(i(381637))
        if ba < b9 and not g:IsCasting(i(381637)) then if m.Cast(i(381637)) then
                a8 = 381637;
                return "Atropic Poison Refresh"
            end end
    elseif i(5761):IsAvailable() and T.Commons.NonLethalPoison == "Numbing Poison" then
        ba = g:BuffRemains(i(5761))
        if ba < b9 and not g:IsCasting(NumbingPoison) then if m.Cast(i(5761)) then
                a8 = 204;
                return "Numbing Poison Refresh"
            end end
    elseif i(3408):IsAvailable() and T.Commons.NonLethalPoison == "Crippling Poison" then
        ba = g:BuffRemains(i(3408))
        if ba < b9 and not g:IsCasting(NumbingPoison) then if m.Cast(i(3408)) then
                a8 = 206;
                return "Crippling Poison Refresh"
            end end
    end
    ;
    if not g:AffectingCombat() and not g:IsDeadOrGhost() then if not g:BuffUp(R.ShadowDanceBuff) and not g:BuffUp(Q.VanishBuffSpell()) then
            a7 = Q.Stealth(Q.StealthSpell())
            if a7 then return a7 end
        end end
    ;
    Q.MfDSniping(R.MarkedforDeath)
    if P.TargetIsValid() and (g:AffectingCombat() and not h:DebuffUp(R.Sap) or r or (g:BuffUp(ae) or StealthSpell and StealthSpell:ID() == R.Vanish:ID())) then
        local bb, bc, b4 = GetSpellCooldown(57934)
        if T.Commons.AutoToT and g:AffectingCombat() then if bb + bc - GetTime() <= 0 and R.TricksoftheTrade:IsAvailable() and R.TricksoftheTrade:CooldownRemains() <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus")) and IsItemInRange(32698, "focus") then if m.Cast(R.TricksoftheTrade) then
                    a8 = 157934;
                    return "ToT Focus"
                end end end
        ;
        a7 = aS()
        if a7 and h:IsInMeleeRange(8) then return "CDs: " .. a7 end
        ;
        if R.SliceandDice:IsCastable() and a1 < Q.CPMaxSpend() and d.FilteredFightRemains(a0, ">", 6) and g:BuffRemains(R.SliceandDice) < g:GCD() and ak >= 4 then if R.SliceandDice:IsReady() and m.Cast(R.SliceandDice) then
                a8 = 5171;
                return "Cast Slice and Dice (Low Duration)"
            end end
        ;
        if g:StealthUp(true, true) then
            a7 = aY()
            if a7 then return "Stealthed : " .. a7 end
        end
        ;
        UsePriorityRotation = false;
        if g:EnergyDeficitPredicted() <= aw and h:IsInMeleeRange(8) then
            a7 = aX()
            if a7 then return "Stealth CDs: " .. a7 end
        end
        ;
        if EffectiveComboPoints >= Q.CPMaxSpend() or (al <= 1 or d.BossFilteredFightRemains("<", 2) and EffectiveComboPoints >= 3) or a1 >= 4 and EffectiveComboPoints >= 4 then
            a7 = aW()
            if a7 then return "Finish: " .. a7 end
        end
        ;
        if g:EnergyDeficitPredicted() <= aw and h:IsInMeleeRange(8) then
            a7 = aR()
            if a7 then return "Build: " .. a7 end
        end
        ;
        if m.CDsON() then
            if R.ArcaneTorrent:IsReady() and h:IsInMeleeRange(8) and T.Commons.Enabled.Racials and g:EnergyDeficitPredicted() > 15 + g:EnergyRegen() then if m.Cast(R.ArcaneTorrent, nil) then
                    a8 = 155145;
                    return "Cast Arcane Torrent"
                end end
            ;
            if R.ArcanePulse:IsReady() and h:IsInMeleeRange(8) and T.Commons.Enabled.Racials then if m.Cast(R.ArcanePulse, nil) then
                    a8 = 260364;
                    return "Cast Arcane Pulse"
                end end
            ;
            if R.LightsJudgment:IsReady() and h:IsInMeleeRange(8) and T.Commons.Enabled.Racials then if m.Cast(R.LightsJudgment, nil) then
                    a8 = 255647;
                    return "Cast Lights Judgment"
                end end
            ;
            if R.BagofTricks:IsReady() and h:IsInMeleeRange(8) and T.Commons.Enabled.Racials then if m.Cast(R.BagofTricks, nil) then
                    a8 = 312411;
                    return "Cast Bag of Tricks"
                end end
        end
        ;
        if m.Cast(R.PoolEnergy) then
            a8 = 1000;
            return "Pooling Resources"
        end
    end
end
;
local function bd()
end
;
function ReturnSpell() if a8 == 0 then return 0 else return a8 end end

;
function ReturnSpellMO() if a9 == 0 then return 0 else return a9 end end

;
m.SetAPL(261, a_, bd)
