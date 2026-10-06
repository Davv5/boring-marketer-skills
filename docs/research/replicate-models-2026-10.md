# Research: Are the MODEL_REGISTRY.md Replicate models still current? (as of 2026-10-06)

> **Sources:** The primary sources are Replicate model, collection, owner, pricing and changelog pages, fetched on **2026-10-06** and converted to local text. The model data (run_count, latest_version_created_at, input schema, pricing JSON) comes from each model page as fetched on that date. The baseline is the registry, last verified 2026-02-18: `creative/references/MODEL_REGISTRY.md` ([registry][reg]).
>
> **Labels used:** **Direct** = stated on the cited Replicate page. **Derived** = arithmetic on a Direct per-second or per-image price. **Replicate editorial** = a recommendation or ranking written by Replicate on a collection page, not a measured benchmark. **Inference** = the researcher's own reasoning. **UNVERIFIED** = not supported by the fetched files.
>
> **Limits:** The fetched files contain no latency data, so every latency figure in the registry is UNVERIFIED. The files also contain no quality benchmarks, so any "better/worse quality" claim is either Replicate editorial or UNVERIFIED.

## Summary

All 10 registry models are still listed on Replicate and runnable. None of their pages shows a deprecation notice. The only deprecations are two parameters on Kling 2.5 Turbo Pro (`image` and `guidance_scale`).

The registry is out of date in four ways:
- **Silent default changes.** `generate_audio` now defaults to `true` on Kling 2.6, Veo 3.1 and Veo 3.1 Fast. Veo now defaults to 1080p. Sora 2 now defaults to 4 seconds and portrait.
- **Invalid values in the registry.** Seedance 1 Pro has no `3:2`/`2:3` aspect ratios and no `negative_prompt`. Nano Banana Pro no longer accepts `webp`. Wan 2.2 Fast needs `num_frames` of 81 or more. Sora 2 only accepts 4, 8 or 12 seconds.
- **Wrong costs.** Nano Banana Pro costs $0.15/image, not $0.02–0.04. Veo 3.1 costs $3.20 for 8s with audio, not $0.80–1.50. Seedance 1 Pro at 1080p costs $0.75 per 5s, not $0.15. Kling Lip-Sync is cheaper than the registry says.
- **Newer successors.** Nano Banana 2, Kling Video 3.0, Seedance 1.5 Pro / 2.0, Veo 3.1 Lite and Sora 2 Pro are now available.

---

## Summary table

| Role | Current slug | Status (2026-10-06) | Recommended slug | Why |
|---|---|---|---|---|
| Image default | `google/nano-banana-pro` | Live. Latest version 2026-07-21, 36.07M runs ([nbp]). Price is ~4–7× the registry figure. | **`google/nano-banana-2`** as default. Keep `nano-banana-pro` for 4K or complex work. | Replicate editorial calls NB2 "the strongest all-around image generation model right now" ([c-t2i]). It costs $0.101 at 2K vs $0.15 for Pro ([nb2], [nbp]). |
| Video default | `kwaivgi/kling-v2.5-turbo-pro` | Live. Latest version 2026-04-10, 3.06M runs. `image` and `guidance_scale` are marked deprecated ([k25]). | **`kwaivgi/kling-v2.6`**, with `generate_audio:false` set explicitly | Same $0.07/s price without audio, plus optional native audio ([k25], [k26]). The registry already marks 2.5 as "legacy" ([reg]). |
| Video production | `kwaivgi/kling-v2.6` | Live. Latest version 2025-12-31, 966,920 runs. `generate_audio` now defaults to **true** ([k26]). | **`kwaivgi/kling-v3-video`** (`mode:"pro"`) | 3–15s, 720p/1080p/4K, multi-shot, native audio ([k3]). Costs $0.224/s without audio, ~3.2× Kling 2.6. |
| Video testing (I2V) | `wan-video/wan-2.2-i2v-fast` | Live. Latest version 2026-01-16, 14.64M runs. `num_frames` minimum is now 81 ([w22i]). | **Keep** `wan-video/wan-2.2-i2v-fast` | Still $0.05 per 480p video, the cheapest per clip among the fetched candidates ([w22i]). |
| Video testing (T2V) | `wan-video/wan-2.2-t2v-fast` | Live. Latest version 2026-01-16, 348,998 runs ([w22t]). | **Keep** `wan-video/wan-2.2-t2v-fast` | $0.05 per 480p video ([w22t]). |
| Video mid-tier | `bytedance/seedance-1-pro` | Live. Latest version 2025-11-10, 2.46M runs. Real 1080p cost is $0.75 per 5s ([sd1p]). | **`bytedance/seedance-1.5-pro`** | Same parameter surface including `camera_fixed`. At 1080p without audio it costs $0.06/s vs $0.15/s, and it adds native audio ([sd15]). |
| Video comparison | `google/veo-3.1` | Live. Latest version 2026-03-25, 636,956 runs ([veo]). Audio and 1080p are now on by default. | **Keep** `google/veo-3.1` (hero) | Still Replicate's "top choice" for realism alongside Runway Gen-4.5 ([c-t2v]). Budget $3.20 per 8s clip with audio. |
| Video comparison | `google/veo-3.1-fast` | Live. Latest version 2026-03-25, 835,216 runs. **No `reference_images`** in the schema ([veof]). | Keep. Consider **`google/veo-3.1-lite`** for volume. | Lite costs $0.08/s at 1080p vs $0.10–0.15/s for Fast ([veol], [veof]). |
| Video comparison | `openai/sora-2` | Live. Latest version 2026-01-21, 354,612 runs. `seconds` ∈ {4,8,12} ([sora]). | Keep. Use **`openai/sora-2-pro`** when budget allows. | Pro adds a `high` 1792×1024 tier at $0.30–0.50/s ([sorap]). |
| Lip-sync | `kwaivgi/kling-lip-sync` | Live. Latest version 2025-11-07, 58,460 runs. $0.014/s ([kls]). | **Keep** as default. Add **`sync/lipsync-2-pro`** for hero clips. | Kling is still the only fetched lip-sync model with text→TTS input ([kls]). Replicate editorial calls lipsync-2-pro "studio-grade"/"cinematic quality" ([c-lip]). |

