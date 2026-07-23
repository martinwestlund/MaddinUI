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

    local data = MaddinUI.profileData and MaddinUI.profileData.Details
    if type(data) ~= "table" or type(data.profile) ~= "table" then
        MaddinUI.Debug("Details: no bundled saved profile table found; skipped profile write.")
        return false
    end

    local profileName = data.profileName or MaddinUI.profiles.Details.profileName or "MaddinUI"

    _detalhes_global = _detalhes_global or {}
    _detalhes_global.__profiles = _detalhes_global.__profiles or {}
    _detalhes_global.__profiles[profileName] = MaddinUI.CopyTable(data.profile, {})

    if type(details.ApplyProfile) == "function" then
        local ok, result = pcall(details.ApplyProfile, details, profileName)
        if not ok then
            MaddinUI.Debug("Details: ApplyProfile failed with Lua error: " .. tostring(result) .. ".")
            return false
        end
    else
        MaddinUI.Debug("Details: ApplyProfile API was not found; profile was saved but not applied immediately.")
    end

    MaddinUI.Debug("Details: wrote and applied profile " .. tostring(profileName) .. ". Reload UI is recommended.")
    MaddinUI.MarkInstallerStepComplete("details")
    return true
end
