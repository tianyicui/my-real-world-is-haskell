any_foldr f = foldr (\x y -> f x || y) False

cycle_foldr xs = foldr (:) (cycle_foldr xs) xs
