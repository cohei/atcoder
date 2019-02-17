module AtCoderBeginnerContest110.B (main) where

main :: IO ()
main = do
  [_n, _m, x, y] <- map read . words <$> getLine
  xs <- map read . words <$> getLine
  ys <- map read . words <$> getLine
  print $ f x y xs ys

data Result =
  War | NoWar
  deriving Eq

instance Show Result where
  show War   = "War"
  show NoWar = "No War"

f :: Int -> Int -> [Int] -> [Int] -> Result
f x y xs ys =
  if any (\z -> z > maximum xs && z <= minimum ys) [x + 1 .. y]
  then NoWar
  else War
