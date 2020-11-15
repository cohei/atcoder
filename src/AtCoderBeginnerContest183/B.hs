module AtCoderBeginnerContest183.B (main) where

main :: IO ()
main = maybe (pure ()) print . (`withInput` solve) =<< getLine

withInput :: String -> (Int -> Int -> Int -> Int -> a) -> Maybe a
withInput s f =
  case map read $ words s of
    [sx, sy, gx, gy] -> Just $ f sx sy gx gy
    _                -> Nothing

solve :: Int -> Int -> Int -> Int -> Double
solve sx sy gx gy = fromIntegral (sx * gy + sy * gx) / fromIntegral (sy + gy)
