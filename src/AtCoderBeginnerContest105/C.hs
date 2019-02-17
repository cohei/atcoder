module AtCoderBeginnerContest105.C (main) where

import           Data.List  (unfoldr)
import           Data.Tuple (swap)

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
