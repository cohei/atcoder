module ExaWizards2019.B (main) where

import           Control.Exception (assert)

main :: IO ()
main = do
  n <- readLn
  s <- getLine
  assert (length s == n) $
    putStrLn $ fromBool $ solve s

fromBool :: Bool -> String
fromBool False = "No"
fromBool True  = "Yes"

solve :: String -> Bool
solve s = length (filter (== 'R') s) > length (filter (== 'B') s)
