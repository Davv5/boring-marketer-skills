#!/usr/bin/env bash
# ============================================================================
# doctor.sh - Vibe Marketing Skills v2 Installation Verifier
# ============================================================================
# Runs a health check on an installed skill suite. Verifies each skill's
# SKILL.md and the shared _system files are present, lints the pack with
# lint-skills.sh, and checks optional API keys are configured.
#
# Usage:
#   ./doctor.sh                Verify default installation
#   TVM_INSTALL_HOME=/tmp/test ./doctor.sh   Verify custom location
#
# Exit codes:
#   0  All required checks passed
#   1  One or more required files missing, or lint failed
# ============================================================================
set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
INSTALL_HOME="${TVM_INSTALL_HOME:-$HOME/.claude}"
SKILLS_DIR="$INSTALL_HOME/skills"
SYSTEM_DIR="$SKILLS_DIR/_system"

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

PASS_COUNT=0
FAIL_COUNT=0
WARN_COUNT=0

check_pass() {
  echo -e "  ${GREEN}\xe2\x9c\x93${RESET}  $1"
  PASS_COUNT=$((PASS_COUNT + 1))
}

check_fail() {
  echo -e "  ${RED}\xe2\x9c\x97${RESET}  $1"
  FAIL_COUNT=$((FAIL_COUNT + 1))
}

check_warn() {
  echo -e "  ${YELLOW}!${RESET}  $1  ${DIM}(optional)${RESET}"
  WARN_COUNT=$((WARN_COUNT + 1))
}

check_file() {
  local filepath="$1"
  local label="${2:-$1}"
  if [[ -f "$filepath" ]]; then
    check_pass "$label"
  else
    check_fail "$label  ${DIM}(missing: $filepath)${RESET}"
  fi
}

check_dir() {
  local dirpath="$1"
  local label="$2"
  local min_files="${3:-1}"
  if [[ -d "$dirpath" ]]; then
    local count
    count=$(find "$dirpath" -type f | wc -l | tr -d ' ')
    if [[ "$count" -ge "$min_files" ]]; then
      check_pass "$label ($count files)"
    else
      check_fail "$label (found $count files, need >= $min_files)"
    fi
  else
    check_fail "$label  ${DIM}(directory missing: $dirpath)${RESET}"
  fi
}

# ---------------------------------------------------------------------------
# Banner
# ---------------------------------------------------------------------------
echo ""
echo -e "${BOLD}  Vibe Marketing Skills v2 - Doctor${RESET}"
echo -e "  ──────────────────────────────────"
echo ""
echo -e "  ${DIM}Skills location: $SKILLS_DIR${RESET}"
echo -e "  ${DIM}System location: $SYSTEM_DIR${RESET}"
echo ""

# ---------------------------------------------------------------------------
# Check 1: Install directory exists
# ---------------------------------------------------------------------------
echo -e "${BOLD}  System Files${RESET}"
if [[ ! -d "$SYSTEM_DIR" ]]; then
  check_fail "System directory exists"
  echo ""
  echo -e "  ${RED}System directory not found at $SYSTEM_DIR${RESET}"
  echo -e "  Run install.sh first."
  exit 1
fi
check_pass "System directory exists"

# --- Shared files ---
check_file "$SYSTEM_DIR/brand-memory.md"    "Brand memory template"
check_file "$SYSTEM_DIR/output-format.md"   "Output format guide"
check_dir  "$SYSTEM_DIR/schemas"            "Schemas"

# --- Scripts ---
echo ""
echo -e "${BOLD}  Scripts${RESET}"
check_file "$SYSTEM_DIR/scripts/install.sh"            "Installer"
check_file "$SYSTEM_DIR/scripts/doctor.sh"             "Doctor (this script)"
check_file "$SYSTEM_DIR/scripts/e2e-fresh-install.sh"  "E2E test"
check_file "$SYSTEM_DIR/scripts/package.sh"            "Packager"
check_file "$SYSTEM_DIR/scripts/lint-skills.sh"        "Lint script"

