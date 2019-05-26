module AtCoderBeginnerContest126.C (main) where

main :: IO ()
main = do
  [n, k] <- map read . words <$> getLine
  print $ solve n k

solve :: Int -> Int -> Double
solve n k =
  (/ fromIntegral n) $
  sum $
  map (\i -> (0.5 :: Double) ^ timesToWin k i) [1..n]

timesToWin :: Int -> Int -> Int
timesToWin k i =
  max 0 $ ceiling $ logBase (2 :: Double) $ fromIntegral k / fromIntegral i
