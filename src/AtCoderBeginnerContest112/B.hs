module AtCoderBeginnerContest112.B (main) where

import           Control.Monad (replicateM)

main :: IO ()
main = do
  [n, limit] <- map read . words <$> getLine
  cts <- map ((\[x, y] -> (x, y)) . map read . words) <$> replicateM n getLine
  putStrLn $ maybe "TLE" show $ f limit cts

f :: Int -> [(Int, Int)] -> Maybe Int
f limit =
  (\xs -> if null xs then Nothing else Just (minimum xs)) .
  map fst .
  filter ((<= limit) . snd)

tests, test1, test2, test3 :: Bool
tests = test1 && test2 && test3
test1 = f 70 [(7, 60), (1, 80), (4, 50)] == Just 4
test2 = f 3 [(1, 1000), (2, 4), (3, 1000), (4, 500)] == Nothing
test3 = f 9 [(25, 8), (5, 9), (4, 10), (1000, 1000), (6, 1)] == Just 5
