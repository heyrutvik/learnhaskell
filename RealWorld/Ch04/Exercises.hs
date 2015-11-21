module RealWorld.Ch04.Exercises where
import Data.Char (digitToInt)

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (_:xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast (x:[]) = Just x
safeLast (_:xs) = safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit xs = Just (go xs)
              where
                go :: [a] -> [a]
                go [] = []
                go (_:[]) = []
                go (y:ys) = y : (go ys)

-- break split list on first true
-- break1 split line on first false
break1 :: (a -> Bool) -> [a] -> ([a], [a])
break1 p xs = ((takeWhile p xs), (dropWhile p xs))

-- another break
break2 :: (t -> Bool) -> [t] -> ([t], [t])
break2 p xs = break q xs
               where q n = not (p n)

-- TODO write break without using any built-in functions

-- dropWhile drop elements while p is true
-- dropWhile1 drop elements while p is false
dropWhile1 :: (a -> Bool) -> [a] -> [a]
dropWhile1 p xs = dropWhile q xs
                  where q n = not (p n)

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith p xs = let (pre, suf) = break1 p xs
                 in pre : splitWith p (dropWhile1 p suf) 

-- string to int using fold
asInt_fold :: String -> Integer
asInt_fold (c:cs) | c == '-' = -1 * (foldl step 0 cs)
                  | otherwise = foldl step 0 (c:cs)
  where step acc z | z == '.' = error "whole number please!"
                   | otherwise = toInteger acc * 10 + toInteger (digitToInt z)
asInt_fold _ = 0

-- concat using fold
concat2 :: [[a]] -> [a]
concat2 xss = foldr (++) [] xss

-- concat using explicit recursion
concat3 :: [[a]] -> [a]
concat3 (xs:xss) = xs ++ concat3 xss
concat3 [] = []

-- takeWhile using explicit recursion
-- take empty list as acc
-- insert elem while p is true
-- otherwise return reverse acc
takeWhile2 :: (a -> Bool) -> [a] -> [a]
takeWhile2 p xs = loop [] xs
  where
    loop acc (y:ys) | p y = loop (y:acc) ys
                    | otherwise = reverse acc
    loop acc _ = reverse acc
