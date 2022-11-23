local t, e = ...
local t = HeroLib
local a = HeroCache
local a = t.Unit
local o = a.Player
local a = a.Target
local a = t.Spell
local t = t.Item
local t = pairs
local y = string.lower
local r = tostring
e.MainIconFrame = CreateFrame("Frame", "HeroRotation_MainIconFrame", UIParent)
e.MainIconPartOverlayFrame = CreateFrame("Frame", "HeroRotation_MainIconPartOverlayFrame", UIParent)
e.MainIconFrame.Part = {  }
e.MainIconFrame.CooldownFrame = CreateFrame("Cooldown", "HeroRotation_MainIconCooldownFrame", e.MainIconFrame, "AR_CooldownFrameTemplate")
e.SmallIconFrame = CreateFrame("Frame", "HeroRotation_SmallIconFrame", UIParent)
e.LeftIconFrame = CreateFrame("Frame", "HeroRotation_LeftIconFrame", UIParent)
e.NameplateIconFrame = CreateFrame("Frame", "HeroRotation_NameplateIconFrame", UIParent)
e.SuggestedIconFrame = CreateFrame("Frame", "HeroRotation_SuggestedIconFrame", UIParent)
e.RightSuggestedIconFrame = CreateFrame("Frame", "HeroRotation_RightSuggestedIconFrame", UIParent)
e.ToggleIconFrame = CreateFrame("Frame", "HeroRotation_ToggleIconFrame", UIParent)
local t = e.GetTexture(a(999900))
function e.ResetIcons()
    e.MainIconFrame:Hide()
    if e.GUISettings.General.BlackBorderIcon then
        e.MainIconFrame.Backdrop:Hide()
    end

    e.MainIconPartOverlayFrame:Hide()
    e.MainIconFrame:HideParts()
    e.SmallIconFrame:HideIcons()
    e.CastOffGCDOffset = 1
    e.Nameplate.HideIcons()
    e.CastLeftOffset = 1
    e.SuggestedIconFrame:HideIcon()
    if e.GUISettings.General.BlackBorderIcon then
        e.SuggestedIconFrame.Backdrop:Hide()
    end

    e.CastSuggestedOffset = 1
    e.RightSuggestedIconFrame:HideIcon()
    if e.GUISettings.General.BlackBorderIcon then
        e.RightSuggestedIconFrame.Backdrop:Hide()
    end

    e.CastRightSuggestedOffset = 1
    if e.GUISettings.General.HideToggleIcons then
        e.ToggleIconFrame:Hide()
    end

    if not e.GUISettings.General.HideToggleIcons then
        e.ToggleIconFrame:SetAlpha(e.GUISettings.General.SetAlpha)
    end

end

function e:CreateBackdrop(a)
    if a.Backdrop or not e.GUISettings.General.BlackBorderIcon then
        return 
    end

    local t = CreateFrame("Frame", nil, a, BackdropTemplateMixin and "BackdropTemplate")
    a.Backdrop = t
    t:ClearAllPoints()
    t:SetPoint("TOPLEFT", a, "TOPLEFT", -1, 1)
    t:SetPoint("BOTTOMRIGHT", a, "BOTTOMRIGHT", 1, -1)
    t:SetBackdrop({ bgFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = false, tileSize = 0, edgeSize = 1, insets = { left = 0, right = 0, top = 0, bottom = 0 } })
    t:SetBackdropBorderColor(0, 0, 0)
    t:SetBackdropColor(0, 0, 0, 1)
    t:SetFrameStrata(e.MainFrame:GetFrameStrata())
    if a:GetFrameLevel() - 2 >= 0 then
        t:SetFrameLevel(a:GetFrameLevel() - 2)
    else
        t:SetFrameLevel(0)
    end

end

