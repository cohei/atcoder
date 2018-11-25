module DwangoProgrammingContestV.B (main) where

import           Data.Bits ((.&.))
import           Data.List (foldl1', inits, tails)

main :: IO ()
main = do
  [n, k] <- take 2 . map read . words <$> getLine
  as <- take n . map read . words <$> getLine
  print $ f k as

-- C004_scrambled 以降 TLE
f :: Int -> [Int] -> Int
f k =
  maximum .
  map (foldl1' (.&.)) .
  combinations k .
  map sum .
  concatMap (tail . inits) .
  init . tails

combinations :: Int -> [a] -> [[a]]
combinations 0 _      = [[]]
combinations _ []     = []
combinations n (x:xs) = map (x:) (combinations (n - 1) xs) ++ combinations n xs
