# Direct Response Copy Output Templates

Consult this reference during Step 5 when a saved-copy format or presentation layout is needed.

## Saved copy frontmatter

Use relevant fields; omit unknown values rather than inventing them.

```yaml
---
format: [landing-page | sales-page | email | ad | social]
campaign: campaign-name
target_audience: stated audience
positioning_angle: stated or loaded angle
platform: web
word_count: 0
date: YYYY-MM-DD
status: draft
---
```

## Campaign filenames

- Landing page: `landing-page.md`
- Sales page: `sales-page.md`
- Email: `emails/{subject-slug}.md`
- Ad: `ads/{platform}-{description}.md`
- Social post: `social/{platform}-{description}.md`

Keep the campaign layout in `../_system/brand-memory.md` §Campaigns as the source for directory conventions.

## Content presentation

- Landing or sales page: present the copy in reading order.
- Email: subject, preview text when useful, then body.
- Ad: group by platform and include character counts when constrained.
- Requested variants: numbered choices with ★ on the recommendation.
- Requested scorecard: use a compact table or list with all seven dimension scores, total, verdict, and priority fixes.

All presentations remain inside `../_system/output-format.md`'s four sections.
