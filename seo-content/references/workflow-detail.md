# Detailed SEO workflow guidance

Read alongside the relevant phase in `seo-content/SKILL.md` when the detailed research procedure, examples, checks, handoff, or troubleshooting is needed. These are the detailed original instructions retained during the rewrite.

### SERP Analysis (LIVE -- v2 Enhancement)

Search the target keyword using web search tools and analyze the top 5 results.

**For each result, capture:**
- Title and URL
- Content type (guide, listicle, tool page, etc.)
- Approximate word count
- Structure (headers, sections)
- Unique angles or data
- What they do well
- What they miss or get wrong
- How recent (publish/update date)
- Domain type (major publication, niche site, personal blog)

**Extract from SERP features:**
- People Also Ask questions (answer ALL of these)
- Featured Snippet format (match it to win it)
- AI Overview presence (what it includes/excludes)

**Present SERP findings to the user:**

```
  ──────────────────────────────────────────────

  SERP ANALYSIS: "{target keyword}"

  Top 5 results:
  ├── 1. {Title} -- {domain}
  │      {content type}, ~{N} words, {date}
  │      Angle: {their angle}
  │      Gap: {what they miss}
  │
  ├── 2. {Title} -- {domain}
  │      {content type}, ~{N} words, {date}
  │      Angle: {their angle}
  │      Gap: {what they miss}
  │
  ├── 3. {Title} -- {domain}
  │      {content type}, ~{N} words, {date}
  │      Angle: {their angle}
  │      Gap: {what they miss}
  │
  ├── 4. {Title} -- {domain}
  │      {content type}, ~{N} words, {date}
  │      Angle: {their angle}
  │      Gap: {what they miss}
  │
  └── 5. {Title} -- {domain}
         {content type}, ~{N} words, {date}
         Angle: {their angle}
         Gap: {what they miss}

  ──────────────────────────────────────────────

  SERP FEATURES

  ├── Featured Snippet    {format or "none"}
  ├── People Also Ask     {N} questions captured
  └── AI Overview         {present/absent, summary}

  ──────────────────────────────────────────────

  OPPORTUNITY ASSESSMENT

  {1-3 sentence summary of the gap your content
  will fill and why it can win}

  ──────────────────────────────────────────────
```

### People Also Ask Integration (v2 Enhancement)

Pull ALL People Also Ask questions for the target keyword via web search.
These become mandatory sections in your content.

**How to capture PAA:**
1. Search the target keyword
2. Record every PAA question shown
3. Click/expand each PAA to get second-level questions
4. Record those too
5. Search 2-3 keyword variations to find additional PAA questions

**How PAA shapes the content:**
- Each PAA question becomes an H2 or FAQ entry
- Answer PAA questions directly (Featured Snippet format)
- PAA phrasing is used in headers (matches how people search)
- Questions that deserve depth become full sections
- Questions that need brief answers go in the FAQ section

**PAA output:**

```
  PEOPLE ALSO ASK

  Full sections (answer as H2):
  ├── "{question 1}" -- high search signal
  ├── "{question 2}" -- aligns with content type
  └── "{question 3}" -- competitive gap

  FAQ entries (answer briefly):
  ├── "{question 4}"
  ├── "{question 5}"
  ├── "{question 6}"
  └── "{question 7}"
```

### Gap Analysis

After reviewing competitors and PAA, identify:

1. **What is missing?** -- Questions unanswered, angles unexplored
2. **What is outdated?** -- Old information, deprecated methods
3. **What is generic?** -- Surface-level advice anyone could give
4. **What is your edge?** -- Unique data, experience, perspective (informed by positioning.md)

Your content should fill these gaps.

---

## Phase 2: Content Brief
## Phase 3: Outline

Structure the content based on type:

### Pillar Guide Structure (5,000-8,000 words)

