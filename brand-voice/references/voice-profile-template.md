## Voice profile format

This is the canonical format for voice-profile.md. Every field is required.
The Platform Adaptations table and the structured JSON block are v2 additions.

```markdown
## Last Updated
{YYYY-MM-DD} by /brand-voice

# {Brand/Person Name} Voice Profile

## Voice Summary
{2-3 sentences capturing the essence. What does this voice FEEL like to
encounter?}

## Core Personality Traits
- **{Trait 1}:** {What this means in practice}
- **{Trait 2}:** {What this means in practice}
- **{Trait 3}:** {What this means in practice}
- **{Trait 4}:** {What this means in practice}

## Tone Spectrum

| Dimension | Position | Notes |
|-----------|----------|-------|
| Formal ↔ Casual | {e.g., "Casual, but not sloppy"} | {specifics} |
| Serious ↔ Playful | {e.g., "Mostly serious, occasional wit"} | {specifics} |
| Reserved ↔ Bold | {e.g., "Bold, makes strong claims"} | {specifics} |
| Simple ↔ Sophisticated | {e.g., "Simple words, sophisticated ideas"} | {specifics} |
| Warm ↔ Direct | {e.g., "Direct but not cold"} | {specifics} |

## Vocabulary

**Words/phrases to USE:**
- {word/phrase} — {why/when}
- {word/phrase} — {why/when}
- {signature phrases if any}

**Words/phrases to AVOID:**
- {word/phrase} — {why}
- {word/phrase} — {why}
- {AI-sounding words to skip}

**Jargon level:** {Heavy / Moderate / Light / Translated}

**Profanity:** {Yes / Occasional / Never}

## Rhythm & Structure

**Sentences:** {e.g., "Mix of short punchy (3-5 words) and medium (10-15
words). Rarely long."}

**Paragraphs:** {e.g., "Short. 1-3 sentences max. Lots of white space."}

**Openings:** {e.g., "Often starts with bold statement or direct challenge.
Rarely asks questions."}

**Formatting:** {e.g., "Uses headers. Bulleted lists. Bold for emphasis.
Minimal emojis."}

## POV & Address

**First person:** {I / We / Mix}
**Reader address:** {You / Direct name / Folks / Friends / etc.}
**Relationship stance:** {Teacher / Peer / Guide / Insider / Rebel}

## Platform Adaptations

| Platform | Tone Shift | Structure | Length |
|----------|-----------|-----------|--------|
| Email | {e.g., "Warmer, more personal"} | {e.g., "Short paragraphs, clear CTA"} | {e.g., "150-300 words"} |
| LinkedIn | {e.g., "More professional, expertise-forward"} | {e.g., "Single-idea posts, line breaks"} | {e.g., "100-200 words"} |
| Twitter/X | {e.g., "Punchier, more opinionated"} | {e.g., "One idea, no fluff"} | {e.g., "Under 280 chars"} |
| Blog/SEO | {e.g., "More thorough, still voiced"} | {e.g., "Headers, lists, longer form"} | {e.g., "1500-2500 words"} |
| Landing Page | {e.g., "More urgent, benefit-focused"} | {e.g., "Short sentences, CTA-heavy"} | {e.g., "Varies by section"} |

## Example Phrases

**On-brand (sounds like us):**
- "{Example phrase}"
- "{Example phrase}"
- "{Example phrase}"

**Off-brand (doesn't sound like us):**
- "{Example phrase}" — {why it's wrong}
- "{Example phrase}" — {why it's wrong}
- "{Example phrase}" — {why it's wrong}

## Do's and Don'ts

**DO:**
- {specific guidance}
- {specific guidance}
- {specific guidance}

**DON'T:**
- {specific guidance}
- {specific guidance}
- {specific guidance}

---

<details>
<summary>Structured Data (JSON)</summary>

```json
{
  "brand_name": "{name}",
  "last_updated": "{YYYY-MM-DD}",
  "updated_by": "/brand-voice",
  "tone": {
    "summary": "{one-sentence tone summary}",
    "spectrum": [
      {
        "dimension": "Formality",
        "left_pole": "Casual",
        "right_pole": "Formal",
        "position": {1-10},
        "notes": "{context}"
      },
      {
        "dimension": "Energy",
        "left_pole": "Serious",
        "right_pole": "Playful",
        "position": {1-10},
        "notes": "{context}"
      },
      {
        "dimension": "Confidence",
        "left_pole": "Reserved",
        "right_pole": "Bold",
        "position": {1-10},
        "notes": "{context}"
      },
      {
        "dimension": "Complexity",
        "left_pole": "Simple",
        "right_pole": "Sophisticated",
        "position": {1-10},
        "notes": "{context}"
      },
      {
        "dimension": "Warmth",
        "left_pole": "Warm",
        "right_pole": "Direct",
        "position": {1-10},
        "notes": "{context}"
      }
    ]
  },
  "vocabulary": {
    "preferred": [
      { "term": "{word}", "context": "{when to use}" }
    ],
    "avoid": [
      { "term": "{word}", "reason": "{why}", "alternative": "{use instead}" }
    ]
  },
  "personality_traits": [
    "{trait 1}",
    "{trait 2}",
    "{trait 3}",
    "{trait 4}"
  ],
  "examples": {
    "on_brand": [
      { "text": "{example}", "source": "{origin}", "why": "{what makes it on-brand}" }
    ],
    "off_brand": [
      { "text": "{example}", "source": "{origin}", "why": "{what makes it off-brand}" }
    ]
  },
  "platform_adaptations": {
    "email": {
      "tone_shift": "{description}",
      "format_preferences": "{structure notes}",
      "length": "{typical length}",
      "dos": ["{do this}"],
      "donts": ["{avoid this}"]
    },
    "linkedin": {
      "tone_shift": "{description}",
      "format_preferences": "{structure notes}",
      "length": "{typical length}",
      "dos": ["{do this}"],
      "donts": ["{avoid this}"]
    },
    "twitter": {
      "tone_shift": "{description}",
      "format_preferences": "{structure notes}",
      "length": "{typical length}",
      "dos": ["{do this}"],
      "donts": ["{avoid this}"]
    },
    "blog": {
      "tone_shift": "{description}",
      "format_preferences": "{structure notes}",
      "length": "{typical length}",
      "dos": ["{do this}"],
      "donts": ["{avoid this}"]
    },
    "landing_page": {
      "tone_shift": "{description}",
      "format_preferences": "{structure notes}",
      "length": "{typical length}",
      "dos": ["{do this}"],
      "donts": ["{avoid this}"]
    }
  },
  "audience_awareness": {
    "sophistication_level": "{beginner|intermediate|advanced|mixed}",
    "jargon_tolerance": "{none|light|moderate|heavy}",
    "reading_level": "{target level}",
    "notes": "{additional context}"
  },
  "signature_phrases": [
    { "phrase": "{catchphrase}", "usage": "{when to use}" }
  ]
}
```

</details>
```

---
