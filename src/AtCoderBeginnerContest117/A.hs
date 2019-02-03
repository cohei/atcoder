module AtCoderBeginnerContest117.A (main) where

main :: IO ()
main = do
  [t, x] <- map read . words <$> getLine
  print $ f t x

f :: Double -> Double -> Double
f t x = t / x
