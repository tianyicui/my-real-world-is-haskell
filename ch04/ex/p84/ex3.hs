import InteractWith (mainWith)

main = mainWith
     $ unlines . map (head . words) . lines
