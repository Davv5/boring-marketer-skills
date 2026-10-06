#!/usr/bin/env bash
# ============================================================================
# e2e-fresh-install.sh - End-to-End Installation Test
# ============================================================================
# Simulates a fresh customer install in an isolated temporary directory.
# Validates the full install -> doctor -> verify pipeline works correctly.
#
# Modes:
#   From source (default):  Tests install.sh directly from the repo
#   From package:           Tests install from a packaged zip file
#
# Usage:
#   ./e2e-fresh-install.sh                    Test from source
#   ./e2e-fresh-install.sh --zip path/to.zip  Test from packaged zip
#
# Exit codes:
#   0  All tests passed
#   1  One or more tests failed
# ============================================================================
set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
ZIP_PATH=""
TEMP_DIR=""
TEST_PASS=0
TEST_FAIL=0

# ---------------------------------------------------------------------------
# Parse arguments
# ---------------------------------------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --zip)
      ZIP_PATH="$2"
      shift 2
      ;;
    --help|-h)
      echo "Usage: $0 [--zip path/to/package.zip]"
      echo ""
      echo "Options:"
      echo "  --zip PATH  Test installation from a packaged zip file"
      echo "  --help      Show this help message"
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
CYAN="\033[0;36m"
DIM="\033[2m"
RESET="\033[0m"

test_pass() {
  echo -e "  ${GREEN}PASS${RESET}  $1"
  TEST_PASS=$((TEST_PASS + 1))
}

test_fail() {
  echo -e "  ${RED}FAIL${RESET}  $1"
  TEST_FAIL=$((TEST_FAIL + 1))
}

# ---------------------------------------------------------------------------
# Cleanup handler
# ---------------------------------------------------------------------------
cleanup() {
  if [[ -n "$TEMP_DIR" && -d "$TEMP_DIR" ]]; then
    rm -rf "$TEMP_DIR"
  fi
}
trap cleanup EXIT

# ---------------------------------------------------------------------------
# Banner
# ---------------------------------------------------------------------------
echo ""
echo -e "${BOLD}  Vibe Marketing Skills v2 - E2E Fresh Install Test${RESET}"
echo -e "  ──────────────────────────────────────────────────"
echo ""

# ---------------------------------------------------------------------------
# Step 1: Create isolated temp environment
# ---------------------------------------------------------------------------
echo -e "${BOLD}  Step 1: Create isolated environment${RESET}"

TEMP_DIR="$(mktemp -d)"
FAKE_HOME="$TEMP_DIR/home"
SOURCE_DIR="$TEMP_DIR/source"
mkdir -p "$FAKE_HOME"
mkdir -p "$SOURCE_DIR"

export TVM_INSTALL_HOME="$FAKE_HOME/.claude"

echo -e "  ${DIM}Temp dir:     $TEMP_DIR${RESET}"
echo -e "  ${DIM}Fake home:    $FAKE_HOME${RESET}"
echo -e "  ${DIM}Install root: $TVM_INSTALL_HOME${RESET}"
echo ""

# ---------------------------------------------------------------------------
# Step 2: Prepare source files
# ---------------------------------------------------------------------------
echo -e "${BOLD}  Step 2: Prepare source${RESET}"

if [[ -n "$ZIP_PATH" ]]; then
  # Unzip mode
  if [[ ! -f "$ZIP_PATH" ]]; then
    echo -e "  ${RED}Error: Zip file not found: $ZIP_PATH${RESET}"
    exit 1
  fi
  echo -e "  ${DIM}Unzipping: $ZIP_PATH${RESET}"
  unzip -q "$ZIP_PATH" -d "$SOURCE_DIR"
  # Find the skills-v2 directory inside the extracted content
  EXTRACTED_ROOT=$(find "$SOURCE_DIR" -name "_system" -type d -maxdepth 2 | head -1)
  if [[ -z "$EXTRACTED_ROOT" ]]; then
    test_fail "Could not find _system directory in zip"
    exit 1
  fi
  EXTRACTED_ROOT="$(dirname "$EXTRACTED_ROOT")"
  test_pass "Unzipped package to $EXTRACTED_ROOT"
else
  # Source mode - use repo directly
  EXTRACTED_ROOT="$SKILLS_ROOT"
  test_pass "Using source directory: $SKILLS_ROOT"
