import Data.Char (digitToInt)

asInt ('-':xs) = - (asInt xs)

asInt xs = foldl step 0 xs where
    step a b = 10*a + digitToInt b
