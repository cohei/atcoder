module AtCoderBeginnersSelection.ABC083B (main) where

import           Data.List  (unfoldr)
import           Data.Tuple (swap)

main :: IO ()
main = do
  [n, a, b] <- map read . words <$> getLine
  print $ solve n a b

solve :: Int -> Int -> Int -> Int
solve n a b = sum $ filter (\i -> let s = sum (digits i) in a <= s && s <= b) [1..n]

digits :: Integral a => a -> [a]
digits = unfoldr step
  where
    step n = if n == 0 then Nothing else Just (swap (divMod n 10))
