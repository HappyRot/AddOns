local a,b=...local c=HeroRotation;local d=HeroLib;local e=d.GUI;local f=e.CreateChildPanel;local g=e.CreatePanelOption;local h=c.GUI.CreateARPanelOption;local i=c.GUI.CreateARPanelOptions;c.GUISettings.APL.Priest={Commons={Enabled={Potions=true,Trinkets=true},DisplayStyle={},GCDasOffGCD={},OffGCDasOffGCD={}},Shadow={TargetSwap="Mouseover",DispersionHP=30,SelfPI=true,GCDasOffGCD={},OffGCDasOffGCD={}},Discipline={GCDasOffGCD={Mindbender=true,PowerInfusion=true,ShadowCovenant=true},OffGCDasOffGCD={}},Holy={GCDasOffGCD={Apotheosis=true,DivineStar=true,Halo=true},OffGCDasOffGCD={}}}c.GUI.LoadSettingsRecursively(c.GUISettings)local j=c.GUI.Panel;local k=f(j,"Priest")local l=f(k,"Shadow")local m=f(k,"Discipline")local n=f(k,"Holy")i(k,"APL.Priest.Commons")g("Dropdown",l,"APL.Priest.Shadow.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("Slider",l,"APL.Priest.Shadow.DispersionHP",{0,100,1},"Dispersion HP","Set the Dispersion HP threshold.")g("CheckButton",l,"APL.Priest.Shadow.SelfPI","Assume Self-Power Infusion","Assume the player will be using Power Infusion on themselves.")i(l,"APL.Priest.Shadow")i(m,"APL.Priest.Discipline")i(n,"APL.Priest.Holy")