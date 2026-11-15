---
description: Monthly overview of a Penningz group (maandoverzicht)
argument-hint: "[month, e.g. oktober] [group name]"
---

Make a monthly overview of my Penningz group for: $ARGUMENTS. Without a month, use the previous calendar month.

1. Call `list_groups`; ask which group if it isn't clear.
2. `summarize_transactions` with `groupBy: "category"` and `from`/`to` for that month: income and expenses per category.
3. `get_group_overview`: the amount still "nog te verdelen" and the state of the bank connection.
4. `get_member_balances`: who owes the group most.
5. Write the overview: total in and out, the top categories with amounts, what is still open (undivided transactions, pending declaraties if `list_expense_claims` shows any), and the members who should pay.

Change nothing. If there is open work, offer to start the `maandafsluiting` workflow. Answer in the language I write in.
