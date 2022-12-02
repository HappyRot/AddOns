local e, e = ...
local e = HeroDBC.DBC
local p = HeroLib
local e = HeroCache
local f = p.Unit
local t = f.Player
local n = f.Target
local r = p.Spell
local e = p.MultiSpell
local s = p.Item
local e = p.Utils.BoolToInt
local a = HeroRotation
local je = a.AoEON
local y = a.CDsON
local O = HeroRotationCharDB.Toggles[4]
local q = HeroRotationCharDB.Toggles[5]
local Z = HeroRotationCharDB.Toggles[6]
local T = HeroRotationCharDB.Toggles[12]
local de = not HeroRotationCharDB.Toggles[15]
local ne = HeroRotationCharDB.Toggles[20]
local X = HeroRotationCharDB.Toggles[21]
local Q = HeroRotationCharDB.Toggles[22]
local K = HeroRotationCharDB.Toggles[23]
local J = HeroRotationCharDB.Toggles[24]
local B = HeroRotationCharDB.Toggles[25]
local Y = HeroRotationCharDB.Toggles[26]
local G = HeroRotationCharDB.Toggles[27]
local W = HeroRotationCharDB.Toggles[28]
local te = HeroRotationCharDB.Toggles[29]
local P = HeroRotationCharDB.Toggles[30]
local ae = HeroRotationCharDB.Toggles[54]
local oe = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 321220, 158337 }
local ie = nil
local V = nil
local e = 0
local e = 0
local re = pairs
local e = table.insert
local qe = math.min
local ge = math.max
local pe = math.abs
local j = a.Commons.Everyone
local d = a.Commons.Rogue
local e = r.Rogue.Subtlety
local l = s.Rogue.Subtlety
local i = { General = a.GUISettings.General, Commons = a.GUISettings.APL.Rogue.Commons, Subtlety = a.GUISettings.APL.Rogue.Subtlety }
local o = t:GetEquipment()
local u = o[13] and s(o[13]) or s(0)
local h = o[14] and s(o[14]) or s(0)
local x = GetInventoryItemID("player", 13)
local _ = GetInventoryItemID("player", 14)
local I = {  }
p:RegisterForEvent(function()
    o = t:GetEquipment()
    u = o[13] and s(o[13]) or s(0)
    h = o[14] and s(o[14]) or s(0)
end, "PLAYER_EQUIPMENT_CHANGED")
local ee, g, s, se
local h
local o = d.ReturnSpell()
local m = d.ReturnSpellMO()
local ve, be, xe
local L, S
local u, u
local F = 11111
local v = 11111
local b, u, c
local _e
local A
local C
local U
local M
local z
local E
local N
local H
local k
local D
local R = t:CovenantID()
p:RegisterForEvent(function()
    R = t:CovenantID()
end, "COVENANT_CHOSEN")
p:RegisterForEvent(function()
    F = 11111
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
    for o in re(a) do
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

local function he(e)
    return e:TimeToDie()
end

local function ke(t)
    return t:DebuffRemains(e.Rupture)
end

local function fe(t)
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

local function ue(e)
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

local function ce(e)
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

local function we(t)
                if ((t:FilteredTimeToDie(">=", (2 * u)) and t:DebuffRefreshable(e.Rupture)) and t:GUID() == f("mouseover"):GUID() and i.Subtlety.TargetSwap == "Mouseover") then
        m = 11943
        return true
    elseif ((t:FilteredTimeToDie(">=", (2 * u)) and t:DebuffRefreshable(e.Rupture)) and i.Subtlety.TargetSwap == "AutoSwap" and t:GUID() ~= n:GUID() and not T) then
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
    if e.ShurikenStorm:IsReady() and (s >= (2 + w(t:BuffUp(e.LingeringShadow) or t:BuffUp(e.PerforatedVeinsBuff)))) then
        if a.Cast(e.ShurikenStorm) then
            o = 197835
            return "Cast Shuriken Storm"
        end

    end

    A = not e.EchoingReprimand:IsAvailable() or (not (U and (d.TimeToSht(3) < .5 or d.TimeToSht(4) < 1) and t:Energy() < 60))
    if e.Gloomblade:IsReady() and A then
        if a.Cast(e.Gloomblade) then
            o = 200758
            return "Cast Gloomblade"
        end

    end

    if e.Backstab:IsReady() and A then
        if a.Cast(e.Backstab) then
            o = 53
            return "Cast Backstab"
        end

    end

end

local function ye()
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

    if e.ColdBlood:IsReady() and q and ((not e.DanseMacabre:IsAvailable() or not e.SecretTechnique:IsAvailable()) and u >= 5) then
        if a.Cast(e.ColdBlood) then
            o = 382245
            return "Cast ColdBlood 1"
        end

    end

    if e.ColdBlood:IsReady() and q and (e.SecretTechnique:IsAvailable() and t:BuffUp(e.SecretTechnique)) then
        if a.Cast(e.ColdBlood) then
            o = 382245
            return "Cast ColdBlood 2"
        end

    end

    if e.Flagellation:IsReady() and O and (k and u >= 5) then
        if j.CastTargetIf(e.Flagellation, g, "max", he, ue, not n:IsInMeleeRange(8)) then
            return "Cast Flagellation"
        end

    end

    if e.ShurikenTornado:IsCastable() and s <= 1 and k and e.SymbolsofDeath:CooldownUp() and e.ShadowDance:Charges() >= 1 and (not e.Flagellation:IsAvailable() or t:BuffUp(e.Flagellation) or s >= 5) and u <= 2 and not t:BuffUp(e.PremeditationBuff) then
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

    if e.Sepsis:IsReady() and O and k and c >= 1 and n:FilteredTimeToDie(">=", 16) then
        if a.Cast(e.Sepsis, nil, nil) then
            o = 328305
            return "Cast Sepsis"
        end

    end

    if e.SymbolsofDeath:IsReady() and SoDReady and (k and ((not e.Flagellation:IsAvailable()) or (e.Flagellation:CooldownRemains() > 10 or not O) or (e.Flagellation:CooldownUp() and u >= 5))) then
        if a.Cast(e.SymbolsofDeath, nil) then
            o = 212283
            return "Cast Symbols of Death"
        end

    end

    if e.MarkedforDeath:IsReady() then
        if j.CastTargetIf(e.MarkedforDeath, g, "min", he, ce, not n:IsInMeleeRange(8)) then
            return "Cast Marked for Death"
        end

    end

    if e.MarkedforDeath:IsReady() and (UnitIsUnit("target", "boss1") or UnitIsUnit("target", "boss2") or UnitIsUnit("target", "boss3") or UnitIsUnit("target", "boss4")) and c >= d.CPMaxSpend() then
        if a.Cast(e.MarkedforDeath, nil) then
            o = 137619
            return "Cast Marked for Death boss"
        end

    end

    if e.ShadowBlades:IsReady() and SBReady and (k and c >= 2) then
        if a.Cast(e.ShadowBlades, nil) then
            o = 121471
            return "Cast Shadow Blades"
        end

    end

    if e.EchoingReprimand:IsReady() and O and (k and c >= 3 and ((z) or (s <= 4) or (e.ResoundingClarity:IsAvailable())) and (t:BuffUp(e.ShadowDanceBuff) or not e.DanseMacabre:IsAvailable())) then
        if a.Cast(e.EchoingReprimand, nil, nil) then
            o = 323547
            return "Cast Echoing Reprimand"
        end

    end

    if e.ShurikenTornado:IsReady() and STReady and not te and (k and t:BuffUp(e.SymbolsofDeath) and u <= 2 and ((not t:BuffUp(e.PremeditationBuff)) or s > 4)) then
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

    if i.Commons.Enabled.Potions and y() and i.Commons.Enabled.Potions and de and (((t:BloodlustUp() or v < 30 or (t:BuffUp(e.SymbolsofDeath) and (t:BuffUp(e.ShadowBlades) or e.ShadowBlades:CooldownRemains() <= 10))) and not a.GUISettings.General.HoldPotforBL) or (a.GUISettings.General.HoldPotforBL and t:BloodlustUp())) then
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
        if l.CacheOfAcquiredTreasures:IsEquippedAndReady() then
                        if t:BuffUp(e.AcquiredAxe) and s > 1 then
                                if l.CacheOfAcquiredTreasures:ID() == x and i.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket Cache Axe for AoE"
                elseif l.CacheOfAcquiredTreasures:ID() == _ and i.Commons.Enabled.BottomTrinket then
                    o = 25
                    return "bot trinket Cache Axe for AoE"
                end

            elseif t:BuffUp(e.AcquiredWand) and (s == 1 and n:IsInBossList() or p.BossFilteredFightRemains("<", 20)) then
                                if l.CacheOfAcquiredTreasures:ID() == x and i.Commons.Enabled.TopTrinket then
                    o = 24
                    return "top trinket Cache Wand for ST"
                elseif l.CacheOfAcquiredTreasures:ID() == _ and i.Commons.Enabled.BottomTrinket then
                    o = 25
                    return "bot trinket Cache Wand for ST"
                end

            end

        end

        local n = t:BuffUp(e.SymbolsofDeath) or p.BossFilteredFightRemains("<", 20)
        if n then
            if h and (t:BuffUp(e.SymbolsofDeath) or v < 20) then
                if a.Cast(h, nil, nil) then
                                        if h:ID() == x and i.Commons.Enabled.TopTrinket then
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

local function A()
    M = e.Premeditation:IsAvailable() and s < 5
    if e.SliceandDice:IsReady() and (not M and s < 6 and not t:BuffUp(e.ShadowDanceBuff) and t:BuffRemains(e.SliceandDice) < v and t:BuffRefreshable(e.SliceandDice)) then
        if e.SliceandDice:IsReady() and a.Cast(e.SliceandDice) then
            o = 5171
            return "Cast Slice and Dice (not Premed)"
        end

    end

    if e.SliceandDice:IsReady() and M and e.ShadowDance:ChargesFractional() < 1.75 and t:BuffRemains(e.SliceandDice) < e.SymbolsofDeath:CooldownRemains() and (e.ShadowDance:CooldownRemains() <= 0 and (t:BuffRemains(e.SymbolsofDeath) - t:BuffRemains(e.ShadowDanceBuff)) < 1.2) then
        if e.SliceandDice:IsReady() and a.Cast(e.SliceandDice) then
            o = 5171
            return "Cast Slice and Dice (Premed)"
        end

    end

    H = ((t:BuffUp(e.ThistleTeaBuff) and s == 1) or (t:BuffUp(e.ShadowDanceBuff) and (s == 1 or (le(g) > 0 and s >= 2))))
    if e.Rupture:IsReady() and ((not H or z) and not (t:StealthUp(true, true)) and n:FilteredTimeToDie(">", 6) and n:DebuffRefreshable(e.Rupture)) then
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

    if e.Rupture:IsReady() and not H and not z and s >= 2 and s <= 3 then
        if j.CastTargetIf(e.Rupture, g, "min", ke, we, not n:IsInMeleeRange(8)) then
            return "Cast Rupture 2"
        end

    end

    if e.Rupture:IsReady() and (not H and n:DebuffRemains(e.Rupture) < (e.SymbolsofDeath:CooldownRemains() + 10) and e.SymbolsofDeath:CooldownRemains() <= 5 and (n:FilteredTimeToDie(">", (e.SymbolsofDeath:CooldownRemains() + 5), -n:DebuffRemains(e.Rupture)))) then
        if e.Rupture:IsReady() and a.Cast(e.Rupture) then
            o = 1943
            return "Cast Rupture 3"
        end

    end

    if e.BlackPowder:IsReady() and not ne and not _e and s >= (3 - w(e.DarkBrew:IsAvailable())) then
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

local function H()
    N = e.ShadowDance:ChargesFractional() >= (.75 + w(e.ShadowDance:IsAvailable()))
    if e.Vanish:IsReady() and VanishReady and not X and i.Commons.VanishOffensive and (not N and c > 1) then
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

    if e.Shadowmeld:IsReady() and not t:IsMoving() and i.Commons.Enabled.Racials and t:Energy() >= 40 and t:EnergyDeficitPredicted() >= 10 and not N and c > 4 then
        if a.Cast(e.Shadowmeld, nil, nil) then
            o = 58984
            return "Shadowmeld Stealth CD"
        end

    end

    E = u <= 1
    if s == 3 then
        E = c >= 2
    end

    if ((s > (4 - 2 * w(e.ShurikenTornado:IsAvailable()))) or (z and s >= 4)) then
        E = c <= 1
    end

    if s == 4 then
        E = true
    end

    if e.ShadowDance:IsReady() and SDReady and (((E and ((t:BuffRemains(e.SymbolsofDeath) >= (2.2 - w(e.Flagellation:IsAvailable()))) or N)) or (t:BuffUp(e.Flagellation)) or (t:BuffRemains(e.Flagellation) >= 6) or (s >= 4 and e.SymbolsofDeath:CooldownRemains() > 10)) and not t:BuffUp(e.TheRottenBuff)) then
        if a.Cast(e.ShadowDance) then
            o = 185313
            return " Shadow Dance Stealth CD"
        end

    end

    if e.ShadowDance:IsReady() and SDReady and ((E and v < e.SymbolsofDeath:CooldownRemains()) or (not e.ShadowDance:IsAvailable() and le(g) > 0 and s <= 4)) then
        if a.Cast(e.ShadowDance) then
            o = 185313
            return "Shadow Dance Stealth CD 2"
        end

    end

end

local function E()
    if e.Shadowstrike:IsReady() and ShadowstrikeIsReady and n:IsInMeleeRange(i.Subtlety.ShadowStrikeRange) and ((t:StealthUp(true, true) or t:BuffUp(e.VanishBuff)) and (s < 4 or z)) then
        if a.Cast(e.Shadowstrike, nil, nil) then
            o = 185438
            return "Cast Shadowstrike (Stealth)"
        end

    end

    C = ((c == 2 or c == 3) and (t:BuffUp(e.PremeditationBuff) or b < 7) and (s <= 8 or e.LightningShadow:IsAvailable()))
    if e.Gloomblade:IsReady() and C then
        if a.Cast(e.Gloomblade) then
            o = 200758
            return "Cast Gloomblade"
        end

    end

    if e.Backstab:IsReady() and C and e.DanseMacabre:IsAvailable() and t:BuffStack(e.DanseMacabreBuff) <= 2 then
        if a.Cast(e.Backstab) then
            o = 53
            return "Cast Backstab (Stealth)"
        end

    end

    if b >= d.CPMaxSpend() and n:IsInMeleeRange(8) then
        return A()
    end

    if t:BuffUp(e.ShurikenTornado) and c <= 2 and n:IsInMeleeRange(8) then
        return A()
    end

    if s >= (4 - w(e.SealFate:IsAvailable())) and b >= 4 and n:IsInMeleeRange(8) then
        return A()
    end

    if c <= 1 + w(e.SealFate:IsAvailable() or e.DeeperStratagem:IsAvailable() or e.SecretStratagem:IsAvailable()) and n:IsInMeleeRange(8) then
        return A()
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

        if j.CastTargetIf(e.Shadowstrike, g, "min", ze, fe) then
            return "Find the Weakness/ShadowStrike 26"
        end

    end

end

local function N()
    Z = HeroRotationCharDB.Toggles[6]
    O = HeroRotationCharDB.Toggles[4]
    q = HeroRotationCharDB.Toggles[5]
    T = HeroRotationCharDB.Toggles[12]
    de = not HeroRotationCharDB.Toggles[15]
    ne = HeroRotationCharDB.Toggles[20]
    X = HeroRotationCharDB.Toggles[21]
    Q = HeroRotationCharDB.Toggles[22]
    K = HeroRotationCharDB.Toggles[23]
    J = HeroRotationCharDB.Toggles[24]
    B = HeroRotationCharDB.Toggles[25]
    Y = HeroRotationCharDB.Toggles[26]
    G = HeroRotationCharDB.Toggles[27]
    W = HeroRotationCharDB.Toggles[28]
    te = HeroRotationCharDB.Toggles[29]
    P = HeroRotationCharDB.Toggles[30]
    ae = HeroRotationCharDB.Toggles[54]
    SBReady = false
    SDReady = false
    VanishReady = false
    SoDReady = false
    MfDReady = true
    STReady = false
    if ((i.Subtlety.IncludedCooldowns.ShadowBlades and y()) or (i.Subtlety.IncludedSmallCooldowns.ShadowBlades and (y() or q)) or (not i.Subtlety.IncludedSmallCooldowns.ShadowBlades and not i.Subtlety.IncludedCooldowns.ShadowBlades)) then
        SBReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.ShadowDance and y()) or (i.Subtlety.IncludedSmallCooldowns.ShadowDance and (y() or q)) or (not i.Subtlety.IncludedSmallCooldowns.ShadowDance and not i.Subtlety.IncludedCooldowns.ShadowDance)) then
        SDReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.Vanish and y()) or (i.Subtlety.IncludedSmallCooldowns.Vanish and (y() or q)) or (not i.Subtlety.IncludedSmallCooldowns.Vanish and not i.Subtlety.IncludedCooldowns.Vanish)) then
        VanishReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.SymbolsofDeath and y()) or (i.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and (y() or q)) or (not i.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and not i.Subtlety.IncludedCooldowns.SymbolsofDeath)) then
        SoDReady = true
    end

    if ((i.Subtlety.IncludedCooldowns.ShurikenTornado and y()) or (i.Subtlety.IncludedSmallCooldowns.ShurikenTornado and (y() or q)) or (not i.Subtlety.IncludedSmallCooldowns.ShurikenTornado and not i.Subtlety.IncludedCooldowns.ShurikenTornado)) then
        STReady = true
    end

    x = GetInventoryItemID("player", 13)
    _ = GetInventoryItemID("player", 14)
            if not i.Commons.Enabled.TopTrinket and not i.Commons.Enabled.BotTrinket then
        I = { x, _, l.MistcallerOcarina:ID(), l.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.TopTrinket and i.Commons.Enabled.BotTrinket then
        I = { x, l.MistcallerOcarina:ID(), l.CacheOfAcquiredTreasures:ID() }
    elseif not i.Commons.Enabled.BotTrinket and i.Commons.Enabled.TopTrinket then
        I = { _, l.MistcallerOcarina:ID(), l.CacheOfAcquiredTreasures:ID() }
    end

end

local function y()
    if e.Subterfuge:IsAvailable() then
        L = e.Stealth2
        S = e.VanishBuff2
    else
        L = e.Stealth
        S = e.VanishBuff
    end

    ve = nil
    xe = nil
    be = 0
    if je() then
        ee = t:GetEnemiesInRange(30)
        MeleeEnemies8y = t:GetEnemiesInMeleeRange(8)
        g = t:GetEnemiesInMeleeRange(10)
        s = #g
        se = t:GetEnemiesInMeleeRange(5)
    else
        ee = {  }
        g = {  }
        s = 0
        se = {  }
    end

    u = t:ComboPoints()
    c = t:ComboPointsDeficit()
    if j.TargetIsValid() or t:AffectingCombat() then
        if IsInRaid() and UnitExists("boss1") then
            F = p.BossFightRemains(nil, true)
            v = F
            if v == 11111 then
                v = p.FightRemains(Enemies10yd, false)
            end

        end

    end

    h = N()
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
        ie = GetTime()
        V = ie + (a.GUISettings.General.OpenerReset)
    elseif a.GUISettings.General.OpenerReset > 0 and V ~= nil and GetTime() > V and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        a.ToggleIconFrame:UpdateButtonText(6)
        a.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end

    if a.QueuedCast() then
        o = a.QueuedCast()
        return "Custom Queue " .. r(o):ID()
    end

        if (Q and e.CheapShot:IsUsableP() and e.CheapShot:CooldownRemains() <= 0 and t:StealthUp(true, true) and not t:PrevGCD(1, e.CheapShot)) then
        if a.Cast(e.CheapShot, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(e.CheapShot) then
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

        if (K and e.KidneyShot:IsUsableP() and e.KidneyShot:CooldownRemains() <= 0) then
        if a.Cast(e.KidneyShot, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(e.KidneyShot) then
                m = 1408
                return "queue Kidney Shot MO"
            else
                o = 408
                return "queue Kidney Shot"
            end

        end

    elseif (t:PrevGCD(1, e.KidneyShot) and K) then
        HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
        a.Print("Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (J and e.Blind:IsUsableP() and e.Blind:CooldownRemains() <= 0) then
        if a.Cast(e.Blind, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(e.Blind) then
                m = 12094
                return "queue Blind MO"
            else
                o = 2094
                return "queue Blind"
            end

        end

    elseif ((not e.Blind:IsUsableP() or e.Blind:CooldownRemains() > 0) and J) then
        HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
        a.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (B and e.Sap:IsUsableP() and e.Sap:CooldownRemains() <= 0) then
        if a.Cast(e.Sap, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(e.Sap) then
                m = 16770
                return "queue Sap MO"
            else
                o = 6770
                return "queue Sap"
            end

        end

    elseif ((not e.Sap:IsUsableP() or e.Sap:CooldownRemains() > 0) and B) then
        HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
        a.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

        if (Y and e.ShurikenTornado:IsUsableP() and e.ShurikenTornado:CooldownRemains() <= 0) then
        if a.Cast(e.ShurikenTornado, nil, nil, nil) then
            o = 277925
            return "queue Shuriken Tornado"
        end

    elseif ((not e.ShurikenTornado:IsUsableP() or e.ShurikenTornado:CooldownRemains() > 0) and Y) then
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

        if (W and e.Flagellation:IsUsableP() and e.Flagellation:CooldownRemains() <= 0 and t:AffectingCombat()) then
        if a.Cast(e.Flagellation, nil, nil, nil) then
            o = 323654
            return "queue Flagellation Queue"
        end

    elseif ((not e.Flagellation:IsUsableP() or e.Flagellation:CooldownRemains() > 0 or not t:AffectingCombat()) and W) then
        HeroRotationCharDB.Toggles[28] = not HeroRotationCharDB.Toggles[28]
        a.Print("Flagellation Queue is now " .. (HeroRotationCharDB.Toggles[28] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end

    if (P) then
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

        elseif (((e.ArcaneTorrent:IsAvailable() and (not e.ArcaneTorrent:IsUsableP() or e.ArcaneTorrent:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.LightsJudgment:IsAvailable() and (not e.LightsJudgment:IsUsableP() or e.LightsJudgment:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BagofTricks:IsAvailable() and (not e.BagofTricks:IsUsableP() or e.BagofTricks:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.BloodFury:IsAvailable() and (not e.BloodFury:IsUsableP() or e.BloodFury:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Berserking:IsAvailable() and (not e.Berserking:IsUsableP() or e.Berserking:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.Fireblood:IsAvailable() and (not e.Fireblood:IsUsableP() or e.Fireblood:CooldownRemains() > 0 or not t:AffectingCombat())) or (e.AncestralCall:IsAvailable() and (not e.AncestralCall:IsUsableP() or e.AncestralCall:CooldownRemains() > 0 or not t:AffectingCombat()))) and P) then
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

    if t:HealthPercentage() < i.Commons.PhialHP and l.PhialofSerenity:IsReady() and l.PhialofSerenity:CooldownRemains() <= 0 then
        if a.Cast(l.PhialofSerenity, nil) then
            o = 55
            return "PhialofSerenity HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealthstoneHP and l.Healthstone:IsReady() and l.Healthstone:CooldownRemains() <= 0 then
        if a.Cast(l.Healthstone, nil) then
            o = 40
            return "Healthstone HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealPotHP and l.CosmicHealPot:IsReady() and l.CosmicHealPot:CooldownRemains() <= 0 then
        if a.Cast(l.CosmicHealPot, nil) then
            o = 45
            return "CosmicHealPot HP"
        end

    end

    if t:HealthPercentage() < i.Commons.HealPotHP and l.HealPot:IsReady() and not l.CosmicHealPot:IsReady() and l.HealPot:CooldownRemains() <= 0 then
        if a.Cast(l.HealPot, nil) then
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

    oe = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085, 333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 359668, 321220, 158337 }
    if UnitExists("target") and e.Shiv:IsReady() and not ae then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
            for t = 0, 40 do
                local t, t, t, t, t, t, t, t, t, i = UnitBuff("target", t)
                for n, t in re(oe) do
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
    local l
            if r(8679):IsAvailable() and i.Commons.LethalPoison == "Wound Poison" then
        l = t:BuffRemains(r(8679))
        if l < m and not t:IsCasting(r(8679)) then
            if a.Cast(r(8679)) then
                o = 203
                return "Wound Poison Refresh"
            end

        end

    elseif r(2823):IsAvailable() and i.Commons.LethalPoison == "Deadly Poison" then
        l = t:BuffRemains(r(2823))
        if l < m and not t:IsCasting(r(2823)) then
            if a.Cast(r(2823)) then
                o = 208
                return "Deadly Poison Refresh"
            end

        end

    elseif r(315584):IsAvailable() and i.Commons.LethalPoison == "Instant Poison" then
        l = t:BuffRemains(r(315584))
        if l < m and not t:IsCasting(r(315584)) then
            if a.Cast(r(315584)) then
                o = 205
                return "Instant Poison Refresh"
            end

        end

    end

            if r(381637):IsAvailable() and i.Commons.NonLethalPoison == "Atrophic Poison" then
        l = t:BuffRemains(r(381637))
        if l < m and not t:IsCasting(r(381637)) then
            if a.Cast(r(381637)) then
                o = 381637
                return "Atropic Poison Refresh"
            end

        end

    elseif r(5761):IsAvailable() and i.Commons.NonLethalPoison == "Numbing Poison" then
        l = t:BuffRemains(r(5761))
        if l < m and not t:IsCasting(NumbingPoison) then
            if a.Cast(r(5761)) then
                o = 204
                return "Numbing Poison Refresh"
            end

        end

    elseif r(3408):IsAvailable() and i.Commons.NonLethalPoison == "Crippling Poison" then
        l = t:BuffRemains(r(3408))
        if l < m and not t:IsCasting(NumbingPoison) then
            if a.Cast(r(3408)) then
                o = 206
                return "Crippling Poison Refresh"
            end

        end

    end

    if t:IsChanneling(r(324631)) then
        if a.Cast(e.PoolEnergy, nil, nil, nil) then
            o = 99999
            return "channeling Fleashcraft"
        end

    end

    if not t:AffectingCombat() and not t:IsDeadOrGhost() then
        if not t:BuffUp(e.ShadowDanceBuff) and not t:BuffUp(S) then
            h = d.Stealth(L)
            if h then
                return h
            end

        end

    end

    d.MfDSniping(e.MarkedforDeath)
    if j.TargetIsValid() and ((t:AffectingCombat() and not n:DebuffUp(e.Sap)) or Z or (t:BuffUp(S) or (StealthSpell and StealthSpell:ID() == e.Vanish:ID()))) then
        local r, l, m = GetSpellCooldown(57934)
        if i.Commons.AutoToT and t:AffectingCombat() then
            if (r + l - GetTime()) <= 0 and e.TricksoftheTrade:IsAvailable() and e.TricksoftheTrade:CooldownRemains() <= 0 and UnitExists("focus") and (UnitInParty("focus") or UnitInRaid("focus")) and IsItemInRange(32698, "focus") then
                if a.Cast(e.TricksoftheTrade) then
                    o = 157934
                    return "ToT Focus"
                end

            end

        end

        k = (t:BuffUp(e.SliceandDice) or s >= 6)
        if R == 1 then
            U = ((u == 1 and t:BuffUp(e.EchoingReprimand2)) or (u == 2 and t:BuffUp(e.EchoingReprimand3)) or (u == 3 and t:BuffUp(e.EchoingReprimand4)) or (u == 4 and t:BuffUp(e.EchoingReprimand5)))
        end

        b = d.EffectiveComboPoints(u)
        if R == 1 and b > u and c > 2 and d.TimeToSht(4) < .5 and not U then
            b = u
        end

        if t:BuffUp(e.ShurikenTornado, nil, true) and u < d.CPMaxSpend() then
            local a = d.TimeToNextTornado()
            if a <= t:GCDRemains() or pe(t:GCDRemains() - a) < .25 then
                local e = s + w(t:BuffUp(e.ShadowBlades))
                u = qe(u + e, d.CPMaxSpend())
                c = ge(c - e, 0)
                if b < d.CPMaxSpend() then
                    b = u
                end

            end

        end

        h = ye()
        if h and n:IsInMeleeRange(8) then
            return "CDs: " .. h
        end

        if e.SliceandDice:IsReady() and s < d.CPMaxSpend() and t:BuffRemains(e.SliceandDice) < t:GCD() and v > 6 and u >= 4 then
            if e.SliceandDice:IsReady() and a.Cast(e.SliceandDice) then
                o = 5171
                return "Cast Slice and Dice (Low Duration)"
            end

        end

        if (t:StealthUp(true, true)) then
            h = E()
            if h then
                return "Stealthed Rotation: " .. h
            end

        end

        z = false
        D = 25 + w(e.Vigor:IsAvailable()) * 20 + w(e.MasterofShadows:IsAvailable()) * 20 + w(e.ShadowFocus:IsAvailable()) * 25 + w(e.Alacrity:IsAvailable()) * 20 + 25 * w(s >= 4)
        if t:EnergyDeficitPredicted() <= D and n:IsInMeleeRange(8) then
            h = H()
            if h then
                return "Stealth CDs: " .. h
            end

        end

        if ((c <= 1 or (v <= 1 and b >= 3)) or (s >= 4 and b >= 4) and n:IsInMeleeRange(8)) then
            h = A()
            if h then
                return "Finish: " .. h
            end

        end

        if t:EnergyDeficitPredicted() <= D and n:IsInMeleeRange(8) then
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

a.SetAPL(261, y, e)

