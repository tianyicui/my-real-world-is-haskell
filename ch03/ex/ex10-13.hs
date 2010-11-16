module Graham where

import Data.List

data Direction = TurnLeft
               | TurnRight
               | StraightLine
                 deriving Eq

turn (x1, y1) (x2, y2) (x3, y3) =
    case signum ((x2-x1)*(y3-y1) - (y2-y1)*(x3-x1)) of
        1  -> TurnLeft
        -1 -> TurnRight
        0  -> StraightLine

listTurn (x:y:z:l) = (turn x y z):(listTurn (y:z:l))
listTurn _         = []

polarAngel (x1, y1) (x2, y2) = atan2 (y2 - y1) (x2 - x1)

dist (x1, y1) (x2, y2) = abs(x1 - x2) + abs(y1 - y2)

sortByPolarAngelWith x l = (x:(sortBy cmp (filter (/=x) l)))
    where cmp i j        = case polarCompare of
            EQ -> compare (dist x i) (dist x j)
            _  -> polarCompare
            where polarCompare = compare (polarAngel x i) (polarAngel x j)

pointWithLowestY l = minimumBy cmpY l
    where cmpY (x1, y1) (x2, y2) = if y1==y2
                                   then compare x1 x2
                                   else compare y1 y2

grahamScanPrepareList ll =
    let l = sortByPolarAngelWith (pointWithLowestY ll) ll
    in l++[(head l)]

-- grahamScan
--
-- >>> grahamScan [(10,0), (10,1),(-10,1),(-10,0),(-7,0),(-10,2),(-10,3),(-4,1),(-2,2),(-12,1)]
-- [(-10.0,0.0),(10.0,0.0),(10.0,1.0),(-10.0,3.0),(-12.0,1.0)]
--
grahamScan ll =
    let (x:y:l) = grahamScanPrepareList ll
    in (reverse (tail (doScan [y,x] l))) where
        doScan (i:j:l) (x:s)
            | turn j i x == TurnLeft = doScan (x:i:j:l) s
            | otherwise              = doScan (j:l) (x:s)
        doScan (i:l) (x:s)           = doScan (x:i:l) s
        doScan s []                  = s
