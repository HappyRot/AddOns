local a, b = ...
local c = HeroLib
local d = HeroRotation
local e = c.GUI
local f = e.CreateChildPanel
local g = e.CreatePanelOption
local h = d.GUI.CreateARPanelOption
local i = d.GUI.CreateARPanelOptions
d.GUISettings.APL.Rogue = {
    Commons = {
        PoisonRefresh = 15,
        PoisonRefreshCombat = 3,
        LethalPoison = "Instant Poison",
        NonLethalPoison = "Numbing Poison",
        RangedMultiDoT = true,
        Enabled = {Potions = false, TopTrinket = true, BottomTrinket = true, Racials = true},
        ShowPooling = false,
        GCDasOffGCD = {},
        OffGCDasOffGCD = {},
        UseDefensives = true,
        HealthstoneHP = 50,
        HealPotHP = 0,
        PhialHP = 60,
        CrimsonVialHP = 70,
        EvasionHP = 20,
        FeintHP = 10,
        StealthOOC = "Always",
        VanishOffensive = true,
        AutoToT = true
    },
    Assassination = {
        TargetSwap = "AutoSwap",
        PotionType = {Selected = "Power"},
        LethalPoison1 = "Deadly Poison",
        NonLethalPoison1 = "Atrophic Poison",
        LethalPoison2 = "Wound Poison",
        NonLethalPoison2 = "Crippling Poison",
        EnvenomDMGOffset = 3,
        MutilateDMGOffset = 3,
        AlwaysSuggestGarrote = false,
        GCDasOffGCD = {},
        OffGCDasOffGCD = {}
    },
    Outlaw = {
        TargetSwap = "AutoSwap",
        PotionType = {Selected = "Power"},
        RolltheBonesLogic = "SimC",
        BRRange = 25,
        RolltheBonesLeechKeepHP = 60,
        RolltheBonesLeechRerollHP = 40,
        DumpSpikes = false,
        CastCancelFC = true,
        BRAutomatically = true,
        GCDasOffGCD = {},
        OffGCDasOffGCD = {}
    },
    Subtlety = {
        TargetSwap = "AutoSwap",
        PotionType = {Selected = "Power"},
        EviscerateDMGOffset = 3,
        ShDEcoCharge = 1.75,
        BurnShadowDance = "On Bosses not in Dungeons",
        ShadowStrikeRange = 25,
        GCDasOffGCD = {},
        OffGCDasOffGCD = {},
        StealthMacro = {},
        SubCooldowns = 0,
        IncludedCooldowns = {
            ShadowBlades = true,
            ShadowDance = false,
            SymbolsofDeath = false,
            Vanish = true,
            MarkedforDeath = false,
            ShurikenTornado = false
        },
        SubSmallCooldowns = 0,
        IncludedSmallCooldowns = {
            ShadowBlades = false,
            ShadowDance = true,
            SymbolsofDeath = true,
            Vanish = false,
            MarkedforDeath = true,
            ShurikenTornado = true
        }
    }
}
d.GUI.LoadSettingsRecursively(d.GUISettings)
local j = d.GUI.Panel
local k = f(j, "Rogue")
local l = f(k, "Assassination")
local m = f(k, "Outlaw")
local n = f(k, "Subtlety")
g(
    "Dropdown",
    k,
    "APL.Rogue.Commons.LethalPoison",
    {"Instant Poison", "Wound Poison", "Deadly Poison", "None"},
    "Lethal Poison",
    "Lethal Poison to apply"
)
g(
    "Dropdown",
    k,
    "APL.Rogue.Commons.NonLethalPoison",
    {"Numbing Poison", "Crippling Poison", "Atrophic Poison", "None"},
    "Non-Lethal Poison",
    "Non-Lethal Poison to apply"
)
g(
    "Slider",
    k,
    "APL.Rogue.Commons.HealthstoneHP",
    {0, 100, 1},
    "Healthstone HP %",
    "Set the HP threshold to use Healthstone"
)
g(
    "Slider",
    k,
    "APL.Rogue.Commons.HealPotHP",
    {0, 100, 1},
    "Healing Potion HP %",
    "Set the HP threshold to use Healing Potion"
)
g(
    "Slider",
    k,
    "APL.Rogue.Commons.PhialHP",
    {0, 100, 1},
    "Phial of Serenity HP %",
    "Set the HP threshold to use Phial of Serenity"
)
g("Slider", k, "APL.Rogue.Commons.CrimsonVialHP", {0, 100, 1}, "Crimson Vial HP", "Set the Crimson Vial HP threshold.")
g("Slider", k, "APL.Rogue.Commons.EvasionHP", {0, 100, 1}, "Evasion HP", "Set the Evasion HP threshold.")
g("Slider", k, "APL.Rogue.Commons.FeintHP", {0, 100, 1}, "Feint HP", "Set the Feint HP threshold.")
g(
    "Dropdown",
    k,
    "APL.Rogue.Commons.StealthOOC",
    {"Always", "w/ Target", "Never"},
    "Stealth Options",
    "Always: Suggest Stealth when out of combat\nw/ Target: Suggest Stealth when out of combat and a valid enemy target is selected\nNever: Will never suggest Stealth"
)
g("CheckButton", k, "APL.Rogue.Commons.VanishOffensive", "Vanish Offensive", "Use Vanish for DPS")
g("CheckButton", k, "APL.Rogue.Commons.AutoToT", "Auto Tricks of the Trade", "Automatically use ToT on Focus")
i(k, "APL.Rogue.Commons")
g(
    "Dropdown",
    l,
    "APL.Rogue.Assassination.LethalPoison1",
    {"Instant Poison", "Wound Poison", "Deadly Poison", "Amplifying Poison", "None"},
    "Lethal Poison",
    "Lethal Poison to apply"
)
g(
    "Dropdown",
    l,
    "APL.Rogue.Assassination.NonLethalPoison1",
    {"Numbing Poison", "Crippling Poison", "Atrophic Poison", "None"},
    "Non-Lethal Poison",
    "Non-Lethal Poison to apply (Drago-Tempered Blades Talent)"
)
g(
    "Slider",
    l,
    "APL.Rogue.Assassination.EnvenomDMGOffset",
    {1, 5, 0.25},
    "Envenom DMG Offset",
    "Set the Envenom DMG Offset."
)
g(
    "Slider",
    l,
    "APL.Rogue.Assassination.MutilateDMGOffset",
    {1, 5, 0.25},
    "Mutilate DMG Offset",
    "Set the Mutilate DMG Offset."
)
g(
    "CheckButton",
    l,
    "APL.Rogue.Assassination.AlwaysSuggestGarrote",
    "Always Suggest Garrote",
    "Don't prevent Garrote suggestions when using Subterfuge and Vanish is ready. These should ideally be synced, but can be useful if holding Vanish for specific fights."
)
g(
    "Dropdown",
    l,
    "APL.Rogue.Assassination.LethalPoison2",
    {"Instant Poison", "Wound Poison", "Deadly Poison", "Amplifying Poison", "None"},
    "Lethal Poison #2",
    "Lethal Poison 2 to apply"
)
g(
    "Dropdown",
    l,
    "APL.Rogue.Assassination.NonLethalPoison2",
    {"Numbing Poison", "Crippling Poison", "Atrophic Poison", "None"},
    "Non-Lethal Poison #2",
    "Non-Lethal Poison to apply  (Drago-Tempered Blades Talent)"
)
l["APL.Rogue.Assassination.LethalPoison2"]:SetPoint("TOPLEFT", 180, -30)
i(l, "APL.Rogue.Assassination")
g(
    "Dropdown",
    m,
    "APL.Rogue.Outlaw.TargetSwap",
    {"Mouseover", "AutoSwap"},
    "DoT Spread Method",
    "Choose Which Method to use to spread DoTs"
)
g(
    "Dropdown",
    m,
    "APL.Rogue.Outlaw.RolltheBonesLogic",
    {
        "SimC",
        "1+ Buff",
        "Broadside",
        "Buried Treasure",
        "Grand Melee",
        "Skull and Crossbones",
        "Ruthless Precision",
        "True Bearing"
    },
    "Roll the Bones Logic",
    "Define the Roll the Bones logic to follow.\n(SimC highly recommended!)"
)
g("Slider", m, "APL.Rogue.Outlaw.BRRange", {5, 20, 1}, "Blade Rush Range", "Set the Range to use Blade Rush")
g(
    "Slider",
    m,
    "APL.Rogue.Outlaw.RolltheBonesLeechKeepHP",
    {1, 100, 1},
    "Keep Leech HP Threshold",
    "Set the HP threshold for keeping the leech buff instead of rerolling normally (working only if Solo Mode is enabled and does not work in dungeons.)"
)
g(
    "Slider",
    m,
    "APL.Rogue.Outlaw.RolltheBonesLeechRerollHP",
    {1, 100, 1},
    "Reroll For Leech HP Threshold",
    "Set the HP threshold to actively re-roll for the leech buff (working only if Solo Mode is enabled and does not work in dungeons.)"
)
g(
    "CheckButton",
    m,
    "APL.Rogue.Outlaw.BRAutomatically",
    "Blade Rush Full Automatically",
    "Include Full Automatically Blade Rush in Rotation"
)
i(m, "APL.Rogue.Outlaw")
g(
    "Dropdown",
    n,
    "APL.Rogue.Subtlety.TargetSwap",
    {"Mouseover", "AutoSwap"},
    "DoT Spread Method",
    "Choose Which Method to use to spread DoTs"
)
g(
    "Slider",
    n,
    "APL.Rogue.Subtlety.ShDEcoCharge",
    {1, 2, 0.1},
    "ShD Eco Charge",
    "Set the Shadow Dance Eco Charge threshold."
)
g(
    "Slider",
    n,
    "APL.Rogue.Subtlety.ShadowStrikeRange",
    {5, 25, 1},
    "Shadow Strike Range",
    "Set the Range to use Shadow Strike"
)
g(
    "Slider",
    n,
    "APL.Rogue.Subtlety.SubCooldowns",
    {0, 0, 0},
    "--Spells to include in Cooldowns--",
    "This slider does nothing, select spells below"
)
g(
    "CheckButton",
    n,
    "APL.Rogue.Subtlety.IncludedCooldowns.ShadowBlades",
    "Shadow Blades",
    "Include Shadow Blades in Cooldowns"
)
g(
    "CheckButton",
    n,
    "APL.Rogue.Subtlety.IncludedCooldowns.ShadowDance",
    "Shadow Dance",
    "Include Shadow Dance in Cooldowns"
)
g("CheckButton", n, "APL.Rogue.Subtlety.IncludedCooldowns.Vanish", "Vanish", "Include Vanish in Cooldowns")
g(
    "CheckButton",
    n,
    "APL.Rogue.Subtlety.IncludedCooldowns.SymbolsofDeath",
    "Symbols of Death",
    "Include Symbols of Death in Cooldowns"
)
g(
    "CheckButton",
    n,
    "APL.Rogue.Subtlety.IncludedCooldowns.ShurikenTornado",
    "Shuriken Tornado",
    "Include Shuriken Tornado in Cooldowns"
)
g(
    "Slider",
    n,
    "APL.Rogue.Subtlety.SubSmallCooldowns",
    {0, 0, 0},
    "--Spells to include in SmallCooldowns--",
    "This slider does nothing, select spells below"
)
g(
    "CheckButton",
    n,
    "APL.Rogue.Subtlety.IncludedSmallCooldowns.ShadowBlades",
    "Shadow Blades",
    "Include Shadow Blades in SmallCooldowns"
)
g(
    "CheckButton",
    n,
    "APL.Rogue.Subtlety.IncludedSmallCooldowns.ShadowDance",
    "Shadow Dance",
    "Include Shadow Dance in SmallCooldowns"
)
g("CheckButton", n, "APL.Rogue.Subtlety.IncludedSmallCooldowns.Vanish", "Vanish", "Include Vanish in SmallCooldowns")
g(
    "CheckButton",
    n,
    "APL.Rogue.Subtlety.IncludedSmallCooldowns.SymbolsofDeath",
    "Symbols of Death",
    "Include Symbols of Death in SmallCooldowns"
)
g(
    "CheckButton",
    n,
    "APL.Rogue.Subtlety.IncludedSmallCooldowns.ShurikenTornado",
    "Shuriken Tornado",
    "Include Shuriken Tornado in Cooldowns"
)
g(
    "Dropdown",
    n,
    "APL.Rogue.Subtlety.BurnShadowDance",
    {"Always", "On Bosses", "On Bosses not in Dungeons"},
    "Burn Shadow Dance before Death",
    "Use remaining Shadow Dance charges when the target is about to die."
)
g(
    "Slider",
    n,
    "APL.Rogue.Subtlety.EviscerateDMGOffset",
    {1, 5, 0.25},
    "Eviscerate Damage Offset",
    "Set the Eviscerate Damage Offset, used to compute the rupture threshold."
)
g(
    "Slider",
    n,
    "APL.Rogue.Subtlety.ShDEcoCharge",
    {1, 2, 0.1},
    "ShD Eco Charge",
    "Set the Shadow Dance Eco Charge threshold."
)
i(n, "APL.Rogue.Subtlety")
