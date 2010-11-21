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
  * filter
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