---

## Per-model findings

### 1. `google/nano-banana-pro` (image default)

**Q1 – Status.**
- Direct: Listed, `is_official: true`, run_count 36,067,697, latest_version_created_at 2026-07-21 ([nbp]).
- Direct: Still featured in the image-editing collection ([c-edit]) and on the Google owner page ([o-g]).
- Direct: No deprecation text appears on the page ([nbp]).
- Direct: The page describes the model as "Nano Banana Pro (or Gemini 3 Pro Image)" ([nbp]). The registry's "Underlying Model: Gemini 2.5 Flash Image" is therefore wrong ([reg]).

**Q2 – Schema diffs vs. registry** ([nbp] vs [reg]):
- `resolution` enum is now `1K | 2K | 4K`. The registry lists only `1K | 2K`. Default is `2K` → no diff on the default.
- `output_format` enum is now **`jpg | png` only**. The registry lists `webp` as an option. Inference: sending `"webp"` will fail validation.
- **New parameter** `allow_fallback_model` (bool, default `false`). The schema says it falls back to "bytedance/seedream-5" when Google's API is at capacity ([nbp]). The changelog names the fallback "Seedream 5.0 lite" ([chg]); see Contradictions.
- Changelog limits on the fallback: it does not support 4K or the `4:5`/`5:4` ratios. When it fires, the output's `resolution` field reads `"fallback"`, and you are billed the fallback price ([chg]).
- `aspect_ratio`: no diff. The same 11 values are listed, with default `match_input_image`.
- `image_input`: no diff (array, up to 14).
- `safety_filter_level`: no diff (same 3 values, default `block_only_high`).
- `prompt`: no diff.

**Q3 – Price.**
- Direct: **$0.15/image at 1K and 2K, $0.30 at 4K, $0.035 when the fallback is used** ([nbp]).
- Registry: $0.02–0.04/image and $0.08–0.16 per 4 images ([reg]).
- Derived: the registry is understated by ~4–7.5× at 2K. Four 2K images cost $0.60.

**Q4 – Successors / alternatives.**

| Slug | Price | Max res | Notes |
|---|---|---|---|
| `google/nano-banana-2` | $0.067 (1K) / $0.101 (2K) / $0.151 (4K) ([nb2]) | 4K | Gemini 3.1 Flash Image. 14 aspect ratios incl. `1:4`, `1:8`, `4:1`, `8:1`. Adds `google_search` / `image_search` grounding. **Default resolution is `1K`**. No `safety_filter_level` and no fallback parameter ([nb2]). Replicate editorial: "strongest all-around image generation model right now"; Pro "adds Gemini 3 Pro reasoning … and 4K output for more complex tasks" ([c-t2i]). |
| `google/nano-banana-2-lite` | $0.034 flat ([nb2l]) | No `resolution` parameter (output size UNVERIFIED) | Described as "the cheapest, lowest-latency Nano Banana model". Supports 14 reference images ([nb2l]). |
| `openai/gpt-image-2` | $0.012 (low) / $0.047 (medium) / $0.128 (high or auto) ([gi2]) | Up to 3840×2160; the page says sizes above 2560×1440 are "experimental" | Has `background:"transparent"`, `number_of_images` 1–10, `input_images`. **Default `output_format` is `webp`** and default aspect ratio is `1:1` ([gi2]). |
| `openai/gpt-image-2.5-flare`, `openai/gpt-image-2.5-sunburst` | UNVERIFIED (not fetched) | UNVERIFIED | Listed on the OpenAI owner page as the "fastest" and "most capable" OpenAI image models ([o-oai]). |

Unverified registry claims: "best-in-class typography" and "2–3× the speed" have no support in the fetched files and are UNVERIFIED.

---

### 2. `kwaivgi/kling-v2.5-turbo-pro` (video default)

**Q1 – Status.**
- Direct: Listed, official, 3,063,077 runs, latest_version_created_at 2026-04-10 ([k25]).
- Direct: Still on the Kling owner page ([o-kw]) and in the T2V/I2V collections ([c-t2v], [c-i2v]).
- Direct: No model-level deprecation. Only parameter-level deprecations, listed below ([k25]).

