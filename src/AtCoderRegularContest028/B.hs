module AtCoderRegularContest028.B (main) where

import           Data.List (maximumBy, sortOn)
import           Data.Ord  (comparing)

main :: IO ()
main = interact $ format solve

format :: ((Int, Int, [Int]) -> [Int]) -> (String -> String)
format f = unlines . map show . f . format' . map (map read . words) . lines

format' :: [[Int]] -> (Int, Int, [Int])
format' [[n, k], is] = (n, k, is)
format' _            = error "unexpected format"

-- solve :: (Int, Int, [Int]) -> [Int]
-- solve (n,k,is) = map secondYoung $ drop k $ inits $ zip [1..] is

solve :: (Int, Int, [Int]) -> [Int]
solve (_n, k, is) =
  let
    listWithOrder = zip [1..] is
    (init', ls) = (take k listWithOrder, drop k listWithOrder)
  in
    map fst $ scanl g (fst $ maximumBy (comparing snd) init', init') ls
  where
    g :: Ord c => (a, [(b, c)]) -> (b, c) -> (b, [(b, c)])
    g (_i, cache) pair =
      let
        newCache = take k $ sortOn snd $ pair:cache
      in
        (fst $ last newCache, newCache)

{-
solve' (n, k, is) =
  let
    listWithOrder = zip [1..] is
    (init, ls) = (take k listWithOrder, drop k listWithOrder)
  in scanl g (0, init) ls
  where
    g (i, cache) pair = let newCache = take k $ sortBy (comparing snd) $ pair:cache
                        in (fst $ last newCache, newCache)

secondYoung :: [(Int, Int)] -> Int
secondYoung = fst . last . sortBy (comparing snd)
-}
