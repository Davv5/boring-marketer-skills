# Refresh Mode

Enter this Mode when the user points to an existing article, asks to refresh or update a published article, or the returning-run check finds the keyword's article at `./campaigns/content/{keyword-slug}.md` and the user chooses Refresh. The other returning-run choices (rewrite with a new angle, expand, start fresh) follow the main workflow.

## Refresh process

1. Read the full article, including frontmatter and `serp_snapshot_date`.
2. Re-run SERP analysis for the target keyword. Compare the current top results, PAA, snippet format, search intent, related topics, and AI Overview with the article's recorded state.
3. Compare the current and recorded SERP state using `serp_snapshot_date`. Check for new top-five competitors, uncovered PAA questions, Featured Snippet format changes, new angles, intent shifts (for example informational to commercial), newly associated topics, and AI Overview changes. Identify outdated facts and claims in the article.
4. Present an analysis with article title, publication date, and days since publication when known. Group findings as new competitors (and their uncovered topics), new PAA questions, content gaps or outdated claims, then actionable recommendations. For each recommendation name the exact addition or section, reason, placement, specific revision, and SERP evidence. Include old and verified replacement values for changed statistics, new FAQ answers, and schema updates when FAQ content changes.
5. Ask for approval before editing. If declined, leave the article unchanged.
6. Apply approved changes, set `last_updated` and `serp_snapshot_date` to the current date, save, and review the result through Phases 6–8 of `seo-content/SKILL.md`.

Example recommendation shape:

- Add H2 “{new section}” after “{existing section}” because {SERP evidence}.
- Update “{existing section}” with {specific verified information} because {what changed}.
- Add FAQ “{new PAA question}” with {concise answer}; update FAQ schema.
- Replace {old statistic} with {verified new statistic and source}.

Completion: approved edits are saved with refreshed dates and reviewed, or the article remains unchanged when approval is declined.
