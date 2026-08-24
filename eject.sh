#!/usr/bin/env bash
set -euo pipefail

# Turns this template into your personal vault:
#   - removes the template's git history
#   - optionally renames the vault folder (in Obsidian, the folder name IS the
#     vault name — there is no separate setting)
#   - removes this script
#
# Usage: ./eject.sh [vault-name]

VAULT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$VAULT_DIR")"
NEW_NAME="${1:-}"

if [[ -n "$NEW_NAME" && -e "$PARENT_DIR/$NEW_NAME" ]]; then
  echo "error: $PARENT_DIR/$NEW_NAME already exists — pick another name" >&2
  exit 1
fi

read -r -p "Eject '$(basename "$VAULT_DIR")' (removes git history)? [y/N] " answer
[[ "$answer" == [yY]* ]] || exit 1

rm -rf "$VAULT_DIR/.git"
rm -f "$VAULT_DIR/eject.sh"

if [[ -n "$NEW_NAME" ]]; then
  mv "$VAULT_DIR" "$PARENT_DIR/$NEW_NAME"
  VAULT_DIR="$PARENT_DIR/$NEW_NAME"
fi

echo "Done. Open it in Obsidian via 'Open folder as vault':"
echo "  $VAULT_DIR"
echo "Vault name (= folder name): $(basename "$VAULT_DIR")"
echo "Tip: delete any sample notes in logs/ and run 'git init' if you want to version your worklog."
