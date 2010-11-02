module Union where

type Vector = (Double, Double)

-- | Examples:
--
-- >>> let a = Circle (1, 2) 3
-- >>> :type a
-- a :: Shape
-- >>> let b = Poly [(1,2), (2,3)]
-- >>> :type b
-- b :: Shape
data Shape = Circle Vector Double
           | Poly [Vector]
             deriving (Eq, Show)
