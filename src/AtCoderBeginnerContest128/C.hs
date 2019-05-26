module AtCoderBeginnerContest128.C (main) where

import           Control.Exception (assert)
import           Control.Monad     (replicateM)
import           Data.List         (sort)

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  sss <- replicateM m $ do
    k : ss <- map read . words <$> getLine
    assert (length ss == k) $
      pure ss
  ps <- map read . words <$> getLine
  assert (length ps == m) $
    print $ solve n $ zip ps sss

type Switch = Int
type Parity = Int
type BulbSetting = (Parity, [Switch])
type Bulb = [Bool] -> Bool

solve :: Int -> [BulbSetting] -> Int
solve n bulbSettings =
  length $
  filter id $
  map (\state -> all ($ state) bulbs) allStates
  where
    allStates = replicateM n [False, True]
    bulbs = map makeBulb bulbSettings

makeBulb :: BulbSetting -> Bulb
makeBulb (parity, switches) state =
  length (filter id (takes (map pred (sort switches)) state)) `mod` 2 == parity
  -- スイッチ番号は順とは限らないらしく、 sort が必要

takes :: [Int] -> [a] -> [a]
takes []     _      = []
takes _      []     = []
takes (0:is) (x:xs) = x : takes (map pred is) xs
takes is     (_:xs) = takes (map pred is) xs
