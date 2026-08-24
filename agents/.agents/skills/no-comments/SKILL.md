---
name: no-comments
description: Review comments when the user invokes no-comments or shay-flow reaches review/readiness. Remove narration and stale workarounds while preserving repository-required rationale; review-only requests remain read-only.
---

# No comments

Review the caller's scope or the current diff against its base branch. Repository instructions outrank this skill.

## Authority

A review-only request produces findings without edits. Delete comments or reshape code only when the user has authorized cleanup or implementation in the active task. Keep every change inside that scope.

When delegation is available, ask a fresh read-only reviewer to inspect the comments. The parent verifies every finding against the code and repository rules before accepting it.

## Delete or flag

- Narration that restates the following code.
- Commented-out code and obsolete TODOs.
- Stale workaround explanations after the workaround is gone.
- Comments hiding confusing internal names, boundaries, or data shapes. Flag the structural problem; fix it only when authorized and in scope.
- Lint or type suppressions whose underlying correctness issue can be fixed in scope.

## Preserve

Preservation wins when a comment also matches a deletion category.

- Legal and license headers.
- Public API contracts.
- Issue or RFC links carrying rationale that code cannot express.
- Accurate comments explaining non-obvious behavior forced by an external dependency, platform, protocol, or environment.
- Comments required by repository instructions.

For `shays-scripts`, accurate explanations of blocked domains, Coder template races, systemd linger, shell initialization order, and macOS portability are protected environmental constraints. A comment should explain why the constraint shapes the code, not narrate the code itself.

When a claimed constraint is uncertain, report the comment and the missing proof. Do not delete on doubt. Offer a test, lint, type, or runtime check when that would preserve the constraint more reliably, and wait for approval before replacing the comment.

Report deletions, preserved comments that needed judgment, structural findings, uncertain constraints, and verification run after any edits.
