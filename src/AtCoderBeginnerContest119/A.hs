module AtCoderBeginnerContest119.A (main) where

import           Data.Time.Calendar (Day, fromGregorian)

main :: IO ()
main = print . solve . parse =<< getLine

data Result = Heisei | TBD deriving Show

solve :: Day -> Result
solve d = if d <= lastOfHeisei then Heisei else TBD
  where
    lastOfHeisei = fromGregorian 2019 4 30

parse :: String -> Day
parse [y1, y2, y3, y4, '/', m1, m2, '/', d1, d2] =
  fromGregorian (read [y1, y2, y3, y4]) (read [m1, m2]) (read [d1, d2])
parse _ = error "unknown format"
