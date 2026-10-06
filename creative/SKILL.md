---
name: creative
description: "Create brand-aware image and video assets, or model-ready prompts when generation access is unavailable."
---

# Creative

Create images, video, social graphics, talking-head assets, and ad creative.

**Reads:** `voice-profile.md` (full), `positioning.md` (chosen angle), `creative-kit.md` (full), `stack.md` (full).
**Writes:** `creative-kit.md` when established or changed; append completed assets to `assets.md`.

## Steps

### 1. Load brand context

Apply [`../_system/brand-memory.md` §Read](../_system/brand-memory.md) to the Reads list above. If no `./brand/` directory exists, proceed standalone with the protocol's opening line. The step is complete when each listed file is loaded at its depth or reported missing/stale.

### 2. Choose a Mode

Clarify the asset and its use only when not already clear. Choose the matching Mode and read its playbook: [product photography](modes/product-photo.md), [product video](modes/product-video.md), [social graphics](modes/social-graphics.md), [talking head](modes/talking-head.md), or [ad creative](modes/ad-creative.md). Free generation follows the common workflow below. Each pointer names the branch it serves; the playbooks hold format-specific requirements.

### 3. Develop the creative

For a new project, offer five distinct visual directions and get the user's selection before scaling; skip exploration for a clear one-off, follow-up matching an established style, or an explicit skip. For generation, choose a model by role in [`references/MODEL_REGISTRY.md`](references/MODEL_REGISTRY.md); use its payload and current prices, and show estimated cost before paid generation. A hero comparison runs only when requested, with its total estimated cost shown first. Every payload sets audio and resolution explicitly where supported, and sends model selection in the URL rather than the body. If no token is available, use **Fallback**: deliver a ready-to-use prompt, recommended model role, settings, ratio, resolution and exclusions; generation can proceed later. Completion: user has approved the direction or specified a one-off, and the chosen generation path and cost are clear.

### 4. Generate and review

Generate the requested asset(s), then assess technical fit, brand alignment, strategic purpose and platform fit. Revise against concrete defects or deliver when it meets the brief. Save files under `creative-output/` using descriptive asset names; log completed assets in `brand/assets.md` under the brand-memory write protocol. Completion: requested files are saved, or Fallback prompts are delivered, and each asset's fit is reported.

### 5. Deliver and learn

Use [`../_system/output-format.md`](../_system/output-format.md) for the four-section markdown contract. Disclose skill-specific layouts through the selected Mode playbook. Apply [`../_system/brand-memory.md` §Write](../_system/brand-memory.md) to brand files and §Feedback after the deliverable; retain only creative-specific learning in the asset log. Completion: deliverable, saved-file status, next steps and feedback prompt are present.

## Shared references

- [`references/VISUAL_INTELLIGENCE.md`](references/VISUAL_INTELLIGENCE.md): prompt construction and visual strategy, read during creative development.
- [`references/MODEL_REGISTRY.md`](references/MODEL_REGISTRY.md): model roles, verified-on date, prices and API payloads, read before generation or prompt recommendations.
