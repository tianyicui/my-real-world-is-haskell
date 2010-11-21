The `do` keyword introduces a block of _actions_ that can cause effects in the real world. The `<-` operator is the equavalent of assignment inside a `do` block.

----

Lists:

* basics
  * length
    * `O(N)`
  * null
  * head, tail
  * last, init
    * `O(N)`
  * ++, concat
    * `(++) :: [a] -> [a] -> [a]`
    * `concat :: [[a]] -> [a]`
  * reverse
* bool relelated
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
