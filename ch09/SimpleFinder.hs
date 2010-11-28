import RecursiveContents (getRecursiveContents)

simpleFinder :: (FilePath -> Bool) -> FilePath -> IO [FilePath]
simpleFinder p path = do
    names <- getRecursiveContents path
    return (filter p names)
