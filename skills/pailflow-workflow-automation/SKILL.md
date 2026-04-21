---
name: pailflow-workflow-automation
description: Handle Slack-driven recurring automations for PailFlow. Use this whenever the user wants something sent on a schedule, asks for a recurring report or reminder, says things like daily, weekly, every Monday, every month, recurring, automate this, remind me every, send me every, or wants to delete/check an existing recurring automation in natural language. This skill should also trigger for list/read/delete requests about existing automations, even if the user does not use the word automation.
metadata:
  version: 0.1.0
---

# PailFlow Workflow Automation

Create, inspect, and delete Slack-driven recurring automations for PailFlow.

This skill owns the conversation. The gateway should stay simple: the sandbox figures out intent, gathers missing details, confirms the final plan, and calls the automation API.

## Product Rules

- Treat the user's incoming Slack message like any normal request. Do not invent special gateway routing behavior.
- Use the gateway automation API. Do not try to call Inngest directly from the sandbox.
- V1 supports `create`, `list`, `read`, and `delete` only.
- V1 does not support update, pause, or resume. If the user wants to change an automation, tell them the v1 path is delete and recreate.
- Default delivery destination is a DM to the requester.
- Channel delivery is allowed only when the user explicitly chooses a channel.
- Default timezone from Slack requester context when available, then confirm it with the user before creating the automation.
- Preserve both the raw user request and the resolved automation prompt.
- Scheduled runs execute in a fresh sandbox. Do not imply reuse of an existing interactive sandbox.
- Keep all list/read/delete behavior scoped to the current requester's account context. Do not expose automations from other accounts.

## When To Use This Skill

Use this skill when the user asks for any of the following:

- a recurring report
- a recurring summary, digest, or reminder
- something that should happen every day, every week, every month, or on a weekday/time
- something to be delivered later on a schedule
- a request to list, check, inspect, or delete an existing recurring automation

Typical examples:

- "Every Monday at 6 AM send me a budget debrief"
- "Give me a daily project summary"
- "Send this report every Friday morning"
- "What automations do I have set up?"
- "Delete my weekly budget report"

## Required Inputs Before Create

Do not create anything until you have all of the following:

1. A schedule or cadence
2. A timezone
3. A delivery destination
4. A clear execution prompt for what should happen on each run

## Defaulting Rules

### Timezone

- First look for the Slack requester's timezone in available context.
- If you find one, say it back and confirm it before create.
- If you cannot find one, ask for it.

Good pattern:

"I found your timezone as `America/New_York`. Should I use that for this automation?"

### Destination

- If the user does not specify a destination, default to DM.
- If the user wants channel delivery, collect the target channel before create.
- If the user says "this channel," preserve that destination explicitly rather than assuming DM.

## Create Workflow

Follow this sequence:

1. Detect recurring intent.
2. Extract any schedule details already present.
3. Resolve timezone from Slack requester context if available.
4. Resolve destination:
   - default to requester DM
   - switch to channel only if explicitly requested
5. Ask follow-up questions for anything missing.
6. Build the resolved automation prompt that should run in the future.
7. Confirm the final setup in plain language, including the exact execution prompt that will run later.
8. Call the automation create endpoint.
9. Return a concise confirmation message to the user.

## Create Confirmation Format

Before calling create, confirm the final plan clearly.

Use a format like:

```text
I can create this automation:
- Schedule: Every Monday at 6:00 AM
- Timezone: America/New_York
- Destination: DM to you
- Task: Send a budget debrief
- Execution prompt: Generate a budget debrief for the current account and send a concise Slack-ready summary with risks, budget drift, and next actions.

Should I create it?
```

Do not skip the execution-prompt line during confirmation. The user should see the exact future-run intent before you create the automation.

## Create Payload Requirements

When calling `POST /v1/automations`, include or derive the following:

- `account_id`
- `creator_user_id` when available
- `requester_slack_user_id`
- `requester_slack_team_id` when available
- `user_request_text`
- `automation_prompt`
- `schedule_natural_language`
- `schedule_normalized`
- `timezone`
- `delivery.type`
- `delivery.destination_ref`

