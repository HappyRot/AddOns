local e, e = ...
local e = HeroDBC.DBC
local p = HeroLib
local e = HeroCache
local f = p.Unit
local t = f.Player
local n = f.Target
local u = p.Spell
local e = p.MultiSpell
local s = p.Item
local e = p.Utils.BoolToInt
local a = HeroRotation
local je = a.AoEON
local y = a.CDsON
local A = HeroRotationCharDB.Toggles[4]
local k = HeroRotationCharDB.Toggles[5]
local oe = HeroRotationCharDB.Toggles[6]
local T = HeroRotationCharDB.Toggles[12]
local se = not HeroRotationCharDB.Toggles[15]
local ie = HeroRotationCharDB.Toggles[20]
local ae = HeroRotationCharDB.Toggles[21]
local J = HeroRotationCharDB.Toggles[22]
local Q = HeroRotationCharDB.Toggles[23]
local X = HeroRotationCharDB.Toggles[24]
local K = HeroRotationCharDB.Toggles[25]
local P = HeroRotationCharDB.Toggles[26]
local Y = HeroRotationCharDB.Toggles[27]
local B = HeroRotationCharDB.Toggles[28]
local N = HeroRotationCharDB.Toggles[29]
local G = HeroRotationCharDB.Toggles[30]
local ee = HeroRotationCharDB.Toggles[54]
local Z = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 321220, 158337 }
local ne = nil
local V = nil
local e = 0
local e = 0
local de = pairs
local e = table.insert
local qe = math.min
local ge = math.max
local pe = math.abs
local j = a.Commons.Everyone
local d = a.Commons.Rogue
local e = u.Rogue.Subtlety
local r = s.Rogue.Subtlety
local i = { General = a.GUISettings.General, Commons = a.GUISettings.APL.Rogue.Commons, Subtlety = a.GUISettings.APL.Rogue.Subtlety }
local o = t:GetEquipment()
local l = o[13] and s(o[13]) or s(0)
local h = o[14] and s(o[14]) or s(0)
local E = GetInventoryItemID("player", 13)
local _ = GetInventoryItemID("player", 14)
local I = {  }
p:RegisterForEvent(function()
    o = t:GetEquipment()
    l = o[13] and s(o[13]) or s(0)
    h = o[14] and s(o[14]) or s(0)
end, "PLAYER_EQUIPMENT_CHANGED")
local te, g, s, he
local h
local o = d.ReturnSpell()
local m = d.ReturnSpellMO()
local ve, be, xe
local M, S
local l, l
local W = 11111
local v = 11111
local b, l, c
local _e
local O
local D
local L
local F
local x
local z
local H
local R
local q
local U
local C = t:CovenantID()
p:RegisterForEvent(function()
    C = t:CovenantID()
end, "COVENANT_CHOSEN")
p:RegisterForEvent(function()
    W = 11111
    v = 11111
end, "PLAYER_REGEN_ENABLED")
local function w(e)
    if e then
        return 1
    else
        return 0
    end

end

local function le(a)
    local t = 0
    for o in de(a) do
        local a = a[o]
        if a:DebuffUp(e.Rupture) then
            t = t + 1
        end

    end

    return t
end

local function ze(t)
    return t:DebuffRemains(e.FindWeaknessDebuff)
end

local function re(e)
    return e:TimeToDie()
end

local function ke(t)
    return t:DebuffRemains(e.Rupture)
end

