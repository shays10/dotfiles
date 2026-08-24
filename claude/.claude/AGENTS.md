## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

## 5. Bazel hygiene

**Never run `bazel clean` or `bazel clean --expunge`.** These flush the entire local cache and can cost 30+ minutes of rebuild time. They're almost never the right fix — stale-cache symptoms in Bazel are rare, and a real cache issue should be diagnosed by inspecting the specific failure, not by nuking the cache. If you're tempted, surface the underlying problem to the user instead.

## 6. Design & Interview Discipline

**When interactively designing or grilling with a user.**

- When asserting the semantics of a proto, API, schema, or contract, cite the file path (and line if relevant) you read to ground the claim. Confidence without a cited source is an unverified assertion from memory — read the spec first.
- When recommending an option, name any architectural smell in the recommendation before stating the recommendation. Don't bury the tradeoff and let the user surface it.
- When you defer an optional decision ("we could add X later"), restate it as an explicit Proposed item before ending the topic. Don't rely on the user to recall it.
- When introducing framework or technical jargon (proto annotations, cache eviction policies, build macros, etc.), define it inline at first use. Don't wait for "what is X?".
- "Out of scope" or "decided" items inherited from a prior phase (PRD, spec, earlier conversation) are starting hypotheses, not facts. At each later phase that depends on them, name the inherited decision and ask whether it still holds.

## 7. Workflow Routing

- Use the `how` skill for runtime flow, ownership, layering, and code walkthroughs.
- Use the `why` skill for historical intent, prior decisions, historical regressions, and thresholds.
- Use `blast-radius` when a small change may affect callers or behavior outside its diff.
- Use `technical-writing` for documentation, RFCs, READMEs, pull request descriptions, and commit messages.
- Apply `no-comments` as the first step of every code review. Preserve comments protected by repository instructions and report uncertain constraints instead of deleting them.
- `shay-flow` and `reflect` are explicit workflows. Run them only when invoked.
