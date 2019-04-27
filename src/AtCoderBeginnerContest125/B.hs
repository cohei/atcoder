module AtCoderBeginnerContest125.B (main) where

import           Control.Exception (assert)

main :: IO ()
main = do
  n <- readLn
  vs <- map read . words <$> getLine
  cs <- map read . words <$> getLine
  assert (length vs == n && length cs == n) $
    print $ solve vs cs

solve :: [Int] -> [Int] -> Int
solve vs cs = sum $ filter (> 0) $ zipWith (-) vs cs
