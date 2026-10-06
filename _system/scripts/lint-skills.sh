#!/usr/bin/env bash
# ============================================================================
# lint-skills.sh - Vibe Marketing Skills v2 Lint
# ============================================================================
# Checks the pack's mechanical rules (docs/agents/standards.md):
#   - every pointer to a pack path resolves
#   - every file in a skill folder besides SKILL.md is pointed to by
#     another file
#   - every SKILL.md has a name and a description in its frontmatter
#   - no box frames or heavy dividers (┌ ┐ └ ┘ │ ━) in any markdown file;
#     tree diagrams are allowed inside code fences
#   - warns (does not fail) when a SKILL.md is over 500 lines
#
# A pointer is a path starting with references/, modes/, _system/ or a
# skill folder name, optionally after ./ or ../ . references/ and modes/
# resolve from the skill folder, the rest from the pack root, and ../ from
# the skill folder's parent. Bare file names are not pointers. Pointers are
# collected from every skill and _system in the pack, so a single-skill run
# still sees pointers from its siblings.
#
# Usage:
#   ./lint-skills.sh                 Lint the whole pack this script is in
#   ./lint-skills.sh DIR [DIR...]    Lint only these skill folders or _system
#
# Exit codes:
#   0  No failures (warnings allowed)
#   1  One or more failures
#   2  Usage error
# ============================================================================
set -euo pipefail

BOLD="\033[1m"
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
DIM="\033[2m"
RESET="\033[0m"

MAX_SKILL_LINES=500
FAIL_COUNT=0
WARN_COUNT=0

fail() {
  echo -e "  ${RED}\xe2\x9c\x97${RESET}  $1"
  FAIL_COUNT=$((FAIL_COUNT + 1))
}

warn() {
  echo -e "  ${YELLOW}!${RESET}  $1"
  WARN_COUNT=$((WARN_COUNT + 1))
}

