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

grep -q 'MaddinUI.profileData.ElvUI' Profiles/Data/ElvUI.lua
grep -q 'dpsTankProfileName = "MaddinUI DPS/Tank"' Profiles/Data/ElvUI.lua
grep -q 'healerProfileName = "MaddinUI Healer"' Profiles/Data/ElvUI.lua
grep -q 'MaddinUI.profileData.WeakAurasSaved' Profiles/Data/WeakAuras.lua
grep -q '\["displays"\]' Profiles/Data/WeakAuras.lua
grep -q '\["dbVersion"\]' Profiles/Data/WeakAuras.lua
grep -q 'MaddinUI.profileData.Details' Profiles/Data/Details.lua
grep -q 'profileName = "MaddinUI"' Profiles/Data/Details.lua
grep -q 'MaddinUI.profileData.KuiNameplates' Profiles/Data/KuiNameplates.lua
grep -q 'profileName = "MaddinUI"' Profiles/Data/KuiNameplates.lua
grep -q 'Castbar' Profiles/Data/KuiNameplates.lua
grep -q 'TankMode' Profiles/Data/KuiNameplates.lua
grep -q 'Replace WeakAuras' Installer.lua
grep -q 'MADDINUI_REPLACE_WEAKAURAS' Installer.lua
grep -q 'ReplaceWeakAuras' Profiles/WeakAuras.lua

python3 - <<'PY'
from pathlib import Path
import re

wa_text = Path('Profiles/Data/WeakAuras.lua').read_text()
ids = re.findall(r'\["id"\] = "([^"]+)"', wa_text)
if len(ids) < 10:
    raise SystemExit('expected at least 10 bundled WeakAura displays, found %d' % len(ids))
if re.search(r'^WeakAurasSaved\s*=', wa_text, re.M):
    raise SystemExit('data file must not assign the global WeakAurasSaved directly')

elv_text = Path('Profiles/Data/ElvUI.lua').read_text()
if 'gold' in elv_text:
    raise SystemExit('ElvUI data should not bundle account gold tracking')
if len(re.findall(r'\["unitframe"\]', elv_text)) < 2:
    raise SystemExit('ElvUI profile data looks incomplete')

details_text = Path('Profiles/Data/Details.lua').read_text()
if '_detalhes_database' in details_text or 'tabela_historico' in details_text:
    raise SystemExit('Details data should bundle only the profile, not combat history')
if '["instances"]' not in details_text:
    raise SystemExit('Details profile data looks incomplete')
PY

echo "profile data ok"