```
1. Hook Intro (150-250 words)
   - Answer the title question immediately
   - Why this matters NOW
   - Who this is for (and who it's not for)

2. Quick Answer Section (200-300 words)
   - Direct answer for Featured Snippet
   - TL;DR for skimmers

3. Core Sections (3-5 major sections)
   - Each 800-1,500 words
   - Each answers a major sub-question
   - H2 headers with keyword variations
   - PAA questions as H2s where appropriate

4. Implementation / How to Apply (300-500 words)
   - Specific actionable steps
   - Decision framework if applicable

5. FAQ Section (5-10 questions)
   - From PAA research
   - Schema-ready format (used for JSON-LD)

6. Conclusion with CTA (150-200 words)
   - Summarize key takeaway
   - Clear next action
```

### How-To Tutorial Structure (2,000-3,000 words)

```
1. What You'll Achieve (150-200 words)
   - End result shown first
   - Time estimate
   - Prerequisites

2. Why This Method (200-300 words)
   - Context and alternatives
   - Why this approach works

3. Step-by-Step Instructions (1,200-2,000 words)
   - Numbered steps
   - One action per step
   - Troubleshooting inline

4. Variations / Advanced Tips (300-400 words)

5. Common Mistakes (200-300 words)

6. FAQ (3-5 questions from PAA)

7. Next Steps with CTA (100-150 words)
```

### Comparison Structure (2,500-4,000 words)

```
1. Quick Verdict (200-300 words)
   - Bottom line recommendation
   - "Choose X if... Choose Y if..."

2. Comparison Table
   - 8-12 key differentiators
   - Pricing, best for, key features

3. Deep Dive: Option A (800-1,000 words)
   - What it is
   - Key features
   - Pros/cons
   - Best for
   - Real example

4. Deep Dive: Option B (800-1,000 words)
   - Same structure

5. Head-to-Head Comparison (300-500 words)
   - Specific scenarios
   - When to pick each

6. FAQ (3-5 questions from PAA)

7. Final Recommendation with CTA
```

### Listicle Structure (2,000-3,000 words)

```
1. Intro with Context (150-200 words)
   - Why this list matters
   - How items were selected

2. Quick Summary Table/List
   - All items at a glance
   - For skimmers

3. Individual Items (150-300 words each)
   - What it is
   - Why it's included
   - Best for / Use case
   - Limitations (honesty builds trust)

4. How to Choose (200-300 words)
   - Decision framework

5. FAQ (3-5 questions from PAA)

6. Conclusion with CTA
```

---

## Phase 4: Draft

Write the first draft following these principles:

### Voice Calibration from Brand Memory

If voice-profile.md is loaded, calibrate the writing to match:

- **Tone:** Match the documented tone (direct, warm, technical, casual, etc.)
- **Personality:** Write as the persona described in the profile
- **Pacing:** Follow the documented rhythm patterns
- **Vocabulary:** Use the "words to use" list, avoid the "words to avoid" list
- **Examples:** Match the on-brand example style

If voice-profile.md is NOT loaded, default to: direct, conversational, specific,
opinionated. The kind of writing a smart friend who happens to be an expert
would produce.

### The First Paragraph Rule

Answer the search query in the first 2-3 sentences. Do not make them scroll.

**Bad:**
> "In today's rapidly evolving digital landscape, marketers are increasingly turning to artificial intelligence to streamline their workflows and enhance productivity..."

**Good:**
> "AI marketing tools can automate 60-80% of repetitive marketing tasks. Here are the 10 that actually work, based on testing them across 50+ client accounts."

### The "So What?" Chain

For every point you make, ask "so what?" until you hit something the reader actually cares about:

> Feature: "Automated email sequences"
> So what? "Sends follow-ups without you remembering"
> So what? "You wake up to replies instead of a blank inbox"
> So what? "Close deals while you sleep"

Write from the bottom of the chain, not the top.

### Specificity Over Generality

**Weak:** "This tool saves time."
**Strong:** "This tool cut our email outreach from 4 hours to 15 minutes per day."

