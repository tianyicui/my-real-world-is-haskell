module Ex4 where

toPalindrome :: [a] -> [a]

toPalindrome [] = []
toPalindrome (x:xs) = x:(toPalindrome xs) ++ [x]
