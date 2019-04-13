{-# LANGUAGE LambdaCase #-}
module AtCoderBeginnerContest124.D (main) where

import           Control.Exception (assert)
import           Data.List         (group, tails)

main :: IO ()
main = do
  [n, k] <- map read . words <$> getLine
  people <- map fromChar <$> getLine
  assert (length people == n) $
    print $ solve k people

data Person =
  Upright | Handstand
  deriving (Eq)

fromChar :: Char -> Person
fromChar '0' = Upright
fromChar '1' = Handstand
fromChar _   = undefined

data People = Uprights Int | Handstands Int

toPeople :: [Person] -> [People]
toPeople = map (\ps -> f (head ps) (length ps)) . group
  where
    f Upright n   = Uprights n
    f Handstand n = Handstands n

-- たぶんデータの大きいところで TLE
solve :: Int -> [Person] -> Int
solve k =
  maximum .
  -- 直立が k個になる +1 とる
  map (sumPeople . take (2 * k + 1)) .
  filter (\ps -> not (null ps) && isHandstands (head ps)) .
  tails .
  align .
  toPeople

align :: [People] -> [People]
align []                    = []
align ps@(Uprights _ : _)   = Handstands 0 : ps
align ps@(Handstands _ : _) = ps

isHandstands :: People -> Bool
isHandstands (Uprights _)   = False
isHandstands (Handstands _) = True

sumPeople :: [People] -> Int
sumPeople = sum . map (\case Uprights n -> n ; Handstands n -> n)
