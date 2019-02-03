import           Data.List (group)

main :: IO ()
main = do
  n <- readLn
  colors <- map read . words <$> getLine
  if length colors /= n
    then error "データの長さが違う"
    else print $ f colors

f :: [Int] -> Int
f = sum . map (flip div 2 . length) . group
