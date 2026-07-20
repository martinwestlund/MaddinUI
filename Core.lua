local ADDON_NAME = "MaddinUI"
local DEFAULT_DB = {
    profileVersion = 1,
}

local function CopyDefaults(defaults, target)
    if type(target) ~= "table" then
        target = {}
    end

    for key, value in pairs(defaults) do
        if type(value) == "table" then
            target[key] = CopyDefaults(value, target[key])
        elseif target[key] == nil then
            target[key] = value
        end
    end

    return target
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
    if event ~= "ADDON_LOADED" or addonName ~= ADDON_NAME then
        return
    end

    MaddinUIDB = CopyDefaults(DEFAULT_DB, MaddinUIDB)

    if DEFAULT_CHAT_FRAME then
        DEFAULT_CHAT_FRAME:AddMessage("MaddinUI loaded.")
    end

    self:UnregisterEvent("ADDON_LOADED")
end)
