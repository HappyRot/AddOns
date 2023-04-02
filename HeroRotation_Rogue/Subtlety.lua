local a, b = ...
local c = HeroDBC.DBC
local d = HeroLib
local e = HeroCache
local f = d.Unit
local g = f.Player
local h = f.Target
local i = d.Spell
local j = d.MultiSpell
local k = d.Item
local l = d.Utils.BoolToInt
local m = HeroRotation
local n = m.AoEON
local o = m.CDsON
local p = HeroRotationCharDB.Toggles[4]
local q = HeroRotationCharDB.Toggles[5]
local r = HeroRotationCharDB.Toggles[12]
local s = not HeroRotationCharDB.Toggles[15]
local t = HeroRotationCharDB.Toggles[20]
local u = HeroRotationCharDB.Toggles[21]
local v = HeroRotationCharDB.Toggles[22]
local w = HeroRotationCharDB.Toggles[23]
local x = HeroRotationCharDB.Toggles[24]
local y = HeroRotationCharDB.Toggles[25]
local z = HeroRotationCharDB.Toggles[26]
local A = HeroRotationCharDB.Toggles[27]
local B = HeroRotationCharDB.Toggles[28]
local C = HeroRotationCharDB.Toggles[29]
local D = HeroRotationCharDB.Toggles[30]
local E = HeroRotationCharDB.Toggles[54]
local F = {
    324736,
    228318,
    178658,
    333227,
    334800,
    334967,
    324737,
    326450,
    334470,
    320703,
    320012,
    324085,
    333241,
    331510,
    344739,
    368477,
    368396,
    355057,
    356133,
    342139,
    353706,
    355782,
    327155,
    359668,
    321220,
    158337
}
local G = nil
local H = nil
local I = 0
local J = 0
local pairs = pairs
local K = table.insert
local L = math.min
local M = math.max
local N = math.abs
local O = m.Commons.Everyone
local P = m.Commons.Rogue
local Q = i.Rogue.Subtlety
local R = k.Rogue.Subtlety
local S = {
    General = m.GUISettings.General,
    Commons = m.GUISettings.APL.Rogue.Commons,
    Subtlety = m.GUISettings.APL.Rogue.Subtlety
}
local function T()
    if S.Subtlety.BurnShadowDance == "On Bosses not in Dungeons" and g:IsInDungeonArea() then
        return false
    elseif S.Subtlety.BurnShadowDance ~= "Always" and not h:IsInBossList() then
        return false
    else
        return true
    end
end
local U = g:GetEquipment()
local V = U[13] and k(U[13]) or k(0)
local W = U[14] and k(U[14]) or k(0)
local X = GetInventoryItemID("player", 13)
local Y = GetInventoryItemID("player", 14)
local Z = {}
d:RegisterForEvent(
    function()
        U = g:GetEquipment()
        V = U[13] and k(U[13]) or k(0)
        W = U[14] and k(U[14]) or k(0)
    end,
    "PLAYER_EQUIPMENT_CHANGED"
)
local _, a0, a1, a2
local a3, a4, a5, a6
local a7
local a8 = P.ReturnSpell()
local a9 = P.ReturnSpellMO()
local aa, ab, ac
local ad, ae
local af, ag
local ah = 11111
local ai = 11111
local aj, ak, al
local am
local an
local ao
local ap
local aq
local ar
local as
local at
local au
local av
local aw
local ax = g:CovenantID()
d:RegisterForEvent(
    function()
        ax = g:CovenantID()
    end,
    "COVENANT_CHOSEN"
)
d:RegisterForEvent(
    function()
        ah = 11111
        ai = 11111
    end,
    "PLAYER_REGEN_ENABLED"
)
local function ay(az)
    if az then
        return 1
    else
        return 0
    end
end
local function aA()
    return 25 + ay(Q.Vigor:IsAvailable()) * 20 + ay(Q.MasterofShadows:IsAvailable()) * 20 +
        ay(Q.ShadowFocus:IsAvailable()) * 25 +
        ay(Q.Alacrity:IsAvailable()) * 20 +
        ay(a1 >= 4) * 25
end
local function aB()
    return Q.ShadowDance:ChargesFractional() >= 0.75 + l(Q.ShadowDanceTalent:IsAvailable())
end
local function aC()
    if a1 == 4 then
        return true
    elseif a1 > 4 - 2 * l(Q.ShurikenTornado:IsAvailable()) or am and a1 >= 4 then
        return al <= 1
    elseif a1 == 3 then
        return al >= 2
    else
        return ak <= 1
    end
end
local function av()
    return g:BuffUp(Q.SliceandDice) or a1 >= P.CPMaxSpend()
end
local function aD(aE)
    return g:BuffUp(Q.ThistleTea) and a1 == 1 or aE and (a1 == 1 or h:DebuffUp(Q.Rupture) and a1 >= 2)
end
local function aF(aG)
    local aH = 0
    for aI in pairs(aG) do
        local aJ = aG[aI]
        if aJ:DebuffUp(Q.Rupture) then
            aH = aH + 1
        end
    end
    return aH
end
local function aK(aL)
    return aL:DebuffRemains(Q.FindWeaknessDebuff)
end
local function aM(aL)
    return aL:TimeToDie()
end
local function aN(aL)
    return aL:DebuffRemains(Q.Rupture)
end
local function aO(aL)
    if
        (aL:DebuffRemains(Q.FindWeaknessDebuff) < 1 or
            Q.SymbolsofDeath:CooldownRemains() < 18 and
                aL:DebuffRemains(Q.FindWeaknessDebuff) < Q.SymbolsofDeath:CooldownRemains()) and
            aL:GUID() == f("mouseover"):GUID() and
            S.Subtlety.TargetSwap == "Mouseover"
     then
        a9 = 1185438
        return true
    elseif
        (aL:DebuffRemains(Q.FindWeaknessDebuff) < 1 or
            Q.SymbolsofDeath:CooldownRemains() < 18 and
                aL:DebuffRemains(Q.FindWeaknessDebuff) < Q.SymbolsofDeath:CooldownRemains()) and
            S.Subtlety.TargetSwap == "AutoSwap" and
            aL:GUID() ~= h:GUID() and
            not r
     then
        a9 = 9999
        return true
    elseif
        (aL:DebuffRemains(Q.FindWeaknessDebuff) < 1 or
            Q.SymbolsofDeath:CooldownRemains() < 18 and
                aL:DebuffRemains(Q.FindWeaknessDebuff) < Q.SymbolsofDeath:CooldownRemains()) and
            aL:GUID() == h:GUID()
     then
        a8 = 185438
        return true
    elseif
        aL:DebuffRemains(Q.FindWeaknessDebuff) < 1 or
            Q.SymbolsofDeath:CooldownRemains() < 18 and
                aL:DebuffRemains(Q.FindWeaknessDebuff) < Q.SymbolsofDeath:CooldownRemains()
     then
        return true
    end
