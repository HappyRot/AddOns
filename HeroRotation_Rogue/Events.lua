local a, b = ...
local c = HeroLib;
local d, e = HeroCache, c.Utils;
local f = c.Unit;
local g, h, i = f.Player, f.Pet, f.Target;
local j, k = f.Focus, f.MouseOver;
local l, m, n = f.Arena, f.Boss, f.Nameplate;
local o, p = f.Party, f.Raid;
local q = c.Spell;
local r = c.Item;
local s = HeroRotation;
local t = s.Commons.Rogue;
local C_Timer = C_Timer;
local u = math.max;
local v = math.min;
local w = math.abs;
local pairs = pairs;
local x = table.insert;
local UnitAttackSpeed = UnitAttackSpeed;
local GetTime = GetTime;
do
    local y = GetTime()
    function t.RtBRemains(z)
        local A = y - GetTime() - c.RecoveryOffset(z)
        return A >= 0 and A or 0
    end
    c:RegisterForSelfCombatEvent(function(B, B, B, B, B, B, B, B, B, B, B, C)
        if C == 315508 then
            y = GetTime() + 30
        end
    end, "SPELL_AURA_APPLIED")
    c:RegisterForSelfCombatEvent(function(B, B, B, B, B, B, B, B, B, B, B, C)
        if C == 315508 then
            y = GetTime() + v(40, 30 + t.RtBRemains(true))
        end
    end, "SPELL_AURA_REFRESH")
    c:RegisterForSelfCombatEvent(function(B, B, B, B, B, B, B, B, B, B, B, C)
        if C == 315508 then
            y = GetTime()
        end
    end, "SPELL_AURA_REMOVED")
end
do
    local D = {
        CrimsonTempest = {},
        Garrote = {},
        Rupture = {}
    }
    function t.Exsanguinated(E, F)
        local G = E:GUID()
        if not G then
            return false
        end
        local C = F:ID()
        if C == 121411 then
            return D.CrimsonTempest[G] or false
        elseif C == 703 then
            return D.Garrote[G] or false
        elseif C == 1943 then
            return D.Rupture[G] or false
        end
        return false
    end
    function t.WillLoseExsanguinate(E, F)
        if t.Exsanguinated(E, F) then
            return true
        end
        return false
    end
    function t.ExsanguinatedRate(E, F)
        if t.Exsanguinated(E, F) then
            return 2.0
        end
        return 1.0
    end
    c:RegisterForSelfCombatEvent(function(B, B, B, B, B, B, B, H, B, B, B, C)
        if C == 200806 then
            for B, I in pairs(D) do
                for G, B in pairs(I) do
                    if G == H then
                        I[G] = true
                    end
                end
            end
        end
    end, "SPELL_CAST_SUCCESS")
    c:RegisterForSelfCombatEvent(function(B, B, B, B, B, B, B, H, B, B, B, C)
        if C == 121411 then
            D.CrimsonTempest[H] = false
        elseif C == 703 then
            D.Garrote[H] = false
        elseif C == 1943 then
            D.Rupture[H] = false
        end
    end, "SPELL_AURA_APPLIED", "SPELL_AURA_REFRESH")
    c:RegisterForSelfCombatEvent(function(B, B, B, B, B, B, B, H, B, B, B, C)
        if C == 121411 then
            if D.CrimsonTempest[H] ~= nil then
                D.CrimsonTempest[H] = nil
            end
        elseif C == 703 then
            if D.Garrote[H] ~= nil then
                D.Garrote[H] = nil
            end
        elseif C == 1943 then
            if D.Rupture[H] ~= nil then
                D.Rupture[H] = nil
            end
        end
    end, "SPELL_AURA_REMOVED")
    c:RegisterForCombatEvent(function(B, B, B, B, B, B, B, H)
        if D.CrimsonTempest[H] ~= nil then
            D.CrimsonTempest[H] = nil
        end
        if D.Garrote[H] ~= nil then
            D.Garrote[H] = nil
        end
        if D.Rupture[H] ~= nil then
            D.Rupture[H] = nil
        end
    end, "UNIT_DIED", "UNIT_DESTROYED")
