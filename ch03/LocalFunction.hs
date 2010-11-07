module LocalFunction where

-- | pluralize
--
-- >>> pluralize "cat" [0, 1, 7]
-- ["no cats","one cat","7 cats"]
pluralize :: String -> [Int] -> [String]
pluralize word count = map plural count
    where plural 0 = "no " ++ word ++ "s"
          plural 1 = "one " ++ word
          plural n = show n ++ " " ++ word ++ "s"
