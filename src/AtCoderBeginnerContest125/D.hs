module AtCoderBeginnerContest125.D (main) where

import           Control.Exception (assert)

main :: IO ()
main = do
  n <- readLn
  as <- map read . words <$> getLine
  assert (length as == n) $
    print $ solve as

solve :: [Int] -> Int
solve = _
