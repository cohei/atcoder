module AtCoderBeginnerContest123.C (main) where

import           Control.Monad (replicateM)

main :: IO ()
main = do
  n <- readLn
  capacities <- replicateM 5 readLn
  print $ solve n capacities

solve :: Int -> [Int] -> Int
solve n capacities = 5 + (n - 1) `div` minimum capacities
