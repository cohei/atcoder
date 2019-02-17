module AtCoderBeginnerContest030.A (main) where

main :: IO ()
main = do
  a:b:c:d:_ <- map read . words <$> getLine

  print $ calculateResult a b c d

data Result = TAKAHASHI | AOKI | DRAW
            deriving (Show, Eq)

calculateResult :: Int -> Int -> Int -> Int -> Result
calculateResult a b c d = case compare (b * c) (a * d) of
  GT -> TAKAHASHI
  EQ -> DRAW
  LT -> AOKI
