# Send timing

Read by the plan step when assigning each email a send day and time, and when deciding how many value emails come before the pitch.

## Timing by sequence Format

| Sequence | Frequency | Notes |
|----------|-----------|-------|
| Welcome | Days 0, 2, 4, 6, 8, 10, 12 | Front-load value |
| Nurture | Weekly or 2x/week | Consistent rhythm |
| Conversion | Every 2 days | Enough touch without annoying |
| Launch | Daily or every other day | Intensity justified by deadline |
| Re-engagement | Days 0, 3, 7, 10 | Give time to respond |

## Best send times by audience type

**B2B audiences (SaaS, agencies, professional services):**
- Best days: Tuesday, Wednesday, Thursday
- Best times: 9:00-10:30 AM recipient's timezone
- Avoid: Monday before 10 AM (inbox clearing), Friday after 2 PM (mentally gone)
- Second window: 1:00-2:00 PM (post-lunch scan)

**B2C audiences (consumers, creators, freelancers):**
- Best days: Tuesday, Wednesday, Thursday
- Best times: 7:00-9:00 AM (morning routine) or 7:00-9:00 PM (evening wind-down)
- Avoid: Monday morning, Saturday (varies by niche)
- Weekend exception: Lifestyle, hobby, and wellness niches can send Saturday 9-11 AM

**Creator/solopreneur audiences:**
- Best days: Tuesday, Wednesday
- Best times: 7:00-8:30 AM (before deep work starts)
- They check email in bursts, not continuously
- Shorter emails perform better for this segment

**Ecommerce audiences:**
- Best days: Thursday, Friday (pre-weekend shopping), Sunday (browse mode)
- Best times: 10:00 AM or 8:00 PM
- Cart abandonment: Send within 1 hour, then 24 hours, then 72 hours

## Specific timing for each email

Assign a specific send day and time to each email based on:

1. **Audience type** from `./brand/audience.md` (or ask if not available)
2. **Sequence Format** (welcome sequences are daily/every-other-day; nurture is weekly)
3. **Price point** (higher price = more value emails before pitch)
4. **Learnings data** from `./brand/learnings.md` (if send time performance data exists, use it)

Output timing in the format `Day {N}, {Day of Week} at {time} {timezone}`.

Example: `Day 0, Tuesday at 9:00 AM ET` or `Day 2, Thursday at 7:30 AM PT`

If timezone is unknown, output in the user's local timezone with a note to adjust for their audience.

## When to start selling

- Low price (<$100): After 3-5 value emails
- Medium price ($100-500): After 5-7 value emails
- High price (>$500): After 7-10 value emails or sales call

Trust required scales with price.
