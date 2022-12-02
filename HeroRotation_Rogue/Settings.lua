local e, e = ...
local e = HeroLib
local t = HeroRotation
local e = e.GUI
local i = e.CreateChildPanel
local e = e.CreatePanelOption
local a = t.GUI.CreateARPanelOption
local n = t.GUI.CreateARPanelOptions
t.GUISettings.APL.Rogue = { Commons = { PoisonRefresh = 15, PoisonRefreshCombat = 3, LethalPoison = "Instant Poison", NonLethalPoison = "Numbing Poison", RangedMultiDoT = true, Enabled = { Potions = false, TopTrinket = true, BottomTrinket = true, Racials = true }, ShowPooling = false, GCDasOffGCD = {  }, OffGCDasOffGCD = {  }, UseDefensives = true, HealthstoneHP = 50, HealPotHP = 0, PhialHP = 60, CrimsonVialHP = 70, EvasionHP = 20, FeintHP = 10, StealthOOC = "Always", VanishOffensive = true, AutoToT = true }, Assassination = { TargetSwap = "AutoSwap", PotionType = { Selected = "Power" }, EnvenomDMGOffset = 3, MutilateDMGOffset = 3, AlwaysSuggestGarrote = false, GCDasOffGCD = { Shiv = false }, OffGCDasOffGCD = { Vendetta = true } }, Outlaw = { TargetSwap = "AutoSwap", RolltheBonesLogic = "SimC", BRRange = 25, RolltheBonesLeechKeepHP = 60, RolltheBonesLeechRerollHP = 40, DumpSpikes = false, CastCancelFC = true, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Subtlety = { TargetSwap = "AutoSwap", EviscerateDMGOffset = 3, ShDEcoCharge = 1.75, BurnShadowDance = "On Bosses not in Dungeons", ShadowStrikeRange = 25, PotionType = { Selected = "Power" }, GCDasOffGCD = {  }, OffGCDasOffGCD = {  }, StealthMacro = {  }, SubCooldowns = 0, IncludedCooldowns = { ShadowBlades = true, ShadowDance = false, SymbolsofDeath = false, Vanish = true, MarkedforDeath = false, ShurikenTornado = false }, SubSmallCooldowns = 0, IncludedSmallCooldowns = { ShadowBlades = false, ShadowDance = true, SymbolsofDeath = true, Vanish = false, MarkedforDeath = true, ShurikenTornado = true } } }
t.GUI.LoadSettingsRecursively(t.GUISettings)
local t = t.GUI.Panel
local a = i(t, "Rogue")
local s = i(a, "Assassination")
local o = i(a, "Outlaw")
local t = i(a, "Subtlety")
e("Dropdown", a, "APL.Rogue.Commons.LethalPoison", { "Instant Poison", "Wound Poison", "Deadly Poison", "None" }, "Lethal Poison", "Lethal Poison to apply")
e("Dropdown", a, "APL.Rogue.Commons.NonLethalPoison", { "Numbing Poison", "Crippling Poison", "Atrophic Poison", "None" }, "Non-Lethal Poison", "Non-Lethal Poison to apply")
e("Slider", a, "APL.Rogue.Commons.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP %", "Set the HP threshold to use Healthstone")
e("Slider", a, "APL.Rogue.Commons.HealPotHP", { 0, 100, 1 }, "Healing Potion HP %", "Set the HP threshold to use Healing Potion")
e("Slider", a, "APL.Rogue.Commons.PhialHP", { 0, 100, 1 }, "Phial of Serenity HP %", "Set the HP threshold to use Phial of Serenity")
e("Slider", a, "APL.Rogue.Commons.CrimsonVialHP", { 0, 100, 1 }, "Crimson Vial HP", "Set the Crimson Vial HP threshold.")
e("Slider", a, "APL.Rogue.Commons.EvasionHP", { 0, 100, 1 }, "Evasion HP", "Set the Evasion HP threshold.")
e("Slider", a, "APL.Rogue.Commons.FeintHP", { 0, 100, 1 }, "Feint HP", "Set the Feint HP threshold.")
e("Dropdown", a, "APL.Rogue.Commons.StealthOOC", { "Always", "w/ Target", "Never" }, "Stealth Options", "Always: Suggest Stealth when out of combat\nw/ Target: Suggest Stealth when out of combat and a valid enemy target is selected\nNever: Will never suggest Stealth")
e("CheckButton", a, "APL.Rogue.Commons.VanishOffensive", "Vanish Offensive", "Use Vanish for DPS")
e("CheckButton", a, "APL.Rogue.Commons.AutoToT", "Auto Tricks of the Trade", "Automatically use ToT on Focus")
n(a, "APL.Rogue.Commons")
e("Slider", s, "APL.Rogue.Assassination.EnvenomDMGOffset", { 1, 5, .25 }, "Envenom DMG Offset", "Set the Envenom DMG Offset.")
e("Slider", s, "APL.Rogue.Assassination.MutilateDMGOffset", { 1, 5, .25 }, "Mutilate DMG Offset", "Set the Mutilate DMG Offset.")
e("CheckButton", s, "APL.Rogue.Assassination.AlwaysSuggestGarrote", "Always Suggest Garrote", "Don't prevent Garrote suggestions when using Subterfuge and Vanish is ready. These should ideally be synced, but can be useful if holding Vanish for specific fights.")
n(s, "APL.Rogue.Assassination")
e("Dropdown", o, "APL.Rogue.Outlaw.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("Dropdown", o, "APL.Rogue.Outlaw.RolltheBonesLogic", { "SimC", "1+ Buff", "Broadside", "Buried Treasure", "Grand Melee", "Skull and Crossbones", "Ruthless Precision", "True Bearing" }, "Roll the Bones Logic", "Define the Roll the Bones logic to follow.\n(SimC highly recommended!)")
e("Slider", o, "APL.Rogue.Outlaw.BRRange", { 5, 20, 1 }, "Blade Rush Range", "Set the Range to use Blade Rush")
e("Slider", o, "APL.Rogue.Outlaw.RolltheBonesLeechKeepHP", { 1, 100, 1 }, "Keep Leech HP Threshold", "Set the HP threshold for keeping the leech buff instead of rerolling normally (working only if Solo Mode is enabled and does not work in dungeons.)")
e("Slider", o, "APL.Rogue.Outlaw.RolltheBonesLeechRerollHP", { 1, 100, 1 }, "Reroll For Leech HP Threshold", "Set the HP threshold to actively re-roll for the leech buff (working only if Solo Mode is enabled and does not work in dungeons.)")
n(o, "APL.Rogue.Outlaw")
e("Dropdown", t, "APL.Rogue.Subtlety.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("Slider", t, "APL.Rogue.Subtlety.ShDEcoCharge", { 1, 2, .1 }, "ShD Eco Charge", "Set the Shadow Dance Eco Charge threshold.")
e("Slider", t, "APL.Rogue.Subtlety.ShadowStrikeRange", { 5, 25, 1 }, "Shadow Strike Range", "Set the Range to use Shadow Strike")
e("Slider", t, "APL.Rogue.Subtlety.SubCooldowns", { 0, 0, 0 }, "--Spells to include in Cooldowns--", "This slider does nothing, select spells below")
e("CheckButton", t, "APL.Rogue.Subtlety.IncludedCooldowns.ShadowBlades", "Shadow Blades", "Include Shadow Blades in Cooldowns")
e("CheckButton", t, "APL.Rogue.Subtlety.IncludedCooldowns.ShadowDance", "Shadow Dance", "Include Shadow Dance in Cooldowns")
e("CheckButton", t, "APL.Rogue.Subtlety.IncludedCooldowns.Vanish", "Vanish", "Include Vanish in Cooldowns")
e("CheckButton", t, "APL.Rogue.Subtlety.IncludedCooldowns.SymbolsofDeath", "Symbols of Death", "Include Symbols of Death in Cooldowns")
e("CheckButton", t, "APL.Rogue.Subtlety.IncludedCooldowns.ShurikenTornado", "Shuriken Tornado", "Include Shuriken Tornado in Cooldowns")
e("Slider", t, "APL.Rogue.Subtlety.SubSmallCooldowns", { 0, 0, 0 }, "--Spells to include in SmallCooldowns--", "This slider does nothing, select spells below")
e("CheckButton", t, "APL.Rogue.Subtlety.IncludedSmallCooldowns.ShadowBlades", "Shadow Blades", "Include Shadow Blades in SmallCooldowns")
e("CheckButton", t, "APL.Rogue.Subtlety.IncludedSmallCooldowns.ShadowDance", "Shadow Dance", "Include Shadow Dance in SmallCooldowns")
e("CheckButton", t, "APL.Rogue.Subtlety.IncludedSmallCooldowns.Vanish", "Vanish", "Include Vanish in SmallCooldowns")
e("CheckButton", t, "APL.Rogue.Subtlety.IncludedSmallCooldowns.SymbolsofDeath", "Symbols of Death", "Include Symbols of Death in SmallCooldowns")
e("CheckButton", t, "APL.Rogue.Subtlety.IncludedSmallCooldowns.ShurikenTornado", "Shuriken Tornado", "Include Shuriken Tornado in Cooldowns")
n(t, "APL.Rogue.Subtlety")

