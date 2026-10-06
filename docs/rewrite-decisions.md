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
- R3 MODEL_REGISTRY.md is the only home for model slugs and prices: role → slug with reason, gotchas (set generate_audio and resolution explicitly), per-unit prices with a verified-on date. Drop mirrored parameter tables. SKILL.md and modes/ refer to roles.
- R4 Glossary reclassification: keyword-research "Refresh Mode" → returning run; seo-content Refresh → Mode; lead-magnet Build → Mode (Ideate → Build); content-atomizer Calendar → Mode; creative Prompt-Only → Fallback; newsletter type → Format.
- R5 Box-character lint covers every .md under skills and _system: ban ┌ ┐ └ ┘ │ ━ frames/dividers; allow ├── └── trees inside code fences and ✓ ✗ ★ →.
- R6 Blocking = hard violation of a written standard; judgement calls are warnings. Add docs/agents/standards.md pointing at /writing-for-agents plus our rules. 500 lines is a warning, not a lint failure. No fixture runs for now.
- R7 Keep situational sections, disclosed: /newsletter Mode Strategy (growth, monetization); /direct-response-copy Mode Testing (variants, scoring, A/B); /start-here campaign management in a disclosed file.
- R8 Wire keyword-plan, content-brief, email-sequence-summary schemas to the skills that write them; delete ad-matrix and campaign-brief schemas.
- R9 Freshness and volume rules live in brand-memory.md §Read and apply on every run, direct or via /start-here.
- R10 Shared homes: _system/ai-tells.md (direct-response-copy, seo-content Humanize); content brief = _system/schemas/content-brief.schema.json + short markdown template (written by keyword-research, read by seo-content).
- R11 Scripts derive file lists from the directory; doctor.sh keeps a short required list (each SKILL.md + _system files). First ticket, before any file moves.
- R12 ADRs 0003 (_system single source) and 0004 (per-skill Reads replace the Context Matrix).

## Accepted from the Matt verdict (docs/research/matt-verdict.md)
- Q11 /keyword-research and /seo-content stay single skills with phases in-file; disclose per-phase reference (templates, examples, checklists, schema JSON, outline structures); fold Implementation Notes into phases as positive completion criteria; delete Invocation Flow and Implementation Notes sections. Sequence-split only on observed rushing, across a subagent boundary.
- Q12 Delete restatements of _system; each skill keeps its Reads (with depth), Writes, a load step and a feedback step pointing at brand-memory.md. Reorganise brand-memory.md by branch. Cut output-format.md to the 4-section contract; skill-specific templates disclosed in their skill. No brand-memory skill.
- Q13 Each skill's Reads list (file + depth, positive) is the single source; delete start-here's Context Matrix and brand-memory's load table; start-here dispatch passes pointers plus session-only facts.
- Q14 One home per meaning: COPYWRITING_PLAYBOOK holds the craft library; content-atomizer one file per platform; newsletter one file per Format, ESP guidance disclosed. Diff text before deleting.
- Q15 Registry single source (R3); hero opt-in (R1); fix "model" field in payload bodies; fix creative's broken modes/ pointers.
- Q16 Prune remaining identity from descriptions; start-here dispatch invokes skills rather than "read the SKILL.md".

## Ticket order (for /to-tickets)
Prefactor: scripts derive lists (R11), lint-skills.sh + standards.md (Q7, R5, R6), sharpened _system files (Q12, R9, R10). Then one ticket per skill, blocked by prefactor; /creative last. Contract: delete start-here matrix and brand-memory load table, blocked by every skill ticket.

## Spec
- Published as GitHub issue #1: https://github.com/Davv5/boring-marketer-skills/issues/1
