module AtCoderRegularContest045.A (main) where

main :: IO ()
main = interact transduce

transduce :: String -> String
transduce = (++ "\n") . unwords . map instruct . words

instruct :: String -> String
instruct "Left"    = "<"
instruct "Right"   = ">"
instruct "AtCoder" = "A"
instruct _         = error "instruct: invalid input"
