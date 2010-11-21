foldl f = go where
    go z (x:xs) = go (f z x) xs
    go z []     = z

foldr f = go where
    go z (x:xs) = f x $ go z xs
    go z []     = z
