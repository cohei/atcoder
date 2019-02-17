module AtCoderBeginnerContest110.C (main) where

import           Data.Function (on)
import           Data.List     (nub)
import           Data.Maybe    (mapMaybe)

main :: IO ()
main = do
  s <- getLine
  t <- getLine
  putStrLn $ if f s t then "Yes" else "No"

f :: String -> String -> Bool
f = (==) `on` normalize

normalize :: Eq a => [a] -> [Int]
normalize xs = mapMaybe (flip lookup table) xs
  where
    table = zip (nub xs) [0..]
