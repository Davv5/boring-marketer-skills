# Rewrite decisions (grill-with-docs log)

Running log of settled decisions for the skill rewrite, fed into `/to-spec`. Hard-to-reverse decisions also get an ADR in `docs/adr/`.

## Round 1
- Q1 Fork, no upstream merges. ADR 0001.
- Q2 Rewrite all 11 skills; `/creative` last (waits on model research).
- Q3 Keep install.sh, doctor.sh, package.sh, e2e-fresh-install.sh working; update their manifests.
- Q4 Markdown output; keep 4-section structure and ✓ ✗ ★ → symbols. ADR 0002.
- Q5 "Mode" = kind of work in one run; first run / returning run; data-quality label. GLOSSARY.md.
- Q6 SKILL.md ceiling 500 lines, most under 300.

## Round 2
- Q7 Done = `doctor.sh` + `e2e-fresh-install.sh` pass, plus new `_system/scripts/lint-skills.sh` (run by doctor): SKILL.md ≤ 500 lines, every referenced path exists, every references/ and modes/ file is pointed to, frontmatter has name + description, no box-drawing characters. `/code-review` against `/writing-for-agents` has no blocking findings.
- Q8 Apply all of `/writing-for-agents` per skill, not just length.
- Q9 Cut ARCHITECTURE.md to ~80 lines of design rationale; point to docs/adr/ and the skills.
- Q10 Move `The Vibe Marketing Playbook.md` to `docs/playbook.md`, linked from README.

## Facts gathered
- Section map: docs/research/skill-section-map.md. Broken pointers: creative/SKILL.md → modes/product-photos.md, modes/product-videos.md (files are singular).
- Model research: docs/research/replicate-models-2026-10.md.
- Matt-standard review of Q11-Q17: docs/research/matt-verdict.md.

## Round 4 (owner answers to the Matt verdict's open items)
- R1 Hero comparison (multi-model parallel video) runs only on explicit request, with estimated cost shown first.
- R2 Adopt the researched lineup now (docs/research/replicate-models-2026-10.md), no side-by-side prototype.
