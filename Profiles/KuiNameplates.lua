local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

MaddinUI.profiles = MaddinUI.profiles or {}
MaddinUI.profiles.KuiNameplates = MaddinUI.profiles.KuiNameplates or {
    profileName = "MaddinUI",
}

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

local function TryRuntimeSetProfile(profileName)
    local kui = _G.KuiNameplates or _G.KuiNameplatesCore
    if not kui then
        return false
    end

    local db = kui.db or kui.dbg or kui.DB
    if type(db) == "table" and type(db.SetProfile) == "function" then
        local ok, err = pcall(db.SetProfile, db, profileName)
        if ok then
            MaddinUI.Debug("KuiNameplates: called runtime AceDB SetProfile for " .. tostring(profileName) .. ".")
            return true
        end

        MaddinUI.Debug("KuiNameplates: runtime SetProfile failed: " .. tostring(err) .. ".")
    end

    return false
end

function MaddinUI.ApplyKuiNameplatesProfile()
    MaddinUI.Debug("KuiNameplates: requested profile load.")

    local data = MaddinUI.profileData and MaddinUI.profileData.KuiNameplates
    if type(data) ~= "table" or type(data.profile) ~= "table" then
        MaddinUI.Debug("KuiNameplates: no bundled profile payload found; skipped profile DB write.")
        return false
    end

    local profileName = data.profileName or MaddinUI.profiles.KuiNameplates.profileName or "MaddinUI"
    local characterKey = GetCharacterKey()

    if type(KuiNameplatesGDB) ~= "table" then
        KuiNameplatesGDB = {}
    end

    KuiNameplatesGDB.profiles = KuiNameplatesGDB.profiles or {}
    KuiNameplatesGDB.profileKeys = KuiNameplatesGDB.profileKeys or {}
    KuiNameplatesGDB.namespaces = KuiNameplatesGDB.namespaces or {}

    KuiNameplatesGDB.profiles[profileName] = MaddinUI.CopyTable(data.profile, {})

    if type(data.namespaces) == "table" then
        for namespaceName, namespaceProfile in pairs(data.namespaces) do
            KuiNameplatesGDB.namespaces[namespaceName] = KuiNameplatesGDB.namespaces[namespaceName] or {}
            KuiNameplatesGDB.namespaces[namespaceName].profiles = KuiNameplatesGDB.namespaces[namespaceName].profiles or {}
            KuiNameplatesGDB.namespaces[namespaceName].profiles[profileName] = MaddinUI.CopyTable(namespaceProfile, {})
        end
    end

    if characterKey then
        KuiNameplatesGDB.profileKeys[characterKey] = profileName
        MaddinUI.Debug("KuiNameplates: assigned profile " .. tostring(profileName) .. " to this character.")
    else
        MaddinUI.Debug("KuiNameplates: could not determine character key; profile was saved but not assigned.")
    end

    if not TryRuntimeSetProfile(profileName) then
        MaddinUI.Debug("KuiNameplates: saved profile data. Reload UI is recommended before judging nameplate changes.")
    end

    MaddinUI.MarkInstallerStepComplete("kui")
    return true
end
