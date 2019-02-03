module AtCoderBeginnerContest117.B (main) where

import           Control.Monad (when)

main :: IO ()
main = do
  n <- readLn
  ls <- map read . words <$> getLine
  when (length ls /= n) $ error "length ls /= n"
  putStrLn $ if f ls then "Yes" else "No"

f :: [Int] -> Bool
f xs = let (m, ys) = maxAndOthers xs in m < sum ys

maxAndOthers :: (Ord a) => [a] -> (a, [a])
maxAndOthers [] = error "empty"
maxAndOthers (x:xs) = foldr (\y (z, ys) -> if y > z then (y, z : ys) else (z, y : ys)) (x, []) xs
