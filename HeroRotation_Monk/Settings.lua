local e, e = ...
local t = HeroRotation
local e = HeroLib
local e = e.GUI
local i = e.CreateChildPanel
local e = e.CreatePanelOption
local a = t.GUI.CreateARPanelOption
local n = t.GUI.CreateARPanelOptions
t.GUISettings.APL.Monk = { Commons = { UseDefensives = true, HealthstoneHP = 50, HealPotHP = 0, PhialHP = 60, FortifyingBrew = 20, TouchofKarma = 0, Enabled = { Potions = false, TopTrinket = true, BottomTrinket = true }, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Brewmaster = { NoBrewmasterPooling = false, ShowCelestialBrewCD = true, ShowDampenHarmCD = true, Purify = { Enabled = true, Low = true, Medium = true, High = true }, GCDasOffGCD = { CelestialBrew = true, DampenHarm = true, FortifyingBrew = true, InvokeNiuzaoTheBlackOx = true, TouchOfDeath = true }, OffGCDasOffGCD = { BlackOxBrew = true, PurifyingBrew = true } }, Windwalker = { TargetSwap = "Mouseover", ShowFortifyingBrewCD = false, IgnoreFSK = true, PoolBeforeBurst = false, ToDExecute = false, SEFEcoCharge = 1.75, CastCancelFC = true, GCDasOffGCD = {  }, OffGCDasOffGCD = {  }, UHCooldowns = 0, IncludedCooldowns = { Xuen = true, SEFFull = true, SEFEco = false }, UHSmallCooldowns = 0, IncludedSmallCooldowns = { Xuen = false, SEFFull = false, SEFEco = true } }, Mistweaver = { ShowFortifyingBrewCD = false, NoMistweaverPooling = false, GCDasOffGCD = { InvokeYulonTheJadeSerpent = true, InvokeChiJiTheRedCrane = true, SummonJadeSerpentStatue = true, RenewingMist = true, TouchOfDeath = true, FortifyingBrew = true }, OffGCDasOffGCD = { ThunderFocusTea = true } } }
t.GUI.LoadSettingsRecursively(t.GUISettings)
local t = t.GUI.Panel
local a = i(t, "Monk")
local t = i(a, "Windwalker")
local o = i(a, "Brewmaster")
local i = i(a, "Mistweaver")
n(a, "APL.Monk.Commons")
e("Slider", a, "APL.Monk.Commons.FortifyingBrew", { 0, 100, 1 }, "Fortifying Brew HP %", "Set the HP threshold to use Fortifying Brew")
e("Slider", a, "APL.Monk.Commons.TouchofKarma", { 0, 100, 1 }, "TouchofKarma HP %", "Set the HP threshold to use Touch of Karma")
e("Slider", a, "APL.Monk.Commons.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP %", "Set the HP threshold to use Healthstone")
e("Slider", a, "APL.Monk.Commons.HealPotHP", { 0, 100, 1 }, "Healing Potion HP %", "Set the HP threshold to use Healing Potion")
e("Slider", a, "APL.Monk.Commons.PhialHP", { 0, 100, 1 }, "Phial of Serenity HP %", "Set the HP threshold to use Phial of Serenity")
n(t, "APL.Monk.Windwalker")
e("Dropdown", t, "APL.Monk.Windwalker.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("CheckButton", t, "APL.Monk.Windwalker.IgnoreFSK", "Ignore Flying Serpent Kick", "Enable this setting to allow you to ignore Flying Serpent Kick without stalling the rotation. (NOTE: Flying Serpent Kick will never be suggested if this is enabled)")
e("CheckButton", t, "APL.Monk.Windwalker.PoolBeforeBurst", "Pool Before Burst", "Enable this to pool chi before bursting for AoE")
e("CheckButton", t, "APL.Monk.Windwalker.ToDExecute", "ToD Execute Only", "only Use ToD to Execute the target")
e("Slider", t, "APL.Monk.Windwalker.SEFEcoCharge", { 1, 2, .1 }, "SEF Eco Charges", "Set the Storm, Earth and Fire Eco Charge threshold.")
e("Slider", t, "APL.Monk.Windwalker.UHCooldowns", { 0, 0, 0 }, "--Spells to include in Cooldowns--", "This slider does nothing, select spells below")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedCooldowns.Xuen", "Invoke Xuen", "Include Invoke Xuen in Cooldowns")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedCooldowns.SEFFull", "Storm, Earth and Fire Full", "Use all SEF charges in Cooldowns")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedCooldowns.SEFEco", "Storm, Earth and Fire Eco Mode", "Use only SEF Eco charges in Cooldowns")
e("Slider", t, "APL.Monk.Windwalker.UHSmallCooldowns", { 0, 0, 0 }, "--Spells to include in SmallCooldowns--", "This slider does nothing, select spells below")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedSmallCooldowns.Xuen", "Invoke Xuen", "Include Invoke Xuen in Small Cooldowns")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedSmallCooldowns.SEFFull", "Storm, Earth and Fire Full", "Use all SEF charges in Small Cooldowns")
e("CheckButton", t, "APL.Monk.Windwalker.IncludedSmallCooldowns.SEFEco", "Storm, Earth and Fire Eco", "Use SEF Eco charges in Small Cooldowns")
n(o, "APL.Monk.Brewmaster")
e("CheckButton", o, "APL.Monk.Brewmaster.NoBrewmasterPooling", "No Pooling", "If you want to ignore energy pooling.")
e("CheckButton", o, "APL.Monk.Brewmaster.ShowCelestialBrewCD", "Celestial Brew", "Enable or disable Celestial Brew recommendations.")
e("CheckButton", o, "APL.Monk.Brewmaster.ShowDampenHarmCD", "Dampen Harm", "Enable or disable Dampen Harmrecommendations.")
e("CheckButton", o, "APL.Monk.Brewmaster.Purify.Enabled", "Purify", "Enable or disable Purify recommendations.")
n(i, "APL.Monk.Mistweaver")

