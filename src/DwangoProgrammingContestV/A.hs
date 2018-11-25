module DwangoProgrammingContestV.A (main) where

import           Data.List (genericLength, minimumBy)
import           Data.Ord  (comparing)

main :: IO ()
main = do
  n <- readLn
  as <- take n . map read . words <$> getLine
  print $ f as

f :: [Int] -> Int
f as =
  fst .
  minimumBy (comparing (abs . subtract average . fromIntegral . snd)) .
  zip [0..] $ as
  where
    average :: Double
    average = fromIntegral (sum as) / genericLength as
