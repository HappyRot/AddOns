local p, e = ...
local i = HeroLib
local c = HeroCache
local t = i.Unit
local l = t.Player
local t = t.Target
local y = i.Spell
local t = i.Item
local f = i.GUI
local o = f.CreatePanelOption
local t = math.max
local m = math.min
local a = pairs
local t = select
local u
local s = {  }
local d
local r
local w, h
local n = { General = e.GUISettings.General }
local function t(e, t)
    if t then
        e.__MSQ_Normal:Hide()
        e.Texture:SetAllPoints(e)
        if e.CooldownFrame then
            e.CooldownFrame:SetAllPoints(e)
        end

        if e.Backdrop then
            e.Backdrop:Show()
            e.Backdrop:SetFrameLevel(m(e.Backdrop:GetFrameLevel(), 7))
        end

    else
        if e.Backdrop then
            e.Backdrop:Hide()
        end

    end

end

local function v(n, i, h, h, h, h, h, o)
    if n == e and s and r then
        local e = r[i]
        if e then
            if type(e.Icon) == "table" then
                for a, e in a(e.Icon) do
                    t(e, o)
                end

            else
                t(e, o)
            end

        end

    end

end

BINDING_HEADER_HEROROTATION = "HeroRotation"
BINDING_NAME_HEROROTATION_CDS = "Toggle CDs"
BINDING_NAME_HEROROTATION_AOE = "Toggle AoE"
BINDING_NAME_HEROROTATION_TOGGLE = "Toggle On/Off"
BINDING_NAME_HEROROTATION_UNLOCK = "Unlock the addon to move icons"
BINDING_NAME_HEROROTATION_LOCK = "Lock the addon in place"
e.MainFrame = CreateFrame("Frame", "HeroRotation_MainFrame", UIParent)
e.MainFrame:SetFrameStrata(e.GUISettings.General.MainFrameStrata)
e.MainFrame:SetFrameLevel(10)
e.MainFrame:SetWidth(112)
e.MainFrame:SetHeight(96)
e.MainFrame:SetClampedToScreen(true)
function e.MainFrame:ResizeUI(t)
    local o = { { e.MainFrame, 112, 96 }, { e.MainIconFrame, 64, 64 }, { e.SmallIconFrame, 64, 32 }, { e.SmallIconFrame.Icon[1], e.GUISettings.General.BlackBorderIcon and 30 or 32, e.GUISettings.General.BlackBorderIcon and 30 or 32 }, { e.SmallIconFrame.Icon[2], e.GUISettings.General.BlackBorderIcon and 30 or 32, e.GUISettings.General.BlackBorderIcon and 30 or 32 }, { e.LeftIconFrame, 48, 48 }, { e.SuggestedIconFrame, 32, 32 }, { e.RightSuggestedIconFrame, 32, 32 }, { e.MainIconPartOverlayFrame, 64, 64 } }
    for a, e in a(o) do
        e[1]:SetWidth(e[2] * t)
        e[1]:SetHeight(e[3] * t)
    end

    for a = 1, e.MaxQueuedCasts do
        e.MainIconFrame.Part[a]:SetWidth(64 * t)
        e.MainIconFrame.Part[a]:SetHeight(64 * t)
    end

    e.SuggestedIconFrame:SetPoint("BOTTOM", e.MainIconFrame, "LEFT", -e.LeftIconFrame:GetWidth() / 2, e.LeftIconFrame:GetHeight() / 2 + (e.GUISettings.General.BlackBorderIcon and 3 * t or 4 * t))
    e.RightSuggestedIconFrame:SetPoint("BOTTOM", e.MainIconFrame, "RIGHT", e.LeftIconFrame:GetWidth() / 2, e.LeftIconFrame:GetHeight() / 2 + (e.GUISettings.General.BlackBorderIcon and 3 * t or 4 * t))
    HeroRotationDB.GUISettings["General.ScaleUI"] = t
end

