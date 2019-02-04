module AtCoderBeginnerContest105.B (main) where

import           Data.List (nub, sort)

main :: IO ()
main = do
  n <- readLn
  putStrLn $ if f n then "Yes" else "No"

f :: Int -> Bool
f = (`elem` prices)

prices :: [Int]
prices = nub $ sort $ filter (100 >=) $ (+) <$> [0,4..100] <*> [0,7..100]
