---
description: Who owes the group money, and how much (wie moet nog betalen)
argument-hint: "[group name]"
---

Show who still owes money to my Penningz group $ARGUMENTS.

1. Call `list_groups`. If I'm in several groups and none is named above, ask which one.
2. Call `get_member_balances`.
3. List the members with a negative balance, largest debt first, with the amount in euros (€ 12,50). Leave out inactive members unless they owe money; mark them if so.
4. Add one line with the total owed and one with the total credit of members with a positive balance.
5. Offer a short, friendly message I can paste into the group chat. No IBANs or e-mail addresses.

Answer in the language I write in.
