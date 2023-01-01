local a = HeroLib;
local b = HeroCache;
local c = a.Unit;
local d = c.Player;
local e = c.Pet;
local f = c.Target;
local g = a.Spell;
local h = a.Item;
local i = HeroRotation;
local j = g.DemonHunter.Havoc;
local k = g.DemonHunter.Vengeance;
local IsInJailersTower = IsInJailersTower;
local l;
l = a.AddCoreOverride("Spell.IsCastable", function(self, m, n, o, p, q)
    local r = l(self, m, n, o, p, q)
    if self == j.Metamorphosis then
        local s = i.GUISettings.APL.DemonHunter.Havoc.HideMetaIfActive;
        return r and (s and d:BuffDown(j.MetamorphosisBuff) or not s)
    else
        return r
    end
end, 577)
local t;
t = a.AddCoreOverride("Spell.IsCastable", function(self, m, n, o, p, q)
    local r = t(self, m, n, o, p, q)
    if self == k.FieryBrand then
        return r and f:DebuffDown(k.FieryBrandDebuff)
    else
        return r
    end
end, 581)
