module AtCoderBeginnerContest120.A (main) where

main :: IO ()
main = do
  [a, b, c] <- map read . words <$> getLine
  print $ solve a b c

solve :: Int -> Int -> Int -> Int
solve = (min .) . flip div
