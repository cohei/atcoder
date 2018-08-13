module Main where

import Data.List (unfoldr)
import Data.Tuple (swap)

main :: IO ()
main = do
  n <- readLn
  putStrLn $ concatMap show $ f n

f :: Int -> [Int]
f =
  (\ds -> if null ds then [0] else ds) .
  reverse . unfoldr (\n -> if n == 0 then Nothing else Just (swap (divMod2 n (-2))))

divMod2 :: Integral a => a -> a -> (a, a)
divMod2 n m =
  let
    (r, q) = divMod n m
  in
    if q < 0 then (r + 1, q - m) else (r, q)

tests :: [Bool]
tests = [test1, test2, test3]

test1, test2, test3 :: Bool
test1 = concatMap show (f (-9)) == "1011"
test2 = concatMap show (f 123456789) == "11000101011001101110100010101"
test3 = concatMap show (f 0) == "0"
