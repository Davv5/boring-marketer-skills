---
name: keyword-research
description: "Research search demand and build a prioritized keyword plan and content briefs. Use when choosing what content to create or refreshing an existing plan."
---

# /keyword-research

Turn business context and search evidence into a prioritized keyword plan and optional content briefs.

## Reads

- `./brand/positioning.md` — read fully; offer, category, differentiators.
- `./brand/audience.md` — read fully; buyers, needs, language, sophistication.
- `./brand/competitors.md` — read fully; named competitors and positioning.
- `./brand/keyword-plan.md` — read fully when present; this makes the run a returning run.

## Writes

- `./brand/keyword-plan.md` — complete prioritized plan, including its schema JSON block.
- `./campaigns/content-plan/{keyword-slug}.md` — one content brief per selected priority, status `planned`, with schema JSON block.
- `./brand/assets.md` — append each created brief.

## Steps

### 1. Load

Apply `_system/brand-memory.md` §Read to the Reads above, including its depth, freshness, missing-file, and visible-use rules. Treat a prior keyword plan as context for a returning run, not as a command to retain weak choices. If brand files are absent, continue by asking the user for the relevant context.

**Complete when:** every available Reads file has been loaded and every missing or stale file is identified according to §Read.

### 2. Confirm the brief

For a first run, establish the business or offer, audience, website, competitors, goal, and timeline. Prefill from loaded brand files and ask the user to confirm; only ask for missing or changed facts. For a returning run, summarize the plan's pillars, highest-priority targets, brief statuses, and date, then ask whether to refresh SERP evidence, add a topic, reprioritize, rebuild, or create briefs. Confirm the chosen scope before research.

**Complete when:** the user has confirmed business context and the first-run or returning-run scope.

### 3. Seed

Generate 20–30 seed phrases from direct offers, audience problems, desired outcomes, category language, and actual differentiators. Keep market language primary: positioning shapes the angle, not demand. Record the seeds and source context in the plan. For the complete seed categories and examples, read [`references/research-methods.md`](references/research-methods.md) §Phase 1.

**Complete when:** seeds cover the confirmed business and audience without relying on product-only terms.

### 4. Expand

Expand seeds across six lenses: what is sold, problems solved, outcomes, positioning, audience-adjacent topics, and entities to associate with. Add useful questions, modifiers, alternatives, and comparisons. Deduplicate and retain a manageable candidate set (typically 100–200); preserve the source of promising candidates. For the per-circle examples and expansion patterns, read [`references/research-methods.md`](references/research-methods.md) §Phase 2.

**Complete when:** candidates span the six lenses and duplicates are removed.

### 5. Search and validate

Use available web search for autocomplete, People Also Ask (PAA), current top results, SERP features, and competitor coverage. Search pillar candidates and the strongest long-tail candidates; do not claim unavailable volume or difficulty as measured data. Label estimates per `_system/brand-memory.md` §Data-quality label. Record evidence, URLs, result formats, freshness, weak/thin results, forum presence, and content gaps. When search is unavailable, use the Fallback: report the limitation, label judgments as ESTIMATED, and continue only with user agreement. For query patterns, data capture details, signal interpretation, and the four pillar checks, read [`references/research-methods.md`](references/research-methods.md) §§Phase 3 and Phase 5.

Validate each proposed pillar against four checks: search demand evidence; market rather than product focus; a realistic competitive path; and a proprietary advantage or credible differentiated angle. Demote or remove a pillar failing two or more checks. Use the evidence to distinguish High/Medium/Low business value, opportunity, and speed to win; prioritize commercial relevance, winnability, and freshness together.

**Complete when:** every retained pillar has evidence for all four checks and data-quality labels on estimates.

### 6. Cluster and prioritize

Group keywords by shared topic and search intent. For the cluster example, validation tests, value/opportunity/speed scales, and full priority matrix, read [`references/research-methods.md`](references/research-methods.md) §§Phase 4 and Phase 6. Each cluster has one pillar topic, supporting queries, intent, evidence, priority, and notes. Avoid assigning the same query to competing targets. Rank with the priority vocabulary `do-first`, `do-second`, `do-third`, `quick-win`, `long-play`, or `backlog`; use the keyword-plan schema's own allowed `high`, `medium`, `low` cluster priority when writing its JSON representation.

**Complete when:** every candidate is assigned to a cluster, intentionally excluded, or retained as an unassigned opportunity, and each cluster has a justified priority.

### 7. Map and save the plan

Map priority clusters to content pieces using dominant intent and the actual SERP format. For content-type guidance, intent-to-format matching, calendar tiers, and PAA outline example, read [`references/research-methods.md`](references/research-methods.md) §Phase 7. Build a roadmap with target keyword, title, type, suggested word-count range, priority, and status. Use PAA questions and content gaps to inform outlines. Save the plan to `./brand/keyword-plan.md`, following `_system/schemas/keyword-plan.schema.json`; include the matching JSON block in a `<details>` section as specified by `_system/brand-memory.md` §Write. For a returning run, compare old and proposed clusters, targets, priorities, and statuses; show material changes and get confirmation before overwriting.

**Complete when:** the confirmed plan is saved with a schema-valid JSON block and returning-run changes were approved.

### 8. Create briefs and report

Ask whether to create briefs if scope is not already agreed. Create briefs for the highest-priority unbriefed targets, normally 3–5 unless the user chooses otherwise. Follow `_system/content-brief.md` and `_system/schemas/content-brief.schema.json`; include current SERP evidence, intended audience, angle, differentiation, key points, outline, internal-link suggestions, CTA, and output path where known. Append each created brief to `./brand/assets.md` following §Write. Present results using `_system/output-format.md`'s four-section contract. Apply `_system/brand-memory.md` §Feedback after the deliverable and record keyword-specific learning when offered.

**Complete when:** agreed briefs are saved and registered, the four-section report is delivered, and §Feedback is complete.

## Disclosed output examples

- For the detailed keyword-plan structure, representative clusters, roadmap, and terminal report example, read [`references/plan-examples.md`](references/plan-examples.md) while completing Steps 6–8.
- For a complete sample brief, read [`references/brief-example.md`](references/brief-example.md) while completing Step 8.
