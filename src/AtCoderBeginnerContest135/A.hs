module AtCoderBeginnerContest135.A (main) where

main :: IO ()
main = do
  [a, b] <- map read . words <$> getLine
  putStrLn $ maybe "IMPOSSIBLE" show $  solve a b

solve :: Int -> Int -> Maybe Int
solve a b
  | even (a - b) = Just $ (a + b) `div` 2
  | otherwise = Nothing
