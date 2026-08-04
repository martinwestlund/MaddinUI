local ADDON_NAME = "MaddinUI"
local MaddinUI = _G.MaddinUI or {}
_G.MaddinUI = MaddinUI

MaddinUI.name = ADDON_NAME
MaddinUI.version = "0.1.6"
MaddinUI.profiles = MaddinUI.profiles or {}

local DEFAULT_DB = {
    profileVersion = 1,
    installer = {
        autoShown = {},
        completed = {},
    },
}

local function CopyDefaults(defaults, target)
    if type(target) ~= "table" then
        target = {}
    end

    for key, value in pairs(defaults) do
        if type(value) == "table" then
            target[key] = CopyDefaults(value, target[key])
        elseif target[key] == nil then
            target[key] = value
        end
    end

    return target
end

function MaddinUI.Debug(message)
    if DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99MaddinUI|r " .. tostring(message))
    end
end

function MaddinUI.CopyTable(source, target)
    if type(target) ~= "table" then
        target = {}
    end

    if type(source) ~= "table" then
        return target
    end

    for key, value in pairs(source) do
        if type(value) == "table" then
            target[key] = MaddinUI.CopyTable(value, target[key])
        else
            target[key] = value
        end
    end

    return target
end

local function GetElvUIEngine()
    if type(_G.ElvUI) == "table" then
        return unpack(_G.ElvUI)
    end

    return nil
end

local function GetCharacterKey()
    if not UnitName then
        return nil
    end

    local name = UnitName("player")
    if type(name) ~= "string" or name == "" then
        return nil
    end

    local realm = nil
    if GetRealmName then
        realm = GetRealmName()
    end

    if type(realm) == "string" and realm ~= "" then
        return name .. " - " .. realm
    end

    return name
end

local function GetElvPrivateProfileName()
    local characterKey = GetCharacterKey()

    if type(ElvPrivateDB) == "table" and type(ElvPrivateDB.profileKeys) == "table" and characterKey then
        local profileName = ElvPrivateDB.profileKeys[characterKey]
        if type(profileName) == "string" and profileName ~= "" then
            return profileName
        end
    end

    return characterKey or "Default"
end

local function DisableElvUINameplatesAndGroupFrames(db)
    if type(db) ~= "table" then
        return
    end

    db.nameplates = db.nameplates or {}
    db.nameplates.enable = false

    db.unitframe = db.unitframe or {}
    local unitframe = db.unitframe
    unitframe.disabledBlizzardFrames = unitframe.disabledBlizzardFrames or {}
    unitframe.disabledBlizzardFrames.party = true
    unitframe.disabledBlizzardFrames.raid = true

    unitframe.units = unitframe.units or {}
    unitframe.units.party = unitframe.units.party or {}
    unitframe.units.party.enable = false
    unitframe.units.raid = unitframe.units.raid or {}
    unitframe.units.raid.enable = false
    unitframe.units.raid2 = unitframe.units.raid2 or {}
    unitframe.units.raid2.enable = false
    unitframe.units.raid40 = unitframe.units.raid40 or {}
    unitframe.units.raid40.enable = false
end

local function EnsureElvPrivateProfile()
    ElvPrivateDB = ElvPrivateDB or {}
    ElvPrivateDB.profiles = ElvPrivateDB.profiles or {}

    local profileName = GetElvPrivateProfileName()
    ElvPrivateDB.profiles[profileName] = ElvPrivateDB.profiles[profileName] or {}

    local characterKey = GetCharacterKey()
    if characterKey then
        ElvPrivateDB.profileKeys = ElvPrivateDB.profileKeys or {}
        ElvPrivateDB.profileKeys[characterKey] = ElvPrivateDB.profileKeys[characterKey] or profileName
    end

    return ElvPrivateDB.profiles[profileName]
end

local function HideFrameByName(frameName)
    local frame = _G[frameName]
    if frame and frame.Hide then
        frame:Hide()
    end
end

