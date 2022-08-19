local t, e = ...
local t = HeroLib
local i, a = HeroCache, t.Utils
local a = t.Unit
local o = a.Player
local f = a.Target
local l = t.Spell
local a = t.Item
local a = LibStub:GetLibrary("LibDataBroker-1.1")
local a = LibStub("LibDBIcon-1.0")
local a = t.GUI
local w = math.min
local u = print
local a = select
local c = string.lower
local m = strsplit
local s = tostring
local a = { General = e.GUISettings.General }
LibStub("AceAddon-3.0"):NewAddon(e, "HeroRotation", "AceConsole-3.0")
local n = LibStub("LibDataBroker-1.1"):NewDataObject("HeroRotation", { type = "launcher", text = "HeroRotation", label = "HeroRotation", icon = "Interface\\AddOns\\HeroRotation\\Media\\999901", OnClick = function()
    local e = GetSpecialization()
    i.Persistent.Player.Spec = { GetSpecializationInfo(e) }
    local e = i.Persistent.Player.Spec[1]
                                                                if e == 577 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Havoc")
    elseif e == 250 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Blood")
    elseif e == 252 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Unholy")
    elseif e == 72 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Fury")
    elseif e == 267 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Destruction")
    elseif e == 264 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Restoration")
    elseif e == 263 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Enhancement")
    elseif e == 262 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Elemental")
    elseif e == 261 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Subtlety")
    elseif e == 260 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Outlaw")
    elseif e == 258 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Shadow")
    elseif e == 269 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Windwalker")
    elseif e == 64 or e == 251 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Frost")
    elseif e == 255 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Survival")
    elseif e == 253 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      BeastMastery")
    elseif e == 104 then
        InterfaceOptionsFrame_Show()
        InterfaceOptionsFrame_OpenToCategory("HeroRotation")
        InterfaceOptionsFrame_OpenToCategory("      Guardian")
    end

end, OnTooltipShow = function(e)
    e:AddLine("HeroRotation", 1, 1, 1)
end })
function e.CoreInit()
    HeroRotationDB.db = LibStub("AceDB-3.0"):New("HeroRotationDB", { profile = { minimap = { hide = false } } })
    HRDBIcon = LibStub("LibDBIcon-1.0")
    HRDBIcon:Register("HeroRotation", n, HeroRotationDB.db.profile.minimap)
end

function HideMiniMapHR()
    if not (a.General.MiniMap) then
        HRDBIcon:Hide("HeroRotation")
    else
        HRDBIcon:Show("HeroRotation")
    end

end

function e.Print(...)
    if not a.General.SilentMode then
        u("[|cFFFF6600Hero Rotation|r]", ...)
    end

end

e.APLs = {  }
e.APLInits = {  }
function e.SetAPL(t, a, o)
    e.APLs[t] = a
    e.APLInits[t] = o
end

function e.GetTexture(a)
    local e = a.SpellID
    if e then
        local t = i.Persistent.Texture.Spell
        if not t[e] then
                        if e >= 999900 then
                t[e] = "Interface\\Addons\\HeroRotation\\Textures\\" .. s(e)
            elseif a.TextureSpellID then
                t[e] = GetSpellTexture(a.TextureSpellID)
            else
                t[e] = GetSpellTexture(e)
            end

        end

        return t[e]
    end

    local e = a.ItemID
    if e then
        local t = i.Persistent.Texture.Item
        if not t[e] then
            local o, o, o, o, o, o, o, o, o, a = GetItemInfo(e)
            t[e] = a
        end

        return t[e]
    end

end

local y = l(61304)
local r, h, i
local function s(n, l, d)
    local a, t
    local s = GetTime()
    if o:IsCasting() or o:IsChanneling() then
        a = o:CastStart()
        t = o:CastDuration()
    else
        a, t = y:CooldownInfo()
    end

    if r ~= n then
        r = n
        h = s
        i = 0
    end

    if l then
        local e
        if d then
            e = d
        else
            e = o.TimeToXResourceMap[n:CostInfo(nil, "type")](n:Cost())
        end

        if e and e > 0 then
            if e > ((a + t) - s) then
                local e = s - h + e
                if (i == 0 and e > .25) or i > e or (e - i) > .5 then
                    i = e
                end

                a = h
                t = i
            end

        end

    end

    if ((a + t) < s) then
        a = 0
        t = 0
        r = nil
    end

    e.MainIconFrame:SetCooldown(a, t)
