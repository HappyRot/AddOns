local a,b=...local c=HeroRotation;local d=HeroLib;local e=d.GUI;local f=e.CreateChildPanel;local g=e.CreatePanelOption;local h=c.GUI.CreateARPanelOption;local i=c.GUI.CreateARPanelOptions;c.GUISettings.APL.Warlock={Commons={Enabled={Potions=true,TopTrinket=true,BottomTrinket=true},AoeMode="Aggresive",DisplayStyle={},HidePetSummon=false,GCDasOffGCD={},OffGCDasOffGCD={}},Destruction={TargetSwap="AutoSwap",GCDasOffGCD={},OffGCDasOffGCD={}},Demonology={ImpsRequiredForImplosion=6,SuppressLateTyrant=false,UnendingResolveHP=20,GCDasOffGCD={SummonPet=false,GrimoireFelguard=false,SummonDemonicTyrant=false,DemonicStrength=false,NetherPortal=true,Implosion=false},OffGCDasOffGCD={UnendingResolve=true,AxeToss=true}},Affliction={GCDasOffGCD={DarkSoul=true,SummonDarkglare=true,SummonPet=false,GrimoireOfSacrifice=true,PhantomSingularity=true},OffGCDasOffGCD={}}}c.GUI.LoadSettingsRecursively(c.GUISettings)local j=c.GUI.Panel;local k=f(j,"Warlock")local l=f(k,"Demonology")local m=f(k,"Affliction")local n=f(k,"Destruction")i(k,"APL.Warlock.Commons")g("Dropdown",k,"APL.Warlock.Commons.AoeMode",{"Aggresive","Conservative"},"AoE Detection Mode","Aggresive: Scans nameplates on your screen and runs them through a filter to check for combat (Bad when pack of mobs is split up)\nConservative: Uses party/raid member casts to detect enemies in range (Slower than Aggresive mode but better when pack is split up)\nAggressive is best used when solo or with a decent tank in M+, Conservative will be best used in Raid or with a bad tank in M+")g("CheckButton",k,"APL.Warlock.Commons.HidePetSummon","Hide Pet Summon","Enable this setting to hide suggestions for summoning your base pet. Rotational pets (Infernal, Darkglare, Tyrant, etc) will still be suggested.")i(n,"APL.Warlock.Destruction")g("Dropdown",n,"APL.Warlock.Destruction.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("Slider",l,"APL.Warlock.Demonology.ImpsRequiredForImplosion",{3,9,1},"Imps Required for Implosion","Set the number of Imps required for Implosion.")g("Slider",l,"APL.Warlock.Demonology.UnendingResolveHP",{0,100,1},"Unending Resolve HP","Set the Unending Resolve HP threshold.")g("CheckButton",l,"APL.Warlock.Demonology.SuppressLateTyrant","Suppress Late Tyrant Casts","Enable this setting to suppress Demonic Tyrant cast suggestions due to the target dying soon. This could be useful for AoE scenarios or Mythic+ scenarios.")i(l,"APL.Warlock.Demonology")i(m,"APL.Warlock.Affliction")