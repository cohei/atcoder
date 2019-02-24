module AtCoderRegularContest028.A (main) where

main :: IO ()
main = interact $ (++"\n") . show . f . format

format :: String -> (Int, Int, Int)
format = format' . map read . words . head . lines

format' :: [Int] -> (Int, Int, Int)
format' [n, a, b] = (n, a, b)
format' _         = error "unexpected format"

f :: (Int, Int, Int) -> Player
f (n, a, b) = h n a b

data Player = Ant | Bug
            deriving (Show, Eq)

h :: Integral a => a -> a -> a -> Player
h n a b =
  let
    r = n `mod` (a + b)
  in
    if r /= 0 && r <= a then Ant else Bug
