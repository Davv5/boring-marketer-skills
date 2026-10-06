# Workflows

Read this when a request matches one of the seven multi-skill workflows below, or spans three or more skills. Each workflow lists its trigger, its chain, what each step passes forward from earlier steps, and its total time. How to invoke each step is in [`dispatch.md`](dispatch.md); each skill loads its own brand context.

## Confirmation protocol

For any workflow of three or more steps, show the plan and get the user's choice before the first step runs. Use the Workflow plan template in [`output-templates.md`](output-templates.md): each step with the skill, what it produces and a time estimate, the total, and three options: run the full workflow, start with just Step 1 (continue later), or skip to Step N (when earlier assets exist).

A two-step workflow proceeds with a brief note: "This is a two-step process: {A} then {B}. Starting with {A}."

Done when the user has chosen a scope, and the chain then runs to the end of that scope so the user ends with the complete deliverable.

## Workflow 1: Starting from zero

**Trigger:** a first run, "I'm just getting started", "help me set up my marketing".

**Chain:**
1. In parallel: /brand-voice writes `./brand/voice-profile.md`; /positioning-angles writes `./brand/positioning.md`.
2. Present the foundation report.
3. Route by goal ([`first-run.md`](first-run.md) §5).

**Time:** 15-20 minutes.

## Workflow 2: Build my brand foundation

**Trigger:** "build my brand", "set up brand", "brand foundation".

**Chain:**
1. In parallel: /brand-voice writes `./brand/voice-profile.md`; /positioning-angles writes `./brand/positioning.md`.
2. /creative (brand kit) writes `./brand/creative-kit.md`, when Replicate is connected.

**Passes forward:** /brand-voice gets the business description and URL. /positioning-angles gets the business description and market. /creative gets the voice profile and positioning produced in step 1.

**Time:** 20-25 minutes.

## Workflow 3: I need leads (lead magnet funnel)

**Trigger:** "I need leads", "lead magnet funnel", "build a funnel", "grow my email list".

**Chain:**
1. /lead-magnet: concept, and the magnet content itself.
2. /direct-response-copy: landing page for the magnet.
3. /email-sequences: delivery email plus welcome sequence (6-7 emails).
4. /content-atomizer: social promotion for the magnet.

**Passes forward:**
- /direct-response-copy gets the magnet concept, title and hook (step 1).
- /email-sequences gets the magnet details (step 1) and the landing page headline (step 2).
- /content-atomizer gets the magnet title and key benefit, with a landing page URL placeholder.

**Time:** 60-90 minutes.

## Workflow 4: Content strategy

**Trigger:** "content strategy", "blog strategy", "what should I write about", "create a content system".

**Chain:**
1. /keyword-research: keyword plan with prioritized topics.
2. /seo-content: the top-priority pillar article.
3. /content-atomizer: platform-specific posts from the pillar.
4. /newsletter: a newsletter format that includes content highlights.

**Passes forward:**
- /seo-content gets the top keyword from the plan (step 1).
- /content-atomizer gets the article (step 2).
- /newsletter gets a content strategy summary: topics covered and frequency.

**Time:** 60-90 minutes.

## Workflow 5: Launching something

**Trigger:** "launch", "launching a product", "new product", "launch sequence", "go-to-market".

**Chain:**
1. /positioning-angles: the best launch angle. Skip it when positioning.md exists and is recent.
2. /direct-response-copy: landing page copy (hero, features, proof, CTA).
3. /email-sequences: launch sequence (announcement, story, proof, objections, close).
4. /content-atomizer: social launch content across all platforms.
5. /creative: ad creative, hero images, social graphics, when Replicate is connected.

**Passes forward:**
- /positioning-angles gets the product details, audience and market.
- /direct-response-copy gets the chosen angle (step 1) and the product details.
- /email-sequences gets the angle, the product, and the landing page headline and key benefits (step 2).
- /content-atomizer gets the launch angle and landing page copy highlights (step 2).
- /creative gets the product description and the key messaging from the landing page.

**Time:** 90-120 minutes.

## Workflow 6: Start a newsletter

**Trigger:** "start a newsletter", "newsletter", "weekly email", "build an audience with email".

**Chain:**
1. /newsletter: format, name, archetype, sections.
2. /email-sequences: welcome sequence for new subscribers.
3. /lead-magnet: an opt-in incentive that grows the list.
4. /content-atomizer: social promotion for the newsletter launch.

**Passes forward:**
- /newsletter gets the content topics.
- /email-sequences gets the newsletter format and name (step 1).
- /lead-magnet gets the newsletter format, to create a complementary magnet.
- /content-atomizer gets the newsletter name and key value prop, with a sign-up URL placeholder.

**Time:** 60-75 minutes.

## Workflow 7: Marketing is not working

**Trigger:** "marketing isn't working", "not getting results", "low conversion", "no leads", "traffic but no sales".

**Chain:**
1. Project scan plus deep audit using the Workflow 7 depths in `start-here/SKILL.md` §Reads.
2. Diagnose the specific breakdown point:
   - No traffic: a content/SEO problem.
   - Traffic but no leads: an offer/magnet problem.
   - Leads but no sales: a nurture/copy problem.
   - Sales but low margin: a positioning/pricing problem.
3. Route to the right fix: a single skill for a targeted fix, not a full rebuild.
4. After the fix, update learnings.md with what changed and why.

**Passes forward:** the diagnosed problem and the specific findings that bear on it. The diagnosis draws on learnings.md patterns, asset dates and the gap analysis in [`returning-run.md`](returning-run.md).

**Time:** 30-45 minutes.
