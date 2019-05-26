module AtCoderBeginnerContest128.D (main) where

import           Control.Exception (assert)

main :: IO ()
main = do
  [n, k] <- map read . words <$> getLine
  values <- map read . words <$> getLine
  assert (length values == n) $
    print $ solve k values

solve :: Int -> [Int] -> Int
solve k values = _
