module AtCoderBeginnerContest030.C (main) where

import           Control.Applicative  ((<$>))
import           Control.Monad        (when)
import           Control.Monad.Reader (ReaderT, runReaderT)
import           Control.Monad.RWS
import           Control.Monad.State  (State, gets, runState)

main :: IO ()
main = do
  _:_:_ <- getLine
  x:y:_ <- map read . words <$> getLine
  as <- map read . words <$> getLine
  bs <- map read . words <$> getLine

  let ((), _, count) = runRWS f (x,y) (S 0 as bs)
  print $ getSum count

data S = S { current :: !Int, as :: ![Int], bs :: ![Int] }

-- type TripMonad = ReaderT (Int, Int) (State S)

type TripMonad = RWS (Int, Int) (Sum Int) S

f :: TripMonad ()
f = do
  current <- gets current
  let
    dropPast = dropWhile (current >)

  as' <- dropPast <$> gets as

  bs' <- dropPast <$> gets bs

  when (not (null as') && not (null bs')) $ tell 1

  put S { current = 0, as = as', bs = bs' }
