# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

@AGENTS.md

## Personal Preferences

When running the code review skill (`/code-review`), ask me before filtering out issues with low scores.

Always include tests for important new features and important behavior changes.

Fix lint warnings properly — do not suppress them with inline disable comments.

MANDATORY: In TypeScript projects, you MUST run the linter on all changed `.ts`/`.tsx` files and fix all errors BEFORE creating any git commit. Never commit without linting first — no exceptions.

Never log secrets (tokens, API keys, passwords, cookies) — always redact them in logs and visibility reports.
