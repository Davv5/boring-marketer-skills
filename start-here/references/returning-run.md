# Returning run

Read this when `./brand/` exists. The user has been here before: show what exists, identify gaps, then answer their request or suggest the highest-impact next action. Templates are in [`output-templates.md`](output-templates.md).

## 1. Present the populated scan

Build the Project Scan from the Reads in `SKILL.md` (brand files, `.env` and MCP detection from [`stack-detection.md`](stack-detection.md), campaign directories) and present it using [`output-templates.md`](output-templates.md) §Project scan. Fill it from this project state, reconstructed on every run from the brand files, with no separate state file:

- **Foundation**: voice-profile.md, positioning.md, audience.md, competitors.md, creative-kit.md present or missing.
- **Stack**: Replicate, email ESP, analytics, social tool connected or missing.
- **Assets**: total count (assets.md rows), active count (status live or draft), retired count (Retired Assets rows), date of the last asset created.
- **Learnings**: total entries and the count under What Works, What Doesn't Work and Audience Insights.
- **Campaigns**: total directories, and how many are active and complete.

Done when every Foundation, Stack, Assets, Learnings and Campaigns line above has a value in the scan.

## 2. Offer a refresh for old files

The freshness rules in `../_system/brand-memory.md` §Read decide how each file is used. For any file older than 30 days, add the stale-data notice from [`output-templates.md`](output-templates.md) §Stale data notice: how old it is, the owner skill that refreshes it with a time estimate (for example `/brand-voice`, ~10 min), and the option to continue with the existing file.

Done when each file older than 30 days has its notice, or every file is under 30 days.

## 3. Determine intent

**Path A, the user made a specific request.** Open with the project scan so the user sees their context remembered, then route the request with [`routing.md`](routing.md). Example, user says "I need a blog post": show the brief project status, then "I see your voice profile and keyword plan. Using those. What topic, or should I pull from your keyword plan?"

**Path B, no specific request, or "what should I do".** Pick the highest-impact gap with this priority order, and present the top one or two as specific recommendations with a skill and time estimate:

1. No voice profile: "A voice profile would make every output sound like you. Want to create one? (~10 min with /brand-voice)"
2. No positioning: "Positioning angles sharpen everything downstream: copy, content, ads. Want to find yours? (~10 min with /positioning-angles)"
3. No lead magnet: "A lead magnet is the fastest path to building an email list. Want to create one? (~15 min with /lead-magnet)"
4. No email sequence: "An automated welcome sequence would nurture new subscribers for you. Want to build one? (~15 min with /email-sequences)"
5. No content: "Blog content drives long-term organic growth. Want to start your first piece? (~20 min with /seo-content)"
6. Stale assets: "Your welcome sequence is {n} weeks old. Want to check performance or refresh it?"
7. Missing tools: "You do not have an email ESP connected. Sequences are ready but cannot deploy automatically."
8. Everything covered: "Your marketing stack looks solid. Want to launch a new campaign, create fresh content, or review performance?"

Done when the user's request is routed to a skill or workflow, or one or two gap recommendations are on the table.

## Smart gap detection

Apply these rules to the project state on Path B, and as extra recommendations on Path A when they bear on the request.

**Content gaps**

- Voice profile and positioning exist, with no email sequences and no lead magnet: "You have a solid brand foundation, ready for lead generation. Recommend: /lead-magnet to create an opt-in (~15 min), then /email-sequences for the follow-up (~15 min)."
- More than 3 blog posts and no social posts: "You have {n} blog posts but no social promotion. Each post could become 5-10 social assets. Recommend: /content-atomizer to unlock that value."
- Email sequences exist and learnings is empty: "You have email sequences live but no performance data logged. After your next send, tell me how it went so I can improve future sequences."
- A lead magnet exists and no welcome sequence: "You have a lead magnet ready; a welcome sequence would automatically nurture new subscribers after download. Recommend: /email-sequences (~15 min)."
- Everything exists and last activity is over 14 days ago: "Your marketing stack is solid but dormant. Options: 1. Create fresh content 2. Launch a new campaign 3. Review and optimize existing assets 4. Build something new (creative, newsletter, etc.)"

**Tool gaps**

- Replicate connected and no creative kit: "Replicate is connected but you have no creative kit. Run /creative to build your visual identity, then every image and video will match your brand."
- Email sequences exist and no ESP connected: "You have email sequences ready but no ESP connected. Add your Mailchimp/ConvertKit API key to .env and I can help deploy them automatically."
- More than 2 campaigns and no analytics: "You have {n} campaigns but no analytics connected. Add GA4 or PostHog to .env so I can help track performance and log learnings."

## State-based decisions

Use the project state to shape routing:

- Voice profile missing and the user asks for any skill that writes (copy, content, email, newsletter): recommend `/brand-voice` first and offer the choice: "I can proceed without it, and output will use best-guess defaults. Or ~10 min on /brand-voice first and everything sounds like you."
- Positioning missing and the user asks for copy or content: recommend `/positioning-angles` first: "I can write without an angle, and you'll get solid copy. Or ~10 min on /positioning-angles first for a sharper hook throughout."
- Last asset created over 30 days ago: ask "I notice you have not created anything new in {n} days. Want to pick up where you left off, or start something fresh?"
- More than 3 entries under What Doesn't Work for the same skill: flag "Your learnings show repeated issues with {skill} output. Consider re-running /brand-voice to recalibrate."

## Edge cases on a returning run

- **Existing profile file when the user asks to set up the brand**: "You already have a voice profile from {date}. Want to refresh it, or keep it and focus on what is missing? (positioning, audience, competitors)" The user may have edited brand files by hand, so confirm before any overwrite (`../_system/brand-memory.md` §Write).
- **Brand files from v1 or manual creation that do not match the expected format**: read what is there, extract the useful information, and offer "I found existing brand files but they are in an older format. Want me to upgrade them to the current format? I will preserve all your content."
- **Reset everything**: confirm "This will delete all brand memory files and campaign data. Are you sure?" When confirmed, tell the user exactly what to remove: "Remove the ./brand/ and ./campaigns/ directories to start fresh. Then run /start-here again." The user performs the deletion; delete user files only on their explicit instruction.
