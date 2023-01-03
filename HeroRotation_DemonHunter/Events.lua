local a, b = ...
local c = HeroLib;
local d = HeroRotation;
local e = HeroCache;
local f = c.Unit;
local g = f.Player;
local h = f.Target;
local i = c.Spell;
local j = c.Item;
local GetTime = GetTime;
d.Commons.DemonHunter = {}
local k = d.Commons.DemonHunter;
local l = i.DemonHunter.Vengeance;
c:RegisterForSelfCombatEvent(function(...)
    local m, n, n, n, n, n, n, n, o, n, n, p = select(4, ...)
    if m == g:GUID() then
        if o == 391345 then
            k.DGBCDR = p / 100 * 60;
            k.DGBCDRLastUpdate = GetTime()
        end
    end
end, "SPELL_ENERGIZE")
