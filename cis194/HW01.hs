{-# OPTIONS_GHC -Wall #-}
module HW01 where

-- Exercise 1 -----------------------------------------

-- Get the last digit from a number
lastDigit :: Integer -> Integer
lastDigit n = n `mod` 10

-- Drop the last digit from a number
dropLastDigit :: Integer -> Integer
dropLastDigit n = (n - (lastDigit n)) `div` 10

-- Exercise 2 -----------------------------------------

toRevDigits :: Integer -> [Integer]
toRevDigits n
  | n <= 0 = []
  | otherwise = (lastDigit n) :  toRevDigits (dropLastDigit n)

-- Exercise 3 -----------------------------------------

-- Double every second number in a list starting on the left.
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther (x:xs) = (x) : (head xs * 2) : doubleEveryOther (tail xs)

-- Exercise 4 -----------------------------------------
sumDigit :: Integer -> Integer
sumDigit n
  | n == 0 = 0
  | otherwise = (lastDigit n) + sumDigit (dropLastDigit n)

-- Calculate the sum of all the digits in every Integer.
sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs) = sumDigit x + sumDigits xs

-- Exercise 5 -----------------------------------------

-- Validate a credit card number using the above functions.
luhn :: Integer -> Bool
luhn n = 
  if sumDigits (doubleEveryOther (toRevDigits n)) `mod` 10 == 0
  then True
  else False


-- Exercise 6 -----------------------------------------

-- Towers of Hanoi for three pegs
type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi = undefined
