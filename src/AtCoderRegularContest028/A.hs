module AtCoderRegularContest028.A (main) where

main :: IO ()
main = interact $ (++"\n") . show . f . format

format :: String -> (Int, Int, Int)
format = (\(n:a:b:_) -> (n,a,b)) . map read . words . head . lines

f :: (Int, Int, Int) -> Player
f (n,a,b) = h n a b

data Player = Ant | Bug
            deriving (Show, Eq)

h n a b = let r = n `mod` (a + b)
          in if r /= 0 && r <= a then Ant else Bug

prop1 = h 5 1 2 == Bug
prop2 = h 10 3 4 == Ant