end
do
    local J = q(195627)
    local K = 0;
    local L = GetTime()
    function t.FanTheHammerCP()
        if GetTime() - L < 0.5 and K > 0 then
            if K > g:ComboPoints() then
                return K
            else
                K = 0
            end
        end
        return 0
    end
    c:RegisterForSelfCombatEvent(function(B, B, B, B, B, B, B, B, B, B, B, C, B, B, M, N)
        if C == 185763 then
            if GetTime() - L > 0.5 then
                L = GetTime()
                K = v(t.CPMaxSpend(), g:ComboPoints() + M * v(3, g:BuffStack(J)))
            end
        end
    end, "SPELL_ENERGIZE")
end
do
    local O, P = 0, 0;
    local Q = q(277925)
    function t.TimeToNextTornado()
        if not g:BuffUp(Q, nil, true) then
            return 0
        end
        local R = g:BuffRemains(Q, nil, true) % 1;
        if GetTime() == O then
            return 0
        elseif GetTime() - O < 0.1 and R < 0.25 then
            return 1
        elseif (R > 0.9 or R == 0) and GetTime() - O > 0.75 then
            return 0.1
        end
        return R
    end
    c:RegisterForSelfCombatEvent(function(B, B, B, B, B, B, B, B, B, B, B, C)
        if C == 212743 then
            O = GetTime()
        elseif C == 197835 then
            P = GetTime()
        end
        if P == O then
            O = 0
        end
    end, "SPELL_CAST_SUCCESS")
end
do
    local S = {
        Counter = 0,
        LastMH = 0,
        LastOH = 0
    }
    function t.TimeToSht(T)
        if S.Counter >= T then
            return 0
        end
        local U, V = UnitAttackSpeed("player")
        local W = u(S.LastMH + U, GetTime())
        local X = u(S.LastOH + V, GetTime())
        local Y = {}
        for Z = 0, 2 do
            x(Y, W + Z * U)
            x(Y, X + Z * V)
        end
        table.sort(Y)
        local _ = v(5, u(1, T - S.Counter))
        return Y[_] - GetTime()
    end
    c:RegisterForSelfCombatEvent(function()
        S.Counter = 0;
        S.LastMH = GetTime()
        S.LastOH = GetTime()
    end, "PLAYER_ENTERING_WORLD")
    c:RegisterForSelfCombatEvent(function(B, B, B, B, B, B, B, B, B, B, B, C)
        if C == 196911 then
            S.Counter = 0
        end
    end, "SPELL_ENERGIZE")
    c:RegisterForSelfCombatEvent(function(B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, a0)
        S.Counter = S.Counter + 1;
        if a0 then
            S.LastOH = GetTime()
        else
            S.LastMH = GetTime()
        end
    end, "SWING_DAMAGE")
    c:RegisterForSelfCombatEvent(function(B, B, B, B, B, B, B, B, B, B, B, B, B, B, B, a0)
        if a0 then
            S.LastOH = GetTime()
        else
            S.LastMH = GetTime()
        end
    end, "SWING_MISSED")
end
do
    local a1 = g:CritChancePct()
    local a2 = 0;
    local function a3()
        if not g:AffectingCombat() then
            a1 = g:CritChancePct()
            c.Debug("Base Crit Set to: " .. a1)
        end
        if a2 == nil or a2 < 0 then
            a2 = 0
        else
            a2 = a2 - 1
        end
        if a2 > 0 then
            C_Timer.After(3, a3)
        end
    end
    c:RegisterForEvent(function()
        if a2 == 0 then
            C_Timer.After(3, a3)
            a2 = 2
        end
    end, "PLAYER_EQUIPMENT_CHANGED")
    function t.BaseAttackCrit()
        return a1
    end
end
