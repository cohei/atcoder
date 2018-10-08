module AtCoderBeginnerContest112.D (main) where

import Data.List (group)

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  print $ f n m

f :: Int -> Int -> Int
f n m = m `div` minimum (filter (n <=) (factors m))

factors :: Integral a => a -> [a]
factors = map product . sequence . map (scanl (*) 1) . group . primeFactors

primeFactors :: Integral a => a -> [a]
primeFactors = primeFactors' primes
  where
    primeFactors' pps@(p:ps) n
      | n < 2              = []
      | n < p ^ (2 :: Int) = [n]  -- stop early
      | n `mod` p == 0     = p : primeFactors' pps (n `div` p)
      | otherwise          = primeFactors' ps n
    primeFactors' _ _ = error "`primes` is a infinite list"

primes :: Integral a => [a]
primes = 2 : filter (\n -> head (primeFactors n) == n) [3, 5 ..]

tests, test1, test2, test3 :: Bool
tests = test1 && test2 && test3
test1 = f 3 14 == 2
test2 = f 10 123 == 3
test3 = f 100000 1000000000 == 10000
