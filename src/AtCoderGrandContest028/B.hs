{-# LANGUAGE RecordWildCards #-}
module AtCoderGrandContest028.B where

import Data.Tree
import Control.Exception (assert)
import Control.Monad (join)

main :: IO ()
main = do
  n <- readLn
  as <- map read . words <$> getLine
  assert (length as == n) $ return ()
  print $ f as

f :: Integral a => [a] -> a
f = undefined

g :: Integral a => (Int, Int) -> [a] -> a
g (begin, end) as = undefined

next :: [a] -> [[a]]
next [] = []
next (x:xs) = xs : map (x:) (next xs)

-- >>> allSteps [1]
-- [[[1]]]
-- >>> allSteps [1, 2]
-- [[[1,2],[2]], [[1,2],[1]]]
allSteps :: [a] -> Tree [a]
allSteps = unfoldTree (\xs -> (xs, next xs))

allPath :: Tree a -> [[a]]
allPath (Node r []) = [[r]]
allPath (Node {..}) = map (rootLabel :) $ concatMap allPath subForest
