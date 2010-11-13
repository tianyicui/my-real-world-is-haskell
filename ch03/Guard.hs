module Guard where

-- | fromMaybe
--
-- >>> fromMaybe 0 Nothing
-- 0
-- >>> fromMaybe 0 (Just 1)
-- 1
fromMaybe defval wrapped =
    case wrapped of
        Nothing    -> defval
        Just value -> value

-- Note: the variable name 'otherwise' is not anything special
lend amount balance
    | amount <= 0             = Nothing
    | amount >  reserve * 0.5 = Nothing
    | otherwise               = Just newBalance
   where reserve    = 100
         newBalance = balance - amount
