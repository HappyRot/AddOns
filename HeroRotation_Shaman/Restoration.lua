--- ============================ HEADER ============================
--- ======= LOCALIZE =======
-- Addon
local addonName, addonTable = ...
-- HeroDBC
local DBC        = HeroDBC.DBC
-- HeroLib
local HL         = HeroLib
local Cache      = HeroCache
local Unit       = HL.Unit
local Player     = Unit.Player
local Pet        = Unit.Pet
local Target     = Unit.Target
local Spell      = HL.Spell
local MultiSpell = HL.MultiSpell
local Item       = HL.Item
-- HeroRotation
local HR         = HeroRotation
local Cast       = HR.Cast
local AoEON      = HR.AoEON
local CDsON      = HR.CDsON
local CovenantsON = HeroRotationCharDB.Toggles[4]
local SmallCDsOn = HeroRotationCharDB.Toggles[5]
local Opener1 = HeroRotationCharDB.Toggles[6]
local UsePots =  HeroRotationCharDB.Toggles[15]
local StopAutoSwap = HeroRotationCharDB.Toggles[12]
local ForceAoE = HeroRotationCharDB.Toggles[60]
local HoldEarthEle = HeroRotationCharDB.Toggles[90] 
local QTremorTotem = HeroRotationCharDB.Toggles[93] 
local QWindRushTotem = HeroRotationCharDB.Toggles[94] 
local QHex = HeroRotationCharDB.Toggles[95] 
local UsePurge = HeroRotationCharDB.Toggles[97] 
local HealOOC = HeroRotationCharDB.Toggles[160] 
local OhShit = HeroRotationCharDB.Toggles[161] 
local QCapTotem = HeroRotationCharDB.Toggles[91] 
local QVesperTotem = HeroRotationCharDB.Toggles[92] 
local HoldPurify = HeroRotationCharDB.Toggles[163] 
local QPurify = HeroRotationCharDB.Toggles[164]
local StopDPS = HeroRotationCharDB.Toggles[165]
local StopHeal = HeroRotationCharDB.Toggles[166]

local QuakingR = 0

-- Lua
local mathmin    = math.min

--- ============================ CONTENT ============================
--- ======= APL LOCALS =======

-- Define S/I for spell and item arrays
local S = Spell.Shaman.Restoration
local I = Item.Shaman.Restoration

local PSCastable = S.PurifySpirit:IsCastable()


-- Trinket Item Objects
local equip = Player:GetEquipment()
local trinket1 = Item(0)
local trinket2 = Item(0)
--Trinket Detection
local TopTrinketID,_ = GetInventoryItemID("player", 13)
local BotTrinketID,_ = GetInventoryItemID("player", 14)

-- Create table to exclude above trinkets from On Use function
local OnUseExcludes = {
}


-- GUI Settings
local Everyone = HR.Commons.Everyone
local Shaman = HR.Commons.Shaman
local Settings = {
  General = HR.GUISettings.General,
  Commons = HR.GUISettings.APL.Shaman.Commons,
  Restoration = HR.GUISettings.APL.Shaman.Restoration,
  RestorationM = HR.GUISettings.APL.Shaman.RestorationM,
  RestorationR = HR.GUISettings.APL.Shaman.RestorationR
}


HL:RegisterForEvent(function()
  S.LavaBurst:RegisterInFlight()
end, "LEARNED_SPELL_IN_TAB")
S.LavaBurst:RegisterInFlight()

local function num(val)
  if val then return 1 else return 0 end
end

local function bool(val)
  return val ~= 0
end

-- These variables are rotational modifiers parameters.
local NumEnemiesInCombat
local NumEnemiesInLargestCluster
local ActiveFlameshocks
local RefreshableFlameshocks
local FightTimeRemaining
local CoreUnitInLargestCluster
local BestFlameshockUnit
local SplashedEnemiesTable
local LowestHealthFriendPercentage = 1.0
local LowestHealthGUID = nil
local LowestHealthIndex = 0
local SwapTimer = 0
local VesperDMG = 0
local VesperHeal = 0
local VesperUp = false
local VesperPlaced = false
local CounterTimer = 0
local CounterTimerH = 0
local MidnightGUID, MidnightTime, MidnightName
local currentspell, currentspelltarget, missedunit
local BlacklistTable = {}

local ShamanCBT = false
local ShamanHoldCBT = false
local ShamanCBTPop = false
local HoldWellspring = false
local WellspringPop = false
local HoldHealingRain = false
local ShouldCancel = false

-- local BuffsTable = {
	-- Buffs = {}
	-- Debuffs = {
		-- UnitGUID = {}
		-- DebuffSpellID = {}
	-- }
-- }
	
HL:RegisterForEvent(function()
  VesperPlaced = false
end, "PLAYER_REGEN_ENABLED")

HL:RegisterForEvent(function(self, ...)
	if self == "CHAT_MSG_YELL" then
		local text, playerName, languageName, channelName, playerName2, specialFlags, zoneChannelID, channelIndex, channelBaseName, languageID, lineID, guid, bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons = ...
		if text == "DISPEL ME(auto)" then
			MidnightGUID = guid
			MidnightTime = GetTime()
			MidnightName = playerName
		 end	
	end
end, "CHAT_MSG_YELL")

HL:RegisterForEvent(function(self, ...)
	local arg1, arg2, arg3, arg4 = ...
	if self == "UNIT_SPELLCAST_SENT" then
		if arg1 == "player" and arg2 then
			currentspell = arg4
			currentspelltarget = arg2
		end
	end
	if self == "UI_ERROR_MESSAGE" then
		if arg2 == SPELL_FAILED_LINE_OF_SIGHT then
			missedunit = currentspelltarget
			missedspell = currentspell
		end
	end
end, "UI_ERROR_MESSAGE", "UNIT_SPELLCAST_SENT")

-- HL:RegisterForCombatEvent(function(timestamp, subevent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellid, spellname, _, spelltype)
	-- if subevent = "SPELL_AURA_APPLIED" then
		
-- end, "SPELL_AURA_APPLIED", "SPELL_AURA_REMOVED")

local function FindUnitFor(who, unitname)
  local i, size
  if not unitname then
	  -- second parameter ("true" on these) indicates whether or not
	  -- to give names qualified with -servername for players from
	  -- other servers
	  if GetUnitName("player", true) == who then return UnitGUID("player") end
	  if GetUnitName("target", true) == who then return Unit("target"):GUID() end
	  if GetUnitName("focus", true) == who then return UnitGUID("focus") end

	  size = GetNumGroupMembers()
	  if size > 0 and size <= 5 then
		for i=1, size do
		  if GetUnitName("party"..i, true) == who then return UnitGUID("party"..i) end
		end
	  end
	  if size > 5 then
		for i=1, size do
		  if GetUnitName("raid"..i, true) == who then return UnitGUID("raid"..i) end
		end
	  end
  else
	  if GetUnitName("player", true) == who then return "player" end
	  if GetUnitName("target", true) == who then return "target" end
	  if GetUnitName("focus", true) == who then return "focus" end

	  size = GetNumGroupMembers()
	  if size > 0 and size <= 5 then
		for i=1, size do
		  if GetUnitName("party"..i, true) == who then return "party"..i end
		end
	  end
	  if size > 5 then
		for i=1, size do
		  if GetUnitName("raid"..i, true) == who then return "raid"..i end
		end
	  end
  end
	
  -- couldn't find a unit, just return what we were passed
  return who
end

local function Blacklist()
	-- add new unit
	if missedunit then
		table.insert(BlacklistTable, (FindUnitFor(missedunit) .. " " .. GetTime()))
		missedunit = nil
	end
	
	if table.getn(BlacklistTable) > 0 then
		for i=1, table.getn(BlacklistTable) do
			if BlacklistTable[i] ~= nil then
				for w in string.gmatch(BlacklistTable[i], "([^%s]+)") do
					w = tonumber(w)
					if type(w) == "number" then
						if w <= GetTime() - 3 then
							table.remove(BlacklistTable, i)
						end
					end
				end
			end
		end
	end
	
	-- if table.getn(BlacklistTable) > 0 then
	   -- for i=1, table.getn(BlacklistTable) do
		  -- for w in string.gmatch(BlacklistTable[i], "([^%s]+)") do
			 -- if tonumber(w) ~= nil then
				-- w = tonumber(w)
			 -- end
			 -- if type(w) == "string" then
				-- HR.Nameplate.AddIcon(w, S.Pool)
			 -- end
		  -- end
	   -- end
	-- end	
end

local function UnitIsBlackListed(unit)
	if table.getn(BlacklistTable) > 0 and unit ~= nil then
	   for i=1, table.getn(BlacklistTable) do
		  for w in string.gmatch(BlacklistTable[i], "([^%s]+)") do
			 if w and w == Unit(unit):GUID() then
				return true
			 end
		  end
	   end
	else
		return false
	end
end

local function HealingAbsorb(unit)
	if (Unit(unit):BuffUp(Spell(365153))) then
		for i=1,40 do
			if select(10, UnitBuff(unit, i)) == 365153 then
				return select(16, UnitBuff(unit, i))
			end
		end
	else
		return 0
	end
end
				
local Enemies8yMelee, Enemies30y, Enemies40y, Enemies10ySplash

