# Calendar Mode

Read only when Calendar Mode is selected in `content-atomizer/SKILL.md` Step 2. This file contains the calendar sequence, weekly planning reference, worked schedule, and customization rules.

## Calendar generation

1. Extract all atomizable elements from the source.
2. Search for current algorithm and policy updates for target platforms.
3. Load brand voice and platform adaptation.
4. Map content to platform, day, and Format combinations.
5. Generate every selected content piece using its platform playbook.
6. Assign specific dates and times, using the user's timezone when known.
7. Write all assets plus a master `schedule.md`.

**Done when the schedule and its referenced assets are saved, dates respect user constraints, and suggested times/timezone assumptions are explicit.**

## Planning reference

### 5-3-2 weekly rhythm

- **5 value posts:** carousels, threads, educational Reels atomized from core content.
- **3 engagement posts:** questions, polls, hot takes that invite comments and conversation.
- **2 personal/behind-the-scenes posts:** stories and personal observations that build connection.

Use this as a planning heuristic, not a quota; adapt to the user's requested frequency and capacity.

### Weekly schedule template

| Day | LinkedIn | Twitter/X | Instagram | TikTok | YouTube | Threads | Bluesky | Reddit |
|-----|----------|-----------|-----------|--------|---------|---------|---------|--------|
| Mon | Carousel | Thread | Carousel | Educational | Short | Take | Observation | — |
| Tue | Text post | Single posts | Story | — | — | Reply thread | Link post | — |
| Wed | — | Thread | Reel | Hot take | — | — | — | Value post |
| Thu | Text post | Single posts | Story | Tutorial | Short | Quote-post | Question | — |
| Fri | Carousel | — | Carousel | — | — | Mini-thread | — | Comment |
| Sat | — | Single posts | Reel | Personal | — | — | Curation | — |
| Sun | — | — | Story | — | Long-form | — | — | — |

### Content repurposing matrix

| Source | LinkedIn | Twitter/X | Instagram | TikTok | YouTube | Threads | Bluesky | Reddit |
|--------|----------|-----------|-----------|--------|---------|---------|---------|--------|
| Blog post | Carousel, 2 text posts | Thread, 3 singles | Carousel, Reel | 2-3 clips | Short, long | Key insight | Summary + link | Detailed breakdown |
| Newsletter | Text, carousel | Thread | Carousel | 1-2 clips | Short | Top takeaway | Link + context | Cross-post value |
| Podcast | Quote posts | Thread, clips | Reel clips | 3-5 clips | Full episode | Guest insights | Key quotes | AMA follow-up |
| Video | Key points as text | Insight thread | Reel clips | Repurpose | Source | Commentary | Summary | How-to post |
| Data/research | Carousel | Thread | Carousel | Green screen | Short | Analysis | Data + take | Detailed analysis |

## Worked schedule: 5 Pricing Mistakes

The example demonstrates a full week from a 2,000-word SaaS pricing article. Replace the sample title, content, dates, and times with the user's source and constraints.

