--- ============================ HEADER ============================
--- ======= LOCALIZE =======
-- Addon
local addonName, addonTable = ...
-- HeroDBC
local DBC = HeroDBC.DBC
-- HeroLib
local HL = HeroLib
local Cache = HeroCache
local Unit = HL.Unit
local Player = Unit.Player
local Target = Unit.Target
local Pet = Unit.Pet
local Spell = HL.Spell
local Item = HL.Item
local Action = HL.Action
-- HeroRotation
local HR = HeroRotation
local AoEON = HR.AoEON
local CDsON = HR.CDsON
local Cast = HR.Cast
local CastSuggested = HR.CastSuggested
-- Lua
local mathmax = math.max

local SmallCDsOn = HeroRotationCharDB.Toggles[4]
local Opener = HeroRotationCharDB.Toggles[5]
local StopAutoSwap = HeroRotationCharDB.Toggles[12]
local UsePots = not HeroRotationCharDB.Toggles[15]
local QBindingshot = HeroRotationCharDB.Toggles[120]
local QFreezingTrap = HeroRotationCharDB.Toggles[121]
local QIntimidation = HeroRotationCharDB.Toggles[122]
local QFlare = HeroRotationCharDB.Toggles[123]
local QTarTrap = HeroRotationCharDB.Toggles[124]
local HoldMD = HeroRotationCharDB.Toggles[125]
local HoldTranq = HeroRotationCharDB.Toggles[142]
local HoldWeapon = HeroRotationCharDB.Toggles[17]
local QWailingArrow = HeroRotationCharDB.Toggles[170];

local AotWReady
local StampReady
local BWReady
local BSReady

local WhiteList = { 355782, 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015,
    322433, 334324, 317936, 327332, 328288, 343470, 333293, 320272, 342139, 355888, 349933, 356549,
    355934, 353706, 347775, 357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450,
    334470, 320703, 320012, 324085, 333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426,
    382555, 257260 }

--- ============================ CONTENT ===========================
--- ======= APL LOCALS =======
-- Commons
local Everyone = HR.Commons.Everyone
local Hunter = HR.Commons.Hunter

-- GUI Settings
local Settings = {
    General = HR.GUISettings.General,
    Commons = HR.GUISettings.APL.Hunter.Commons,
    BeastMastery = HR.GUISettings.APL.Hunter.BeastMastery
}

-- Spells
local S = Spell.Hunter.BeastMastery;
local SummonPetSpells = { S.SummonPet, S.SummonPet2, S.SummonPet3, S.SummonPet4, S.SummonPet5 }

-- Items
local I = Item.Hunter.BeastMastery;
local OnUseExcludes = {
    --  I.TrinketName:ID(),
}

-- Trinket Item Objects
local equip = Player:GetEquipment()
local finger1 = (equip[11]) and Item(equip[11]) or Item(0)
local finger2 = (equip[12]) and Item(equip[12]) or Item(0)
local trinket1 = Item(0)
local trinket2 = Item(0)
local TopTrinketID = GetInventoryItemID("player", 13)
local BotTrinketID = GetInventoryItemID("player", 14)

-- Rotation Variables
local GCDMax
local BossFightRemains = 11111
local FightRemains = 11111

-- Check for equipment changes
HL:RegisterForEvent(function()
    equip = Player:GetEquipment()
    finger1 = (equip[11]) and Item(equip[11]) or Item(0)
    finger2 = (equip[12]) and Item(equip[12]) or Item(0)
end, "PLAYER_EQUIPMENT_CHANGED")

-- Reset variables after combat
HL:RegisterForEvent(function()
    BossFightRemains = 11111
    FightRemains = 11111
end, "PLAYER_REGEN_ENABLED")

-- Enemies
local Enemies40y, PetEnemiesMixedy, PetEnemiesMixedyCount

-- Range
local Enemies8y
local TargetInRange40y, TargetInRange30y
local TargetInRangePet30y

-- Rotation Variables
local ShouldReturn -- Used to get the return string
local GCDMax
local shouldcast = 0
local MOshouldcast = 0

-- Interrupts
local Interrupts = { { S.Intimidation, "Cast Intimidation (Interrupt)", function()
    return true;
end } };

--- ======= HELPERS =======
local function num(val)
    if val then
        return 1
    else
        return 0
    end
end

local function bool(val)
    return val ~= 0
end

local function HMUp(enemies)
    local HMUp = 0
    if enemies ~= nil then
        for k in pairs(enemies) do
            local CycleUnit = enemies[k]
            if CycleUnit:IsInRange(40) and
                (CycleUnit:AffectingCombat() or CycleUnit:IsDummy() or CycleUnit:NPCID() == 153285) and
                CycleUnit:DebuffUp(Spell(257284)) then
                HMUp = HMUp + 1
            end
        end
    end

    return HMUp
end

-- target_if=min:dot.barbed_shot.remains
local function EvaluateTargetIfFilterBarbedShot(TargetUnit)
    return (TargetUnit:DebuffRemains(S.BarbedShotDebuff))
end

local function EvaluateTargetIfFilterLatentPoison(TargetUnit)
  -- target_if=max:debuff.latent_poison.stack
  return (TargetUnit:DebuffStack(S.LatentPoisonDebuff))
end

-- target_if=min:remains
local function EvaluateTargetIfFilterSerpentSting(TargetUnit)
  -- target_if=min:remains
  return (TargetUnit:DebuffRemains(S.SerpentStingDebuff))
end

