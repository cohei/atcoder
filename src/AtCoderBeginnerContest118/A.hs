module AtCoderBeginnerContest118.A (main) where

main :: IO ()
main = do
  [a, b] <- map read . words <$> getLine
  print $ solve a b

solve :: Int -> Int -> Int
solve a b
  | b `mod` a == 0 = a + b
  | otherwise      = b - a
