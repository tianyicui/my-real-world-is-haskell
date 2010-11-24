module InteractWith where

import System.Environment (getArgs)

interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

mainWith function = do
  args <- getArgs
  case args of
    [input,output] -> interactWith function input output
    [input]        -> interactWith function input "/dev/stdout"
    []             -> interactWith function "/dev/stdin" "/dev/stdout"
    _ -> putStrLn "error: zero to two arguments needed"
