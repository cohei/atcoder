module AtCoderBeginnerContest120.B (main, canDivide) where

main :: IO ()
main = do
  [a, b, k] <- map read . words <$> getLine
  print $ solve a b k

solve :: Int -> Int -> Int -> Int
solve a b k = filter (\n -> n `canDivide` a && n `canDivide` b) (reverse [1 .. min a b]) !! (k - 1)

canDivide :: Integral a => a -> a -> Bool
k `canDivide` n = mod n k == 0
