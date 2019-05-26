module AtCoderBeginnerContest128.A (main) where

main :: IO ()
main = do
  [a, p] <- map read . words <$> getLine
  print $ solve a p

solve :: Int -> Int -> Int
solve a p = (a * 3 + p) `div` 2
