module Ex5 where

-- Note: `Eq a` must not be missing
isPalindrome :: (Eq a) => [a] -> Bool

isPalindrome xs = xs == (reverse xs)
