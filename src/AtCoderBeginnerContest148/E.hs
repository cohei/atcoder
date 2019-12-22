module AtCoderBeginnerContest148.E (main) where

main :: IO ()
main = do
  n <- readLn
  print $ solve n

solve :: Int -> Int
solve n
  | odd n = 0
  | otherwise = sum $ takeWhile (/= 0) $ iterate (`div` 5) $ n `div` 10
