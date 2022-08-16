local e, e = ...
local t = HeroRotation
local e = HeroLib
local e = e.GUI
local i = e.CreateChildPanel
local e = e.CreatePanelOption
local a = t.GUI.CreateARPanelOption
local n = t.GUI.CreateARPanelOptions
t.GUISettings.APL.Druid = { Commons = { Enabled = { Potions = true, TopTrinket = true, BotTrinket = true }, TopTrinketHP = 0, BotTrinketHP = 0, DisplayStyle = {  }, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Balance = { TargetSwap = "Mouseover", AoeMode = "Aggresive", BarkskinHP = 50, RenewalHP = 40, ShowMoonkinFormOOC = false, UseBarkskinDefensively = false, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Feral = { FillerSpell = "Rake Non-Snapshot", ShowCatFormOOC = false, UseOwlweave = false, GCDasOffGCD = { BsInc = true }, OffGCDasOffGCD = { SkullBash = true, TigersFury = true } }, Guardian = { TargetSwap = "Mouseover", UseRageDefensively = true, UseBarkskinDefensively = false, SwapForConvoke = false }, Guardian2 = { BarkskinHP = 50, RenewalHP = 60, FrenziedRegenHP = 70, SurvivalInstinctsHP = 30, BristlingFurRage = 50, HealthstoneHP = 50, HealPotHP = 0, PhialHP = 60, MTRegrowth = 80 } }
t.GUI.LoadSettingsRecursively(t.GUISettings)
local t = t.GUI.Panel
local a = i(t, "Druid")
local o = i(a, "Balance")
local h = i(a, "Feral")
local s = i(a, "Guardian")
local t = i(a, "Guardian Defensives")
n(a, "APL.Druid.Commons")
e("Slider", a, "APL.Druid.Commons.TopTrinketHP", { 0, 100, 1 }, "Top Trinket Defensive Threshold", "Set the HP percentage threshold of when to use Top Trinket. Set to 0 if not defensive")
e("Slider", a, "APL.Druid.Commons.BotTrinketHP", { 0, 100, 1 }, "Bottom Trinket Defensive Threshold", "Set the HP percentage threshold of when to use Bottom Trinket. Set to 0 if not defensive")
e("Dropdown", o, "APL.Druid.Balance.AoeMode", { "Aggresive", "Conservative" }, "AoE Detection Mode", "Aggresive: Scans nameplates on your screen and runs them through a filter to check for combat (Bad when pack of mobs is split up)\nConservative: Uses party/raid member casts to detect enemies in range (Slower than Aggresive mode but better when pack is split up)\nAggressive is best used when solo or with a decent tank in M+, Conservative will be best used in Raid or with a bad tank in M+")
e("Dropdown", o, "APL.Druid.Balance.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("Slider", o, "APL.Druid.Balance.BarkskinHP", { 0, 100, 1 }, "Barkskin HP", "Set the Barkskin HP threshold.")
e("Slider", o, "APL.Druid.Balance.RenewalHP", { 0, 100, 1 }, "Renewal HP", "Set the Renewal HP threshold.")
e("CheckButton", o, "APL.Druid.Balance.ShowMoonkinFormOOC", "Show Moonkin Form Out of Combat", "Enable this if you want the addon to show you the Moonkin Form reminder out of combat.")
n(o, "APL.Druid.Balance")
e("Dropdown", h, "APL.Druid.Feral.FillerSpell", { "Shred", "Rake Non-Snapshot", "Rake Snapshot", "Moonfire", "Swipe" }, "Preferred Filler Spell", "Select which spell to use as your filler spell. The SimC APL default is Rake Non-Snapshot.")
e("CheckButton", h, "APL.Druid.Feral.ShowCatFormOOC", "Show Cat Form Out of Combat", "Enable this if you want the addon to show you the Cat Form reminder out of combat.")
e("CheckButton", h, "APL.Druid.Feral.UseOwlweave", "Utilize Owleaving", "Enable this if you want Owlweaving spell suggestions when talented into Balance Affinity.")
n(h, "APL.Druid.Feral")
n(s, "APL.Druid.Guardian")
e("Dropdown", s, "APL.Druid.Guardian.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("CheckButton", s, "APL.Druid.Guardian.UseRageDefensively", "Use Rage Defensively", "Enable this if you want to save rage for defensive use, disabling Maul suggestions.")
e("CheckButton", s, "APL.Druid.Guardian.UseBarkskinDefensively", "Use Barkskin Defensively", "Enable this if you want to save Barkskin for defensive use, disabling offensive Barkskin with Brambles.")
e("CheckButton", s, "APL.Druid.Guardian.SwapForConvoke", "Swap Forms For Convoke", "Enable this if you want to swap to your affinity form before convoking")
n(t, "APL.Druid.Guardian2")
e("Slider", t, "APL.Druid.Guardian2.BarkskinHP", { 0, 100, 1 }, "Barkskin Threshold", "Set the HP percentage threshold of when to use Barkskin.")
e("Slider", t, "APL.Druid.Guardian2.FrenziedRegenHP", { 0, 100, 1 }, "Frenzied Regen Threshold", "Set the HP percentage threshold of when to use Frenzied Regeneration.")
e("Slider", t, "APL.Druid.Guardian2.RenewalHP", { 0, 100, 1 }, "Renewal Threshold", "Set the HP percentage threshold of when to use Renewal.")
e("Slider", t, "APL.Druid.Guardian2.SurvivalInstinctsHP", { 0, 100, 1 }, "Survival Instincts Threshold", "Set the HP percentage threshold of when to use Survival Instincts.")
e("Slider", t, "APL.Druid.Guardian2.BristlingFurRage", { 0, 100, 1 }, "Bristling Fur Threshold", "Set the Rage threshold of when to use Bristling Fur.")
e("Slider", t, "APL.Druid.Guardian2.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP %", "Set the HP threshold to use Healthstone")
e("Slider", t, "APL.Druid.Guardian2.HealPotHP", { 0, 100, 1 }, "Healing Potion HP %", "Set the HP threshold to use Healing Potion")
e("Slider", t, "APL.Druid.Guardian2.PhialHP", { 0, 100, 1 }, "Phial of Serenity HP %", "Set the HP threshold to use Phial of Serenity")
e("Slider", t, "APL.Druid.Guardian2.MTRegrowth", { 0, 100, 1 }, "Mage Tower HP %", "Set the HP threshold to use Regrowth in the Mage Tower")

