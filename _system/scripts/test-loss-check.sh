#!/usr/bin/env bash
# Loss-check CLI against an isolated git pack; no checkout history dependencies.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMP="$(mktemp -d)"
trap 'rm -rf "$TEMP"' EXIT
cd "$TEMP"
git init -q
mkdir -p sample _system docs
cat > sample/SKILL.md <<'EOF'
# Sample
## Relocated
Keep this unique advice
with all its substance.
## Lost
This removed advice is unique.
## Empty
## Fence
```markdown
## Not a section
A code example remains.
```
EOF
printf '# Shared\n## Lost shared\nShared advice removed.\n' > _system/shared.md
git add .
git -c user.name=Fixture -c user.email=fixture@example.com commit -qm base
BASE="$(git rev-parse HEAD)"
git update-ref refs/remotes/origin/main "$BASE"
cat > sample/SKILL.md <<'EOF'
# Sample
## Lost
Replacement advice is not the removed advice.
## Fence
```markdown
## Not a section
A code example remains.
```
EOF
printf '# New home\n## Renamed\nKeep this unique advice with all its substance.\n' > _system/moved.md
rm _system/shared.md
printf '# Outside the pack\nThis removed advice is unique.\n' > docs/notes.md
BASE_REF="$BASE" bash "$SCRIPT_DIR/loss-check.sh" > output 2>&1 || {
  cat output; echo 'FAIL: loss check must exit 0'; exit 1;
}
for diagnostic in 'MISSING  sample/SKILL.md :: Lost' 'MISSING  _system/shared.md :: Lost shared'; do
  grep -Fq "$diagnostic" output || { cat output; echo "FAIL: missing warning: $diagnostic"; exit 1; }
  grep -F "$diagnostic" output
done
if grep -Eq ':: (Relocated|Empty|Not a section|Fence)' output; then
  cat output; echo 'FAIL: retained, empty or fenced headings warned'; exit 1
fi
bash "$SCRIPT_DIR/loss-check.sh" > default-output 2>&1
grep '^MISSING  ' output > explicit-warnings
grep '^MISSING  ' default-output > default-warnings
cmp explicit-warnings default-warnings
grep -Fq 'against origin/main (review only)' default-output
BASE_REF=unavailable bash "$SCRIPT_DIR/loss-check.sh" > output 2>&1
grep -Fq 'Warning: cannot read base ref unavailable' output
printf 'PASS: loss check warns on missing bodies, ignores relocation, defaults to origin/main, never fails\n'
