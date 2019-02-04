module AtCoderBeginnerContest117.D (main) where

import           Control.Exception (assert)
import           Data.Bits         (bit, testBit, xor)
import           Data.List         (foldl', partition)

main :: IO ()
main = do
  [n, k] <- map read . words <$> getLine
  as <- map read . words <$> getLine
  assert (length as == n) $ print $ solve k as

f :: Int -> [Int] -> Int
f x = sum . map (`xor` x)

solve :: Int -> [Int] -> Int
solve k xs =
  let
    xBits =
      map (\i -> if majority $ map (`testBit` i) xs then 0 else bit i) $ take (nDigit k) [0..]
    x = underK k $ reverse xBits -- xBits 上の桁から並ぶようにしておく
  in
    f x xs

underK :: Int -> [Int] -> Int
underK k = foldl' (\acc xBit -> if acc + xBit > k then acc else acc + xBit) 0

majority :: [Bool] -> Bool
majority bs =
  let
    (trues, falses) = partition id bs
  in
    length trues > length falses
    -- k 以下という条件があるため、 1 と 0 が同数のときは 0 になったほうが有利

nDigit :: Integral a => a -> Int
nDigit n = 1 + floor (logBase 2 (fromIntegral n) :: Double)
