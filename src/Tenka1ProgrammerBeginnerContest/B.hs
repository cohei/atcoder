module Tenka1ProgrammerBeginnerContest.B where

main :: IO ()
main = do
  [a, b, k] <- map read . words <$> getLine
  let (a', b') = f a b k
  putStrLn . unwords . map show $ [a', b']

data Person = Takahashi | Aoki

f :: Int -> Int -> Int -> (Int, Int)
f a b k = f' Takahashi k a b

f' :: Person -> Int -> Int -> Int -> (Int, Int)
f' _ 0 a b = (a, b)
f' Takahashi k a b = let a' = a `div` 2 in f' Aoki (k - 1) a' (b + a')
f' Aoki k a b = let b' = b `div` 2 in f' Takahashi (k - 1) (a + b') b'

tests, test1, test2, test3 :: Bool
tests = and [test1, test2, test3]
test1 = f 5 4 2 == (5, 3)
test2 = f 3 3 3 == (1, 3)
test3 = f 314159265 358979323 84 == (448759046, 224379523)
