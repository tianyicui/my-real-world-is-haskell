### I/O actions

* Have the type `IO t`.
* Are first-class values in Haskell and fit seamlessly with Haskell's type system.
* Produce an effect when _performed_, but not when _evaluated_. That is, they produce an effect only when called by something else in an I/O context.
* Any expression may produce an action as its value, but the action will not perform I/O until it is executed inside another I/O action (or it is `main`).
* Performing (executing) an action of type `IO t` may perform I/O and will ultimately deliver a result of type `t`.

### Why Purity Matters

Haskell, unlike most languages, draws a clear distinction between pure code and I/O actions.

Many bugs in programs are cased by unanticipated side effects. Still more are caused by misunderstanding circumstances in which functions may return different results for the same input. As multithreading and other forms of parallelism grow increasingly common, it becomes difficult to manage global side effects.

Haskell's method of isolating side effects into I/O actions provides a clear boundary. This helps you to think about the program. It also helps the compiler to think about it (e.g. automatic parallelism).
