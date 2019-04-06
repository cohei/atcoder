module AtCoderBeginnerContest123.B (main) where

import           Control.Monad (replicateM)
import           Data.List     (sortOn)

main :: IO ()
main = do
  ts <- replicateM 5 readLn
  print $ solve ts

solve :: [Int] -> Int
solve ts =
  let
    sorted = sortOn ((`mod` 10) . subtract 1) ts
  in
    sum $ head sorted : map ceiling10 (tail sorted)

ceiling10 :: Int -> Int
ceiling10 = (* 10) . ceiling . (/ 10) . (fromIntegral :: Int -> Double)