end
local function aP(aL)
    if
        aL:IsInRange(8) and aL:TimeToDie() > 10 and aL:GUID() == f("mouseover"):GUID() and
            S.Subtlety.TargetSwap == "Mouseover"
     then
        a9 = 1323654
        return true
    elseif
        aL:IsInRange(8) and aL:TimeToDie() > 10 and S.Subtlety.TargetSwap == "AutoSwap" and aL:GUID() ~= h:GUID() and
            not r
     then
        a9 = 9999
        return true
    elseif aL:IsInRange(8) and aL:TimeToDie() > 10 and aL:GUID() == h:GUID() then
        a8 = 323654
        return true
    elseif aL:IsInRange(8) and aL:TimeToDie() > 10 then
        return true
    end
end
local function aQ(aL)
    if
        (aL:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= P.CPMaxSpend()) and
            aL:GUID() == f("mouseover"):GUID() and
            S.Subtlety.TargetSwap == "Mouseover"
     then
        a9 = 1137619
        return true
    elseif
        (aL:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= P.CPMaxSpend()) and
            S.Subtlety.TargetSwap == "AutoSwap" and
            aL:GUID() ~= h:GUID() and
            not r
     then
        a9 = 9999
        return true
    elseif
        (aL:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= P.CPMaxSpend()) and
            aL:GUID() == h:GUID()
     then
        a8 = 137619
        return true
    elseif aL:FilteredTimeToDie("<", al) or not g:StealthUp(true, true) and g:ComboPointsDeficit() >= P.CPMaxSpend() then
        return true
    end
end
local function aR(aL)
    if
        aL:FilteredTimeToDie(">=", 2 * ak) and aL:DebuffRefreshable(Q.Rupture) and aL:GUID() == f("mouseover"):GUID() and
            S.Subtlety.TargetSwap == "Mouseover"
     then
        a9 = 11943
        return true
    elseif
        aL:FilteredTimeToDie(">=", 2 * ak) and aL:DebuffRefreshable(Q.Rupture) and S.Subtlety.TargetSwap == "AutoSwap" and
            aL:GUID() ~= h:GUID() and
            not r
     then
        a9 = 9999
        return true
    elseif aL:FilteredTimeToDie(">=", 2 * ak) and aL:DebuffRefreshable(Q.Rupture) and aL:GUID() == h:GUID() then
        a8 = 1943
        return true
    elseif aL:FilteredTimeToDie(">=", 2 * ak) and aL:DebuffRefreshable(Q.Rupture) then
        return true
    end
end
local function aS()
    if
        m.AoEON() and Q.ShurikenStorm:IsCastable() and
            a1 >=
                2 +
                    l(
                        Q.Gloomblade:IsAvailable() and g:BuffRemains(Q.LingeringShadowBuff) >= 6 or
                            g:BuffUp(Q.PerforatedVeinsBuff)
                    )
     then
        if m.Cast(Q.ShurikenStorm) then
            a8 = 197835
            return "Cast Shuriken Storm"
        end
    end
    an =
        not Q.EchoingReprimand:IsAvailable() or
        not (ap and (P.TimeToSht(3) < 0.5 or P.TimeToSht(4) < 1) and g:Energy() < 60)
    if Q.Gloomblade:IsReady() and an then
        if m.Cast(Q.Gloomblade) then
            a8 = 200758
            return "Cast Gloomblade"
        end
    end
    if Q.Backstab:IsReady() and an then
        if m.Cast(Q.Backstab) then
            a8 = 53
            return "Cast Backstab"
        end
    end
