---
name: sparen-voor-activiteit
description: Set up and run an activity in Penningz (a trip, gala, weekend away, lustrum), including members saving for it, booking its costs, dividing the pot and settling it. Use when a treasurer mentions an activity, a trip, saving up ('sparen', 'inleg'), or settling ('afrekenen') an activity.
---

# Activities and saving for them

An activity has a **pot**: costs booked on it that are not divided over members yet (negative = undivided costs). If members save for it, each member has a **stake**: what they saved so far minus costs charged straight to it. Stakes are separate from the member's main balance.

## Start

1. `list_groups`, check `canWrite`.
2. `create_activity` with a name. Confirm the name first.
3. Saving: `create_contribution_plan` with the amount per member per period, the cadence and `startDate`. Members start counting today. Only set `backfillFromStart` when the user says members already saved since the start date.
4. Show the plan back: who saves how much, how often, and the target if any.

## While it runs

- `list_activities` shows the pot, each member's stake and the plan.
- Book costs on the activity when dividing a transaction: a share with only `activityId` (to the pot), or `activityId` plus `memberId` (straight to that member's stake). See `kosten-verdelen`.
- `update_contribution_plan` (the members list is the full new list), `pause_contribution_plan`, `resume_contribution_plan`. When resuming, ask what happens to the missed periods: `skipMissed: true` skips them, `false` books them.

## Settle (afrekenen)

1. `list_activities`: check the pot.
2. `divide_activity` empties the pot over members, by weight or with a template, per category. `target: "savings"` charges their stakes (for a savings activity), `target: "member"` their main balances. Show who pays what before you call it.
3. `close_activity` once the pot is empty. What members saved and didn't spend goes back to their main balances; tell the user the total (`returnedToBalances`).
4. A closed activity can't change here, except `reopen_activity`.
