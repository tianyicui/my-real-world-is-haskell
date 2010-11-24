data DatInt = D Int
    deriving (Eq, Ord, Show)

newtype NewtypeInt = N Int
    deriving (Eq, Ord, Show)

-- `newtype` doesn't define new constructor that exists at runtime,
-- it's just a name alias, a type coerce occurs only at compile time.
