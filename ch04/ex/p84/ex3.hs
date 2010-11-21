import InteractWith (mainWith)

main = mainWith $ unlines . transpose . lines

transpose [] = []
transpose [xs] = map (\x -> [x]) xs
transpose (x:xs) =
    let ys = transpose xs
    in zipWith (:) x ys
