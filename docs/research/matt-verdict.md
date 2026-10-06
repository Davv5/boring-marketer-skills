# Matt verdict: boring marketer skills rewrite, Q11–Q17

**Abbreviations.** Matt's files are under `mattpocock-skills/skills/`: **WfA** = `productivity/writing-for-agents/SKILL.md`, **MECH** = `productivity/writing-for-agents/SKILL-MECHANICS.md`, **ASK** = `engineering/ask-matt/SKILL.md`, **PB** = `engineering/ask-matt/PHASE-BOUNDARIES.md`. Project paths are relative to `boring marketer skills/`. **JUDGEMENT** means Matt's skills don't settle the point.

---

## Q11. How to shape /keyword-research and /seo-content

**Conclusion.** Keep each skill as one skill with its 8 phases as in-file steps. Don't split it just to meet a line count.
- Move the reference material inside each phase into disclosed files, each reached by a pointer at that step: brief and plan templates, terminal template, examples, the humanize pattern list, schema JSON, the 4 outline structures, the QA checklists.
- Fold each "Implementation Note" into its phase as a positive completion criterion, then delete the Invocation Flow and Implementation Notes sections. Accept whatever length is left.
- Split by sequence only if a phase is seen to rush after its criterion has been sharpened, and only across a subagent boundary. The first candidate is seo-content Phase 8 Quality Review run as a reviewer subagent (JUDGEMENT on the candidate).

**Rests on**
- WfA §Information hierarchy: *"Sprawl … too long, even when every line is live and unique … The cure is the ladder: disclose reference behind pointers, and split by branch or sequence"*. Also: *"Progressive disclosure … Not primarily a token optimisation: it is how the hierarchy is protected."* So reference that every run uses can still be disclosed, while steps stay on the top rung (*"In-file step is the primary tier"*).
- WfA §Steps and completion criteria: *"sharpen the bound first … only if it is irreducibly fuzzy and you observe the rush, hide the later steps … Hiding only works across a real context boundary."*
- MECH §Splitting by invocation: only split off a new skill when there is *"a distinct leading word that should trigger it on its own."*

**Evidence**
- The real completion criteria sit in `keyword-research/SKILL.md:1432-1486`, 700+ lines away from the phases they govern, and are phrased as negations ("Never skip…"). They include "Every Tier 1 keyword should have a brief" and "fails 2+ tests, demote or remove it".
- The Invocation Flow (`keyword-research/SKILL.md:1237-1304`, `seo-content` ~1439-1526) restates the phases.
- The content brief is defined twice, with different fields: `keyword-research/SKILL.md:721-786` and `seo-content/SKILL.md:350-403`. Give it one home and point both skills at it.

## Q12. The ~1,000 lines restating `_system`

**Conclusion.** Delete the restatements.
- Each SKILL.md keeps only what is unique to it: its reads (with depth), its writes, and two steps that point at the protocol, each with a completion criterion. Step 1: "Load brand memory per `_system/brand-memory.md` §Read". Last step: "Feedback prompt per §Feedback".
- Reorganise `brand-memory.md` by branch so the every-run READ path isn't buried under the campaign, stack and research-signal sections.
- Cut `output-format.md` to the 4-section contract, as ADR 0002 already implies. Skill-specific terminal templates stay with their skill, disclosed.
- Don't wrap this in a model-invoked "brand-memory skill". That adds a description that is always loaded, for material a plain pointer already reaches.

**Rests on**
- WfA §Pruning: *"Keep each meaning in a single source of truth … Duplication … inflates a meaning's prominence on the ladder."*
- WfA §Context pointers: *"A must-have target behind a weakly worded pointer is a variance bug: sharpen the wording first, and inline the material only if sharpening fails."*
- MECH §Invocation: *"Push it to a plain file outside the skill system: external reference any skill can point at."* A shared skill instead costs *"permanent context load in exchange for discoverability."*

