module AtCoderBeginnerContest126.A (main) where

import           Control.Exception (assert)
import           Data.Char         (toLower)

main :: IO ()
main = do
  [n, k] <- map read . words <$> getLine
  s <- getLine
  assert (length s == n) $
    putStrLn $ solve k s

solve :: Int -> String -> String
solve 1 (c : cs) = toLower c : cs
solve k (c : cs) = c : solve (k - 1) cs
solve _ _        = undefined
