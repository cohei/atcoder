module AtCoderBeginnerContest148.C (main) where

main :: IO ()
main = do
  [a, b] <- map read . words <$> getLine
  print $ solve a b

solve :: Int -> Int -> Int
solve = lcm
