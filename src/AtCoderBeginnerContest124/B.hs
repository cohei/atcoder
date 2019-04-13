module AtCoderBeginnerContest124.B (main) where

import           Control.Exception (assert)

main :: IO ()
main = do
  n <- readLn
  hs <- map read . words <$> getLine
  assert (length hs == n) $
    print $ solve hs

solve :: [Int] -> Int
solve hs = length $ filter id $ zipWith (==) hs $ scanl1 max hs
