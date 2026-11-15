# Penningz for Claude

Penningz is the shared bookkeeping app for Dutch student groups and clubs: jaarclubs, disputen, studentenhuizen and commissies. The group's bank account is linked, every transaction is divided over the members, and everyone sees what they owe.

This plugin teaches Claude how a treasurer ("penningmeester") works in Penningz. It uses the Penningz connector (`https://www.penningz.nl/mcp`) and adds workflows on top of its tools.

## Skills

| Skill | What it does |
|---|---|
| `maandafsluiting` | Close the month: divide open transactions, handle claims, check the saldocontrole and write an update for the group |
| `kosten-verdelen` | Divide one or many bank transactions over members, activities or savings, with templates and a proposal before anything is booked |
| `declaraties-afhandelen` | Review expense claims against their receipts, then approve or reject them |
| `saldocontrole-uitleggen` | Explain why the bank and the member balances differ, part by part |
| `sparen-voor-activiteit` | Run an activity: savings plans, costs, dividing the pot and settling |
| `overdracht-penningmeester` | A handover document for a new treasurer |

## Commands

- `/penningz:wie-moet-betalen`: who owes the group money
- `/penningz:maandoverzicht`: a monthly overview

## Getting started

1. You need a Penningz account and a group: [penningz.nl](https://www.penningz.nl).
2. Install this plugin (in Claude Code: `/plugin install penningz --marketplace PenningZ/penningz-ai-plugin`) and connect the Penningz connector when Claude asks. You sign in with your Penningz account and approve access.
3. Ask something like "Wat sta ik?" or "Verdeel de boodschappen van deze week over het huis".

Claude can read your groups. It can only change things (divide transactions, categories, activities, expense claims) when you are a treasurer and your group allows changes through connected apps in its settings. Claude never transfers money and never sees IBANs or e-mail addresses of other members. Every change is logged in Penningz.

## Privacy and support

- Privacy policy: [penningz.nl/privacy](https://www.penningz.nl/privacy)
- Terms: [penningz.nl/tos](https://www.penningz.nl/tos)
- How it works: [penningz.nl/ai-assistent](https://www.penningz.nl/ai-assistent)
- Support: [penningz.nl/contact](https://www.penningz.nl/contact)

## License

MIT, see [LICENSE](LICENSE).
