# ESP detection and platform handoff

Read by the ESP step, before any email is written. It decides whether the run offers to build the automation in a connected platform or takes the Fallback: copy-paste-ready files.

## Detection order

1. **Check `./brand/stack.md`** (if exists): look for ESP entries in the Connected Tools table.
2. **Check `.env`**: scan for these environment variables:
   - `MAILCHIMP_API_KEY` or `MAILCHIMP_SERVER_PREFIX`: Mailchimp
   - `CONVERTKIT_API_KEY` or `CONVERTKIT_API_SECRET`: ConvertKit
   - `HUBSPOT_API_KEY` or `HUBSPOT_ACCESS_TOKEN`: HubSpot
   - `SENDGRID_API_KEY`: SendGrid
   - `ACTIVECAMPAIGN_API_KEY`: ActiveCampaign
3. **Check for MCP servers**: query available MCP tools for email-related capabilities.

## ESP detected

Report the platform and list size when queryable, then offer the choice:

```markdown
✓ Mailchimp connected (API key found). List size: {N, if queryable}

I can create this automation directly in Mailchimp. Want me to set it up, or output copy-paste-ready files?

1. "Set it up": create the automation via API
2. "Just the copy": output as markdown files
```

If the user chooses "Set it up", generate the copy first, then create the automation through the platform API. Generate the local .md files in both cases: they are the source of truth.

## No ESP detected (Fallback)

```markdown
✗ No ESP connected (Mailchimp, ConvertKit, HubSpot: not found)

Outputting in copy-paste-ready format. Each email is saved as a separate .md file you can paste into any email platform.

→ To connect an ESP, add your API key to .env and run /start-here to configure.
```