end

e.CastOffGCDOffset = 1
function e.Cast(a, h, i, n, r)
    local o = e.GetTexture(a)
    local t = not e.GUISettings.General.HideKeyBinds and t.Action.TextureHotKey(o)
            if h or i == "Cooldown" then
        if e.CastOffGCDOffset == 1 or (e.CastOffGCDOffset == 2 and e.SmallIconFrame:GetIcon(1) ~= o) then
            e.SmallIconFrame:ChangeIcon(e.CastOffGCDOffset, o, t, n)
            e.CastOffGCDOffset = e.CastOffGCDOffset + 1
            a.LastDisplayTime = GetTime()
            return false
        end

    elseif i == "Suggested" then
        e.CastSuggested(a, n)
    elseif i == "SuggestedRight" then
        e.CastRightSuggested(a, n)
    else
        local h = 999910
        local h = a.SpellID == h or a:IsUsable()
        local i = i == "Pooling"
        local n = n or false
        e.MainIconFrame:ChangeIcon(o, t, h, n)
        s(a, i, r)
        a.LastDisplayTime = GetTime()
        return true
    end

    return nil
end

function e.CastAnnotated(o, t, a)
    local o = e.Cast(o, t)
    if not t then
        e.MainIconFrame:OverlayText(a)
    end

    return o
end

function e.CastPooling(t, a, o)
    return e.Cast(t, false, "Pooling", o, a)
end

