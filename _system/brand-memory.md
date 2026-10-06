# Brand Memory Protocol

Brand memory is the `./brand/` directory at the project root: what every skill knows about the user's brand, built up as they run skills. This file is the only statement of how skills read and write it.

Every skill takes the same three steps from here:

- **Load step** (first): §Read, applied to the files in the skill's own Reads list.
- **Write step**: §Write, for each brand file the skill produces.
- **Feedback step** (last, after a deliverable): §Feedback.

The branches at the end (§Campaigns, §Stack and tools, §Data-quality label) apply only to skills that do that work.

---

## Read

Run this on every invocation, whether the user called the skill directly or `/start-here` dispatched it. The step is done when every file in the skill's Reads list is either loaded at its depth or named in one status line as missing or stale.

### 1. Check for the directory

If `./brand/` does not exist, skip the rest of §Read and run the skill standalone. Open with: "I don't see a brand profile yet. You can run /start-here or /brand-voice first to set one up, or I'll work without it."

### 2. Load the Reads list at its depth

Load only the files the skill's Reads list names, at the depth it names. Too much context makes the model summarise instead of using the details, so depth matters as much as the file. Where a Reads entry gives no depth, use this one:

| File | Depth |
|------|-------|
| voice-profile.md | Full file |
| positioning.md | Chosen angle only |
| audience.md | Pain points and language sections |
| competitors.md | Names and positioning claims |
| learnings.md | Entries relevant to this skill's domain |
| creative-kit.md | Full file |
| keyword-plan.md | Target keyword and its brief only |
| Campaign brief | Full file |

### 3. Apply the freshness rules

Date each profile file by its `## Last Updated` line, or by its modified time if it has none, then:

| Age | Action |
|-----|--------|
| Under 7 days | Use as-is. |
| 7 to 30 days | Use, and note: "This is from {date}. Tell me if it's outdated." |
| 30 to 90 days | Use a summary only, and verify with the user any point the output relies on. |
| Over 90 days | Leave it unloaded and say: "Your {file} is over 3 months old. Run {owner skill} to refresh it before this task." |

### 4. Report gaps in one line

When files are missing or held back as stale, consolidate them into a single status line: "Brand profile is partial (loaded voice-profile.md; positioning and audience not yet created)." Then ask the questions the missing file would have answered, or proceed with stated defaults. End the run's What's Next with the one owner skill that would fill the biggest gap.

### 5. Use loaded context visibly

Say what you loaded and how it shapes the work: "Your positioning is 'The Anti-Course Course'. I'll build this sequence around that angle." This lets the user correct stale data.

When voice-profile.md is loaded, write the whole output in that voice (analysis and recommendations as well as copy): its sentence length, its vocabulary, its pacing, none of the words it avoids. The opening acknowledgement uses the brand's own words.

### 6. Confirm conflicts

When a brand file conflicts with what the user says in this session, flag it and ask before overriding: "Your voice profile says you avoid humor, but this brief is playful. Want me to update the voice profile?"

---

## Feedback

After delivering a major deliverable (email sequence, landing page, ad set, content piece, profile, plan), present this prompt. The step is done when the prompt is shown and the answer, if given, is processed below.

```
How did this perform?

a) Great: shipped as-is
b) Good: made minor edits
c) Rewrote significantly
d) Haven't used it yet

(You can answer later: run this skill again and tell me.)
```

- **(a) Great**: log to learnings.md under "What Works", naming what was delivered and its specifics (angle, tone, format).
- **(b) Minor edits**: ask "What did you change? Even small details help me improve." Log the change. If it points at voice, suggest updating voice-profile.md.
- **(c) Rewrote significantly**: ask "Can you share what you changed or paste the final version? I'll learn from the diff." Log the specific differences under "What Doesn't Work". If they show a pattern in a brand file (voice, positioning), suggest re-running that file's owner skill.
- **(d) Haven't used it yet**: log nothing. On this skill's next run, if assets.md still shows the deliverable as `draft`, ask how it went.

### learnings.md format

Append-only. Create it with this template if it does not exist.

```markdown
# Learnings Journal

> Auto-maintained by Vibe Marketing Skills. Newest entries at the bottom of each section.
> Skills append here after deliverable feedback. Never delete entries.

## What Works
- [2026-01-15] [/email-sequences] Subject lines with numbers outperform questions (62% vs 41% open rate)

## What Doesn't Work
- [2026-01-20] [/creative] Stock photography feels off-brand; AI-generated with brand colors works better

## Audience Insights
- [2026-01-25] [/newsletter] Tuesday 7am sends outperform Thursday 10am by 23%
```

Each entry starts with `[YYYY-MM-DD] [/skill-name]` and states a specific, actionable observation: "subject lines under 40 characters had 15% higher open rates", not "emails worked well". When unsure of the section, use Audience Insights.

---

## Write

### The ./brand/ directory

```
./brand/
  voice-profile.md        <- /brand-voice
  positioning.md          <- /positioning-angles
  audience.md             <- written by hand (optional)
  competitors.md          <- written by hand (optional)
  creative-kit.md         <- /creative setup
  stack.md                <- /start-here (tools, API keys, connected services)
  keyword-plan.md         <- /keyword-research
  assets.md               <- asset registry, appended by all skills
  learnings.md            <- feedback journal, appended by all skills
```

Each profile file has one owner skill, named after the arrow. Any skill may read any file; a skill writes only the profile files it owns.

