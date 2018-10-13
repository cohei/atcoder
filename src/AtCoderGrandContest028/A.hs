module AtCoderGrandContest028.A where

import           Control.Exception (assert)
import           Data.Maybe        (fromMaybe)

{-
S と T の重なるところは整数倍しても同じなので、最小公倍数かそうでないか。
-}

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  s <- getLine
  t <- getLine
  let
    result = assert (length s == n && length t == m) $ f n m s t
  print $ fromMaybe (-1) result

f :: Int -> Int -> String -> String -> Maybe Int
f n m s t = if s' == t' then Just lcm' else Nothing
  where
    gcd' = gcd n m
    lcm' = lcm n m
    s' = everyN (n `div` gcd') s
    t' = everyN (m `div` gcd') t

everyN :: Int -> [a] -> [a]
everyN n xs     | n < 1 = xs
everyN _ []     = []
everyN n (x:xs) = x : everyN n (drop (n - 1) xs)
