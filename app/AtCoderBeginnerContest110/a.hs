module Main where

import Data.List (sort)

main :: IO ()
main = do
  [a, b, c] <- map read . words <$> getLine
  print $ f a b c

f :: Int -> Int -> Int -> Int
f a b c = max' * 10 + mid + min'
  where
    [min', mid, max'] = sort [a, b, c]

tests, test1, test2, test3 :: Bool
tests = test1 && test2 && test3
test1 = f 1 5 2 == 53
test2 = f 9 9 9 == 108
test3 = f 6 6 7 == 82
