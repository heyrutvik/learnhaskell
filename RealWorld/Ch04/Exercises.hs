module RealWorld.Ch04.Exercises where

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
