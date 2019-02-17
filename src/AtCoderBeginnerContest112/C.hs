module AtCoderBeginnerContest112.C (main) where

import           Control.Monad (forM_, guard, replicateM)

main :: IO ()
main = do
  n <- readLn
  xyhs <- map ((\[x, y, h] -> (x, y, h)) . map read . words) <$> replicateM n getLine
  let (x, y, h) = f xyhs
  putStrLn $ show x ++ " " ++ show y ++ " " ++ show h

f :: [(Int, Int, Int)] -> (Int, Int, Int)
f [] = undefined
f xyhs@((_, _, h0) : _) = head $ do
  xt <- [0..100]
  yt <- [0..100]
  ht <- [max 1 (h0 - 200) .. min (10 ^ (9 :: Int)) (h0 + 200)]
  forM_ xyhs $ \(x, y, h) ->
    guard $
      let
        dx = abs (x - xt)
        dy = abs (y - yt)
      in
        ht == h + dx + dy
  return (xt, yt, ht)

{-
g :: Int -> Int -> Int -> [[Int]]
g xi yi hi =
  [ filter (\h -> 1 <= h && h <= 10 ^ (9 :: Int)) [hi - distance, hi + distance]
  | x <- [0..100]
  , y <- [0..100]
  , let distance = abs (xi - x) + abs (yi - y)
  ]
-}
