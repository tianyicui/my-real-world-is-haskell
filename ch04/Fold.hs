module Fold where

-- implementation of foldl and foldr

foldl f = go where
    go z (x:xs) = go (f z x) xs
    go z []     = z

foldr f = go where
    go z (x:xs) = f x $ go z xs
    go z []     = z

-- implement filter using foldr
filter p = Fold.foldr step [] where
    step x xs = if p x then x : xs else xs

-- map using foldr
map f = Fold.foldr step [] where
    step x xs = f x : xs

-- foldl using foldr
foldl' f z xs = Fold.foldr step id xs z where
    step x g a = g (f a x)
