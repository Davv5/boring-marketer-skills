---
name: seo-content
description: "Write or refresh a search-focused article for a target keyword, using live SERP research when available. Use when a keyword needs a publication-ready article or an existing article needs updating."
---

# /seo-content

Write or refresh a publication-ready article that answers search intent, adds a defensible perspective, and is saved with useful metadata and structured data.

## Reads

- `./brand/voice-profile.md` — full file.
- `./brand/keyword-plan.md` — target cluster and roadmap entries.
- `./brand/audience.md` — pain points, language, and expertise.
- `./brand/positioning.md` — chosen angle only.
- `./brand/competitors.md` — competitor names and relevant content entries.
- `./brand/learnings.md` — content-performance entries.
- `./campaigns/content-plan/{keyword-slug}.md` — full file when present.

## Writes

- `./campaigns/content/{keyword-slug}.md` — article, metadata, and schema.
- `./brand/assets.md` — append the published-work record using `../_system/brand-memory.md` §Write.
- `./brand/learnings.md` — append performance learning after user feedback, using `../_system/brand-memory.md` §Write.

## Load

Check whether brand files and the campaign content directory exist, then load available Reads per `../_system/brand-memory.md` §Read. Ask for or confirm the target keyword, audience, intent, content Format, and angle using existing context and brief values first. With no brand directory or brief, ask the user for essential inputs and proceed independently. Completion: required inputs and every available Read have been accounted for.

## Choose the work

Create a new article or update the existing article at `./campaigns/content/{keyword-slug}.md`. For an existing article, read it and ask whether to Refresh, rewrite, expand, or create a distinct article; read `modes/refresh.md` only for Refresh Mode. Completion: the chosen work and existing article state are clear.

## Phase 1: Research

Search the target keyword and examine the top five results. Record title, URL, content Format, approximate length, structure, angle, strengths, gaps, and freshness. Capture relevant People Also Ask questions, Featured Snippet format, and AI Overview presence. Identify what is missing, outdated, generic, and where this brand has an evidence-based edge. Present a concise opportunity assessment.

Web search available: report the data-quality label **LIVE** and research the current SERP. Web search unavailable: report **ESTIMATED**, explain the limitation, and ask whether to proceed on conceptual analysis or wait for search access. On approval, use brand context and user input, label SERP-derived claims with `~`, and continue. Apply `../_system/brand-memory.md` §Data-quality label.

Detailed SERP capture and People Also Ask expansion procedure: `references/workflow-detail.md` (Phase 1). Completion: research findings and their data-quality label are explicit, or the user chose to wait for live research.

## Phase 2: Content Brief

Read `./campaigns/content-plan/{keyword-slug}.md` when available. Enrich it with the research; fill missing fields using evidence and user input. Use `../_system/content-brief.md` and `../_system/schemas/content-brief.schema.json` as the shared brief format. Record target and secondary keywords, intent, content Format, word-count range, audience, angle, key points, PAA questions, content gaps, internal links, and CTA. Give metrics and claims the applicable data-quality label.

Completion: the brief covers each relevant field and distinguishes known information from estimates.

## Phase 3: Outline

Build a structure matched to intent, Format, SERP, and reader need; account for every captured PAA question as an H2 or FAQ entry, with deeper questions as sections and brief answers in the FAQ. Select one of the four outline structures in `references/content-structures.md` (pillar guide, how-to, comparison, listicle), adapting rather than forcing its length or sections. Completion: every brief priority and important reader question has an assigned place in the outline.

## Phase 4: Draft

Draft against the outline. Match `voice-profile.md` when available; otherwise write directly, conversationally, specifically, and with a clear point of view. Answer the query in the opening, connect features to reader outcomes, support claims with real evidence, and use positioning to shape framing rather than alter the keyword's intent. Mark unverifiable specifics for confirmation instead of inventing experience or results.

For detailed drafting examples, voice techniques, and positioning illustrations, read `references/workflow-detail.md` (Phase 4). Completion: every outline section is drafted and factual claims have evidence or an explicit verification need.

## Phase 5: Humanize

Edit the finished draft for generic phrasing, repetitive structure, unsupported certainty, and uniform rhythm. Apply `../_system/ai-tells.md` as the shared editing checklist. Keep the useful specifics and examples in `references/content-structures.md` where relevant to the article's Format. SEO-specific before/after examples, voice-injection examples, and rhythm advice are in `references/workflow-detail.md` (Phase 5). Completion: the draft reads naturally, retains its evidence, and reflects a specific voice.

## Phase 6: Optimize

Check that the title and H1 serve the query; the opening answers it; relevant primary and secondary terms occur naturally; metadata is compelling; headings are scannable; and internal and authoritative external links support the reader. Shape concise direct answers for snippet opportunities and ensure image alt text describes the image. Avoid keyword stuffing and unsupported claims.

Detailed title, metadata, header, snippet, and internal-link checks are in `references/workflow-detail.md` (Phase 6). Completion: the article meets relevant on-page checks without compromising clarity or accuracy.

## Phase 7: Schema

Generate Article and FAQPage JSON-LD; add HowTo JSON-LD for how-to content. Use the disclosed JSON examples in `references/content-structures.md`. Use known author, publisher, dates, URL, and article facts; leave explicit placeholders where the user must supply values. Completion: schema matches the article and is included in its frontmatter.

## Phase 8: Review and Save

Review completeness against intent, brief, PAA, and SERP gaps; verify voice, evidence, links, metadata, and schema. Save markdown to `./campaigns/content/{keyword-slug}.md`, creating the directory as needed. Include YAML frontmatter for title, meta description, keywords, content Format, intent, target and actual word counts, author, created/updated dates, status, SERP snapshot date, PAA count, and schema fields. Include the article body and FAQ where appropriate. Present the result according to `../_system/output-format.md`, then offer `/content-atomizer` to adapt the article for distribution. Consult `references/eeat-examples.md` during this review for concrete examples of experience, expertise, authority, and trust.

For the detailed quality checklists, content-atomizer handoff, worked creation example, and troubleshooting, read `references/workflow-detail.md` (Phases 8 and post-delivery). Completion: the saved file exists, its metadata and schema agree with the reviewed article, and the user receives the path and next action.

## Feedback

After the deliverable, use `../_system/brand-memory.md` §Feedback for the canonical performance prompt and learning format. Record only article-specific learning in `./brand/learnings.md` when the user provides it. Completion: feedback is handled through the shared protocol and any useful learning is appended.

## References

- `references/content-structures.md` — four-format outlines and section guidance, schema JSON examples, and article-specific output fields; read during Phases 3 and 7, and when preparing Phase 8 metadata.
- `references/workflow-detail.md` — detailed phase instructions, examples, checklists, handoff, and troubleshooting for the relevant phase; consult from the phase pointers above.
- `references/eeat-examples.md` — examples of experience, expertise, authority, and trust signals; read during Phase 4 or Phase 8 when claims need an E-E-A-T check.
- `modes/refresh.md` — existing-article SERP comparison and update workflow; read only for Refresh Mode.
