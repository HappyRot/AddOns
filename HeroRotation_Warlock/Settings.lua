local e, e = ...
local t = HeroRotation
local e = HeroLib
local e = e.GUI
local a = e.CreateChildPanel
local e = e.CreatePanelOption
local o = t.GUI.CreateARPanelOption
local o = t.GUI.CreateARPanelOptions
t.GUISettings.APL.Warlock = { Commons = { Enabled = { Potions = true, TopTrinket = true, BottomTrinket = true }, AoeMode = "Aggresive", HealthstoneHP = 30, HealPotHP = 25, DisplayStyle = {  }, HidePetSummon = false, SummonPetSlot = 1, HealthFunnelHP = 0, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Destruction = { TargetSwap = "AutoSwap", DarkPactHP = 60, MortalCoilHP = 30, UnendingResolveHP = 20, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Demonology = { ImpsRequiredForImplosion = 6, SuppressLateTyrant = false, UnendingResolveHP = 20, GCDasOffGCD = { SummonPet = false, GrimoireFelguard = false, SummonDemonicTyrant = false, DemonicStrength = false, NetherPortal = true, Implosion = false }, OffGCDasOffGCD = { UnendingResolve = true, AxeToss = true } }, Affliction = { GCDasOffGCD = { DarkSoul = true, SummonDarkglare = true, SummonPet = false, GrimoireOfSacrifice = true, PhantomSingularity = true }, OffGCDasOffGCD = {  } } }
t.GUI.LoadSettingsRecursively(t.GUISettings)
local t = t.GUI.Panel
local t = a(t, "Warlock")
local i = a(t, "Demonology")
local n = a(t, "Affliction")
local a = a(t, "Destruction")
o(t, "APL.Warlock.Commons")
e("Dropdown", t, "APL.Warlock.Commons.AoeMode", { "Aggresive", "Conservative" }, "AoE Detection Mode", "Aggresive: Scans nameplates on your screen and runs them through a filter to check for combat (Bad when pack of mobs is split up)\nConservative: Uses party/raid member casts to detect enemies in range (Slower than Aggresive mode but better when pack is split up)\nAggressive is best used when solo or with a decent tank in M+, Conservative will be best used in Raid or with a bad tank in M+")
e("CheckButton", t, "APL.Warlock.Commons.HidePetSummon", "Hide Pet Summon", "Enable this setting to hide suggestions for summoning your base pet. Rotational pets (Infernal, Darkglare, Tyrant, etc) will still be suggested.")
e("Slider", t, "APL.Warlock.Commons.SummonPetSlot", { 0, 4, 1 }, "Summon Pet Slot", "Which pet slot to suggest when summoning a pet.")
e("Slider", t, "APL.Warlock.Commons.HealthFunnelHP", { 0, 100, 1 }, "Health Funnel Pet HP", "Set the Pet HP value to use Health Funnel")
e("Slider", t, "APL.Warlock.Commons.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP", "Set the Healthstone HP threshold. Set to 0 to disable.")
e("Slider", t, "APL.Warlock.Commons.HealPotHP", { 0, 100, 1 }, "Heal Pot HP", "Set the Heal Potion HP threshold. Set to 0 to disable.")
o(a, "APL.Warlock.Destruction")
e("Dropdown", a, "APL.Warlock.Destruction.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("Slider", a, "APL.Warlock.Destruction.DarkPactHP", { 0, 100, 1 }, "Dark Pact HP%", "Set the health threshold for Dark Pact")
e("Slider", a, "APL.Warlock.Destruction.UnendingResolveHP", { 0, 100, 1 }, "Unending Resolve HP", "Set the Unending Resolve HP threshold.")
e("Slider", a, "APL.Warlock.Destruction.MortalCoilHP", { 0, 100, 1 }, "Mortal Coil HP%", "Set the health threshold for Mortal Coil")
e("Slider", i, "APL.Warlock.Demonology.ImpsRequiredForImplosion", { 3, 9, 1 }, "Imps Required for Implosion", "Set the number of Imps required for Implosion.")
e("Slider", i, "APL.Warlock.Demonology.UnendingResolveHP", { 0, 100, 1 }, "Unending Resolve HP", "Set the Unending Resolve HP threshold.")
e("CheckButton", i, "APL.Warlock.Demonology.SuppressLateTyrant", "Suppress Late Tyrant Casts", "Enable this setting to suppress Demonic Tyrant cast suggestions due to the target dying soon. This could be useful for AoE scenarios or Mythic+ scenarios.")
o(i, "APL.Warlock.Demonology")
o(n, "APL.Warlock.Affliction")

