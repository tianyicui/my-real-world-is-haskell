groupBy f = foldr step [] where
    step i [] = [[i]]
    step i l@((x:xs):xss) =
        if f i x
        then ((i:x:xs):xss)
        else [i]:l

groupBy' _  []     = []
groupBy' eq (x:xs) =
    let (ys,zs) = span (eq x) xs
    in (x:ys) : groupBy eq zs
