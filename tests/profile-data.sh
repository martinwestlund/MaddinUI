#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "Profiles/Data/ElvUI.lua"
  "Profiles/Data/WeakAuras.lua"
  "Profiles/Data/Details.lua"
)

for file in "${required_files[@]}"; do
  test -f "$file" || { echo "missing required profile data file: $file" >&2; exit 1; }
done

grep -q '!E1!' Profiles/Data/ElvUI.lua
grep -q '!WA:2!' Profiles/Data/WeakAuras.lua
grep -q 'Essential' Profiles/Data/WeakAuras.lua
grep -q 'Felsworn' Profiles/Data/WeakAuras.lua
grep -q 'Cultist' Profiles/Data/WeakAuras.lua
grep -q 'Pyromancer' Profiles/Data/WeakAuras.lua
grep -q 'Starcaller' Profiles/Data/WeakAuras.lua
grep -q 'Templar' Profiles/Data/WeakAuras.lua

echo "profile data ok"