**Evidence the duplication already costs something**
- The copies have drifted apart. `brand-memory.md` §Feedback asks "How did this perform?"; `keyword-research/SKILL.md:~1322` asks "How did this land?" and offers different a–d options.
- `brand-memory.md` §Research Quality Signal still draws its display with box characters (`├──`), which contradicts ADR 0002.

## Q13. Where the Context Matrix lives

**Conclusion.** Each skill's own Reads list becomes the single authoritative row, giving file plus depth, e.g. "positioning.md: chosen angle only". It is stated positively, as a pass-list with no WITHHOLD.
- Delete the start-here Context Matrix and the `brand-memory.md` "Load only what you need" table. The general freshness and volume rules move to `brand-memory.md`.
- When start-here dispatches a skill, it passes pointers (paths plus facts that exist only in the session, such as the goal). The dispatched skill loads its own reads.
- JUDGEMENT: Matt doesn't name a home. Putting it per skill follows from co-location and single source of truth.

**Rests on**
- WfA §Information hierarchy (co-location): *"Keep a concept's definition, rules, and caveats under one heading rather than scattered."*
- WfA §Pruning (cache): *"a document that restates it is a cache … Leave the one-file, one-command lookups to the environment."* Start-here can simply read the target skill's SKILL.md.
- `engineering/implement-spec/SKILL.md` intro: *"Communicate primarily through context pointers … Don't duplicate information already available via pointers."*
- WfA §Leading words: *"Prompt the positive."* The WITHHOLD lists are prohibitions.

**Evidence: the three copies already disagree**
- `/direct-response-copy` reads `creative-kit.md` according to `brand-memory.md` §READ and `direct-response-copy/SKILL.md:24`. Yet `start-here/SKILL.md:1001-1087` WITHHOLDs the creative kit.
- Only the start-here matrix gives `/creative` the campaign brief.
- Only the start-here matrix gives `/positioning-angles` a voice summary.

## Q14. Skills that duplicate their own references/

**Conclusion.** Treat all three as branch and co-location problems, with one home per meaning.
- **direct-response-copy:** `COPYWRITING_PLAYBOOK.md` becomes the home for the craft library. SKILL.md keeps the steps, the Test, and the existing pointer, which already names its branches. The craft itself shrinks to a list of leading words the model already knows (open loop, bucket brigade, slippery slide, So-What chain). Variants, scoring and A/B testing (~334 lines) are optional branches and get disclosed. The AI-tells list becomes one shared file used by both this skill and seo-content's Humanize phase.
- **content-atomizer:** the platform is the branch. Make one file per platform that holds its playbook, deep dive, voice adjustment, specs, CTAs and common mistakes. These are scattered today across `SKILL.md:84`, `:224-1065`, `:1575`, `:1592` and `platform-playbook.md`. SKILL.md loops over the target platforms and reads each one's file.
- **newsletter:** the newsletter type is the branch. Make one disclosed file per type holding its template and its example. ESP-platform guidance is disclosed the same way.
- Diff the actual text before deleting anything: the section map compared these files by heading only.

**Rests on**
- WfA §Information hierarchy: *"Branching is the cleanest disclosure test: inline what every branch needs, and push behind a pointer what only some branches reach."* Plus co-location.
- WfA §Leading words: *"Assume every document is carrying restatements that leading words retire."*
- WfA §Pruning (no-ops): *"settle it by running the document, not by debate."*

## Q15. /creative model registry and hero tier

**Conclusion.** Make `MODEL_REGISTRY.md` the only place where model IDs, parameter rules and prices appear.
- SKILL.md and the mode files refer to roles ("video default", "hero comparison"), so the next model swap is a one-place edit.
- The registry caches only what can't be looked up cheaply: which model fills each role, why, the gotchas (set `generate_audio` and `resolution` explicitly on every payload), and per-unit prices with a "verified on" date. Drop the unverified latency figures. Drop the parameter tables that mirror the live schema if fetching the schema is cheap (that is unverified).
- **Hero tier:** stop running it automatically. Make it opt-in, shown with its estimated cost before it starts. This is a product decision for the owner (JUDGEMENT).
- The lineup choice (e.g. Kling 2.6 vs 3.0) needs runnable evidence, so it goes through a prototype detour. Unfetched candidates go to `/research`.

