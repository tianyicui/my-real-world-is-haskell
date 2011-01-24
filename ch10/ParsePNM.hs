import Parse
import PNM

parseRawPGM =
    parseWhileWith w2c notWhite ==> \header ->
    skipSpaces ==>&
    parseNat ==> \width ->
    skipSpaces ==>&
    parseNat ==> \height ->
    skipSpaces ==>&
    parseNat ==> \maxGrey ->
    parseByte ==>&
    parseBytes (width * height) ==> \bitmap ->
    identity (Greymap width height maxGrey bitmap)
  where notWhite = (`notElem` " \r\n\t")

-- ex1
parsePlainPGM =
    parseWhileWith w2c notWhite ==> \header ->
    skipSpaces ==>&
    parseNat ==> \width ->
    skipSpaces ==>&
    parseNat ==> \height ->
    skipSpaces ==>&
    parseNat ==> \maxGrey ->
    parseByte ==>&
    parsePlainBytes (width * height) ==> \bitmap ->
    identity (Greymap width height maxGrey bitmap)
  where notWhite = (`notElem` " \r\n\t")
