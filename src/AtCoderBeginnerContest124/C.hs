module AtCoderBeginnerContest124.C (main) where

import           Data.Function (on)

main :: IO ()
main = print . solve . map fromChar =<< getLine

data Tile =
  Black | White
  deriving (Eq)

fromChar :: Char -> Tile
fromChar '0' = Black
fromChar '1' = White
fromChar _   = undefined

solve :: [Tile] -> Int
solve tiles = (min `on` (length . filter not . zipWith (==) tiles)) goal1 goal2

goal1, goal2 :: [Tile]
goal1 = cycle [Black, White]
goal2 = cycle [White, Black]
