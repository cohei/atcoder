module AtCoderBeginnerContest110.A (main) where

import           Data.List (sort)

main :: IO ()
main = do
  [a, b, c] <- map read . words <$> getLine
  print $ f a b c

f :: Int -> Int -> Int -> Int
f a b c = max' * 10 + mid + min'
  where
    [min', mid, max'] = sort [a, b, c]
