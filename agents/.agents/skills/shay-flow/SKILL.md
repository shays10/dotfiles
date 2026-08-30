---
name: shay-flow
description: Explicit workflow router for Shay's investigation, bug-fix, feature/refactor, and review/readiness flows. Use only when the user invokes shay-flow.
---

# Shay flow

Choose one primary flow from the user's goal. Keep a read-only request read-only. Do not commit, open a pull request, merge, deploy, or send external messages unless the user asks.

Keep every mutating flow surgical: every changed line must be required by the user's request.

## Investigation

Use the `how` skill to map current behavior. Add the `why` skill only when history or intent affects the answer. Cite the evidence, separate facts from inference, and finish with unresolved gaps. Do not edit files.

## Bug fix

1. Reproduce the symptom on the closest practical version of the real surface.
2. Trace the root cause. Do not treat a guard that hides the symptom as a fix.
3. Add a focused regression test first when there is a cheap, stable test seam.
4. Fix the root cause.
5. Rerun the reproduction, focused tests, and any broader check justified by the affected boundary.

Finish when the original reproduction is green for the intended reason and no observed behavior outside the request changed.

## Feature or refactor

1. Read the repository instructions and record the current behavior that must survive.
2. Name the data shape, ownership boundary, and public seam before editing.
3. Use `domain-modeling` when terminology or state is unclear. Use `prototype` only when an observable experiment can settle a real design fork.
4. Implement the complete change. Avoid compatibility layers that exist only to smooth an internal migration.
5. Run focused tests, required linting, and a check against the real artifact when available.

Finish when the requested behavior is observable.

## Review and readiness

1. Establish the comparison point and inspect the complete diff.
2. Apply `no-comments` before code review. A review-only request produces findings without edits.
3. Apply `blast-radius` when safety depends on behavior outside the immediate diff.
4. Use `code-review` for a non-trivial change and the strict maintainability review only when the user asks for that depth.
5. Run the checks that support the verdict and report unresolved risks.

Green checks are evidence, not the verdict. Finish with a clear ready or not-ready judgment and the facts supporting it.

Apply `technical-writing` to documentation, RFCs, pull request descriptions, and commit messages produced by any flow.
