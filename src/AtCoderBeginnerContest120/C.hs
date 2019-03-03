module AtCoderBeginnerContest120.C (main) where

import           Control.Arrow ((***))
import           Data.List     (partition)

main :: IO ()
main = print . solve . map fromChar =<< getLine

data Cube =
    Red
  | Blue
  deriving (Eq)

fromChar :: Char -> Cube
fromChar '0' = Red
fromChar '1' = Blue
fromChar _   = error "unexpected character"

solve :: [Cube] -> Int
solve = (2 *) . uncurry min . (length *** length) . partition (Red ==)
