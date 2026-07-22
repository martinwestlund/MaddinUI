#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "Profiles/Data/ElvUI.lua"
  "Profiles/Data/WeakAuras.lua"
  "Profiles/Data/Details.lua"
  "Profiles/Data/KuiNameplates.lua"
)

for file in "${required_files[@]}"; do
  test -f "$file" || { echo "missing required profile data file: $file" >&2; exit 1; }
done

grep -q '!E1!' Profiles/Data/ElvUI.lua
grep -q '!WA:2!' Profiles/Data/WeakAuras.lua
grep -q 'S37' Profiles/Data/Details.lua
grep -q 'MaddinUI.profileData.KuiNameplates' Profiles/Data/KuiNameplates.lua
grep -q 'profileName = "MaddinUI"' Profiles/Data/KuiNameplates.lua
grep -q 'Castbar' Profiles/Data/KuiNameplates.lua
grep -q 'TankMode' Profiles/Data/KuiNameplates.lua

for package in Essential Cultist Felsworn Guardian Necromancer Pyromancer Ranger Starcaller Templar; do
  grep -q "name = \"$package\"" Profiles/Data/WeakAuras.lua
  grep -q "ApplyWeakAuraPackage(\"$package\")" Installer.lua
done

python3 - <<'PY'
from pathlib import Path
import hashlib
import re

text = Path('Profiles/Data/WeakAuras.lua').read_text()
items = re.findall(r'name = "([^"]+)", import = \[====\[\n(.*?)\n\]====\]', text, re.S)
if len(items) != 9:
    raise SystemExit('expected 9 WeakAura packages, found %d' % len(items))
seen = {}
for name, import_string in items:
    digest = hashlib.sha256(import_string.encode()).hexdigest()
    if digest in seen:
        raise SystemExit('duplicate WeakAura import payload: %s and %s' % (seen[digest], name))
    seen[digest] = name
PY

echo "profile data ok"
