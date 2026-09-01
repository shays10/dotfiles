# Coding Guidelines

When SDL supports a bulk operation for the work, use it instead of `Future.traverse` over individual operations. Do not launch hundreds or thousands of SDL futures concurrently when the same work can be expressed as a bounded bulk query, patch, insert, or delete.

Keep orchestration methods as short, linear domain pipelines: load inputs, select candidates, load the domain state needed for the decision, decide, then mutate. Extract dense selection and deduplication into named pure helpers, and group related lookup data behind a purpose-specific domain value instead of passing generic “dependencies” through the flow. Measure the whole refactor, not only the entry method: remove redundant checks and single-use wrappers so improved readability does not merely relocate complexity or add lines.
