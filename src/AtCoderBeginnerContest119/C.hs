module AtCoderBeginnerContest119.C (main) where

import           Control.Monad (guard, replicateM)

main :: IO ()
main = do
  [n, a, b, c] <- map read . words <$> getLine
  ls <- replicateM n readLn
  print $ solve (a, b, c) ls

solve :: (Int, Int, Int) -> [Int] -> Int
solve (a, b, c) ls = minimum $ do
  [ingredientsA, ingredientsB, ingerdientsC, _] <- partitions 4 ls
  guard $ all (not . null) [ingredientsA, ingredientsB, ingerdientsC]
  pure $ sum $ zipWith mp [a, b, c] [ingredientsA, ingredientsB, ingerdientsC]

mp :: Int -> [Int] -> Int
mp goal bamboos = abs (sum bamboos - goal) + 10 * (length bamboos - 1)

partitions :: Int -> [a] -> [[[a]]]
partitions k = foldr f [replicate k []]
  where
    f :: a -> [[[a]]] -> [[[a]]]
    f x =
      concatMap $ map (\(groups1, group, groups2) -> groups1 ++ [x : group] ++ groups2) . foci

foci :: [a] -> [([a], a, [a])]
foci []     = []
foci (x:xs) = ([], x, xs) : map (\(ys1, y, ys2) -> (x:ys1, y, ys2)) (foci xs)
