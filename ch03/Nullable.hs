module Nullable where

-- a is a parameterized type here
data Maybe a = Just a
             | Nothing
               deriving (Eq, Show)

someBool = Just True

someString = Just "something"

-- >>> Just 1.5
-- Just 1.5
-- >>> Nothing
-- Nothing
-- >>> :type Just "invisible bike"
-- Just "invisible bike" :: Maybe [Char]

wrapped = Just (Just "wrapped")
