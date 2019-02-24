module AtCoderBeginnerContest119.D (main) where

import           Control.Applicative (liftA2)
import           Control.Monad       (replicateM)
import           Data.Maybe          (catMaybes)
import           Data.Set            (Set, fromAscList, lookupGE, lookupLE)

main :: IO ()
main = do
  [a, b, q] <- map read . words <$> getLine
  ss <- fromAscList <$> replicateM a readLn
  ts <- fromAscList <$> replicateM b readLn
  xs <- replicateM q readLn
  mapM_ print $ solveAll ss ts xs

solveAll :: Set Int -> Set Int -> [Int] -> [Int]
solveAll = (map .) . solve

solve :: Set Int -> Set Int -> Int -> Int
solve ss ts x =
  let
    ss' = nearest x ss
    ts' = nearest x ts
  in
    minimum $
    map (\(s, t) -> difference x s + difference s t) $
    liftA2 (,) ss' ts' ++ liftA2 (,) ts' ss'

difference :: Num a => a -> a -> a
difference = (abs .) . subtract

nearest :: Int -> Set Int -> [Int] -- return 0 - 2 length list
nearest x xs = catMaybes [lookupLE x xs, lookupGE x xs]
