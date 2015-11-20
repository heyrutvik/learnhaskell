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
squareList xs = loop [] xs
                where
                  loop out [] = reverse out
                  loop out (i:inp) = let square = i * i
                                     in loop (square:out) inp

-- no need to create loop, simply create new list with operation
squareList1 [] = []
squareList1 (x:xs) = x*x : squareList1 xs

map1 :: (a -> b) -> [a] -> [b]
map1 _ [] = []
map1 f (x:xs) = f x : map1 f xs

-- using higher-order function map
squareList2 xs = map1 square xs
                 where square x = x * x
