# Output templates

Read this when presenting a /start-here deliverable. Every template sits inside the four-section contract in `_system/output-format.md` (Header, Content, Files Saved, What's Next), with ✓ ✗ ★ → as the only symbols. Choices follow that file's numbered-options rule, and a blocker leads with a ✗ line followed by a → action.

## Project scan

Header `## Project Scan` with "Generated {date}", then the scan as a tree in a code block. Group items into categories, name each category on its own line, align the status column, and add brief context after the status (a date, a count, a name). Mark a missing recommended item ✗, and a missing optional item ✗ with "(optional)" after it.

Empty state (first run):

```
Brand Foundation
├── Voice Profile       ✗ not found
├── Positioning         ✗ not found
├── Audience Research   ✗ not found (write by hand)
└── Competitor Intel    ✗ not found (write by hand)

Marketing Stack
├── Replicate API       {✓ connected | ✗ not found}
├── Email ESP           {✓ name | ✗ not connected}
├── Analytics           {✓ name | ✗ not connected (optional)}
└── Social Scheduling   {✓ name | ✗ not connected (optional)}

Campaign History
└── (no campaigns yet)
```

Populated state (returning run):

```
Brand Foundation
├── Voice Profile       ✓ loaded (last updated {date})
├── Positioning         ✓ loaded (angle: "{primary angle}")
├── Audience Research   {✓ loaded | ✗ not found}
└── Competitor Intel    {✓ loaded | ✗ not found}

Marketing Stack
├── Replicate API       {✓ connected | ✗ not found}
├── {ESP name}          {✓ connected | ✗ not connected}
├── {Analytics}         {✓ connected | ✗ not connected (optional)}
└── {Social tool}       {✓ connected | ✗ not connected (optional)}

Campaign Assets
├── {asset 1}           ✓ {description} ({date})
├── {asset 2}           ✓ {description} ({date})
└── {asset 3}           {status} ({date})

Learnings ({count} entries)
├── What Works          {count} findings
├── What Doesn't Work   {count} findings
└── Audience Insights   {count} findings
```

## Tool detection status

Use it for the Marketing Stack block when the user asks what is connected: ✓ for a connected tool with its capability, ✗ for a tool that is missing, with a "(optional)" note when it is not recommended.

```
✓ Replicate API       connected (image + video ready)
✓ Mailchimp           connected (list: 4,200 subscribers)
✗ GA4                 not connected (optional, enables performance tracking)
✗ Buffer              not found (add for social scheduling)
```

## Brand Foundation Report

Header `## Brand Foundation Report` with "Generated {date}", then:

```markdown
### Voice Profile
- **Tone:** {extracted tone description}
- **Personality:** {personality archetype}
- **Pacing:** {sentence rhythm description}
- **Signature patterns:** {pattern 1}; {pattern 2}; {pattern 3}; {pattern 4}

### Positioning Angles
**★ Recommended: 1. {ANGLE NAME}.** {why it fits the goal}

1. **{ANGLE NAME}** ★
   "{one-sentence positioning statement}"
   → Best for: {channels and audience}
2. **{ANGLE NAME}**
   "{one-sentence positioning statement}"
   → Best for: {channels and audience}
3. **{ANGLE NAME}**
   "{one-sentence positioning statement}"
   → Best for: {channels and audience}

### Marketing Stack
{tree of connected tools with status}

### Files Saved
- ✓ ./brand/voice-profile.md (new)
- ✓ ./brand/positioning.md (new)
- ✓ ./brand/stack.md (new)
- ✓ ./brand/assets.md (initialized)
- ✓ ./brand/learnings.md (initialized)

### What's Next
Your brand foundation is set. Every skill will use it from here on. Based on your goal ({goal name}), here is your recommended path:
{goal-specific recommendations from first-run.md §5}

Or tell me what you are working on and I will route you.
```

## Workflow plan

Show it before any workflow of three or more steps, and wait for the user's choice.

```markdown
### Workflow: {Name}
Here is what I recommend:

1. **{Skill}**: {what it produces} (~{X} min)
2. **{Skill}**: {what it produces} (~{X} min)
3. **{Skill}**: {what it produces} (~{X} min)

Total: ~{XX} min

Options:
- → Run the full workflow
- → Start with just Step 1 (you can continue later)
- → Skip to Step {N} (if you already have earlier assets)
```

## Progress display

While a multi-step run is working, open with what is happening and list each step; as steps finish, show the output file.

```markdown
Building your brand foundation...

- Extracting brand voice: analyzing website...
- Finding positioning angles: mapping competitive landscape...
```

After completion:

```markdown
- ✓ Brand voice extracted: ./brand/voice-profile.md
- ✓ 3 positioning angles found: ./brand/positioning.md
```

## Stale data notice

Show it inside the project scan Content for each brand file older than 30 days.

```markdown
✗ Stale data: your voice profile was last updated 45 days ago, and your business may have evolved since then.
- → /brand-voice: refresh it (~10 min)
- → Continue with the existing profile
```

## Campaign completion summary

Present it when a campaign's `brief.md` Status moves to `complete`. Header `## Campaign Complete: {Campaign Name}` with the campaign headline, then:

```markdown
### Assets Created
Email Sequence (5 emails)
./campaigns/q1-launch/emails/
├── 01-announcement.md       Day 0
└── 05-close.md              Day 7

Landing Page: ./campaigns/q1-launch/landing-page.md (hero, features, testimonials, CTA)

Social Assets: ./campaigns/q1-launch/social/
├── twitter-thread.md        12-post thread
├── linkedin-post.md         Long-form post
└── ig-carousel.md           10 slides

### Files Saved
- ✓ ./brand/assets.md (registry updated)
- ✓ ./brand/learnings.md (journal updated)

Angle used: {angle}. Voice: {voice summary}. Audience: {audience summary}.

### What's Next
{next steps, ending with the pointer to /start-here for the next project}
```

Group assets by type with a tree of the directory, brief context on each file's line, and a summary of angle, voice and audience at the end.

## Session summary

Present it when the user stops or says they are done. The date is the header's "Generated" line.

```markdown
## Session Summary
- **Skills run:** /brand-voice, /positioning-angles
- **Files created:** ./brand/voice-profile.md, ./brand/positioning.md, ./brand/stack.md, ./brand/assets.md, ./brand/learnings.md
- **Time spent:** ~20 minutes
- **Status:** Brand foundation complete

### What's Next
- → /lead-magnet: pick up where the foundation left off (~15 min)
- → /keyword-research: map your content territory (~15 min)
```
