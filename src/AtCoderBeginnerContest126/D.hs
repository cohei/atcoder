module AtCoderBeginnerContest126.D (main) where

import           Control.Monad (replicateM)
import           Data.List     (foldl')

main :: IO ()
main = do
  n <- readLn
  edges <- replicateM (n - 1) $ do
    [ui, vi, wi] <- map read . words <$> getLine
    pure (ui, vi, if even wi then Even else Odd)
  mapM_ print $ solve n edges

data Parity = Even | Odd
data Color = White | Black

instance Show Color where
  show White = "0"
  show Black = "1"

type Node = Int
type Edge = (Node, Node, Parity)

solve :: Int -> [Edge] -> [Color]
solve n edges = map (\i -> if i `elem` whites then White else Black) [1..n]
  where
    (whites, _blacks) = foldl' f ([], []) edges

    --    white   black
    f :: ([Node], [Node]) -> Edge -> ([Node], [Node])
    f (ws, bs) (u, v, Even)
      | u `elem` ws = (v : ws, bs)
      | v `elem` ws = (u : ws, bs)
      | u `elem` bs = (ws, v : bs)
      | v `elem` bs = (ws, u : bs)
    f (ws, bs) (u, v, Odd)
      | u `elem` ws = (ws, v : bs)
      | v `elem` ws = (ws, u : bs)
      | u `elem` bs = (v : ws, bs)
      | v `elem` bs = (u : ws, bs)
