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

tests, test1, test2, test3 :: Bool
tests = test1 && test2 && test3
test1 = f 10 20 [8, 15, 13] [16, 22] == NoWar
test2 = f (-48) (-1) [-20, -35, -91, -23] [-22, 66] == War
test3 = f 6 8 [-10, 3, 1, 5, -100] [100, 6, 14] == War
