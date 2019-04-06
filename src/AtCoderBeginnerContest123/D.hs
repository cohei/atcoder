module AtCoderBeginnerContest123.D (main) where

import           Control.Exception (assert)
import           Data.Foldable     (for_)
import           Data.List         (sortOn)
import           Data.Ord          (Down (Down))

main :: IO ()
main = do
  [x, y, z, k] <- map read . words <$> getLine
  as <- map read . words <$> getLine
  bs <- map read . words <$> getLine
  cs <- map read . words <$> getLine
  assert (length as == x && length bs == y && length cs == z) $
    for_ (solve k as bs cs) print

solve :: Int -> [Int] -> [Int] -> [Int] -> [Int]
solve k as bs cs =
  let
    asbs = take k $ sortOn Down $ (+) <$> as <*> bs
  in
    take k $ sortOn Down $ (+) <$> asbs <*> cs
