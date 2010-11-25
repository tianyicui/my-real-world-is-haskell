### Efficient File Processing

The `String` is represented as a list of `Char` values. Its performance isn't well. The `bytestring` library provides a fast, cheap alternative to the `String` type, it has a _strict_ type named `ByteString` in `Data.ByteString`, and the _lazy_ version in `Data.TypeString.Lazy`.

### Regex in Haskell

One of the Haskell Regex libs is `Text.Regex.Posix`, which provides (=~) like this (FIXME: I need to understand this!):

    (=~)
      :: (RegexMaker Regex CompOption ExecOption source,
          RegexContext Regex source1 target) =>
         source1 -> source -> target
