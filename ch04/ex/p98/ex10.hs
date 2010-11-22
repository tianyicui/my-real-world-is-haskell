any_foldr f = foldr (\x y -> f x || y) False

cycle_foldr xs = foldr (:) (cycle_foldr xs) xs

-- XXX: this looks ugly!
words_foldr xs = tail $ foldr step [] (' ':xs) where
    step ' '  xs = emptyHead xs
    step '\n' xs = emptyHead xs
    step '\r' xs = emptyHead xs
    step ch (x:xs) = (ch : x) : xs
    step ch [] = [[ch]]
    emptyHead l@("":xs) = l
    emptyHead xs = "" : xs
