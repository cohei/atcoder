module Tenka1ProgrammerBeginnerContest.A where

main :: IO ()
main = putStrLn . f =<< getLine

f :: String -> String
f s =
  case length s of
    2 -> s
    3 -> reverse s
    _  -> undefined

tests, test1, test2 :: Bool
tests = test1 && test2
test1 = f "abc" == "cba"
test2 = f "ac" == "ac"
