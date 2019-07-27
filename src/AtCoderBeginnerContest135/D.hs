module AtCoderBeginnerContest135.D (main) where

import           Data.Char (digitToInt)

main :: IO ()
main = print . solve =<< getLine

fromChar :: Char -> [Int]
fromChar '?' = [0..9]
fromChar c   = [digitToInt c]

solve :: String -> Int
solve s = length $ filter (\i -> i `mod` 13 == 5) . map (fromDigits . map (fromIntegral :: Int -> Integer)) $ mapM fromChar s

fromDigits :: Integral a => [a] -> a
fromDigits = foldl ((+) . (10 *)) 0
