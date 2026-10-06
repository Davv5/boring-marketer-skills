# Vibe Marketing Skills v2.0

Your marketing team in your coding agent. 11 skills that build on each other,
remember your brand, and get sharper every time you use them.

Built for Claude Code. Designed for founders, solo marketers, and small
teams who need senior-level marketing output without the senior-level
headcount.

---

## Quick Start

```
/start-here
```

That is the only command you need to remember. The orchestrator scans your
project, asks two questions, builds your brand foundation, and routes you
to the right skill for whatever you are working on.

---

## What Is in the Package

### Foundation Skills

| Skill | What it does |
|-------|-------------|
| `/start-here` | Scans your project, builds your brand foundation, routes you to the right skill |
| `/brand-voice` | Extracts or builds a voice profile so every piece of content sounds like you |
| `/positioning-angles` | Finds the market angle that makes your offer stand out and sell |

### Strategy Skills

| Skill | What it does |
|-------|-------------|
| `/keyword-research` | Maps your content territory with data-backed keyword clusters and priorities |
| `/lead-magnet` | Generates lead magnet concepts and builds the actual content (checklists, guides, templates) |

### Execution Skills

| Skill | What it does |
|-------|-------------|
| `/direct-response-copy` | Writes landing pages, sales copy, headlines, and CTAs that convert |
| `/seo-content` | Produces long-form articles optimized for search that read like a human wrote them |
| `/email-sequences` | Builds welcome, nurture, launch, and re-engagement email sequences |
| `/newsletter` | Creates newsletter editions and format templates modeled on top creators |
| `/creative` | AI-powered image, video, and graphic generation across five production modes |

### Distribution Skills

| Skill | What it does |
|-------|-------------|
| `/content-atomizer` | Repurposes one piece of content into platform-optimized posts across 8 platforms |

### Creative Modes

`/creative` reads the request, picks a Mode, and loads only that Mode's playbook:

| Mode | What it produces |
|------|-----------------|
| Product Photo | Studio-quality product photography with controlled lighting and composition |
| Product Video | Short-form product videos, demos, and motion content |
| Social Graphics | Platform-sized graphics for feeds, stories, covers, and carousels |
| Talking Head | Presenter-style video with lip sync from text or audio |
| Ad Creative | Performance ad variants with hook-format testing |

Models are chosen by role (default image, premium image, video test, default,
production, lip-sync) from `creative/references/MODEL_REGISTRY.md`, which holds
the current slugs, verified prices, and payload examples. A
multi-model hero comparison runs only when you ask for it, after the estimated
cost is shown. Without a Replicate token, `/creative` writes model-ready prompts
instead (a Fallback).

Other skills split the same way: `/brand-voice` (Extract, Build, Scrape),
`/lead-magnet` (Ideate, Build), `/seo-content` (Refresh), `/content-atomizer`
(Calendar), `/direct-response-copy` (Testing), and `/newsletter` (six Formats).
Mode and reference files load only when a run needs them.

---

## System Requirements

