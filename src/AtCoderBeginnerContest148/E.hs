module AtCoderBeginnerContest148.E (main) where

main :: IO ()
main = do
  n <- readLn
  print $ solve n

solve :: Int -> Int
solve n
  | odd n = 0
  -- | otherwise = sum (takeWhile (/= 0) $ tail $ iterate (`div` 10) n) + (n `div` 10) `div` 5 - (n `div` 10) `div` 10
  | otherwise = sum $ map (\m -> m + m `div` 5 - m `div` 10) $ tail $ takeWhile (/= 0) $ iterate (`div` 10) n

f :: Integer -> Integer
f n = if n < 2 then 1 else  n * f (n - 2)
