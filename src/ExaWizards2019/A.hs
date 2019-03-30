module ExaWizards2019.A (main) where

main :: IO ()
main = do
  [a, b, c] <- map read . words <$> getLine
  putStrLn $ fromBool $ solve a b c

fromBool :: Bool -> String
fromBool False = "No"
fromBool True  = "Yes"

solve :: Int -> Int -> Int -> Bool
solve a b c = a == b && b == c
