module MyDrop where

-- >>> myDrop 2 [1,2,3]
-- [3]
myDrop n xs = if n <= 0 || null xs
              then xs
              else myDrop (n - 1) (tail xs)

-- >>> niceDrop 2 [3,2,1]
-- [1]
niceDrop n xs | n <= 0 = xs
niceDrop _ []          = []
niceDrop n (_:xs)      = niceDrop (n - 1) xs
