---
name: saldocontrole-uitleggen
description: Explain why the money on a Penningz group's bank accounts differs from the sum of the member balances (the 'saldocontrole'), and fix what can be fixed. Use when a treasurer asks why the numbers don't match, 'waarom klopt het saldo niet', or about the saldocontrole.
---

# Explaining the saldocontrole

The bank holds the group's money. Members' balances say who owes what. The two differ for known reasons, and Penningz splits the difference into named parts that add up exactly.

## Steps

1. `list_groups`, pick the group. The saldocontrole is for treasurers only.
2. `get_reconciliation` without arguments: the totals and every part with its amount and count.
3. For each part that is not 0, explain it in one plain sentence. Then call `get_reconciliation` with `difference` set to that part to see the rows behind it (largest first), when the user wants detail.

## The parts

| Part | What it means | What to do |
|---|---|---|
| `undistributed` | Bank transactions not (fully) divided yet | Divide them (`kosten-verdelen`) |
| `overDistributed` | Transactions divided for more than their amount, or the wrong way round | Check and fix their splits with `get_transaction` and `update_split` |
| `pots` | Money on activity and turflijst pots not divided over members yet | Normal while an activity runs; divide it when it is done |
| `startBalances` | Bank balance on the start date minus the members' opening balances | 0 when the opening balances match the bank; otherwise fix them in Penningz |
| `transfers` | Transfers between own accounts that don't cancel out, e.g. an account that isn't linked | Link the other account in Penningz, or mark the transfer |
| `noAccount`, `entryWithoutTransaction`, `entryOnTransfer`, `unbalancedEntry` | Old data that can no longer arise | Mention it; fixing it is done in Penningz or by Penningz support |

## Tone

Many treasurers took over messy books. Be calm and concrete: "€ 84,20 is nog niet verdeeld, dat zijn 6 transacties. Zal ik een voorstel maken?" Offer to fix the parts you can fix here, and point to penningz.nl for the rest.
