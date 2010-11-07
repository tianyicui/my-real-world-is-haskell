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
