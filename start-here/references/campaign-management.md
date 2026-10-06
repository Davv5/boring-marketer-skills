# Campaign management

Read this when the user starts a multi-asset project (create a campaign), or on a returning run when `./campaigns/` has directories to review. A routing-only run does not need it. The directory layout and the `brief.md` format are defined once in `../_system/brand-memory.md` §Campaigns; this file holds the lifecycle and the review.

## Create a campaign

1. Create `./campaigns/{campaign-name}/`.
2. Write `brief.md` in the §Campaigns format with the goal, the angle (from `./brand/positioning.md`), the audience segment (from `./brand/audience.md`), the timeline, the channels, and Status `planning`.
3. Have each skill write its assets into the campaign's subdirectories as it produces them.
4. Add each new asset to `./brand/assets.md` (`../_system/brand-memory.md` §Write).
5. When the campaign is complete, set the `brief.md` Status to `complete` and present the Campaign completion summary from [`output-templates.md`](output-templates.md).

Done when `brief.md` exists with its Status current and every produced asset is in the campaign directory and in `assets.md`.

## Name a campaign

Use lowercase-kebab-case and be descriptive:

- `spring-launch-2026`
- `cold-email-kit-welcome`
- `q1-content-pillar`
- `webinar-funnel-march`

## Review campaigns

On a returning run, scan `./campaigns/`, read each `brief.md` for Status, dates and asset counts, and surface:

- Active campaigns (Status `active` or `planning`).
- Recent completions (the last 30 days).
- Campaigns with no activity in 14 or more days, which may be stalled.

Done when the project scan's Campaigns lines show those three groups, each with its count.
