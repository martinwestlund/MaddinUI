# WeakAuras Brutal Swing swing-timer fix

## Problem

Ascension Barbarian's **Brutal Swing** is a queued main-hand attack, effectively combining the Classic-style behavior of Heroic Strike and Cleave. It consumes/modifies the next melee swing.

The Ascension WeakAuras swing timer bundled with the launcher tracks melee swings from combat-log events such as:

- `SWING_DAMAGE`
- `SWING_MISSED`

Brutal Swing can resolve as spell combat-log events instead:

- `SPELL_DAMAGE`
- `SPELL_MISSED`

with spell ID `500913` / name `Brutal Swing`.

When WeakAuras clears or expires the current main-hand swing timer and then does not see a normal `SWING_*` event for the Brutal Swing hit, MaddinUI's swing timer bar disappears until a later normal swing restarts it.

## Local installed-addon patch

During debugging, the installed WeakAuras file was patched directly at:

```text
Interface/AddOns/WeakAuras/GenericTrigger.lua
```

The patch adds handling in WeakAuras' internal swing timer combat-log function so that player-sourced Brutal Swing `SPELL_DAMAGE` / `SPELL_MISSED` events call the same main-hand `swingStart("main", GetTime())` path used by normal `SWING_DAMAGE` / `SWING_MISSED` events.

Inserted logic summary:

```lua
local brutalSwingSpellName = GetSpellInfo(500913) or "Brutal Swing"

-- inside the player-sourced combat-log handling:
elseif(event == "SPELL_DAMAGE" or event == "SPELL_MISSED") then
    local spellId, spellName = ...
    if tonumber(spellId) == 500913 or spellName == brutalSwingSpellName then
        swingStart("main", GetTime())
        swingTriggerUpdate()
    end
end
```

This works, but it is not release-friendly because users should not have to edit WeakAuras and the change can be overwritten by WeakAuras updates.

## MaddinUI addon-side shim

MaddinUI now ships a small compatibility shim:

```text
Fixes/WeakAurasBrutalSwingTimer.lua
```

The addon TOC declares WeakAuras as an optional dependency so MaddinUI loads after WeakAuras when WeakAuras is installed:

```toc
## OptionalDeps: WeakAuras
```

The shim:

1. Waits for WeakAuras to be available.
2. Saves the original `WeakAuras.GetSwingTimerInfo` function.
3. Listens for player-sourced `COMBAT_LOG_EVENT_UNFILTERED` events.
4. When Brutal Swing spell ID `500913` lands as `SPELL_DAMAGE` or `SPELL_MISSED`, records a fallback main-hand swing timer using `UnitAttackSpeed("player")`.
5. Calls `WeakAuras.ScanEvents("SWING_TIMER_UPDATE")` so existing WeakAuras swing timer displays refresh.
6. Overrides `WeakAuras.GetSwingTimerInfo("main")` only as a fallback: if WeakAuras' original main-hand timer is active, MaddinUI returns the original WeakAuras value unchanged. If WeakAuras reports no active main-hand timer but the Brutal Swing fallback is still active, MaddinUI returns the fallback timer.

This keeps WeakAuras' normal swing timer behavior in control and only fills the Ascension-specific Brutal Swing gap.

## Maintenance notes

If WeakAuras is updated, verify both paths:

1. The local installed `GenericTrigger.lua` patch may be removed by the update. This is expected.
2. MaddinUI's `Fixes/WeakAurasBrutalSwingTimer.lua` should continue to work as long as the Ascension WeakAuras fork still exposes:
   - `WeakAuras.GetSwingTimerInfo(hand)`
   - `WeakAuras.ScanEvents(eventName, ...)`

If a future WeakAuras update fixes Brutal Swing natively, the MaddinUI shim should become harmless because it prefers WeakAuras' original active timer over its fallback. At that point, test whether the shim is still needed and remove it if it becomes redundant.

## Manual test

In the Ascension client:

1. Enable WeakAuras and MaddinUI.
2. Log into a Barbarian with Brutal Swing.
3. Attack a target dummy or enemy.
4. Confirm the MaddinUI/WeakAuras main-hand swing timer shows during normal swings.
5. Queue Brutal Swing before a main-hand swing lands.
6. Confirm the swing timer restarts/continues after the Brutal Swing-modified hit instead of disappearing.
