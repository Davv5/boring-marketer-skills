# Skill standards

The standard `/code-review` applies to every skill and `_system` file in this pack. The base standard is Matt Pocock's `/writing-for-agents` skill (context pointers, information hierarchy, completion criteria, leading words, pruning): read it before writing or reviewing a skill. The rules below are this pack's own.

## Blocking and warning

A **blocking** finding is a lint failure or a hard violation of a rule under Pack rules. A ticket is done when the health check and fresh-install test pass and review has no blocking findings.

A **warning** is a judgement call: how a pointer is worded, where material sits on the information hierarchy, a weak leading word, a suspected no-op, a SKILL.md over 500 lines. Report warnings; they do not block.

## Lint

`_system/scripts/lint-skills.sh` checks the mechanical rules, and the health check (`_system/scripts/doctor.sh`) runs it for the whole pack. Lint one skill with `bash _system/scripts/lint-skills.sh <skill-folder>`, or the shared files with `bash _system/scripts/lint-skills.sh _system`.

- Every pointer resolves. Write a pointer as a path: `references/x.md` or `modes/x.md` from the skill folder, `../_system/x.md`, or `<skill>/SKILL.md` from the pack root. A bare file name is not a pointer, so lint cannot check it.
- Every file in a skill folder besides SKILL.md, and every `_system` markdown file outside `schemas/` and `scripts/`, is pointed to by another pack markdown file. Self-pointers do not count.
- Every SKILL.md frontmatter has `name` and `description`, and its body has `## Reads` and `## Writes` headings outside fenced code.
- Model slugs parsed from the registry, and same-line model prices, appear only in `creative/references/MODEL_REGISTRY.md`. The registry is required when creative is installed.
- Named terms parsed from GLOSSARY.md _Avoid_ lists are forbidden in prose, headings and paths (case-sensitive, outside fenced code). Explanatory “using ...” prose and single lowercase sense-dependent words (`type`, `template`) remain review-only. The glossary is required, including in installed packs. For a legitimate other sense, add a term-specific line-local escape: `<!-- lint-allow-avoid: Build Mode -->`. For example, Build Mode may name actual work, not a first run; Iteration may mean creative refinement, not a returning run.
- No box frames or heavy dividers (┌ ┐ └ ┘ │ ━) in any skill or `_system` markdown file. Tree diagrams (├── └── │) are allowed inside code fences; ✓ ✗ ★ → are allowed anywhere.
- Warning only: SKILL.md over 500 lines.

`bash _system/scripts/loss-check.sh` reports base-ref heading bodies whose non-empty normalized text occurs nowhere in current skill or `_system` markdown. Identical relocated text does not warn. `BASE_REF` defaults to `origin/main`; CI uses the pull request base commit. This script always exits 0: investigate its warnings during review, since edits and legitimate deletions can also warn.

## Pack rules

- **Markdown output** ([ADR 0002](../adr/0002-markdown-output-format.md)). Output is markdown in four sections (Header, Content, Files Saved, What's Next) with ✓ ✗ ★ status symbols and → next steps.
- **`_system` is the single source** ([ADR 0003](../adr/0003-system-files-single-source.md)). Brand-memory and output rules live only in `_system/brand-memory.md` and `_system/output-format.md`. A skill keeps its own Reads (with depth), Writes, a load step and a feedback step, each pointing at `_system`.
- **The Reads list is the only context contract** ([ADR 0004](../adr/0004-per-skill-reads-replace-context-matrix.md)). Each skill's Reads list, stated positively with depth, is the only statement of which brand files it receives.
- **Glossary terms** ([GLOSSARY.md](../../GLOSSARY.md)). Mode, first run, returning run, Fallback, Format and data-quality label mean what the glossary says, and the terms it lists under _Avoid_ are not used for those meanings.
- **Single source of truth.** Each meaning has one home and every other file points to it. Model slugs and prices live only in `creative/references/MODEL_REGISTRY.md`; skill and mode files name roles. The AI-tells list and the content brief each have one shared home in `_system`. Before deleting text as a duplicate, diff it against its home and keep anything unique.

The reasons behind these rules are in [docs/rewrite-decisions.md](../rewrite-decisions.md).
