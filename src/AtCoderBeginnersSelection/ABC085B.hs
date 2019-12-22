module AtCoderBeginnersSelection.ABC085B (main) where

import           Control.Monad (replicateM)
import           Data.List     (nub)

main :: IO ()
main = do
  n <- readLn
  ds <- replicateM n readLn
  print $ solve ds

solve :: [Int] -> Int
solve = length . nub