**Q2 – Schema diffs** ([k25] vs [reg]):
- `image` is now **`deprecated: true`**, with the description "Deprecated: Use start_image instead." The registry calls it an accepted alias.
- `guidance_scale` is **still in the schema**, marked deprecated: "Kept for backwards compatibility. This parameter is not used." The registry says it was removed. Inference: sending it is harmless but does nothing.
- `negative_prompt` now has default `""`. Otherwise no diff.
- `end_image`: present. The registry says "only works in pro mode", but there is no `mode` parameter in the schema, so that note can't be checked → UNVERIFIED.
- `duration`: no diff (`5 | 10`, default 5).
- `aspect_ratio`: no diff (`16:9 | 9:16 | 1:1`, default `16:9`, ignored when `start_image` is set).
- `prompt` "max 2500 characters": the schema states no limit → UNVERIFIED for 2.5.

**Q3 – Price.**
- Direct: **$0.07/s** ([k25]).
- Derived: $0.35 per 5s, $0.70 per 10s.
- Registry: ~$0.40 / ~$0.80, and $0.30–0.50 / $0.60–1.00 in its cost table ([reg]). Slightly cheaper now, and inside the registry's range.
- No audio parameter.

**Q4 – Successor:** `kwaivgi/kling-v2.6` costs the same $0.07/s without audio and adds `generate_audio` ([k26]). `kwaivgi/kling-v3-video` is the newer generation; see #3 ([k3]). Inference: 2.5 Turbo Pro no longer has any price or feature advantage over 2.6.

---

### 3. `kwaivgi/kling-v2.6` (video production)

**Q1 – Status.** Direct: Listed, official, 966,920 runs, latest_version_created_at 2025-12-31 ([k26]). Listed on the owner page ([o-kw]). No deprecation text.

**Q2 – Schema diffs** ([k26] vs [reg]):
- **`generate_audio` default is now `true`.** The registry says `false`. Inference: any payload that omits it will generate audio and be billed at the $0.14/s audio rate.
- **No `end_image`** in the 2.6 schema. The registry's cross-model cheat sheet lists `end_image` for "Kling 2.5/2.6".
- **No `image` alias** on 2.6.
- `negative_prompt` default `""`.
- `duration` (`5 | 10`, default 5): no diff. `aspect_ratio` (`16:9 | 9:16 | 1:1`, default `16:9`): no diff. `start_image`: no diff.
- Registry cheat-sheet claim "Fixed 1080p": there is no resolution parameter, and the page doesn't state an output resolution → UNVERIFIED. The owner page calls it "Kling 2.6 Pro" ([o-kw]).

**Q3 – Price.**
- Direct: **$0.07/s without audio, $0.14/s with audio** ([k26]). This matches the registry's ~$0.07 / ~$0.14 ([reg]).
- Derived: $0.35 / $0.70 per 5s.

**Q4 – Successors.**

| Slug | Price (per s) | Duration | Resolution | Audio | I2V / T2V |
|---|---|---|---|---|---|
| `kwaivgi/kling-v3-video` | standard $0.168 / with audio $0.252; pro $0.224 / $0.336; 4k $0.42 (with or without audio) ([k3]) | 3–15s, any integer, default 5 | `mode`: standard = 720p, pro = 1080p (default), 4k | `generate_audio` (default **false**) | Both: `start_image`, `end_image`, `aspect_ratio`. Plus `multi_prompt` with up to 6 shots ([k3]) |
| `kwaivgi/kling-v3-omni-video` | standard $0.168 / with audio $0.224; pro $0.224 / $0.28; 4k $0.42 ([k3o]) | 3–15s | same `mode` values | `generate_audio` (default false, "mutually exclusive with reference video") | Both, plus `reference_images` (max 7, or 4 with a video), `reference_video` (feature or base edit) ([k3o]) |
| `kwaivgi/kling-o1` | std $0.084, pro $0.112; with video input $0.126 / $0.168 ([ko1]) | 5 or 10s for T2V/I2V | `mode` std/pro | no audio parameter | Primarily video editing ([ko1]) |

- Derived: a 5s v3 clip at pro without audio costs **$1.12** vs **$0.35** on 2.6 (3.2×). An 8s v3 pro clip with audio costs $2.69.
- Replicate editorial: Kling Video 3.0 is recommended "for multi-shot storytelling with audio … ideal for short narratives, product demos, and ads" ([c-t2v]).
- Inference: Omni with audio is cheaper than v3 with audio at the pro tier ($0.28 vs $0.336/s). Without audio the two cost the same.

---

### 4. `wan-video/wan-2.2-i2v-fast` (testing, I2V)

**Q1 – Status.** Direct: Listed, official, 14,642,686 runs, latest_version_created_at 2026-01-16 ([w22i]). Replicate editorial: "the cheapest and fastest option with 10M+ runs" ([c-i2v]). No deprecation text.

**Q2 – Schema diffs** ([w22i] vs [reg]):
- **`num_frames`: minimum 81, maximum 121, default 81.** The registry says "17–81". Inference: values below 81 will now be rejected. Above 81 is now allowed.
- **Frame/duration math has changed.** There is a new `frames_per_second` parameter (default 16, range 5–30), and the page notes that "pricing … is based on the video duration at 16 fps" ([w22i]). Derived: 81 frames at 16 fps ≈ 5.1s. The registry says "81 frames ≈ 3 seconds" ([reg]).
- **New parameters:**
  - `last_image` (end-frame conditioning)
  - `interpolate_output` (default `false`)
  - `sample_shift` (default 12)
  - `seed`
  - `disable_safety_checker`
  - LoRA inputs (`lora_weights_transformer`, `_2`, and their scales)
