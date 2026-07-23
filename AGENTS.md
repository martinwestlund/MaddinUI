# Project Agent Guide: MaddinUI

MaddinUI targets Ascension WoW tooling/addons on the Wrath of the Lich King 3.3.5a client. Treat the addon environment as **WoW Interface 30300** unless a specific Ascension-provided addon/runtime proves otherwise.

## Target environment

- Game/client family: Ascension WoW, based on WoW 3.3.5a.
- AddOn `.toc` interface: `## Interface: 30300`.
- Lua runtime: Lua 5.1-era WoW Lua, not modern Lua and not Retail WoW's current API surface.
- Prefer 3.3.5-compatible addon examples, Wrath private-server backports, or the 3.3.5 FrameXML/API when researching implementation details.
- Do **not** assume current Retail, Dragonflight/War Within, or modern Classic addon APIs are available.

## Golden rule for implementation suggestions

Before suggesting or writing WeakAuras custom code or addon Lua, check whether every API/function/event exists in 3.3.5a / Interface 30300 or in Ascension's bundled fork. If uncertain, write conservative 3.3.5-compatible Lua and mark the unknown explicitly.

## Simplicity and performance preferences

- Prefer the simplest solution that achieves the user's actual goal. Many tasks in this repo are small profile/snippet/tooling changes and do not need frameworks, abstractions, schedulers, broad scanners, or generalized systems.
- Do not overengineer simple one-off tools. Start with targeted, readable code; only add complexity when there is a demonstrated need.
- Avoid CPU-heavy patterns by default, especially in WeakAuras/custom addon code that can run during combat or every frame.
- Avoid `COMBAT_LOG_EVENT_UNFILTERED` scanning unless the goal truly requires combat-log-only data. Prefer narrower events such as aura/unit/spell/nameplate events when they are sufficient.
- Avoid frequent full scans of all units, nameplates, buffs, bags, or group members. Prefer event-driven updates, cached results, throttling, and narrowly scoped checks.
- Avoid unthrottled `OnUpdate` loops. If polling is necessary, throttle it and keep the work small.
- This is a preference, not a hard blocker: if a heavier technique is required to achieve the goal, use it deliberately and explain why the simpler/event-driven option is insufficient.

## Modern/Retail APIs to avoid unless verified

Common modern APIs/features that are usually **not safe** for 3.3.5a:

- `C_Timer`, including `C_Timer.After`, `C_Timer.NewTicker`, `C_Timer.NewTimer`.
  - Use an `OnUpdate` frame/timer pattern instead.
- `C_` namespace APIs such as `C_Spell`, `C_UnitAuras`, `C_NamePlate`, `C_AddOns`, `C_Container`, `C_Texture`, `C_Item`, etc.
  - Use older globals where available, e.g. `GetSpellInfo`, `UnitAura`, `CreateFrame`, `GetContainerItemInfo`, `EnableAddOn`/`DisableAddOn`, etc., after checking 3.3.5 signatures.
- `AuraUtil`, `Spell:CreateFromSpellID`, `Item:CreateFromItemID`, `Enum.*`, `Constants.*`.
- `CombatLogGetCurrentEventInfo()`.
  - In 3.3.5, `COMBAT_LOG_EVENT_UNFILTERED` data is delivered as event arguments to the event handler.
- Modern nameplate APIs (`C_NamePlate.*`) and modern nameplate unit tokens.
- Modern mixin/helpers such as `Mixin`, `CreateFromMixins`, `CallbackRegistryMixin`, `EventUtil`, `ScrollUtil`, `Settings`, `MenuUtil`, `CreateAtlasMarkup`.
- Retail-only secure/action button or macro-condition features added after Wrath.
- Modern WeakAuras custom trigger examples copied from current WA docs without adapting API calls and event signatures.

## Lua compatibility rules

Write Lua that works on Lua 5.1-era WoW:

- Use `unpack`, not `table.unpack`.
- Do not use `goto`, `::labels::`, integer division `//`, bitwise operators (`&`, `|`, `~`, `<<`, `>>`), or Lua 5.2+ features.
- Do not use `table.pack`, `table.move`, `utf8`, `pairs`/`ipairs` metamethod assumptions, or `__len` table behavior from newer Lua versions.
- There is no `continue` statement.
- Prefer `local` variables/functions and avoid leaking globals.
- Use `select("#", ...)` and `arg`-free vararg handling; do not rely on Lua 5.0 `arg` behavior.

## 3.3.5 API/signature cautions

