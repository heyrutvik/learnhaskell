module Ch03.Exercises where

data List a = Cons a (List a)
              | Nil
              deriving (Show)

toList :: List a -> [a]
toList Nil = []
toList (Cons x xs) = x : toList xs

data Tree a = Node a (Maybe (Tree a)) (Maybe (Tree a)) deriving (Show)

maybeChild1 = Node "parent" (Nothing) (Nothing)

maybeChild2 = Node "parent" (Just (Node "left child" Nothing Nothing)) (Just (Node "right child" Nothing Nothing))

-- get length of list
-- getLength :: [a] -> Int is type what I thought it has, ghci told me this
getLength :: Num a => [a] -> a
getLength [] = 0
getLength (_:xs) = 1 + getLength xs

-- sum of all elements
getSum :: Num a => [a] -> a
getSum [] = 0
getSum (x:xs) = x + getSum xs

-- count mean of list
getMean :: Fractional a => [a] -> a
getMean [] = error "undefined"
getMean xs = (getSum xs) / (getLength xs)

-- reverse list
getReverse :: [a] -> [a]
getReverse zs = go [] zs
  where
    go :: [a] -> [a] -> [a]
    go xs [] = xs
    go xs (y:ys) = go (y:xs) ys

-- join two list
joinList :: [a] -> [a] -> [a]
joinList [] ys = ys
joinList (x:xs) ys = x : joinList xs ys

-- turn list into a palindrome
getPalindrome :: [a] -> [a]
getPalindrome xs = joinList xs (getReverse xs)
