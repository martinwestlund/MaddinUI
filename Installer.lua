local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

local EXPRESSWAY_FONT = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf"

local PAGES = {
    {
        key = "landing",
        title = "Welcome to MaddinUI",
        body = "This installer will guide you through MaddinUI setup one addon at a time. Use /maddinui or /mui to reopen it.",
        instruction = "Press the button to begin the MaddinUI setup.",
    },
    {
        key = "elvui",
        title = "Step 1: ElvUI",
        body = "Choose the MaddinUI ElvUI layout for this character. The button also sets the configured UI scale and prints debug output.",
        instruction = "Press the button to import the ElvUI profile.",
    },
    {
        key = "details",
        title = "Step 2: Details",
        body = "Load the MaddinUI Details profile once a Details profile payload is bundled.",
        instruction = "Press the button to import the Details profile.",
    },
    {
        key = "kui",
        title = "Step 3: KuiNameplates",
        body = "Load the MaddinUI KuiNameplates profile once a KuiNameplates profile payload is bundled.",
        instruction = "Press the button to import the KuiNameplates profile.",
    },
    {
        key = "weakauras",
        title = "Step 4: WeakAuras",
        body = "Replace your current WeakAuras with the bundled MaddinUI set. This is intended to make the WeakAuras match the current MaddinUI release exactly.",
        instruction = "Press the button to import the WeakAuras profile.",
    },
    {
        key = "finish",
        title = "Finish",
        body = "Setup steps are wired. Reload UI after applying profile payloads so addon databases and frames refresh cleanly.",
        instruction = "Press the button to reload your UI and finish setup.",
    },
}

local function GetClassColor()
    local className = nil
    if UnitClass then
        _, className = UnitClass("player")
    end

    local color = className and RAID_CLASS_COLORS and RAID_CLASS_COLORS[className]
    if color then
        return color.r or 1, color.g or 1, color.b or 1
    end

    return 0.33, 0.82, 1
end

local function ApplyFont(fontString, size, r, g, b, a)
    if fontString.SetFont then
        fontString:SetFont(EXPRESSWAY_FONT, size or 14, "OUTLINE")
    end
    if fontString.SetTextColor then
        fontString:SetTextColor(r or 1, g or 1, b or 1, a or 1)
    end
end

local function SetFrameBackdrop(frame, bgR, bgG, bgB, bgA, edgeR, edgeG, edgeB, edgeA)
    if not frame.SetBackdrop then
        return
    end

    frame:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        tile = false,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 },
    })
    frame:SetBackdropColor(bgR or 0, bgG or 0, bgB or 0, bgA or 1)
    frame:SetBackdropBorderColor(edgeR or 0, edgeG or 0, edgeB or 0, edgeA or 1)
end

local function StyleButton(button)
    local r, g, b = GetClassColor()
    button.accentR = r
    button.accentG = g
    button.accentB = b
    button.isHovering = false

    SetFrameBackdrop(button, 0.025, 0.025, 0.025, 1, 0.12, 0.12, 0.12, 1)

    button.text = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    button.text:SetPoint("CENTER", button, "CENTER", 0, 0)
    ApplyFont(button.text, 13, 1, 1, 1, 1)

    button:SetHighlightTexture("")
    button:SetPushedTexture("")
    button:SetDisabledTexture("")

    button:SetScript("OnEnter", function(self)
        self.isHovering = true
        if self:IsEnabled() then
            self:SetBackdropBorderColor(self.accentR, self.accentG, self.accentB, 1)
            self.text:SetTextColor(self.accentR, self.accentG, self.accentB, 1)
        end
    end)
    button:SetScript("OnLeave", function(self)
        self.isHovering = false
        if self:IsEnabled() then
            self:SetBackdropBorderColor(0.12, 0.12, 0.12, 1)
            self.text:SetTextColor(1, 1, 1, 1)
        end
    end)
    button:SetScript("OnMouseDown", function(self)
        if self:IsEnabled() then
            self:SetBackdropColor(0.07, 0.07, 0.07, 1)
        end
    end)
    button:SetScript("OnMouseUp", function(self)
        if self:IsEnabled() then
            self:SetBackdropColor(0.025, 0.025, 0.025, 1)
        end
    end)
end

local function SetButtonText(button, text)
    if button.text then
        button.text:SetText(text or "")
    end
end

local function SetButtonEnabled(button, enabled)
    if enabled then
        button:Enable()
        button:SetAlpha(1)
        button:SetBackdropColor(0.025, 0.025, 0.025, 1)
        if button.isHovering then
            button:SetBackdropBorderColor(button.accentR, button.accentG, button.accentB, 1)
            button.text:SetTextColor(button.accentR, button.accentG, button.accentB, 1)
        else
            button:SetBackdropBorderColor(0.12, 0.12, 0.12, 1)
            button.text:SetTextColor(1, 1, 1, 1)
        end
    else
        button:Disable()
        button:SetAlpha(0.45)
        button:SetBackdropColor(0.015, 0.015, 0.015, 1)
        button:SetBackdropBorderColor(0.06, 0.06, 0.06, 1)
        button.text:SetTextColor(0.45, 0.45, 0.45, 1)
    end