local function me(t)
                if (((t:DebuffRemains(e.FindWeaknessDebuff) < 1) or (e.SymbolsofDeath:CooldownRemains() < 18 and t:DebuffRemains(e.FindWeaknessDebuff) < e.SymbolsofDeath:CooldownRemains())) and t:GUID() == f("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover") then
        m = 1185438
        return true
    elseif (((t:DebuffRemains(e.FindWeaknessDebuff) < 1) or (e.SymbolsofDeath:CooldownRemains() < 18 and t:DebuffRemains(e.FindWeaknessDebuff) < e.SymbolsofDeath:CooldownRemains())) and i.Subtlety.TargetSwap == "AutoSwap" and t:GUID() ~= n:GUID() and not T) then
        m = 9999
        return true
    elseif (((t:DebuffRemains(e.FindWeaknessDebuff) < 1) or (e.SymbolsofDeath:CooldownRemains() < 18 and t:DebuffRemains(e.FindWeaknessDebuff) < e.SymbolsofDeath:CooldownRemains())) and t:GUID() == n:GUID()) then
        o = 185438
        return true
    elseif ((t:DebuffRemains(e.FindWeaknessDebuff) < 1) or (e.SymbolsofDeath:CooldownRemains() < 18 and t:DebuffRemains(e.FindWeaknessDebuff) < e.SymbolsofDeath:CooldownRemains())) then
        return true
    end

end

local function ce(e)
                if ((e:IsInRange(8) and e:TimeToDie() > 10) and e:GUID() == f("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover") then
        m = 1323654
        return true
    elseif ((e:IsInRange(8) and e:TimeToDie() > 10) and i.Subtlety.TargetSwap == "AutoSwap" and e:GUID() ~= n:GUID() and not T) then
        m = 9999
        return true
    elseif ((e:IsInRange(8) and e:TimeToDie() > 10) and e:GUID() == n:GUID()) then
        o = 323654
        return true
    elseif (e:IsInRange(8) and e:TimeToDie() > 10) then
        return true
    end

end

local function ue(e)
                if ((e:FilteredTimeToDie("<", c) or (not t:StealthUp(true, true) and t:ComboPointsDeficit() >= d.CPMaxSpend())) and e:GUID() == f("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover") then
        m = 1137619
        return true
    elseif ((e:FilteredTimeToDie("<", c) or (not t:StealthUp(true, true) and t:ComboPointsDeficit() >= d.CPMaxSpend())) and i.Subtlety.TargetSwap == "AutoSwap" and e:GUID() ~= n:GUID() and not T) then
        m = 9999
        return true
    elseif ((e:FilteredTimeToDie("<", c) or (not t:StealthUp(true, true) and t:ComboPointsDeficit() >= d.CPMaxSpend())) and e:GUID() == n:GUID()) then
        o = 137619
        return true
    elseif (e:FilteredTimeToDie("<", c) or (not t:StealthUp(true, true) and t:ComboPointsDeficit() >= d.CPMaxSpend())) then
        return true
    end

end

local function fe(t)
                if ((t:FilteredTimeToDie(">=", (2 * l)) and t:DebuffRefreshable(e.Rupture)) and t:GUID() == f("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover") then
        m = 11943
        return true
    elseif ((t:FilteredTimeToDie(">=", (2 * l)) and t:DebuffRefreshable(e.Rupture)) and i.Subtlety.TargetSwap == "AutoSwap" and t:GUID() ~= n:GUID() and not T) then
        m = 9999
        return true
    elseif ((t:FilteredTimeToDie(">=", (2 * l)) and t:DebuffRefreshable(e.Rupture)) and t:GUID() == n:GUID()) then
        o = 1943
        return true
    elseif (t:FilteredTimeToDie(">=", (2 * l)) and t:DebuffRefreshable(e.Rupture)) then
        return true
    end

end

local function ye()
    if e.ShurikenStorm:IsReady() and (s >= (2 + w(t:BuffUp(e.LingeringShadow) or t:BuffUp(e.PerforatedVeinsBuff)))) then
        if a.Cast(e.ShurikenStorm) then
            o = 197835
            return "Cast Shuriken Storm"
        end

    end

    O = not e.EchoingReprimand:IsAvailable() or (not (L and (d.TimeToSht(3) < .5 or d.TimeToSht(4) < 1) and t:Energy() < 60))
    if e.Gloomblade:IsReady() and O then
        if a.Cast(e.Gloomblade) then
            o = 200758
            return "Cast Gloomblade"
        end

    end

    if e.Backstab:IsReady() and O then
        if a.Cast(e.Backstab) then
            o = 53
            return "Cast Backstab"
        end

    end

end

local function we()
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

    if e.ColdBlood:IsReady() and k and ((not e.DanseMacabre:IsAvailable() or not e.SecretTechnique:IsAvailable()) and l >= 5) then
        if a.Cast(e.ColdBlood) then
            o = 382245
            return "Cast ColdBlood 1"
        end

    end

    if e.ColdBlood:IsReady() and k and (e.SecretTechnique:IsAvailable() and t:BuffUp(e.SecretTechnique)) then
        if a.Cast(e.ColdBlood) then
            o = 382245
            return "Cast ColdBlood 2"
        end

    end

    if e.Flagellation:IsReady() and A and (q and l >= 5) then
        if j.CastTargetIf(e.Flagellation, g, "max", re, ce, not n:IsInMeleeRange(8)) then
            return "Cast Flagellation"
        end

    end

    if e.ShurikenTornado:IsReady() and not N and STReady and (e.ShurikenTornado:IsAvailable() and not e.ShadowFocus:IsAvailable()) then
        if a.CastPooling(e.ShurikenTornado) then
            o = 1000
            return "Pool for Shuriken Tornado"
        end

    end

    if e.ShurikenTornado:IsReady() and not N and STReady and (s <= 1 and t:Energy() >= 60 and q and e.SymbolsofDeath:CooldownUp() and e.ShadowDance:ChargesFractional() >= 1. and ((not e.Flagellation:IsAvailable() and (not e.Flagellation:CooldownUp())) or (t:BuffUp(e.Flagellation)) or (s >= 5)) and l <= 2 and not t:BuffUp(e.PremeditationBuff)) then
        if a.Cast(e.ShurikenTornado) then
            o = 277925
            return "Cast Shuriken Tornado"
        end

    end

    if e.Sepsis:IsReady() and A and SnDCondition and c >= 1 and n:FilteredTimeToDie(">=", 16) then
        if a.Cast(e.Sepsis, nil, nil) then
            o = 328305
            return "Cast Sepsis"
        end

    end

    if e.SymbolsofDeath:IsReady() and SoDReady and (q and ((not e.Flagellation:IsAvailable()) or (e.Flagellation:CooldownRemains() > 10 or not A) or (e.Flagellation:CooldownUp() and l >= 5))) then
        if a.Cast(e.SymbolsofDeath, nil) then
            o = 212283
            return "Cast Symbols of Death"
        end

    end

    if e.MarkedforDeath:IsReady() then
        if j.CastTargetIf(e.MarkedforDeath, g, "min", re, ue, not n:IsInMeleeRange(8)) then
            return "Cast Marked for Death"
        end

    end

    if e.MarkedforDeath:IsReady() and (UnitIsUnit("target", "boss1") or UnitIsUnit("target", "boss2") or UnitIsUnit("target", "boss3") or UnitIsUnit("target", "boss4")) and c >= d.CPMaxSpend() then
        if a.Cast(e.MarkedforDeath, nil) then
            o = 137619
            return "Cast Marked for Death boss"
        end

    end

    if e.ShadowBlades:IsReady() and SnDCondition and SBReady and (q and c >= 2) then
        if a.Cast(e.ShadowBlades, nil) then
            o = 121471
            return "Cast Shadow Blades"
        end

    end

    if e.EchoingReprimand:IsReady() and A and (q and c >= 3 and ((x) or (s <= 4) or (e.ResoundingClarity:IsAvailable())) and (t:BuffUp(e.ShadowDanceBuff) or not e.DanseMacabre:IsAvailable())) then
        if a.Cast(e.EchoingReprimand, nil, nil) then
            o = 323547
            return "Cast Echoing Reprimand"
        end

    end

    if e.ShurikenTornado:IsReady() and STReady and not N and (q and t:BuffUp(e.SymbolsofDeath) and l <= 2 and ((not t:BuffUp(e.PremeditationBuff)) or s > 4)) then
        if a.Cast(e.ShurikenTornado) then
            o = 277925
            return "Cast Shuriken Tornado (SF)"
        end

    end

    if e.ShadowDance:IsReady() and SDReady and (not t:BuffUp(e.ShadowDanceBuff) and v <= (8 + w(e.Subterfuge:IsAvailable()))) then
        if a.Cast(e.ShadowDance) then
            o = 185313
            return "Cast Shadow Dance"
        end

    end

    if e.ThistleTea:IsReady() and y() and (e.SymbolsofDeath:CooldownRemains() >= 3 and not t:BuffUp(e.ThistleTeaBuff) and ((t:EnergyDeficitPredicted() >= 100) or (e.ThistleTea:ChargesFractional() >= 2.75 and t:EnergyDeficitPredicted() >= 40))) then
        if a.Cast(e.ThistleTea) then
            o = 381623
            return "Cast ThistleTea"
        end

    end

    if i.Commons.Enabled.Potions and y() and i.Commons.Enabled.Potions and se and (((t:BloodlustUp() or v < 30 or (t:BuffUp(e.SymbolsofDeath) and (t:BuffUp(e.ShadowBlades) or e.ShadowBlades:CooldownRemains() <= 10))) and not a.GUISettings.General.HoldPotforBL) or (a.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
        local e = j.PotionSelected()
        if e and e:IsReady() then
            if Cast(e, nil, nil) then
                o = 37
                return "potion cooldowns 2"
            end

        end

    end

    if t:BuffUp(e.SymbolsofDeath) and y() then
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

    if (i.Commons.Enabled.TopTrinket or i.Commons.Enabled.BottomTrinket) and y() then
        local h = t:GetUseableTrinkets(I)
        if r.CacheOfAcquiredTreasures:IsEquippedAndReady() then
                        if t:BuffUp(e.AcquiredAxe) and s > 1 then
                                if r.CacheOfAcquiredTreasures:ID() == E and i.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket Cache Axe for AoE"
                elseif r.CacheOfAcquiredTreasures:ID() == _ and i.Commons.Enabled.BottomTrinket then
                    o = 25
                    return "bot trinket Cache Axe for AoE"
                end

            elseif t:BuffUp(e.AcquiredWand) and (s == 1 and n:IsInBossList() or p.BossFilteredFightRemains("<", 20)) then
                                if r.CacheOfAcquiredTreasures:ID() == E and i.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket Cache Wand for ST"
                elseif r.CacheOfAcquiredTreasures:ID() == _ and i.Commons.Enabled.BottomTrinket then
                    o = 25
                    return "bot trinket Cache Wand for ST"
                end

            end

        end

        local n = t:BuffUp(e.SymbolsofDeath) or p.BossFilteredFightRemains("<", 20)
        if n then
            if h and (t:BuffUp(e.SymbolsofDeath) or v < 20) then
                if a.Cast(h, nil, nil) then
                                        if h:ID() == E and i.Commons.Enabled.TopTrinket then
                        o = 24
                        return "Generic use_items for " .. h:Name()
                    elseif h:ID() == _ and i.Commons.Enabled.BottomTrinket then
                        o = 25
                        return "Generic use_items for " .. h:Name()
                    end

                end

            end

        end

    end

end

local function O()
    F = e.Premeditation:IsAvailable() and s < 5
    if e.SliceandDice:IsReady() and (not F and s < 6 and not t:BuffUp(e.ShadowDanceBuff) and t:BuffRemains(e.SliceandDice) < v and t:BuffRefreshable(e.SliceandDice)) then
        if e.SliceandDice:IsReady() and a.Cast(e.SliceandDice) then
            o = 5171
            return "Cast Slice and Dice (not Premed)"
        end

    end

    if e.SliceandDice:IsReady() and F and e.ShadowDance:ChargesFractional() < 1.75 and t:BuffRemains(e.SliceandDice) < e.SymbolsofDeath:CooldownRemains() and (e.ShadowDance:CooldownRemains() <= 0 and (t:BuffRemains(e.SymbolsofDeath) - t:BuffRemains(e.ShadowDanceBuff)) < 1.2) then
        if e.SliceandDice:IsReady() and a.Cast(e.SliceandDice) then
            o = 5171
            return "Cast Slice and Dice (Premed)"
        end

    end

    R = ((t:BuffUp(e.ThistleTeaBuff) and s == 1) or (t:BuffUp(e.ShadowDanceBuff) and (s == 1 or (le(g) > 0 and s >= 2))))
    if e.Rupture:IsReady() and ((not R or x) and not (t:StealthUp(true, true)) and n:FilteredTimeToDie(">", 6) and n:DebuffRefreshable(e.Rupture)) then
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

    if e.Rupture:IsReady() and not R and not x and s >= 2 and s <= 3 then
        if j.CastTargetIf(e.Rupture, g, "min", ke, fe, not n:IsInMeleeRange(8)) then
            return "Cast Rupture 2"
        end

    end

    if e.Rupture:IsReady() and (not R and n:DebuffRemains(e.Rupture) < (e.SymbolsofDeath:CooldownRemains() + 10) and e.SymbolsofDeath:CooldownRemains() <= 5 and (n:FilteredTimeToDie(">", (e.SymbolsofDeath:CooldownRemains() + 5), -n:DebuffRemains(e.Rupture)))) then
        if e.Rupture:IsReady() and a.Cast(e.Rupture) then
            o = 1943
            return "Cast Rupture 3"
        end

    end

    if e.BlackPowder:IsReady() and not ie and not _e and s >= (3 - w(e.DarkBrew:IsAvailable())) then
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

local function R()
    H = e.ShadowDance:ChargesFractional() >= (.75 + w(e.ShadowDance:IsAvailable()))
    if e.Vanish:IsReady() and VanishReady and not ae and i.Commons.VanishOffensive and (not H and c > 1) then
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

    if e.Shadowmeld:IsReady() and not t:IsMoving() and i.Commons.Enabled.Racials and t:Energy() >= 40 and t:EnergyDeficitPredicted() >= 10 and not H and c > 4 then
        if a.Cast(e.Shadowmeld, nil, nil) then
            o = 58984
            return "Shadowmeld Stealth CD"
        end

    end

    z = l <= 1
    if s == 3 then
        z = c >= 2
    end

    if ((s > (4 - 2 * w(e.ShurikenTornado:IsAvailable()))) or (x and s >= 4)) then
        z = c <= 1
    end

    if s == 4 then
        z = true
    end

    if e.ShadowDance:IsReady() and SDReady and (((z and ((t:BuffRemains(e.SymbolsofDeath) >= (2.2 - w(e.Flagellation:IsAvailable()))) or H)) or (t:BuffUp(e.Flagellation)) or (t:BuffRemains(e.Flagellation) >= 6) or (s >= 4 and e.SymbolsofDeath:CooldownRemains() > 10)) and not t:BuffUp(e.TheRottenBuff)) then
        if a.Cast(e.ShadowDance) then
            o = 185313
            return " Shadow Dance Stealth CD"
        end

    end

    if e.ShadowDance:IsReady() and SDReady and ((z and v < e.SymbolsofDeath:CooldownRemains()) or (not e.ShadowDance:IsAvailable() and le(g) > 0 and s <= 4)) then
        if a.Cast(e.ShadowDance) then
            o = 185313
            return "Shadow Dance Stealth CD 2"
        end

    end

end

local function z()
    if e.Shadowstrike:IsReady() and ShadowstrikeIsReady and n:IsInMeleeRange(i.Subtlety.ShadowStrikeRange) and ((t:StealthUp(true, true) or t:BuffUp(e.VanishBuff)) and (s < 4 or x)) then
        if a.Cast(e.Shadowstrike, nil, nil) then
            o = 185438
            return "Cast Shadowstrike (Stealth)"
        end

    end

    D = ((c == 2 or c == 3) and (t:BuffUp(e.PremeditationBuff) or b < 7) and (s <= 8 or e.LightningShadow:IsAvailable()))
    if e.Gloomblade:IsReady() and D then
        if a.Cast(e.Gloomblade) then
            o = 200758
            return "Cast Gloomblade"
        end

    end

    if e.Backstab:IsReady() and D and e.DanseMacabre:IsAvailable() and t:BuffStack(e.DanseMacabreBuff) <= 2 then
        if a.Cast(e.Backstab) then
            o = 53
            return "Cast Backstab (Stealth)"
        end

    end

    if b >= d.CPMaxSpend() and n:IsInMeleeRange(8) then
        return O()
    end

    if t:BuffUp(e.ShurikenTornado) and c <= 2 and n:IsInMeleeRange(8) then
        return O()
    end

    if s >= (4 - w(e.SealFate:IsAvailable())) and b >= 4 and n:IsInMeleeRange(8) then
        return O()
    end

    if c <= 1 + w(e.SealFate:IsAvailable() or e.DeeperStratagem:IsAvailable() or e.SecretStratagem:IsAvailable()) and n:IsInMeleeRange(8) then
        return O()
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

    if e.ShurikenStorm:IsReady() and (s >= (3 + w(t:BuffUp(e.TheRottenBuff))) and (not t:BuffUp(e.PremeditationBuff) or s >= 7)) then
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

        if j.CastTargetIf(e.Shadowstrike, g, "min", ze, me) then
            return "Find the Weakness/ShadowStrike 26"
        end

    end

end

local function H()
    oe = HeroRotationCharDB.Toggles[6]
    A = HeroRotationCharDB.Toggles[4]
    k = HeroRotationCharDB.Toggles[5]
    T = HeroRotationCharDB.Toggles[12]
    se = not HeroRotationCharDB.Toggles[15]
    ie = HeroRotationCharDB.Toggles[20]
    ae = HeroRotationCharDB.Toggles[21]
    J = HeroRotationCharDB.Toggles[22]
    Q = HeroRotationCharDB.Toggles[23]
    X = HeroRotationCharDB.Toggles[24]
    K = HeroRotationCharDB.Toggles[25]
    P = HeroRotationCharDB.Toggles[26]
    Y = HeroRotationCharDB.Toggles[27]
    B = HeroRotationCharDB.Toggles[28]
    N = HeroRotationCharDB.Toggles[29]
    G = HeroRotationCharDB.Toggles[30]
    ee = HeroRotationCharDB.Toggles[54]
    SBReady = false
    SDReady = false
    VanishReady = false
    SoDReady = false
    MfDReady = true
    STReady = false
    if ((i.Subtlety.IncludedCooldowns.ShadowBlades and y()) or (i.Subtlety.IncludedSmallCooldowns.ShadowBlades and (y() or k)) or (not i.Subtlety.IncludedSmallCooldowns.ShadowBlades and not i.Subtlety.IncludedCooldowns.ShadowBlades)) then
        SBReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.ShadowDance and y()) or (i.Subtlety.IncludedSmallCooldowns.ShadowDance and (y() or k)) or (not i.Subtlety.IncludedSmallCooldowns.ShadowDance and not i.Subtlety.IncludedCooldowns.ShadowDance)) then
        SDReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.Vanish and y()) or (i.Subtlety.IncludedSmallCooldowns.Vanish and (y() or k)) or (not i.Subtlety.IncludedSmallCooldowns.Vanish and not i.Subtlety.IncludedCooldowns.Vanish)) then
        VanishReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.SymbolsofDeath and y()) or (i.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and (y() or k)) or (not i.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and not i.Subtlety.IncludedCooldowns.SymbolsofDeath)) then
        SoDReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.ShurikenTornado and y()) or (i.Subtlety.IncludedSmallCooldowns.ShurikenTornado and (y() or k)) or (not i.Subtlety.IncludedSmallCooldowns.ShurikenTornado and not i.Subtlety.IncludedCooldowns.ShurikenTornado)) then
        STReady = true
    end

    E = GetInventoryItemID("player", 13)
    _ = GetInventoryItemID("player", 14)
            if not i.Commons.Enabled.TopTrinket and not i.Commons.Enabled.BotTrinket then
        I = { E, _, r.MistcallerOcarina:ID(), r.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.TopTrinket and i.Commons.Enabled.BotTrinket then
        I = { E, r.MistcallerOcarina:ID(), r.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.BotTrinket and i.Commons.Enabled.TopTrinket then
        I = { _, r.MistcallerOcarina:ID(), r.CacheOfAcquiredTreasures:ID() }
    end

end

local function y()
    if e.Subterfuge:IsAvailable() then
        M = e.Stealth2
        S = e.VanishBuff2
    else
        M = e.Stealth
        S = e.VanishBuff
    end

    ve = nil
    xe = nil
    be = 0
    if je() then
        te = t:GetEnemiesInRange(30)
        MeleeEnemies8y = t:GetEnemiesInMeleeRange(8)
        g = t:GetEnemiesInMeleeRange(10)
        s = #g
        he = t:GetEnemiesInMeleeRange(5)
    else
        te = {  }
        g = {  }
        s = 0
        he = {  }
    end

    l = t:ComboPoints()
    c = t:ComboPointsDeficit()
    if j.TargetIsValid() or t:AffectingCombat() then
        if IsInRaid() and UnitExists("boss1") then
            W = p.BossFightRemains(nil, true)
            v = W
            if v == 11111 then
                v = p.FightRemains(Enemies10yd, false)
            end

        end

    end

    h = H()
    if h then
        return h
    end

    if m > 0 then
        m = 0
    end

    if o > 0 then
        o = 0
    end

    o = d.ReturnSpell()
    m = d.ReturnSpellMO()
        if a.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        ne = GetTime()
        V = ne + (a.GUISettings.General.OpenerReset)
    elseif a.GUISettings.General.OpenerReset > 0 and V ~= nil and GetTime() > V and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        a.ToggleIconFrame:UpdateButtonText(6)
        a.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

    if a.QueuedCast() then
        o = a.QueuedCast()
        return "Custom Queue " .. u(o):ID()
    end

        if (J and e.CheapShot:IsUsableP() and e.CheapShot:CooldownRemains() <= 0 and t:StealthUp(true, true) and not t:PrevGCD(1, e.CheapShot)) then
        if a.Cast(e.CheapShot, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(e.CheapShot) then
                m = 11833
                return "queue Cheap Shot MO"
            else
                o = 1833
                return "queue Cheap Shot"
            end

        end

    elseif ((not e.CheapShot:IsUsableP() or e.CheapShot:CooldownRemains() > 0 or t:PrevGCD(1, e.CheapShot)) and J) then
        HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
        a.Print("Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (Q and e.KidneyShot:IsUsableP() and e.KidneyShot:CooldownRemains() <= 0) then
        if a.Cast(e.KidneyShot, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(e.KidneyShot) then
                m = 1408
                return "queue Kidney Shot MO"
            else
                o = 408
                return "queue Kidney Shot"
            end

        end

    elseif (t:PrevGCD(1, e.KidneyShot) and Q) then
        HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
        a.Print("Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (X and e.Blind:IsUsableP() and e.Blind:CooldownRemains() <= 0) then
        if a.Cast(e.Blind, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(e.Blind) then
                m = 12094
                return "queue Blind MO"
            else
                o = 2094
                return "queue Blind"
            end

        end

    elseif ((not e.Blind:IsUsableP() or e.Blind:CooldownRemains() > 0) and X) then
        HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
        a.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (K and e.Sap:IsUsableP() and e.Sap:CooldownRemains() <= 0) then
        if a.Cast(e.Sap, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(e.Sap) then
                m = 16770
                return "queue Sap MO"
            else
                o = 6770
                return "queue Sap"
            end

        end

    elseif ((not e.Sap:IsUsableP() or e.Sap:CooldownRemains() > 0) and K) then
        HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
        a.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (P and e.ShurikenTornado:IsUsableP() and e.ShurikenTornado:CooldownRemains() <= 0) then
        if a.Cast(e.ShurikenTornado, nil, nil, nil) then
            o = 277925
            return "queue Shuriken Tornado"
        end

    elseif ((not e.ShurikenTornado:IsUsableP() or e.ShurikenTornado:CooldownRemains() > 0) and P) then
        HeroRotationCharDB.Toggles[26] = not HeroRotationCharDB.Toggles[26]
        a.Print("Shuriken Tornado Queue is now " .. (HeroRotationCharDB.Toggles[26] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (Y and e.Feint:IsUsableP() and e.Feint:CooldownRemains() <= 0 and t:AffectingCombat()) then
        if a.Cast(e.Feint, nil, nil, nil) then
            o = 202
            return "queue Shuriken Tornado"
        end

    elseif ((not e.Feint:IsUsableP() or e.Feint:CooldownRemains() > 0 or not t:AffectingCombat()) and Y) then
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

    if (G) then
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

        elseif (((e.ArcaneTorrent:IsAvailable() and (not e.ArcaneTorrent:IsUsableP() or e.ArcaneTorrent:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.LightsJudgment:IsAvailable() and (not e.LightsJudgment:IsUsableP() or e.LightsJudgment:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BagofTricks:IsAvailable() and (not e.BagofTricks:IsUsableP() or e.BagofTricks:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BloodFury:IsAvailable() and (not e.BloodFury:IsUsableP() or e.BloodFury:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Berserking:IsAvailable() and (not e.Berserking:IsUsableP() or e.Berserking:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Fireblood:IsAvailable() and (not e.Fireblood:IsUsableP() or e.Fireblood:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.AncestralCall:IsAvailable() and (not e.AncestralCall:IsUsableP() or e.AncestralCall:CooldownRemains() > 0 or not t:AffectingCombat()))) and G) then
            HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30]
            a.Print("Arcane Torrent Queue is now " .. (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r."))
        end

    end

    h = d.CrimsonVial()
    if h then
        return h
    end

    h = d.Feint()
    if h then
        return h
    end

    h = d.Evasion()
    if h then
        return h
    end

    if t:HealthPercentage() < i.Commons.PhialHP and r.PhialofSerenity:IsReady() and r.PhialofSerenity:CooldownRemains() <= 0 then
        if a.Cast(r.PhialofSerenity, nil) then
            o = 55
            return "PhialofSerenity HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealthstoneHP and r.Healthstone:IsReady() and r.Healthstone:CooldownRemains() <= 0 then
        if a.Cast(r.Healthstone, nil) then
            o = 40
            return "Healthstone HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealPotHP and r.CosmicHealPot:IsReady() and r.CosmicHealPot:CooldownRemains() <= 0 then
        if a.Cast(r.CosmicHealPot, nil) then
            o = 45
            return "CosmicHealPot HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealPotHP and r.HealPot:IsReady() and not r.CosmicHealPot:IsReady() and r.HealPot:CooldownRemains() <= 0 then
        if a.Cast(r.HealPot, nil) then
            o = 41
            return "HealPot HP"
        end

    end

    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if e.Backstab:IsReady() and f("mouseover"):IsInMeleeRange(8) then
            if a.Cast(e.Backstab, nil) then
                m = 153
                return "explosive MO SWD"
            end

        end

        if e.ShurikenToss:IsReady() and f("mouseover"):IsInMeleeRange(40) and not f("mouseover"):IsInMeleeRange(8) then
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

    Z = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 321220, 158337 }
    if UnitExists("target") and e.Shiv:IsReady() and not ee then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
            for t = 0, 40 do
                local t, t, t, t, t, t, t, t, t, i = UnitBuff("target", t)
                for n, t in de(Z) do
                    if t == i then
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
    local r
            if u(8679):IsAvailable() and i.Commons.LethalPoison == "Wound Poison" then
        r = t:BuffRemains(u(8679))
        if r < m and not t:IsCasting(u(8679)) then
            if a.Cast(u(8679)) then
                o = 203
                return "Wound Poison Refresh"
            end

        end

    elseif u(2823):IsAvailable() and i.Commons.LethalPoison == "Deadly Poison" then
        r = t:BuffRemains(u(2823))
        if r < m and not t:IsCasting(u(2823)) then
            if a.Cast(u(2823)) then
                o = 208
                return "Deadly Poison Refresh"
            end

        end

    elseif u(315584):IsAvailable() and i.Commons.LethalPoison == "Instant Poison" then
        r = t:BuffRemains(u(315584))
        if r < m and not t:IsCasting(u(315584)) then
            if a.Cast(u(315584)) then
                o = 205
                return "Instant Poison Refresh"
            end

        end

    end

        if u(381637):IsAvailable() and i.Commons.NonLethalPoison == "Atrophic Poison" then
        r = t:BuffRemains(u(381637))
        if r < m and not t:IsCasting(u(381637)) then
            if a.Cast(u(381637)) then
                o = 381637
                return "Atropic Poison Refresh"
            end

        end

    elseif u(5761):IsAvailable() and i.Commons.NonLethalPoison == "Numbing Poison" then
        r = t:BuffRemains(u(5761))
        if r < m and not t:IsCasting(NumbingPoison) then
            if a.Cast(u(5761)) then
                o = 204
                return "Numbing Poison Refresh"
            end

        end

    end

    if t:IsChanneling(u(324631)) then
        if a.Cast(e.PoolEnergy, nil, nil, nil) then
            o = 99999
            return "channeling Fleashcraft"
        end

    end

    if not t:AffectingCombat() and not t:IsDeadOrGhost() then
        if not t:BuffUp(e.ShadowDanceBuff) and not t:BuffUp(S) then
            h = d.Stealth(M)
            if h then
                return h
            end

        end

    end

    d.MfDSniping(e.MarkedforDeath)
    if j.TargetIsValid() and ((t:AffectingCombat() and not n:DebuffUp(e.Sap)) or oe or (t:BuffUp(S) or (StealthSpell and StealthSpell:ID() == e.Vanish:ID()))) then
        local u, r, m = GetSpellCooldown(57934)
        if i.Commons.AutoToT and t:AffectingCombat() then
            if (u + r - GetTime()) <= 0 and e.TricksoftheTrade:IsAvailable() and e.TricksoftheTrade:CooldownRemains() <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus")) and IsItemInRange(32698, "focus") then
                if a.Cast(e.TricksoftheTrade) then
                    o = 157934
                    return "ToT Focus"
                end

            end

        end

        q = (t:BuffUp(e.SliceandDice) or s >= 6)
        if C == 1 then
            L = ((l == 1 and t:BuffUp(e.EchoingReprimand2)) or (l == 2 and t:BuffUp(e.EchoingReprimand3)) or (l == 3 and t:BuffUp(e.EchoingReprimand4)) or (l == 4 and t:BuffUp(e.EchoingReprimand5)))
        end

        b = d.EffectiveComboPoints(l)
        if C == 1 and b > l and c > 2 and d.TimeToSht(4) < .5 and not L then
            b = l
        end

        if t:BuffUp(e.ShurikenTornado, nil, true) and l < d.CPMaxSpend() then
            local a = d.TimeToNextTornado()
            if a <= t:GCDRemains() or pe(t:GCDRemains() - a) < .25 then
                local e = s + w(t:BuffUp(e.ShadowBlades))
                l = qe(l + e, d.CPMaxSpend())
                c = ge(c - e, 0)
                if b < d.CPMaxSpend() then
                    b = l
                end

            end

        end

        h = we()
        if h and n:IsInMeleeRange(8) then
            return "CDs: " .. h
        end

        if e.SliceandDice:IsReady() and s < d.CPMaxSpend() and t:BuffRemains(e.SliceandDice) < t:GCD() and v > 6 and l >= 4 then
            if e.SliceandDice:IsReady() and a.Cast(e.SliceandDice) then
                o = 5171
                return "Cast Slice and Dice (Low Duration)"
            end

        end

        if (t:StealthUp(true, true)) then
            h = z()
            if h then
                return "Stealthed Rotation: " .. h
            end

        end

        x = false
        U = 25 + w(e.Vigor:IsAvailable()) * 20 + w(e.MasterofShadows:IsAvailable()) * 20 + w(e.ShadowFocus:IsAvailable()) * 25 + w(e.Alacrity:IsAvailable()) * 20 + 25 * w(s >= 4)
        if t:EnergyDeficitPredicted() <= U and n:IsInMeleeRange(8) then
            h = R()
            if h then
                return "Stealth CDs: " .. h
            end

        end

        if ((c <= 1 or (v <= 1 and b >= 3)) or (s >= 4 and b >= 4) and n:IsInMeleeRange(8)) then
            h = O()
            if h then
                return "Finish: " .. h
            end

        end

        if t:EnergyDeficitPredicted() <= U and n:IsInMeleeRange(8) then
            h = ye()
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

a.SetAPL(261, y, e)

