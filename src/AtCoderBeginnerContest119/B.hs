module AtCoderBeginnerContest119.B (main) where

import           Control.Monad (replicateM)

main :: IO ()
main = do
  n <- readLn
  amounts <- replicateM n $ do
    [x, u] <- words <$> getLine
    pure $ toAmount x u
  print $ solve amounts

data Amount = JPY Int | BTC Double

toAmount :: String -> String -> Amount
toAmount x "JPY" = JPY $ read x
toAmount x "BTC" = BTC $ read x
toAmount _ _     = error "unkwoun currency"

solve :: [Amount] -> Double
solve = sum . map toYen

toYen :: Amount -> Double
toYen (JPY n) = fromIntegral n
toYen (BTC x) = x * yenPerBTC

yenPerBTC :: Double
yenPerBTC = 380000.0
