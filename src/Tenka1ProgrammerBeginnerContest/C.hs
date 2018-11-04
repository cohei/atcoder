module Tenka1ProgrammerBeginnerContest.C (main) where

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
