---
name: email-sequences
description: "Write or revise a multi-email sequence: welcome, nurture, conversion, launch, re-engagement, post-purchase, cart abandonment. Use when writing or revising a multi-email series."
---

# Email Sequences

Turn a lead magnet subscriber into a customer with a strategic email sequence: deliver value immediately, build trust and relationship, create desire for the paid offer, and convert without being sleazy. The output is a complete sequence with three subject-line variants and preview text per email, full copy, specific send timing, and CTAs, each email saved as its own file.

**Reads:**
- `voice-profile.md` (full file): match tone, vocabulary, sentence rhythm, jargon level and formality register in every email.
- `positioning.md` (chosen angle only): the narrative spine of the sequence; it sets how the bridge emails frame the gap.
- `audience.md` (awareness level, sophistication, pain points, B2B/B2C and timezone habits): sets email complexity, jargon tolerance and send timing.
- `creative-kit.md` (brand colors and visual identity): used for HTML email templates and image or banner suggestions when an ESP integration is active.
- `learnings.md` (send-time and subject-line entries).
- `stack.md` (ESP rows of the Connected Tools table).
- Lead magnet details: `./brand/assets.md` and `./campaigns/*/brief.md` (full file).

**Writes:** `./campaigns/{name}/brief.md`, `./campaigns/{name}/emails/{nn}-{purpose}.md`, `./campaigns/{name}/sequence-summary.md`, and an entry appended to `./brand/assets.md` per `../_system/brand-memory.md` §Write.

## 1. Load

Apply `../_system/brand-memory.md` §Read to the Reads list. If `./brand/` is absent, work standalone. When `assets.md` or a campaign brief shows /lead-magnet already ran, take the actual lead magnet name, format, delivery URL, value proposition and quick-start instructions, and say so: "Found lead magnet: '[name]'. Building delivery email around the actual asset." Completion: every Reads file is loaded at its depth or named in one status line, and the lead magnet is identified from brand memory or marked to ask.

## 2. Check for an existing sequence

Look in `./campaigns/*/emails/`. When email files exist, read them and present what exists: the campaign, each file with its send day and subject, the email count, the sequence Format, and the last-updated date. Then ask: "Do you want to revise this sequence, add emails, or start a new one?"

- **Revise:** load the existing emails, identify weak spots, rewrite specific emails.
- **Add:** add emails to the existing sequence (for example, extend with re-engagement).
- **New:** create a different sequence Format (for example, a conversion sequence after welcome).

When no email files exist, continue to step 3. Completion: the work is named as new, revise or add, and any existing emails it touches have been read.

## 3. Gather context

Get these inputs before writing any sequence:

1. **What's the lead magnet?** (What did they opt in for?) Use brand-memory details when /lead-magnet already ran.
2. **What's the paid offer?** (What are you eventually selling?)
3. **What's the price point?** (Affects how much trust-building is needed.)
4. **What's the bridge?** (How does free to paid make logical sense?)
5. **What voice/brand?** (From `voice-profile.md`, or ask.)
6. **What objections?** (Why might they NOT buy?)

When brand memory answers any of these, confirm instead of re-asking: "Your lead magnet is '[name]' and your paid offer is '[product]' at $[price]. Sound right, or has anything changed?"

Completion: the sequence Format, lead magnet, paid offer with price and bridge logic, audience type (B2B, B2C, creator or ecommerce) and at least the top 3 objections are each stated or confirmed.

## 4. Check the ESP

Read `references/esp.md` for the detection order and platform handoff. It decides between building the automation in a connected platform and the Fallback, copy-paste-ready .md files. Completion: ESP status is known (platform connected, or Fallback), and a connected ESP's user has chosen "Set it up" or "Just the copy".

## 5. Plan the sequence

Pick the sequence Format, then read its file:

