{-# LANGUAGE ImportQualifiedPost #-}

module Main (main) where

import Data.Foldable (find)
import Data.List (genericLength)
import Data.List.NonEmpty qualified as NE (inits, reverse, tail)
import Data.Maybe (fromJust)
import Numeric.Natural (Natural)

main :: IO ()
main = print . solve =<< getLine

solve :: String -> Natural
solve = genericLength . fromJust . find isEvenSequence . NE.tail . NE.reverse . NE.inits

isEvenSequence :: (Eq a) => [a] -> Bool
isEvenSequence = uncurry (==) . halve

halve :: [a] -> ([a], [a])
halve xs = go xs [] xs
  where
    go :: [a] -> [a] -> [a] -> ([a], [a])
    go [] firstHalf latterHalf = (reverse firstHalf, latterHalf)
    go ys0 firstHalf (y : ys) = go (drop 2 ys0) (y : firstHalf) ys
    go _ _ [] = error "latterHalf must be longer than ys0"
