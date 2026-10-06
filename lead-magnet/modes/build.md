# Build Mode: Complete Resource Guidance

Load this file when producing the selected lead magnet. The main skill owns brand-memory, campaign-brief and shared output protocols.

For an existing campaign, check `./campaigns/*/` for existing `lead-magnet.md` assets and checks `./brand/assets.md`. When one exists and the user intent is ambiguous, summarize campaign name, Format, title, hook and available landing page, then ask whether to revise it, create a distinct magnet, or develop additional concepts. Read the existing asset before revision. Build saves use lowercase kebab case derived from the concept name.


### Build Mode Activation

Build mode activates when the user says:
- "Build 1" / "Build ①" / "Let's go with concept 1"
- "Write the checklist" / "Create the template" / "Build the guide"
- Any clear selection of a concept from the options presented

### Build Output by Format

#### Checklists

Write the complete checklist with:
- Title and subtitle with the hook
- Introduction paragraph (2-3 sentences) explaining what this checklist covers and why it matters
- Numbered or grouped checklist items (aim for 10-25 items)
- Each item has: the action, a one-sentence explanation of why it matters, and a quick-tip or gotcha
- Items grouped by phase or category with section headers
- A "quick start" callout: which 3 items to do first for immediate results
- A bridge section at the end: "Now that you've completed this checklist, here's the next step..."
- CTA that connects to the paid offer

**Example structure:**
```markdown
# [Checklist Title]: [Hook Subtitle]

[2-3 sentence intro explaining the value]

## Phase 1: [Category Name]

- [ ] **[Action item]**
  [Why this matters + quick tip]

- [ ] **[Action item]**
  [Why this matters + quick tip]

...

## Quick Start

If you only do 3 things right now:
1. [Most impactful item]
2. [Second most impactful]
3. [Quick win]

## What's Next

[Bridge paragraph connecting to paid offer]
[Soft CTA]
```

#### Templates

Write the complete template with:
- Title and instructions for how to use it
- The actual template with fill-in sections using [BRACKETS] for user input
- Example fills showing what good responses look like
- Section-by-section guidance explaining what to put in each field
- A completed example showing the template fully filled out
- Bridge section connecting to the paid offer

#### Guides (Mini-Guides / Frameworks)

Aim for 1,500–3,000 words: enough to deliver the quick win without adding unnecessary consumption time.

Write the complete guide with:
- Title and hook subtitle
- Executive summary / TL;DR (3-5 bullet points)
- 3-7 sections, each covering one key concept or step
- Each section includes: the principle, why it matters, how to implement it, and an example
- Actionable takeaways after each section
- A "put it all together" section showing how the pieces connect
- Bridge section connecting to the paid offer

#### Quizzes

Write the complete quiz with:
- Quiz title and description
- 7-15 questions, each with 3-5 answer options
- Scoring logic: how to calculate the result
- 3-5 result profiles/types with:
  - Profile name and description
  - Key characteristics
  - Specific recommendations based on the profile
  - Bridge to paid offer tailored to each profile
- Implementation notes for quiz tools (Typeform, ScoreApp)

#### Swipe Files / Resource Collections

Write the complete swipe file with:
- Title and hook
- Introduction explaining how to use the swipe file
- 20-50+ items organized by category
- Each item includes: the example, source/context, and why it works
- Usage tips for adapting each example
- Bridge section connecting to the paid offer

#### Challenges (Multi-Day)

Write the complete challenge outline with:
- Challenge title, hook, and promise
- Day-by-day breakdown including:
  - Daily topic/theme
  - Daily action/task (specific and completable in 15-30 minutes)
  - Key teaching point for the day
  - Success metric (how they know they did it right)
- Community engagement prompts for each day
- Day-by-day email subject lines
- Final day bridge to paid offer
- Note: The actual daily emails should be created with /email-sequences

#### Calculators / Tools

Write the specification with:
- Calculator title and purpose
- Input fields: what the user enters, with labels, placeholders, and validation rules
- Calculation logic: the formulas, step by step
- Output format: what the user sees, how results are displayed
- Interpretation guide: what different results mean
- Bridge: how different result ranges connect to the paid offer
- Implementation notes: recommended tools (spreadsheet formula, web calculator)
- A spreadsheet-ready version with formulas if applicable

---

## File Output

Every lead magnet is written to disk in the campaign directory structure.

### Directory Structure

```
./campaigns/{magnet-name}/
  lead-magnet.md                 <- The actual lead magnet content
  brief.md                       <- Campaign brief
```

### Magnet Name Convention

