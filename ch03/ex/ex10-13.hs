module Graham where

data Direction = TurnLeft
               | TurnRight
               | StraightLine
                 deriving Show

data Point a = Point a a

turn (Point x1 y1) (Point x2 y2) (Point x3 y3) =
    case signum ((x2-x1)*(y3-y1) - (y2-y1)*(x3-x1)) of
        1  -> TurnLeft
        -1 -> TurnRight
        0  -> StraightLine

listTurn (x:y:z:l) = [(turn x y z)] ++ (listTurn (y:z:l))
listTurn _         = []
