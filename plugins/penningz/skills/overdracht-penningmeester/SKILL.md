---
name: overdracht-penningmeester
description: Prepare a handover for a new treasurer of a Penningz group, or help a new treasurer understand the group's finances. Use when someone takes over as penningmeester, asks for a 'overdracht' or 'overdrachtsdocument', or says they are new and want to know how the group's money is organised.
---

# Treasurer handover

Produce one clear document the old and new treasurer can go through together. Read only; change nothing unless asked.

## Gather

1. `list_groups`, pick the group.
2. `get_group_overview`: bank accounts, balances, bank connection status, categories, open activities, amount "nog te verdelen".
3. `get_member_balances`: who owes the group, who has credit, inactive members.
4. `list_templates`: how costs are usually divided.
5. `list_activities` (also `includeClosed: true` for the past year) and their savings plans.
6. `list_expense_claims`: claims still pending.
7. `list_tally_lists`: turflijsten and their last settlements.
8. `get_reconciliation` (treasurers only): does the bank match the members?
9. `summarize_transactions` with `groupBy: "category_month"` over the last 12 months: the yearly rhythm of costs.

## Write

Headings in the user's language (usually Dutch):

1. **Rekeningen**: each account, balance, bank link status and when it expires.
2. **Leden**: totals of what is owed and credited; the members with the largest negative balance.
3. **Hoe we verdelen**: the templates and what they are for; the main categories.
4. **Lopende zaken**: open activities with pots and savings plans, pending declaraties, turflijsten, amount "nog te verdelen".
5. **Saldocontrole**: the difference and its parts, in plain words.
6. **Het jaar in cijfers**: spending per category, and the busy months.
7. **Te doen voor de overdracht**: a short checklist (divide what is open, handle claims, renew the bank link, give the new treasurer rights in Penningz).

No IBANs, e-mail addresses or other contact details in the document. Granting treasurer rights is done in Penningz, not here.
