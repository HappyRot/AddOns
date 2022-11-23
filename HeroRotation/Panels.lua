local t, e = ...
local t = HeroLib
local i = t.Utils
local o = string.format
local d = string.gmatch
local h = strsplit
local r = table.concat
local a = t.GUI.CreatePanelOption
local s = i.StringToNumberIfPossible
e.GUI = {  }
function e.GUI.LoadSettingsRecursively(n, t)
    local i = t or ""
    for a, o in pairs(n) do
        local t
        if i ~= "" then
            t = i .. "." .. a
        else
            t = a
        end

        if type(o) == "table" then
            e.GUI.LoadSettingsRecursively(o, t)
        else
            local a = s(a)
            local e = HeroRotationDB.GUISettings[t]
            if e ~= nil then
                n[a] = e
            else
                HeroRotationDB.GUISettings[t] = o
            end

        end

    end

end

do
    local function i(e)
        return o("Show GCD as Off GCD: %s", e)
    end

    local function n(e)
        return o("Enable if you want to put %s shown as Off GCD (top icons) instead of Main (Middle icon).", e)
    end

    local function l(e)
        return o("Show Off GCD as Off GCD: %s", e)
    end

    local function s(e)
        return o("Enable if you want to put %s shown as Off GCD (top icons) instead of Main (Middle icon).", e)
    end

    local i = { Enabled = function(o, t, e)
        a("CheckButton", o, t, "Show: " .. e, "Enable if you want to show when to use " .. e .. ".")
    end, DisplayStyle = function(o, t, e)
        a("Dropdown", o, t, { "Main Icon", "Suggested", "SuggestedRight", "Cooldown" }, "Display Style: " .. e, "Define which icon display style to use for " .. e .. ".")
    end, PotionType = function(t, e, o)
        a("Dropdown", t, e, { "Power", "Frozen Focus", "Chilled Clarity", "Shocking Disclosure" }, "Potion Type: ", "Define which potion type to track.\n\nThe Power option will include Fleeting Ultimate Power, Fleeting Power, Ultimate Power, and Power potions.")
    end, GCDasOffGCD = function(o, t, e)
        a("CheckButton", o, t, i(e), n(e))
    end, OffGCDasOffGCD = function(o, t, e)
        a("CheckButton", o, t, l(e), s(e))
    end }
    function e.GUI.CreateARPanelOption(t, a, e,...)
        i[t](a, e, ...)
    end

    function e.GUI.CreateARPanelOptions(n, o)
        local a = { h(".", o) }
        local t = e.GUISettings
        for e = 1, #a do
            t = t[a[e]]
        end

        for a, i in pairs(i) do
            SettingsType = t[a]
            if SettingsType then
                for i, t in pairs(SettingsType) do
                    local t = ""
                    for e in d(i, "[A-Z][a-z]+") do
                        if t == "" then
                            t = e
                        else
                            t = t .. " " .. e
                        end

                    end

                    local o = r({ o, a, i }, ".")
                    e.GUI.CreateARPanelOption(a, n, o, t)
                end

            end

        end

    end

end


