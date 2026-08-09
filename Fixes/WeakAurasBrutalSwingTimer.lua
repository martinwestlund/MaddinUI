local MaddinUI = _G.MaddinUI
if type(MaddinUI) ~= "table" then
    return
end

-- Ascension Barbarian compatibility for WeakAuras swing timers.
--
-- Brutal Swing is a queued Barbarian attack that consumes the next main-hand
-- swing, similar to Heroic Strike/Cleave. On Ascension it can resolve through
-- SPELL_DAMAGE/SPELL_MISSED combat-log events instead of the SWING_DAMAGE /
-- SWING_MISSED events that WeakAuras' built-in swing timer watches. When that
-- happens, WeakAuras may clear or expire the main-hand swing state and the
-- MaddinUI swing timer bar disappears until a normal swing is seen.
--
-- This shim does not replace WeakAuras' normal swing timer. It only provides a
-- short-lived fallback main-hand timer after Brutal Swing lands, and only when
-- WeakAuras itself reports no active main-hand swing timer.

local BRUTAL_SWING_SPELL_ID = 500913
local BRUTAL_SWING_FALLBACK_NAME = "Brutal Swing"

local installed = false

local function InstallBrutalSwingTimerFix()
    if installed then
        return
    end

    local WeakAuras = _G.WeakAuras
    if type(WeakAuras) ~= "table"
        or type(WeakAuras.GetSwingTimerInfo) ~= "function"
        or type(WeakAuras.ScanEvents) ~= "function" then
        return
    end

    installed = true

    local originalGetSwingTimerInfo = WeakAuras.GetSwingTimerInfo
    local brutalSwingName = GetSpellInfo(BRUTAL_SWING_SPELL_ID) or BRUTAL_SWING_FALLBACK_NAME
    local playerGUID = UnitGUID("player")
    local fallbackDuration = 0
    local fallbackExpirationTime = 0
    local fallbackName = brutalSwingName
    local fallbackIcon = nil

    local function IsOriginalTimerActive(duration, expirationTime)
        if type(duration) ~= "number" or duration <= 0 then
            return false
        end

        if type(expirationTime) ~= "number" or expirationTime == math.huge then
            return false
        end

        return expirationTime > GetTime()
    end

    local function ClearFallbackTimer()
        fallbackDuration = 0
        fallbackExpirationTime = 0
        WeakAuras.ScanEvents("SWING_TIMER_UPDATE")
    end

    local updateFrame = CreateFrame("Frame")
    updateFrame:Hide()
    updateFrame:SetScript("OnUpdate", function(self)
        if fallbackExpirationTime <= 0 or GetTime() < fallbackExpirationTime then
            return
        end

        self:Hide()
        ClearFallbackTimer()
    end)

    WeakAuras.GetSwingTimerInfo = function(hand)
        local duration, expirationTime, name, icon = originalGetSwingTimerInfo(hand)

        if hand ~= "main" or IsOriginalTimerActive(duration, expirationTime) then
            return duration, expirationTime, name, icon
        end

        if fallbackExpirationTime > GetTime() and fallbackDuration > 0 then
            return fallbackDuration, fallbackExpirationTime, fallbackName, fallbackIcon or icon
        end

        return duration, expirationTime, name, icon
    end

    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
    eventFrame:SetScript("OnEvent", function(_, event, ...)
        if event == "PLAYER_ENTERING_WORLD" then
            playerGUID = UnitGUID("player")
            return
        end

        local timestamp, subevent, sourceGUID = ...
        if sourceGUID ~= playerGUID then
            return
        end

        if subevent ~= "SPELL_DAMAGE" and subevent ~= "SPELL_MISSED" then
            return
        end

        local spellId, spellName = select(9, ...)
        if tonumber(spellId) ~= BRUTAL_SWING_SPELL_ID and spellName ~= brutalSwingName then
            return
        end

        local mainSpeed = UnitAttackSpeed("player")
        if type(mainSpeed) ~= "number" or mainSpeed <= 0 then
            return
        end

        fallbackDuration = mainSpeed
        fallbackExpirationTime = GetTime() + mainSpeed
        fallbackName = spellName or brutalSwingName
        fallbackIcon = select(3, GetSpellInfo(BRUTAL_SWING_SPELL_ID))
        updateFrame:Show()
        WeakAuras.ScanEvents("SWING_TIMER_UPDATE")
    end)
end

local loaderFrame = CreateFrame("Frame")
loaderFrame:RegisterEvent("PLAYER_LOGIN")
loaderFrame:RegisterEvent("ADDON_LOADED")
loaderFrame:SetScript("OnEvent", function(self, event, addonName)
    if event == "PLAYER_LOGIN" or addonName == "WeakAuras" then
        InstallBrutalSwingTimerFix()
        if installed then
            self:UnregisterEvent("PLAYER_LOGIN")
            self:UnregisterEvent("ADDON_LOADED")
        end
    end
end)

InstallBrutalSwingTimerFix()
