local ADDON_NAME = "MaddinUI"
local MaddinUI = _G.MaddinUI or {}
_G.MaddinUI = MaddinUI

MaddinUI.name = ADDON_NAME
MaddinUI.version = "0.1.0"
MaddinUI.profiles = MaddinUI.profiles or {}

local DEFAULT_DB = {
    profileVersion = 1,
    installer = {
        currentStep = 1,
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
        MaddinUI.installerFrame:ShowPage(MaddinUIDB and MaddinUIDB.installer and MaddinUIDB.installer.currentStep or 1)
    else
        MaddinUI.Debug("Installer is not loaded yet.")
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if event ~= "ADDON_LOADED" or addonName ~= ADDON_NAME then
        return
    end

    MaddinUIDB = CopyDefaults(DEFAULT_DB, MaddinUIDB)

    SLASH_MADDINUI1 = "/maddinui"
    SLASH_MADDINUI2 = "/mui"
    SlashCmdList.MADDINUI = function()
        MaddinUI.OpenInstaller()
    end

    MaddinUI.Debug("Loaded. Type /maddinui to open the installer.")

    self:UnregisterEvent("ADDON_LOADED")
end)
