local t, e = ...
local t = HeroLib
local t = t.GUI
local o = t.CreatePanel
local a = t.CreateChildPanel
local t = t.CreatePanelOption
e.GUISettings = { General = { MainFrameStrata = "BACKGROUND", NamePlateIconAnchor = "Clickable Area", BlackBorderIcon = false, HideKeyBinds = false, SoloMode = false, HideToggleIcons = false, NotEnoughManaEnabled = false, RotationDebugOutput = false, OpenerReset = 0, ScaleUI = 1, ScaleButtons = 1.1, ScaleHotkey = 1, SetAlpha = 1, TickRate = 0, HoldPotforBL = false, SilentMode = false, MiniMap = true, AdaptivePerformance = true, TargetFrames = 60 }, APL = {  } }
function e.GUI.CorePanelSettingsInit()
    local e = o(e.GUI, "HeroRotation", "PanelFrame", e.GUISettings, HeroRotationDB.GUISettings)
    local e = a(e, "General")
    t("Dropdown", e, "General.MainFrameStrata", { "HIGH", "MEDIUM", "LOW", "BACKGROUND" }, "Main Frame Strata", "Choose the frame strata to use for icons.", { ReloadRequired = true })
    t("Dropdown", e, "General.NamePlateIconAnchor", { "Clickable Area", "Life Bar", "Disable" }, "Nameplate Icon Anchor", "Choose the frame to anchor the Nameplate icon to (or disable it).", { ReloadRequired = true })
    t("CheckButton", e, "General.BlackBorderIcon", "Black Border Icon", "Enable if you want clean black borders icons.", { ReloadRequired = true })
    t("CheckButton", e, "General.HideKeyBinds", "Hide Keybinds", "Enable if you want to hide the keybind on the icons.")
    t("CheckButton", e, "General.SoloMode", "Solo Mode", "Enable if you want to try to maximize survivability at the cost of dps.")
    t("CheckButton", e, "General.HideToggleIcons", "Hide toggle icons", "Enable if you want to hide the toggle buttons on the icon frame.", { ReloadRequired = true })
    t("CheckButton", e, "General.NotEnoughManaEnabled", "Not enough mana/energy", "Enable if you want a faded icon when you have not enough mana or energy.")
    t("CheckButton", e, "General.RotationDebugOutput", "Debug Output", "DEBUG: Enable if you want output rotation selection as text for debugging purposes.")
    t("CheckButton", e, "General.HoldPotforBL", "Hold Pot for BL", "Hold pot until we bloodlust?")
    t("CheckButton", e, "General.SilentMode", "Silent Mode", "Enable if you want to remove the prints from the chat window")
    t("Slider", e, "General.OpenerReset", { 0, 10, 1 }, "Opener Macro Reset", "Time before the Opener macro will reset to off (set to 0 to keep it on forever).")
    t("Slider", e, "General.TickRate", { 0, 250, 5 }, "Refresh Rate", "Addon Refresh Rate in ms.\n0 = refresh with every frame\nIncrease this number if you experience frame drops")
    e["General.OpenerReset"]:SetPoint("TOPLEFT", 225, -30)
    t("CheckButton", e, "General.AdaptivePerformance", "Adaptive Performance", "Enable to have the Refresh Rate automatically adjusted to reach your target frames")
    t("Slider", e, "General.TargetFrames", { 0, 200, 5 }, "Target Frames", "Target Frames to hit when using Adaptive Performance")
    e["General.AdaptivePerformance"]:SetPoint("TOPLEFT", 440, -20)
end


