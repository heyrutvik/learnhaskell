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
