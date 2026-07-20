# MaddinUI Session Handoff

## Current stage

MaddinUI now has a minimal Project Ascension/WotLK-compatible addon skeleton plus a first step-by-step installer scaffold.

The addon is installed directly at:

```text
Interface/AddOns/MaddinUI
```

Expected addon entry point is present:

```text
Interface/AddOns/MaddinUI/MaddinUI.toc
```

Current installer flow:

1. Landing page
2. ElvUI page
   - `Apply DPS/Tank`
   - `Apply Healer`
3. Details page
4. KuiNameplates page
5. WeakAuras page
6. Finish/reload page

Slash commands:

```text
/maddinui
/mui
```

## Files added/changed in current worktree

- `MaddinUI.toc`
  - Loads the addon core, profile modules, and installer.
  - Uses `## Interface: 30300`.
  - Important: nested file paths in the `.toc` must use backslashes for this Ascension/WotLK client, e.g. `Profiles\ElvUI.lua`.

- `Core.lua`
  - Creates global `MaddinUI` namespace.
  - Initializes `MaddinUIDB` saved variables.
  - Registers `/maddinui` and `/mui`.
  - Provides debug chat helper and table-copy helper.

- `Installer.lua`
  - Builds the step-by-step installer frame.
  - Provides navigation and per-page action buttons.

- `Profiles/ElvUI.lua`
  - Wires ElvUI DPS/Tank and Healer buttons.
  - Detects Ascension ElvUI engine.
  - Sets UI scale to `0.5333333`.
  - Does not yet apply full ElvUI profile payloads because they are not bundled yet.

- `Profiles/Details.lua`
  - Debug/detection scaffold only.

- `Profiles/KuiNameplates.lua`
  - Debug/detection scaffold only.

- `Profiles/WeakAuras.lua`
  - Detects `WeakAuras.Import` and is ready for import strings later.

- `tests/structure.sh`
  - Simple static structure check for required files and `.toc` entries.

## In-game test results so far

Initial addon skeleton:

- `/reload` showed `MaddinUI Loaded` / `MaddinUI Loaded.` style chat output.
- No Lua errors.

Installer ElvUI button bug:

- Error seen initially:

```text
MaddinUI\Installer.lua:91: attempt to call field 'ApplyElvUIProfile' (a nil value)
```

Root cause:

- `Installer.lua` loaded, but `Profiles/ElvUI.lua` did not.
- `.toc` used forward slashes for nested files.
- Changed paths from `Profiles/ElvUI.lua` to `Profiles\ElvUI.lua`.

After fix:

- ElvUI DPS/Tank button runs successfully.
- Chat output confirms:

```text
MaddinUI ElvUI: requested profile dpsTank.
MaddinUI ElvUI: detected engine version 7.27.
MaddinUI ElvUI: set CVars useUiScale=1 and uiScale=0.5333333.
MaddinUI ElvUI: set E.global.general.UIScale=0.5333333.
MaddinUI ElvUI: set ElvDB.global.general.UIScale=0.5333333.
MaddinUI ElvUI: called E:PixelScaleChanged(nil, true).
MaddinUI ElvUI: no bundled dpsTank profile payload yet; skipped profile DB write.
```

User confirmed the UI scale visibly changes immediately when pressing the button.

## Important learnings

### Target runtime

Per `AGENTS.md`, MaddinUI targets Project Ascension based on WotLK 3.3.5a:

```text
## Interface: 30300
```

Use Lua 5.1-era WoW Lua and old global APIs. Avoid modern Retail APIs such as:

- `C_Timer`
- `C_*` namespaces
- `AuraUtil`
- `CombatLogGetCurrentEventInfo()`
- `Enum.*`
- modern nameplate APIs
- Lua 5.2+ features

### ElvUI specifics found in installed Ascension fork

Installed ElvUI:

```text
ElvUI version 7.27
Interface 30300
SavedVariables: ElvDB, ElvPrivateDB
SavedVariablesPerCharacter: ElvCharacterDB
```

ElvUI global is `_G.ElvUI`, unpacked like:

```lua
local E, L, V, P, G = unpack(_G.ElvUI)
```

ElvUI scale source of truth is **not only** the Blizzard CVar. It uses:

```lua
E.global.general.UIScale
ElvDB.global.general.UIScale
```

Visible scale refresh should call:

```lua
E:PixelScaleChanged(nil, true)
```

Fallback if unavailable:

```lua
E:UIScale(true)
E:UIScale()
```

Calling only `E:UIScale(true)` recalculates pixel variables but does not visibly apply the scale.

Desired MaddinUI UI scale:

```lua
0.5333333
```

### WeakAuras specifics found

Installed WeakAuras:

```text
WeakAuras 5.21.2
X-Flavor: 3.3.5
SavedVariables: WeakAurasSaved
```

The installed WeakAuras exposes:

```lua
WeakAuras.Import(inData, target, callbackFunc, linkedAuras)
```

So future WeakAuras support should use bundled import strings and call `WeakAuras.Import` conservatively with debug output.

### KuiNameplates specifics found

Installed KuiNameplates:

```text
Kui_Nameplates
SavedVariables: KuiNameplatesGDB
```

It uses AceDB:

```lua
LibStub("AceDB-3.0"):New("KuiNameplatesGDB", defaults)
```

Future profile application should verify AceDB profile APIs/runtime state before writing profile data.

### Details status

No Details `.toc` was found in the sibling AddOns folder during this session. The Details installer step currently only detects whether `_G.Details` or `_G._detalhes` exists and prints debug output.

## Current verification commands

Run from repo root:

```bash
./tests/structure.sh
```

Expected output:

```text
structure ok
```

Compatibility scan used:

```bash
rg "C_Timer|C_[A-Za-z]+|AuraUtil|CombatLogGetCurrentEventInfo|table\.unpack|goto|Mixin|CreateFromMixins|Enum\." . -n --glob '!AGENTS.md'
```

Expected: no matches.

## Next steps

1. Commit current installer scaffold if not already committed.
2. Obtain/export actual profile payloads:
   - ElvUI DPS/Tank profile
   - ElvUI Healer profile
   - Details profile, once Details install/addon location is known
   - KuiNameplates profile data
   - WeakAuras import strings
3. Add ElvUI profile payloads first.
   - Store payloads in `Profiles/ElvUI.lua` or separate data files if large.
   - Keep DPS/Tank and Healer separate.
   - Apply by writing/copying into `ElvDB.profiles[...]`, assigning `ElvDB.profileKeys[characterKey]`, copying to active `E.db` if safe, and recommending reload.
4. Validate ElvUI profile application in-game with debug output.
5. Then implement the next profile step, likely WeakAuras because the import API is already identified.
6. Keep all code 3.3.5/Lua 5.1-compatible.
7. Do not create a nested `MaddinUI` directory; `.toc` belongs directly in repo root.
8. Do not commit/push unless explicitly asked.

## Current known limitations

- Installer UI is functional but basic.
- Only ElvUI scale application has been verified in-game.
- ElvUI profile buttons do not apply actual layouts yet because no profile payloads are bundled.
- Details step cannot be fully implemented until the installed Details addon/profile format is available.
- KuiNameplates profile write path needs AceDB verification before enabling writes.
- WeakAuras imports need actual import strings.
