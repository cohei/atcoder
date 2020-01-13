module AtCoderBeginnerContest151.B (main) where

import           Control.Exception (assert)
import           Data.Maybe        (fromMaybe)

main :: IO ()
main = do
  [n, k, m] <- map read . words <$> getLine
  as <- map read . words <$> getLine
  assert (length as == n - 1) $
    print $ fromMaybe (-1) $ solve n k m as

solve :: Int -> Int -> Int -> [Int] -> Maybe Int
solve n k m as =
  let
    pointNeeded = n * m - sum as
  in
    if pointNeeded > k then Nothing else Just (max 0 pointNeeded)