**Weak:** "Many marketers struggle with content."
**Strong:** "73% of marketers publish less than once per week. Here's why."

Numbers, examples, specifics. Always.

### Show Your Work

Do not just make claims. Show how you know:

> "After testing 23 AI writing tools over 6 months, three stood out..."

> "We analyzed 147 high-ranking articles in this space. The pattern was clear..."

> "When I implemented this for [client], the results were..."

Experience signals beat assertions.

### Positioning-Informed Angle

If positioning.md is loaded, use the brand's positioning to shape the angle:

- **"The Anti-Agency"** angle: Write from the perspective of someone who has
  seen the agency model fail and found a better way
- **"Practitioner, Not Theorist"** angle: Lead with real implementation stories,
  not abstract advice
- **"Data-First"** angle: Lead every section with numbers and evidence

The positioning does not change WHAT you write about (the keyword dictates that).
It changes HOW you write about it -- your perspective, examples, and framing.

---

## Phase 5: Humanize

AI-generated content has tells. Remove them ruthlessly.

The goal is not "sounds okay." It is "sounds like a specific person wrote this based on real experience."

### Shared AI-tells pass

Use `../_system/ai-tells.md` for the shared detection patterns and checklist. The examples and voice techniques below are SEO-specific complements.

### Before/After Examples

**AI Version:**
> "Email marketing remains a crucial component of any comprehensive digital marketing strategy. When it comes to improving open rates, it's important to consider several key factors. First, crafting compelling subject lines is essential. Second, segmenting your audience allows for more targeted messaging. Third, timing plays a vital role in engagement."

**Human Version:**
> "I ignored email for two years. Social media was sexier. Then I looked at the numbers: email drove 3x the revenue of all social combined. Here's what actually moves open rates--the stuff that worked when we tested it across 12 client accounts."

---

**AI Version:**
> "In today's fast-paced business landscape, professionals are increasingly turning to automation tools to streamline their workflows and enhance productivity. These comprehensive solutions offer a myriad of benefits for organizations of all sizes."

**Human Version:**
> "Most automation tools are shelfware. You buy them, set them up, use them twice, forget they exist. Here are the three that actually stuck after a year of testing--and the 14 I wasted money on."

---

**AI Version:**
> "Whether you're a seasoned marketer or just starting your journey, understanding SEO fundamentals is crucial for success. Let's dive into the essential strategies that can help you navigate the complex landscape of search engine optimization."

**Human Version:**
> "SEO advice is 90% outdated garbage. The tactics that worked in 2019 will get you penalized now. I'm going to show you what's actually ranking in December 2024--pulled from 300+ sites we analyzed last month."

### Voice Injection Points

Human content has these. AI content does not. Add them:

**Personal experience with specifics:**
> "I made this mistake for two years. Cost me roughly $40K in lost revenue before someone on Twitter pointed out what I was doing wrong."

**Opinion with reasoning:**
> "Honestly, most SEO advice is written by people who've never ranked anything. They're regurgitating what they read somewhere else. Here's what I've actually seen work..."

**Admission of limitations:**
> "This won't work for everyone. If you're in YMYL niches, ignore this entirely--different rules apply. If you're B2B enterprise, probably not either."

**Specific examples from real work:**
> "When we implemented this for [specific client--an e-commerce brand selling outdoor gear], their organic traffic went from 12K to 89K monthly in four months. Not because of any trick--because we fixed the structural issues killing their crawlability."

**Uncertainty where honest:**
> "I'm not 100% sure why this works. Best guess: the semantic density signals topical authority. But I've seen it work across 40+ sites, so I stopped questioning it."

**Tangents and asides:**
> "This is the part where most guides tell you to 'create quality content.' (Useless advice.) What does that actually mean? Here's the specific bar to clear..."

### Rhythm Variation

AI writes in monotonous rhythm--similar sentence lengths, parallel structures, predictable patterns. Fix it:

