module AtCoderBeginnerContest148.B (main) where

import           Control.Exception (assert)

main :: IO ()
main = do
  n <- readLn
  [a, b] <- words <$> getLine
  assert (length a == n && length b == n) $
    putStrLn $ solve a b

solve :: String -> String -> String
solve a b = concat $ zipWith (\c1 c2 -> [c1, c2]) a b
