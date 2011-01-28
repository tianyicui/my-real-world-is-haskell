ex1 (x0,x1,x2,x3) i
    | i == 0 = x0
    | i == 1 = x1
    | i == 2 = x2
    | i == 3 = x3
-- ex1 :: (Num a) => (t, t, t, t) -> a -> t
-- The elements in the tuple must have a common type and it's the only possible return type

ex2 (x0,x1,x2,x3,x4,x5) i
    | i == 0 = x0
    | i == 1 = x1
    | i == 2 = x2
    | i == 3 = x3
    | i == 4 = x4
    | i == 5 = x5

ex3 (x0,x1,x2,x3,x4,x5) i
    | i == 4 = x4
    | i == 5 = x5
    | otherwise = ex1 (x0,x1,x2,x3) i
