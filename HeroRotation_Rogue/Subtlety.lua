local e, e = ...
local e = HeroDBC.DBC
local y = HeroLib
local e = HeroCache
local w = y.Unit
local t = w.Player
local n = w.Target
local l = y.Spell
local e = y.MultiSpell
local s = y.Item
local k = y.Utils.BoolToInt
local a = HeroRotation
local xe = a.AoEON
local f = a.CDsON
local ze = HeroRotationCharDB.Toggles[4]
local g = HeroRotationCharDB.Toggles[5]
local ee = HeroRotationCharDB.Toggles[6]
local z = HeroRotationCharDB.Toggles[12]
local oe = not HeroRotationCharDB.Toggles[15]
local ae = HeroRotationCharDB.Toggles[20]
local X = HeroRotationCharDB.Toggles[21]
local Q = HeroRotationCharDB.Toggles[22]
local P = HeroRotationCharDB.Toggles[23]
local Y = HeroRotationCharDB.Toggles[24]
local W = HeroRotationCharDB.Toggles[25]
local F = HeroRotationCharDB.Toggles[26]
local G = HeroRotationCharDB.Toggles[27]
local B = HeroRotationCharDB.Toggles[28]
local J = HeroRotationCharDB.Toggles[29]
local K = HeroRotationCharDB.Toggles[30]
local ie = HeroRotationCharDB.Toggles[54]
local re = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 321220, 158337 }
local le = nil
local V = nil
local e = 0
local e = 0
local se = pairs
local e = table.insert
local _e = math.min
local ue = math.max
local Te = math.abs
local q = a.Commons.Everyone
local r = a.Commons.Rogue
local e = l.Rogue.Subtlety
local d = s.Rogue.Subtlety
local i = { General = a.GUISettings.General, Commons = a.GUISettings.APL.Rogue.Commons, Subtlety = a.GUISettings.APL.Rogue.Subtlety }
local o = t:GetEquipment()
local u = o[13] and s(o[13]) or s(0)
local h = o[14] and s(o[14]) or s(0)
local j = GetInventoryItemID("player", 13)
local x = GetInventoryItemID("player", 14)
local O = {  }
y:RegisterForEvent(function()
    o = t:GetEquipment()
    u = o[13] and s(o[13]) or s(0)
    h = o[14] and s(o[14]) or s(0)
end, "PLAYER_EQUIPMENT_CHANGED")
local ne, b, s, he
local L, N, be, ve
local h
local o = r.ReturnSpell()
local m = r.ReturnSpellMO()
local ge, ke, qe
local de, C
local Ee, Ie
local U = 11111
local v = 11111
local M, u, c
local S
local H
local T
local He
local D
local A
local R
local E
local _
local p
local I
local p = t:CovenantID()
y:RegisterForEvent(function()
    p = t:CovenantID()
end, "COVENANT_CHOSEN")
y:RegisterForEvent(function()
    U = 11111
    v = 11111
end, "PLAYER_REGEN_ENABLED")
local function p(e)
    if e then
        return 1
    else
        return 0
    end

end

local function te()
    return 25 + p(e.Vigor:IsAvailable()) * 20 + p(e.MasterofShadows:IsAvailable()) * 20 + p(e.ShadowFocus:IsAvailable()) * 25 + p(e.Alacrity:IsAvailable()) * 20 + p(s >= 4) * 25
end

local function Ne()
    return e.ShadowDance:ChargesFractional() >= .75 + k(e.ShadowDanceTalent:IsAvailable())
end

local function Se()
            if s == 4 then
        return true
    elseif s > (4 - 2 * k(e.ShurikenTornado:IsAvailable())) or S and s >= 4 then
        return c <= 1
    elseif s == 3 then
        return c >= 2
    else
        return u <= 1
    end

end

local function k()
    return t:BuffUp(e.SliceandDice) or s >= r.CPMaxSpend()
end

local function Ae(a)
    return t:BuffUp(e.ThistleTea) and s == 1 or a and (s == 1 or n:DebuffUp(e.Rupture) and s >= 2)
end

local function Oe(a)
    local t = 0
    for o in se(a) do
        local a = a[o]
        if a:DebuffUp(e.Rupture) then
            t = t + 1
        end

    end

    return t
end

local function je(t)
    return t:DebuffRemains(e.FindWeaknessDebuff)
end

local function Z(e)
    return e:TimeToDie()
end

local function fe(t)
    return t:DebuffRemains(e.Rupture)
end

