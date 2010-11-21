import InteractWith (mainWith)
import Data.List (transpose)

main = mainWith $ unlines . transpose . lines
