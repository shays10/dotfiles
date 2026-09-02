# Coding Guidelines

In Scala, represent effect-only asynchronous results as `Future[Empty]` when the method's return type is under our control. Import `com.google.protobuf.empty.Empty` and complete successful paths with `Empty()` (`yield Empty()`, `.map(_ => Empty())`, or `Future.successful(Empty())`). Keep `Future[Unit]` only when implementing an external contract that requires that exact type. A concrete result type prevents Scala's value-discarding adaptation from hiding an unintended final expression. See [Why shouldn't you use Future[Unit] as a return type in a Scala program?](https://medium.com/swlh/why-shouldnt-you-use-future-unit-as-a-return-type-in-a-scala-program-a4c58f95b343).

When SDL supports a bulk operation for the work, use it instead of `Future.traverse` over individual operations. Do not launch hundreds or thousands of SDL futures concurrently when the same work can be expressed as a bounded bulk query, patch, insert, or delete.

When a method is long because it performs several distinct parts of a flow, extract each part into a well-named method and leave the original method as a short, high-level sequence. Each name should describe what that part accomplishes in the domain, allowing a reader to understand the complete flow without first reading its implementation details.
