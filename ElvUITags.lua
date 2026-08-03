local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

local hasElvUI, E = pcall(function()
    return unpack(ElvUI)
end)

if not hasElvUI or not E then
    return
end

local function TargetWithArrow(unit)
    local targetUnit = unit .. 'target'
    if not UnitExists(targetUnit) then
        return nil
    end

    local targetName = UnitName(targetUnit)
    if not targetName then
        return nil
    end

    local colorHex = '|cffffffff'

    if UnitIsPlayer(targetUnit) then
        local _, class = UnitClass(targetUnit)
        if class then
            local c = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
            if c then
                colorHex = string.format('|cff%02x%02x%02x', c.r * 255, c.g * 255, c.b * 255)
            end
        end
    end

    return string.format(' |cffFFFFFF»|r %s%s|r', colorHex, targetName)
end

local function IsRefreshEventsError(message)
    message = tostring(message or '')
    return string.find(message, 'RefreshEvents') ~= nil
end

if type(E.AddTag) == 'function' then
    local ok, err = pcall(E.AddTag, E, 'targetwitharrow', 'UNIT_TARGET', TargetWithArrow)
    if not ok and not IsRefreshEventsError(err) then
        error(err)
    end

    if type(E.AddTagInfo) == 'function' then
        E:AddTagInfo('targetwitharrow', 'Target', 'Displays target-of-unit with a white arrow and class-colored name')
    end
end
