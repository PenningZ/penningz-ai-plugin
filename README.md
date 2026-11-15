# Penningz AI plugin

The official Penningz plugin for Claude and ChatGPT. [Penningz](https://www.penningz.nl) is the shared bookkeeping app for Dutch student groups and clubs. This repository holds the skills that teach an AI assistant how a treasurer works in Penningz, on top of the Penningz connector at `https://www.penningz.nl/mcp`.

## Layout

```
.claude-plugin/marketplace.json   This repo is also a Claude Code marketplace
plugins/penningz/                 The Claude plugin (submitted to the Claude directory)
  .claude-plugin/plugin.json
  .mcp.json                       Points at the Penningz connector
  skills/                         Treasurer workflows, shared with ChatGPT
  commands/                       Slash commands
chatgpt/                          ChatGPT manifest, mcp.json and icons
scripts/build-chatgpt.sh          Builds dist/penningz-chatgpt.zip from chatgpt/ + the shared skills
```

## Install

- **Claude (web, desktop, mobile):** from the Claude directory once it is listed. Before that: zip `plugins/penningz` and upload it under Customize > Plugins.
- **Claude Code:** `/plugin install penningz --marketplace PenningZ/penningz-ai-plugin`.
- **ChatGPT:** from the ChatGPT directory once it is listed.

## Develop

```bash
claude plugin validate ./plugins/penningz   # structure checks
claude --plugin-dir ./plugins/penningz      # try it in Claude Code
./scripts/build-chatgpt.sh                  # ChatGPT ZIP in dist/
```

Raise `version` in both `plugins/penningz/.claude-plugin/plugin.json` and `chatgpt/plugin.json` on every release; the build script refuses a mismatch. Skills name the connector's tools exactly, so a renamed tool needs a skill change in the same release.

## License

MIT
