---
name: seo-content
description: "Write or refresh a search-focused article for a target keyword, using live SERP research when available."
---

# /seo-content

Write or refresh a publication-ready article that answers search intent, adds a defensible perspective, and is saved with useful metadata and structured data.

## Reads

- `./brand/voice-profile.md` — voice and vocabulary.
- `./brand/keyword-plan.md` — prioritized keywords and existing research.
- `./brand/audience.md` — reader needs and expertise.
- `./brand/positioning.md` — differentiation and point of view.
- `./brand/competitors.md` — competitor context.
- `./brand/learnings.md` — prior content performance.
- `./campaigns/content-plan/{keyword-slug}.md` — this keyword's brief and research, when present.

Read available files at the depth needed for this article. The list is positive: missing files simply leave that context unavailable. Load brand context under `../_system/brand-memory.md` §Read; apply its depth, freshness, gap-report, and conflict rules.

## Writes

- `./campaigns/content/{keyword-slug}.md` — article, metadata, and schema.
- `./brand/assets.md` — append the published-work record using `../_system/brand-memory.md` §Write.
- `./brand/learnings.md` — append performance learning after user feedback, using `../_system/brand-memory.md` §Write.

## Load

Check whether brand files and the campaign content directory exist, then load available Reads per `../_system/brand-memory.md` §Read. Ask for or confirm the target keyword, audience, intent, content Format, and angle using existing context and brief values first. With no brand directory or brief, ask the user for essential inputs and proceed independently. Completion: required inputs and every available Read have been accounted for.

## Choose a Mode

A **first run** creates an article. A **returning run** offers a targeted update when an article already exists at `./campaigns/content/{keyword-slug}.md`. For a returning run, read the article and ask whether to Refresh, rewrite, expand, or start fresh; use `modes/refresh.md` for the Refresh Mode. Completion: the chosen Mode and existing article state are clear.

## Phase 1: Research

Search the target keyword and examine the top five results. Record title, URL, content Format, approximate length, structure, angle, strengths, gaps, and freshness. Capture relevant People Also Ask questions, Featured Snippet format, and AI Overview presence. Identify what is missing, outdated, generic, and where this brand has an evidence-based edge. Present a concise opportunity assessment.

Web search available: report the data-quality label **LIVE** and research the current SERP. Web search unavailable: report **ESTIMATED**, explain the limitation, and ask whether to proceed on conceptual analysis or wait for search access. On approval, use brand context and user input, label SERP-derived claims with `~`, and continue. Apply `../_system/brand-memory.md` §Data-quality label.

Completion: research findings and their data-quality label are explicit, or the user chose to wait for live research.

## Phase 2: Content Brief

Read `./campaigns/content-plan/{keyword-slug}.md` when available. Enrich it with the research; fill missing fields using evidence and user input. Use `../_system/content-brief.md` and `../_system/schemas/content-brief.schema.json` as the shared brief format. Record target and secondary keywords, intent, content Format, word-count range, audience, angle, key points, PAA questions, content gaps, internal links, and CTA. Give metrics and claims the applicable data-quality label.

Completion: the brief covers each relevant field and distinguishes known information from estimates.

## Phase 3: Outline

Build a structure matched to intent, Format, SERP, and reader need; use PAA questions as headings or concise FAQ entries. Select one of the four outline structures in `references/content-structures.md` (pillar guide, how-to, comparison, listicle), adapting rather than forcing its length or sections. Completion: every brief priority and important reader question has an assigned place in the outline.

## Phase 4: Draft

Draft against the outline. Match `voice-profile.md` when available; otherwise write directly, conversationally, specifically, and with a clear point of view. Answer the query in the opening, connect features to reader outcomes, support claims with real evidence, and use positioning to shape framing rather than alter the keyword's intent. Mark unverifiable specifics for confirmation instead of inventing experience or results.

Completion: every outline section is drafted and factual claims have evidence or an explicit verification need.

## Phase 5: Humanize

Edit the finished draft for generic phrasing, repetitive structure, unsupported certainty, and uniform rhythm. Apply `../_system/ai-tells.md` as the shared editing checklist. Keep the useful specifics and examples in `references/content-structures.md` where relevant to the article's Format. Completion: the draft reads naturally, retains its evidence, and reflects a specific voice.

## Phase 6: Optimize

Check that the title and H1 serve the query; the opening answers it; relevant primary and secondary terms occur naturally; metadata is compelling; headings are scannable; and internal and authoritative external links support the reader. Shape concise direct answers for snippet opportunities and ensure image alt text describes the image. Avoid keyword stuffing and unsupported claims.

Completion: the article meets relevant on-page checks without compromising clarity or accuracy.

## Phase 7: Schema

Generate Article and FAQPage JSON-LD; add HowTo JSON-LD for how-to content. Use the disclosed JSON examples in `references/content-structures.md`. Use known author, publisher, dates, URL, and article facts; leave explicit placeholders where the user must supply values. Completion: schema matches the article and is included in its frontmatter.

## Phase 8: Review and Save

Review completeness against intent, brief, PAA, and SERP gaps; verify voice, evidence, links, metadata, and schema. Save markdown to `./campaigns/content/{keyword-slug}.md`, creating the directory as needed. Include YAML frontmatter for title, meta description, keywords, content Format, intent, target and actual word counts, author, created/updated dates, status, SERP snapshot date, PAA count, and schema fields. Include the article body and FAQ where appropriate. Present the result according to `../_system/output-format.md`.

Completion: the saved file exists, its metadata and schema agree with the reviewed article, and the user receives the path and next action.

## Feedback

After the deliverable, use `../_system/brand-memory.md` §Feedback for the canonical performance prompt and learning format. Record only article-specific learning in `./brand/learnings.md` when the user provides it. Completion: feedback is handled through the shared protocol and any useful learning is appended.

## References

- `references/content-structures.md` — four outline structures, schema JSON examples, and article-specific output fields; read during Phases 3 and 7, and when preparing Phase 8 metadata.
- `references/eeat-examples.md` — examples of experience, expertise, authority, and trust signals; read during Phase 4 or Phase 8 when claims need an E-E-A-T check.
- `modes/refresh.md` — existing-article SERP comparison and update workflow; read only for Refresh Mode.
