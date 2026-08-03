# MaddinUI

Ascension WoW UI bundle and installer for sharing MaddinUI addon profiles, WeakAuras, and small compatibility helpers.

Target runtime:

- Project Ascension / Wrath 3.3.5a-style client
- `## Interface: 30300`
- Lua 5.1-era WoW addon APIs

Bundled components:

- Ascension launcher fork of ElvUI profiles
  - `MaddinUI DPS/Tank`
  - `MaddinUI Healer`
  - ElvUI nameplates/party/raid frames are disabled so KuiNameplates and Cell own those areas.
- Cell_Ascension party/raid frame profile
- Details `MaddinUI` profile
- KuiNameplates `MaddinUI` profile
- Kui_Nameplates_Auras custom spell list support (`KuiSpellListCustom`)
- WeakAuras full replacement profile bundle
- Built-in ElvUI `[targetwitharrow]` custom tag

Installer:

- Open with `/maddinui` or `/mui`.
- Landing page shows a dependency checklist with `Found!` / `Not found, please install and enable the addon!` statuses.
- Uses the ElvUI Expressway font and class-colored MaddinUI styling.
- Suppresses common first-run/news/tutorial popups from ElvUI, Details, and Cell where possible.

Development notes for future agent sessions are in:

```text
docs/session-handoff.md
```
