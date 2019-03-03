module AtCoderBeginnerContest120.D (main) where

import           Control.Monad (replicateM)
import           Data.Foldable (for_)

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  bridges <- replicateM m $ do
    [a, b] <- map read . words <$> getLine
    pure (a, b)
  for_ (solve n bridges) print

type Island = Int
type Bridge = (Island, Island)

solve :: Int -> [Bridge] -> [Int]
solve = _
