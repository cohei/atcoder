module AtCoderBeginnersSelection.ABC081A (main) where

main :: IO ()
main = print . length . filter ('1' ==) =<< getLine
