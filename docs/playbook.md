---
type:
source:
topic:
date_captured: 2026-02-26
status:
tags:
---

Process over prompts. Systems over shortcuts. The complete framework for building marketing systems with AI—from research to revenue.

## The Philosophy

> Everyone's selling hype. You're selling compound growth. The boring angle is incredibly differentiated.

If you've spent any time using AI for marketing, you've probably noticed something frustrating: Everyone has the same tools. Everyone's reading the same prompting guides. And everyone's output sounds... the same.

Generic headlines. Corporate-speak copy. Email sequences that read like they were written by a committee of robots who've never actually sold anything.

You've tried better prompts. You've tried longer prompts. You've tried prompt chains and templates.

And the output is still... fine. Just fine.

#### Here's what I figured out after 18 months:

The problem isn't your prompts. The problem is that prompts are instructions. What you actually need is **methodology**.

### The 5 Core Insights

01

#### Research Is Everything

The mistake is not spending enough time in research. Cast a wide net, gather deep context.

02

#### Human Taste Is The Differentiator

AI generates options. Your taste picks winners. That's your advantage.

03

#### Speed Through Systems

With the right frameworks, you can go from zero to shipped in hours.

04

#### Boring Is Differentiated

Everyone's selling hype. Confidently boring compound growth wins.

## The Three Layers

Vibe Marketing works because it stacks three layers that most people try to do with prompts alone.

```
┌─────────────────────────────────────────────────────────────┐
│                    LAYER 3: PROCESS                        │
│         The right sequence of operations                   │
│         Research → Foundation → Structure → Assets         │
├─────────────────────────────────────────────────────────────┤
│                  LAYER 2: METHODOLOGY                      │
│     Skills = actual marketing frameworks loaded            │
│     Schwartz, Hopkins, Ogilvy, Halbert—not prompts         │
├─────────────────────────────────────────────────────────────┤
│                    LAYER 1: RESEARCH                       │
│        MCPs = real-time information access                 │
│        Perplexity, Firecrawl, Playwright                   │
└─────────────────────────────────────────────────────────────┘
```

### Layer 1: Research (MCPs)

MCPs (Model Context Protocol) let Claude access real-time information, scrape websites, take screenshots, and generate creative assets—all without leaving your IDE.

### Layer 2: Methodology (Skills)

Skills are markdown files containing actual marketing methodology. Not prompts—frameworks. Eugene Schwartz's stages of market sophistication. The Halbert copywriting principles. David Ogilvy's research methods.

### Layer 3: Process (The Sequence)

The right order matters. Research before positioning. Positioning before copy. Copy before design. Skip a step, and everything downstream suffers.

## The Complete Tool Stack

Claude Code Setup

Install skills to `~/.claude/skills/` and they load automatically. One-time setup, permanent improvement.

#### Installation

```
# Install Claude Code
npm install -g @anthropic-ai/claude-code

# Create skills directory
mkdir -p ~/.claude/skills

# Move your skill files there
mv ~/Downloads/skills/*.md ~/.claude/skills/

# Start Claude Code
claude
```

Claude Desktop Setup

Add skills to your Project Knowledge. They'll be available in that project context.

#### Installation

1. Open Claude Desktop
2. Create a new Project (or open existing)
3. Click "Project Knowledge" in the sidebar
4. Drag and drop your .md skill files
5. Skills are now available in this project

ChatGPT Setup

Paste skill content into Custom Instructions or upload as a file at the start of your conversation.

#### Option 1: Custom Instructions

1. Go to Settings → Personalization → Custom Instructions
2. Paste the most important skill (e.g., Direct Response Copy) into "How would you like ChatGPT to respond?"
3. Limited to \~1500 characters, so use the condensed version

#### Option 2: File Upload

1. Start a new conversation
2. Upload the .md skill file(s) you need
3. Say: "Use the methodology in these files for our conversation"

| Tool               | Purpose                    | Impact                      |
| ------------------ | -------------------------- | --------------------------- |
| **VS Code**        | IDE where everything lives | One workspace, no switching |
| **Claude Code**    | AI agent with file access  | Agentic execution           |
| **Perplexity MCP** | Deep market research       | Comprehensive insights      |
| **Firecrawl MCP**  | Scrape competitor pages    | Scale analysis              |

## Strategy Skills

The foundation skills that inform everything else.

Strategy

Orchestrator

Routes you to the right skill based on your goal. No blank page syndrome.

Strategy

Brand Voice

Define personality and tone. Consistent voice across all content.

Strategy

Positioning Angles

Find differentiation. 8 frameworks for hooks that stand out.

Research

Keyword Research

