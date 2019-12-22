module AtCoderBeginnersSelection.ABC085C (main) where

import           Control.Monad (guard)

main :: IO ()
main = do
  [n, y] <- map read . words <$> getLine
  putStrLn $ display $ solve n y

display :: [(Int, Int, Int)] -> String
display [] = "-1 -1 -1"
display ((n10000, n5000, n1000) : _) = unwords $ map show [n10000, n5000, n1000]

solve :: Int -> Int -> [(Int, Int, Int)]
solve n y = do
  n10000 <- [0 .. n]
  n5000  <- [0 .. n - n10000]
  let n1000 = n - n10000 - n5000
  guard $ 10000 * n10000 + 5000 * n5000 + 1000 * n1000 == y
  pure (n10000, n5000, n1000)
