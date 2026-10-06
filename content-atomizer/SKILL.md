---
name: content-atomizer
description: Turn a source asset into platform-native content for selected social platforms, or build a cross-platform content calendar.
---

# Content Atomizer

## Reads

- `./brand/voice-profile.md` (full file)
- `./brand/audience.md` (pain points and language)
- `./brand/positioning.md` (chosen angle only)
- `./brand/learnings.md` (content-performance entries)

## Writes

- `./campaigns/{source-slug}/` — source brief, platform assets, and schedule
- `./brand/assets.md` — register created assets
- `./brand/learnings.md` — record platform-specific performance feedback

## Steps

### 1. Load brand context

Apply `_system/brand-memory.md` §Read to the Reads list above. When `./brand/` is absent, continue without brand files and state that the work is standalone. **Done when each listed file is loaded at its stated depth or named missing/stale in one status line.**

### 2. Choose the Mode and scope

Use **Atomize** to create requested assets from a source. Use **Calendar** when the user asks for a calendar, week of posts, or scheduling across platforms; read `modes/calendar.md` for its calendar sequence and layout. Confirm the source, target platforms, Formats, quantity, constraints, and whether scheduling is requested. If scope is broad or unspecified, recommend relevant platforms and a manageable set of assets, then proceed with that selection. **Done when the source and platform/Format scope are settled.**

### 3. Extract the source

Identify its core insight, supporting points, stories/examples, data/proof, quotable lines, contrarian takes, and actionable steps. Preserve claims and attribution; mark unsupported claims for verification rather than inventing evidence. **Done when the source material can support distinct platform-native assets.**

### 4. Load platform playbooks

For every target platform, read the matching file: `references/linkedin.md`, `references/twitter-x.md`, `references/instagram.md`, `references/tiktok.md`, `references/youtube.md`, `references/threads.md`, `references/bluesky.md`, or `references/reddit.md`. Each file consolidates that platform's playbook, deep dive, Format specs, examples, calls to action, and mistakes. For cross-platform voice adjustment, read `references/platform-voice.md`. **Done when every selected platform's file has informed its adaptation and any needed voice adjustment is applied.**

### 5. Check current platform information

When live web search is available, search reliable, recent sources for material algorithm or policy changes affecting each target platform; distinguish verified updates from reports and dated playbook guidance. When search is unavailable, continue using the disclosed playbooks and label time-sensitive guidance ESTIMATED. **Done when relevant findings or the search limitation are clear for each target platform.**

### 6. Create platform-native assets

Adapt the extracted material separately for each selected platform and Format. Match its voice, conventions, length, hook, CTA, and native features; keep the same underlying insight while avoiding copy-paste. Use the platform file's examples and specs. Read `references/transformation-examples.md` when a worked blog or podcast adaptation helps. Follow these positive quality checks: each piece stands alone without its source, feels native rather than repurposed, opens with a platform-fit hook, front-loads value, uses an appropriate CTA, favors quality over quantity, adapts voice as the same person in a different room, and is organized in per-platform directories. Avoid cross-posting unchanged copy; vary hooks, use platform-native features, stagger publication, caption video, design visual-first for Instagram, keep Threads conversational, disclose affiliations on Reddit, and use substantive nuance on Bluesky. Request /creative for visual production when needed. **Done when every requested asset passes these quality checks and preserves the source's supportable meaning.**

### 7. Save and register

Save a source brief and organized files under `./campaigns/{source-slug}/`, using a lowercase kebab-case slug of at most 40 characters (for example, “5 Pricing Mistakes That Kill SaaS Growth” → `5-pricing-mistakes-saas-growth`). Keep assets in `social/{platform}/` with descriptive Format names such as `carousel.md`, `text-post-01.md`, `thread.md`, `reel-script.md`, `short-script.md`, or `value-post.md`; save calendar output as `schedule.md`. Give every content file frontmatter with `platform`, `format`, quoted `source`, creation date, `status: draft`, and `recommended_post_time` when known; use the calendar's schedule details for scheduling-specific fields. Add useful asset entries to `./brand/assets.md` following `_system/brand-memory.md` §Write. Apply `_system/output-format.md` to the response. Report connections and next steps under its contract, including the visual-build-first rule and `/creative` as the first next step when visuals are needed. **Done when saved paths and created assets are registered and accurately reported.**

### 8. Scheduling Fallback

Check `./brand/stack.md` and available credentials for a connected scheduler. If one is available, confirm compatible accounts, proposed posts, and times with the user before queuing anything; report scheduled and manual-only assets separately. If no scheduler is available, save recommended times only and identify them as suggestions, not verified optimal times. **Done when scheduling status and the user's requested next action are clear.**

### 9. Feedback

After delivering assets, apply `_system/brand-memory.md` §Feedback. Capture platform-specific edits or performance evidence in `./brand/learnings.md` using its format. **Done when feedback is requested through the shared protocol and any supplied learning is recorded.**

## Output templates and routing

The platform-specific CTAs and mistakes are in each `references/{platform}.md`. Read only selected platform files. Calendar examples and customization are in `modes/calendar.md`; worked blog and podcast transformations are in `references/transformation-examples.md`; cross-platform voice examples are in `references/platform-voice.md`.

For input sources, accept blog posts, newsletters, podcasts, long-form video, webinars/talks, case studies, data/research, and frameworks/processes. Match outputs to available source material rather than forcing every platform. Relevant handoffs: `/seo-content`, `/newsletter`, and `/direct-response-copy` can supply source assets; `/brand-voice` establishes voice; `/creative` builds visual assets. After atomization, suggest `/creative` for platform visuals first when needed, then `/newsletter` to bundle insights, `/email-sequences` to nurture followers, `/seo-content` to create source content from an idea, or `/start-here` to review project status. Offer two to four relevant next steps and end with: “Or tell me what you're working on and I'll route you.”

**Completion test:** each piece stands alone; feels native; has a platform-fit hook; front-loads value; uses an appropriate CTA; favors quality over quantity; adapts voice as the same person in a different room; and is organized for publication. The response follows the four-section contract in `_system/output-format.md`.
