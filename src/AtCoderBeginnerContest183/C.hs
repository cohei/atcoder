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

type City = Int
type DistanceTable = Map (City, City) Int

toDistanceTable :: [[Int]] -> DistanceTable
toDistanceTable =
  fromAscList .
  concatMap (\(i, xs) -> map (\(j, n) -> ((i, j), n)) xs) . zip [1..] . map (zip [1..])

solve :: Int -> Int -> DistanceTable -> Int
solve n k distances = length $ filter (== k) $ map totalDistance $ routes n
  where
    totalDistance :: [City] -> Int
    totalDistance = sum . (zipWith distance <*> tail)

    distance :: City -> City -> Int
    distance i j = distances ! (i, j)

routes :: Int -> [[Int]]
routes n = map (([1] <>) . (<> [1])) $ permutations [2..n]
