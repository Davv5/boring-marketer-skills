#!/usr/bin/env bash
# Public CLI regression tests; each case uses an isolated pack, not the checkout.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACK_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
TEMP="$(mktemp -d)"
trap 'rm -rf "$TEMP"' EXIT
mkdir -p "$TEMP/_system" "$TEMP/sample" "$TEMP/creative/references"
cp "$PACK_ROOT/GLOSSARY.md" "$TEMP/GLOSSARY.md"
cp "$PACK_ROOT/creative/references/MODEL_REGISTRY.md" "$TEMP/creative/references/MODEL_REGISTRY.md"
cat > "$TEMP/sample/SKILL.md" <<'EOF'
---
name: sample
description: A test skill.
---
# Sample
## Reads
## Writes
EOF
cat > "$TEMP/creative/SKILL.md" <<'EOF'
---
name: creative
description: Test creative.
---
# Creative
## Reads
## Writes
See references/MODEL_REGISTRY.md.
EOF

lint() { bash "$SCRIPT_DIR/lint-skills.sh" "$TEMP/sample" "$TEMP/creative" "$TEMP/_system" > "$TEMP/output" 2>&1; }
expect_failure() {
  if lint; then
    echo "FAIL: expected lint rejection: $1"
    tail -4 "$TEMP/output"
    exit 1
  fi
  if ! grep -Fq -- "$1" "$TEMP/output"; then
    cat "$TEMP/output"
    echo "FAIL: missing diagnostic: $1"
    exit 1
  fi
  grep -F -- "$1" "$TEMP/output"
}
expect_clean() {
  if ! lint; then cat "$TEMP/output"; exit 1; fi
}

case "${1:-all}" in
  all)
    for rule in models glossary; do bash "$0" "$rule"; done
    ;;
  glossary)
    printf '\n_Avoid_: Fixture Term, using "mode" for something else\n' >> "$TEMP/GLOSSARY.md"
    printf '\nUse Fixture Term.\n' >> "$TEMP/sample/SKILL.md"
    expect_failure 'glossary Avoid term: Fixture Term'
    sed '$d' "$TEMP/sample/SKILL.md" > "$TEMP/clean"
    mv "$TEMP/clean" "$TEMP/sample/SKILL.md"
    printf 'Use Fixture Term. <!-- lint-allow-avoid: Fixture Term -->\n' >> "$TEMP/sample/SKILL.md"
    printf 'A modal mode, a prototype, type and template are not mechanical Avoid terms.\n```text\nReturning Mode\n```\n' >> "$TEMP/sample/SKILL.md"
    expect_clean
    printf 'Returning Mode is forbidden. <!-- lint-allow-avoid: Fixture Term -->\n' >> "$TEMP/sample/SKILL.md"
    expect_failure 'glossary Avoid term: Returning Mode'
    sed '$d' "$TEMP/sample/SKILL.md" > "$TEMP/clean"
    mv "$TEMP/clean" "$TEMP/sample/SKILL.md"
    rm "$TEMP/GLOSSARY.md"
    expect_failure 'GLOSSARY.md  missing glossary'
    ;;
  models)
    # A new table entry must become forbidden without changing the linter.
    printf '\n| Test role | `fixture/new-model` | $0.01 | Test | Test |\n' >> "$TEMP/creative/references/MODEL_REGISTRY.md"
    printf '\nUse fixture/new-model.\n' >> "$TEMP/sample/SKILL.md"
    expect_failure 'model slug outside creative/references/MODEL_REGISTRY.md'
    sed '$d' "$TEMP/sample/SKILL.md" > "$TEMP/clean"
    mv "$TEMP/clean" "$TEMP/sample/SKILL.md"
    expect_clean
    printf 'The Image premium model costs $0.15.\n' >> "$TEMP/sample/SKILL.md"
    expect_failure 'model price outside creative/references/MODEL_REGISTRY.md'
    sed '$d' "$TEMP/sample/SKILL.md" > "$TEMP/clean"
    mv "$TEMP/clean" "$TEMP/sample/SKILL.md"
    printf 'The campaign budget is $500.\nModel selection is separate.\n' >> "$TEMP/sample/SKILL.md"
    expect_clean
    ;;
  *) echo "Unknown case: $1" >&2; exit 2 ;;
esac
echo "PASS: lint ${1:-all}"
