module Distinction where
-- | Two tuples with elements of the same type are structurally identical, so they have the same type.
--
-- >>> :type a
-- a :: ([Char], [Char])
-- >>> :type b
-- b :: ([Char], [Char])
--
a = ("AA", "a")
b = ("BB", "b")

-- | Two algebraic data types have distinct types even if they are structurally equivilant, because they have different names.
--
-- >>> :type c
-- c :: CC
-- >>> :type d
-- d :: DD
--
data CC = CC String String
data DD = DD String String
c = CC "CC" "c"
d = DD "DD" "d"
