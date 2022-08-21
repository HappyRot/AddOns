local e, e = ...
local t = HeroRotation
local e = HeroLib
local e = e.GUI
local i = e.CreateChildPanel
local e = e.CreatePanelOption
local a = t.GUI.CreateARPanelOption
local n = t.GUI.CreateARPanelOptions
t.GUISettings.APL.Mage = { Commons = { Enabled = { Potions = true, TopTrinket = true, BotTrinket = true }, AoeMode = "Aggresive", HealthstoneHP = 50, HealPotHP = 0, PhialHP = 60, DisplayStyle = {  }, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Frost = { MovingRotation = false, StayDistance = true, UseTemporalWarp = true, IceBlockHP = 0, IceBarrierHP = 50, MirrorImageHP = 30, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Fire = { DisableCombustion = false, MirrorImagesBeforePull = false, MovingRotation = false, UseTemporalWarp = true, StayDistance = true, ShowFireBlastLeft = true, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Arcane = { Enabled = { UseManaGem = true }, AMSpamRotation = false, StayDistance = false, UseTemporalWarp = true, MovingRotation = false, MirrorImagesBeforePull = false, UseFishingOpener = false, GCDasOffGCD = { RuneOfPower = true, ArcanePower = true, MirrorImage = true, TouchOfTheMagi = true, Evocation = true }, OffGCDasOffGCD = { PresenceOfMind = true } } }
t.GUI.LoadSettingsRecursively(t.GUISettings)
local t = t.GUI.Panel
local t = i(t, "Mage")
local a = i(t, "Arcane")
local o = i(t, "Fire")
local i = i(t, "Frost")
n(t, "APL.Mage.Commons")
e("Dropdown", t, "APL.Mage.Commons.AoeMode", { "Aggresive", "Conservative" }, "AoE Detection Mode", "Aggresive: Scans nameplates on your screen and runs them through a filter to check for combat (Bad when pack of mobs is split up)\nConservative: Uses party/raid member casts to detect enemies in range (Slower than Aggresive mode but better when pack is split up)\nAggressive is best used when solo or with a decent tank in M+, Conservative will be best used in Raid or with a bad tank in M+")
e("Slider", t, "APL.Mage.Commons.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP %", "Set the HP threshold to use Healthstone")
e("Slider", t, "APL.Mage.Commons.HealPotHP", { 0, 100, 1 }, "Healing Potion HP %", "Set the HP threshold to use Healing Potion")
e("Slider", t, "APL.Mage.Commons.PhialHP", { 0, 100, 1 }, "Phial of Serenity HP %", "Set the HP threshold to use Phial of Serenity")
e("CheckButton", a, "APL.Mage.Arcane.AMSpamRotation", "Use AM spam rotation", "Enable the use of the Arcane Missile Spam rotation.")
e("CheckButton", a, "APL.Mage.Arcane.UseFishingOpener", "Use Fishing Opener", "The fishing opener begins with RoP and fishes for CC procs to use during TotM/AP.")
e("CheckButton", a, "APL.Mage.Arcane.MirrorImagesBeforePull", "Use Mirror Image before combat", "Enable the use of Mirror image before starting combat (very low dps).")
e("CheckButton", a, "APL.Mage.Arcane.StayDistance", "Stay at distance", "Only use Arcane Explosion if in range or on the left icon.")
e("CheckButton", a, "APL.Mage.Arcane.MovingRotation", "Disable cast abilities when moving", "Don't show abilities where a ca&st is needed (makes the rotation a bit clunky with small steps).")
e("CheckButton", a, "APL.Mage.Arcane.UseTemporalWarp", "Suggest Time Warp with Temporal Warp legendary", "Show time warp ability when using the Temporal Warp legendary")
n(a, "APL.Mage.Arcane")
n(o, "APL.Mage.Fire")
e("CheckButton", o, "APL.Mage.Fire.StayDistance", "Stay at distance", "Only use Arcane Explosion/Dragon's Breath if in range or on the left icon.")
e("CheckButton", o, "APL.Mage.Fire.MirrorImagesBeforePull", "Use Mirror Image before combat", "Enable the use of Mirror image before starting combat (very low dps).")
e("CheckButton", o, "APL.Mage.Fire.MovingRotation", "Disable cast abilities when moving", "Don't show abilities where a cast is needed while moving (makes the rotation a bit clunky with small steps).")
e("CheckButton", o, "APL.Mage.Fire.UseTemporalWarp", "Suggest Time Warp with Temporal Warp legendary", "Show time warp ability when using the Temporal Warp legendary")
e("CheckButton", i, "APL.Mage.Frost.UseTemporalWarp", "Suggest Time Warp with Temporal Warp legendary", "Show time warp ability when using the Temporal Warp legendary")
e("Slider", i, "APL.Mage.Frost.IceBlockHP", { 0, 100, 1 }, "Ice Block HP", "Health threshhold to use Ice Block")
e("Slider", i, "APL.Mage.Frost.IceBarrierHP", { 0, 100, 0 }, "Ice Barrier HP", "Health threshhold to use Ice Barrier")
e("Slider", i, "APL.Mage.Frost.MirrorImageHP", { 0, 100, 1 }, "Mirror Image HP", "Health threshhold to use MirrorImage")
n(i, "APL.Mage.Frost")

