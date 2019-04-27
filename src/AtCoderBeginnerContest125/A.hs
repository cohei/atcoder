module AtCoderBeginnerContest125.A (main) where

main :: IO ()
main = do
  [a, b, t] <- map read . words <$> getLine
  print $ solve a b t

solve :: Int -> Int -> Int -> Int
solve a b t = (t `div` a) * b
