local t, e = ...
local t = HeroLib
local i = t.Utils
local a = string.format
local r = string.gmatch
local d = strsplit
local h = table.concat
local o = t.GUI.CreatePanelOption
local s = i.StringToNumberIfPossible
e.GUI = {  }
function e.GUI.LoadSettingsRecursively(i, t)
    local n = t or ""
    for a, o in pairs(i) do
        local t
        if n ~= "" then
            t = n .. "." .. a
        else
            t = a
        end

        if type(o) == "table" then
            e.GUI.LoadSettingsRecursively(o, t)
        else
            local a = s(a)
            local e = HeroRotationDB.GUISettings[t]
            if e ~= nil then
                i[a] = e
            else
                HeroRotationDB.GUISettings[t] = o
            end

        end

    end

end

do
    local function i(e)
        return a("Show GCD as Off GCD: %s", e)
    end

    local function n(e)
        return a("Enable if you want to put %s shown as Off GCD (top icons) instead of Main (Middle icon).", e)
    end

    local function l(e)
        return a("Show Off GCD as Off GCD: %s", e)
    end

    local function s(e)
        return a("Enable if you want to put %s shown as Off GCD (top icons) instead of Main (Middle icon).", e)
    end

    local a = { Enabled = function(a, t, e)
        o("CheckButton", a, t, "Show: " .. e, "Enable if you want to show when to use " .. e .. ".")
    end, DisplayStyle = function(a, t, e)
        o("Dropdown", a, t, { "Main Icon", "Suggested", "SuggestedRight", "Cooldown" }, "Display Style: " .. e, "Define which icon display style to use for " .. e .. ".")
    end, GCDasOffGCD = function(t, a, e)
        o("CheckButton", t, a, i(e), n(e))
    end, OffGCDasOffGCD = function(t, a, e)
        o("CheckButton", t, a, l(e), s(e))
    end }
    function e.GUI.CreateARPanelOption(e, o, t,...)
        a[e](o, t, ...)
    end

    function e.GUI.CreateARPanelOptions(n, o)
        local i = { d(".", o) }
        local t = e.GUISettings
        for e = 1, #i do
            t = t[i[e]]
        end

        for a, i in pairs(a) do
            SettingsType = t[a]
            if SettingsType then
                for i, t in pairs(SettingsType) do
                    local t = ""
                    for e in r(i, "[A-Z][a-z]+") do
                        if t == "" then
                            t = e
                        else
                            t = t .. " " .. e
                        end

                    end

                    local o = h({ o, a, i }, ".")
                    e.GUI.CreateARPanelOption(a, n, o, t)
                end

            end

        end

    end

end


