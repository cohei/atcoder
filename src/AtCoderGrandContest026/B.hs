module AtCoderGrandContest026.B (main) where

import           Control.Monad (forM_, replicateM)

main :: IO ()
main = do
  lines' <- getNLine

  forM_ lines' $ \line ->
    putStrLn . (\(a:b:c:d:_) -> yesNo $ f a b c d) . map read . words $ line

getNLine :: IO [String]
getNLine = do
  n <- readLn
  replicateM n getLine

yesNo :: Bool -> String
yesNo b = if b then "Yes" else "No"

f :: Int -> Int -> Int -> Int -> Bool
f initial buy level restock
  | buy > initial = False -- 即死
  | buy > restock = False -- ジリ貧
  | buy <= level = True -- 絶対死なない
  | otherwise =
    let
      step = gcd buy restock -- mod buy で見ると、購入・補充はこのステップで動く
    in
      buy - step + initial `mod` step <= level
