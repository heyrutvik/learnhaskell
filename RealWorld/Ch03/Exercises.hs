module RealWorld.Ch03.Exercises where
import Data.List
data List a = Cons a (List a)
              | Nil
              deriving (Show)

toList :: List a -> [a]
toList Nil = []
toList (Cons x xs) = x : toList xs

data MaybeTree a = MNode a (Maybe (MaybeTree a)) (Maybe (MaybeTree a)) deriving (Show)

maybeChild1 = MNode "parent" (Nothing) (Nothing)

maybeChild2 = MNode "parent" (Just (MNode "left child" Nothing Nothing)) (Just (MNode "right child" Nothing Nothing))

-- get length of list
-- getLength :: [a] -> Int is type what I thought it has, ghci told me this
getLength :: Num a => [t] -> a
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

-- split list when two successive element is same
splitWhenSame :: Eq a => [a] -> ([a], [a])
splitWhenSame zs = go [] zs
  where
    go :: Eq a => [a] -> [a] -> ([a], [a])
    go _ [] = ([], [])
    go [] (y:ys) = go (y:[]) ys
    go (x:xs) (y:ys)
      | x == y = ((x:xs), (y:ys))
      | otherwise = go (y:x:xs) (ys)

-- check list is palindrome
isPalindrome :: Eq t => [t] -> Bool
isPalindrome [] = False
isPalindrome xs =
    let tuple = splitWhenSame xs
        fs = fst (tuple)
        ss = snd (tuple)
    in (getLength fs == getLength ss) && (fs == ss)

-- example of sortBy
exampleSortBy :: [(Int, [Char])]
exampleSortBy = sortBy cp [(length a, a) | a <- ["string", "hi", "helloworld"]]
         where
           cp x y = compare x y

-- append element to list
appendTo :: [a] -> a -> [a]
appendTo [] c = c : []
appendTo (x:xs) c = x : (appendTo xs c)

ourIntersperse :: a -> [[a]] -> [a]
ourIntersperse _ [] = []
ourIntersperse _ (xs:[]) = xs
ourIntersperse c (xs:xss) = joinList (appendTo xs c) (ourIntersperse c xss)

data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

tree0, tree1, tree2, tree3 :: Tree String
tree0 = Empty
tree1 = Node "a" (Empty) (Empty)
tree2 = Node "a" (Empty) (Node "b" (Empty) (Empty))
tree3 =
    Node
        "a"
        (Node "b" (Empty) (Node "c" (Empty) (Empty)))
        (Node "d" (Node "e" (Empty) (Empty)) (Empty))

heightOfTree :: Tree a -> Int
heightOfTree Empty = 0
heightOfTree (Node _ l r) = 1 + (max (heightOfTree l) (heightOfTree r))