# ---------------------------------------------------------------------------
# Targets and pack root
# ---------------------------------------------------------------------------
TARGETS=()
if [[ $# -eq 0 ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  PACK_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
  TARGETS+=("_system")
  for skill_file in "$PACK_ROOT"/*/SKILL.md; do
    [[ -f "$skill_file" ]] && TARGETS+=("$(basename "$(dirname "$skill_file")")")
  done
else
  PACK_ROOT=""
  for arg in "$@"; do
    if [[ ! -d "$arg" ]]; then
      echo "Error: '$arg' is not a skill folder (no such directory)" >&2
      exit 2
    fi
    dir="$(cd "$arg" && pwd)"
    name="$(basename "$dir")"
    if [[ "$name" != "_system" && ! -f "$dir/SKILL.md" ]]; then
      echo "Error: '$arg' is not a skill folder (no SKILL.md) or _system" >&2
      exit 2
    fi
    root="$(dirname "$dir")"
    if [[ -n "$PACK_ROOT" && "$root" != "$PACK_ROOT" ]]; then
      echo "Error: '$arg' is not in the same pack as the other folders" >&2
      exit 2
    fi
    PACK_ROOT="$root"
    TARGETS+=("$name")
  done
fi

cd "$PACK_ROOT"

# Every skill folder in the pack, whether linted or not.
SKILL_NAMES=()
for skill_file in */SKILL.md; do
  [[ -f "$skill_file" ]] && SKILL_NAMES+=("$(dirname "$skill_file")")
done

is_target() {
  local folder="${1%%/*}" t
  for t in "${TARGETS[@]}"; do
    [[ "$t" == "$folder" ]] && return 0
  done
  return 1
}

WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

# Markdown files that can hold pointers: every skill folder and _system.
SOURCES=()
while IFS= read -r file; do
  SOURCES+=("$file")
done < <(find ${SKILL_NAMES[@]+"${SKILL_NAMES[@]}"} _system -type f -name '*.md' \
  -not -name '.*' 2>/dev/null | sort)

# ---------------------------------------------------------------------------
# Collect pointers: "source<TAB>line<TAB>pointer<TAB>resolved"
# ---------------------------------------------------------------------------
: > "$WORK_DIR/pointers"
if [[ ${#SOURCES[@]} -gt 0 ]]; then
  awk -v names="${SKILL_NAMES[*]:-}" '
    BEGIN {
      alt = "references|modes|_system"
      n = split(names, list, " ")
      for (i = 1; i <= n; i++) alt = alt "|" list[i]
      re = "(\\.\\.?/)?(" alt ")/[A-Za-z0-9._/-]*"
    }
    {
      rest = $0
      col = 0
      while (match(rest, re)) {
        start = col + RSTART
        prev = (start > 1) ? substr($0, start - 1, 1) : ""
        token = substr(rest, RSTART, RLENGTH)
        col = start + RLENGTH - 1
        rest = substr(rest, RSTART + RLENGTH)
        if (prev ~ /[A-Za-z0-9_.\/~-]/) continue
        sub(/\.+$/, "", token)

        folder = FILENAME
        sub(/\/.*/, "", folder)
        path = token
        if (path ~ /^\.\.\//) {
          sub(/^\.\.\//, "", path)
        } else {
          sub(/^\.\//, "", path)
          if (path ~ /^(references|modes)\//) path = folder "/" path
        }
        print FILENAME "\t" FNR "\t" token "\t" path
      }
    }
  ' "${SOURCES[@]}" > "$WORK_DIR/pointers"
fi

# ---------------------------------------------------------------------------
# Lint each target
# ---------------------------------------------------------------------------
echo ""
echo -e "${BOLD}  Lint: ${#TARGETS[@]} folders in $PACK_ROOT${RESET}"

for target in "${TARGETS[@]}"; do
  echo ""
  echo -e "${BOLD}  $target${RESET}"
  before=$((FAIL_COUNT + WARN_COUNT))

  # --- Frontmatter ---
  if [[ -f "$target/SKILL.md" ]]; then
    read -r has_name has_desc < <(awk '
      NR == 1 { if ($0 !~ /^---[ \t]*$/) exit; open = 1; next }
      open && /^---[ \t]*$/ { exit }
      open && /^name:[ \t]*[^ \t]/ { name = 1 }
      open && pending { if ($0 ~ /^[ \t]+[^ \t]/) desc = 1; pending = 0 }
      open && /^description:/ {
        value = $0
        sub(/^description:[ \t]*/, "", value)
        if (value ~ /^[>|][-+]?[ \t]*$/) pending = 1
        else if (value != "" && value != "\"\"" && value != "'\'''\''") desc = 1
      }
      END { print name + 0, desc + 0 }
    ' "$target/SKILL.md")
    [[ "$has_name" == 1 ]] || fail "$target/SKILL.md  frontmatter missing name"
    [[ "$has_desc" == 1 ]] || fail "$target/SKILL.md  frontmatter missing description"

    lines=$(wc -l < "$target/SKILL.md" | tr -d ' ')
    if [[ "$lines" -gt "$MAX_SKILL_LINES" ]]; then
      warn "$target/SKILL.md  $lines lines (over $MAX_SKILL_LINES)"
    fi
  fi

  # --- Broken pointers ---
  while IFS=$'\t' read -r src line token path; do
    if [[ ! -e "$path" ]]; then
      fail "$src:$line  broken pointer ${DIM}$token${RESET}"
    fi
  done < <(awk -F'\t' -v t="$target" 'index($1, t "/") == 1' "$WORK_DIR/pointers")

  # --- Orphaned files (skill folders only) ---
  if [[ "$target" != "_system" ]]; then
    while IFS= read -r file; do
      if ! awk -F'\t' -v f="$file" '$4 == f && $1 != f { found = 1; exit } END { exit !found }' \
          "$WORK_DIR/pointers"; then
        fail "$file  nothing points to this file"
      fi
    done < <(find "$target" -type f -not -name '.*' -not -path "$target/SKILL.md" | sort)
  fi

  # --- Box frames and heavy dividers ---
  while IFS= read -r file; do
    result=$(awk '
      /^[ \t]*(```|~~~)/ { fence = !fence; next }
      {
        rest = $0
        # Inside a fence, a leading tree prefix (│ ├── └──) is allowed.
        if (fence) sub(/^[ \t]*((│|├(─)*|└(─)*)[ \t]*)*/, "", rest)
        if (rest ~ /┌|┐|└|┘|│|━/) { count++; if (!first) first = NR }
      }
      END { if (count) print count, first }
    ' "$file")
    if [[ -n "$result" ]]; then
      read -r count first <<< "$result"
      fail "$file:$first  box characters on $count lines ${DIM}(┌ ┐ └ ┘ │ ━ outside a fenced tree)${RESET}"
    fi
  done < <(find "$target" -type f -name '*.md' -not -name '.*' | sort)

  if [[ $((FAIL_COUNT + WARN_COUNT)) -eq "$before" ]]; then
    echo -e "  ${GREEN}\xe2\x9c\x93${RESET}  clean"
  fi
done

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo ""
if [[ "$FAIL_COUNT" -eq 0 ]]; then
  echo -e "  ${GREEN}${BOLD}Lint passed.${RESET} ${YELLOW}$WARN_COUNT warnings.${RESET}"
  echo ""
  exit 0
else
  echo -e "  ${RED}${BOLD}Lint failed: $FAIL_COUNT failures.${RESET} ${YELLOW}$WARN_COUNT warnings.${RESET}"
  echo ""
  exit 1
fi
