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

angle (x1, y1) (x2, y2) = atan2 (y2 - y1) (x2 - x1)

dist (x1, y1) (x2, y2) = abs(x1 - x2) + abs(y1 - y2)

-- grahamScan
--
-- >>> grahamScan [(10,0), (10,1),(-10,1),(-10,0),(-7,0),(-10,2),(-10,3),(-4,1),(-2,2),(-12,1)]
-- [(-10.0,0.0),(10.0,0.0),(10.0,1.0),(-10.0,3.0),(-12.0,1.0)]
--
grahamScan ll =
    let (x:y:l) = l++[head l] where
            l = sortPoints (headPoint ll) ll where
                headPoint l = minimumBy cmp l where
                    cmp (x1, y1) (x2, y2)
                        | y1 == y2  = compare x1 x2
                        | otherwise = compare y1 y2
                sortPoints x l = (x:(sortBy cmp (filter (/=x) l))) where
                    cmp i j
                        | cmp0 == EQ = cmp1
                        | otherwise  = cmp0
                        where
                            cmp0 = compare (angle x i) (angle x j)
                            cmp1 = compare (dist x i) (dist x j)
    in (reverse (tail (doScan [y,x] l))) where
        doScan (i:j:l) (x:s)
            | turn j i x == TurnLeft = doScan (x:i:j:l) s
            | otherwise              = doScan (j:l) (x:s)
        doScan (i:l) (x:s)           = doScan (x:i:l) s
        doScan s []                  = s
