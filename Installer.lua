local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

local PAGES = {
    {
        key = "landing",
        title = "Welcome to MaddinUI",
        body = "This installer will guide you through MaddinUI setup one addon at a time. Use /maddinui or /mui to reopen it.",
    },
    {
        key = "elvui",
        title = "Step 1: ElvUI",
        body = "Choose the MaddinUI ElvUI layout for this character. The button also sets the configured UI scale and prints debug output.",
    },
    {
        key = "details",
        title = "Step 2: Details",
        body = "Load the MaddinUI Details profile once a Details profile payload is bundled.",
    },
    {
        key = "kui",
        title = "Step 3: KuiNameplates",
        body = "Load the MaddinUI KuiNameplates profile once a KuiNameplates profile payload is bundled.",
    },
    {
        key = "weakauras",
        title = "Step 4: WeakAuras",
        body = "Import bundled MaddinUI WeakAuras once import strings are bundled.",
    },
    {
        key = "finish",
        title = "Finish",
        body = "Setup steps are wired. Reload UI after applying profile payloads so addon databases and frames refresh cleanly.",
    },
}

local function CreateButton(parent, text, width, height, point, relativeTo, relativePoint, x, y, onClick)
    local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    button:SetWidth(width or 120)
    button:SetHeight(height or 24)
    button:SetPoint(point, relativeTo or parent, relativePoint or point, x or 0, y or 0)
    button:SetText(text)
    button:SetScript("OnClick", onClick)
    return button
end

local function CreateText(parent, font, point, relativeTo, relativePoint, x, y, width, justify)
    local text = parent:CreateFontString(nil, "ARTWORK", font)
    text:SetPoint(point, relativeTo or parent, relativePoint or point, x or 0, y or 0)
    text:SetWidth(width or 420)
    text:SetJustifyH(justify or "LEFT")
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

local function SaveCurrentStep(index)
    if MaddinUIDB then
        MaddinUIDB.installer = MaddinUIDB.installer or {}
        MaddinUIDB.installer.currentStep = index
    end
end

local function BuildPageControls(frame, page)
    HidePageControls(frame)
    frame.pageControls = {}

    if page.key == "landing" then
        AddPageControl(frame, CreateButton(frame, "Start", 140, 26, "TOP", frame.body, "BOTTOM", 0, -24, function()
            frame:ShowPage(2)
        end))
    elseif page.key == "elvui" then
        AddPageControl(frame, CreateButton(frame, "Apply DPS/Tank", 150, 26, "TOP", frame.body, "BOTTOM", -82, -24, function()
            MaddinUI.ApplyElvUIProfile("dpsTank")
        end))
        AddPageControl(frame, CreateButton(frame, "Apply Healer", 150, 26, "TOP", frame.body, "BOTTOM", 82, -24, function()
            MaddinUI.ApplyElvUIProfile("healer")
        end))
    elseif page.key == "details" then
        AddPageControl(frame, CreateButton(frame, "Load Details", 150, 26, "TOP", frame.body, "BOTTOM", 0, -24, function()
            MaddinUI.ApplyDetailsProfile()
        end))
    elseif page.key == "kui" then
        AddPageControl(frame, CreateButton(frame, "Load KuiNameplates", 170, 26, "TOP", frame.body, "BOTTOM", 0, -24, function()
            MaddinUI.ApplyKuiNameplatesProfile()
        end))
    elseif page.key == "weakauras" then
        AddPageControl(frame, CreateButton(frame, "Import Essential", 170, 26, "TOP", frame.body, "BOTTOM", 0, -24, function()
            MaddinUI.ApplyWeakAuraPackage("Essential")
        end))
        AddPageControl(frame, CreateButton(frame, "Cultist", 110, 24, "TOP", frame.body, "BOTTOM", -174, -62, function()
            MaddinUI.ApplyWeakAuraPackage("Cultist")
        end))
        AddPageControl(frame, CreateButton(frame, "Felsworn", 110, 24, "TOP", frame.body, "BOTTOM", -58, -62, function()
            MaddinUI.ApplyWeakAuraPackage("Felsworn")
        end))
        AddPageControl(frame, CreateButton(frame, "Pyromancer", 110, 24, "TOP", frame.body, "BOTTOM", 58, -62, function()
            MaddinUI.ApplyWeakAuraPackage("Pyromancer")
        end))
        AddPageControl(frame, CreateButton(frame, "Starcaller", 110, 24, "TOP", frame.body, "BOTTOM", 174, -62, function()
            MaddinUI.ApplyWeakAuraPackage("Starcaller")
        end))
        AddPageControl(frame, CreateButton(frame, "Templar", 110, 24, "TOP", frame.body, "BOTTOM", 0, -96, function()
            MaddinUI.ApplyWeakAuraPackage("Templar")
        end))
    elseif page.key == "finish" then
        AddPageControl(frame, CreateButton(frame, "Reload UI", 140, 26, "TOP", frame.body, "BOTTOM", 0, -24, function()
            if ReloadUI then
                ReloadUI()
            else
                MaddinUI.Debug("ReloadUI is unavailable.")
            end
        end))
    end
end

local function CreateInstaller()
    local frame = CreateFrame("Frame", "MaddinUIInstallerFrame", UIParent)
    frame:SetWidth(520)
    frame:SetHeight(360)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    frame:SetFrameStrata("DIALOG")
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
    frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

    if frame.SetBackdrop then
        frame:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true,
            tileSize = 32,
            edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 },
        })
    end

    frame.title = CreateText(frame, "GameFontNormalLarge", "TOPLEFT", frame, "TOPLEFT", 28, -28, 430)
    frame.body = CreateText(frame, "GameFontHighlight", "TOPLEFT", frame.title, "BOTTOMLEFT", 0, -20, 460)
    frame.body:SetJustifyV("TOP")

    frame.step = CreateText(frame, "GameFontDisableSmall", "BOTTOMLEFT", frame, "BOTTOMLEFT", 28, 28, 180)

    frame.close = CreateButton(frame, "Close", 80, 24, "BOTTOMRIGHT", frame, "BOTTOMRIGHT", -28, 24, function(self)
        self:GetParent():Hide()
    end)
    frame.previous = CreateButton(frame, "Previous", 90, 24, "BOTTOM", frame, "BOTTOM", -52, 24, function(self)
        local parent = self:GetParent()
        parent:ShowPage((parent.pageIndex or 1) - 1)
    end)
    frame.next = CreateButton(frame, "Next", 90, 24, "BOTTOM", frame, "BOTTOM", 52, 24, function(self)
        local parent = self:GetParent()
        parent:ShowPage((parent.pageIndex or 1) + 1)
    end)

    function frame:ShowPage(index)
        if index < 1 then
            index = 1
        elseif index > #PAGES then
            index = #PAGES
        end

        self.pageIndex = index
        SaveCurrentStep(index)

        local page = PAGES[index]
        self.title:SetText(page.title)
        self.body:SetText(page.body)
        self.step:SetText("Page " .. tostring(index) .. " of " .. tostring(#PAGES))

        if index == 1 then
            self.previous:Disable()
        else
            self.previous:Enable()
        end

        if index == #PAGES then
            self.next:Disable()
        else
            self.next:Enable()
        end

        BuildPageControls(self, page)
    end

    frame:Hide()
    frame:ShowPage(MaddinUIDB and MaddinUIDB.installer and MaddinUIDB.installer.currentStep or 1)
    return frame
end

MaddinUI.installerFrame = MaddinUI.installerFrame or CreateInstaller()
