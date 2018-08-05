module Main where

main :: IO ()
main = do
  r <- readLn
  print . f $ r

data Contest =
  ABC | ARC | AGC
  deriving (Show)

f :: Int -> Contest
f rating
  | rating < 1200 = ABC
  | rating < 2800 = ARC
  | otherwise = AGC
