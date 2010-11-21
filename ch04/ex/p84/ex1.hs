safeHead []    = Nothing
safeHead (x:_) = Just x

safeTail []     = Nothing
safeTail (_:xs) = Just xs

safeLast [] = Nothing
safeLast xs = Just $ last xs

safeInit [] = Nothing
safeInit xs = Just $ init xs
