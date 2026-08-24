---
name: blast-radius
description: Find what a change could break beyond its immediate diff and prove the key safety assumption with executable evidence. Use for blast-radius questions and readiness checks on deceptively small changes.
---

# Blast radius

Review the change as a contract, not a file list.

1. Establish the exact diff or proposed behavior and its public seams.
2. Trace direct and indirect consumers, configuration, persisted data, concurrency, retries, platform differences, and operational tooling where they apply.
3. Separate grep-visible references from dynamic coupling such as conventions, generated files, schemas, reflection, environment variables, and external callers.
4. State the one load-bearing fact the change is safe because of.
5. Prove that fact by running the smallest real command, test, or artifact inspection that could falsify it. If it cannot be proven locally, say what remains unverified and why.

Report affected areas, executed evidence, and residual risks. Do not pad the report with hypothetical categories that do not apply.
