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

local function ImportElvUIString(E, profileType, importString)
    if type(importString) ~= "string" or importString == "" then
        MaddinUI.Debug("ElvUI: no bundled " .. tostring(profileType) .. " import string found; skipped profile import.")
        return false
    end

    if not E.GetModule then
        MaddinUI.Debug("ElvUI: E:GetModule is unavailable; skipped profile import.")
        return false
    end

    local distributor = E:GetModule("Distributor")
    if not distributor or type(distributor.ImportProfile) ~= "function" then
        MaddinUI.Debug("ElvUI: Distributor:ImportProfile is unavailable; skipped profile import.")
        return false
    end

    local ok, result = pcall(distributor.ImportProfile, distributor, importString)
    if not ok then
        MaddinUI.Debug("ElvUI: import failed with Lua error: " .. tostring(result) .. ".")
        return false
    end

    if result then
        MaddinUI.Debug("ElvUI: imported " .. tostring(profileType) .. " profile string. Reload UI is recommended.")
        MaddinUI.MarkInstallerStepComplete("elvui")
        return true
    end

    MaddinUI.Debug("ElvUI: import did not complete. If the profile already exists, accept ElvUI's overwrite prompt or rename it.")
    return false
end

function MaddinUI.ApplyElvUIProfile(profileType)
    local scale = MaddinUI.profiles.ElvUI and MaddinUI.profiles.ElvUI.uiScale or "0.5333333"
    local importString = MaddinUI.profileData and MaddinUI.profileData.ElvUI and MaddinUI.profileData.ElvUI[profileType]
    local E = GetElvUIEngine()

    MaddinUI.Debug("ElvUI: requested profile " .. tostring(profileType) .. ".")

    if not E then
        SetUIScale(scale, nil)
        MaddinUI.Debug("ElvUI: global ElvUI engine was not found. Is ElvUI enabled and loaded?")
        return false
    end

    MaddinUI.Debug("ElvUI: detected engine version " .. tostring(E.version or E.Version or "unknown") .. ".")

    SetUIScale(scale, E)
    RefreshElvUIScale(E)

    return ImportElvUIString(E, profileType, importString)
end
