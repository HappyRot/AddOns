local e, e = ...
local t = HeroRotation
local e = HeroLib
local e = e.GUI
local o = e.CreateChildPanel
local e = e.CreatePanelOption
local a = t.GUI.CreateARPanelOption
local i = t.GUI.CreateARPanelOptions
t.GUISettings.APL.DemonHunter = { Commons = { Enabled = { Potions = false, TopTrinket = true, BottomTrinket = true, Racials = true }, ThrowGlaiveRange = 10, FelBladeRange = 15, DisplayStyle = {  }, OffGCDasOffGCD = {  } }, Vengeance = { MetamorphosisHealthThreshold = 50, FieryBrandHealthThreshold = 40, DemonSpikesHealthThreshold = 65, ConserveInfernalStrike = true, OffGCDasOffGCD = { DemonSpikes = true, InfernalStrike = false, FieryBrand = false }, GCDasOffGCD = { FelDevastation = false } }, Havoc = { TargetSwap = "Mouseover", FelRushMode = "Off", VengefulRetreatMode = "Off", DisplayStyle = {  }, BlurHealthThreshold = 65, HealthstoneHP = 50, HealPotHP = 0, PhialHP = 60, DHCooldowns = 0, IncludedCooldowns = { Metamorphosis = true, EyeBeam = false }, DHSmallCooldowns = 0, IncludedSmallCooldowns = { Metamorphosis = false, EyeBeam = true }, OffGCDasOffGCD = {  }, GCDasOffGCD = {  } } }
t.GUI.LoadSettingsRecursively(t.GUISettings)
local t = t.GUI.Panel
local a = o(t, "DemonHunter")
local t = o(a, "Havoc")
local o = o(a, "Vengeance")
e("Slider", a, "APL.DemonHunter.Commons.ThrowGlaiveRange", { 8, 30, 1 }, "Max Throw Glaive Range", "Set the max target distance to use Throw Glaive")
e("Slider", a, "APL.DemonHunter.Commons.FelBladeRange", { 8, 15, 1 }, "Max Fel Blade Range", "Set the max target distance to use Fel Rush")
i(a, "APL.DemonHunter.Commons")
e("Slider", o, "APL.DemonHunter.Vengeance.MetamorphosisHealthThreshold", { 5, 100, 5 }, "Metamorphosis Health Threshold", "Suggest Metamorphosis when below this health percentage.")
e("Slider", o, "APL.DemonHunter.Vengeance.FieryBrandHealthThreshold", { 5, 100, 5 }, "Fiery Brand Health Threshold", "Suggest Fiery Brand when below this health percentage.")
e("Slider", o, "APL.DemonHunter.Vengeance.DemonSpikesHealthThreshold", { 5, 100, 5 }, "Demon Spikes Health Threshold", "Suggest Demon Spikes when below this health percentage.")
e("CheckButton", o, "APL.DemonHunter.Vengeance.ConserveInfernalStrike", "Conserve Infernal Strike", "Save at least 1 Infernal Strike charge for mobility.")
i(o, "APL.DemonHunter.Vengeance")
e("Dropdown", t, "APL.DemonHunter.Havoc.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("Dropdown", t, "APL.DemonHunter.Havoc.FelRushMode", { "Safe", "w/ Gap Closer", "All In", "Off" }, "Fel Rush Mode", "Safe - Will Fel Rush only when Felblade is up\nw/ Gap Closer - Will Fel Rush when any available gap closer is available\nAll In - Will Fel Rush all the time (suggest using macro to toggle)\nOff - Won't use Fel Rush")
e("Dropdown", t, "APL.DemonHunter.Havoc.VengefulRetreatMode", { "Safe", "w/ Gap Closer", "All In", "Off" }, "Vengeful Retreat Mode", "Safe - Will Retreat only when Felblade is up\nw/ Gap Closer - Will Retreat when any available gap closer is available\nAll In - Will use it all the time (suggest using macro to toggle)\nOff - Won't use Fel Rush")
e("Slider", t, "APL.DemonHunter.Havoc.BlurHealthThreshold", { 5, 100, 5 }, "Blur Health Threshold", "Suggest Blur when below this health percentage.")
e("Slider", t, "APL.DemonHunter.Havoc.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP %", "Set the HP threshold to use Healthstone")
e("Slider", t, "APL.DemonHunter.Havoc.HealPotHP", { 0, 100, 1 }, "Healing Potion HP %", "Set the HP threshold to use Healing Potion")
e("Slider", t, "APL.DemonHunter.Havoc.PhialHP", { 0, 100, 1 }, "Phial of Serenity HP %", "Set the HP threshold to use Phial of Serenity")
e("Slider", t, "APL.DemonHunter.Havoc.DHCooldowns", { 0, 0, 0 }, "--Spells to include in Cooldowns--", "This slider does nothing, select spells below")
e("CheckButton", t, "APL.DemonHunter.Havoc.IncludedCooldowns.Metamorphosis", "Metamorphosis", "Include Metamorphosis in Cooldowns")
e("CheckButton", t, "APL.DemonHunter.Havoc.IncludedCooldowns.EyeBeam", "Eye Beam", "Include Eye Beam in Cooldowns")
e("Slider", t, "APL.DemonHunter.Havoc.DHSmallCooldowns", { 0, 0, 0 }, "--Spells to include in SmallCooldowns--", "This slider does nothing, select spells below")
e("CheckButton", t, "APL.DemonHunter.Havoc.IncludedSmallCooldowns.Metamorphosis", "Metamorphosis", "Include Metamorphosis in SmallCooldowns")
e("CheckButton", t, "APL.DemonHunter.Havoc.IncludedSmallCooldowns.EyeBeam", "Eye Beam", "Include Eye Beam in SmallCooldowns")
i(t, "APL.DemonHunter.Havoc")

