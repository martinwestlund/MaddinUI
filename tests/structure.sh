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

echo "structure ok"
