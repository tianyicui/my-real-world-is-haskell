import Prelude(id, flip, ($), seq)

-- implementation of foldl and foldr

foldl f = go where
    go z (x:xs) = go (f z x) xs
    go z []     = z

foldr f = go where
    go z (x:xs) = f x $ go z xs
    go z []     = z

-- implement filter using foldr
filter p = foldr step [] where
    step x xs = if p x then x : xs else xs

-- map using foldr
map f = foldr step [] where
    step x xs = f x : xs

-- foldl using foldr
foldl_using_foldr f z xs =
    foldr step id xs z where
    step x g a = g (f a x)

identity :: [a] -> [a]
identity = foldr (:) []

append :: [a] -> [a] -> [a]
append = flip $ foldr (:)

-- seq: it forces its first argument to be evaluated, and then returns its second argument.
foldl' _    zero []     = zero
foldl' step zero (x:xs) =
    let new = step zero x
    in  new `seq` foldl' step new xs

strictPair (a,b) = a `seq` b `seq` (a,b)

strictList (x:xs) = x `seq` x : strictList xs
strictlist []     = []
