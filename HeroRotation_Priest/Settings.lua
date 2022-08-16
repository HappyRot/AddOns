local e, e = ...
local t = HeroRotation
local e = HeroLib
local e = e.GUI
local i = e.CreateChildPanel
local e = e.CreatePanelOption
local a = t.GUI.CreateARPanelOption
local o = t.GUI.CreateARPanelOptions
t.GUISettings.APL.Priest = { Commons = { Enabled = { Potions = true, TopTrinket = true, BottomTrinket = true }, AoeMode = "Aggresive", DBMSupport = false, HealthstoneHP = 30, HealPotHP = 25, DisplayStyle = {  }, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Shadow = { TargetSwap = "Mouseover", DispersionHP = 30, DesperatePrayerHP = 75, SelfPI = true, CastCancelFC = true, PWS = "Never", HealthstoneHP = 50, HealPotHP = 0, PhialHP = 60, PowerInfusion = "CDs", VoidEruption = "Small CDs", VoidTorrent = "Small CDs", ShadowCrash = "Small CDs", MindBender = "CDs", GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Discipline = { GCDasOffGCD = { Mindbender = true, PowerInfusion = true, ShadowCovenant = true }, OffGCDasOffGCD = {  } }, Holy = { GCDasOffGCD = { Apotheosis = true, DivineStar = true, Halo = true }, OffGCDasOffGCD = {  } } }
t.GUI.LoadSettingsRecursively(t.GUISettings)
local t = t.GUI.Panel
local a = i(t, "Priest")
local t = i(a, "Shadow")
local n = i(a, "Discipline")
local i = i(a, "Holy")
o(a, "APL.Priest.Commons")
e("Dropdown", a, "APL.Priest.Commons.AoeMode", { "Aggresive", "Conservative" }, "AoE Detection Mode", "Aggresive: Scans nameplates on your screen and runs them through a filter to check for combat (Bad when pack of mobs is split up)\nConservative: Uses party/raid member casts to detect enemies in range (Slower than Aggresive mode but better when pack is split up)\nAggressive is best used when solo or with a decent tank in M+, Conservative will be best used in Raid or with a bad tank in M+")
e("CheckButton", a, "APL.Priest.Commons.DBMSupport", "DBM Enabled?", "Enable this option if you have DBM - BETA")
e("Slider", a, "APL.Priest.Commons.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP", "Set the Healthstone HP threshold. Set to 0 to disable.")
e("Slider", a, "APL.Priest.Commons.HealPotHP", { 0, 100, 1 }, "Heal Pot HP", "Set the Heal Potion HP threshold. Set to 0 to disable.")
e("Dropdown", t, "APL.Priest.Shadow.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("Slider", t, "APL.Priest.Shadow.DesperatePrayerHP", { 0, 100, 1 }, "Desperate Prayer HP", "Set the Desperate Prayer HP threshold.")
e("Slider", t, "APL.Priest.Shadow.DispersionHP", { 0, 100, 1 }, "Dispersion HP", "Set the Dispersion HP threshold.")
e("Slider", t, "APL.Priest.Shadow.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP %", "Set the HP threshold to use Healthstone")
e("Slider", t, "APL.Priest.Shadow.HealPotHP", { 0, 100, 1 }, "Healing Potion HP %", "Set the HP threshold to use Healing Potion")
e("Slider", t, "APL.Priest.Shadow.PhialHP", { 0, 100, 1 }, "Phial of Serenity HP %", "Set the HP threshold to use Phial of Serenity")
e("CheckButton", t, "APL.Priest.Shadow.SelfPI", "Assume Self-Power Infusion", "Assume the player will be using Power Infusion on themselves.")
e("Dropdown", t, "APL.Priest.Shadow.PWS", { "Never", "Moving", "Always", "OOC Moving" }, "Power Word: Shield Usage", "Choose when to use PW:S")
e("CheckButton", t, "APL.Priest.Shadow.CastCancelFC", "Cancel-Cast Fleshcraft", "Cancel-Cast Fleshcraft to keep the Volatile Solvent buff.")
e("Dropdown", t, "APL.Priest.Shadow.PowerInfusion", { "CDs", "Small CDs", "Always" }, "CDs: Power Infusion", "")
e("Dropdown", t, "APL.Priest.Shadow.VoidEruption", { "CDs", "Small CDs", "Always" }, "CDs: Void Erruption", "")
e("Dropdown", t, "APL.Priest.Shadow.VoidTorrent", { "CDs", "Small CDs", "Always" }, "CDs: Void Torrent", "")
e("Dropdown", t, "APL.Priest.Shadow.ShadowCrash", { "CDs", "Small CDs", "Always" }, "CDs: Shadow Crash", "")
e("Dropdown", t, "APL.Priest.Shadow.MindBender", { "CDs", "Small CDs", "Always" }, "CDs: Mind Bender", "")
o(t, "APL.Priest.Shadow")
o(n, "APL.Priest.Discipline")
o(i, "APL.Priest.Holy")

