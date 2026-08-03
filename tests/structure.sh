#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "MaddinUI.toc"
  "Core.lua"
  "Installer.lua"
  "Profiles/Data/ElvUI.lua"
  "Profiles/Data/Details.lua"
  "Profiles/Data/WeakAuras.lua"
  "Profiles/Data/KuiNameplates.lua"
  "Profiles/ElvUI.lua"
  "Profiles/Details.lua"
  "Profiles/KuiNameplates.lua"
  "Profiles/WeakAuras.lua"
)

for file in "${required_files[@]}"; do
  test -f "$file" || { echo "missing required file: $file" >&2; exit 1; }
done

grep -q '^## Interface: 30300$' MaddinUI.toc
grep -q '^Installer.lua$' MaddinUI.toc
grep -q '^Profiles\\Data\\ElvUI.lua$' MaddinUI.toc
grep -q '^Profiles\\Data\\Details.lua$' MaddinUI.toc
grep -q '^Profiles\\Data\\WeakAuras.lua$' MaddinUI.toc
grep -q '^Profiles\\Data\\KuiNameplates.lua$' MaddinUI.toc
grep -q '^Profiles\\ElvUI.lua$' MaddinUI.toc
grep -q '^Profiles\\Details.lua$' MaddinUI.toc
grep -q '^Profiles\\KuiNameplates.lua$' MaddinUI.toc
grep -q '^Profiles\\WeakAuras.lua$' MaddinUI.toc

if ! grep -q 'frame:ShowPage(1)' Installer.lua; then
  echo "installer must always open on the first page" >&2
  exit 1
fi
if ! grep -q 'MaddinUIDB.installer.currentStep = nil' Core.lua; then
  echo "installer must clear stale persisted currentStep values" >&2
  exit 1
fi
if grep -q 'ShowPage(.*currentStep' Core.lua Installer.lua || grep -q 'currentStep = index' Core.lua Installer.lua; then
  echo "installer must not restore or save a persisted currentStep" >&2
  exit 1
fi

if ! grep -q 'function MaddinUI.PrepareSmoothFirstRun' Core.lua; then
  echo "missing smooth first-run preparation" >&2
  exit 1
fi
if ! grep -q 'E.private.install_complete = E.version' Core.lua; then
  echo "smooth first-run must suppress ElvUI installer" >&2
  exit 1
fi
if ! grep -q 'E.private.nameplates.enable = false' Core.lua; then
  echo "smooth first-run must disable ElvUI nameplates for KuiNameplates" >&2
  exit 1
fi
if ! grep -q 'E:StaticPopup_Hide("INCOMPATIBLE_ADDON")' Core.lua; then
  echo "smooth first-run must hide ElvUI incompatible addon popup" >&2
  exit 1
fi
if ! grep -q 'MaddinUIDB.installer.autoShown' Core.lua; then
  echo "installer must track first-run auto-open" >&2
  exit 1
fi
if ! grep -q 'RegisterEvent("PLAYER_LOGIN")' Core.lua; then
  echo "installer must auto-open from PLAYER_LOGIN" >&2
  exit 1
fi

if grep -q 'UIPanelButtonTemplate' Installer.lua; then
  echo "installer must not use Blizzard panel button templates" >&2
  exit 1
fi
if grep -q 'UI-DialogBox-Background\|UI-DialogBox-Border' Installer.lua; then
  echo "installer must not use Blizzard dialog artwork" >&2
  exit 1
fi
if ! grep -q 'Interface\\\\AddOns\\\\ElvUI\\\\Media\\\\Fonts\\\\Expressway.ttf' Installer.lua; then
  echo "installer must use the Expressway font path" >&2
  exit 1
fi
if ! grep -q 'function GetClassColor' Installer.lua; then
  echo "installer must use class-colored accents" >&2
  exit 1
fi
if ! grep -q 'frame.logoMaddin' Installer.lua || ! grep -q 'frame.logoUI' Installer.lua; then
  echo "installer must render split MaddinUI logo text" >&2
  exit 1
fi
if ! grep -q 'SetBackdropColor(0, 0, 0, 1)' Installer.lua; then
  echo "installer background must be opaque black" >&2
  exit 1
fi
if ! grep -q 'instruction = "Press the button to import' Installer.lua; then
  echo "installer pages must include action instructions above buttons" >&2
  exit 1
fi
if ! grep -q 'frame.instruction' Installer.lua; then
  echo "installer must render per-page instruction text" >&2
  exit 1
fi
if ! grep -q 'local logoSize = 54' Installer.lua; then
  echo "installer must use a larger MaddinUI logo" >&2
  exit 1
fi

echo "structure ok"
