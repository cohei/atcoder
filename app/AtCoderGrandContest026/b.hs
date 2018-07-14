import Control.Monad (replicateM_)
import Data.List (find)
import Data.Maybe (fromJust)

import Debug.Trace

main :: IO ()
main = do
  t <- readLn
  let
    h = do
      line <- getLine
      let
        answer = (\(a:b:c:d:_) -> if f a b c d then "Yes" else "No") . map read . words $ line
      putStrLn answer
  replicateM_ t h

f :: Int -> Int -> Int -> Int -> Bool
f initial buy criterion add = g (initial - buy) criterion (add - buy) (- buy)

g :: Int -> Int -> Int -> Int -> Bool
g initial criterion plus minus =
  (== initial) $ fromJust $ find (\n -> n < 0 || n == initial) $ tail $ iterate step initial
  where
    -- step n = traceShowId n + (if n <= criterion then plus else minus)
    step n = n + (if n <= criterion then plus else minus)

test = output == map (\(a, b, c, d) -> f a b c d) input

input =
  [ (9, 7, 5, 9)
  , (9, 7, 6, 9)
  , (14, 10, 7, 12)
  , (14, 10, 8, 12)
  , (14, 10, 9, 12)
  , (14, 10, 7, 11)
  , (14, 10, 8, 11)
  , (14, 10, 9, 11)
  , (9, 10, 5, 10) --
  , (10, 10, 5, 10)
  , (11, 10, 5, 10)
  , (16, 10, 5, 10)
  , (1000000000000000000, 17, 14, 999999999999999985)
  , (1000000000000000000, 17, 15, 999999999999999985)
  ]

output =
  [ False
  , True
  , False
  , True
  , True
  , False
  , False
  , True
  , False
  , True
  , True
  , False
  , False
  , True
  ]
