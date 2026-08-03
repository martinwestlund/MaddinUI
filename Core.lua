local ADDON_NAME = "MaddinUI"
local MaddinUI = _G.MaddinUI or {}
_G.MaddinUI = MaddinUI

MaddinUI.name = ADDON_NAME
MaddinUI.version = "0.1.2"
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

function MaddinUI.PrepareSmoothFirstRun()
    local E = GetElvUIEngine()

    if E then
        E.private = E.private or {}
        E.private.nameplates = E.private.nameplates or {}
        E.private.nameplates.enable = false

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

        local characterKey = GetCharacterKey() or "account"
        MaddinUIDB.installer.autoShown = MaddinUIDB.installer.autoShown or {}
        if not MaddinUIDB.installer.autoShown[characterKey] then
            MaddinUIDB.installer.autoShown[characterKey] = true
            MaddinUI.OpenInstaller()
        end

        self:UnregisterEvent("PLAYER_LOGIN")
    end
end)
