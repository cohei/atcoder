module Main where

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

tests, test1, test2, test3 :: Bool
tests = test1 && test2 && test3
test1 = f "azzel" "apple"
test2 = not $ f "chokudai" "redcoder"
test3 = f "abcdefghijklmnopqrstuvwxyz" "ibyhqfrekavclxjstdwgpzmonu"
