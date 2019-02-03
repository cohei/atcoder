import           Control.Exception (assert)
import           Data.List         (group)

main :: IO ()
main = do
  n <- readLn
  colors <- map read . words <$> getLine
  assert (length colors == n) $ print $ f colors

f :: [Int] -> Int
f = sum . map (flip div 2 . length) . group
