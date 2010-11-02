-- BookInfo is a *type constructor*
-- Book is a *value/data constructor*
-- Int, String, and [String] are *components* of the type
data BookInfo = Book Int String [String]
                deriving (Show)

-- Although the structures of `MagazineInfo` and `BookInfo` are the same, Haskell treats the types as distinct.
data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

myInfo = Book 9780135072455 "Algebra of Programming"
         ["Richard Bird", "Oege de Moor"]

-- But the names of type constructor and data constructor can be the same, because they're always used in different scenarios.
-- Type names (type constructors) are used when specifying types; data constructors are used when writing expressions.
data BookReview = BookReview BookInfo CustomerID String
-- Actually type and data constructors to have the same names are normal in Haskell code.

-- Type Synonyms
type CustomerID = Int
type ReviewBody = String
-- used in other defined types
data BetterReview = BetterReview BookInfo CustomerID ReviewBody
-- create shorter name for a tuple
type BookRecord = (BookInfo, BookReview)
