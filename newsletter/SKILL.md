---
name: newsletter
description: "Write a newsletter edition, choose a Format, or plan newsletter growth and monetization."
version: 8.0
---

# Newsletter

Create a useful, publication-ready newsletter edition or plan a newsletter strategy.

**Reads:** `voice-profile.md` (full file), `audience.md` (pain points and language), and `learnings.md` (newsletter-related entries), when present. Check `./campaigns/newsletters/` for recent editions when choosing a topic or continuing a series.

**Writes:** edition to `./campaigns/newsletters/{YYYY-MM-DD}-{topic}.md`; append the asset to `./brand/assets.md` following `../_system/brand-memory.md` §Write.

## Load

Apply `../_system/brand-memory.md` §Read to the Reads list. If brand memory is absent, work standalone. Use brand context visibly; resolve conflicts with the user before changing brand files. Completion: each listed file is loaded at its stated depth or reported missing/stale in one status line.

## Choose the work

Identify the requested Mode and whether this is a first run or returning run by checking for prior editions and brand files; use their history when relevant.

- **Edition:** choose a Format below. Use the user's requested format; otherwise recommend one based on audience, topic, and available material. Ask one focused question if the choice cannot be inferred.
- **Strategy:** plan growth or monetization. Read `references/strategy.md` and apply its guidance; return a prioritized plan tied to the user's stage and constraints.

For an edition, gather the user's ideas, links, questions, and observations. For a news briefing or curated-links Format, source current information. For a named topic in any Format, research claims that need current evidence. Use `../_system/brand-memory.md` §Data-quality label: report LIVE when sourced with available web search and ESTIMATED when relying on model knowledge; label estimates with `~`, distinguish illustrative examples from verified facts, and ask before proceeding if live sourcing is necessary but unavailable. If the search tool is unavailable, use this Fallback only when the user accepts clearly labeled estimates.

## Draft the edition

Read `references/formats/{format}.md` for the chosen Format; each file contains its template and an example. Read `references/platforms.md` only when a platform is specified or requested; apply the matching formatting guidance. Select material that matters to this audience, lead with the strongest value, add original commentary to curated items, and cite external sources. Match loaded voice and audience context. Create three distinct subject-line options and recommend one; keep the body scannable and focused on one clear reader benefit.

Completion: the edition has a clear hook, useful content, an accurate subject line, a single primary CTA, and source links for external claims.

## Save and present

Save the edition using the Writes path. Include title, Format, date, chosen subject line, alternatives, body, send notes where useful, and sources when used. Append its asset entry to `./brand/assets.md` under `../_system/brand-memory.md` §Write. Follow `../_system/output-format.md` and its four-section contract. Use `references/edition-output.md` for this skill's saved-edition structure. Offer `/creative` first for a visual build, with the next workflow step as the skip option; then offer `/content-atomizer` for social distribution.

Completion: saved edition and asset entry are confirmed, and the response points to both files.

## Feedback

After delivering a completed edition or strategy, apply `../_system/brand-memory.md` §Feedback. For newsletter-specific learning, log subject-line/open-rate, send-time, format preference, or topic-performance details when the user supplies them. Completion: the feedback prompt is shown and any supplied finding is logged.

## Format reference index

Read only the selected Format file; each combines the former format template and the relevant example material after comparison with `references/newsletter-examples.md`.

- Deep-dive / framework: `references/formats/deep-dive.md`
- News briefing: `references/formats/news-briefing.md`
- Curated links: `references/formats/curated-links.md`
- Personal essay: `references/formats/personal-essay.md`
- Builder update: `references/formats/builder-update.md`
- Irreverent news: `references/formats/irreverent-news.md`