local MOshouldcast = 0
local shouldcast = 0
local shouldcastfocus = 0

local function num(val)
  if val then return 1 else return 0 end
end

local function EvaluateTargetIfFilterFlameShock100(TargetUnit)
  return TargetUnit:DebuffRemains(S.FlameShockDebuff)
end

local function EvaluateTargetIfFilterBlacklist(TargetUnit)
  return UnitIsBlackListed(TargetUnit)
end

local function EvaluateTargetIfFlameShock108(TargetUnit)
	if (TargetUnit:DebuffDown(S.FlameShockDebuff) and TargetUnit:IsInRange(40) and (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285 or TargetUnit:NPCID() == 168326) and TargetUnit:GUID() == Unit("mouseover"):GUID()) then
  		MOshouldcast = 1188389
		return true
	elseif (TargetUnit:DebuffDown(S.FlameShockDebuff) and TargetUnit:IsInRange(40) and (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285 or TargetUnit:NPCID() == 168326) and Settings.Restoration.TargetSwap == "AutoSwap" and TargetUnit:GUID() ~= Target:GUID() and not StopAutoSwap) then
  		MOshouldcast = 999
		return true
	elseif (TargetUnit:DebuffDown(S.FlameShockDebuff)  and TargetUnit:IsInRange(40)  and (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285 or TargetUnit:NPCID() == 168326) and TargetUnit:GUID() == Target:GUID()) then
  		shouldcast = 188389
		return true
	elseif TargetUnit:DebuffDown(S.FlameShockDebuff) and TargetUnit:IsInRange(40) and (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285 or TargetUnit:NPCID() == 168326) then
		return true
	end
end

local function EvaluateTargetIfBlacklist(TargetUnit)
	return (TargetUnit:IsInRange(40) and UnitIsBlackListed(TargetUnit) and (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285 or TargetUnit:NPCID() == 168326))
end

local function VesperCounter()
	VesperUp = false
	for i = 1, 6 do
		local _, _, _, _, textureid = GetTotemInfo(i)
		if textureid == 3565451 then
			VesperUp = true
		end
	end
	
	if not VesperUp then
		VesperDMG = 0
		VesperHeal = 0
	end
	
	if (S.VesperTotem:TimeSinceLastCast() <= 0.5 or S.RecallVesperTotem:TimeSinceLastCast() <= 0.5) and VesperUp then
		VesperDMG = 3
		VesperHeal = 3
		VesperPlaced = true
	end
	
	if (S.LavaBurst:TimeSinceLastCast() <= 0.5 or S.ChainLightning:TimeSinceLastCast() <= 0.5 or S.LightningBolt:TimeSinceLastCast() <= 0.5) and CounterTimer <= GetTime() and VesperUp then
		VesperDMG = VesperDMG - 1
		CounterTimer = GetTime() + 0.66
	end
	if (S.EarthShield:TimeSinceLastCast() <= 0.5 or S.Riptide:TimeSinceLastCast() <= 0.5 or S.ChainHeal:TimeSinceLastCast() <= 0.5 or S.HealingSurge:TimeSinceLastCast() <= 0.5 or S.HealingStreamTotem:TimeSinceLastCast() <= 0.5
	or S.CloudBurstTotem:TimeSinceLastCast() <= 0.5 or S.HealingWave:TimeSinceLastCast() <= 0.5 or S.HealingRain:TimeSinceLastCast() <= 0.5) and CounterTimerH <= GetTime() and VesperUp then
		VesperHeal = VesperDMG - 1
		CounterTimerH = GetTime() + 0.66
	end
end

local function UnitsRefreshFS(enemies)
  local RefreshFSCount = 0
    if enemies ~= nil then
	  for k in pairs(enemies) do
		local CycleUnit = enemies[k]
		if CycleUnit:DebuffRefreshable(S.FlameShockDebuff) and CycleUnit:TimeToDie() > 18 then
		  RefreshFSCount = RefreshFSCount + 1
		end
	end
  end
  return RefreshFSCount
end

local function StewardCheck()
	local PhialStacks = false
	local itemID = 0
	for i = 0, NUM_BAG_SLOTS do
		for j = 1, GetContainerNumSlots(i) do
			itemID = GetContainerItemID(i, j)
			if itemID == 177278 then
				PhialStacks = true
			end
		end
	end
	return PhialStacks
end
			
local function MembersUnderX(percentage)
	if percentage == nil then
		return nil
	end	
	percentage = percentage / 100

	

	local unitsunder = 0
	if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
		for i= 1, GetNumGroupMembers() do
			if UnitExists("party"..i) and not Unit("party"..i):IsDeadOrGhost() and Unit("party"..i):DebuffDown(Spell(228578)) then
				local CurrentHealthXP = UnitHealth("party"..i) + (UnitGetIncomingHeals("party"..i) or 0) - HealingAbsorb("party"..i)
				local TotalHealthXP = UnitHealthMax("party"..i)
				if CurrentHealthXP / TotalHealthXP <= percentage or (UnitHealth("party"..i) / TotalHealthXP == 1 and percentage == 1) then
					unitsunder = unitsunder + 1
				end
			end
		end
		if (((UnitHealth("player") + (UnitGetIncomingHeals("player") or 0)) / UnitHealthMax("player")) < percentage or (UnitHealth("player") / UnitHealthMax("player") == 1 and percentage == 1)) then
			unitsunder = unitsunder + 1
		end	
	end
	if GetNumGroupMembers() > 5 then
		for i= 1, GetNumGroupMembers() do
			if UnitExists("raid"..i) and  not UnitIsDead("raid"..i) and Unit("raid"..i):DebuffDown(Spell(362075)) and Unit("raid"..i):DebuffDown(Spell(362397)) and Unit("raid"..i):DebuffDown(Spell(191587)) then
				local healabsorb = 0
				local CurrentHealthXR = UnitHealth("raid"..i) + (UnitGetIncomingHeals("raid"..i) or 0) - HealingAbsorb("raid"..i)
				local TotalHealthXR = UnitHealthMax("raid"..i)
				if CurrentHealthXR / TotalHealthXR <= percentage then
					unitsunder = unitsunder + 1
				end
			end
		end
	end
	if GetNumGroupMembers() == 0 then
		local CurrentHealthXS = UnitHealth("player") + (UnitGetIncomingHeals("player") or 0) - HealingAbsorb("player")
		local TotalHealthXS = UnitHealthMax("player")
		if CurrentHealthXS / TotalHealthXS < percentage then
			unitsunder = unitsunder + 1
		end
	end 
	return unitsunder
end

local function EarthShieldUp()
	local ShieldUp = false
	if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
		for i= 1, GetNumGroupMembers() do
			for j=0, 40 do
				local _, _, _, _, _, _, source1, _, _, spellId1 = UnitBuff("party"..i, j)
				if source1 == "player" and spellId1 == 974 then
					ShieldUp = true
				end
			end
		end
	end
	if GetNumGroupMembers() > 5 then
		for i= 1, GetNumGroupMembers() do
			for j=0, 40 do
				local _, _, _, _, _, _, source1, _, _, spellId1 = UnitBuff("raid"..i, j)
				if source1 == "player" and spellId1 == 974 then
					ShieldUp = true
				end
			end
		end
	end
	return ShieldUp
end

local function EarthShieldUpOn(unit)
	local ShieldUpOn = false
	for j=0, GetNumGroupMembers() do
		local _, _, _, _, _, _, source1, _, _, spellId1 = UnitBuff(unit, j)
		if source1 == "player" and spellId1 == 974 then
			ShieldUpOn = true
		end
	end
	return ShieldUpOn
end

local function CloudBurstHP()
	local value = 0
	if Player:BuffUp(Spell(157504)) then
		for i=1,40 do
			if select(10, UnitBuff("player", i)) == 157504 then
				value = select(16, UnitBuff("player", i))
			end
		end
	end
	return value
end

local function IsMoving()
	if Player:IsMoving() and not Player:BuffUp(S.SpiritwalkersGraceBuff) then
		return true
	else
		return false
	end
end