**Required:**
- Claude Code (Claude's official CLI)

**Optional (unlocks creative engine):**
- Replicate API key (`REPLICATE_API_TOKEN` in your `.env` file)
  Enables AI image generation, video production, and all `/creative` modes.

**Optional (enhances specific skills):**
- Email ESP API key (Mailchimp, ConvertKit, or HubSpot) for direct email deployment
- Buffer or Hootsuite API key for social post scheduling
- GA4 or PostHog for performance tracking

Skills detect your connected tools automatically and adapt. No tool is
required to start -- every skill produces portable markdown files you can
use anywhere.

---

## File Structure

```
README.md                  <- You are here
ARCHITECTURE.md            <- Design reasoning
CHANGES.md                 <- What changed from upstream v2.0
GLOSSARY.md                <- Vocabulary the skills share
_system/                   <- Shared files every skill points to
├── brand-memory.md        <- How skills read and write ./brand/
├── output-format.md       <- The four-section markdown output contract
├── ai-tells.md            <- Shared AI-tells editing checklist
├── content-brief.md       <- Content brief template
├── schemas/               <- JSON Schemas for files other tools read
│   ├── voice-profile.schema.json
│   ├── keyword-plan.schema.json
│   ├── content-brief.schema.json
│   └── email-sequence-summary.schema.json
└── scripts/
    ├── install.sh
    ├── doctor.sh          <- Health check (runs the lint)
    ├── lint-skills.sh     <- Pointer, orphan, frontmatter, format lint
    ├── e2e-fresh-install.sh
    └── package.sh
docs/
├── adr/                   <- Decisions not to reverse
├── agents/                <- Skill review standard
├── research/              <- Evidence behind the decisions
├── rewrite-decisions.md
└── playbook.md            <- The Vibe Marketing Playbook (background reading)
<skill>/                   <- One folder per skill
├── SKILL.md               <- Reads, Writes, steps, completion criteria
├── modes/                 <- One file per Mode, where the skill has several
└── references/            <- Templates, examples, platform and framework detail
```

The skills are `start-here`, `brand-voice`, `positioning-angles`,
`keyword-research`, `lead-magnet`, `direct-response-copy`, `seo-content`,
`email-sequences`, `newsletter`, `creative`, and `content-atomizer`.

---

## Install and Check

```
bash _system/scripts/install.sh              # all skills into ~/.claude/skills
bash _system/scripts/install.sh --claude-only   # skip /creative (no Replicate)
bash _system/scripts/doctor.sh               # health check, including lint
bash _system/scripts/lint-skills.sh          # lint only (one folder: pass its name)
bash _system/scripts/e2e-fresh-install.sh    # install into a temp HOME and verify
```

The lint checks that every pointer between files resolves, every mode and
reference file is pointed to, every SKILL.md has a name and description, and no
output uses box-drawing characters. Review standard: `docs/agents/standards.md`.

---


## How the Skills Work

### Brand Memory

Every skill reads from and writes to a shared `./brand/` directory at your
project root. This is how the system remembers who you are across sessions.

The first time you run `/start-here`, it creates your brand foundation:
- `voice-profile.md` -- How your brand sounds
- `positioning.md` -- Your market angle and differentiators
- `stack.md` -- Your connected tools and integrations
- `assets.md` -- Registry of everything the system has produced
- `learnings.md` -- Performance data that makes future output sharper

Each skill states its own Reads: the brand files it loads, and how much of
each. A keyword researcher does not need your voice profile; a copywriter does
not need your keyword plan. That list in the skill is the only statement of
what it receives, so there is no central table to drift out of date. The shared
rules for reading, freshness, writing and feedback live in
`_system/brand-memory.md`.

### Skill Chaining

Skills are organized into layers: Foundation, Strategy, Execution, and
Distribution. Each layer builds on the one before it.

```
Foundation    /brand-voice + /positioning-angles
     |
Strategy      /keyword-research, /lead-magnet
     |
Execution     /direct-response-copy, /seo-content, /email-sequences,
              /newsletter, /creative
     |
Distribution  /content-atomizer
```

The orchestrator (`/start-here`) handles routing and can chain skills into
complete workflows. Ask for "a lead magnet funnel" and it will run
`/lead-magnet`, `/direct-response-copy`, `/email-sequences`, and
`/content-atomizer` in sequence, passing a pointer to each step's output to the next.

### Output Formatting

Every skill answers in markdown, in four sections (`_system/output-format.md`):

1. **Header** -- What was produced and when
2. **Content** -- The deliverable, or a summary of it when it was saved to a file
3. **Files Saved** -- Exactly what was written to disk and where
4. **What's Next** -- Numbered next steps with the recommended one marked, and
   time estimates

Status uses ✓ (done), ✗ (missing), ★ (recommended) and → (next step). Long
deliverables go to files under `./brand/` or `./campaigns/`; the reply points at
them.

### Structured Files

Four files also carry a JSON block that matches a schema in `_system/schemas/`,
inside a `<details>` section at the bottom of the markdown file: the voice
profile, the keyword plan, the content brief, and the email sequence summary
(`./campaigns/{name}/sequence-summary.md`). Campaign briefs are plain markdown.

### Background Reading

[The Vibe Marketing Playbook](docs/playbook.md) is an article on the
process-over-prompts approach behind the workflows. It is background reading;
the skills do not depend on it. Design reasoning for the pack itself is in
[ARCHITECTURE.md](ARCHITECTURE.md).

---

## FAQ

**How do I update my brand voice after it is set?**

Run `/brand-voice` again. It detects the existing profile, shows you a
summary, and offers targeted update options -- adjust tone, update
vocabulary, add new samples, or full rebuild.

**How do I connect my email tool (Mailchimp, ConvertKit, etc.)?**

Add your API key to the `.env` file at your project root:
```
MAILCHIMP_API_KEY=your-key-here
```
Skills detect connected tools automatically on their next run. The
orchestrator will confirm the connection in your project scan.

**How do I connect the creative engine?**

Add your Replicate API token to `.env`:
```
REPLICATE_API_TOKEN=your-token-here
```
Then run `/creative` and it will detect the connection. Without Replicate,
the creative skill generates detailed prompts and briefs you can use with
any image/video tool.

**How do I get help or see my project status?**

Run `/start-here` at any time. It scans your entire project, shows what
exists, identifies gaps, and recommends the highest-impact next action.

**How do I run a multi-step workflow?**

Tell the orchestrator what you want in plain language:
- "Build me a lead magnet funnel"
- "Launch my product"
- "Create a content system"
- "Start a newsletter"

It recognizes these as multi-skill workflows and chains the right skills
together automatically.

**Can I edit the output files manually?**

Yes. Every file the system writes is human-readable markdown. Edit freely.
Skills check for existing files before overwriting and will show you a
diff and ask for confirmation before replacing anything.

**How does the system improve over time?**

After major deliverables, skills ask for feedback. Your responses are
logged to `./brand/learnings.md`. Future skill runs read relevant
learnings and adjust their output. The more you use it, the better it
gets at matching your preferences.

**What if I want to start over?**

Run `/start-here` and tell it you want to reset. It will guide you
through removing the `./brand/` and `./campaigns/` directories. No
files are deleted without your explicit confirmation.

**Where do campaign assets go?**

Skills write campaign assets to `./campaigns/{campaign-name}/`, with a
`brief.md` per campaign and subdirectories by asset type.
Every asset is also registered in `./brand/assets.md` so the orchestrator
can track your full inventory.

---

## Version

v2.0 base, rewritten. 11 marketing skills, shared brand memory with per-skill
Reads, markdown output, disclosed modes and references, pre-built multi-skill
workflows, JSON schemas for the four files other tools consume, and a lint plus
health check. See [CHANGES.md](CHANGES.md).
