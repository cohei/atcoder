module AtCoderGrandContest014.F (main) where

import           Data.List (mapAccumL, partition)

main :: IO ()
main = do
  _nStirng : nsString : _ <- lines <$> getContents

  let
    -- n =  read nStirng
    ns = map read $ words nsString

  print $ length $ takeWhile (not . isSorted) $ iterate f ns

f :: [Int] -> [Int]
f =
  map fst .
  uncurry (++) .
  partition (not . snd) .
  snd .
  mapAccumL g 0
  where
    g :: Ord a => a -> a -> (a, (a, Bool))
    g acc n = if isHigh then (n, (n, True)) else (acc, (n, False))
      where
        isHigh = n > acc

isSorted :: [Int] -> Bool
isSorted xs = and $ zipWith (<) xs $ tail xs