local a, r, n, i
e.MaxQueuedCasts = 3
local function h(...)
    a = { ... }
    r = w(#a, e.MaxQueuedCasts)
    n = {  }
    i = {  }
    for o = 1, r do
        n[o] = e.GetTexture(a[o])
        a[o].LastDisplayTime = GetTime()
        i[o] = not e.GUISettings.General.HideKeyBinds and t.Action.TextureHotKey(n[o])
        u("1", i[o])
    end

    e.MainIconFrame:ChangeIcon(n[1], i[1], a[1]:IsUsable())
    e.MainIconFrame:SetupParts(n, i)
end

function e.CastQueue(...)
    h(...)
    s()
    return "Should Return"
end

function e.CastQueuePooling(e,...)
    h(...)
    if e then
        s(a[1], true, e)
    else
        local o, t = nil, 0
        for e = 1, #a do
            if a[e]:Cost() > t then
                t = a[e]:Cost()
                o = a[e]
            end

        end

        s(o, true)
    end

    return "Should Return"
end

function e.QueuedCast()
    if HeroRotationCharDB.Toggles[999] and QueuedS and e.Commons.Everyone.TargetIsValid() then
                if (QueuedS:IsUsableP() and QueuedS:CooldownRemains(BypassRecovery) <= 0) and not o:PrevGCD(1, QueuedS) then
            if e.Cast(QueuedS, nil, nil, nil) then
                return QueuedS:ID()
            end

        elseif ((not QueuedS:IsUsableP() or QueuedS:CooldownRemains() > 0) or o:PrevGCD(1, QueuedS)) then
            HeroRotationCharDB.Toggles[999] = not HeroRotationCharDB.Toggles[999]
            e.Print("Queue for " .. QueuedS:Name() .. " is now " .. (HeroRotationCharDB.Toggles[999] and "|cff00ff00on|r." or "|cffff0000off|r."))
            QueuedS = nil
        end

    else
        return nil
    end

end

e.CastLeftOffset = 1
function e.CastLeftCommon(a)
    local o = e.GetTexture(a)
    local t = not e.GUISettings.General.HideKeyBinds and t.Action.TextureHotKey(o)
    e.LeftIconFrame:ChangeIcon(o, t)
    e.CastLeftOffset = e.CastLeftOffset + 1
    a.LastDisplayTime = GetTime()
end

function e.CastLeft(t)
    if e.CastLeftOffset == 1 then
        e.CastLeftCommon(t)
    end

    return false
end

function e.CastLeftNameplate(a, t)
    if e.CastLeftOffset == 1 and e.Nameplate.AddIcon(a, t) then
        e.CastLeftCommon(t)
    end

    return false
end

e.CastSuggestedOffset = 1
function e.CastSuggested(o, i)
    if e.CastSuggestedOffset == 1 then
        local a = e.GetTexture(o)
        local t = not e.GUISettings.General.HideKeyBinds and t.Action.TextureHotKey(a)
        e.SuggestedIconFrame:ChangeIcon(a, t, i)
        e.CastSuggestedOffset = e.CastSuggestedOffset + 1
        o.LastDisplayTime = GetTime()
    end

    return false
end

e.CastRightSuggestedOffset = 1
function e.CastRightSuggested(o, i)
    if e.CastRightSuggestedOffset == 1 then
        local a = e.GetTexture(o)
        local t = not e.GUISettings.General.HideKeyBinds and t.Action.TextureHotKey(a)
        e.RightSuggestedIconFrame:ChangeIcon(a, t, i)
        e.CastRightSuggestedOffset = e.CastRightSuggestedOffset + 1
        o.LastDisplayTime = GetTime()
    end

    return false
end

function e.CmdHandler(t)
    local t, o, a = m(" ", c(t))
                                                                                                                                                                                                                                                                                                                                                                                                                    if t == "cds" then
        HeroRotationCharDB.Toggles[1] = not HeroRotationCharDB.Toggles[1]
        e.ToggleIconFrame:UpdateButtonText(1)
        e.Print("CDs are now " .. (HeroRotationCharDB.Toggles[1] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "aoe" then
        HeroRotationCharDB.Toggles[2] = not HeroRotationCharDB.Toggles[2]
        e.ToggleIconFrame:UpdateButtonText(2)
        e.Print("AoE is now " .. (HeroRotationCharDB.Toggles[2] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "toggle" then
        HeroRotationCharDB.Toggles[3] = not HeroRotationCharDB.Toggles[3]
        e.ToggleIconFrame:UpdateButtonText(3)
        e.Print("HeroRotation is now " .. (HeroRotationCharDB.Toggles[3] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "covenants" then
        HeroRotationCharDB.Toggles[4] = not HeroRotationCharDB.Toggles[4]
        e.ToggleIconFrame:UpdateButtonText(4)
        e.Print("Covenants are now " .. (HeroRotationCharDB.Toggles[4] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "smallcds" then
        HeroRotationCharDB.Toggles[5] = not HeroRotationCharDB.Toggles[5]
        e.ToggleIconFrame:UpdateButtonText(5)
        e.Print("Small Cooldowns are now " .. (HeroRotationCharDB.Toggles[5] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "opener" then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6]
        e.ToggleIconFrame:UpdateButtonText(6)
        e.Print("Opener is now " .. (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "unlock" then
        e.MainFrame:Unlock()
        e.Print("HeroRotation UI is now |cff00ff00unlocked|r.")
    elseif t == "lock" then
        e.MainFrame:Lock()
        e.Print("HeroRotation UI is now |cffff0000locked|r.")
    elseif t == "scale" then
        if o and a then
            a = tonumber(a)
            if a and type(a) == "number" and a > 0 and a <= 10 then
                                                if o == "ui" then
                    e.MainFrame:ResizeUI(a)
                elseif o == "buttons" then
                    e.MainFrame:ResizeButtons(a)
                elseif o == "all" then
                    e.MainFrame:ResizeUI(a)
                    e.MainFrame:ResizeButtons(a)
                else
                    e.Print("Invalid |cff88ff88[Type]|r for Scale.")
                    e.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")
                    e.Print("Type accepted are |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r.")
                end

            else
                e.Print("Invalid |cffff8888[Size]|r for Scale.")
                e.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")
                e.Print("Size accepted are |cffff8888number > 0 and <= 10|r.")
            end

        else
            e.Print("Invalid arguments for Scale.")
            e.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")
            e.Print("Type accepted are |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r.")
            e.Print("Size accepted are |cffff8888number > 0 and <= 10|r.")
        end

    elseif t == "resetbuttons" then
        e.ToggleIconFrame:ResetAnchor()
    elseif t == "help" then
        e.Print("|cffffff00--[Toggles]--|r")
        e.Print("  On/Off: |cff8888ff/hr toggle|r")
        e.Print("  CDs: |cff8888ff/hr cds|r")
        e.Print("  AoE: |cff8888ff/hr aoe|r")
        e.Print("|cffffff00--[User Interface]--|r")
        e.Print("  UI Lock: |cff8888ff/hr lock|r")
        e.Print("  UI Unlock: |cff8888ff/hr unlock|r")
        e.Print("  UI Scale: |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r")
        e.Print("    [Type]: |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r")
        e.Print("    [Size]: |cffff8888number > 0 and <= 10|r")
        e.Print("  Button Anchor Reset : |cff8888ff/hr resetbuttons|r")
    elseif t == "holdaotd" then
        HeroRotationCharDB.Toggles[10] = not HeroRotationCharDB.Toggles[10]
        e.Print("Army of the Dead is now " .. (HeroRotationCharDB.Toggles[10] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "holdsacpac" then
        HeroRotationCharDB.Toggles[11] = not HeroRotationCharDB.Toggles[11]
        e.Print("Sacrifical Pact is now " .. (HeroRotationCharDB.Toggles[11] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "stopautoswap" then
        HeroRotationCharDB.Toggles[12] = not HeroRotationCharDB.Toggles[12]
        e.Print("Auto Swap is now " .. (HeroRotationCharDB.Toggles[12] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "amz" then
        HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13]
        e.Print("Anti-Magic Zone Queue is now " .. (HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "deathgrip" then
        HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14]
        e.Print("Death Grip Queue is now " .. (HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdpot" then
        HeroRotationCharDB.Toggles[15] = not HeroRotationCharDB.Toggles[15]
        e.Print("DPS Pots are now " .. (HeroRotationCharDB.Toggles[15] and "|cffff0000disabled|r." or "|cff00ff00enabled|r. Requires Show:Potions checked in settings"))
    elseif t == "asphyxiate" then
        HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16]
        e.Print("Asphyxiate Queue is now " .. (HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdweapon" then
        HeroRotationCharDB.Toggles[17] = not HeroRotationCharDB.Toggles[17]
        e.Print("Weapon Extra Use is now " .. (HeroRotationCharDB.Toggles[17] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "funnelaoe" then
        HeroRotationCharDB.Toggles[20] = not HeroRotationCharDB.Toggles[20]
        e.Print("Funnel AoE is now " .. (HeroRotationCharDB.Toggles[20] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "holdvanish" then
        HeroRotationCharDB.Toggles[21] = not HeroRotationCharDB.Toggles[21]
        e.Print("Vanish is now " .. (HeroRotationCharDB.Toggles[21] and "|cffff0000disabled|r." or "|cff00ff00enabled|r. Requires Use Vanish checked in settings"))
    elseif t == "cheapshot" then
        HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
        e.Print("Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "kidney" then
        HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
        e.Print("Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "blind" then
        HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
        e.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "sap" then
        HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
        e.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "shurikentornado" then
        HeroRotationCharDB.Toggles[26] = not HeroRotationCharDB.Toggles[26]
        e.Print("Shuriken Tornado Queue is now " .. (HeroRotationCharDB.Toggles[26] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "feint" then
        HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27]
        e.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "flagellation" then
        HeroRotationCharDB.Toggles[28] = not HeroRotationCharDB.Toggles[28]
        e.Print("Flagellation Queue is now " .. (HeroRotationCharDB.Toggles[28] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdshurikentornado" then
        HeroRotationCharDB.Toggles[29] = not HeroRotationCharDB.Toggles[29]
        e.Print("Shuriken Tornado is now " .. (HeroRotationCharDB.Toggles[29] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "racial" then
        HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30]
        e.Print("Racial Ability Queue is now " .. (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdwdp" then
        HeroRotationCharDB.Toggles[31] = not HeroRotationCharDB.Toggles[31]
        e.Print("Whirling Dragon Punch is now " .. (HeroRotationCharDB.Toggles[31] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "holdfsk" then
        HeroRotationCharDB.Toggles[32] = not HeroRotationCharDB.Toggles[32]
        e.Print("Flying Serpant Kick is now " .. (HeroRotationCharDB.Toggles[32] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "holdfof" then
        HeroRotationCharDB.Toggles[33] = not HeroRotationCharDB.Toggles[33]
        e.Print("Fist of Fury is now " .. (HeroRotationCharDB.Toggles[33] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "legsweep" then
        HeroRotationCharDB.Toggles[34] = not HeroRotationCharDB.Toggles[34]
        e.Print("Leg Sweep Queue is now " .. (HeroRotationCharDB.Toggles[34] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "paralysis" then
        HeroRotationCharDB.Toggles[35] = not HeroRotationCharDB.Toggles[35]
        e.Print("Paralysis Queue is now " .. (HeroRotationCharDB.Toggles[35] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "ringofpeace" then
        HeroRotationCharDB.Toggles[36] = not HeroRotationCharDB.Toggles[36]
        e.Print("Ring of Peace Queue is now " .. (HeroRotationCharDB.Toggles[36] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "bonedust" then
        HeroRotationCharDB.Toggles[37] = not HeroRotationCharDB.Toggles[37]
        e.Print("Bone Dust Brew Queue is now " .. (HeroRotationCharDB.Toggles[37] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "cancelfof" then
        HeroRotationCharDB.Toggles[38] = not HeroRotationCharDB.Toggles[38]
        e.Print("Cancelling of Fists of Fury is now " .. (HeroRotationCharDB.Toggles[38] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "holdtod" then
        HeroRotationCharDB.Toggles[39] = not HeroRotationCharDB.Toggles[39]
        e.Print("Touch of Death is now " .. (HeroRotationCharDB.Toggles[39] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "holdmovement" then
        HeroRotationCharDB.Toggles[40] = not HeroRotationCharDB.Toggles[40]
        e.Print("Fel Rush and Vengeful Retreat are now " .. (HeroRotationCharDB.Toggles[40] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "imprison" then
        HeroRotationCharDB.Toggles[41] = not HeroRotationCharDB.Toggles[41]
        e.Print("Imprison Queue is now " .. (HeroRotationCharDB.Toggles[41] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdimmolation" then
        HeroRotationCharDB.Toggles[42] = not HeroRotationCharDB.Toggles[42]
        e.Print("Immolation Aura is now " .. (HeroRotationCharDB.Toggles[42] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "holdfelblade" then
        HeroRotationCharDB.Toggles[43] = not HeroRotationCharDB.Toggles[43]
        e.Print("Fel Blade is now " .. (HeroRotationCharDB.Toggles[43] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "consumemagic" then
        HeroRotationCharDB.Toggles[44] = not HeroRotationCharDB.Toggles[44]
        e.Print("Consume Magic is now " .. (HeroRotationCharDB.Toggles[44] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "feleruption" then
        HeroRotationCharDB.Toggles[45] = not HeroRotationCharDB.Toggles[45]
        e.Print("Fel Eruption Queue is now " .. (HeroRotationCharDB.Toggles[45] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "chaosnova" then
        HeroRotationCharDB.Toggles[46] = not HeroRotationCharDB.Toggles[46]
        e.Print("Chaos Nova Queue is now " .. (HeroRotationCharDB.Toggles[46] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdeyebeam" then
        HeroRotationCharDB.Toggles[47] = not HeroRotationCharDB.Toggles[47]
        e.Print("Eye Beam is now " .. (HeroRotationCharDB.Toggles[47] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "felrush" then
        HeroRotationCharDB.Toggles[48] = not HeroRotationCharDB.Toggles[48]
        e.Print("Fel Rush Queue is now " .. (HeroRotationCharDB.Toggles[48] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "darkness" then
        HeroRotationCharDB.Toggles[49] = not HeroRotationCharDB.Toggles[49]
        e.Print("Darkness Queue is now " .. (HeroRotationCharDB.Toggles[49] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "gouge" then
        HeroRotationCharDB.Toggles[50] = not HeroRotationCharDB.Toggles[50]
        e.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[50] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "bladerushmelee" then
        HeroRotationCharDB.Toggles[51] = not HeroRotationCharDB.Toggles[51]
        e.Print("Blade Rush Melee Only is now " .. (HeroRotationCharDB.Toggles[51] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "holdkillingspree" then
        HeroRotationCharDB.Toggles[52] = not HeroRotationCharDB.Toggles[52]
        e.Print("Killing Spree is now " .. (HeroRotationCharDB.Toggles[52] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "grapplinghook" then
        HeroRotationCharDB.Toggles[53] = not HeroRotationCharDB.Toggles[53]
        e.Print("Grappling Hook Queue is now " .. (HeroRotationCharDB.Toggles[53] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdshiv" then
        HeroRotationCharDB.Toggles[54] = not HeroRotationCharDB.Toggles[54]
        e.Print("Shiv dispell is now " .. (HeroRotationCharDB.Toggles[54] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "forceaoe" then
        HeroRotationCharDB.Toggles[60] = not HeroRotationCharDB.Toggles[60]
        e.Print("ForceAoE is now " .. (HeroRotationCharDB.Toggles[60] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "massdispel" then
        HeroRotationCharDB.Toggles[61] = not HeroRotationCharDB.Toggles[61]
        e.Print("Mass Dispel Queue is now " .. (HeroRotationCharDB.Toggles[61] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "shackleundead" then
        HeroRotationCharDB.Toggles[62] = not HeroRotationCharDB.Toggles[62]
        e.Print("Shackle Undead Queue is now " .. (HeroRotationCharDB.Toggles[62] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "startweave" then
        HeroRotationCharDB.Toggles[70] = not HeroRotationCharDB.Toggles[70]
        e.Print("Weaving is now " .. (HeroRotationCharDB.Toggles[70] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "holdincarn" then
        HeroRotationCharDB.Toggles[71] = not HeroRotationCharDB.Toggles[71]
        e.Print("Incarn/Berserk is now " .. (HeroRotationCharDB.Toggles[71] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "autotaunt" then
        HeroRotationCharDB.Toggles[72] = not HeroRotationCharDB.Toggles[72]
        e.Print("AutoTaunt is now " .. (HeroRotationCharDB.Toggles[72] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "vortex" then
        HeroRotationCharDB.Toggles[73] = not HeroRotationCharDB.Toggles[73]
        e.Print("Ursol's Vortex Queue is now " .. (HeroRotationCharDB.Toggles[73] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "typhoon" then
        HeroRotationCharDB.Toggles[74] = not HeroRotationCharDB.Toggles[74]
        e.Print("Typhoon Queue is now " .. (HeroRotationCharDB.Toggles[74] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "stampedingroar" then
        HeroRotationCharDB.Toggles[75] = not HeroRotationCharDB.Toggles[75]
        e.Print("Stampeding Roar Queue is now " .. (HeroRotationCharDB.Toggles[75] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "incapacitatingroar" then
        HeroRotationCharDB.Toggles[76] = not HeroRotationCharDB.Toggles[76]
        e.Print("Incapacitating Roar Queue is now " .. (HeroRotationCharDB.Toggles[76] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "mightybash" then
        HeroRotationCharDB.Toggles[77] = not HeroRotationCharDB.Toggles[77]
        e.Print("Mighty Bash Queue is now " .. (HeroRotationCharDB.Toggles[77] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "zoomzoom" then
        HeroRotationCharDB.Toggles[78] = not HeroRotationCharDB.Toggles[78]
        e.Print("ZoomZoom Mode is now " .. (HeroRotationCharDB.Toggles[78] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif t == "entanglingroot" then
        HeroRotationCharDB.Toggles[79] = not HeroRotationCharDB.Toggles[79]
        e.Print("Entangling Root Queue is now " .. (HeroRotationCharDB.Toggles[79] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "gorefiend" then
        HeroRotationCharDB.Toggles[80] = not HeroRotationCharDB.Toggles[80]
        e.Print("Gorefiend's Grasp Queue is now " .. (HeroRotationCharDB.Toggles[80] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "controlundead" then
        HeroRotationCharDB.Toggles[81] = not HeroRotationCharDB.Toggles[81]
        e.Print("Control Undead Queue is now " .. (HeroRotationCharDB.Toggles[81] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holddancingruneweapon" then
        HeroRotationCharDB.Toggles[82] = not HeroRotationCharDB.Toggles[82]
        e.Print("Dancing Rune Weapon is now " .. (HeroRotationCharDB.Toggles[82] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "holddeathanddecay" then
        HeroRotationCharDB.Toggles[83] = not HeroRotationCharDB.Toggles[83]
        e.Print("Death and Decay is now " .. (HeroRotationCharDB.Toggles[83] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "bloodboil" then
        HeroRotationCharDB.Toggles[84] = not HeroRotationCharDB.Toggles[84]
        e.Print("Blood Boil Queue is now " .. (HeroRotationCharDB.Toggles[84] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdearthelemental" then
        HeroRotationCharDB.Toggles[90] = not HeroRotationCharDB.Toggles[90]
        e.Print("Earth Elemental is now " .. (HeroRotationCharDB.Toggles[90] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "capacitortotem" then
        HeroRotationCharDB.Toggles[91] = not HeroRotationCharDB.Toggles[91]
        e.Print("Capacitor Totem Queue is now " .. (HeroRotationCharDB.Toggles[91] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "healingstreamtotem" then
        HeroRotationCharDB.Toggles[92] = not HeroRotationCharDB.Toggles[92]
        e.Print("Healing Stream Totem Queue is now " .. (HeroRotationCharDB.Toggles[92] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "tremortotem" then
        HeroRotationCharDB.Toggles[93] = not HeroRotationCharDB.Toggles[93]
        e.Print("Tremor Stream Totem Queue is now " .. (HeroRotationCharDB.Toggles[93] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "windrushtotem" then
        HeroRotationCharDB.Toggles[94] = not HeroRotationCharDB.Toggles[94]
        e.Print("Wind Rush Totem Queue is now " .. (HeroRotationCharDB.Toggles[94] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "hex" then
        HeroRotationCharDB.Toggles[95] = not HeroRotationCharDB.Toggles[95]
        e.Print("Hex Queue is now " .. (HeroRotationCharDB.Toggles[95] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "faetransfusion" then
        HeroRotationCharDB.Toggles[96] = not HeroRotationCharDB.Toggles[96]
        e.Print("Fae Transfusion Queue is now " .. (HeroRotationCharDB.Toggles[96] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "usepurge" then
        HeroRotationCharDB.Toggles[97] = not HeroRotationCharDB.Toggles[97]
        e.Print("Purge Use is now " .. (HeroRotationCharDB.Toggles[97] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdfrozenorb" then
        HeroRotationCharDB.Toggles[100] = not HeroRotationCharDB.Toggles[100]
        e.Print("Frozen Orb is now " .. (HeroRotationCharDB.Toggles[100] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "holdfrostwyrm" then
        HeroRotationCharDB.Toggles[110] = not HeroRotationCharDB.Toggles[110]
        e.Print("Frostwyrm's Fury is now " .. (HeroRotationCharDB.Toggles[110] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "holdbos" then
        HeroRotationCharDB.Toggles[111] = not HeroRotationCharDB.Toggles[111]
        e.Print("Frostwyrm's Fury is now " .. (HeroRotationCharDB.Toggles[111] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "bindingshot" then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
        e.Print("Binding Shot Queue is now " .. (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "freezingtrap" then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
        e.Print("Freezing Trap Queue is now " .. (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "intimidation" then
        HeroRotationCharDB.Toggles[122] = not HeroRotationCharDB.Toggles[122]
        e.Print("Intimidation Queue is now " .. (HeroRotationCharDB.Toggles[122] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "flare" then
        HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123]
        e.Print("Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "tartrap" then
        HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124]
        e.Print("Tar Trap Queue is now " .. (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdmisdirection" then
        HeroRotationCharDB.Toggles[125] = not HeroRotationCharDB.Toggles[125]
        e.Print("Misdirection is now " .. (HeroRotationCharDB.Toggles[125] and "|cffff0000disabled|r." or "|cff00ff00enabled|r. (Requires AutoMisdirect checked in settings)"))
    elseif t == "huntersmark" then
        HeroRotationCharDB.Toggles[140] = not HeroRotationCharDB.Toggles[140]
        e.Print("Hunter's Mark Queue is now " .. (HeroRotationCharDB.Toggles[140] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdbombs" then
        HeroRotationCharDB.Toggles[141] = not HeroRotationCharDB.Toggles[141]
        e.Print("Wildfire Bombs are now " .. (HeroRotationCharDB.Toggles[141] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "holdtranq" then
        HeroRotationCharDB.Toggles[142] = not HeroRotationCharDB.Toggles[142]
        e.Print("Tranqualizing Shot is now " .. (HeroRotationCharDB.Toggles[142] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "shadowfury" then
        HeroRotationCharDB.Toggles[150] = not HeroRotationCharDB.Toggles[150]
        e.Print("Shadowfury Queue is now " .. (HeroRotationCharDB.Toggles[150] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "healooc" then
        HeroRotationCharDB.Toggles[160] = not HeroRotationCharDB.Toggles[160]
        e.Print("Healing from OOC is now " .. (HeroRotationCharDB.Toggles[160] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "ohshit" then
        HeroRotationCharDB.Toggles[161] = not HeroRotationCharDB.Toggles[161]
        e.Print("Healing CD Rotation has " .. (HeroRotationCharDB.Toggles[161] and "|cff00ff00Started|r." or "|cffff0000Completed|r."))
    elseif t == "vespertotem" then
        HeroRotationCharDB.Toggles[162] = not HeroRotationCharDB.Toggles[162]
        e.Print("Vesper Totem Queue has " .. (HeroRotationCharDB.Toggles[162] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "holdpurify" then
        HeroRotationCharDB.Toggles[163] = not HeroRotationCharDB.Toggles[163]
        e.Print("Purify Spirit is now " .. (HeroRotationCharDB.Toggles[163] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif t == "purifyspirit" then
        HeroRotationCharDB.Toggles[164] = not HeroRotationCharDB.Toggles[164]
        e.Print("Purify Spirit Queue has " .. (HeroRotationCharDB.Toggles[164] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif t == "stopdps" then
        HeroRotationCharDB.Toggles[165] = not HeroRotationCharDB.Toggles[165]
        e.Print("DPS Rotation is now " .. (HeroRotationCharDB.Toggles[165] and "|cffff0000off|r." or "|cff00ff00on|r."))
    elseif t == "stopheals" then
        HeroRotationCharDB.Toggles[166] = not HeroRotationCharDB.Toggles[166]
        e.Print("Healing Rotation has " .. (HeroRotationCharDB.Toggles[166] and "|cffff0000off|r." or "|cff00ff00on|r."))
    elseif tonumber(t) then
        HeroRotationCharDB.Toggles[999] = not HeroRotationCharDB.Toggles[999]
        QueuedS = l(tonumber(t))
        e.Print("Queue for " .. QueuedS:Name() .. " is now " .. (HeroRotationCharDB.Toggles[999] and "|cff00ff00on|r." or "|cffff0000off|r."))
    else
        e.Print("Invalid arguments.")
        e.Print("Type |cff8888ff/hr help|r for more infos.")
    end

end

SLASH_HEROROTATION1 = "/hr"
SLASH_HEROROTATION2 = "/ar"
SlashCmdList["HEROROTATION"] = e.CmdHandler
function e.CDsON()
    return HeroRotationCharDB.Toggles[1]
end

do
    local t = { [120651] = true }
    function e.AoEON()
        return HeroRotationCharDB.Toggles[2] and not t[f:NPCID()]
    end

end

function e.ON()
    return HeroRotationCharDB.Toggles[3]
end

function e.Locked()
    return HeroRotationDB.Locked
end


