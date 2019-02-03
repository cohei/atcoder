module AtCoderBeginnerContest117.C (main) where

import           Control.Exception (assert)
import           Data.List         (sort)

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  xs <- map read . words <$> getLine
  assert (length xs == m) $ print $ solve n m xs

solve :: Int -> Int -> [Int] -> Int
solve n m = sum . take (m - n) . sort . withAdjacent (flip (-)) . sort

withAdjacent :: (a -> a -> b) -> [a] -> [b]
withAdjacent _ []        = error "empty"
withAdjacent f xs@(_:ys) = zipWith f xs ys
