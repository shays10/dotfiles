---
name: how
description: Explain how a subsystem works, where behavior lives, which layer owns it, and how data moves through it. Use for code walkthroughs and placement or ownership questions; use why for historical intent.
---

# How

Build a read-only model of the current implementation.

1. Read the applicable repository instructions and locate the public entry points.
2. Trace the runtime or data path through the owning modules. Include state, persistence, process, network, and concurrency boundaries that change the behavior.
3. Read the tests that define the observed contract and relevant history only when it clarifies the present shape.
4. Check the user's specific concern against the traced path. Do not infer safety from names or directory structure.
5. Use a read-only subagent only when the question has independent slices that would otherwise crowd the main context.

Reply with the smallest useful mental model, then the concrete flow with file and line citations. Name architectural concerns and evidence gaps separately. Do not modify code or present historical intent as fact; route that question to `why`.