### Profile files (create or overwrite)

`voice-profile.md`, `positioning.md`, `audience.md`, `competitors.md`, `creative-kit.md`, `stack.md`, `keyword-plan.md` hold the current state of one brand dimension.

- **New file**: write it to `./brand/{filename}.md` and confirm: "Created your voice profile at ./brand/voice-profile.md."
- **Existing file**: read it, show the user what will change ("Your current positioning focuses on 'speed'. The new version shifts to 'simplicity'."), and overwrite only after they confirm. Then summarise the changes.

Start every profile file with a `## Last Updated` line giving the date and the skill that wrote it; §Read's freshness rules date files by it. Keep files readable by a marketer in a text editor.

### Append-only files (assets.md, learnings.md)

Append new entries at the bottom of the right section, keeping every existing entry, and confirm: "Added 3 new assets to the registry." If the file does not exist, create it from its template first. learnings.md's template is in §Feedback.

assets.md template:

```markdown
# Asset Registry

> Auto-maintained by Vibe Marketing Skills. Do not manually reorder.
> New entries are appended at the bottom of the Active Assets table.

## Active Assets

| Asset | Type | Created | Campaign | Status | Notes |
|-------|------|---------|----------|--------|-------|
| welcome-sequence | Email (6-part) | 2026-01-15 | spring-launch | live | 42% open rate |

## Retired Assets

| Asset | Type | Retired | Reason |
|-------|------|---------|--------|
```

Add each asset you create as a row at the bottom of Active Assets with Status `draft`. The user moves it to `live`; a retired asset moves to Retired Assets with a reason.

### Schemas

Files with a structured contract have a JSON Schema in `_system/schemas/`. The skill that writes the file conforms to it: the markdown stays primary, and a JSON block matching the schema goes at the bottom inside a `<details>` section.

| File | Schema | Written by |
|------|--------|------------|
| ./brand/voice-profile.md | voice-profile.schema.json | /brand-voice |
| ./brand/keyword-plan.md | keyword-plan.schema.json | /keyword-research |
| Content brief, `./campaigns/content-plan/{keyword-slug}.md` | content-brief.schema.json, with its markdown template in `_system/content-brief.md` | /keyword-research (read by /seo-content) |
| ./campaigns/{name}/sequence-summary.md | email-sequence-summary.schema.json | /email-sequences |

---

## Campaigns

For skills that create campaign assets. Campaigns are time-bound projects that use brand memory; they live outside it.

```
./campaigns/
  {campaign-name}/          <- lowercase-kebab-case, e.g. spring-launch-2026
    brief.md                <- goal, angle, audience segment
    emails/                 <- 01-delivery.md, 02-quick-win.md, ...
    social/                 <- linkedin/, twitter/, instagram/
    ads/                    <- ad creative briefs and image prompts
    landing-page.md
    results.md              <- performance data (manual or API-pulled)
```

Every campaign directory has a `brief.md`:

```markdown
# Campaign: {Name}

## Goal
{What success looks like, with a number if possible}

## Angle
{The positioning angle being used, from ./brand/positioning.md}

## Audience Segment
{Who this targets, from ./brand/audience.md}

## Timeline
{Start date - End date}

## Channels
{Where this campaign will run}

## Status
{planning | active | complete}

## Voice Notes
{Any campaign-specific adjustments to ./brand/voice-profile.md}
```

When you create a campaign asset: save it in the campaign directory, work from the campaign brief, and add it to `./brand/assets.md` with its path.

---

## Stack and tools

For skills that can use external tools. Resolve each tool in this order:

1. **MCP server**: if a relevant server is running (Playwright for screenshots, Firecrawl for scraping), use its tools.
2. **API key**: otherwise look in `.env` for the key (`REPLICATE_API_TOKEN`, `MAILCHIMP_API_KEY`) and call the API directly.
3. **Importable files**: otherwise output files the user can import by hand, such as email HTML for any ESP.
4. **Ask**: if nothing is configured for a tool category, ask: "What email tool do you use? I can output in a format that works with it, or help you connect it for next time."

After resolving a tool, add it to `./brand/stack.md` if it is not listed. stack.md template:

```markdown
# Marketing Stack

> Written by /start-here. Updated when new tools are connected.

## Connected Tools

| Tool | Type | Status | Config |
|------|------|--------|--------|
| Replicate | Image/Video API | connected | API key in .env |

## MCP Servers

| Server | Tools Available | Status |
|--------|----------------|--------|
| firecrawl | Web scraping, competitor research | running |

## Not Connected (Recommended)

| Tool | Why | Setup |
|------|-----|-------|
| ConvertKit | Better creator-focused email than Mailchimp | Run /start-here to configure |
```

---

## Data-quality label

For any output that depends on external research (SERP data, keyword volumes, competitors, trending topics, news), state right after the header and before the content where the research came from:

- **LIVE**: web search or an MCP research tool was available. List the sources consulted (the first few, then "and {n} more").
- **ESTIMATED**: no research tool was available. Before proceeding, ask: "I don't have web search connected. I can give you a conceptual analysis based on what I know, but live data would be more accurate. Want me to proceed, or set up web search first?" To upgrade, the user connects a web search MCP server (firecrawl, playwright or web-search).

When the user proceeds on ESTIMATED data, mark each estimate in the output: prefix figures with `~` (`~2,400 monthly searches`) and tag claims that need checking: "Estimated: competitor X likely ranks for this term (verify with a live SERP check)."
