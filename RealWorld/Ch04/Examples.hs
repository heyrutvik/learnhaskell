module RealWorld.Ch04.Examples where
import Data.Char (digitToInt)

-- Basic List Manipulation

-- Which ones crash when given an empty list? head, tail, last and init.

-- use null to check if list is empty! it runs in constant time.
handleNullList1 :: [Char] -> Char
handleNullList1 xs = if not (null xs)
                     then head xs
                     else 'Z'

handleNullList2 :: [Char] -> Char
handleNullList2 [] = 'Z'
handleNullList2 (x:_) = x

{--
PARTIAL FUNCTIONS
RETURN VALUES DEFINED FOR A SUBSET OF VALID INPUTS

TOTAL FUNCTIONS
RETURN VALID RESULTS OVER THEIR ENTIRE INPUT DOMAINS
--}

-- loop example
asInt :: String -> Int
asInt cs = loop 0 cs
           where
             loop :: Int -> [Char] -> Int
             loop acc [] = acc
             loop acc (x:xs) = let acc' = acc * 10 + digitToInt x
                               in loop acc' xs

-- loop square
squareList :: Num a => [a] -> [a]
squareList xs = loop [] xs
                where
                  loop out [] = reverse out
                  loop out (i:inp) = let square = i * i
                                     in loop (square:out) inp

-- no need to create loop, simply create new list with operation
squareList1 :: Num a => [a] -> [a]
squareList1 [] = []
squareList1 (x:xs) = x*x : squareList1 xs

-- map element using function f
map1 :: (a -> b) -> [a] -> [b]
map1 _ [] = []
map1 f (x:xs) = f x : map1 f xs

-- using higher-order function map
squareList2 :: Num a => [a] -> [a]
squareList2 xs = map1 square xs
                 where square x = x * x

-- filter element using predicate p
-- order of definition matters
-- _ to ignore value
filter1 :: (a -> Bool) -> [a] -> [a]
filter1 p (x:xs)
  | p x = x : filter1 p xs
  | otherwise = filter1 p xs
filter1 _ _ = []

-- foldl
foldl2 :: (b -> a -> b) -> b -> [a] -> b
foldl2 f acc (x:xs) = foldl2 f (f acc x) xs
foldl2 _ acc [] = acc

-- foldl using pair
pairTest :: Num a => [a] -> a
pairTest xs = let (a,b) = foldl2 step (0,0) xs
              in a + b
  where step (a,b) x = (a+x, b+x)

-- foldr
-- 1st arg -> acc
foldr2 :: (a -> b -> b) -> b -> [a] -> b
foldr2 f acc (x:xs) = f x (foldr2 f acc xs)
foldr2 _ acc [] = acc

-- filter using foldr
filter2 :: (a -> Bool) -> [a] -> [a]
filter2 p xs = foldr2 step [] xs
               where
                 step x ys | p x = x : ys
                           | otherwise = ys

-- map using foldr
map2 :: (a -> b) -> [a] -> [b]
map2 f xs = foldr2 step [] xs
  where step x ys = f x : ys

-- foldl using foldr
-- TODO evaluate by hand
foldl3 :: (b -> a -> b) -> b -> [a] -> b
foldl3 f acc xs = foldr2 step id xs acc
  where step x g a = g (f a x)

append :: [a] -> [a] -> [a]
append xs ys = foldr2 (:) ys xs
