---
name: pm-communication-style
description: "Use when the user asks for a status update, leadership summary, project report, escalation note, stakeholder communication, or any concise decision-ready write-up. Also use whenever another PM skill is returning a user-facing report and the output should be short, human, outcome-oriented, and easy to skim on phone."
metadata:
  version: 0.1.0
---

# PM Communication Style

You shape PM communication so it is human, clear, and decision-ready.

Primary goal: make updates readable in under 30 seconds while still carrying enough signal for leaders to act.

When in doubt, optimize for "forwardable in one glance."

## Core Rules

- lead with bottom line up front
- keep tone human and plain language
- prioritize outcomes and obstacles over activity logs
- place the ask near the top, in bold, with owner and due date
- include only decision-ready risks (owner + trigger + mitigation)
- keep it one-screen on phone when possible
- avoid metadata clutter (`confidence`, `audience`, and similar labels) unless the user explicitly asks for them

## Subject Line and Slack First Line

Treat these as equivalent:

- email/doc subject line
- first line of a Slack/chat message

That line must carry:

1. project or initiative name
2. current state and one-line reason
3. explicit ask and deadline

Good pattern:

`Atlas - yellow because security review slipped; need auth path decision by Apr 24`

Avoid empty labels such as:

- "Weekly update"
- "Project status"

## Human Openers

Use a natural opener, then move immediately to BLUF.

Preferred openers:

- "Hi all,"
- "Hi team,"
- "Morning team,"
- "Here is the bottom line:"
- "Short version up front:"

Avoid robotic lead-ins like "Quick weekly readout" unless the user asks for that exact phrase.

## Preferred Human Structure

Use this default structure for status-style communication:

```md
Hi all,

<Project> is <on track / at risk / falling behind>. <One plain-English reason>.
**Need:** <who decides what by when>.

## Status
- <green/yellow/red + one-line reason>

## What matters now
- <1-3 outcome-oriented bullets>

## Active risks
- <risk> - Owner: <name> | Trigger: <condition/date> | Mitigation: <action>

## Sources to drill down
- <link or record>
- <link or record>
```

## Executive Short Form (one-screen)

Use this when leaders want the absolute shortest update:

```md
Hi all,

<Project> is <on track / at risk / falling behind> because <reason>.
**Need:** <decision/action> by <date>.

- Status: <green/yellow/red + reason>
- Moved: <one outcome line>
- Risk: <owner + trigger + mitigation>
- Source: <single best link or record>
```

## Writing Filters

Before returning the message, apply these filters:

- Forwardability test: "Would a VP forward this as-is to another VP?"
- Proof-of-work cut: remove lines that only show process effort and no outcome
- Ask visibility: if the ask is not obvious in the top three lines, rewrite
- Risk quality gate: if owner/trigger/mitigation is missing, move it out of active risk list

## Language and Formatting

- short sentences and short paragraphs
- avoid jargon and passive voice
- bold only a few high-value words or the ask line
- one chart max, and only if it tells the story in two seconds
- call yellow/red early when warranted; do not green-wash
- keep each section useful on its own; remove anything that does not change a decision

## Variants

Use tone variants based on audience while preserving the same structure:

- leadership: fewer bullets, tighter asks, business impact language
- team: one extra line of execution detail is acceptable
- cross-functional: include dependency owner in the ask
- escalation: state impact and deadline in the first two lines

## Status Color Language

Use plain words in narrative lines and keep color signal explicit in the status line.

- `green`: on track with no material blocker
- `yellow`: at risk without action this cycle
- `red`: materially off track or unsafe without immediate intervention

For examples, see `references/README.md` and pick the closest scenario file.
