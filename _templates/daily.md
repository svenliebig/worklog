<%*
// find the most recent daily note before this one
const prev = app.vault.getMarkdownFiles()
  .filter(f => f.path.startsWith("logs/") && f.basename < tp.file.title)
  .sort((a, b) => b.basename.localeCompare(a.basename))[0];

let carry = "";
if (prev) {
  const text = await app.vault.read(prev);
  const lines = text.split("\n");
  const start = lines.findIndex(l => /^#\s+Today\s*$/.test(l));
  if (start !== -1) {
    let section = lines.slice(start + 1);
    const end = section.findIndex(l => /^#\s/.test(l));
    if (end !== -1) section = section.slice(0, end);
    carry = section.filter(l => /^\s*- \[ \]/.test(l)).join("\n");
  }
}
-%>
# Everyday
- [ ] Check Mails
- [ ] Review open Pull Requests
- [ ] Merge open Pull Requests
# Today
<% carry %>