local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

MaddinUI.profiles = MaddinUI.profiles or {}
MaddinUI.profiles.ElvUI = MaddinUI.profiles.ElvUI or {
    uiScale = "0.5333333",
    healer = nil,
    dpsTank = nil,
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

local function GetCharacterProfileKey(E)
    if E and E.myname and E.myrealm then
        return E.myname .. " - " .. E.myrealm
    end

    if UnitName and GetRealmName then
        local name = UnitName("player")
        local realm = GetRealmName()
        if name and realm then
            return name .. " - " .. realm
        end
    end

    return nil
end

function MaddinUI.ApplyElvUIProfile(profileType)
    local profileData = MaddinUI.profiles.ElvUI and MaddinUI.profiles.ElvUI[profileType]
    local profileName = profileType == "healer" and "MaddinUI Healer" or "MaddinUI DPS-Tank"
    local scale = MaddinUI.profiles.ElvUI and MaddinUI.profiles.ElvUI.uiScale or "0.5333333"
    local E = GetElvUIEngine()

    MaddinUI.Debug("ElvUI: requested profile " .. tostring(profileType) .. ".")

    if not E then
        SetUIScale(scale, nil)
        MaddinUI.Debug("ElvUI: global ElvUI engine was not found. Is ElvUI enabled and loaded?")
        return false
    end

    MaddinUI.Debug("ElvUI: detected engine version " .. tostring(E.version or E.Version or "unknown") .. ".")

    SetUIScale(scale, E)

    if E.PixelScaleChanged then
        E:PixelScaleChanged(nil, true)
        MaddinUI.Debug("ElvUI: called E:PixelScaleChanged(nil, true).")
    elseif E.UIScale then
        E:UIScale(true)
        E:UIScale()
        MaddinUI.Debug("ElvUI: called E:UIScale(true) and E:UIScale().")
    end

    if type(profileData) ~= "table" then
        MaddinUI.Debug("ElvUI: no bundled " .. tostring(profileType) .. " profile payload yet; skipped profile DB write.")
        MaddinUI.Debug("ElvUI: if the visible scale did not update immediately, reload UI to force frame recalculation.")
        MaddinUI.MarkInstallerStepComplete("elvui-scale")
        return false
    end

    ElvDB = ElvDB or {}
    ElvDB.profiles = ElvDB.profiles or {}
    ElvDB.profileKeys = ElvDB.profileKeys or {}

    ElvDB.profiles[profileName] = MaddinUI.CopyTable(profileData, {})

    local characterKey = GetCharacterProfileKey(E)
    if characterKey then
        ElvDB.profileKeys[characterKey] = profileName
        MaddinUI.Debug("ElvUI: assigned profile " .. profileName .. " to " .. characterKey .. ".")
    else
        MaddinUI.Debug("ElvUI: could not determine character profile key; profile payload was stored only.")
    end

    if E.db then
        MaddinUI.CopyTable(profileData, E.db)
        MaddinUI.Debug("ElvUI: copied payload into active E.db. Reload UI is recommended.")
    end

    MaddinUI.MarkInstallerStepComplete("elvui")
    return true
end
