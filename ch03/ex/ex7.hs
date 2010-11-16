module Ex7 where

intersperse :: a -> [[a]] -> [a]

intersperse _ []     = []
intersperse _ [x]    = x
intersperse d (x:xs) = x ++ [d] ++ (intersperse d xs)
