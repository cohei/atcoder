main :: IO ()
main = interact $ (++ "\n") . show . total' . readInput
  where
    total' (childPrice, adultPrice, discount, group, childCount, adultCount) =
      total childPrice adultPrice discount group childCount adultCount

type Price = Int
type Count = Int

readInput :: String -> (Price, Price, Price, Count, Count, Count)
readInput s =
  let
    [firstLine, secondLine] = take 2 $ lines s
    [childPrice, adultPrice, discount, group] = map read $ words firstLine
    [childCount, adultCount] = map read $ words secondLine
  in (childPrice, adultPrice, discount, group, childCount, adultCount)

total :: (Num a, Ord a) => a -> a -> a -> a -> a -> a -> a
total childPrice adultPrice discount group childCount adultCount =
  let
    totalCount = childCount + adultCount
    total' = childPrice * childCount + adultPrice * adultCount
  in
   if totalCount >= group
   then total' - totalCount * discount
   else total'

test1 = total 100 200 50 20 40 10 == 3500

test2 = total 400 1000 400 21 10 10 == 14000

test3 = total 400 1000 400 20 10 10 == 6000
