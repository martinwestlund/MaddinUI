local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

MaddinUI.profiles = MaddinUI.profiles or {}
MaddinUI.profiles.KuiNameplates = MaddinUI.profiles.KuiNameplates or {
    profile = nil,
}

function MaddinUI.ApplyKuiNameplatesProfile()
    MaddinUI.Debug("KuiNameplates: requested profile load.")

    local kui = _G.KuiNameplates or _G.KuiNameplatesCore
    if kui then
        MaddinUI.Debug("KuiNameplates: detected addon global.")
    elseif type(KuiNameplatesGDB) == "table" then
        MaddinUI.Debug("KuiNameplates: detected saved-variable table KuiNameplatesGDB.")
    else
        MaddinUI.Debug("KuiNameplates: addon global/database was not found. Is Kui_Nameplates enabled and loaded?")
        return false
    end

    if type(MaddinUI.profiles.KuiNameplates.profile) ~= "table" then
        MaddinUI.Debug("KuiNameplates: no bundled profile payload yet; skipped profile DB write.")
        return false
    end

    MaddinUI.Debug("KuiNameplates: profile payload exists, but AceDB profile application needs final verification before enabling.")
    return false
end
