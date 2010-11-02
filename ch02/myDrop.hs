myDropX n xs = if n <= 0 || null xs
               then xs
               else myDropX (n - 1) (tail xs)
