module AtCoderBeginnerContest119.C (main, isSynthesyzed) where

import           Control.Monad (replicateM)

main :: IO ()
main = do
  [n, a, b, c] <- map read . words <$> getLine
  ls <- replicateM n readLn
  print $ solve (a, b, c) ls

solve :: (Int, Int, Int) -> [Int] -> Int
solve (a, b, c) ls = 1

isSynthesyzed :: (Int, Int, Int) -> [Int] -> Bool
isSynthesyzed (a, b, c) ls = all (`elem` ls) [a, b, c]
