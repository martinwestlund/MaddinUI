local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

MaddinUI.profiles = MaddinUI.profiles or {}
MaddinUI.profiles.WeakAuras = MaddinUI.profiles.WeakAuras or {}

local function ApplyWeakAurasSavedData(data)
    WeakAurasSaved = MaddinUI.CopyTable(data, {})

    WeakAurasSaved.displays = WeakAurasSaved.displays or {}
    WeakAurasSaved.registered = WeakAurasSaved.registered or {}
    WeakAurasSaved.dynamicIconCache = WeakAurasSaved.dynamicIconCache or {}

    if type(_G.WeakAuras) == "table" then
        local weakAuras = _G.WeakAuras
        if type(weakAuras.ScanForLoads) == "function" then
            pcall(weakAuras.ScanForLoads, weakAuras)
        end
        if type(weakAuras.ReloadAll) == "function" then
            pcall(weakAuras.ReloadAll, weakAuras)
        elseif type(weakAuras.LoadDisplays) == "function" then
            pcall(weakAuras.LoadDisplays, weakAuras)
        end
    end
end

function MaddinUI.ReplaceWeakAuras()
    MaddinUI.Debug("WeakAuras: requested full replacement.")

    local data = MaddinUI.profileData and MaddinUI.profileData.WeakAurasSaved
    if type(data) ~= "table" or type(data.displays) ~= "table" then
        MaddinUI.Debug("WeakAuras: bundled saved-variable data was not found; skipped replacement.")
        return false
    end

    ApplyWeakAurasSavedData(data)
    MaddinUI.MarkInstallerStepComplete("weakauras")
    MaddinUI.Debug("WeakAuras: replaced all saved WeakAuras with the bundled MaddinUI set. Reload UI is recommended.")
    return true
end
