local MaddinUI = _G.MaddinUI
if not MaddinUI then
    return
end

MaddinUI.profiles = MaddinUI.profiles or {}
MaddinUI.profiles.Cell_Ascension = MaddinUI.profiles.Cell_Ascension or {}

local function EnsureCellFrameHiding(db)
    if type(db) ~= "table" then
        return
    end

    db.general = db.general or {}
    db.general.hideBlizzardParty = true
    db.general.hideBlizzardRaid = true
    db.general.hideBlizzardRaidManager = true
    db.firstRun = false
    if type(_G.Cell) == "table" and Cell.version then
        db.changelogsViewed = Cell.version
    elseif db.revise then
        db.changelogsViewed = db.revise
    end
end

function MaddinUI.ApplyCellAscensionProfile()
    MaddinUI.Debug("Cell_Ascension: requested profile load.")

    local data = MaddinUI.profileData and MaddinUI.profileData.Cell_Ascension
    if type(data) ~= "table" then
        MaddinUI.Debug("Cell_Ascension: no bundled profile payload found; skipped profile DB write.")
        return false
    end

    CellDB = MaddinUI.CopyTable(data, {})
    EnsureCellFrameHiding(CellDB)

    MaddinUI.Debug("Cell_Ascension: wrote bundled profile and enabled Blizzard party/raid frame hiding. Reload UI is recommended.")
    MaddinUI.MarkInstallerStepComplete("cell_ascension")
    return true
end