-- We keep track of total enemies in combat, as well as a bunch of parameters around the encounter.
local function BattlefieldSnapshot()
  FightTimeRemaining = 0
  LowestHealthFriendPercentage = 1.0
  LowestHealthGUID = nil
  LowestHealthIndex = 0

    -- Update FightTimeRemaining
    if not Target:TimeToDieIsNotValid() and not Target:IsUserCycleBlacklisted() then
      FightTimeRemaining = Target:TimeToDie()
    end

	if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
		if (UnitGUID("focus") == Unit("party"..(shouldcastfocus/100)):GUID() or not UnitExists("party"..(shouldcastfocus/100))) and shouldcastfocus ~= 500 then	
			shouldcastfocus = 0
		end
		if UnitGUID("focus") == UnitGUID("player") and shouldcastfocus == 500 then	
			shouldcastfocus = 0
		end
	end
	if GetNumGroupMembers() > 5 then
		if UnitGUID("focus") == Unit("raid"..(shouldcastfocus/1000)):GUID() or not UnitExists("raid"..(shouldcastfocus/1000)) then	
			shouldcastfocus = 0
		end
	end	

  PSCastable = S.PurifySpirit:IsCastable()
  if GetNumGroupMembers() > 0 and not StopHeal then
	if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
		for i= 1, GetNumGroupMembers() do
			if UnitExists("party"..i) and not Unit("party"..i):IsDeadOrGhost() and Unit("party"..i):IsInRange(40) and not UnitIsBlackListed("party"..i) and Unit("party"..i):DebuffDown(Spell(228578)) then
				local CurrentHealthP = UnitHealth("party"..i) + (UnitGetIncomingHeals("party"..i) or 0) - HealingAbsorb("party"..i)
				local TotalHealthP = UnitHealthMax("party"..i)
				if  (CurrentHealthP / TotalHealthP) - (0) < LowestHealthFriendPercentage and CurrentHealthP / TotalHealthP < Settings.RestorationM.DPSThreshold and SwapTimer <= GetTime() then
					LowestHealthFriendPercentage = (CurrentHealthP / TotalHealthP) - (0)
					LowestHealthGUID = UnitGUID("party"..i)
					LowestHealthIndex = i
				end		
			end
		end
		if ((UnitHealth("player") + (UnitGetIncomingHeals("player") or 0)) / UnitHealthMax("player")) - (0) < LowestHealthFriendPercentage and SwapTimer <= GetTime() and Unit("player"):DebuffDown(Spell(228578)) then
			LowestHealthFriendPercentage = ((UnitHealth("player") + (UnitGetIncomingHeals("player") or 0)) / UnitHealthMax("player")) - (0)
			LowestHealthGUID = UnitGUID("player")
			LowestHealthIndex = 5
		end
		if LowestHealthFriendPercentage >= 0.5 then
			if S.PurifySpirit:IsCastable() and not HoldPurify then
				for i = 1, GetNumGroupMembers() do
					if UnitExists("party"..i) and not Unit("party"..i):IsDeadOrGhost() and Unit("party"..i):IsInRange(40) and not UnitIsBlackListed("party"..i) and Unit("party"..i):DebuffDown(Spell(228578)) then
						for j= 1, 40 do
							local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal,spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitDebuff("party"..i, j)
							if (dispelType == "Curse" or dispelType == "Magic") then
								if spellId ~= 320788 and ((spellId ~= 323347) or (spellId == 323347 and count >= 2)) and spellId ~= 350469 and spellId ~= 350541 and spellId ~= 351117 and spellId ~= 229159 and spellId ~= 227404 then
									if (expirationTime - duration) + (Settings.Restoration.PurifyDelay/1000) <= GetTime() and SwapTimer <= GetTime() then
										LowestHealthGUID = UnitGUID("party"..i)
										LowestHealthIndex = i
									elseif spellId == 227404 and MidnightGUID and MidnightGUID == UnitGUID("party"..i) then
										LowestHealthGUID = UnitGUID("party"..i)
										LowestHealthIndex = i
									end
								end
							end
						end
					end
				end
				if not Unit("player"):IsDeadOrGhost() and Unit("player"):DebuffDown(Spell(228578)) then
					for i= 1, 40 do
						local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal,spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitDebuff("player", i)
						if (dispelType == "Curse" or dispelType == "Magic") and spellId ~= 320788 and ((spellId ~= 323347) or (spellId == 323347 and count >= 2)) and spellId ~= 350469 and spellId ~= 350541 and spellId ~= 351117  and spellId ~= 229159 and spellId ~= 227404 then
							if (expirationTime - duration) + (Settings.Restoration.PurifyDelay/1000) <= GetTime() and SwapTimer <= GetTime() then
								LowestHealthGUID = UnitGUID("player")
								LowestHealthIndex = 5
							end
						end
					end
				end	
			end
		end
	elseif GetNumGroupMembers() > 5 and SwapTimer <= GetTime() then
		for i= 1, GetNumGroupMembers() do
			if UnitExists("raid"..i) and not UnitIsDead("raid"..i) and IsItemInRange(17067, "raid"..i) and not UnitIsBlackListed("raid"..i) and not UnitCanAttack("player", "raid"..i) then
				for j=1,10 do
					local _, _, count, dispelType, duration, expirationTime, _, _, _, spellId = UnitDebuff("raid"..i, j)
					--local _, _, countB, dispelTypeB, durationB, expirationTimeB, _, _, _, spellIdB = UnitBuff("raid"..i, debuff)
					-- Index Setter
					if spellId ~= 329298 then
						local CurrentHealthR = UnitHealth("raid"..i) + (UnitGetIncomingHeals("raid"..i) or 0) - HealingAbsorb("raid"..i)
						local TotalHealthR = UnitHealthMax("raid"..i)
						if CurrentHealthR / TotalHealthR < LowestHealthFriendPercentage and CurrentHealthR / TotalHealthR < Settings.RestorationR.DPSThreshold then
							LowestHealthFriendPercentage = CurrentHealthR / TotalHealthR
							LowestHealthGUID = UnitGUID("raid"..i)
							LowestHealthIndex = i * 10
						end	
					end
					--PurifySpirit
					if LowestHealthFriendPercentage >= 0.5 and PSCastable and not HoldPurify then
						if (dispelType == "Curse" or dispelType == "Magic") and spellId ~= 320788 and ((spellId ~= 323347) or (spellId == 323347 and count >= 2)) and spellId ~= 350469 and spellId ~= 350541 and spellId ~= 351117 and spellId ~= 229159 then
							if (expirationTime - duration) + (Settings.Restoration.PurifyDelay/1000) <= GetTime() then
								LowestHealthGUID = UnitGUID("raid"..i)
								LowestHealthIndex = i * 10
							end
							if UnitGUID("focus") == UnitGUID("raid"..i) and (expirationTime - duration) + (Settings.Restoration.PurifyDelay/1000) <= GetTime() and spellId ~= 227404 then
								if spellId ~= 227404 then
									if Cast(S.PurifySpirit) then shouldcast = 77130 return "Purify Spirit" end
								elseif spellId == 227404 and MidnightGUID and MidnightGUID == UnitGUID("focus") then
									if Cast(S.PurifySpirit) then shouldcast = 77130 return "Purify Spirit" end
								end	
							end
						end
					end
				end
				--EarthShield
				if not UnitAffectingCombat("player") and (UnitGroupRolesAssigned("raid"..i) == "TANK") and IsItemInRange(17067, "raid"..i) and not EarthShieldUp() and LowestHealthFriendPercentage >= 0.5 then
					if UnitGUID("raid"..i) ~= UnitGUID("focus") then
						LowestHealthIndex = i * 10
						LowestHealthGUID = UnitGUID("raid"..i)
					elseif UnitGUID("raid"..i) == UnitGUID("focus") then
						if Cast(S.EarthShield) then shouldcast = 974 return "EarthShield a Tank" end
					end		
				end
				if (UnitGroupRolesAssigned("raid"..i) == "TANK") and UnitThreatSituation("raid"..i, "boss1")~= nil and UnitThreatSituation("raid"..i, "boss1") >= 3 and not EarthShieldUpOn("raid"..i) and LowestHealthFriendPercentage >= 0.5 then
					if UnitGUID("raid"..i) ~= UnitGUID("focus") then
						LowestHealthIndex = i * 10
						LowestHealthGUID = UnitGUID("raid"..i)
					elseif UnitGUID("raid"..i) == UnitGUID("focus") and not EarthShieldUpOn("focus") then
						if Cast(S.EarthShield) then shouldcast = 974 return "EarthShield a Tank" end
					end
				end
			end	
		end
		--Withering Seed/Anduins Hope
		if UnitExists("target") and (Target:NPCID() == 182822 or Target:NPCID() == 184493) and Unit("target"):HealthPercentage() < 100 and Target:GUID() ~= UnitGUID("focus") and SwapTimer <= GetTime() then
			LowestHealthGUID = Unit("target"):GUID()
			LowestHealthIndex = 1000
		elseif UnitExists("target") and (Target:NPCID() == 182822 or Target:NPCID() == 184493) and Unit("target"):HealthPercentage() < 100 and Target:GUID() == UnitGUID("focus") then
			LowestHealthGUID = Unit("target"):GUID()
			LowestHealthIndex = 0
		end	
	end
		
  elseif GetNumGroupMembers() == 0 then
	local CurrentHealthS = UnitHealth("player") + (UnitGetIncomingHeals("player") or 0) - HealingAbsorb("player")
	local TotalHealthS = UnitHealthMax("player")
	if SwapTimer <= GetTime() and UnitGUID("focus") ~= UnitGUID("player") then
		LowestHealthFriendPercentage = CurrentHealthS / TotalHealthS
		LowestHealthGUID = UnitGUID("player")
		if LowestHealthGUID == UnitGUID("player") and SwapTimer <= GetTime() then
			LowestHealthIndex = 5
		end
	end	
  end
  
