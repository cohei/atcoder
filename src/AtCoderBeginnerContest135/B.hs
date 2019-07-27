module AtCoderBeginnerContest135.B (main) where

import           Control.Exception (assert)

main :: IO ()
main = do
  n <- readLn
  ps <- map read . words <$> getLine
  assert (length ps == n) $
    putStrLn $ if solve n ps then "YES" else "NO"

solve :: Int -> [Int] -> Bool
solve n = (<= 2) . length . filter not . zipWith (==) [1..n]
