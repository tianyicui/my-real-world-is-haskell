module Graham where

import Data.List

data Direction = TurnLeft
               | TurnRight
               | StraightLine
                 deriving Show

turn (x1, y1) (x2, y2) (x3, y3) =
    case signum ((x2-x1)*(y3-y1) - (y2-y1)*(x3-x1)) of
        1  -> TurnLeft
        -1 -> TurnRight
        0  -> StraightLine

listTurn (x:y:z:l) = (turn x y z):(listTurn (y:z:l))
listTurn _         = []

polarAngel (x1, y1) (x2, y2) = atan2 (y2 - y1) (x2 - x1)

sortByPolarAngelWith x l = sortBy cmp l
    where cmp i j        = compare (polarAngel x i) (polarAngel x j)

pointWithLowestY l = minimumBy cmpY l
    where cmpY (x1, y1) (x2, y2) = if y1==y2
                                             then compare x1 x2
                                             else compare y1 y2

grahamScanPrepareList ll =
    let l = sortByPolarAngelWith (pointWithLowestY ll) ll
    in l++[(head l)]

grahamScan ll =
    let l = grahamScanPrepareList ll
    in (doScan l) where
        doScan (x:y:z:l) =
            case (turn x y z) of
                TurnLeft -> (x:(doScan (y:z:l)))
                _        -> (doScan (x:z:l))
        doScan xs      = init xs

-- TODO: more tests on this
