# Coding Guidelines

When SDL supports a bulk operation for the work, use it instead of `Future.traverse` over individual operations. Do not launch hundreds or thousands of SDL futures concurrently when the same work can be expressed as a bounded bulk query, patch, insert, or delete.

When a method is hard to read because it contains multiple conceptual steps, extract those steps into well-named methods and keep the original method as a concise overview. The resulting method should communicate the flow through names alone, with implementation details delegated to the extracted methods.
