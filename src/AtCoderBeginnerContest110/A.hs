{-# LANGUAGE MultiWayIf #-}
module AtCoderBeginnerContest110.A (main) where

main :: IO ()
main = do
  [a, b, c] <- map read . words <$> getLine
  print $ f a b c

f :: Int -> Int -> Int -> Int
f a b c = max' * 10 + sum others
  where
    (max', others) =
      if
        | a >= b && a >= c -> (a, [b, c])
        | b >= c && b >= a -> (b, [c, a])
        | otherwise        -> (c, [a, b])
