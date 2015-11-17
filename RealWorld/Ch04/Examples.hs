module RealWorld.Ch04.Examples where

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
