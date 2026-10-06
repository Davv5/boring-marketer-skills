#!/usr/bin/env bash
# ============================================================================
# lint-skills.sh - Vibe Marketing Skills v2 Lint
# ============================================================================
# Checks the pack's mechanical rules (docs/agents/standards.md):
#   - every pointer to a pack path resolves
#   - every file in a skill folder besides SKILL.md is pointed to by
#     another file
#   - every SKILL.md has name/description frontmatter and Reads/Writes headings
#   - shared markdown outside scripts/schemas has an inbound pointer
#   - model slugs/prices stay in the installed creative model registry
#   - glossary Avoid names stay out of prose (documented other-sense escape)
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

# Registry data, not a second list of models in the linter.
REGISTRY="creative/references/MODEL_REGISTRY.md"
: > "$WORK_DIR/models"
if [[ -f "$REGISTRY" ]]; then
  awk -F'|' '
    /^\|/ && $3 ~ /`[^`]+\/[^`]+`/ {
      role = $2
      gsub(/^[ \t]+|[ \t]+$/, "", role)
      print "role\t" tolower(role)
      rest = $3
      while (match(rest, /`[^`]+\/[^`]+`/)) {
        slug = substr(rest, RSTART + 1, RLENGTH - 2)
        print "slug\t" slug
        sub(/^[^\/]+\//, "", slug)
        gsub(/-/, " ", slug)
        print "role\t" tolower(slug)
        rest = substr(rest, RSTART + RLENGTH)
      }
    }
  ' "$REGISTRY" > "$WORK_DIR/models"
fi

if [[ -d creative && ! -s "$WORK_DIR/models" ]]; then
  fail "$REGISTRY  missing model registry table"
fi

# Named comma-separated Avoid terms; explanatory "using ..." prose is not a term.
# Single lowercase words (type/template) are sense-dependent and review-only.
: > "$WORK_DIR/avoid"
if [[ -f GLOSSARY.md ]]; then
  awk '
    /^_Avoid_:[ \t]*using[ \t]/ { next }
    /^_Avoid_:/ {
      sub(/^_Avoid_:[ \t]*/, "")
      n = split($0, terms, ",")
      for (i = 1; i <= n; i++) {
        term = terms[i]
        sub(/[ \t]*\(.*$/, "", term)
        gsub(/^[ \t]+|[ \t]+$/, "", term)
        if (term != "" && term !~ /^using[ \t]/ && term !~ /^[a-z]+$/) print term
      }
    }
  ' GLOSSARY.md > "$WORK_DIR/avoid"
else
  fail "GLOSSARY.md  missing glossary"
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

    read -r has_reads has_writes < <(awk '
      /^[ \t]*(```|~~~)/ { fence = !fence; next }
      !fence && /^## Reads[ \t]*(#+[ \t]*)?$/ { reads = 1 }
      !fence && /^## Writes[ \t]*(#+[ \t]*)?$/ { writes = 1 }
      END { print reads + 0, writes + 0 }
    ' "$target/SKILL.md")
    [[ "$has_reads" == 1 ]] || fail "$target/SKILL.md  missing ## Reads heading"
    [[ "$has_writes" == 1 ]] || fail "$target/SKILL.md  missing ## Writes heading"

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

  # --- Orphaned skill files and shared markdown (scripts/schemas excluded) ---
  if [[ "$target" == "_system" ]]; then
    find "$target" -type f -name '*.md' -not -name '.*' \
      -not -path "$target/schemas/*" -not -path "$target/scripts/*" | sort > "$WORK_DIR/orphans"
  else
    find "$target" -type f -not -name '.*' -not -path "$target/SKILL.md" | sort > "$WORK_DIR/orphans"
  fi
    while IFS= read -r file; do
      if ! awk -F'\t' -v f="$file" '$4 == f && $1 != f { found = 1; exit } END { exit !found }' \
          "$WORK_DIR/pointers"; then
        fail "$file  nothing points to this file"
      fi
    done < "$WORK_DIR/orphans"

  # --- Model slugs and prices have one home ---
  while IFS= read -r file; do
    [[ "$file" == "$REGISTRY" ]] && continue
    while IFS=$'\t' read -r line kind; do
      fail "$file:$line  model $kind outside $REGISTRY"
    done < <(awk -F'\t' '
      NR == FNR {
        if ($1 == "slug") slugs[$2] = 1
        else roles[$2] = 1
        next
      }
      {
        text = tolower($0)
        slug_hit = 0
        for (slug in slugs) if (index(text, slug)) slug_hit = 1
        if (slug_hit) print FNR "\tslug"
        if (text ~ /\$[ \t]*[0-9]/) {
          model_hit = slug_hit || text ~ /(^|[^[:alnum:]_])models?([^[:alnum:]_]|$)/
          for (role in roles) if (index(text, role)) model_hit = 1
          if (model_hit) print FNR "\tprice"
        }
      }
    ' "$WORK_DIR/models" "$file")
  done < <(find "$target" -type f -name '*.md' -not -name '.*' | sort)

  # --- Glossary Avoid terms, with a term-specific line-local escape ---
  while IFS= read -r file; do
    while IFS=$'\t' read -r line term; do
      fail "$file:$line  glossary Avoid term: $term"
    done < <(awk '
      NR == FNR { terms[$0] = 1; next }
      /^[ 	]*(```|~~~)/ { fence = !fence; next }
      fence { next }
      {
        text = $0
        allowed = ""
        rest = text
        while (match(rest, /<!--[ \t]*lint-allow-avoid:[^>]*-->/)) {
          escape = substr(rest, RSTART, RLENGTH)
          sub(/^<!--[ \t]*lint-allow-avoid:[ \t]*/, "", escape)
          sub(/[ \t]*-->$/, "", escape)
          allowed = allowed "\t" escape "\t"
          rest = substr(rest, RSTART + RLENGTH)
        }
        gsub(/<!--[ \t]*lint-allow-avoid:[^>]*-->/, "", text)
        for (term in terms) {
          if (index(allowed, "\t" term "\t")) continue
          rest = text
          while ((pos = index(rest, term)) > 0) {
            before = pos > 1 ? substr(rest, pos - 1, 1) : ""
            after = substr(rest, pos + length(term), 1)
            if (before !~ /[[:alnum:]_]/ && after !~ /[[:alnum:]_]/) {
              print FNR "\t" term
              break
            }
            rest = substr(rest, pos + length(term))
          }
        }
      }
    ' "$WORK_DIR/avoid" "$file")
  done < <(find "$target" -type f -name '*.md' -not -name '.*' | sort)

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
