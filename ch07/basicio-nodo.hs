#!/usr/bin/env runhaskell

-- The Haskell compiler internally performs a translation just like this when you define a do block.
main =
    putStrLn "Greetings! What is your name?" >>
    getLine >>=
    (\inpStr -> putStrLn $ "Welcome to Haskell, " ++ inpStr ++ "!")
