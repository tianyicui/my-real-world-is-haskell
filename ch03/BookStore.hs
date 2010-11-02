module BookStore where

-- BookInfo is a /type constructor/
-- Book is a /value or data constructor/
-- Int, String, and [String] are /components/ of the type
data BookInfo = Book Int String [String]
                deriving (Show)

-- Although the structures of 'MagazineInfo' and 'BookInfo' are the same, Haskell treats the types as distinct.
data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

myInfo = Book 9780135072455 "Algebra of Programming"
         ["Richard Bird", "Oege de Moor"]

-- But the names of type constructor and data constructor can be the same, because they\'re always used in different scenarios.
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

-- file: ch03/Book.hs
-- Algebraic Data Types, the one can have more than one value constructor
-- Don't call them ADT.
data Bool = False | True

-- | BillingInfo
--
-- >>> :type CreditCard
-- CreditCard :: CardNumber -> CardHolder -> Address -> BillingInfo
-- >>> CreditCard "2901650221064486" "Thomas Gradgrind" ["Dickens", "England"]
-- CreditCard "2901650221064486" "Thomas Gradgrind" ["Dickens","England"]
-- >>> :type it
-- it :: BillingInfo
--
-- >>> Invoice
-- <BLANKLINE>
-- <interactive>:1:0:
--    No instance for (Show (CustomerID -> BillingInfo))
--      arising from a use of `print' at <interactive>:1:0-6
--    Possible fix:
--      add an instance declaration for (Show (CustomerID -> BillingInfo))
--    In a stmt of an interactive GHCi command: print it
--
type CardHolder = String
type CardNumber = String
type Address = [String]
data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving (Show)

-- | Book properties
--
-- >>> bookID (Book 3 "Probability Theory" ["E.T.H. Jaynes"])
-- 3
-- >>> bookTitle (Book 3 "Probability Theory" ["E.T.H. Jaynes"])
-- "Probability Theory"
-- >>> bookAuthors (Book 3 "Probability Theory" ["E.T.H. Jaynes"])
-- ["E.T.H. Jaynes"]
--
bookID (Book id _ _) = id
bookTitle (Book _ title _) = title
bookAuthors (Book _ _ authors) = authors

-- | Customer
--
-- >>> :type customerID
-- customerID :: Customer -> CustomerID
-- >>> let customer1 = Customer { customerID = 123, customerAddress = ["abc"], customerName = "foo" }
-- >>> customer1
-- Customer {customerID = 123, customerName = "foo", customerAddress = ["abc"]}
-- >>> customerName customer1
-- "foo"
--
data Customer = Customer {
      customerID      :: CustomerID
    , customerName    :: String
    , customerAddress :: Address
    } deriving (Show)
