local a, b = ...
local c = HeroRotation
local d = HeroLib
local e = d.GUI
local f = e.CreateChildPanel
local g = e.CreatePanelOption
local h = c.GUI.CreateARPanelOption
local i = c.GUI.CreateARPanelOptions
c.GUISettings.APL.Paladin = {
  Commons = {
    HealthstoneHP = 50,
    HealPotHP = 0,
    PhialHP = 60,
    Enabled = {Trinkets = true, Potions = true, Items = true},
    DisplayStyle = {Trinkets = "Suggested", Signature = "Suggested", Potions = "Suggested", Items = "Suggested"},
    GCDasOffGCD = {HammerOfWrath = true},
    OffGCDasOffGCD = {Racials = true, Rebuke = true}
  },
  Protection = {
    LoHHP = 15,
    GoAKHP = 40,
    WordofGloryHP = 50,
    ArdentDefenderHP = 60,
    ShieldoftheRighteousHP = 70,
    PotionType = {Selected = "Power"},
    DisplayStyle = {Defensives = "SuggestedRight", ShieldOfTheRighteous = "SuggestedRight"},
    GCDasOffGCD = {Seraphim = true, WordOfGlory = true},
    OffGCDasOffGCD = {AvengingWrath = true, BastionOfLight = true, HolyAvenger = true, MomentOfGlory = true}
  },
  Retribution = {
    PotionType = {Selected = "Power"},
    GCDasOffGCD = {ExecutionSentence = false, Seraphim = false, ShieldOfVengeance = true},
    OffGCDasOffGCD = {AvengingWrath = true}
  },
  Holy = {
    LoHHP = 10,
    DPHP = 40,
    WoGHP = 60,
    PotionType = {Selected = "Power"},
    GCDasOffGCD = {HammerOfWrath = false, LightOfDawn = true, Seraphim = true},
    OffGCDasOffGCD = {AvengingWrath = true, HolyAvenger = true}
  }
}
c.GUI.LoadSettingsRecursively(c.GUISettings)
local j = c.GUI.Panel
local k = f(j, "Paladin")
local l = f(k, "Protection")
local m = f(k, "Retribution")
local n = f(k, "Holy")
g(
  "Slider",
  k,
  "APL.Paladin.Commons.HealthstoneHP",
  {0, 100, 1},
  "Healthstone HP %",
  "Set the HP threshold to use Healthstone"
)
g(
  "Slider",
  k,
  "APL.Paladin.Commons.HealPotHP",
  {0, 100, 1},
  "Healing Potion HP %",
  "Set the HP threshold to use Healing Potion"
)
g(
  "Slider",
  k,
  "APL.Paladin.Commons.PhialHP",
  {0, 100, 1},
  "Phial of Serenity HP %",
  "Set the HP threshold to use Phial of Serenity"
)
i(k, "APL.Paladin.Commons")
g("Slider", l, "APL.Paladin.Protection.LoHHP", {0, 100, 1}, "Lay on Hands HP", "Set the Lay on Hands HP threshold.")
g(
  "Slider",
  l,
  "APL.Paladin.Protection.GoAKHP",
  {0, 100, 1},
  "GoAK HP",
  "Set the Guardian of Ancient Kings HP threshold."
)
g(
  "Slider",
  l,
  "APL.Paladin.Protection.WordofGloryHP",
  {0, 100, 1},
  "Word of Glory HP",
  "Set the Word of Glory HP threshold."
)
g(
  "Slider",
  l,
  "APL.Paladin.Protection.ArdentDefenderHP",
  {0, 100, 1},
  "Ardent Defender HP",
  "Set the Ardent Defender HP threshold."
)
g(
  "Slider",
  l,
  "APL.Paladin.Protection.ShieldoftheRighteousHP",
  {0, 100, 1},
  "Shield of the Righteous HP",
  "Set the Shield of the Righteous HP threshold."
)
i(l, "APL.Paladin.Protection")
i(m, "APL.Paladin.Retribution")
i(n, "APL.Paladin.Holy")
g("Slider", n, "APL.Paladin.Holy.LoHHP", {0, 100, 1}, "Lay on Hands HP", "Set the Lay on Hands HP threshold.")
g("Slider", n, "APL.Paladin.Holy.DPHP", {0, 100, 1}, "Divine Protection HP", "Set the Divine Protection HP threshold.")
g("Slider", n, "APL.Paladin.Holy.WoGHP", {0, 100, 1}, "Word of Glory HP", "Set the Word of Glory HP threshold.")
