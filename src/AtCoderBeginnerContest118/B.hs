module AtCoderBeginnerContest118.B (main) where

import           Control.Exception (assert)
import           Control.Monad     (replicateM)
import           Data.List         (foldl1', intersect)

main :: IO ()
main = do
  [n, _m] <- map read . words <$> getLine
  ass <- replicateM n $ do
    kn : as <- map read . words <$> getLine
    assert (length as == kn) $ pure as
  print $ solve ass

solve :: [[Int]] -> Int
solve = length . foldl1' intersect
