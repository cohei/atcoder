module Diverta2019.A (main) where

main :: IO ()
main = do
  [n, k] <- map read . words <$> getLine
  print $ solve n k

solve :: Int -> Int -> Int
solve n k = n - k + 1
