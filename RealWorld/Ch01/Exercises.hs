module RealWorld.Ch01.Exercises where

-- #3 count the number of words in a input file
countWords = interact wordCount
  where wordCount input = show (length (words input)) ++ "\n"

-- #4 number of characters
countChars = interact wordCount
  where wordCount input = show (length input) ++ "\n"
