module AtCoderBeginnerContest125.C (main) where

import           Control.Exception (assert)

main :: IO ()
main = do
  n <- readLn
  as <- map read . words <$> getLine
  assert (length as == n) $
    print $ solve as

solve :: [Int] -> Int
solve as =
  let
    ls = scanl1 gcd $ init as
    rs = scanr1 gcd $ tail as
  in
    maximum $ [last ls, head rs] ++ zipWith gcd (init ls) (tail rs)

{-
素朴なこれは LTE

solve :: [Int] -> Int
solve = maximum . map (foldl1' gcd) . removeOne

removeOne :: [a] -> [[a]]
removeOne []       = []
removeOne (x : xs) = xs : map (x:) (removeOne xs)
-}
