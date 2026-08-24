---
name: why
description: Investigate why code or behavior has its current shape using git history and GitHub evidence. Use for design rationale, prior decisions, historical regressions, and thresholds; use how for current runtime behavior and bug diagnosis.
---

# Why

Reconstruct intent from evidence. Code proves what exists, not why it was chosen.

1. Orient in the current implementation so the search uses the real symbols and terminology.
2. Search local history with `git log`, path history, pickaxe searches, and blame around the relevant lines.
3. When the repository has a GitHub remote and `gh` is authenticated, inspect linked or searchable pull requests and issues. Prefer the decision record closest to the change.
4. Query another source through `mcp-s-cli` only when the user names it or the collected evidence points to a specific document, ticket, chat, incident, or dashboard. Do not enumerate every available source by default.
5. Compare the sources. Record contradictions, missing records, and plausible alternatives before concluding.

Cite file lines and direct source URLs. Label conclusions as established, supported, or inferred. Report where you looked when the record is incomplete. Never turn implementation shape alone into an author-intent claim.