end

local function CreateButton(parent, text, width, height, point, relativeTo, relativePoint, x, y, onClick)
    local button = CreateFrame("Button", nil, parent)
    button:SetWidth(width or 120)
    button:SetHeight(height or 24)
    button:SetPoint(point, relativeTo or parent, relativePoint or point, x or 0, y or 0)
    StyleButton(button)
    SetButtonText(button, text)
    button:SetScript("OnClick", onClick)
    return button
end

local function CreateText(parent, font, point, relativeTo, relativePoint, x, y, width, justify, size, r, g, b)
    local text = parent:CreateFontString(nil, "ARTWORK", font)
    text:SetPoint(point, relativeTo or parent, relativePoint or point, x or 0, y or 0)
    text:SetWidth(width or 420)
    text:SetJustifyH(justify or "LEFT")
    ApplyFont(text, size or 14, r or 0.88, g or 0.88, b or 0.88, 1)
    return text
end

local function HidePageControls(frame)
    local controls = frame.pageControls
    if not controls then
        return
    end

    for _, control in ipairs(controls) do
        control:Hide()
    end
end

local function AddPageControl(frame, control)
    frame.pageControls = frame.pageControls or {}
    table.insert(frame.pageControls, control)
    return control
end

local function BuildPageControls(frame, page)
    HidePageControls(frame)
    frame.pageControls = {}

    if page.key == "landing" then
        AddPageControl(frame, CreateButton(frame, "Start", 150, 30, "TOP", frame.instruction, "BOTTOM", 0, -18, function()
            frame:ShowPage(2)
        end))
    elseif page.key == "elvui" then
        AddPageControl(frame, CreateButton(frame, "Apply DPS/Tank", 160, 30, "TOP", frame.instruction, "BOTTOM", -88, -18, function()
            MaddinUI.ApplyElvUIProfile("dpsTank")
        end))
        AddPageControl(frame, CreateButton(frame, "Apply Healer", 160, 30, "TOP", frame.instruction, "BOTTOM", 88, -18, function()
            MaddinUI.ApplyElvUIProfile("healer")
        end))
    elseif page.key == "details" then
        AddPageControl(frame, CreateButton(frame, "Load Details", 160, 30, "TOP", frame.instruction, "BOTTOM", 0, -18, function()
            MaddinUI.ApplyDetailsProfile()
        end))
    elseif page.key == "kui" then
        AddPageControl(frame, CreateButton(frame, "Load KuiNameplates", 190, 30, "TOP", frame.instruction, "BOTTOM", 0, -18, function()
            MaddinUI.ApplyKuiNameplatesProfile()
        end))
    elseif page.key == "weakauras" then
        AddPageControl(frame, CreateButton(frame, "Replace WeakAuras", 200, 30, "TOP", frame.instruction, "BOTTOM", 0, -18, function()
            frame:ShowWeakAurasConfirm()
        end))
        local warning = AddPageControl(frame, CreateText(frame, "GameFontDisableSmall", "TOP", frame.instruction, "BOTTOM", 0, -58, 470, "CENTER", 11, 0.58, 0.58, 0.58))
        warning:SetText("This deletes all WeakAuras you have. If you do not want this, the WeakAuras can be found on Discord or Wago.io. This is to make sure there are no old aura conflicts or performance-degrading auras from other servers or older MaddinUI versions.")
    elseif page.key == "finish" then
        AddPageControl(frame, CreateButton(frame, "Reload UI", 150, 30, "TOP", frame.instruction, "BOTTOM", 0, -18, function()
            if ReloadUI then
                ReloadUI()
            else
                MaddinUI.Debug("ReloadUI is unavailable.")
            end
        end))
    end
end

