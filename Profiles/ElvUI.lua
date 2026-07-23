local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

MaddinUI.profiles = MaddinUI.profiles or {}
MaddinUI.profiles.ElvUI = MaddinUI.profiles.ElvUI or {
    uiScale = "0.5333333",
}

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

local function SetUIScale(scale, E)
    local numericScale = tonumber(scale)

    if SetCVar then
        SetCVar("useUiScale", "1")
        SetCVar("uiScale", tostring(scale))
        MaddinUI.Debug("ElvUI: set CVars useUiScale=1 and uiScale=" .. tostring(scale) .. ".")
    else
        MaddinUI.Debug("ElvUI: SetCVar is unavailable; Blizzard UI scale CVar was not changed.")
    end

    if not numericScale then
        MaddinUI.Debug("ElvUI: scale value is not numeric; skipped ElvUI global scale update.")
        return
    end

    if E then
        E.global = E.global or {}
        E.global.general = E.global.general or {}
        E.global.general.UIScale = numericScale
        MaddinUI.Debug("ElvUI: set E.global.general.UIScale=" .. tostring(numericScale) .. ".")
    end

    ElvDB = ElvDB or {}
    ElvDB.global = ElvDB.global or {}
    ElvDB.global.general = ElvDB.global.general or {}
    ElvDB.global.general.UIScale = numericScale
    MaddinUI.Debug("ElvUI: set ElvDB.global.general.UIScale=" .. tostring(numericScale) .. ".")
end

local function RefreshElvUIScale(E)
    if E.PixelScaleChanged then
        E:PixelScaleChanged(nil, true)
        MaddinUI.Debug("ElvUI: called E:PixelScaleChanged(nil, true).")
    elseif E.UIScale then
        E:UIScale(true)
        E:UIScale()
        MaddinUI.Debug("ElvUI: called E:UIScale(true) and E:UIScale().")
    else
        MaddinUI.Debug("ElvUI: no known scale refresh method was found.")
    end
end

local function ApplyElvUIProfileTable(E, profileType, profileName, profileTable, data)
    if type(profileTable) ~= "table" then
        MaddinUI.Debug("ElvUI: no bundled " .. tostring(profileType) .. " profile table found; skipped profile write.")
        return false
    end

    ElvDB = ElvDB or {}
    ElvDB.profiles = ElvDB.profiles or {}
    ElvDB.profileKeys = ElvDB.profileKeys or {}
    ElvDB.global = ElvDB.global or {}

    ElvDB.profiles[profileName] = MaddinUI.CopyTable(profileTable, {})

    if type(data.global) == "table" then
        ElvDB.global = MaddinUI.CopyTable(data.global, {})
    end

    if type(data.private) == "table" then
        ElvPrivateDB = MaddinUI.CopyTable(data.private, {})
    end

    local characterKey = GetCharacterKey()
    if characterKey then
        ElvDB.profileKeys[characterKey] = profileName
        MaddinUI.Debug("ElvUI: assigned profile " .. tostring(profileName) .. " to this character.")
    else
        MaddinUI.Debug("ElvUI: could not determine character key; profile was saved but not assigned.")
    end

    if E then
        E.db = MaddinUI.CopyTable(profileTable, {})
        if type(ElvDB.global) == "table" then
            E.global = MaddinUI.CopyTable(ElvDB.global, {})
        end
    end

    MaddinUI.Debug("ElvUI: wrote bundled " .. tostring(profileType) .. " profile. Reload UI is recommended.")
    MaddinUI.MarkInstallerStepComplete("elvui")
    return true
end

function MaddinUI.ApplyElvUIProfile(profileType)
    local data = MaddinUI.profileData and MaddinUI.profileData.ElvUI
    local scale = data and data.uiScale or MaddinUI.profiles.ElvUI.uiScale or "0.5333333"
    local E = GetElvUIEngine()

    MaddinUI.Debug("ElvUI: requested profile " .. tostring(profileType) .. ".")

    if not E then
        SetUIScale(scale, nil)
        MaddinUI.Debug("ElvUI: global ElvUI engine was not found. Is ElvUI enabled and loaded?")
        return false
    end

    MaddinUI.Debug("ElvUI: detected engine version " .. tostring(E.version or E.Version or "unknown") .. ".")

    if type(data) ~= "table" then
        MaddinUI.Debug("ElvUI: bundled saved-variable data was not found; skipped profile write.")
        return false
    end

    SetUIScale(scale, E)
    RefreshElvUIScale(E)

    if profileType == "healer" then
        return ApplyElvUIProfileTable(E, profileType, data.healerProfileName or "MaddinUI Healer", data.healer, data)
    end

    return ApplyElvUIProfileTable(E, profileType, data.dpsTankProfileName or "MaddinUI DPS/Tank", data.dpsTank, data)
end
