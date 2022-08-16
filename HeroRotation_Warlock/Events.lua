local e, e = ...
local e = HeroLib
local a = HeroRotation
local t = HeroCache
local t = e.Unit
local h = t.Player
local t = t.Target
local t = e.Spell
local t = e.Item
local r = string.find
local i = GetTime
a.Commons.Warlock = {  }
local o = a.Commons.Warlock
e.ImmolationTable = { Destruction = { ImmolationDebuff = {  } } }
e.GuardiansTable = { Pets = {  }, ImpCount = 0, FelguardDuration = 0, DreadstalkerDuration = 0, DemonicTyrantDuration = 0, VilefiendDuration = 0, Infernal = 0, InnerDemonsNextCast = 0, ImpsSpawnedFromHoG = 0 }
local n = { [98035] = { name = "Dreadstalker", duration = 12.25 }, [55659] = { name = "Wild Imp", duration = 20 }, [143622] = { name = "Wild Imp", duration = 20 }, [17252] = { name = "Felguard", duration = 17 }, [135002] = { name = "Demonic Tyrant", duration = 15 }, [135816] = { name = "Vilefiend", duration = 15 }, [89] = { name = "Infernal", duration = 30 } }
e:RegisterForSelfCombatEvent(function(...)
    DestGUID, _, _, _, SpellID = select(8, ...)
    if SpellID == 157736 then
        e.ImmolationTable.Destruction.ImmolationDebuff[DestGUID] = 0
    end

end, "SPELL_AURA_APPLIED", "SPELL_AURA_REFRESH")
e:RegisterForSelfCombatEvent(function(...)
    DestGUID, _, _, _, SpellID = select(8, ...)
    if SpellID == 157736 then
        if e.ImmolationTable.Destruction.ImmolationDebuff[DestGUID] then
            e.ImmolationTable.Destruction.ImmolationDebuff[DestGUID] = nil
        end

    end

end, "SPELL_AURA_REMOVED")
e:RegisterForCombatEvent(function(...)
    DestGUID = select(8, ...)
    if e.ImmolationTable.Destruction.ImmolationDebuff[DestGUID] then
        e.ImmolationTable.Destruction.ImmolationDebuff[DestGUID] = nil
    end

end, "UNIT_DIED", "UNIT_DESTROYED")
e:RegisterForSelfCombatEvent(function(...)
    DestGUID, _, _, _, SpellID = select(8, ...)
    if SpellID == 17962 then
        if e.ImmolationTable.Destruction.ImmolationDebuff[DestGUID] then
            e.ImmolationTable.Destruction.ImmolationDebuff[DestGUID] = e.ImmolationTable.Destruction.ImmolationDebuff[DestGUID] + 1
        end

    end

end, "SPELL_CAST_SUCCESS")
function o.UpdatePetTable()
    for a, t in pairs(e.GuardiansTable.Pets) do
        if t then
            if i() >= t.despawnTime then
                if t.name == "Wild Imp" then
                    e.GuardiansTable.ImpCount = e.GuardiansTable.ImpCount - 1
                end

                                                                                if t.name == "Felguard" then
                    e.GuardiansTable.FelguardDuration = 0
                elseif t.name == "Dreadstalker" then
                    e.GuardiansTable.DreadstalkerDuration = 0
                elseif t.name == "Demonic Tyrant" then
                    e.GuardiansTable.DemonicTyrantDuration = 0
                elseif t.name == "Vilefiend" then
                    e.GuardiansTable.VilefiendDuration = 0
                elseif t.name == "Infernal" then
                    e.GuardiansTable.InfernalDuration = 0
                end

                e.GuardiansTable.Pets[a] = nil
            end

        end

        if t.ImpCasts <= 0 then
            e.GuardiansTable.ImpCount = e.GuardiansTable.ImpCount - 1
            e.GuardiansTable.Pets[a] = nil
        end

        if i() <= t.despawnTime then
            t.Duration = t.despawnTime - i()
                                                            if t.name == "Felguard" then
                e.GuardiansTable.FelguardDuration = t.Duration
            elseif t.name == "Dreadstalker" then
                e.GuardiansTable.DreadstalkerDuration = t.Duration
            elseif t.name == "Demonic Tyrant" then
                e.GuardiansTable.DemonicTyrantDuration = t.Duration
            elseif t.name == "Vilefiend" then
                e.GuardiansTable.VilefiendDuration = t.Duration
            elseif t.name == "Infernal" then
                e.GuardiansTable.InfernalDuration = t.Duration
            end

        end

    end