Use lowercase-kebab-case derived from the concept name:
- "The Cold Email Kit" -> `cold-email-kit`
- "7-Step Launch Checklist" -> `7-step-launch-checklist`
- "What's Your Marketing Type? Quiz" -> `marketing-type-quiz`

### Lead Magnet File Format

```markdown
---
title: "{Lead Magnet Title}"
subtitle: "{Hook subtitle}"
format: {checklist/template/guide/quiz/swipe-file/challenge/calculator}
hook: "{The one-line hook}"
bridge_to: "{Paid offer name}"
target_audience: "{Who this is for}"
estimated_consumption_time: "{5 min / 15 min / 30 min}"
status: draft
created_by: /lead-magnet
created_date: {YYYY-MM-DD}
---

# {Lead Magnet Title}

{Full lead magnet content here -- varies by Format}
```

## Presentation

Use `../_system/output-format.md` for the four sections. In Content include:

### Resource summary
- Title, Format, hook, audience, and consumption time.
- Checklist: grouped items and the three quick-start actions.
- Guide: core sections and actionable takeaways.
- Quiz: questions, scoring, and tailored result profiles.
- Other Formats: completed components and implementation notes.

### Bridge logic
- The micro-transformation delivered.
- The paid offer and one-sentence connection.

List confirmed paths in Files Saved and offer next skills under the shared What's Next rule. Use `../_system/brand-memory.md` §Feedback after delivery.

## Lead-magnet-specific feedback notes

Apply shared response categories and prompt from `../_system/brand-memory.md` §Feedback. If the user shares performance or edits, record the Format, title, hook, angle, and what changed/performed in `./brand/learnings.md` using its canonical format. If the asset is reported shipped as-is, confirm it is represented in `./brand/assets.md`. For an unused asset, wait for performance data before recording a result. A voice mismatch can prompt a `/brand-voice` update.

## Worked example: 27-point launch checklist

If the user selects a checklist concept, here is what the build output looks like. This demonstrates the full content that gets written to `./campaigns/{name}/lead-magnet.md`.

This is an abbreviated illustrative example, not evidence of revenue results; replace claims with the user’s verified facts.

### Context
- Concept selected: "The Launch Day Checklist"
- Hook: "The 27-Point Launch Checklist That Turned My Last 3 Launches Into $50k+ Days"
- Bridge: Checklist covers launch basics -> course covers the full launch system

### Built Content (abbreviated)

```markdown
---
title: "The Launch Day Checklist"
subtitle: "27 Points That Turned My Last 3 Launches Into $50k+ Days"
format: checklist
hook: "The 27-Point Launch Checklist That Turned My Last 3 Launches Into $50k+ Days"
bridge_to: "The Launch System ($997)"
target_audience: "Course creators and coaches planning their first or next launch"
estimated_consumption_time: "15 min to read, 2-4 hours to complete"
status: draft
created_by: /lead-magnet
created_date: 2026-02-16
---

# The Launch Day Checklist
## 27 Points That Turned My Last 3 Launches Into $50k+ Days

You are about to launch something. That means you are about to feel the urge to "just one more thing" your way into paralysis. This checklist exists to prevent that. Every item here is something I verify before every launch. Miss any of them and you leave money on the table.

## Quick Start

If your launch is in 48 hours and you are reading this in a panic, do these three things first:

1. Verify your checkout page works end-to-end (item 15)
2. Confirm your email sequence is loaded and tested (item 8)
3. Test your primary CTA link on mobile (item 16)

Everything else matters, but those three prevent launch-day disasters.

## Pre-Launch Foundation (7 days before)

- [ ] **Sales page is live and reviewed by someone who is NOT you**
  Fresh eyes catch what you can't. Send it to one person and ask "what's confusing?" Not "what do you think?" -- that gets you compliments, not corrections.

- [ ] **Pricing finalized and tested in checkout**
  Change your price after launch and you erode trust. Decide now. Test a real transaction (refund yourself after).

- [ ] **Email sequence loaded into ESP with correct triggers**
  Every email, every delay, every link. Send yourself through the entire sequence. Open every link. Reply to at least one email to make sure replies work.

...

## What's Next

You have launched. You have data. The checklist got you to launch day -- but the difference between a $10k launch and a $100k launch is the system behind it.

The Launch System covers everything this checklist touches on, but deeper: audience building, pre-launch runway, cart-open sequences, objection handling, and post-launch follow-up.

If this checklist helped, the full system is here: [LINK]
```

---



## Completion

Done when the resource delivers its promised quick win, satisfies every selected Format requirement, has a natural paid-offer bridge, and the files, registry update, and feedback follow the main skill's steps.