end
-- Some spells aren't castable while moving or if you're currently casting them, so we handle that behavior here.
-- Additionally, lavaburst isn't castable without a charge or a proc.
local function IsViable(spell)
  if spell == nil or not Everyone.TargetIsValid() then
    return nil
  end
  local BaseCheck = spell:IsCastable() and spell:IsReady()
  local MovementPredicate = (Player:BuffUp(S.SpiritwalkersGraceBuff) or not Player:IsMoving())
  if spell == S.LightningBolt or 
     spell == S.ChainLightning or 
     spell == S.HealingRain or
     spell == S.HealingWave or 
     spell == S.HealingSurge or 
     spell == S.Wellspring  then
    return BaseCheck and MovementPredicate
  elseif spell == S.VesperTotem then
	return BaseCheck
  elseif spell == S.LavaBurst then
    local a = Player:BuffUp(S.LavaSurgeBuff)
    local b = (not Player:IsCasting(S.LavaBurst) and S.LavaBurst:Charges() >= 1)
    local c = (Player:IsCasting(S.LavaBurst) and S.LavaBurst:Charges() == 2)
    return BaseCheck and (MovementPredicate or Player:BuffUp(S.LavaSurgeBuff)) and (a or b or c)
  elseif Everyone.TargetIsValid() then
    return BaseCheck
  end
end

local function Precombat()
	if GetNumGroupMembers() > 0 then
		-- Water Shield on us
		if Player:BuffDown(S.WaterShield) and S.WaterShield:IsCastable() then
			if Cast(S.WaterShield) then shouldcast = 52127 return "Water Shield Self" end
		end			
		-- Target (@focus) lowest HP party member
		if LowestHealthGUID and UnitGUID("focus") ~= LowestHealthGUID and SwapTimer <= GetTime() and not StopHeal then
			shouldcastfocus = LowestHealthIndex * 100
			if LowestHealthGUID == UnitGUID("focus") then
				SwapTimer = GetTime() + (Player:GCD() + 0.25)
			end
		end
		if S.EarthShield:IsCastable() and Target:NPCID() ~= 182822 then
			if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 and LowestHealthFriendPercentage >= 0.5 then	
				for i= 1, GetNumGroupMembers() do
					if (UnitGroupRolesAssigned("party"..i) == "TANK" or Unit("party"..i):NPCID() == 72218) and not UnitCanAttack("player", "party"..i) and not UnitIsBlackListed("party"..i) and Unit("party"..i):IsInMeleeRange(40) and not EarthShieldUp() and SwapTimer <= GetTime() and MembersUnderX(80) == 0 then
						if UnitGUID("party"..i) ~= UnitGUID("focus") and Unit("party"..i):IsInMeleeRange(40) and not Unit("party"..i):IsDeadOrGhost() then
							LowestHealthIndex = i
							LowestHealthGUID = UnitGUID("party"..i)
						elseif UnitGUID("party"..i) == UnitGUID("focus") and Unit("focus"):IsInMeleeRange(40) and not Unit("party"..i):IsDeadOrGhost() and not UnitCanAttack("player", "party"..i) then
							if Cast(S.EarthShield) then shouldcast = 974 return "EarthShield a Tank" end
						end
					end
				end
			end
			if GetNumGroupMembers() > 5 then	
				for i= 1, GetNumGroupMembers() do
					if (UnitGroupRolesAssigned("raid"..i) == "TANK") and IsItemInRange(17067, "raid"..i) and not UnitCanAttack("player", "raid"..i) and not UnitIsBlackListed("raid"..i) and not EarthShieldUp() and SwapTimer <= GetTime() and not UnitAffectingCombat("player") then
						if UnitGUID("raid"..i) ~= UnitGUID("focus") and IsItemInRange(17067, "raid"..i) and not UnitIsDead("raid"..i) then
							LowestHealthIndex = i * 10
							LowestHealthGUID = UnitGUID("raid"..i)
						elseif UnitGUID("raid"..i) == UnitGUID("focus") and Unit("focus"):IsInMeleeRange(40) and not UnitIsDead("raid"..i) and not UnitAffectingCombat("player") and not UnitCanAttack("player", "raid"..i) then
							if Cast(S.EarthShield) then shouldcast = 974 return "EarthShield a Tank" end
						end
					end
					
					if (UnitGroupRolesAssigned("raid"..i) == "TANK") and UnitThreatSituation("raid"..i, "boss1")~= nil and UnitThreatSituation("raid"..i, "boss1") >= 3 and IsItemInRange(17067, "raid"..i) and not UnitIsBlackListed("raid"..i) and not EarthShieldUpOn("raid"..i) and not UnitIsDead("raid"..i)  and not UnitCanAttack("player", "raid"..i) then
						if UnitGUID("raid"..i) ~= UnitGUID("focus") and SwapTimer <= GetTime() then
							LowestHealthIndex = i * 10
							LowestHealthGUID = UnitGUID("raid"..i)
						elseif UnitGUID("raid"..i) == UnitGUID("focus") and not EarthShieldUpOn("focus") then
							if Cast(S.EarthShield) then shouldcast = 974 return "EarthShield a Tank" end
						end
					end
					
				end
			end			
		end		
	else
		if Player:BuffDown(S.LightningShieldBuff) then
			if Cast(S.LightningShield) then shouldcast = 192106 return "Lightning Shield Self" end
		end
	end

  if S.SummonSteward:IsCastable() and not StewardCheck() and not UnitAffectingCombat("player") then
    if Cast(S.SummonSteward, nil, nil) then shouldcast = 324739 return "Precombat SummonSteward" end
  end
  				
  if IsViable(S.Fleshcraft) and Everyone.TargetIsValid() and CovenantsON and Opener1 and not UnitAffectingCombat("player") then
    if Cast(S.Fleshcraft, nil, nil) then shouldcast = 324631 return "Precombat Fleshcraft" end
  end
  if not StopDPS and EnemiesCount10ySplash >= 3 and not UnitIsBlackListed("target") and Everyone.TargetIsValid() and Opener1 and not UnitAffectingCombat("player") and IsViable(S.ChainLightning) and not Player:IsCasting(S.ChainLightning) then
    if Cast(S.ChainLightning, nil, nil, not Target:IsSpellInRange(S.ChainLightning)) then shouldcast = 188443 return "Precombat Chain Lightning" end
  end
  if not StopDPS and IsViable(S.LavaBurst) and not UnitIsBlackListed("target") and Everyone.TargetIsValid() and Opener1 and not UnitAffectingCombat("player") and not Player:IsCasting(S.LavaBurst) then
    if Cast(S.LavaBurst, nil, nil, not Target:IsSpellInRange(S.LavaBurst)) then shouldcast = 51505 return "Precombat Lavaburst" end
  end
  if not StopDPS and Player:IsCasting(S.LavaBurst) and not UnitIsBlackListed("target") and Everyone.TargetIsValid() and Opener1 and not UnitAffectingCombat("player") and S.FlameShock:CooldownRemains() == 0 then 
    if Cast(S.FlameShock, nil, nil, not Target:IsSpellInRange(S.FlameShock)) then return "Precombat Flameshock" end
  end
end

