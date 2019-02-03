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
groupSequent d (x:xs) = map reverse $ aux [[x]] xs
  where
    isSeq x y = abs (x - y) < d

    aux acc [] = reverse acc
    aux acc@(zs@(z:_):zss) (x:xs)
      | isSeq x z = aux ((x:zs):zss) xs
      | otherwise = aux ([x]:acc) xs

sequentOpenTime :: Int -> [Int] -> Int
sequentOpenTime openTime ts =
  let
    first = head ts
    last' = last ts
  in last' - first + openTime


test1 = totalOpenTime 10 [20, 100, 105, 217, 314] == 45

test2 = totalOpenTime 10 [1..10] == 19

test3 = totalOpenTime 100000 [3, 31, 314, 3141, 31415, 314159, 400000, 410000, 500000, 777777] == 517253
