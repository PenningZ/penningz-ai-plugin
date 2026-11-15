#!/usr/bin/env bash
# Builds the ChatGPT plugin ZIP from the same skills as the Claude plugin.
# Output: dist/penningz-chatgpt.zip with plugin.json, mcp.json, skills/ and assets/ at its root.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
build="$root/dist/chatgpt"
out="$root/dist/penningz-chatgpt.zip"

claude_version="$(sed -n 's/.*"version": *"\([^"]*\)".*/\1/p' "$root/plugins/penningz/.claude-plugin/plugin.json" | head -1)"
chatgpt_version="$(sed -n 's/^  "version": *"\([^"]*\)".*/\1/p' "$root/chatgpt/plugin.json" | head -1)"
if [ "$claude_version" != "$chatgpt_version" ]; then
  echo "Version mismatch: Claude plugin $claude_version, ChatGPT plugin $chatgpt_version" >&2
  exit 1
fi

if grep -q '"TODO' "$root/chatgpt/plugin.json"; then
  echo "Warning: chatgpt/plugin.json still has TODO values; fill them before submitting." >&2
fi

rm -rf "$build" "$out"
mkdir -p "$build"
cp "$root/chatgpt/plugin.json" "$root/chatgpt/mcp.json" "$build/"
cp -R "$root/chatgpt/assets" "$build/assets"
cp -R "$root/plugins/penningz/skills" "$build/skills"
find "$build" -name '.DS_Store' -delete

(cd "$build" && zip -qr -X -D "$out" .)
echo "Built $out"
