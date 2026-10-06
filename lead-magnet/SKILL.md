---
name: lead-magnet
description: "Create lead magnet concepts or build a selected lead magnet. Use when growing an email list or creating an opt-in resource."
---

# Lead Magnet

Create a useful free resource that solves a specific problem and naturally connects to the business's paid offer. Choose a **Mode**: Ideate to develop concepts, or Build to produce a selected concept. A **Format** is the output shape within Build.

## Reads

- `./brand/voice-profile.md` — full file.
- `./brand/positioning.md` — chosen angle only.
- `./brand/audience.md` — pain points and language.
- `./brand/competitors.md` — names and lead-magnet entries.
- `./brand/assets.md` — skim existing lead magnets.

## Writes

- `./campaigns/{kebab-case-name}/lead-magnet.md` — complete selected resource.
- `./campaigns/{kebab-case-name}/brief.md` — campaign brief.
- `./brand/assets.md` — append asset under `../_system/brand-memory.md` §Write.
- `./brand/learnings.md` — lead-magnet feedback under §Feedback.

## Load

Apply `../_system/brand-memory.md` §Read to the Reads list. Completion: each available file is loaded at its stated depth or reported missing/stale through the shared protocol.

## Choose the Mode

- Choose **Ideate** when the user wants recommendations or has not chosen a concept.
- Choose **Build** when the user selected a concept or directly requested a specific lead magnet deliverable. For an existing campaign, start by checking its assets and asking whether to revise or create a distinct resource when the intent is unclear.

## Ideate Mode

Load [`modes/ideate.md`](modes/ideate.md) for the detailed concept frameworks and research process.

1. Establish business type (info product, SaaS, or services), paid offer and transformation, target audience, and any user constraints. Ask only for missing information needed to make useful recommendations.
2. Research competitor lead magnets with web search when available. Note observed formats, hooks, gaps, and crowded approaches. If search is unavailable, label the research unavailable and base recommendations on supplied context.
3. Develop 3–5 distinct concepts. Each names the resource and Format, a specific outcome and hook, the audience, the bridge to the paid offer, and realistic effort/resources. Prefer a fast, complete win over a broad teaser. Recommend the best-fit option with a concise reason.
4. Present the concepts in the four-section output contract in [`../_system/output-format.md`](../_system/output-format.md). Completion: the user can compare the options and select one to build.

For business-type-specific strategy, load [`references/info-product-magnets.md`](references/info-product-magnets.md) for info products/coaching, [`references/saas-magnets.md`](references/saas-magnets.md) for software businesses, and [`references/services-magnets.md`](references/services-magnets.md) for service businesses. Load [`references/psychology.md`](references/psychology.md) when developing or assessing the value exchange and conversion rationale. Use [`references/format-examples.md`](references/format-examples.md) when examples by Format will help distinguish concepts.

## Build Mode

Read `modes/build.md` when entering Build for Format-specific production requirements and the worked checklist example.

1. Confirm the selected concept, Format, audience, and paid-offer bridge. Ask for missing facts that materially affect accuracy; do not invent business claims or data.
2. Create the complete resource in the selected Format. Give the reader an actionable result, make the promised outcome feasible, and connect the next step to the paid offer without making the free resource a mere teaser.
3. Save the deliverable as `./campaigns/{kebab-case-name}/lead-magnet.md`. Create or update its campaign brief using the canonical campaign layout and brief in [`../_system/brand-memory.md`](../_system/brand-memory.md) §Campaigns; don't restate that schema. Append the asset to `./brand/assets.md` following [`../_system/brand-memory.md`](../_system/brand-memory.md) §Write when brand memory exists. With no brand directory, save the campaign deliverable and report that no brand registry was available.
4. Deliver the complete resource and a concise summary using the four-section contract in [`../_system/output-format.md`](../_system/output-format.md). Disclose format-specific build summaries in [`references/format-examples.md`](references/format-examples.md) when the selected Format needs an example. Apply `../_system/output-format.md` §What's Next, offering `/creative` first for visual layout with the funnel chain as the skip option: landing page via `/direct-response-copy` (pass title, hook, format, audience, bridge); delivery and welcome sequence via `/email-sequences` (pass name, format, bridge, paid-offer details); social promotion via `/content-atomizer` (pass the saved resource). State why each next piece follows from this resource.
5. After delivery, follow [`../_system/brand-memory.md`](../_system/brand-memory.md) §Feedback. Record only lead-magnet-specific details needed for future learning. Completion: saved files are listed, the requested resource is complete, and feedback has been handled or is awaiting the user's response.

## Quality check

Before delivery, verify that the concept is specific, feasible, audience-relevant, and connected to the paid offer. For a built resource, verify it delivers the promised quick win, contains no fabricated claims, matches loaded brand context, and is complete for its Format. If using research based on model knowledge rather than live sources, apply the appropriate **Data-quality label** and distinguish estimates from observed facts.