| Sequence | Purpose | Length | When to use | Framework and emails |
|----------|---------|--------|-------------|----------------------|
| **Welcome** | Deliver value, build relationship | 5-7 emails | After opt-in | `references/welcome.md`; calibration copy in `references/welcome-example.md` |
| **Nurture** | Provide value, build trust | 4-6 emails | Between welcome and pitch | Weekly or 2x/week (`references/send-timing.md`) |
| **Conversion** | Sell the product | 4-7 emails | When ready to pitch | `references/conversion.md` |
| **Launch** | Time-bound campaign | 6-10 emails | Product launch | `references/launch.md` |
| **Re-engagement** | Win back cold subscribers | 3-4 emails | Inactive 30+ days | `references/re-engagement.md` |
| **Post-Purchase** | Onboard, reduce refunds, upsell | 4-6 emails | After purchase | `references/post-purchase.md` |
| **Cart abandonment** | Recover an abandoned cart | Three emails | Ecommerce cart left | `references/cart-abandonment.md`; timing in `references/send-timing.md` |

Choose how the emails connect from `references/architecture.md` (straight line, branch, hybrid). Assign every email a send day and time from `references/send-timing.md`, using the audience type, the sequence Format, the price point (the higher the price, the more value emails before the pitch) and any send-time data in `learnings.md`.

Completion: each email has a purpose, a send day and time with rationale, and the first pitch lands after the number of value emails the price point calls for.

## 6. Write the emails

Read `references/copy-principles.md`, then write every email in the loaded voice with the sequence's positioning angle as its spine. For every email, give three subject-line variants with preview text and a recommended A/B test, following `references/subject-lines.md`. For a welcome sequence, `references/welcome-example.md` shows full copy for each email.

Completion: every email passes the per-email checks in `references/copy-principles.md`.

## 7. Check the sequence

The sequence is ready when it:

1. Delivers value before asking: at least 3-5 value emails before the pitch.
2. Gives each email ONE clear purpose.
3. Sounds human: not corporate, not guru, not AI.
4. Creates momentum: each email makes them want the next.
5. Handles objections before the reader thinks them.
6. Drives one action per email.
7. Respects the reader: easy to unsubscribe, not manipulative.
8. Offers three subject-line variants per email.
9. Gives specific timing: day, time and rationale, not just "Day 2".
10. Lives in individual files: each email standalone, importable, iterable.

A run of "content, content, content, BUY NOW BUY NOW" has failed; rework it until it reads as a relationship. Completion: all ten hold.

## 8. Save

Read `references/file-output.md` for the directory layout, the `{nn}-{purpose}.md` naming, the individual email file format, and the sequence sections of `brief.md` (the base format is `../_system/brand-memory.md` §Campaigns). Write `brief.md`, one file per email, and `sequence-summary.md`: its sequence overview, architecture and send timing tables, with a JSON block conforming to `../_system/schemas/email-sequence-summary.schema.json` at the bottom inside a `<details>` section (layout in `references/summary-output.md`). Append the sequence to `./brand/assets.md` as `draft`. Where the ESP step chose "Set it up", create the automation through the platform API after the files exist.

Completion: `brief.md`, every email file and `sequence-summary.md` exist, the summary JSON validates against the schema, and `assets.md` has the entry.

## 9. Present

Follow `../_system/output-format.md`, filling its Content section with the layout in `references/summary-output.md`, and its Files Saved section with every file from step 8. For What's Next, make `→ /creative` (HTML email templates, header graphics, visual assets) the first step, with the next skill in the chain as the skip option, then /content-atomizer to promote the lead magnet (prompt in `references/summary-output.md`). Completion: the output holds the sequence overview, subject-line variants, architecture, send timing summary, Files Saved and What's Next, with the response pointing at the saved files.

## 10. Feedback

Apply `../_system/brand-memory.md` §Feedback. When logging, record the specifics of this skill: the number of emails and the sequence Format, the angle, the tone, the subject-line style chosen, what the user changed, and any voice, subject-line direction or send-timing corrections they give. If the user reports which subject-line variant won an A/B test, log it under "What Works" or "What Doesn't Work":

```
- [YYYY-MM-DD] [/email-sequences] Subject line A/B test: "{winner}" beat "{loser}" ({open rate difference if known}). Pattern: {what the winner had that the loser didn't}.
```

This data accumulates and informs which variant types to recommend as the "safe bet" in future sequences. When edits or a rewrite point at voice, suggest re-running /brand-voice. Completion: the feedback prompt is shown and any supplied finding is logged.
