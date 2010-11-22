import Data.List (isPrefixOf)

dlts :: String -> [String]

dlts = foldr step [] . lines where
    step l ds =
        if "#define DLT_" `isPrefixOf` l
        then secondWord l : ds
        else ds
    secondWord = head . tail . words
