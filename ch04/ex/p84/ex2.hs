splitWith p xs =
    let (ys,zs) = break p xs
    in ys :
        if null zs
        then []
        else splitWith p $ tail zs
