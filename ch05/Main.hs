module Main (main) where

import SimpleJSON
import PutJSON (putJValue)

main = putJValue (JObject [("foo", JNumber 1), ("bar", JBool False)])
