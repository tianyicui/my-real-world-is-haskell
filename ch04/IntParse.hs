import Data.Char (digitToInt)

asInt :: String -> Int

asInt xs = loop 0 xs where
    -- this technique is called structural recursion
    -- implemented as tail recursion
    loop acc [] = acc
    loop acc (x:xs) = let acc' = acc * 10 + digitToInt x
                      in loop acc' xs