- Vary sentence length. Short punch. Then longer explanatory sentences that build out the context and add nuance that could not fit in a shorter form.
- Use fragments. For emphasis. Or drama.
- Start sentences with "And" or "But" when natural. Grammar rules exist to serve clarity, not the other way around.
- Include parenthetical asides (the kind of thing you would say out loud if explaining to a friend).
- Ask questions. Then answer them. Or do not -- leave some things hanging.
- One-word paragraphs.

Really.

### The Detection Checklist

Before publishing, run through:

```
[ ] No AI words (delve, comprehensive, crucial, leverage, landscape)
[ ] No AI phrases (in today's world, it's important to note, let's dive in)
[ ] Not everything in threes
[ ] At least one personal opinion stated directly
[ ] At least one specific number from real experience
[ ] At least one admission of limitation or uncertainty
[ ] Sentence lengths vary (some under 5 words, some over 20)
[ ] Would I say this out loud to a smart friend?
[ ] Does it sound like a specific person, or a committee?
[ ] Can I identify whose voice this is?
```

### The Read-Aloud Test

Read your draft out loud. If you stumble, readers will too. If it sounds like a textbook, rewrite it. If you would be embarrassed to read it to a colleague, it is not ready.

---

## Phase 6: Optimize

### On-Page SEO Checklist

```
[ ] Primary keyword in title (front-loaded if possible)
[ ] Primary keyword in H1 (can match title)
[ ] Primary keyword in first 100 words
[ ] Primary keyword in at least one H2
[ ] Secondary keywords in H2s naturally
[ ] Primary keyword in meta description
[ ] Primary keyword in URL slug
[ ] Image alt text includes relevant keywords
[ ] Internal links to related content (4-8 per piece)
[ ] External links to authoritative sources (2-4 per piece)
```

### Title Optimization

**Format:** [Primary Keyword]: [Benefit or Hook] ([Year] if relevant)

**Examples:**
- "AI Marketing Tools: 10 That Actually Work (2025)"
- "What is Agentic AI Marketing? The Complete Guide"
- "n8n vs Zapier: Which Automation Tool is Right for You?"

**Title rules:**
- Under 60 characters (or it gets cut off)
- Front-load the keyword
- Include a hook or differentiator
- Match search intent

### Meta Description

**Format:** [Direct answer to query]. [Proof/credibility]. [CTA or hook].

**Example:**
> "AI marketing tools can automate 60-80% of repetitive tasks. We tested 23 tools over 6 months to find the 10 that actually deliver. See the results."

**Meta rules:**
- 150-160 characters
- Include primary keyword
- Compelling enough to click
- Match what the content delivers

### Header Structure

```
H1: Main title (one per page)
  H2: Major section (keyword variation)
    H3: Subsection
    H3: Subsection
  H2: Major section (keyword variation)
    H3: Subsection
  H2: FAQ (if included)
    H3: Question 1
    H3: Question 2
```

Use headers for structure, not decoration. Each H2 should be a scannable summary of what follows.

### Featured Snippet Optimization

**For definition snippets:**
- Put definition in first paragraph
- Format: "[Keyword] is [definition in 40-50 words]"

**For list snippets:**
- Use H2 for the question
- Immediately follow with numbered or bulleted list
- Keep list items concise (one line each)

**For table snippets:**
- Use actual HTML tables
- Include clear headers
- Keep data concise

### Internal Linking Strategy

**Link TO this content from:**
- Related pillar content
- Blog posts on similar topics
- Resource pages

**Link FROM this content to:**
- Deeper dives on subtopics mentioned
- Related tools or resources
- Conversion pages (where appropriate)

**Anchor text:**
- Use descriptive text, not "click here"
- Vary anchor text naturally
- Include keywords where natural

---

## Phase 7: Schema Markup Generation (v2 Enhancement)
### Content Quality Checklist

