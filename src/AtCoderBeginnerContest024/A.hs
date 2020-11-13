module AtCoderBeginnerContest024.A (main) where

main :: IO ()
main = interact $ (++ "\n") . maybe "" (show . uncurry6 total) . readInput

uncurry6 :: (a -> b -> c -> d -> e -> f -> g) -> (a, b, c, d, e, f) -> g
uncurry6 function (a, b, c, d, e, f) = function a b c d e f

type Price = Int
type Count = Int

readInput :: String -> Maybe (Price, Price, Price, Count, Count, Count)
readInput s
  | [firstLine, secondLine]                   <- take 2 $ lines s
  , [childPrice, adultPrice, discount, group] <- map read $ words firstLine
  , [childCount, adultCount]                  <- map read $ words secondLine =
      Just (childPrice, adultPrice, discount, group, childCount, adultCount)
  | otherwise = Nothing

total :: (Num a, Ord a) => a -> a -> a -> a -> a -> a -> a
total childPrice adultPrice discount group childCount adultCount =
  let
    totalCount = childCount + adultCount
    total' = childPrice * childCount + adultPrice * adultCount
  in
   if totalCount >= group
   then total' - totalCount * discount
   else total'
