{-# LANGUAGE BangPatterns #-}
module DwangoProgrammingContestV.C (main) where

import           Control.Exception (assert, evaluate)

main :: IO ()
main = do
  n <- readLn
  s <- getLine
  evaluate $ assert (length s == n) ()
  q <- readLn
  ks <- take q . map read . words <$> getLine
  putStr . unlines . map (show . (\k -> f k s)) $ ks

f :: Int -> String -> Int
f k = dmc . foldl g initialState . defer k
  where
    g state (c, c') = (countIn c (maybe id countOut c' state))

-- Strict にしないと TLE がでる
data State =
  State
  { d   :: !Int
  , m   :: !Int
  , dm  :: !Int
  , dmc :: !Int
  }

defer :: Int -> [a] -> [(a, Maybe a)]
defer n xs = zip xs $ replicate n Nothing ++ map Just xs

initialState :: State
initialState = State { d = 0, m = 0, dm = 0, dmc = 0 }

countIn :: Char -> State -> State
countIn 'D' count = count { d = d count + 1 }
countIn 'M' count = count { m = m count + 1, dm = dm count + d count }
countIn 'C' count = count { dmc = dmc count + dm count }
countIn _   count = count

countOut :: Char -> State -> State
countOut 'D' count = count { d = d count - 1, dm = dm count - m count }
countOut 'M' count = count { m = m count - 1 }
countOut _   count = count
