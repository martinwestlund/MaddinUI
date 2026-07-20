local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

MaddinUI.profiles = MaddinUI.profiles or {}
MaddinUI.profiles.WeakAuras = MaddinUI.profiles.WeakAuras or {
    imports = {},
}

function MaddinUI.ApplyWeakAurasImports()
    MaddinUI.Debug("WeakAuras: requested import load.")

    if type(_G.WeakAuras) ~= "table" then
        MaddinUI.Debug("WeakAuras: addon global was not found. Is WeakAuras enabled and loaded?")
        return false
    end

    if type(_G.WeakAuras.Import) ~= "function" then
        MaddinUI.Debug("WeakAuras: WeakAuras.Import is unavailable in this runtime.")
        return false
    end

    local imports = MaddinUI.profiles.WeakAuras.imports
    if type(imports) ~= "table" or #imports == 0 then
        MaddinUI.Debug("WeakAuras: no bundled import strings yet; skipped imports.")
        return false
    end

    local imported = 0
    for index, importString in ipairs(imports) do
        if type(importString) == "string" and importString ~= "" then
            local ok, err = _G.WeakAuras.Import(importString)
            if ok == false or err then
                MaddinUI.Debug("WeakAuras: import " .. tostring(index) .. " failed: " .. tostring(err or "unknown error") .. ".")
            else
                imported = imported + 1
                MaddinUI.Debug("WeakAuras: started import " .. tostring(index) .. ".")
            end
        end
    end

    if imported > 0 then
        MaddinUI.MarkInstallerStepComplete("weakauras")
        return true
    end

    return false
end
