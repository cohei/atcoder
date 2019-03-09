{-# LANGUAGE TupleSections #-}
module AtCoderBeginnerContest120.D (main) where

import           Control.Monad       (foldM, replicateM, unless, when)
import           Control.Monad.ST    (ST, runST)
import           Data.Foldable       (for_)
import qualified Data.Vector         as V (enumFromTo, thaw)
import           Data.Vector.Mutable (STVector)
import qualified Data.Vector.Mutable as V (read, write)

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  bridges <- replicateM m $ do
    [a, b] <- map read . words <$> getLine
    pure (a, b)
  for_ (solve n bridges) print

type Island = Int
type Bridge = (Island, Island)
type Inconvenience = Int

solve :: Int -> [Bridge] -> [Inconvenience]
solve n bridges =
  tail $ runST $ do
    uf <- toUnionFind n

    let
      f [] _ = error "first arguement will not be empty"
      f is@(inconvenience : _) (i1, i2) = do
        (s1, contain1) <- find i1 uf
        (s2, contain2) <- find i2 uf
        let bothContained = contain1 == contain2

        unless bothContained $ unite i1 i2 uf

        pure $ (inconvenience - (if bothContained then 0 else s1 * s2)) : is

    foldM f [maxInconvenience] $ reverse bridges
  where
    maxInconvenience :: Inconvenience
    maxInconvenience = n * (n - 1) `div` 2

type Size = Int
type UnionFind s a = STVector s (Size, a)

toUnionFind :: Int -> ST s (UnionFind s Int)
toUnionFind n = V.thaw $ (1,) <$> V.enumFromTo 0 n

find :: Int -> UnionFind s Int -> ST s (Size, Int)
find i uf = do
  (s, i') <- V.read uf i

  if i' == i
    then pure (s, i)
    else do
      (s', i'') <- find i' uf
      V.write uf i' (s', i'') -- path compression
      pure (s', i'')

unite :: Int -> Int -> UnionFind s Int -> ST s ()
unite i1 i2 uf = do
  (s1, representative1) <- find i1 uf
  (s2, representative2) <- find i2 uf

  when (representative1 /= representative2) $ do
    V.write uf representative1 (s1, representative2)
    V.write uf representative2 (s1 + s2, representative2)

{-
-- 素朴なリストでは TLE

type UnionFind a = [[a]]

toUnionFind :: [a] -> UnionFind a
toUnionFind = map pure

find :: Eq a => a -> UnionFind a -> (Size, [a])
find x xss =
  let
    xs = fromJust $ L.find (x `elem`) xss
  in
    (length xs, xs)

union :: Eq a => a -> a -> UnionFind a -> UnionFind a
union x1 x2 xss =
  let
    (contain1, notContain1) = partition (x1 `elem`) xss
    (contain2, notContain2) = partition (x2 `elem`) xss
    containNeither = notContain1 `intersect` notContain2
  in
    (head contain1 ++ head contain2) : containNeither
-}
