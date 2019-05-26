module AtCoderBeginnerContest128.B (main) where

import           Control.Monad (replicateM)
import           Data.List     (sort)
import           Data.Ord      (Down (Down))

main :: IO ()
main = do
  n <- readLn
  sps <- replicateM n $ do
    [s, p] <- words <$> getLine
    pure (s, read p)
  mapM_ print $ solve sps

solve :: [(String, Int)] -> [Int]
solve = map (\(_, _, i) -> i) . sort . zipWith (\i (s, p) -> (s, Down p, i)) [1..]