function e.MainFrame:ResizeButtons(o)
    local t = { { e.ToggleIconFrame, 64, 20 }, { e.ToggleIconFrame.Button[1], 30, 20 }, { e.ToggleIconFrame.Button[2], 30, 20 }, { e.ToggleIconFrame.Button[3], 30, 20 }, { e.ToggleIconFrame.Button[4], 30, 20 }, { e.ToggleIconFrame.Button[5], 30, 20 }, { e.ToggleIconFrame.Button[6], 30, 20 } }
    for t, e in a(t) do
        e[1]:SetWidth(e[2] * o)
        e[1]:SetHeight(e[3] * o)
    end

    for t = 1, 6 do
        e.ToggleIconFrame.Button[t]:SetPoint("LEFT", e.ToggleIconFrame, "LEFT", e.ToggleIconFrame.Button[t]:GetWidth() * (t - 3.1) + t, 0)
    end

    HeroRotationDB.GUISettings["General.ScaleButtons"] = o
end

local t = y(18282)
function e.MainFrame:Unlock()
    e.ResetIcons()
    e.Cast(t)
    e.Cast(t, { true })
    e.Cast(t, { true })
    e.CastLeft(t)
    e.CastSuggested(t)
    e.CastRightSuggested(t)
    for a, t in a(d) do
        t:EnableMouse(true)
    end

    e.MainFrame:SetMovable(true)
    e.ToggleIconFrame:SetMovable(true)
    HeroRotationDB.Locked = false
end

function e.MainFrame:Lock()
    for a, t in a(d) do
        t:EnableMouse(false)
    end

    e.MainFrame:SetMovable(false)
    e.ToggleIconFrame:SetMovable(false)
    HeroRotationDB.Locked = true
end

function e.MainFrame:ToggleLock()
    if HeroRotationDB.Locked then
        e.MainFrame:Unlock()
        e.Print("HeroRotation UI is now |cff00ff00unlocked|r.")
    else
        e.MainFrame:Lock()
        e.Print("HeroRotation UI is now |cffff0000locked|r.")
    end

end

local function t(t)
    t:StartMoving()
end

e.MainFrame:SetScript("OnMouseDown", t)
local function m(n)
    n:StopMovingOrSizing()
    if not HeroRotationDB then
        HeroRotationDB = {  }
    end

    local o, a, h, s, i, t
    o, a, h, s, i = n:GetPoint()
    if not a then
        t = "UIParent"
    else
        t = a:GetName()
    end

    HeroRotationDB.IconFramePos = { o, t, h, s, i }
end

