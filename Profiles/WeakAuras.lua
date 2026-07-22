local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

MaddinUI.profiles = MaddinUI.profiles or {}
MaddinUI.profiles.WeakAuras = MaddinUI.profiles.WeakAuras or {}

local function GetWeakAuraPackage(packageName)
    local packages = MaddinUI.profileData and MaddinUI.profileData.WeakAuras
    if type(packages) ~= "table" then
        return nil
    end

    for _, package in ipairs(packages) do
        if package.name == packageName then
            return package
        end
    end

    return nil
end

local function ImportString(packageName, importString)
    if type(_G.WeakAuras) ~= "table" then
        MaddinUI.Debug("WeakAuras: addon global was not found. Is WeakAuras enabled and loaded?")
        return false
    end

    if type(_G.WeakAuras.Import) ~= "function" then
        MaddinUI.Debug("WeakAuras: WeakAuras.Import is unavailable in this runtime.")
        return false
    end

    if type(importString) ~= "string" or importString == "" then
        MaddinUI.Debug("WeakAuras: no bundled import string found for " .. tostring(packageName) .. ".")
        return false
    end

    local ok, result, err = pcall(_G.WeakAuras.Import, importString)
    if not ok then
        MaddinUI.Debug("WeakAuras: " .. tostring(packageName) .. " import failed with Lua error: " .. tostring(result) .. ".")
        return false
    end

    if result == false or err then
        MaddinUI.Debug("WeakAuras: " .. tostring(packageName) .. " import failed: " .. tostring(err or "unknown error") .. ".")
        return false
    end

    MaddinUI.Debug("WeakAuras: started import for " .. tostring(packageName) .. ". Confirm the WeakAuras import window if prompted.")
    MaddinUI.MarkInstallerStepComplete("weakauras")
    return true
end

function MaddinUI.ApplyWeakAuraPackage(packageName)
    MaddinUI.Debug("WeakAuras: requested package " .. tostring(packageName) .. ".")

    local package = GetWeakAuraPackage(packageName)
    if not package then
        MaddinUI.Debug("WeakAuras: bundled package not found: " .. tostring(packageName) .. ".")
        return false
    end

    return ImportString(package.name, package.import)
end

function MaddinUI.ApplyWeakAurasImports()
    local packages = MaddinUI.profileData and MaddinUI.profileData.WeakAuras
    if type(packages) ~= "table" or #packages == 0 then
        MaddinUI.Debug("WeakAuras: no bundled import strings yet; skipped imports.")
        return false
    end

    local imported = 0
    for _, package in ipairs(packages) do
        if ImportString(package.name, package.import) then
            imported = imported + 1
        end
    end

    return imported > 0
end
