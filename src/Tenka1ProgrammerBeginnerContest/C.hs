module Tenka1ProgrammerBeginnerContest.C where

import           Control.Arrow ((&&&))
import           Control.Monad (replicateM)
import           Data.Function (on)
import           Data.List     (sort)
import           Data.Tuple    (swap)

main :: IO ()
main = do
  n <- readLn
  as <- replicateM n readLn
  print $ f n as

f :: Int -> [Int] -> Int
f n as = max (sum' cs1) (sum' cs2)
  where
    (cs1, cs2) = coefficients n
    sum' = sum . (zipWith (*) `on` sort) as

coefficients :: Int -> ([Int], [Int])
coefficients n | n < 2 = undefined
coefficients n = unzip $ zipWith ($) (cycle [id, swap]) $ map (id &&& negate) ns
  where
    ns = [1] ++ replicate (n - 2) 2 ++ [1]

tests, test1, test2, test3 :: Bool
tests = test1 && test2 && test3
test1 = f 5 [6, 8, 1, 2, 3] == 21
test2 = f 6 [3, 1, 4, 1, 5, 9] == 25
test3 = f 3 [5, 5, 1] == 8
