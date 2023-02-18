local a, b = ...
local c = HeroLib;
local d, e = HeroCache, c.Utils;
local f = c.Unit;
local g = f.Player;
local h = f.Target;
local i = c.Spell;
local j = c.Item;
local k = LibStub:GetLibrary("LibDataBroker-1.1")
local l = LibStub("LibDBIcon-1.0")
local m = c.GUI;
local n = math.min;
local print = print;
local select = select;
local o = string.lower;
local strsplit = strsplit;
local tostring = tostring;
local p = {}
local q = { General = b.GUISettings.General }
LibStub("AceAddon-3.0"):NewAddon(b, "HeroRotation", "AceConsole-3.0")
local r = LibStub("LibDataBroker-1.1"):NewDataObject("HeroRotation",
    { type = "launcher", text = "HeroRotation", label = "HeroRotation",
        icon = "Interface\\AddOns\\HeroRotation\\Media\\999901",
        OnClick = function()
            local s = GetSpecialization()
            d.Persistent.Player.Spec = { GetSpecializationInfo(s) }
            local t = d.Persistent.Player.Spec[1]
            if t == 577 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Havoc")
            elseif t == 250 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Blood")
            elseif t == 252 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Unholy")
            elseif t == 72 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Fury")
            elseif t == 267 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Destruction")
            elseif t == 264 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Restoration")
            elseif t == 263 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Enhancement")
            elseif t == 262 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Elemental")
            elseif t == 261 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Subtlety")
            elseif t == 260 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Outlaw")
            elseif t == 258 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Shadow")
            elseif t == 269 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Windwalker")
            elseif t == 64 or t == 251 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Frost")
            elseif t == 255 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Survival")
            elseif t == 253 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      BeastMastery")
            elseif t == 104 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      Guardian")
            elseif t == 257 then
                InterfaceOptionsFrame_Show()
                InterfaceOptionsFrame_OpenToCategory("HeroRotation")
                InterfaceOptionsFrame_OpenToCategory("      HolyPriest")
            end
        end, OnTooltipShow = function(u) u:AddLine("HeroRotation", 1, 1, 1) end })
function b.CoreInit()
    HeroRotationDB.db = LibStub("AceDB-3.0"):New("HeroRotationDB", { profile = { minimap = { hide = false } } })
    HRDBIcon = LibStub("LibDBIcon-1.0")
    HRDBIcon:Register("HeroRotation", r, HeroRotationDB.db.profile.minimap)
end

;
function b.Print(...) if not q.General.SilentMode then print("[|cFFFF6600Hero Rotation|r]", ...) end end

;
b.APLs = {}
b.APLInits = {}
function b.SetAPL(s, v, w)
    b.APLs[s] = v;
    b.APLInits[s] = w
end

;
function b.GetTexture(x)
    local y = x.SpellID;
    if y then
        local z = d.Persistent.Texture.Spell;
        if not z[y] then if y >= 999900 then z[y] = "Interface\\Addons\\HeroRotation\\Textures\\" .. tostring(y) elseif x.TextureSpellID then z[y] =
                GetSpellTexture(x.TextureSpellID) else z[y] = GetSpellTexture(y) end end
        ;
        return z[y]
    end
    ;
    local A = x.ItemID;
    if A then
        local z = d.Persistent.Texture.Item;
        if not z[A] then
            local B, B, B, B, B, B, B, B, B, C = GetItemInfo(A)
            z[A] = C
        end
        ;
        return z[A]
    end
end

;
local D = i(61304)
local E, F, G;
local function H(x, I, J)
    local K, L;
    local M = GetTime()
    if g:IsCasting() or g:IsChanneling() then
        K = g:CastStart()
        L = g:CastDuration()
    else K, L = D:CooldownInfo() end
    ;
    if E ~= x then
        E = x;
        F = M;
        G = 0
    end
    ;
    if I then
        local N;
        if J then N = J else N = g.TimeToXResourceMap[x:CostInfo(nil, "type")](x:Cost()) end
        ;
        if N and N > 0 then if N > K + L - M then
                local O = M - F + N;
                if G == 0 and O > 0.25 or G > O or O - G > 0.5 then G = O end
                ;
                K = F;
                L = G
            end end
    end
    ;
    if K + L < M then
        K = 0;
        L = 0;
        E = nil
    end
    ;
    b.MainIconFrame:SetCooldown(K, L)
