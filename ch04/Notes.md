The `do` keyword introduces a block of _actions_ that can cause effects in the real world. The `<-` operator is the equavalent of assignment inside a `do` block.

----

Lists:

* basics
  * length
    * Note: `O(N)`
  * null
  * head, tail
  * last, init
    * Note: `O(N)`
  * ++, concat
    * `(++) :: [a] -> [a] -> [a]`
    * `concat :: [[a]] -> [a]`
  * reverse
* boolean
  * and, or
    * `[Bool] -> Bool`
* sublists
  * take, drop
    * `Int -> [a] -> [a]`
  * splitAt
    * `Int -> [a] -> ([a], [a])`
  * takeWhile, dropWhile
    * `(a -> Bool) -> [a] -> [a])`
  * scan, break
    * `(a -> Bool) -> [a] -> ([a], [a])`
    * `span p xs = (takeWhile p xs, dropWhile p xs)`
    * `break p = span (not . p)`
* searching lists
  * elem, notElem
  * Data.List (isPrefixOf, isInfixOf, isSuffixOf)
* list zipping
  * zip
    * `[a] -> [b] -> [(a,b)]`
  * zipWith
    * `(a -> b-> c) -> [a] -> [b] -> [c]`
  * we also have zip3 and zipWith3 in Prelude, and up to zip7 and zipWith7 in Data.List
* string-handling
  * lines, unlines
  * words, unwords
* higher order functions
  * map
  * filter
  * foldl
  * foldr

----

Sections:

    ghci> :type (^2)
    (^1) :: (Num a) => a -> a
    ghci> :type (2^)
    (2^) :: (Num t, Integral b) => b -> t
    ghci> :type (`elem` ['a'..'z'])
    (`elem` ['a'..'z']) :: Char -> Bool

----

Tips for Writing Readable Code

* Try to avoid tail recursion by using library functions such as `map`, `take` and `filter`, because tail recursion is just like loop in an imperative language, we're forced to look in detail at the entire definition of the function to see what it's doing.
* Don't use a fold if you can compose some library functions, but otherwise try to use a fold in preference to a hand-rolled tail recursive loop.
* Anonymous functions tend to interrupt the "flow" of reading a piece of code. Try to use a local function definition in a `let` or `here` clause, since we don't need to understand the function's definition when we're reading the code that uses it, and a well-chosen function name acts as a tiny piece of local documentation.
