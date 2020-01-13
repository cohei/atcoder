module AtCoderBeginnerContest151.A (main) where

main :: IO ()
main = do
  c <- getChar
  putChar $ solve c

solve :: Char -> Char
solve = succ
