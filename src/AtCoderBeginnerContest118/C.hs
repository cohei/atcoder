module AtCoderBeginnerContest118.C (main) where

import           Control.Exception (assert)
import           Data.List         (foldl1')

main :: IO ()
main = do
  n <- readLn
  as <- map read . words <$> getLine
  assert (length as == n) $
    print $ solve as

solve :: [Int] -> Int
solve = foldl1' gcd
