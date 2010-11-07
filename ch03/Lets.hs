module Lets where

-- Note: the name in a let block is bound to an /expression/, not to a /value/ because Haskell's laziness.
lend amount balance = let reserve = 100
                          newBalance = balance - amount
                      in if balance < reserve
                         then Nothing
                         else Just newBalance

-- Examples of shadowing
--
-- >>> foo
-- 3
-- >>> bar
-- ("foo", 1)
-- >>> :type quux
-- quux :: t-> [Char]
foo = let a = 1
      in let b = 2
         in a + b
bar = let x = 1
      in ((let x = "foo" in x), x)
quux a = let a = "foo"
         in a ++ "eek!"
-- Note: GHC has a /-fwarn-name-shadowing/ option.

-- The where clause
lend2 amount balance = if amount < reserve * 0.5
                       then Just newBalance
                       else Nothing
    where reserve    = 100
          newBalance = balance - amount
