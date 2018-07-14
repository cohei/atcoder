import Data.List (scanl, sortBy, inits)
import Data.Ord (comparing)

main :: IO ()
main = interact $ format f

format :: ((Int, Int, [Int]) -> [Int]) -> (String -> String)
format f = unlines . map show . f . (\((n:k:_):is:_) -> (n,k,is)) . map (map read . words) . lines

-- f :: (Int, Int, [Int]) -> [Int]
-- f (n,k,is) = map secondYoung $ drop k $ inits $ zip [1..] is

prop1 = f (5,2,[4, 5, 3, 1, 2]) == [2,1,3,5]
prop2 = f (3,1,[2,3,1]) == [1,1,3]

f :: (Int, Int, [Int]) -> [Int]
f (n,k,is) =
  let
    listWithOrder = zip [1..] is
    (init, ls) = (take k listWithOrder, drop k listWithOrder)
  in map fst $ scanl g (fst $ last $ sortBy (comparing snd) init, init) ls
  where
    g (i, cache) pair = let newCache = take k $ sortBy (comparing snd) $ pair:cache
                        in (fst $ last newCache, newCache)

f' (n,k,is) =
  let
    listWithOrder = zip [1..] is
    (init, ls) = (take k listWithOrder, drop k listWithOrder)
  in scanl g (0, init) ls
  where
    g (i, cache) pair = let newCache = take k $ sortBy (comparing snd) $ pair:cache
                        in (fst $ last newCache, newCache)

secondYoung :: [(Int, Int)] -> Int
secondYoung = fst . last . sortBy (comparing snd)
