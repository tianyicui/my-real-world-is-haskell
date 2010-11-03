module MySecond where

-- | mySecond
--
-- >>> mySecond "yly"
-- 'l'
-- >>> mySecond "y"
-- *** Exception: list too short
mySecond :: [a] -> a
mySecond xs = if null (tail xs)
              then error "list too short"
              else head (tail xs)

-- | safeSecond
--
-- >>> safeSecond []
-- Nothing
-- >>> safeSecond [1]
-- Nothing
-- >>> safeSecond [1,2]
-- Just 2
-- >>> safeSecond [1,2,3]
-- Just 2
safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond xs = if null (tail xs)
                then Nothing
                else Just (head (tail xs))

-- | tidySecond
--
-- >>> tidySecond "haskell"
-- Just 'a'
tidySecond :: [a] -> Maybe a
tidySecond (_:x:_) = Just x
tidySecond _       = Nothing
