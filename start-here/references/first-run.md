# First run

Read this when `./brand/` does not exist. The user has never run the pack, so the goal is a working brand foundation in one session. Templates for the scan and the report are in [`output-templates.md`](output-templates.md).

## 1. Show the empty scan

Present the empty-state Project Scan from [`output-templates.md`](output-templates.md) §Project scan so the user sees what the pack will build, ending with: "This is a fresh start. I need two things from you, then I will build your brand foundation." Fill the Marketing Stack rows from the `.env` and MCP detection in [`stack-detection.md`](stack-detection.md).

Done when the scan shows every Brand Foundation row as ✗, the stack rows with their detected status, and "no campaigns yet".

## 2. Ask the two qualifying questions

Ask exactly two questions, one at a time, waiting for each answer.

**Question 1, the business:** "What is your business? One sentence." Offer examples:

- "I sell a course teaching freelancers to land $10k+ clients through cold email."
- "SaaS tool that helps e-commerce brands automate their email marketing."
- "Marketing agency specializing in B2B LinkedIn lead gen for tech companies."

**Question 2, the goal:** "What is your marketing goal right now?" and offer four options:

1. **Build audience**: grow from zero or a small following; needs content, social, newsletter.
2. **Launch product**: has something to sell; needs the full launch stack (copy, emails, landing page, ads).
3. **Grow revenue**: already has traffic or an audience; needs better conversion through funnels, email sequences, offers.
4. **Create content system**: needs a repeatable content engine across blog, social, newsletter, repurposing.

When the answer does not clearly map to one goal, pick the closest and confirm: "That sounds closest to {goal}. I will build your foundation around that. Correct me if I am wrong." When nothing matches, use Build audience, the most general path.

Done when the business sentence and one confirmed goal are in hand. Everything else comes from the business sentence, a URL the user mentioned, or inference.

## 3. Initialize brand memory and build the foundation

Create the scaffolding first so the dispatched skills can write into it:

1. Create `./brand/`.
2. Create `./brand/stack.md` from the detected tools (template in `../../_system/brand-memory.md` §Stack and tools).
3. Create `./brand/assets.md` and `./brand/learnings.md` from their empty templates (`../../_system/brand-memory.md` §Write and §Feedback).

Then invoke `/brand-voice` and `/positioning-angles` in parallel, following [`dispatch.md`](dispatch.md). Pass session-only facts and dispatch at once: most brand files do not exist yet, so the dispatch carries what is known.

| Skill | Session-only facts | Instruction |
|-------|--------------------|-------------|
| `/brand-voice` | Business sentence, goal, any URL the user mentioned | "Build a voice profile for this business. Write the result to ./brand/voice-profile.md." |
| `/positioning-angles` | Business sentence, goal, market category inferred from the business sentence | "Generate 3-5 positioning angles for this business. Write the result to ./brand/positioning.md." |

Both run at once, so wall-clock time equals the slower task. Voice profile, positioning and campaign history are not passed because none exists yet.

Done when both skills have returned and `./brand/voice-profile.md` and `./brand/positioning.md` exist.

## 4. Present the Brand Foundation Report

Use the report template in [`output-templates.md`](output-templates.md) §Brand Foundation Report: voice summary (tone, personality, pacing, four signature patterns), the positioning angles with the recommended one first, the marketing stack, Files Saved, and the goal-based What's Next below.

Done when the report follows the four-section contract and What's Next holds the goal's recommended path.

## 5. Recommend by goal

Put the path for the user's goal in What's Next, then close with "Or tell me what you are working on and I will route you."

**Build audience**
- → /keyword-research: find topics your audience searches for (~15 min)
- → /seo-content: write your first pillar article (~20 min)
- → /content-atomizer: turn it into a week of social posts (~10 min)
- → /newsletter: design your newsletter format (~15 min)

**Launch product**
- → /lead-magnet: build a lead magnet to capture interest (~15 min)
- → /direct-response-copy: write your landing page copy (~20 min)
- → /email-sequences: create your launch sequence (~15 min)
- → /creative: generate ad creative and hero images (~10 min)

**Grow revenue**
- → /lead-magnet: build a high-converting lead magnet (~15 min)
- → /email-sequences: write a welcome sequence that sells (~15 min)
- → /direct-response-copy: rewrite your landing page for higher conversion (~20 min)
- → /creative: create ad variants for testing (~10 min)

**Create content system**
- → /keyword-research: map your content territory (~15 min)
- → /seo-content: write a cornerstone article (~20 min)
- → /content-atomizer: build your repurpose engine (~10 min)
- → /newsletter: launch or improve your newsletter (~15 min)

Done when the user has the four steps for their goal in front of them. This is the Starting from zero workflow in [`workflows.md`](workflows.md).