6 Circles Method. Find SEO opportunities competitors miss.

Strategy

Lead Magnet

High-converting opt-in concepts. Offers that bridge to paid.

## Copy Skills

Write copy that converts. Not generic AI output—methodology-driven copy.

Copy

Direct Response Copy

Landing pages that convert. Sales copy that sounds human. 100+ years of methodology.

Copy

Email Sequences

Welcome, nurture, conversion. Automated flows that work.

Content

Newsletter

9 formats for engagement. Content people actually read.

Content

SEO Content

Ranking content that reads human. Not AI slop.

Distribution

Content Atomizer

1 piece → 15+ assets. Multi-platform reach.

## Creative Skills

Generate actual creative assets—images, videos, designs.

Creative

AI Creative Strategist

Research + creative direction. Briefs that produce results.

Creative

AI Product Photo

Hero images, lifestyle shots. E-commerce ready.

Creative

AI Product Video

Product reveals, motion content. Video ads at scale.

Creative

AI Social Graphics

Platform-optimized visuals. LinkedIn, Instagram, YouTube.

Creative

AI Talking Head

UGC-style presenter videos. Lip-sync without filming.

Design

Frontend Design

Production-grade web pages. No AI tells.

## Initial Research Framework

> The mistake most people make? Not spending enough time in research. Cast a wide net. Gather deep context. Let AI work with real information.

### The Golden Rule

Cast a WIDE net. Gather DEEP context. Let AI work.

#### Research Prompt Template

```
We are creating a [TYPE OF BUSINESS]
Example: "AI consulting agency for B2B SaaS"

Targeting: [AUDIENCE + REVENUE RANGE + INDUSTRY]
Example: "$2-10M SMBs in fintech who struggle with AI adoption"

What makes us different: [YOUR UNIQUE APPROACH/METHODOLOGY]
Example: "We use a confidently boring, systems-first approach
leveraging Claude Skills + MCPs vs. typical AI hype"

Current state: [Starting point]
Example: "No online presence. Starting from scratch."

Research Goals:
• Market landscape & key competitors
• Customer pain points & positioning gaps
• Pricing models & service packaging
• Enterprise best practices to repackage for our target
```

#### Tools for Research

* **Perplexity MCP** — Deep market research, comprehensive responses
* **Web Search** — Quick competitor lookups, real-time info
* **Firecrawl** — Scrape competitor websites at scale
* **Playwright** — Screenshot competitor designs, capture patterns

Pro Tip

30-60 minutes of boring research = exceptional output for everything that follows. Save everything as .md files in your project folder.

## Expert Review Framework

You created something with AI. Is it REALLY good? Or just looking good? Task-based agents give you objective validation.

#### Without Task-Based Agents

* Claude Code = 1 AI agent
* Single perspective on your work
* Same context window throughout
* No comparison or validation

#### With Task-Based Agents

* 3-5 specialized perspectives
* Fresh context per agent
* Agents evaluate independently
* Consensus = signal in noise

#### How to Invoke Expert Review

```
"Spin up task-based agents to review this:
1. Agency Growth Expert
2. SEO Specialist
3. Conversion Expert
4. [Industry-specific expert]

Each analyzes from their perspective.
Synthesize: Where do they agree?"
```

#### When to Checkpoint

* After copy — before design
* After design — before launch
* After strategy — before execution
* Before any high-stakes decision

## The 5-Stage Build Sequence

This isn't a vague framework. It's the exact journey we take on every build.

```
RESEARCH → FOUNDATION → STRUCTURE → ASSETS → ITERATION
```

01

#### Research: Deep Context

Before we write a single word, we understand the landscape. MCPs give Claude real-time access to information.

* **Market research** — Who are the competitors? What are they saying? Where are the gaps?
* **Competitor analysis** — Screenshot their landing pages, analyze their positioning
* **Customer language** — What words do they actually use?

02

#### Foundation: Voice + Positioning

Define who you are and how you're different. Everything else builds on this.

* **Brand voice extraction** — Analyze existing content, codify the voice
* **Positioning angles** — Find 3-5 distinct ways to frame the offer
* **Anti-positioning** — Define what you're NOT

03

#### Structure: Keywords + Content Pillars

Map the territory. What should you create? What should you target?

* **Keyword opportunities** — Find the gaps competitors miss
* **Content pillars** — Organize keywords into themes
* **Quick wins** — Identify low-hanging fruit for 60-90 days

04

#### Assets: Landing Pages, Emails, Content

Build the actual marketing materials. This is where methodology makes the difference.

* **Landing page copy** — Using positioning + voice + direct response frameworks
* **Email sequences** — Welcome, nurture, conversion flows
* **Lead magnets** — Opt-in offers that bridge to paid

