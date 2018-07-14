module Main where

import Control.Applicative ((<$>))

main :: IO ()
main = do
  a:b:c:d:_ <- map read . words <$> getLine

  print $ calculateResult a b c d

data Result = TAKAHASHI | AOKI | DRAW
            deriving (Show, Eq)

calculateResult :: Int -> Int -> Int -> Int -> Result
calculateResult a b c d = case compare (b * c) (a * d) of
  GT -> TAKAHASHI
  EQ -> DRAW
  LT -> AOKI

test :: Bool
test = and [test_calculateRelust1, test_calculateRelust2, test_calculateRelust3]

test_calculateRelust1 :: Bool
test_calculateRelust1 = calculateResult 5 2 6 3 == AOKI

test_calculateRelust2 :: Bool
test_calculateRelust2 = calculateResult 100 80 100 73 == TAKAHASHI

test_calculateRelust3 :: Bool
test_calculateRelust3 = calculateResult 66 30 55 25 == DRAW
