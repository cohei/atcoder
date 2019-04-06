module AtCoderBeginnerContest123.A (main) where

import           Control.Applicative (liftA2)
import           Control.Monad       (replicateM)

main :: IO ()
main = do
  antennas <- replicateM 5 readLn
  k <- readLn
  putStrLn $ toOutput $ solve k antennas

toOutput :: Bool -> String
toOutput False = ":("
toOutput True  = "Yay!"

solve :: Int -> [Int] -> Bool
solve k antennas = all (k >=) $ liftA2 distance antennas antennas

distance :: Num a => a -> a -> a
distance x y = abs $ x - y
