module AtCoderBeginnerContest113.A (main) where

main :: IO ()
main = do
  [x, y] <- map read . words <$> getLine
  print $ f x y

f :: Int -> Int -> Int
f x y = x + y `div` 2
