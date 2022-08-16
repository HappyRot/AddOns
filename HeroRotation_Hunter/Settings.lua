local e, e = ...
local t = HeroRotation
local e = HeroLib
local e = e.GUI
local o = e.CreateChildPanel
local e = e.CreatePanelOption
local a = t.GUI.CreateARPanelOption
local i = t.GUI.CreateARPanelOptions
t.GUISettings.APL.Hunter = { Commons = { Enabled = { Potions = true, TopTrinket = true, BottomTrinket = true }, SummonPetSlot = 1, ExhilarationHP = 20, TurtleHP = 0, MendPetHighHP = 40, MendPetLowHP = 80, HealthstoneHP = 30, HealPotHP = 25, AutoMisdirect = true }, BeastMastery = { TargetSwap = "AutoSwap", DBMSupport = false, AspectoftheWild = "CDs", Stampede = "CDs", BestialWrathCD = "Small CDs", Bloodshed = "Small CDs" }, Marksmanship = { TargetSwap = "AutoSwap", HideAimedWhileMoving = false, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } }, Survival = { AspectOfTheEagle = true, SmartBombTargeting = true, SerpantStingTargetSwap = "AutoSwap", KillCommandTargetSwap = "AutoSwap", KCFish = true, SerpantStingRange = 10, BombRange = 10, GCDasOffGCD = {  }, OffGCDasOffGCD = {  } } }
t.GUI.LoadSettingsRecursively(t.GUISettings)
local t = t.GUI.Panel
local t = o(t, "Hunter")
local a = o(t, "BeastMastery")
local n = o(t, "Marksmanship")
local o = o(t, "Survival")
e("Slider", t, "APL.Hunter.Commons.ExhilarationHP", { 0, 100, 1 }, "Exhilaration HP", "Set the Exhilaration HP threshold. Set to 0 to disable.")
e("Slider", t, "APL.Hunter.Commons.TurtleHP", { 0, 100, 1 }, "Aspect of the Turtle HP", "Set the Aspect of the Turtle HP threshold. Set to 0 to disable.")
e("Slider", t, "APL.Hunter.Commons.MendPetHighHP", { 0, 100, 1 }, "Mend Pet High HP", "Set the Mend Pet HP High Priority (ASAP) threshold. Set to 0 to disable.")
e("Slider", t, "APL.Hunter.Commons.MendPetLowHP", { 0, 100, 1 }, "Mend Pet Low HP", "Set the Mend Pet HP Low Priority (Pooling) threshold. Set to 0 to disable.")
e("Slider", t, "APL.Hunter.Commons.SummonPetSlot", { 0, 5, 1 }, "Summon Pet Slot", "Which pet stable slot to suggest when summoning a pet.")
e("Slider", t, "APL.Hunter.Commons.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP", "Set the Healthstone HP threshold. Set to 0 to disable.")
e("Slider", t, "APL.Hunter.Commons.HealPotHP", { 0, 100, 1 }, "Heal Pot HP", "Set the Heal Potion HP threshold. Set to 0 to disable.")
e("CheckButton", t, "APL.Hunter.Commons.AutoMisdirect", "AutoMisdirect", "Enable Auto Misdirect on your focus")
i(t, "APL.Hunter.Commons")
e("Dropdown", a, "APL.Hunter.BeastMastery.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("CheckButton", a, "APL.Hunter.BeastMastery.DBMSupport", "DBM Enabled?", "Enable this option if you have DBM - BETA")
e("Dropdown", a, "APL.Hunter.BeastMastery.AspectoftheWild", { "CDs", "Small CDs", "Always" }, "CDs: Aspect of the Wild", "")
e("Dropdown", a, "APL.Hunter.BeastMastery.Stampede", { "CDs", "Small CDs", "Always" }, "CDs: Stampede", "")
e("Dropdown", a, "APL.Hunter.BeastMastery.BestialWrathCD", { "CDs", "Small CDs", "Always" }, "CDs: Beastial Wrath", "")
e("Dropdown", a, "APL.Hunter.BeastMastery.Bloodshed", { "CDs", "Small CDs", "Always" }, "CDs: Bloodshed", "")
a["APL.Hunter.BeastMastery.Bloodshed"]:SetPoint("TOPLEFT", 180, -110)
a["APL.Hunter.BeastMastery.BestialWrathCD"]:SetPoint("TOPLEFT", 180, -160)
i(a, "APL.Hunter.BeastMastery")
e("Dropdown", n, "APL.Hunter.Marksmanship.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method", "Choose Which Method to use to spread DoTs")
e("CheckButton", n, "APL.Hunter.Marksmanship.HideAimedWhileMoving", "Hide Moving Aimed Shot", "Enable this option to hide Aimed Shot while your character is moving.")
i(n, "APL.Hunter.Marksmanship")
e("Dropdown", o, "APL.Hunter.Survival.SerpantStingTargetSwap", { "Mouseover", "AutoSwap" }, "Serpant Sting Spread Method", "Choose Which Method to use to spread Serpant Sting DoT")
e("Dropdown", o, "APL.Hunter.Survival.KillCommandTargetSwap", { "Mouseover", "AutoSwap" }, "Kill Command Spread Method", "Choose Which Method to use to spread Kill Command DoT")
e("CheckButton", o, "APL.Hunter.Survival.AspectoftheEagle", "Show Aspect of the Eagle", "Show Aspect of the Eagle when out of Melee Range.")
e("CheckButton", o, "APL.Hunter.Survival.KCFish", "Kill Command Fishing", "Fish for Mad Bombardier procs in AoE when we have 2+ tier pieces")
e("Slider", o, "APL.Hunter.Survival.SerpantStingRange", { 8, 40, 1 }, "Serpant Sting Range", "Set the maximum range to use Serpant Sting")
e("Slider", o, "APL.Hunter.Survival.BombRange", { 8, 40, 1 }, "Bomb Range", "Set the maximum range to use Wildfire Bombs")
i(o, "APL.Hunter.Survival")
function SetPet(e)
    t["APL.Hunter.Commons.SummonPetSlot"]:SetValue(e)
end


