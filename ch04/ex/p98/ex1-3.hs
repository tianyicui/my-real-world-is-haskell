import Data.Char (digitToInt, isNumber)

asIntError = error "asInt: parse error"

asInt "" = asIntError

asInt ('-':xs) = - (asInt xs)

asInt xs = foldl step 0 xs where
    step a b
        | isNumber b = 10*a + digitToInt b
        | otherwise = asIntError

-- TODO: overflow handling
