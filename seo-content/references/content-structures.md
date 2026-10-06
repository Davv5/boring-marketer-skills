# SEO content structures and templates

Read the structure matching the article's Content Format during Phase 3 of `seo-content/SKILL.md`. Adapt sections and length to intent, evidence, and reader needs.

## Pillar Guide Structure (5,000-8,000 words)

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

## How-To Tutorial Structure (2,000-3,000 words)

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

## Comparison Structure (2,500-4,000 words)

```
1. Quick Verdict (200-300 words)
   - Bottom line recommendation
   - "Choose X if... Choose Y if..."

2. Comparison Table
   - 8-12 key differentiators
   - Pricing (when verified), best for, key features

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

## Listicle Structure (2,000-3,000 words)

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

## Article + FAQ JSON-LD

Include Article JSON-LD for each article. Include FAQPage when the article has an FAQ; add HowTo for how-to content. Replace known values with accurate article values and keep unknowns explicit for user completion.

### Article

```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "{title}",
  "description": "{meta description}",
  "author": {"@type": "Person", "name": "{author}"},
  "datePublished": "{YYYY-MM-DD}",
  "dateModified": "{YYYY-MM-DD}",
  "publisher": {"@type": "Organization", "name": "{publisher}"},
  "mainEntityOfPage": {"@type": "WebPage", "@id": "{URL}"},
  "keywords": ["{primary keyword}", "{secondary keyword}"]
}
```

### FAQPage

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "{question}",
      "acceptedAnswer": {"@type": "Answer", "text": "{answer}"}
    }
  ]
}
```

### HowTo

```json
{
  "@context": "https://schema.org",
  "@type": "HowTo",
  "name": "{title}",
  "description": "{meta description}",
  "step": [
    {"@type": "HowToStep", "name": "{step title}", "text": "{step instructions}"}
  ]
}
```

## Article frontmatter fields

```yaml
---
title: "{SEO title}"
meta_description: "{description}"
primary_keyword: "{keyword}"
secondary_keywords: ["{keyword}"]
content_format: "{content Format}"
search_intent: "{intent}"
target_word_count: "{range}"
actual_word_count: {count}
author: "{author}"
date_created: "{YYYY-MM-DD}"
last_updated: "{YYYY-MM-DD}"
status: "draft"
serp_snapshot_date: "{YYYY-MM-DD}"
paa_questions_answered: {count}
schema_article: |
  {Article JSON-LD}
schema_faq: |
  {FAQPage JSON-LD}
schema_howto: |
  {HowTo JSON-LD, when applicable}
---
```
