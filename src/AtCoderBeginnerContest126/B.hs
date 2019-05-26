module AtCoderBeginnerContest126.B (main) where

import           Control.Exception (assert)

main :: IO ()
main = do
  s <- getLine
  assert (length s == 4) $
    print $ solve s

data Result =
  YYMM | MMYY | AMBIGUOUS | NA
  deriving (Show)

solve :: String -> Result
solve s
  | isMonth i1 && isMonth i2 = AMBIGUOUS
  | isMonth i1 = MMYY
  | isMonth i2 = YYMM
  | otherwise = NA
  where
    (i1, i2) = parse s

parse :: String -> (Int, Int)
parse [c1, c2, c3, c4] = (read [c1, c2], read [c3, c4])
parse _                = undefined

isMonth :: Int -> Bool
isMonth i = i >= 1 && i <= 12
