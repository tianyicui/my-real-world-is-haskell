module Ex1 where

myLength [] = 0
myLength (_:xs) = 1 + (myLength xs)
