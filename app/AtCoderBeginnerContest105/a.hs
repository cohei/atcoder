module Main where

main :: IO ()
main = do
  [n, k] <- map read . words <$> getLine
  print $ f n k

f :: Int -> Int -> Int
f n k = if n `mod` k == 0 then 0 else 1
