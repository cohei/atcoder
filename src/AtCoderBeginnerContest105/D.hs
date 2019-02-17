module AtCoderBeginnerContest105.D (main) where

import           Data.List (tails)

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  as <- take n . map read . words <$> getLine
  -- print $ f m as
  print $ g m as

g :: Int -> [Int] -> Int
g m = length . filter ((0 ==) . (`mod` m)) . concatMap (scanl1 (+)) . init . tails

{-
f :: Int -> [Int] -> Int
f m = length . filter ((0 ==) . (`mod` m)) . map sum . sections

sections :: [a] -> [[a]]
sections = concatMap (tail . inits) . init . tails
-}
