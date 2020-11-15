module AtCoderBeginnerContest183.A (main) where

main :: IO ()
main = print . solve =<< readLn

solve :: Int -> Int
solve x = max 0 x
