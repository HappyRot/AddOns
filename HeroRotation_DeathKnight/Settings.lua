local e, e = ...
local i = HeroRotation
local e = HeroLib
local e = e.GUI
local h = e.CreateChildPanel
local e = e.CreatePanelOption
local t = i.GUI.CreateARPanelOption
local s = i.GUI.CreateARPanelOptions
i.GUISettings.APL.DeathKnight = { Commons = { UseDefensives = true, HealthstoneHP = 50, HealPotHP = 0, PhialHP = 0, UseDeathStrikeHP = 60, UseDarkSuccorHP = 80, IceboundFortitudeHP = 30, LichborneHP = 30, AntiMagicShellHP = 40, DeathPactHP = 40, Enabled = { Potions = true, TopTrinket = true, BottomTrinket = true, Racials = true }, DisplayStyle = {  } }, Blood = { RuneTapThreshold = 65, IceboundFortitudeThreshold = 30, VampiricBloodThreshold = 50, BonestormPower = 50, TopTrinketHP = 0, BotTrinketHP = 0, MinimumRP = 0, DefensiveList = "This is not currently functional!!!//n123 , 456", DisplayStyle = {  }, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Frost = { DisableBoSPooling = false, TargetSwap = "AutoSwap", CastCancelFC = true, MinimumBoS = 60, DisplayStyle = {  }, GCDasOffGCD = {  } }, Unholy = { DisableAotD = HeroRotationCharDB.Toggles[10], SacPacHP = 30, TargetSwap = "AutoSwap", GCDasOffGCD = {  }, UHCooldowns = 0, IncludedCooldowns = { Apocalypse = false, DarkTransformation = false, ArmyoftheDead = true, UnholyBlight = false, SacrificalPact = true }, UHSmallCooldowns = 0, IncludedSmallCooldowns = { Apocalypse = true, DarkTransformation = true, ArmyoftheDead = false, UnholyBlight = true, SacrificalPact = false } } }
function KethoEditBox_Show(n)
    if not KethoEditBox then
        local e = CreateFrame("Frame", "KethoEditBox", UIParent, "DialogBoxFrame")
        e:SetPoint("CENTER")
        e:SetSize(600, 500)
        e:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", edgeSize = 16, insets = { left = 8, right = 6, top = 8, bottom = 8 } })
        e:SetBackdropBorderColor(0, .44, .87, .5)
        e:SetMovable(true)
        e:SetClampedToScreen(true)
        e:SetScript("OnMouseDown", function(t, e)
            if e == "LeftButton" then
                t:StartMoving()
            end

        end)
        e:SetScript("OnMouseUp", e.StopMovingOrSizing)
        local o = CreateFrame("ScrollFrame", "KethoEditBoxScrollFrame", KethoEditBox, "UIPanelScrollFrameTemplate")
        o:SetPoint("LEFT", 16, 0)
        o:SetPoint("RIGHT", -32, 0)
        o:SetPoint("TOP", 0, -16)
        o:SetPoint("BOTTOM", KethoEditBoxButton, "TOP", 0, 0)
        local a = CreateFrame("EditBox", "KethoEditBoxEditBox", KethoEditBoxScrollFrame)
        a:SetSize(o:GetSize())
        a:SetMultiLine(true)
        a:SetAutoFocus(false)
        a:SetFontObject("ChatFontNormal")
        a:SetScript("OnEscapePressed", function()
            print("123")
            e:Hide()
        end)
        o:SetScrollChild(a)
        e:SetResizable(true)
        e:SetMinResize(150, 100)
        local t = CreateFrame("Button", "KethoEditBoxResizeButton", KethoEditBox)
        t:SetPoint("BOTTOMRIGHT", -6, 7)
        t:SetSize(16, 16)
        t:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
        t:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
        t:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
        t:SetScript("OnMouseDown", function(a, t)
            if t == "LeftButton" then
                e:StartSizing("BOTTOMRIGHT")
                a:GetHighlightTexture():Hide()
            end

        end)
        t:SetScript("OnMouseUp", function(t, i)
            e:StopMovingOrSizing()
            t:GetHighlightTexture():Show()
            a:SetWidth(o:GetWidth())
        end)
    end

    if n then
        KethoEditBoxEditBox:SetText(n)
    end

    KethoEditBoxButton:HookScript("OnClick", function(e)
        DefensiveSpellIDs = KethoEditBoxEditBox:GetText()
    end)
    KethoEditBox:Show()
end

i.GUI.LoadSettingsRecursively(i.GUISettings)
local t = i.GUI.Panel
local a = h(t, "DeathKnight")
local o = h(a, "Blood")
local n = h(a, "Frost")
local t = h(a, "Unholy")
e("CheckButton", a, "APL.DeathKnight.Commons.UseDefensives", "Use Defensives", "Toggle on to show Defensive Abilities")
e("Slider", a, "APL.DeathKnight.Commons.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP %", "Set the HP threshold to use Healthstone")
e("Slider", a, "APL.DeathKnight.Commons.HealPotHP", { 0, 100, 0 }, "Healing Potion HP %", "Set the HP threshold to use Healing Potion")
e("Slider", a, "APL.DeathKnight.Commons.PhialHP", { 0, 100, 0 }, "Phial of Serenity HP %", "Set the HP threshold to use Phial of Serenity")
e("Slider", a, "APL.DeathKnight.Commons.UseDeathStrikeHP", { 0, 100, 1 }, "Death Strike HP %", "Set the HP threshold to use Death Strike")
e("Slider", a, "APL.DeathKnight.Commons.UseDarkSuccorHP", { 0, 100, 1 }, "Death Strike w/ Dark Succor HP %", "Set the HP threshold to use Death Strike to Consume Dark Succor")
e("Slider", a, "APL.DeathKnight.Commons.IceboundFortitudeHP", { 0, 100, 1 }, "Icebound Fortitude HP %", "Set the HP threshold to use Icebound Fortitude")
e("Slider", a, "APL.DeathKnight.Commons.LichborneHP", { 0, 100, 1 }, "Lichborne HP %", "Set the HP threshold to use Lichborne")
e("Slider", a, "APL.DeathKnight.Commons.AntiMagicShellHP", { 0, 100, 1 }, "Anti-Magic Shell HP %", "Set the HP threshold to use Anti-Magic Shell")
e("Slider", a, "APL.DeathKnight.Commons.DeathPactHP", { 0, 100, 1 }, "Death Pact HP %", "Set the HP threshold to use Death Pact")
s(a, "APL.DeathKnight.Commons")
e("Button", o, "DefensiveList", "Boss Defensive List", "Opens the list of defensive spells for editing", function()
    KethoEditBox_Show(i.GUISettings.APL.DeathKnight.Blood.DefensiveList)
end)
e("Slider", o, "APL.DeathKnight.Blood.RuneTapThreshold", { 5, 100, 5 }, "Rune Tap Health Threshold", "Suggest Rune Tap when below this health percentage.")
e("Slider", o, "APL.DeathKnight.Blood.IceboundFortitudeThreshold", { 5, 100, 5 }, "Icebound Fortitude Health Threshold", "Suggest Icebound Fortitude when below this health percentage.")
e("Slider", o, "APL.DeathKnight.Blood.VampiricBloodThreshold", { 5, 100, 5 }, "Vampiric Blood Health Threshold", "Suggest Vampiric Blood when below this health percentage.")
e("Slider", o, "APL.DeathKnight.Blood.BonestormPower", { 5, 100, 1 }, "Bonestorm RP Threshold", "Minumum RP to store before using Bonestorm")
e("Slider", o, "APL.DeathKnight.Blood.TopTrinketHP", { 0, 100, 1 }, "Top Trinket Defensive Threshold", "Set the HP percentage threshold of when to use Top Trinket. Set to 0 if not defensive")
e("Slider", o, "APL.DeathKnight.Blood.BotTrinketHP", { 0, 100, 1 }, "Bottom Trinket Defensive Threshold", "Set the HP percentage threshold of when to use Bottom Trinket. Set to 0 if not defensive")
e("Slider", o, "APL.DeathKnight.Blood.MinimumRP", { 0, 100, 1 }, "Minimum RP to hold", "Set the Minumum RP to save for Defensives")
s(o, "APL.DeathKnight.Blood")
e("Dropdown", n, "APL.DeathKnight.Frost.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("CheckButton", n, "APL.DeathKnight.Frost.DisableBoSPooling", "Disable BoS Pooling", "Enable this option to bypass the BoS Pooling function.")
e("Slider", n, "APL.DeathKnight.Frost.MinimumBoS", { 0, 100, 1 }, "Minimum RP for Bos", "Set the Minumum RP required before using BoS")
e("CheckButton", n, "APL.DeathKnight.Frost.CastCancelFC", "Cancel-Cast Fleshcraft", "Cancel-Cast Fleshcraft to keep the Volatile Solvent/Pustule Eruption buff.")
s(n, "APL.DeathKnight.Frost")
e("CheckButton", t, "APL.DeathKnight.Unholy.DisableAotD", "Disable AotD", "Disable Army of the Dead suggestions.")
e("Slider", t, "APL.DeathKnight.Unholy.SacPacHP", { 0, 100, 1 }, "Sac Pac HP %", "Set the HP threshold to use Sacrifical Pact")
e("Dropdown", t, "APL.DeathKnight.Unholy.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("Slider", t, "APL.DeathKnight.Unholy.UHCooldowns", { 0, 0, 0 }, "--Spells to include in Cooldowns--", "This slider does nothing, select spells below")
e("CheckButton", t, "APL.DeathKnight.Unholy.IncludedCooldowns.Apocalypse", "Apocalypse", "Include Apocalypse in Cooldowns")
e("CheckButton", t, "APL.DeathKnight.Unholy.IncludedCooldowns.DarkTransformation", "Dark Transformation", "Include Dark Transformation in Cooldowns")
e("CheckButton", t, "APL.DeathKnight.Unholy.IncludedCooldowns.ArmyoftheDead", "Army of the Dead", "Include Army of the Dead in Cooldowns")
e("CheckButton", t, "APL.DeathKnight.Unholy.IncludedCooldowns.UnholyBlight", "Unholy Blight", "Include Unholy Blight in Cooldowns")
e("CheckButton", t, "APL.DeathKnight.Unholy.IncludedCooldowns.SacrificalPact", "Sacrifical Pact", "Include Sacrifical Pact in Cooldowns")
e("Slider", t, "APL.DeathKnight.Unholy.UHSmallCooldowns", { 0, 0, 0 }, "--Spells to include in SmallCooldowns--", "This slider does nothing, select spells below")
e("CheckButton", t, "APL.DeathKnight.Unholy.IncludedSmallCooldowns.Apocalypse", "Apocalypse", "Include Apocalypse in SmallCooldowns")
e("CheckButton", t, "APL.DeathKnight.Unholy.IncludedSmallCooldowns.DarkTransformation", "Dark Transformation", "Include Dark Transformation in SmallCooldowns")
e("CheckButton", t, "APL.DeathKnight.Unholy.IncludedSmallCooldowns.ArmyoftheDead", "Army of the Dead", "Include Army of the Dead in SmallCooldowns")
e("CheckButton", t, "APL.DeathKnight.Unholy.IncludedSmallCooldowns.UnholyBlight", "Unholy Blight", "Include Unholy Blight in SmallCooldowns")
e("CheckButton", t, "APL.DeathKnight.Unholy.IncludedSmallCooldowns.SacrificalPact", "Sacrifical Pact", "Include Sacrifical Pact in SmallCooldowns")
s(t, "APL.DeathKnight.Unholy")

