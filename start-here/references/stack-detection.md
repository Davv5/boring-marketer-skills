# Stack detection

Read this at the Load and scan step, to fill the Marketing Stack section of the project scan. It maps `.env` variable names and running MCP servers to the tools and skills they enable. The order for using a tool (MCP, then API key, then importable files, then ask) and the `stack.md` template are in `_system/brand-memory.md` §Stack and tools.

## Check `.env`

Scan `.env` (if it exists) for these variable names, reading names only:

| Variable | Tool |
|----------|------|
| `REPLICATE_API_TOKEN` | Replicate (image + video generation) |
| `MAILCHIMP_API_KEY` | Mailchimp (email automation) |
| `CONVERTKIT_API_KEY` | ConvertKit (email automation) |
| `HUBSPOT_API_KEY` | HubSpot (CRM + email) |
| `BEEHIIV_API_KEY` | Beehiiv (newsletter platform) |
| `GA4_MEASUREMENT_ID` | Google Analytics 4 |
| `POSTHOG_API_KEY` | PostHog (product analytics) |
| `BUFFER_ACCESS_TOKEN` | Buffer (social scheduling) |
| `OPENAI_API_KEY` | OpenAI (fallback generation) |
| `ANTHROPIC_API_KEY` | Anthropic (if external calls needed) |

## Check MCP servers

Detect the running MCP servers and note what each enhances:

| Server | Provides | Enhances |
|--------|----------|----------|
| playwright | Browser automation, screenshots | /brand-voice (scrape website), /positioning-angles (screenshot competitors) |
| firecrawl | Web scraping, content extraction | /brand-voice (extract copy), /positioning-angles (scrape competitor sites), /keyword-research (SERP analysis) |
| hubspot | CRM, email, contacts | /email-sequences (deploy automations), /lead-magnet (create forms) |
| zapier | Cross-tool automation | All skills (trigger workflows) |
| replicate | AI model generation | /creative (all modes) |

Record the detected MCP servers in `./brand/stack.md` under its MCP Servers section.

Done when every variable and server above is marked connected or missing, and the Tool detection status lines in [`output-templates.md`](output-templates.md) match.
