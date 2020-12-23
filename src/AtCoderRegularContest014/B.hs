module AtCoderRegularContest014.B (main) where

import Control.Monad (replicateM)

main :: IO ()
main = do
  n <- readLn
  putStrLn . result . solve =<< replicateM n getLine

data Player = Takahashi1 | Takahashi2

result :: Maybe Player -> String
result Nothing = "DRAW"
result (Just Takahashi1) = "WIN"
result (Just Takahashi2) = "LOSE"

solve :: [String] -> Maybe Player -- winner
solve = play Takahashi1 []

play :: Player -> [String] -> [String] -> Maybe Player
play _ _ [] = Nothing
play player said@(lastSaid : _) (w : _)
  | w `elem` said               = Just $ anotherPlayer player
  | not (canConnect lastSaid w) = Just $ anotherPlayer player
play player said (w : ws) = play (anotherPlayer player) (w : said) ws

anotherPlayer :: Player -> Player
anotherPlayer Takahashi1 = Takahashi2
anotherPlayer Takahashi2 = Takahashi1

canConnect :: String -> String -> Bool
canConnect w1 w2 = last w1 == head w2