-- if=debuff.latent_poison.stack>9&(pet.main.buff.frenzy.up&pet.main.buff.frenzy.remains<=gcd+0.25|talent.scent_of_blood&cooldown.bestial_wrath.remains<12+gcd|full_recharge_time<gcd&cooldown.bestial_wrath.remains)
local function EvaluateTargetIfBarbedShotCleave(TargetUnit)
    if ((TargetUnit:DebuffStack(S.LatentPoisonDebuff) > 9 and
        ((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
            (S.ScentofBlood:IsAvailable() and S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
            (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON())))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Unit("mouseover"):GUID()) then
        MOshouldcast = 1217200
        return true
    elseif ((TargetUnit:DebuffStack(S.LatentPoisonDebuff) > 9 and
        ((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
            (S.ScentofBlood:IsAvailable() and S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
            (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON())))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and
        Settings.BeastMastery.TargetSwap == "AutoSwap" and TargetUnit:GUID() ~= Target:GUID() and not StopAutoSwap) then
        MOshouldcast = 999
        return true
    elseif ((TargetUnit:DebuffStack(S.LatentPoisonDebuff) > 9 and
        ((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
            (S.ScentofBlood:IsAvailable() and S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
            (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON())))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Target:GUID()) then
        shouldcast = 217200
        return true
    elseif (TargetUnit:DebuffStack(S.LatentPoisonDebuff) > 9 and
        ((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
            (S.ScentofBlood:IsAvailable() and S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
            (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON())))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) then
        return true
    end
end

-- if=pet.main.buff.frenzy.up&pet.main.buff.frenzy.remains<=gcd+0.25|talent.scent_of_blood&cooldown.bestial_wrath.remains<12+gcd|full_recharge_time<gcd&cooldown.bestial_wrath.remains
local function EvaluateTargetIfBarbedShotCleave2(TargetUnit)
    if (((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
        (S.ScentofBlood:IsAvailable() and S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
        (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON()))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Unit("mouseover"):GUID()) then
        MOshouldcast = 1217200
        return true
    elseif (((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
        (S.ScentofBlood:IsAvailable() and S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
        (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON()))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and
        Settings.BeastMastery.TargetSwap == "AutoSwap" and TargetUnit:GUID() ~= Target:GUID() and not StopAutoSwap) then
        MOshouldcast = 999
        return true
    elseif (((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
        (S.ScentofBlood:IsAvailable() and S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
        (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON()))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Target:GUID()) then
        shouldcast = 217200
        return true
    elseif ((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
        (S.ScentofBlood:IsAvailable() and S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
        (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON()))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) then
        return true
    end
end

-- if=debuff.latent_poison.stack>9&(talent.wild_instincts&buff.call_of_the_wild.up|fight_remains<9|talent.wild_call&charges_fractional>1.2)
-- upped to 1.8 to keep stacks longer
local function EvaluateTargetIfBarbedShotCleave3(TargetUnit)
    if ((TargetUnit:DebuffStack(S.LatentPoisonDebuff) > 9 and
        ((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or FightRemains < 9 or
            (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Unit("mouseover"):GUID()) then
        MOshouldcast = 1217200
        return true
    elseif ((TargetUnit:DebuffStack(S.LatentPoisonDebuff) > 9 and
        ((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or FightRemains < 9 or
            (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and
        Settings.BeastMastery.TargetSwap == "AutoSwap" and TargetUnit:GUID() ~= Target:GUID() and not StopAutoSwap) then
        MOshouldcast = 999
        return true
    elseif ((TargetUnit:DebuffStack(S.LatentPoisonDebuff) > 9 and
        ((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or FightRemains < 9 or
            (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Target:GUID()) then
        shouldcast = 217200
        return true
    elseif (TargetUnit:DebuffStack(S.LatentPoisonDebuff) > 9 and
        ((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or FightRemains < 9 or
            (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) then
        return true
    end
end

-- if=talent.wild_instincts&buff.call_of_the_wild.up|fight_remains<9|talent.wild_call&charges_fractional>1.2
-- upped to 1.8 to keep stacks longer
local function EvaluateTargetIfBarbedShotCleave4(TargetUnit)
    if (((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or FightRemains < 9 or
        (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8)) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Unit("mouseover"):GUID()) then
        MOshouldcast = 1217200
        return true
    elseif (((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or FightRemains < 9 or
        (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8)) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and
        Settings.BeastMastery.TargetSwap == "AutoSwap" and TargetUnit:GUID() ~= Target:GUID() and not StopAutoSwap) then
        MOshouldcast = 999
        return true
    elseif (((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or FightRemains < 9 or
        (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8)) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Target:GUID()) then
        shouldcast = 217200
        return true
    elseif ((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or FightRemains < 9 or
        (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8)) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) then
        return true
    end
end

-- if=refreshable&target.time_to_die>duration
local function EvaluateTargetIfSerpentStingCleave(TargetUnit)
    if ((TargetUnit:DebuffRefreshable(S.SerpentStingDebuff) and TargetUnit:TimeToDie() >
        S.SerpentStingDebuff:BaseDuration()) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Unit("mouseover"):GUID()) then
        MOshouldcast = 1271788
        return true
    elseif ((TargetUnit:DebuffRefreshable(S.SerpentStingDebuff) and TargetUnit:TimeToDie() >
        S.SerpentStingDebuff:BaseDuration()) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and
        Settings.BeastMastery.TargetSwap == "AutoSwap" and TargetUnit:GUID() ~= Target:GUID() and not StopAutoSwap) then
        MOshouldcast = 999
        return true
    elseif ((TargetUnit:DebuffRefreshable(S.SerpentStingDebuff) and TargetUnit:TimeToDie() >
        S.SerpentStingDebuff:BaseDuration()) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Target:GUID()) then
        shouldcast = 271788
        return true
    elseif (TargetUnit:DebuffRefreshable(S.SerpentStingDebuff) and TargetUnit:TimeToDie() >
        S.SerpentStingDebuff:BaseDuration()) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) then
        return true
    end
end

-- if=pet.main.buff.frenzy.up&pet.main.buff.frenzy.remains<=gcd+0.25|talent.scent_of_blood&pet.main.buff.frenzy.stack<3&cooldown.bestial_wrath.ready
local function EvaluateTargetIfBarbedShotST(TargetUnit)
    if (((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
        (S.ScentofBlood:IsAvailable() and Pet:BuffStack(S.FrenzyPetBuff) < 3 and
            (S.BestialWrath:CooldownRemains() > 0 or not CDsON()))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Unit("mouseover"):GUID()) then
        MOshouldcast = 1217200
        return true
    elseif (((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
        (S.ScentofBlood:IsAvailable() and Pet:BuffStack(S.FrenzyPetBuff) < 3 and
            (S.BestialWrath:CooldownRemains() > 0 or not CDsON()))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and
        Settings.BeastMastery.TargetSwap == "AutoSwap" and TargetUnit:GUID() ~= Target:GUID() and not StopAutoSwap) then
        MOshouldcast = 999
        return true
    elseif (((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
        (S.ScentofBlood:IsAvailable() and Pet:BuffStack(S.FrenzyPetBuff) < 3 and
            (S.BestialWrath:CooldownRemains() > 0 or not CDsON()))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Target:GUID()) then
        shouldcast = 217200
        return true
    elseif ((Pet:BuffUp(S.FrenzyPetBuff) and Pet:BuffRemains(S.FrenzyPetBuff) <= GCDMax + 0.25) or
        (S.ScentofBlood:IsAvailable() and Pet:BuffStack(S.FrenzyPetBuff) < 3 and
            (S.BestialWrath:CooldownRemains() > 0 or not CDsON()))) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) then
        return true
    end
end

-- if=talent.wild_instincts&buff.call_of_the_wild.up|talent.wild_call&charges_fractional>1.4|full_recharge_time<gcd&cooldown.bestial_wrath.remains|talent.scent_of_blood&(cooldown.bestial_wrath.remains<12+gcd|full_recharge_time+gcd<8&cooldown.bestial_wrath.remains<24+(8-gcd)+full_recharge_time)|fight_remains<9
local function EvaluateTargetIfBarbedShotST2(TargetUnit)
    if (((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or
        (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8) or
        (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON())) or
        (S.ScentofBlood:IsAvailable() and ((S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
            (S.BarbedShot:FullRechargeTime() + GCDMax < 8 and S.BestialWrath:CooldownRemains() < 24 + (8 - GCDMax) +
                S.BarbedShot:FullRechargeTime() and CDsON()))) or FightRemains < 9) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Unit("mouseover"):GUID()) then
        MOshouldcast = 1217200
        return true
    elseif (((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or
        (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8) or
        (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON())) or
        (S.ScentofBlood:IsAvailable() and ((S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
            (S.BarbedShot:FullRechargeTime() + GCDMax < 8 and S.BestialWrath:CooldownRemains() < 24 + (8 - GCDMax) +
                S.BarbedShot:FullRechargeTime() and CDsON()))) or FightRemains < 9) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and
        Settings.BeastMastery.TargetSwap == "AutoSwap" and TargetUnit:GUID() ~= Target:GUID() and not StopAutoSwap) then
        MOshouldcast = 999
        return true
    elseif (((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or
        (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8) or
        (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON())) or
        (S.ScentofBlood:IsAvailable() and ((S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
            (S.BarbedShot:FullRechargeTime() + GCDMax < 8 and S.BestialWrath:CooldownRemains() < 24 + (8 - GCDMax) +
                S.BarbedShot:FullRechargeTime() and CDsON()))) or FightRemains < 9) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Target:GUID()) then
        shouldcast = 217200
        return true
    elseif ((S.WildInstincts:IsAvailable() and Player:BuffUp(S.CalloftheWildBuff)) or
        (S.WildCall:IsAvailable() and S.BarbedShot:ChargesFractional() > 1.8) or
        (S.BarbedShot:FullRechargeTime() < GCDMax and (S.BestialWrath:CooldownRemains() > 0 or not CDsON())) or
        (S.ScentofBlood:IsAvailable() and ((S.BestialWrath:CooldownRemains() < 12 + GCDMax and CDsON()) or
            (S.BarbedShot:FullRechargeTime() + GCDMax < 8 and S.BestialWrath:CooldownRemains() < 24 + (8 - GCDMax) +
                S.BarbedShot:FullRechargeTime() and CDsON()))) or FightRemains < 9) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) then
        return true
    end
end

-- if=refreshable&target.time_to_die>duration
local function EvaluateTargetIfSerpentStingST(TargetUnit)
    if ((TargetUnit:DebuffRefreshable(S.SerpentStingDebuff) and Target:TimeToDie() > S.SerpentStingDebuff:BaseDuration()) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Unit("mouseover"):GUID()) then
        MOshouldcast = 1271788
        return true
    elseif ((TargetUnit:DebuffRefreshable(S.SerpentStingDebuff) and Target:TimeToDie() >
        S.SerpentStingDebuff:BaseDuration()) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and
        Settings.BeastMastery.TargetSwap == "AutoSwap" and TargetUnit:GUID() ~= Target:GUID() and not StopAutoSwap) then
        MOshouldcast = 999
        return true
    elseif ((TargetUnit:DebuffRefreshable(S.SerpentStingDebuff) and Target:TimeToDie() >
        S.SerpentStingDebuff:BaseDuration()) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) and TargetUnit:GUID() ==
        Target:GUID()) then
        shouldcast = 271788
        return true
    elseif (TargetUnit:DebuffRefreshable(S.SerpentStingDebuff) and Target:TimeToDie() >
        S.SerpentStingDebuff:BaseDuration()) and
        (TargetUnit:AffectingCombat() or TargetUnit:IsDummy() or TargetUnit:NPCID() == 153285) then
        return true
    end
end



--- ======= ACTION LISTS =======
local function PreCombat()
    -- flask
    -- augmentation
    -- food
    -- summon_pet
    -- snapshot_stats
    if Everyone.TargetIsValid() and TargetInRange40y then
        -- Barbed Shot
        if S.BarbedShot:IsCastable() and S.BarbedShot:Charges() >= 2 then
            if Cast(S.BarbedShot) then
                shouldcast = 217200
                return "Barbed Shot (PreCombat)";
            end
        end
        -- Kill Shot
        if S.KillShot:IsReady() then
            if Cast(S.KillShot) then
                shouldcast = 53351
                return "Kill Shot (PreCombat)";
            end
        end
        -- Kill Command
        if S.KillCommand:IsReady() and UnitExists("pet") and TargetInRangePet30y then
            if Cast(S.KillCommand) then
                shouldcast = 34026
                return "Kill Command (PreCombat)";
            end
        end
        if PetEnemiesMixedCount > 1 then
            -- Multi Shot
            if S.MultiShot:IsReady() then
                if Cast(S.MultiShot) then
                    shouldcast = 2643
                    return "Multi-Shot (PreCombat)";
                end
            end
        else
            -- Cobra Shot
            if S.CobraShot:IsReady() then
                if Cast(S.CobraShot) then
                    shouldcast = 193455
                    return "Cobra Shot (PreCombat)";
                end
            end
        end
    end
end

local function CDs()
    -- invoke_external_buff,name=power_infusion,if=buff.call_of_the_wild.up|!talent.call_of_the_wild&(buff.bestial_wrath.up|cooldown.bestial_wrath.remains<30)|fight_remains<16
    -- Note: Not handling external buffs.
    -- berserking,if=buff.call_of_the_wild.up|!talent.call_of_the_wild&buff.bestial_wrath.up|fight_remains<13
    if S.Berserking:IsCastable() and
        (Player:BuffUp(S.CalloftheWildBuff) or not S.CalloftheWild:IsAvailable() and Player:BuffUp(S.BestialWrathBuff) or
            FightRemains < 13) then
        if Cast(S.Berserking, nil) then
            shouldcast = 26297
            return "Berserking";
        end
    end
    -- blood_fury,if=buff.call_of_the_wild.up|!talent.call_of_the_wild&buff.bestial_wrath.up|fight_remains<16
    if CDsON() and S.BloodFury:IsCastable() and
        (Player:BuffUp(S.CalloftheWildBuff) or not S.CalloftheWild:IsAvailable() and Player:BuffUp(S.BestialWrathBuff) or
            FightRemains < 16) then
        if Cast(S.BloodFury, nil) then
            shouldcast = 20572
            return "Blood Fury";
        end
    end
    -- ancestral_call,if=buff.call_of_the_wild.up|!talent.call_of_the_wild&buff.bestial_wrath.up|fight_remains<16
    if CDsON() and S.AncestralCall:IsCastable() and
        (Player:BuffUp(S.CalloftheWildBuff) or not S.CalloftheWild:IsAvailable() and Player:BuffUp(S.BestialWrathBuff) or
            FightRemains < 16) then
        if Cast(S.AncestralCall, nil) then
            shouldcast = 274738
            return "Ancestral Call";
        end
    end
    -- fireblood,if=buff.call_of_the_wild.up|!talent.call_of_the_wild&buff.bestial_wrath.up|fight_remains<9
    if CDsON() and S.Fireblood:IsCastable() and
        (Player:BuffUp(S.CalloftheWildBuff) or not S.CalloftheWild:IsAvailable() and Player:BuffUp(S.BestialWrathBuff) or
            FightRemains < 9) then
        if Cast(S.Fireblood, nil) then
            shouldcast = 265221
            return "Fireblood";
        end
    end

    -- potion,if=buff.call_of_the_wild.up|!talent.call_of_the_wild&buff.bestial_wrath.up|fight_remains<31
    if Settings.Commons.Enabled.Potions and CDsON() and UsePots and
        (Player:BuffUp(S.CalloftheWildBuff) or not S.CalloftheWild:IsAvailable() and Player:BuffUp(S.BestialWrathBuff) or
            FightRemains < 31) and not HR.GUISettings.General.HoldPotforBL or (HR.GUISettings.General.HoldPotforBL and Player:BloodlustUp()) then
        local PotionSelected = Everyone.PotionSelected()
        if PotionSelected and PotionSelected:IsReady() then
            if Cast(PotionSelected, nil, nil) then
                shouldcast = 50
                return "potion cooldowns 2";
            end
        end
    end
end

local function Trinkets()
    -- use_items,slots=trinket1,if=buff.call_of_the_wild.up|!talent.call_of_the_wild&(buff.bestial_wrath.up&(buff.bloodlust.up|target.health.pct<20))|fight_remains<31
    local Trinket1ToUse = Player:GetUseableTrinkets(OnUseExcludes, 13)
    if Player:BuffUp(S.CalloftheWildBuff) or (not S.CalloftheWild:IsAvailable() and Player:BuffUp(S.BestialWrathBuff)) or FightRemains < 31 then
        if Trinket1ToUse then
            if Trinket1ToUse:ID() == TopTrinketID and Settings.Commons.Enabled.TopTrinket then
                if Cast(Trinket1ToUse, nil, nil) then
                    shouldcast = 24
                    return "Generic use_items for " .. Trinket1ToUse:Name();
                end
            end
        end
    end
    -- use_items,slots=trinket2,if=buff.call_of_the_wild.up|!talent.call_of_the_wild&(buff.bestial_wrath.up&(buff.bloodlust.up|target.health.pct<20))|fight_remains<31
    local Trinket2ToUse = Player:GetUseableTrinkets(OnUseExcludes, 14)
    if Player:BuffUp(S.CalloftheWildBuff) or (not S.CalloftheWild:IsAvailable() and Player:BuffUp(S.BestialWrathBuff)) or FightRemains < 31 then
        if Trinket2ToUse then
            if Trinket2ToUse:ID() == BotTrinketID and Settings.Commons.Enabled.BottomTrinket then
                if Cast(Trinket2ToUse, nil, nil) then
                    shouldcast = 30
                    return "Generic use_items for " .. Trinket2ToUse:Name();
                end
            end
        end
    end
end

local function Cleave()
    -- barbed_shot,target_if=max:debuff.latent_poison.stack,if=debuff.latent_poison.stack>9&(pet.main.buff.frenzy.up&pet.main.buff.frenzy.remains<=gcd+0.25|talent.scent_of_blood&cooldown.bestial_wrath.remains<12+gcd|pet.main.buff.frenzy.stack<3&(cooldown.bestial_wrath.ready|cooldown.call_of_the_wild.ready)|full_recharge_time<gcd&cooldown.bestial_wrath.remains)
    if S.BarbedShot:IsCastable() then
        if Everyone.CastTargetIf(S.BarbedShot, Enemies40y, "max", EvaluateTargetIfFilterLatentPoison,
                EvaluateTargetIfBarbedShotCleave, not Target:IsSpellInRange(S.BarbedShot)) then
            return "barbed_shot cleave 2";
        end
        if EvaluateTargetIfFilterLatentPoison(Target) and EvaluateTargetIfBarbedShotCleave(Target) then
            if Cast(S.BarbedShot, nil, nil, not TargetInRange40y) then
                shouldcast = 217200
                return "barbed_shot cleave 2";
            end
        end
    end
    -- barbed_shot,target_if=min:dot.barbed_shot.remains,if=pet.main.buff.frenzy.up&pet.main.buff.frenzy.remains<=gcd+0.25|talent.scent_of_blood&cooldown.bestial_wrath.remains<12+gcd|pet.main.buff.frenzy.stack<3&(cooldown.bestial_wrath.ready|cooldown.call_of_the_wild.ready)|full_recharge_time<gcd&cooldown.bestial_wrath.remains
    if S.BarbedShot:IsCastable() then
        if Everyone.CastTargetIf(S.BarbedShot, Enemies40y, "min", EvaluateTargetIfFilterBarbedShot,
                EvaluateTargetIfBarbedShotCleave2, not Target:IsSpellInRange(S.BarbedShot)) then
            return "barbed_shot cleave 4";
        end
        if EvaluateTargetIfFilterBarbedShot(Target) and EvaluateTargetIfBarbedShotCleave2(Target) then
            if Cast(S.BarbedShot, nil, nil, not TargetInRange40y) then
                shouldcast = 217200
                return "barbed_shot cleave 4";
            end
        end
    end
    -- multishot,if=pet.main.buff.beast_cleave.remains<0.25+gcd&(!talent.bloody_frenzy|cooldown.call_of_the_wild.remains)
    if S.MultiShot:IsReady() and (Pet:BuffRemains(S.BeastCleavePetBuff) < 0.25 + GCDMax and
            (not S.BloodyFrenzy:IsAvailable() or S.CalloftheWild:CooldownDown())) then
        if Cast(S.MultiShot, nil, nil, not TargetInRange40y) then
            shouldcast = 2643
            return "Multi-Shot (Cleave - 1)";
        end
    end
    -- bestial_wrath
    if S.BestialWrath:IsCastable() and CDsON() and BWReady then
        if Cast(S.BestialWrath, nil) then
            shouldcast = 19574
            return "bestial_wrath cleave 8";
        end
    end
    -- kill_command,if=full_recharge_time<gcd&talent.alpha_predator&talent.kill_cleave
    if S.KillCommand:IsReady() and
        (S.KillCommand:FullRechargeTime() < GCDMax and S.AlphaPredator:IsAvailable() and S.KillCleave:IsAvailable()) then
        if Cast(S.KillCommand) then
            shouldcast = 34026
            return "Kill Command (Cleave)";
        end
    end
    -- call_of_the_wild
    if S.CalloftheWild:IsCastable() and CDsON() and Target:IsInMeleeRange(40) then
        if Cast(S.CalloftheWild, nil) then
            shouldcast = 359844
            return "CalloftheWild (Cleave)";
        end
    end
    if S.KillCommand:IsReady() and (S.KillCleave:IsAvailable()) then
        if Cast(S.KillCommand, nil, nil, not Target:IsInRange(50)) then
            shouldcast = 34026
            return "kill_command cleave 12";
        end
    end
    -- explosive_shot
    if S.ExplosiveShot:IsReady() and Target:IsInMeleeRange(40) and SmallCDsOn then
        if Cast(S.ExplosiveShot, nil, nil, not Target:IsInRange(40)) then
            shouldcast = 212431
            return "ExplosiveShot cleave 4";
        end
    end
    -- stampede
    if S.Stampede:IsCastable() and StampReady then
        if Cast(S.Stampede, nil, nil, not TargetInRange30y) then
            shouldcast = 201430
            return "Stampede (Cleave)";
        end
    end
    -- bloodshed
    if S.Bloodshed:IsCastable() and BSReady then
        if Cast(S.Bloodshed, nil) then
            shouldcast = 321530
            return "Bloodshed (ST)";
        end
    end
    -- death_chakram
    if S.DeathChakram:IsCastable() and SmallCDsOn then
        if Cast(S.DeathChakram, nil, nil) then
            shouldcast = 325028
            return "death_chakram st";
        end
    end
    -- a_murder_of_crows
    if S.AMurderofCrows:IsReady() then
        if Cast(S.AMurderofCrows, nil, nil, not Target:IsSpellInRange(S.AMurderofCrows)) then
            shouldcast = 131894
            return "a_murder_of_crows cleave 24";
        end
    end
    -- barbed_shot,target_if=max:debuff.latent_poison.stack,if=debuff.latent_poison.stack>9&(talent.wild_instincts&buff.call_of_the_wild.up|fight_remains<9|talent.wild_call&charges_fractional>1.2)
    if S.BarbedShot:IsCastable() then
        if Everyone.CastTargetIf(S.BarbedShot, Enemies40y, "max", EvaluateTargetIfFilterLatentPoison,
                EvaluateTargetIfBarbedShotCleave3, not Target:IsSpellInRange(S.BarbedShot)) then
            shouldcast = 217200
            return "barbed_shot cleave 26";
        end
    end
    -- barbed_shot,target_if=min:dot.barbed_shot.remains,if=buff.call_of_the_wild.up|fight_remains<9|talent.wild_call&charges_fractional>1.2|talent.savagery
    if S.BarbedShot:IsCastable() then
        if Everyone.CastTargetIf(S.BarbedShot, Enemies40y, "min", EvaluateTargetIfFilterBarbedShot,
                EvaluateTargetIfBarbedShotCleave4, not Target:IsSpellInRange(S.BarbedShot)) then
            shouldcast = 217200
            return "barbed_shot cleave 28";
        end
    end
    -- kill_command
    if S.KillCommand:IsReady() then
        if Cast(S.KillCommand, nil, nil, not Target:IsSpellInRange(S.KillCommand)) then
            shouldcast = 34026
            return "kill_command cleave 30";
        end
    end
    -- dire_beast
    if S.DireBeast:IsCastable() then
        if Cast(S.DireBeast, nil, nil, not Target:IsSpellInRange(S.DireBeast)) then
            shouldcast = 120679
            return "dire_beast cleave 32";
        end
    end
    -- serpent_sting,target_if=min:remains,if=refreshable&target.time_to_die>duration
    if S.SerpentSting:IsReady() then
        if Everyone.CastTargetIf(S.SerpentSting, Enemies40y, "min", EvaluateTargetIfFilterSerpentSting,
                EvaluateTargetIfSerpentStingCleave, not Target:IsSpellInRange(S.SerpentSting)) then
            return "serpent_sting cleave 34";
        end
    end
    -- barrage,if=pet.main.buff.frenzy.remains>execute_time
    if S.Barrage:IsReady() and (Pet:BuffRemains(S.FrenzyPetBuff) > S.Barrage:ExecuteTime()) then
        if Cast(S.Barrage, nil, nil, not Target:IsSpellInRange(S.Barrage)) then
            shouldcast = 120360
            return "barrage cleave 36";
        end
    end
    -- multishot,if=pet.main.buff.beast_cleave.remains<gcd*2
    if S.MultiShot:IsReady() and (Pet:BuffRemains(S.BeastCleavePetBuff) < Player:GCD() * 2) then
        if Cast(S.MultiShot, nil, nil, not Target:IsSpellInRange(S.MultiShot)) then
            shouldcast = 2643
            return "multishot cleave 38";
        end
    end
    -- lights_judgment,if=buff.bestial_wrath.down|target.time_to_die<5
    if CDsON() and S.LightsJudgment:IsCastable() and (Player:BuffDown(S.BestialWrathBuff) or Target:TimeToDie() < 5) then
        if Cast(S.LightsJudgment, nil, nil, not Target:IsInRange(5)) then
            shouldcast = 255647
            return "lights_judgment cleave 40";
        end
    end
    -- kill_shot
    if S.KillShot:IsReady() then
        if Cast(S.KillShot, nil, nil, not Target:IsSpellInRange(S.KillShot)) then
            return "kill_shot cleave 42";
        end
    end
    -- cobra_shot,if=focus.time_to_max<gcd*2
    if S.CobraShot:IsReady() and (Player:FocusTimeToMax() < GCDMax * 2) then
        if Cast(S.CobraShot, nil, nil, not Target:IsSpellInRange(S.CobraShot)) then
            shouldcast = 193455
            return "cobra_shot cleave 42";
        end
    end
    -- wailing_arrow,if=pet.main.buff.frenzy.remains>execute_time|fight_remains<5
    if S.WailingArrow:IsReady() and
        (Pet:BuffRemains(S.FrenzyPetBuff) > S.WailingArrow:ExecuteTime() or FightRemains < 5) then
        if Cast(S.WailingArrow, nil, nil, not Target:IsSpellInRange(S.WailingArrow)) then
            shouldcast = 392060
            return "wailing_arrow cleave 44";
        end
    end
    -- bag_of_tricks,if=buff.bestial_wrath.down|target.time_to_die<5
    if S.BagofTricks:IsCastable() and CDsON() and (Player:BuffDown(S.BestialWrathBuff) or FightRemains < 5) then
        if Cast(S.BagofTricks, nil) then
            shouldcast = 312411
            return "bag_of_tricks cleave 46";
        end
    end
    -- arcane_torrent,if=(focus+focus.regen+30)<focus.max
    if S.ArcaneTorrent:IsCastable() and CDsON() and ((Player:Focus() + Player:FocusRegen() + 30) < Player:FocusMax()) then
        if Cast(S.ArcaneTorrent, nil) then
            shouldcast = 155145
            return "arcane_torrent cleave 48";
        end
    end
end

local function ST()
    -- barbed_shot,target_if=min:dot.barbed_shot.remains,if=pet.main.buff.frenzy.up&pet.main.buff.frenzy.remains<=gcd+0.25|talent.scent_of_blood&pet.main.buff.frenzy.stack<3&(cooldown.bestial_wrath.ready|cooldown.call_of_the_wild.ready)
    if S.BarbedShot:IsCastable() then
        if Everyone.CastTargetIf(S.BarbedShot, Enemies40y, "min", EvaluateTargetIfFilterBarbedShot,
                EvaluateTargetIfBarbedShotST, not Target:IsSpellInRange(S.BarbedShot)) then
            return "barbed_shot st 2";
        end
        if EvaluateTargetIfFilterBarbedShot(Target) and EvaluateTargetIfBarbedShotST(Target) then
            if Cast(S.BarbedShot, nil, nil, not TargetInRange40y) then
                shouldcast = 217200
                return "barbed_shot st 2";
            end
        end
    end

    -- Main Target backup
    if S.BarbedShot:IsCastable() and EvaluateTargetIfBarbedShotST(Target) then
        if Cast(S.BarbedShot, nil, nil, not Target:IsSpellInRange(S.BarbedShot)) then
            shouldcast = 217200
            return "barbed_shot st mt_backup 3";
        end
    end
    -- call_of_the_wild
    if S.CalloftheWild:IsCastable() and CDsON() then
        if Cast(S.CalloftheWild, nil) then
            shouldcast = 359844
            return "call_of_the_wild st 4";
        end
    end
    -- kill_command,if=full_recharge_time<gcd&talent.alpha_predator
    if S.KillCommand:IsReady() and (S.KillCommand:FullRechargeTime() < GCDMax and S.AlphaPredator:IsAvailable()) then
        if Cast(S.KillCommand) then
            shouldcast = 34026
            return "Kill Command (ST)";
        end
    end
    -- bestial_wrath
    if S.BestialWrath:IsCastable() and CDsON() and BWReady then
        if Cast(S.BestialWrath, nil) then
            shouldcast = 19574
            return "bestial_wrath st 8";
        end
    end
    -- bloodshed
    if S.Bloodshed:IsCastable() and BSReady then
        if Cast(S.Bloodshed, nil) then
            shouldcast = 321530
            return "Bloodshed (ST)";
        end
    end
    -- death_chakram
    if SmallCDsOn and S.DeathChakram:IsCastable() then
        if Cast(S.DeathChakram, nil, nil, not Target:IsSpellInRange(S.DeathChakram)) then
            shouldcast = 325028
            return "death_chakram st 12";
        end
    end
    -- kill_command
    if S.KillCommand:IsReady() then
        if Cast(S.KillCommand, nil, nil, not Target:IsSpellInRange(S.KillCommand)) then
            shouldcast = 34026
            return "kill_command st 14";
        end
    end
    -- a_murder_of_crows
    if S.AMurderofCrows:IsCastable() then
        if Cast(S.AMurderofCrows, nil, nil, not TargetInRange40y) then
            shouldcast = 131894
            return "A Murder of Crows (ST)";
        end
    end
    -- explosive_shot
    if S.ExplosiveShot:IsReady() and Target:IsInMeleeRange(40) and SmallCDsOn then
        if Cast(S.ExplosiveShot, nil, nil, not Target:IsInRange(40)) then
            shouldcast = 212431
            return "ExplosiveShot cleave 4";
        end
    end
    -- kill_command
    if S.KillCommand:IsReady() and UnitExists("pet") and TargetInRangePet30y then
        if Cast(S.KillCommand) then
            shouldcast = 34026
            return "Kill Command (ST)";
        end
    end
    -- barbed_shot,target_if=min:dot.barbed_shot.remains,if=talent.wild_instincts&buff.call_of_the_wild.up|talent.wild_call&charges_fractional>1.4|full_recharge_time<gcd&cooldown.bestial_wrath.remains|talent.scent_of_blood&(cooldown.bestial_wrath.remains<12+gcd|full_recharge_time+gcd<8&cooldown.bestial_wrath.remains<24+(8-gcd)+full_recharge_time)|fight_remains<9
    if S.BarbedShot:IsCastable() then
        if Everyone.CastTargetIf(S.BarbedShot, Enemies40y, "min", EvaluateTargetIfFilterBarbedShot,
                EvaluateTargetIfBarbedShotST2, not Target:IsSpellInRange(S.BarbedShot)) then
            return "barbed_shot st 24";
        end
        if EvaluateTargetIfFilterBarbedShot(Target) and EvaluateTargetIfBarbedShotST2(Target) then
            if Cast(S.BarbedShot, nil, nil, not TargetInRange40y) then
                shouldcast = 217200
                return "barbed_shot st 24";
            end
        end
    end
    -- Main Target backup
    if S.BarbedShot:IsCastable() and EvaluateTargetIfBarbedShotST2(Target) then
        if Cast(S.BarbedShot, nil, nil, not Target:IsSpellInRange(S.BarbedShot)) then
            return "barbed_shot st mt_backup 24";
        end
    end
    -- Main Target backup
    if S.BarbedShot:IsCastable() and EvaluateTargetIfBarbedShotST2(Target) then
        if Cast(S.BarbedShot, nil, nil, not Target:IsSpellInRange(S.BarbedShot)) then
            shouldcast = 217200
            return "barbed_shot st mt_backup 24";
        end
    end
    -- dire_beast
    if S.DireBeast:IsCastable() then
        if Cast(S.DireBeast, nil, nil, not TargetInRange40y) then
            shouldcast = 120679
            return "Dire Beast (ST)";
        end
    end
    -- serpent_sting,target_if=min:remains,if=refreshable&target.time_to_die>duration
    if S.SerpentSting:IsReady() then
        if Everyone.CastTargetIf(S.SerpentSting, Enemies40y, "min", EvaluateTargetIfFilterSerpentSting,
                EvaluateTargetIfSerpentStingST, not Target:IsSpellInRange(S.SerpentSting)) then
            return "serpent_sting st 28";
        end
    end
    -- kill_shot
    if S.KillShot:IsReady() then
        if Cast(S.KillShot, nil, nil, not TargetInRange40y) then
            shouldcast = 53351
            return "Kill Shot (ST)";
        end
    end
    -- aspect_of_the_wild
    if S.AspectoftheWild:IsCastable() and AotWReady and UnitExists("pet") and Target:IsInMeleeRange(40) then
        if Cast(S.AspectoftheWild, nil) then
            shouldcast = 193530
            return "Aspect of the Wild (Cleave)";
        end
    end
    -- cobra_shot
    if S.CobraShot:IsReady() then
        if Cast(S.CobraShot, nil, nil, not TargetInRange40y) then
            shouldcast = 193455
            return "Cobra Shot (ST)";
        end
    end
    -- wailing_arrow,if=pet.main.buff.frenzy.remains>execute_time|target.time_to_die<5
    if S.WailingArrow:IsReady() and SmallCDsOn and not HoldWeapon and not Player:IsMoving() and
        Target:IsInMeleeRange(40) and
        (Pet:BuffRemains(S.FrenzyPetBuff) > S.WailingArrow:ExecuteTime() or FightRemains < 5) then
        if Cast(S.WailingArrow, nil, nil, not TargetInRange40y) then
            shouldcast = 355589
            return "Wailing Arrow (ST)";
        end
    end
    if CDsON() then
        -- bag_of_tricks,if=buff.bestial_wrath.down|target.time_to_die<5
        if S.BagofTricks:IsCastable() and CDsON() and (Player:BuffDown(S.BestialWrathBuff) or FightRemains < 5) then
            if Cast(S.BagofTricks, nil, nil, not TargetInRange40y) then
                shouldcast = 312411
                return "Bag of Tricks (ST)";
            end
        end
        -- arcane_torrent,if=(focus+focus.regen+15)<focus.max
        if S.ArcaneTorrent:IsCastable() and CDsON() and
            ((Player:Focus() + Player:FocusRegen() + 15) < Player:FocusMax()) then
            if Cast(S.ArcaneTorrent, nil, nil, not Target:IsInRange(8)) then
                shouldcast = 155145
                return "arcane_torrent st 50";
            end
        end
    end
end

local function Resets()
    -- toggles
    Opener = HeroRotationCharDB.Toggles[5]
    SmallCDsOn = HeroRotationCharDB.Toggles[4]
    StopAutoSwap = HeroRotationCharDB.Toggles[12]
    UsePots = not HeroRotationCharDB.Toggles[15]
    QBindingshot = HeroRotationCharDB.Toggles[120]
    QFreezingTrap = HeroRotationCharDB.Toggles[121]
    QIntimidation = HeroRotationCharDB.Toggles[122]
    QFlare = HeroRotationCharDB.Toggles[123]
    QTarTrap = HeroRotationCharDB.Toggles[124]
    HoldMD = HeroRotationCharDB.Toggles[125]
    HoldTranq = HeroRotationCharDB.Toggles[142]
    HoldWeapon = HeroRotationCharDB.Toggles[17]
    QWailingArrow = HeroRotationCharDB.Toggles[170];

    AotWReady = false
    StampReady = false
    BWReady = false
    BSReady = false

    if ((Settings.BeastMastery.AspectoftheWild == "CDs" and CDsON()) or
            (Settings.BeastMastery.AspectoftheWild == "Small CDs" and (CDsON() or SmallCDsOn)) or
            (Settings.BeastMastery.AspectoftheWild == "Always")) then
        AotWReady = true
    end
    if ((Settings.BeastMastery.Stampede == "CDs" and CDsON()) or
            (Settings.BeastMastery.Stampede == "Small CDs" and (CDsON() or SmallCDsOn)) or
            (Settings.BeastMastery.Stampede == "Always")) then
        StampReady = true
    end

    if ((Settings.BeastMastery.BestialWrathCD == "CDs" and CDsON()) or
            (Settings.BeastMastery.BestialWrathCD == "Small CDs" and (CDsON() or SmallCDsOn)) or
            (Settings.BeastMastery.BestialWrathCD == "Always")) then
        BWReady = true
    end
    if ((Settings.BeastMastery.Bloodshed == "CDs" and CDsON()) or
            (Settings.BeastMastery.Bloodshed == "Small CDs" and (CDsON() or SmallCDsOn)) or
            (Settings.BeastMastery.Bloodshed == "Always")) then
        BSReady = true
    end

    TopTrinketID = GetInventoryItemID("player", 13)
    BotTrinketID = GetInventoryItemID("player", 14)
    -- if not Settings.Commons.Enabled.TopTrinket and not Settings.Commons.Enabled.BotTrinket then
    -- OnUseExcludes = {--  I.TrinketName:ID(),
    -- TopTrinketID,
    -- BotTrinketID
    -- }
    -- elseif not Settings.Commons.Enabled.TopTrinket and Settings.Commons.Enabled.BotTrinket then
    -- OnUseExcludes = {--  I.TrinketName:ID(),
    -- TopTrinketID
    -- }
    -- elseif not Settings.Commons.Enabled.BotTrinket and Settings.Commons.Enabled.TopTrinket then
    -- OnUseExcludes = {--  I.TrinketName:ID(),
    -- BotTrinketID
    -- }
    -- elseif not Settings.Commons.Enabled.BotTrinket and not Settings.Commons.Enabled.TopTrinket then
    -- OnUseExcludes = {--  I.TrinketName:ID(),

    -- }
    -- end
end
--- ======= MAIN =======
local function APL()
    -- HeroLib SplashData Tracking Update (used as fallback if pet abilities are not in action bars)
    if S.Stomp:IsAvailable() then
        HL.SplashEnemies.ChangeFriendTargetsTracking("Mine Only")
    else
        HL.SplashEnemies.ChangeFriendTargetsTracking("All")
    end

    local TopTrinketID, _ = GetInventoryItemID("player", 13)
    local BotTrinketID, _ = GetInventoryItemID("player", 14)

    -- Enemies Update
    local PetCleaveAbility = (S.BloodBolt:IsPetKnown() and Action.FindBySpellID(S.BloodBolt:ID()) and S.BloodBolt)or 
        (S.Bite:IsPetKnown() and Action.FindBySpellID(S.Bite:ID()) and S.Bite)or 
        (S.Claw:IsPetKnown() and Action.FindBySpellID(S.Claw:ID()) and S.Claw)or 
        (S.Smack:IsPetKnown() and Action.FindBySpellID(S.Smack:ID()) and S.Smack)
    or nil
    local PetRangeAbility = (S.Growl:IsPetKnown() and Action.FindBySpellID(S.Growl:ID()) and S.Growl) or nil
    if AoEON() then
        Enemies40y = Player:GetEnemiesInRange(40) -- Barbed Shot Cycle
        PetEnemiesMixed = (PetCleaveAbility and Player:GetEnemiesInSpellActionRange(PetCleaveAbility)) or Target:GetEnemiesInSplashRange(8)
        PetEnemiesMixedCount = (PetCleaveAbility and #PetEnemiesMixed) or Target:GetEnemiesInSplashRangeCount(8) -- Beast Cleave (through Multi-Shot)
    else
        Enemies40y = {}
        PetEnemiesMixed = Target or {}
        PetEnemiesMixedCount = 0
    end
    TargetInRange40y = Target:IsInRange(40) -- Most abilities
    TargetInRange30y = Target:IsInRange(30) -- Stampede
    TargetInRangePet30y = (PetRangeAbility and Target:IsSpellInActionRange(PetRangeAbility)) or Target:IsInRange(30) -- Kill Command

    -- Update GCDMax
    GCDMax = Player:GCD() + 0.150

    -- Calculate FightRemains
    if Everyone.TargetIsValid() or Player:AffectingCombat() then
        -- Calculate fight_remains
        BossFightRemains = HL.BossFightRemains()
        FightRemains = BossFightRemains
        if FightRemains == 11111 then
            FightRemains = HL.FightRemains(Enemies40y, false)
        end
    end

    if MOshouldcast > 0 then
        MOshouldcast = 0
    end

    if shouldcast > 0 then
        shouldcast = 0
    end                                                                               -- Kill Command
    Resets()
    -- Defensives
    if S.Exhilaration:IsCastable() and Player:HealthPercentage() <= Settings.Commons.ExhilarationHP then
        if Cast(S.Exhilaration, nil) then
            shouldcast = 109304
            return "Exhilaration";
        end
    end
    if Player:HealthPercentage() < Settings.Commons.HealthstoneHP and I.Healthstone:IsReady() and
        I.Healthstone:CooldownRemains() <= 0 then
        if HR.Cast(I.Healthstone, nil) then
            shouldcast = 40
            return "Healthstone HP";
        end
    end
    if Player:HealthPercentage() < Settings.Commons.HealPotHP and I.CosmicHealPot:IsReady() and
        I.CosmicHealPot:CooldownRemains() <= 0 then
        if HR.Cast(I.CosmicHealPot, nil) then
            shouldcast = 45
            return "CosmicHealPot HP";
        end
    end
    if Player:HealthPercentage() < Settings.Commons.HealPotHP and I.HealPot:IsReady() and I.HealPot:CooldownRemains() <=
        0 then
        if HR.Cast(I.HealPot, nil) then
            shouldcast = 41
            return "HealPot HP";
        end
    end
    if S.AspectoftheTurtle:IsCastable() and Player:HealthPercentage() <= Settings.Commons.TurtleHP then
        if Cast(S.AspectoftheTurtle, nil) then
            shouldcast = 186265
            return "AspectoftheTurtle";
        end
    end

    if Player:BuffUp(Spell(5384)) then
        return false
    end

    -- Explosives
    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
        if S.CobraShot:IsCastable() and TargetInRange40y then
            if Cast(S.CobraShot, nil) then
                MOshouldcast = 1193455
                return "explosive MO SWD";
            end
        end
    end
    if UnitExists("target") and string.find(UnitGUID("target"), 120651) then
        if S.CobraShot:IsCastable() and TargetInRange40y then
            if Cast(S.CobraShot, nil) then
                shouldcast = 193455
                return "explosive  SWD";
            end
        end
    end

    WhiteList = { 333875, 344739, 228318, 332158, 321764, 324914, 326046, 324776, 340544, 324736, 328015, 322433, 334324,
        317936, 327332, 328288, 195181, 333293, 320272, 342139, 355888, 349933, 356549, 355934, 353706, 347775,
        357284, 335141, 327155, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085,
        333241, 344739, 368477, 368396, 355057, 356133, 158337, 164426, 382555, 412695, 265368, 8599, 428291 }
    -- enrages
    if UnitExists("target") and S.TranqualizingShot:IsCastable() and not HoldTranq then
        if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true and
            S.TranqualizingShot:IsCastable() and S.TranqualizingShot:CooldownRemains(BypassRecovery) <= 0 then
            for i = 0, 40 do
                local _, _, stacks, type, _, _, _, _, _, id = UnitBuff("target", i);
                for _, j in pairs(WhiteList) do
                    if j == id then
                        if HR.Cast(S.TranqualizingShot, nil) then
                            shouldcast = 19801
                            return "Tranq Enrage";
                        end
                    end
                end
            end
        end
    end

    -- Resets
    if HR.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
        starttime = GetTime()
        endtime = starttime + (HR.GUISettings.General.OpenerReset)
    elseif HR.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and
        HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6];
        HR.ToggleIconFrame:UpdateButtonText(6);
        HR.Print("Opener is now " ..
            (HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."));
    end

    if HR.QueuedCast() then
        shouldcast = HR.QueuedCast()
        return "Custom Queue " .. Spell(shouldcast):ID()
    end
    -- Queues
    if (QBindingshot and S.Bindingshot:IsAvailable() and S.Bindingshot:CooldownRemains(BypassRecovery) <= 0) then
        if HR.Cast(S.Bindingshot, nil, nil, nil) then
            shouldcast = 109248
            return "queue Binding Shot";
        end
    elseif ((not S.Bindingshot:IsUsableP() or S.Bindingshot:CooldownRemains() > 0) and QBindingshot) then
        HeroRotationCharDB.Toggles[120] = not HeroRotationCharDB.Toggles[120];
        HR.Print("Binding Shot Queue is now " ..
            (HeroRotationCharDB.Toggles[120] and "|cff00ff00on|r." or "|cffff0000off|r."));
    end

    if (QFreezingTrap and S.FreezingTrap:IsAvailable() and S.FreezingTrap:CooldownRemains(BypassRecovery) <= 0) then
        if HR.Cast(S.FreezingTrap, nil, nil, nil) then
            shouldcast = 187650
            return "queue Freezing Trap";
        end
    elseif ((not S.FreezingTrap:IsUsableP() or S.FreezingTrap:CooldownRemains() > 0) and QFreezingTrap) then
        HeroRotationCharDB.Toggles[121] = not HeroRotationCharDB.Toggles[121];
        HR.Print("Freezing Trap Queue is now " ..
            (HeroRotationCharDB.Toggles[121] and "|cff00ff00on|r." or "|cffff0000off|r."));
    end

    if (QIntimidation and S.Intimidation:IsAvailable() and S.Intimidation:CooldownRemains(BypassRecovery) <= 0) then
        if HR.Cast(S.Intimidation, nil, nil, nil) then
            shouldcast = 19577
            return "queue Intimidation";
        end
    elseif ((not S.Intimidation:IsUsableP() or S.Intimidation:CooldownRemains() > 0) and QIntimidation) then
        HeroRotationCharDB.Toggles[122] = not HeroRotationCharDB.Toggles[122];
        HR.Print("Intimidation Queue is now " ..
            (HeroRotationCharDB.Toggles[122] and "|cff00ff00on|r." or "|cffff0000off|r."));
    end

    if (QFlare and S.Flare:IsAvailable() and S.Flare:CooldownRemains(BypassRecovery) <= 0) then
        if HR.Cast(S.Flare, nil, nil, nil) then
            shouldcast = 1543
            return "queue Flare";
        end
    elseif ((not S.Flare:IsUsableP() or S.Flare:CooldownRemains() > 0) and QFlare) then
        HeroRotationCharDB.Toggles[123] = not HeroRotationCharDB.Toggles[123];
        HR.Print("Flare Queue is now " .. (HeroRotationCharDB.Toggles[123] and "|cff00ff00on|r." or "|cffff0000off|r."));
    end

    if (QTarTrap and S.TarTrap:IsAvailable() and S.TarTrap:CooldownRemains(BypassRecovery) <= 0) then
        if HR.Cast(S.TarTrap, nil, nil, nil) then
            shouldcast = 187698
            return "queue TarTrap";
        end
    elseif ((not S.TarTrap:IsUsableP() or S.TarTrap:CooldownRemains() > 0) and QTarTrap) then
        HeroRotationCharDB.Toggles[124] = not HeroRotationCharDB.Toggles[124];
        HR.Print("Tar Trap Queue is now " ..
            (HeroRotationCharDB.Toggles[124] and "|cff00ff00on|r." or "|cffff0000off|r."));
    end
    if (QWailingArrow and S.WailingArrow:IsAvailable() and S.WailingArrow:CooldownRemains(BypassRecovery) <= 0) then
        if HR.Cast(S.WailingArrow, nil, nil, nil) then
            shouldcast = 392060
            return "queue WailingArrow";
        end
    elseif ((not S.WailingArrow:IsUsableP() or S.WailingArrow:CooldownRemains() > 0) and QWailingArrow) then
        HeroRotationCharDB.Toggles[170] = not HeroRotationCharDB.Toggles[170];
        HR.Print("WailingArrow Queue is now " ..
            (HeroRotationCharDB.Toggles[170] and "|cff00ff00on|r." or "|cffff0000off|r."));
    end

    -- test

    if Player:BuffUp(Spell(5384)) then
        return false
    end

    -- Pet Management
    if Player:IsCasting(S.RevivePet) then
        if Cast(S.PoolFocus) then
            shouldcast = 999999
            return "Pooling Focus";
        end
    end

    if (Pet:IsActive() and select(2, GetStablePetInfo(Settings.Commons.SummonPetSlot)) ~= select(1, UnitName("pet"))) and
        Settings.Commons.SummonPetSlot ~= 0 and not Player:IsMoving() and not Player:PrevGCD(1, S.DismissPet) and
        not Player:IsCasting(S.DismissPet) then
        if Cast(S.DismissPet, nil) then
            shouldcast = 2641
            return "Dismiss Pet";
        end
    end

    if S.SummonPet:IsCastable() and (not Pet:IsActive()) and Settings.Commons.SummonPetSlot ~= 0 then
        if Settings.Commons.SummonPetSlot == 1 and
            not Player:PrevGCD(1, SummonPetSpells[Settings.Commons.SummonPetSlot]) then
            if Cast(SummonPetSpells[Settings.Commons.SummonPetSlot], nil) then
                shouldcast = 883
                return "Summon Pet";
            end
        elseif Settings.Commons.SummonPetSlot == 2 and
            not Player:PrevGCD(1, SummonPetSpells[Settings.Commons.SummonPetSlot]) then
            if Cast(SummonPetSpells[Settings.Commons.SummonPetSlot], nil) then
                shouldcast = 83242
                return "Summon Pet";
            end
        elseif Settings.Commons.SummonPetSlot == 3 and
            not Player:PrevGCD(1, SummonPetSpells[Settings.Commons.SummonPetSlot]) then
            if Cast(SummonPetSpells[Settings.Commons.SummonPetSlot], nil) then
                shouldcast = 83243
                return "Summon Pet";
            end
        elseif Settings.Commons.SummonPetSlot == 4 and
            not Player:PrevGCD(1, SummonPetSpells[Settings.Commons.SummonPetSlot]) then
            if Cast(SummonPetSpells[Settings.Commons.SummonPetSlot], nil) then
                shouldcast = 83244
                return "Summon Pet";
            end
        elseif Settings.Commons.SummonPetSlot == 5 and
            not Player:PrevGCD(1, SummonPetSpells[Settings.Commons.SummonPetSlot]) then
            if Cast(SummonPetSpells[Settings.Commons.SummonPetSlot], nil) then
                shouldcast = 83245
                return "Summon Pet";
            end
        end
    end

    if (Pet:IsDeadOrGhost() or not UnitExists("pet")) and S.RevivePet:IsCastable() and not Player:IsMoving() and
        Settings.Commons.SummonPetSlot ~= 0 then
        if Cast(S.RevivePet, nil) then
            shouldcast = 982
            return "Revive Pet";
        end
    end

    local start1, duration1, _ = GetSpellCooldown(34477)
    if Player:AffectingCombat() and Settings.Commons.AutoMisdirect and not HoldMD then
        if (start1 + duration1 - GetTime()) <= 0 and S.Misdirection:IsAvailable() and
            S.Misdirection:CooldownRemains(BypassRecovery) <= 0 and UnitExists("focus") and
            (UnitInParty("focus") or UnitInRaid("focus") or UnitIsUnit("focus", "pet")) and
            IsItemInRange(32698, "focus") then
            if HR.Cast(S.Misdirection) then
                MOshouldcast = 134477
                return "MD Focus"
            end
        end
    end

    if not Pet:IsDeadOrGhost() and UnitExists("pet") and S.MendPet:IsCastable() and Pet:HealthPercentage() <=
        Settings.Commons.MendPetHighHP and not Player:PrevGCD(1, S.MendPet) then
        if Cast(S.MendPet) then
            shouldcast = 1982
            return "Mend Pet High Priority";
        end
    end

    -- Out of Combat
    if not Player:AffectingCombat() and ((Opener) or (Settings.BeastMastery.DBMSupport and
            ((S.BestialWrath:IsCastable() and BWReady and HR.BossMods:GetPullTimer() < GCDMax and HR.BossMods:GetPullTimer() >
                0) or HR.BossMods:GetPullTimer() < 0.5 and HR.BossMods:GetPullTimer() > 0))) and Everyone.TargetIsValid() then
        ShouldReturn = PreCombat();
        if ShouldReturn then
            return ShouldReturn;
        end
    end

    -- In Combat
    if Everyone.TargetIsValid() and (Player:AffectingCombat() or Opener) then
        -- HuntersMark logic
        -- if Spell(257284):IsCastable() and Spell(339264):ConduitEnabled() and Target:DebuffDown(Spell(257284)) and (HMUp(Enemies40y) <= 0 or UnitName("target")=="Fleeting Manifestation")
        -- and (UnitName("target")=="Nalthor the Rimebinder" or UnitName("target")=="Tirnenn Villager" or UnitName("target")=="Drust Boughbreaker" or UnitName("target")=="Ingra Maloch"
        -- or UnitName("target")=="Mistveil Stalker" or UnitName("target")=="Mistcaller" or UnitName("target")=="Blightbone" or UnitName("target")=="Rotspew" or UnitName("target")=="Amarth" or UnitName("target")=="Surgeon Stitchflesh"
        -- or UnitName("target")=="Lubricator" or UnitName("target")=="Tred'ova" or UnitName("target")=="Azules" or UnitName("target")=="Ventunax" or UnitName("target")=="Oryphion" or UnitName("target")=="Astronos"
        -- or UnitName("target")=="Lakesis" or UnitName("target")=="Klotos" or UnitName("target")=="Devos" or UnitName("target")=="Halkias" or UnitName("target")=="High Adjudicator Aleez" or UnitName("target")=="Wo Drifter"
        -- or UnitName("target")=="Lord Chamberlain" or UnitName("target")=="Enraged Spirit" or UnitName("target")=="Hakkar The Soulflayer" or UnitName("target")=="Sentient Oil" or UnitName("target")=="Millhouse Manastorm"
        -- or UnitName("target")=="Millificent Manastorm" or UnitName("target")=="Dealer Xy’exa" or UnitName("target")=="Mueh'zala" or UnitName("target")=="Fungi Stormer" or UnitName("target")=="Globgrog"
        -- or UnitName("target")=="Slime Tentacle" or UnitName("target")=="Virulax Blightweaver" or UnitName("target")=="Doctor Ickus" or UnitName("target")=="Domina Venomblade" or UnitName("target")=="Margrave Stradama"
        -- or UnitName("target")=="Dreadful Huntmaster" or UnitName("target")=="Insatiable Brute" or UnitName("target")=="Kryxis the Voracious" or UnitName("target")=="Grand Overseer" or UnitName("target")=="Research Scribe"
        -- or UnitName("target")=="Executor Tarvold" or UnitName("target")=="Grand Proctor Beryllia" or UnitName("target")=="General Kaal" or UnitName("target")=="Paceran the Virulent" or UnitName("target")=="Shard of Halkias"
        -- or UnitName("target")=="Shambling Arbalest" or UnitName("target")=="Nekthara the Mangler" or UnitName("target")=="Harugia the Bloodthirtsy" or UnitName("target")=="Heavin the Breaker" or UnitName("target")=="Echelon"
        -- or UnitName("target")=="Advent Nevermore" or UnitName("target")=="Xav the Unfallen" or UnitName("target")=="Portal Guardian" or UnitName("target")=="Kul'Tharok" or UnitName("target")=="Gorechop"
        -- or UnitName("target")=="Mordretha, the Endless Empress" or UnitName("target")=="Gatewarden Zo'mazz" or UnitName("target")=="Zophex" or UnitName("target")=="Alcruux" or UnitName("target")=="Achillite"
        -- or UnitName("target")=="Venza Goldfuse" or UnitName("target")=="Zo'gron" or UnitName("target")=="P.O.S.T Master" or UnitName("target")=="So'azmi" or UnitName("target")=="Portalmancer Zo'dahh"
        -- or UnitName("target")=="4.RF-4.RF" or UnitName("target")=="Inquisitor Sigar" or UnitName("target")=="Fleeting Manifestation" or UnitName("target")=="Corpse Harvester" or UnitName("target")=="Zolramus Necromancer"
        -- or UnitName("target")=="Nar'zudah" or UnitName("target")=="Raging Bloodhorn" or UnitName("target")=="Harugia the Bloodthirsty" or UnitName("target")=="Portalmancer Zo'honn" or UnitName("target")=="Enraged Direhorn"
        -- or UnitName("target")=="Coastwalker Goliath" or UnitName("target")=="Adorned Starseer" or UnitName("target")=="Wandering Pulsar"
        -- or (IsInRaid() and UnitName("target") == UnitName("boss1"))) then
        -- if Cast(S.HuntersMark, nil) then shouldcast = 257284 return "HuntersMark M+"; end
        -- end

        -- Interrupts
        -- ShouldReturn = Everyone.Interrupt(40, S.CounterShot, nil, Interrupts);
        -- if ShouldReturn then shouldcast = 147362 return ShouldReturn; end

        if (not Target:AffectingCombat() and not Target:IsDummy() and not Target:NPCID() == 153285) and
            PetEnemiesMixedyCount >= 1 then
            shouldcast = 999
        end

        if (not Target:AffectingCombat() and not Target:IsDummy() and not Target:NPCID() == 153285) then
            if Cast(S.PoolFocus) then
                shouldcast = 999999
                return "Pooling Focus";
            end
        end

        -- call_action_list,name=cds
        if true then
            ShouldReturn = CDs();
            if ShouldReturn then
                return ShouldReturn;
            end
        end
        -- Manually added: call_action_list,name=trinkets
        if ((Settings.Commons.Enabled.TopTrinket or Settings.Commons.Enabled.BottomTrinket) and CDsON()) then
            local ShouldReturn = Trinkets();
            if ShouldReturn then
                return ShouldReturn;
            end
        end

        -- call_action_list,name=st,if=active_enemies<2|!talent.beast_cleave&active_enemies<3
        if PetEnemiesMixedCount < 2 or not S.BeastCleave:IsAvailable() and PetEnemiesMixedCount < 3 then
            local ShouldReturn = ST();
            if ShouldReturn then
                return ShouldReturn;
            end
        end
        -- call_action_list,name=cleave,if=active_enemies>2|talent.beast_cleave&active_enemies>1
        if PetEnemiesMixedCount > 2 or S.BeastCleave:IsAvailable() and PetEnemiesMixedCount > 1 then
            local ShouldReturn = Cleave();
            if ShouldReturn then
                return ShouldReturn;
            end
        end

        if not Pet:IsDeadOrGhost() and UnitExists("pet") and S.MendPet:IsCastable() and Pet:HealthPercentage() <=
            Settings.Commons.MendPetLowHP then
            if Cast(S.MendPet) then
                shouldcast = 1982
                return "Mend Pet Low Priority (w/ Target)";
            end
        end

        --[[         -- Custom Wailing outside WildSpirits
        if SmallCDsOn and not HoldWeapon and not Player:IsMoving() and Target:IsInMeleeRange(40) and
            (S.WailingArrow:IsReady() and Pet:BuffRemains(S.FrenzyPetBuff) > S.WailingArrow:ExecuteTime() and
                (Player:Covenant() == "Night Fae" and Player:BuffUp(S.WildSpiritsBuff))) then
            if Cast(S.WailingArrow, nil, nil, not TargetInRange40y) then
                shouldcast = 355589
                return "Wailing Arrow (ST)1";
            end
        end ]]

        if Cast(S.PoolFocus) then
            shouldcast = 999999
            return "Pooling Focus";
        end
    end

    -- Note: We have to put it again in case we don't have a target but our pet is dying.
    if not Pet:IsDeadOrGhost() and UnitExists("pet") and S.MendPet:IsCastable() and Pet:HealthPercentage() <=
        Settings.Commons.MendPetLowHP then
        if Cast(S.MendPet) then
            shouldcast = 1982
            return "Mend Pet Low Priority (w/o Target)";
        end
    end
end

local function OnInit()
    HL.Print(
        "BeastMastery can use pet abilities to better determine AoE, makes sure you have Growl and Blood Bolt / Bite / Claw / Smack in your player action bars.")
    if HeroRotationCharDB.Toggles[6] then
        HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6];
        HR.ToggleIconFrame:UpdateButtonText(6);
    end
end

function ReturnSpell1()
    if shouldcast == 0 then
        return 0
    else
        return shouldcast
    end
end

function ReturnSpellMO1()
    if MOshouldcast == 0 then
        return 0
    else
        return MOshouldcast
    end
end

HR.SetAPL(253, APL, OnInit)

--- ======= SIMC =======
-- Last Update: 11/29/2020

-- # Executed before combat begins. Accepts non-harmful actions only.
-- actions.precombat=flask
-- actions.precombat+=/augmentation
-- actions.precombat+=/food
-- actions.precombat+=/summon_pet
-- # Snapshot raid buffed stats before combat begins and pre-potting is done.
-- actions.precombat+=/snapshot_stats
-- actions.precombat+=/tar_trap,precast_time=1.5,if=runeforge.soulforge_embers|runeforge.nessingwarys_trapping_apparatus
-- actions.precombat+=/bestial_wrath,precast_time=1.5,if=!talent.scent_of_blood&!runeforge.soulforge_embers

-- # Executed every time the actor is available.
-- actions=auto_shot
-- actions+=/counter_shot,line_cd=30,if=runeforge.sephuzs_proclamation|soulbind.niyas_tools_poison|(conduit.reversal_of_fortune&!runeforge.sephuzs_proclamation)
-- actions+=/use_items
-- actions+=/call_action_list,name=cds
-- actions+=/call_action_list,name=st,if=active_enemies<2
-- actions+=/call_action_list,name=cleave,if=active_enemies>1

-- actions.cds=ancestral_call,if=cooldown.bestial_wrath.remains>30
-- actions.cds+=/fireblood,if=cooldown.bestial_wrath.remains>30
-- actions.cds+=/berserking,if=(buff.wild_spirits.up|!covenant.night_fae&buff.aspect_of_the_wild.up&buff.bestial_wrath.up)&(target.time_to_die>cooldown.berserking.duration+duration|(target.health.pct<35|!talent.killer_instinct))|target.time_to_die<13
-- actions.cds+=/blood_fury,if=(buff.wild_spirits.up|!covenant.night_fae&buff.aspect_of_the_wild.up&buff.bestial_wrath.up)&(target.time_to_die>cooldown.blood_fury.duration+duration|(target.health.pct<35|!talent.killer_instinct))|target.time_to_die<16
-- actions.cds+=/lights_judgment
-- actions.cds+=/potion,if=buff.aspect_of_the_wild.up|target.time_to_die<26

-- actions.cleave=aspect_of_the_wild
-- actions.cleave+=/barbed_shot,target_if=min:dot.barbed_shot.remains,if=pet.main.buff.frenzy.up&pet.main.buff.frenzy.remains<=gcd
-- actions.cleave+=/multishot,if=gcd-pet.main.buff.beast_cleave.remains>0.25
-- actions.cleave+=/tar_trap,if=runeforge.soulforge_embers&tar_trap.remains<gcd&cooldown.flare.remains<gcd
-- actions.cleave+=/flare,if=tar_trap.up&runeforge.soulforge_embers
-- actions.cleave+=/death_chakram,if=focus+cast_regen<focus.max
-- actions.cleave+=/wild_spirits
-- actions.cleave+=/barbed_shot,target_if=min:dot.barbed_shot.remains,if=full_recharge_time<gcd&cooldown.bestial_wrath.remains|cooldown.bestial_wrath.remains<12+gcd&talent.scent_of_blood
-- actions.cleave+=/bestial_wrath
-- actions.cleave+=/resonating_arrow
-- actions.cleave+=/stampede,if=buff.aspect_of_the_wild.up|target.time_to_die<15
-- actions.cleave+=/flayed_shot
-- actions.cleave+=/kill_shot
-- actions.cleave+=/chimaera_shot
-- actions.cleave+=/bloodshed
-- actions.cleave+=/a_murder_of_crows
-- actions.cleave+=/barrage,if=pet.main.buff.frenzy.remains>execute_time
-- actions.cleave+=/kill_command,if=focus>cost+action.multishot.cost
-- actions.cleave+=/bag_of_tricks,if=buff.bestial_wrath.down|target.time_to_die<5
-- actions.cleave+=/dire_beast
-- actions.cleave+=/barbed_shot,target_if=min:dot.barbed_shot.remains,if=target.time_to_die<9
-- actions.cleave+=/cobra_shot,if=focus.time_to_max<gcd*2
-- actions.cleave+=/tar_trap,if=runeforge.soulforge_embers|runeforge.nessingwarys_trapping_apparatus
-- actions.cleave+=/freezing_trap,if=runeforge.nessingwarys_trapping_apparatus

-- actions.st=aspect_of_the_wild
-- actions.st+=/barbed_shot,if=pet.main.buff.frenzy.up&pet.main.buff.frenzy.remains<=gcd
-- actions.st+=/tar_trap,if=runeforge.soulforge_embers&tar_trap.remains<gcd&cooldown.flare.remains<gcd
-- actions.st+=/flare,if=tar_trap.up&runeforge.soulforge_embers
-- actions.st+=/bloodshed
-- actions.st+=/wild_spirits
-- actions.st+=/flayed_shot
-- actions.st+=/kill_shot,if=buff.flayers_mark.remains<5|target.health.pct<=20
-- actions.st+=/barbed_shot,if=cooldown.bestial_wrath.remains<12*charges_fractional+gcd&talent.scent_of_blood|full_recharge_time<gcd&cooldown.bestial_wrath.remains|target.time_to_die<9
-- actions.st+=/death_chakram,if=focus+cast_regen<focus.max
-- actions.st+=/stampede,if=buff.aspect_of_the_wild.up|target.time_to_die<15
-- actions.st+=/a_murder_of_crows
-- actions.st+=/resonating_arrow,if=buff.bestial_wrath.up|target.time_to_die<10
-- actions.st+=/bestial_wrath,if=cooldown.wild_spirits.remains>15|!covenant.night_fae|target.time_to_die<15
-- actions.st+=/chimaera_shot
-- actions.st+=/kill_command
-- actions.st+=/bag_of_tricks,if=buff.bestial_wrath.down|target.time_to_die<5
-- actions.st+=/dire_beast
-- actions.st+=/cobra_shot,if=(focus-cost+focus.regen*(cooldown.kill_command.remains-1)>action.kill_command.cost|cooldown.kill_command.remains>1+gcd)|(buff.bestial_wrath.up|buff.nesingwarys_trapping_apparatus.up)&!runeforge.qapla_eredun_war_order|target.time_to_die<3
-- actions.st+=/barbed_shot,if=buff.wild_spirits.up
-- actions.st+=/arcane_pulse,if=buff.bestial_wrath.down|target.time_to_die<5
-- actions.st+=/tar_trap,if=runeforge.soulforge_embers|runeforge.nessingwarys_trapping_apparatus
-- actions.st+=/freezing_trap,if=runeforge.nessingwarys_trapping_apparatus
