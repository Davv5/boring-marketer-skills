# Routing

Read this at the Route step, when the user's request names a task, a goal, or a gap. It holds what each skill does, which layer it belongs to, and how to match a request to a skill or chain. Multi-step chains continue in [`workflows.md`](workflows.md).

## Skill registry

| Skill | Purpose |
|-------|---------|
| /start-here | Orchestrate, route, onboard |
| /brand-voice | Extract or build a voice profile |
| /positioning-angles | Find market angles and hooks |
| /direct-response-copy | Write high-conversion copy |
| /keyword-research | Data-backed keyword strategy |
| /seo-content | Write rankable long-form |
| /email-sequences | Build email automations |
| /lead-magnet | Concept and build lead magnets |
| /newsletter | Design newsletter editions |
| /content-atomizer | Repurpose across platforms |
| /creative | AI image, video, ads, graphics |

## Dependency layers

Foundation feeds Strategy, Strategy feeds Execution, Execution feeds Distribution.

```
FOUNDATION (run first, builds brand memory)
├── /brand-voice             voice-profile.md
├── /positioning-angles      positioning.md
├── (written by hand)        audience.md
└── (written by hand)        competitors.md

STRATEGY (needs foundation)
├── /keyword-research        keyword-plan.md
├── /lead-magnet             concept + content
└── /creative (brand kit)    creative-kit.md

EXECUTION (needs foundation + strategy)
├── /direct-response-copy    landing pages, sales pages
├── /seo-content             blog posts, guides
├── /email-sequences         automations, nurture
├── /newsletter              editions, growth plan
└── /creative                images, video, ads

DISTRIBUTION (needs execution assets)
├── /content-atomizer        social, threads, shorts
└── /creative (ad creative)  paid ad variants
```

Check which layers exist before routing. When the user asks for an Execution skill and has no Foundation, offer the Foundation first and say why (the choice itself follows `SKILL.md` operating rule 6).

## Primary router

Match the request against these triggers and route to the first match.

| Request contains | Route to |
|------------------|----------|
| "brand voice", "tone", "how I sound", "writing style" | /brand-voice |
| "positioning", "angle", "differentiation", "hook", "USP" | /positioning-angles |
| "copy", "landing page", "sales page", "headline", "CTA", "conversion" | /direct-response-copy |
| "keyword", "SEO research", "what to write about", "content ideas", "topic research" | /keyword-research |
| "blog", "article", "SEO content", "long-form", "guide", "pillar" | /seo-content |
| "email", "sequence", "welcome", "nurture", "drip", "automation", "onboarding" | /email-sequences |
| "lead magnet", "freebie", "opt-in", "checklist", "template", "PDF", "quiz" | /lead-magnet |
| "newsletter", "Beehiiv", "Substack", "weekly email", "email list" | /newsletter |
| "repurpose", "atomize", "social posts", "threads", "LinkedIn post", "Twitter", "Instagram", "carousel" | /content-atomizer |
| "image", "photo", "video", "graphic", "ad creative", "thumbnail", "banner", "talking head", "visual" | /creative |
| "what should I do", "help", "where do I start", "what's next", "status" | the returning run's project scan and gap analysis ([`returning-run.md`](returning-run.md)) |
| Unclear or multi-part | Ask one clarifying question, "Are you trying to {A} or {B}?", then route |

The skill loads its own brand context when invoked (`dispatch.md`). Recommend one next skill and let the user confirm or redirect.

## Compound requests

When a request spans several skills, parse it into a workflow and skip the "which one?" question.

- "Write a blog post and turn it into social content": /seo-content, then /content-atomizer (sequential).
- "Build a lead magnet funnel": /lead-magnet, /direct-response-copy, /email-sequences, /content-atomizer (sequential).
- "Set up my whole brand": /brand-voice and /positioning-angles (parallel).
- "Launch my product": the Launching something workflow in [`workflows.md`](workflows.md).

## Quick routing tables

**Route by goal**

| The user wants to | Route to |
|-------------------|----------|
| Get more traffic | /keyword-research, then /seo-content |
| Build an email list | /lead-magnet, then /email-sequences |
| Launch a product | Workflow 5, Launching something |
| Write better copy | /direct-response-copy |
| Start a newsletter | Workflow 6, Start a newsletter |
| Create social content | /content-atomizer |
| Get more from existing content | /content-atomizer (repurpose) |
| Fix conversion rate | /direct-response-copy (rewrite) |
| Find brand voice | /brand-voice |
| Stand out from competitors | /positioning-angles |
| Make visual assets | /creative |
| Build a content system | Workflow 4, Content strategy |
| Start from scratch | Workflow 1, Starting from zero |

**Route by what is missing**

| Missing | Route to |
|---------|----------|
| ./brand/voice-profile.md | /brand-voice |
| ./brand/positioning.md | /positioning-angles |
| ./brand/keyword-plan.md | /keyword-research |
| ./brand/creative-kit.md | /creative (brand kit) |
| Any email sequence | /email-sequences |
| Any lead magnet | /lead-magnet |
| Any blog content | /seo-content |
| Newsletter format | /newsletter |
| Social content | /content-atomizer |
| Ad creative | /creative (ad creative) |
| Everything | Workflow 1, Starting from zero |

**Route by urgency ("I need this today")**

| Need | Fastest path |
|------|--------------|
| Landing page copy | /direct-response-copy (~20 min) |
| Email sequence | /email-sequences (~15 min) |
| Social posts | /content-atomizer (~10 min) |
| Blog article | /seo-content (~20 min) |
| Ad images | /creative (~10 min) |
| Lead magnet | /lead-magnet (~15 min) |
| Newsletter edition | /newsletter (~15 min) |

## Requests no skill covers

Audience research and competitor teardowns have no dedicated skill. Offer to write `./brand/audience.md` or `./brand/competitors.md` with the user by hand, using the intake questions from /brand-voice and the competitor scan from /positioning-angles. Every skill that reads these files picks them up on its next run.
