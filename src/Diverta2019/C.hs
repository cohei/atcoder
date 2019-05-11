module Diverta2019.C (main) where

import           Control.Monad (replicateM)
import           Data.List     (isInfixOf)

main :: IO ()
main = do
  n <- readLn
  ss <- replicateM n getLine
  print $ solve ss

solve :: [String] -> Int
solve ss =
  let
    containAB = length $ filter ("AB" `isInfixOf`) ss
    endWithA = length $ filter ((== 'A') . last) ss
    startWithB = length $ filter ((== 'B') . head) ss
    startWithBAndEndWithA = length $ filter ((== 'A') . last) $ filter ((== 'B') . head) ss
    startWithoutBAndEndWithA = endWithA - startWithBAndEndWithA
    startWithBAndEndWithoutA = startWithB - startWithBAndEndWithA
  in
    containAB + (if startWithoutBAndEndWithA > 0 && startWithBAndEndWithoutA > 0 then startWithBAndEndWithA else 0) + min startWithoutBAndEndWithA startWithBAndEndWithoutA
