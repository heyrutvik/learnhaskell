-- count the number of lines of input

-- #3 count the number of words in a input file
countWords = interact wordCount
  where wordCount input = show (length (words input)) ++ "\n"
