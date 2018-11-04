module Tenka1ProgrammerBeginnerContest.B (main) where

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
