# Replicate model registry

Authoritative model roles, slugs, verified prices and API payload guidance. Source: `docs/research/replicate-models-2026-10.md` and `docs/research/replicate-sources-2026-10-06/`. Verified 2026-10-06. Prices are USD; estimates scale by requested duration/resolution as stated. Confirm the upstream schema before using a changed model.

## Roles and prices

| Role | Model slug | Price | Use |
|---|---|---:|---|
| Image default | `google/nano-banana-2` | $0.067 1K; $0.101 2K; $0.151 4K | Default image generation; explicitly request 2K. |
| Image premium | `google/nano-banana-pro` | $0.15 1K/2K; $0.30 4K | 4K or complex work. |
| Video test | `wan-video/wan-2.2-i2v-fast` | $0.05 per 480p clip | Cheap image-to-video tests; at least 81 frames. |
| Video test | `wan-video/wan-2.2-t2v-fast` | $0.05 per 480p clip; $0.10 720p | Cheap text-to-video tests. |
| Video mid-tier | `bytedance/seedance-1.5-pro` | $0.06/s 1080p without audio; $0.12/s with audio | Product shots, camera control. |
| Video default | `kwaivgi/kling-v2.6` | $0.07/s without audio; $0.14/s with audio | General video generation. |
| Video production | `kwaivgi/kling-v3-video` | Pro $0.224/s without audio; $0.336/s with audio; 4K $0.42/s | Production, multi-shot. |
| Hero comparison | Kling v3 production, Veo 3.1, Sora 2 | 8s totals: $2.69 + $3.20 + $0.80 = about $6.69 | Run only on request, after showing estimated total. |
| Lip-sync default | `kwaivgi/kling-lip-sync` | $0.014/s | Text/TTS or batch lip-sync. |
| Lip-sync hero | `sync/lipsync-2-pro` | $0.08325/s | Existing video plus WAV audio. |

Video pricing is per second unless labeled per clip. Estimates must reflect selected duration, resolution, audio and model mode. No latency or comparative quality benchmark is verified in this source set.

## Payload examples

Examples show role-specific inputs only; put the listed slug in the URL, not in the body. Supply the real prompt, media URLs and duration for the request. Every example explicitly sets resolution when supported and audio when supported.

Image default (2K):
```json
{"input":{"prompt":"<approved prompt>","aspect_ratio":"1:1","resolution":"2K","output_format":"png"}}
```

Image 4K:
```json
{"input":{"prompt":"<approved prompt>","aspect_ratio":"1:1","resolution":"4K","output_format":"png"}}
```

Video test (I2V; 480p, no audio input exists):
```json
{"input":{"prompt":"<motion prompt>","image":"<image URL>","resolution":"480p","num_frames":81}}
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

Hero comparison, Veo 3.1 (audio off):
```json
{"input":{"prompt":"<approved motion prompt>","image":"<image URL>","duration":8,"resolution":"1080p","generate_audio":false}}
```

Hero comparison, Sora 2 (model has no resolution/audio toggles):
```json
{"input":{"prompt":"<approved motion prompt>","seconds":8,"aspect_ratio":"landscape"}}
```

Lip-sync default (source video plus audio; model has no resolution/audio-generation toggle):
```json
{"input":{"video_url":"<video URL>","audio_file":"<audio URL>"}}
```

Lip-sync hero (source video plus WAV audio; no resolution/audio-generation toggle):
```json
{"input":{"video":"<video URL>","audio":"<WAV URL>","sync_mode":"cut_off"}}
```


## Payload rules

Use the slug as the model path in `POST /v1/models/{owner}/{name}/predictions`; body is `{"input": {...}}`. Never place a `model` field in the body. Use the current model's actual inputs; do not copy a parameter table from another model.

Set audio and resolution explicitly whenever the model exposes those inputs. Recommended defaults: Nano Banana 2 `resolution:"2K"`; Seedance 1.5 Pro `resolution:"1080p"`, `generate_audio:false`; Kling 2.6 `generate_audio:false`; Kling v3 `mode:"pro"`, `generate_audio:false`; Veo 3.1 `resolution:"1080p"`, `generate_audio:false`; Sora 2 `seconds:8`, `aspect_ratio:"landscape"`. Models without an audio or resolution input do not accept invented fields.

Wan 2.2 testing uses `num_frames` >= 81. Nano Banana Pro supports `1K`, `2K`, `4K` and JPG/PNG (not WebP). Keep payloads limited to fields in the selected model's current schema. The research documents list sources and the evidence date.
