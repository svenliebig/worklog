# Worklog Template

An Obsidian vault template for a daily worklog: each day gets one note in
`logs/` (named `YYYY-MM-DD.md`), created from `templates/daily.md`. Unchecked
tasks (`- [ ]`) from the previous day are carried over automatically into the
new day's *Übertrag* section.

## Setup

1. **Get a copy and eject it.** Use this repo as a template (or clone it),
   then run:

   ```bash
   ./eject.sh my-worklog
   ```

   This removes the template's git history, the `docs/` folder and the
   script itself, and renames the folder. The folder name **is** the vault name in Obsidian —
   there is no separate setting for it.

2. **Open the vault.** In Obsidian choose *Open folder as vault* and pick the
   folder. When prompted, trust the vault and **enable community plugins** —
   [Templater](https://github.com/SilentVoid13/Templater) ships preinstalled
   and preconfigured in `.obsidian/` and executes the carry-over logic in the
   daily template.

3. **Open today's note.** Command palette (`Cmd/Ctrl+P`) →
   *Daily notes: Open today's daily note*. This opens the note if it exists,
   or creates it from the template (including the carry-over) if it doesn't.
   Assign a hotkey under *Settings → Hotkeys* for one-key access.

Daily-notes folder, template wiring and the Templater trigger are all part of
the committed vault config — there is nothing else to configure.
## Optional setup / improvements
### Open today's note from anywhere
With the *Advanced URI* community plugin, today's note is reachable via
deeplink — from a Raycast quicklink with a global hotkey, a macOS Shortcut,
or a shell alias:

```bash
open "obsidian://adv-uri?vault=my-worklog&daily=true"
```

Full walkthrough: [docs/raycast-daily-note.md](docs/raycast-daily-note.md).

### Nicer fonts

Fonts that work well for this vault:

- [iA Writer Quattro](https://fontsource.org/fonts/ia-writer-quattro) —
  semi-proportional, designed for writing; makes plain markdown look
  structured.
- [IBM Plex Sans](https://fontsource.org/fonts/ibm-plex-sans) — a clean,
  slightly wider alternative for body text and the interface.
- [Cascadia Code](https://fontsource.org/fonts/cascadia-code) — monospace
  with ligatures, for the code/monospace font slot.

To install: download from the links above, unpack, and install only the
**latin `.ttf`** files for the weights you need (400/700 regular and italic
is plenty; 500/600 are used by some themes for headings). The `.woff`/
`.woff2` files and the other script subsets (cyrillic, greek, vietnamese)
are web-only — macOS Font Book won't take them. Then restart Obsidian and
pick the font under *Settings → Appearance → Font*.

## Structure

| Path                  | Purpose                                            |
| --------------------- | -------------------------------------------------- |
| `logs/`               | one note per day (`YYYY-MM-DD.md`)                 |
| `_templates/daily.md` | daily template, including the carry-over script    |
| `docs/`               | optional setup guides (removed on eject)           |
| `.obsidian/`          | vault + plugin config (workspace state is ignored) |
| `eject.sh`            | one-time script to turn the template into a vault  |
