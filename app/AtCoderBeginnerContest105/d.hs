module Main where

import           Data.List (inits, tails)

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  as <- take n . map read . words <$> getLine
  -- print $ f m as
  print $ g m as

g :: Int -> [Int] -> Int
g m = length . filter ((0 ==) . (`mod` m)) . concatMap (scanl1 (+)) . init . tails


f :: Int -> [Int] -> Int
f m = length . filter ((0 ==) . (`mod` m)) . map sum . sections

sections :: [a] -> [[a]]
sections = concatMap (tail . inits) . init . tails

tests :: [Bool]
tests = [test1, test2, test3]

test1, test2, test3 :: Bool
test1 = f 2 [4, 1, 5] == 3
test2 = f 17 [29, 7, 5, 7, 9, 51, 7, 13, 8, 55, 42, 9, 81] == 6
test3 = f 400000000 [1000000000, 1000000000, 1000000000, 1000000000, 1000000000, 1000000000, 1000000000, 1000000000, 1000000000, 1000000000] == 25