# ---------------------------------------------------------------------------
# Check 2: Core skills (SKILL.md in each). References and modes are not
# listed here: install copies each skill folder whole.
# ---------------------------------------------------------------------------
echo ""
echo -e "${BOLD}  Core Skills${RESET}"
CORE_SKILLS=(
  "start-here"
  "brand-voice"
  "positioning-angles"
  "direct-response-copy"
  "keyword-research"
  "seo-content"
  "email-sequences"
  "lead-magnet"
  "newsletter"
  "content-atomizer"
)

for skill in "${CORE_SKILLS[@]}"; do
  check_file "$SKILLS_DIR/$skill/SKILL.md" "Skill: $skill"
done

# ---------------------------------------------------------------------------
# Check 3: Creative skill (may be absent in --claude-only installs)
# ---------------------------------------------------------------------------
echo ""
echo -e "${BOLD}  Creative Skill${RESET}"
if [[ -d "$SKILLS_DIR/creative" ]]; then
  check_file "$SKILLS_DIR/creative/SKILL.md" "Skill: creative"
else
  check_warn "Creative skill not installed (--claude-only mode)"
fi

# ---------------------------------------------------------------------------
# Check 4: Lint the pack. Only the pack's own folders are passed, so other
# skills installed beside it are not linted.
# ---------------------------------------------------------------------------
echo ""
echo -e "${BOLD}  Lint${RESET}"
LINT_TARGETS=("$SYSTEM_DIR")
for skill in "${CORE_SKILLS[@]}" "creative"; do
  if [[ -d "$SKILLS_DIR/$skill" ]]; then
    LINT_TARGETS+=("$SKILLS_DIR/$skill")
  fi
done

if [[ ! -f "$SYSTEM_DIR/scripts/lint-skills.sh" ]]; then
  check_fail "Lint  ${DIM}(lint-skills.sh missing)${RESET}"
elif bash "$SYSTEM_DIR/scripts/lint-skills.sh" "${LINT_TARGETS[@]}"; then
  check_pass "Lint (${#LINT_TARGETS[@]} folders)"
else
  check_fail "Lint (${#LINT_TARGETS[@]} folders)"
fi

# ---------------------------------------------------------------------------
# Check 5: Optional - Replicate API key
# ---------------------------------------------------------------------------
echo ""
echo -e "${BOLD}  API Keys (optional)${RESET}"
if [[ -n "${REPLICATE_API_TOKEN:-}" ]]; then
  # Test the API key with a lightweight call
  HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
    -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
    "https://api.replicate.com/v1/account" 2>/dev/null || echo "000")
  if [[ "$HTTP_STATUS" == "200" ]]; then
    check_pass "Replicate API token valid"
  elif [[ "$HTTP_STATUS" == "000" ]]; then
    check_warn "Replicate API - could not reach api.replicate.com"
  else
    check_warn "Replicate API token present but returned HTTP $HTTP_STATUS"
  fi
else
  check_warn "REPLICATE_API_TOKEN not set (needed for creative skill)"
fi

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
TOTAL=$((PASS_COUNT + FAIL_COUNT))
echo ""
echo -e "  ──────────────────────────────────"
echo ""

if [[ "$FAIL_COUNT" -eq 0 ]]; then
  echo -e "  ${GREEN}${BOLD}All $PASS_COUNT checks passed.${RESET}"
  if [[ "$WARN_COUNT" -gt 0 ]]; then
    echo -e "  ${YELLOW}$WARN_COUNT optional warnings.${RESET}"
  fi
  echo ""
  exit 0
else
  echo -e "  ${RED}${BOLD}$FAIL_COUNT of $TOTAL checks failed.${RESET}"
  if [[ "$WARN_COUNT" -gt 0 ]]; then
    echo -e "  ${YELLOW}$WARN_COUNT optional warnings.${RESET}"
  fi
  echo ""
  echo -e "  Run ${CYAN}install.sh${RESET} to fix missing files."
  echo ""
  exit 1
fi
