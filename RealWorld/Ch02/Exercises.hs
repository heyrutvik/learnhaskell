module RealWorld.Ch02.Exercises where
{-
#1

False :: Bool

(["foo", "bar"], 'a') :: ([[Char]], Char)

[(True, []), (False, [['a']])] :: [(Bool, [[Char]])]
-- empty list can fit in any type of list or list of any type of list, I guess
-}

{-
#2

last :: [a] -> a
From reading Type only,
valid behaviour will return last element of type a from list of type a.
return element from empty list function clearly cannot do.
-}

-- lastButOne returns element before last
-- works only for list with two or more elements
-- TODO improve function
lastButOne :: [a] -> a
lastButOne xs = xs !! (length xs - 2)
