module AtCoderBeginnerContest124.A (main) where

main :: IO ()
main = do
  [a, b] <- map read . words <$> getLine
  print $ solve a b

solve :: Int -> Int -> Int
solve a b =
  let
    (a', b') = (max a b, min a b)
    a'' = max (a' - 1) b'
  in
    a' + a''