```
[ ] Answers title question in first 300 words
[ ] At least 3 specific examples or numbers
[ ] At least 1 personal experience or unique insight
[ ] Unique angle present (not just aggregation)
[ ] All claims supported by evidence or experience
[ ] No generic advice (could apply to anyone)
[ ] Would I bookmark this? Would I share it?
[ ] PAA questions answered (all of them)
[ ] SERP gaps addressed (from Phase 1 analysis)
```

### Voice Quality Checklist

```
[ ] Reads naturally out loud
[ ] No AI-isms (delve, landscape, comprehensive)
[ ] No corporate speak (leverage, synergy)
[ ] Sentence length varies
[ ] Personality present
[ ] Would I actually say this to someone?
[ ] Matches voice-profile.md (if loaded)
[ ] Positioning angle visible (if loaded)
```

### SEO Quality Checklist

```
[ ] Primary keyword in title, H1, first paragraph
[ ] Secondary keywords in H2s naturally
[ ] Meta description compelling and <160 chars
[ ] Internal links included (4-8)
[ ] External citations for claims (2-4)
[ ] Alt text on all images
[ ] Headers create logical structure
[ ] FAQ section with schema-ready format
[ ] Schema markup generated (Article + FAQ)
```

### E-E-A-T Signals Checklist

```
[ ] Experience shown (real examples, specific results)
[ ] Expertise demonstrated (depth, accuracy, nuance)
[ ] Author credentials visible
[ ] Sources cited for factual claims
[ ] Updated date visible
[ ] No misleading claims
```

---

## File Output Format (v2 Enhancement)
## Chain to /content-atomizer (v2 Enhancement)

After content creation, offer to atomize the article into social distribution
assets. This is the natural next step -- one article becomes 5-10 social posts.

### Chain Prompt

```
  ──────────────────────────────────────────────

  DISTRIBUTE THIS CONTENT

  Your article is {N} words of original content.
  That is enough raw material for:

  ├── 3-5 LinkedIn posts
  ├── 8-12 Twitter/X posts
  ├── 2-3 Instagram carousel concepts
  ├── 1 email newsletter excerpt
  └── 1 thread (Twitter or LinkedIn)

  → "Atomize" to run /content-atomizer now
  → "Not yet" to save the article and stop here

  ──────────────────────────────────────────────
```

### Handoff Data

If the user says "atomize" or similar, hand off to /content-atomizer with:
- The article file path: `./campaigns/content/{slug}.md`
- The article title and primary keyword
- Brand voice context (already loaded)
- The key takeaways and quotable passages from the article

---

## Example: Creating SEO Content from Keyword Research

### Input from /keyword-research skill:

```
Target: "what is agentic AI marketing"
Cluster: agentic AI, AI marketing agents, autonomous marketing
Intent: Informational
Content type: Pillar guide
Priority: Critical (category definition opportunity)
Content brief: ./campaigns/content-plan/what-is-agentic-ai-marketing.md
```

### Brand memory loaded:

```
  Brand context loaded:
  ├── Voice Profile   ✓ "Direct, proof-heavy, zero jargon"
  ├── Keyword Plan    ✓ 5 pillars, 12 briefs
  ├── Audience        ✓ "Funded startups, 10-50 employees"
  ├── Positioning     ✓ "Practitioner, not theorist"
  └── Competitors     ✓ 3 competitors profiled
```

### SERP analysis findings:

