import System.Environment (getArgs)

import SplitLines (fixLines)

interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

main = mainWith myFunction
  where mainWith function = do
          args <- getArgs
          case args of
            [input,output] -> interactWith function input output
            _ -> putStrLn "error: exactly two arguments needed"

        -- the function id can be replaced by anything
        -- that have the type String -> String
        myFunction = fixLines