- Always verify return values and argument order for 3.3.5. Many APIs exist by the same name in Retail but have changed signatures.
- `UnitAura`/`UnitBuff`/`UnitDebuff` use older signatures and return tuples. Do not use modern aura tables or `AuraData` objects.
- Do not assume `UnitAura` accepts the same modern filters or spell-ID lookup behavior. When matching auras, prefer scanning indices and comparing returned `spellId`/name where available.
- Combat log handlers should accept varargs from the event handler rather than calling `CombatLogGetCurrentEventInfo()`.
- Container/bag APIs are old global APIs, not `C_Container.*`.
- Addon loading APIs are old global APIs, not `C_AddOns.*`.
- Secure frames, protected actions, and combat lockdown still matter. Avoid changing protected attributes or secure frames during combat.

## WeakAuras guidance for Ascension/3.3.5

- Treat Ascension's WeakAuras as a fork/backport unless proven identical to current upstream WeakAuras.
- Modern WeakAuras imports and snippets may fail because of both WoW API differences and WeakAuras-version differences.
- For custom triggers/actions, avoid modern helper APIs and write plain Lua 5.1.
- Prefer event-driven triggers using 3.3.5 events and old event argument payloads.
- When using spell IDs, confirm Ascension spell IDs/custom spells in-game; Ascension may add or alter spells compared to stock WotLK.
- Keep custom code small and defensive: nil-check APIs, units, spell names, and returned tuple positions.

## Addon UI design preferences

- For configuration/options UI, prefer the style and usability patterns of addons like **Cell** and **ElvUI**.
- Aim for clean, modern, addon-native option panels with clear navigation, grouped settings, toggles, sliders, dropdowns, previews, and sensible spacing.
- Do not default to a faux-Blizzard or purely "WoW-adjacent" visual style when building the actual addon UI.
- Keep UI implementation compatible with 3.3.5a APIs; if modern UI conveniences are unavailable, recreate the pattern simply rather than importing incompatible retail-era helpers.
- Favor practical usability over visual novelty: fast to navigate, easy to understand, and not unnecessarily complex.

## Development best practices for this repo

- Keep generated/imported profile files separate from hand-written addon code where possible.
- When the user asks to update profiles, auras, exports, or similar without narrowing the scope, compare the entire live SavedVariables/profile source state against the bundled addon data, not just the profile type mentioned casually. Update every changed supported profile found there.
- WeakAuras are intentionally bundled from the live account SavedVariables rather than Wago/import strings. For WeakAuras update requests, read `/mnt/c/Program Files (x86)/Ascension Launcher/resources/client/WTF/Account/MADDINWINS/SavedVariables/WeakAuras.lua`, extract the `WeakAurasSaved` table into `Profiles/Data/WeakAuras.lua` as `MaddinUI.profileData.WeakAurasSaved`, and keep the installer behavior as a full replacement flow unless the user explicitly asks otherwise.
- ElvUI profile data is intentionally bundled from live SavedVariables rather than ElvUI export strings. For ElvUI update requests, read `/mnt/c/Program Files (x86)/Ascension Launcher/resources/client/WTF/Account/MADDINWINS/SavedVariables/ElvUI.lua` and extract only the relevant profile/global/private data into `Profiles/Data/ElvUI.lua`; do not bundle account gold/character bookkeeping data. The expected profile names are `MaddinUI DPS/Tank` and `MaddinUI Healer`.
- Details profile data is intentionally bundled from live SavedVariables rather than an export string. For Details update requests, read `/mnt/c/Program Files (x86)/Ascension Launcher/resources/client/WTF/Account/MADDINWINS/SavedVariables/Details.lua` and extract `_detalhes_global.__profiles["MaddinUI"]` into `Profiles/Data/Details.lua`; do not bundle combat history or character-local `_detalhes_database` data.
- For profile/export update commits, use clear end-user-oriented version notes/commit messages that name the changed profile(s). Prefer the format `Various updates to <profile list> profiles.` Example: if only ElvUI Healer and Pyromancer WeakAuras changed, use `Various updates to ElvUI Healer & Pyromancer profiles.` Unless the user specifies a different message, avoid vague commit messages like `Update profiles` so users can judge whether an update matters to them.
- Document whether a profile/snippet targets:
  - Ascension launcher ElvUI fork
  - Ascension-compatible WeakAuras version
  - Details/KuiNameplates versions bundled or known to work on Ascension
  - Custom companion addons in this repo
- For custom addons, include `## Interface: 30300` in `.toc` files unless targeting a documented different Ascension interface.
- Test changes in the Ascension client, not only against Retail/Classic documentation.
- If using external examples, prefer 3.3.5a-specific repositories or archived Wrath-era addon code.
- Public-release safety: do not commit account names, character-specific secrets, private server credentials, WTF account folders, or machine-local paths.

## Research notes/sources used

- WoW 3.3.5a addon wiki and examples commonly use Interface `30300`.
- Archived 3.3.5 FrameXML/API references and interface file repositories show the older global API style.
- WoW API history notes confirm patch-specific API changes around 3.3.5.
- Modern Warcraft Wiki/WeakAuras documentation is useful for concepts but must be treated as potentially Retail-only until cross-checked against 3.3.5/Ascension.