end
local function aT()
    if g:BuffUp(Q.ShurikenTornado) then
        if
            Q.SymbolsofDeath:IsCastable() and Q.ShadowDance:IsCastable() and not g:BuffUp(Q.SymbolsofDeath) and
                not g:BuffUp(Q.ShadowDance)
         then
            if m.Cast(Q.ShadowDance) then
                a8 = 800
                return "Dance + Symbols (during Tornado)"
            end
        elseif Q.SymbolsofDeath:IsCastable() and not g:BuffUp(Q.SymbolsofDeath) then
            if m.Cast(Q.SymbolsofDeath) then
                a8 = 212283
                return "Cast Symbols of Death (during Tornado)"
            end
        elseif Q.ShadowDance:IsCastable() and not g:BuffUp(Q.ShadowDanceBuff) then
            if m.Cast(Q.ShadowDance) then
                a8 = 185313
                return "Cast Shadow Dance (during Tornado)"
            end
        end
    end
    local aU = av()
    if Q.Vanish:IsCastable() and ak <= 2 and g:BuffStack(Q.DanseMacabreBuff) > 3 then
        if m.Cast(Q.Vanish, nil, nil) then
            a8 = 1856
            return "Vanish Stealth CD"
        end
    end
    if Q.ColdBlood:IsReady() and not Q.SecretTechnique:IsAvailable() and ak >= 5 then
        if m.Cast(Q.ColdBlood) then
            a8 = 382245
            return "Cast Cold Blood"
        end
    end
    if a5 then
        if
            o() and Q.Flagellation:IsReady() and aU and not g:StealthUp(false, false) and ak >= 5 and
                h:FilteredTimeToDie(">", 10)
         then
            if O.CastTargetIf(Q.Flagellation, a0, "max", aM, aP, not h:IsInMeleeRange(8)) then
                return "Cast Flagellation"
            end
        end
    end
    if
        Q.ShurikenTornado:IsCastable() and a1 <= 1 and av() and Q.SymbolsofDeath:CooldownUp() and
            Q.ShadowDance:Charges() >= 1 and
            (not Q.Flagellation:IsAvailable() or g:BuffUp(Q.Flagellation) or a1 >= 5) and
            ak <= 2 and
            not g:BuffUp(Q.PremeditationBuff)
     then
        if g:Energy() >= 60 then
            if m.Cast(Q.ShurikenTornado, S.Subtlety.GCDasOffGCD.ShurikenTornado) then
                a8 = 277925
                return "Cast Shuriken Tornado"
            end
        elseif not Q.ShadowFocus:IsAvailable() then
            if m.CastPooling(Q.ShurikenTornado) then
                a8 = 277925
                return "Pool for Shuriken Tornado"
            end
        end
    end
    if a5 then
        if o() and Q.Sepsis:IsReady() and aU and al >= 1 and not h:FilteredTimeToDie("<", 16) then
            if m.Cast(Q.Sepsis, nil, nil) then
                a8 = 328305
                return "Cast Sepsis"
            end
        end
        if
            Q.SymbolsofDeath:IsCastable() and aU and
                (not Q.Flagellation:IsAvailable() or Q.Flagellation:CooldownRemains() > 10 or
                    Q.Flagellation:CooldownUp() and ak >= 5)
         then
            if m.Cast(Q.SymbolsofDeath, nil) then
                a8 = 212283
                return "Cast Symbols of Death"
            end
        end
    end
    if Q.MarkedforDeath:IsCastable() then
        if h:FilteredTimeToDie("<", al) then
            if m.Cast(Q.MarkedforDeath, nil) then
                a8 = 137619
                return "Cast Marked for Death"
            end
        end
        if not g:StealthUp(true, true) and al >= P.CPMaxSpend() then
            if not S.Commons.STMfDAsDPSCD then
                m.CastSuggested(Q.MarkedforDeath)
            elseif o() then
                if m.Cast(Q.MarkedforDeath, nil) then
                    a8 = 137619
                    return "Cast Marked for Death"
                end
            end
        end
    end
    if m.CDsON() then
        if
            Q.ShadowBlades:IsCastable() and
                (aU and al >= 2 and h:FilteredTimeToDie(">=", 10) and
                    (not Q.Sepsis:IsAvailable() or Q.Sepsis:CooldownRemains() <= 8 or h:DebuffUp(Q.Sepsis)) or
                    d.BossFilteredFightRemains("<=", 20))
         then
            if m.Cast(Q.ShadowBlades, nil) then
                a8 = 121471
                return "Cast Shadow Blades"
            end
        end
        if
            Q.EchoingReprimand:IsReady() and a5 and al >= 3 and (am or a1 <= 4 or Q.ResoundingClarity:IsAvailable()) and
                (g:BuffUp(Q.ShadowDanceBuff) or not Q.DanseMacabre:IsAvailable())
         then
            if m.Cast(Q.EchoingReprimand, nil, nil) then
                a8 = 323547
                return "Cast Echoing Reprimand"
            end
        end
        if Q.ShurikenTornado:IsReady() then
            if av and g:BuffUp(Q.SymbolsofDeath) and ak <= 2 and (not g:BuffUp(Q.PremeditationBuff) or a1 > 4) then
                if m.Cast(Q.ShurikenTornado) then
                    a8 = 277925
                    return "Cast Shuriken Tornado (SOD)"
                end
            end
            if
                not Q.Flagellation:IsAvailable() and a1 >= 3 and Q.ShadowDance:Charges() >= 1 and
                    not g:StealthUp(true, true)
             then
                if m.Cast(Q.ShurikenTornado) then
                    a8 = 277925
                    return "Cast Shuriken Tornado (DANCE)"
                end
            end
        end
        if
            Q.ShadowDance:IsCastable() and T() and not g:BuffUp(Q.ShadowDanceBuff) and
                d.BossFilteredFightRemains("<=", 8)
         then
            if m.Cast(Q.ShadowDance) then
                a8 = 185313
                return "Cast Shadow Dance (during Tornado)"
            end
        end
        if
            Q.ThistleTea:IsCastable() and not g:BuffUp(Q.ThistleTea) and
                (Q.SymbolsofDeath:CooldownRemains() >= 3 and
                    (g:EnergyDeficit() >= 100 or
                        Q.ThistleTea:ChargesFractional() >= 2.75 and g:BuffUp(Q.ShadowDanceBuff)) or
                    g:BuffRemains(Q.ShadowDanceBuff) > 4 and a1 >= 3 or
                    d.BossFilteredFightRemains("<=", Q.ThistleTea:Charges() * 6))
         then
            if m.Cast(Q.ThistleTea) then
                a8 = 381623
                return "Cast ThistleTea"
            end
        end
    end
    if
        S.Commons.Enabled.Potions and o() and s and
            ((g:BloodlustUp() or ai < 30 or
                g:BuffUp(Q.SymbolsofDeath) and (g:BuffUp(Q.ShadowBlades) or Q.ShadowBlades:CooldownRemains() <= 10)) and
                not m.GUISettings.General.HoldPotforBL or
                m.GUISettings.General.HoldPotforBL and g:BloodlustUp())
     then
        local aV = O.PotionSelected()
        if aV and aV:IsReady() then
            if m.Cast(aV, nil, nil) then
                a8 = 37
                return "potion cooldowns 2"
            end
        end
    end
    if g:BuffUp(Q.SymbolsofDeath) and o() then
        if Q.BloodFury:IsReady() and S.Commons.Enabled.Racials then
            if m.Cast(Q.BloodFury, nil) then
                a8 = 20572
                return "Cast Blood Fury"
            end
        end
        if Q.Berserking:IsReady() and S.Commons.Enabled.Racials then
            if m.Cast(Q.Berserking, nil) then
                a8 = 26297
                return "Cast Berserking"
            end
        end
        if Q.Fireblood:IsReady() and S.Commons.Enabled.Racials then
            if m.Cast(Q.Fireblood, nil) then
                a8 = 265221
                return "Cast Fireblood"
            end
        end
        if Q.AncestralCall:IsReady() and S.Commons.Enabled.Racials then
            if m.Cast(Q.AncestralCall, nil) then
                a8 = 274738
                return "Cast Ancestral Call"
            end
        end
    end
    if (S.Commons.Enabled.TopTrinket or S.Commons.Enabled.BottomTrinket) and o() then
        local aW = g:GetUseableTrinkets(Z)
        if R.CacheOfAcquiredTreasures:IsEquippedAndReady() then
            if g:BuffUp(Q.AcquiredAxe) and a1 > 1 then
                if R.CacheOfAcquiredTreasures:ID() == X and S.Commons.Enabled.TopTrinket then
                    a8 = 24
                    return "top trinket Cache Axe for AoE"
                elseif R.CacheOfAcquiredTreasures:ID() == Y and S.Commons.Enabled.BottomTrinket then
                    a8 = 25
                    return "bot trinket Cache Axe for AoE"
                end
            elseif g:BuffUp(Q.AcquiredWand) and (a1 == 1 and h:IsInBossList() or d.BossFilteredFightRemains("<", 20)) then
                if R.CacheOfAcquiredTreasures:ID() == X and S.Commons.Enabled.TopTrinket then
                    a8 = 24
                    return "top trinket Cache Wand for ST"
                elseif R.CacheOfAcquiredTreasures:ID() == Y and S.Commons.Enabled.BottomTrinket then
                    a8 = 25
                    return "bot trinket Cache Wand for ST"
                end
            end
        end
        local aX = g:BuffUp(Q.SymbolsofDeath) or d.BossFilteredFightRemains("<", 20)
        if aX then
            if aW and (g:BuffUp(Q.SymbolsofDeath) or ai < 20) then
                if m.Cast(aW, nil, nil) then
                    if aW:ID() == X and S.Commons.Enabled.TopTrinket then
                        a8 = 24
                        return "Generic use_items for " .. aW:Name()
                    elseif aW:ID() == Y and S.Commons.Enabled.BottomTrinket then
                        a8 = 25
                        return "Generic use_items for " .. aW:Name()
                    end
                end
            end
        end
    end
