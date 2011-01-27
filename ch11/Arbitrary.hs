import Test.QuickCheck (Gen)
--import System.Random (Random)

class Arbitrary a where
  arbitrary :: Gen a

  elements :: [a] -> Gen a
  choose   :: Random a => (a, a) -> Gen a
  oneof    :: [Gen a] -> Gen a

data Ternary
    = Yes
    | No
    | Unknown
    deriving (Eq, Show)

instance Arbitrary Ternary where
  arbitrary = elements [Yes, No, Unknown]

instance (Arbitrary a, Arbitrary b) => Arbitrary (a, b) where
  arbitrary = do
      x <- arbitrary
      y <- arbitrary
      return (x, y)

instance Arbitrary Char where
    arbitrary = elements (['A'..'Z'] ++ ['a'..'z'] ++ " ~!@#$%^&*()")

instance Arbitrary Doc where
    arbitrary =
        oneof [ return Empty
              , liftM  Char   arbitrary
              , liftM  Text   arbitrary
              , return Line
              , liftM2 Concat arbitrary arbitrary
              , liftM2 Union  arbitrary arbitrary ]
