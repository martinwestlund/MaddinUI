local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

MaddinUI.profiles = MaddinUI.profiles or {}
MaddinUI.profiles.Details = MaddinUI.profiles.Details or {
    profileName = "MaddinUI",
}

local detailsRetryFrame = nil

local function ApplyBundledDetailsWindowState(details, profile)
    if type(details) ~= "table" or type(profile) ~= "table" or type(profile.instances) ~= "table" then
        return
    end

    for index, skin in ipairs(profile.instances) do
        local instance = nil
        if type(details.GetInstance) == "function" then
            instance = details:GetInstance(index)
        elseif type(details.tabela_instancias) == "table" then
            instance = details.tabela_instancias[index]
        end

        if type(instance) == "table" then
            if type(skin.__pos) == "table" then
                instance.posicao = MaddinUI.CopyTable(skin.__pos, {})
            end
            if skin.__locked ~= nil then
                instance.isLocked = skin.__locked
                if type(instance.LockInstance) == "function" then
                    instance:LockInstance(skin.__locked)
                end
            end
            if type(skin.__snap) == "table" then
                instance.snap = MaddinUI.CopyTable(skin.__snap, {})
            end
            instance.horizontalSnap = skin.__snapH
            instance.verticalSnap = skin.__snapV

            if type(instance.RestoreMainWindowPosition) == "function" then
                instance:RestoreMainWindowPosition()
            end
            if type(instance.ReajustaGump) == "function" then
                instance:ReajustaGump()
            end
        end
    end
end

local function TryApplyDetailsRuntimeProfile(profileName, profile)
    local details = _G.Details or _G._detalhes
    if not details or type(details.ApplyProfile) ~= "function" then
        return false, "Details runtime is not ready yet"
    end

    local ok, result = pcall(details.ApplyProfile, details, profileName, true)
    if not ok then
        return false, "ApplyProfile failed with Lua error: " .. tostring(result)
    end

    if result == false then
        return false, "ApplyProfile returned false"
    end

    ApplyBundledDetailsWindowState(details, profile)
    return true, nil
end

local function QueueDetailsProfileApply(profileName, profile)
    if detailsRetryFrame then
        detailsRetryFrame.elapsed = 0
        detailsRetryFrame.tries = 0
        detailsRetryFrame.pendingProfileName = profileName
        detailsRetryFrame.pendingProfile = profile
        detailsRetryFrame:RegisterEvent("PLAYER_LOGIN")
        detailsRetryFrame:Show()
        return
    end

    detailsRetryFrame = CreateFrame("Frame")
    detailsRetryFrame.elapsed = 0
    detailsRetryFrame.tries = 0
    detailsRetryFrame.pendingProfileName = profileName
    detailsRetryFrame.pendingProfile = profile
    detailsRetryFrame:RegisterEvent("PLAYER_LOGIN")
    detailsRetryFrame:SetScript("OnEvent", function(self)
        self.elapsed = 0.9
    end)
    detailsRetryFrame:SetScript("OnUpdate", function(self, elapsed)
        self.elapsed = (self.elapsed or 0) + (elapsed or 0)
        if self.elapsed < 1 then
            return
        end

        self.elapsed = 0
        self.tries = (self.tries or 0) + 1

        local ok, reason = TryApplyDetailsRuntimeProfile(self.pendingProfileName, self.pendingProfile)
        if ok then
            MaddinUI.Debug("Details: applied queued profile " .. tostring(self.pendingProfileName) .. ". Reload UI is recommended.")
            self:UnregisterEvent("PLAYER_LOGIN")
            self:Hide()
        elseif self.tries >= 12 then
            MaddinUI.Debug("Details: queued profile apply did not complete: " .. tostring(reason) .. ". The profile was saved and can be selected manually as " .. tostring(self.pendingProfileName) .. ".")
            self:UnregisterEvent("PLAYER_LOGIN")
            self:Hide()
        end
    end)
end

function MaddinUI.ApplyDetailsProfile()
    MaddinUI.Debug("Details: requested profile load.")

    local data = MaddinUI.profileData and MaddinUI.profileData.Details
    if type(data) ~= "table" or type(data.profile) ~= "table" then
        MaddinUI.Debug("Details: no bundled saved profile table found; skipped profile write.")
        return false
    end

    local profileName = data.profileName or MaddinUI.profiles.Details.profileName or "MaddinUI"

    _detalhes_global = _detalhes_global or {}
    _detalhes_global.__profiles = _detalhes_global.__profiles or {}
    _detalhes_global.__profiles[profileName] = MaddinUI.CopyTable(data.profile, {})

    local ok, reason = TryApplyDetailsRuntimeProfile(profileName, data.profile)
    if ok then
        MaddinUI.Debug("Details: wrote and applied profile " .. tostring(profileName) .. ". Reload UI is recommended.")
        MaddinUI.MarkInstallerStepComplete("details")
        return true
    end

    QueueDetailsProfileApply(profileName, data.profile)
    MaddinUI.Debug("Details: saved profile " .. tostring(profileName) .. " and queued runtime apply: " .. tostring(reason) .. ".")
    MaddinUI.MarkInstallerStepComplete("details")
    return true
end