```
  SERP ANALYSIS: "what is agentic AI marketing"

  Top 5 results:
  ├── 1. "What is Agentic AI?" -- techcrunch.com
  │      Definition article, ~800 words, 2024
  │      Angle: General AI explainer
  │      Gap: No marketing application depth
  │
  ├── 2. "Agentic AI in Business" -- forbes.com
  │      Listicle, ~1,200 words, 2025
  │      Angle: Enterprise use cases
  │      Gap: No how-to, no specific tools
  │
  ├── 3. "AI Marketing Agents" -- hubspot.com
  │      Product page, ~600 words, 2025
  │      Angle: Selling their tool
  │      Gap: Biased, not comprehensive
  │
  ├── 4. Reddit thread -- r/marketing
  │      Discussion, various, 2025
  │      Angle: Practitioner questions
  │      Gap: No structured answer
  │
  └── 5. "AI Marketing Automation" -- neilpatel.com
         Guide, ~2,000 words, 2024
         Angle: General automation
         Gap: Not specific to agentic AI

  SERP FEATURES
  ├── Featured Snippet    definition format
  ├── People Also Ask     8 questions captured
  └── AI Overview         present, thin

  OPPORTUNITY ASSESSMENT
  Reddit in top 5 confirms major content gap.
  No comprehensive practitioner guide exists.
  Category definition opportunity is real.
```

### Content brief created:
- 5,000+ word pillar guide
- Unique angle: Practitioner perspective with real implementations
- Include: Definition, examples, tools, how to implement, future outlook
- Answer all 8 PAA questions
- Target Featured Snippet with clear definition

### Draft following pillar guide structure:
- Hook: "AI agents can now run marketing campaigns without you. Here's what that actually means."
- Quick answer section for snippet
- Deep sections on: What it is, How it works, Real examples, Tools, Implementation
- FAQ from PAA research (8 questions)
- CTA to community/resources

### Humanized with:
- Personal experience running AI marketing campaigns
- Specific metrics from real implementations
- Honest limitations acknowledged
- Conversational tone matching voice-profile.md ("direct, proof-heavy, zero jargon")

### Optimized with:
- Keyword in title, H1, first paragraph
- Secondary keywords in H2s
- Internal links to related content
- FAQ schema ready

### Schema generated:
- Article JSON-LD with full metadata
- FAQPage JSON-LD with 8 questions and answers

### Saved to:
- `./campaigns/content/what-is-agentic-ai-marketing.md` (with frontmatter)
- `./brand/assets.md` (entry appended)

---

## How This Connects to Other Skills

**Input from:**
- **keyword-research** --> Provides target keyword, cluster, intent, content type, and content briefs
- **positioning-angles** --> Provides unique angle for differentiation
- **brand-voice** --> Provides voice profile for consistent tone
- **./brand/audience.md** --> Provides audience context for appropriate depth and examples
- **./brand/competitors.md** --> Provides competitor landscape for differentiation

**Uses:**
- **direct-response-copy** --> For CTAs and conversion elements within content

**Chains to:**
- **content-atomizer** --> Turns the article into social posts, email excerpts, threads

**The flow:**
1. /keyword-research identifies the opportunity and creates content briefs
2. /positioning-angles finds the unique angle
3. /brand-voice defines how it should sound
4. **/seo-content creates the actual piece** (you are here)
5. /content-atomizer distributes it across channels
6. /direct-response-copy punches up CTAs

---

## Reference: E-E-A-T Examples

See `references/eeat-examples.md` for 20 best-in-class examples of human-written content across verticals:

**Marketing/Business:**
- Paul Graham, Wait But Why, Stratechery, James Clear, Backlinko, Lenny's Newsletter, Derek Sivers

**Finance/Economics:**
- Matt Levine (Money Stuff), Morgan Housel (Psychology of Money)

**Technical/Engineering:**
- Julia Evans, Dan Luu, Shopify Engineering Blog

**Healthcare/Science:**
- Dr. Peter Attia, Dr. Siddhartha Mukherjee

**Enterprise/B2B:**
- First Round Review, Rosalyn Santa Elena (RevOps)

**Specialized Verticals:**
- Brian Krebs (Cybersecurity), Ken White (Legal), Katrina Kibben (HR/Recruiting), J. Kenji Lopez-Alt (Food Science)

Study these patterns. The goal is content that reads like these writers -- not like AI trained on generic web content.

---

## Error States