- The registry cheat sheet says Wan has no reproducibility control; it now has `seed`.
- `image` (required), `prompt`, `resolution` (`480p | 720p`, default `480p`) and `go_fast` (default true): no diff.

**Q3 – Price.**
- Direct: $0.05/video at 480p, $0.065 at 480p with interpolation, $0.11 at 720p, $0.145 at 720p with interpolation ([w22i]).
- Registry: ~$0.05 at 480p ([reg]) → **no diff** at 480p. The registry gives no 720p price.

**Q4 – Successors / alternatives.**

| Slug | Price | Max duration | Resolution | Audio | I2V/T2V |
|---|---|---|---|---|---|
| `wan-video/wan-2.7-i2v` | $0.10/s at 720p, $0.15/s at 1080p ([w27i]) | 2–15s | 720p / 1080p (no 480p) | Auto-generates audio unless `audio` is supplied ([w27i]) | I2V via `first_frame` (new name), `last_frame`, `first_clip` continuation |
| `alibaba/wan-3` | $0.025/s at 480p, $0.05 at 720p, $0.10 at 1080p ([wan3]) | 2–**30**s | 480p / 720p / 1080p | No audio parameter in the schema (whether it outputs audio is UNVERIFIED) | Both: `image` optional, `negative_prompt`, `aspect_ratio` incl. `adaptive` ([wan3]) |
| `bytedance/seedance-1.5-pro` (480p, no audio) | $0.013/s ([sd15]) | 2–12s | 480p–1080p | optional | Both ([sd15]) |

- Derived 5s costs: Wan 2.7 at 720p = $0.50. Wan 3 at 480p = $0.125. Seedance 1.5 Pro at 480p without audio = $0.065. Wan 2.2 Fast = **$0.05**, still the cheapest.
- Pricing caveat: every fetched page shows the banner "Wan 3.0 is 30% off this week" ([pricing], [c-t2v]). The T2V collection also still shows "(50% off until Aug 30!)" on the Wan 3 card ([c-t2v]). It is UNVERIFIED whether the Wan 3 pricing JSON is the list price or the discounted price.

---

### 5. `wan-video/wan-2.2-t2v-fast` (testing, T2V)

**Q1 – Status.** Direct: Listed, official, 348,998 runs, latest_version_created_at 2026-01-16 ([w22t]). No deprecation text.

**Q2 – Schema diffs** ([w22t] vs [reg]):
- `num_frames` 81–121 (default 81). Same change as I2V.
- **`aspect_ratio` exists**: `16:9 | 9:16`, default `16:9`. The registry cheat sheet says "N/A".
- **`interpolate_output` defaults to `true`** here, unlike the I2V model's `false`.
- New `optimize_prompt` (default false): "Translate prompt to Chinese before generation".
- Also new: `frames_per_second` (default 16), `sample_shift`, `seed`, `disable_safety_checker`, LoRA inputs.
- The registry payload's own fields (`prompt`, `resolution` `480p`, `num_frames` 81, `go_fast` true): no diff.

**Q3 – Price.** Direct: $0.05 at 480p, $0.10 at 720p ([w22t]). This matches the registry's ~$0.05 ([reg]). The T2V pricing JSON has no separate interpolation tier.

**Q4 – Successors.** `alibaba/wan-3` covers T2V up to 30s at $0.025/s (480p) ([wan3]). Replicate editorial names `wan-video/wan-2.7-t2v` "the newest" open Wan T2V model ([c-t2v]); its schema and price were not fetched → UNVERIFIED. The Wan owner page describes it as "1080p, up to 15 seconds, with audio synchronization" ([o-wan]). Inference: none of these beats $0.05/clip for throwaway drafts.

---

### 6. `bytedance/seedance-1-pro` (mid-tier)

**Q1 – Status.** Direct: Listed, official, 2,457,753 runs, latest_version_created_at 2025-11-10 ([sd1p]). No deprecation text.

**Q2 – Schema diffs** ([sd1p] vs [reg]):
- **`aspect_ratio` enum is `16:9, 4:3, 1:1, 3:4, 9:16, 21:9, 9:21`.** The registry lists **`3:2` and `2:3`, which are not valid**, and omits `21:9` and `9:21`.
- **No `negative_prompt`** in the schema. The registry's parameter table and cheat sheet both list it.
- New parameters: `last_frame_image` (needs `image`), `fps` (enum `[24]`), `seed`.
- `image`, `duration` (2–12, default 5), `resolution` (`480p | 720p | 1080p`, default `1080p`) and `camera_fixed` (default false): no diff.

**Q3 – Price.**
- Direct: $0.03/s (480p), $0.06/s (720p), **$0.15/s (1080p)** ([sd1p]). The registry's per-second range "$0.03–0.15/sec" is correct.
- The registry's cost table and tier diagram say **~$0.15 per 5s 1080p video** ([reg]). Derived: the real cost is **$0.75**, a 5× understatement.

**Q4 – Successors.**