e.MainFrame:SetScript("OnMouseUp", m)
e.MainFrame:SetScript("OnHide", m)
e.MainFrame:RegisterEvent("ADDON_LOADED")
e.MainFrame:SetScript("OnEvent", function(h, t, i)
    if t == "ADDON_LOADED" then
        if i == "HeroRotation" then
            r = { ["Main Icon"] = e.MainIconFrame, ["Top Icons"] = e.SmallIconFrame, ["Left Icon"] = e.LeftIconFrame, ["Suggested Icon"] = e.SuggestedIconFrame, ["Right Suggested Icon"] = e.RightSuggestedIconFrame, ["Part Overlay"] = e.MainIconPartOverlayFrame }
            if not u then
                u = LibStub("Masque", true)
                if u then
                    u:Register("HeroRotation", v, e)
                    for e, t in a(r) do
                        s[t] = u:Group(p, e)
                    end

                end

            end

            if type(HeroRotationDB) ~= "table" then
                HeroRotationDB = {  }
            end

            if type(HeroRotationCharDB) ~= "table" then
                HeroRotationCharDB = {  }
            end

            if type(HeroRotationDB.GUISettings) ~= "table" then
                HeroRotationDB.GUISettings = {  }
            end

            if type(HeroRotationCharDB.GUISettings) ~= "table" then
                HeroRotationCharDB.GUISettings = {  }
            end

            e.GUI.LoadSettingsRecursively(e.GUISettings)
            e.GUI.CorePanelSettingsInit()
            if HeroRotationDB and type(HeroRotationDB.IconFramePos) == "table" and #HeroRotationDB.IconFramePos == 5 then
                e.MainFrame:SetPoint(HeroRotationDB.IconFramePos[1], _G[HeroRotationDB.IconFramePos[2]], HeroRotationDB.IconFramePos[3], HeroRotationDB.IconFramePos[4], HeroRotationDB.IconFramePos[5])
            else
                e.MainFrame:SetPoint("CENTER", UIParent, "CENTER", -200, 0)
            end

            e.MainFrame:SetFrameStrata(e.GUISettings.General.MainFrameStrata)
            e.MainFrame:Show()
            e.MainIconFrame:Init()
            e.SmallIconFrame:Init()
            e.LeftIconFrame:Init()
            e.SuggestedIconFrame:Init()
            e.RightSuggestedIconFrame:Init()
            e.ToggleIconFrame:Init()
            if HeroRotationDB.GUISettings["General.ScaleUI"] then
                e.MainFrame:ResizeUI(HeroRotationDB.GUISettings["General.ScaleUI"])
            end

            if HeroRotationDB.GUISettings["General.ScaleButtons"] then
                e.MainFrame:ResizeButtons(HeroRotationDB.GUISettings["General.ScaleButtons"])
            end

            for t, e in a(r) do
                if type(e.Icon) == "table" then
                    for t, e in a(e.Icon) do
                        e.GetNormalTexture = function(e)
                            return nil
                        end
                        e.SetNormalTexture = function(e, t)
                            e.Texture = t
                        end
                    end

                else
                    e.GetNormalTexture = function(e)
                        return nil
                    end
                    e.SetNormalTexture = function(t, e)
                        t.Texture = e
                    end
                end

            end

            if s then
                for e, t in a(s) do
                    if type(e.Icon) == "table" then
                        for a, e in a(e.Icon) do
                            if t then
                                t:AddButton(e, { Icon = e.Texture, Cooldown = (e.CooldownFrame or nil) })
                            end

                        end

                    else
                        if t then
                            t:AddButton(e, { Icon = e.Texture, Cooldown = e.CooldownFrame })
                        end

                    end

                end

                for t, e in a(s) do
                    if e then
                        e:ReSkin()
                    end

                end

            end

            d = { e.MainFrame, e.MainIconFrame, e.MainIconPartOverlayFrame, e.MainIconFrame.Part[1], e.MainIconFrame.Part[2], e.MainIconFrame.Part[3], e.SmallIconFrame, e.SmallIconFrame.Icon[1], e.SmallIconFrame.Icon[2], e.LeftIconFrame, e.SuggestedIconFrame, e.RightSuggestedIconFrame, e.ToggleIconFrame }
            local t = f.GetPanelByName("General")
            if t then
                o("Slider", t, "General.ScaleUI", { .5, 5, .1 }, "UI Scale", "Scale of the Icons.", function(t)
                    e.MainFrame:ResizeUI(t)
                end)
                o("Slider", t, "General.ScaleButtons", { .5, 5, .1 }, "Buttons Scale", "Scale of the Buttons.", function(t)
                    e.MainFrame:ResizeButtons(t)
                end)
                o("Slider", t, "General.ScaleHotkey", { .5, 5, .1 }, "Hotkey Scale", "Scale of the Hotkeys.")
                o("Slider", t, "General.SetAlpha", { 0, 1, .05 }, "Addon Alpha", "Change the addon's alpha setting.")
                o("Button", t, "ButtonMove", "Lock/Unlock", "Enable the moving of the frames.", function()
                    e.MainFrame:ToggleLock()
                end)
                o("Button", t, "ButtonReset", "Reset Buttons", "Resets the anchor of buttons.", function()
                    e.ToggleIconFrame:ResetAnchor()
                end)
                o("Button", t, "button.", "Toggle MiniMap Icon", "Toggle show/hide the minimap icon", function()
                    n.General.MiniMap = not n.General.MiniMap
                    HideMiniMapHR()
                end)
                t["General.ScaleUI"]:SetPoint("TOPLEFT", 225, -140)
            end

            C_Timer.After(2, function()
                e.MainFrame:UnregisterEvent("ADDON_LOADED")
                e.PulsePreInit()
                e.PulseInit()
            end)
        end

    end

end)
function e.PulsePreInit()
    e.MainFrame:Lock()
end

