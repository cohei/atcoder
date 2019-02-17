module AtCoderBeginnerContest118.D (main) where

import           Control.Exception (assert)
import           Data.List         (sortOn)
import           Data.Ord          (Down (Down))

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  as <- map read . words <$> getLine
  assert (length as == m) $
    putStrLn $ concatMap show $ solve n as

solve :: Int -> [Int] -> [Int]
solve n as =
  sortOn Down $ solve' (map (\a -> (a, nMatch a)) as) n []

solve' :: [(Int, Int)] -> Int -> [Int] -> [Int]
solve' [] _ _ = []
solve' as@((i, m) : rest) n ds
  | i > n = solve' rest n ds
  | i == n = ds
  | otherwise = solve' as (n - m) (i : ds)

nMatch :: Int -> Int
nMatch = ([2, 5, 5, 4, 5, 6, 3, 7, 6] !!) . subtract 1
