local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=HeroRotation;local m=l.Cast;local n=l.CDsON;local o=l.AoEON;local p=HeroRotationCharDB.Toggles[4]local q=HeroRotationCharDB.Toggles[5]local r=not HeroRotationCharDB.Toggles[15]local s=HeroRotationCharDB.Toggles[12]local t=HeroRotationCharDB.Toggles[13]local u=HeroRotationCharDB.Toggles[14]local v=HeroRotationCharDB.Toggles[16]local w=HeroRotationCharDB.Toggles[81]local x=HeroRotationCharDB.Toggles[110]local y=HeroRotationCharDB.Toggles[17]local z=HeroRotationCharDB.Toggles[111]local A=HeroRotationCharDB.Toggles[18]local B=false;local C=0;local strsplit=strsplit;local GetInventoryItemLink=GetInventoryItemLink;local D=j.DeathKnight.Frost;local E=k.DeathKnight.Frost;local F={}local G=g:GetEquipment()local H=G[13]and k(G[13])or k(0)local I=G[14]and k(G[14])or k(0)local J,K=GetInventoryItemID("player",13)local L,K=GetInventoryItemID("player",14)local M;local N;local O;local P;local Q,R;local S;local T;local U;local V;local W;local X;local Y;local Z;local _;local a0;local a1;local a2=11111;local a3=11111;local a4=d.GhoulTable;local a5,a6;local a7=0;local a8=0;local a9=0;d:RegisterForEvent(function()a2=11111;a3=11111 end,"PLAYER_REGEN_ENABLED")local aa=l.Commons.Everyone;local ab={General=l.GUISettings.General,Commons=l.GUISettings.APL.DeathKnight.Commons,Commons2=l.GUISettings.APL.DeathKnight.Commons2,Frost=l.GUISettings.APL.DeathKnight.Frost}local function ac(ad)if ad then return 1 else return 0 end end;local function ae(ad)return ad~=0 end;local af=GetInventoryItemLink("player",16)or""local ag=GetInventoryItemLink("player",17)or""local K,K,ah=strsplit(":",af)local K,K,ai=strsplit(":",ag)local N=ah=="3370"or ai=="3370"local O=ah=="3368"or ai=="3368"local aj=ah=="6243"or ai=="6243"local ak=IsEquippedItemType("Two-Hand")d:RegisterForEvent(function()G=g:GetEquipment()H=G[13]and k(G[13])or k(0)I=G[14]and k(G[14])or k(0)af=GetInventoryItemLink("player",16)or""ag=GetInventoryItemLink("player",17)or""K,K,ah=strsplit(":",af)K,K,ai=strsplit(":",ag)N=ah=="3370"or ai=="3370"O=ah=="3368"or ai=="3368"ak=IsEquippedItemType("Two-Hand")end,"PLAYER_EQUIPMENT_CHANGED")local function al()return ab.General.SoloMode and(g:HealthPercentage()<ab.Commons.UseDeathStrikeHP or g:HealthPercentage()<ab.Commons.UseDarkSuccorHP and g:BuffUp(D.DeathStrikeBuff))end;local function am(an)return(an:DebuffStack(D.RazoriceDebuff)+1)/(an:DebuffRemains(D.RazoriceDebuff)+1)*ac(N)end;local function ao(an)return an:DebuffDown(D.FrostFeverDebuff)end;local function ap(an)if(an:AffectingCombat()or an:IsDummy()or an:NPCID()==153285 or an:NPCID()==168326 or UnitExists("boss1"))and an:IsInMeleeRange(8)and an:GUID()==f("mouseover"):GUID()then a7=149143;return true elseif(an:AffectingCombat()or an:IsDummy()or an:NPCID()==153285 or an:NPCID()==168326 or UnitExists("boss1"))and an:IsInMeleeRange(8)and ab.Frost.TargetSwap=="AutoSwap"and an:GUID()~=h:GUID()and not s then a7=9999;return true elseif(an:AffectingCombat()or an:IsDummy()or an:NPCID()==153285 or an:NPCID()==168326 or UnitExists("boss1"))and an:IsInMeleeRange(8)and an:GUID()==h:GUID()then a8=49143;return true elseif(an:AffectingCombat()or an:IsDummy()or an:NPCID()==153285 or an:NPCID()==168326 or UnitExists("boss1"))and an:IsInMeleeRange(8)then return true end end;local function aq(an)if(an:AffectingCombat()or an:IsDummy()or an:NPCID()==153285 or an:NPCID()==168326 or UnitExists("boss1"))and an:IsInMeleeRange(8)and an:GUID()==f("mouseover"):GUID()then a7=149020;return true elseif(an:AffectingCombat()or an:IsDummy()or an:NPCID()==153285 or an:NPCID()==168326 or UnitExists("boss1"))and an:IsInMeleeRange(8)and ab.Frost.TargetSwap=="AutoSwap"and an:GUID()~=h:GUID()and not s then a7=9999;return true elseif(an:AffectingCombat()or an:IsDummy()or an:NPCID()==153285 or an:NPCID()==168326 or UnitExists("boss1"))and an:IsInMeleeRange(8)and an:GUID()==h:GUID()then a8=49020;return true elseif(an:AffectingCombat()or an:IsDummy()or an:NPCID()==153285 or an:NPCID()==168326 or UnitExists("boss1"))and an:IsInMeleeRange(8)then return true end end;local function ar()q=HeroRotationCharDB.Toggles[5]p=HeroRotationCharDB.Toggles[4]or n()s=HeroRotationCharDB.Toggles[12]t=HeroRotationCharDB.Toggles[13]u=HeroRotationCharDB.Toggles[14]r=not HeroRotationCharDB.Toggles[15]v=HeroRotationCharDB.Toggles[16]w=HeroRotationCharDB.Toggles[81]x=HeroRotationCharDB.Toggles[110]y=HeroRotationCharDB.Toggles[17]z=HeroRotationCharDB.Toggles[111]A=HeroRotationCharDB.Toggles[18]B=false;C=0;for as=1,20 do if select(10,UnitDebuff("player",as))==240447 then if select(6,UnitDebuff("player",as))~=nil then C=select(6,UnitDebuff("player",as))-GetTime()end end end;J=GetInventoryItemID("player",13)L=GetInventoryItemID("player",14)if not ab.Commons.Enabled.TopTrinket and not ab.Commons.Enabled.BottomTrinket then F={J,L}elseif not ab.Commons.Enabled.TopTrinket then F={J}elseif not ab.Commons.Enabled.BottomTrinket then F={L}end end;local function at()VarERWPoolingTime=ab.Frost.AMSAbsorbPercent>59 and 25 or 45;if D.HowlingBlast:IsReady()and not h:IsInRange(8)then if m(D.HowlingBlast,nil,nil,not h:IsInRange(30))then a8=49184;return"howling_blast precombat"end end;if D.RemorselessWinter:IsReady()and h:IsInRange(8)then if m(D.RemorselessWinter,nil,nil,not h:IsInRange(8))then a8=196770;return"remorseless_winter precombat"end end end;local function au()if D.HowlingBlast:IsReady()and(g:BuffUp(D.RimeBuff)or h:DebuffDown(D.FrostFeverDebuff))then if m(D.HowlingBlast,nil,nil,not h:IsInRange(30))then a8=49184;return"howling_blast aoe 8"end end;if D.GlacialAdvance:IsReady()and(not a1 and W)then if m(D.GlacialAdvance,nil,nil,not h:IsInRange(30))then a8=194913;return"glacial_advance aoe 4"end end;if D.Obliterate:IsReady()and(g:BuffUp(D.KillingMachineBuff)and D.CleavingStrikes:IsAvailable()and g:BuffUp(D.DeathAndDecayBuff)and not Y)then if aa.CastTargetIf(D.Obliterate,a5,"max",am,aq,not h:IsInMeleeRange(8))then return"obliterate aoe 8"end end;if D.GlacialAdvance:IsReady()and not a1 then if m(D.GlacialAdvance,nil,nil,not h:IsInRange(30))then a8=194913;return"glacial_advance aoe 10"end end;if D.Frostscythe:IsReady()and Y then if m(D.Frostscythe,nil,nil,not h:IsInRange(8))then a8=207230;return"frostscythe aoe 6"end end;if D.Obliterate:IsReady()and not Y then if aa.CastTargetIf(D.Obliterate,a5,"max",am,aq,not h:IsInMeleeRange(8))then return"obliterate aoe 24"end end;if D.FrostStrike:IsReady()and(not a1 and not D.GlacialAdvance:IsAvailable())then if aa.CastTargetIf(D.FrostStrike,a5,"max",am,ap,not h:IsInMeleeRange(8))then return"froststrike aoe 26"end end;if D.HornofWinter:IsCastable()and(g:Rune()<2 and g:RunicPowerDeficit()>25)then if m(D.HornofWinter,nil)then a8=57330;return"horn_of_winter aoe 32"end end;if D.ArcaneTorrent:IsCastable()and n()and ab.Commons.Enabled.Racials and g:RunicPowerDeficit()>25 then if m(D.ArcaneTorrent,nil,nil,not h:IsInRange(8))then a8=155145;return"arcane_torrent aoe 34"end end end;local function av()if D.HowlingBlast:IsReady()and(V and g:RunicPower()>45-ac(D.RageoftheFrozenChampion:IsAvailable())*8)then if m(D.HowlingBlast,nil,nil,not h:IsInRange(30))then a8=49184;return"howling_blast breath 4"end end;if D.HornofWinter:IsReady()and(g:Rune()<2 and g:RunicPowerDeficit()>25)then if m(D.HornofWinter,nil)then a8=57330;return"horn_of_winter breath 6"end end;if D.Obliterate:IsReady()and(g:BuffUp(D.KillingMachineBuff)and not Y)then if aa.CastTargetIf(D.Obliterate,a5,"max",am,aq,not h:IsInMeleeRange(8))then return"obliterate breath 8"end end;if D.Frostscythe:IsReady()and(g:BuffUp(D.KillingMachineBuff)and Y)then if m(D.Frostscythe,nil,nil,not h:IsInRange(8))then a8=207230;return"frostscythe breath 10"end end;if D.Frostscythe:IsReady()and(Y and g:RunicPower()>45)then if m(D.Frostscythe,nil,nil,not h:IsInRange(8))then a8=207230;return"frostscythe breath 12"end end;if D.Obliterate:IsReady()and(g:RunicPowerDeficit()>40 or g:BuffUp(D.PillarofFrostBuff)and g:RunicPowerDeficit()>17)then if aa.CastTargetIf(D.Obliterate,a5,"max",am,nil,not h:IsInMeleeRange(5))then return"obliterate breath 14"end end;if D.DeathAndDecay:IsReady()and(g:RunicPower()<36 and g:RuneTimeToX(2)>g:RunicPower()/18)then if m(D.DeathAndDecay,nil,nil,not h:IsSpellInRange(D.DeathAndDecay))then a8=43265;return"death_and_decay breath 16"end end;if D.RemorselessWinter:IsReady()and(g:RunicPower()<36 and g:RuneTimeToX(2)>g:RunicPower()/18)then if m(D.RemorselessWinter,nil,nil,not h:IsInRange(8))then a8=196770;return"remorseless_winter breath 18"end end;if D.HowlingBlast:IsReady()and(g:RunicPower()<36 and g:RuneTimeToX(2)>g:RunicPower()/18)then if m(D.HowlingBlast,nil,nil,not h:IsInRange(30))then a8=49184;return"howling_blast breath 20"end end;if D.Obliterate:IsReady()and g:RunicPowerDeficit()>25 then if aa.CastTargetIf(D.Obliterate,a5,"max",am,aq,not h:IsInMeleeRange(8))then return"obliterate breath 22"end end;if D.HowlingBlast:IsReady()and g:BuffUp(D.RimeBuff)then if m(D.HowlingBlast,nil,nil,not h:IsInRange(30))then a8=49184;return"howling_blast breath 24"end end;if D.ArcaneTorrent:IsReady()and g:RunicPower()<60 and ab.Commons.Enabled.Racials then if m(D.ArcaneTorrent,nil,nil,not h:IsInRange(8))then a8=155145;return"arcane_torrent bosticking 20"end end end;local function aw()if D.Frostscythe:IsReady()and(g:BuffUp(D.KillingMachineBuff)and Y)then if m(D.Frostscythe,nil,nil,not h:IsInRange(8))then a8=207230;return"frostscythe breath_oblit 2"end end;if D.Obliterate:IsReady()and g:BuffUp(D.KillingMachineBuff)then if aa.CastTargetIf(D.Obliterate,a5,"max",am,aq,not h:IsInMeleeRange(8))then return"obliterate breath_oblit 4"end end;if D.HowlingBlast:IsReady()and g:BuffUp(D.RimeBuff)then if m(D.HowlingBlast)then a8=49184;return"howling_blast breath_oblit 2"end end;if D.HowlingBlast:IsReady()and g:BuffDown(D.KillingMachineBuff)then if m(D.HowlingBlast)then a8=49184;return"howling_blast breath_oblit 2"end end;if D.HornofWinter:IsReady()and g:RunicPowerDeficit()>25 then if m(D.HornofWinter,nil)then a8=57330;return"horn_of_winter breath_oblit 32"end end;if D.ArcaneTorrent:IsCastable()and n()and ab.Commons.Enabled.Racials and g:RunicPowerDeficit()>25 then if m(D.ArcaneTorrent,nil,nil,not h:IsInRange(8))then a8=155145;return"arcane_torrent breath_oblit 34"end end end;local function ax()if D.ChainsofIce:IsReady()and(a3<g:GCD()and(g:Rune()<2 or g:BuffDown(D.KillingMachineBuff)and(not ak and g:BuffStack(D.ColdHeartBuff)>=4 or ak and g:BuffStack(D.ColdHeartBuff)>8)or g:BuffUp(D.KillingMachineBuff)and(not ak and g:BuffStack(D.ColdHeartBuff)>8 or ak and g:BuffStack(D.ColdHeartBuff)>10)))then if m(D.ChainsofIce,nil,nil,not h:IsInRange(30))then a8=45524;return"chains_of_ice coldheart 2"end end;if D.ChainsofIce:IsReady()and(not D.Obliteration:IsAvailable()and g:BuffUp(D.PillarofFrostBuff)and g:BuffStack(D.ColdHeartBuff)>=10 and(g:BuffRemains(D.PillarofFrostBuff)<g:GCD()*(1+ac(D.FrostwyrmsFury:IsAvailable()and D.FrostwyrmsFury:IsReady()))or g:BuffUp(D.UnholyStrengthBuff)and g:BuffRemains(D.UnholyStrengthBuff)<g:GCD()))then if m(D.ChainsofIce,nil,nil,not h:IsInRange(30))then a8=45524;return"chains_of_ice coldheart 4"end end;if D.ChainsofIce:IsReady()and(not D.Obliteration:IsAvailable()and O and g:BuffDown(D.PillarofFrostBuff)and D.PillarofFrost:CooldownRemains()>15 and(g:BuffStack(D.ColdHeartBuff)>=10 and g:BuffUp(D.UnholyStrengthBuff)or g:BuffStack(D.ColdHeartBuff)>=13))then if m(D.ChainsofIce,nil,nil,not h:IsInRange(30))then a8=45524;return"chains_of_ice coldheart 6"end end;if D.ChainsofIce:IsReady()and(not D.Obliteration:IsAvailable()and not O and g:BuffStack(D.ColdHeartBuff)>=10 and g:BuffDown(D.PillarofFrostBuff)and D.PillarofFrost:CooldownRemains()>20)then if m(D.ChainsofIce,nil,nil,not h:IsInRange(30))then a8=45524;return"chains_of_ice coldheart 8"end end;if D.ChainsofIce:IsReady()and(D.Obliteration:IsAvailable()and g:BuffDown(D.PillarofFrostBuff)and(g:BuffStack(D.ColdHeartBuff)>=14 and g:BuffUp(D.UnholyStrengthBuff)or g:BuffStack(D.ColdHeartBuff)>=19 or D.PillarofFrost:CooldownRemains()<3 and g:BuffStack(D.ColdHeartBuff)>=14))then if m(D.ChainsofIce,nil,nil,not h:IsInRange(30))then a8=45524;return"chains_of_ice coldheart 10"end end end;local function ay()if ab.Commons.Enabled.Potions and n()and ab.Commons.Enabled.Potions and r and((X or a3<25)and not l.GUISettings.General.HoldPotforBL or l.GUISettings.General.HoldPotforBL and g:BloodlustUp())then local az=aa.PotionSelected()if az and az:IsReady()then if m(az,nil,nil)then a8=37;return"potion cooldowns 2"end end end;if D.EmpowerRuneWeapon:IsCastable()and n()and(D.Obliteration:IsAvailable()and g:BuffDown(D.EmpowerRuneWeaponBuff)and g:Rune()<6 and(D.PillarofFrost:CooldownRemains()<7 and(U or T)or g:BuffUp(D.PillarofFrostBuff))or a3<20)then if m(D.EmpowerRuneWeapon,nil)then a8=147568;return"empower_rune_weapon cooldowns 4"end end;if D.EmpowerRuneWeapon:IsCastable()and n()and(g:BuffUp(D.BreathofSindragosa)and g:BuffDown(D.EmpowerRuneWeaponBuff)and(d.CombatTime()<10 and g:BloodlustUp()or g:RunicPower()<70 and g:Rune()<3 and(D.BreathofSindragosa:CooldownRemains()>VarERWPoolingTime or D.EmpowerRuneWeapon:FullRechargeTime()<10)))then if m(D.EmpowerRuneWeapon,nil)then a8=147568;return"empower_rune_weapon cooldowns 6"end end;if D.EmpowerRuneWeapon:IsCastable()and n()and(not D.BreathofSindragosa:IsAvailable()and not D.Obliteration:IsAvailable()and g:BuffDown(D.EmpowerRuneWeaponBuff)and g:Rune()<5 and(D.PillarofFrost:CooldownRemains()<7 or g:BuffUp(D.PillarofFrostBuff)or not D.PillarofFrost:IsAvailable()))then if m(D.EmpowerRuneWeapon,nil)then a8=147568;return"empower_rune_weapon cooldowns 8"end end;if D.AbominationLimb:IsCastable()and(D.Obliteration:IsAvailable()and g:BuffDown(D.PillarofFrostBuff)and D.PillarofFrost:CooldownRemains()<3 and(U or T)or a3<12)then if m(D.AbominationLimb,nil,nil,not h:IsInRange(10))then a8=315443;return"abomination_limb cooldowns 10"end end;if D.AbominationLimb:IsReady()and not A and(D.BreathofSindragosa:IsAvailable()and(U or T))then if m(D.AbominationLimb,nil,nil,not h:IsInRange(10))then a8=315443;return"abomination_limb cooldowns 10"end end;if D.AbominationLimb:IsReady()and not A and(not D.BreathofSindragosa:IsAvailable()and not D.Obliteration:IsAvailable()and(U or T))then if m(D.AbominationLimb,nil,nil,not h:IsInRange(20))then a8=315443;return"abomination_limb_talent cooldowns 12"end end;if D.ChillStreak:IsReady()and g:HasTier(31,2)then if m(D.ChillStreak,nil,nil,not h:IsSpellInRange(D.ChillStreak))then a8=315443;return"chill_streak cooldowns 15"end end;if D.ChillStreak:IsReady()and p and(not g:HasTier(31,2)and a6>=2 and(g:BuffDown(D.DeathAndDecayBuff)and D.CleavingStrikes:IsAvailable()or not D.CleavingStrikes:IsAvailable()or a6<=5))then if m(D.ChillStreak,nil,nil,not h:IsSpellInRange(D.ChillStreak))then a8=305392;return"chill_streak cooldowns 14"end end;if p and D.PillarofFrost:IsCastable()and(D.Obliteration:IsAvailable()and(U or T)and(g:BuffUp(D.EmpowerRuneWeaponBuff)or D.EmpowerRuneWeapon:CooldownRemains()>0)or a3<12)then if m(D.PillarofFrost,nil)then a8=51271;return"pillar_of_frost cooldowns 10"end end;if p and D.PillarofFrost:IsCastable()and(D.BreathofSindragosa:IsAvailable()and(U or T)and(not D.Icecap:IsAvailable()and(g:RunicPower()>70 or D.BreathofSindragosa:CooldownRemains()>40)or D.Icecap:IsAvailable()and(D.BreathofSindragosa:CooldownRemains()>10 or g:BuffUp(D.BreathofSindragosa))))then if m(D.PillarofFrost,nil)then a8=51271;return"pillar_of_frost cooldowns 10"end end;if p and D.PillarofFrost:IsCastable()and(D.Icecap:IsAvailable()and not D.Obliteration:IsAvailable()and not D.BreathofSindragosa:IsAvailable()and(U or T))then if m(D.PillarofFrost,nil)then a8=51271;return"pillar_of_frost cooldowns 12"end end;if D.BreathofSindragosa:IsCastable()and not B and n()and not z and(g:BuffDown(D.BreathofSindragosa)and g:RunicPower()>=ab.Frost.MinimumBoS and(U or T)or a3<30)then if m(D.BreathofSindragosa,nil,nil,not h:IsInRange(8))then a8=152279;return"breath_of_sindragosa cooldowns 16"end end;if not x and n()and D.FrostwyrmsFury:IsCastable()and(a6==1 and(D.PillarofFrost:IsAvailable()and g:BuffRemains(D.PillarofFrostBuff)<g:GCD()*2 and g:BuffUp(D.PillarofFrostBuff)and not D.Obliteration:IsAvailable()or not D.PillarofFrost:IsAvailable())or a3<3)then if m(D.FrostwyrmsFury,nil,nil,not h:IsInRange(40))then a8=279302;return"frostwyrms_fury cooldowns 18"end end;if not x and n()and D.FrostwyrmsFury:IsCastable()and(a6>=2 and(D.PillarofFrost:IsAvailable()and g:BuffUp(D.PillarofFrostBuff))and g:BuffRemains(D.PillarofFrostBuff)<g:GCD()*2)then if m(D.FrostwyrmsFury,nil,nil,not h:IsInRange(40))then a8=279302;return"frostwyrms_fury cooldowns 20"end end;if D.FrostwyrmsFury:IsCastable()and not x and n()and(D.Obliteration:IsAvailable()and(D.PillarofFrost:IsAvailable()and g:BuffUp(D.PillarofFrostBuff)and not ak or g:BuffDown(D.PillarofFrostBuff)and ak and D.PillarofFrost:CooldownRemains()>0 or not D.PillarofFrost:IsAvailable())and((g:BuffRemains(D.PillarofFrostBuff)<g:GCD()or g:BuffUp(D.UnholyStrengthBuff)and g:BuffRemains(D.UnholyStrengthBuff)<g:GCD())and(h:DebuffStack(D.RazoriceDebuff)==5 or not N and not D.GlacialAdvance:IsAvailable())))then if m(D.FrostwyrmsFury,nil,nil,not h:IsInRange(40))then a8=279302;return"frostwyrms_fury cooldowns 22"end end;if D.RaiseDead:IsCastable()and n()then if m(D.RaiseDead,nil,nil)then a8=46585;return"raise_dead cooldowns 26"end end;if D.SoulReaper:IsReady()and(a3>5 and h:TimeToX(35)<5 and a6<=2 and(g:BuffUp(D.BreathofSindragosa)and g:RunicPower()>40 or g:BuffDown(D.BreathofSindragosa)and not D.Obliteration:IsAvailable()or D.Obliteration:IsAvailable()and g:BuffDown(D.PillarofFrostBuff)))then if m(D.SoulReaper,nil,nil,not h:IsSpellInRange(D.SoulReaper))then a8=343294;return"soul_reaper cooldowns 24"end end;if D.SacrificialPact:IsReady()and(not D.GlacialAdvance:IsAvailable()and g:BuffDown(D.BreathofSindragosa)and a4:remains()<g:GCD()*2 and a6>3)then if m(D.SacrificialPact,nil,nil,not h:IsInRange(8))then a8=237574;return"sacrificial_pact cooldowns 28"end end;if D.DeathAndDecay:IsReady()and(g:BuffDown(D.DeathAndDecayBuff)and U and(g:BuffUp(D.PillarofFrostBuff)and g:BuffRemains(D.PillarofFrostBuff)>5 or g:BuffDown(D.PillarofFrostBuff))and(a6>5 or D.CleavingStrikes:IsAvailable()and a6>=2))then if m(D.DeathAndDecay,nil)then a8=43265;return"death_and_decay cooldowns 30"end end end;local function aA()if D.HowlingBlast:IsReady()and(h:DebuffDown(D.FrostFeverDebuff)and a6>=2 and(not D.Obliteration:IsAvailable()or D.Obliteration:IsAvailable()and(D.PillarofFrost:CooldownDown()or g:BuffUp(D.PillarofFrostBuff)and g:BuffDown(D.KillingMachineBuff))))then if m(D.HowlingBlast,nil,nil,not h:IsSpellInRange(D.HowlingBlast))then a8=49184;return"howling_blast high_prio_actions 6"end end;if D.GlacialAdvance:IsReady()and(a6>=2 and W and D.Obliteration:IsAvailable()and D.BreathofSindragosa:IsAvailable()and g:BuffDown(D.PillarofFrostBuff)and g:BuffDown(D.BreathofSindragosa)and D.BreathofSindragosa:CooldownRemains()>_)then if m(D.GlacialAdvance,nil,nil,not h:IsInRange(100))then a8=194913;return"glacial_advance high_prio_actions 8"end end;if D.GlacialAdvance:IsReady()and(a6>=2 and W and D.BreathofSindragosa:IsAvailable()and g:BuffDown(D.BreathofSindragosa)and D.BreathofSindragosa:CooldownRemains()>_)then if m(D.GlacialAdvance,nil,nil,not h:IsInRange(100))then a8=194913;return"glacial_advance high_prio_actions 10"end end;if D.GlacialAdvance:IsReady()and(a6>=2 and W and not D.BreathofSindragosa:IsAvailable()and D.Obliteration:IsAvailable()and g:BuffDown(D.PillarofFrostBuff))then if m(D.GlacialAdvance,nil,nil,not h:IsInRange(100))then a8=194913;return"glacial_advance high_prio_actions 12"end end;if D.FrostStrike:IsReady()and(a6==1 and W and D.Obliteration:IsAvailable()and D.BreathofSindragosa:IsAvailable()and g:BuffDown(D.PillarofFrostBuff)and g:BuffDown(D.BreathofSindragosa)and D.BreathofSindragosa:CooldownRemains()>_)then if m(D.FrostStrike,nil,nil,not h:IsSpellInRange(D.FrostStrike))then a8=49143;return"frost_strike high_prio_actions 14"end end;if D.FrostStrike:IsReady()and(a6==1 and W and D.BreathofSindragosa:IsAvailable()and g:BuffDown(D.BreathofSindragosa)and D.BreathofSindragosa:CooldownRemains()>_)then if m(D.FrostStrike,nil,nil,not h:IsSpellInRange(D.FrostStrike))then a8=49143;return"frost_strike high_prio_actions 16"end end;if D.FrostStrike:IsReady()and(a6==1 and W and not D.BreathofSindragosa:IsAvailable()and D.Obliteration:IsAvailable()and g:BuffDown(D.PillarofFrostBuff))then if m(D.FrostStrike,nil,nil,not h:IsSpellInRange(D.FrostStrike))then a8=49143;return"frost_strike high_prio_actions 18"end end;if D.RemorselessWinter:IsReady()and(P or U)then if m(D.RemorselessWinter,nil,nil,not h:IsInMeleeRange(8))then a8=196770;return"remorseless_winter high_prio_actions 22"end end end;local function aB()if D.HowlingBlast:IsReady()and(g:BuffStack(D.KillingMachineBuff)<2 and g:BuffRemains(D.PillarofFrostBuff)<g:GCD()and g:BuffUp(D.RimeBuff))then if m(D.HowlingBlast,nil,nil,not h:IsSpellInRange(D.HowlingBlast))then a8=49184;return"howling_blast obliteration 4"end end;if D.FrostStrike:IsReady()and((a6<=1 or not D.GlacialAdvance:IsAvailable())and g:BuffStack(D.KillingMachineBuff)<2 and g:BuffRemains(D.PillarofFrostBuff)<g:GCD()and g:BuffDown(D.DeathAndDecayBuff))then if m(D.FrostStrike,nil,nil,not h:IsInMeleeRange(5))then a8=49143;return"frost_strike obliteration 6"end end;if D.GlacialAdvance:IsReady()and(g:BuffStack(D.KillingMachineBuff)<2 and g:BuffRemains(D.PillarofFrostBuff)<g:GCD()and g:BuffDown(D.DeathAndDecayBuff))then if m(D.GlacialAdvance,nil,nil,not h:IsInRange(100))then a8=194913;return"glacial_advance obliteration 8"end end;if D.Obliterate:IsReady()and(g:BuffUp(D.KillingMachineBuff)and not Y)then if aa.CastTargetIf(D.Obliterate,a5,"max",am,aq,not h:IsInMeleeRange(8))then return"obliterate obliteration 6"end end;if D.Frostscythe:IsReady()and(g:BuffUp(D.KillingMachineBuff)and Y)then if m(D.Frostscythe,nil,nil,not h:IsInRange(8))then a8=207230;return"frostscythe obliteration 8"end end;if D.HowlingBlast:IsReady()and(g:BuffDown(D.KillingMachineBuff)and(h:DebuffDown(D.FrostFeverDebuff)or g:BuffUp(D.RimeBuff)and g:HasTier(30,2)and not W))then if m(D.HowlingBlast,nil,nil,not h:IsInRange(30))then a8=49184;return"howling_blast obliteration 10"end end;if D.GlacialAdvance:IsReady()and(g:BuffDown(D.KillingMachineBuff)and(not N and(not D.Avalanche:IsAvailable()or h:DebuffStack(D.RazoriceDebuff)<5 or h:DebuffRemains(D.RazoriceDebuff)<g:GCD()*3)or(W or g:Rune()<2)and a6>1))then if m(D.GlacialAdvance,nil,nil,not h:IsInRange(100))then a8=194913;return"glacial_advance obliteration 16"end end;if D.FrostStrike:IsReady()and(g:BuffDown(D.KillingMachineBuff)and(g:Rune()<2 or W or h:DebuffStack(D.RazoriceDebuff)==5 and D.ShatteringBlade:IsAvailable())and not a1 and(not D.GlacialAdvance:IsAvailable()or a6==1))then if m(D.FrostStrike,nil,nil,not h:IsInMeleeRange(5))then a8=49143;return"frost_strike obliteration 18"end end;if D.HowlingBlast:IsReady()and(g:BuffUp(D.RimeBuff)and g:BuffDown(D.KillingMachineBuff))then if m(D.HowlingBlast,nil,nil,not h:IsSpellInRange(D.HowlingBlast))then a8=49184;return"howling_blast obliteration 20"end end;if D.FrostStrike:IsReady()and(g:BuffDown(D.KillingMachineBuff)and not a1 and(not D.GlacialAdvance:IsAvailable()or a6==1))then if aa.CastTargetIf(D.FrostStrike,a5,"max",am,ap,not h:IsInMeleeRange(8))then return"froststrike obliteration 18"end end;if D.HowlingBlast:IsReady()and(g:BuffDown(D.KillingMachineBuff)and g:RunicPower()<25)then if m(D.HowlingBlast,nil,nil,not h:IsInRange(30))then a8=49184;return"howling_blast obliteration 20"end end;if D.ArcaneTorrent:IsCastable()and n()and ab.Commons.Enabled.Racials and(g:Rune()<1 and g:RunicPower()<25)then if m(D.ArcaneTorrent,nil,nil,not h:IsInRange(8))then a8=155145;return"arcane_torrent obliteration 22"end end;if D.GlacialAdvance:IsReady()and(not a1 and a6>=2)then if m(D.GlacialAdvance,nil,nil,h:IsInRange(100))then a8=194913;return"glacial_advance obliteration 24"end end;if D.FrostStrike:IsReady()and(not a1 and(not D.GlacialAdvance:IsAvailable()or a6==1))then if aa.CastTargetIf(D.FrostStrike,a5,"max",am,ap)then return"frost_strike obliteration 26"end end;if D.HowlingBlast:IsReady()and g:BuffUp(D.RimeBuff)then if m(D.HowlingBlast,nil,nil,not h:IsInRange(30))then a8=49184;return"howling_blast obliteration 28"end end;if D.Obliterate:IsReady()then if aa.CastTargetIf(D.Obliterate,a5,"max",am,aq)then return"obliterate obliteration 30"end end end;local function aC()if D.FrostStrike:IsReady()and(g:BuffStack(D.KillingMachineBuff)<2 and g:RunicPowerDeficit()<20 and not ak)then if m(D.FrostStrike,nil,nil,not h:IsInMeleeRange(5))then a8=49143;return"frost_strike single_target 4"end end;if D.HowlingBlast:IsReady()and(g:BuffUp(D.RimeBuff)and g:HasTier(30,2)and g:BuffStack(D.KillingMachineBuff)<2)then if m(D.HowlingBlast,nil,nil,not h:IsSpellInRange(D.HowlingBlast))then a8=49184;return"howling_blast single_target 6"end end;if D.Frostscythe:IsReady()and(g:BuffUp(D.KillingMachineBuff)and Y)then if m(D.Frostscythe,nil,nil,not h:IsInMeleeRange(8))then a8=207230;return"frostscythe single_target 8"end end;if D.Obliterate:IsReady()and g:BuffUp(D.KillingMachineBuff)then if m(D.Obliterate,nil,nil,not h:IsInMeleeRange(5))then a8=49020;return"obliterate single_target 10"end end;if D.HowlingBlast:IsReady()and(g:BuffUp(D.RimeBuff)and D.Icebreaker:TalentRank()==2)then if m(D.HowlingBlast,nil,nil,not h:IsSpellInRange(D.HowlingBlast))then a8=49184;return"howling_blast single_target 12"end end;if D.HornofWinter:IsReady()and(g:Rune()<4 and g:RunicPowerDeficit()>25 and D.Obliteration:IsAvailable()and D.BreathofSindragosa:IsAvailable())then if m(D.HornofWinter,nil)then a8=57330;return"horn_of_winter single_target 14"end end;if D.FrostStrike:IsReady()and(not a1 and(W or g:RunicPowerDeficit()<25 or h:DebuffStack(D.RazoriceDebuff)==5 and D.ShatteringBlade:IsAvailable()))then if m(D.FrostStrike,nil,nil,not h:IsInMeleeRange(5))then a8=49143;return"frost_strike single_target 16"end end;if D.HowlingBlast:IsReady()and V then if m(D.HowlingBlast,nil,nil,not h:IsSpellInRange(D.HowlingBlast))then a8=49184;return"howling_blast single_target 18"end end;if D.GlacialAdvance:IsReady()and(not a1 and not N and(h:DebuffStack(D.RazoriceDebuff)<5 or h:DebuffRemains(D.RazoriceDebuff)<g:GCD()*3))then if m(D.GlacialAdvance,nil,nil,not h:IsInRange(100))then a8=194913;return"glacial_advance single_target 20"end end;if D.Obliterate:IsReady()and not a0 then if m(D.Obliterate,nil,nil,not h:IsInMeleeRange(5))then a8=49020;return"obliterate single_target 22"end end;if D.HornofWinter:IsReady()and(g:Rune()<4 and g:RunicPowerDeficit()>25 and(not D.BreathofSindragosa:IsAvailable()or D.BreathofSindragosa:CooldownRemains()>45))then if m(D.HornofWinter,nil)then a8=57330;return"horn_of_winter single_target 24"end end;if n()and D.ArcaneTorrent:IsReady()and g:RunicPowerDeficit()>20 then if m(D.ArcaneTorrent,nil)then a8=155145;return"arcane_torrent single_target 26"end end;if D.FrostStrike:IsReady()and not a1 then if m(D.FrostStrike,nil,nil,not h:IsInMeleeRange(5))then a8=49143;return"frost_strike single_target 28"end end end;local function aD()if X then if D.BloodFury:IsCastable()and n()and ab.Commons.Enabled.Racials then if m(D.BloodFury,nil)then a8=20572;return"blood_fury racials 2"end end;if D.Berserking:IsCastable()and n()and ab.Commons.Enabled.Racials then if m(D.Berserking,nil)then a8=26297;return"berserking racials 4"end end;if D.ArcanePulse:IsCastable()and n()and ab.Commons.Enabled.Racials then if m(D.ArcanePulse,nil,nil,not h:IsInRange(8))then a8=260364;return"arcane_pulse racials 6"end end;if D.LightsJudgment:IsCastable()and n()and ab.Commons.Enabled.Racials then if m(D.LightsJudgment,nil,nil,not h:IsInRange(40))then a8=255647;return"lights_judgment racials 8"end end;if D.AncestralCall:IsCastable()and n()and ab.Commons.Enabled.Racials then if m(D.AncestralCall,nil)then a8=274738;return"ancestral_call racials 10"end end;if D.Fireblood:IsCastable()and n()and ab.Commons.Enabled.Racials then if m(D.Fireblood,nil)then a8=265221;return"fireblood racials 12"end end;if D.BagofTricks:IsCastable()and n()and ab.Commons.Enabled.Racials and(D.Obliteration:IsAvailable()and g:BuffDown(D.PillarofFrostBuff)and g:BuffUp(D.UnholyStrengthBuff))then if m(D.BagofTricks,nil,nil,not h:IsInRange(40))then a8=312411;return"bag_of_tricks racials 14"end end end end;local function aE()if E.GaveloftheFirstArbiter:IsEquippedAndReady()and h:IsInRange(30)and n()and not y then if m(E.GaveloftheFirstArbiter,nil,nil,not h:IsInRange(30))then a8=16;return"gavel_of_the_first_arbiter trinkets 4"end end;if n()then if(ab.Commons.Enabled.TopTrinket or ab.Commons.Enabled.BottomTrinket)and n()then local aF=g:GetUseableTrinkets(F)if aF then if m(aF,nil,nil)then if aF:ID()==J and ab.Commons.Enabled.TopTrinket then a8=24;return"top trinket 1"elseif aF:ID()==L and ab.Commons.Enabled.BottomTrinket then a8=30;return"top trinket 2"end end end end end end;local function aG()local aH=g:GCD()+0.25;T=a6==1 or not o()U=a6>=2 and o()V=g:BuffUp(D.RimeBuff)and(D.RageoftheFrozenChampion:IsAvailable()or D.Avalanche:IsAvailable()or D.Icebreaker:IsAvailable())W=D.UnleashedFrenzy:IsAvailable()and(g:BuffRemains(D.UnleashedFrenzyBuff)<aH*3 or g:BuffStack(D.UnleashedFrenzyBuff)<3)or D.IcyTalons:IsAvailable()and(g:BuffRemains(D.IcyTalonsBuff)<aH*3 or g:BuffStack(D.IcyTalonsBuff)<3)X=D.PillarofFrost:IsAvailable()and g:BuffUp(D.PillarofFrostBuff)and(D.Obliteration:IsAvailable()and g:BuffRemains(D.PillarofFrostBuff)<6 or not D.Obliteration:IsAvailable())or not D.PillarofFrost:IsAvailable()and g:BuffUp(D.EmpowerRuneWeaponBuff)or not D.PillarofFrost:IsAvailable()and not D.EmpowerRuneWeapon:IsAvailable()or a6>=2 and g:BuffUp(D.PillarofFrostBuff)Y=D.Frostscythe:IsAvailable()and(g:BuffUp(D.KillingMachineBuff)or a6>=3)and(not D.ImprovedObliterate:IsAvailable()and not D.FrigidExecutioner:IsAvailable()or not D.CleavingStrikes:IsAvailable()or D.CleavingStrikes:IsAvailable()and(a6>6 or g:BuffDown(D.DeathAndDecayBuff)and a6>3))if g:RunicPower()<35 and g:Rune()<2 and D.PillarofFrost:CooldownRemains()<10 then Z=(D.PillarofFrost:CooldownRemains()+1)/aH/((g:Rune()+3)*(g:RunicPower()+5))*100 else Z=3 end;if g:RunicPowerDeficit()>10 and D.BreathofSindragosa:CooldownRemains()<10 then _=(D.BreathofSindragosa:CooldownRemains()+1)/aH/((g:Rune()+1)*(g:RunicPower()+20))*100 else _=3 end;a0=g:Rune()<4 and D.Obliteration:IsAvailable()and D.PillarofFrost:CooldownRemains()<Z;a1=D.BreathofSindragosa:IsAvailable()and D.BreathofSindragosa:CooldownRemains()<_ or D.Obliteration:IsAvailable()and g:RunicPower()<35 and D.PillarofFrost:CooldownRemains()<Z end;local function aI()if o()then a5=g:GetEnemiesInMeleeRange(8,D.FrostStrike)a6=#a5 else a5={}a6=1 end;if aa.TargetIsValid()or g:AffectingCombat()then if IsInRaid()and UnitExists("boss1")then a2=d.BossFightRemains(nil,true)a3=a2;if a3==11111 then a3=d.FightRemains(a5,false)end end end;if not BotOn then a7=0;a8=0;a9=0 end;if a7>0 then a7=0 end;if a8>0 then a8=0 end;if a9>0 then a9=0 end;ar()if l.QueuedCast()then a8=l.QueuedCast()return"Custom Queue "..j(a8):ID()end;if l.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then starttime=GetTime()endtime=starttime+l.GUISettings.General.OpenerReset elseif l.GUISettings.General.OpenerReset>0 and endtime~=nil and GetTime()>endtime and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]l.ToggleIconFrame:UpdateButtonText(6)l.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if t and D.AntiMagicZone:IsUsableP()and g:AffectingCombat()and D.AntiMagicZone:CooldownRemains(BypassRecovery)<=0 then if m(D.AntiMagicZone,nil,nil,nil)then a8=51052;return"queue AMZ"end elseif(not D.AntiMagicZone:IsUsableP()or D.AntiMagicZone:CooldownRemains()>0 or not g:AffectingCombat())and t then HeroRotationCharDB.Toggles[13]=not HeroRotationCharDB.Toggles[13]l.Print("Anti-Magic Zone Queue is now "..(HeroRotationCharDB.Toggles[13]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if u and D.DeathGrip:IsUsableP()and D.DeathGrip:CooldownRemains(BypassRecovery)<=0 and f("mouseover"):GUID()~=nil then if m(D.DeathGrip,nil,nil,nil)then a7=149576;return"queue DeathGrip MO"end elseif u and D.DeathGrip:IsUsableP()and D.DeathGrip:CooldownRemains(BypassRecovery)<=0 and aa.TargetIsValid()then if m(D.DeathGrip,nil,nil,nil)then a8=49576;return"queue DeathGrip"end elseif(not D.DeathGrip:IsUsableP()or D.DeathGrip:CooldownRemains()>0 or not aa.TargetIsValid())and u then HeroRotationCharDB.Toggles[14]=not HeroRotationCharDB.Toggles[14]l.Print("Death Grip Queue is now "..(HeroRotationCharDB.Toggles[14]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if v and D.Asphyxiate:IsUsableP()and D.Asphyxiate:CooldownRemains(BypassRecovery)<=0 and f("mouseover"):GUID()~=nil then if m(D.Asphyxiate,nil,nil,nil)then a7=1221562;return"queue Asphyxiate MO"end elseif v and D.Asphyxiate:IsUsableP()and D.Asphyxiate:CooldownRemains(BypassRecovery)<=0 and aa.TargetIsValid()then if m(D.Asphyxiate,nil,nil,nil)then a8=221562;return"queue Asphyxiate"end elseif(not D.Asphyxiate:IsUsableP()or D.Asphyxiate:CooldownRemains()>0)and v then HeroRotationCharDB.Toggles[16]=not HeroRotationCharDB.Toggles[16]l.Print("Asphyxiate Queue is now "..(HeroRotationCharDB.Toggles[16]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if w and D.ControlUndead:IsUsableP()and D.ControlUndead:CooldownRemains(BypassRecovery)<=0 and not g:PrevGCD(1,D.ControlUndead)then if l.Cast(D.ControlUndead,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsInRange(30)then a7=1111673;return"queue ControlUndead MO"else a8=111673;return"queue ControlUndead"end end elseif(not D.ControlUndead:IsUsableP()or D.ControlUndead:CooldownRemains()>0 or g:PrevGCD(1,D.ControlUndead))and w then HeroRotationCharDB.Toggles[81]=not HeroRotationCharDB.Toggles[81]l.Print("Control Undead Queue is now "..(HeroRotationCharDB.Toggles[81]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if g:IsChanneling(j(324631))then if g:AffectingCombat()and ab.Frost.CastCancelFC then a8=1999 elseif m(D.Pool,nil,nil,nil)then a7=99999;return"wait"end end;if not g:AffectingCombat()and aa.TargetIsValid()and not g:IsDeadOrGhost()and q then local aJ=at()if aJ then return aJ end end;if aa.TargetIsValid()and not g:IsDeadOrGhost()and aa.TargetIsValid()and g:AffectingCombat()then if not UnitIsEnemy("player","mouseover")and UnitIsDead("mouseover")then if D.RaiseAlly:IsCastable()and g:RunicPower()>=30 then if m(D.RaiseAlly,nil)then a7=161999;return"RaiseAlly MO"end elseif D.RaiseAlly:CooldownRemains(BypassRecovery)<=0 and g:RunicPower()<30 then B=true end end;if not h:IsInMeleeRange(15)and a6>0 and ab.Frost.TargetSwap=="AutoSwap"and not s then a7=9999 end;if ab.Commons.UseDefensives then if g:HealthPercentage()<ab.Commons.HealthstoneHP and E.Healthstone:IsReady()and E.Healthstone:CooldownRemains()<=0 then if m(E.Healthstone,nil)then a8=40;return"Healthstone HP"end end;if g:HealthPercentage()<ab.Commons.HealPotHP and E.HealPot:IsReady()and E.CosmicHealPot:CooldownRemains()<=0 then if m(E.CosmicHealPot,nil)then a8=45;return"Cosmic HealPot HP"end end;if g:HealthPercentage()<ab.Commons.HealPotHP and E.HealPot:IsReady()and E.HealPot:CooldownRemains()<=0 then if m(E.HealPot,nil)then a8=41;return"HealPot HP"end end;if g:HealthPercentage()<ab.Commons.UseDarkSuccorHP and D.DeathStrike:IsReady()and g:BuffUp(D.DeathStrikeBuff)then if m(D.DeathStrike)then a8=49998;return"DeathStrike Dark Succor HP"end end;if g:HealthPercentage()<ab.Commons.UseDeathStrikeHP and D.DeathStrike:IsReady()then if m(D.DeathStrike)then a8=49998;return"DeathStrike HP"end end;if g:HealthPercentage()<ab.Commons.IceboundFortitudeHP and D.IceboundFortitude:IsReady()then if m(D.IceboundFortitude)then a8=48792;return"Icebound Fortitude HP"end end;if g:HealthPercentage()<ab.Commons.LichborneHP and D.Lichborne:IsReady()then if m(D.Lichborne)then a8=49039;return"Lichborne HP"end end;if g:HealthPercentage()<ab.Commons.AntiMagicShellHP and D.AntiMagicShell:IsReady()then if m(D.AntiMagicShell)then a8=48707;return"Anti-Magic Shell HP"end end;if g:HealthPercentage()<ab.Commons.DeathPactHP and D.DeathPact:IsReady()then if m(D.DeathPact)then a8=48743;return"Death Pact HP"end end end;if true then local aJ=aG()if aJ then return aJ end end;if true then local aJ=aA()if aJ then return aJ end end;if true then local aJ=aE()if aJ then return aJ end end;if n()then local aJ=ay()if aJ then return aJ end end;if n()then local aJ=aD()if aJ then return aJ end end;if D.ColdHeart:IsAvailable()and(g:BuffDown(D.KillingMachineBuff)or D.BreathofSindragosa:IsAvailable())and(h:DebuffStack(D.RazoriceDebuff)==5 or not N and not D.GlacialAdvance:IsAvailable()and not D.Avalanche:IsAvailable()or a3<=g:GCD()+0.5)then local aJ=ax()if aJ then return aJ end end;if g:BuffUp(D.BreathofSindragosa)and D.Obliteration:IsAvailable()and g:BuffUp(D.PillarofFrostBuff)then local aJ=aw()if aJ then return aJ end;if m(D.Pool)then return"pool for BreathOblit()"end end;if g:BuffUp(D.BreathofSindragosa)and(not D.Obliteration:IsAvailable()or D.Obliteration:IsAvailable()and g:BuffDown(D.PillarofFrostBuff))then local aJ=av()if aJ then return aJ end;if m(D.Pool)then return"pool for Breath()"end end;if D.Obliteration:IsAvailable()and g:BuffUp(D.PillarofFrostBuff)and g:BuffDown(D.BreathofSindragosa)then local aJ=aB()if aJ then return aJ end;if m(D.Pool)then return"pool for Obliteration()"end end;if a6>=2 and o()then local aJ=au()if aJ then return aJ end end;if a6==1 or not o()then local aJ=aC()if aJ then return aJ end end;if l.CastAnnotated(D.Pool,false,"WAIT")then return"Wait/Pool Resources"end end end;local function aK()if HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]l.ToggleIconFrame:UpdateButtonText(6)end end;function ReturnSpellF()if a8==0 then return 0 else return a8 end end;function ReturnSpellMOF()if a7==0 then return 0 else return a7 end end;l.SetAPL(251,aI,aK)