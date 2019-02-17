{-# LANGUAGE ScopedTypeVariables #-}
module DwangoProgrammingContestV.B (main) where

import           Control.Applicative (Alternative)
import           Control.Monad       (guard)
import           Data.Bits           (Bits, bit, (.&.))
import           Data.Functor        (($>))
import           Data.List           (inits, mapAccumL, tails, unfoldr)
import           Data.Tuple          (swap)

main :: IO ()
main = do
  [n, k] <- take 2 . map read . words <$> getLine
  as <- take n . map read . words <$> getLine
  print $ f k as

f :: Int -> [Int] -> Int
f k as = sum $ snd $ mapAccumL g beautifulnesses bits
  where
    beautifulnesses = map sum . concatMap (tail . inits) . init . tails $ as
    bits = reverse $ map bit [0 .. bitSize (maximum beautifulnesses)]

    g :: (Num a, Bits a) => [a] -> a -> ([a], a)
    g bs i =
      let
        bs' = filter ((== i) . (.&. i)) bs
      in
        if length bs' >= k then (bs', i) else (bs, 0)

bitSize :: Int -> Int
bitSize = length . toDigits 2

toDigits :: forall a. Integral a => a -> a -> [a]
toDigits base = reverse . unfoldr step
  where
    step :: Alternative m => a -> m (a, a)
    step n = guard (n /= 0) $> swap (divMod n base)
