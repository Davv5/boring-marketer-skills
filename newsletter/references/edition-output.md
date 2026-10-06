# Saved edition structure

Use this skill-specific structure inside the newsletter file; the response around it follows `../_system/output-format.md`.

## File Output

Every newsletter edition is saved to disk for version control, repurposing, and campaign tracking.

### Output Path

```
./campaigns/newsletters/{date}-{topic}.md
```

**Naming convention:**
- Date format: `YYYY-MM-DD`
- Topic: lowercase-kebab-case, 2-4 words
- Examples: `2026-02-16-ai-tools-roundup.md`, `2026-02-16-pricing-framework.md`

### Output File Format

Each saved newsletter file follows this structure:

```markdown
# Newsletter: {Title}

## Metadata
- **Format:** {archetype name}
- **Date:** {YYYY-MM-DD}
- **Subject Line:** {chosen subject line}
- **Subject Line Variants:**
  1. {variant 1}
  2. {variant 2}
  3. {variant 3}
- **Estimated Read Time:** {X} min
- **Platform:** {Beehiiv/Substack/ConvertKit/Ghost/Other}

---

## Subject Line

{Chosen subject line}

---

## Newsletter Content

{Full newsletter body, formatted per the chosen Format}

---

## Send Notes

- **Recommended send time:** {day + time}
- **A/B test recommendation:** {which subject lines to test}
- **Segmentation notes:** {if applicable}

---

## Sources

{List of all sources referenced, with links}
```

### Asset Registry Update

After saving the newsletter file, append an entry to `./brand/assets.md`:

```
| {date}-{topic} | Newsletter ({format}) | {date} | newsletters | draft | {subject line} |
```

For feedback and learning updates, apply `../_system/brand-memory.md` §Feedback.
