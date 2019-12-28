module AtCoderGrandContest041.A (main) where

main :: IO ()
main = do
  [n, a, b] <- map read . words <$> getLine
  print $ solve n a b

solve :: Integer -> Integer -> Integer -> Integer
solve n a b
  | odd (b - a) = (min ((n - a) + (n - b)) ((a - 1) + (b - 1)) + 1) `div` 2
  | otherwise = (b - a) `div` 2
