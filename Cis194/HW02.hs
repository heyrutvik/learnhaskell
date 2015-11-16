{-# OPTIONS_GHC -Wall #-}
module Cis194.HW02 where

-- Mastermind -----------------------------------------

-- A peg can be one of six colors
data Peg = Red | Green | Blue | Yellow | Orange | Purple
         deriving (Show, Eq, Ord)

-- A code is defined to simply be a list of Pegs
type Code = [Peg]

-- A move is constructed using a Code and two integers; the number of
-- exact matches and the number of regular matches
data Move = Move Code Int Int
          deriving (Show, Eq)

-- List containing all of the different Pegs
colors :: [Peg]
colors = [Red, Green, Blue, Yellow, Orange, Purple]

-- Exercise 1 -----------------------------------------

-- Get the number of exact matches between the actual code and the guess
exactMatches :: Code -> Code -> Int
exactMatches xs ys = sum [1 | xy <- zip xs ys, uncurry (==) xy]
-- naive impls
exactMatches1 :: Code -> Code -> Int
exactMatches1 xs ys = sum [1 | xy <- zip xs ys, fst(xy) == snd(xy)]

-- Exercise 2 -----------------------------------------

-- For each peg in xs, count how many times is occurs in ys
countColors :: Code -> [Int]
countColors = go colors
              where
                go :: [Peg] -> Code -> [Int]
                go [] _ = []
                go (x:xs) ys = (sum [1 | y <- ys, y == x]) : go xs ys

-- Count number of matches between the actual code and the guess
matches :: Code -> Code -> Int
matches c1 c2 = sum $ map (temp) $ zip (countColors c1) (countColors c2)
                where
                  temp = uncurry (min)

-- Exercise 3 -----------------------------------------

-- Construct a Move from a guess given the actual code
getMove :: Code -> Code -> Move
getMove s g = Move g (exactMatches s g) (matches s g)

-- Exercise 4 -----------------------------------------

isConsistent :: Move -> Code -> Bool
isConsistent (Move g e m) c = (e == exactMatches g c) && (m == matches g c)

-- Exercise 5 -----------------------------------------

filterCodes :: Move -> [Code] -> [Code]
filterCodes m cs = filter p cs
                   where
                     p = isConsistent m

-- Exercise 6 -----------------------------------------

allCodes :: Int -> [Code]
allCodes 0 = [[]]
allCodes n = [c:cs | c <- colors, cs <- allCodes (n-1)]

-- Exercise 7 -----------------------------------------

solve :: Code -> [Move]
solve secret = go secret (allCodes 6)
          where
            go :: Code -> [Code] -> [Move]
            go _ [] = []
            go s (c:cs)
              | c == s = [gm]
              | otherwise = gm : (go s $ filterCodes gm cs)
              where
                gm = getMove s c

-- Bonus ----------------------------------------------

fiveGuess :: Code -> [Move]
fiveGuess = undefined
