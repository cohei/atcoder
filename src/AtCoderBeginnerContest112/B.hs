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
