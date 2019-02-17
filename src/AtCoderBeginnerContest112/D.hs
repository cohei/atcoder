module AtCoderBeginnerContest112.D (main) where

import           Data.List (group)

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  print $ f n m

f :: Int -> Int -> Int
f n m = m `div` minimum (filter (n <=) (factors m))

factors :: Integral a => a -> [a]
factors = map product . mapM (scanl (*) 1) . group . primeFactors

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

primes :: Integral a => [a]
primes = 2 : filter (\n -> head (primeFactors n) == n) [3, 5 ..]