05

#### Iteration: Reject Until Right

The critical step most people skip. First drafts are starting points.

* **Rejection cycles** — "This is too generic. Make it more specific."
* **Voice enforcement** — "This doesn't sound like our brand voice."
* **Quality gates** — Would you actually send this?

## Decision Framework

You have research but too many options. Here are 6 methods for choosing.

Method 01

Specialized Agents

Spin up 3-5 expert agents → Each analyzes independently → Where do they overlap? That's your answer.

Method 02

AI Ping Pong

Claude creates → Gemini critiques → Claude refines → GPT validates → Perplexity fact-checks.

Method 03

Recommendation Request

"We have this research. Here's the goal. What do you recommend?"

Method 04

Constraint Filter

Impact vs Effort → Speed to value → Resource requirements → Risk level.

Method 05

Market Validation

What are competitors doing? Where are gaps? Which option fills the biggest gap?

Method 06

Future Self Check

Imagine 12 months from now → We chose Option A → What does business look like?

## Foundation Stack

How skills chain together for different outcomes. "Know who you are."

```
Research (Perplexity MCP) → Market landscape, competitor gaps
        ↓
Brand Voice Skill → Voice profile, tone guide
        ↓
Positioning Angles Skill → 3-5 angles, differentiation
```

**Output:** Voice profile, 3-5 positioning angles, clear differentiation. Everything downstream builds on this.

## Conversion Stack

"Turn visitors into customers."

```
Direct Response Copy Skill → Landing page copy, headlines
        ↓
Frontend Design Skill → Production-ready design
        ↓
Lead Magnet Skill → Opt-in offer, bridge to paid
```

**Output:** Landing page copy, production-ready design, opt-in offer that converts.

## Traffic Stack

"Get discovered."

```
Keyword Research Skill → Keyword strategy, gaps
        ↓
SEO Content Skill → Ranking content
        ↓
Content Atomizer Skill → 15+ assets per piece
```

**Output:** Keyword strategy, ranking content, 15+ social assets from every piece.

## Nurture Stack

"Build relationship over time."

```
Email Sequences Skill → Welcome series, automation
        ↓
Newsletter Skill → Ongoing engagement
        ↓
Content Atomizer Skill → Email → social bridge
```

**Output:** Welcome series, ongoing newsletter, consistent social presence from email content.

#### Stack Combinations by Business Type

| Business              | Primary Stack           | Secondary Stack       |
| --------------------- | ----------------------- | --------------------- |
| **Info/Education**    | Foundation → Conversion | Traffic → Nurture     |
| **Consulting/Agency** | Foundation → Traffic    | Nurture → Conversion  |
| **E-commerce**        | Conversion → Traffic    | Nurture (email focus) |
| **SaaS**              | Conversion → Nurture    | Traffic (SEO)         |

## Use Case: Info/Education

Courses, coaching, communities, digital products.

#### The Unique Challenges

* Selling transformation, not tangible product
* Building authority before the ask
* Positioning against free content + competitors
* The "guru" skepticism problem
* High-ticket requires high trust

#### Positioning Angles That Work

The Anti-Guru

"Not another marketing bro promising you'll 10x"

The Methodology Transfer

"What took me 5 years, packaged for you"

The Community Angle

"Not just a course—a room of practitioners"

The Results-First

"Here's what \[specific person\] built in \[timeframe\]"

## Use Case: Consulting/Agency

Services, client work, B2B.

#### The Unique Challenges

* Selling time/expertise (limited inventory)
* Differentiation in crowded markets
* The "why you vs. anyone else" problem
* Balancing client acquisition with delivery

#### Positioning Angles That Work

The Specialist

"We only work with \[specific niche\]"

The Methodology

"Our proprietary \[Process Name\] ensures..."

The Results

"We've generated \[specific outcome\] for \[#\] clients"

The Anti-Agency

"No fluff. No BS. Just the work that matters."

> Best clients come from best clients. The content builds the reputation. The reputation generates referrals. The referrals become case studies. The case studies become content. Compound.

## Use Case: E-commerce

Physical products, DTC, retail.

#### The Unique Challenges

* Competing on more than price
* Product differentiation when features are similar
* Building brand in commodity markets
* Email as revenue driver (not just nurture)

#### Positioning Angles That Work

The Quality Story

"Why we chose \[specific material/process\]"

The Founder Story

"I built this because..."

The Anti-Mass-Market

"Not for everyone. Built for \[specific person\]."

The Lifestyle

"For people who \[identity marker\]"

> Every customer photo is an ad. Every review is copy. Every unboxing video is content. You're not creating marketing—you're curating what customers already give you.

