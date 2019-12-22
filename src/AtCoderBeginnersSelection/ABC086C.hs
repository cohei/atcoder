module AtCoderBeginnersSelection.ABC086C (main) where

import           Control.Monad (replicateM)

main :: IO ()
main = do
  n <- readLn
  plans <- replicateM n $ (\[t, x, y] -> (t, x, y)) . map read . words <$> getLine
  putStrLn $ display $ solve $ (0, 0, 0) : plans

display :: Bool -> String
display False = "No"
display True  = "Yes"

type Plan = (Int, Int, Int)

solve :: [Plan] -> Bool
solve plans = and $ zipWith canTravel plans (tail plans)

canTravel :: Plan -> Plan -> Bool
canTravel (t1, x1, y1) (t2, x2, y2) =
  let
    dT = t2 - t1
    distance = abs (x2 - x1) + abs (y2 - y1)
  in
    distance <= dT && even (distance - dT)
