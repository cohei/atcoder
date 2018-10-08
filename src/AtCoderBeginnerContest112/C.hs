module AtCoderBeginnerContest112.C (main) where

import Control.Monad (replicateM, forM_, guard)

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

test1, test2, test3 :: Bool
test1 = f [(2, 3, 5), (2, 1, 5), (1, 2, 5), (3, 2, 5)] == (2, 2, 6)
test2 = f [(0, 0, 100), (1, 1, 98)] == (0, 0, 100)
test3 = f [(99, 1, 191), (100, 1, 192), (99, 0, 192)] == (100, 0, 193)
