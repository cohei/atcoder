module Main where

import Control.Applicative ((<$>))

main :: IO ()
main = do
  hour:minute:_ <- map read . words <$> getLine
  print $ handsAngle hour minute

hourToDegree :: Int -> Int -> Double
hourToDegree hour minute  = fromIntegral (hour `mod` 12) * 360 / 12 + fromIntegral minute * 360 / (12 * 60)

minuteToDegree :: Int -> Double
minuteToDegree minute = fromIntegral minute * 360 / 60

smallerAngle :: Double -> Double
smallerAngle d = if d > 180 then 360 - d else d

handsAngle :: Int -> Int -> Double
handsAngle hour minute = smallerAngle $ abs $ hDegree - mDegree
  where
    hDegree = hourToDegree hour minute
    mDegree = minuteToDegree minute

test :: Bool
test = and [test1, test2, test3, test4, test5]

test1, test2, test3, test4, test5 :: Bool
test1 = handsAngle 15 0 == 90
test2 = handsAngle 3 17 == 3.5
test3 = handsAngle 0 0 == 0
test4 = handsAngle 6 0 == 180
test5 = handsAngle 23 59 == 5.5000
