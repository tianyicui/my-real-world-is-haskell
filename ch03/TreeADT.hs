module TreeADT where

data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

-- Ex p60.2
data MaybeTree a = JustNode a (Maybe (MaybeTree a)) (Maybe (MaybeTree a))
                   deriving (Show)
