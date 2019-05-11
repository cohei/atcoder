module Diverta2019.D (main) where

import           Data.List (group, inits)

main :: IO ()
main = do
  n <- readLn
  print $ solve n

{-
N = a * m + a = a * (m + 1)
a は余りなので 0 <= a < m
-}
solve :: Int -> Int
solve n = sum $ filter (\m -> let a = n `div` (m + 1) in a < m) $ map pred $ factors n

factors :: Integral a => a -> [a]
factors = map product . mapM (map product . inits) . group . primeFactors

primes :: Integral a => [a]
primes = 2 : filter (\n -> head (primeFactors n) == n) [3, 5 ..]

primeFactors :: Integral a => a -> [a]
primeFactors = primeFactors' primes
  where
    primeFactors' :: Integral a => [a] -> a -> [a]
    primeFactors' pps@(p:ps) n
      | n < 2              = []
      | n < p ^ (2 :: Int) = [n]  -- stop early
      | n `mod` p == 0     = p : primeFactors' pps (n `div` p)
      | otherwise          = primeFactors' ps n
    primeFactors' _ _ = error "`primes` is a infinite list"
