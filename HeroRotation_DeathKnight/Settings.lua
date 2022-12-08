local e, e = ...
local o = HeroRotation
local e = HeroLib
local e = e.GUI
local n = e.CreateChildPanel
local e = e.CreatePanelOption
local t = o.GUI.CreateARPanelOption
local i = o.GUI.CreateARPanelOptions
o.GUISettings.APL.DeathKnight = { Commons = { UseDefensives = true, HealthstoneHP = 50, HealPotHP = 0, PhialHP = 0, UseDeathStrikeHP = 60, UseDarkSuccorHP = 80, IceboundFortitudeHP = 30, LichborneHP = 30, AntiMagicShellHP = 40, DeathPactHP = 40, Enabled = { Potions = true, TopTrinket = true, BottomTrinket = true, Racials = true, Items = true }, DisplayStyle = {  } }, Blood = { RuneTapThreshold = 65, IceboundFortitudeThreshold = 30, VampiricBloodThreshold = 50, BonestormPower = 50, TopTrinketHP = 0, BotTrinketHP = 0, MinimumRP = 0, UseAbomLimbDefensive = false, DefensiveList = "This is not currently functional!!!//n123 , 456", PotionType = { Selected = "Power" }, DisplayStyle = {  }, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Frost = { TargetSwap = "AutoSwap", PotionType = { Selected = "Power" }, MinimumBoS = 60, DisplayStyle = {  }, GCDasOffGCD = {  } }, Unholy = { DisableAotD = HeroRotationCharDB.Toggles[10], PotionType = { Selected = "Power" }, SacPacHP = 30, TargetSwap = "AutoSwap", GCDasOffGCD = {  } } }
o.GUI.LoadSettingsRecursively(o.GUISettings)
local t = o.GUI.Panel
local t = n(t, "DeathKnight")
local a = n(t, "Blood")
local s = n(t, "Frost")
local n = n(t, "Unholy")
e("CheckButton", t, "APL.DeathKnight.Commons.UseDefensives", "Use Defensives", "Toggle on to show Defensive Abilities")
e("Slider", t, "APL.DeathKnight.Commons.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP %", "Set the HP threshold to use Healthstone")
e("Slider", t, "APL.DeathKnight.Commons.HealPotHP", { 0, 100, 0 }, "Healing Potion HP %", "Set the HP threshold to use Healing Potion")
e("Slider", t, "APL.DeathKnight.Commons.PhialHP", { 0, 100, 0 }, "Phial of Serenity HP %", "Set the HP threshold to use Phial of Serenity")
e("Slider", t, "APL.DeathKnight.Commons.UseDeathStrikeHP", { 0, 100, 1 }, "Death Strike HP %", "Set the HP threshold to use Death Strike")
e("Slider", t, "APL.DeathKnight.Commons.UseDarkSuccorHP", { 0, 100, 1 }, "Death Strike w/ Dark Succor HP %", "Set the HP threshold to use Death Strike to Consume Dark Succor")
e("Slider", t, "APL.DeathKnight.Commons.IceboundFortitudeHP", { 0, 100, 1 }, "Icebound Fortitude HP %", "Set the HP threshold to use Icebound Fortitude")
e("Slider", t, "APL.DeathKnight.Commons.LichborneHP", { 0, 100, 1 }, "Lichborne HP %", "Set the HP threshold to use Lichborne")
e("Slider", t, "APL.DeathKnight.Commons.AntiMagicShellHP", { 0, 100, 1 }, "Anti-Magic Shell HP %", "Set the HP threshold to use Anti-Magic Shell")
e("Slider", t, "APL.DeathKnight.Commons.DeathPactHP", { 0, 100, 1 }, "Death Pact HP %", "Set the HP threshold to use Death Pact")
i(t, "APL.DeathKnight.Commons")
e("Button", a, "DefensiveList", "Boss Defensive List", "Opens the list of defensive spells for editing", function()
    KethoEditBox_Show(o.GUISettings.APL.DeathKnight.Blood.DefensiveList)
end)
e("Slider", a, "APL.DeathKnight.Blood.RuneTapThreshold", { 5, 100, 5 }, "Rune Tap Health Threshold", "Suggest Rune Tap when below this health percentage.")
e("Slider", a, "APL.DeathKnight.Blood.IceboundFortitudeThreshold", { 5, 100, 5 }, "Icebound Fortitude Health Threshold", "Suggest Icebound Fortitude when below this health percentage.")
e("Slider", a, "APL.DeathKnight.Blood.VampiricBloodThreshold", { 5, 100, 5 }, "Vampiric Blood Health Threshold", "Suggest Vampiric Blood when below this health percentage.")
e("Slider", a, "APL.DeathKnight.Blood.BonestormPower", { 5, 100, 1 }, "Bonestorm RP Threshold", "Minumum RP to store before using Bonestorm")
e("Slider", a, "APL.DeathKnight.Blood.TopTrinketHP", { 0, 100, 1 }, "Top Trinket Defensive Threshold", "Set the HP percentage threshold of when to use Top Trinket. Set to 0 if not defensive")
e("Slider", a, "APL.DeathKnight.Blood.BotTrinketHP", { 0, 100, 1 }, "Bottom Trinket Defensive Threshold", "Set the HP percentage threshold of when to use Bottom Trinket. Set to 0 if not defensive")
e("Slider", a, "APL.DeathKnight.Blood.MinimumRP", { 0, 100, 1 }, "Minimum RP to hold", "Set the Minumum RP to save for Defensives")
e("CheckButton", a, "APL.DeathKnight.Blood.UseAbomLimbDefensive", "Use Abomination Limb for Defense", "Will use Abomination Limb to regen Boneshield instead of using for DPS")
i(a, "APL.DeathKnight.Blood")
e("Dropdown", s, "APL.DeathKnight.Frost.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("Slider", s, "APL.DeathKnight.Frost.MinimumBoS", { 0, 100, 1 }, "Minimum RP for Bos", "Set the Minumum RP required before using BoS")
i(s, "APL.DeathKnight.Frost")
e("CheckButton", n, "APL.DeathKnight.Unholy.DisableAotD", "Disable AotD", "Disable Army of the Dead suggestions.")
e("Slider", n, "APL.DeathKnight.Unholy.SacPacHP", { 0, 100, 1 }, "Sac Pac HP %", "Set the HP threshold to use Sacrifical Pact")
e("Dropdown", n, "APL.DeathKnight.Unholy.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
i(n, "APL.DeathKnight.Unholy")

