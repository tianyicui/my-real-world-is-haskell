import Data.Char (digitToInt)

asInt = foldl step 0 where
    step a b = 10*a + digitToInt b