local function OhShitR()

	if UnitExists("focus") and not UnitCanAttack("player","focus") then
		if Unit("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and S.CloudBurstTotem:IsCastable() and S.CloudBurstTotem:IsAvailable() and not IsMoving() then
			if Cast(S.CloudBurstTotem) then shouldcast = 157153 return "CloudBurst Totem before Ascendance" end
		end
		
		if Unit("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and S.Ascendance:IsAvailable() and S.Ascendance:IsCastable() and (S.HealingTideTotem:TimeSinceLastCast() > 10 and S.SpiritLinkTotem:TimeSinceLastCast() > 6) then
			if Cast(S.Ascendance) then shouldcast = 114050 return "Oh S**** Ascendance" end
		end

		if Unit("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and S.SpiritLinkTotem:IsAvailable() and S.SpiritLinkTotem:IsCastable() and (S.HealingTideTotem:TimeSinceLastCast() > 10 and S.Ascendance:TimeSinceLastCast() > 15) then
			if Cast(S.SpiritLinkTotem) then shouldcast = 98008 return "Oh S**** SpiritLinkTotem" end
		end

		if Unit("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and S.HealingTideTotem:IsAvailable() and S.HealingTideTotem:IsCastable() and (S.SpiritLinkTotem:TimeSinceLastCast() > 6 and S.Ascendance:TimeSinceLastCast() > 15) then
			if Cast(S.HealingTideTotem) then shouldcast = 108280 return "Oh S**** HealingTideTotem" end
		end
		
	end
				
end

local function Cooldowns()
	local TrinketToUse = Player:GetUseableTrinkets(OnUseExcludes)
	if TrinketToUse and CDsON() then
	  if Cast(TrinketToUse, nil, nil) then
		if TrinketToUse:ID() == TopTrinketID and Settings.Commons.Enabled.TopTrinket then
			shouldcast = 24 
			return "top trinket 1"; 
		elseif TrinketToUse:ID() == BotTrinketID and Settings.Commons.Enabled.BottomTrinket then
			shouldcast = 30 
			return "Bot trinket 2"; 
		end
	  end
	end
	
  -- if Player:IsMoving() and S.SpiritwalkersGrace:IsCastable() then
    -- if Cast(S.SpiritwalkersGrace, nil, Settings.Commons.DisplayStyle.SpiritwalkersGrace) then return "Suggest SWG" end
  -- endz
  if S.ChainHarvest:IsCastable() and not IsMoving() and CovenantsON then
    if Cast(S.ChainHarvest, nil, nil) then shouldcast = 320674 return "Chain Harvest CD" end
  end

  if ((S.VesperTotem:IsCastable() and CovenantsON) or (VesperUp and not VesperPlaced and S.RecallVesperTotem:IsReady())) then
    if Cast(S.VesperTotem, nil, nil) then shouldcast = 324386 return "Vesper Totem CD" end
  end
end

local function NumFlameShocksToMaintain()
  -- On AOE, don't maintain flame shock.
  if EnemiesCount10ySplash >= 3 then return 0 end
  -- On ST or 2T, return 1 or 2.
  return EnemiesCount10ySplash
end

local function ApplyFlameShock()
  if IsViable(S.FlameShock) and Everyone.TargetIsValid() then
	if Everyone.CastTargetIf(S.FlameShock, Enemies40y, "min", EvaluateTargetIfFilterFlameShock100, EvaluateTargetIfFlameShock108) then return "Flame Shock 108"; end
    if EvaluateTargetIfFilterFlameShock100(Target) and EvaluateTargetIfFlameShock108(Target) then
      if Cast(S.FlameShock, nil, nil, not Target:IsSpellInRange(S.FlameShock)) then shouldcast = 188389 return "FlameShock 108"; end
	end
  end
end

local function SingleTargetAndSpreadCleaveBuilder()
  if IsViable(S.LavaBurst) and Everyone.TargetIsValid() and not UnitIsBlackListed("target") then
	shouldcast = 51505
    return S.LavaBurst, false
  elseif IsViable(S.LightningBolt) and Everyone.TargetIsValid() and not UnitIsBlackListed("target") then
	shouldcast = 188196
    return S.LightningBolt, true
  end
  -- End up here when there are no castable builders for a st/spread cleave situation (on the move, no LB charges)
  return nil, false
end

local function AOEBuilder()
  if IsViable(S.LavaBurst) and Everyone.TargetIsValid() and not UnitIsBlackListed("target") and (EnemiesCount10ySplash < 3) then 
	shouldcast = 51505
    return S.LavaBurst, true
  elseif IsViable(S.ChainLightning) and Everyone.TargetIsValid() and not UnitIsBlackListed("target") then
	shouldcast = 188443
    return S.ChainLightning, true
  end
  -- End up here when there are no castable builders for a stacked cleave situation (on the move, no LB charges)
  return nil, false
end

local function FriendlyRotation()
	if GetNumGroupMembers() > 0 then
		-- Start Dungeon Healing Logic
		if GetNumGroupMembers() > 0 and GetNumGroupMembers() <= 5 then
			-- Target (@focus) lowest HP party member
			-- BattlefieldSnapshot()
			-- if LowestHealthGUID and UnitGUID("focus") ~= LowestHealthGUID and SwapTimer <= GetTime() then
				-- shouldcastfocus = LowestHealthIndex * 100
				-- SwapTimer = GetTime() + 0.5
			-- end
			--DBM overrides
			if ShouldCancel and not Player:IsCasting(S.Wellspring) then
				shouldcast = 1999
			end
			if Unit("focus"):IsInMeleeRange(40) and S.RecallCloudburstTotem:IsCastable() and not ShamanCBT and CloudBurstHP() >= 10000 and (ShamanCBTPop) then
				if Cast(S.RecallCloudburstTotem) then shouldcast = 201764 return "CloudBurst Release under %" end
			end
			if Unit("focus"):IsInMeleeRange(40)  and UnitAffectingCombat("player") and not ShamanHoldCBT and ShamanCBT and S.CloudBurstTotem:IsCastable() and S.CloudBurstTotem:IsAvailable() then
				if Cast(S.CloudBurstTotem) then shouldcast = 157153 return "CloudBurst Totem under %" end
			end
			if Unit("focus"):IsInMeleeRange(40)  and UnitAffectingCombat("player") and not IsMoving() and UnitAffectingCombat("player") and S.Wellspring:IsReady() and not HoldWellspring and (WellspringPop) then
				if Cast(S.Wellspring) then shouldcast = 197995 return "Wellspring under %" end
			end	
			
			--Purify Spirit
			if S.PurifySpirit:IsCastable() and UnitExists("focus") and not UnitCanAttack("player","focus") and not UnitIsBlackListed("focus") and not HoldPurify and Unit("focus"):IsInRange(40) and Unit("focus"):DebuffDown(Spell(362075)) and Unit("focus"):DebuffDown(Spell(362397)) and Unit("focus"):DebuffDown(Spell(191587)) and Unit("focus"):DebuffDown(Spell(228578)) then
				for i= 1, 40 do
					local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal,spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitDebuff("focus", i)
					if (dispelType == "Curse" or dispelType == "Magic") and spellId ~= 320788 and ((spellId ~= 323347) or (spellId == 323347 and count >= 2)) and spellId ~= 350469 and spellId ~= 350541 and spellId ~= 351117 and spellId ~= 229159 and spellId ~= 227404 then
						if (expirationTime - duration) + (Settings.Restoration.PurifyDelay/1000) <= GetTime() then
							if Cast(S.PurifySpirit) then shouldcast = 77130 return "Purify Spirit" end
						elseif spellId == 227404 and MidnightGUID and MidnightGUID == UnitGUID("focus") then
							if Cast(S.PurifySpirit) then shouldcast = 77130 return "Purify Spirit" end
						end
					end
				end
			end
				
			if (UnitExists("focus") and not UnitCanAttack("player","focus") and not UnitIsBlackListed("focus") and (MembersUnderX(Settings.RestorationM.DPSThreshold) > 0))  then
				if Target:IsInMeleeRange(40) and UnitAffectingCombat("player") and CovenantsON and (S.VesperTotem:IsCastable()  or (VesperUp and not VesperPlaced and S.RecallVesperTotem:IsReady())) then
					if Cast(S.VesperTotem) then shouldcast = 324386 return "Vesper Totem Heal" end
				end
				if Target:IsInMeleeRange(40) and UnitAffectingCombat("player") and CovenantsON and S.ChainHarvest:IsCastable() then
					if Cast(S.ChainHarvest, nil, nil) then shouldcast = 320674 return "Chain Harvest Heal" end
				end
				if Unit("focus"):IsInMeleeRange(40) 
				and S.RecallCloudburstTotem:IsCastable() 
				and not ShamanCBT and CloudBurstHP() >= 10000 
				and (MembersUnderX(Settings.RestorationM.CloudburstReleaseHP) >= Settings.RestorationM.CloudburstReleaseParty or not UnitAffectingCombat("player") or ShamanCBTPop) then
					if Cast(S.RecallCloudburstTotem) then shouldcast = 201764 return "CloudBurst Release under %" end
				end
				if Unit("focus"):IsInMeleeRange(40)  and UnitAffectingCombat("player") and (Unit("focus"):HealthPercentage() <= Settings.RestorationM.HealingStreamHP or ShamanCBT) and not ShamanHoldCBT and S.CloudBurstTotem:IsCastable() and S.CloudBurstTotem:IsAvailable() and ((S.CloudBurstTotem:Charges() >= 2 and not IsMoving()) or ShamanCBT) then
					if Cast(S.CloudBurstTotem) then shouldcast = 157153 return "CloudBurst Totem under %" end
				end
				if Unit("focus"):IsInMeleeRange(40) and Unit("focus"):HealthPercentage() <= Settings.RestorationM.RiptideHP and S.Riptide:IsCastable() then
					if Cast(S.Riptide) then shouldcast = 61295 return "Riptide under %" end
				end
				if Unit("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and S.UnleashLife:IsReady() and Unit("focus"):HealthPercentage() <= Settings.RestorationM.UnleashLifeHP then
					if Cast(S.UnleashLife) then shouldcast = 73685 return "UnleashLife under %" end
				end
				if Unit("focus"):IsInMeleeRange(40)  and UnitAffectingCombat("player") and not IsMoving() and UnitAffectingCombat("player") and S.Wellspring:IsReady() and not HoldWellspring and (Unit("focus"):HealthPercentage() <= Settings.RestorationM.WellspringHP or WellspringPop) then
					if Cast(S.Wellspring) then shouldcast = 197995 return "Wellspring under %" end
				end					
				if Unit("focus"):IsInMeleeRange(40) and ((Unit("focus"):HealthPercentage() <= Settings.RestorationM.HealingSurgeHP2 and Player:BuffStack(S.TidalWaves) >= 1) or (Unit("focus"):HealthPercentage() <= Settings.RestorationM.HealingSurgeHP)) and S.HealingSurge:IsCastable() and not IsMoving() then
					if Cast(S.HealingSurge) then shouldcast = 8004 return "Healing Surge under %" end
				end
				if Unit("focus"):IsInMeleeRange(40) and ((Unit("focus"):HealthPercentage() <= Settings.RestorationM.HealingWaveHP2 and Player:BuffStack(S.TidalWaves) >= 1) or (Unit("focus"):HealthPercentage() <= Settings.RestorationM.HealingWaveHP)) and S.HealingWave:IsCastable() and not IsMoving() then
					if Cast(S.HealingWave) then shouldcast = 77472 return "Healing Wave under %" end
				end
				if Unit("focus"):IsInMeleeRange(40)  and UnitAffectingCombat("player") and not IsMoving() and S.EarthenWallTotem:IsReady() and not HoldHealingRain and MembersUnderX(Settings.RestorationM.EarthenWallTotemHP) >= Settings.RestorationM.EarthenWallTotemParty and UnitAffectingCombat("player") then
					if Cast(S.EarthenWallTotem) then shouldcast = 198838 return "EarthenWallTotem under %" end
				end					
				if Unit("focus"):IsInMeleeRange(40) and S.ChainHeal:IsCastable() and not IsMoving() and MembersUnderX(Settings.RestorationM.ChainHealHP) >= Settings.RestorationM.ChainHealParty then
					if Cast(S.ChainHeal) then shouldcast = 1064 return "Chain Heal under %" end
				end
				if Unit("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and S.HealingRain:IsCastable() and not HoldHealingRain and not Player:IsCasting(S.HealingRain) and not IsMoving() and MembersUnderX(Settings.RestorationM.HealingRainHP) >= Settings.RestorationM.HealingRainParty then
					if Cast(S.HealingRain) then shouldcast = 73920 return "Healing Rain under %" end
				end
				if Unit("focus"):IsInMeleeRange(40)  and UnitAffectingCombat("player") and Unit("focus"):HealthPercentage() <= Settings.RestorationM.HealingStreamHP and S.HealingStreamTotem:IsCastable() and not S.CloudBurstTotem:IsAvailable() and not IsMoving() then
					if Cast(S.HealingStreamTotem) then shouldcast = 5394 return "Healing Stream Totem under %" end
				end
				-- if Unit("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and Unit("focus"):HealthPercentage() <= Settings.RestorationM.HealingStreamHP and S.CloudBurstTotem:IsCastable() and S.CloudBurstTotem:IsAvailable() and S.CloudBurstTotem:Charges() >= 2 and not IsMoving() then
					-- if Cast(S.CloudBurstTotem) then shouldcast = 157153 return "CloudBurst Totem under %" end
				-- end
			end

				if Unit("focus"):IsInMeleeRange(40) and Settings.RestorationM.RainIgnoreCheck and UnitAffectingCombat("player") and S.HealingRain:IsCastable() and not HoldHealingRain and HL.FightRemains(Enemies40y, false) > 10 and MembersUnderX(Settings.RestorationM.DPSThreshold) <= 0 and not Player:IsCasting(S.HealingRain) and not IsMoving() and MembersUnderX(Settings.RestorationM.HealingRainHP) >= Settings.RestorationM.HealingRainParty then
					if Cast(S.HealingRain) then shouldcast = 73920 return "Healing Rain under % 1" end
				end
				
		end
		if GetNumGroupMembers() > 5 then
			-- Target (@focus) lowest HP party member
			-- BattlefieldSnapshot()
			-- if LowestHealthGUID and UnitGUID("focus") ~= LowestHealthGUID and SwapTimer <= GetTime() then
				-- shouldcastfocus = LowestHealthIndex * 100
				-- SwapTimer = GetTime() + 0.5
			-- end
			--print("ShouldPop", Unit("focus"):IsInMeleeRange(40), S.RecallCloudburstTotem:IsCastable(), ShamanCBT, (CloudBurstHP() >= 10000), (ShamanCBTPop))

			--DBM overrides
			if ShouldCancel and not Player:IsCasting(S.Wellspring) then
				shouldcast = 1999
			end			
			if Unit("focus"):IsInMeleeRange(40) and S.RecallCloudburstTotem:IsCastable() and not ShamanCBT and CloudBurstHP() >= 10000 and (ShamanCBTPop) then
				if Cast(S.RecallCloudburstTotem) then shouldcast = 201764 return "CloudBurst Release DBM" end
			end
			if Unit("focus"):IsInMeleeRange(40)  and UnitAffectingCombat("player") and not ShamanHoldCBT and ShamanCBT and S.CloudBurstTotem:IsCastable() and S.CloudBurstTotem:IsAvailable() then
				if Cast(S.CloudBurstTotem) then shouldcast = 157153 return "CloudBurst Totem DBM" end
			end
			if Unit("focus"):IsInMeleeRange(40)  and UnitAffectingCombat("player") and not IsMoving() and UnitAffectingCombat("player") and S.Wellspring:IsReady() and not HoldWellspring and (WellspringPop) then
				if Cast(S.Wellspring) then shouldcast = 197995 return "Wellspring DBM" end
			end	

			if UnitExists("focus") and not UnitCanAttack("player","focus") and not UnitIsBlackListed("focus") and (MembersUnderX(Settings.RestorationR.DPSThreshold) > 0 or not UnitExists("target") or not UnitAffectingCombat("player")) then
				if Target:IsInMeleeRange(40) and CovenantsON and ( S.VesperTotem:IsReady() or (VesperUp and not VesperPlaced and S.RecallVesperTotem:IsReady())) then
					if Cast(S.VesperTotem) then shouldcast = 324386 return "Vesper Totem" end
				end
				if Unit("focus"):IsInMeleeRange(40) and S.RecallCloudburstTotem:IsReady()  and CloudBurstHP() >= 10000 and not ShamanCBT and ((MembersUnderX(Settings.RestorationR.CloudburstReleaseHP) >= Settings.RestorationR.CloudburstReleaseRaid) or not UnitAffectingCombat("player") or ShamanCBTPop) then
					if Cast(S.RecallCloudburstTotem) then shouldcast = 201764 return "CloudBurst Release under %" end
				end
				if Unit("focus"):IsInMeleeRange(40) and Unit("focus"):HealthPercentage() <= Settings.RestorationR.RiptideHP and S.Riptide:IsReady() then
					if Cast(S.Riptide) then shouldcast = 61295 return "Riptide under %" end
				end
				if Unit("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and S.HealingRain:IsReady() and not HoldHealingRain and not HoldHealingRain and not Player:IsCasting(S.HealingRain) and not IsMoving() and MembersUnderX(Settings.RestorationR.HealingRainHP) >= Settings.RestorationR.HealingRainRaid then
					if Cast(S.HealingRain) then shouldcast = 73920 return "Healing Rain under %" end
				end					
				if Unit("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and S.UnleashLife:IsReady() and Unit("focus"):HealthPercentage() <= Settings.RestorationR.UnleashLifeHP then
					if Cast(S.UnleashLife) then shouldcast = 73685 return "UnleashLife under %" end
				end
				if Unit("focus"):IsInMeleeRange(40) and not IsMoving() and UnitAffectingCombat("player") and S.Wellspring:IsReady() and not HoldWellspring and (Unit("focus"):HealthPercentage() <= Settings.RestorationR.WellspringHP or WellspringPop) then
					if Cast(S.Wellspring) then shouldcast = 197995 return "Wellspring under %" end
				end						
				if Unit("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and not ShamanHoldCBT and (Unit("focus"):HealthPercentage() <= Settings.RestorationR.HealingStreamHP or ShamanCBT) and S.CloudBurstTotem:IsReady() and S.CloudBurstTotem:IsAvailable() and ((S.CloudBurstTotem:Charges() >= 2 and not IsMoving()) or ShamanCBT) then
					if Cast(S.CloudBurstTotem) then shouldcast = 157153 return "CloudBurst Totem under %" end
				end
				if Unit("focus"):IsInMeleeRange(40) and Unit("focus"):HealthPercentage() <= Settings.RestorationR.HealingStreamHP and S.HealingStreamTotem:IsReady() and not S.CloudBurstTotem:IsAvailable() and not IsMoving() then
					if Cast(S.HealingStreamTotem) then shouldcast = 5394 return "Healing Stream Totem under %" end
				end
				if Unit("focus"):IsInMeleeRange(40) and S.EarthenWallTotem:IsReady() and not HoldHealingRain and MembersUnderX(Settings.RestorationR.EarthenWallTotemHP) >= Settings.RestorationR.EarthenWallTotemRaid and UnitAffectingCombat("player") then
					if Cast(S.EarthenWallTotem) then shouldcast = 198838 return "EarthenWallTotem under %" end
				end				
				if Unit("focus"):IsInMeleeRange(40) and S.ChainHeal:IsReady() and not IsMoving() and MembersUnderX(Settings.RestorationR.ChainHealHP) >= Settings.RestorationR.ChainHealRaid then
					if Cast(S.ChainHeal) then shouldcast = 1064 return "Chain Heal under %" end
				end
				if Unit("focus"):IsInMeleeRange(40) and ((Unit("focus"):HealthPercentage() <= Settings.RestorationR.HealingSurgeHP2 and Player:BuffStack(S.TidalWaves) >= 1) or (Unit("focus"):HealthPercentage() <= Settings.RestorationR.HealingSurgeHP)) and S.HealingSurge:IsReady() and not IsMoving() then
					if Cast(S.HealingSurge) then shouldcast = 8004 return "Healing Surge under %" end
				end
				if Unit("focus"):IsInMeleeRange(40) and ((Unit("focus"):HealthPercentage() <= Settings.RestorationR.HealingWaveHP2 and Player:BuffStack(S.TidalWaves) >= 1) or (Unit("focus"):HealthPercentage() <= Settings.RestorationR.HealingWaveHP)) and S.HealingWave:IsReady() and not IsMoving() then
					if Cast(S.HealingWave) then shouldcast = 77472 return "Healing Wave under %" end
				end
				-- if Unit("focus"):IsInMeleeRange(40) and UnitAffectingCombat("player") and Unit("focus"):HealthPercentage() <= Settings.RestorationR.HealingStreamHP and S.CloudBurstTotem:IsCastable() and S.CloudBurstTotem:IsAvailable() and S.CloudBurstTotem:Charges() >= 2 and not IsMoving() then
					-- if Cast(S.CloudBurstTotem) then shouldcast = 157153 return "CloudBurst Totem under %" end
				-- end
			end

		end

	-- Start Solo Healing Logic
	else
		if Player:BuffDown(S.LightningShieldBuff) then
			if Cast(S.LightningShield) then shouldcast = 192106 return "Lightning Shield Self" end
		end
	end
end

local function CoreRotation()
  local DebugMessage
  
  if GetNumGroupMembers() > 0  and not StopHeal then
    DebugMessage = FriendlyRotation()
    if DebugMessage then return DebugMessage end;
  end
  if GetNumGroupMembers() > 5 and not StopHeal then
    DebugMessage = FriendlyRotation()
    if DebugMessage then return DebugMessage end;
  end
  
  -- Keep minimum number of flameshocks up
  if UnitsRefreshFS(Enemies40y) < NumFlameShocksToMaintain() and not StopDPS then
    DebugMessage = ApplyFlameShock()
    if DebugMessage then return DebugMessage end;
  end

  local builder, prefer_fs_refresh = nil, false
	if not StopDPS then
	  if EnemiesCount10ySplash < 2 then 
		builder, prefer_fs_refresh = SingleTargetAndSpreadCleaveBuilder() 
	  else
		builder, prefer_fs_refresh = AOEBuilder() 
	  end
	end
  -- Refresh flameshocks when the builder is low priority.
  -- if prefer_fs_refresh and RefreshableFlameshocks > 0 and UnitsRefreshFS(Enemies40y) <= NumFlameShocksToMaintain() then
    -- DebugMessage = ApplyFlameShock()
    -- if DebugMessage then return DebugMessage end;
  -- end
  
  -- If you have a non-nil + viable builder, then you should cast it!
  if builder ~= nil and IsViable(builder) and Everyone.TargetIsValid() and not UnitIsBlackListed("target") and not StopDPS then
    if Cast(builder) then return "Building Maelstrom with optimal Builder (AOE)" end
  end
  if builder == nil and Everyone.TargetIsValid() and not UnitIsBlackListed("target") and not StopDPS then
    -- Try to refresh flameshocks
    DebugMessage = ApplyFlameShock()
    if DebugMessage then return "Refreshing Flame Shock because we cannot build or spend" end
    if Cast(S.FrostShock) then shouldcast = 196840 return "Casting Frost Shock because we cannot build or spend or refresh flame shock" end
  end

  return nil
end

local function Reset()
	Opener1 = HeroRotationCharDB.Toggles[6]
	CovenantsON = HeroRotationCharDB.Toggles[4]
	SmallCDsOn = HeroRotationCharDB.Toggles[5]
	StopAutoSwap = HeroRotationCharDB.Toggles[12]
	UsePots = HeroRotationCharDB.Toggles[15]
	ForceAoE = HeroRotationCharDB.Toggles[60]
	CDsON      = HR.CDsON
	HoldEarthEle = HeroRotationCharDB.Toggles[90]
	QTremorTotem = HeroRotationCharDB.Toggles[93] 
	QWindRushTotem = HeroRotationCharDB.Toggles[94] 
	QHex = HeroRotationCharDB.Toggles[95] 
	UsePurge = HeroRotationCharDB.Toggles[97] 
	HealOOC = HeroRotationCharDB.Toggles[160] 
	OhShit = HeroRotationCharDB.Toggles[161] 
	QCapTotem = HeroRotationCharDB.Toggles[91] 
	QVesperTotem = HeroRotationCharDB.Toggles[162] 
	HoldPurify = HeroRotationCharDB.Toggles[163] 
	QPurify = HeroRotationCharDB.Toggles[164]
	StopDPS = HeroRotationCharDB.Toggles[165]
	StopHeal = HeroRotationCharDB.Toggles[166]
	ShamanCBT, ShamanCBTPop, ShamanHoldCBT, HoldWellspring, WellspringPop, HoldHealingRain, ShouldCancel = nil, nil, nil, nil, nil, nil, nil
	LowestHealthIndex = 0
	QuakingR = 0
	--Quaking
	for i=1,20 do
		if select(10, UnitDebuff("player", i)) == 240447 then
			if select(6, UnitDebuff("player", i)) ~= nil then
				QuakingR = (select(6, UnitDebuff("player", i)) - (GetTime()))
			end
		end
	end
	
  TopTrinketID = GetInventoryItemID("player", 13)
  BotTrinketID = GetInventoryItemID("player", 14)
  if not Settings.Commons.Enabled.TopTrinket and not Settings.Commons.Enabled.BotTrinket then
	  OnUseExcludes = {--  I.TrinketName:ID(),
	  TopTrinketID,
	  BotTrinketID,
	}
  elseif not Settings.Commons.Enabled.TopTrinket and Settings.Commons.Enabled.BotTrinket then
	  OnUseExcludes = {--  I.TrinketName:ID(),
	  TopTrinketID,
	}  
  elseif not Settings.Commons.Enabled.BotTrinket and Settings.Commons.Enabled.TopTrinket then
	  OnUseExcludes = {--  I.TrinketName:ID(),
	  BotTrinketID,
	}
	
  end
  
end


--- ======= MAIN =======
local function APL()
  Enemies40y = Player:GetEnemiesInRange(40) -- Multiple CastCycle Spells
  if AoEON() and Settings.Commons.AoeMode == "Conservative" then
    EnemiesCount8ySplash = Target:GetEnemiesInSplashRangeCount(8)
    EnemiesCount10ySplash = Target:GetEnemiesInSplashRangeCount(15)
  elseif AoEON() and Settings.Commons.AoeMode == "Aggresive" then
	local enemiesCheckCount = 0
	for ienemiesCheckCount=1,20 do
		local unit = "nameplate"..ienemiesCheckCount
		if UnitExists(unit) then
			if UnitCanAttack("player", unit) then
				if (UnitCanAttack("player", unit) and UnitAffectingCombat(unit) and IsItemInRange(32698, unit) and UnitDetailedThreatSituation("player", unit) ~= nil) or Unit(unit):IsDummy() or string.find(UnitGUID(unit), 153285) or string.find(UnitGUID(unit), 31146) or string.find(UnitGUID(unit), 176581)
					or string.find(UnitGUID(unit), 179124) or string.find(UnitGUID(unit), 179010) or string.find(UnitGUID(unit), 180323) or string.find(UnitGUID(unit), 179010) or string.find(UnitGUID(unit), 179942) or string.find(UnitGUID(unit), 176521) or string.find(UnitGUID(unit), 177594) or string.find(UnitGUID(unit), 177117) or string.find(UnitGUID(unit), 176581) or string.find(UnitGUID(unit), 180840) or string.find(UnitGUID(unit), 176605)
					or UnitName(unit) == "Glacial Spike" or string.find(UnitGUID(unit), 180473) or string.find(UnitGUID(unit), 180474) or string.find(UnitGUID(unit), 176929) or string.find(UnitGUID(unit), 176920) or string.find(UnitGUID(unit), 177154) or string.find(UnitGUID(unit), 177787) or string.find(UnitGUID(unit), 177889) or string.find(UnitGUID(unit), 177891) or string.find(UnitGUID(unit), 177892) or string.find(UnitGUID(unit), 168326) then
						enemiesCheckCount = (enemiesCheckCount + 1)
				end
			end
		end
	end
    EnemiesCount8ySplash = enemiesCheckCount
    EnemiesCount10ySplash = enemiesCheckCount
  end
	
  if not AoEON() then
    EnemiesCount8ySplash = 1
    EnemiesCount10ySplash = 1
  end

  if ForceAoE then
	EnemiesCount10ySplash = 10
	EnemiesCount8ySplash = 10
  end
  
  if not BotOn then
	MOshouldcast = 0
	shouldcast = 0
  end

  if MidnightGUID ~= nil and MidnightTime and MidnightTime <= GetTime() - 10 then
	MidnightGUID = nil
	MidnightName = nil
  end
  
	if MOshouldcast > 0 then
		MOshouldcast = 0
	end
	
	if shouldcast > 0 then
		shouldcast = 0
	end
	
  -- Generalized Data Updates (per frame)
  --BattlefieldSnapshot()
  VesperCounter()
  Reset()
  Blacklist()
  if Settings.Commons.DBMSupport then
	ShamanCBT, ShamanCBTPop, ShamanHoldCBT, HoldWellspring, WellspringPop, HoldHealingRain, ShouldCancel = HR.RaidDamageInc()
  end
  --print(ShamanCBT, ShamanCBTPop, ShamanHoldCBT, HoldWellspring, WellspringPop, HoldHealingRain, ShouldCancel)
	--print(Spell(197995):CastTime())
	if UnitAffectingCombat("player") and EnemiesCount10ySplash >= 1 and Settings.Restoration.TargetSwap == "AutoSwap" and not StopAutoSwap and not StopDPS then
		if not UnitExists("target") or UnitReaction("player", "target") == 8 or UnitReaction("player", "target") == 7 or UnitReaction("player", "target") == 6 or UnitReaction("player", "target") == 5 then
			MOshouldcast = 999	
		end
	end
	
  --Dont cancel FaeTransfusion
  if Player:IsChanneling() or Player:IsChanneling(S.FaeTransfusion) then
    if Cast(S.Pool, nil) then shouldcast = 99999 return "Trinket Channel"; end
  end

    --explosives
  if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
	if S.FrostShock:IsCastable() then
		if Cast(S.FrostShock, nil) then MOshouldcast = 1196840 return "explosive MO FS"; end
	end
  end
  
  if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
	if S.FrostShock:IsCastable() then
		if Cast(S.FrostShock, nil) then shouldcast = 196840 return "explosive  FS"; end
	end
	
  end
  
  --Resets
	if HR.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
		starttime = GetTime()
		endtime = starttime + (HR.GUISettings.General.OpenerReset)
	elseif HR.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
		HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6];
		HR.ToggleIconFrame:UpdateButtonText(6);
		HR.Print("Opener is now "..(HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."));
	end
	
  local DebugMessage
		if GetNumGroupMembers() >= 0 and GetNumGroupMembers() <= 5 then
			if UnitGUID("focus") == Unit("party"..(shouldcastfocus/100)):GUID() and shouldcastfocus ~= 500 then	
				shouldcastfocus = 0
			end
			if UnitGUID("focus") == UnitGUID("player") and shouldcastfocus == 500 then	
				shouldcastfocus = 0
			end
		end
		if GetNumGroupMembers() > 5 then
			if UnitGUID("focus") == Unit("raid"..(shouldcastfocus/1000)):GUID() then	
				shouldcastfocus = 0
			end
		end		
	if GetNumGroupMembers() >= 0 then
			-- Target (@focus) lowest HP party member
		if SwapTimer <= GetTime() then 
			BattlefieldSnapshot()
			if (LowestHealthGUID ~= nil) and UnitGUID("focus") ~= LowestHealthGUID and SwapTimer <= GetTime() then
				shouldcastfocus = LowestHealthIndex * 100
			end
			SwapTimer = GetTime() + 0.5
		end
	end	
--Queues
  if (QPurify and S.PurifySpirit:IsUsableP() and S.PurifySpirit:CooldownRemains(BypassRecovery) <= 0 and UnitExists("mouseover")) then
	if HR.Cast(S.PurifySpirit, nil, nil, nil) then 
		if UnitExists("mouseover") and Unit("mouseover"):IsInRange(40) and not UnitIsEnemy("mouseover", "player") then
			shouldcast = 177130 return "queue PurifySpirit MO"; 
		end
	end
  elseif ((not S.PurifySpirit:IsUsableP() or S.PurifySpirit:CooldownRemains() > 0) and QPurify) then
	  HeroRotationCharDB.Toggles[164] = not HeroRotationCharDB.Toggles[164];
      HR.Print("PurifySpirit Queue is now "..(HeroRotationCharDB.Toggles[164] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end
  
  if (QCapTotem and S.CapacitorTotem:IsUsableP() and S.CapacitorTotem:CooldownRemains(BypassRecovery) <= 0) then
	if HR.Cast(S.CapacitorTotem, nil, nil, nil) then	
		shouldcast = 1192058 return "queue CapacitorTotem"; end
  elseif ((not S.CapacitorTotem:IsUsableP() or S.CapacitorTotem:CooldownRemains(BypassRecovery) > 0) and QCapTotem) then
	  HeroRotationCharDB.Toggles[91] = not HeroRotationCharDB.Toggles[91];
      HR.Print("Capacitor Totem Queue is now "..(HeroRotationCharDB.Toggles[91] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (QVesperTotem and S.VesperTotem:IsUsableP() and (S.VesperTotem:CooldownRemains(BypassRecovery) <= 0 or Spell(324519):IsCastable())) then
	if HR.Cast(S.VesperTotem, nil, nil, nil) then	
		shouldcast = 324386 return "queue VesperTotem"; end
  elseif ((not S.VesperTotem:IsUsableP() or (S.VesperTotem:CooldownRemains(BypassRecovery) > 0 and not Spell(324519):IsCastable())) and QVesperTotem) then
	  HeroRotationCharDB.Toggles[162] = not HeroRotationCharDB.Toggles[162];
      HR.Print("Capacitor Totem Queue is now "..(HeroRotationCharDB.Toggles[162] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (QWindRushTotem and S.WindRushTotem:IsUsableP() and S.WindRushTotem:IsAvailable() and S.WindRushTotem:CooldownRemains(BypassRecovery) <= 0) then
	if HR.Cast(S.WindRushTotem, nil, nil, nil) then	
		shouldcast = 192077 return "queue WindRushTotem"; end
  elseif ((not S.WindRushTotem:IsUsableP() or not S.WindRushTotem:IsAvailable() or S.WindRushTotem:CooldownRemains(BypassRecovery) > 0) and QWindRushTotem) then
	  HeroRotationCharDB.Toggles[94] = not HeroRotationCharDB.Toggles[94];
      HR.Print("Wind Rush Totem Queue is now "..(HeroRotationCharDB.Toggles[94] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end  

  if (QHex and S.Hex:IsUsableP() and S.Hex:CooldownRemains(BypassRecovery) <= 0 and UnitExists("mouseover")) then
	if HR.Cast(S.Hex, nil, nil, nil) then 
		if UnitExists("mouseover") and Unit("mouseover"):IsInRange(40) then
			MOshouldcast = 151514 return "queue Hex MO"; 
		end
	end
  elseif ((not S.Hex:IsUsableP() or S.Hex:CooldownRemains() > 0) and QHex) then
	  HeroRotationCharDB.Toggles[95] = not HeroRotationCharDB.Toggles[95];
      HR.Print("Hex Queue is now "..(HeroRotationCharDB.Toggles[95] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (QTremorTotem and S.TremorTotem:IsUsableP() and S.TremorTotem:CooldownRemains(BypassRecovery) <= 0) then
	if HR.Cast(S.TremorTotem, nil, nil, nil) then	
		shouldcast = 8143 return "queue TremorTotem"; end
  elseif ((not S.TremorTotem:IsUsableP() or S.TremorTotem:CooldownRemains(BypassRecovery) > 0) and QTremorTotem) then
	  HeroRotationCharDB.Toggles[93] = not HeroRotationCharDB.Toggles[93];
      HR.Print("Tremor Totem Queue is now "..(HeroRotationCharDB.Toggles[93] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end
  
  if HealOOC and not UnitAffectingCombat("player") and not StopHeal then
    DebugMessage = FriendlyRotation()
    if DebugMessage then return DebugMessage end;
  end		
  
  DebugMessage = Precombat();
  if DebugMessage then return DebugMessage end;
    -- Everyone.Interrupt(30, S.WindShear, Settings.Commons.OffGCDasOffGCD.WindShear, false);

  if S.CloudBurstTotem:IsCastable() and not StopHeal and S.CloudBurstTotem:IsAvailable() and not IsMoving() and UnitAffectingCombat("player") and S.CloudBurstTotem:Charges() >= 1 and (S.HealingTideTotem:TimeSinceLastCast() <= 7 or S.Ascendance:TimeSinceLastCast() <= 10 or S.SpiritLinkTotem:TimeSinceLastCast() <= 3) then
	if Cast(S.CloudBurstTotem) then shouldcast = 157153 return "CloudBurst Totem for Burst" end
  end
  
  if (UnitAffectingCombat("player") or Opener1) then
    if OhShit then 
		DebugMessage = OhShitR()
		if DebugMessage then return DebugMessage end;
	end
	
	if Everyone.TargetIsValid() and not StopHeal then
		DebugMessage = Cooldowns()
		if DebugMessage then return DebugMessage end;
	end
	
    DebugMessage = CoreRotation()
    if DebugMessage then return DebugMessage end;

    -- This is actually an "error" state, we should always be able to frost shock.
    if Everyone.TargetIsValid() and UnitIsBlackListed("target") and not StopDPS then
		HR.CastAnnotated(S.Pool, false, "LoS");
	end
  end
end

local function Init()
  HR.Print("Restoration Shaman rotation is currently a work in progress.")
end

function ReturnSpell3()
	if shouldcast == 0 then
		return 0
	else
		return shouldcast
	end
end
	
function ReturnSpellMO3()
	if MOshouldcast == 0 then
		return 0
	else
		return MOshouldcast
	end
end

function ReturnSpellF3()
	if shouldcastfocus == 0 then
		return 0
	else
		return shouldcastfocus
	end
end

function BlacklistExport()
local BLexport = nil
	if table.getn(BlacklistTable) > 0 then
	   for i=1, table.getn(BlacklistTable) do
		  for w in string.gmatch(BlacklistTable[i], "([^%s]+)") do
			 if tonumber(w) ~= nil then
				w = tonumber(w)
			 end
			 if type(w) == "string" then
				BLexport = FindUnitFor(w)
			 end
		  end
	   end
	end
return BLexport
end

HR.SetAPL(264, APL, Init)