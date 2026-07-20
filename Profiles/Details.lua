local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

MaddinUI.profiles = MaddinUI.profiles or {}
MaddinUI.profiles.Details = MaddinUI.profiles.Details or {
    profile = nil,
}

function MaddinUI.ApplyDetailsProfile()
    MaddinUI.Debug("Details: requested profile load.")

    local details = _G.Details or _G._detalhes
    if not details then
        MaddinUI.Debug("Details: addon global was not found. Is Details installed and enabled?")
        return false
    end

    MaddinUI.Debug("Details: detected addon global.")

    if type(MaddinUI.profiles.Details.profile) ~= "table" then
        MaddinUI.Debug("Details: no bundled profile payload yet; skipped profile DB write.")
        return false
    end

    MaddinUI.Debug("Details: profile payload exists, but Ascension Details DB write path still needs verification before enabling.")
    return false
end