function e.MainIconFrame:Init()
    self:SetFrameStrata(e.MainFrame:GetFrameStrata())
    self:SetFrameLevel(e.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(64)
    self:SetHeight(64)
    self:SetPoint("BOTTOMRIGHT", e.MainFrame, "BOTTOMRIGHT", 0, 0)
    self.Texture = self:CreateTexture(nil, "ARTWORK")
    self.Texture:SetAllPoints(self)
    self.CooldownFrame:SetAllPoints(self)
    e.MainIconPartOverlayFrame:SetFrameStrata(self:GetFrameStrata())
    e.MainIconPartOverlayFrame:SetFrameLevel(self:GetFrameLevel() + 1)
    e.MainIconPartOverlayFrame:SetWidth(64)
    e.MainIconPartOverlayFrame:SetHeight(64)
    e.MainIconPartOverlayFrame:SetPoint("Left", self, "Left", 0, 0)
    e.MainIconPartOverlayFrame.Texture = e.MainIconPartOverlayFrame:CreateTexture(nil, "ARTWORK")
    e.MainIconPartOverlayFrame.Texture:SetAllPoints(e.MainIconPartOverlayFrame)
    local t = self:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.Keybind = t
    t:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    t:SetAllPoints(true)
    t:SetJustifyH("RIGHT")
    t:SetJustifyV("TOP")
    t:SetPoint("TOPRIGHT")
    t:SetTextColor(.8, .8, .8, 1)
    t:SetText("")
    local t = self:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.Text = t
    t:SetAllPoints(true)
    t:SetJustifyH("CENTER")
    t:SetJustifyV("CENTER")
    t:SetPoint("CENTER")
    t:SetTextColor(1, 1, 1, 1)
    t:SetText("")
    if e.GUISettings.General.BlackBorderIcon then
        self.Texture:SetTexCoord(.08, .92, .08, .92)
        e:CreateBackdrop(self)
    end

    self:InitParts()
    self:Show()
end

function e.MainIconFrame:ChangeIcon(i, t, n, o, a)
    self.ID = a
    self.Texture:SetTexture(i)
        if e.GUISettings.General.NotEnoughManaEnabled and not n then
        self.Texture:SetVertexColor(.5, .5, 1.)
    elseif o then
        self.Texture:SetVertexColor(1., .5, .5)
    else
        self.Texture:SetVertexColor(1., 1., 1.)
    end

    self.Texture:SetAllPoints(self)
    if t then
        self.Keybind:SetText(t)
        self.Keybind:SetScale(e.GUISettings.Scaling.ScaleHotkey)
    else
        self.Keybind:SetText("")
    end

    self.Text:SetText("")
    if e.GUISettings.General.BlackBorderIcon and not self.Backdrop:IsVisible() then
        self.Backdrop:Show()
    end

    self:SetAlpha(e.GUISettings.General.SetAlpha)
    if not self:IsVisible() then
        self:Show()
    end

end

function e.MainIconFrame:OverlayText(e)
    self.Text:SetText(e)
end

function e.MainIconFrame:SetCooldown(e, t)
    if e == 0 or t == 0 then
        self.CooldownFrame:SetCooldown(0, 0)
        self.CooldownFrame:Hide()
        return 
    end

    self.CooldownFrame:SetCooldown(e, t)
end

function e.MainIconFrame:InitParts()
    e.MainIconPartOverlayFrame:Show()
    for a = 1, e.MaxQueuedCasts do
        local t = CreateFrame("Frame", "HeroRotation_MainIconPartFrame" .. r(a), UIParent)
        self.Part[a] = t
        t:SetFrameStrata(self:GetFrameStrata())
        t:SetFrameLevel(self:GetFrameLevel() + 1)
        t:SetWidth(64)
        t:SetHeight(64)
        t:SetPoint("Left", self, "Left", 0, 0)
        t.Texture = t:CreateTexture(nil, "BACKGROUND")
        t.Keybind = self:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        t.Keybind:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
        t.Keybind:SetAllPoints(true)
        t.Keybind:SetJustifyH("RIGHT")
        t.Keybind:SetJustifyV("TOP")
        t.Keybind:SetPoint("TOPRIGHT")
        t.Keybind:SetTextColor(.8, .8, .8, 1)
        t.Keybind:SetText("")
        if e.GUISettings.General.BlackBorderIcon then
            t.Texture:SetTexCoord(.08, .92, .08, .92)
            e:CreateBackdrop(t)
        end

        t:Show()
    end

end

local o, i
function e.MainIconFrame:SetupParts(l, w)
    o = #l
    i = e.MainIconPartOverlayFrame.Texture:GetWidth() / o
    local f, c, m, u, r, s, d, h = e.MainIconPartOverlayFrame.Texture:GetTexCoord()
    for a = 1, o do
        local t = self.Part[a]
        t:SetWidth(i)
        t:SetHeight(i * o)
        t:ClearAllPoints()
        local y, n = e.MainIconPartOverlayFrame.Texture:GetPoint()
        if e.MainIconPartOverlayFrame.__MSQ_NormalColor then
            if a == e.MaxQueuedCasts or a == o then
                t:SetPoint("Center", n, "Center", i / (4 - o), 0)
            else
                t:SetPoint("Center", n, "Center", (i / (4 - o)) * (a - 2), 0)
            end

        else
            t:SetPoint("Left", n, "Left", i * (a - 1), 0)
        end

        t.Texture:SetTexture(l[a])
        t.Texture:SetAllPoints(t)
        if t.Backdrop then
            if e.MainIconPartOverlayFrame.__MSQ_NormalColor then
                t.Backdrop:Hide()
            else
                t.Backdrop:Show()
            end

        end

        local i = e.GUISettings.General.BlackBorderIcon and not e.MainIconPartOverlayFrame.__MSQ_NormalColor
        local l = ((a - 1) / o)
        local n = (a / o)
        t.Texture:SetTexCoord(a == 1 and (i and f + .08 or f) or (r * l), a == 1 and (i and c + .08 or c) or (i and s + .08 or s), a == 1 and (i and m + .08 or m) or (d * l), a == 1 and (i and u - .08 or u) or (i and h - .08 or h), (a == o and i) and (r * n) - .08 or r * n, i and s + .08 or s, (a == o and i) and (d * n) - .08 or d * n, i and h - .08 or h)
        if w then
            t.Keybind:SetText(w[a])
            t.Keybind:SetScale(e.GUISettings.Scaling.ScaleHotkey)
        else
            t.Keybind:SetText("")
        end

        if not t:IsVisible() then
            e.MainIconPartOverlayFrame:Show()
            t:Show()
        end

    end

end

function e.MainIconFrame:HideParts()
    self.ID = nil
    e.MainIconPartOverlayFrame:Hide()
    for e = 1, #self.Part do
        self.Part[e].Keybind:SetText("")
        self.Part[e]:Hide()
    end

end

function e.MainIconFrame:getIconID()
    if self.ID then
        return self.ID
    end

    return nil
end

function e.SmallIconFrame:Init()
    self:SetFrameStrata(e.MainFrame:GetFrameStrata())
    self:SetFrameLevel(e.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(64)
    self:SetHeight(32)
    self:SetPoint("BOTTOMLEFT", e.MainIconFrame, "TOPLEFT", 0, e.GUISettings.General.BlackBorderIcon and 1 or 0)
    self.Icon = {  }
    self:CreateIcons(1, "LEFT")
    self:CreateIcons(2, "RIGHT")
    self:Show()
end

function e.SmallIconFrame:CreateIcons(o, a)
    local t = CreateFrame("Frame", "HeroRotation_SmallIconFrame" .. r(o), UIParent)
    self.Icon[o] = t
    t:SetFrameStrata(self:GetFrameStrata())
    t:SetFrameLevel(self:GetFrameLevel() - 1)
    t:SetWidth(e.GUISettings.General.BlackBorderIcon and 30 or 32)
    t:SetHeight(e.GUISettings.General.BlackBorderIcon and 30 or 32)
    t:SetPoint(a, self, a, 0, 0)
    t.Texture = t:CreateTexture(nil, "ARTWORK")
    local a = t:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    t.Keybind = a
    a:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    a:SetAllPoints(true)
    a:SetJustifyH("RIGHT")
    a:SetJustifyV("TOP")
    a:SetPoint("TOPRIGHT")
    a:SetTextColor(.8, .8, .8, 1)
    a:SetText("")
    if e.GUISettings.General.BlackBorderIcon then
        t.Texture:SetTexCoord(.08, .92, .08, .92)
        e:CreateBackdrop(t)
    end

    t:Show()
end

function e.SmallIconFrame:ChangeIcon(t, i, a, o)
    local t = self.Icon[t]
    t.Texture:SetTexture(i)
    t.Texture:SetAllPoints(t)
    if o then
        t.Texture:SetVertexColor(1., .5, .5)
    else
        t.Texture:SetVertexColor(1., 1., 1.)
    end

    if a then
        t.Keybind:SetText(a)
        t.Keybind:SetScale(e.GUISettings.Scaling.ScaleHotkey * .85)
    else
        t.Keybind:SetText("")
    end

    t:SetAlpha(e.GUISettings.General.SetAlpha)
    if not t:IsVisible() then
        t:Show()
    end

end

function e.SmallIconFrame:GetIcon(e)
    local e = self.Icon[e]
    if e and e:IsVisible() then
        return e.Texture:GetTexture()
    end

    return nil
end

function e.SmallIconFrame:GetKeybind(e)
    local e = self.Icon[e]
    if e and e:IsVisible() then
        return e.Keybind:GetText()
    end

    return ""
end

function e.SmallIconFrame:HideIcons()
    for e = 1, #self.Icon do
        self.Icon[e]:Hide()
    end

end

function e.LeftIconFrame:Init()
    self:SetFrameStrata(e.MainFrame:GetFrameStrata())
    self:SetFrameLevel(e.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(48)
    self:SetHeight(48)
    self:SetPoint("RIGHT", e.MainIconFrame, "LEFT", e.GUISettings.General.BlackBorderIcon and -1 or 0, 0)
    self.Texture = self:CreateTexture(nil, "BACKGROUND")
    if e.GUISettings.General.BlackBorderIcon then
        self.Texture:SetTexCoord(.08, .92, .08, .92)
        e:CreateBackdrop(self)
    end

    local e = self:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.Keybind = e
    e:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    e:SetAllPoints(true)
    e:SetJustifyH("RIGHT")
    e:SetJustifyV("TOP")
    e:SetPoint("TOPRIGHT")
    e:SetTextColor(.8, .8, .8, 1)
    e:SetText("")
    self:Show()
end

function e.LeftIconFrame:ChangeIcon(a, t)
    self.Texture:SetTexture(a)
    self.Texture:SetAllPoints(self)
    if e.GUISettings.General.BlackBorderIcon and not self.Backdrop:IsVisible() then
        self.Backdrop:Show()
    end

    if t then
        self.Keybind:SetText(t)
        self.Keybind:SetScale(e.GUISettings.Scaling.ScaleHotkey)
    else
        self.Keybind:SetText("")
    end

    self:SetAlpha(e.GUISettings.General.SetAlpha)
    if not self:IsVisible() then
        self:Show()
    end

end

e.Nameplate = { Initialized = false }
function e.Nameplate.AddIcon(s, n)
    if e.GUISettings.General.NamePlateIconAnchor == "Disable" then
        return true
    end

    local t = y(s.UnitID)
    local a = C_NamePlate.GetNamePlateForUnit(t)
    if a then
        local t = GetScreenHeight()
        local t = (t > 768) and (768 / t) or 1
        local i = a:GetHeight() / t
        local o
        if e.GUISettings.General.NamePlateIconAnchor == "Life Bar" then
                        if _G.ElvUI and _G.ElvUI[1].charSettings.profile.nameplates.enable then
                o = a.unitFrame.Health
                i = o:GetWidth() / 3.5
            elseif _G.ShestakUI and _G.ShestakUI[2].nameplate.enable then
                o = a.unitFrame.Health
                i = (o:GetWidth() / t) / 3.5
            else
                o = a.UnitFrame.healthBar
                i = (o:GetWidth() / t) / 3.5
            end

        end

        local t = e.NameplateIconFrame
        if not e.Nameplate.Initialized then
            t:SetFrameStrata(a:GetFrameStrata())
            t:SetFrameLevel(a:GetFrameLevel() + 50)
            t:SetWidth(i)
            t:SetHeight(i)
            t.Texture = t:CreateTexture(nil, "BACKGROUND")
            if e.GUISettings.General.BlackBorderIcon then
                t.Texture:SetTexCoord(.08, .92, .08, .92)
                e:CreateBackdrop(t)
            end

            e.Nameplate.Initialized = true
        end

        t.Texture:SetTexture(e.GetTexture(n))
        t.Texture:SetAllPoints(t)
        local i = 1
        if (n.SpellName) then
            if (n:BookIndex() ~= nil) then
                i = (s:IsSpellInRange(n) and 1 or .4)
            else
                i = 1
            end

        else
            i = 1
        end

        t.Texture:SetAlpha(i)
        t:ClearAllPoints()
        t:SetAlpha(e.GUISettings.General.SetAlpha)
        if not t:IsVisible() then
            if e.GUISettings.General.NamePlateIconAnchor == "Life Bar" then
                t:SetPoint("CENTER", o)
            else
                t:SetPoint("CENTER", a)
            end

            t:Show()
        end

        e.LastUnitCycled = s
        e.LastUnitCycledTime = GetTime()
        return true
    end

    return false
end

function e.Nameplate.HideIcons()
    e.NameplateIconFrame:Hide()
    e.LeftIconFrame:Hide()
end

function e.SuggestedIconFrame:Init()
    self:SetFrameStrata(e.MainFrame:GetFrameStrata())
    self:SetFrameLevel(e.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(32)
    self:SetHeight(32)
    self:SetPoint("BOTTOM", e.MainIconFrame, "LEFT", -e.LeftIconFrame:GetWidth() / 2, e.LeftIconFrame:GetHeight() / 2 + (e.GUISettings.General.BlackBorderIcon and 3 or 4))
    self.Texture = self:CreateTexture(nil, "BACKGROUND")
    if e.GUISettings.General.BlackBorderIcon then
        self.Texture:SetTexCoord(.08, .92, .08, .92)
        e:CreateBackdrop(self)
    end

    local e = self:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.Keybind = e
    e:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    e:SetAllPoints(true)
    e:SetJustifyH("RIGHT")
    e:SetJustifyV("TOP")
    e:SetPoint("TOPRIGHT")
    e:SetTextColor(.8, .8, .8, 1)
    e:SetText("")
    self:Show()
end

function e.SuggestedIconFrame:ChangeIcon(i, t, o, a)
    self.ID = a
    self.Texture:SetTexture(i)
    self.Texture:SetAllPoints(self)
    if o then
        self.Texture:SetVertexColor(1., .5, .5)
    else
        self.Texture:SetVertexColor(1., 1., 1.)
    end

    if e.GUISettings.General.BlackBorderIcon and not self.Backdrop:IsVisible() then
        self.Backdrop:Show()
    end

    if t then
        self.Keybind:SetText(t)
        self.Keybind:SetScale(e.GUISettings.Scaling.ScaleHotkey * .85)
    else
        self.Keybind:SetText("")
    end

    self:SetAlpha(e.GUISettings.General.SetAlpha)
    if not self:IsVisible() then
        self:Show()
    end

end

function e.SuggestedIconFrame:HideIcon()
    self.ID = nil
    e.SuggestedIconFrame:Hide()
end

function e.SuggestedIconFrame:getIconID()
    if self.ID then
        return self.ID
    end

    return nil
end

function e.RightSuggestedIconFrame:Init()
    self:SetFrameStrata(e.MainFrame:GetFrameStrata())
    self:SetFrameLevel(e.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(32)
    self:SetHeight(32)
    self:SetPoint("BOTTOM", e.MainIconFrame, "LEFT", e.LeftIconFrame:GetWidth() / 2, e.LeftIconFrame:GetHeight() / 2 + (e.GUISettings.General.BlackBorderIcon and 3 or 4))
    self.Texture = self:CreateTexture(nil, "BACKGROUND")
    if e.GUISettings.General.BlackBorderIcon then
        self.Texture:SetTexCoord(.08, .92, .08, .92)
        e:CreateBackdrop(self)
    end

    local e = self:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.Keybind = e
    e:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    e:SetAllPoints(true)
    e:SetJustifyH("RIGHT")
    e:SetJustifyV("TOP")
    e:SetPoint("TOPRIGHT")
    e:SetTextColor(.8, .8, .8, 1)
    e:SetText("")
    self:Show()
end

function e.RightSuggestedIconFrame:ChangeIcon(a, t, o, i)
    self.ID = i
    self.Texture:SetTexture(a)
    self.Texture:SetAllPoints(self)
    if o then
        self.Texture:SetVertexColor(1., .5, .5)
    else
        self.Texture:SetVertexColor(1., 1., 1.)
    end

    if e.GUISettings.General.BlackBorderIcon and not self.Backdrop:IsVisible() then
        self.Backdrop:Show()
    end

    if t then
        self.Keybind:SetText(t)
        self.Keybind:SetScale(e.GUISettings.Scaling.ScaleHotkey * .85)
    else
        self.Keybind:SetText("")
    end

    self:SetAlpha(e.GUISettings.General.SetAlpha)
    if not self:IsVisible() then
        self:Show()
    end

end

function e.RightSuggestedIconFrame:HideIcon()
    self.ID = nil
    e.RightSuggestedIconFrame:Hide()
end

function e.RightSuggestedIconFrame:getIconID()
    if self.ID then
        return self.ID
    end

    return nil
end

function e.ToggleIconFrame:Init()
    self:SetFrameStrata(e.MainFrame:GetFrameStrata())
    self:SetFrameLevel(e.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(64)
    self:SetHeight(20)
    if HeroRotationDB and HeroRotationDB.ButtonsFramePos and type(HeroRotationDB.ButtonsFramePos[2]) ~= "string" then
        self:ResetAnchor()
    end

    if HeroRotationDB and HeroRotationDB.ButtonsFramePos then
        self:SetPoint(HeroRotationDB.ButtonsFramePos[1], _G[HeroRotationDB.ButtonsFramePos[2]], HeroRotationDB.ButtonsFramePos[3], HeroRotationDB.ButtonsFramePos[4], HeroRotationDB.ButtonsFramePos[5])
    else
        self:SetPoint("TOPLEFT", e.MainIconFrame, "BOTTOMLEFT", 0, e.GUISettings.General.BlackBorderIcon and -3 or 0)
    end

    local function e(e)
        e:StartMoving()
    end

    self:SetScript("OnMouseDown", e)
    local function h(s)
        s:StopMovingOrSizing()
        if not HeroRotationDB then
            HeroRotationDB = {  }
        end

        local a, e, o, i, n, t
        a, e, o, i, n = s:GetPoint()
        if not e then
            t = "UIParent"
        else
            t = e:GetName()
        end

        HeroRotationDB.ButtonsFramePos = { a, t, o, i, n }
    end

    self:SetScript("OnMouseUp", h)
    self:SetScript("OnHide", h)
    self:Show()
    self.Button = {  }
    self:AddButton("CDs", 1, "CDs", "cds")
    self:AddButton("AoE", 2, "AoE", "aoe")
    self:AddButton("On", 3, "On/Off", "toggle")
    self:AddButton("Cov", 4, "Covenants", "covenants")
    self:AddButton("SCd", 5, "SmallCDs", "smallcds")
    self:AddButton("Open", 6, "Opener", "opener")
end

function e.ToggleIconFrame:ResetAnchor()
    self:SetPoint("TOPLEFT", e.MainIconFrame, "BOTTOMLEFT", 0, e.GUISettings.General.BlackBorderIcon and -3 or 0)
    HeroRotationDB.ButtonsFramePos = false
end

function e.ToggleIconFrame:AddButton(i, a, o, n)
    local t = CreateFrame("Button", "$parentButton" .. r(a), self)
    t:SetFrameStrata(self:GetFrameStrata())
    t:SetFrameLevel(self:GetFrameLevel() - 1)
    t:SetWidth(20)
    t:SetHeight(20)
    t:SetPoint("LEFT", self, "LEFT", 20 * (a - 1) + a, 0)
    if o then
        t:SetScript("OnEnter", function()
            Mixin(GameTooltip, BackdropTemplateMixin)
            GameTooltip:SetOwner(e.ToggleIconFrame, "ANCHOR_BOTTOM", 0, 0)
            GameTooltip:ClearLines()
            GameTooltip:SetBackdropColor(0, 0, 0, 1)
            GameTooltip:SetText(o, nil, nil, nil, 1, true)
            GameTooltip:Show()
        end)
        t:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end

    t:SetNormalFontObject("GameFontNormalSmall")
    t.text = i
    local o = t:CreateTexture()
    o:SetTexture("Interface/Buttons/UI-Silver-Button-Up")
    o:SetTexCoord(0, .625, 0, .7875)
    o:SetAllPoints()
    t:SetNormalTexture(o)
    local o = t:CreateTexture()
    o:SetTexture("Interface/Buttons/UI-Silver-Button-Highlight")
    o:SetTexCoord(0, .625, 0, .7875)
    o:SetAllPoints()
    t:SetHighlightTexture(o)
    local o = t:CreateTexture()
    o:SetTexture("Interface/Buttons/UI-Silver-Button-Down")
    o:SetTexCoord(0, .625, 0, .7875)
    o:SetAllPoints()
    t:SetPushedTexture(o)
    if type(HeroRotationCharDB) ~= "table" then
        HeroRotationCharDB = {  }
    end

    if type(HeroRotationCharDB.Toggles) ~= "table" then
        HeroRotationCharDB.Toggles = {  }
    end

    if type(HeroRotationCharDB.Toggles[a]) ~= "boolean" then
        HeroRotationCharDB.Toggles[a] = true
    end

    t:SetScript("OnMouseDown", function(a, t)
        if t == "LeftButton" then
            e.CmdHandler(n)
        end

    end)
    self.Button[a] = t
    e.ToggleIconFrame:UpdateButtonText(a)
    t:Show()
end

function e.ToggleIconFrame:UpdateButtonText(e)
    if HeroRotationCharDB.Toggles[e] then
        self.Button[e]:SetFormattedText("|cff00ff00%s|r", self.Button[e].text)
    else
        self.Button[e]:SetFormattedText("|cffff0000%s|r", self.Button[e].text)
    end

end


