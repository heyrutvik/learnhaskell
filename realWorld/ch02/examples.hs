{-
polymorphic function.
a is called type variable.
-}
doNothing :: a -> a
doNothing x = x

-- drop using if condition
myDrop :: Int -> [a] -> [a]
myDrop n xs = if n <= 0 || null xs
              then xs
              else myDrop (n-1) (tail xs)
