# Sequence output and summary file

Read by the present step: this skill's layout for the Content section of the four-section contract in `../_system/output-format.md`, and the `sequence-summary.md` file that carries the schema JSON. The full email copy lives in the saved email files; the output summarises the sequence and points at them.

## Output layout

```markdown
## {N}-Email {Sequence Format} Sequence
Generated {Month Day, Year}

### ESP status
{ESP name} ✓ connected / ✗ not connected
{Status message about automation setup}

### Sequence overview

| Day | Subject (recommended) | Purpose | CTA | Send |
|-----|-----------------------|---------|-----|------|
| 0 | "{Subject line A}" | {Purpose in one line} | {action} | {Day} at {time} |
| 2 | "{Subject line A}" | {Purpose in one line} | {action} | {Day} at {time} |

### Subject line variants
{For each email, the numbered options in references/subject-lines.md (Output format)}

### Sequence architecture
{Straight line / Branch / Hybrid, with the visual flow, e.g.
01-delivery -> 02-connection -> 03-quick-win -> 04-value-story -> 05-bridge -> 06-soft-pitch -> 07-direct-pitch}

### Send timing summary

| Email | Day | Day of week | Time | Purpose |
|-------|-----|-------------|------|---------|
| 01 | 0 | {day} | {time} | {purpose} |
| 02 | 2 | {day} | {time} | {purpose} |

Based on: {audience type}, {sequence Format}
{Any learnings data that informed timing}

### Files Saved
- ✓ ./campaigns/{name}/brief.md
- ✓ ./campaigns/{name}/emails/01-{purpose}.md
- ✓ ./campaigns/{name}/sequence-summary.md
- ✓ ./brand/assets.md (appended)

### What's Next
- → /creative: build it as a visual (HTML email templates, header graphics, or visual assets) (~15 min)
- → /content-atomizer: promote the lead magnet on social (~15 min)
- → /direct-response-copy: write the landing page for the offer (~20 min)
- → /lead-magnet: create the opt-in asset if you haven't yet (~15 min)
- "Iterate": revise any email by number

Or tell me what you're working on and I'll route you.
```

## sequence-summary.md

`./campaigns/{name}/sequence-summary.md` holds the sequence overview, architecture and send timing summary tables above, followed by one JSON block at the bottom inside a `<details>` section, conforming to `../_system/schemas/email-sequence-summary.schema.json`:

````markdown
<details>
<summary>Sequence data (JSON)</summary>

```json
{ "sequence_name": "...", "sequence_type": "welcome", "email_count": 7, "created_date": "YYYY-MM-DD", "emails": [ ... ] }
```

</details>
````

Fill the schema's required fields (`sequence_name`, `sequence_type`, `email_count`, `created_date`, `emails`) and, per email, `email_number`, `purpose`, `subject_lines` (recommended first), `send_day`; add `send_time`, `cta`, `file_path`, `trigger`, `voice_profile_ref`, `positioning_angle` and `esp_compatibility` (`generic` for copy-paste output) wherever the run has the value. Map a conversion sequence to `sales`.

## Chain to /content-atomizer

After delivering, suggest chaining to /content-atomizer for social promotion of the lead magnet that feeds the sequence. The atomizer can:

- Turn the lead magnet value proposition into social posts
- Create "what you'll learn" teaser content for each platform
- Build a distribution plan that drives opt-ins into the sequence

Prompt: "Your sequence is built, but it needs subscribers. Want me to create social content to promote your lead magnet and drive opt-ins? Just say /content-atomizer."

Sequence insights also feed /newsletter strategy.
