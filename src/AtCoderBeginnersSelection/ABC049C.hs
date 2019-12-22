module AtCoderBeginnersSelection.ABC049C (main) where

import           Control.Monad (msum)
import           Data.List     (stripPrefix)

main :: IO ()
main = putStrLn . display . solve =<< getLine

display :: Bool -> String
display False = "NO"
display True  = "YES"

solve :: String -> Bool
solve = solve' . reverse

solve' :: String -> Bool
solve' "" = True
solve' s  = maybe False solve' $ msum $ map (flip stripPrefix s . reverse) parts

parts :: [String]
parts =
  [ "dream"
  , "dreamer"
  , "erase"
  , "eraser"
  ]
