module AtCoderBeginnerContest135.C (main) where

import           Control.Exception (assert)

main :: IO ()
main = do
  n <- readLn
  as <- map read . words <$> getLine
  bs <- map read . words <$> getLine
  assert (length as == n + 1 && length bs == n) $
    print $ solve as bs

type Monster = Int
type Brave = Int
type Kill = Int
type Rest = Int

solve :: [Int] -> [Int] -> Int
solve monsters braves =
  let
    f (rest, total) (monster, brave) =
      let
        (monster', kill) = extraAttack monster rest
        (kill', rest') = attack monster' brave
      in
        (rest', total + kill + kill')
  in
    (\(rest, total) -> total + min (last monsters) rest) $ foldl f (0, 0) $ zip monsters braves

extraAttack :: Monster -> Rest -> (Monster, Kill)
extraAttack monster rest =
  let
    kill = min monster rest
  in
    (monster - kill, kill)

attack :: Monster -> Brave -> (Kill, Rest)
attack monster brave =
  let
    kill = min monster brave
  in
    (kill, brave - kill)
