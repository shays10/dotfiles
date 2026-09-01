# Coding Guidelines

When SDL supports a bulk operation for the work, use it instead of `Future.traverse` over individual operations. Do not launch hundreds or thousands of SDL futures concurrently when the same work can be expressed as a bounded bulk query, patch, insert, or delete.

When a method is long because it performs several distinct parts of a flow, extract each part into a well-named method and leave the original method as a short, high-level sequence. Each name should describe what that part accomplishes in the domain, allowing a reader to understand the complete flow without first reading its implementation details.
