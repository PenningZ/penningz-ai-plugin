---
name: maandafsluiting
description: Close a month or period in a Penningz group, step by step. Use when a treasurer wants to get the books up to date, asks what still needs doing, wants to 'de maand afsluiten' or 'de boekhouding bijwerken', or prepares an update for the group.
---

# Closing the month in Penningz

Goal: every transaction divided, claims handled, the saldocontrole explained, and a short update the treasurer can send to the group. Work in this order and tell the user where you are. Ask before every change.

## 1. Where do we stand

1. `list_groups`, pick the group, check `canWrite`. Without it you can still report, but not change anything.
2. `get_group_overview`: bank accounts and their last sync, the amount "nog te verdelen", open activities.
3. A bank connection that is expired or about to expire: offer `renew_bank_connection`. Penningz only gets transactions from the bank, so an expired link means missing transactions. No tool adds a transaction by hand.

## 2. Divide what is open

1. `list_transactions` with `onlyNotYetDivided: true` and the period (`from`, `to`).
2. Group them by kind (supermarket, rent, bar, trip). For each group, find a template with `list_templates`.
3. Propose the division with `preview_split_transactions` and show it. Book it with `split_transactions` (`dryRun: false`) after the user agrees. Follow the `kosten-verdelen` skill: never guess who joined.
4. Transfers between the group's own accounts: mark them with `update_transactions` instead of dividing them.

## 3. Expense claims

`list_expense_claims`: handle the pending ones with the `declaraties-afhandelen` skill.

## 4. Activities and turflijsten

- `list_activities`: a pot with undivided costs on an activity that is over can be divided with `divide_activity` and settled with `close_activity` (see `sparen-voor-activiteit`).
- `list_tally_lists`: report pots with stock not yet charged. Settling a turflijst happens in Penningz, not here.

## 5. Saldocontrole

`get_reconciliation`. Explain each part that is not 0 in plain words (see `saldocontrole-uitleggen`). After steps 2 to 4, "undistributed" should be close to 0.

## 6. The update for the group

- `summarize_transactions` with `groupBy: "category"` for the period: where the money went.
- `get_member_balances`: who owes the group (negative) and who has credit (positive). Inactive members are marked.
- Write a short message in the group's language (usually Dutch), ready to paste into the group chat: total spent per category, members who should pay with their amount, and anything still open. No IBANs, no e-mail addresses.