```markdown
---
source: "5 Pricing Mistakes That Kill SaaS Growth"
calendar_start: 2026-02-17
calendar_end: 2026-02-23
platforms: [linkedin, twitter, instagram, tiktok, youtube, threads, bluesky, reddit]
total_posts: 22
---

# Content Calendar: 5 Pricing Mistakes

Source: "5 Pricing Mistakes That Kill SaaS Growth"
Week of Feb 17-23, 2026

## Monday Feb 17
- 08:00 AM LinkedIn — carousel.md: "5 pricing mistakes killing your SaaS" (8-slide educational carousel)
- 12:00 PM Twitter/X — thread.md: "I've seen 100+ SaaS companies price wrong" (7-tweet thread)
- 09:00 AM Threads — post-01.md: "Something about SaaS pricing nobody talks about" (conversational take)

## Tuesday Feb 18
- 09:00 AM LinkedIn — text-post-01.md: deep dive on mistake #1 with personal story
- 01:00 PM Twitter/X — single-01.md: mistake #3 as a hot take
- 11:00 AM Instagram — carousel.md: visual version of LinkedIn carousel
- 10:00 AM Bluesky — post-01.md: data-driven pricing observation

## Wednesday Feb 19
- 07:00 PM TikTok — script-01.md: "Stop making these pricing mistakes" (20-second hot take)
- 12:00 PM Twitter/X — single-02.md: quotable line from article
- 09:00 AM Reddit — value-post.md: detailed r/SaaS breakdown, "I analyzed 100 SaaS pricing pages..."

## Thursday Feb 20
- 08:00 AM LinkedIn — text-post-02.md: "The 3-tier test" framework
- 07:00 PM TikTok — script-02.md: "The pricing mistake that cost me $50k" (30-second story)
- 11:00 AM Instagram — reel-script.md: 30-second pricing mistakes Reel
- 10:00 AM Threads — mini-thread.md: four-post pricing psychology deep dive

## Friday Feb 21
- 01:00 PM Twitter/X — single-03.md: "The best SaaS pricing is boring"
- 11:00 AM Instagram — story-sequence.md: poll, "What's your pricing model?"

## Saturday Feb 22
- 09:00 AM YouTube — short-script.md: 45-second rapid-fire five mistakes
- 11:00 AM Instagram — carousel-02.md: "How to fix your SaaS pricing"

## Sunday Feb 23
- Rest day, or use for engagement/replies.

## Summary
- Total posts: 22
- Platforms: 8
- Unique pieces: 16 (some adapted across platforms)
- Calendar: ./campaigns/5-pricing-mistakes-saas-growth/schedule.md
```

## Calendar customization

Honor user preferences explicitly:
- “Only LinkedIn and Twitter” — create only for those platforms.
- “3 posts per day max” — cap daily output at three.
- “No weekends” — schedule Monday through Friday only.
- “Focus on video” — prioritize TikTok, Reels, and Shorts.
- “I want 2 weeks” — extend the dates and remix content angles rather than repeating assets.

## Scheduling integration

Check `./brand/stack.md` for connected scheduling tools and `.env` for credentials: `BUFFER_ACCESS_TOKEN` (Buffer), `HOOTSUITE_API_KEY` (Hootsuite), `LATER_API_KEY` (Later), and `SPROUT_API_KEY` (Sprout Social). Treat detected credentials as evidence of a possible connection, then verify the tool/account is usable before scheduling.

When a scheduler is available, report connected accounts by platform and list unschedulable platforms. For example, Buffer may show LinkedIn, Twitter/X, and Instagram linked while Threads is unavailable; clearly enumerate compatible-account count and manual-only platforms. Ask the user to choose: schedule all compatible posts, output recommended times only, or schedule some and leave the rest manual. After consent, queue via the available scheduling tool, set times from platform playbooks and brand learnings, and confirm each queued post with platform, time, and preview. Identify every platform requiring manual posting.

When no scheduler is available, include suggested times in each asset's `recommended_post_time` and the schedule overview. General starting points (not guarantees): LinkedIn Tue/Thu 8–10 AM; Twitter/X weekdays noon–1 PM; Instagram Mon/Wed/Fri 11 AM; TikTok Tue/Thu 7–9 PM; YouTube Saturday 9–11 AM; Threads daily 9–11 AM; Bluesky weekdays 10 AM–noon; Reddit Mon/Wed 9 AM Eastern. Use the user's local timezone where known and explicitly label Eastern for Reddit. State that these are general suggestions and performance analytics can improve future timing. Suggest `/start-here` to configure a scheduler when appropriate.

## Schedule file

The master `schedule.md` contains the full week view and references each asset path. Include source, calendar start/end, selected platforms, and post count in frontmatter when useful. For each post list date, time, platform, filename/path, hook or short description, and Format. Include a summary of total posts, platforms, unique pieces, and schedule path. Mark a rest day when appropriate. State timezone; when unknown, ask or label the time zone assumption. Treat general recommended times as suggestions unless brand learnings provide evidence.

Use `_system/output-format.md` for the response surrounding saved files; this example is the skill-specific schedule file, not a replacement response contract.