fi
echo ""

# ---------------------------------------------------------------------------
# Step 3: Run install
# ---------------------------------------------------------------------------
echo -e "${BOLD}  Step 3: Run installer${RESET}"

INSTALL_SCRIPT="$EXTRACTED_ROOT/_system/scripts/install.sh"
if [[ ! -f "$INSTALL_SCRIPT" ]]; then
  test_fail "install.sh not found at $INSTALL_SCRIPT"
  echo ""
  echo -e "  ${RED}Cannot continue without installer.${RESET}"
  exit 1
fi

chmod +x "$INSTALL_SCRIPT"
echo ""

if bash "$INSTALL_SCRIPT" 2>&1; then
  test_pass "install.sh completed successfully"
else
  test_fail "install.sh exited with non-zero status"
fi
echo ""

# ---------------------------------------------------------------------------
# Step 4: Run doctor
# ---------------------------------------------------------------------------
echo -e "${BOLD}  Step 4: Run doctor${RESET}"

DOCTOR_SCRIPT="$TVM_INSTALL_HOME/skills/_system/scripts/doctor.sh"
if [[ ! -f "$DOCTOR_SCRIPT" ]]; then
  # Fall back to source copy
  DOCTOR_SCRIPT="$EXTRACTED_ROOT/_system/scripts/doctor.sh"
fi

if [[ ! -f "$DOCTOR_SCRIPT" ]]; then
  test_fail "doctor.sh not found"
else
  chmod +x "$DOCTOR_SCRIPT"
  echo ""
  if bash "$DOCTOR_SCRIPT" 2>&1; then
    test_pass "doctor.sh reports healthy installation"
  else
    test_fail "doctor.sh reported failures"
  fi
fi
echo ""

# ---------------------------------------------------------------------------
# Step 5: Manual file verification
# ---------------------------------------------------------------------------
echo -e "${BOLD}  Step 5: Verify file manifest${RESET}"

INSTALL_DIR="$TVM_INSTALL_HOME/skills"

# Expected files: everything under _system and under each skill folder
# (a top-level folder holding SKILL.md) in the source.
EXPECTED_FILES=("GLOSSARY.md")
while IFS= read -r -d '' file; do
  EXPECTED_FILES+=("${file#$EXTRACTED_ROOT/}")
done < <(
  find "$EXTRACTED_ROOT/_system" -type f -not -name '.DS_Store' -print0
  for skill_file in "$EXTRACTED_ROOT"/*/SKILL.md; do
    find "$(dirname "$skill_file")" -type f -not -name '.DS_Store' -print0
  done
)

for filepath in "${EXPECTED_FILES[@]}"; do
  if [[ -f "$INSTALL_DIR/$filepath" ]]; then
    test_pass "$filepath"
  else
    test_fail "$filepath"
  fi
done

# Check file contents are non-empty
echo ""
echo -e "${BOLD}  Step 6: Verify file contents${RESET}"

EMPTY_COUNT=0
while IFS= read -r -d '' file; do
  if [[ ! -s "$file" ]]; then
    EMPTY_COUNT=$((EMPTY_COUNT + 1))
    test_fail "Empty file: ${file#$INSTALL_DIR/}"
  fi
done < <(find "$INSTALL_DIR" -type f -print0)

if [[ "$EMPTY_COUNT" -eq 0 ]]; then
  TOTAL_FILES=$(find "$INSTALL_DIR" -type f | wc -l | tr -d ' ')
  test_pass "All $TOTAL_FILES files have content"
fi

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo ""
echo -e "  ──────────────────────────────────────────────────"
echo ""

TOTAL=$((TEST_PASS + TEST_FAIL))

if [[ "$TEST_FAIL" -eq 0 ]]; then
  echo -e "  ${GREEN}${BOLD}ALL $TOTAL TESTS PASSED${RESET}"
  echo ""
  echo -e "  ${DIM}Cleaned up: $TEMP_DIR${RESET}"
  echo ""
  exit 0
else
  echo -e "  ${RED}${BOLD}$TEST_FAIL of $TOTAL TESTS FAILED${RESET}"
  echo ""
  echo -e "  ${DIM}Temp dir preserved for debugging: $TEMP_DIR${RESET}"
  # Prevent cleanup so user can inspect
  TEMP_DIR=""
  echo ""
  exit 1
fi
