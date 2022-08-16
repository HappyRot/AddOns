local e, e = ...
local t = HeroRotation
local e = HeroLib
local e = e.GUI
local s = e.CreateChildPanel
local e = e.CreatePanelOption
local a = t.GUI.CreateARPanelOption
local n = t.GUI.CreateARPanelOptions
t.GUISettings.APL.DeathKnight = { Commons = { UseDefensives = true, HealthstoneHP = 50, HealPotHP = 0, PhialHP = 0, UseDeathStrikeHP = 60, UseDarkSuccorHP = 80, IceboundFortitudeHP = 30, LichborneHP = 30, AntiMagicShellHP = 40, DeathPactHP = 40, Enabled = { Potions = true, TopTrinket = true, BottomTrinket = true, Racials = true }, DisplayStyle = {  } }, Blood = { RuneTapThreshold = 65, IceboundFortitudeThreshold = 30, VampiricBloodThreshold = 50, BonestormPower = 50, TopTrinketHP = 0, BotTrinketHP = 0, MinimumRP = 0, DisplayStyle = {  }, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Frost = { DisableBoSPooling = false, TargetSwap = "AutoSwap", CastCancelFC = true, MinimumBoS = 60, DisplayStyle = {  }, GCDasOffGCD = {  } }, Unholy = { DisableAotD = HeroRotationCharDB.Toggles[10], SacPacHP = 30, TargetSwap = "AutoSwap", GCDasOffGCD = {  }, UHCooldowns = 0, IncludedCooldowns = { Apocalypse = false, DarkTransformation = false, ArmyoftheDead = true, UnholyBlight = false, SacrificalPact = true }, UHSmallCooldowns = 0, IncludedSmallCooldowns = { Apocalypse = true, DarkTransformation = true, ArmyoftheDead = false, UnholyBlight = true, SacrificalPact = false } } }
t.GUI.LoadSettingsRecursively(t.GUISettings)
local t = t.GUI.Panel
local a = s(t, "DeathKnight")
local o = s(a, "Blood")
local i = s(a, "Frost")
local t = s(a, "Unholy")
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
n(a, "APL.DeathKnight.Commons")
e("Slider", o, "APL.DeathKnight.Blood.RuneTapThreshold", { 5, 100, 5 }, "Rune Tap Health Threshold", "Suggest Rune Tap when below this health percentage.")
e("Slider", o, "APL.DeathKnight.Blood.IceboundFortitudeThreshold", { 5, 100, 5 }, "Icebound Fortitude Health Threshold", "Suggest Icebound Fortitude when below this health percentage.")
e("Slider", o, "APL.DeathKnight.Blood.VampiricBloodThreshold", { 5, 100, 5 }, "Vampiric Blood Health Threshold", "Suggest Vampiric Blood when below this health percentage.")
e("Slider", o, "APL.DeathKnight.Blood.BonestormPower", { 5, 100, 1 }, "Bonestorm RP Threshold", "Minumum RP to store before using Bonestorm")
e("Slider", o, "APL.DeathKnight.Blood.TopTrinketHP", { 0, 100, 1 }, "Top Trinket Defensive Threshold", "Set the HP percentage threshold of when to use Top Trinket. Set to 0 if not defensive")
e("Slider", o, "APL.DeathKnight.Blood.BotTrinketHP", { 0, 100, 1 }, "Bottom Trinket Defensive Threshold", "Set the HP percentage threshold of when to use Bottom Trinket. Set to 0 if not defensive")
e("Slider", o, "APL.DeathKnight.Blood.MinimumRP", { 0, 100, 1 }, "Minimum RP to hold", "Set the Minumum RP to save for Defensives")
n(o, "APL.DeathKnight.Blood")
e("Dropdown", i, "APL.DeathKnight.Frost.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("CheckButton", i, "APL.DeathKnight.Frost.DisableBoSPooling", "Disable BoS Pooling", "Enable this option to bypass the BoS Pooling function.")
e("Slider", i, "APL.DeathKnight.Frost.MinimumBoS", { 0, 100, 1 }, "Minimum RP for Bos", "Set the Minumum RP required before using BoS")
e("CheckButton", i, "APL.DeathKnight.Frost.CastCancelFC", "Cancel-Cast Fleshcraft", "Cancel-Cast Fleshcraft to keep the Volatile Solvent/Pustule Eruption buff.")
n(i, "APL.DeathKnight.Frost")
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
n(t, "APL.DeathKnight.Unholy")

