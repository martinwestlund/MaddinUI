local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

MaddinUI.profiles = MaddinUI.profiles or {}
MaddinUI.profiles.Details = MaddinUI.profiles.Details or {
    profileName = "MaddinUI",
}

function MaddinUI.ApplyDetailsProfile()
    MaddinUI.Debug("Details: requested profile load.")

    local details = _G.Details or _G._detalhes
    if not details then
        MaddinUI.Debug("Details: addon global was not found. Is Details installed and enabled?")
        return false
    end

    if type(details.ImportProfile) ~= "function" then
        MaddinUI.Debug("Details: ImportProfile API was not found in this runtime.")
        return false
    end

    local profileString = MaddinUI.profileData and MaddinUI.profileData.Details and MaddinUI.profileData.Details.profile
    if type(profileString) ~= "string" or profileString == "" then
        MaddinUI.Debug("Details: no bundled profile string found; skipped profile import.")
        return false
    end

    local profileName = MaddinUI.profiles.Details.profileName or "MaddinUI"
    local importAutoRunCode = false
    local isFromImportPrompt = true
    local overwriteExisting = true

    local ok, result = pcall(details.ImportProfile, details, profileString, profileName, importAutoRunCode, isFromImportPrompt, overwriteExisting)
    if not ok then
        MaddinUI.Debug("Details: import failed with Lua error: " .. tostring(result) .. ".")
        return false
    end

    if result then
        MaddinUI.Debug("Details: imported and applied profile " .. tostring(profileName) .. ".")
        MaddinUI.MarkInstallerStepComplete("details")
        return true
    end

    MaddinUI.Debug("Details: import did not complete; check Details chat/error output.")
    return false
end
