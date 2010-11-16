module Ex6 where

import Data.List

sortBasedOnLength :: [[a]] -> [[a]]

sortBasedOnLength x = Data.List.sortBy cmp x
    where cmp i j   = compare (length i) (length j)
