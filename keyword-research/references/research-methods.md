## Phase 1: Seed Generation

From the business context (and brand memory if loaded), generate 20-30 seed
keywords covering:

**Direct terms** -- What you actually sell
> "AI marketing automation", "fractional CMO", "marketing workflows"

**Problem terms** -- What pain you solve
> "can't keep up with content", "marketing team too small", "don't understand AI"

**Outcome terms** -- What results you deliver
> "faster campaign execution", "10x content production", "marketing ROI"

**Category terms** -- Broader industry terms
> "marketing automation", "AI marketing", "growth marketing"

**Brand-aligned terms** -- From positioning if loaded
> If positioning is "The Anti-Agency" → seed "agency alternatives", "in-house marketing",
> "DIY marketing strategy"
> If positioning is "AI-First Marketing" → seed "AI marketing tools", "automated campaigns",
> "machine learning marketing"

---

## Phase 2: Expand (The 6 Circles Method)

For each seed keyword, expand using 6 different lenses:

### Circle 1: What You Sell
Products, services, and solutions you offer directly.
> Example: "AI marketing automation", "marketing workflow templates", "fractional CMO services"

### Circle 2: Problems You Solve
Pain points and challenges your audience faces.
> Example: "marketing team overwhelmed", "can't measure marketing ROI", "content takes too long"

### Circle 3: Outcomes You Deliver
Results and transformations customers achieve.
> Example: "automated lead generation", "consistent content publishing", "marketing that runs itself"

### Circle 4: Your Unique Positioning
What makes you different from alternatives.
> Example: "no-code marketing", "AI-first approach", "community-driven marketing"

If ./brand/positioning.md is loaded, use the actual positioning angles here
instead of generic examples. The user's real differentiators should drive Circle 4.

### Circle 5: Adjacent Topics
Related areas where your audience spends time.
> Example: "startup growth", "indie hackers", "solopreneur tools", "productivity systems"

If ./brand/audience.md is loaded, use the audience's actual communities,
interests, and adjacent problems to populate Circle 5.

### Circle 6: Entities to Associate With
People, tools, frameworks, concepts you want to be connected to.
> Example: "Claude AI", "n8n automation", specific thought leaders, industry frameworks

### Expansion Techniques

For each seed, find variations using:

**Question patterns:**
- What is [keyword]?
- How to [keyword]?
- Why [keyword]?
- Best [keyword]?
- [keyword] vs [alternative]?
- [keyword] examples
- [keyword] for [audience]

**Modifier patterns:**
- [keyword] tools
- [keyword] templates
- [keyword] guide
- [keyword] strategy
- [keyword] 2026
- [keyword] for beginners
- [keyword] for [industry]

**Comparison patterns:**
- [keyword A] vs [keyword B]
- best [category]
- [tool] alternatives
- [tool] review

**Output:** Expanded list of 100-200 keywords from seed terms

---

## Phase 3: Web Search Validation (NEW in v2)

This is the data-backed research layer. For each pillar-level keyword and the
top 30-50 expanded keywords, pull live search data.

### Step 1: Google Autocomplete Mining

For each seed and pillar keyword, search for autocomplete suggestions:

```
Search: "[keyword] a", "[keyword] b", ... "[keyword] z"
Search: "how to [keyword]"
Search: "best [keyword]"
Search: "why [keyword]"
Search: "[keyword] vs"
Search: "[keyword] for"
```

Capture every unique suggestion. These are real queries people type.

**What to look for:**
- Suggestions you did not think of (add to expanded list)
- Recurring modifiers (signals what people care about)
- Question patterns (signals informational intent)
- Brand/product mentions (signals commercial intent)
- Year modifiers ("2026") signal freshness demand

### Step 2: People Also Ask (PAA) Mining

For each pillar keyword, search Google and capture the People Also Ask boxes:

```
Search: "[pillar keyword]"
→ Capture PAA questions
→ Click/expand each PAA to get follow-up PAAs
→ Capture the second-level questions too
```

