{-# LANGUAGE ImpredicativeTypes #-}
{-# LANGUAGE RankNTypes #-}
module Main where

import Control.Monad (replicateM)
import Data.List (foldl')
import Data.IntMap (IntMap)
import qualified Data.IntMap as M
import Data.Array.ST
import Control.Monad.ST (ST)
import Control.Monad ((>=>))

main :: IO ()
main = do
  numbersString <- getLine

  let (numberOfRooms, numberOfStudents) = parseNumbers numbersString

  sectionsString <- replicateM numberOfStudents getLine

  let sections = map (uncurry parseSection) $ zip [1..] sectionsString

  -- let answers = map (number . fst) $ filter (isCovered numberOfRooms . snd) $ removeOnes sections
  let
    rooms :: [Int]
    rooms = roomCleanedTimes numberOfRooms $ recordInOut sections
    answers = map number $ filter (\section -> roomCleanedMultipleTimes section rooms) sections

  print $ length answers
  mapM_ print answers

data Section = Section { number :: Int, firstRoom :: Int, lastRoom :: Int }
             deriving Show

parseNumbers :: String -> (Int, Int)
parseNumbers s = let n:m:_ = map read $ words s in (n,m)

parseSection :: Int -> String -> Section
parseSection i s = let (f,l) = parseNumbers s in Section i f l

isCovered :: Int -> [Section] -> Bool
isCovered numberOfRooms sections = null $ foldl' clean [1..numberOfRooms] sections

clean :: [Int] -> Section -> [Int]
clean is section = filter (\r -> r < firstRoom section || lastRoom section < r) is

removeOnes :: [a] -> [(a,[a])]
removeOnes [] = []
removeOnes (x:xs) = (x,xs) : map (\(y,ys) -> (y, x:ys)) (removeOnes xs)

recordInOut :: [Section] -> IntMap Int
recordInOut = M.fromListWith (+) . concatMap sectionToInOut
  where
    sectionToInOut :: Section -> [(Int, Int)]
    sectionToInOut section = [(firstRoom section, 1), (lastRoom section + 1, -1)]

roomCleanedTimes :: Int -> IntMap Int -> [Int]
roomCleanedTimes numberOfRooms record =
  scanl1 (+) $ map (\key -> M.findWithDefault 0 key record) [1..numberOfRooms]

roomCleanedMultipleTimes :: Section -> [Int] -> Bool
roomCleanedMultipleTimes section = all (> 1) . take (last - first + 1) . drop (first - 1)
  where
    first = firstRoom section
    last = lastRoom section

accumulatedOnlyOnceCleanedRooms :: [Int] -> [Int]
accumulatedOnlyOnceCleanedRooms = scanl1 (+) . map (\n -> if n > 1 then 0 else 1)

roomCleanedMultipleTimes' :: [Int] -> [Section] -> [Section]
roomCleanedMultipleTimes' accRooms sections = undefined
  where
    section = undefined
    first = firstRoom section
    last = lastRoom section

-- assuming indices sorted
(!!!) :: [a] -> [Int] -> [a]
_  !!! []     = []
xs !!! (i:is) = let y:ys = drop i xs in y : ys !!! map (subtract (i + 1)) is


-- type Memo a = forall r. (a -> r) -> (a -> r)

-- wrap :: (a -> b) -> (b -> a) -> Memo a -> Memo b
-- wrap i j m f = m (f . i) . j


--- imos
type Rooms s = STUArray s Int Int

newRooms :: Int -> ST s (Rooms s)
newRooms numberOfRooms = newArray (1, numberOfRooms) 0

cleanImos :: Section -> Rooms s -> ST s ()
cleanImos section rooms = do
  modifyArray rooms (firstRoom section) (+1)
  modifyArray rooms (lastRoom section + 1) (subtract 1)

modifyArray :: (Ix i, MArray a e m) => a i e -> i -> (e -> e) -> m ()
modifyArray array ix f = writeArray array ix . f =<< readArray array ix

{-
cleanAll :: [Section] -> Room s -> ST s (Rooms s)
cleanAll sections rooms = do
  mapM_ (flip cleanImos rooms) sections

accumulativeSumArray :: STUArray s Int Int -> ST s (STUArray s Int Int)
accumulativeSumArray array =
-}