| Slug | Price (1080p, per s) | Max duration | Resolution | Audio | I2V/T2V | Camera lock |
|---|---|---|---|---|---|---|
| `bytedance/seedance-1.5-pro` | $0.06 without audio / $0.12 with audio. 480p: $0.013 / $0.025 ([sd15]) | 2–12s | 480p–1080p, **default 720p** | `generate_audio`, **default true** | Both | `camera_fixed` ✔ ([sd15]) |
| `bytedance/seedance-2.0` | $0.45 without video input / $0.55 with video input. 4K: $1.00 / $1.25 ([sd2]) | up to 15s, or `-1` for auto | 480p–4K, default 720p | default true | Both, plus up to 9 reference images, 3 reference videos, 3 reference audios ([sd2]) | ✘ (not in schema) |
| `bytedance/seedance-2.0-fast` | 720p max: $0.15 / $0.17 ([sd2f]) | up to 15s | 480p / 720p | default true | Both, plus references | ✘ |

- Derived: a 5s 1080p clip on Seedance 1.5 Pro without audio costs **$0.30**, vs **$0.75** on 1 Pro.
- The ByteDance owner page also lists `bytedance/seedance-2.5` ("native 30-second generation") and `bytedance/seedance-2.0-mini` ("lower-cost variant") ([o-bd]). Their schemas and prices were not fetched → UNVERIFIED.
- `bytedance/seedance-1-pro-fast` is described in Replicate editorial as "30-60% faster than standard Seedance at ~60% lower cost" ([c-i2v]). It was not fetched → UNVERIFIED.

---

### 7. `google/veo-3.1` (hero comparison)

**Q1 – Status.** Direct: Listed, official, 636,956 runs, latest_version_created_at 2026-03-25 ([veo]). No deprecation text.

**Q2 – Schema diffs** ([veo] vs [reg]):
- **`resolution` default is now `1080p`.** The registry says `720p`.
- **`generate_audio` default is now `true`.** The registry says `false`, and its Common Mistake #4 tells users they must set it to true. That advice is now reversed: you must set **`false`** to avoid audio cost.
- `reference_images`: the schema adds constraints. Reference images "only work with 16:9 aspect ratio and 8-second duration", and `last_frame` is ignored when they are provided ([veo]).
- `image`, `last_frame`, `duration` (`4 | 6 | 8`, default 8), `aspect_ratio` (`16:9 | 9:16`, default `16:9`), `negative_prompt`, `seed`: no diff. The schema doesn't state the registry's seed range of 0–4294967295 → UNVERIFIED.

**Q3 – Price.**
- Direct: **$0.40/s with audio, $0.20/s without** ([veo]).
- Derived: an 8s clip costs **$3.20 with audio** (the new default) or **$1.60 without**.
- Registry: $0.80–1.50 per clip and "~$1.00" in the hero pattern ([reg]). Understated 2–4×.

**Q4 – Successors.**
- No newer Veo exists on the Google owner page; the list tops out at 3.1 / 3.1 Fast / 3.1 Lite ([o-g]).
- The owner page also lists `google/gemini-omni-1.1`: "fast multimodal video generation and editing model with native audio" ([o-g]). It was not fetched → UNVERIFIED.
- Replicate editorial ranks **Runway Gen-4.5** "#1 on the Artificial Analysis text-to-video benchmark" and calls Veo 3.1 "another top choice" ([c-t2v]). `runwayml/gen-4.5` was not fetched, so its price and schema are UNVERIFIED.

---

### 8. `google/veo-3.1-fast` (comparison)

**Q1 – Status.** Direct: Listed, official, 835,216 runs, latest_version_created_at 2026-03-25 ([veof]). No deprecation text.

**Q2 – Schema diffs** ([veof] vs [reg]):
- **No `reference_images` parameter.** The registry says Fast "Supports `reference_images` (1-3 URLs)".
- `generate_audio` default is **`true`**, and `resolution` default is **`1080p`**. Same change as Veo 3.1.
- The registry's Fast payload fields (`prompt`, `negative_prompt`, `image`, `duration` 8, `aspect_ratio`, `resolution`): no diff in names or enums. `last_frame` and `seed` are present.

**Q3 – Price.**
- Direct: **$0.15/s with audio, $0.10/s without** ([veof]).
- Registry: ~$0.10/s without audio (no diff) and ~$0.20/s with audio (**now cheaper**). Its cost table says ~$0.80 per 8s 1080p clip ([reg]).
- Derived: $0.80 without audio, but **$1.20 with the default audio on**.

**Q4 – Successor / alternative:** `google/veo-3.1-lite` costs $0.05/s at 720p and $0.08/s at 1080p ([veol]). The details:
- 1080p "must be 8" seconds.
- Default resolution is 720p.
- No `generate_audio`, `negative_prompt` or `reference_images` parameters.
- The description says "native audio" and supports T2V and I2V ([veol]).
- Derived: $0.64 per 8s at 1080p.
- Replicate editorial: "a more affordable option for high-volume use" ([c-t2v]).
- Inference: since Lite has no audio toggle, audio is probably always on. This is UNVERIFIED.

---

### 9. `openai/sora-2` (comparison)

**Q1 – Status.** Direct: Listed, official, 354,612 runs, latest_version_created_at 2026-01-21 ([sora]). No deprecation text.

