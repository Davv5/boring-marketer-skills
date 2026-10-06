# Replicate model registry

Authoritative model roles, slugs, verified prices and API payload guidance. Source: `docs/research/replicate-models-2026-10.md` and `docs/research/replicate-sources-2026-10-06/`. Verified 2026-10-06. Prices are USD; estimates scale by requested duration/resolution as stated. Confirm the upstream schema before using a changed model.

## Roles and prices

| Role | Model slug | Price (USD, verified 2026-10-06) | Reason | Gotchas |
|---|---|---|---|---|
| Image default | `google/nano-banana-2` | $0.067 1K; $0.101 2K; $0.151 4K | Replicate editorial recommends it for all-around generation; 2K costs less than premium. | Set `resolution:"2K"` explicitly (default 1K); JPG/PNG only; no `safety_filter_level` or fallback parameter. Reference images use `image_input`; no seed control in the fetched schema. |
| Image premium | `google/nano-banana-pro` | $0.15 1K/2K; $0.30 4K | Complex work and Pro reasoning, per Replicate editorial. | JPG/PNG only, not WebP. `allow_fallback_model` changes output and billing; fallback has no 4K or 4:5/5:4. Reference images use `image_input`; no seed control in the fetched schema. |
| Video test | `wan-video/wan-2.2-i2v-fast` | $0.05 per 480p clip; $0.11 at 720p; interpolation $0.065/$0.145 | Cheapest fetched image-to-video clip for throwaway tests. | `num_frames` 81–121; 81 at 16 fps is about 5.1s. Required `image`; optional `last_image`. Set resolution and interpolation explicitly; no audio input. |
| Video test | `wan-video/wan-2.2-t2v-fast` | $0.05 per 480p clip; $0.10 at 720p | Cheapest fetched text-to-video clip for throwaway tests. | `num_frames` 81–121; set fps, resolution, ratio, and interpolation (default true) explicitly. No audio input. |
| Video mid-tier | `bytedance/seedance-1.5-pro` | $0.06/s 1080p without audio; $0.12/s with audio | Cheaper than its predecessor at 1080p and retains `camera_fixed` for product shots. | Audio defaults on and resolution to 720p: set both explicitly. No 3:2 or 2:3 ratios. No `negative_prompt`. Uses `image` and optional `last_frame_image`. |
| Video default | `kwaivgi/kling-v2.6` | $0.07/s without audio; $0.14/s with audio | Same silent-video price as the legacy default, with optional native audio. | Audio defaults on: set `generate_audio:false`. No `end_image`, `image` alias, `guidance_scale`, or resolution control; output resolution is unverified. Uses `start_image`; duration 5 or 10s. |
| Video production | `kwaivgi/kling-v3-video` | Pro $0.224/s without audio; $0.336/s with audio; 4K $0.42/s | Newer generation for multi-shot narratives, product demos, and ads per Replicate editorial; comparative quality is unverified. | Set `mode:"pro"` (1080p) and audio explicitly. Duration 3–15s; supports `start_image`, `end_image`, and up to six shots via `multi_prompt`. |
| Hero comparison | `kwaivgi/kling-v3-video` + `google/veo-3.1` + `openai/sora-2` | 8s each: $1.792 + $1.60 + $0.80 = about **$4.19** | Requested side-by-side selection across the production model and Replicate's realism/prompt alternatives; no measured winner is verified. | Opt-in only; show total first. Kling Pro and Veo audio off, Sora native audio cannot be disabled. Veo $0.20/s silent, $0.40/s with audio; defaults to audio on/1080p. Veo `reference_images` require 16:9/8s and ignore `last_frame`; supports `image`/`last_frame`, no square ratio. Sora $0.10/s; `seconds` only 4, 8, or 12; `landscape`/`portrait` imply 720p, no resolution/audio toggle, and `input_reference` must match ratio. |
| Lip-sync default | `kwaivgi/kling-lip-sync` | $0.014/s | Supports text/TTS and batch lip-sync at a lower price than hero. | `voice_id` is a fixed 46-ID enum (default `en_AOT`); `voice_speed` 0.8–2.0. Use text/TTS or supplied `audio_file`; `video_url` and `video_id` are exclusive. Video 2–10s, 720p–1080p, under 100MB; MP3/WAV/M4A/AAC audio under 5MB. No audio-generation/resolution toggle. |
| Lip-sync hero | `sync/lipsync-2-pro` | $0.08325/s | Replicate editorial recommends it for cinematic/studio-grade existing footage; comparative quality is unverified. | Requires `video` plus WAV `audio`, no text/TTS input. Choose `sync_mode` deliberately; no audio-generation/resolution toggle. |

