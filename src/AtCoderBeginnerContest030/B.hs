module AtCoderBeginnerContest030.B (main) where

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
