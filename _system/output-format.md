# Output Format

Every skill output is markdown with four sections, in this order: Header, Content, Files Saved, What's Next. Skill-specific layouts live with their skill and still sit inside these four sections.

The deliverable lives on disk (`./brand/`, `./campaigns/`); the output is the navigation layer. Save long content (full articles, email sequences, detailed briefs) to files, then summarise the key decisions in the output and point at the files. Open with the header: the output is the deliverable, with no preamble before it. Write it like a senior marketer's report: plain statements, with the four symbols below as the only decoration.

## Symbols

| Symbol | Meaning |
|--------|---------|
| ✓ | Done, present, saved, passed |
| ✗ | Missing, failed, not found |
| ★ | Recommended option |
| → | Next step, command or action |

## 1. Header

A level-2 heading naming the deliverable type (not the skill), then the date:

```markdown
## Brand Voice Profile
Generated Feb 16, 2026
```

## 2. Content

The deliverable itself. Use `###` headings for its sub-sections, tables for aligned data, and lists for everything else. Directory layouts and hierarchies go in a code block as a tree.

When offering choices (angles, headlines, concepts), put the recommended pick first so it is visible without scrolling, then number every option and mark the recommendation with ★:

```markdown
**★ Recommended: 1. The Anti-Course Course.** Best for cold traffic and skeptical buyers.

1. **The Anti-Course Course** ★
   "Most freelance courses teach theory. This one ships templates from someone billing $40k/month."
   → Best for: cold traffic, ads, skeptical buyers
2. **The Math Angle**
   "The difference between $3k and $10k months is 2 clients."
   → Best for: email, content, warm audience
```

When something blocks the run or needs the user's attention, lead with a ✗ line naming the situation in plain words, then give at least one → action that resolves it.

## 3. Files Saved

Every file written this run, with a `./` path relative to the project root, ✓, and a note when it was updated rather than created:

```markdown
### Files Saved
- ✓ ./brand/voice-profile.md (new)
- ✓ ./brand/positioning.md (updated)
- ✓ ./brand/assets.md (3 entries added)
```

An analysis-only run says: "No files written (analysis-only output)."

## 4. What's Next

Two to four concrete next steps, each a real `/skill-name` with a time estimate, then the routing line:

```markdown
### What's Next
- → /positioning-angles: find your market angle (~10 min)
- → /email-sequences: turn this into a welcome sequence (~15 min)

Or tell me what you're working on and I'll route you.
```

When the output finishes a workflow, say so, and point to `/start-here` to review the project or start something new.

**Visual build first.** When a run delivers publishable text assets that could benefit from visual production, make `→ /creative` (build this as a visual) the first next step, and name the next skill in the chain as the skip option. The user chooses; the run stops there.

## Quick output

When the user asks for one specific asset with clear parameters ("write me a LinkedIn post about X", "give me 5 subject lines"), deliver just that asset: no project scan, workflow proposal or gap warnings, and a What's Next of two or three lines. Exploratory requests ("help me with...", "where should I start", "set up my...") get the full run.
