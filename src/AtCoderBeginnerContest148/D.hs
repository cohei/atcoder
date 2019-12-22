module AtCoderBeginnerContest148.D (main) where

import           Control.Exception (assert)

main :: IO ()
main = do
  n <- readLn
  as <- map read . words <$> getLine
  assert (length as == n) $
    print $ solve n as

solve :: Int -> [Int] -> Int
solve n bricks =
  let
    l = increasing bricks
  in
    if l == 0 then -1 else n - l

increasing :: [Int] -> Int
increasing = increasing' 1 0

increasing' :: Int -> Int -> [Int] -> Int
increasing' _ len [] = len
increasing' i len (x:xs)
  | x == i    = increasing' (i + 1) (len + 1) xs
  | otherwise = increasing' i len xs
