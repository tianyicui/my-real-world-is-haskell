module ListADT where

data List a = Cons a (List a)
            | Nil
              deriving (Show)

-- | fromList
--
-- >>> fromList "durian"
-- Cons 'd' (Cons 'u' (Cons 'r' (Cons 'i' (Cons 'a' (Cons 'n' Nil)))))
-- >>> fromList [Just True, Nothing, Just False]
-- Cons (Just True) (Cons Nothing (Cons (Just False) Nil))
fromList (x:xs) = Cons x (fromList xs)
fromList []     = Nil

-- | toList (ex1)
-- | ex P60.1
--
-- >>> toList (Cons 'd' (Cons 'u' (Cons 'r' (Cons 'i' (Cons 'a' (Cons 'n' Nil))))))
-- "durian"
-- >>> toList (Cons (Just True) (Cons Nothing (Cons (Just False) Nil)))
-- [Just True, Nothing, Just False]
toList (Cons head tail) = head:toList(tail)
toList Nil = []
