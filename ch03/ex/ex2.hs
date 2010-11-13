module Ex2 where

myLength :: [a] -> Integer

myLength [] = 0
myLength (_:xs) = 1 + (myLength xs)
