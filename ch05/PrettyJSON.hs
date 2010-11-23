module PrettyJSON where

import SimpleJSON

renderJValue :: JValue -> Doc
renderJValue (JBool True)  = text "true"
renderJValue (JBool False) = text "false"
renderJValue JNull         = text "null"
renderJValue (JNumber num) = double num
renderJValue (JString str) = string str

string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar
-- NOTE: this is written in point-free style
-- the "Pointy" equivalence is
-- string s = enclose '"' '"' (hcat (map oneChar s))
