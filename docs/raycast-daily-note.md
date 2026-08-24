# Open today's note from anywhere

Goal: today's daily note — created from the template with carry-over if it
doesn't exist yet — one keypress away from anywhere in macOS, without
switching to Obsidian first.

## Prerequisite: Advanced URI

Install and enable the **Advanced URI** community plugin
(*Settings → Community plugins → Browse → "Advanced URI"*). It provides the
open-or-create endpoint used by everything below:

```
obsidian://adv-uri?vault=worklog&daily=true
```

- `vault` is the vault's **folder name** (there is no separate vault name).
  URL-encode spaces as `%20`.
- `daily=true` opens today's note, creating it from the daily template first
  if needed — same behavior as the *"Daily notes: Open today's daily note"*
  command.

## Raycast quicklink

1. Open Raycast and run **Create Quicklink**.
2. Fill in:
   - **Name:** `Today's Worklog`
   - **Link:** `obsidian://adv-uri?vault=worklog&daily=true`
   - **Open with:** Default
3. In *Raycast Settings → Extensions → Quicklinks*, select the quicklink and
   assign:
   - an **alias** (e.g. `today`) — type it in Raycast, hit Enter, or
   - a **global hotkey** (e.g. `⌥⇧D`) — works from any app.

## macOS Shortcut

For triggering via the Shortcuts app (menu bar, Spotlight, Siri):

1. Open **Shortcuts** and create a new shortcut.
2. Add the **Open URLs** action with the `obsidian://adv-uri?...` URL.
3. Optional: in the shortcut's details, enable *Pin in Menu Bar* and/or
   assign a keyboard shortcut under *Run with*.

## Terminal

```bash
open "obsidian://adv-uri?vault=worklog&daily=true"
```

Wrap it in a shell alias (e.g. `alias today='open "obsidian://..."'`) if you
live in the terminal.

## Troubleshooting

- **Nothing happens / vault picker appears** — the vault must have been
  opened in Obsidian at least once on this machine, and the vault name in
  the URL must match the folder name exactly. If you renamed the vault
  (e.g. via `eject.sh`), update the quicklink/shortcut.
- **Note opens but is empty** — Advanced URI creates the note via the core
  Daily Notes plugin; check that its template setting points to
  `_templates/daily.md` and that Templater is enabled.
