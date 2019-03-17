{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE ExplicitNamespaces #-}
{-# LANGUAGE KindSignatures     #-}
{-# LANGUAGE TypeOperators      #-}
module AtCoderGrandContest031.A (main) where

import           Control.Exception (assert)
import           Data.List         (group, sort)
import           GHC.TypeLits      (type (+), KnownNat, Nat, type (^), natVal)

main :: IO ()
main = do
  n <- readLn
  s <- getLine
  assert (length s == n) $
    print $ solve s

type Modulus = 10 ^ 9 + 7

solve :: String -> Int
solve = subtract 1 . unModular' . product . map (fromIntegral . (+ 1) . length) . group . sort
  where
    unModular' :: Modular Int Modulus -> Int
    unModular' = unModular

newtype Modular a (modulus :: Nat) =
  Modular { unModular :: a }
  deriving (Eq)

instance (Integral a, KnownNat modulus) => Num (Modular a modulus) where
  fromInteger           = toModular . fromInteger
  Modular n + Modular m = toModular $ n + m
  Modular n * Modular m = toModular $ n * m
  negate (Modular n)    = toModular $ negate n
  abs (Modular n)       = toModular $ abs n
  signum (Modular n)    = toModular $ signum n

toModular :: (Integral a, KnownNat modulus) => a -> Modular a modulus
toModular n = let m = Modular $ n `mod` fromInteger (natVal m) in m
