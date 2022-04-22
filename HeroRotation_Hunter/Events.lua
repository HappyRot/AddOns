--- ============================ HEADER ============================
--- ======= LOCALIZE =======
-- Addon
local addonName, addonTable = ...;
-- HeroDBC
local DBC = HeroDBC.DBC
-- HeroLib
local HL = HeroLib;
local Cache = HeroCache;
local HR = HeroRotation;
local Unit = HL.Unit;
local Player = Unit.Player;
local Target = Unit.Target;
local Spell = HL.Spell;
local Item = HL.Item;
HR.Commons.Hunter = {};
local Hunter = HR.Commons.Hunter;
-- Lua
local pairs = pairs;
local select = select;
local wipe = wipe;
local starttime = 0
-- Spells
local SpellBM = Spell.Hunter.BeastMastery;