### Web search not available

```
  +----------------------------------------------+
  |                                              |
  |  X  SERP ANALYSIS UNAVAILABLE               |
  |                                              |
  |  Web search tools are not available in this  |
  |  environment. I can still write the article  |
  |  using brand context and content brief --    |
  |  but without live SERP analysis, PAA data,   |
  |  or competitor gap validation.               |
  |                                              |
  |  -> Continue without SERP data               |
  |  -> Provide competitor URLs manually         |
  |                                              |
  +----------------------------------------------+
```

When web search is unavailable, skip SERP analysis in Phase 1. Proceed with
the brief-based approach (Phase 2 onward). Note in the output that SERP
validation was not performed and recommend the user manually check top
results for the target keyword.

### No target keyword provided

```
  +----------------------------------------------+
  |                                              |
  |  X  NEED A TARGET KEYWORD                   |
  |                                              |
  |  I need a keyword to write for. Options:     |
  |                                              |
  |  -> Tell me the keyword to target            |
  |  -> /keyword-research to find the right one  |
  |  -> Point me to a content brief              |
  |                                              |
  +----------------------------------------------+
```

### Voice profile not found

```
  +----------------------------------------------+
  |                                              |
  |  X  BRAND VOICE NOT FOUND                   |
  |                                              |
  |  I can write this article, but without your  |
  |  voice profile I will use a default style:   |
  |  direct, conversational, specific.           |
  |                                              |
  |  -> /brand-voice  Build your profile (~10 min|
  |  -> Continue with defaults                   |
  |                                              |
  +----------------------------------------------+
```

### Content directory not writable

```
  +----------------------------------------------+
  |                                              |
## The Test

Before publishing, ask:

1. **Does it answer the query better than what is ranking?**
2. **Would an expert in this field approve of the accuracy?**
3. **Would a reader bookmark or share this?**
4. **Does it sound like a person, not a content mill?**
5. **Is there at least one thing here they cannot find elsewhere?**
6. **Does it pass the AI detection checklist?** (Phase 5)
7. **Does it match the quality bar of the E-E-A-T examples?**
8. **Does it answer ALL People Also Ask questions?** (v2)
9. **Is the schema markup valid and complete?** (v2)
10. **Is it saved to disk with proper frontmatter?** (v2)

If any answer is no, revise before publishing.

---

## Feedback Collection

After the article is saved and presented, offer the standard feedback prompt
per brand-memory.md protocol:

```
  How did this land?

  a) Great -- ready to publish as-is
  b) Good -- made minor edits
  c) Rewrote significantly
  d) Have not published yet

  (You can answer later -- just run
  /seo-content again and tell me.)
```

### Processing Feedback

**If (a) "Great":**
- Log to ./brand/learnings.md under "What Works":
  `- [{date}] [/seo-content] Article "{title}" shipped as-is. Keyword: "{keyword}". Angle: {angle}. Word count: {N}. Content type: {type}.`

**If (b) "Good -- minor edits":**
- Ask: "What did you change? Even small details help me improve."
- Log the change to learnings.md. If it reveals a voice/tone issue, suggest
  updating voice-profile.md.
- Example entry: `- [{date}] [/seo-content] User softened tone in intro. Note: default opening may be too aggressive for this audience.`

**If (c) "Rewrote significantly":**
- Ask: "Can you share what you changed or paste the final version? I will learn from the diff."
- If they share it, analyze the differences and log specific findings.
- If the rewrite reveals a pattern (e.g., voice is consistently wrong),
  suggest re-running /brand-voice.
- Example entry: `- [{date}] [/seo-content] User rewrote "{title}" -- shifted from data-driven to story-driven. Voice profile may need update.`

**If (d) "Have not published yet":**
- Note it. Do not log anything to learnings.md yet.
- Optionally remind them next time: "Last time I wrote an article on '{keyword}'. Did you ever publish it? I would love to know how it ranked."

---

