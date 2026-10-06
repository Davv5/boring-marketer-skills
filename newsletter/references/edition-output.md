# Saved edition structure

Use this skill-specific structure inside the newsletter file; the response around it follows `../_system/output-format.md`.

```markdown
# Newsletter: {title}

## Metadata
- Format:
- Date:
- Subject line:
- Alternatives:
- Estimated read time:
- Platform:

## Newsletter Content
{edition}

## Send Notes
{only useful recommendations and assumptions}

## Sources
{linked sources used}
```

Save to `./campaigns/newsletters/{YYYY-MM-DD}-{topic}.md`, using a lowercase kebab-case topic. Append `| {date}-{topic} | Newsletter ({format}) | {date} | newsletters | draft | {subject line} |` to `./brand/assets.md`.
