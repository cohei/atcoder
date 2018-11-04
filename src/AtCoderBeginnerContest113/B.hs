module AtCoderBeginnerContest113.B (main) where

import           Data.List (minimumBy)
import           Data.Ord  (comparing)

main :: IO ()
main = do
  n <- readLn
  [t, a] <- map read . words <$> getLine
  hs <- take n . map read . words <$> getLine
  print $ f t a hs

f :: Int -> Int -> [Int] -> Int
f t a =
  fst .
  minimumBy (comparing $ difference (fromIntegral a) . averageTemperature t . snd) .
  zip [1..]

averageTemperature :: Int -> Int -> Double
averageTemperature t height = fromIntegral t - fromIntegral height * 0.006

difference :: Num a => a -> a -> a
difference = (abs .) . subtract
