module DwangoProgrammingContestV.A (main) where

import           Data.List (minimumBy)
import           Data.Ord  (comparing)

main :: IO ()
main = do
  n <- readLn
  as <- take n . map read . words <$> getLine
  print $ f n as

f :: Int -> [Int] -> Int
f n as =
  fst .
  minimumBy (comparing (abs . subtract sum' . (n *) . snd)) .
  zip [0..] $ as
  where
    sum' = sum as
