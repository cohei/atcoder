{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE ExplicitNamespaces #-}
{-# LANGUAGE KindSignatures     #-}
{-# LANGUAGE TypeOperators      #-}
module ExaWizards2019.D (main) where

import           Control.Exception   (assert)
import           Data.List           (sort)
import           Data.Ratio          (denominator, numerator)
import           Data.Vector.Unboxed (Vector, (!))
import qualified Data.Vector.Unboxed as V (generate)
import           GHC.TypeLits        (type (+), KnownNat, Nat, type (^), natVal)

main :: IO ()
main = do
  [n, x] <- map read . words <$> getLine
  ss <- map read . words <$> getLine
  assert (length ss == n) $
    print $ solve n x ss

type M = Modular Int (10 ^ 9 + 7)

-- Unbox じゃないと TLE
-- https://atcoder.jp/contests/exawizards2019/submissions/4777744 を参考にした
solve :: Int -> Int -> [Int] -> M
solve n x ss = fact n * fromIntegral (foldl step table0 set ! x)
  where
    set :: [(Int, Int)]
    set = zip [1..n] $ sort ss

    table0 :: Vector Int
    table0 = V.generate (x + 1) id

    step :: Vector Int -> (Int, Int) -> Vector Int
    step table (i, y) =
      let
        p1, p2 :: M
        p1 = recip $ fromIntegral i
        p2 = 1 - p1
      in
        V.generate (x + 1) $ \x' ->
            let
              n1 = fromIntegral $ table ! (x' `mod` y)
              n2 = fromIntegral $ table ! x'
            in
              unModular $ p1 * n1 + p2 * n2

fact :: Int -> M
fact n = product $ map fromIntegral [1 .. n]

-- modular

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
    modularReciprocal' :: Integral a => a -> a -> (a, a)
    modularReciprocal' _ 0 = notCoprimeError
    modularReciprocal' _ 1 = (0, 1)
    modularReciprocal' m l = (y, x - q * y)
      where
        (q, r) = m `divMod` l
        (x, y) = modularReciprocal' l r
    notCoprimeError :: a
    notCoprimeError =
      error $ unwords
        [ "divider"
        , parentheses $ showIntegral n
        , "must be coprime to modulus"
        , parentheses $ showIntegral modulus
        ]
    parentheses s = "(" ++ s ++ ")"
    showIntegral = show . toInteger