local function CreateInstaller()
    local accentR, accentG, accentB = GetClassColor()
    local frame = CreateFrame("Frame", "MaddinUIInstallerFrame", UIParent)
    frame:SetWidth(620)
    frame:SetHeight(430)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    frame:SetFrameStrata("DIALOG")
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
    frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

    SetFrameBackdrop(frame, 0, 0, 0, 1, 0, 0, 0, 1)
    frame:SetBackdropColor(0, 0, 0, 1)

    frame.inner = CreateFrame("Frame", nil, frame)
    frame.inner:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -10)
    frame.inner:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -10, 10)
    SetFrameBackdrop(frame.inner, 0, 0, 0, 1, 0.04, 0.04, 0.04, 1)

    local logoSize = 54
    frame.logoMaddin = CreateText(frame, "GameFontNormalLarge", "TOP", frame, "TOP", -40, -38, 250, "RIGHT", logoSize, 1, 1, 1)
    frame.logoMaddin:SetText("Maddin")
    frame.logoUI = CreateText(frame, "GameFontNormalLarge", "LEFT", frame.logoMaddin, "RIGHT", 0, 0, 90, "LEFT", logoSize, accentR, accentG, accentB)
    frame.logoUI:SetText("UI")

    frame.accent = frame:CreateTexture(nil, "ARTWORK")
    frame.accent:SetHeight(1)
    frame.accent:SetPoint("TOPLEFT", frame, "TOPLEFT", 54, -116)
    frame.accent:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -54, -116)
    frame.accent:SetTexture(accentR, accentG, accentB, 0.85)

    frame.title = CreateText(frame, "GameFontNormalLarge", "TOP", frame.accent, "BOTTOM", 0, -24, 500, "CENTER", 18, 1, 1, 1)
    frame.body = CreateText(frame, "GameFontHighlight", "TOP", frame.title, "BOTTOM", 0, -16, 500, "CENTER", 13, 0.72, 0.72, 0.72)
    frame.body:SetJustifyV("TOP")
    frame.instruction = CreateText(frame, "GameFontNormal", "TOP", frame.body, "BOTTOM", 0, -32, 500, "CENTER", 15, accentR, accentG, accentB)

    frame.step = CreateText(frame, "GameFontDisableSmall", "BOTTOMLEFT", frame, "BOTTOMLEFT", 34, 28, 180, "LEFT", 11, 0.45, 0.45, 0.45)

    frame.close = CreateButton(frame, "Close", 86, 26, "BOTTOMRIGHT", frame, "BOTTOMRIGHT", -34, 26, function(self)
        self:GetParent():Hide()
    end)
    frame.previous = CreateButton(frame, "Previous", 96, 26, "BOTTOM", frame, "BOTTOM", -56, 26, function(self)
        local parent = self:GetParent()
        parent:ShowPage((parent.pageIndex or 1) - 1)
    end)
    frame.next = CreateButton(frame, "Next", 96, 26, "BOTTOM", frame, "BOTTOM", 56, 26, function(self)
        local parent = self:GetParent()
        parent:ShowPage((parent.pageIndex or 1) + 1)
    end)

    frame.confirm = CreateFrame("Frame", nil, frame)
    frame.confirm:SetPoint("TOPLEFT", frame, "TOPLEFT", 54, -110)
    frame.confirm:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -54, 78)
    frame.confirm:SetFrameStrata("FULLSCREEN_DIALOG")
    frame.confirm:EnableMouse(true)
    SetFrameBackdrop(frame.confirm, 0, 0, 0, 1, 0.04, 0.04, 0.04, 1)
    frame.confirm:Hide()

    frame.confirm.title = CreateText(frame.confirm, "GameFontNormalLarge", "TOP", frame.confirm, "TOP", 0, -32, 420, "CENTER", 18, accentR, accentG, accentB)
    frame.confirm.title:SetText("Replace WeakAuras?")
    frame.confirm.body = CreateText(frame.confirm, "GameFontHighlight", "TOP", frame.confirm.title, "BOTTOM", 0, -20, 430, "CENTER", 12, 0.72, 0.72, 0.72)
    frame.confirm.body:SetText("This will delete all currently installed WeakAuras and replace them with the bundled MaddinUI WeakAuras. Choose Cancel if you want to keep your existing auras.")

    frame.confirm.cancel = CreateButton(frame.confirm, "Cancel", 110, 28, "BOTTOM", frame.confirm, "BOTTOM", -64, 28, function(self)
        self:GetParent():Hide()
    end)
    frame.confirm.replace = CreateButton(frame.confirm, "Replace", 110, 28, "BOTTOM", frame.confirm, "BOTTOM", 64, 28, function(self)
        self:GetParent():Hide()
        MaddinUI.ReplaceWeakAuras()
    end)

    function frame:ShowWeakAurasConfirm()
        self.confirm:Show()
    end

    function frame:ShowPage(index)
        if index < 1 then
            index = 1
        elseif index > #PAGES then
            index = #PAGES
        end

        self.pageIndex = index

        local page = PAGES[index]
        self.title:SetText(page.title)
        self.body:SetText(page.body)
        self.instruction:SetText(page.instruction or "")
        self.step:SetText(string.format("%02d / %02d", index, #PAGES))

        SetButtonEnabled(self.previous, index ~= 1)
        SetButtonEnabled(self.next, index ~= #PAGES)

        BuildPageControls(self, page)
    end

    frame:Hide()
    frame:ShowPage(1)
    return frame
end

MaddinUI.installerFrame = MaddinUI.installerFrame or CreateInstaller()
