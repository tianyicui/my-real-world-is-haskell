module PatternMatching where

-- | C-like binary logic
--
-- >>> (!) True
-- False
-- >>> (!) False
-- True
(!) True  = False
(!) False = True

-- | Sum of list
-- The patterns are checked in the order we define them.
--
-- Examples:
--
-- >>> sumList [1,2,3]
-- 6
-- >>> sumList []
-- 0
sumList (x:xs) = x + sumList xs
sumList []     = 0

-- | third
--
-- >>> third ("a", 3, [])
-- []
third (a, b, c) = c

-- | complicated
--
-- >>> complicated (True, 1, [2,3,4], 5)
-- (1,[3,4])
complicated (True, a, x:xs, 5) = (a, xs)
