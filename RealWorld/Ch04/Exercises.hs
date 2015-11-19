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
-- break' split line on first false
break' :: (a -> Bool) -> [a] -> ([a], [a])
break' p xs = ((takeWhile p xs), (dropWhile p xs))

-- dropWhile drop elements while p is true
-- dropWhile' drop elements while p is false
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' p xs = dropWhile q xs
                  where q n = not (p n)

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith p xs = let (pre, suf) = break' p xs
                 in pre : case suf
                          of
                            zs -> splitWith p (dropWhile' p zs)
