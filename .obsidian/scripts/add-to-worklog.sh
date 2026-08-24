#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Add to Worklog
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📝
# @raycast.packageName Worklog
# @raycast.argument1 { "type": "text", "placeholder": "Text" }
# @raycast.argument2 { "type": "text", "placeholder": "URL (optional)", "optional": true }

# Documentation:
# @raycast.description Append a task (optionally with a link) to today's daily worklog. Creates the note from the template if it doesn't exist.
# @raycast.author Sven Liebig

# The vault name IS the vault's folder name (there is no separate setting).
# Derive it from this script's real location (<vault>/.obsidian/scripts/),
# resolving symlinks so a symlinked CLI shortcut still finds the vault.
SCRIPT_PATH="$(readlink -f "${BASH_SOURCE[0]}")"
VAULT="$(basename "$(cd "$(dirname "$SCRIPT_PATH")/../.." && pwd)")"

TEXT="$1"
URL="$2"

if [ -n "$URL" ]; then
  LINE="- [ ] [$TEXT]($URL)"
else
  LINE="- [ ] $TEXT"
fi

urlencode() { V="$1" node -p 'encodeURIComponent(process.env.V)'; }

# openmode=silent writes without opening the note; open -g keeps Obsidian in the background
open -g "obsidian://adv-uri?vault=$(urlencode "$VAULT")&daily=true&heading=Today&mode=append&data=$(urlencode "$LINE")&openmode=silent"

echo "Added to today's worklog: $LINE"