end
;
b.CastOffGCDOffset = 1;
function b.Cast(x, P, Q, R, J)
    local S = b.GetTexture(x)
    local T = not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(S)
    if P or Q == "Cooldown" then if b.CastOffGCDOffset == 1 or b.CastOffGCDOffset == 2 and b.SmallIconFrame:GetIcon(1) ~= S then
            b.SmallIconFrame:ChangeIcon(b.CastOffGCDOffset, S, T, R)
            b.CastOffGCDOffset = b.CastOffGCDOffset + 1;
            x.LastDisplayTime = GetTime()
            return false
        end elseif Q == "Suggested" then b.CastSuggested(x, R) elseif Q == "SuggestedRight" then b.CastRightSuggested(x,
            R) else
        local U = 999910;
        local V = x.SpellID == U or x:IsUsable()
        local W = Q == "Pooling"
        local R = R or false;
        b.MainIconFrame:ChangeIcon(S, T, V, R)
        H(x, W, J)
        x.LastDisplayTime = GetTime()
        return true
    end
    ;
    return nil
end

;
function b.CastAnnotated(x, P, X)
    local Y = b.Cast(x, P)
    if not P then b.MainIconFrame:OverlayText(X) end
    ;
    return Y
end

;
function b.CastPooling(x, J, R) return b.Cast(x, false, "Pooling", R, J) end