**Q2 – Schema diffs** ([sora] vs [reg]):
- **`seconds` is an enum `4 | 8 | 12`**, **default 4**. The registry says a range of 4–12 with default 8. Inference: 5, 6, 10 and so on will be rejected.
- **`aspect_ratio` default is `portrait`.** The registry says `landscape`. The enum is unchanged: `portrait` (720×1280) and `landscape` (1280×720).
- `input_reference` ("must be the same aspect ratio as the video") and `openai_api_key`: no diff. If you supply your own key, "you will be charged directly by OpenAI" ([sora]).

**Q3 – Price.**
- Direct: **$0.10/s** ([sora]).
- Derived: $0.80 per 8s, $1.20 per 12s.
- Registry: $0.60–1.20 per clip ([reg]) → consistent.

**Q4 – Successor:** `openai/sora-2-pro`. Same parameters, plus `resolution` = `standard` (720p) or `high` ([sorap]).
- The pricing JSON gives `high` as 1792×1024 / 1024×1792 ([sorap]).
- Direct: $0.30/s standard, $0.50/s high ([sorap]).
- Derived: $2.40 or $4.00 per 8s.
- Native audio: Direct, the description says "with synchronized audio" ([sorap]). There is no audio toggle on either Sora model.

---

### 10. `kwaivgi/kling-lip-sync` (lip-sync)

**Q1 – Status.**
- Direct: Listed, official, 58,460 runs, latest_version_created_at 2025-11-07 ([kls]). No deprecation text.
- Replicate editorial still recommends it "For text-based or batch lip sync" ([c-lip]).

**Q2 – Schema diffs** ([kls] vs [reg]):
- **`voice_id` is now an enum of 46 fixed IDs** (e.g. `en_AOT`, `en_oversea_male1`, `en_uk_man2`, `en_commercial_lady_en_f-v1`, and many `zh_*` voices), **default `en_AOT`**. The registry calls it a free string with no default.
- **`voice_speed` range is 0.8–2.0** (default 1). The registry says 0.5–2.0. Inference: values from 0.5 to 0.79 will be rejected.
- `video_url`, `video_id`, `audio_file`, `text`: no diff. The video constraints (2–10s, 720p–1080p, <100MB) and the audio constraints (.mp3/.wav/.m4a/.aac, <5MB) match. The schema marks no fields as required.

**Q3 – Price.**
- Direct: **$0.014/s of output video** ([kls]).
- Derived: $0.14 per 10s clip.
- Registry: $0.30–0.60 per clip ([reg]) → **overstated ~2–4×**.

**Q4 – Successors / alternatives.**

| Slug | Price (per s) | Inputs | Notes |
|---|---|---|---|
| `sync/lipsync-2-pro` | $0.08325 ([ls2p]) | `video` (.mp4) + `audio` (".wav" per the description), both required. Also `sync_mode` (loop / bounce / cut_off / silence / remap), `temperature`, `active_speaker` ([ls2p]) | No text/TTS input. Replicate editorial: "studio-grade", "For cinematic quality" ([c-lip]). Derived: $0.83 per 10s. |
| `heygen/lipsync-precision` | $0.0667 ([hgp]) | `video` + `audio`. Also `enable_dynamic_duration` (default true), `disable_music_track`, `enable_speech_enhancement` ([hgp]) | "high-accuracy avatar-inference lip sync" ([hgp]). |
| `kwaivgi/kling-avatar-v2` | std $0.056 / pro $0.11 ([kav2]) | `image` + `audio` (required), optional `prompt`, `mode` | Image → talking avatar, not video re-sync ([kav2]). |
| `bytedance/omni-human` | $0.14 ([omni]) | `image` + `audio` | Quality degrades on audio over 15s ([omni]). Owner page also lists `omni-human-1.5`, which was not fetched → UNVERIFIED ([o-bd]). |

Inference: Kling v3 and Seedance 2.0 / 1.5 Pro can produce lip-synced dialogue during generation ([k3], [sd2], [sd15], [c-t2v]). That can remove the separate lip-sync step for new clips. A post-hoc lip-sync model is still needed for existing footage.

`prunaai/p-video-avatar` is described on the lip-sync collection as "the fastest and cheapest avatar/lipsync video model on the market" ([c-lip]). That is the vendor's own description; the model was not fetched, so its price is UNVERIFIED.

---

## Recommended lineup (tiering: test cheap → ship quality)

The $ figures below are **Derived** from the cited per-unit prices. The "quality" ordering for video follows Replicate editorial only; no benchmarks were in the fetched files.

