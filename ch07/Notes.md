### I/O actions:

* Have the type `IO t`.
* Are first-class values in Haskell and fit seamlessly with Haskell's type system.
* Produce an effect when _performed_, but not when _evaluated_. That is, they produce an effect only when called by something else in an I/O context.
* Any expression may produce an action as its value, but the action will not perform I/O until it is executed inside another I/O action (or it is `main`).
* Performing (executing) an action of type `IO t` may perform I/O and will ultimately deliver a result of type `t`.
