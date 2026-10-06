#!/usr/bin/env bash
# ============================================================================
# package.sh - Vibe Marketing Skills v2 Packager
# ============================================================================
# Builds a distributable zip archive of the complete skill suite. The output
# is a timestamped zip ready for delivery to customers.
#
# Usage:
#   ./package.sh                Build vibe-skills-v2-YYYYMMDD.zip
#   ./package.sh --output-dir /path/to/dir   Custom output directory
#
# Output:
#   vibe-skills-v2-YYYYMMDD.zip in the current directory (or --output-dir)
# ============================================================================
set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
TIMESTAMP=$(date +%Y%m%d)
PACKAGE_NAME="vibe-skills-v2-${TIMESTAMP}"
OUTPUT_DIR="$(pwd)"

# ---------------------------------------------------------------------------
# Parse arguments
# ---------------------------------------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --output-dir)
      OUTPUT_DIR="$2"
      shift 2
      ;;
    --help|-h)
      echo "Usage: $0 [--output-dir PATH]"
      echo ""
      echo "Options:"
      echo "  --output-dir PATH  Directory for the output zip (default: cwd)"
      echo "  --help             Show this help message"
      exit 0
      ;;
    *)
      echo "Error: Unknown option '$1'"
      exit 1
      ;;
  esac
done

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
BOLD="\033[1m"
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
CYAN="\033[0;36m"
DIM="\033[2m"
RESET="\033[0m"

info()    { echo -e "  ${CYAN}[info]${RESET}  $1"; }
success() { echo -e "  ${GREEN}[done]${RESET}  $1"; }
fail()    { echo -e "  ${RED}[fail]${RESET}  $1"; }

# ---------------------------------------------------------------------------
# Banner
# ---------------------------------------------------------------------------
echo ""
echo -e "${BOLD}  Vibe Marketing Skills v2 - Packager${RESET}"
echo -e "  ────────────────────────────────────"
echo ""
info "Source:  $SKILLS_ROOT"
info "Output:  $OUTPUT_DIR/${PACKAGE_NAME}.zip"
echo ""

# ---------------------------------------------------------------------------
# Validate source
# ---------------------------------------------------------------------------
if [[ ! -f "$SKILLS_ROOT/_system/brand-memory.md" ]]; then
  fail "Cannot find skills source at $SKILLS_ROOT"
  exit 1
fi

# ---------------------------------------------------------------------------
# Build the zip
# ---------------------------------------------------------------------------
info "Building zip archive..."

mkdir -p "$OUTPUT_DIR"
ZIP_FILE="$OUTPUT_DIR/${PACKAGE_NAME}.zip"

# Remove existing zip if present
rm -f "$ZIP_FILE"

# Create zip from the parent of the source folder, so the archive keeps the
# folder name as its prefix
PARENT_DIR="$(dirname "$SKILLS_ROOT")"
SKILLS_DIRNAME="$(basename "$SKILLS_ROOT")"

EXCLUDE_PATTERNS=(
  "*.DS_Store"
  "*/.git/*"
  "*/.git"
  "*.tmp"
  "*~"
  "*.swp"
  "*.swo"
  "*/__pycache__/*"
  "*.pyc"
  "*/.env"
  "*/.env.*"
  "*/CLAUDE.md"
  "*/_system/scripts/outputs/*"
  "*/SESSION-LOG-*"
  "*/_system/scripts/brand_context.py"
  "*/_system/scripts/smoke-test-apis.sh"
  "*/_system/scripts/e2e_generate.py"
  "*/_system/scripts/e2e_review.py"
  "*/_system/scripts/integration_test.py"
  "*/_system/scripts/validate.sh"
)

(
  cd "$PARENT_DIR"
  zip -r "$ZIP_FILE" "$SKILLS_DIRNAME/" -x "${EXCLUDE_PATTERNS[@]}" > /dev/null 2>&1
)

if [[ ! -f "$ZIP_FILE" ]]; then
  fail "Zip file was not created"
  exit 1
fi
success "Zip archive created"

# ---------------------------------------------------------------------------
# Expected manifest: README.md, everything under _system and under each skill
# folder (a top-level folder holding SKILL.md), minus the excluded patterns
# ---------------------------------------------------------------------------
is_excluded() {
  local path="$1"
  local pattern
  for pattern in "${EXCLUDE_PATTERNS[@]}"; do
    # Unquoted on purpose: the pattern is a glob, matched like zip -x
    if [[ "$path" == $pattern ]]; then
      return 0
    fi
  done
  return 1
}

EXPECTED_FILES=()
while IFS= read -r -d '' file; do
  expected="$SKILLS_DIRNAME/${file#$SKILLS_ROOT/}"
  if ! is_excluded "$expected"; then
    EXPECTED_FILES+=("$expected")
  fi
done < <(
  printf '%s\0' "$SKILLS_ROOT/README.md"
  find "$SKILLS_ROOT/_system" -type f -print0
  for skill_file in "$SKILLS_ROOT"/*/SKILL.md; do
    find "$(dirname "$skill_file")" -type f -print0
  done
)

# ---------------------------------------------------------------------------
# Verify zip contents against manifest
# ---------------------------------------------------------------------------
info "Verifying zip contents..."

VERIFY_FAIL=0
ZIP_CONTENTS=$(unzip -Z1 "$ZIP_FILE" 2>/dev/null)

for expected in "${EXPECTED_FILES[@]}"; do
  if grep -Fxq -- "$expected" <<< "$ZIP_CONTENTS"; then
    : # Present
  else
    fail "Missing from zip: $expected"
    VERIFY_FAIL=$((VERIFY_FAIL + 1))
  fi
done

if [[ "$VERIFY_FAIL" -gt 0 ]]; then
  echo ""
  fail "$VERIFY_FAIL expected files missing from zip archive"
  exit 1
fi
success "All ${#EXPECTED_FILES[@]} expected files verified in zip"

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
FILE_COUNT=$(unzip -l "$ZIP_FILE" 2>/dev/null | tail -1 | awk '{print $2}')
FILE_SIZE=$(ls -lh "$ZIP_FILE" | awk '{print $5}')
FILE_SIZE_BYTES=$(wc -c < "$ZIP_FILE" | tr -d ' ')

echo ""
echo -e "  ${BOLD}Package Summary${RESET}"
echo -e "  ───────────────"
echo ""
success "Archive:  ${PACKAGE_NAME}.zip"
success "Location: $ZIP_FILE"
success "Files:    $FILE_COUNT"
success "Size:     $FILE_SIZE ($FILE_SIZE_BYTES bytes)"
echo ""
echo -e "  ${DIM}To test this package:${RESET}"
echo -e "  ${DIM}  ./e2e-fresh-install.sh --zip $ZIP_FILE${RESET}"
echo ""
