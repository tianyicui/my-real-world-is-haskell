#!/usr/bin/env runhaskell

name2reply :: String -> String
name2reply name =
    "Hello, " ++ name ++ ".\n" ++
    "Your name contains " ++ charcount ++ " characters.\n" ++
    "We can reverse it to " ++ reversed ++ ".\n"
    where charcount = show (length name)
          reversed = reverse name

main :: IO ()
main = do
       putStrLn "Greetings! What's your name?"
       inpStr <- getLine
       let outStr = name2reply inpStr
       putStrLn outStr
