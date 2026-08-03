# MaddinUI Session Handoff

## Current stage

MaddinUI is an Ascension/WotLK 3.3.5a-compatible addon profile installer located at:

```text
Interface/AddOns/MaddinUI
```

Target runtime:

```text
## Interface: 30300
Lua 5.1-era WoW Lua
```

Use old global WoW APIs. Do **not** use Retail/modern APIs such as `C_Timer`, `C_AddOns`, `C_NamePlate`, `C_Container`, `AuraUtil`, `Enum.*`, or Lua 5.2+ syntax.

Slash commands:

```text
/maddinui
/mui
```

## Current installer flow

1. Landing page
   - Large centered `MaddinUI` logo in ElvUI Expressway font.
   - `UI` is class-colored using inline WoW color codes.
   - Frame backdrop is 80% black opacity.
   - Addon dependency checklist shows:
     - green: `<Addon>: Found!`
     - red: `<Addon>: Not found, please install and enable the addon!`
   - Checklist display labels:
     - `ElvUI`
     - `Cell`
     - `Details`
     - `KuiNameplates`
     - `WeakAuras`
2. ElvUI page
   - `Apply DPS/Tank`
   - `Apply Healer`
3. Cell_Ascension page
   - Button label still imports Cell_Ascension, but landing checklist calls it `Cell` for cleanliness.
4. Details page
5. KuiNameplates page
6. WeakAuras page
   - Full replacement flow with custom dark confirmation, not Blizzard `StaticPopup`.
7. Finish/reload page

## Addon dependency checking

Implemented in `Installer.lua` with `ADDON_REQUIREMENTS`.

Compatibility notes:

- Uses old globals: `GetAddOnInfo`, `GetAddOnEnableState`, `IsAddOnLoaded`.
- Does not use `C_AddOns`.
- Runtime readiness also checks expected globals because enabled-state APIs can be unreliable in this client:
  - ElvUI: `ElvUI`
  - Cell: `Cell`
  - Details: `Details` or `_detalhes`
  - KuiNameplates: `KuiNameplates` or `KuiNameplatesCore`
  - WeakAuras: `WeakAuras`

## Bundled profile data

Profile data is bundled from live SavedVariables, not export strings.

Current bundled profile modules:

- `Profiles/Data/ElvUI.lua`
- `Profiles/Data/Details.lua`
- `Profiles/Data/WeakAuras.lua`
- `Profiles/Data/KuiNameplates.lua`
- `Profiles/Data/KuiNameplatesAuras.lua`
- `Profiles/Data/Cell_Ascension.lua`

Current importer modules:

- `Profiles/ElvUI.lua`
- `Profiles/Details.lua`
- `Profiles/KuiNameplates.lua`
- `Profiles/Cell_Ascension.lua`
- `Profiles/WeakAuras.lua`

### Live SavedVariables sources

When the user asks to “grab/update profiles”, update all supported profile data from:

```text
/mnt/c/Program Files (x86)/Ascension Launcher/resources/client/WTF/Account/MADDINWINS/SavedVariables/ElvUI.lua
/mnt/c/Program Files (x86)/Ascension Launcher/resources/client/WTF/Account/MADDINWINS/SavedVariables/Details.lua
/mnt/c/Program Files (x86)/Ascension Launcher/resources/client/WTF/Account/MADDINWINS/SavedVariables/WeakAuras.lua
/mnt/c/Program Files (x86)/Ascension Launcher/resources/client/WTF/Account/MADDINWINS/SavedVariables/Kui_Nameplates.lua
/mnt/c/Program Files (x86)/Ascension Launcher/resources/client/WTF/Account/MADDINWINS/SavedVariables/Kui_Nameplates_Auras.lua
/mnt/c/Program Files (x86)/Ascension Launcher/resources/client/WTF/Account/MADDINWINS/SavedVariables/Cell_Ascension.lua
```

### ElvUI profile handling

Expected profile names:

- `MaddinUI DPS/Tank`
- `MaddinUI Healer`

Important: live ElvUI may only contain one of these profiles depending on the currently tested character. If a live profile is missing, preserve the existing bundled profile rather than deleting it.

ElvUI importer behavior:

- Sets UI scale to bundled `uiScale` / default `0.5333333`.
- Writes selected profile into `ElvDB.profiles`.
- Assigns current character to the selected profile.
- Applies global/private DB payloads.
- Disables ElvUI nameplates, party frames, and raid frames so KuiNameplates and Cell own those areas.
- Calls `MaddinUI.PrepareSmoothFirstRun()`.

ElvUI frame disable behavior is duplicated in `Core.lua` for smooth first-run and in `Profiles/ElvUI.lua` for profile application.

### Cell_Ascension handling

Cell data source:

```lua
CellDB
```

Bundled as:

```lua
MaddinUI.profileData.Cell_Ascension
```

Importer writes:

```lua
CellDB = MaddinUI.CopyTable(data, {})
```

It also forces:

```lua
CellDB.general.hideBlizzardParty = true
CellDB.general.hideBlizzardRaid = true
CellDB.general.hideBlizzardRaidManager = true
CellDB.firstRun = false
CellDB.changelogsViewed = Cell.version or CellDB.revise
```

### Details handling

Details data source:

```lua
_detalhes_global.__profiles["MaddinUI"]
```

