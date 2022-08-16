local e, e = ...
local t = HeroRotation
local e = HeroLib
local e = e.GUI
local o = e.CreateChildPanel
local e = e.CreatePanelOption
local a = t.GUI.CreateARPanelOption
local i = t.GUI.CreateARPanelOptions
t.GUISettings.APL.Warrior = { Commons = { Enabled = { Potions = false, TopTrinket = true, BottomTrinket = true }, DisplayStyle = {  }, VictoryRushHP = 80, OffGCDasOffGCD = {  } }, Arms = { TargetSwap = "Mouseover", GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Fury = { TargetSwap = "AutoSwap", UseDefensives = true, RallyingCry = 20, IgnorePain = 50, EnragedRegneration = 30, UseCharge = false, OffGCDasOffGCD = {  }, GCDasOffGCD = {  } }, Protection = { DisplayStyle = { Defensive = "Suggested" }, OffGCDasOffGCD = {  }, GCDasOffGCD = { DemoralizingShout = false, DragonRoar = false, Avatar = false } } }
t.GUI.LoadSettingsRecursively(t.GUISettings)
local t = t.GUI.Panel
local a = o(t, "Warrior")
local n = o(a, "Arms")
local t = o(a, "Fury")
local o = o(a, "Protection")
i(a, "APL.Warrior.Commons")
e("Slider", a, "APL.Warrior.Commons.VictoryRushHP", { 0, 100, 1 }, "Victory Rush HP", "Set the Victory Rush/Impending Victory HP threshold. Set to 0 to disable.")
i(n, "APL.Warrior.Arms")
e("Dropdown", n, "APL.Warrior.Arms.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
i(t, "APL.Warrior.Fury")
e("Dropdown", t, "APL.Warrior.Fury.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("CheckButton", t, "APL.Warrior.Fury.UseCharge", "Use Charge", "Suggest Charge in the Rotation")
e("CheckButton", t, "APL.Warrior.Fury.UseDefensives", "Use Defensives", "Toggle on to show Defensive Abilities")
e("Slider", t, "APL.Warrior.Fury.RallyingCry", { 0, 100, 1 }, "Rallying Cry HP %", "Set the HP threshold to use Rallying Cry")
e("Slider", t, "APL.Warrior.Fury.IgnorePain", { 0, 100, 1 }, "Ignore Pain HP %", "Set the HP threshold to use Ignore Pain")
e("Slider", t, "APL.Warrior.Fury.EnragedRegneration", { 0, 100, 1 }, "Enraged Regneration HP %", "Set the HP threshold to use Enraged Regneration")
i(o, "APL.Warrior.Protection")