end
local function aY()
    local aE = g:BuffUp(Q.ShadowDanceBuff) or StealthSpell and StealthSpell:ID() == Q.ShadowDance:ID()
    local aZ = g:BuffRemains(Q.ShadowDanceBuff)
    if StealthSpell and StealthSpell:ID() == Q.ShadowDance:ID() then
        aZ = 8
    end
    aq = Q.Premeditation:IsAvailable() and a1 < 5
    if
        Q.SliceandDice:IsReady() and
            (not aq and a1 < 6 and not g:BuffUp(Q.ShadowDanceBuff) and g:BuffRemains(Q.SliceandDice) < ai and
                g:BuffRefreshable(Q.SliceandDice))
     then
        if Q.SliceandDice:IsReady() and m.Cast(Q.SliceandDice) then
            a8 = 5171
            return "Cast Slice and Dice (not Premed)"
        end
    end
    if
        Q.SliceandDice:IsReady() and aq and Q.ShadowDance:ChargesFractional() < 1.75 and
            g:BuffRemains(Q.SliceandDice) < Q.SymbolsofDeath:CooldownRemains() and
            (Q.ShadowDance:CooldownRemains() <= 0 and
                g:BuffRemains(Q.SymbolsofDeath) - g:BuffRemains(Q.ShadowDanceBuff) < 1.2)
     then
        if Q.SliceandDice:IsReady() and m.Cast(Q.SliceandDice) then
            a8 = 5171
            return "Cast Slice and Dice (Premed)"
        end
    end
    au = aD(aE)
    if
        Q.Rupture:IsReady() and
            ((not au or ar) and not g:StealthUp(true, true) and h:FilteredTimeToDie(">", 6) and
                h:DebuffRefreshable(Q.Rupture))
     then
        if Q.Rupture:IsReady() and m.Cast(Q.Rupture) then
            a8 = 1943
            return "Cast Rupture 1"
        end
    end
    if
        Q.SecretTechnique:IsCastable() and aE and
            (g:BuffStack(Q.DanseMacabreBuff) >= 3 or not Q.DanseMacabre:IsAvailable())
     then
        if Q.ColdBlood:IsReady() and g:BuffDown(Q.ColdBlood) then
            if m.Cast(Q.ColdBlood) then
                a8 = 382245
                return "Cast ColdBlood"
            else
                if m.Cast(Q.ColdBlood) then
                    a8 = 382245
                    return "Cast Cold Blood (SecTec)"
                end
            end
        end
        if not Q.ColdBlood:IsAvailable() or Q.ColdBlood:IsReady() or Q.ColdBlood:CooldownRemains() > aZ - 2 then
            if m.Cast(Q.SecretTechnique) then
                a8 = 280719
                return "Cast Secret Technique"
            end
        end
    end
    if Q.Rupture:IsReady() and not au and not ar and a1 >= 2 and a1 <= 3 then
        if O.CastTargetIf(Q.Rupture, a0, "min", aN, aR, not h:IsInMeleeRange(8)) then
            return "Cast Rupture 2"
        end
    end
    if
        Q.Rupture:IsReady() and
            (not au and h:DebuffRemains(Q.Rupture) < Q.SymbolsofDeath:CooldownRemains() + 10 and
                Q.SymbolsofDeath:CooldownRemains() <= 5 and
                h:FilteredTimeToDie(">", Q.SymbolsofDeath:CooldownRemains() + 5, -h:DebuffRemains(Q.Rupture)))
     then
        if Q.Rupture:IsReady() and m.Cast(Q.Rupture) then
            a8 = 1943
            return "Cast Rupture 3"
        end
    end
    if Q.BlackPowder:IsReady() and not t and not am and a1 >= 3 - ay(Q.DarkBrew:IsAvailable()) then
        if Q.BlackPowder:IsReady() and m.Cast(Q.BlackPowder) then
            a8 = 319175
            return "Cast Black Powder"
        end
    end
    if Q.Eviscerate:IsReady() then
        if Q.Eviscerate:IsReady() and m.Cast(Q.Eviscerate) then
            a8 = 196819
            return "Cast Eviscerate"
        end
    end
end
local function a_()
    at = aB()
    if
        Q.Vanish:IsReady() and VanishReady and not u and S.Commons.VanishOffensive and not g:StealthUp(true, true, true) and
            (not at and al > 1)
     then
        if m.Cast(Q.Vanish, nil, nil) then
            a8 = 1856
            return "Vanish Stealth CD"
        end
    end
    if g:Energy() < 40 and Q.Shadowmeld:IsReady() then
        if m.CastPooling(Q.Shadowmeld, g:EnergyTimeToX(40)) then
            a8 = 1000
            return "Pool for Shadowmeld"
        end
    end
    if
        Q.Shadowmeld:IsReady() and not g:IsMoving() and S.Commons.Enabled.Racials and g:Energy() >= 40 and
            g:EnergyDeficitPredicted() >= 10 and
            not at and
            al > 4
     then
        if m.Cast(Q.Shadowmeld, nil, nil) then
            a8 = 58984
            return "Shadowmeld Stealth CD"
        end
    end
    as = aC()
    if
        Q.ShadowDance:IsReady() and SDReady and
            ((as and (g:BuffRemains(Q.SymbolsofDeath) >= 2.2 - ay(Q.Flagellation:IsAvailable()) or at) or
                g:BuffUp(Q.Flagellation) or
                g:BuffRemains(Q.Flagellation) >= 6 or
                a1 >= 4 and Q.SymbolsofDeath:CooldownRemains() > 10) and
                not g:BuffUp(Q.TheRottenBuff))
     then
        if m.Cast(Q.ShadowDance) then
            a8 = 185313
            return " Shadow Dance Stealth CD"
        end
    end
    if
        Q.ShadowDance:IsReady() and SDReady and
            (as and ai < Q.SymbolsofDeath:CooldownRemains() or
                not Q.ShadowDance:IsAvailable() and aF(a0) > 0 and a1 <= 4)
     then
        if m.Cast(Q.ShadowDance) then
            a8 = 185313
            return "Shadow Dance Stealth CD 2"
        end
    end
