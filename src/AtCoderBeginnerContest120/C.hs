module AtCoderBeginnerContest120.C (main) where

import           Data.List  (find)
import           Data.Maybe (fromJust)

main :: IO ()
main = print . solve . map fromChar =<< getLine

data Cube =
    Red
  | Blue
  deriving (Eq)

fromChar :: Char -> Cube
fromChar '0' = Red
fromChar '1' = Blue
fromChar _   = error "unexpected character"

solve :: [Cube] -> Int
solve = (-) . length <*> length . fromJust . convergence . iterate annihilate

annihilate :: [Cube] -> [Cube]
annihilate = foldr f []
  where
    f Red  (Blue : cs) = cs
    f Blue (Red : cs)  = cs
    f c    cs          = c : cs

convergence :: Eq a => [a] -> Maybe a
convergence = fmap fst . find (uncurry (==)) . (zip <*> tail)