**What PAA data reveals:**
- The exact questions your audience asks (use as H2s in content)
- Related subtopics Google associates with this keyword
- Content gaps -- if PAA answers are thin, opportunity exists
- Semantic relationships between topics

**How to use PAA data:**
- Add new questions to your expanded keyword list
- Map PAA questions to content sections within pillar articles
- Identify PAA questions that deserve standalone articles
- Use PAA phrasing in headers (matches how people search)

### Step 3: SERP Analysis

For each priority keyword, examine the top search results:

```
Search: "[keyword]"
→ Analyze the top 5-10 results
→ Note: content Format, word count, freshness, domain authority
```

**Capture for each result:**
- Title and URL
- Content type (guide, listicle, comparison, tool page, etc.)
- Freshness (when was it published/updated?)
- Quality assessment (comprehensive or thin?)
- Domain type (major publication, niche site, personal blog?)

**SERP signals that matter:**

| Signal | What it means |
|--------|--------------|
| Top results are 2+ years old | Freshness opportunity |
| Top results are thin (<1000 words) | Depth opportunity |
| Top results are all big brands (DR 80+) | Hard to win -- consider long-tail |
| Mixed results (big + small sites) | Winnable with great content |
| Forums/Reddit in top 5 | Huge content gap -- no good article exists |
| Featured snippet present | Optimize for snippet format |
| "People Also Ask" is extensive | Topic has depth worth covering |

### Step 4: Competitor Content Analysis

If ./brand/competitors.md is loaded (or competitors were provided), search
for what they rank for:

```
Search: "site:{competitor-domain.com} [topic]"
Search: "{competitor name} [pillar keyword]"
Search: "{competitor name} blog"
```

**Build a competitor content map:**

For each competitor:
- What topics do they cover?
- What content Formats do they use?
- What keywords do they appear to target?
- Where are the gaps -- topics they do NOT cover?
- What is their content quality like?

**Content gap analysis:**

| Topic | You | Competitor A | Competitor B | Gap? |
|-------|-----|-------------|-------------|------|
| [topic 1] | ✗ | ✓ strong | ✓ weak | Catch-up + improve |
| [topic 2] | ✗ | ✗ | ✗ | Blue ocean opportunity |
| [topic 3] | ✓ thin | ✓ strong | ✗ | Improve existing |

**Priority content gaps:**
1. Topics ALL competitors cover but you do not (catch-up)
2. Topics NO ONE covers well (blue ocean)
3. Topics where competitors are weak/outdated (improvement)

### Search Integration Output

After web search, present findings before clustering:

### Web research complete
- Autocomplete suggestions: {N} unique terms
- People Also Ask: {N} questions
- SERPs analyzed: {N} keywords
- Competitor pages reviewed: {N} pages

### Top discoveries
1. {Unexpected keyword with forum results dominating the SERP}
2. {Competitor content gap}
3. {PAA audience insight}

### New keywords added
- {Keyword from autocomplete}
- {Keyword from PAA}
- {Keyword from competitor gap}
- {N} more additions


---

## Phase 4: Cluster

Group expanded keywords (including web search discoveries) into content pillars
using the hub-and-spoke model:

### Cluster example

Pillar: **AI Marketing Automation**
- Supporting topic: {subtopic 1}, with its long-tail queries.
- Supporting topic: {subtopic 2}, with its long-tail queries.
- Supporting topic: {subtopic 3}, with its long-tail queries.


### Identifying Pillars (5-10 per business)

A pillar is a major topic area that could support:
- One comprehensive guide (3,000-8,000 words)
- 3-7 supporting articles
- Ongoing content expansion

Ask: "Could this be a complete guide that thoroughly covers the topic?"

### Clustering Process

1. **Group by semantic similarity** -- Keywords that mean similar things
2. **Group by search intent** -- Keywords with same user goal
3. **Identify the pillar keyword** -- The broadest term in each group
4. **Identify supporting keywords** -- More specific variations
5. **Attach PAA questions** -- Map People Also Ask questions to the cluster they belong to
6. **Note competitor coverage** -- Mark which competitors cover this cluster

### Example Cluster (with v2 search data)