function MaddinUI.SuppressAddonFirstRunPopups()
    local E = GetElvUIEngine()
    if E then
        E.db = E.db or {}
        E.db.hideTutorial = true
        E.private = E.private or {}
        E.private.install_complete = E.version or E.private.install_complete or true

        if E.TutorialFrame and E.TutorialFrame.Hide then
            E.TutorialFrame:Hide()
        end
        HideFrameByName("ElvUITutorialWindow")
        if E.StaticPopup_Hide then
            E:StaticPopup_Hide("INCOMPATIBLE_ADDON")
        end
    end

    if type(_G.CellDB) == "table" then
        CellDB.firstRun = false
        if type(_G.Cell) == "table" and Cell.version then
            CellDB.changelogsViewed = Cell.version
        elseif CellDB.revise then
            CellDB.changelogsViewed = CellDB.revise
        end
    end

    local Details = _G.Details or _G._detalhes
    if type(Details) == "table" then
        Details.auto_open_news_window = false
        Details.is_first_run = false
        Details.is_version_first_run = false
        if Details.last_changelog_size == nil and type(_G.Loc) == "table" and type(_G.Loc.STRING_VERSION_LOG) == "string" then
            Details.last_changelog_size = string.len(_G.Loc.STRING_VERSION_LOG)
        end
    end

    HideFrameByName("CellChangelogsFrame")
    HideFrameByName("ElvUITutorialWindow")
    HideFrameByName("DetailsNewsWindow")
    HideFrameByName("DetailsWelcomeWindow")
    HideFrameByName("ElvUI_TutorialFrame")
end

local popupSuppressFrame = CreateFrame("Frame")
popupSuppressFrame.elapsed = 0
popupSuppressFrame.tries = 0
popupSuppressFrame:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = (self.elapsed or 0) + (elapsed or 0)
    if self.elapsed < 0.5 then
        return
    end

    self.elapsed = 0
    self.tries = (self.tries or 0) + 1
    MaddinUI.SuppressAddonFirstRunPopups()

    if self.tries >= 30 then
        self:Hide()
    end
end)
popupSuppressFrame:Hide()

function MaddinUI.PrepareSmoothFirstRun()
    local E = GetElvUIEngine()

    MaddinUI.SuppressAddonFirstRunPopups()
    popupSuppressFrame.tries = 0
    popupSuppressFrame:Show()

    if E then
        E.private = E.private or {}
        E.private.nameplates = E.private.nameplates or {}
        E.private.nameplates.enable = false
        DisableElvUINameplatesAndGroupFrames(E.private)
        DisableElvUINameplatesAndGroupFrames(E.db)

        if E.version then
            E.private.install_complete = E.version
        else
            E.private.install_complete = true
        end

        if E.StaticPopup_Hide then
            E:StaticPopup_Hide("INCOMPATIBLE_ADDON")
        end
    end

    local privateProfile = EnsureElvPrivateProfile()
    privateProfile.nameplates = privateProfile.nameplates or {}
    privateProfile.nameplates.enable = false
    DisableElvUINameplatesAndGroupFrames(privateProfile)
    privateProfile.install_complete = (E and E.version) or privateProfile.install_complete or true
end

function MaddinUI.MarkInstallerStepComplete(stepKey)
    if not MaddinUIDB then
        return
    end

    MaddinUIDB.installer = MaddinUIDB.installer or {}
    MaddinUIDB.installer.completed = MaddinUIDB.installer.completed or {}
    MaddinUIDB.installer.completed[stepKey] = true
end

function MaddinUI.OpenInstaller()
    if MaddinUI.installerFrame and MaddinUI.installerFrame.ShowPage then
        MaddinUI.installerFrame:Show()
        MaddinUI.installerFrame:ShowPage(1)
    else
        MaddinUI.Debug("Installer is not loaded yet.")
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" and addonName == ADDON_NAME then
        MaddinUIDB = CopyDefaults(DEFAULT_DB, MaddinUIDB)
        MaddinUIDB.installer.currentStep = nil
        MaddinUIDB.installer.autoShown = MaddinUIDB.installer.autoShown or {}
        MaddinUI.PrepareSmoothFirstRun()
        MaddinUI.SuppressAddonFirstRunPopups()

        SLASH_MADDINUI1 = "/maddinui"
        SLASH_MADDINUI2 = "/mui"
        SlashCmdList.MADDINUI = function()
            MaddinUI.OpenInstaller()
        end

        MaddinUI.Debug("Loaded. Type /maddinui to open the installer.")

        self:RegisterEvent("PLAYER_LOGIN")
        self:UnregisterEvent("ADDON_LOADED")
    elseif event == "PLAYER_LOGIN" then
        MaddinUIDB = CopyDefaults(DEFAULT_DB, MaddinUIDB)
        MaddinUIDB.installer.currentStep = nil
        MaddinUI.PrepareSmoothFirstRun()
        MaddinUI.SuppressAddonFirstRunPopups()

        local characterKey = GetCharacterKey() or "account"
        MaddinUIDB.installer.autoShown = MaddinUIDB.installer.autoShown or {}
        if not MaddinUIDB.installer.autoShown[characterKey] then
            MaddinUIDB.installer.autoShown[characterKey] = true
            MaddinUI.OpenInstaller()
        end

        self:UnregisterEvent("PLAYER_LOGIN")
    end
end)
