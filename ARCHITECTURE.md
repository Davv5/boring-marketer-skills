# Architecture

Why the pack is built the way it is. The mechanics are in the skills and `_system/` files; the decisions that should not be reversed are in [`docs/adr/`](docs/adr/); the full decision log is [`docs/rewrite-decisions.md`](docs/rewrite-decisions.md); vocabulary is [`GLOSSARY.md`](GLOSSARY.md).

## What the pack is

Eleven markdown skills for Claude Code and Pi that share one brand memory and hand work to each other. There is no runtime: a skill is instructions the model follows. `/start-here` is user-invoked (`disable-model-invocation: true`); the other ten are model-invoked, so their descriptions are the only always-loaded text and stay short.

The layers describe natural order, not dependencies: Foundation (`/brand-voice`, `/positioning-angles`), Strategy (`/keyword-research`, `/lead-magnet`), Execution (`/direct-response-copy`, `/seo-content`, `/email-sequences`, `/newsletter`, `/creative`), Distribution (`/content-atomizer`). Any skill runs alone.

## Layout

```
_system/            shared files every skill points to
  brand-memory.md   how skills read and write ./brand/
  output-format.md  the four-section markdown output contract
  ai-tells.md       the shared AI-tells editing checklist
  content-brief.md  the content brief template
  schemas/          JSON Schemas for files that feed other tools
  scripts/          install, doctor, lint, e2e, package
<skill>/SKILL.md    the entry file: Reads, Writes, steps, completion criteria
<skill>/modes/      one file per Mode, read only when that Mode runs
<skill>/references/ examples, templates and platform detail, read at the step that needs them
docs/               ADRs, decision log, research, standards, background reading
```

## Design reasoning

**A skill file is a map, not a manual.** SKILL.md holds the steps and what "done" means for each; detail sits one pointer away in `modes/` and `references/`, so a run loads only the branch it takes. The review standard is [`docs/agents/standards.md`](docs/agents/standards.md), built on `/writing-for-agents`. The lint script enforces the mechanical half: every pointer resolves, every file in a skill folder is pointed to, frontmatter is complete, no box characters.

**Disclose by branch.** A Mode (kind of work), a Format (output shape inside a Mode) and a Fallback (what happens when a tool is missing) each get their own file where they are large. The terms are fixed in the glossary so skills do not call the same thing three names.

**One source per meaning.** `_system/` owns the brand-memory and output rules, and each skill keeps only its Reads, Writes, a load step and a feedback step ([ADR 0003](docs/adr/0003-system-files-single-source.md)). The upstream copies of those rules had drifted apart. Model slugs and prices live only in `creative/references/MODEL_REGISTRY.md`.

**The Reads list is the only context contract** ([ADR 0004](docs/adr/0004-per-skill-reads-replace-context-matrix.md)). More brand context does not make output better: a keyword skill that receives the full voice profile and email history drifts from search intent. So each skill names the brand files it loads and the depth ("positioning.md: chosen angle only"), and `/start-here` dispatches by pointer. A central matrix would become a stale copy of the skills, which is what happened upstream.

**One orchestrator, thin dispatch.** `/start-here` scans the project, takes a first-run or returning-run branch, recommends one next skill and chains skills for multi-step jobs, with the user's scope choice confirmed before a chain of three or more steps ([`start-here/SKILL.md`](start-here/SKILL.md), [`start-here/references/workflows.md`](start-here/references/workflows.md)). It passes a pointer to the previous output and session-only facts; the dispatched skill loads its own context.

**Standalone first, brand memory as enhancement.** Without `./brand/` a skill asks for what it needs and works; each profile file it finds makes the output more specific. §Read in `brand-memory.md` states the freshness and volume rules once, for direct runs and dispatched runs alike. No skill fails on a missing brand file; it names the gap in one line and says which skill would fill it.

**Markdown output** ([ADR 0002](docs/adr/0002-markdown-output-format.md)). Every skill answers in four sections (Header, Content, Files Saved, What's Next) with ✓ ✗ ★ → symbols. Both Claude Code and Pi render markdown, so the upstream box-drawing system was dropped. Long deliverables go to files; the output is the navigation layer.

**Schemas only where another tool reads the file.** `voice-profile`, `keyword-plan`, `content-brief` and `email-sequence-summary` have schemas. The writing skill keeps markdown primary and appends a conforming JSON block in a `<details>` section. Campaign briefs are plain markdown defined in `brand-memory.md` §Campaigns.

**The `/creative` lineup is researched, not remembered.** Models, prices and payload gotchas were verified against Replicate and recorded with a date ([`docs/research/replicate-models-2026-10.md`](docs/research/replicate-models-2026-10.md)). Skills name roles, not slugs. A multi-model hero comparison runs only on request, with cost shown first.

**Fork, not merge** ([ADR 0001](docs/adr/0001-fork-from-upstream.md)). Upstream changes are ported by hand.

## Checks

`_system/scripts/doctor.sh` is the health check: required files, schemas, scripts, each skill, and the lint script over the whole pack. `_system/scripts/e2e-fresh-install.sh` installs into a temporary HOME, runs doctor and checks every file landed non-empty. Both discover skills by folder, so adding a reference or mode file needs no script edit. The GitHub Actions workflow runs the health check on push.

## Known gaps

- No automated test of skill behaviour; checks cover structure, pointers and installation only.
- No analytics on which skills run or where users stop.
- `audience.md` and `competitors.md` are read by several skills and written by hand.
- One brand per project directory; agencies need one directory per brand.
- `/creative` generation needs a Replicate token; without one it writes prompts.
