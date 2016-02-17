module Algorithms.MaximumSubarrayProblem where
import Data.List

type Solution = ([Int], Int)

stockPrices :: [Int]
stockPrices = [100, 113, 110, 85, 105, 102, 86, 63, 81, 101, 94, 106, 101, 79, 94, 90, 97]

-- difference between the prices
dailyChange :: [Int] -> [Int]
dailyChange (x1:rest@(x2:xs)) = (x2 - x1) : dailyChange(rest)
dailyChange (_:[]) = []

-- midddle of list
mid :: [Int] -> Int
mid xs = (length xs) `div` 2

-- split half
splitHalf :: [Int] -> ([Int], [Int])
splitHalf xs = splitAt (mid xs) xs

-- max crossing sub array
maxCrossingSubArray xs = 
                    let (left, right) = splitHalf xs
                        (ls, sumLeft) = sumWhile (reverse left)
                        (rs, sumRight) = sumWhile (right)
                    in  ((concat ([reverse ls, rs])), (sumLeft + sumRight))

-- crossing sub array sum.. use reverse for left side
-- TODO refine latter
sumWhile :: [Int] -> Solution
sumWhile [] = error "crossing sub array sum: must not be null" 
sumWhile whole@(x:xs) = go xs 0 0 x x
                  where
                    -- go list currentIndex maxIndexOfReturnList tempSum returnSum
                    go :: [Int] -> Int -> Int -> Int -> Int -> Solution
                    go [] index high tempSum sum = ((take (high+1) whole), sum)
                    go (x:xs) index high tempSum sum
                        | (x + tempSum) > sum = go xs (index+1) (index+1) (x + tempSum) (x + tempSum)
                        | otherwise  = go xs (index+1) high (x + tempSum) (sum)


maxSubArray :: [Int] -> Solution
maxSubArray (x:[]) = ([x], x)
maxSubArray whole@(x:xs) 
                        | sumLeft >= sumRight && sumLeft >= sumCross = (ls, sumLeft)
                        | sumRight >= sumLeft && sumRight >= sumCross = (rs, sumRight)
                        | otherwise = (cs, sumCross)
                    where    
                        (left, right) = splitHalf whole
                        (ls, sumLeft) = maxSubArray left
                        (rs, sumRight) = maxSubArray right
                        (cs, sumCross) = maxCrossingSubArray whole
                        
main :: IO ()
main = print (maxSubArray (dailyChange stockPrices))