local function ce(t)
                if (((t:DebuffRemains(e.FindWeaknessDebuff) < 1) or (e.SymbolsofDeath:CooldownRemains() < 18 and t:DebuffRemains(e.FindWeaknessDebuff) < e.SymbolsofDeath:CooldownRemains())) and t:GUID() == w("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover") then
        m = 1185438
        return true
    elseif (((t:DebuffRemains(e.FindWeaknessDebuff) < 1) or (e.SymbolsofDeath:CooldownRemains() < 18 and t:DebuffRemains(e.FindWeaknessDebuff) < e.SymbolsofDeath:CooldownRemains())) and i.Subtlety.TargetSwap == "AutoSwap" and t:GUID() ~= n:GUID() and not z) then
        m = 9999
        return true
    elseif (((t:DebuffRemains(e.FindWeaknessDebuff) < 1) or (e.SymbolsofDeath:CooldownRemains() < 18 and t:DebuffRemains(e.FindWeaknessDebuff) < e.SymbolsofDeath:CooldownRemains())) and t:GUID() == n:GUID()) then
        o = 185438
        return true
    elseif ((t:DebuffRemains(e.FindWeaknessDebuff) < 1) or (e.SymbolsofDeath:CooldownRemains() < 18 and t:DebuffRemains(e.FindWeaknessDebuff) < e.SymbolsofDeath:CooldownRemains())) then
        return true
    end

end

local function we(e)
                if ((e:IsInRange(8) and e:TimeToDie() > 10) and e:GUID() == w("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover") then
        m = 1323654
        return true
    elseif ((e:IsInRange(8) and e:TimeToDie() > 10) and i.Subtlety.TargetSwap == "AutoSwap" and e:GUID() ~= n:GUID() and not z) then
        m = 9999
        return true
    elseif ((e:IsInRange(8) and e:TimeToDie() > 10) and e:GUID() == n:GUID()) then
        o = 323654
        return true
    elseif (e:IsInRange(8) and e:TimeToDie() > 10) then
        return true
    end

end

local function ye(e)
                if ((e:FilteredTimeToDie("<", c) or (not t:StealthUp(true, true) and t:ComboPointsDeficit() >= r.CPMaxSpend())) and e:GUID() == w("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover") then
        m = 1137619
        return true
    elseif ((e:FilteredTimeToDie("<", c) or (not t:StealthUp(true, true) and t:ComboPointsDeficit() >= r.CPMaxSpend())) and i.Subtlety.TargetSwap == "AutoSwap" and e:GUID() ~= n:GUID() and not z) then
        m = 9999
        return true
    elseif ((e:FilteredTimeToDie("<", c) or (not t:StealthUp(true, true) and t:ComboPointsDeficit() >= r.CPMaxSpend())) and e:GUID() == n:GUID()) then
        o = 137619
        return true
    elseif (e:FilteredTimeToDie("<", c) or (not t:StealthUp(true, true) and t:ComboPointsDeficit() >= r.CPMaxSpend())) then
        return true
    end

end

local function pe(t)
                if ((t:FilteredTimeToDie(">=", (2 * u)) and t:DebuffRefreshable(e.Rupture)) and t:GUID() == w("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover") then
        m = 11943
        return true
    elseif ((t:FilteredTimeToDie(">=", (2 * u)) and t:DebuffRefreshable(e.Rupture)) and i.Subtlety.TargetSwap == "AutoSwap" and t:GUID() ~= n:GUID() and not z) then
        m = 9999
        return true
    elseif ((t:FilteredTimeToDie(">=", (2 * u)) and t:DebuffRefreshable(e.Rupture)) and t:GUID() == n:GUID()) then
        o = 1943
        return true
    elseif (t:FilteredTimeToDie(">=", (2 * u)) and t:DebuffRefreshable(e.Rupture)) then
        return true
    end

end

local function me()
    if e.ShurikenStorm:IsReady() and (s >= (2 + p(t:BuffUp(e.LingeringShadow) or t:BuffUp(e.PerforatedVeinsBuff)))) then
        if a.Cast(e.ShurikenStorm) then
            o = 197835
            return "Cast Shuriken Storm"
        end

    end

    H = not e.EchoingReprimand:IsAvailable() or (not (He and (r.TimeToSht(3) < .5 or r.TimeToSht(4) < 1) and t:Energy() < 60))
    if e.Gloomblade:IsReady() and H then
        if a.Cast(e.Gloomblade) then
            o = 200758
            return "Cast Gloomblade"
        end

    end

    if e.Backstab:IsReady() and H then
        if a.Cast(e.Backstab) then
            o = 53
            return "Cast Backstab"
        end

    end

end

local function H()
    if e.ShadowDance:IsReady() and SDReady and not t:BuffUp(e.ShadowDanceBuff) and t:BuffUp(e.ShurikenTornado) and t:BuffRemains(e.ShurikenTornado) <= 3.5 then
        if a.Cast(e.ShadowDance) then
            o = 185313
            return "Cast Shadow Dance (during Tornado)"
        end

    end

    if e.SymbolsofDeath:IsReady() and SoDReady and t:BuffUp(e.ShurikenTornado) and t:BuffRemains(e.ShurikenTornado) <= 3.5 then
        if a.Cast(e.SymbolsofDeath) then
            o = 212283
            return "Cast Symbols of Death(during Tornado)"
        end

    end

    if e.ColdBlood:IsReady() and g and ((not e.DanseMacabre:IsAvailable() or not e.SecretTechnique:IsAvailable()) and u >= 5) then
        if a.Cast(e.ColdBlood) then
            o = 382245
            return "Cast ColdBlood 1"
        end

    end

    if e.ColdBlood:IsReady() and g and (e.SecretTechnique:IsAvailable()) then
        if a.Cast(e.ColdBlood) then
            o = 382245
            return "Cast ColdBlood 2"
        end

    end

    if e.Flagellation:IsReady() and f() and (k() and u >= 5) then
        if q.CastTargetIf(e.Flagellation, b, "max", Z, we, not n:IsInMeleeRange(8)) then
            return "Cast Flagellation"
        end

    end

    if e.ShurikenTornado:IsCastable() and s <= 1 and k() and e.SymbolsofDeath:CooldownUp() and e.ShadowDance:Charges() >= 1 and (not e.Flagellation:IsAvailable() or t:BuffUp(e.Flagellation) or s >= 5) and u <= 2 and not t:BuffUp(e.PremeditationBuff) then
                if t:Energy() >= 60 then
            if a.Cast(e.ShurikenTornado, i.Subtlety.GCDasOffGCD.ShurikenTornado) then
                o = 277925
                return "Cast Shuriken Tornado"
            end

        elseif not e.ShadowFocus:IsAvailable() then
            if a.CastPooling(e.ShurikenTornado) then
                o = 277925
                return "Pool for Shuriken Tornado"
            end

        end

    end

    if e.Sepsis:IsReady() and f() and k() and c >= 1 and n:FilteredTimeToDie(">=", 16) then
        if a.Cast(e.Sepsis, nil, nil) then
            o = 328305
            return "Cast Sepsis"
        end

    end

    if e.SymbolsofDeath:IsReady() and SoDReady and (k() and ((not e.Flagellation:IsAvailable()) or (e.Flagellation:CooldownRemains() > 10 or not f()) or (e.Flagellation:CooldownUp() and u >= 5))) then
        if a.Cast(e.SymbolsofDeath, nil) then
            o = 212283
            return "Cast Symbols of Death"
        end

    end

    if e.MarkedforDeath:IsReady() then
        if q.CastTargetIf(e.MarkedforDeath, b, "min", Z, ye, not n:IsInMeleeRange(8)) then
            return "Cast Marked for Death"
        end

    end

    if e.MarkedforDeath:IsReady() and (UnitIsUnit("target", "boss1") or UnitIsUnit("target", "boss2") or UnitIsUnit("target", "boss3") or UnitIsUnit("target", "boss4")) and c >= r.CPMaxSpend() then
        if a.Cast(e.MarkedforDeath, nil) then
            o = 137619
            return "Cast Marked for Death boss"
        end

    end

    if e.ShadowBlades:IsReady() and SBReady and (k() and c >= 2) then
        if a.Cast(e.ShadowBlades, nil) then
            o = 121471
            return "Cast Shadow Blades"
        end

    end

    if e.EchoingReprimand:IsReady() and f() and (k() and c >= 3 and ((A) or (s <= 4) or (e.ResoundingClarity:IsAvailable())) and (t:BuffUp(e.ShadowDanceBuff) or not e.DanseMacabre:IsAvailable())) then
        if a.Cast(e.EchoingReprimand, nil, nil) then
            o = 323547
            return "Cast Echoing Reprimand"
        end

    end

    if e.ShurikenTornado:IsReady() and STReady and not J and (k() and t:BuffUp(e.SymbolsofDeath) and u <= 2 and ((not t:BuffUp(e.PremeditationBuff)) or s > 4)) then
        if a.Cast(e.ShurikenTornado) then
            o = 277925
            return "Cast Shuriken Tornado (SF)"
        end

    end

    if e.ShadowDance:IsReady() and SDReady and (not t:BuffUp(e.ShadowDanceBuff) and v <= (8 + p(e.Subterfuge:IsAvailable()))) then
        if a.Cast(e.ShadowDance) then
            o = 185313
            return "Cast Shadow Dance"
        end

    end

    if e.ThistleTea:IsReady() and f() and (e.SymbolsofDeath:CooldownRemains() >= 3 and not t:BuffUp(e.ThistleTeaBuff) and ((t:EnergyDeficitPredicted() >= 100) or (e.ThistleTea:ChargesFractional() >= 2.75 and t:EnergyDeficitPredicted() >= 40))) then
        if a.Cast(e.ThistleTea) then
            o = 381623
            return "Cast ThistleTea"
        end

    end

    if i.Commons.Enabled.Potions and f() and oe and (((t:BloodlustUp() or v < 30 or (t:BuffUp(e.SymbolsofDeath) and (t:BuffUp(e.ShadowBlades) or e.ShadowBlades:CooldownRemains() <= 10))) and not a.GUISettings.General.HoldPotforBL) or (a.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
        local e = q.PotionSelected()
        if e and e:IsReady() then
            if a.Cast(e, nil, nil) then
                o = 37
                return "potion cooldowns 2"
            end

        end

    end

    if t:BuffUp(e.SymbolsofDeath) and f() then
        if e.BloodFury:IsReady() and i.Commons.Enabled.Racials then
            if a.Cast(e.BloodFury, nil) then
                o = 20572
                return "Cast Blood Fury"
            end

        end

        if e.Berserking:IsReady() and i.Commons.Enabled.Racials then
            if a.Cast(e.Berserking, nil) then
                o = 26297
                return "Cast Berserking"
            end

        end

        if e.Fireblood:IsReady() and i.Commons.Enabled.Racials then
            if a.Cast(e.Fireblood, nil) then
                o = 265221
                return "Cast Fireblood"
            end

        end

        if e.AncestralCall:IsReady() and i.Commons.Enabled.Racials then
            if a.Cast(e.AncestralCall, nil) then
                o = 274738
                return "Cast Ancestral Call"
            end

        end

    end

    if (i.Commons.Enabled.TopTrinket or i.Commons.Enabled.BottomTrinket) and f() then
        local h = t:GetUseableTrinkets(O)
        if d.CacheOfAcquiredTreasures:IsEquippedAndReady() then
                        if t:BuffUp(e.AcquiredAxe) and s > 1 then
                                if d.CacheOfAcquiredTreasures:ID() == j and i.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket Cache Axe for AoE"
                elseif d.CacheOfAcquiredTreasures:ID() == x and i.Commons.Enabled.BottomTrinket then
                    o = 25
                    return "bot trinket Cache Axe for AoE"
                end

            elseif t:BuffUp(e.AcquiredWand) and (s == 1 and n:IsInBossList() or y.BossFilteredFightRemains("<", 20)) then
                                if d.CacheOfAcquiredTreasures:ID() == j and i.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket Cache Wand for ST"
                elseif d.CacheOfAcquiredTreasures:ID() == x and i.Commons.Enabled.BottomTrinket then
                    o = 25
                    return "bot trinket Cache Wand for ST"
                end

            end

        end

        local n = t:BuffUp(e.SymbolsofDeath) or y.BossFilteredFightRemains("<", 20)
        if n then
            if h and (t:BuffUp(e.SymbolsofDeath) or v < 20) then
                if a.Cast(h, nil, nil) then
                                        if h:ID() == j and i.Commons.Enabled.TopTrinket then
                        o = 24
                        return "Generic use_items for " .. h:Name()
                    elseif h:ID() == x and i.Commons.Enabled.BottomTrinket then
                        o = 25
                        return "Generic use_items for " .. h:Name()
                    end

                end

            end

        end

    end

end

local function k()
    D = e.Premeditation:IsAvailable() and s < 5
    if e.SliceandDice:IsReady() and (not D and s < 6 and not t:BuffUp(e.ShadowDanceBuff) and t:BuffRemains(e.SliceandDice) < v and t:BuffRefreshable(e.SliceandDice)) then
        if e.SliceandDice:IsReady() and a.Cast(e.SliceandDice) then
            o = 5171
            return "Cast Slice and Dice (not Premed)"
        end

    end

    if e.SliceandDice:IsReady() and D and e.ShadowDance:ChargesFractional() < 1.75 and t:BuffRemains(e.SliceandDice) < e.SymbolsofDeath:CooldownRemains() and (e.ShadowDance:CooldownRemains() <= 0 and (t:BuffRemains(e.SymbolsofDeath) - t:BuffRemains(e.ShadowDanceBuff)) < 1.2) then
        if e.SliceandDice:IsReady() and a.Cast(e.SliceandDice) then
            o = 5171
            return "Cast Slice and Dice (Premed)"
        end

    end

    _ = Ae(ShadowDanceBuff)
    if e.Rupture:IsReady() and ((not _ or A) and not (t:StealthUp(true, true)) and n:FilteredTimeToDie(">", 6) and n:DebuffRefreshable(e.Rupture)) then
        if e.Rupture:IsReady() and a.Cast(e.Rupture) then
            o = 1943
            return "Cast Rupture 1"
        end

    end

    if e.SecretTechnique:IsReady() and (t:BuffUp(e.ShadowDanceBuff) and (t:BuffStack(e.DanseMacabreBuff) >= 3 or not e.DanseMacabre:IsAvailable())) then
        if a.Cast(e.SecretTechnique) then
            o = 280719
            return "Cast Secret Technique"
        end

    end

    if e.Rupture:IsReady() and not _ and not A and s >= 2 and s <= 3 then
        if q.CastTargetIf(e.Rupture, b, "min", fe, pe, not n:IsInMeleeRange(8)) then
            return "Cast Rupture 2"
        end

    end

    if e.Rupture:IsReady() and (not _ and n:DebuffRemains(e.Rupture) < (e.SymbolsofDeath:CooldownRemains() + 10) and e.SymbolsofDeath:CooldownRemains() <= 5 and (n:FilteredTimeToDie(">", (e.SymbolsofDeath:CooldownRemains() + 5), -n:DebuffRemains(e.Rupture)))) then
        if e.Rupture:IsReady() and a.Cast(e.Rupture) then
            o = 1943
            return "Cast Rupture 3"
        end

    end

    if e.BlackPowder:IsReady() and not ae and not S and s >= (3 - p(e.DarkBrew:IsAvailable())) then
        if e.BlackPowder:IsReady() and a.Cast(e.BlackPowder) then
            o = 319175
            return "Cast Black Powder"
        end

    end

    if e.Eviscerate:IsReady() then
        if e.Eviscerate:IsReady() and a.Cast(e.Eviscerate) then
            o = 196819
            return "Cast Eviscerate"
        end

    end
    
end

local function D()
    E = Ne()
    if e.Vanish:IsReady() and VanishReady and not X and i.Commons.VanishOffensive and not t:StealthUp(true, true, true) and (not E and c > 1) then
        if a.Cast(e.Vanish, nil, nil) then
            o = 1856
            return "Vanish Stealth CD"
        end

    end

    if t:Energy() < 40 and e.Shadowmeld:IsReady() then
        if a.CastPooling(e.Shadowmeld, t:EnergyTimeToX(40)) then
            o = 1000
            return "Pool for Shadowmeld"
        end

    end

    if e.Shadowmeld:IsReady() and not t:IsMoving() and i.Commons.Enabled.Racials and t:Energy() >= 40 and t:EnergyDeficitPredicted() >= 10 and not E and c > 4 then
        if a.Cast(e.Shadowmeld, nil, nil) then
            o = 58984
            return "Shadowmeld Stealth CD"
        end

    end

    R = Se()
    if e.ShadowDance:IsReady() and SDReady and (((R and ((t:BuffRemains(e.SymbolsofDeath) >= (2.2 - p(e.Flagellation:IsAvailable()))) or E)) or (t:BuffUp(e.Flagellation)) or (t:BuffRemains(e.Flagellation) >= 6) or (s >= 4 and e.SymbolsofDeath:CooldownRemains() > 10)) and not t:BuffUp(e.TheRottenBuff)) then
        if a.Cast(e.ShadowDance) then
            o = 185313
            return " Shadow Dance Stealth CD"
        end

    end

    if e.ShadowDance:IsReady() and SDReady and ((R and v < e.SymbolsofDeath:CooldownRemains()) or (not e.ShadowDance:IsAvailable() and Oe(b) > 0 and s <= 4)) then
        if a.Cast(e.ShadowDance) then
            o = 185313
            return "Shadow Dance Stealth CD 2"
        end

    end

end

local function E()
    if e.Shadowstrike:IsReady() and ShadowstrikeIsReady and n:IsInMeleeRange(i.Subtlety.ShadowStrikeRange) and ((t:StealthUp(true, true) or t:BuffUp(e.VanishBuff)) and (s < 4 or A)) then
        if a.Cast(e.Shadowstrike, nil, nil) then
            o = 185438
            return "Cast Shadowstrike (Stealth)"
        end

    end

    T = t:BuffStack(e.DanseMacabreBuff) < 5 and (c == 2 or c == 3) and (t:BuffUp(e.PremeditationBuff) or EffectiveComboPoints < 7)
    if e.ShurikenStorm:IsReady() and (T and t:BuffUp(e.SilentStorm) and n:DebuffDown(e.FindWeaknessDebuff)) then
        if a.Cast(e.ShurikenStorm) then
            o = 197835
            return "Cast Shuriken Storm"
        end

    end

    if e.Gloomblade:IsReady() and T then
        if a.Cast(e.Gloomblade) then
            o = 200758
            return "Cast Gloomblade"
        end

    end

    if e.Backstab:IsReady() and T and e.DanseMacabre:IsAvailable() and t:BuffStack(e.DanseMacabreBuff) <= 2 then
        if a.Cast(e.Backstab) then
            o = 53
            return "Cast Backstab (Stealth)"
        end

    end

    if M >= r.CPMaxSpend() and n:IsInMeleeRange(8) then
        return k()
    end

    if t:BuffUp(e.ShurikenTornado) and c <= 2 and n:IsInMeleeRange(8) then
        return k()
    end

    if s >= (4 - p(e.SealFate:IsAvailable())) and M >= 4 and n:IsInMeleeRange(8) then
        return k()
    end

    if c <= 1 + p(e.SealFate:IsAvailable() or e.DeeperStratagem:IsAvailable() or e.SecretStratagem:IsAvailable()) and n:IsInMeleeRange(8) then
        return k()
    end

    if e.Gloomblade:IsReady() and t:BuffStack(e.PerforatedVeinsBuff) >= 5 and s < 3 then
        if a.Cast(e.Gloomblade) then
            o = 200758
            return "Cast Gloomblade"
        end

    end

    if e.Backstab:IsReady() and (t:BuffStack(e.PerforatedVeinsBuff) >= 5 and t:BuffRemains(e.ShadowDanceBuff) < 3) then
        if a.Cast(e.Backstab) then
            o = 53
            return "Cast Backstab (Stealth PV)"
        end

    end

    if e.Shadowstrike:IsReady() and ShadowstrikeIsReady and n:IsInMeleeRange(i.Subtlety.ShadowStrikeRange) and (not t:StealthUp(true, false) and t:BuffUp(e.SepsisBuff) and s < 4) then
        if a.Cast(e.Shadowstrike, nil, nil) then
            o = 185438
            return "Cast Shadowstrike (Sepsis)"
        end

    end

    if e.ShurikenStorm:IsReady() and (s >= (3 + p(t:BuffUp(e.TheRottenBuff))) and (not t:BuffUp(e.PremeditationBuff) or s >= 7)) then
        if a.Cast(e.ShurikenStorm) then
            o = 197835
            return "Cast Shuriken Storm"
        end

    end

    if e.Shadowstrike:IsReady() then
        if ((n:DebuffRemains(e.FindWeaknessDebuff) < 1) or (e.SymbolsofDeath:CooldownRemains() < 18 and n:DebuffRemains(e.FindWeaknessDebuff) < e.SymbolsofDeath:CooldownRemains())) then
            if a.Cast(e.Shadowstrike) then
                o = 185438
                return "Cast Shadowstrike (Prio Rotation)"
            end

        end

        if q.CastTargetIf(e.Shadowstrike, b, "min", je, ce) then
            return "Find the Weakness/ShadowStrike 26"
        end

    end

end

local function _()
    ge = nil
    qe = nil
    ke = 0
    L = e.AcrobaticStrikes:IsAvailable() and 8 or 5
    N = e.AcrobaticStrikes:IsAvailable() and 10 or 13
    be = n:IsInMeleeRange(L)
    ve = n:IsInMeleeRange(N)
    ee = HeroRotationCharDB.Toggles[6]
    ze = HeroRotationCharDB.Toggles[4]
    g = HeroRotationCharDB.Toggles[5]
    z = HeroRotationCharDB.Toggles[12]
    oe = not HeroRotationCharDB.Toggles[15]
    ae = HeroRotationCharDB.Toggles[20]
    X = HeroRotationCharDB.Toggles[21]
    Q = HeroRotationCharDB.Toggles[22]
    P = HeroRotationCharDB.Toggles[23]
    Y = HeroRotationCharDB.Toggles[24]
    W = HeroRotationCharDB.Toggles[25]
    F = HeroRotationCharDB.Toggles[26]
    G = HeroRotationCharDB.Toggles[27]
    B = HeroRotationCharDB.Toggles[28]
    J = HeroRotationCharDB.Toggles[29]
    K = HeroRotationCharDB.Toggles[30]
    ie = HeroRotationCharDB.Toggles[54]
    SBReady = false
    SDReady = false
    VanishReady = false
    SoDReady = false
    MfDReady = true
    STReady = false
    if ((i.Subtlety.IncludedCooldowns.ShadowBlades and f()) or (i.Subtlety.IncludedSmallCooldowns.ShadowBlades and (f() or g)) or (not i.Subtlety.IncludedSmallCooldowns.ShadowBlades and not i.Subtlety.IncludedCooldowns.ShadowBlades)) then
        SBReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.ShadowDance and f()) or (i.Subtlety.IncludedSmallCooldowns.ShadowDance and (f() or g)) or (not i.Subtlety.IncludedSmallCooldowns.ShadowDance and not i.Subtlety.IncludedCooldowns.ShadowDance)) then
        SDReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.Vanish and f()) or (i.Subtlety.IncludedSmallCooldowns.Vanish and (f() or g)) or (not i.Subtlety.IncludedSmallCooldowns.Vanish and not i.Subtlety.IncludedCooldowns.Vanish)) then
        VanishReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.SymbolsofDeath and f()) or (i.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and (f() or g)) or (not i.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and not i.Subtlety.IncludedCooldowns.SymbolsofDeath)) then
        SoDReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.ShurikenTornado and f()) or (i.Subtlety.IncludedSmallCooldowns.ShurikenTornado and (f() or g)) or (not i.Subtlety.IncludedSmallCooldowns.ShurikenTornado and not i.Subtlety.IncludedCooldowns.ShurikenTornado)) then
        STReady = true
    end

    j = GetInventoryItemID("player", 13)
    x = GetInventoryItemID("player", 14)
            if not i.Commons.Enabled.TopTrinket and not i.Commons.Enabled.BotTrinket then
        O = { j, x, d.MistcallerOcarina:ID(), d.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.TopTrinket and i.Commons.Enabled.BotTrinket then
        O = { j, d.MistcallerOcarina:ID(), d.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.BotTrinket and i.Commons.Enabled.TopTrinket then
        O = { x, d.MistcallerOcarina:ID(), d.CacheOfAcquiredTreasures:ID() }
    end

end

local function f()
    if e.Subterfuge:IsAvailable() then
        de = e.Stealth2
        C = e.VanishBuff2
    else
        de = e.Stealth
        C = e.VanishBuff
    end

    h = _()
    if xe() then
        ne = t:GetEnemiesInRange(30)
        b = t:GetEnemiesInMeleeRange(N)
        s = #b
        he = t:GetEnemiesInMeleeRange(L)
    else
        ne = {  }
        b = {  }
        s = 0
        he = {  }
    end

    u = t:ComboPoints()
    EffectiveComboPoints = r.EffectiveComboPoints(u)
    c = t:ComboPointsDeficit()
    S = false
    StealthEnergyRequired = t:EnergyMax() - te()
    if q.TargetIsValid() or t:AffectingCombat() then
        if IsInRaid() and UnitExists("boss1") then
            U = y.BossFightRemains(nil, true)
            v = U
            if v == 11111 then
                v = y.FightRemains(Enemies10yd, false)
            end

        end

    end

    if EffectiveComboPoints > u and c > 2 and t:AffectingCombat() then
        if u == 2 and not t:BuffUp(e.EchoingReprimand3) or u == 3 and not t:BuffUp(e.EchoingReprimand4) or u == 4 and not t:BuffUp(e.EchoingReprimand5) then
            local e = r.TimeToSht(4)
            if e == 0 then
                e = r.TimeToSht(5)
            end

            if e < (ue(t:EnergyTimeToX(35), t:GCDRemains()) + .5) then
                EffectiveComboPoints = u
            end

        end

    end

    if t:BuffUp(e.ShurikenTornado, nil, true) and u < r.CPMaxSpend() then
        local a = r.TimeToNextTornado()
        if a <= t:GCDRemains() or Te(t:GCDRemains() - a) < .25 then
            local e = s + p(t:BuffUp(e.ShadowBlades))
            u = _e(u + e, r.CPMaxSpend())
            c = ue(c - e, 0)
            if EffectiveComboPoints < r.CPMaxSpend() then
                EffectiveComboPoints = u
            end

        end

    end

    M = EffectiveComboPoints
    I = te()
    Ee = (4 + EffectiveComboPoints * 4) * .3
    Ie = e.Eviscerate:Damage() * i.Subtlety.EviscerateDMGOffset
    if h then
        return h
    end

    if m > 0 then
        m = 0
    end

    if o > 0 then
        o = 0
    end

    o = r.ReturnSpell()
    m = r.ReturnSpellMO()
        if a.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        le = GetTime()
        V = le + (a.GUISettings.General.OpenerReset)
    elseif a.GUISettings.General.OpenerReset > 0 and V ~= nil and GetTime() > V and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        a.ToggleIconFrame:UpdateButtonText(6)
        a.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

    if a.QueuedCast() then
        o = a.QueuedCast()
        return "Custom Queue " .. l(o):ID()
    end

        if (Q and e.CheapShot:IsUsableP() and e.CheapShot:CooldownRemains() <= 0 and t:StealthUp(true, true) and not t:PrevGCD(1, e.CheapShot)) then
        if a.Cast(e.CheapShot, nil, nil, nil) then
            if w("mouseover"):GUID() ~= nil and w("mouseover"):IsSpellInRange(e.CheapShot) then
                m = 11833
                return "queue Cheap Shot MO"
            else
                o = 1833
                return "queue Cheap Shot"
            end

        end

    elseif ((not e.CheapShot:IsUsableP() or e.CheapShot:CooldownRemains() > 0 or t:PrevGCD(1, e.CheapShot)) and Q) then
        HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
        a.Print("Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (P and e.KidneyShot:IsUsableP() and e.KidneyShot:CooldownRemains() <= 0) then
        if a.Cast(e.KidneyShot, nil, nil, nil) then
            if w("mouseover"):GUID() ~= nil and w("mouseover"):IsSpellInRange(e.KidneyShot) then
                m = 1408
                return "queue Kidney Shot MO"
            else
                o = 408
                return "queue Kidney Shot"
            end

        end

    elseif (t:PrevGCD(1, e.KidneyShot) and P) then
        HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
        a.Print("Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (Y and e.Blind:IsUsableP() and e.Blind:CooldownRemains() <= 0) then
        if a.Cast(e.Blind, nil, nil, nil) then
            if w("mouseover"):GUID() ~= nil and w("mouseover"):IsSpellInRange(e.Blind) then
                m = 12094
                return "queue Blind MO"
            else
                o = 2094
                return "queue Blind"
            end

        end

    elseif ((not e.Blind:IsUsableP() or e.Blind:CooldownRemains() > 0) and Y) then
        HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
        a.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (W and e.Sap:IsUsableP() and e.Sap:CooldownRemains() <= 0) then
        if a.Cast(e.Sap, nil, nil, nil) then
            if w("mouseover"):GUID() ~= nil and w("mouseover"):IsSpellInRange(e.Sap) then
                m = 16770
                return "queue Sap MO"
            else
                o = 6770
                return "queue Sap"
            end

        end

    elseif ((not e.Sap:IsUsableP() or e.Sap:CooldownRemains() > 0) and W) then
        HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
        a.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (F and e.ShurikenTornado:IsUsableP() and e.ShurikenTornado:CooldownRemains() <= 0) then
        if a.Cast(e.ShurikenTornado, nil, nil, nil) then
            o = 277925
            return "queue Shuriken Tornado"
        end

    elseif ((not e.ShurikenTornado:IsUsableP() or e.ShurikenTornado:CooldownRemains() > 0) and F) then
        HeroRotationCharDB.Toggles[26] = not HeroRotationCharDB.Toggles[26]
        a.Print("Shuriken Tornado Queue is now " .. (HeroRotationCharDB.Toggles[26] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (G and e.Feint:IsUsableP() and e.Feint:CooldownRemains() <= 0 and t:AffectingCombat()) then
        if a.Cast(e.Feint, nil, nil, nil) then
            o = 202
            return "queue Shuriken Tornado"
        end

    elseif ((not e.Feint:IsUsableP() or e.Feint:CooldownRemains() > 0 or not t:AffectingCombat()) and G) then
        HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27]
        a.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (B and e.Flagellation:IsUsableP() and e.Flagellation:CooldownRemains() <= 0 and t:AffectingCombat()) then
        if a.Cast(e.Flagellation, nil, nil, nil) then
            o = 323654
            return "queue Flagellation Queue"
        end

    elseif ((not e.Flagellation:IsUsableP() or e.Flagellation:CooldownRemains() > 0 or not t:AffectingCombat()) and B) then
        HeroRotationCharDB.Toggles[28] = not HeroRotationCharDB.Toggles[28]
        a.Print("Flagellation Queue is now " .. (HeroRotationCharDB.Toggles[28] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if (K) then
                                                                if (e.ArcaneTorrent:IsAvailable() and e.ArcaneTorrent:IsUsableP() and e.ArcaneTorrent:CooldownRemains() <= 0 and t:AffectingCombat()) then
            if a.Cast(e.ArcaneTorrent, nil, nil, nil) then
                o = 155145
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.LightsJudgment:IsAvailable() and e.LightsJudgment:IsUsableP() and e.LightsJudgment:CooldownRemains() <= 0 and t:AffectingCombat()) then
            if a.Cast(e.LightsJudgment, nil, nil, nil) then
                o = 255647
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.BagofTricks:IsAvailable() and e.BagofTricks:IsUsableP() and e.BagofTricks:CooldownRemains() <= 0 and t:AffectingCombat()) then
            if a.Cast(e.BagofTricks, nil, nil, nil) then
                o = 312411
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.BloodFury:IsAvailable() and e.BloodFury:IsUsableP() and e.BloodFury:CooldownRemains() <= 0 and t:AffectingCombat()) then
            if a.Cast(e.BloodFury, nil, nil, nil) then
                o = 20572
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.Berserking:IsAvailable() and e.Berserking:IsUsableP() and e.Berserking:CooldownRemains() <= 0 and t:AffectingCombat()) then
            if a.Cast(e.Berserking, nil, nil, nil) then
                o = 26297
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.Fireblood:IsAvailable() and e.Fireblood:IsUsableP() and e.Fireblood:CooldownRemains() <= 0 and t:AffectingCombat()) then
            if a.Cast(e.Fireblood, nil, nil, nil) then
                o = 265221
                return "queue ArcaneTorrent Queue"
            end

        elseif (e.AncestralCall:IsAvailable() and e.AncestralCall:IsUsableP() and e.AncestralCall:CooldownRemains() <= 0 and t:AffectingCombat()) then
            if a.Cast(e.AncestralCall, nil, nil, nil) then
                o = 274738
                return "queue ArcaneTorrent Queue"
            end

        elseif (((e.ArcaneTorrent:IsAvailable() and (not e.ArcaneTorrent:IsUsableP() or e.ArcaneTorrent:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.LightsJudgment:IsAvailable() and (not e.LightsJudgment:IsUsableP() or e.LightsJudgment:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BagofTricks:IsAvailable() and (not e.BagofTricks:IsUsableP() or e.BagofTricks:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BloodFury:IsAvailable() and (not e.BloodFury:IsUsableP() or e.BloodFury:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Berserking:IsAvailable() and (not e.Berserking:IsUsableP() or e.Berserking:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Fireblood:IsAvailable() and (not e.Fireblood:IsUsableP() or e.Fireblood:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.AncestralCall:IsAvailable() and (not e.AncestralCall:IsUsableP() or e.AncestralCall:CooldownRemains() > 0 or not t:AffectingCombat()))) and K) then
            HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30]
            a.Print("Arcane Torrent Queue is now " .. (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

    end

    h = r.CrimsonVial()
    if h then
        return h
    end

    h = r.Feint()
    if h then
        return h
    end

    h = r.Evasion()
    if h then
        return h
    end

    if t:HealthPercentage() < i.Commons.PhialHP and d.PhialofSerenity:IsReady() and d.PhialofSerenity:CooldownRemains() <= 0 then
        if a.Cast(d.PhialofSerenity, nil) then
            o = 55
            return "PhialofSerenity HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealthstoneHP and d.Healthstone:IsReady() and d.Healthstone:CooldownRemains() <= 0 then
        if a.Cast(d.Healthstone, nil) then
            o = 40
            return "Healthstone HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealPotHP and d.CosmicHealPot:IsReady() and d.CosmicHealPot:CooldownRemains() <= 0 then
        if a.Cast(d.CosmicHealPot, nil) then
            o = 45
            return "CosmicHealPot HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealPotHP and d.HealPot:IsReady() and not d.CosmicHealPot:IsReady() and d.HealPot:CooldownRemains() <= 0 then
        if a.Cast(d.HealPot, nil) then
            o = 41
            return "HealPot HP"
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.Backstab:IsReady() and w("mouseover"):IsInMeleeRange(8) then
            if a.Cast(e.Backstab, nil) then
                m = 153
                return "explosive MO SWD"
            end

        end

        if e.ShurikenToss:IsReady() and w("mouseover"):IsInMeleeRange(40) and not w("mouseover"):IsInMeleeRange(8) then
            if a.Cast(e.ShurikenToss, nil) then
                m = 1114014
                return "explosive MO SWD"
            end

        end

    end

    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if e.Backstab:IsReady() and n:IsInMeleeRange(8) then
            if a.Cast(e.Backstab, nil) then
                o = 53
                return "explosive  SWD"
            end

        end

        if e.ShurikenToss:IsReady() and n:IsInMeleeRange(40) and not n:IsInMeleeRange(8) then
            if a.Cast(e.ShurikenToss, nil) then
                o = 114014
                return "explosive MO SWD"
            end

        end

    end

    re = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 321220, 158337 }
    if UnitExists("target") and e.Shiv:IsReady() and not ie then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
            for t = 0, 40 do
                local i, i, i, i, i, i, i, i, i, t = UnitBuff("target", t)
                for n, i in se(re) do
                    if i == t then
                        if a.Cast(e.Shiv, nil) then
                            o = 5938
                            return "Shiv Enrage"
                        end

                    end

                end

            end

        end

    end

    local m = t:AffectingCombat() and 180 or 900
    local d
            if l(8679):IsAvailable() and i.Commons.LethalPoison == "Wound Poison" then
        d = t:BuffRemains(l(8679))
        if d < m and not t:IsCasting(l(8679)) then
            if a.Cast(l(8679)) then
                o = 203
                return "Wound Poison Refresh"
            end

        end

    elseif l(2823):IsAvailable() and i.Commons.LethalPoison == "Deadly Poison" then
        d = t:BuffRemains(l(2823))
        if d < m and not t:IsCasting(l(2823)) then
            if a.Cast(l(2823)) then
                o = 208
                return "Deadly Poison Refresh"
            end

        end

    elseif l(315584):IsAvailable() and i.Commons.LethalPoison == "Instant Poison" then
        d = t:BuffRemains(l(315584))
        if d < m and not t:IsCasting(l(315584)) then
            if a.Cast(l(315584)) then
                o = 205
                return "Instant Poison Refresh"
            end

        end

    end

            if l(381637):IsAvailable() and i.Commons.NonLethalPoison == "Atrophic Poison" then
        d = t:BuffRemains(l(381637))
        if d < m and not t:IsCasting(l(381637)) then
            if a.Cast(l(381637)) then
                o = 381637
                return "Atropic Poison Refresh"
            end

        end

    elseif l(5761):IsAvailable() and i.Commons.NonLethalPoison == "Numbing Poison" then
        d = t:BuffRemains(l(5761))
        if d < m and not t:IsCasting(NumbingPoison) then
            if a.Cast(l(5761)) then
                o = 204
                return "Numbing Poison Refresh"
            end

        end

    elseif l(3408):IsAvailable() and i.Commons.NonLethalPoison == "Crippling Poison" then
        d = t:BuffRemains(l(3408))
        if d < m and not t:IsCasting(NumbingPoison) then
            if a.Cast(l(3408)) then
                o = 206
                return "Crippling Poison Refresh"
            end

        end

    end

    if not t:AffectingCombat() and not t:IsDeadOrGhost() then
        if not t:BuffUp(e.ShadowDanceBuff) and not t:BuffUp(r.VanishBuffSpell()) then
            h = r.Stealth(r.StealthSpell())
            if h then
                return h
            end

        end

    end

    r.MfDSniping(e.MarkedforDeath)
    if q.TargetIsValid() and ((t:AffectingCombat() and not n:DebuffUp(e.Sap)) or ee or (t:BuffUp(C) or (StealthSpell and StealthSpell:ID() == e.Vanish:ID()))) then
        local d, l, m = GetSpellCooldown(57934)
        if i.Commons.AutoToT and t:AffectingCombat() then
            if (d + l - GetTime()) <= 0 and e.TricksoftheTrade:IsAvailable() and e.TricksoftheTrade:CooldownRemains() <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus")) and IsItemInRange(32698, "focus") then
                if a.Cast(e.TricksoftheTrade) then
                    o = 157934
                    return "ToT Focus"
                end

            end

        end

        h = H()
        if h and n:IsInMeleeRange(8) then
            return "CDs: " .. h
        end

        if e.SliceandDice:IsCastable() and s < r.CPMaxSpend() and y.FilteredFightRemains(b, ">", 6) and t:BuffRemains(e.SliceandDice) < t:GCD() and u >= 4 then
            if e.SliceandDice:IsReady() and a.Cast(e.SliceandDice) then
                o = 5171
                return "Cast Slice and Dice (Low Duration)"
            end

        end

        if t:StealthUp(true, true) then
            h = E()
            if h then
                return "Stealthed : " .. h
            end

        end

        UsePriorityRotation = false
        if t:EnergyDeficitPredicted() <= I and n:IsInMeleeRange(8) then
            h = D()
            if h then
                return "Stealth CDs: " .. h
            end

        end

        if EffectiveComboPoints >= r.CPMaxSpend() or (c <= 1 or (y.BossFilteredFightRemains("<", 2) and EffectiveComboPoints >= 3)) or (s >= 4 and EffectiveComboPoints >= 4) then
            h = k()
            if h then
                return "Finish: " .. h
            end

        end

        if t:EnergyDeficitPredicted() <= I and n:IsInMeleeRange(8) then
            h = me()
            if h then
                return "Build: " .. h
            end

        end

        if a.CDsON() then
            if e.ArcaneTorrent:IsReady() and n:IsInMeleeRange(8) and i.Commons.Enabled.Racials and t:EnergyDeficitPredicted() > 15 + t:EnergyRegen() then
                if a.Cast(e.ArcaneTorrent, nil) then
                    o = 155145
                    return "Cast Arcane Torrent"
                end

            end

            if e.ArcanePulse:IsReady() and n:IsInMeleeRange(8) and i.Commons.Enabled.Racials then
                if a.Cast(e.ArcanePulse, nil) then
                    o = 260364
                    return "Cast Arcane Pulse"
                end

            end

            if e.LightsJudgment:IsReady() and n:IsInMeleeRange(8) and i.Commons.Enabled.Racials then
                if a.Cast(e.LightsJudgment, nil) then
                    o = 255647
                    return "Cast Lights Judgment"
                end

            end

            if e.BagofTricks:IsReady() and n:IsInMeleeRange(8) and i.Commons.Enabled.Racials then
                if a.Cast(e.BagofTricks, nil) then
                    o = 312411
                    return "Cast Bag of Tricks"
                end

            end

        end

        if a.Cast(e.PoolEnergy) then
            o = 1000
            return "Pooling Resources"
        end

    end

end

local function e()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        a.ToggleIconFrame:UpdateButtonText(6)
    end

end

function ReturnSpell()
    if o == 0 then
        return 0
    else
        return o
    end

end

function ReturnSpellMO()
    if m == 0 then
        return 0
    else
        return m
    end

end

a.SetAPL(261, f, e)

