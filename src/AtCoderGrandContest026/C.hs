{-# LANGUAGE TupleSections #-}
module AtCoderGrandContest026.C (main) where

import           Control.Arrow     (second)
import           Control.Exception (assert)
import           Data.Char         (isLower)
import           Data.Function     (on)
import qualified Data.Map          as Map (foldl', fromListWith,
                                           intersectionWith)

main :: IO ()
main = do
  n <- readLn :: IO Int
  assert (n >= 1 && n <= 18) $ do
    s <- getLine
    assert (all isLower s && length s == 2 * n) $ print $ f s

f :: String -> Int
f s = Map.foldl' (+) 0 $ (Map.intersectionWith (*) `on` toMap . partitions) front rear
  where
    toMap = Map.fromListWith (+) . map (,1)
    (front, rear) = twoFold s

partitions :: [a] -> [([a], [a])]
partitions []     = [([], [])]
partitions (x:xs) = partitions xs >>= \(ys, zs) -> [(x:ys, zs), (ys, x:zs)]

twoFold :: [a] -> ([a], [a])
twoFold xs = second reverse $ splitAt (length xs `div` 2) xs
