local a,b=...local c=HeroRotation;local d=HeroLib;local e=d.GUI;local f=e.CreateChildPanel;local g=e.CreatePanelOption;local h=c.GUI.CreateARPanelOption;local i=c.GUI.CreateARPanelOptions;c.GUISettings.APL.Warrior={Commons={HealthstoneHP=25,HealPotHP=20,Enabled={Potions=false,TopTrinket=true,BottomTrinket=true},DisplayStyle={},VictoryRushHP=50,OffGCDasOffGCD={}},Arms={PotionType={Selected="Power"},TargetSwap="Mouseover",UseDefensives=true,UseCharge=false,RallyingCry=20,IgnorePain=50,UseAutoBattleShout=true,GCDasOffGCD={},OffGCDasOffGCD={}},Fury={TargetSwap="AutoSwap",UseDefensives=true,RallyingCry=20,IgnorePain=50,EnragedRegneration=30,UseAutoBattleShout=true,UseCharge=false,OffGCDasOffGCD={},GCDasOffGCD={}},Protection={DisplayStyle={Defensive="Suggested"},OffGCDasOffGCD={},GCDasOffGCD={DemoralizingShout=false,DragonRoar=false,Avatar=false}}}c.GUI.LoadSettingsRecursively(c.GUISettings)local j=c.GUI.Panel;local k=f(j,"Warrior")local l=f(k,"Arms")local m=f(k,"Fury")local n=f(k,"Protection")i(k,"APL.Warrior.Commons")g("Slider",k,"APL.Warrior.Commons.VictoryRushHP",{0,100,1},"Victory Rush HP","Set the Victory Rush/Impending Victory HP threshold. Set to 0 to disable.")g("Slider",k,"APL.Warrior.Commons.HealthstoneHP",{0,100,1},"Healthstone HP %","Set the HP threshold to use Healthstone")g("Slider",k,"APL.Warrior.Commons.HealPotHP",{0,100,1},"Healing Potion HP %","Set the HP threshold to use Healing Potion")i(l,"APL.Warrior.Arms")g("Dropdown",l,"APL.Warrior.Arms.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",l,"APL.Warrior.Arms.UseCharge","Use Charge","Suggest Charge in the Rotation")g("CheckButton",l,"APL.Warrior.Arms.UseDefensives","Use Defensives","Toggle on to show Defensive Abilities")g("CheckButton",l,"APL.Warrior.Arms.UseAutoBattleShout","Use Auto Battle Shout","Suggest Automatic Battle Shout")g("Slider",l,"APL.Warrior.Arms.RallyingCry",{0,100,1},"Rallying Cry HP %","Set the HP threshold to use Rallying Cry")g("Slider",l,"APL.Warrior.Arms.IgnorePain",{0,100,1},"Ignore Pain HP %","Set the HP threshold to use Ignore Pain")i(m,"APL.Warrior.Fury")g("Dropdown",m,"APL.Warrior.Fury.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",m,"APL.Warrior.Fury.UseCharge","Use Charge","Suggest Charge in the Rotation")g("CheckButton",m,"APL.Warrior.Fury.UseAutoBattleShout","Use Auto Battle Shout","Suggest Automatic Battle Shout")g("CheckButton",m,"APL.Warrior.Fury.UseDefensives","Use Defensives","Toggle on to show Defensive Abilities")g("Slider",m,"APL.Warrior.Fury.RallyingCry",{0,100,1},"Rallying Cry HP %","Set the HP threshold to use Rallying Cry")g("Slider",m,"APL.Warrior.Fury.IgnorePain",{0,100,1},"Ignore Pain HP %","Set the HP threshold to use Ignore Pain")g("Slider",m,"APL.Warrior.Fury.EnragedRegneration",{0,100,1},"Enraged Regneration HP %","Set the HP threshold to use Enraged Regneration")i(n,"APL.Warrior.Protection")