;
local Z, _, a0, a1;
b.MaxQueuedCasts = 3;
local function a2(...)
    Z = { ... }
    _ = n(#Z, b.MaxQueuedCasts)
    a0 = {}
    a1 = {}
    for a3 = 1, _ do
        a0[a3] = b.GetTexture(Z[a3])
        Z[a3].LastDisplayTime = GetTime()
        a1[a3] = not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(a0[a3])
        print("1", a1[a3])
    end
    ;
    b.MainIconFrame:ChangeIcon(a0[1], a1[1], Z[1]:IsUsable())
    b.MainIconFrame:SetupParts(a0, a1)
end
;
function b.CastQueue(...)
    a2(...)
    H()
    return "Should Return"
end

;
function b.CastQueuePooling(J, ...)
    a2(...)
    if J then H(Z[1], true, J) else
        local a4, a5 = nil, 0;
        for a3 = 1, #Z do if Z[a3]:Cost() > a5 then
                a5 = Z[a3]:Cost()
                a4 = Z[a3]
            end end
        ;
        H(a4, true)
    end
    ;
    return "Should Return"
end

;
function RunQueueLoop(a6)
    local a7 = false;
    for a3, a8 in pairs(p) do if a8 == a6 then
            table.remove(p, a3)
            a7 = true
        end end
    ;
    if not a7 then p[#p + 1] = a6 end
end

;
function b.QueuedCast()
    for a3 = 1, 10 do
        if HeroRotationCharDB.Toggles[900 + a3] and not p[a3] then HeroRotationCharDB.Toggles[900 + a3] = not
                HeroRotationCharDB.Toggles[900 + a3] end
        ;
        if not HeroRotationCharDB.Toggles[900 + a3] and p[a3] then HeroRotationCharDB.Toggles[900 + a3] = not
                HeroRotationCharDB.Toggles[900 + a3] end
    end
    ;
    if #p >= 1 then for a3 = 1, #p do if p[a3] and b.Commons.Everyone.TargetIsValid() then
                local a9 = i(p[a3])
                if a9:IsUsableP() and a9:CooldownRemains(BypassRecovery) <= 0 and not g:PrevGCD(1, a9) and not g:IsCasting(a9) then if b.Cast(a9, nil, nil, nil) then return
                        a9:ID() end elseif not a9:IsUsableP() or a9:CooldownRemains() > 0 or g:PrevGCDP(1, a9) then
                    HeroRotationCharDB.Toggles[900 + a3] = not HeroRotationCharDB.Toggles[900 + a3]
                    b.Print("QueueR for " ..
                    a9:Name() .. " is now " ..
                    (HeroRotationCharDB.Toggles[900 + a3] and "|cff00ff00on|r." or "|cffff0000off|r."))
                    table.remove(p, a3)
                    break
                end
            end end else return nil end
end

;
b.CastLeftOffset = 1;
function b.CastLeftCommon(x)
    local aa = b.GetTexture(x)
    local T = not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(aa)
    b.LeftIconFrame:ChangeIcon(aa, T)
    b.CastLeftOffset = b.CastLeftOffset + 1;
    x.LastDisplayTime = GetTime()
end

;
function b.CastLeft(x)
    if b.CastLeftOffset == 1 then b.CastLeftCommon(x) end
    ;
    return false
end

;
function b.CastLeftNameplate(ab, x)
    if b.CastLeftOffset == 1 and b.Nameplate.AddIcon(ab, x) then b.CastLeftCommon(x) end
    ;
    return false
end

;
b.CastSuggestedOffset = 1;
function b.CastSuggested(x, R)
    if b.CastSuggestedOffset == 1 then
        local aa = b.GetTexture(x)
        local T = not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(aa)
        b.SuggestedIconFrame:ChangeIcon(aa, T, R)
        b.CastSuggestedOffset = b.CastSuggestedOffset + 1;
        x.LastDisplayTime = GetTime()
    end
    ;
    return false
end

;
b.CastRightSuggestedOffset = 1;
function b.CastRightSuggested(x, R)
    if b.CastRightSuggestedOffset == 1 then
        local aa = b.GetTexture(x)
        local T = not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(aa)
        b.RightSuggestedIconFrame:ChangeIcon(aa, T, R)
        b.CastRightSuggestedOffset = b.CastRightSuggestedOffset + 1;
        x.LastDisplayTime = GetTime()
    end
    ;
    return false
end

;
function b.CmdHandler(ac)
    local ad, ae, af = strsplit(" ", o(ac))
    if ad == "cds" then
        HeroRotationCharDB.Toggles[1] = not HeroRotationCharDB.Toggles[1]
        b.ToggleIconFrame:UpdateButtonText(1)
        b.Print("CDs are now " .. (HeroRotationCharDB.Toggles[1] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "aoe" then
        HeroRotationCharDB.Toggles[2] = not HeroRotationCharDB.Toggles[2]
        b.ToggleIconFrame:UpdateButtonText(2)
        b.Print("AoE is now " .. (HeroRotationCharDB.Toggles[2] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "toggle" then
        HeroRotationCharDB.Toggles[3] = not HeroRotationCharDB.Toggles[3]
        b.ToggleIconFrame:UpdateButtonText(3)
        b.Print("HeroRotation is now " ..
        (HeroRotationCharDB.Toggles[3] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "smallcds" then
        HeroRotationCharDB.Toggles[4] = not HeroRotationCharDB.Toggles[4]
        b.ToggleIconFrame:UpdateButtonText(4)
        b.Print("Small Cooldowns are now " ..
        (HeroRotationCharDB.Toggles[4] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "opener" then
        HeroRotationCharDB.Toggles[5] = not HeroRotationCharDB.Toggles[5]
        b.ToggleIconFrame:UpdateButtonText(5)
        b.Print("Opener is now " .. (HeroRotationCharDB.Toggles[5] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "unlock" then
        b.MainFrame:Unlock()
        b.Print("HeroRotation UI is now |cff00ff00unlocked|r.")
    elseif ad == "lock" then
        b.MainFrame:Lock()
        b.Print("HeroRotation UI is now |cffff0000locked|r.")
    elseif ad == "scale" then if ae and af then
            af = tonumber(af)
            if af and type(af) == "number" and af > 0 and af <= 10 then if ae == "ui" then b.MainFrame:ResizeUI(af) elseif ae == "buttons" then
                    b.MainFrame:ResizeButtons(af) elseif ae == "all" then
                    b.MainFrame:ResizeUI(af)
                    b.MainFrame:ResizeButtons(af)
                else
                    b.Print("Invalid |cff88ff88[Type]|r for Scale.")
                    b.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")
                    b.Print("Type accepted are |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r.")
                end else
                b.Print("Invalid |cffff8888[Size]|r for Scale.")
                b.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")
                b.Print("Size accepted are |cffff8888number > 0 and <= 10|r.")
            end
        else
            b.Print("Invalid arguments for Scale.")
            b.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")
            b.Print("Type accepted are |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r.")
            b.Print("Size accepted are |cffff8888number > 0 and <= 10|r.")
        end elseif ad == "resetbuttons" then b.ToggleIconFrame:ResetAnchor() elseif ad == "help" then
        b.Print("|cffffff00--[Toggles]--|r")
        b.Print("  On/Off: |cff8888ff/hr toggle|r")
        b.Print("  CDs: |cff8888ff/hr cds|r")
        b.Print("  AoE: |cff8888ff/hr aoe|r")
        b.Print("|cffffff00--[User Interface]--|r")
        b.Print("  UI Lock: |cff8888ff/hr lock|r")
        b.Print("  UI Unlock: |cff8888ff/hr unlock|r")
        b.Print("  UI Scale: |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r")
        b.Print("    [Type]: |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r")
        b.Print("    [Size]: |cffff8888number > 0 and <= 10|r")
        b.Print("  Button Anchor Reset : |cff8888ff/hr resetbuttons|r")
    elseif ad == "holdaotd" then
        HeroRotationCharDB.Toggles[10] = not HeroRotationCharDB.Toggles[10]
        b.Print("Army of the Dead is now " ..
        (HeroRotationCharDB.Toggles[10] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "holdsacpac" then
        HeroRotationCharDB.Toggles[11] = not HeroRotationCharDB.Toggles[11]
        b.Print("Sacrifical Pact is now " ..
        (HeroRotationCharDB.Toggles[11] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "stopautoswap" then
        HeroRotationCharDB.Toggles[12] = not HeroRotationCharDB.Toggles[12]
        b.Print("Auto Swap is now " .. (HeroRotationCharDB.Toggles[12] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "amz" then
        HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13]
        b.Print("Anti-Magic Zone Queue is now " ..
        (HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "deathgrip" then
        HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14]
        b.Print("Death Grip Queue is now " .. (HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdpot" then
        HeroRotationCharDB.Toggles[15] = not HeroRotationCharDB.Toggles[15]
        b.Print("DPS Pots are now " ..
        (HeroRotationCharDB.Toggles[15] and "|cffff0000disabled|r." or "|cff00ff00enabled|r. Requires Show:Potions checked in settings"))
    elseif ad == "asphyxiate" then
        HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16]
        b.Print("Asphyxiate Queue is now " .. (HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdweapon" then
        HeroRotationCharDB.Toggles[17] = not HeroRotationCharDB.Toggles[17]
        b.Print("Weapon Extra Use is now " ..
        (HeroRotationCharDB.Toggles[17] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "holdabomlimb" then
        HeroRotationCharDB.Toggles[18] = not HeroRotationCharDB.Toggles[18]
        b.Print("Abomination Limb is now " ..
        (HeroRotationCharDB.Toggles[18] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "funnelaoe" then
        HeroRotationCharDB.Toggles[20] = not HeroRotationCharDB.Toggles[20]
        b.Print("Funnel AoE is now " ..
        (HeroRotationCharDB.Toggles[20] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "holdvanish" then
        HeroRotationCharDB.Toggles[21] = not HeroRotationCharDB.Toggles[21]
        b.Print("Vanish is now " ..
        (HeroRotationCharDB.Toggles[21] and "|cffff0000disabled|r." or "|cff00ff00enabled|r. Requires Use Vanish checked in settings"))
    elseif ad == "cheapshot" then
        HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22]
        b.Print("Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "kidney" then
        HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23]
        b.Print("Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "blind" then
        HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24]
        b.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "sap" then
        HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25]
        b.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "shurikentornado" then
        HeroRotationCharDB.Toggles[26] = not HeroRotationCharDB.Toggles[26]
        b.Print("Shuriken Tornado Queue is now " ..
        (HeroRotationCharDB.Toggles[26] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "feint" then
        HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27]
        b.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "flagellation" then
        HeroRotationCharDB.Toggles[28] = not HeroRotationCharDB.Toggles[28]
        b.Print("Flagellation Queue is now " .. (HeroRotationCharDB.Toggles[28] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdshurikentornado" then
        HeroRotationCharDB.Toggles[29] = not HeroRotationCharDB.Toggles[29]
        b.Print("Shuriken Tornado is now " ..
        (HeroRotationCharDB.Toggles[29] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "racial" then
        HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30]
        b.Print("Racial Ability Queue is now " ..
        (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdwdp" then
        HeroRotationCharDB.Toggles[31] = not HeroRotationCharDB.Toggles[31]
        b.Print("Whirling Dragon Punch is now " ..
        (HeroRotationCharDB.Toggles[31] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "holdfsk" then
        HeroRotationCharDB.Toggles[32] = not HeroRotationCharDB.Toggles[32]
        b.Print("Flying Serpant Kick is now " ..
        (HeroRotationCharDB.Toggles[32] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "holdfof" then
        HeroRotationCharDB.Toggles[33] = not HeroRotationCharDB.Toggles[33]
        b.Print("Fist of Fury is now " ..
        (HeroRotationCharDB.Toggles[33] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "legsweep" then
        HeroRotationCharDB.Toggles[34] = not HeroRotationCharDB.Toggles[34]
        b.Print("Leg Sweep Queue is now " .. (HeroRotationCharDB.Toggles[34] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "paralysis" then
        HeroRotationCharDB.Toggles[35] = not HeroRotationCharDB.Toggles[35]
        b.Print("Paralysis Queue is now " .. (HeroRotationCharDB.Toggles[35] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "ringofpeace" then
        HeroRotationCharDB.Toggles[36] = not HeroRotationCharDB.Toggles[36]
        b.Print("Ring of Peace Queue is now " .. (HeroRotationCharDB.Toggles[36] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "bonedust" then
        HeroRotationCharDB.Toggles[37] = not HeroRotationCharDB.Toggles[37]
        b.Print("Bone Dust Brew Queue is now " ..
        (HeroRotationCharDB.Toggles[37] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "cancelfof" then
        HeroRotationCharDB.Toggles[38] = not HeroRotationCharDB.Toggles[38]
        b.Print("Cancelling of Fists of Fury is now " ..
        (HeroRotationCharDB.Toggles[38] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "holdtod" then
        HeroRotationCharDB.Toggles[39] = not HeroRotationCharDB.Toggles[39]
        b.Print("Touch of Death is now " ..
        (HeroRotationCharDB.Toggles[39] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "holdmovement" then
        HeroRotationCharDB.Toggles[40] = not HeroRotationCharDB.Toggles[40]
        b.Print("Fel Rush and Vengeful Retreat are now " ..
        (HeroRotationCharDB.Toggles[40] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "imprison" then
        HeroRotationCharDB.Toggles[41] = not HeroRotationCharDB.Toggles[41]
        b.Print("Imprison Queue is now " .. (HeroRotationCharDB.Toggles[41] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdimmolation" then
        HeroRotationCharDB.Toggles[42] = not HeroRotationCharDB.Toggles[42]
        b.Print("Immolation Aura is now " ..
        (HeroRotationCharDB.Toggles[42] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "holdfelblade" then
        HeroRotationCharDB.Toggles[43] = not HeroRotationCharDB.Toggles[43]
        b.Print("Fel Blade is now " .. (HeroRotationCharDB.Toggles[43] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "consumemagic" then
        HeroRotationCharDB.Toggles[44] = not HeroRotationCharDB.Toggles[44]
        b.Print("Consume Magic is now " ..
        (HeroRotationCharDB.Toggles[44] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "feleruption" then
        HeroRotationCharDB.Toggles[45] = not HeroRotationCharDB.Toggles[45]
        b.Print("Fel Eruption Queue is now " .. (HeroRotationCharDB.Toggles[45] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "chaosnova" then
        HeroRotationCharDB.Toggles[46] = not HeroRotationCharDB.Toggles[46]
        b.Print("Chaos Nova Queue is now " .. (HeroRotationCharDB.Toggles[46] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdeyebeam" then
        HeroRotationCharDB.Toggles[47] = not HeroRotationCharDB.Toggles[47]
        b.Print("Eye Beam is now " .. (HeroRotationCharDB.Toggles[47] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "felrush" then
        HeroRotationCharDB.Toggles[48] = not HeroRotationCharDB.Toggles[48]
        b.Print("Fel Rush Queue is now " .. (HeroRotationCharDB.Toggles[48] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "darkness" then
        HeroRotationCharDB.Toggles[49] = not HeroRotationCharDB.Toggles[49]
        b.Print("Darkness Queue is now " .. (HeroRotationCharDB.Toggles[49] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "gouge" then
        HeroRotationCharDB.Toggles[50] = not HeroRotationCharDB.Toggles[50]
        b.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[50] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "bladerushmelee" then
        HeroRotationCharDB.Toggles[51] = not HeroRotationCharDB.Toggles[51]
        b.Print("Blade Rush Melee Only is now " ..
        (HeroRotationCharDB.Toggles[51] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdkillingspree" then
        HeroRotationCharDB.Toggles[52] = not HeroRotationCharDB.Toggles[52]
        b.Print("Killing Spree is now " ..
        (HeroRotationCharDB.Toggles[52] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "grapplinghook" then
        HeroRotationCharDB.Toggles[53] = not HeroRotationCharDB.Toggles[53]
        b.Print("Grappling Hook Queue is now " ..
        (HeroRotationCharDB.Toggles[53] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdshiv" then
        HeroRotationCharDB.Toggles[54] = not HeroRotationCharDB.Toggles[54]
        b.Print("Shiv dispell is now " ..
        (HeroRotationCharDB.Toggles[54] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "forceaoe" then
        HeroRotationCharDB.Toggles[60] = not HeroRotationCharDB.Toggles[60]
        b.Print("ForceAoE is now " .. (HeroRotationCharDB.Toggles[60] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "massdispel" then
        HeroRotationCharDB.Toggles[61] = not HeroRotationCharDB.Toggles[61]
        b.Print("Mass Dispel Queue is now " .. (HeroRotationCharDB.Toggles[61] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "shackleundead" then
        HeroRotationCharDB.Toggles[62] = not HeroRotationCharDB.Toggles[62]
        b.Print("Shackle Undead Queue is now " ..
        (HeroRotationCharDB.Toggles[62] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "startweave" then
        HeroRotationCharDB.Toggles[70] = not HeroRotationCharDB.Toggles[70]
        b.Print("Weaving is now " .. (HeroRotationCharDB.Toggles[70] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "holdincarn" then
        HeroRotationCharDB.Toggles[71] = not HeroRotationCharDB.Toggles[71]
        b.Print("Incarn/Berserk is now " ..
        (HeroRotationCharDB.Toggles[71] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "autotaunt" then
        HeroRotationCharDB.Toggles[72] = not HeroRotationCharDB.Toggles[72]
        b.Print("AutoTaunt is now " .. (HeroRotationCharDB.Toggles[72] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "vortex" then
        HeroRotationCharDB.Toggles[73] = not HeroRotationCharDB.Toggles[73]
        b.Print("Ursol's Vortex Queue is now " ..
        (HeroRotationCharDB.Toggles[73] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "typhoon" then
        HeroRotationCharDB.Toggles[74] = not HeroRotationCharDB.Toggles[74]
        b.Print("Typhoon Queue is now " .. (HeroRotationCharDB.Toggles[74] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "stampedingroar" then
        HeroRotationCharDB.Toggles[75] = not HeroRotationCharDB.Toggles[75]
        b.Print("Stampeding Roar Queue is now " ..
        (HeroRotationCharDB.Toggles[75] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "incapacitatingroar" then
        HeroRotationCharDB.Toggles[76] = not HeroRotationCharDB.Toggles[76]
        b.Print("Incapacitating Roar Queue is now " ..
        (HeroRotationCharDB.Toggles[76] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "mightybash" then
        HeroRotationCharDB.Toggles[77] = not HeroRotationCharDB.Toggles[77]
        b.Print("Mighty Bash Queue is now " .. (HeroRotationCharDB.Toggles[77] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "zoomzoom" then
        HeroRotationCharDB.Toggles[78] = not HeroRotationCharDB.Toggles[78]
        b.Print("ZoomZoom Mode is now " ..
        (HeroRotationCharDB.Toggles[78] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    elseif ad == "entanglingroot" then
        HeroRotationCharDB.Toggles[79] = not HeroRotationCharDB.Toggles[79]
        b.Print("Entangling Root Queue is now " ..
        (HeroRotationCharDB.Toggles[79] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "gorefiend" then
        HeroRotationCharDB.Toggles[80] = not HeroRotationCharDB.Toggles[80]
        b.Print("Gorefiend's Grasp Queue is now " ..
        (HeroRotationCharDB.Toggles[80] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "controlundead" then
        HeroRotationCharDB.Toggles[81] = not HeroRotationCharDB.Toggles[81]
        b.Print("Control Undead Queue is now " ..
        (HeroRotationCharDB.Toggles[81] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holddancingruneweapon" then
        HeroRotationCharDB.Toggles[82] = not HeroRotationCharDB.Toggles[82]
        b.Print("Dancing Rune Weapon is now " ..
        (HeroRotationCharDB.Toggles[82] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "holddeathanddecay" then
        HeroRotationCharDB.Toggles[83] = not HeroRotationCharDB.Toggles[83]
        b.Print("Death and Decay is now " ..
        (HeroRotationCharDB.Toggles[83] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "bloodboil" then
        HeroRotationCharDB.Toggles[84] = not HeroRotationCharDB.Toggles[84]
        b.Print("Blood Boil Queue is now " .. (HeroRotationCharDB.Toggles[84] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdraiseally" then
        HeroRotationCharDB.Toggles[85] = not HeroRotationCharDB.Toggles[85]
        b.Print("Raise Ally @ Mouseover is now " ..
        (HeroRotationCharDB.Toggles[85] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "holdearthelemental" then
        HeroRotationCharDB.Toggles[90] = not HeroRotationCharDB.Toggles[90]
        b.Print("Earth Elemental is now " ..
        (HeroRotationCharDB.Toggles[90] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "capacitortotem" then
        HeroRotationCharDB.Toggles[91] = not HeroRotationCharDB.Toggles[91]
        b.Print("Capacitor Totem Queue is now " ..
        (HeroRotationCharDB.Toggles[91] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "healingstreamtotem" then
        HeroRotationCharDB.Toggles[92] = not HeroRotationCharDB.Toggles[92]
        b.Print("Healing Stream Totem Queue is now " ..
        (HeroRotationCharDB.Toggles[92] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "tremortotem" then
        HeroRotationCharDB.Toggles[93] = not HeroRotationCharDB.Toggles[93]
        b.Print("Tremor Stream Totem Queue is now " ..
        (HeroRotationCharDB.Toggles[93] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "windrushtotem" then
        HeroRotationCharDB.Toggles[94] = not HeroRotationCharDB.Toggles[94]
        b.Print("Wind Rush Totem Queue is now " ..
        (HeroRotationCharDB.Toggles[94] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "hex" then
        HeroRotationCharDB.Toggles[95] = not HeroRotationCharDB.Toggles[95]
        b.Print("Hex Queue is now " .. (HeroRotationCharDB.Toggles[95] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "faetransfusion" then
        HeroRotationCharDB.Toggles[96] = not HeroRotationCharDB.Toggles[96]
        b.Print("Fae Transfusion Queue is now " ..
        (HeroRotationCharDB.Toggles[96] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "usepurge" then
        HeroRotationCharDB.Toggles[97] = not HeroRotationCharDB.Toggles[97]
        b.Print("Purge Use is now " .. (HeroRotationCharDB.Toggles[97] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdfrozenorb" then
        HeroRotationCharDB.Toggles[100] = not HeroRotationCharDB.Toggles[100]
        b.Print("Frozen Orb is now " ..
        (HeroRotationCharDB.Toggles[100] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "holdfrostwyrm" then
        HeroRotationCharDB.Toggles[110] = not HeroRotationCharDB.Toggles[110]
        b.Print("Frostwyrm's Fury is now " ..
        (HeroRotationCharDB.Toggles[110] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "holdbos" then
        HeroRotationCharDB.Toggles[111] = not HeroRotationCharDB.Toggles[111]
        b.Print("Frostwyrm's Fury is now " ..
        (HeroRotationCharDB.Toggles[111] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "bindingshot" then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120]
        b.Print("Binding Shot Queue is now " .. (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "freezingtrap" then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121]
        b.Print("Freezing Trap Queue is now " ..
        (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "intimidation" then
        HeroRotationCharDB.Toggles[122] = not HeroRotationCharDB.Toggles[122]
        b.Print("Intimidation Queue is now " .. (HeroRotationCharDB.Toggles[122] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "flare" then
        HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123]
        b.Print("Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "tartrap" then
        HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124]
        b.Print("Tar Trap Queue is now " .. (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdmisdirection" then
        HeroRotationCharDB.Toggles[125] = not HeroRotationCharDB.Toggles[125]
        b.Print("Misdirection is now " ..
        (HeroRotationCharDB.Toggles[125] and "|cffff0000disabled|r." or "|cff00ff00enabled|r. (Requires AutoMisdirect checked in settings)"))
    elseif ad == "wailingarrow" then
        HeroRotationCharDB.Toggles[170] = not HeroRotationCharDB.Toggles[170]
        b.Print("Wailing Arrow Queue now " ..
        (HeroRotationCharDB.Toggles[170] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "deathchakram" then
        HeroRotationCharDB.Toggles[171] = not HeroRotationCharDB.Toggles[171]
        b.Print("Death Chakram Queue now " .. (HeroRotationCharDB.Toggles[171] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "huntersmark" then
        HeroRotationCharDB.Toggles[140] = not HeroRotationCharDB.Toggles[140]
        b.Print("Hunter's Mark Queue is now " ..
        (HeroRotationCharDB.Toggles[140] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdbombs" then
        HeroRotationCharDB.Toggles[141] = not HeroRotationCharDB.Toggles[141]
        b.Print("Wildfire Bombs are now " ..
        (HeroRotationCharDB.Toggles[141] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "holdtranq" then
        HeroRotationCharDB.Toggles[142] = not HeroRotationCharDB.Toggles[142]
        b.Print("Tranqualizing Shot is now " ..
        (HeroRotationCharDB.Toggles[142] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "shadowfury" then
        HeroRotationCharDB.Toggles[150] = not HeroRotationCharDB.Toggles[150]
        b.Print("Shadowfury Queue is now " .. (HeroRotationCharDB.Toggles[150] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "healooc" then
        HeroRotationCharDB.Toggles[160] = not HeroRotationCharDB.Toggles[160]
        b.Print("Healing from OOC is now " .. (HeroRotationCharDB.Toggles[160] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "ohshit" then
        HeroRotationCharDB.Toggles[161] = not HeroRotationCharDB.Toggles[161]
        b.Print("Healing CD Rotation has " ..
        (HeroRotationCharDB.Toggles[161] and "|cff00ff00Started|r." or "|cffff0000Completed|r."))
    elseif ad == "vespertotem" then
        HeroRotationCharDB.Toggles[162] = not HeroRotationCharDB.Toggles[162]
        b.Print("Vesper Totem Queue has " .. (HeroRotationCharDB.Toggles[162] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "holdpurify" then
        HeroRotationCharDB.Toggles[163] = not HeroRotationCharDB.Toggles[163]
        b.Print("Purify Spirit is now " ..
        (HeroRotationCharDB.Toggles[163] and "|cffff0000disabled|r." or "|cff00ff00enabled|r."))
    elseif ad == "purifyspirit" then
        HeroRotationCharDB.Toggles[164] = not HeroRotationCharDB.Toggles[164]
        b.Print("Purify Spirit Queue has " .. (HeroRotationCharDB.Toggles[164] and "|cff00ff00on|r." or "|cffff0000off|r."))
    elseif ad == "stopdps" then
        HeroRotationCharDB.Toggles[165] = not HeroRotationCharDB.Toggles[165]
        b.Print("DPS Rotation is now " .. (HeroRotationCharDB.Toggles[165] and "|cffff0000off|r." or "|cff00ff00on|r."))
    elseif ad == "stopheals" then
        HeroRotationCharDB.Toggles[166] = not HeroRotationCharDB.Toggles[166]
        b.Print("Healing Rotation has " .. (HeroRotationCharDB.Toggles[166] and "|cffff0000off|r." or "|cff00ff00on|r."))
    elseif ad == "infernalstrike" then
        HeroRotationCharDB.Toggles[167] = not HeroRotationCharDB.Toggles[167]
        b.Print("Infernal Strike Queue is now " ..
        (HeroRotationCharDB.Toggles[167] and "|cffff0000off|r." or "|cff00ff00on|r."))
    elseif ad == "sigilofsilence" then
        HeroRotationCharDB.Toggles[168] = not HeroRotationCharDB.Toggles[168]
        b.Print("Sigil Of Silence Queue is now " ..
        (HeroRotationCharDB.Toggles[168] and "|cffff0000off|r." or "|cff00ff00on|r."))
    elseif ad == "chaosnova" then
        HeroRotationCharDB.Toggles[169] = not HeroRotationCharDB.Toggles[169]
        b.Print("Chaos Nova Queue is now " .. (HeroRotationCharDB.Toggles[169] and "|cffff0000off|r." or "|cff00ff00on|r."))
    elseif tonumber(ad) then RunQueueLoop(tonumber(ad)) else
        b.Print("Invalid arguments.")
        b.Print("Type |cff8888ff/hr help|r for more infos.")
    end
end

;
SLASH_HEROROTATION1 = "/hr"
SLASH_HEROROTATION2 = "/ar"
SlashCmdList["HEROROTATION"] = b.CmdHandler;
function b.CDsON() return HeroRotationCharDB.Toggles[1] end

;
do
    local ag = { [120651] = true }
    function b.AoEON() return HeroRotationCharDB.Toggles[2] and not ag[h:NPCID()] end
end
;
function b.ON() return HeroRotationCharDB.Toggles[3] end

;
function b.Locked() return HeroRotationDB.Locked end