Video pricing is per second unless labeled per clip. Estimates must reflect selected duration, resolution, audio and model mode. No latency or comparative quality benchmark is verified in this source set.

## Payload examples

Examples show role-specific inputs only; put the listed slug in the URL, not in the body. Supply the real prompt, media URLs and duration for the request. Every example explicitly sets resolution when supported and audio when supported.

Image default (2K):
```json
{"input":{"prompt":"<approved prompt>","aspect_ratio":"1:1","resolution":"2K","output_format":"png"}}
```

Image premium (4K):
```json
{"input":{"prompt":"<approved prompt>","aspect_ratio":"1:1","resolution":"4K","output_format":"png"}}
```

Video test (I2V; 480p, no audio input exists):
```json
{"input":{"prompt":"<motion prompt>","image":"<image URL>","resolution":"480p","num_frames":81,"frames_per_second":16,"interpolate_output":false}}
```

Video test (T2V; 480p, no audio input exists):
```json
{"input":{"prompt":"<motion prompt>","aspect_ratio":"16:9","resolution":"480p","num_frames":81,"frames_per_second":16,"interpolate_output":false}}
```

Video mid-tier (1080p, audio off):
```json
{"input":{"prompt":"<motion prompt>","image":"<image URL>","duration":5,"resolution":"1080p","generate_audio":false}}
```

Video default (audio off; model has no resolution input):
```json
{"input":{"prompt":"<motion prompt>","start_image":"<image URL>","duration":5,"aspect_ratio":"16:9","generate_audio":false}}
```

Video production (Pro, audio off):
```json
{"input":{"prompt":"<motion prompt>","start_image":"<image URL>","duration":5,"mode":"pro","generate_audio":false}}
```

Hero comparison, production member (8s, Pro, audio off):
```json
{"input":{"prompt":"<approved motion prompt>","start_image":"<image URL>","duration":8,"mode":"pro","generate_audio":false}}
```

Hero comparison, Veo 3.1 (audio off):
```json
{"input":{"prompt":"<approved motion prompt>","image":"<image URL>","duration":8,"aspect_ratio":"16:9","resolution":"1080p","generate_audio":false}}
```

Hero comparison, Sora 2 (model has no resolution/audio toggles):
```json
{"input":{"prompt":"<approved motion prompt>","seconds":8,"aspect_ratio":"landscape","input_reference":"<matching landscape image URL>"}}
```

Lip-sync default (source video plus audio; model has no resolution/audio-generation toggle):
```json
{"input":{"video_url":"<video URL>","audio_file":"<audio URL>"}}
```

Lip-sync default (text/TTS alternative; verify voice against the upstream enum):
```json
{"input":{"video_url":"<video URL>","text":"<approved script>","voice_id":"en_AOT","voice_speed":1}}
```

Lip-sync hero (source video plus WAV audio; no resolution/audio-generation toggle):
```json
{"input":{"video":"<video URL>","audio":"<WAV URL>","sync_mode":"cut_off"}}
```


## Payload rules

Use the slug as the model path in `POST /v1/models/{owner}/{name}/predictions`; body is `{"input": {...}}`. Never place a `model` field in the body. Use the current model's actual inputs; do not copy a parameter table from another model.

Set audio and resolution explicitly whenever the model exposes those inputs. Recommended defaults: Nano Banana 2 `resolution:"2K"`; Seedance 1.5 Pro `resolution:"1080p"`, `generate_audio:false`; Kling 2.6 `generate_audio:false`; Kling v3 `mode:"pro"`, `generate_audio:false`; Veo 3.1 `resolution:"1080p"`, `generate_audio:false`; Sora 2 `seconds:8`, `aspect_ratio:"landscape"`. Models without an audio or resolution input do not accept invented fields.

Wan 2.2 testing uses `num_frames` >= 81. Nano Banana Pro supports `1K`, `2K`, `4K` and JPG/PNG (not WebP). Keep payloads limited to fields in the selected model's current schema. The research documents list sources and the evidence date.