| Tier / role | Slug | Payload notes | Est. cost per clip |
|---|---|---|---|
| **Image default** | `google/nano-banana-2` ([nb2]) | Set `resolution:"2K"` explicitly (default is 1K). `output_format` jpg or png only. No `safety_filter_level`. | $0.101 |
| Image drafts (optional) | `google/nano-banana-2-lite` ([nb2l]) | No `resolution` parameter. | $0.034 |
| Image premium / 4K / complex | `google/nano-banana-pro` ([nbp]) | Remove `webp`. Consider `allow_fallback_model:true` for batch reliability (fallback output differs; see [chg]). | $0.15 (2K), $0.30 (4K) |
| Image with transparency | `openai/gpt-image-2` ([gi2]) | `background:"transparent"`, `output_format:"png"`. | $0.047 (medium) to $0.128 (high) |
| **Video test (I2V)** | `wan-video/wan-2.2-i2v-fast` ([w22i]) | `num_frames` ≥ 81. ~5s at 16 fps. | $0.05 |
| **Video test (T2V)** | `wan-video/wan-2.2-t2v-fast` ([w22t]) | `aspect_ratio` is now available. `interpolate_output` defaults to true. | $0.05 |
| **Video mid-tier** (product, camera lock) | `bytedance/seedance-1.5-pro` ([sd15]) | `camera_fixed:true`, `resolution:"1080p"` (default 720p), `generate_audio:false` unless needed. No `3:2`/`2:3` ratios. | 5s 1080p: $0.30, or $0.60 with audio |
| **Video default** | `kwaivgi/kling-v2.6` ([k26]) | **Set `generate_audio:false` explicitly.** No `end_image`. | 5s: $0.35, or $0.70 with audio |
| **Video production** | `kwaivgi/kling-v3-video`, `mode:"pro"` ([k3]) | `duration` 3–15. `generate_audio` defaults to false. `multi_prompt` for multi-shot ads. | 5s: $1.12, or $1.68 with audio |
| **Hero comparison** (run in parallel) | `kwaivgi/kling-v3-video` (pro + audio) ([k3]), `google/veo-3.1` ([veo]), `openai/sora-2` ([sora]) | Veo: audio and 1080p are default. Sora: set `seconds:8` and `aspect_ratio:"landscape"` explicitly. | 8s each: $2.69 + $3.20 + $0.80 = **~$6.69**. The registry estimated ~$2.15 ([reg]). |
| Hero upgrade (optional) | `openai/sora-2-pro` ([sorap]), `bytedance/seedance-2.0` ([sd2]) | Sora Pro `resolution:"high"`. Seedance 2.0 when you need multi-reference inputs. | 8s: $4.00 (Sora Pro high), $3.60 (Seedance 2.0 at 1080p without video input) |
| Premium volume alternative | `google/veo-3.1-lite` ([veol]) | 1080p requires `duration:8`. | 8s 1080p: $0.64 |
| **Lip-sync default** | `kwaivgi/kling-lip-sync` ([kls]) | `voice_id` must be from the enum. `voice_speed` ≥ 0.8. | 10s: $0.14 |
| Lip-sync hero | `sync/lipsync-2-pro` ([ls2p]) | `.wav` audio. Pick a `sync_mode`. | 10s: $0.83 |
| Photo → talking head | `kwaivgi/kling-avatar-v2` ([kav2]) | `image` + `audio`. | 10s std: $0.56 |

Why this follows the registry's own logic ([reg]):
- The test tier stays on Wan 2.2 Fast because nothing fetched is cheaper per clip.
- Kling 2.6 replaces 2.5 as default because the registry already marked 2.5 as legacy, and the price is identical.
- Production moves up a generation to Kling 3.0 to "ship quality", at ~3× cost.
- Mid-tier switches to Seedance 1.5 Pro because it is cheaper than 1 Pro at 1080p and keeps `camera_fixed`.
- Inference: whether Kling 3.0 actually looks better than 2.6 is UNVERIFIED. Run a side-by-side before committing production budget.

---

## Contradictions

1. **Nano Banana Pro fallback model.** The schema says "currently bytedance/seedream-5" ([nbp]). The 2026-03-02 changelog says "ByteDance Seedream 5.0 lite" ([chg]). The schema is newer (version dated 2026-07-21), but the discrepancy is unresolved.
2. **Wan 3 promotion.** The Wan 3 card says "(50% off until Aug 30!)", which is stale as of 2026-10-06. The site banner says "Wan 3.0 is 30% off this week" ([c-t2v], [pricing]). It is unclear whether the pricing JSON is discounted.
3. **Wan 3 input modes.** The model meta description says "Generate cinematic video from text". The schema accepts an optional first-frame `image` ([wan3]), and the collection card says "from a text prompt or a starting image … up to 30 seconds" ([c-t2v]).
4. **Seedance 1 Pro capabilities.** The collection card says "5s or 10s videos, at 480p and 1080p" ([c-t2v], [o-bd]). The schema allows 2–12s and 480p/720p/1080p ([sd1p]).
5. **Sora 2 Pro "high" resolution.** The schema says "high is 1024p" and the pricing says "1792x1024 … 1024x1792" ([sorap]). These are consistent if "1024p" means the short side.
6. **Registry internal inconsistency** (not a Replicate issue). The registry's "Verified API Payload" blocks put `"model"` inside the JSON body. Its own API Workflow section says "Do NOT put `model` … in the body" ([reg]). Replicate's changelog confirms the `POST /v1/models/{owner}/{name}/predictions` endpoint is still supported ([chg]).

## Missing evidence

- **Latency** for every model. The registry's latency figures and claims like "~20s" or "3–8 minutes" are UNVERIFIED.
- **Quality comparisons** between generations (Kling 2.6 vs 3.0, NB Pro vs NB2, Seedance 1 Pro vs 1.5 Pro). Only Replicate editorial is available.
- **Not fetched**, so schema and price are UNVERIFIED:
  - `runwayml/gen-4.5`, `bytedance/seedance-2.5`, `bytedance/seedance-2.0-mini`, `bytedance/seedance-1-pro-fast`
  - `wan-video/wan-2.7-t2v`, `openai/gpt-image-2.5-flare` / `-sunburst`
  - `google/gemini-omni-1.1`, `prunaai/p-video`, `prunaai/p-video-avatar`, `bytedance/omni-human-1.5`, `sync/lipsync-2`