## Use Case: SaaS

Software, apps, tools.

#### The Unique Challenges

* Feature parity (everyone has similar features)
* Free/freemium competitors
* Trial → paid conversion
* Churn and retention

#### Positioning Angles That Work

The Simplicity Angle

"The \[category\] that just works"

The Speed Angle

"Get started in 5 minutes, not 5 weeks"

The Integration Angle

"Built for teams already using \[popular tool\]"

The Anti-Enterprise

"No implementation fees. No sales calls. Just sign up."

> Every integration is a distribution channel. You're not just connecting tools—you're connecting audiences. Their users become your users.

## SEO: The Long Game

AI-assisted, human-verified. Quality over volume. Find the gaps, not the crowd.

#### The Vibe Marketing SEO Principles

* **Research first** — Use Keyword Research skill to find gaps vs competitors
* **Programmatic opportunities** — Look for scalable patterns, not one-off pages
* **Quality over quantity** — One excellent piece > five mediocre pieces
* **Human checkpoint** — Fact-check, add expertise, verify claims
* **Don't publish all at once** — Velocity signals matter

Human Checkpoint Required

Before publishing ANY AI-generated content: Fact-check all claims, verify links, add your unique perspective, remove AI tells ("delve," "landscape," "paradigm").

## Paid: Creative at Scale

Research → Brief → Generate → Select winners. AI creates variants, you pick what converts.

#### The Vibe Marketing Paid Principles

* **Research before creating** — Use Creative Strategist to analyze competitor ads
* **Generate variants at scale** — 5-10 per concept, let testing pick winners
* **Connect to Glif MCP** — Produce actual images/videos directly
* **Human selects winners** — AI generates options, you pick 2-3 to test
* **Platform AI handles optimization** — Feed Meta/Google good creative, let them optimize

| Skill                  | Output                       | Platform              |
| ---------------------- | ---------------------------- | --------------------- |
| **AI Social Graphics** | Static images, carousels     | Meta, LinkedIn        |
| **AI Product Photo**   | Hero shots, lifestyle images | Meta, Google Shopping |
| **AI Product Video**   | Product reveals, demos       | Meta Reels, YouTube   |
| **AI Talking Head**    | UGC-style testimonials       | Meta, TikTok          |

## Organic: The Compound Engine

One piece becomes many. Every asset compounds. The boring stuff that wins.

#### The Content Atomizer Workflow

```
INPUT: 1 Core Piece
(blog post, podcast, video, client work)
        ↓
Content Atomizer Skill
        ↓
OUTPUT: 15+ Pieces
├── LinkedIn: Long-form post, carousel, poll
├── Twitter/X: Thread, single tweet, quote angle
├── Instagram: Carousel, Reel script, story series
├── Email: Newsletter section, nurture content
└── Video: YouTube script, Shorts script
```

#### The Traffic Flywheel

```
CREATE (one piece of core content)
        ↓
ATOMIZE (Content Atomizer → 15+ pieces)
        ↓
VISUALIZE (Social Graphics + Product Photo/Video)
        ↓
DISTRIBUTE (Organic + Paid + Email)
        ↓
CAPTURE (Lead Magnets + Email Sequences)
        ↓
CONVERT (Direct Response Copy + Design)
        ↓
LEARN (What worked → inform next creation)
        ↓
REPEAT
```

## Visual Outputs Gallery

These aren't mockups. Every example below is a real output from a recorded build session. The demo project: "Boring Business Marketing" — an AI marketing agency for overlooked industries.

### The Landing Page

Built in one session using Brand Voice, Positioning Angles, and Direct Response Copy skills. From research to shipped landing page.

boringbusinessmarketing.com 

What Went Into This Page

* **Research:** Market analysis via Perplexity MCP — competitors, gaps, positioning opportunities
* **Brand Voice:** Extracted "Confidently Boring" voice profile with vocabulary guides
* **Positioning:** 5 angle options generated, "Overlooked Champion" selected
* **Copy:** Direct Response skill wrote all headlines, body, and CTAs
* **Design:** Frontend Design skill generated the complete HTML/CSS

[ View Full Landing Page →](/session-landing-page.html) 

### The Video Ad

Programmatic video ad built with Remotion for paid acquisition. Terminal-style animation that matches the brand aesthetic.

 Your browser does not support the video tag. 

Video Ad Specs

* **Format:** 1920×1080 (16:9) — YouTube pre-roll, LinkedIn feed
* **Duration:** 16 seconds @ 30fps
* **Style:** Terminal typing animation → Stats counter → Book reveal → CTA
* **Built with:** Remotion (React-based programmatic video)

