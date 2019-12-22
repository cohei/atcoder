module AtCoderBeginnersSelection.ABC088B (main) where

import           Control.Exception (assert)
import           Data.List         (sortOn)
import           Data.Ord          (Down (Down))

main :: IO ()
main = do
  n <- readLn
  as <- map read . words <$> getLine
  assert (length as == n) $
    print $ solve as

solve :: [Int] -> Int
solve cards =
  let
    (alice, bob) = split $ sortOn Down cards
  in
    sum alice - sum bob

split :: [a] -> ([a], [a])
split [] = ([], [])
split [x] = ([x], [])
split (x:y:xs) =
  let
    (xs', ys') = split xs
  in
    (x : xs', y : ys')
