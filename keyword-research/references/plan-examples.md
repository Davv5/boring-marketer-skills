# Keyword plan examples

Read this reference while completing Steps 6–8 of `/keyword-research` for a concrete plan shape and concise user-facing report example.

## Representative cluster

```yaml
cluster: AI marketing automation
intent: commercial
priority: do-first
pillar: AI marketing automation guide
keywords:
  - phrase: AI marketing automation
    evidence: mixed-authority results; several thin guides
  - phrase: automate marketing with AI
    evidence: PAA question; informational intent
  - phrase: best AI marketing tools
    evidence: commercial listicles dominate
content_gap: practitioner workflow examples
validation:
  demand: ESTIMATED; autocomplete and PAA present
  market_focus: pass; category query
  competition: plausible; smaller sites rank
  advantage: proprietary workflow experience
roadmap:
  - title: A Practical Guide to AI Marketing Automation
    target_keyword: AI marketing automation
    type: pillar-guide
    priority: do-first
    status: planned
```

The Markdown plan is primary. Keep evidence and rationale useful for a returning run; use `_system/schemas/keyword-plan.schema.json` for its structured JSON representation and allowed enum values.

## Report example

```markdown
## Keyword Research: Example Business
Generated 2026-01-01

### Findings
- ★ Start with the AI marketing automation guide; estimated demand, mixed-authority SERP.
- ✓ Three supporting clusters; estimates labeled ESTIMATED.

### Files Saved
- `./brand/keyword-plan.md`
- `./campaigns/content-plan/ai-marketing-automation.md`

### What's Next
1. ★ Draft the priority guide with `/seo-content`.
2. Review the plan after publishing the first cluster.
```
