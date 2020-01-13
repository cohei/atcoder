module AtCoderBeginnerContest151.C (main) where

import           Control.Monad  (replicateM)
import           Data.Bifunctor (bimap)
import           Data.IntMap    (IntMap)
import qualified Data.IntMap    as M (empty, insert, lookup)
import           Data.Monoid    (Sum (Sum, getSum))

main :: IO ()
main = do
  [_n, m] <- map read . words <$> getLine
  pss <- replicateM m $ do
    [p, s] <- words <$> getLine
    pure (read p, read s)
  let (accepted, wrongs) = solve pss
  putStrLn $ unwords $ map show [accepted, wrongs]

data Result = AC | WA
  deriving (Read, Eq)

type Problem = Int

solve :: [(Problem, Result)] -> (Int, Int)
solve =
  bimap getSum getSum . foldMap (\(b, m) -> (Sum (if b then 1 else 0), Sum m)) . foldr f M.empty
  where
    f :: (Problem, Result) -> IntMap (Bool, Int) -> IntMap (Bool, Int)
    f (p, r) acc =
      case (r, M.lookup p acc) of
        (WA, Just (True, wa)) -> M.insert p (True, succ wa) acc
        (WA, _)               -> acc
        (AC, _)               -> M.insert p (True, 0) acc
