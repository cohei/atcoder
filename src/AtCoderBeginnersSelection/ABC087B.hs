module AtCoderBeginnersSelection.ABC087B (main) where

import           Control.Monad (guard, replicateM)

main :: IO ()
main = do
  [a, b, c, x] <- replicateM 4 readLn
  print $ solve a b c x

solve :: Int -> Int -> Int -> Int -> Int
solve n500 n100 n50 total = length $ do
  c500 <- [0..n500]
  c100 <- [0..n100]
  c50  <- [0..n50]
  guard $ 500 * c500 + 100 * c100 + 50 * c50 == total
