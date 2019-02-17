module AtCoderGrandContest014.A (main) where

import           Data.Set (Set, empty, insert, member)

main :: IO ()
main = do
  a : b : c : _ <- map read . words <$> getContents

  let
    series = iterateM solve (a, b, c)
    result = if check series then length series - 1 else -1

  print result

type Three = (Int, Int, Int)

solve :: Three -> Maybe Three
solve (a, b, c)
  | anyOdd a b c = Nothing
  | otherwise = Just ((b + c) `div` 2, (a + c) `div` 2, (a + b) `div` 2)

anyOdd :: Int -> Int -> Int -> Bool
anyOdd a b c = odd a || odd b || odd c

iterateM :: (a -> Maybe a) -> a -> [a]
iterateM f z = case f z of
  Nothing -> [z]
  Just x  -> z : iterateM f x

check :: Ord a => [a] -> Bool
check = check' empty
  where
    check' :: Ord a => Set a -> [a] -> Bool
    check' _ [] = True
    check' set (x:xs)
      | member x set = False
      | otherwise = check' (insert x set) xs
