import Parse
import PNM

parsePGM =
    parseWhileWith w2c notWhite ==> \header ->
    skipSpaces ==>&
    parseNat ==> \width ->
    skipSpaces ==>&
    parseNat ==> \height ->
    skipSpaces ==>&
    parseNat ==> \maxGrey ->
    parseByte ==>&
    case header of
      "P2" -> parseBytes (width * height * if maxGrey > 255 then 2 else 1)
      "P5" -> parsePlainBytes (width * height)
      _    -> bail "Invalid Header"
    ==> \bitmap ->
    identity (Greymap width height maxGrey bitmap)
  where notWhite = (`notElem` " \r\n\t")
