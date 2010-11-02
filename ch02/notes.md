*Type variables* - what a brilliant idea!

Haskell's type system prevents us from accidentally mixing pure and impure code. (What does *`IO`* really mean?)

Variables are immutable once assigned, otherwise it's a compilation time error.

Haskell is expression-oriented, like Ruby, (different from statement-oriented, like Java). But unlike Ruby, it's statically typed, so an `if` without `else` doesn't make sense, because the resulting type is likely to be different.

Haskell expressions create "promise" that got eventually evaluated at the time of the value of that exp is needed. It's called *nonstrict evaluation* or *lazy evaluation*. So short-circuiting new functions can be easily defined.
