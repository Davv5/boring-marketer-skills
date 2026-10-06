#!/usr/bin/env bash
# Doctor CLI selects the checkout by default and honors an explicit install home.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACK_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
TEMP="$(mktemp -d)"
trap 'rm -rf "$TEMP"' EXIT
CHECKOUT="$TEMP/checkout"
mkdir -p "$CHECKOUT" "$TEMP/home"
cp -R "$PACK_ROOT/_system" "$PACK_ROOT/GLOSSARY.md" "$CHECKOUT/"
for skill in "$PACK_ROOT"/*/SKILL.md; do cp -R "$(dirname "$skill")" "$CHECKOUT/"; done
git -C "$CHECKOUT" init -q
cd "$CHECKOUT"
unset TVM_INSTALL_HOME REPLICATE_API_TOKEN
if ! HOME="$TEMP/home" bash _system/scripts/doctor.sh > "$TEMP/output" 2>&1; then
  cat "$TEMP/output"; echo 'FAIL: doctor must check the checkout, not the default installation'; exit 1
fi
grep -Fq "Skills location: $CHECKOUT" "$TEMP/output"
grep -Fq 'Lint passed.' "$TEMP/output"
grep -Fq 'checks passed.' "$TEMP/output"
printf 'PASS: doctor selects checkout: %s\n' "$CHECKOUT"
export TVM_INSTALL_HOME="$TEMP/install"
bash _system/scripts/install.sh > "$TEMP/install-output" 2>&1
bash _system/scripts/doctor.sh > "$TEMP/output" 2>&1
grep -Fq "Skills location: $TVM_INSTALL_HOME/skills" "$TEMP/output"
grep -Fq 'checks passed.' "$TEMP/output"
printf 'PASS: doctor honors TVM_INSTALL_HOME: %s/skills\n' "$TVM_INSTALL_HOME"
