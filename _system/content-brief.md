# Content Brief

One brief per content piece. /keyword-research writes it to `./campaigns/content-plan/{keyword-slug}.md` (slug in lowercase-kebab-case: "Best marketing automation tools" → `best-marketing-automation-tools.md`). /seo-content reads it before drafting and fills any field still empty from its own research.

When reading legacy briefs, interpret status `planning` or `brief-ready` as `planned`, and priority `DO FIRST` as `do-first`; use the schema spellings in newly written JSON while preserving the old brief until an update is confirmed.

The fields are defined once in `_system/schemas/content-brief.schema.json`; each heading below maps to the schema property in brackets. Enum values (search intent, content Format, priority, status) use the schema's spelling. Leave out a section with nothing to say, except the required ones: title, Target Keyword (primary), Search Intent, Content Format and Last Updated.

```markdown
# Content Brief: {title}

## Last Updated
{YYYY-MM-DD} by /keyword-research            [created_date, created_by]

## Target Keyword
Primary: {keyword}                            [target_keyword]
Secondary: {2-5 keywords}                     [secondary_keywords]
Long-tail: {3-5 variations}                   [long_tail_keywords]
Cluster: {cluster name from keyword-plan.md}  [cluster_ref]
Metrics: {volume}/mo, difficulty {0-100}, CPC ${n}, {trend}   [keyword_metrics]

## Search Intent
{informational | commercial | transactional | navigational}   [search_intent]

## Content Format
{pillar-guide | how-to | comparison | listicle | ...}         [content_type]

## Priority
{do-first | do-second | do-third | quick-win | long-play | backlog}   [priority]

## Target Word Count
{range, from the ranking pages}               [target_word_count]

## Audience
{Who searches this and what they need}        [audience]

## Angle
{How we approach it, from positioning.md}     [angle]

## SERP Snapshot                              [serp_analysis]
1. {title} | {url} | {content Format} | {assessment}
2. ...
3. ...
Features: {featured snippet, video carousel, ...}
Content gaps:
- {what the ranking pages miss}

## People Also Ask                            [serp_analysis.people_also_ask]
- {question}

## Differentiation
{What we bring that ranking pages lack}       [differentiation]

## Key Points
- {point or element the piece must cover}     [key_points]

## Recommended Outline                        [outline]
H1: {title}
  H2: {section}: {what it covers}
    H3: {subsection}

## Voice Notes
{Adjustments to voice-profile.md for this piece}   [voice_notes]

## Internal Links                             [internal_links]
- Links to: {path or planned brief slug}
- Links from: {existing page}

## CTA
{text} ({type}, placement: {where})           [cta]

## Status
planned                                       [status]

Output: {path where the finished piece will be saved}   [output_path]
```

Drop the bracketed property names when writing a real brief. Then add the JSON block per `_system/brand-memory.md` §Write (Schemas).
