{-
Type

ghci> :t 'c'
c :: Char
ghci> :t "string"
"string" :: [Char]

:: is read as "has type of"

every expression has type.
type name has its first letter capital case.
-}

{-
Type Variable

ghci> :t head
head :: [a] -> a

-> is read as "map to"

a is type variable and that can be of any type.
funcations that have type variables are called polymorphic functions.
-}

{-
Type Classes

everything before => symbol is called a class constraint

ghci> :t (==)
(==) :: Eq a => a -> a -> Bool

read above expression as:
the equality function takes any two values that are of the same type
and returns a Bool. The type of those two values must be a
member of the Eq class.

ghci> :t (>)
(>) :: Ord a => a -> a -> Bool

ghci> :t show
show :: Show a => a -> String

ghci> :t (+)
(+) :: Num a => a -> a -> a
-}
