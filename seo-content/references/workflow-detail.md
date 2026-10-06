# Detailed SEO workflow guidance

Read alongside the relevant phase in `seo-content/SKILL.md` when the detailed research procedure, examples, checks, handoff, or troubleshooting is needed.

## Phase 1: Research

### SERP Analysis

Search the target keyword using web search tools and analyze the top 5 results.

**For each result, capture:**
- Title and URL
- Content Format (guide, listicle, tool page, etc.)
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


### SERP analysis: {target keyword}

| Result | URL/domain | Format and length | Date | Angle | Gap |
|---|---|---|---|---|---|
| 1. {Title} | {URL/domain} | {Format}, ~{N} words | {date} | {angle} | {gap} |
| 2. {Title} | {URL/domain} | {Format}, ~{N} words | {date} | {angle} | {gap} |
| 3. {Title} | {URL/domain} | {Format}, ~{N} words | {date} | {angle} | {gap} |
| 4. {Title} | {URL/domain} | {Format}, ~{N} words | {date} | {angle} | {gap} |
| 5. {Title} | {URL/domain} | {Format}, ~{N} words | {date} | {angle} | {gap} |

### SERP features

- Featured Snippet: {format or "none"}
- People Also Ask: {N} questions captured
- AI Overview: {present/absent, summary}


### Opportunity assessment

{1-3 sentence summary of the gap your content
will fill and why it can win}


### People Also Ask Integration

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


### People also ask

Full sections (answer as H2):
- "{question 1}" -- high search signal
- "{question 2}" -- aligns with content Format
- "{question 3}" -- competitive gap

FAQ entries (answer briefly):
- "{question 4}"
- "{question 5}"
- "{question 6}"
- "{question 7}"


### Gap Analysis

After reviewing competitors and PAA, identify:

1. **What is missing?** -- Questions unanswered, angles unexplored
2. **What is outdated?** -- Old information, deprecated methods
3. **What is generic?** -- Surface-level advice anyone could give
4. **What is your edge?** -- Unique data, experience, perspective (informed by positioning.md)

Your content should fill these gaps.

---

## Phase 2: Content Brief

Use `../_system/content-brief.md` for fields and `../_system/schemas/content-brief.schema.json` for the contract.

## Phase 3: Outline

Use `references/content-structures.md` for the four Format outlines and section guidance.

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


- [ ] At least one personal opinion stated directly
- [ ] At least one specific number from real experience
- [ ] At least one admission of limitation or uncertainty
- [ ] Sentence lengths vary (some under 5 words, some over 20)
- [ ] Would I say this out loud to a smart friend?
- [ ] Does it sound like a specific person, or a committee?
- [ ] Can I identify whose voice this is?


### The Read-Aloud Test

Read your draft out loud. If you stumble, readers will too. If it sounds like a textbook, rewrite it. If you would be embarrassed to read it to a colleague, it is not ready.

---

## Phase 6: Optimize

### On-Page SEO Checklist


- [ ] Primary keyword in title (front-loaded if possible)
- [ ] Primary keyword in H1 (can match title)
- [ ] Primary keyword in first 100 words
- [ ] Primary keyword in at least one H2
- [ ] Secondary keywords in H2s naturally
- [ ] Primary keyword in meta description
- [ ] Primary keyword in URL slug
- [ ] Image alt text includes relevant keywords
- [ ] Internal links to related content (4-8 per piece)
- [ ] External links to authoritative sources (2-4 per piece)


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


H1: Main title (one per page)
H2: Major section (keyword variation)
H3: Subsection
H3: Subsection
H2: Major section (keyword variation)
H3: Subsection
H2: FAQ (if included)
H3: Question 1
H3: Question 2


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

## Phase 7: Schema Markup

Use `references/content-structures.md` for Article, FAQPage, and HowTo JSON-LD examples.

## Phase 8: Review and Save
### Content Quality Checklist


- [ ] Answers title question in first 300 words
- [ ] At least 3 specific examples or numbers
- [ ] At least 1 personal experience or unique insight
- [ ] Unique angle present (not just aggregation)
- [ ] All claims supported by evidence or experience
- [ ] No generic advice (could apply to anyone)
- [ ] Would I bookmark this? Would I share it?
- [ ] PAA questions answered (all of them)
- [ ] SERP gaps addressed (from Phase 1 analysis)


### Voice Quality Checklist


- [ ] Reads naturally out loud
- [ ] Sentence length varies
- [ ] Personality present
- [ ] Would I actually say this to someone?
- [ ] Matches voice-profile.md (if loaded)
- [ ] Positioning angle visible (if loaded)


### SEO Quality Checklist


- [ ] Primary keyword in title, H1, first paragraph
- [ ] Secondary keywords in H2s naturally
- [ ] Meta description compelling and <160 chars
- [ ] Internal links included (4-8)
- [ ] External citations for claims (2-4)
- [ ] Alt text on all images
- [ ] Headers create logical structure
- [ ] FAQ section with schema-ready format
- [ ] Schema markup generated (Article + FAQ)


