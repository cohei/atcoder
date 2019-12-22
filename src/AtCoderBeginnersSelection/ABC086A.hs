module AtCoderBeginnersSelection.ABC086A (main) where

main :: IO ()
main = do
  [a, b] <- map read . words <$> getLine
  putStrLn $ solve a b

solve :: Int -> Int -> String
solve a b
  | odd a && odd b = "Odd"
  | otherwise      = "Even"