**Pillar:** AI Marketing Automation

**Clusters:**
- What is AI marketing automation (definitional)
  - PAA: "Is AI marketing worth it?", "How does AI help marketing?"
  - SERP: Top results are thin, 2024-dated. Opportunity.
- AI marketing tools (commercial/comparison)
  - PAA: "What is the best AI marketing tool?", "Are AI marketing tools free?"
  - SERP: Dominated by listicles. Can win with practitioner angle.
- AI marketing examples (proof/validation)
  - Competitor gap: None of the 3 competitors have case study content.
- Building AI marketing workflows (how-to)
  - PAA: "How to automate marketing with AI?", "Can I automate my marketing?"
  - SERP: Reddit in top 5. Major content gap.
- AI vs traditional automation (comparison)

---

## Phase 5: Pillar Validation (Critical Step)

**Before finalizing pillars, run these 4 checks.**

Most keyword research fails because pillars are chosen based on what the business
WANTS to talk about, not what the market ACTUALLY searches for. In v2, we use
live search data to validate.

**1. Search Volume Test**
Does this pillar have >1,000 monthly searches across its keyword cluster?

- If YES: Valid pillar
- If NO: Not a pillar. It may be a single article or should not be created at all.

v2 enhancement: Use web search to estimate volume. Check Google autocomplete
richness (more suggestions = more search interest), check whether Google shows
"About X results" for the query, and check SERP competitiveness as a proxy for
search demand.

Example failure: "Claude marketing" (zero search volume) chosen as pillar because
the product uses Claude. Market searches "AI marketing" instead.

**2. Product vs. Market Test**
Is this pillar something the MARKET searches for, or something YOU want to talk about?

| Product-Centric (Wrong) | Market-Centric (Right) |
|-------------------------|------------------------|
| "Our methodology" | "Marketing automation" |
| "[Your tool name] tutorials" | "[Category] tutorials" |
| "Why we're different" | "[Problem] solutions" |
| Features of your product | Outcomes people search for |

The market does not search for your product name (unless you are famous). They
search for solutions to their problems.

v2 enhancement: If positioning.md is loaded, cross-reference. The positioning
angle should INFORM keyword selection, not dictate it. Your angle is how you
write about market topics, not the topics themselves.

**3. Competitive Reality Test**
Can you actually win here?

Check the top 3 results for the pillar keyword (from Phase 3 SERP data):
- All DR 80+ sites (Forbes, HubSpot, etc.)? Find adjacent pillar.
- Mix of authority and smaller sites? Winnable with great content.
- Thin content from unknown sites? High opportunity.
- Reddit/forums in results? Huge opportunity -- no good article exists.

Do not choose pillars where you have no realistic path to page 1.

**4. Proprietary Advantage Test**
Do you have unique content, data, or expertise for this pillar?

| Advantage | Priority |
|-----------|----------|
| Proprietary data others do not have | Prioritize highly |
| Unique methodology or framework | Prioritize highly |
| Practitioner experience (done it, not read about it) | Prioritize |
| Same info everyone else has | Deprioritize |

If you have 2,589 marketing workflows and nobody else does, "marketing workflows"
should be a pillar. If you are writing about "AI marketing" with no unique angle,
you are competing on equal footing with everyone.

v2 enhancement: If positioning.md is loaded, the proprietary advantage test
automatically checks your stated differentiators against each pillar.

**Validation Output:**

For each proposed pillar, document:

```
Pillar: [Name]
Search volume test: PASS/FAIL -- [evidence from web search]
Market-centric test: PASS/FAIL -- [evidence]
Competitive test: PASS/FAIL -- [SERP evidence]
Proprietary advantage: YES/NO -- [what advantage]
VERDICT: VALID PILLAR / DEMOTE TO CLUSTER / REMOVE
```

**If a pillar fails 2+ tests, it is not a pillar.** Either demote it to a single
article within another pillar, or remove it entirely.

---

## Phase 6: Prioritize

Not all keywords are equal. Score each cluster using both strategic assessment
AND live search evidence from Phase 3.

