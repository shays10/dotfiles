# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Personal Preferences

When running the code review skill (`/code-review`), ask me before filtering out issues with low scores.

Always include tests for important new features and important behavior changes.

Fix lint warnings properly — do not suppress them with inline disable comments.

In TypeScript projects, run the linter on changed files before committing to catch issues early.

Never log secrets (tokens, API keys, passwords, cookies) — always redact them in logs and visibility reports.