end

e:RegisterForSelfCombatEvent(function(...)
    local a, t, a, a, a, a, a, s, a, a, a, h = select(1, ...)
    local r, r, r, r, r, r, r, a = r(s, "(%S+)-(%d+)-(%d+)-(%d+)-(%d+)-(%d+)-(%S+)")
    a = tonumber(a)
    if (s ~= UnitGUID("pet") and t == "SPELL_SUMMON" and n[a]) then
        local t = n[a]
        local a
                                                if t.name == "Wild Imp" then
            e.GuardiansTable.ImpCount = e.GuardiansTable.ImpCount + 1
            a = t.duration
        elseif t.name == "Felguard" then
            e.GuardiansTable.FelguardDuration = t.duration
            a = t.duration
        elseif t.name == "Dreadstalker" then
            e.GuardiansTable.DreadstalkerDuration = t.duration
            a = t.duration
        elseif t.name == "Demonic Tyrant" then
            if (h == 265187) then
                e.GuardiansTable.DemonicTyrantDuration = t.duration
                a = t.duration
            end

        elseif t.name == "Vilefiend" then
            e.GuardiansTable.VilefiendDuration = t.duration
            a = t.duration
        elseif t.name == "Infernal" then
            e.GuardiansTable.InfernalDuration = t.duration
            a = t.duration
        end

        local t = { ID = s, name = t.name, spawnTime = i(), ImpCasts = 5, Duration = a, despawnTime = i() + tonumber(a) }
        table.insert(e.GuardiansTable.Pets, t)
    end

    if n[a] and n[a].name == "Demonic Tyrant" then
        for t, e in pairs(e.GuardiansTable.Pets) do
            if (e and e.name ~= "Demonic Tyrant") then
                e.despawnTime = e.despawnTime + 15
                e.ImpCasts = e.ImpCasts + 7
            end

        end

    end

    if a == 143622 then
        e.GuardiansTable.InnerDemonsNextCast = i() + 12
    end

    if a == 55659 and e.GuardiansTable.ImpsSpawnedFromHoG > 0 then
        e.GuardiansTable.ImpsSpawnedFromHoG = e.GuardiansTable.ImpsSpawnedFromHoG - 1
    end

    o.UpdatePetTable()
end, "SPELL_SUMMON", "SPELL_CAST_SUCCESS")
e:RegisterForCombatEvent(function(...)
    local t, i, i, i, i, i, i, i, a = select(4, ...)
    if a == 104318 then
        for a, e in pairs(e.GuardiansTable.Pets) do
            if t == e.ID then
                e.ImpCasts = e.ImpCasts - 1
            end

        end

    end

    if t == h:GUID() and a == 196277 then
        for a, t in pairs(e.GuardiansTable.Pets) do
            if t.name == "Wild Imp" then
                e.GuardiansTable.Pets[a] = nil
            end

        end

        e.GuardiansTable.ImpCount = 0
    end

    o.UpdatePetTable()
end, "SPELL_CAST_SUCCESS")
o.SoulShards = 0
function o.UpdateSoulShards()
    o.SoulShards = h:SoulShards()
end

e:RegisterForSelfCombatEvent(function(a, a, a, a, a, a, a, a, a, a, a, t)
    if t == 105174 then
        e.GuardiansTable.ImpsSpawnedFromHoG = e.GuardiansTable.ImpsSpawnedFromHoG + (o.SoulShards >= 3 and 3 or o.SoulShards)
    end

end, "SPELL_CAST_SUCCESS")

