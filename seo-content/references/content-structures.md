# SEO content structures and templates

Read the structure matching the article's Content Format during Phase 3 of `seo-content/SKILL.md`. Adapt sections and length to intent, evidence, and reader needs.

## Pillar guide

Typical range: 5,000–8,000 words.

1. Hook and direct answer (150–250 words); state why it matters and who it serves.
2. Quick answer or TL;DR (200–300 words) when skimmers or snippet format warrant it.
3. Three to five substantive sections, each answering a major sub-question; use PAA as headings where apt.
4. Practical application or decision framework.
5. FAQ with 5–10 useful PAA questions.
6. Conclusion and CTA.

## How-to tutorial

Typical range: 2,000–3,000 words.

1. Outcome, time estimate, and prerequisites.
2. Why this method and relevant alternatives.
3. Numbered steps with one action per step and inline troubleshooting.
4. Variations or advanced tips; common mistakes.
5. FAQ with 3–5 PAA questions; next steps and CTA.

## Comparison

Typical range: 2,500–4,000 words.

1. Quick verdict: who should choose each option.
2. Comparison table of relevant differentiators, including pricing only when verified.
3. Comparable deep dives for each option: features, trade-offs, best fit, and examples.
4. Scenario-based head-to-head comparison.
5. FAQ with 3–5 PAA questions and final recommendation/CTA.

## Listicle

Typical range: 2,000–3,000 words.

1. Context and selection criteria.
2. Summary table or list for skimmers.
3. Each item: what it is, why it belongs, best fit, and limitations.
4. Decision framework, FAQ with 3–5 PAA questions, and CTA.

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
content_type: "{content Format}"
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
