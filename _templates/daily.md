<%*
// find the most recent daily note before this one
const prev = app.vault.getMarkdownFiles()
  .filter(f => f.path.startsWith("logs/") && f.basename < tp.file.title)
  .sort((a, b) => b.basename.localeCompare(a.basename))[0];

let carry = "";
if (prev) {
  const text = await app.vault.read(prev);
  carry = text.split("\n").filter(l => /^\s*- \[ \]/.test(l)).join("\n");
}
-%>
# Everyday
- [ ] Check Mails
- [ ] Review open Pull Requests
- [ ] Merge open Pull Requests
# Today
<% carry %>
## Notizen