**Rests on**
- WfA §Pruning: *"The environment is a source of truth too … Cache what the agent cannot find by looking: the unwritten convention, the reason behind a choice, the gotcha no config confesses."* Also *"going stale as the … world it describes changes"*, and single source of truth means *"changing the behaviour is a one-place edit."*
- `productivity/grilling/SKILL.md`: *"Finding facts is your job … The decisions are yours."*
- ASK step 2: *"If a question needs a runnable answer … detour through a prototype."*

**Evidence**
- Model names and prices also appear outside the registry: `creative/SKILL.md:272-300` and `:331-339`; `modes/product-video.md:120, 134, 212, 216, 812-816, 1499`, which quote $2.20 and $6.60 inconsistently with each other; and `modes/ad-creative.md:53, 918`.
- `creative/SKILL.md:300` says "Never ask the user which model … exception is hero content". Combined with audio now defaulting on, that produces the silent ~$6.69 run.
- The registry's payload blocks put `"model"` in the request body, which contradicts its own API section (research doc, Contradictions #6). Fix it in the same ticket.

## Q16. What rounds 1–2 got wrong per Matt

1. **Q6, the 500-line ceiling.** Matt sets no number. As a hard lint failure it misfires on keyword-research and seo-content: it rewards hiding steps the agent needs, or splitting without a context boundary. Keep the number as a review flag, not a failing check.
   - ASK step 4 (`/retro`): *"Mechanical mistakes become deterministic checks; judgement calls become coding standards."*
   - WfA: *"push too much and you hide material the agent actually needs. That tension is the whole decision."*
2. **Q7, the done criteria.** The lint checks are right for mechanical things: paths exist, every file is pointed to, frontmatter, banned characters. Three gaps:
   - `/code-review`'s Standards axis only uses *"Anything in the repo that documents how code should be written."* writing-for-agents lives outside the repo, so add a repo standards doc that points to it. Otherwise the review checks only the Fowler code-smell list.
   - "No blocking findings" is undefined. code-review separates *"hard violations from judgement calls"*, so define blocking as a hard violation.
   - Lint proves a pointer exists, not that it fires. WfA: *"The pointer's wording, not its target, decides."* Consider one fixture run per skill to catch no-ops (JUDGEMENT).
3. **Q3, script manifests.** `package.sh:100-128`, `e2e-fresh-install.sh:203-231` and `doctor.sh:154-183` each hardcode the reference-file list. They are three cached copies of the directory layout, so every file move in Q11/Q14 has to edit all three (WfA §Pruning, environment as source of truth). Deriving the lists from the directory is the Matt-shaped fix; whether it's in scope is the owner's call.
4. **start-here user-invoked, the other ten model-invoked: correct.** MECH: *"Pick model-invocation only when the agent must reach the skill on its own, or another skill must."* Start-here dispatches the others, and users ask for them in plain language. Minor: the dispatch says "Read the /brand-voice SKILL.md" (`start-here/SKILL.md:903-950`) instead of invoking the skill.
5. **Keeping description triggers: correct, but prune them.** WfA §Context pointers: *"Cut identity the body already carries."* Current descriptions still carry identity: "with variants and a 7-dimension score", "Generates via Replicate, or writes model-ready prompts without it", "from live SERP analysis, with schema markup".
6. **Scope of the box-character ban is unsettled.** Characters like `├──` appear in `brand-memory.md`, the references and the modes. Does the lint cover only SKILL.md or every file, and do tree diagrams count?
7. **Q4, the symbols and 4-section structure:** Matt is silent (JUDGEMENT). No objection.
8. **Stale pointer:** `rewrite-decisions.md` points to `/tmp/bm-skill-map.md`, but the file is `docs/research/skill-section-map.md`.

## Q17. Is the route right, and is the grilling frontier empty?

