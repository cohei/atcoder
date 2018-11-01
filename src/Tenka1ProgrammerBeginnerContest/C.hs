module Tenka1ProgrammerBeginnerContest.C where

import           Control.Monad (replicateM)
import           Data.List     (permutations)

main :: IO ()
main = do
  n <- readLn
  as <- replicateM n readLn
  print $ f as

f :: [Int] -> Int
-- C012_scrambled 以降 TLE
f = maximum . map (sum . (zipWith ((abs .) . subtract) <*> tail)) . permutations

tests, test1, test2, test3 :: Bool
tests = test1 && test2 && test3
test1 = f [6, 8, 1, 2, 3] == 21
test2 = f [3, 1, 4, 1, 5, 9] == 25
test3 = f [5, 5, 1] == 8
