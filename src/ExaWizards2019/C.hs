module ExaWizards2019.C (main) where

import           Control.Exception (assert)
import           Control.Monad     (replicateM)
import           Data.List         (foldl')
import           Data.Vector       ((!))
import qualified Data.Vector       as V (fromList)

main :: IO ()
main = do
  [n, q] <- map read . words <$> getLine
  s <- getLine
  assert (length s == n) $ do
    spells <- replicateM q $ do
      [t, d] <- words <$> getLine
      pure $ toSpell t d
    print $ solve n s spells

data Spell = Spell Char Direction

data Direction = L | R

toSpell :: String -> String -> Spell
toSpell [c] "L" = Spell c L
toSpell [c] "R" = Spell c R
toSpell _   _   = error "irregular"

solve :: Int -> String -> [Spell] -> Int
solve n s spells =
  let
    l = bisect (\i -> destination s spells i == LeftEdge) 0 n
    r = bisect (\i -> destination s spells i /= RightEdge) 0 n
  in
    r - l

bisect :: (Int -> Bool) -> Int -> Int -> Int
bisect p lowerB upperB -- section: [lowerB, upperB)
  | upperB - lowerB == 1 = lowerB
  | p middle             = bisect p middle upperB
  | otherwise            = bisect p lowerB middle
  where
    middle = (lowerB + upperB) `div` 2

data WithEdge a = LeftEdge | Inner a | RightEdge
  deriving (Eq)

-- Zipper で書くと TLE
destination :: String -> [Spell] -> Int -> WithEdge Char
destination s spells startIndex = array ! foldl' update (startIndex + 1) spells
  where
    array = V.fromList $ [LeftEdge] ++ map Inner s ++ [RightEdge]

    update i (Spell c d) =
      case (array ! i == Inner c, d) of
        (False, _) -> i
        (True, L)  -> pred i
        (True, R)  -> succ i