**Route: yes.** You're working in a repo, so `/grill-with-docs`. It's a multi-session build, so `/to-spec` → `/to-tickets` → `/implement-spec`, which runs `/code-review` on the integration branch. Then `/retro` (ASK main flow, steps 1–4).

**Adjustments**
- /creative's runnable questions take the prototype detour before its part of the spec.
- Keep grilling, spec and tickets in one context window. If you near the ~150k "smart zone" limit, compact only at a phase boundary (ASK §Context hygiene; PB tree).
- In `/to-tickets`, prefactor first: `lint-skills.sh` and the sharpened `_system` files. Then one vertical ticket per skill, each blocked by the prefactor. Deleting the brand-memory table and the start-here matrix becomes a contract ticket blocked by every skill ticket (to-tickets, expand–contract).

**The frontier is not empty.**
- `/to-spec` says *"Do NOT interview the user"*, so the frontier has to close before you run it.
- Grilling says *"The decisions are yours"*, so the answers to Q11–Q16 above are recommendations until the owner confirms them.

Questions still open:
- **R1.** Hero tier policy: opt-in, a budget cap, the audio default?
- **R2.** Adopt the research's lineup now, or after a side-by-side prototype?
- **R3.** Registry: cache prices with a date, or fetch schemas at runtime?
- **R4.** Glossary conflicts:
  - keyword-research's "Refresh Mode" is triggered by its owned brand file, which the glossary defines as a **Returning run**.
  - seo-content's Refresh is triggered by a content file, which isn't a brand file.
  - Are "Prompt-Only Mode", "Calendar mode", "Build mode", "Update Mode" and newsletter "type" really Modes? The glossary lists "Update Mode" to avoid.
  - (`engineering/domain-modeling` §Challenge against the glossary.)
- **R5.** Scope of the box-character lint.
- **R6.** Done criteria: definition of "blocking", the repo standards doc, fixture runs.
- **R7.** Relevance of large situational sections: newsletter growth and monetization (~297 lines), direct-response-copy variants, scoring and A/B (~334), start-here campaign management. Are they modes or cut?
- **R8.** 5 of the 6 `_system/schemas/*.json` are referenced by no SKILL.md. Wire them up or delete them?
- **R9.** Do the freshness and volume rules apply when a skill is invoked directly, not via start-here?
- **R10.** Homes for the shared AI-tells list and the content-brief template.
- **R11.** Script manifests: derive from the directory or keep editing by hand?
- **R12.** ADRs for Q12 and Q13? Both meet domain-modeling's three-part test (hard to reverse, surprising, a real trade-off).

---

## Overall conclusion
1. The rewrite direction matches Matt; the main error is treating line count as the goal instead of sprawl, branches and a single source of truth.
2. Q11–Q14 come down to one move: steps stay in the file, branch reference goes behind well-worded pointers, and every shared meaning gets exactly one home.
3. The Context Matrix and the model registry are the clearest cases: there are already contradicting copies, which is the cost Matt's single-source rule predicts.
4. Hero-tier cost and the model lineup are owner decisions that need evidence (a prototype, `/research`), not more prose.
5. The route is right, but grilling isn't finished: R1–R12 are still open, and `/to-spec` can't interview.

## Disagreements with likely defaults
- **Don't** split keyword-research and seo-content into multiple skills to get under 500 lines. Matt has no ceiling, and splitting only helps across a real context boundary.
- Material every run needs **can** still be disclosed: disclosure protects the hierarchy and isn't a token saving.
- **No** shared "brand-memory" skill: a plain file plus pointers costs no permanent context.
- Delete the start-here Context Matrix **and** the brand-memory reads table: the per-skill Reads list is the single source, and dispatch passes pointers.
- The registry shouldn't mirror Replicate's live parameter schemas (that is a cache that goes stale); it should hold the gotchas and the reasons.
- The 500-line rule should be a review flag, not a lint failure (`/retro`: judgement calls become standards).
- `/code-review` against writing-for-agents won't work until the repo itself documents that standard.