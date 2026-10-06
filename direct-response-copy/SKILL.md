---
name: direct-response-copy
description: "Write or revise persuasive copy for landing pages, sales pages, email, ads, and social posts."
version: 7.0
---

# Direct Response Copy

## Reads

- `voice-profile.md` — full file
- `positioning.md` — chosen angle
- `audience.md` — pain points and language
- `creative-kit.md` — full file

## Writes

Campaign copy under `./campaigns/{campaign-name}/` and entries in `./brand/assets.md`.

## Steps

### 1. Load brand context

Apply `_system/brand-memory.md` §Read to the Reads list above. If `./brand/` is absent, use the standalone path there. Carry relevant context visibly into the work. **Done when** every listed file is loaded at its stated depth or named missing/stale in one status line.

### 2. Establish the assignment

Identify the Format (landing page, sales page, email, ad, social post, or another requested format), audience, offer, desired action, evidence, and constraints. Infer clear details from the brief; ask only for details whose absence would change the copy materially. For an existing campaign, read its relevant copy and ask whether to revise it, add a piece, or start fresh. **Done when** the Format and essential brief facts are clear or explicitly marked as assumptions.

### 3. Draft and review

Write to the reader's need, with specific support for claims and a clear next action. Match the audience and brand context; preserve uncertainty instead of inventing proof. Read the finished copy aloud and revise awkward, generic, or unsupported passages. For long-form craft frameworks, examples, and techniques, consult `references/COPYWRITING_PLAYBOOK.md`; its headline, opening, curiosity, flow, proof, and format guidance supports this step. For AI-tell edits, apply `_system/ai-tells.md` to the finished draft. **Done when** the draft fulfills the brief, claims have support or qualification, and the read-aloud review is complete.

### 4. Save campaign copy

Save completed copy in the campaign directory using clear Format-specific filenames. Follow campaign layout and `brief.md` conventions in `_system/brand-memory.md` §Campaigns. Append each new asset to `./brand/assets.md` under §Write; do not replace existing entries. **Done when** each requested file is saved and registered, or the user requested analysis only.

### 5. Present the deliverable

Use `_system/output-format.md` for the four-section markdown contract and its Quick mode. The copy layouts and campaign file conventions are skill-specific: consult `references/output-templates.md` when choosing a saved-copy frontmatter or presentation layout. **Done when** Header, Content, Files Saved, and What's Next are present in order, with saved paths listed.

### 6. Collect feedback

After a deliverable, apply `_system/brand-memory.md` §Feedback. For copy-specific learnings, record the useful format, angle, or voice preference in the prescribed journal; apply requested edits and save them. **Done when** the canonical feedback prompt is shown and any answer is processed.

## Testing Mode

When the user requests variants, scoring, or A/B testing, use `modes/testing.md`. Otherwise draft the requested copy without adding unsolicited test artifacts.
