# Subject lines and A/B variants

Read by the write-emails step for every email: pick formulas from What gets opens, then produce three variants in the format below. The worked example for the welcome sequence is at the end.

## What gets opens

**1. Curiosity Gap**
- "The [X] mistake that cost me [Y]"
- "Why [surprising thing] actually works"
- "I was wrong about [topic]"

**2. Direct Benefit**
- "How to [outcome] in [timeframe]"
- "[Number] ways to [benefit]"
- "The fastest way to [result]"

**3. Personal/Story**
- "Quick story about [topic]"
- "What happened when I [action]"
- "The email I almost didn't send"

**4. Question**
- "Can I ask you something?"
- "What would you do with [outcome]?"
- "Are you making this mistake?"

**5. Urgency (when real)**
- "[X] hours left"
- "Closing tonight"
- "Last chance: [offer]"

**6. Pattern Interrupt**
- "." (just a period)
- "So..."
- "Bad news"
- "[First name]"

## What kills opens

- ALL CAPS
- Excessive punctuation!!!
- "Newsletter #47"
- "[COMPANY NAME] Weekly Update"
- Clickbait that doesn't deliver
- Same format every time

## The three-variant framework

Every email gets exactly 3 subject line variants with rationale, so the user always has a variant to test against.

**Variant A, the safe bet:** The subject line most likely to perform well across all audiences. Uses a proven formula. Optimized for open rate.

**Variant B, the bold play:** Higher risk, higher reward. Uses pattern interrupt, curiosity, or emotion. May polarize but will stand out in a crowded inbox.

**Variant C, the personal touch:** Feels like a message from a friend. Uses first name, lowercase, conversational tone. Optimized for trust and reply rate.

## Output format

Present each email's variants as numbered options, recommended pick marked with ★:

```markdown
#### Subject lines, Email {N}: {Purpose}

1. "{Subject line A}" ★ recommended
   → Safe bet: {rationale}
   → Preview text: "{first 60 chars}"
2. "{Subject line B}"
   → Bold play: {rationale}
   → Preview text: "{first 60 chars}"
3. "{Subject line C}"
   → Personal: {rationale}
   → Preview text: "{first 60 chars}"

Recommended A/B test: 1 vs 2
Reason: {why these two will reveal something useful about the audience}
```

## Rules

- Maximum 50 characters (displays fully on mobile)
- No emoji unless brand voice explicitly calls for it
- No ALL CAPS
- Preview text must complement, not repeat, the subject
- Always include preview text: it accounts for 24% of open rate decisions
- Each variant must use a DIFFERENT formula category (do not generate 3 curiosity gaps)

## Example: A/B variants for the welcome sequence

The 3-variant approach applied to the first two emails of the example sequence in `references/welcome-example.md`.

### Email 1: Delivery

1. "Your positioning skill is inside" ★ recommended
   → Safe bet: Direct, tells them exactly what they will find. Highest open rate for delivery emails because it matches the expectation set at opt-in.
   → Preview: "Here's how to use it in 60 seconds"
2. "Open this before you forget"
   → Bold play: Creates mild urgency. Pattern interrupt: does not mention the lead magnet name. Works if inbox is crowded.
   → Preview: "Your positioning skill + a 60-second quick start"
3. "hey -- here's that skill you wanted"
   → Personal: Lowercase, casual, feels like a message from a friend. High trust signal for creator audiences.
   → Preview: "Plus one question for you"

Recommended A/B test: 1 vs 3
Reason: Tests whether your audience responds better to professional clarity or personal warmth. Result informs voice for the rest of the sequence.

### Email 2: Connection

1. "Why I built this (quick story)" ★ recommended
   → Safe bet: Curiosity gap + specificity. "Quick story" sets a low time commitment expectation. High open for day-2 emails.
   → Preview: "$2,400 on a strategist and nothing to show for it"
2. "$2,400 mistake"
   → Bold play: Opens with the pain. Specific number creates immediate curiosity. Polarizing: some will open fast, some may find it clickbaity.
   → Preview: "The 47-page PDF that sat in my Drive for six months"
3. "quick story about a $2,400 lesson"
   → Personal: Lowercase, story-forward, includes the specific dollar amount for credibility. Feels conversational.
   → Preview: "And why I started building something different"

Recommended A/B test: 1 vs 2
Reason: Tests curiosity-based ("why I built this") against number-based ("$2,400 mistake") openness. Reveals whether your list responds to story hooks or specific financial stakes.