Preserve the user's original wording in `user_request_text`. Put the cleaned-up execution instructions in `automation_prompt`.

### Prompt Construction Rule

- `user_request_text` should preserve the user's original ask as closely as possible.
- `automation_prompt` should be the resolved future-run instruction set.
- Before create, show the resolved prompt back to the user in plain language and get explicit confirmation.

## List Workflow

Use list when the user asks what automations exist, wants help finding one, or is about to delete one.

Follow this sequence:

1. Call `GET /v1/automations` for the current account scope.
2. Summarize the results in plain language.
3. If the user seems to mean one specific automation, offer the matching options clearly.

Example:

```text
I found 2 matching automations:
1. Every Monday at 6:00 AM, DM budget debrief
2. Every Friday at 9:00 AM, post project summary in #delivery

Which one should I use?
```

## Read Workflow

Use read when the user wants details about a specific automation or when you need to disambiguate before delete.

Follow this sequence:

1. Call `GET /v1/automations/:id` for the chosen automation.
2. Present the schedule, timezone, destination, and task in plain language.
3. If this is part of a delete flow, ask for explicit confirmation before deletion.

## Delete Workflow

V1 delete should feel natural-language-first, but still safe.

Follow this sequence:

1. Interpret the user's delete intent.
2. List likely matches if the target is not already unambiguous.
3. Read the selected automation if needed, especially when multiple candidates are close or you need to restate the exact schedule, timezone, destination, and task.
4. Confirm the exact automation to delete.
5. Call `DELETE /v1/automations/:id`.
6. Return a short confirmation message.

Never delete on a vague guess.

Good pattern:

```text
I think you mean this automation:
- Every Monday at 6:00 AM
- Timezone: America/New_York
- Destination: DM to you
- Task: Budget debrief

Should I delete it?
```

Delete safety rule:

- If the user names an automation vaguely, list first.
- If there is still ambiguity, read the best candidate and restate it.
- Only call delete after explicit user confirmation.

## Handling Ambiguity

### Missing schedule details

Ask a follow-up question.

Examples:

- "What day and time should this run?"
- "Should this be daily, weekly, or monthly?"

### Missing timezone

- Use Slack requester timezone if available.
- Otherwise ask directly.

### Missing destination

- If unspecified, tell the user you will default to DM.
- If they want channel delivery, ask for the channel.

### User asks to edit an existing automation

Explain the v1 limitation plainly:

```text
I can't edit an existing automation yet. In v1, the clean path is to delete the old automation and create a new one. If you want, I can help you do that.
```

### User asks about automations from another account

Do not attempt cross-account lookup. Stay within the current request/account context.

## Slack Delivery Rules

- Default to DM when destination is omitted.
- Support explicit channel delivery.
- Do not promise group DM support in v1.

## Output Style

- Be crisp and operational.
- Ask only for missing information.
- Confirm the final automation before create.
- Confirm the exact automation before delete.
- When listing automations, make them easy to scan and compare.

## API Surface

Use these endpoints:

- `POST /v1/automations`
- `GET /v1/automations`
- `GET /v1/automations/:id`
- `DELETE /v1/automations/:id`

Do not invent unsupported endpoints for update, pause, or resume.

## Example Create Outcome

User:

```text
Every Monday at 6 AM send me a budget debrief.
```

Skill behavior:

1. Detect recurring intent.
2. Resolve Slack timezone if available.
3. Confirm timezone.
4. Default destination to DM unless the user wants a channel.
5. Confirm the final setup, including the exact execution prompt that will run on each future occurrence.
6. Create the automation.

Example confirmation:

```text
I can create this automation:
- Schedule: Every Monday at 6:00 AM
- Timezone: America/New_York
- Destination: DM to you
- Task: Budget debrief
- Execution prompt: Generate a budget debrief for the current account, highlight budget drift and delivery risks, and format it as a concise Slack update.

Should I create it?
```

## Example Delete Outcome

User:

```text
Delete my weekly budget debrief.
```

Skill behavior:

1. List matching automations.
2. Identify the likely match.
3. Read the candidate when needed to restate the exact schedule, timezone, destination, and task.
4. Confirm it with the user.
5. Delete only after confirmation.