end
local function b0()
    if
        Q.Shadowstrike:IsReady() and ShadowstrikeIsReady and h:IsInMeleeRange(S.Subtlety.ShadowStrikeRange) and
            ((g:StealthUp(true, true) or g:BuffUp(Q.VanishBuff)) and (a1 < 4 or ar))
     then
        if m.Cast(Q.Shadowstrike, nil, nil) then
            a8 = 185438
            return "Cast Shadowstrike (Stealth)"
        end
    end
    ao =
        g:BuffStack(Q.DanseMacabreBuff) < 5 and (al == 2 or al == 3) and
        (g:BuffUp(Q.PremeditationBuff) or EffectiveComboPoints < 7)
    if Q.ShurikenStorm:IsReady() and (ao and g:BuffUp(Q.SilentStorm) and h:DebuffDown(Q.FindWeaknessDebuff)) then
        if m.Cast(Q.ShurikenStorm) then
            a8 = 197835
            return "Cast Shuriken Storm"
        end
    end
    if Q.Gloomblade:IsReady() and ao then
        if m.Cast(Q.Gloomblade) then
            a8 = 200758
            return "Cast Gloomblade"
        end
    end
    if Q.Backstab:IsReady() and ao and Q.DanseMacabre:IsAvailable() and g:BuffStack(Q.DanseMacabreBuff) <= 2 then
        if m.Cast(Q.Backstab) then
            a8 = 53
            return "Cast Backstab (Stealth)"
        end
    end
    if
        EffectiveComboPoints >= P.CPMaxSpend() or
            (al <= 1 + ay(g:BuffUp(Q.TheRottenBuff)) or d.BossFilteredFightRemains("<", 2) and EffectiveComboPoints >= 3) or
            a1 >= 4 - ay(Q.SealFate:IsAvailable()) and EffectiveComboPoints >= 4
     then
        a7 = aY()
        if a7 then
            return "Finish: " .. a7
        end
    else
        a7 = a_()
        if a7 then
            return "Stealth CDs: " .. a7
        end
        a7 = aS()
        if a7 then
            return "Build: " .. a7
        end
    end
    if g:BuffUp(Q.ShurikenTornado) and al <= 2 and h:IsInMeleeRange(8) then
        return aY()
    end
    if a1 >= 4 - ay(Q.SealFate:IsAvailable()) and aj >= 4 and h:IsInMeleeRange(8) then
        return aY()
    end
    if
        al <= 1 + ay(Q.SealFate:IsAvailable() or Q.DeeperStratagem:IsAvailable() or Q.SecretStratagem:IsAvailable()) and
            h:IsInMeleeRange(8)
     then
        return aY()
    end
    if Q.Gloomblade:IsReady() and g:BuffStack(Q.PerforatedVeinsBuff) >= 5 and a1 < 3 then
        if m.Cast(Q.Gloomblade) then
            a8 = 200758
            return "Cast Gloomblade"
        end
    end
    if Q.Backstab:IsReady() and (g:BuffStack(Q.PerforatedVeinsBuff) >= 5 and g:BuffRemains(Q.ShadowDanceBuff) < 3) then
        if m.Cast(Q.Backstab) then
            a8 = 53
            return "Cast Backstab (Stealth PV)"
        end
    end
    if
        Q.Shadowstrike:IsReady() and ShadowstrikeIsReady and h:IsInMeleeRange(S.Subtlety.ShadowStrikeRange) and
            (not g:StealthUp(true, false) and g:BuffUp(Q.SepsisBuff) and a1 < 4)
     then
        if m.Cast(Q.Shadowstrike, nil, nil) then
            a8 = 185438
            return "Cast Shadowstrike (Sepsis)"
        end
    end
    if
        Q.ShurikenStorm:IsReady() and
            (a1 >= 3 + ay(g:BuffUp(Q.TheRottenBuff)) and (not g:BuffUp(Q.PremeditationBuff) or a1 >= 7))
     then
        if m.Cast(Q.ShurikenStorm) then
            a8 = 197835
            return "Cast Shuriken Storm"
        end
    end
    if Q.Shadowstrike:IsReady() then
        if
            h:DebuffRemains(Q.FindWeaknessDebuff) < 1 or
                Q.SymbolsofDeath:CooldownRemains() < 18 and
                    h:DebuffRemains(Q.FindWeaknessDebuff) < Q.SymbolsofDeath:CooldownRemains()
         then
            if m.Cast(Q.Shadowstrike) then
                a8 = 185438
                return "Cast Shadowstrike (Prio Rotation)"
            end
        end
        if O.CastTargetIf(Q.Shadowstrike, a0, "min", aK, aO) then
            return "Find the Weakness/ShadowStrike 26"
        end
    end
end
local function b1()
    aa = nil
    ac = nil
    ab = 0
    a3 = Q.AcrobaticStrikes:IsAvailable() and 8 or 5
    a4 = Q.AcrobaticStrikes:IsAvailable() and 10 or 13
    a5 = h:IsInMeleeRange(a3)
    a6 = h:IsInMeleeRange(a4)
    q = HeroRotationCharDB.Toggles[5]
    p = HeroRotationCharDB.Toggles[4]
    r = HeroRotationCharDB.Toggles[12]
    s = not HeroRotationCharDB.Toggles[15]
    t = HeroRotationCharDB.Toggles[20]
    u = HeroRotationCharDB.Toggles[21]
    v = HeroRotationCharDB.Toggles[22]
    w = HeroRotationCharDB.Toggles[23]
    x = HeroRotationCharDB.Toggles[24]
    y = HeroRotationCharDB.Toggles[25]
    z = HeroRotationCharDB.Toggles[26]
    A = HeroRotationCharDB.Toggles[27]
    B = HeroRotationCharDB.Toggles[28]
    C = HeroRotationCharDB.Toggles[29]
    D = HeroRotationCharDB.Toggles[30]
    E = HeroRotationCharDB.Toggles[54]
    SBReady = false
    SDReady = false
    VanishReady = false
    SoDReady = false
    MfDReady = true
    STReady = false
    if
        S.Subtlety.IncludedCooldowns.ShadowBlades and o() or
            S.Subtlety.IncludedSmallCooldowns.ShadowBlades and (o() or p) or
            not S.Subtlety.IncludedSmallCooldowns.ShadowBlades and not S.Subtlety.IncludedCooldowns.ShadowBlades
     then
        SBReady = true
    end
    if
        S.Subtlety.IncludedCooldowns.ShadowDance and o() or S.Subtlety.IncludedSmallCooldowns.ShadowDance and (o() or p) or
            not S.Subtlety.IncludedSmallCooldowns.ShadowDance and not S.Subtlety.IncludedCooldowns.ShadowDance
     then
        SDReady = true
    end
    if
        S.Subtlety.IncludedCooldowns.Vanish and o() or S.Subtlety.IncludedSmallCooldowns.Vanish and (o() or p) or
            not S.Subtlety.IncludedSmallCooldowns.Vanish and not S.Subtlety.IncludedCooldowns.Vanish
     then
        VanishReady = true
    end
    if
        S.Subtlety.IncludedCooldowns.SymbolsofDeath and o() or
            S.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and (o() or p) or
            not S.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and not S.Subtlety.IncludedCooldowns.SymbolsofDeath
     then
        SoDReady = true
    end
    if
        S.Subtlety.IncludedCooldowns.ShurikenTornado and o() or
            S.Subtlety.IncludedSmallCooldowns.ShurikenTornado and (o() or p) or
            not S.Subtlety.IncludedSmallCooldowns.ShurikenTornado and not S.Subtlety.IncludedCooldowns.ShurikenTornado
     then
        STReady = true
    end
    X = GetInventoryItemID("player", 13)
    Y = GetInventoryItemID("player", 14)
    if not S.Commons.Enabled.TopTrinket and not S.Commons.Enabled.BotTrinket then
        Z = {X, Y, R.MistcallerOcarina:ID(), R.CacheOfAcquiredTreasures:ID()}
    elseif not S.Commons.Enabled.TopTrinket and S.Commons.Enabled.BotTrinket then
        Z = {X, R.MistcallerOcarina:ID(), R.CacheOfAcquiredTreasures:ID()}
    elseif not S.Commons.Enabled.BotTrinket and S.Commons.Enabled.TopTrinket then
        Z = {Y, R.MistcallerOcarina:ID(), R.CacheOfAcquiredTreasures:ID()}
    end
