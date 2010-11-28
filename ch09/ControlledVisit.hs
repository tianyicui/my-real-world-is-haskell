{-# LANGUAGE ScopedTypeVariables #-}

import Data.List(sortBy)
import Data.Ord(comparing)
import Control.Monad (forM, liftM)
import System.Directory (Permissions(..), getDirectoryContents, getPermissions, getModificationTime)
import System.Time (ClockTime(..))
import System.FilePath (takeExtension)
import Control.Exception (bracket, handle)
import System.IO (IOMode(..), hClose, hFileSize, openFile)
import System.FilePath ((</>))

import BetterPredicate

data Info = Info {
      infoPath :: FilePath
    , infoPerms :: Maybe Permissions
    , infoSize :: Maybe Integer
    , infoModTime :: Maybe ClockTime
    } deriving (Eq, Ord, Show)

maybeIO :: IO a -> IO (Maybe a)
maybeIO act = handle (\(_::IOError) -> return Nothing) (Just `liftM` act)

getInfo :: FilePath -> IO Info
getInfo path = do
    perms <- maybeIO (getPermissions path)
    size <- maybeIO (bracket (openFile path ReadMode) hClose hFileSize)
    modified <- maybeIO (getModificationTime path)
    return (Info path perms size modified)

traverse :: ([Info] -> [Info]) -> FilePath -> IO [Info]
traverse order path = do
    names <- getUsefulContents path
    contents <- mapM getInfo (path : map (path </>) names)
    liftM concat $ forM (order contents) $ \info -> do
        if isDirectory info && infoPath info /= path
            then traverse order (infoPath info)
            else return [info]

getUsefulContents :: FilePath -> IO [String]
getUsefulContents path = do
    names <- getDirectoryContents path
    return (filter (`notElem` [".", ".."]) names)

isDirectory :: Info -> Bool
isDirectory = maybe False searchable . infoPerms

-- exercises
traverseEx1 = traverse $ reverse . sortBy (comparing infoPath)
traverseEx2 = traverse $ reverse

-- ex3
type InfoP' a = Info -> a

convertInfoP :: InfoP a -> InfoP' a
convertInfoP p = \i ->
    p (infoPath i) (mustHave $ infoPerms i) (infoSize i) (mustHave $ infoModTime i)

mustHave :: Maybe a -> a
mustHave (Just x) = x

pathP' = convertInfoP pathP
sizeP' = convertInfoP sizeP

liftP' :: (a -> b -> c) -> InfoP' a -> b -> InfoP' c
liftP' q f k = \i -> q (f i) k

equalP' :: (Eq a) => InfoP' a -> a -> InfoP' Bool
equalP' = liftP' (==)

greaterP' = liftP' (>)
lesserP' = liftP' (<)

-- ...
