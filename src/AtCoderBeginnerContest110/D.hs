{-# LANGUAGE DataKinds      #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TypeOperators  #-}
module AtCoderBeginnerContest110.D (main) where

import           Data.List    (group)
import           Data.Ratio   (denominator, numerator)
import           GHC.TypeLits (KnownNat, Nat, natVal, type (+), type (^))

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  print $ f n m

type Modulus = 10 ^ 9 + 7

f :: Int -> Int -> Int
f n m = unModular $ g $ map (fromIntegral . length) $ group $ factors m
  where
    g :: [Modular Int Modulus] -> Modular Int Modulus
    g = product . map (\b -> nCombinations (b + fromIntegral n - 1) b)

factors :: Integral a => a -> [a]
factors = factors' primes
  where
    factors' pps@(p:ps) n
      | n < 2              = []
      | n < p ^ (2 :: Int) = [n]  -- stop early
      | n `mod` p == 0     = p : factors' pps (n `div` p)
      | otherwise          = factors' ps n
    factors' _ _ = error "`primes` is a infinite list"

primes :: Integral a => [a]
primes = 2 : filter (\n -> head (factors n) == n) [3, 5 ..]

nCombinations :: (Eq a, Fractional a) => a -> a -> a
nCombinations n k = factorial n / factorial k / factorial (n - k)

factorial :: (Eq a, Num a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

newtype Modular a (modulus :: Nat) =
  Modular { unModular :: a }
  deriving (Eq)

instance Show a => Show (Modular a modulus) where
  show (Modular n) = show n

instance (Integral a, KnownNat modulus) => Num (Modular a modulus) where
  fromInteger           = toModular . fromInteger
  Modular n + Modular m = toModular $ n + m
  Modular n * Modular m = toModular $ n * m
  negate (Modular n)    = toModular $ negate n
  abs (Modular n)       = toModular $ abs n
  signum (Modular n)    = toModular $ signum n

instance (Integral a, KnownNat modulus) => Fractional (Modular a modulus) where
  recip m@(Modular n) = toModular $ modularReciprocal (fromInteger (natVal m)) n
  fromRational r = fromInteger (numerator r) / fromInteger (denominator r)

toModular :: (Integral a, KnownNat modulus) => a -> Modular a modulus
toModular n = let m = Modular $ n `mod` fromInteger (natVal m) in m

modularReciprocal :: Integral a => a -> a -> a
modularReciprocal modulus n = snd $ modularReciprocal' modulus n
  where
    -- modularReciprocal' n m = (x, y)
    -- n * x + m * y = 1
    modularReciprocal' _ 0 = notCoprimeError
    modularReciprocal' _ 1 = (0, 1)
    modularReciprocal' m l = (y, x - q * y)
      where
        (q, r) = m `divMod` l
        (x, y) = modularReciprocal' l r
    notCoprimeError =
      error $ unwords
        [ "divider"
        , parentheses $ showIntegral n
        , "must be coprime to modulus"
        , parentheses $ showIntegral modulus
        ]
    parentheses s = "(" ++ s ++ ")"
    showIntegral = show . toInteger
