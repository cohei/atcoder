module AtCoderBeginnersSelection.PracticeA (main) where

main :: IO ()
main = do
  a <- readLn
  [b, c] <- map read . words <$> getLine
  s <- getLine
  putStrLn $ show (a + b + c :: Int) ++ " " ++ s
