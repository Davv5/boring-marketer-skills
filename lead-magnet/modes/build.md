# Build Mode: Complete Resource Guidance

Load this file when producing the selected lead magnet. The main skill owns brand-memory, campaign-brief and shared output protocols.

A returning run checks `./campaigns/*/` for existing `lead-magnet.md` assets and checks `./brand/assets.md`. When one exists and the user intent is ambiguous, summarize campaign name, Format, title, hook and available landing page, then ask whether to revise it, create a distinct magnet, or develop additional concepts. Read the existing asset before revision. Build saves use lowercase kebab case derived from the concept name.


### Build Mode Activation

Build mode activates when the user says:
- "Build 1" / "Build ①" / "Let's go with concept 1"
- "Write the checklist" / "Create the template" / "Build the guide"
- Any clear selection of a concept from the options presented

### Build Process

1. **Confirm the selection** -- restate the concept, hook, and format.
2. **Gather any missing details** -- if the concept requires specific inputs the user has not provided (industry data, product details, pricing tiers), ask now.
3. **Write the content** -- produce the full lead magnet content based on format type.
4. **Save to disk** -- write to `./campaigns/{magnet-name}/lead-magnet.md`.
5. **Create campaign brief** -- write `./campaigns/{magnet-name}/brief.md`.
6. **Update assets registry** -- append to `./brand/assets.md`.
7. **Offer funnel chain** -- suggest the next skills in the funnel.

### Build Output by Format Type

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

{Full lead magnet content here -- varies by format type}
```

## Build Mode Output Template

After building the lead magnet content, display the full output:

```



  "{Lead Magnet Title}"
  Format: {format}
  Hook: "{hook headline}"
  Audience: {target audience}
  Consumption time: {estimated time}


  CONTENT SUMMARY

  {Format-specific summary, e.g.:}

  For checklists:

  For guides:

  For quizzes:


  BRIDGE LOGIC

  Lead magnet delivers: {micro-transformation}
  This creates desire for: {paid offer}
  Bridge: "{one-sentence connection}"



  ./campaigns/{name}/lead-magnet.md    ✓ (new)
  ./campaigns/{name}/brief.md          ✓ (new)
  ./brand/assets.md                    ✓ (appended)



  Your lead magnet is written. Before distributing:

  → /creative              Build it — PDF layout, cover
                           design, or template (~15 min)
  → "Skip visuals"         Continue to funnel ↓


  → /direct-response-copy  Write the landing page
                           to capture emails (~20 min)
  → /email-sequences       Build the delivery +
                           welcome sequence (~15 min)
  → /content-atomizer      Create social content to
                           promote the magnet (~15 min)
  → "Revise"               Edit specific sections

  Or tell me what you're working on and
  I'll route you.



  Before I close out:

  1. Does this lead magnet feel genuinely valuable?
     (Would your audience actually want this?)

  2. Does the bridge to your paid offer feel natural?
     (If forced, I can adjust the angle.)

  3. Is the scope right?
     (Too long? Too short? Wrong depth?)
```

---


## Lead-magnet-specific feedback notes

Apply shared response categories and prompt from brand-memory §Feedback. If the user shares performance or edits, record the Format, title, hook, angle, and what changed/performed in `./brand/learnings.md` using its canonical format. If the asset is reported shipped as-is, confirm it is represented in `./brand/assets.md`. For an unused asset, wait for performance data before recording a result. A voice mismatch can prompt a `/brand-voice` update.
