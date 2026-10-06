# Calendar Mode

Read this file only when Calendar Mode is selected in `content-atomizer/SKILL.md` Step 2. It contains the calendar sequence and calendar-specific output example.

## Sequence

1. Extract the source and its distinct content angles.
2. Apply the shared skill steps for brand context and current platform information.
3. Map requested platforms and Formats to dates, respecting frequency, dates, exclusions, and other user constraints.
4. Create each asset using the corresponding `references/{platform}.md` playbook. Avoid repeating the same asset without a distinct adaptation.
5. Save assets plus `schedule.md` in the source campaign directory. Include dates, local times/timezone where known, platform, asset path, and a short content description. Mark unspecified timezone and suggested times clearly.

## Calendar example

```markdown
# Content Calendar: {source title}

Week of {start date} to {end date}

## Monday, {date}
- 8:00 AM {timezone} — LinkedIn, carousel: `social/linkedin/carousel.md`
  {short description}

## Summary
- Posts: {count}
- Platforms: {platforms}
- Calendar: `./campaigns/{source-slug}/schedule.md`
```

Follow `_system/output-format.md` for the response surrounding saved files; this example is the skill-specific schedule file, not a replacement response contract.


## Calendar planning reference

## Cross-Platform Content Calendar

### The 5-3-2 Weekly Rhythm

**5 posts per week: Value content**
- Carousels, threads, educational Reels
- Atomized from your core content

**3 posts per week: Engagement content**
- Questions, polls, hot takes
- Drives comments and conversation

**2 posts per week: Personal/behind-the-scenes**
- Stories, personal observations
- Builds connection

### Weekly Schedule Template

| Day | LinkedIn | Twitter | Instagram | TikTok | YouTube | Threads | Bluesky | Reddit |
|-----|----------|---------|-----------|--------|---------|---------|---------|--------|
| Mon | Carousel | Thread | Carousel | Educational | Short | Take | Observation | — |
| Tue | Text post | Single tweets | Story | — | — | Reply thread | Link post | — |
| Wed | — | Thread | Reel | Hot take | — | — | — | Value post |
| Thu | Text post | Single tweets | Story | Tutorial | Short | Quote-post | Question | — |
| Fri | Carousel | — | Carousel | — | — | Mini-thread | — | Comment |
| Sat | — | Single tweets | Reel | Personal | — | — | Curation | — |
| Sun | — | — | Story | — | Long-form | — | — | — |

### Content Repurposing Matrix

| Source | LinkedIn | Twitter | Instagram | TikTok | YouTube | Threads | Bluesky | Reddit |
|--------|----------|---------|-----------|--------|---------|---------|---------|--------|
| Blog Post | Carousel, 2x text | Thread, 3x single | Carousel, Reel | 2-3 clips | Short, Long | Key insight | Summary + link | Detailed breakdown |
| Newsletter | Text post, carousel | Thread | Carousel | 1-2 clips | Short | Top takeaway | Link + context | Cross-post value |
| Podcast | Quote posts | Thread, clips | Reel clips | 3-5 clips | Full episode | Guest insights | Key quotes | AMA follow-up |
| Video | Key points as text | Thread of insights | Reel clips | Repurpose | Source | Commentary | Summary | How-to post |
| Data/Research | Carousel | Thread | Carousel | Green screen | Short | Analysis | Data + take | Detailed analysis |

---