### Example Text Outputs

Real outputs from the build session.

#### Output: Brand Voice Profile

**Voice Summary:** Sounds like a smart friend who's figured out what actually works and is sharing it without the hype. **Confidently boring**—embraces the unglamorous stuff that compounds over time.

#### Core Personality Traits

* **Confidently Boring:** Leans into the unsexy fundamentals that actually drive results. "Boring" is the competitive advantage.
* **Practitioner, Not Preacher:** Everything comes from doing, not theorizing. $443K in 8 months isn't a claim—it's a receipt.
* **Accessible Expert:** Deep expertise, but explains it like you're helping a smart friend get started.
* **Quietly Contrarian:** Challenges the AI hype without being preachy about it.

#### Vocabulary Guide

#### Words to USE

* "Boring" / "unsexy" / "overlooked"
* "Compound" / "compounds over time"
* "Actually works"
* Specific numbers and timeframes
* "Here's how" / "Here's what we did"

#### Words to AVOID

* "Revolutionary" / "game-changing"
* "Crushing it" / "killing it" / "10x"
* "Leverage" / "synergy" / "optimize"
* "Unlock your potential"
* Buzzwords without substance

#### Output: Positioning Angles

Angle 1

The Overlooked Champion

"AI marketing for the industries the 'cool' agencies ignore"

* "Finally: AI marketing that speaks manufacturer"
* "Your industry isn't sexy. Your marketing can be."

Angle 2

The Compound Engine

"The boring stuff that compounds while you sleep"

* "Stop chasing hacks. Start building systems."
* "What happens when you let boring compound for 12 months"

Angle 3

The Speed Advantage

"What takes agencies 3 months, we ship in 3 weeks"

* "Full marketing system. Shipped this quarter."
* "Stop waiting on agencies. Start with systems."

## All Prompts

These prompts invoke the skills. Copy them, adapt them, use them.

#### Research Phase

```
We are creating a [TYPE OF BUSINESS] targeting [AUDIENCE].
What makes us different: [UNIQUE APPROACH]

Use the Perplexity MCP to deeply research:
- Market landscape & key competitors
- Customer pain points & positioning gaps
- Pricing models & service packaging
- Best practices to repackage for our target

Save findings to /research folder as .md files.
```

#### Brand Voice Extraction

```
Use the Brand Voice skill to analyze this content and
extract a voice profile:
[PASTE EXISTING CONTENT]

Output: voice-profile.md with traits, vocabulary guide,
do's and don'ts.
```

#### Positioning Angles

```
Use the Positioning Angles skill.

Context:
- Product: [WHAT YOU SELL]
- Transformation: [WHAT LIFE LOOKS LIKE AFTER]
- Competitors: [WHO THEY'D BUY FROM OTHERWISE]

Output: 3-5 angles with psychology and headline directions.
```

#### Landing Page Copy

```
Use the Direct Response Copy skill.

Positioning angle: [CHOSEN ANGLE]
Brand voice: Reference voice-profile.md
Target audience: [SPECIFIC AUDIENCE]

Write landing page copy with:
- 3 headline options
- Hero section
- Problem/Solution sections
- Social proof sections
- CTA sections
```

#### Email Sequence

```
Use the Email Sequences skill.

Trigger: [LEAD MAGNET NAME] download
Goal: [CONVERSION GOAL]
Brand voice: Reference voice-profile.md

Write 7-email welcome sequence following:
DELIVER → CONNECT → VALUE → VALUE → BRIDGE → SOFT → DIRECT
```

#### Expert Review Checkpoint

```
Spin up task-based agents to review this:
1. Agency Growth Expert
2. SEO Specialist
3. Conversion Expert
4. [Industry-specific expert]

Each analyzes from their perspective.
Synthesize: Where do they agree? What needs work?
```

## Quick Start Checklist

#### Foundation Setup

* Install VS Code
* Install Claude Code CLI
* Authenticate with Anthropic account
* Set up Perplexity MCP
* Set up Playwright MCP
* Set up Glif MCP (for creative)
* Download Skills Pack
* Test with: "Hey Claude, do you have access to the marketing skills?"

#### Before Each Session

* Create project folder
* Define clear goal for the session
* Gather any existing brand assets/content
* Have reference examples ready (competitors, inspiration)

#### During Each Session

* Start with research (30-60 min minimum)
* Save context as .md files
* Checkpoint with expert review after major outputs
* Iterate without shame—first drafts are starting points
* Stay in flow—ask Claude instead of Googling

#### After Each Session

* Summarize what you built
* Extract content opportunities
* Plan next session
* Ship something—even if imperfect