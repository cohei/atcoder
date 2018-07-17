{-# LANGUAGE TupleSections #-}
import           Control.Arrow (second)
import           Control.Monad (unless)
import           Data.Char     (isLower)
import           Data.Function (on)
import           Data.List     (splitAt)
import qualified Data.Map      as Map (foldl', fromListWith, intersectionWith)

main :: IO ()
main = do
  n <- readLn :: IO Int
  unless (n >= 1 && n <= 18) $ error "1 <= n <= 18"
  s <- getLine
  unless (all isLower s) $ error "lower case"
  unless (length s == 2 * n) $ error "length"

  print $ f s

f :: String -> Int
f s = Map.foldl' (+) 0 $ (Map.intersectionWith (*) `on` toMap . partitions) front rear
  where
    toMap = Map.fromListWith (+) . map (,1)
    (front, rear) = twoFold s

partitions :: [a] -> [([a], [a])]
partitions []     = [([], [])]
partitions (x:xs) = partitions xs >>= \(ys, zs) -> [(x:ys, zs), (ys, x:zs)]

twoFold :: [a] -> ([a], [a])
twoFold xs = second reverse $ splitAt (length xs `div` 2) xs
