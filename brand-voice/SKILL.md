---
name: brand-voice
description: "Create or refine a brand voice profile from existing content, strategic input, or a URL. Use when copy sounds generic or inconsistent."
---

# /brand-voice

Create or refine `./brand/voice-profile.md` so other skills can write consistently in the brand's voice.

## Reads

- `./brand/positioning.md` — chosen angle only.
- `./brand/audience.md` — pain points and language.
- `./brand/voice-profile.md` — full file when present.

## Writes

- `./brand/voice-profile.md` — confirmed voice profile.
- `./brand/learnings.md` — voice-specific feedback under `../_system/brand-memory.md` §Write.

## Steps

1. **Load brand context.** Load the Reads list. Follow [`../_system/brand-memory.md`](../_system/brand-memory.md) §Read for directory checks, Reads depth, freshness, reporting, and use. The current profile determines whether this is a returning run.
   **Done:** Each available Reads file is loaded at its specified depth, or reported missing/stale in the protocol's status line.

2. **Choose the run.** For a returning run, summarize the existing profile and ask whether to make a targeted refinement, incorporate new samples, rebuild, or refresh from a URL. For a first run, use a supplied URL for Scrape; otherwise ask whether the user has representative content (Extract) or wants to shape a new voice (Build). Follow the matching mode file: [`modes/extract.md`](modes/extract.md) for samples, [`modes/build.md`](modes/build.md) for strategic input, or [`modes/scrape.md`](modes/scrape.md) for a URL. If the selected Mode lacks input or evidence, use [`references/mode-fallbacks.md`](references/mode-fallbacks.md). The platform guide is [`references/platform-adaptations.md`](references/platform-adaptations.md), read while completing the profile's platform adaptations. The three worked examples are [`references/worked-examples.md`](references/worked-examples.md), read when a concrete example will help resolve uncertainty.
   **Done:** The chosen Mode has enough grounded evidence or user input to draft the profile, with uncertainty identified rather than invented.

3. **Draft and test.** Complete every field in [`references/voice-profile-template.md`](references/voice-profile-template.md), including platform-specific guidance and the JSON block matching `../_system/schemas/voice-profile.schema.json`. Run [`references/voice-test-loop.md`](references/voice-test-loop.md): three representative samples, specific feedback paths, and the three-round checkpoint.
   **Done:** The user accepts the samples or explicitly chooses a provisional draft, and the complete profile is ready to save.

4. **Save.** Follow [`../_system/brand-memory.md`](../_system/brand-memory.md) §Write to create or update `./brand/voice-profile.md`, including its `## Last Updated` line and JSON block. For an existing profile, show the material changes and obtain confirmation before replacing it. Follow the four-section markdown contract in [`../_system/output-format.md`](../_system/output-format.md); the skill-specific terminal presentation example is disclosed in [`references/terminal-template.md`](references/terminal-template.md).
   **Done:** The confirmed profile is saved at `./brand/voice-profile.md` and its path is listed under Files Saved.

5. **Collect feedback.** After presenting the deliverable, follow [`../_system/brand-memory.md`](../_system/brand-memory.md) §Feedback; log only brand-voice-specific learning, such as the Mode and traits, in `learnings.md` using §Write ownership rules.
   **Done:** The standard feedback prompt has been offered and applicable feedback has been recorded.

## Profile requirements

A useful profile makes the voice recognizable, actionable, differentiated, authentic, consistent, and adaptable across formats; use the detailed quality test and downstream usage guidance in [`references/maintenance-and-use.md`](references/maintenance-and-use.md). Ground claims in the samples or user's stated intent; label gaps instead of filling them with guesses. The profile template, terminal presentation, platform guide, worked examples, and Voice Test Loop are disclosed references above.