### E-E-A-T Signals Checklist


- [ ] Experience shown (real examples, specific results)
- [ ] Expertise demonstrated (depth, accuracy, nuance)
- [ ] Author credentials visible
- [ ] Sources cited for factual claims
- [ ] Updated date visible
- [ ] No misleading claims


---

## Chain to /content-atomizer

After content creation, offer to atomize the article into social distribution
assets. This is the natural next step -- one article becomes 5-10 social posts.

### Chain Prompt


### Distribute this content

Your article is {N} words of original content.
That is enough raw material for:

- 3-5 LinkedIn posts
- 8-12 Twitter/X posts
- 2-3 Instagram carousel concepts
- 1 email newsletter excerpt
- 1 thread (Twitter or LinkedIn)

→ "Atomize" to run /content-atomizer now
→ "Not yet" to save the article and stop here


### Handoff Data

If the user says "atomize" or similar, hand off to /content-atomizer with:
- The article file path: `./campaigns/content/{slug}.md`
- The article title and primary keyword
- Brand voice context (already loaded)
- The key takeaways and quotable passages from the article

---

## Example: Creating SEO Content from Keyword Research

### Input from /keyword-research skill:


Target: "what is agentic AI marketing"
Cluster: agentic AI, AI marketing agents, autonomous marketing
Intent: Informational
Content Format: Pillar guide
Priority: Critical (category definition opportunity)
Content brief: ./campaigns/content-plan/what-is-agentic-ai-marketing.md


### Brand memory loaded:


Brand context loaded:
- Voice Profile   ✓ "Direct, proof-heavy, zero jargon"
- Keyword Plan    ✓ 5 pillars, 12 briefs
- Audience        ✓ "Funded startups, 10-50 employees"
- Positioning     ✓ "Practitioner, not theorist"
- Competitors     ✓ 3 competitors profiled


### SERP analysis findings:


SERP ANALYSIS: "what is agentic AI marketing"

Top 5 results:
- 1. "What is Agentic AI?" -- techcrunch.com
Definition article, ~800 words, 2024
Angle: General AI explainer
Gap: No marketing application depth

- 2. "Agentic AI in Business" -- forbes.com
Listicle, ~1,200 words, 2025
Angle: Enterprise use cases
Gap: No how-to, no specific tools

- 3. "AI Marketing Agents" -- hubspot.com
Product page, ~600 words, 2025
Angle: Selling their tool
Gap: Biased, not comprehensive

- 4. Reddit thread -- r/marketing
Discussion, various, 2025
Angle: Practitioner questions
Gap: No structured answer

- 5. "AI Marketing Automation" -- neilpatel.com
Guide, ~2,000 words, 2024
Angle: General automation
Gap: Not specific to agentic AI

### SERP features
- Featured Snippet: definition format
- People Also Ask: 8 questions captured
- AI Overview: present, thin

### Opportunity assessment
Reddit in top 5 confirms major content gap.
No comprehensive practitioner guide exists.
Category definition opportunity is real.


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
- **keyword-research** --> Provides target keyword, cluster, intent, content Format, and content briefs
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

Present blockers inside `../_system/output-format.md`'s four sections.

### Web search not available

✗ Live SERP analysis, PAA data, and competitor-gap validation are unavailable.
- → Continue with a brief-based article and the ESTIMATED data-quality label after user agreement.
- → Provide competitor URLs manually or connect web search.

If proceeding, report that SERP validation was not performed and recommend a manual check of the top results.

### No target keyword provided

✗ A target keyword is needed.
- → Supply the keyword or a content brief.
- → /keyword-research: find an appropriate target.

### Voice profile not found

Use the default direct, conversational, specific style; report missing context through `../_system/brand-memory.md` §Read.
- → /brand-voice: build a profile (~10 min).
- → Continue with defaults.

### Content directory not writable

✗ Could not save to `./campaigns/content/`. Display the generated article so it can be copied manually; report that it was not saved.
- → Check directory permissions.
- → Save to a user-approved alternative location.

## The Test

Before publishing, ask:

1. **Does it answer the query better than what is ranking?**
2. **Would an expert in this field approve of the accuracy?**
3. **Would a reader bookmark or share this?**
4. **Does it sound like a person, not a content mill?**
5. **Is there at least one thing here they cannot find elsewhere?**
6. **Does it pass the AI detection checklist?** (Phase 5)
7. **Does it match the quality bar of the E-E-A-T examples?**
8. **Does it answer ALL People Also Ask questions?**
9. **Is the schema markup valid and complete?**
10. **Is it saved to disk with proper frontmatter?**

If any answer is no, revise before publishing.

---

## Feedback

Use `seo-content/SKILL.md` §Feedback for the post-delivery step; the prompt and learning format live in `../_system/brand-memory.md` §Feedback.
