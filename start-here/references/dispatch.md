# Dispatch

Read this at the Dispatch step, whenever `/start-here` invokes another skill. It holds the invocation protocol, the handoff format, what a skill hands back, and the session tracking that spans a multi-step run.

## What a dispatch carries

Invoke the target skill by name (`/email-sequences`) and pass two things:

1. **A pointer** to the output the skill should write or the campaign it belongs to.
2. **Session-only facts**: what exists only in this conversation and in no brand file, such as the user's stated goal, the business sentence, a URL they mentioned, a chosen campaign name, and the outputs of earlier steps in the chain (magnet title and hook, landing page headline, chosen angle).

The skill loads its own brand context from its Reads list, applying the freshness rules in `_system/brand-memory.md` §Read, so the same stale-file flags appear whether the user ran the skill directly or through `/start-here`. The dispatch contains the slice the task needs and nothing else.

Why a slice works better than everything: excess context dilutes a skill's focus (a copywriting skill drowning in keyword data writes unfocused copy); contradictory context ("be playful" beside "be authoritative", with no priority) yields inconsistent output; stale context is misleading; and a large volume makes the model summarize instead of using the specific data points that make output sharp. Pass the two things above and let the skill's Reads list do the rest.

## The handoff block

Structure each handoff as a block. The example shows a welcome sequence after a lead magnet: it carries the session-only facts and the pointer, with brand-file contents left to the skill.

```yaml
handoff:
  from: /start-here
  to: /email-sequences
  session_facts:
    business: "Online course teaching freelancers cold email"
    goal: "Welcome sequence for lead magnet subscribers"
    lead_magnet:
      title: "The Cold Email Kit"
      hook: "3 templates that booked $14k last month"
      format: "PDF toolkit"
    landing_page_headline: "{from the previous step}"
  campaign:
    name: "cold-email-kit-welcome"
    sequence_type: "welcome"
    emails_requested: 7
  expected_output:
    files: ["./campaigns/cold-email-kit-welcome/emails/"]
  return_to: /start-here
```

For a first-run dispatch the same block carries the business sentence, goal and URL (see [`first-run.md`](first-run.md) §3).

## Invocation

**Claude Code.** Dispatch with the Task tool. Run independent skills as parallel task agents and dependent skills sequentially.

- Parallel (brand foundation): task agent 1 invokes `/brand-voice` and task agent 2 invokes `/positioning-angles`, each with its handoff block. Wait for both.
- Sequential (lead funnel): `/lead-magnet`, wait and read its output; `/direct-response-copy` with the magnet title, hook and key benefit; `/email-sequences` with the magnet details and the landing page headline; `/content-atomizer` with the magnet title, key benefit and landing page URL. Wait for each before the next.

**Claude Desktop (no task agents).** Run the skills sequentially and say so: "Running sequentially. On Claude Code, these would run in parallel for faster results." Everything else is unchanged.

## After each skill completes

1. Verify the expected output files were written.
2. When the skill wrote a ./brand/ profile file, confirm it exists.
3. Confirm the asset is registered in `./brand/assets.md` per `_system/brand-memory.md` §Write, and add it with Status `draft` if the skill did not.
4. Report completion status to the user.

A skill returns control with this completion block:

```yaml
completion:
  from: /{skill-name}
  status: complete
  files_written:
    - path: "./path/to/file.md"
      type: "{profile|asset|campaign}"
  assets_added:
    - name: "{asset-name}"
      type: "{asset-type}"
      campaign: "{campaign-name}"
  learnings:
    - "{any new learning from this run}"
  suggested_next:
    - skill: "/{next-skill}"
      reason: "{why this is logical next}"
```

Done when the files are verified, the asset is registered, and the user has the completion status.

## Session memory

Within one conversation, track:

1. **Skills invoked**: what has already run.
2. **Files written**: the cumulative list of files created or updated.
3. **User corrections**: each "no, actually..." or redirect, applied to later dispatches.
4. **Pending workflow steps**: for a multi-step workflow, which steps are complete and which remain.

When the user stops or says they are done, present the Session summary from [`output-templates.md`](output-templates.md), including a recommended pickup for the next session.

## Workflow feedback

After a whole workflow (a workflow, not each skill in it), follow `_system/brand-memory.md` §Feedback and log to `./brand/learnings.md`. If the user answers later, they can run `/start-here` again and say how it went.