local u = { [250] = "HeroRotation_DeathKnight", [251] = "HeroRotation_DeathKnight", [252] = "HeroRotation_DeathKnight", [577] = "HeroRotation_DemonHunter", [581] = "HeroRotation_DemonHunter", [102] = "HeroRotation_Druid", [103] = "HeroRotation_Druid", [104] = "HeroRotation_Druid", [105] = "HeroRotation_Druid", [253] = "HeroRotation_Hunter", [254] = "HeroRotation_Hunter", [255] = "HeroRotation_Hunter", [62] = "HeroRotation_Mage", [63] = "HeroRotation_Mage", [64] = "HeroRotation_Mage", [268] = "HeroRotation_Monk", [269] = "HeroRotation_Monk", [270] = "HeroRotation_Monk", [65] = "HeroRotation_Paladin", [66] = "HeroRotation_Paladin", [70] = "HeroRotation_Paladin", [256] = "HeroRotation_Priest", [257] = "HeroRotation_Priest", [258] = "HeroRotation_Priest", [259] = "HeroRotation_Rogue", [260] = "HeroRotation_Rogue", [261] = "HeroRotation_Rogue", [262] = "HeroRotation_Shaman", [263] = "HeroRotation_Shaman", [264] = "HeroRotation_Shaman", [265] = "HeroRotation_Warlock", [266] = "HeroRotation_Warlock", [267] = "HeroRotation_Warlock", [71] = "HeroRotation_Warrior", [72] = "HeroRotation_Warrior", [73] = "HeroRotation_Warrior" }
local m = 0
local r = GetTime()
local o = 0
function e.PulseInit()
    e.CoreInit()
    local t = GetSpecialization()
    if t == nil then
        i.PulseInitialized = false
        C_Timer.After(1, function()
            e.PulseInit()
        end)
    else
        c.Persistent.Player.Spec = { GetSpecializationInfo(t) }
        local t = c.Persistent.Player.Spec[1]
        if t == nil then
            i.PulseInitialized = false
            C_Timer.After(1, function()
                e.PulseInit()
            end)
        else
            if u[t] and not IsAddOnLoaded(u[t]) then
                LoadAddOn(u[t])
                i.LoadOverrides(t)
            end

            if m ~= t then
                if u[t] and e.APLs[t] then
                    for a, t in a(d) do
                        t:Show()
                    end

                    e.MainFrame:SetScript("OnUpdate", e.Pulse)
                    l:RegisterListenedSpells(t)
                    i.UnregisterAuraTracking()
                    l:FilterTriggerGCD(t)
                    y:FilterProjectileSpeed(t)
                    if e.APLInits[t] then
                        e.APLInits[t]()
                    end

                    if GetCVar("nameplateShowEnemies") ~= "1" then
                        e.Print("It looks like enemy nameplates are disabled, you should enable them in order to get proper AoE rotation.")
                    end

                else
                    e.Print("No Rotation found for this class/spec (SpecID: " .. t .. "), addon disabled. This is likely due to the rotation being unsupported at this time. Please check supported rotations here: https://github.com/herotc/hero-rotation#supported-rotations")
                    for a, t in a(d) do
                        t:Hide()
                    end

                    e.MainFrame:SetScript("OnUpdate", nil)
                end

                m = t
            end

            if not i.PulseInitialized then
                i.PulseInitialized = true
            end

        end

    end

end

e.Timer = { Pulse = 0 }
function e.Pulse()
    if not n.General.AdaptivePerformance then
        o = n.General.TickRate
    else
        local e = GetFramerate()
        if GetTime() > r + 2 then
            if n.General.TargetFrames - e >= 0 then
                if o + n.General.TargetFrames - e >= 250 then
                    o = 250
                    r = GetTime()
                else
                    o = o + n.General.TargetFrames - e
                    r = GetTime()
                end

            else
                if o + n.General.TargetFrames - e <= 0 then
                    o = 0
                    r = GetTime()
                else
                    o = o + n.General.TargetFrames - e
                    r = GetTime()
                end

            end

        end

    end

    if GetTime() > e.Timer.Pulse and e.Locked() then
        e.Timer.Pulse = GetTime() + .066 + o / 1000
        e.ResetIcons()
        local t = c.Persistent.Player.Spec[1]
        if t then
            if e.ON() and e.Ready() then
                i.CacheHasBeenReset = false
                c.Reset()
                if e.GUISettings.General.RotationDebugOutput then
                    h = e.APLs[t]()
                    if h and h ~= w and h ~= "Slice and Dice" then
                        e.Print(h)
                        w = h
                    end

                else
                    e.APLs[t]()
                end

            end

            if s then
                for t, e in a(s) do
                    if e then
                        e:ReSkin()
                    end

                end

            end

        end

    end

end

function e.Ready()
    return not l:IsDeadOrGhost() and not l:IsMounted() and not l:IsInVehicle() and not C_PetBattles.IsInBattle()
end

function e.ChangePulseTimer(t)
    e.ResetIcons()
    e.Timer.Pulse = GetTime() + t
end

TickTimeCustom = function()
    if o then
        return o
    else
        return 0
    end

end

