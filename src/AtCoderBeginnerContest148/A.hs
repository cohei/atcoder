module AtCoderBeginnerContest148.A (main) where

import           Data.List ((\\))

main :: IO ()
main = do
  a <- readLn
  b <- readLn
  print $ solve a b

solve :: Int -> Int -> Int
solve a b = head $ [1, 2, 3] \\ [a, b]