Bundled as:

```lua
MaddinUI.profileData.Details = {
    profileName = "MaddinUI",
    profile = <profile table>,
}
```

Do not bundle `_detalhes_database`, combat history, or character-local bookkeeping.

Importer writes `_detalhes_global.__profiles["MaddinUI"]` and calls:

```lua
Details:ApplyProfile("MaddinUI", true)
```

The second argument is important. Without it, Details saves the current runtime/default profile first and can overwrite the just-imported MaddinUI profile during clean SavedVariables tests.

The importer also reapplies bundled Details window positions/locks/snaps to live Details instances with `RestoreMainWindowPosition()` because Details can otherwise restore one window from local/default state.

### WeakAuras handling

WeakAuras data source:

```lua
WeakAurasSaved
```

Bundled as:

```lua
MaddinUI.profileData.WeakAurasSaved
```

Installer behavior is a full replacement flow. It replaces all saved WeakAuras with the bundled MaddinUI set. Keep this as full replacement unless the user explicitly asks otherwise.

### KuiNameplates handling

Kui data source:

```lua
KuiNameplatesGDB
```

Bundled as:

```lua
MaddinUI.profileData.KuiNameplates
```

Importer writes:

- `KuiNameplatesGDB.profiles["MaddinUI"]`
- namespace profiles under `KuiNameplatesGDB.namespaces[*].profiles["MaddinUI"]`
- current character profile key
- attempts runtime AceDB `SetProfile("MaddinUI")` if available

### KuiNameplates custom aura spell list

Kui aura spell list data source:

```lua
KuiSpellListCustom
```

SavedVariables file:

```text
Kui_Nameplates_Auras.lua
```

Bundled as:

```lua
MaddinUI.profileData.KuiSpellListCustom
```

Importer writes:

```lua
KuiSpellListCustom = MaddinUI.CopyTable(MaddinUI.profileData.KuiSpellListCustom, {})
```

At the time this handoff was written, the live table was empty, but support is now wired so future custom spell IDs are bundled/imported.

## Built-in ElvUI tag

`ElvUITags.lua` includes only the custom MartinTools tag:

```text
[targetwitharrow]
```

Behavior:

- Uses `unit .. "target"`.
- Returns nil if no target.
- Displays a white `»` arrow.
- Class-colors player target names using `CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS`.
- Falls back to white for NPCs/unknown classes.
- Registers through Ascension ElvUI `E.AddTag`.
- Suppresses only the known Ascension `RefreshEvents` registration error.

Do not import unrelated MartinTools modules such as minimap buttons or profile viewers.

## Popup suppression / clean first-run

`Core.lua` includes `MaddinUI.SuppressAddonFirstRunPopups()` and a short `OnUpdate` retry frame.

It suppresses/hides:

- ElvUI tutorial/support popup:
  - `E.db.hideTutorial = true`
  - hide `ElvUITutorialWindow`
  - hide `E.TutorialFrame` if present
- ElvUI incompatible addon popup:
  - `E:StaticPopup_Hide("INCOMPATIBLE_ADDON")`
- Details news/welcome:
  - `Details.auto_open_news_window = false`
  - `Details.is_first_run = false`
  - `Details.is_version_first_run = false`
  - hide `DetailsNewsWindow`
  - hide `DetailsWelcomeWindow`
- Cell changelog/first-run:
  - `CellDB.firstRun = false`
  - `CellDB.changelogsViewed = Cell.version or CellDB.revise`
  - hide `CellChangelogsFrame`

No `C_Timer` is used; suppression retries use a throttled `OnUpdate` frame for 3.3.5 compatibility.

## Release history notes

Recent relevant releases/commits:

- `v0.1.5`: refreshed profiles and added Kui_Nameplates_Auras support.
- `v0.1.4`: made installer landing logo prominent.
- `v0.1.3`: installer UI cleanup, Cell support, Details apply fixes, ElvUI `[targetwitharrow]` tag.
- Latest pushed docs/checklist commit after `v0.1.5`: installer landing checklist wording changed to `Found!` / `Not found...` and Cell label cleaned up.

The user may ask for local testing only. Do not push releases unless explicitly asked. Local game files are the working repo in the AddOns folder.

## Packaging / release process

`release/` is gitignored. When the user asks for a release:

1. Bump version in:
   - `MaddinUI.toc`
   - `Core.lua`
2. Build zip with root folder `MaddinUI/` inside the archive.
3. Include all runtime files from `.toc`, including profile data files.
4. Run verification:

```bash
bash tests/structure.sh && bash tests/profile-data.sh
```

5. Commit source changes.
6. Create annotated tag.
7. Push `main` and tag.
8. Use `gh release create ...` to attach the zip.

If a requested tag already exists, do not overwrite it without explicit permission. Bump to the next patch version instead.

## Verification commands

Run from repo root:

```bash
bash tests/structure.sh
bash tests/profile-data.sh
```

Both should pass before claiming work is complete or pushing.

## Public release safety

Do not commit account names, machine-local paths, credentials, combat history, character gold/bookkeeping, or full WTF folders. This repo intentionally bundles sanitized profile payloads, not entire SavedVariables files except where the target addon’s supported profile data requires full replacement (WeakAuras uses the full `WeakAurasSaved` table by design).
