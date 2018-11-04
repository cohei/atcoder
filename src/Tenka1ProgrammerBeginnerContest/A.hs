module Tenka1ProgrammerBeginnerContest.A (f) where

main :: IO ()
main = putStrLn . f =<< getLine

f :: String -> String
f s =
  case length s of
    2 -> s
    3 -> reverse s
    _  -> undefined
