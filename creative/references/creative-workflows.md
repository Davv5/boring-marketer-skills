# Creative workflows and examples

Reference for request intake, visual identity setup, exploration, batch execution, quality review, and cross-skill handoffs. Read the relevant section when its branch applies. Model details belong only in `MODEL_REGISTRY.md`; brand and output policy belong in `_system`.

## What Are We Making?

When this skill is invoked, start here:

```
What are we making?

  1. Product photos      hero shots, lifestyle, e-commerce flats
  2. Product videos      reveals, orbits, demos, unboxings
  3. Social graphics     posts, stories, thumbnails, ads
  4. Talking head        presenters, UGC-style, testimonials
  5. Ad creative         paid social, display, video ads
  6. Free generation     anything else — just describe it
```

Each mode has its own playbook in `modes/`. The creative engine handles:
- Brand consistency (every mode reads from the same brand kit)
- Model selection (you describe the asset, the engine picks the model)
- Quality control (built-in review and iteration workflow)
- Batch generation (campaign-scale parallel production)

---


## Brand Kit — Creative Identity


### Building the Brand Kit

On the first creative run, build `./brand/creative-kit.md`. This file is the visual DNA that every mode reads from. Without it, outputs will be inconsistent across assets.

**Prompt the user for:**

```markdown

### Using the Brand Kit

Every mode reads `creative-kit.md` before generating any asset. This means:
- Color palette is injected into prompts automatically
- Typography preferences guide text rendering decisions
- Visual style keywords are appended to every prompt
- "What to avoid" items become prompt guardrails

---


## Style Exploration Process

This is the core creative methodology. It applies to every mode, every time.


### The 5-Direction Exploration

When starting any new creative project (not a one-off generation), follow this process:

**Step 1: Generate 5 Different Approaches**

Do not generate 5 similar images. Generate 5 genuinely different creative directions:

```
Direction 1: [Name] — The safe, expected approach for this category
Direction 2: [Name] — The opposite of Direction 1
Direction 3: [Name] — Borrowed from a completely different industry
Direction 4: [Name] — Emotion-first (prioritizes feeling over information)
Direction 5: [Name] — The wild card (break a convention)
```

Each direction should have a distinct visual strategy — different lighting, composition, color treatment, mood, and reference point.

**Step 2: Present All 5 for Review**

```markdown

### When to Skip the 5-Direction Process

- User says "just generate [specific thing]" — they know what they want
- Single asset request with clear specifications
- Follow-up assets that should match an already-locked style
- User explicitly says "skip exploration"

---


## Batch Generation — Campaign Scale

For campaigns that need many assets, use Claude Code task agents to generate in parallel.


### Parallel Image Generation

When generating a set of images (e.g., 10 product photos for an e-commerce store):

```
Dispatch parallel tasks:

Task 1: Generate hero image — 16:9, dramatic lighting
Task 2: Generate product front — 1:1, clean white background
Task 3: Generate product angle — 1:1, 45-degree view
Task 4: Generate lifestyle shot — 4:5, in-context usage
Task 5: Generate detail close-up — 1:1, macro style
[... continue for all assets]
```

Each task:
1. Reads the brand kit for style consistency
2. Reads the locked style principles (if established)
3. Constructs the prompt following VISUAL_INTELLIGENCE.md guidelines
4. Calls the Replicate API with the MODEL_REGISTRY.md payload
5. Saves the output to the correct directory
6. Reports back with the image URL and quality assessment


### Parallel Video Generation (Hero Content)

For hero content comparison, dispatch three tasks simultaneously:

```
Task 1: video default role — same prompt, same start_image
Task 2: hero comparison role — same prompt, adapted parameters
Task 3: hero comparison role — same prompt, adapted parameters
```

Wall-clock time = the slowest model (usually 5-8 minutes), not the sum of all three.


### Batch Limits

