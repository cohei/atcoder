module AtCoderBeginnerContest183.C (main) where

import           Control.Exception (assert)
import           Control.Monad     (replicateM)
import           Data.List         (permutations)
import           Data.Map.Strict   (Map, fromAscList, (!))

main :: IO ()
main = do
  [n, k] <- map read . words <$> getLine
  distances <- replicateM n $ do
    ns <- map read . words <$> getLine
    assert (length ns == n) $ pure ns
  print $ solve n k $ toDistanceTable distances

type DistanceTable = Map (Int, Int) Int

toDistanceTable :: [[Int]] -> DistanceTable
toDistanceTable = fromAscList . concatMap (\(i, xs) -> map (\(j, n) -> ((i, j), n)) xs) . zip [1..] . map (zip [1..])

solve :: Int -> Int -> DistanceTable -> Int
solve n k distances =
  length $ filter (== k) $ map (sum . map (\(i, j) -> distances ! (i, j)) . (\ps -> zip ps (tail ps)) . (\ps -> 1 : (ps ++ [1]))) $ permutations [2..n]
