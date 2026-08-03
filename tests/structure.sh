#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "MaddinUI.toc"
  "Core.lua"
  "ElvUITags.lua"
  "Installer.lua"
  "Profiles/Data/ElvUI.lua"
  "Profiles/Data/Details.lua"
  "Profiles/Data/WeakAuras.lua"
  "Profiles/Data/KuiNameplates.lua"
  "Profiles/Data/Cell_Ascension.lua"
  "Profiles/ElvUI.lua"
  "Profiles/Details.lua"
  "Profiles/KuiNameplates.lua"
  "Profiles/Cell_Ascension.lua"
  "Profiles/WeakAuras.lua"
)

for file in "${required_files[@]}"; do
  test -f "$file" || { echo "missing required file: $file" >&2; exit 1; }
done

grep -q '^## Interface: 30300$' MaddinUI.toc
grep -q '^Installer.lua$' MaddinUI.toc
grep -q '^ElvUITags.lua$' MaddinUI.toc
grep -q '^Profiles\\Data\\ElvUI.lua$' MaddinUI.toc
grep -q '^Profiles\\Data\\Details.lua$' MaddinUI.toc
grep -q '^Profiles\\Data\\WeakAuras.lua$' MaddinUI.toc
grep -q '^Profiles\\Data\\KuiNameplates.lua$' MaddinUI.toc
grep -q '^Profiles\\Data\\Cell_Ascension.lua$' MaddinUI.toc
grep -q '^Profiles\\ElvUI.lua$' MaddinUI.toc
grep -q '^Profiles\\Details.lua$' MaddinUI.toc
grep -q '^Profiles\\KuiNameplates.lua$' MaddinUI.toc
grep -q '^Profiles\\Cell_Ascension.lua$' MaddinUI.toc
grep -q '^Profiles\\WeakAuras.lua$' MaddinUI.toc

if ! grep -q "E.AddTag, E, 'targetwitharrow', 'UNIT_TARGET', TargetWithArrow" ElvUITags.lua; then
  echo "MaddinUI must register the targetwitharrow ElvUI tag" >&2
  exit 1
fi
if ! grep -q "UnitExists(targetUnit)" ElvUITags.lua || ! grep -q "CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS" ElvUITags.lua; then
  echo "targetwitharrow tag must preserve MartinTools target/class-color behavior" >&2
  exit 1
fi
if grep -q 'MinimapButton\|ProfileViewer\|ProfileData' MaddinUI.toc ElvUITags.lua; then
  echo "MaddinUI must not import unrelated MartinTools modules" >&2
  exit 1
fi

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
if ! grep -q 'unitframe.disabledBlizzardFrames.party = true' Core.lua; then
  echo "smooth first-run must disable Blizzard party frames for Cell_Ascension" >&2
  exit 1
fi
if ! grep -q 'unitframe.disabledBlizzardFrames.raid = true' Core.lua; then
  echo "smooth first-run must disable Blizzard raid frames for Cell_Ascension" >&2
  exit 1
fi
if ! grep -q 'unitframe.units.party.enable = false' Core.lua; then
  echo "smooth first-run must disable ElvUI party frames for Cell_Ascension" >&2
  exit 1
fi
if ! grep -q 'unitframe.units.raid.enable = false' Core.lua; then
  echo "smooth first-run must disable ElvUI raid frames for Cell_Ascension" >&2
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
if ! grep -q 'UpdateLogoForPage' Installer.lua || ! grep -q 'landingLogoSize' Installer.lua; then
  echo "installer must use a large landing logo and smaller step logo" >&2
  exit 1
fi
if ! grep -q 'profileLabel' Installer.lua || ! grep -q 'Press the button to import the' Installer.lua; then
  echo "installer step pages must include profile import helper text" >&2
  exit 1
fi
if ! grep -q 'SuppressAddonFirstRunPopups' Core.lua; then
  echo "core must suppress supported addon first-run popups" >&2
  exit 1
fi
if ! grep -q 'CellDB.changelogsViewed = Cell.version' Core.lua || ! grep -q 'CellDB.firstRun = false' Core.lua; then
  echo "core must suppress Cell changelog and first-run popups" >&2
  exit 1
fi
if ! grep -q 'Details.auto_open_news_window = false' Core.lua || ! grep -q 'Details.is_first_run = false' Core.lua; then
  echo "core must suppress Details news and welcome popups" >&2
  exit 1
fi
if ! grep -q 'E.db.hideTutorial = true' Core.lua || ! grep -q 'E.TutorialFrame:Hide()' Core.lua; then
  echo "core must suppress ElvUI tutorial/support popup" >&2
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
if ! grep -q 'frame.landingLogoSize = 66' Installer.lua; then
  echo "installer must use a larger MaddinUI landing logo" >&2
  exit 1
fi

echo "structure ok"
