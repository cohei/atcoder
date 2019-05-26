module AtCoderBeginnerContest128.D (main) where

import           Control.Exception (assert)
import           Data.List         (partition, sort)
import           Data.Monoid       ((<>))

main :: IO ()
main = do
  [n, k] <- map read . words <$> getLine
  values <- map read . words <$> getLine
  assert (length values == n) $
    print $ solve n k values

solve :: Int -> Int -> [Int] -> Int
solve n k dequeue = maximum $ map (\(a, b) -> operation k a b dequeue) $ cases n k

operation :: Int -> Int -> Int -> [Int] -> Int
operation k a b dequeue =
  let
    (notNegatives, negatives) = partition (>= 0) $ (takeLeft a <> takeRight b) dequeue
  in
    sum $ notNegatives ++ drop (k - a - b) (sort negatives)

takeLeft, takeRight :: Int -> [a] -> [a]
takeLeft = take
takeRight n = take n . reverse

cases :: Int -> Int -> [(Int, Int)]
cases n k = [ (a, b) | ab <- [0 .. min n k], a <- [0 .. ab], let b = ab - a ]
