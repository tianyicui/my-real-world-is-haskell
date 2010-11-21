import InteractWith (mainWith)

main = mainWith $ unlines . transpose . lines

--- stolen from http://haskell.org/onlinereport/list.html

-- transpose is lazy in both rows and columns,
--       and works for non-rectangular 'matrices'
-- For example, transpose [[1,2],[3,4,5],[]]  =  [[1,3],[2,4],[5]]
-- Note that [h | (h:t) <- xss] is not the same as (map head xss)
--      because the former discards empty sublists inside xss
transpose []             = []
transpose ([]     : xss) = transpose xss
transpose ((x:xs) : xss) = (x : [ h | (h:t) <- xss]) :
                           transpose (xs : [t | (h:t) <- xss])