### Business Value (High / Medium / Low)

**High:** Direct path to revenue
- Commercial intent keywords
- Close to purchase decision
- Your core offering

**Medium:** Indirect path
- Builds trust and authority
- Captures leads
- Educational content

**Low:** Brand awareness only
- Top of funnel
- Tangentially related
- Nice to have

### Opportunity (High / Medium / Low)

**High opportunity signals (from web search data):**
- No good content exists (you would define the category)
- Existing content is outdated (2+ years old in SERP)
- Existing content is thin (surface-level, generic)
- You have unique angle competitors miss
- Reddit/forums in top results (content gap confirmed)
- Growing trend (autocomplete suggestions expanding)
- Competitors have not covered this topic

**Low opportunity signals:**
- Dominated by major authority sites (DR 80+)
- Excellent comprehensive content already exists
- Highly competitive commercial terms
- Declining interest
- All competitors have strong content here

### Speed to Win (Fast / Medium / Long)

**Fast (3 months):**
- Low competition (confirmed by SERP analysis)
- You have unique expertise/data
- Content gap is clear (forums ranking)

**Medium (6 months):**
- Moderate competition
- Requires comprehensive content
- Differentiation path exists

**Long (9-12 months):**
- High competition
- Requires authority building
- May need link building

### Priority Matrix

| Business Value | Opportunity | Speed | Priority |
|---------------|-------------|-------|----------|
| High | High | Fast | DO FIRST |
| High | High | Medium | DO SECOND |
| High | Medium | Fast | DO THIRD |
| Medium | High | Fast | QUICK WIN |
| High | Low | Any | LONG PLAY |
| Low | Any | Any | BACKLOG |

---

## Phase 7: Map to Content

For each priority cluster, assign:

### Content Format

| Format | When to Use | Word Count |
|------|-------------|------------|
| Pillar Guide | Comprehensive topic coverage | 5,000-8,000 |
| How-To Tutorial | Step-by-step instructions | 2,000-3,000 |
| Comparison | X vs Y, Best [category] | 2,500-4,000 |
| Listicle | Tools, examples, tips | 2,000-3,000 |
| Use Case | Industry or scenario specific | 1,500-2,500 |
| Definition | What is [term] | 1,500-2,500 |

### Intent Matching

| Intent | Keyword Signals | Content Approach | CTA Type |
|--------|-----------------|------------------|----------|
| Informational | what, how, why, guide | Educate thoroughly | Newsletter, resource |
| Commercial | best, vs, review, compare | Help them decide | Free trial, demo |
| Transactional | buy, pricing, get, hire | Make it easy | Purchase, contact |

### Content Calendar Placement

**Tier 1 (Publish in weeks 1-4):** Highest priority, category-defining
**Tier 2 (Publish in weeks 5-8):** High priority, supporting pillars
**Tier 3 (Publish in weeks 9-12):** Medium priority, depth content
**Tier 4 (Backlog):** Lower priority, future opportunities

### PAA-Driven Content Structure

For each content piece, use PAA questions to build the outline:

Article: **What is AI Marketing Automation?**

- H2: How does AI help marketing? — from PAA.
- H2: Is AI marketing automation worth it? — from PAA.
- H2: What are the best AI marketing tools? — from PAA.
- H2: How to get started with AI marketing — from PAA and autocomplete.


Each PAA question becomes an H2. This aligns your content structure with what
Google knows people are asking.

---

## Phase 8: Content Brief Generation (NEW in v2)

## Free Tools to Supplement

If the user needs additional data validation beyond web search:

- **Google Trends** (trends.google.com) -- Trend direction, seasonality
- **Google Search Console** -- Your actual ranking data
- **Google Search** -- SERP analysis, autocomplete, People Also Ask
- **AnswerThePublic** (free tier) -- Question-based keywords
- **AlsoAsked** (free tier) -- PAA relationship mapping
- **Reddit/Quora search** -- Real user questions and language
- **Ahrefs free tools** -- Limited keyword data
- **Ubersuggest free tier** -- Basic keyword metrics

---
