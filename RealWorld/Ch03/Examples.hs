module RealWorld.Ch03.Examples where

{- data Type Constructor = Value Constructor component1 component2 ... -}

data BookInfo = Book Int String [String]
                deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

type CustomerId = Int
type ReviewBody = String

data BookReview = BookReview  BookInfo CustomerId ReviewBody

type BookRecord = (BookInfo, BookReview)

type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                   | CashOnDelivery
                   | Invoice CustomerId
                     deriving (Show)

myInfo = Book 001 "Book001" ["Author1", "Author2"]

sumList :: Num a => [a] -> a
sumList (x:xs) = x + sumList xs
sumList [] = 0

complicated (True, int1, _:xs, 5) = (int1, xs)

data Customer = Customer
    { customerId :: CustomerId
    , customerName :: String
    , customerAddress :: Address
    } deriving (Show)

someBool = Nothing

data List a = Cons a (List a)
            | Nil
            deriving (Show)

fromList (x:xs) = Cons x (fromList xs)
fromList [] = Nil

data Tree a = Node a (Tree a) (Tree a)
            | Empty
            deriving (Show)

simpleTree = Node "parent"
             (Node "left child" Empty Empty)
             (Node "right child" Empty Empty)

lend amount balance = let reserve = 100
                          newBalance = balance - amount
                      in if balance < reserve
                         then Nothing
                         else Just newBalance


fromMaybe defval wrapped =
  case wrapped
  of Nothing -> defval
     Just value -> value

data Fruit = Apple | Orange | None deriving (Show)

fruitType f = case f
              of "apple" -> Apple
                 "orange" -> Orange
                 _ -> None
