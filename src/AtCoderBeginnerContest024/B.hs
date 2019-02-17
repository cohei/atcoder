module AtCoderBeginnerContest024.B (main) where

import           Control.Monad (replicateM)

main :: IO ()
main = do
  [n, openTime] <- take 2 . map read . words <$> getLine :: IO [Int]
  ts <- replicateM n readLn :: IO [Int]
  print $ totalOpenTime openTime ts

totalOpenTime :: Int -> [Int] -> Int
totalOpenTime openTime = sum . map (sequentOpenTime openTime) . groupSequent openTime

-- groupSequent :: Int -> [Int] -> [[Int]]
-- groupSequent openTime ts = groupBy (\x y -> abs (x - y) < openTime) ts

groupSequent :: Int -> [Int] -> [[Int]]
groupSequent _ [] = []
groupSequent d (n:ns) = map reverse $ aux [[n]] ns
  where
    isSeq x y = abs (x - y) < d

    aux acc [] = reverse acc
    aux acc@(zs@(z:_):zss) (x:xs)
      | isSeq x z = aux ((x:zs):zss) xs
      | otherwise = aux ([x]:acc) xs
    aux _ _ = undefined

sequentOpenTime :: Int -> [Int] -> Int
sequentOpenTime openTime ts =
  let
    first = head ts
    last' = last ts
  in last' - first + openTime