- Replicate has concurrent prediction limits per account (typically 5-10 for free tier, higher for paid)
- Space batches to avoid hitting rate limits
- For large batches (20+ assets), generate in waves of 5-8 with brief pauses between waves
- Monitor Replicate dashboard for any throttling

---


## File Output Conventions

All creative outputs are saved to organized directories under the project root.


### Directory Structure

```
creative-output/
├── brand/
│   ├── creative-kit.md          # Brand identity (colors, typography, style)
│   └── stack.md                 # Model availability status
│
├── explorations/
│   └── [project-name]/
│       ├── direction-1.png
│       ├── direction-2.png
│       └── ...
│
├── product-photos/
│   ├── hero/                    # Hero shots (16:9, dramatic)
│   ├── lifestyle/               # In-context lifestyle shots
│   ├── ecommerce/               # Clean product-on-white
│   └── detail/                  # Close-up / macro
│
├── videos/
│   ├── hero/                    # Flagship video content
│   ├── product-reveals/         # Product reveal animations
│   ├── social-clips/            # Short-form social video
│   └── comparisons/             # Multi-model comparison outputs
│
├── social-graphics/
│   ├── instagram/
│   │   ├── feed/                # 1:1 and 4:5 posts
│   │   └── stories/             # 9:16 stories
│   ├── linkedin/                # 1:1 and 16:9 posts
│   ├── twitter/                 # 16:9 cards
│   ├── tiktok/                  # 9:16 thumbnails
│   └── youtube/                 # 16:9 thumbnails
│
├── talking-heads/
│   ├── source-videos/           # Base presenter videos
│   ├── audio/                   # Audio files for lip-sync
│   └── output/                  # Final lip-synced videos
│
├── ad-creative/
│   ├── paid-social/             # Facebook, Instagram, LinkedIn ads
│   ├── display/                 # Banner ads, display network
│   └── video-ads/               # Video ad formats
│
└── exports/
    └── [campaign-name]/         # Final packaged deliverables
```


### Naming Convention

```
[asset-type]-[descriptor]-[aspect-ratio]-[version].ext

Examples:
hero-product-floating-16x9-v1.png
lifestyle-morning-coffee-4x5-v2.png
reveal-bottle-orbit-16x9-v1.mp4
social-announcement-sale-1x1-v1.png
talking-head-testimonial-9x16-v1.mp4
```

---


## Quality Gate

Before delivering any creative asset, verify:


### Technical
- [ ] Resolution appropriate for intended use
- [ ] No AI artifacts (distorted hands, melted text, impossible geometry)
- [ ] Sharp focus on primary subject
- [ ] Correct aspect ratio for platform


### Brand Alignment
- [ ] Colors match creative-kit.md palette
- [ ] Typography direction is consistent
- [ ] Mood matches brand personality
- [ ] Nothing in the "what to avoid" list appears


### Strategic
- [ ] Asset serves its communication goal
- [ ] Composition supports the intended use (text space if needed)
- [ ] Visual hierarchy is clear (one focal point, one message)
- [ ] Differentiated from competitors (not category-generic)


### Platform
- [ ] Correct dimensions for target platform
- [ ] Works at thumbnail/preview size
- [ ] Hooks within 3 seconds (video)
- [ ] Text legible at mobile size (if applicable)

---


## Handoff Protocols


### Receiving Work from Other Skills

The creative engine can receive briefs from other skills:

```yaml

### Delivering to Other Skills

```yaml

## What's Next After Creative Production

After generating creative assets, suggest next steps:

```
WHAT'S NEXT

Your creative assets are generated and saved. Next moves:

→ /content-atomizer  Create platform-specific variants
                     for social distribution (~10 min)
→ /direct-response-copy  If these visuals need
                     accompanying copy — landing pages,
                     ads, or email (~15 min)
→ /start-here        Review your full project status

Or tell me what you are working on and I will route you.
```

---

*This is the entry point for all visual creative production in Vibe Marketing Skills v2. Every image, every video, every visual asset flows through this engine.*
