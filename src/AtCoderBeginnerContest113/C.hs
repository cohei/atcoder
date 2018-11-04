module AtCoderBeginnerContest113.C (main) where

import           Control.Monad (replicateM)
import           Data.Function (on)
import           Data.List     (groupBy, sortOn)

main :: IO ()
main = do
  [_n, m] <- map read . words <$> getLine
  pys <- replicateM m $ (\[p, y] -> (p, y)) . map read . words <$> getLine
  mapM_ putStrLn $ f pys

type Prefecture = Int
type Year = Int

f :: [(Prefecture, Year)] -> [String]
f =
  map (\(_i, p, j) -> pad6 (show p) ++ pad6 (show j)) .
  sortOn (\(i, _p, _j) -> i) .
  concatMap (zipWith (\j (i, (p, _y)) -> (i, p, j)) [1 :: Int ..]) .
  groupBy ((==) `on` (\(_i, (p, _y)) -> p)) .
  sortOn snd .
  zip [1 :: Int ..]
-- sortOn ではなく sortBy comparing を使ってしまうと C022_scrambled 以降 TLE

pad6 :: String -> String
pad6 = reverse . take 6 . (++ repeat '0') . reverse
