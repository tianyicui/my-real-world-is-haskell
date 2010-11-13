module Ex7 where

intersperse :: a -> [[a]] -> [a]

intersperse d (x:xs) = [x++[d]] ++ (intersperse d xs)
intersperse _ [a]    = a
intersperse _ _      = []
