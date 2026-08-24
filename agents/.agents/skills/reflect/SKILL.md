---
name: reflect
description: Explicitly reflect on the active task and propose durable improvements to tests, scripts, AGENTS.md, or skills. Use only when the user invokes reflect.
---

# Reflect

Use only the active conversation, current diff, test results, and relevant git history. Do not scan unrelated task or chat histories.

1. Identify corrections, dead ends, repeated friction, and decisions that materially affected the outcome.
2. Keep a lesson only when it would change a future decision. Treat a single unusual incident as evidence to investigate, not a universal rule.
3. Prefer enforcement in a test, lint, script, type, or runtime check. Use `AGENTS.md` or a skill when judgment is required and structural enforcement would not work.
4. Name the exact target, proposed change, evidence, and future trigger for every proposal. Reject duplicates and instructions the agent already follows by default.
5. Present the proposals and wait for approval. Do not edit files, file backlog items, or send messages before the user chooses what to apply.

After approval, edit the tracked source of global instructions or skills. In this setup that is normally `$HOME/codebase/dotfiles`, not the installed symlink under `$HOME/.agents` or `$HOME/.claude`.
