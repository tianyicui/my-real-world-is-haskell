module Enum where

-- | Enum definition is like this.
--
-- >>> :type Yellow
-- Yellow :: Color
-- >>> Red == Yellow
-- False
-- >>> Green == Green
-- True
data Color = Red
           | Orange
           | Yellow
           | Green
           | Blue
           | Indigo
           | Violet
             deriving (Eq, Show)
