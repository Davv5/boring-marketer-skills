# Sequence files

Read by the save step: where each file goes, how it is named, the format of an individual email file with a complete example, and the sequence additions to `brief.md`.

Every email in the sequence is saved as a separate file. This lets the user iterate on individual emails, import them one at a time into ESPs, and keep version control.

## Directory structure

```
./campaigns/{sequence-name}/
  brief.md                           <- Campaign overview
  sequence-summary.md                <- Summary with the schema JSON block
  emails/
    01-delivery.md                   <- Email 1
    02-connection.md                 <- Email 2
    03-quick-win.md                  <- Email 3
    04-value-story.md                <- Email 4
    05-bridge.md                     <- Email 5
    06-soft-pitch.md                 <- Email 6
    07-direct-pitch.md               <- Email 7
```

## Naming convention

Files use the pattern `{nn}-{purpose}.md`:

- `{nn}`: two-digit number, zero-padded (01, 02, 03...)
- `{purpose}`: lowercase kebab-case description of the email's job
- Use descriptive names ("01-delivery"), not generic ones ("email-1")

Standard purpose names by sequence type:

- **Welcome:** `references/welcome.md` (File names)
- **Conversion:** `references/conversion.md` (File names)
- **Launch:** `references/launch.md` (File names)
- **Re-engagement:** `references/re-engagement.md` (File names)
- **Post-purchase:** 01-welcome-aboard, 02-quick-start, 03-first-win, 04-advanced-tip, 05-community, 06-upsell

## Individual email file format

Each email .md file carries this frontmatter and structure:

```markdown
---
email: {N}
sequence: {sequence-name}
purpose: {one-line purpose}
send_day: {N}
send_time: "{Day, Time TZ}"
subject_line_a: "{Subject A}"
subject_line_b: "{Subject B}"
subject_line_c: "{Subject C}"
recommended_subject: "a"
preview_text: "{preview text for recommended subject}"
cta: "{what action you want}"
status: draft
---

# Email {N}: {Purpose Title}

## Subject Line Variants

### A: "{Subject A}" -- recommended
{Rationale for why this is the safe bet}

### B: "{Subject B}"
{Rationale for the bold play}

### C: "{Subject C}"
{Rationale for the personal touch}

**Recommended A/B test:** A vs B
**Reason:** {why testing these two is informative}

## Preview Text
"{preview text -- first 60-90 characters}"

## Send Timing
Day {N} -- {Day of Week} at {Time} {TZ}
{Rationale for this timing}

---

## Email Copy

{FULL EMAIL COPY HERE}

---

**P.S.** {If applicable}
```

### Example: 01-delivery.md

```markdown
---
email: 1
sequence: skills-pack-welcome
purpose: Deliver the positioning skill and set expectations
send_day: 0
send_time: "Immediately after opt-in"
subject_line_a: "Your positioning skill is inside"
subject_line_b: "Open this before you forget"
subject_line_c: "hey -- here's that skill you wanted"
recommended_subject: "a"
preview_text: "Here's how to use it in 60 seconds"
cta: "Download the skill and try it on your product"
status: draft
---

# Email 1: Delivery

## Subject Line Variants

### A: "Your positioning skill is inside" -- recommended
Direct, tells them exactly what they will find. Highest open rate for delivery emails because it matches the expectation set at opt-in.

### B: "Open this before you forget"
Creates mild urgency. Pattern interrupt -- does not mention the lead magnet name. Works if inbox is crowded.

### C: "hey -- here's that skill you wanted"
Lowercase, casual, feels like a message from a friend. High trust signal for creator audiences.

**Recommended A/B test:** A vs C
**Reason:** Tests whether your audience responds better to professional clarity or personal warmth. Result informs voice for the rest of the sequence.

## Preview Text
"Here's how to use it in 60 seconds"

## Send Timing
Day 0 -- Immediately after opt-in
Delivery emails must go out within seconds of the opt-in. Any delay erodes trust and reduces open rates. This is the one email with near-100% open rate -- make it count.

---

## Email Copy

Hey,

Your positioning skill is attached. [LINK]

Here's how to use it in 60 seconds:

1. Download the .md file
2. Add it to Claude Code (or paste into a Claude conversation)
3. Ask: "Find positioning angles for [your product]"

That's it. Try it right now on whatever you're working on.

Over the next week, I'll send you a few emails showing how to get more out of this -- plus what happens when Claude has an entire marketing methodology instead of one skill.

Quick question: What project are you hoping to use this for? Hit reply and tell me. I read every one.

-- James

---

**P.S.** If you're not sure where to start, try it on your homepage headline. That's where most people see the biggest "aha" moment.
```

## brief.md

`brief.md` follows the campaign brief format in `_system/brand-memory.md` §Campaigns (Goal, Angle, Audience Segment, Timeline, Channels, Status, Voice Notes). Add these sequence sections after Goal:

```markdown
## Sequence Type
{Welcome / Nurture / Conversion / Launch / Re-engagement / Post-Purchase}

## Emails
{N} emails over {N} days

## Lead Magnet
{What they opted in for -- from ./brand/assets.md or user input}

## Paid Offer
{What we are eventually selling, at what price}

## Bridge Logic
{How free -> paid makes logical sense}

## ESP
{Connected ESP or "manual / copy-paste"}
```