- Whether Replicate **rejects or silently ignores** unknown or removed inputs (e.g. `negative_prompt` on Seedance 1 Pro). The registry's 422 guidance assumes rejection.
- Output resolution for `kling-v2.6` and `kling-v2.5-turbo-pro` (no resolution parameter or statement on the page).
- Whether `veo-3.1-lite` always generates audio.
- Absence of a deprecation notice was judged from the extracted page text. A banner rendered only client-side could be missed.

## Sources

Kept (all fetched 2026-10-06):
- [nbp] Nano Banana Pro: schema, price, fallback parameter
- [nb2], [nb2l], [gi2]: image successors' schemas and prices
- [k25], [k26], [k3], [k3o], [ko1], [kav2], [kls]: Kling models' schemas and prices
- [w22i], [w22t], [w27i], [wan3]: Wan models
- [sd1p], [sd15], [sd2], [sd2f]: Seedance models
- [veo], [veof], [veol]: Veo models
- [sora], [sorap]: Sora models
- [ls2p], [hgp], [omni]: lip-sync and avatar alternatives
- [c-t2v], [c-i2v], [c-t2i], [c-edit], [c-lip]: Replicate editorial recommendations and the listing of what is live
- [o-kw], [o-g], [o-bd], [o-wan], [o-oai]: owner model lists, used to detect newer unfetched slugs
- [chg]: Nano Banana Pro fallback details and the endpoint-compatibility note

Deprioritized:
- [pricing], the general pricing page: it has only generic examples and hardware rates and none of the registry models. Used only for the Wan 3 promo banner.
- Changelog entries unrelated to these models (Cog runtime, spend limits).

Local baseline:
- [reg] `/Users/david/Desktop/skills/boring marketer skills/creative/references/MODEL_REGISTRY.md` (read-only)

## Next steps

1. Fetch the schema and price for `runwayml/gen-4.5`, `bytedance/seedance-2.5` and `bytedance/seedance-1-pro-fast`. Each could change the hero or mid-tier pick.
2. Run one identical prompt and start image through Kling 2.6 vs 3.0 and NB Pro vs NB2, to replace editorial claims with first-hand evidence before rewriting the registry.
3. Send one deliberately invalid payload (e.g. Seedance `aspect_ratio:"3:2"`) to confirm whether Replicate returns 422 or ignores it, then update the registry's troubleshooting section.

[reg]: <file:///Users/david/Desktop/skills/boring%20marketer%20skills/creative/references/MODEL_REGISTRY.md>
[nbp]: https://replicate.com/google/nano-banana-pro
[nb2]: https://replicate.com/google/nano-banana-2
[nb2l]: https://replicate.com/google/nano-banana-2-lite
[gi2]: https://replicate.com/openai/gpt-image-2
[k25]: https://replicate.com/kwaivgi/kling-v2.5-turbo-pro
[k26]: https://replicate.com/kwaivgi/kling-v2.6
[k3]: https://replicate.com/kwaivgi/kling-v3-video
[k3o]: https://replicate.com/kwaivgi/kling-v3-omni-video
[ko1]: https://replicate.com/kwaivgi/kling-o1
[kav2]: https://replicate.com/kwaivgi/kling-avatar-v2
[kls]: https://replicate.com/kwaivgi/kling-lip-sync
[w22i]: https://replicate.com/wan-video/wan-2.2-i2v-fast
[w22t]: https://replicate.com/wan-video/wan-2.2-t2v-fast
[w27i]: https://replicate.com/wan-video/wan-2.7-i2v
[wan3]: https://replicate.com/alibaba/wan-3
[sd1p]: https://replicate.com/bytedance/seedance-1-pro
[sd15]: https://replicate.com/bytedance/seedance-1.5-pro
[sd2]: https://replicate.com/bytedance/seedance-2.0
[sd2f]: https://replicate.com/bytedance/seedance-2.0-fast
[veo]: https://replicate.com/google/veo-3.1
[veof]: https://replicate.com/google/veo-3.1-fast
[veol]: https://replicate.com/google/veo-3.1-lite
[sora]: https://replicate.com/openai/sora-2
[sorap]: https://replicate.com/openai/sora-2-pro
[ls2p]: https://replicate.com/sync/lipsync-2-pro
[hgp]: https://replicate.com/heygen/lipsync-precision
[omni]: https://replicate.com/bytedance/omni-human
[c-t2v]: https://replicate.com/collections/text-to-video
[c-i2v]: https://replicate.com/collections/image-to-video
[c-t2i]: https://replicate.com/collections/text-to-image
[c-edit]: https://replicate.com/collections/image-editing
[c-lip]: https://replicate.com/collections/lipsync
[o-kw]: https://replicate.com/kwaivgi
[o-g]: https://replicate.com/google
[o-bd]: https://replicate.com/bytedance
[o-wan]: https://replicate.com/wan-video
[o-oai]: https://replicate.com/openai
[chg]: https://replicate.com/changelog
[pricing]: https://replicate.com/pricing