end
local function b2()
    if Q.Subterfuge:IsAvailable() then
        ad = Q.Stealth2
        ae = Q.VanishBuff2
    else
        ad = Q.Stealth
        ae = Q.VanishBuff
    end
    a7 = b1()
    if n() then
        _ = g:GetEnemiesInRange(30)
        a0 = g:GetEnemiesInMeleeRange(a4)
        a1 = #a0
        a2 = g:GetEnemiesInMeleeRange(a3)
    else
        _ = {}
        a0 = {}
        a1 = 0
        a2 = {}
    end
    ak = g:ComboPoints()
    EffectiveComboPoints = P.EffectiveComboPoints(ak)
    al = g:ComboPointsDeficit()
    am = false
    StealthEnergyRequired = g:EnergyMax() - aA()
    if O.TargetIsValid() or g:AffectingCombat() then
        if IsInRaid() and UnitExists("boss1") then
            ah = d.BossFightRemains(nil, true)
            ai = ah
            if ai == 11111 then
                ai = d.FightRemains(Enemies10yd, false)
            end
        end
    end
    if EffectiveComboPoints > ak and al > 2 and g:AffectingCombat() then
        if
            ak == 2 and not g:BuffUp(Q.EchoingReprimand3) or ak == 3 and not g:BuffUp(Q.EchoingReprimand4) or
                ak == 4 and not g:BuffUp(Q.EchoingReprimand5)
         then
            local b3 = P.TimeToSht(4)
            if b3 == 0 then
                b3 = P.TimeToSht(5)
            end
            if b3 < M(g:EnergyTimeToX(35), g:GCDRemains()) + 0.5 then
                EffectiveComboPoints = ak
            end
        end
    end
    if g:BuffUp(Q.ShurikenTornado, nil, true) and ak < P.CPMaxSpend() then
        local b4 = P.TimeToNextTornado()
        if b4 <= g:GCDRemains() or N(g:GCDRemains() - b4) < 0.25 then
            local b5 = a1 + ay(g:BuffUp(Q.ShadowBlades))
            ak = L(ak + b5, P.CPMaxSpend())
            al = M(al - b5, 0)
            if EffectiveComboPoints < P.CPMaxSpend() then
                EffectiveComboPoints = ak
            end
        end
    end
    aj = EffectiveComboPoints
    aw = aA()
    af = (4 + EffectiveComboPoints * 4) * 0.3
    ag = Q.Eviscerate:Damage() * S.Subtlety.EviscerateDMGOffset
    if a7 then
        return a7
    end
    if a9 > 0 then
        a9 = 0
    end
    if a8 > 0 then
        a8 = 0
    end
    a8 = P.ReturnSpell()
    a9 = P.ReturnSpellMO()
    if m.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        G = GetTime()
        H = G + m.GUISettings.General.OpenerReset
    elseif m.GUISettings.General.OpenerReset > 0 and H ~= nil and GetTime() > H and HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        m.ToggleIconFrame:UpdateButtonText(6)
        m.Print(
            "Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r.")
        )
    end
    if m.QueuedCast() then
        a8 = m.QueuedCast()
        return "Custom Queue " .. i(a8):ID()
    end
    if
        v and Q.CheapShot:IsUsableP() and Q.CheapShot:CooldownRemains() <= 0 and g:StealthUp(true, true) and
            not g:PrevGCD(1, Q.CheapShot)
     then
        if m.Cast(Q.CheapShot, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.CheapShot) then
                a9 = 11833
                return "queue Cheap Shot MO"
            else
                a8 = 1833
                return "queue Cheap Shot"
            end
        end
    elseif (not Q.CheapShot:IsUsableP() or Q.CheapShot:CooldownRemains() > 0 or g:PrevGCD(1, Q.CheapShot)) and v then
        HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
        m.Print(
            "Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if w and Q.KidneyShot:IsUsableP() and Q.KidneyShot:CooldownRemains() <= 0 then
        if m.Cast(Q.KidneyShot, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.KidneyShot) then
                a9 = 1408
                return "queue Kidney Shot MO"
            else
                a8 = 408
                return "queue Kidney Shot"
            end
        end
    elseif g:PrevGCD(1, Q.KidneyShot) and w then
        HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
        m.Print(
            "Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if x and Q.Blind:IsUsableP() and Q.Blind:CooldownRemains() <= 0 then
        if m.Cast(Q.Blind, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.Blind) then
                a9 = 12094
                return "queue Blind MO"
            else
                a8 = 2094
                return "queue Blind"
            end
        end
    elseif (not Q.Blind:IsUsableP() or Q.Blind:CooldownRemains() > 0) and x then
        HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
        m.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if y and Q.Sap:IsUsableP() and Q.Sap:CooldownRemains() <= 0 then
        if m.Cast(Q.Sap, nil, nil, nil) then
            if f("mouseover"):GUID() ~= nil and f("mouseover"):IsSpellInRange(Q.Sap) then
                a9 = 16770
                return "queue Sap MO"
            else
                a8 = 6770
                return "queue Sap"
            end
        end
    elseif (not Q.Sap:IsUsableP() or Q.Sap:CooldownRemains() > 0) and y then
        HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
        m.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if z and Q.ShurikenTornado:IsUsableP() and Q.ShurikenTornado:CooldownRemains() <= 0 then
        if m.Cast(Q.ShurikenTornado, nil, nil, nil) then
            a8 = 277925
            return "queue Shuriken Tornado"
        end
    elseif (not Q.ShurikenTornado:IsUsableP() or Q.ShurikenTornado:CooldownRemains() > 0) and z then
        HeroRotationCharDB.Toggles[26] = not HeroRotationCharDB.Toggles[26]
        m.Print(
            "Shuriken Tornado Queue is now " ..
                (HeroRotationCharDB.Toggles[26] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if A and Q.Feint:IsUsableP() and Q.Feint:CooldownRemains() <= 0 and g:AffectingCombat() then
        if m.Cast(Q.Feint, nil, nil, nil) then
            a8 = 202
            return "queue Shuriken Tornado"
        end
    elseif (not Q.Feint:IsUsableP() or Q.Feint:CooldownRemains() > 0 or not g:AffectingCombat()) and A then
        HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27]
        m.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end
    if B and Q.Flagellation:IsUsableP() and Q.Flagellation:CooldownRemains() <= 0 and g:AffectingCombat() then
        if m.Cast(Q.Flagellation, nil, nil, nil) then
            a8 = 323654
            return "queue Flagellation Queue"
        end
    elseif (not Q.Flagellation:IsUsableP() or Q.Flagellation:CooldownRemains() > 0 or not g:AffectingCombat()) and B then
        HeroRotationCharDB.Toggles[28] = not HeroRotationCharDB.Toggles[28]
        m.Print(
            "Flagellation Queue is now " .. (HeroRotationCharDB.Toggles[28] and "|cff00ff00on|r." or "|cffff0000off|r.")
        )
    end
    if D then
        if
            Q.ArcaneTorrent:IsAvailable() and Q.ArcaneTorrent:IsUsableP() and Q.ArcaneTorrent:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.ArcaneTorrent, nil, nil, nil) then
                a8 = 155145
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.LightsJudgment:IsAvailable() and Q.LightsJudgment:IsUsableP() and Q.LightsJudgment:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.LightsJudgment, nil, nil, nil) then
                a8 = 255647
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.BagofTricks:IsAvailable() and Q.BagofTricks:IsUsableP() and Q.BagofTricks:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.BagofTricks, nil, nil, nil) then
                a8 = 312411
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.BloodFury:IsAvailable() and Q.BloodFury:IsUsableP() and Q.BloodFury:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.BloodFury, nil, nil, nil) then
                a8 = 20572
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.Berserking:IsAvailable() and Q.Berserking:IsUsableP() and Q.Berserking:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.Berserking, nil, nil, nil) then
                a8 = 26297
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.Fireblood:IsAvailable() and Q.Fireblood:IsUsableP() and Q.Fireblood:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.Fireblood, nil, nil, nil) then
                a8 = 265221
                return "queue ArcaneTorrent Queue"
            end
        elseif
            Q.AncestralCall:IsAvailable() and Q.AncestralCall:IsUsableP() and Q.AncestralCall:CooldownRemains() <= 0 and
                g:AffectingCombat()
         then
            if m.Cast(Q.AncestralCall, nil, nil, nil) then
                a8 = 274738
                return "queue ArcaneTorrent Queue"
            end
        elseif
            (Q.ArcaneTorrent:IsAvailable() and
                (not Q.ArcaneTorrent:IsUsableP() or Q.ArcaneTorrent:CooldownRemains() > 0 or not g:AffectingCombat()) or
                Q.LightsJudgment:IsAvailable() and
                    (not Q.LightsJudgment:IsUsableP() or Q.LightsJudgment:CooldownRemains() > 0 or
                        not g:AffectingCombat()) or
                Q.BagofTricks:IsAvailable() and
                    (not Q.BagofTricks:IsUsableP() or Q.BagofTricks:CooldownRemains() > 0 or not g:AffectingCombat()) or
                Q.BloodFury:IsAvailable() and
                    (not Q.BloodFury:IsUsableP() or Q.BloodFury:CooldownRemains() > 0 or not g:AffectingCombat()) or
                Q.Berserking:IsAvailable() and
                    (not Q.Berserking:IsUsableP() or Q.Berserking:CooldownRemains() > 0 or not g:AffectingCombat()) or
                Q.Fireblood:IsAvailable() and
                    (not Q.Fireblood:IsUsableP() or Q.Fireblood:CooldownRemains() > 0 or not g:AffectingCombat()) or
                Q.AncestralCall:IsAvailable() and
                    (not Q.AncestralCall:IsUsableP() or Q.AncestralCall:CooldownRemains() > 0 or not g:AffectingCombat())) and
                D
         then
            HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30]
            m.Print(
                "Arcane Torrent Queue is now " ..
                    (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r.")
            )
        end
    end
    a7 = P.CrimsonVial()
    if a7 then
        return a7
    end
    a7 = P.Feint()
    if a7 then
        return a7
    end
    a7 = P.Evasion()
    if a7 then
        return a7
    end
    if
        g:HealthPercentage() < S.Commons.PhialHP and R.PhialofSerenity:IsReady() and
            R.PhialofSerenity:CooldownRemains() <= 0
     then
        if m.Cast(R.PhialofSerenity, nil) then
            a8 = 55
            return "PhialofSerenity HP"
        end
    end
    if
        g:HealthPercentage() < S.Commons.HealthstoneHP and R.Healthstone:IsReady() and
            R.Healthstone:CooldownRemains() <= 0
     then
        if m.Cast(R.Healthstone, nil) then
            a8 = 40
            return "Healthstone HP"
        end
    end
    if
        g:HealthPercentage() < S.Commons.HealPotHP and R.CosmicHealPot:IsReady() and
            R.CosmicHealPot:CooldownRemains() <= 0
     then
        if m.Cast(R.CosmicHealPot, nil) then
            a8 = 45
            return "CosmicHealPot HP"
        end
    end
    if
        g:HealthPercentage() < S.Commons.HealPotHP and R.HealPot:IsReady() and not R.CosmicHealPot:IsReady() and
            R.HealPot:CooldownRemains() <= 0
     then
        if m.Cast(R.HealPot, nil) then
            a8 = 41
            return "HealPot HP"
        end
    end
    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if Q.Backstab:IsReady() and f("mouseover"):IsInMeleeRange(8) then
            if m.Cast(Q.Backstab, nil) then
                a9 = 153
                return "explosive MO SWD"
            end
        end
        if Q.ShurikenToss:IsReady() and f("mouseover"):IsInMeleeRange(40) and not f("mouseover"):IsInMeleeRange(8) then
            if m.Cast(Q.ShurikenToss, nil) then
                a9 = 1114014
                return "explosive MO SWD"
            end
        end
    end
    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if Q.Backstab:IsReady() and h:IsInMeleeRange(8) then
            if m.Cast(Q.Backstab, nil) then
                a8 = 53
                return "explosive  SWD"
            end
        end
        if Q.ShurikenToss:IsReady() and h:IsInMeleeRange(40) and not h:IsInMeleeRange(8) then
            if m.Cast(Q.ShurikenToss, nil) then
                a8 = 114014
                return "explosive MO SWD"
            end
        end
    end
    F = {
        324736,
        228318,
        178658,
        333227,
        334800,
        334967,
        324737,
        326450,
        334470,
        320703,
        320012,
        324085,
        333241,
        331510,
        344739,
        368477,
        368396,
        355057,
        356133,
        342139,
        353706,
        355782,
        327155,
        359668,
        321220,
        158337
    }
    if UnitExists("target") and Q.Shiv:IsReady() and not E then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
            for b6 = 0, 40 do
                local b7, b7, b8, b9, b7, b7, b7, b7, b7, ba = UnitBuff("target", b6)
                for b7, bb in pairs(F) do
                    if bb == ba then
                        if m.Cast(Q.Shiv, nil) then
                            a8 = 5938
                            return "Shiv Enrage"
                        end
                    end
                end
            end
        end
    end
    local bc = g:AffectingCombat() and 180 or 900
    local bd
    if i(8679):IsAvailable() and S.Commons.LethalPoison == "Wound Poison" then
        bd = g:BuffRemains(i(8679))
        if bd < bc and not g:IsCasting(i(8679)) then
            if m.Cast(i(8679)) then
                a8 = 203
                return "Wound Poison Refresh"
            end
        end
    elseif i(2823):IsAvailable() and S.Commons.LethalPoison == "Deadly Poison" then
        bd = g:BuffRemains(i(2823))
        if bd < bc and not g:IsCasting(i(2823)) then
            if m.Cast(i(2823)) then
                a8 = 208
                return "Deadly Poison Refresh"
            end
        end
    elseif i(315584):IsAvailable() and S.Commons.LethalPoison == "Instant Poison" then
        bd = g:BuffRemains(i(315584))
        if bd < bc and not g:IsCasting(i(315584)) then
            if m.Cast(i(315584)) then
                a8 = 205
                return "Instant Poison Refresh"
            end
        end
    end
    if i(381637):IsAvailable() and S.Commons.NonLethalPoison == "Atrophic Poison" then
        bd = g:BuffRemains(i(381637))
        if bd < bc and not g:IsCasting(i(381637)) then
            if m.Cast(i(381637)) then
                a8 = 381637
                return "Atropic Poison Refresh"
            end
        end
    elseif i(5761):IsAvailable() and S.Commons.NonLethalPoison == "Numbing Poison" then
        bd = g:BuffRemains(i(5761))
        if bd < bc and not g:IsCasting(NumbingPoison) then
            if m.Cast(i(5761)) then
                a8 = 204
                return "Numbing Poison Refresh"
            end
        end
    elseif i(3408):IsAvailable() and S.Commons.NonLethalPoison == "Crippling Poison" then
        bd = g:BuffRemains(i(3408))
        if bd < bc and not g:IsCasting(NumbingPoison) then
            if m.Cast(i(3408)) then
                a8 = 206
                return "Crippling Poison Refresh"
            end
        end
    end
    if not g:AffectingCombat() and not g:IsDeadOrGhost() then
        if not g:BuffUp(Q.ShadowDanceBuff) and not g:BuffUp(P.VanishBuffSpell()) then
            a7 = P.Stealth(P.StealthSpell())
            if a7 then
                return a7
            end
        end
    end
    P.MfDSniping(Q.MarkedforDeath)
    if
        O.TargetIsValid() and
            (g:AffectingCombat() and not h:DebuffUp(Q.Sap) or q or
                (g:BuffUp(ae) or StealthSpell and StealthSpell:ID() == Q.Vanish:ID()))
     then
        local be, bf, b7 = GetSpellCooldown(57934)
        if S.Commons.AutoToT and g:AffectingCombat() then
            if
                be + bf - GetTime() <= 0 and Q.TricksoftheTrade:IsAvailable() and
                    Q.TricksoftheTrade:CooldownRemains() <= 0 and
                    UnitExists("focus") and
                    (UnitInParty("focus") or UnitInRaid("focus")) and
                    IsItemInRange(32698, "focus")
             then
                if m.Cast(Q.TricksoftheTrade) then
                    a8 = 157934
                    return "ToT Focus"
                end
            end
        end
        a7 = aT()
        if a7 and h:IsInMeleeRange(8) then
            return "CDs: " .. a7
        end
        if
            Q.SliceandDice:IsCastable() and a1 < P.CPMaxSpend() and d.FilteredFightRemains(a0, ">", 6) and
                g:BuffRemains(Q.SliceandDice) < g:GCD() and
                ak >= 4
         then
            if Q.SliceandDice:IsReady() and m.Cast(Q.SliceandDice) then
                a8 = 5171
                return "Cast Slice and Dice (Low Duration)"
            end
        end
        if g:StealthUp(true, true) then
            a7 = b0()
            if a7 then
                return "Stealthed : " .. a7
            end
        end
        UsePriorityRotation = false
        if g:EnergyDeficitPredicted() <= aw and h:IsInMeleeRange(8) then
            a7 = a_()
            if a7 then
                return "Stealth CDs: " .. a7
            end
        end
        if
            EffectiveComboPoints >= P.CPMaxSpend() or
                (al <= 1 or d.BossFilteredFightRemains("<", 2) and EffectiveComboPoints >= 3) or
                a1 >= 4 and EffectiveComboPoints >= 4
         then
            a7 = aY()
            if a7 then
                return "Finish: " .. a7
            end
        end
        if g:EnergyDeficitPredicted() <= aw and h:IsInMeleeRange(8) then
            a7 = aS()
            if a7 then
                return "Build: " .. a7
            end
        end
        if m.CDsON() then
            if
                Q.ArcaneTorrent:IsReady() and h:IsInMeleeRange(8) and S.Commons.Enabled.Racials and
                    g:EnergyDeficitPredicted() > 15 + g:EnergyRegen()
             then
                if m.Cast(Q.ArcaneTorrent, nil) then
                    a8 = 155145
                    return "Cast Arcane Torrent"
                end
            end
            if Q.ArcanePulse:IsReady() and h:IsInMeleeRange(8) and S.Commons.Enabled.Racials then
                if m.Cast(Q.ArcanePulse, nil) then
                    a8 = 260364
                    return "Cast Arcane Pulse"
                end
            end
            if Q.LightsJudgment:IsReady() and h:IsInMeleeRange(8) and S.Commons.Enabled.Racials then
                if m.Cast(Q.LightsJudgment, nil) then
                    a8 = 255647
                    return "Cast Lights Judgment"
                end
            end
            if Q.BagofTricks:IsReady() and h:IsInMeleeRange(8) and S.Commons.Enabled.Racials then
                if m.Cast(Q.BagofTricks, nil) then
                    a8 = 312411
                    return "Cast Bag of Tricks"
                end
            end
        end
        if m.Cast(Q.PoolEnergy) then
            a8 = 1000
            return "Pooling Resources"
        end
    end
end
local function bg()
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        m.ToggleIconFrame:UpdateButtonText(6)
    end
end
function ReturnSpell()
    if a8 == 0 then
        return 0
    else
        return a8
    end
end
function ReturnSpellMO()
    if a9 == 0 then
        return 0
    else
        return a9
    end
end
m.SetAPL(261, b2, bg)
