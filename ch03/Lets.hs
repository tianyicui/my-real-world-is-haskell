module Lets where

-- Note: the name in a let block is bound to an /expression/, not to a /value/ because Haskell's laziness.
lend amount balance = let reserve = 100
                          newBalance = balance - amount
                      in if balance < reserve
                         then Nothing
                         else Just newBalance
