module BogusPattern where

data Fruit = Apple | Orange
             deriving (Show)

apple = "apple"

orange = "orange"

whichFruit1 :: String -> Fruit

-- This is an incorrect version
-- because apple doesn't refer to the topleval value, it is a local pattern variable.
--
-- >>> whichFruit1 "apple"
-- Apple
-- >>> whichFruit1 "orange"
-- Apple
--
whichFruit1 f = case f of
                  apple  -> Apple
                  orange -> Orange

-- The correct version must be like this
--
-- >>> whichFruit "orange"
-- Orange
-- >>> whichFruit "apple"
-- Apple
--
whichFruit f = case f of
                 "apple"  -> Apple
                 "orange" -> Orange
